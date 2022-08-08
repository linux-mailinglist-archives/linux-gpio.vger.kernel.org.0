Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2057E58C17A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 04:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243912AbiHHCQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Aug 2022 22:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243916AbiHHCQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Aug 2022 22:16:22 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9458D31228
        for <linux-gpio@vger.kernel.org>; Sun,  7 Aug 2022 18:55:02 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id bh13so7375668pgb.4
        for <linux-gpio@vger.kernel.org>; Sun, 07 Aug 2022 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=WWA36HFXyxdRLFMLRT5jnysEEJpA0Y5lQcPOcB6jFWU=;
        b=gAWknCqHyubYS7+4dMqqhBSa0H+jDkHMZCKb5PVLy/R4wBpweGAaBWODjnQmMRo+Ou
         Y8lgKCmucpqhfI+i0eLs3Y8AacSAh5Apyr6xbxUcSpXp2+4RNkXEyZbS05elTz3kNEXJ
         RBXGHjHxGo6TzxGAXJ98XKVyUbFlUO0cvTWe7UbmBGYKejuP1O1F5AkeOS0NWEDZQJUE
         MgkZ8owXPelcR//mmkI4HNgi9WCag8rbID77xy3tT3L767h4j6/b64yg+Ktkb2rg7CQ5
         NOn2E9DCUfsEoFNWXU6sgxJI3xe4DD+1N/A8qBfqVZDJEgl5hJrLaujwZeoXLfrDy9s2
         oClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=WWA36HFXyxdRLFMLRT5jnysEEJpA0Y5lQcPOcB6jFWU=;
        b=i3PjTnHmoyJls/Xs1t5TjRWKwOGIfspAHFiQwbwM/nqn/LltYESwDenq5Dw0AqfvXP
         szOcLR5OKOMh8KV1mkVRmE/rpPCMWtrGPn1y6wJyNV38LQY6ScjbsugX4huN9EHUhL2H
         2qzOKkveusUzjuTUGlkpi3f2YpwFenzxLNLuY6EJn59hCZ+opXyhvxI7rUsNdaqPCJOT
         XGi9UegKT6cbOnJ2zYu/A8SK1B4a8dSO5KZqkK8RXoM4ole1DkV77pMU99tQJ7F+M/8Q
         0HlvyKL/I4xbpAGxX4Xh2dE1v3PhbHo8e3gmf2a/Lf5XBt0cqaQHPme3nlk0d14ixW/F
         M/ZA==
X-Gm-Message-State: ACgBeo38Hg3+XRNvApV2Qvl09gv65Zfw1S15M/licsrK/7/buDZmT/LN
        ZEqZ8Gym1rvgmF23XTt6ocg=
X-Google-Smtp-Source: AA6agR6xBqMdHA7v7vEk6/wn3EWwX5sYePwlfkpzi3jQQd0YVc8XHuNRWj590n7wOHvu/e+cBmfudQ==
X-Received: by 2002:a63:2254:0:b0:41c:4b26:863d with SMTP id t20-20020a632254000000b0041c4b26863dmr13753442pgm.4.1659923701475;
        Sun, 07 Aug 2022 18:55:01 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id a24-20020a1709027d9800b0016c68b56be7sm7271332plm.158.2022.08.07.18.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 18:55:00 -0700 (PDT)
Date:   Mon, 8 Aug 2022 09:54:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kernelnewbies@kernelnewbies.org
Subject: Re: gpiod_get() - How to get GPIO from chip & offset?
Message-ID: <20220808015456.GA12686@sol>
References: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 07, 2022 at 09:55:32AM -0500, Ian Pilcher wrote:
> I am trying to figure out how to use gpiod_get(), or one of its
> variants, to get the descriptor (struct gpio_desc *) for a specific
> GPIO.  Getting a reference to the GPIO chip (struct gpio_chip *) is
> straightforward, and it provides a pointer to the device (.parent), but
> I absolutely cannot figure out what I am supposed to pass as the
> *con_id* argument.
> 
> I know the offset of the GPIO on the chip, but I can't figure out how to
> use that.
> 
> Ultimately, my goal is to set the direction of the GPIO from within a
> "board setup" module.
> 
> 
> BACKGROUND
> 
> I maintain an out-of-tree "board" module[1] that sets up the GPIOs and
> LEDs on my Thecus NAS.  I am in the process of upgrading the OS on the
> NAS, which will require me to change the user-space daemon from the old
> sysfs GPIO interface to the new (non-ancient?) gpiod interface.
> 

So the daemon should use libgpiod to control the line where it used to
use sysfs.

> One significant difference between the sysfs and gpiod interfaces, is
> that the new interface does not seem to provide an easy way to set a
> GPIO's direction (input/output) from a shell script[2].  Thus, I would
> like the board module to do that, along with the other setup.
> 
> [1] https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c
> 
> [2] It may be possible to change a GPIO's direction from user space with
>     the C API, but doing it in the kernel module, which does all of the
>     other hardware configuration, seems like the most appropriate way.
> 

Understand that configuration applied to a line, be it by the module or
from userspace, only remains valid while the line is held.
Once you free the line the state of the line may revert to its default
state.  sysfs effectively holds the line indefinitely, which is one of
its problems.

So the line should be configured by whatever will be controlling it. If
that is the module then the module.  If it is the userspace daemon then
the userspace daemon.

If the issue is changing the daemon from using sysfs to cdev then there
should be no changes required to the module.

The gpioset and gpioget tools provided by libgpiod change the direction
of the line from shell, but that is not relevant to your case as you
should be using the C API provided by libgpiod.

Cheers,
Kent.
