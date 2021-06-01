Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6A939700E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 11:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhFAJNx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 05:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhFAJNx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 05:13:53 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97329C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 02:12:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id g17so13394062wrs.13
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hswWG3k76XjsOAY7hr4YP59a7cKj8iPzOH2k8wJsCIA=;
        b=E3SCPq2jLbOJ+6oYBMsbGdcBNMoG/P7rv8+TpusKtqDwT2/yE/U3nEsPOoFUZKC61R
         MwtvitPLMnlfT3+pcPLk4+MmxSvBFOnzx/VUKOUpoHT9dIZYOIcNQJw42huYXiq9MzZi
         gAw+7NcYpepe67W/CYjTK99Bpa1EeItub4RyJp0X4Ykbez7KFn1ovfIb6Z1ekwGs90A+
         +8QAVRnPKq10VU+jluRzHzNsyfZ3VHSJCDgMBVC9Q69omw+ywPSTHrO2AfICM4JIlRrV
         R2JycltvZMp17/a144Kiq7K7Yutk/Krni6+dRTJEQq28XIwH4Ezm9paFSOj2GanWdRdw
         EZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hswWG3k76XjsOAY7hr4YP59a7cKj8iPzOH2k8wJsCIA=;
        b=VnOUZ0FeqUK/C6kPQ+gGVVP853yICSHdMn08cLbVaLp/jgS1gJOR8GDLb8OBVq5km1
         eN9lMGkcfBXFNYRJlJuYb6o/CmwyobqRDLPQTcB2SoT8gIHLoG4qcyKXlSAchHHrZIF6
         xEyQCzFIjd/tmd280EZBUCSu3XXnZIFn/zG16JBLDP1Rz1bwZCz8QTgKA3iJPnqbYg+E
         9lRdQrjqVLVMuOkMtxQZHhbLIKrfj7+iH7TiKl6EIcoJwRLSrc8WRI6pREVyaXjePSvn
         pvJ+s2riub+36dDwZqHU64Ew28Spu4An5v+CdZ+5mcFP08i1CoI87Pi2d66YQQ7/YjXw
         uSoQ==
X-Gm-Message-State: AOAM533UaSdekz5Ik00l0gMPrqtdBIGzXryoMAS73488ZjnY1qYYF8z0
        aoIdXuuOY2WAKZaFeag/gHNeYg==
X-Google-Smtp-Source: ABdhPJxGoTYw8ikTT5yUvmARYAs7FCvUQKUJOk95afL5fffk1+XwewafibHRCb9uaKs0zntRxXnRYg==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr7238454wrl.225.1622538730170;
        Tue, 01 Jun 2021 02:12:10 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id y22sm2310852wma.36.2021.06.01.02.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 02:12:09 -0700 (PDT)
Date:   Tue, 1 Jun 2021 10:12:08 +0100
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
Message-ID: <20210601091208.GB543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
 <CA+HBbNFW4NHpcEt7Xa+qC2HVvhuKu1O+PUo_rSE03qtSsBCehg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFW4NHpcEt7Xa+qC2HVvhuKu1O+PUo_rSE03qtSsBCehg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021, Robert Marko wrote:

> On Tue, Jun 1, 2021 at 10:19 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Mon, 31 May 2021, Robert Marko wrote:
> >
> > > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > On Tue, 25 May 2021, Robert Marko wrote:
> > > >
> > > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > >
> > > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > > >
> > > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > > >
> > > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > > ---
> > > > > > > > Changes in v2:
> > > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > > * Add GPIO bindings as separate
> > > > > > >
> > > > > > > I don't understand why this changed. This doesn't look like an MFD to
> > > > > > > me. Make your binding complete if there are missing functions.
> > > > > > > Otherwise, stick with what I already ok'ed.
> > > > > >
> > > > > > Right.  What else, besides GPIO, does this do?
> > > > >
> > > > > It currently does not do anything else as hwmon driver was essentially
> > > > > NACK-ed for not exposing standard attributes.
> > > >
> > > > Once this provides more than GPIO capabilities i.e. becomes a proper
> > > > Multi-Function Device, then it can use the MFD framework.  Until then,
> > > > it's a GPIO device I'm afraid.
> > > >
> > > > Are you going to re-author the HWMON driver to conform?
> > > hwmon cannot be reathored as it has no standard hwmon attributes.
> > >
> > > >
> > > > > The CPLD itself has PSU status-related information, bootstrap related
> > > > > information,
> > > > > various resets for the CPU-s, OOB ethernet PHY, information on the exact board
> > > > > model it's running etc.
> > > > >
> > > > > PSU and model-related info stuff is gonna be exposed via a misc driver
> > > > > in debugfs as
> > > > > we have user-space SW depending on that.
> > > > > I thought we agreed on that as v1 MFD driver was exposing those directly and
> > > > > not doing anything else.
> > > >
> > > > Yes, we agreed that creating an MFD driver just to expose chip
> > > > attributes was not an acceptable solution.
> > > >
> > > > > So I moved to use the simple I2C MFD driver, this is all modeled on the sl28cpld
> > > > > which currently uses the same driver and then GPIO regmap as I do.
> > > > >
> > > > > Other stuff like the resets is probably gonna get exposed later when
> > > > > it's required
> > > > > to control it directly.
> > > >
> > > > In order for this driver to tick the MFD box, it's going to need more
> > > > than one function.
> > >
> > > Understood, would a debug driver count or I can expose the resets via
> > > a reset driver
> > > as we have a future use for them?
> >
> > CPLDs and FPGAs are funny ones and are often difficult to support in
> > Linux.  Especially if they can change their behaviour.
> >
> > It's hard to make a solid suggestion as to how your device is handled
> > without knowing the intricacies of the device.
> 
> Yeah, I understand.
> This one is a generic CPLD used in multiple switch models, however in this
> switch model, it has the smallest set of features.
> Things that are usable for the kernel and userspace it provides are SFP pins,
> resets and debug information.
> Debug information is quite detailed actually.
> 
> I have added the reset driver in v3 as that is something that was gonna get
> added later as well as it exposes resets for the ethernet PHY-s and U-boot
> messes with the OOB PHY configuration.
> 
> >
> > Why do you require one single Regmap anyway?  Are they register banks
> > not neatly separated on a per-function basis?
> 
> For GPIO and reset drivers, I could get away with each of them
> registering a regmap
> but the debug driver will require accessing certain registers from their space.

> Also, I see using a single regmap that is provided by a generic driver
> much simpler and cleaner than doing that in each of the child drivers.

Obviously not. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
