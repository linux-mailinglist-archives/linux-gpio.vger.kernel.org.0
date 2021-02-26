Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC15B326057
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 10:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhBZJmN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Feb 2021 04:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhBZJkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2021 04:40:17 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFC3C06178B
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 01:39:33 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id b21so5890048pgk.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 01:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6Q2ywN2R3ak+BqAXmcN6VqsaqAp1UIip6HaT6G1aoFQ=;
        b=A3MjwjZfT9YMbhxf0FUmQWGwW/vXnarvkPAQZp7e0UticZ2jJffk32Nl+M6hkqAvFe
         KxwMjl/S9XHXSSofYA1UQ5DgFs9du6SkNySTiyOnU2Q4EnUA89lhWlpHfREG9htvWUfW
         qT2iTjeQQooOhAjMorh7L9H/p08/9CtUqT/lOkHUdLBpqXn3ooh4R67f8SveKXP1SZhF
         aSUHjkChUuwNAxnl7JnEMbx4SpH8rYj1Ol/rsDO4uvO34qSwqSJnPMQHtX8h78gYcvMO
         76WdomZQaCromx/zpuD0B6UkmTBx1AxZWoMctK4H7GuuLE5AvESlFy7nBBPjHVqSniSw
         pYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6Q2ywN2R3ak+BqAXmcN6VqsaqAp1UIip6HaT6G1aoFQ=;
        b=JHdkVs631bmtguBfyintV5l7HzJuFbVtVeOYmJzEVfhyttOJ72CSHjrYV+fLfoWu2j
         dwstuC0rU0Jeu1tK/devkfZ2r2YTkqjaRaLMUnUQF9R17fTANw6OmhvntkzLjqYtUdxs
         hAXFM4JzM3Wrv6YqvIoe2KmbI+LGm1PP5/SoP1qYgV8DIFC3AeA1Cv0rnIdTMcP/7BGE
         SF55Uwjmm072kDME42Jlnr8jAYu4aCyEbCDkU1aip8bkJdlVIFB6NBnI2O/8q5UZTn+4
         RsQjrCooAFb/z7jKPFEe44pBcS2XnDuKOZcfjubY0kLidamDO0naekO3mKc9UX5FrJot
         Z2lA==
X-Gm-Message-State: AOAM5313j9aGiebuKjyOPVtG1OwLNFNehaE9st/YL6GdFZHyQyY3WV1m
        u4nbXY5QXdiR7EKe+UZz20UbXw==
X-Google-Smtp-Source: ABdhPJy1OL4awEUmEgaKzNy7Bucg2w6a5Q0pKhipwehQ5zkcwkfNafWiKOGLq7kzCfRZMu1WFcbIFQ==
X-Received: by 2002:a05:6a00:c1:b029:1ee:1add:baf8 with SMTP id e1-20020a056a0000c1b02901ee1addbaf8mr2462253pfj.64.1614332372724;
        Fri, 26 Feb 2021 01:39:32 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id s138sm9650794pfc.135.2021.02.26.01.39.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 01:39:32 -0800 (PST)
Date:   Fri, 26 Feb 2021 17:39:26 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
Message-ID: <20210226093925.GA24428@dragon>
References: <20210226033919.8871-1-shawn.guo@linaro.org>
 <CAHp75Vcb=NO9OWjSpBeVC4c+9=aXE=yiDWVBwLD1DnzwdgFD6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcb=NO9OWjSpBeVC4c+9=aXE=yiDWVBwLD1DnzwdgFD6Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 26, 2021 at 11:12:07AM +0200, Andy Shevchenko wrote:
> On Fri, Feb 26, 2021 at 5:42 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
> > not working.  That's because the GpioInt number of TSC2 node in ACPI
> > table is simply wrong, and the number even exceeds the maximum GPIO
> > lines.  As the touchpad works fine with Windows on the same machine,
> > presumably this is something Windows-ism.  Although it's obviously
> > a specification violation, believe of that Microsoft will fix this in
> > the near future is not really realistic.
> >
> > It adds the support of overriding broken GPIO number in ACPI table
> > on particular machines, which are matched using DMI info.  Such
> > mechanism for fixing up broken firmware and ACPI table is not uncommon
> > in kernel.  And hopefully it can be useful for other machines that get
> > broken GPIO number coded in ACPI table.
> 
> Thanks for the report and patch.
> 
> First of all, have you reported the issue to Lenovo? At least they
> will know that they did wrong.

Yes, we are reporting this to Lenovo, but to be honest, we are not sure
how much they will care about it, as they are shipping the laptop with
Windows only.

> Second, is it possible to have somewhere output of `acpidump -o
> flex5g.dat` (the flex5g.dat file)?

https://raw.githubusercontent.com/aarch64-laptops/build/master/misc/lenovo-flex-5g/dsdt.dsl

> And as Mika said once to one of mine patches "since you know the
> number ahead there is no need to pollute GPIO ACPI library core with
> this quirk". But in any case I would like to see the ACPI tables
> first.

Oh, so you had something similar already?  Could you point me to the
patch and discussion?

Shawn
