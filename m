Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DE7338161
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 00:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCKXXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 18:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhCKXW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 18:22:56 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275A4C061760
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 15:22:56 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id d20so24964751oiw.10
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 15:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PyNoaK/SfNfXNK50hLCIkKpqRzcLYWyG2KnpZv/ZhAE=;
        b=jic1z4WkFBhsPZmyMNuhmd6uxncF8ngqFQbeNVA7MtGO/DJXCQT71EG/ZIYJ7tzkAq
         3bUY3uR/KRdDZf2l2dstpz0ujYtj9qec/apWxk0DUPMdMi2hCCV8i/IStimd8oaL6RvY
         iy/LMoVRSwoFzE3wXWtDpJpUZdmCt6rOlNv+3P/I8rTnlJn4uquiHQ5+xvcwor740CY1
         IJnGwgLzWqhxu2z1ABMJr0eVeROk7fUVkgpoyrarFf+3rc7CAuLm+cB3SnCf1miWgxVb
         VEwZnn6nFPgBaQ+AB2OqBtYZHClNlVsQAHWlO1rerk+avF1j2WC9ybMh0R9yguvEzv3t
         nKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PyNoaK/SfNfXNK50hLCIkKpqRzcLYWyG2KnpZv/ZhAE=;
        b=daaUN9xA5hQ152r/Aodd2HSMTGSroHCsi5etxDmu2nw2hu8c1jOdidCpSuMaLdy39h
         69u3ykf/9cbqQhd8gikE6FpsihWSfBvsRjdotkWbbahvwgc/t4fbYJo+C8szbB3ZDiXh
         QkO7xBHXGnF8rfeJ+2ZzKHLIIFA9s6sQPdi8PdiJNJglMdhC98vUvPCwTNFeNJi65puq
         wMUqaUX0SGpruAJr793x2d+5P/TOXl13TKyr0JKYvFLfQZ8VghGJ4UUn0HuRVZnveydh
         E2T7MV11s0nFJUH1lfg0J5I47fbNgJWFdfXEsLNcxC7uawy1Wef6wZNcbSeMLxPUx5Ll
         2/yQ==
X-Gm-Message-State: AOAM532IBSOaYx5Vi4QhYwCeZVC1yyCJg4vVVLMmPnLrQtnGLatYt+ct
        Ll/Es0/lLr0FIv3wjkKtqXbUKQ==
X-Google-Smtp-Source: ABdhPJxXxWCBlLBF1TLedRj6F84xxFyJFjXEX2r5uDQP+4D6ZVwSFsX4OwYZzRf7J571fK74M++cyg==
X-Received: by 2002:aca:31d7:: with SMTP id x206mr7758847oix.178.1615504975424;
        Thu, 11 Mar 2021 15:22:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i3sm793159oov.2.2021.03.11.15.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:22:55 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:22:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEqmTUXbn0T2dqla@builder.lan>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 10 Mar 17:03 CST 2021, Linus Walleij wrote:

> On Wed, Mar 3, 2021 at 2:19 PM Shawn Guo <shawn.guo@linaro.org> wrote:
> 
> > In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> > configs from ACPI table, and call into gpio_chip's .set_config hook for
> > setting them up.  It enables such support on qcom platform by using
> > generic config function, which in turn calls into .pin_config_set of
> > pinconf for setting up hardware.  For qcom platform, it's possible to
> > reuse pin group config functions for pin config hooks, because every pin
> > is maintained as a single group.
> >
> > This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> > doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> > pin is not set up by the kernel.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> > Changes for v2:
> > - Add pin config functions that simply call into group config ones.
> 
> Patch applied!
> 

As discussed in [1]; several key Qualcomm platforms have a gpio-ranges
representing the number of real GPIOs, but we then expose the UFS reset
GPO (no input) pin as a GPIO as well - making the two numbers differ.

I've moved ahead and merged the update to gpio-ranges, to make the two
match, but Shawn reports that with the introduction of .set_config() all
existing DTBs fail to probe storage because of the UFS code getting
EPROBE_DEFER back on its gpiod_get_optional().

I don't know how to make the transition, but can you please revert this
patch, to avoid breaking compatibility with DTBs out there?

[1] https://lore.kernel.org/linux-arm-msm/20210311230924.GX17424@dragon/#t

Regards,
Bjorn
