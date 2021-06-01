Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D9139706C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 11:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhFAJcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 05:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbhFAJct (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 05:32:49 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850EEC061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 02:31:08 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id l2so6050663wrw.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xy0pHRz/H5DQCU4aVDpAJMAKUR91gzlLVZzpcWsQ6cY=;
        b=JCXgsGegyJHQzuLtRYRfDskHv9GQ9OJlAAZCwJ3LOjCDNK9qZ4yPlGkDlaWJig/jkt
         dpZz17Afx3Z8IXWT68mkGgnwSjG7KT+QuaZNsbqIF6qouChWVRLP9v2rEOMaVh1XeL4k
         Pn5mQu0YKlKbdWPM5/wESeQ8vx0YBn8odObn1YwZ4a9Qf629qvHxGXZHQNbs7GrXxkDo
         c7yl1/35eBut26F1aqylJa76rRHDLIbArkaKvkqUfRVcrZmFi7OQAgo/HQpF/WYznT/s
         ho6mSuzdBY7y//sloeZWv/lh+tNIHYOFN8Ntz4B9cvaVvG/RsGTQVUS8li0ToejpPbFT
         bm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xy0pHRz/H5DQCU4aVDpAJMAKUR91gzlLVZzpcWsQ6cY=;
        b=VT0TCS38qcCAqjK0N0jBu9ks0LmiY7Vl7EheOPIb4Dp4IJjsqJxP9ceU8d/ZojAuuR
         4es37+KIAXOOZFU6xxZPRsjT/PP3chhPDy7zApRdJz+O/elRbffz73U1Y6NhXNGETUd1
         9Qua06Vy/QuRAnJxqIMuP8UTo5myZCs4HRqOoM9mRNvwchagn9s+ztE03U3CHKNKYfXd
         8aaFXbO8UPKzuqP/LSJOb4pb/qDA+x3Vrdk/6ET1g0BDw2qawdaat1s+EZxPCC6S9YpV
         f7agJYCrOcaary5i57FtXUNUnYGamj6H1TKyiEgN5LwjYbEA968qZKlhsbatgNbAsm25
         w2yg==
X-Gm-Message-State: AOAM532Xf1+OqBdGi8P1N0zv4d4zExg0Rdj0QwhlNt5Eul3LoG4vBav2
        nwxDdn/kOxJXDYgMvlVT8vRThA==
X-Google-Smtp-Source: ABdhPJw8a56Q35nun5NuJAeta49zazwWkcSr5pZTWi4cCxmdgtkN+yOPOHLYVA4Jfqa1G/9/tKjK1Q==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr16072149wrw.392.1622539866634;
        Tue, 01 Jun 2021 02:31:06 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id m11sm16439006wmq.33.2021.06.01.02.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 02:31:06 -0700 (PDT)
Date:   Tue, 1 Jun 2021 10:31:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210601093104.GE543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
 <20210601082226.GV543307@dell>
 <CA+HBbNEHgUxE-F4iiAbCyt3ffypUJf2nePUsOmCjpFoJNkpCJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNEHgUxE-F4iiAbCyt3ffypUJf2nePUsOmCjpFoJNkpCJw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021, Robert Marko wrote:

> On Tue, Jun 1, 2021 at 10:22 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Tue, 01 Jun 2021, Lee Jones wrote:
> >
> > > On Mon, 31 May 2021, Robert Marko wrote:
> > >
> > > > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > On Tue, 25 May 2021, Robert Marko wrote:
> > > > >
> > > > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > > >
> > > > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > > > >
> > > > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > > > ---
> > > > > > > > > Changes in v2:
> > > > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > > > * Add GPIO bindings as separate
> > > > > > > >
> > > > > > > > I don't understand why this changed. This doesn't look like an MFD to
> > > > > > > > me. Make your binding complete if there are missing functions.
> > > > > > > > Otherwise, stick with what I already ok'ed.
> > > > > > >
> > > > > > > Right.  What else, besides GPIO, does this do?
> > > > > >
> > > > > > It currently does not do anything else as hwmon driver was essentially
> > > > > > NACK-ed for not exposing standard attributes.
> > > > >
> > > > > Once this provides more than GPIO capabilities i.e. becomes a proper
> > > > > Multi-Function Device, then it can use the MFD framework.  Until then,
> > > > > it's a GPIO device I'm afraid.
> > > > >
> > > > > Are you going to re-author the HWMON driver to conform?
> > > > hwmon cannot be reathored as it has no standard hwmon attributes.
> > > >
> > > > >
> > > > > > The CPLD itself has PSU status-related information, bootstrap related
> > > > > > information,
> > > > > > various resets for the CPU-s, OOB ethernet PHY, information on the exact board
> > > > > > model it's running etc.
> > > > > >
> > > > > > PSU and model-related info stuff is gonna be exposed via a misc driver
> > > > > > in debugfs as
> > > > > > we have user-space SW depending on that.
> > > > > > I thought we agreed on that as v1 MFD driver was exposing those directly and
> > > > > > not doing anything else.
> > > > >
> > > > > Yes, we agreed that creating an MFD driver just to expose chip
> > > > > attributes was not an acceptable solution.
> > > > >
> > > > > > So I moved to use the simple I2C MFD driver, this is all modeled on the sl28cpld
> > > > > > which currently uses the same driver and then GPIO regmap as I do.
> > > > > >
> > > > > > Other stuff like the resets is probably gonna get exposed later when
> > > > > > it's required
> > > > > > to control it directly.
> > > > >
> > > > > In order for this driver to tick the MFD box, it's going to need more
> > > > > than one function.
> > > >
> > > > Understood, would a debug driver count or I can expose the resets via
> > > > a reset driver
> > > > as we have a future use for them?
> > >
> > > CPLDs and FPGAs are funny ones and are often difficult to support in
> > > Linux.  Especially if they can change their behaviour.
> > >
> > > It's hard to make a solid suggestion as to how your device is handled
> > > without knowing the intricacies of the device.
> > >
> > > Why do you require one single Regmap anyway?  Are they register banks
> > > not neatly separated on a per-function basis?
> >
> > Also, if this is really just a GPIO expander, can't the GPIO driver
> > output something to /sysfs that identifies it to userspace instead?
> 
> I replied to your previous reply instead of this one directly.
> It's not just a GPIO expander, it also provides resets to all of the HW
> and a lot of debugging information.
> Note that other switches use the same CPLD but with more features
> so I want to just extend these drivers and add for example hwmon.
> 
> It's not just about it identifying itself, it offers a lot of various
> debug info,
> quite literally down to what CPU has access to the serial console on the
> front and their bootstrap pins.
> 
> So, I want to expose the CPLD version, code version, switch model,
> PSU status pins and a lot more using a separate driver as they
> don't really belong to any other subsystem than misc using debugfs.

drivers/soc is also an option for devices like these.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
