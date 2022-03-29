Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBDC4EAF89
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 16:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238210AbiC2OsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 10:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbiC2Or5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 10:47:57 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8D95577D
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 07:46:14 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id w7so13412915pfu.11
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Aj17CMSNype516/PZARiTVB42Wh/czlJ9UkMrTGPzTU=;
        b=cGEK7vD2q8BUsyS0Td8otRbbcE+OAJfxjw3Eun/jhc21X+5XofmgF2+oJWrshbwZhj
         mGC15YliRnpQ35qTaNXigoV/D23ZKP1vyhijj2yOk3SNRA8ssoye58j1KJPS4cCeB3/3
         LDIlXE/gj+L5MzRQ5WKk5DgSk9iIFA0QYqr+kRmApxaKYMWqAQ7BjMH7+4q6427ingum
         4iBZJ/naPOx8ZnDBq27OO5ec5rrYeSo2x1/YKwJbjZMDXw34yKjHULYFQcXQbXGH5lQM
         zjCcOmv1ZG7LypN6CJBeUjrIvk6gHSqEsuUQUsphK3zbW9BaCj65OqDo4qpK9QMlprGG
         PLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Aj17CMSNype516/PZARiTVB42Wh/czlJ9UkMrTGPzTU=;
        b=eBFZCyuSsopIy10iutiyqpMZr8Nk0Gb0BSbobEzdhlwUnUUfoEuOSfwz2TakpqVtLb
         XilhZV9Cg7VietWWFcNat0EUw0gDtwuDs2l1QdlmrYpk59AMumRaKD2buo28/676FDrM
         SVn8eSSFfl4e8hZM4h2LKngZfPUqxPKDYHE/JiULSKzvgP/XJotvinM9VYabkcZasuMp
         KnW/eh+73l5975BjyTrWzeHXPq/YWzFj+Po31vw7V6ocJSlU4GhRfe6V9QAYh9w9lf3c
         e/NL6vs77I4tj/5fsU++7aHoV2/WkWBkhG82QwMUdPgqoJRruNc9joDFDXVszNlAVc+b
         1cgg==
X-Gm-Message-State: AOAM530S8SGZfBJjUsMHV+dskLhNkp2vEmkKjfAmABN/PWgn39aUNv+d
        dK0uwYikUk2YSS3kZ780qtJbxOVjfDdD9A==
X-Google-Smtp-Source: ABdhPJyPdC3z5eXXsMD+2jAI4PglmXPsmgB2sSv6tGpZi8tcg0hCW0qGEBNU4AWpxutvBkTDvLT1KA==
X-Received: by 2002:a63:5907:0:b0:382:2f93:5467 with SMTP id n7-20020a635907000000b003822f935467mr2205250pgb.460.1648565173994;
        Tue, 29 Mar 2022 07:46:13 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id c63-20020a624e42000000b004fa9ee41b7bsm19468555pfb.217.2022.03.29.07.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 07:46:13 -0700 (PDT)
Date:   Tue, 29 Mar 2022 22:46:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Edit/gpiomon: Question about mode
Message-ID: <20220329144609.GA377439@sol>
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
 <20220329033840.GA14149@sol>
 <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
 <20220329083823.GA94201@sol>
 <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
 <20220329085108.GA114462@sol>
 <71eccedc-5bc1-e4f3-06c8-87b1127e1261@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71eccedc-5bc1-e4f3-06c8-87b1127e1261@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 29, 2022 at 03:37:25PM +0200, Hans Kurscheidt wrote:
> 
> Am 29.03.2022 um 10:51 schrieb Kent Gibson:
> > On Tue, Mar 29, 2022 at 10:43:19AM +0200, Hans Kurscheidt wrote:
> > > Am 29.03.2022 um 10:38 schrieb Kent Gibson:
> > > > On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
> > > > > Am 29.03.2022 um 05:38 schrieb Kent Gibson:
> > > > > > On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
> > > > > > > Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > what would be the right mode for gpiomon call from
> > > > > > > > 
> > > > > > > > a shellscript executed as root from systemd at system start
> > > > > > > > 
> > > > > > > > waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
> > > > > > > > *changed
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Lots of interupts, Signals and other GPIO ongoing from other user APPs &
> > > > > > > > threads in multi-user state.
> > > > > > > 2b more precise: I wired a GPIO Pin to GND.
> > > > > > > 
> > > > > > > Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
> > > > > > > 
> > > > > > > the program exits immediately with 1 event, although there was never a
> > > > > > > rising edge due to the fix wire to GND. Is this a feature or a bug, and is
> > > > > > > it reproducible?
> > > > > > > 
> > > > > > Not a feature and not reproducible for me on a Raspberry Pi4 with the
> > > > > > setup you describe, so probably a bug specific to your hardware platform,
> > > > > > whatever that may be.
> > > > > > 
> > > > > > If it is 100% reproduceable for you, and assuming it is an initialisation
> > > > > > issue so you only get the one spurious event, how about using -n2 as a
> > > > > > workaround ;-)?
> > > > > > 
> > > > > > Cheers,
> > > > > > Kent.
> > > > > It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and
> > > > > using -n2 does the trick, but isn't gpiod not supposed to work on all
> > > > > commercial HW platforms and related kernels, rather then only on RPI??
> > > > > 
> > > > gpiod will work on any platform with a supporting kernel.
> > > > How well depends on the underlying hardware and driver.
> > > > The RPi4 was merely a counter-example demonstrating that your issue is
> > > > not universal, using hardware I happen to have readily available.
> > > > 
> > > > Cheers,
> > > > Kent.
> > > So if I understand you right, gpiod works on sort of a logical level, while
> > > the HW dependend part depends of the kernel driver implementation of the
> > > specific HW?
> > > 
> > > 
> > libgpiod is a userspace library and tools to access GPIO lines via the
> > Linux GPIO character device.  The actual interfacing to the hardware is
> > performed by the kernel and appropriate drivers for your hardware.
> > As your problem does not exhibit on other hardware, the root cause
> > of your problem probably lies in the driver for your hardware, not in
> > libgpiod nor the gpiolib subsystem of the kernel.
> > 
> > But you would need to debug it further to be sure.
> > 
> > Cheers,
> > Kent.
> 
> I raised a bug report at tha Armbian forum:
> 
> https://forum.armbian.com/topic/20166-opi-zero-h5-gpiodmon-generates-spurious-interrupts-upon-invocation/
> 
> 
> I made some trial to understand if it is reproduceable, but I have
> difficulties defining, when it happens. After RESET there is no spurious
> event. The spurious event appears to happen, when the line was moved:
> 
> Could you please make another trial on your RPI w/ the following sequence:
> 
> RESET, gpiomon -r -n1 -Bpull-up <chip><line>  => No event,  -> pull line up
> /down, => event (as expected), gpiomon -r -n1 -Bpull-up <chip><line> =>
> false event
> 

Not sure what this is intending to prove, as the hardware is different,
or is that the point?

That is with the line initially pulled down externally, right?
I get an event when I disconnect the external pull-down - allowing the
internal pull-up to pull the line high and trigger the event.

I don't get the false event that you are seeing subsequently, even when
the line has been externally pulled up before being pulled down again
and gpiomon run again.

i.e. I see
 - line externally pulled down
 - power cycle RESET
 - gpiomon -r -n1 -Bpull-up <chip><line>  => No event
 - disconnect pull-down => event (RISING edge)
 - pull line up (or not - optional due to internal pull-up)
 - pull line down again
 - gpiomon -r -n1 -Bpull-up <chip><line> => No event

And I don't get continuous events if the line is left pulled up - I only
get the one.
Do you get those continuous events with out the -n1, or only when
calling gpiomon -n1 again?
Either way it looks like you've got something odd going on with the
interrupts on your hardware.

Cheers,
Kent.

> There might be an issue w/ pending interrupts, when the line is bouncing
> when pulled up/down. The 2nd gpiodmon cmd might catch one of the pending
> interrupts. (Just an idea). This would hint to an initialisation problem,
> that pending line states are not preempted, before the int is attached.

