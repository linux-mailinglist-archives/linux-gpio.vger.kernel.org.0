Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30DC41D63E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 11:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349307AbhI3JZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349330AbhI3JZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 05:25:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB29C06176F
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 02:23:59 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so7808377wmq.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=znAoADjhs2fJ+wj2vo0owL06Ld5pagfAGMeTjsU1i/w=;
        b=ZueYPyqOSo4Zvxbh0nbgpQSITavH3zSzMsp3MDq6PIJQrM5iJm6yRv5pGSo+Avgzs2
         1eIxfXB+Gtki3wY6WHndItuy9Eed/OU3AwNQwHjCUo8F6TAdTLKk+2Ku3hX1P8wCQlbR
         /DISaH5DktLBLipTCM/A59ldqEfYeGWyqzvwSUVqk3XWXURANz/AvEzcxibm23SIIJQk
         DTI5qXV14EHLJOIJtUcHyxU0Y3NSWPKbpS9kp082/VN1qbeoAk1pND98hOWRB+1Yl+3a
         8ro6/Etiu59rsnguftvrmPra0gt2/E1O8R9iDvX6h89e1RtLySEAUupm9ydsvAZn9HYq
         G9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=znAoADjhs2fJ+wj2vo0owL06Ld5pagfAGMeTjsU1i/w=;
        b=SknP8LRQGslkryTL6538FU+RIMi1pvzoow2HklJRzvB1xY00rO8CX6nRHesLmpXIPD
         KJa3ON5umX/pCIy3tYHGERIO4v7dyhxmckQPUrn5Cxm/cOg55J0jE8lKiQmIte939eG+
         PJmoTA3K9tSDnIXn60r+Q3agivWCn6HOEcEVTgCYFNVuuYzpFPiUC++uWG707SWwzpKL
         BxojUpYlwqIoABVl7jyXB+FPWCz/LS9FvO3sIFYH0NanQjLRYlrAOXa7UMKXeq0jOUEw
         C5w2LBZ6lJsXgjoGJWmnVRrHuXXNmOKwi4Dl+dLbF4qpbl38JTvztPiUxzsyM56svATN
         E9nQ==
X-Gm-Message-State: AOAM530mdeVwsodgYIpTGdruFDP+7LMQcY6yzh4i9XJU1n15gmc+Yzx5
        vTJ1UpQ09J5SHv6KdvDtSlwNi+Uc+JQIQA==
X-Google-Smtp-Source: ABdhPJytqKtte5uugEvv86UdYrVN1vxmWLlYRx7mQpjuznaxHHwAmHobXet1Hggjc7uAjkRxUWxrXQ==
X-Received: by 2002:a05:600c:1552:: with SMTP id f18mr14293425wmg.184.1632993838010;
        Thu, 30 Sep 2021 02:23:58 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id b6sm598405wmb.1.2021.09.30.02.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 02:23:57 -0700 (PDT)
Date:   Thu, 30 Sep 2021 10:23:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVWCK5QO331rfhJJ@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I've taken the liberty of cherry-picking some of the points you have
reiteratted a few times.  Hopefully I can help to address them
adequently.

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> Reminder: these are essential drivers and all Exynos platforms must have
> them as built-in (at least till someone really tests this on multiple
> setups).

> Therefore I don't agree with calling it a "problem" that we select
> *necessary* drivers for supported platforms. It's by design - supported
> platforms should receive them without ability to remove.

> The selected drivers are essential for supported platforms.

SoC specific drivers are only essential/necessary/required in
images designed to execute solely on a platform that requires them.
For a kernel image which is designed to be generic i.e. one that has
the ability to boot on vast array of platforms, the drivers simply
have to be *available*.

Forcing all H/W drivers that are only *potentially* utilised on *some*
platforms as core binary built-ins doesn't make any technical sense.
The two most important issues this causes are image size and a lack of
configurability/flexibility relating to real-world application i.e.
the one issue we already agreed upon; H/W or features that are too
new (pre-release).

Bloating a generic kernel with potentially hundreds of unnecessary
drivers that will never be executed in the vast majority of instances
doesn't achieve anything.  If we have a kernel image that has the
ability to boot on 10's of architectures which have 10's of platforms
each, that's a whole host of unused/wasted executable space.

In order for vendors to work more closely with upstream, they need the
ability to over-ride a *few* drivers to supplement them with some
functionality which they believe provides them with a competitive edge
(I think you called this "value-add" before) prior to the release of a
device.  This is a requirement that cannot be worked around.

By insisting on drivers (most of which will not be executed in the
vast majority of cases) to be built-in, you are insisting on a
downstream kernel fork, which all of us would like to avoid [0].

[0] Full disclosure: part of my role at Linaro is to keep the Android
kernel running as close to Mainline as possible and encourage/push the
upstream-first mantra, hence my involvement with this and other sets.
I assure you all intentions are good and honourable.  If you haven't
already seen it, please see Todd's most recent update on the goals and
status of GKI:

  Article: https://tinyurl.com/saaen3sp
  Video:   https://youtu.be/O_lCFGinFPM

> We don't even know what are these unsupported, downstream platforms
> you want customize kernel for. They cannot be audited, cannot be
> compared.  Affecting upstream platforms just because
> vendor/downstream does not want to mainline some code is
> unacceptable. Please upstream your drivers and DTS.

> You also mentioned downstream devices but without actually ever defining
> them. Please be more specific. What SoC, what hardware?

Accepting changes based on the proviso that vendors upstream all of
their work-in-progress solutions is an unfair position.  We already
discussed why upstreaming support for bleeding edge H/W and
functionality is unrealistic in terms of competitive advantage.

Besides, we might not be talking about new silicon at all (I don't
believe anyone alluded to that).  The flexibility in configuration
simply allows for generic upstream drivers to be swapped out for ones
which may have more or slightly different functionality (that can't be
publicly shared until release).

> Please explain why Exynos is special that it does not require essential
> drivers to be selected as built-in. For example why aren't same changes
> done for Renesas?

> Everyone else are working like this. NXP, Renesas, Xilinx, TI, Rockchip,
> AllWinner. Samsung or Google is not special to receive an exception for
> this.

Exynos isn't special in this regard.  This applies to any vendor who
releases Android images and wishes to be solve all of the issues the
GKI project addresses (please read the article above for more about
this).

I truly hope this has helped to align my thoughts with yours.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
