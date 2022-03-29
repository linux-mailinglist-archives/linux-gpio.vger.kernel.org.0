Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D444EA9BD
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbiC2IxF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 04:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbiC2Iwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 04:52:55 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7567C53705
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:51:13 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id l129so5728677pga.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uE/VFPbSjj2s/bobipVpnaJAZWvYV7YmNAKJh3arDo4=;
        b=RwaStmzTE8WDgOdVIMn0+5jRfcai9Mg+PFeRcl3PNApgW3YdCiNoTEFLUYdnotSViM
         kaa9pZQ04k7pY3DgQmNLk4l3E5UNd353QO5BY+qWZRzZ+ZzQN7uTn8kzXq+j+/hslfoR
         GQzaNoUZ4GjrB+xNDJ4rsBJscnHpHuc0OavGzATuAUqs+z8PeCtvYFzY/hSnSs/ojF5N
         LTXm4G/A+qA71178mDHhW2D1mpsw85t929xmS9eeTiteYc/draaIYnrcbFwHRsJwnRHf
         MTfpNfkFvY8nbenOcOaFa8tfwZ5jwrZb4Y83ium2A/iVbXN1EnpAaMb090Q1sssOCmzE
         xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uE/VFPbSjj2s/bobipVpnaJAZWvYV7YmNAKJh3arDo4=;
        b=394AzSnaCnbhJSzRcnsRhRbX76REPeDciJli5M0Z4ALkc4D3UV54c6zAmxazt0p//r
         KJPiHlk43ICfiAczEyb4MlRsHEIUpB0UEWEwTCZEPcXgNI4A81wcKE8VxDgFVjp5rmSJ
         c5wt9otnTkBk0kXoqH/bXmf8GT5qHw6vP8sEWFjJ2Y94fXIMgduVqYj/KF8bj9s/oX3L
         FuSmDl2sukMMmnE8+wMHflyxYv03dOJEjlbS0wJxiboE33BlCVYeg3dviqNvBNZ9PPUb
         XG50KGMqij4jFCA6ca0EbvSLhi3/YM/g4BRjNqD49HU0Fq4Yn/R36MO03D0ybXI3+mlw
         7rSQ==
X-Gm-Message-State: AOAM533u7A8KsnZ/DI0mxVWpMgD5u1RlW93l4MSKrKdcH6PDa1GwjI0/
        QnbFnExb21uU8+NXs4S79UE=
X-Google-Smtp-Source: ABdhPJztYKqL+JsOcA3VSzeQSyKyQB9oTUUoYksrA4BO8FNar/brn5WtbyGuHgxroXyutBG5X92yZg==
X-Received: by 2002:a05:6a00:1da1:b0:4fa:a53d:d0a5 with SMTP id z33-20020a056a001da100b004faa53dd0a5mr27160643pfw.42.1648543872939;
        Tue, 29 Mar 2022 01:51:12 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id o7-20020a056a00214700b004c169d45699sm17786001pfk.184.2022.03.29.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:51:12 -0700 (PDT)
Date:   Tue, 29 Mar 2022 16:51:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Edit/gpiomon: Question about mode
Message-ID: <20220329085108.GA114462@sol>
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
 <20220329033840.GA14149@sol>
 <425f4895-81a9-719a-be74-4c67f9c35b92@gmail.com>
 <20220329083823.GA94201@sol>
 <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6f8156-fcf0-21cf-c9bc-6543d982e89a@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 29, 2022 at 10:43:19AM +0200, Hans Kurscheidt wrote:
> 
> Am 29.03.2022 um 10:38 schrieb Kent Gibson:
> > On Tue, Mar 29, 2022 at 10:07:57AM +0200, Hans Kurscheidt wrote:
> > > Am 29.03.2022 um 05:38 schrieb Kent Gibson:
> > > > On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
> > > > > Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> > > > > > Hi,
> > > > > > 
> > > > > > what would be the right mode for gpiomon call from
> > > > > > 
> > > > > > a shellscript executed as root from systemd at system start
> > > > > > 
> > > > > > waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.
> > > > > > *changed
> > > > > > 
> > > > > > 
> > > > > > Lots of interupts, Signals and other GPIO ongoing from other user APPs &
> > > > > > threads in multi-user state.
> > > > > 2b more precise: I wired a GPIO Pin to GND.
> > > > > 
> > > > > Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
> > > > > 
> > > > > the program exits immediately with 1 event, although there was never a
> > > > > rising edge due to the fix wire to GND. Is this a feature or a bug, and is
> > > > > it reproducible?
> > > > > 
> > > > Not a feature and not reproducible for me on a Raspberry Pi4 with the
> > > > setup you describe, so probably a bug specific to your hardware platform,
> > > > whatever that may be.
> > > > 
> > > > If it is 100% reproduceable for you, and assuming it is an initialisation
> > > > issue so you only get the one spurious event, how about using -n2 as a
> > > > workaround ;-)?
> > > > 
> > > > Cheers,
> > > > Kent.
> > > It appears 2b reproduceable 100% on my OrangePi zero+ (Allwinner H5) and
> > > using -n2 does the trick, but isn't gpiod not supposed to work on all
> > > commercial HW platforms and related kernels, rather then only on RPI??
> > > 
> > gpiod will work on any platform with a supporting kernel.
> > How well depends on the underlying hardware and driver.
> > The RPi4 was merely a counter-example demonstrating that your issue is
> > not universal, using hardware I happen to have readily available.
> > 
> > Cheers,
> > Kent.
> 
> So if I understand you right, gpiod works on sort of a logical level, while
> the HW dependend part depends of the kernel driver implementation of the
> specific HW?
> 
> 

libgpiod is a userspace library and tools to access GPIO lines via the
Linux GPIO character device.  The actual interfacing to the hardware is
performed by the kernel and appropriate drivers for your hardware.
As your problem does not exhibit on other hardware, the root cause
of your problem probably lies in the driver for your hardware, not in
libgpiod nor the gpiolib subsystem of the kernel.

But you would need to debug it further to be sure.

Cheers,
Kent.
