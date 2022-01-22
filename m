Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE55496E52
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jan 2022 01:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbiAWAAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Jan 2022 19:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiAWAAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Jan 2022 19:00:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BAEC06173B
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jan 2022 16:00:05 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id g11-20020a17090a7d0b00b001b2c12c7273so7374027pjl.0
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jan 2022 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9hLMrF7aEoBX6HrPYQP+0d/8ODr64hxSVxwGWXOrtks=;
        b=gX9HqYi1SJq6ZdYc65asfuM9mUqEOr0LukgytGhAooTALUTRYadr9W18sdmL3HEBLs
         e4p9mug0TLMmGln2N6/kFI67z+1hz8/h01d1lIl/lSD7YdMBiUwXuBgFJalpIoDMA5We
         Se01HNyQnVkumFxUtw5NdK8YavwEJ7jdvp8+auiHsdOegk6EnXm0jPbn/7fSArHLnLnN
         fIIuMgytoJZ6LyNpY/yr4mmx3KKge/DFrjmOSyilgW6g4O7ym/IWF+Z7aX49x1H6+9QT
         LbUOtoyAMld7YuMjK0N6vq6T2p6JN4eD+aXmKuvISwJmCzHg3ilfTTVFaRrAEzpQXcKz
         qldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hLMrF7aEoBX6HrPYQP+0d/8ODr64hxSVxwGWXOrtks=;
        b=3bnJTCnRISqcSX83tof3pvB2qSf4YVBM5htrSMaB1y4+4pc1aQ9u8MjJv/3el2bt07
         0eQVtlD6cZvesw0pUSYPsXfoyrSSgJi4MSyabjar9yE9E4926YCdAHNu2Bt6SmE6V7qE
         AYr4pv1ahh0TTCsKMP/c8EtRKSqYj1kuSwee/nKgF4eX+JWv7bOb40cdocIVtZS50VoC
         3rd8PIPiQMu5XWJ++SylEVmrO6Ki58PzDE1qAHvxNDr78XK6CteRoDeFu3Aouscl8DBa
         WB9v4UqO6b0hsED4bIu1k9ANEX/sKr2vsKvLTrV6MXk/9XCz9a55HB5kOO7g56/N6+H3
         yaKQ==
X-Gm-Message-State: AOAM530FOencOLgT1K5HfAXckTpr0fOkiJMwzKkysyDUJ/8bTh03xFoe
        yVv22hjhI0kMGVH/fsFZPDCTPIcJJdWOQQ==
X-Google-Smtp-Source: ABdhPJzwFzalae3ZBMaarzt4M+3xdpLlUgDuZA08rNsVUVgQjBK70ULkFTbkJVAOL6Dao0kzIjV6gw==
X-Received: by 2002:a17:902:8f94:b0:14a:cd21:ba6e with SMTP id z20-20020a1709028f9400b0014acd21ba6emr9137589plo.43.1642896004719;
        Sat, 22 Jan 2022 16:00:04 -0800 (PST)
Received: from sol (110-174-161-167.tpgi.com.au. [110.174.161.167])
        by smtp.gmail.com with ESMTPSA id b21sm7620902pgi.51.2022.01.22.16.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 16:00:04 -0800 (PST)
Date:   Sun, 23 Jan 2022 07:59:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Markus Mirevik <markus.mirevik@dpsolutions.se>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: GPIO level IRQ fires twice each time.
Message-ID: <20220122235959.GA10737@sol>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
> I have a problem with a custom bord based on SoC am335x and a driver utilizing a GPIO line for interrupts. 
> 
> I have two mcp2518fd chip connected on one SPI line and everything works, but it's hogs a lot of CPU.
> In the current setup only one chip is connected and it only receives packets.
> 
> The mcp2518fd is connected with 2 interrupt lines one "main" and one for rx frames. 
> 
> The problem is that for every frame received the interrupt handler is run twice, which is kind of expensive since it's a SPI call to the chip to check interrupt registers. 
> 
> To me it looks like the interrupt is fired again as soon as it's unmasked. Either because it's queued? or maybe not cleared internally?
> I have scoped the interrupt signal and its real good without any glitches. 
> 
> I'm currently running a yocto build:
> Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021 armv7l armv7l armv7l GNU/Linux 
> 
> But the mcp251xfd driver is from net-next/master
> 
> mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like this:
> err = request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
>                                    IRQF_SHARED | IRQF_ONESHOT,
>                                    dev_name(&spi->dev), priv);
> 

You haven't set a IRQF_TRIGGER flag, so you are getting the
"as-already-configured" behaviour, which on your setup is both edges?
Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING, IRQF_TRIGGER_HIGH or
IRQF_TRIGGER_LOW, as appropriate to your use case, to your flags.

Cheers,
Kent.

