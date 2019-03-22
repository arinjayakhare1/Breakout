keyPowerUp = Class{}

function keyPowerUp:init(params)
  self.x = params.x
  self.y = params.y
  self.width = 16
  self.height = 16

  self.dy = math.random(10, 50)
  self.inUse = true

  self.playVariables = params.playVariables
  self.bricks = params.bricks

  

end

function keyPowerUp:collides(target)
  if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function keyPowerUp:applyAction()
  if(self.inUse == true) then
    self.playVariables['isLocked'] = false
    self.inUse  = false
    
  end
  
end

function keyPowerUp:update(dt)
  if(self.inUse == true) then
    self.y = self.y + self.dy * dt
    if(self.y > VIRTUAL_HEIGHT) then
      self.inUse = false
    end
  end
end

function keyPowerUp:render()
  if(self.inUse == true) then
    -- gTexture is our global texture for all blocks
    -- gBallFrames is a table of quads mapping to each individual ball skin in the texture
    love.graphics.draw(gTextures['main'], gPowerUps['goldenKey'],
        self.x, self.y)
  end
end
