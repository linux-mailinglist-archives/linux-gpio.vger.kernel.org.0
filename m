Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BA9497955
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 08:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbiAXHUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 02:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiAXHUM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 02:20:12 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322DDC06173B
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jan 2022 23:20:12 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t18so14635667plg.9
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jan 2022 23:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sY6HfwTYK5dawXwMXiOxdIosLftR/6ZDUQYRFp1OgAY=;
        b=aVomb9+D/CQz+jki0XtU+JKdRjEvCx7iDU+yGVADGAR4X+Jiah1nlGDh0TuAjmKsyL
         o+Y2/02Xbo9YOFRDBzlPJYrxIm5Ly2lu6b7cROIOVoRPlkCwSsCZJYmTZCPUGDVQ/Wo7
         5WLaFJN4SRbNM1MjTq6OC4jy+kyveH7Vq1i3ftVrCAcS8wi2SM7X+AAhcU4FAQJ+Qf7+
         qOk3VnTBuE7Jz7KGGIpP5ZwqtFc0l0ipUhz+8EfsMly4kSwaQs6nnEdFeuWhGc1lmT+6
         KbatBT9CK6ol8EV1GbJoH7jUHtdXL87n0Aq5r+pR5mTDerA+D1Em5WT+mutCzBIs/zsg
         0dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sY6HfwTYK5dawXwMXiOxdIosLftR/6ZDUQYRFp1OgAY=;
        b=4L41IySmCjSKLONUAvEfX5pZ7jFGw4sBJtPG4IW+e+pga7i6+iLnY/RA1unUvXThzW
         p9X0j/WyO9/UCcQqYXOg4H38W5wHuFKaAhVinSBmRBuLBWfLOaHKsHkUCozSq18AEwIp
         fROj9HZbOf26UbErsD7c/ZZF9I9iY5B56eXA+xrFpY/n5Z9Z+Trtaiai5JxnU8UpWmbg
         HZNPb+aCmTJ16CaXUyx17r1+78B9j3JprJrUptxMAMP4tIUrEB3ccffH65n7l9eI6ThU
         ZDuhD7jFN7eQxYst9t4h62y2zfBYQPF0xnaSvtVjA4hbX85hoprGRpZxFfKMleDsRr1T
         kJvQ==
X-Gm-Message-State: AOAM531DByLf3seh08a9V7t+XC27qnSDS7NGm56W0pQ/SA2oOQNw3LhS
        +Rr7C7INSb75qPlbMPtmhTDBzZ0l5t0cUA==
X-Google-Smtp-Source: ABdhPJy/rIGlER5XyqqClGU4NQ2uds/oTXJRXPapKvKe00+lvtZSNBxSqlGPKsnpA7zgtwIaHKLMQw==
X-Received: by 2002:a17:902:8c97:b0:14a:ec66:bbb0 with SMTP id t23-20020a1709028c9700b0014aec66bbb0mr12968924plo.68.1643008811354;
        Sun, 23 Jan 2022 23:20:11 -0800 (PST)
Received: from sol (110-174-161-167.tpgi.com.au. [110.174.161.167])
        by smtp.gmail.com with ESMTPSA id z9sm14494110pfh.219.2022.01.23.23.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:20:10 -0800 (PST)
Date:   Mon, 24 Jan 2022 15:20:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Markus Mirevik <markus.mirevik@dpsolutions.se>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Sv: GPIO level IRQ fires twice each time.
Message-ID: <20220124072006.GA27170@sol>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
 <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 24, 2022 at 07:12:31AM +0000, Markus Mirevik wrote:
> > On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
> > > I have a problem with a custom bord based on SoC am335x and a driver
> > utilizing a GPIO line for interrupts.
> > >
> > > I have two mcp2518fd chip connected on one SPI line and everything
> > works, but it's hogs a lot of CPU.
> > > In the current setup only one chip is connected and it only receives packets.
> > >
> > > The mcp2518fd is connected with 2 interrupt lines one "main" and one for
> > rx frames.
> > >
> > > The problem is that for every frame received the interrupt handler is run
> > twice, which is kind of expensive since it's a SPI call to the chip to check
> > interrupt registers.
> > >
> > > To me it looks like the interrupt is fired again as soon as it's unmasked.
> > Either because it's queued? or maybe not cleared internally?
> > > I have scoped the interrupt signal and its real good without any glitches.
> > >
> > > I'm currently running a yocto build:
> > > Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021
> > > armv7l armv7l armv7l GNU/Linux
> > >
> > > But the mcp251xfd driver is from net-next/master
> > >
> > > mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like this:
> > > err = request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
> > >                                    IRQF_SHARED | IRQF_ONESHOT,
> > >                                    dev_name(&spi->dev), priv);
> > >
> > 
> > You haven't set a IRQF_TRIGGER flag, so you are getting the "as-already-
> > configured" behaviour, which on your setup is both edges?
> > Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING,
> > IRQF_TRIGGER_HIGH or IRQF_TRIGGER_LOW, as appropriate to your use
> > case, to your flags.
> > 
> > Cheers,
> > Kent.
> 
> I have tried with the IRQF_TRIGGGER_LOW flag as well. With same result. i.e the interrupt is fired again as soon as the handler is ready. Even if the interrupt line is deactivated. 
> However if I change the trigger to edge falling the interrupt will only fire once. But his will inevitably lead to a missed edge eventually.
> 

 Why is a missed edge inevitable?

Cheers,
Kent.
