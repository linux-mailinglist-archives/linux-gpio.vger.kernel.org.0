Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529FC4EB04B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 17:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbiC2P1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 11:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238576AbiC2P0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 11:26:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F121E7E588
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 08:25:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d30so791441pjk.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=U20u3av6zvBSZ+AvNJs2/kRryXLU0/R0O62yqqS47uA=;
        b=egSpWIWRGLgHcNb+82aAqcBEA+Ymjk9w0/SHpsXy92jGlJZtFpVRM707IJeRF3kxgw
         l8zQSix3lpM6D9oy9/TaGCwZEZ/tILbBCxVybY8pgRs11hrNAY49t7K71dy7PutaJYMc
         HwMkdpXjOKBY9gjrsJhZhf2yxSs5lZLmHJIOltJU+qPsDA/1RVQqoGRUwyDLzDAdCtss
         FcKc6O4/4SrRcw1qLWUBWABJ7k02hJTxEIEg5OYOSDnS3C8dA5BiCNLQsM0fSvtQ7owf
         VQmHK+7tw2GJqJFU+o4ZcUhIL8KOGC60/9W7hJEI1T+yKwST43W2KetJc/JVxFMH/Rkh
         uU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U20u3av6zvBSZ+AvNJs2/kRryXLU0/R0O62yqqS47uA=;
        b=nJbALzbWil3h4OPd/ytZpp3IzUeZkBEp0ZBy/XoPdNqCDv7Wds/7LxqqBs5dSxL4Ra
         7wJ8CGdCdhWf/5Tl8Xp8zWre4tiPpPKxQB8IpMNNcjb7xoSyv6hnuEu7XZzKXezeP4c4
         g3d/go3+ae1PIPOfC3BkjXttCaC8P/zXAQqIlVhlABiUMtHzOILSe27KlT4IWmExyRe7
         e93C26nWkN1NEnc7uvsO3H/dUga/s3ohrkMNBdD+3Ok05qEDEq+BXCItgTkgEsSoFuyI
         zqsl7xagXqfvMkctRjdzBzK9Qxn6j7l6RgWzoL0inhF38uA70A1qNhINfUsJiTMGKF3y
         dsGQ==
X-Gm-Message-State: AOAM533kaeKldg7+4EpCjKA0GRteMgo+9s4sW5yq26HhhY/ggWrC8aLv
        8TFEVrHdsvX1xaUiADgi5yBKJL5yeX1wFg==
X-Google-Smtp-Source: ABdhPJz5AkbuYYlKjE0PG0eGI3BcBOn6qtzgbaMQMXre6u6cb7WPKfBI+06Xuxw4dcKQ1Mr9a6ttLg==
X-Received: by 2002:a17:902:b406:b0:14f:bb35:95ab with SMTP id x6-20020a170902b40600b0014fbb3595abmr30861988plr.140.1648567510330;
        Tue, 29 Mar 2022 08:25:10 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id t10-20020a056a00138a00b004fa9c9fda44sm20433156pfg.89.2022.03.29.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 08:25:09 -0700 (PDT)
Date:   Tue, 29 Mar 2022 23:25:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Edit/gpiomon: Question about mode
Message-ID: <20220329152505.GA379693@sol>
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
 <20220329033840.GA14149@sol>
 <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
 <20220329083823.GA94201@sol>
 <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
 <20220329085108.GA114462@sol>
 <71eccedc-5bc1-e4f3-06c8-87b1127e1261@gmail.com>
 <28ae22ab-935e-5756-5caa-c8ed7274a123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28ae22ab-935e-5756-5caa-c8ed7274a123@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 29, 2022 at 03:56:36PM +0200, Hans Kurscheidt wrote:
> 
> Am 29.03.2022 um 15:37 schrieb Hans Kurscheidt:
> > 
> > Am 29.03.2022 um 10:51 schrieb Kent Gibson:
> > > On Tue, Mar 29, 2022 at 10:43:19AM +0200, Hans Kurscheidt wrote:
> > > > Am 29.03.2022 um 10:38 schrieb Kent Gibson:
> > > > > On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
> > > > > > Am 29.03.2022 um 05:38 schrieb Kent Gibson:
> > > > > > > On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
> > > > > > > > Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > what would be the right mode for gpiomon call from
> > > > > > > > > 
> > > > > > > > > a shellscript executed as root from systemd at system start
> > > > > > > > > 
> > > > > > > > > waiting on a Pin w/ pullup for invoking
> > > > > > > > > shutdown upon rising* edge.
> > > > > > > > > *changed
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Lots of interupts, Signals and other GPIO
> > > > > > > > > ongoing from other user APPs &
> > > > > > > > > threads in multi-user state.
> > > > > > > > 2b more precise: I wired a GPIO Pin to GND.
> > > > > > > > 
> > > > > > > > Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
> > > > > > > > 
> > > > > > > > the program exits immediately with 1 event,
> > > > > > > > although there was never a
> > > > > > > > rising edge due to the fix wire to GND. Is this
> > > > > > > > a feature or a bug, and is
> > > > > > > > it reproducible?
> > > > > > > > 
> > > > > > > Not a feature and not reproducible for me on a
> > > > > > > Raspberry Pi4 with the
> > > > > > > setup you describe, so probably a bug specific to
> > > > > > > your hardware platform,
> > > > > > > whatever that may be.
> > > > > > > 
> > > > > > > If it is 100% reproduceable for you, and assuming it
> > > > > > > is an initialisation
> > > > > > > issue so you only get the one spurious event, how
> > > > > > > about using -n2 as a
> > > > > > > workaround ;-)?
> > > > > > > 
> > > > > > > Cheers,
> > > > > > > Kent.
> > > > > > It appears 2b reproduceable 100% on my OrangePi zero+
> > > > > > (Allwinner H5) and
> > > > > > using -n2 does the trick, but isn't gpiod not supposed to work on all
> > > > > > commercial HW platforms and related kernels, rather then
> > > > > > only on RPI??
> > > > > > 
> > > > > gpiod will work on any platform with a supporting kernel.
> > > > > How well depends on the underlying hardware and driver.
> > > > > The RPi4 was merely a counter-example demonstrating that your issue is
> > > > > not universal, using hardware I happen to have readily available.
> > > > > 
> > > > > Cheers,
> > > > > Kent.
> > > > So if I understand you right, gpiod works on sort of a logical
> > > > level, while
> > > > the HW dependend part depends of the kernel driver
> > > > implementation of the
> > > > specific HW?
> > > > 
> > > > 
> > > libgpiod is a userspace library and tools to access GPIO lines via the
> > > Linux GPIO character device.  The actual interfacing to the hardware is
> > > performed by the kernel and appropriate drivers for your hardware.
> > > As your problem does not exhibit on other hardware, the root cause
> > > of your problem probably lies in the driver for your hardware, not in
> > > libgpiod nor the gpiolib subsystem of the kernel.
> > > 
> > > But you would need to debug it further to be sure.
> > > 
> > > Cheers,
> > > Kent.
> > 
> > I raised a bug report at tha Armbian forum:
> > 
> > https://forum.armbian.com/topic/20166-opi-zero-h5-gpiodmon-generates-spurious-interrupts-upon-invocation/
> > 
> > 
> > 
> > I made some trial to understand if it is reproduceable, but I have
> > difficulties defining, when it happens. After RESET there is no spurious
> > event. The spurious event appears to happen, when the line was moved:
> > 
> > Could you please make another trial on your RPI w/ the following
> > sequence:
> > 
> > RESET, gpiomon -r -n1 -Bpull-up <chip><line>  => No event,  -> pull line
> > up /down, => event (as expected), gpiomon -r -n1 -Bpull-up <chip><line>
> > => false event
> > 
> > There might be an issue w/ pending interrupts, when the line is bouncing
> > when pulled up/down. The 2nd gpiodmon cmd might catch one of the pending
> > interrupts. (Just an idea). This would hint to an initialisation
> > problem, that pending line states are not preempted, before the int is
> > attached.
> > 
> sorry, 1 more thing,f I just let the line go up (by pull-up) and leave it
> "1", I get continuous false events on every gpiomon... cmd, just like "level
> interrupts"
> 
> 

And one more thing - your external pull-down has to be stronger
than the internal pull-up, else the two will will contend and leave your
line in a logical no man's land.  In my testing I pulled the line
directly to ground as I'm not sure how strong the internal pull-ups are
on the RPi and didn't want to expend time hunting for an appropriately
sized resistor anyway.

Cheers,
Kent.

