Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6FEA7C6FBA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347282AbjJLNwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 09:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347221AbjJLNwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 09:52:17 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79798CC
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 06:52:15 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7af45084eso13077547b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697118734; x=1697723534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2gG3fg3q52fvlTCT+QjsQd6tuCwnP38cEJE5IRE6jM=;
        b=gIIRbUZ4Gi8sK9ilsh4xnDXqxqcRXgrF9YjKUkPXmKSD/D9IVd9vj+U0lxgBkt/WS1
         e23WX/9V6HF1kKNXQHF63nJ7pKnGE1hkG8VE4x5M/FG7yEDqmftEpOuhTL/z9hSYy4iW
         CXEDvK6XryqkkIQo43Nt1kEL2EZbrcGD5itzjSl9P7k6f4889XqEHTPCbUFiae9LYW7d
         zab+k0QQpbcaWfjOtJopbV3qGZ7tNbzF2NoLq03jiRuvqpUF9lS6Wth0oPGJ9ErrOgk0
         ADDgZ3Y6+LN9xqFJNeFRahe0ljaQoPXT4KFpH+AlBhbFIUp8KMeCxl4fJXXPouudVQ+b
         M6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118734; x=1697723534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2gG3fg3q52fvlTCT+QjsQd6tuCwnP38cEJE5IRE6jM=;
        b=Wil32qjNgoUBsQoaHe9x6WBXBZUn8+CjA3us6TlH9ZOPV0EgSHzqKCp9pcJCrg/QCS
         hrsb4FSaLSnSgE0l7x4at2Jb0LOEoSzL/ivxMWhYQkcAzfdMEBjNEbcgFL1Gjz8kYs89
         OyTGbflaUNQIHEdNBh45lMFAAfBiETo9ZMSkFebdNTDuWBFdic9HXo7YWtpI8AFswpBC
         A1o0O/XUXuR1FEAuJYPWxZPOmN50AzowHI/y8dFkfY/FhWvtLjjmUot6MDZ0PbEahCfM
         OA/tyWTQ0X6EU/Kl7z1lzIWKq7Rnaxb6Bx+jYI+zpXLR3JJ1YXIkrm5DDH/dFzGOVIW9
         MNRQ==
X-Gm-Message-State: AOJu0Yz0iqrOw8/oBvDV2dBmV0SxvbuvgetaURh1+y7S0TIoj5NMwMd7
        e/i7oUgR7JdWcGmgyts/N69nhOudwAO9qqVg1YCPNw==
X-Google-Smtp-Source: AGHT+IEUixItd1kXxNUWqJ7YWtNJT7rR6hD0H/r/LT4Rvu2rvoR99SCGtsC+RPlcyYZVTc4zHe4JBltjz4OLDyvTd9I=
X-Received: by 2002:a05:6902:1507:b0:d81:917c:69b with SMTP id
 q7-20020a056902150700b00d81917c069bmr27103248ybu.10.1697118734615; Thu, 12
 Oct 2023 06:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org> <CAPLW+4mO1dMjh1EDPbaL0QGe4EM0GnbQ1G7NsdtBaCcPzdmkPw@mail.gmail.com>
 <CADrjBPqo8kKUr-EPay3zDQiF7XRwN+FDFN5W2tD5Aet50L2KUA@mail.gmail.com> <28bee37b-1d6d-433e-810f-da847635fcaf@linaro.org>
In-Reply-To: <28bee37b-1d6d-433e-810f-da847635fcaf@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 14:52:02 +0100
Message-ID: <CADrjBPoHu4d-WjgO3sQb0T784QBm7S8YFUnDANmMHkZqjgv90w@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Thu, 12 Oct 2023 at 13:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 14:06, Peter Griffin wrote:
> > Hi Sam,
> >
> > Thanks for the review.
> >
> > On Thu, 12 Oct 2023 at 01:07, Sam Protsenko <semen.protsenko@linaro.org=
> wrote:
> >>
> >> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@l=
inaro.org> wrote:
> >>>
> >>> CMU_TOP is the top level clock management unit which contains PLLs, m=
uxes
> >>> and gates that feed the other clock management units.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  drivers/clk/samsung/Kconfig     |    9 +
> >>>  drivers/clk/samsung/Makefile    |    2 +
> >>>  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++=
++
> >>>  3 files changed, 1562 insertions(+)
> >>>  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >>>
> >>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfi=
g
> >>> index 76a494e95027..14362ec9c543 100644
> >>> --- a/drivers/clk/samsung/Kconfig
> >>> +++ b/drivers/clk/samsung/Kconfig
> >>> @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
> >>>         select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
> >>>         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> >>>         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> >>> +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> >>>         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> >>>
> >>>  config S3C64XX_COMMON_CLK
> >>> @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
> >>>           status of the certains clocks from SoC, but it could also b=
e tied to
> >>>           other devices as an input clock.
> >>>
> >>> +config GOOGLE_GS101_COMMON_CLK
> >>> +       bool "Google gs101 clock controller support" if COMPILE_TEST
> >>> +       depends on COMMON_CLK_SAMSUNG
> >>> +       depends on EXYNOS_ARM64_COMMON_CLK
> >>> +       help
> >>> +         Support for the clock controller present on the Google gs10=
1 SoC.
> >>> +         Choose Y here only if you build for this SoC.
> >>> +
> >>
> >> Why is that new option needed? From the look of it, it could be just a
> >> part of EXYNOS_ARM64_COMMON_CLK. Like clk-exynos850 or
> >> clk-exynosautov9. Is there any particular feature that makes it SoC
> >> special?
> >
> > No, it could also be added to EXYNOS_ARM64_COMMON_CLK. I was following
> > the example set by TESLA_FSD which is another custom Exynos based chips=
et
> > that added its own config option.
> >
> > Krzysztof do you have any preference on this?
>
> Usually there is only one image for several boards so long time ago we
> stopped adding per-SoC Kconfig entries. This has its own ARCH_xxx, just
> like Tesla, thus having separate Kconfig for all Google Tensor clock
> drivers makes sense. Maybe it should be just called a bit differently,
> e.g. GOOGLE_TENSOR_COMMON_CLK

Thanks, I will update the name in v4.

Peter.
