Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AACF7BE5EB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377119AbjJIQKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 12:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377014AbjJIQKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 12:10:09 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3278699
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 09:10:07 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c6193d6bb4so307185ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696867806; x=1697472606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dGIYsu1MNfGtvrI3i3A4TgarZixnrBWwMgUCqpQdV34=;
        b=mPGo3aaSt2Zs/4XhDbpboFd1/W5DgA+MxWc8D6CG825AnGVgybo9Hb73eX/zHIxQ9y
         HAtgUnv3rlngt05B+RQl6NouHS0DUWWGHW3tN9qwOc9yEDPylMZ5wJD/TlHzy/2+lbeD
         5MTW2odzn3ddG9+kqTHFz/dCR+5x32eFODjv0EEVWX6cjwxk7KB7smscVTeQcqFZRBIs
         kS+8FayOi27YymTXZSyM8FqAGvPlr/3E/C79eEH6XQWm4iWY71fEpZWt4UM7vGfZQ+Cu
         xC4xkYpN2AQKC7VXDFZm/23mOyNRTF4MhDol8ptOG3jdnTZ5l1W4he59GbMPqnz5kCb3
         +0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696867806; x=1697472606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGIYsu1MNfGtvrI3i3A4TgarZixnrBWwMgUCqpQdV34=;
        b=nyilnuVv21rrxVgNUa/uno/88VasBYDVU6ACJMEi0XKi0xS5eArPlOdE72NT7o0OYX
         wLeVkBgv5s9ixCYlrDxzT0opKWWfsSFrAVQ5nONYOHZxBSWkbqWc4gSEJk/ScPE1yPJl
         CZVL+kLPohDzI4ArquZNP92Ocwu8S1PhUs7bB8OKzp2glKHgMi+VxL3c3gfR+XV8r+O3
         YI9IK8EBbMiGQdL2xT69TMbOgNs3t90Jft+hxTdhCR1+f2JrWEU2+Fgred4chx9J8CFh
         F6sZKOwKmPV1Vw3zyCdklLjQ4O4q0IyFez42Zy7xumhv72qHIWDRwNYiWL0x2MkNcnU3
         434g==
X-Gm-Message-State: AOJu0YxjaSlmv8+n94XI+yYMnQFbbfN0+vWDlETTLp1J4ZjrbXObkDaq
        m6jZj04aKQMZbw2IvC+/XOJN7A==
X-Google-Smtp-Source: AGHT+IHy1UHB7+iKwEt/4HFm84LkAhlK5DfErxNNnYkX3w3H99+guWbxzofQ+qkXAw5azJ9m9sSRpw==
X-Received: by 2002:a17:903:18c:b0:1c7:5627:2053 with SMTP id z12-20020a170903018c00b001c756272053mr721817plg.18.1696867806422;
        Mon, 09 Oct 2023 09:10:06 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090a001100b00274262bcf8dsm11287754pja.41.2023.10.09.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:10:05 -0700 (PDT)
Date:   Mon, 9 Oct 2023 09:10:02 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZSQl2tAgsUhhE3_P@google.com>
References: <ZR75cIvnQS2cqTT3@google.com>
 <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
 <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
 <ZR9EnFw3vB92vlYM@google.com>
 <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
 <e8b23683-36ac-4547-9386-935a1b211d7d@app.fastmail.com>
 <ZSA27y5CVs4yQC4a@google.com>
 <c4ea7ce3-5132-484c-870b-a62d30e2ee7a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ea7ce3-5132-484c-870b-a62d30e2ee7a@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/07/2023, Krzysztof Kozlowski wrote:
> On 06/10/2023 18:33, William McVicker wrote:
> > On 10/06/2023, Arnd Bergmann wrote:
> >> On Fri, Oct 6, 2023, at 08:06, Krzysztof Kozlowski wrote:
> >>> On 06/10/2023 01:19, William McVicker wrote:
> >>>> On 10/05/2023, Krzysztof Kozlowski wrote:
> >>>>> On 05/10/2023 21:23, Greg KH wrote:
> >>>>
> >>>> Being able to include SERIAL_SAMSUNG and SERIAL_MSM without all the vendor> specific drivers that ARCH_EXYNOS and ARCH_QCOM select is very
> >>> valuable for
> >>>> debugging early boot issues.
> >>>
> >>> Really? How related? The drivers are independent. You describe some
> >>> out-of-tree development process which we never needed for upstream work.
> >>> And we did here quite a lot of upstream, specially if you look at ARCH_QCOM.
> >>
> >> Right: in general, all drivers are independent of the platform
> >> besides the typical 'depends on ARCH_FOO || COMPILE_TEST' dependency,
> >> but I think it's worth mentioning the known exceptions, so Greg and
> >> Will can take that fight to the respective places rather than
> >> discussing it in the platform submission:
> >>
> >> - Some subsystems are considered 'special' and the maintainers
> >>   prefer the drivers to be automatically selected based on the
> >>   ARCH_* settings instead of having user-visible options. This is
> >>   traditionally true for large chunks of drivers/irqchip,
> >>   drivers/clocksource and drivers/pinctrl, though it has gotten
> >>   better over time on all of them.
> >>
> >> - Some older 32-bit platforms are still not as modular as we'd
> >>   like them to be, especially the StrongARM (ARMv4) platforms that
> >>   require a custom kernel build, and some of ARMv4T and ARMv5
> >>   boards that are still missing DT support. These tend to require
> >>   drivers they directly link to from board code, so disabling
> >>   the drivers would cause a link failure until this gets
> >>   cleaned up.
> >>
> >> - A couple of drivers are force-enabled based on the ARCH_*
> >>   options because booting without these drivers would risk
> >>   permanent damage to hardware, e.g. in overtemp or overcurrent
> >>   scenarios.
> >>
> >> - ACPI based platforms require the PCI host bridge driver to
> >>   be built-in rather than a loadable module because ACPI
> >>   needs to probe PCI devices during early boot.
> >>
> >> - Some subsystems (notably drivers/gpu/, but others as well)
> >>   have an excessive number of 'select' statements, so you
> >>   end up surprise-enabling a number of additional drivers
> >>   and subsystems by enabling certain less important platform
> >>   specific drivers.
> >>
> >>       Arnd
> > 
> > So if the argument is that the existing upstream Exynos platforms are required
> > to have these drivers built-in to the kernel to boot:
> >     COMMON_CLK_SAMSUNG
> >     CLKSRC_EXYNOS_MCT
> >     EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
> >     EXYNOS_PMU
> >     PINCTRL
> >     PINCTRL_EXYNOS
> >     PM_GENERIC_DOMAINS if PM
> >     SOC_SAMSUNG
> > 
> > ...then that is understandable and we can work to fix that.
> > 
> > My last question then is -- why do we need a new ARCH_GOOGLE_TENSOR config in
> > the platform Kconfig? For example, I don't really like this:
> > 
> > diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> > index 76a494e95027..4c8f173c4dec 100644
> > --- a/drivers/clk/samsung/Kconfig
> > +++ b/drivers/clk/samsung/Kconfig
> > @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
> >         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> >         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> >         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> > +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> > 
> > What happens when we have GOOGLE_GS101_COMMON_CLK, GOOGLE_GS201_COMMON_CLK, and
> > so on? 
> 
> Nothing happens... or happens anything you wish. Did you read the
> motivation why this was created like this?
> 
> 
> > How are we going to pick the right driver when e have a generic
> > ARCH_GOOGLE_TENSOR config?
> 

Okay, we can figure that out the gs201 specifics when the time comes.

> You do not have to pick. You select ARCH_GOOGLE_TENSOR and proper pick
> is done by you. Nothing to do more.
> 
> > Ideally, we should have one Exynos clock driver that
> > can detect what hardware is running (using the DT) to determine what it needs
> 
> It's already like this. We're done.
> 
> > to do. If you really want to compile out the other vendor's clock drivers using
> > some configs, then we should do that with SOC_GS101, SOC_GS201, SOC_TESLA_FSD
> 
> Whether you call it SOC or ARCH it is the same. We organized it as ARCH.
> 
> > configs (not ideal though). With that approach, we could drop the platform
> > ARCH_GOOGLE_TENSOR config and create an SOC_GS101 config that can be used for
> > things like the COMMON_CLK_SAMSUNG driver (for now) and building the GS101 dtb.
> 
> There is no need for this. ARCH does exactly the same.

Okay, sounds good. Thanks for the responses.

Regards,
Will

> 
> Best regards,
> Krzysztof
> 
