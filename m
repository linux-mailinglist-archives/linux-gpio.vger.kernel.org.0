Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CB7412FF8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 10:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhIUINR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 04:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhIUINR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 04:13:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B3AC061757
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 01:11:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q11so36617166wrr.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ydWqOkie+tr01fbOoWOEuomByeEyt2VRZxMCMJGoWKQ=;
        b=m90vVQ0/g+glJejnMxIyN9vpccBAGiYy5DSylPUvFlECP6wxT9gbfdgf/ycu0oLZzn
         rvf7DeSGFkOCsKdA7GF/xT3QIO9x69g7b8g6DO2wLzrFDDUdkTmkRo1Jslj9UBik09iy
         Fxf6Xtj4tyaeCnlf5VypiGZnDNBqEAK9cflPq1vlmlZHNmzYLmtowCWGtbfDyCSqVmXZ
         PVr7fSmLRNfmLKsPvvqqubuAFw1i/5smUFViSPgTYEnVqikvaUi3JZNJ1kBF5xg1JNYI
         MgJePs34Jdh5p0Sjk7u4jfVS/fTtHkdJyc11AEKcD/0tuf9lnJ5ZKQncr0uHn1hlHGKp
         k7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ydWqOkie+tr01fbOoWOEuomByeEyt2VRZxMCMJGoWKQ=;
        b=OwjfiOSMZ1/eouqFtmog3ZQTpIhiaD+PAjWvFj5W3futE9Mzv2pVJPl+VS5/gpH85f
         dxhBFLR0WUY+BVrQkBChy+EZFHhGNmroGDfIVuOIqN/P0Y+J+ZKXaF0Z2cKXKKzOoYH9
         7QeeKznxJ+uKURM+/zt5GxM36MUBsxipoNNYHMlllyYc0EzR9XHbGqKRG9R66PCFf3LZ
         iO+OoD/PqPviBzA2Q0+qrwflhMqPlmRp14GYz5ro8Z5v19jjpFW1vKMWKA/KbmTfWMx2
         4BnuWIaBBqSPQsWxJBB0lXhXV3qNyewd3mllE81IarRL2FHh3QI4Ylf8HrkMn5G2z1ZK
         S/8g==
X-Gm-Message-State: AOAM530J2m7SYTOyC/WHNWNu0zYIpFKrCXr+aMn4c/uPYFXO0LZdyCke
        qVEyjT8lCHdFZMpzgFMp/kB5mw==
X-Google-Smtp-Source: ABdhPJzv2vNo66rTcRBrAlohDVsFc3SMmKKr76F/SZVNAIZ9JZ7eBaIvwAaVxjt21dQdltK+QYYkLA==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr33874060wrr.329.1632211907545;
        Tue, 21 Sep 2021 01:11:47 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id j21sm18300805wrd.48.2021.09.21.01.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 01:11:47 -0700 (PDT)
Date:   Tue, 21 Sep 2021 09:11:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <YUmTwZPqrCfRMekd@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 20/09/2021 21:03, Will McVicker wrote:
> > This patch series tries to address the issue of ARCH_EXYNOS force selecting
> > a handful of drivers without allowing the vendor to override any of the
> > default configs. This takes away from the flexibilty of compiling a generic
> > kernel with exynos kernel modules. For example, it doesn't allow vendors to
> > modularize these drivers out of the core kernel in order to share a generic
> > kernel image across multiple devices that require device-specific kernel
> > modules.
> 
> You do not address the issue in these patches. The problem you describe
> is that drivers are not modules and you are not changing them into modules.

The wording is unfortunate.  The reason for this change doesn't have
much to do with kernel modules.

Let's go back in time 18 months or so when Greg KH submitted this [0]
patch, which you Acked.  Greg was trying to solve the problem of not
having to enable ARCH_EXYNOS on kernels which are designed to be
platform agnostic (sometimes called Generic Kernels).  For some reason
SERIAL_SAMSUNG is the only symbol with these dependencies, so the
solution seemed simple and straight forward at the time.

However, For sound reasons Geert NACKed the patch.

Quoting from [1] he says:

  "A generic kernel will include Samsung SoC support, hence
  PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."

However, since the entry for ARCH_EXYNOS *insists* on building-in a
bunch of other symbols (via 'select') which will be unused in most
cases, this is not a currently acceptable approach for many Generic
Kernels due to size constraints.

What this patch does is migrates those symbols from being 'select'ed
(always built-in with no recourse) to 'default y'.  Where the former
cannot be over-ridden, but the latter can be via a vendor's
defconfig/fragment.

I doubt many (any?) of these symbols can be converted to kernel
modules anyway, as they are required very early on in the boot
sequence.

> > To address this without impacting the existing behavior, this series
> > switches the default config logic for the offending configs to use "default
> > y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
> > verified that these patches do not impact the default aarch64 .config.
> 
> Yep, this is what you did but it does not match the described problem.
> You are not solving it but doing something else.
> 
> > Will McVicker (4):
> >   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
> >   soc: samsung: change SOC_SAMSUNG default config logic
> >   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
> >   rtc: change HAVE_S3C_RTC default config logic

[0] https://lore.kernel.org/lkml/20200220102628.3371996-1-gregkh@linuxfoundation.org/
[1] https://lore.kernel.org/lkml/CAMuHMdVrVe37JyUNFSf9KRZTcndrvDaZvrVoBxzm_7J2nhg1kg@mail.gmail.com/

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
