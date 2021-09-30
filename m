Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858CB41DB14
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 15:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351458AbhI3Nba (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 09:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351438AbhI3Nb3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 09:31:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9467C06176F
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 06:29:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w29so10073122wra.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=q+R3lw9hSs/DZNzD1ywHyamm1IrGhxmkV4ENbV1GCU4=;
        b=DgISTWDu6rOHfzRjV6Qlml3/7p6txDssydTajODz+GlRBwZnnZJ+mHqxja6SLqqzZS
         eyqevG/RTJ1e19LvzUSviCvcRdY/ZQlLzVjdheF0j9oYG2VCjjxYzy70fFH6h8wQFIl1
         heZTwo8Ij6lQSgsdYl1dZiwV3X78qZHJLVBF7Te55QST9l020nZl0zdexD6cQxRMEf6W
         SRIUEGew9SLXCrM/mV3q/VEp2npSKkXBbZ5+s2TfsplI/1q6wc/x7KyW1mrI5x5IDs/H
         NBJzxCeq6cVp7HZB2iCl43ejKQHiNBQy43JZ3VV5ezx4T/8upAw3Pc/u2fcrSEWOZw/o
         CpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q+R3lw9hSs/DZNzD1ywHyamm1IrGhxmkV4ENbV1GCU4=;
        b=72ixy3MfDJ2Iw7OW9tbXdkd0F5TeJM2vRgEUVdFPAxfH/FMYfq2mWdwI+3kr40/n0X
         6LmxjZH2UdEK+whObF6ZJsyMSJs1Hn+56SWrAx+9EY/+Ohg/JiRLDOHx/UGgEquGLrOs
         Jq9ysVzxadQZ/0tHPbCgrzZ1o0xXMva7/li8S98S0bg71vVRIMV0MLmneCNYlt3Ih3Zm
         BXhkbgq9v6B4rql60TA4a6nHOOU+EaddqgXlZCaX/iAW9gEvav/EUzcKuWJxgGaCd+MJ
         bMXNFz4ktzUvWI0XxQhgn6mIcnjycoCv4eHXqy9z2HUlINb4XGlxwfshsJ3CO5vC2Rnl
         f0dA==
X-Gm-Message-State: AOAM531V1PWYR+RDsD9pzSrRs6g6sQB8WS+afrefka6iNKcQVOa2ydka
        ZSqZfJtkFO4CWZZUneOEBJ4qwQ==
X-Google-Smtp-Source: ABdhPJy/y/6uR/KPQ8dQ/+hV2n00qqTbyI2pfOM4zKq4a5jrPB98oGnv1D/dr/8czG2Kuq8YEDugGw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr5785614wrn.273.1633008585451;
        Thu, 30 Sep 2021 06:29:45 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id x21sm4825619wmc.14.2021.09.30.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 06:29:44 -0700 (PDT)
Date:   Thu, 30 Sep 2021 14:29:42 +0100
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
Message-ID: <YVW7xoHaLdGHBoEQ@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
 <YVWwBz8jrznqXah4@google.com>
 <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:

> On 30/09/2021 14:39, Lee Jones wrote:
> > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > 
> >> On 30/09/2021 11:23, Lee Jones wrote:
> >>> [0] Full disclosure: part of my role at Linaro is to keep the Android
> >>> kernel running as close to Mainline as possible and encourage/push the
> >>> upstream-first mantra, hence my involvement with this and other sets.
> >>> I assure you all intentions are good and honourable.  If you haven't
> >>> already seen it, please see Todd's most recent update on the goals and
> >>> status of GKI:
> >>>
> >>>   Article: https://tinyurl.com/saaen3sp
> >>>   Video:   https://youtu.be/O_lCFGinFPM
> >>>
> >>
> >> Side topic, why this patchset is in your scope or Will's/Google's scope?
> >> Just drop it from Android main kernel, it will not be your problem. I
> >> mean, really, you don't need this patchset in your tree at all. The only
> >> platform which needs it, the only platform which will loose something
> >> will be one specific vendor. Therefore this will be an incentive for
> >> them to join both discussions and upstream development. :)
> > 
> > How would they fix this besides upstreaming support for unreleased
> > work-in-progress H/W?
> > 
> > Haven't I explained this several times already? :)
> 
> Either that way or the same as Will's doing but that's not my question.
> I understand you flush the queue of your GKI patches to be closer to
> upstream. Reduce the backlog/burden. you can achieve your goal by simply
> dropping such patch and making it not your problem. :)

git reset --hard mainline/master   # job done - tea break  :)

Seriously though, we wish to encourage the use of GKI so all vendors
can enjoy the benefits of more easily updateable/secure code-bases.

I can't see how pushing back on seamlessly benign changes would
benefit them or anyone else.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
