Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAB615A336
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 20:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfF1SNL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 14:13:11 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44385 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfF1SNL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 14:13:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id t7so3658143plr.11
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Cn9Q1Wbyl5xIGaCdkoIIaNcFmVQFrY2dwxn3d9BBkHc=;
        b=eag4mvABTu4bMgSKtKRaxm6hxG1BPnj1CEDFDSDsrF6DOjCGrRewpIXSDm7hcqEmzs
         mn+E004mWDj4R879Vf9eY87+iP/Wk2xBwki3jO3juI6uyXY8phyqEjB38IK3ihQKMwMc
         Cd6Llre7Oo/KZXZxjU80RAQo/+53AG/eeK+vmGfTUy39fzItmjufUSdfnyuecNykvLT7
         ztmI8T5bDDvTG2AqW44V6lcm7kOKJs2HrwEU87a23q26iR7Yfzxpm1YAOtsxOXwa6RUk
         moDdV4v+CP9qI3+CevCjHpdLRTZsYlBKjIwkb5sHJ19IF4aHoFmNkJLypftqcz4xfj51
         xVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Cn9Q1Wbyl5xIGaCdkoIIaNcFmVQFrY2dwxn3d9BBkHc=;
        b=gO0Vg2fxlS2Ay9cf/LhQfS3T+fObKHgIktXFTEFTmoKchrwZhAFi4CYV7XPF89X59m
         up5bfYOR5+P7JZQzuV4nK3eN89HKYEWVlufX6kE4bbUhv7eHWfMFx6GSXW3CIST4jqL6
         6viU+BP1NDlbNOWuu86eam8EmJ76LFhhDAycawRzCwrHoo3zMxe+jn8UjOa2yLbvE/ub
         ekPrX59fhFJ1fHVnXbHJVkxmdZMbx+hmgc9Q32f8K+tLE5msya3nQY2aoUt8gHJaAYSi
         cb7wIcgA68D7kKi+pKHfKnkvP6wF9xIO/pI5HZ6OPe5LDkDrIoPB77YD2lrqe+6igH0u
         foGw==
X-Gm-Message-State: APjAAAV+4OUhlprTpqLY2EE6/mda/fJ3DCFke1ppN8qgBqRKA//cK/Lh
        XUsjr3Ny+ipNesgQ6KzW6L/kSw==
X-Google-Smtp-Source: APXvYqyO0DxNwIeVEjqqmuJf6WfYaCTaV6owpC43va2Fglh9hukvx/iaKf2dkMByt/m7tQBZXRWWpw==
X-Received: by 2002:a17:902:da4:: with SMTP id 33mr12037670plv.209.1561745590252;
        Fri, 28 Jun 2019 11:13:10 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id o14sm2675345pjp.29.2019.06.28.11.13.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 11:13:09 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 00/14] arm64: g12a: add support for DVFS
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 11:13:08 -0700
Message-ID: <7hblyhr32j.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
>
> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
> the CPU clock in a safe way as recommended by the vendor Documentation
> and reference code.
>
> This patchset :
> - introduces needed core and meson clk changes
> - adds support for the G12B second cluster clock measurer ids
> - protects clock measurer from cooncurent measures
> - adds the clock notifiers
> - moves the G12A DT to a common g12a-common dtsi
> - adds the G12A and G12B OPPs
> - enables DVFS on all supported boards
>
> Dependencies:
> - PWM AO input order fix at [1]
> - PWM enhancements from Martin at [2]
>
> Changes since RFT/RFC v1 at [3]:
> - Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
> - Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
> - Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
> - Fixed typo in "this the current path" in g12a.c
> - Fixed G12B dtsi by adding back the sdio quirk
> - Fixed G12A dtsi unwanted sdio quirk removal
> - Fixed various checkpatch errors
>
> [1] https://patchwork.kernel.org/patch/11006835/
> [2] https://patchwork.kernel.org/patch/11006835/
> [3] https://patchwork.kernel.org/cover/11006929/
>
> Neil Armstrong (14):
>   pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
>   clk: core: introduce clk_hw_set_parent()
>   clk: meson: regmap: export regmap_div ops functions
>   clk: meson: eeclk: add setup callback
>   soc: amlogic: meson-clk-measure: protect measure with a mutex
>   soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
>   clk: meson: g12a: add notifiers to handle cpu clock change
>   clk: meson: g12a: expose CPUB clock ID for G12B
>   arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
>   arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
>   arm64: dts: meson-g12a: add cpus OPP table
>   arm64: dts: meson-g12a: enable DVFS on G12A boards
>   arm64: dts: meson-g12b: add cpus OPP tables
>   arm64: dts: meson-g12b-odroid-n2: enable DVFS

The DT files don't apply cleanly to my tree (v5.3/dt64 branch).  Could
you rebase:

Then I can put into my testing branch, which gets included in 'integ'
and it will be easier for others to test.

Kevin

