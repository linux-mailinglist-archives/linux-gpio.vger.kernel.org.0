Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463212C89D3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgK3Qpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgK3Qpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:45:51 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5D1C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:45:11 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f23so23088827ejk.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=csW5Okzb+d7/XjdZG/181RS4HEEQEs1xG8M5YQE4Ixg=;
        b=h3/FN3tNEwWcGXV2ggdTozioW4OHsshyNLkzNIxhIAgHslEqrZbusPw13uCAojgDle
         PYzdLtdXGc0ms8e95nWq9dx/EJ8rIEE2Lxt9A50T4xVx3PR839552Ip2wEEmqaSyety5
         p/whdUqat5UMVHd8EFzzLBiO+vHgNzBx3Kpi68BcRSIfshBxy188sbYUnmLxGIythHd9
         fuL7sbLr5KohaGmRcBoftsC25pZ94lEtoGgF+eP0t0p9s8fwTYhhMWP9itBn3gm8vpxJ
         60M+JFO+J00+xCMl0IZrZ7cNWocfK/3DqQmE0p1LFKF2YBPTSbDFtsngdSYC9n07081P
         uvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csW5Okzb+d7/XjdZG/181RS4HEEQEs1xG8M5YQE4Ixg=;
        b=Re3eIFODgF7QECsbqKO4lqCohKah5FCExV8dtUNY6PYQzxNkKBCPaLZwJtNecVsYzz
         eBSEOpIX0DzJ0C0XTVvf5MVk/q9U563MHNmtzb39Lxpn9S2jz+C/6+1KPZ2/tnWzRH0F
         KcyEg3/zYJAyTV/AAkkeXtko/qr2gEi3UR3mQ8rxp8lvuuxwooO1AyELrVF1t+tjkJSq
         Uz8W4sowWZxm/yp34QtZNsdDUgd4X/Kw1djJygaUhB+xynQM7Kmy2v491s7D6gI/+1MX
         cbM4N8sevhEdbpD05vlJu7f8vSo+jKW81fWBHeBjteiSXPgYm4yIdbQjy0NuPQJa7QNC
         Kgrg==
X-Gm-Message-State: AOAM533jZFlezndQ5T2P5TRJVjg8TcRyyhRxn2+xQ4UXCsCss9x8DvxD
        yX66KMnhzZI1Ceby/vPZIXOpEDUrEu6K2/VBSF/Jow==
X-Google-Smtp-Source: ABdhPJwjKFzcjTHuclSGUXiGSm1TtHMkIAKvy2SN+VYZh3uPCY6M+sZ8EYO2SB68yJoTjWM9CObFbwQv2WXgHapqU3M=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr7191416ejl.155.1606754709982;
 Mon, 30 Nov 2020 08:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20201127094445.121232-1-miaoqinglang@huawei.com>
In-Reply-To: <20201127094445.121232-1-miaoqinglang@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Nov 2020 17:44:59 +0100
Message-ID: <CAMpxmJXxibU_i__GnCOktxPct9drrLKvf4Oo6jpXrhiJWt7QZA@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: fix reference leak in zynq_gpio functions
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 10:40 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
>
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
>
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")

Is this upstream yet?

Bartosz
