Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3B2413045
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 10:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhIUIme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 04:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhIUImd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 04:42:33 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4953CC061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 01:41:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w17so28690893wrv.10
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Jpo5hVx8FocmwTc1vBarjOAvcclKIu4PIomViQO7n7o=;
        b=sXGd/CWVpW8T0oDZMr7aFCXoqz8iL5jce66I3q3miAC0b3bP2wp9kbmEO0y+bNhIhM
         eJbm7KcynwZQ4Ncg6SOVssxvJOMntvanrOGx7BLr+OS2gtjCXhIzgL8pPRxXgUufNEpO
         SfUv8Cwj91XCM1jMIrtjcJvbqmybo9mVbR1LBtZLwomkFTJCUPY51CzHLrCAdjpo2rRx
         Yz8kkMt/4/JdBlYt26/EI79Kf2xP6gbcRu1gRZZyTb6vCK5QyJ0P//dCYv+6Av0Ko5vv
         8BjOZ5SxtwRzhZkBo8/ySVYiluiK85TWRTXut+FwhGPMASjaojRaacV90LRCtxecb1my
         eCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jpo5hVx8FocmwTc1vBarjOAvcclKIu4PIomViQO7n7o=;
        b=7TbgUsi59Gqw0jSw28/BEabSzHq4xr+8151FhUZugsPi09wawyCkzKhqw119f01wnS
         RTxm5xEiTjzH9GiX3JSA9/XxO/nxii/6HRqjnxs7XJ2Zyh2fg2D0CZ0i3+vWH1DR0fCM
         VN8c8+NmQXQ731TkCtTqb1YauVz2IHFQcqhIs9kex1BnCbrR/+cTAz91/hWO5wnrAqda
         uufSzZwJCeyVbd/FRvSEAn9cXa8k2HJwiGOw02AlIbVEttLQKuU9W+v+jdjwesIb/5l2
         y4vAMPVxBg6cadf/ZUrvd3qrTZ8mUiMOA3PM5PR5V9ywBymPiJ9ChkJ3sQrBoVIwQrFU
         7c5w==
X-Gm-Message-State: AOAM533hmBxTRCZ8Nb13kFKaDxE63GxqVYdR57a5jeBGUBj0XjcyJjSx
        y8T1a0DPMwJjCwnFLndBpFt75z2116XLzQ==
X-Google-Smtp-Source: ABdhPJyVa4q4Tr9xInJmFQ4KLGfuU0f32NWO99Wuwos1Hr/1lN0IZskRsr47p4hltHVfBz5jFqK1zw==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr33059922wru.243.1632213663872;
        Tue, 21 Sep 2021 01:41:03 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id y197sm2403557wmc.18.2021.09.21.01.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 01:41:03 -0700 (PDT)
Date:   Tue, 21 Sep 2021 09:41:01 +0100
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
Message-ID: <YUmanemsBKt4sK2f@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
 <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 21/09/2021 10:11, Lee Jones wrote:
> > On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> > 
> >> On 20/09/2021 21:03, Will McVicker wrote:
> >>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> >>> a handful of drivers without allowing the vendor to override any of the
> >>> default configs. This takes away from the flexibilty of compiling a generic
> >>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> >>> modularize these drivers out of the core kernel in order to share a generic
> >>> kernel image across multiple devices that require device-specific kernel
> >>> modules.
> >>
> >> You do not address the issue in these patches. The problem you describe
> >> is that drivers are not modules and you are not changing them into modules.
> > 
> > The wording is unfortunate.  The reason for this change doesn't have
> > much to do with kernel modules.
> > 
> > Let's go back in time 18 months or so when Greg KH submitted this [0]
> > patch, which you Acked.  Greg was trying to solve the problem of not
> > having to enable ARCH_EXYNOS on kernels which are designed to be
> > platform agnostic (sometimes called Generic Kernels).  For some reason
> > SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> > solution seemed simple and straight forward at the time.
> > 
> > However, For sound reasons Geert NACKed the patch.
> > 
> > Quoting from [1] he says:
> > 
> >   "A generic kernel will include Samsung SoC support, hence
> >   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
> 
> Yes, it's correct reasoning. There is also one more use-case -
> non-upstreamed (out of tree) platform which wants to use Exynos-specific
> drivers. Something like was happening with Apple M1 except that it got
> upstreamed and we do not care much about out-of-tree.
> 
> > However, since the entry for ARCH_EXYNOS *insists* on building-in a
> > bunch of other symbols (via 'select') which will be unused in most
> > cases, this is not a currently acceptable approach for many Generic
> > Kernels due to size constraints.
> 
> In the mainline kernel there is no such use case. If you want to have
> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
> sense. Such kernel won't work.
> 
> It makes sense only if there is some other work, hidden here, where
> someone might want to have SERIAL_SAMSUNG or S3C RTC without
> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
> Exynos platforms.
> 
> Therefore I expect first to bring this "some other work, hidden here" to
> broader audience, so we can review its use case.

AFAIA, there really isn't any GKI specific code.  Everything that can
be upstreamed, is upstreamed.  The delta consists of some vendor
over-rides (implemented using trace events/hooks spread out over the
code-base), lots of function exports (non-upstreamable due to no
upstream user) and some defconfig/fragments.  There really is nothing
else to share/upstream/unhide.

The only thing GKI needs is a little Kconfig flexibility above what is
currently offered.

> > What this patch does is migrates those symbols from being 'select'ed
> > (always built-in with no recourse) to 'default y'.  Where the former
> > cannot be over-ridden, but the latter can be via a vendor's
> > defconfig/fragment.
> 
> It cannot be overridden by vendor fragment because options are not
> visible. You cannot change them.
> 
> The patch does nothing in this regard (making them selectable/possible
> to disable), which is why I complained.

100% agree.  As I commented in the other patch, this was a good point
that should be addressed 

> > I doubt many (any?) of these symbols can be converted to kernel
> > modules anyway, as they are required very early on in the boot
> > sequence.
> 
> True, some could, some not. Also some platforms are set up via
> bootloader, so actually could "survive" till module is loaded from some
> initrd.

If these could be turned into modules, that would be even better!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
