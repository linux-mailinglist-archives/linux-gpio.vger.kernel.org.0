Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C34E1C28E2
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 01:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgEBXZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 19:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726375AbgEBXZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 19:25:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC746C061A0C;
        Sat,  2 May 2020 16:25:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s8so6616107pgq.1;
        Sat, 02 May 2020 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CVlWMAKp18S0P8kQgLwOyHRbh71918p9Tk2lI3iv4Ak=;
        b=n4zyeICAYipFj095vmkRirFf/aIpFPmfyn7yX0AUCGll44pwQ7QMRWE0DG981KWMh/
         50RkcbA05DetnGlVXZdOME/SBRI3CmKpfmx5QqnIoU+qUqGrnj2YAC2uwb/UawXpqDNt
         ElLEi5tMKII3gumhjjC2Kmm79fGr/BLB0cTcj/IQa+hp/k1KPV/3KSRW2isFKvAgR+Td
         +DlVACYs2NKd0tkNIiH04fX08qe3fSpHhbYGEuQGNg898/b60N2MyOKnwtR0XYNptrvQ
         DIIzmUOMSH13JP0frhayPAzABL8BfgcZsy7Q9znHT/6ZgzADkyRm9EXzG9PazIZtt54A
         FOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CVlWMAKp18S0P8kQgLwOyHRbh71918p9Tk2lI3iv4Ak=;
        b=g4yki7o8DnofNy5NITiQK5JZwsqqpiD+SYEL2NQEO25gT+NUQnGMOAd0iO2OrCwHLx
         VNnunye91TqMmRi0sZc4gc8mLKmOjC7M4gzd5jlYWUgN9LprwjAMQYBObOXUmKLwHklI
         dnAtyLSkEXB0zmItqL8lpKWqVuF0aouxk8Wv7BwdwzYFB57VSVqsrW+HmiDMEG0uarV4
         i/uu57wIs9XWZhSnLpLI2XJSJ8knxL00YWbSwzHTQQD07aiaA9lU5PzEyZI+R16JBmtf
         dzDZJf83fvLYMmstJrEQqGxpSwVkKg5WEXzT4kHCEsA5NR0WM7J4P5wZ4ZQWQzlTVwlV
         mQKw==
X-Gm-Message-State: AGi0PuZZ5NzK/2ESWvHL0sQCRL0CFBJP/mBkOEAEmCdob0TkKl1We2Cm
        1Cbpf8XLuL6GO6E2YTWv4nU=
X-Google-Smtp-Source: APiQypIiLyuiW51T33HPehYlOp5zHydcZZf3Uml1cyldx+ViXFmvCF0VSTrQJ+608jL9mJA7oYIHdg==
X-Received: by 2002:a62:be0c:: with SMTP id l12mr10670123pff.95.1588461932182;
        Sat, 02 May 2020 16:25:32 -0700 (PDT)
Received: from syed ([106.210.101.167])
        by smtp.gmail.com with ESMTPSA id g16sm5243374pfq.203.2020.05.02.16.25.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 16:25:31 -0700 (PDT)
Date:   Sun, 3 May 2020 04:55:12 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200502232512.GA31703@syed>
References: <cover.1588443578.git.syednwaris@gmail.com>
 <366a64f80ee9fe1c644ea038ac112ead9766d5c8.1588443578.git.syednwaris@gmail.com>
 <20200502190354.GA6513@shinobu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502190354.GA6513@shinobu>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 02, 2020 at 03:03:54PM -0400, William Breathitt Gray wrote:
> On Sun, May 03, 2020 at 12:21:54AM +0530, Syed Nayyar Waris wrote:
> > This patch reimplements the xgpio_set_multiple function in
> > drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
> > Instead of looping for each bit in xgpio_set_multiple
> > function, now we can check each channel at a time and save cycles.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> > Changes in v4:
> >  - Minor change: Hardcode value for better code readability.
> > 
> > Changes in v3:
> >  - No change.
> > 
> > Changes in v2:
> >  - No change.
> > 
> >  drivers/gpio/gpio-xilinx.c | 64 ++++++++++++++++++++------------------
> >  1 file changed, 34 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> > index 67f9f82e0db0..67c5eeaf1bb9 100644
> > --- a/drivers/gpio/gpio-xilinx.c
> > +++ b/drivers/gpio/gpio-xilinx.c
> > @@ -136,39 +136,43 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> >  			       unsigned long *bits)
> >  {
> > -	unsigned long flags;
> > +	unsigned long flags[2];
> >  	struct xgpio_instance *chip = gpiochip_get_data(gc);
> > -	int index = xgpio_index(chip, 0);
> > -	int offset, i;
> > -
> > -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> > -
> > -	/* Write to GPIO signals */
> > -	for (i = 0; i < gc->ngpio; i++) {
> > -		if (*mask == 0)
> > -			break;
> > -		/* Once finished with an index write it out to the register */
> > -		if (index !=  xgpio_index(chip, i)) {
> > -			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> > -				       index * XGPIO_CHANNEL_OFFSET,
> > -				       chip->gpio_state[index]);
> > -			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> > -			index =  xgpio_index(chip, i);
> > -			spin_lock_irqsave(&chip->gpio_lock[index], flags);
> > -		}
> > -		if (__test_and_clear_bit(i, mask)) {
> > -			offset =  xgpio_offset(chip, i);
> > -			if (test_bit(i, bits))
> > -				chip->gpio_state[index] |= BIT(offset);
> > -			else
> > -				chip->gpio_state[index] &= ~BIT(offset);
> > -		}
> > +	u32 *const state = chip->gpio_state;
> > +	unsigned int *const width = chip->gpio_width;
> > +	const unsigned long state_size = 32;
> > +	const unsigned long total_state_bits = state_size * 2;
> 
> Hello Syed,
> 
> I don't think there's much need for these two variables either. You can
> remove the state_size and total_state_bits variables, and instead inline
> 32 and 64 directly in your code below.

Hi. Have sent v5 patchset incorporating your review comment.

Thank you.

> 
> William Breathitt Gray
> 
> > +	unsigned long offset, clump;
> > +	size_t index;
> > +
> > +	DECLARE_BITMAP(old, 64);
> > +	DECLARE_BITMAP(new, 64);
> > +	DECLARE_BITMAP(changed, 64);
> > +
> > +	spin_lock_irqsave(&chip->gpio_lock[0], flags[0]);
> > +	spin_lock_irqsave(&chip->gpio_lock[1], flags[1]);
> > +
> > +	bitmap_set_value(old, state[0], 0, width[0]);
> > +	bitmap_set_value(old, state[1], width[0], width[1]);
> > +	bitmap_replace(new, old, bits, mask, gc->ngpio);
> > +
> > +	bitmap_set_value(old, state[0], 0, state_size);
> > +	bitmap_set_value(old, state[1], state_size, state_size);
> > +	state[0] = bitmap_get_value(new, 0, width[0]);
> > +	state[1] = bitmap_get_value(new, width[0], width[1]);
> > +	bitmap_set_value(new, state[0], 0, state_size);
> > +	bitmap_set_value(new, state[1], state_size, state_size);
> > +	bitmap_xor(changed, old, new, total_state_bits);
> > +
> > +	for_each_set_clump(offset, clump, changed, total_state_bits, state_size) {
> > +		index = offset / state_size;
> > +		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> > +				index * XGPIO_CHANNEL_OFFSET,
> > +				state[index]);
> >  	}
> >  
> > -	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> > -		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
> > -
> > -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> > +	spin_unlock_irqrestore(&chip->gpio_lock[1], flags[1]);
> > +	spin_unlock_irqrestore(&chip->gpio_lock[0], flags[0]);
> >  }
> >  
> >  /**
> > -- 
> > 2.26.2
> > 


