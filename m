Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687432EB56E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 23:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbhAEWgM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 17:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730727AbhAEWgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 17:36:12 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9B1C061798
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 14:35:26 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id h205so2237605lfd.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 14:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ahZlAn0+MJ2JO85Il4zqrFNJA3yrxvXOMtixl0o8ZDM=;
        b=xuV05iXPoA0k4FUH7uDKhum9x67A5+g0WrawAcxr+1nwNNKfzDFFhw6RcXhGVjrdAG
         DIPpNcT0tMeqTolY+1UHSqvl7wF97ndSycgqsK5KNZXYOFouXEAZcmV0db14uxPi/xTw
         fkiZrDeIfCVzxFPh/s6f5MjQjTE3FbzD//H1CaneHnQ65EKqNmVFIkbD/Q8s3qRbnfpF
         oeHplvWvkyArKkqqQjholOIaGROH0SMwCIhye89WnfvVn9lg7Rsy+dje5qrZY0xghJSO
         IVRZp+VQXtSVeFeCiWvHmfOs8HhPvx9IfbltAGF1/00sbuHYdVKbwxTKfWFe05h5vvVQ
         dbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ahZlAn0+MJ2JO85Il4zqrFNJA3yrxvXOMtixl0o8ZDM=;
        b=kwsiLfoYDk37c4uVROZcRtr1FggQuOtcgc1zFgPBa07zVa+mwmnhV322m1Hbm3fie3
         +ZeD8R5An6sC6M4X6hyRJ5LzETmNVt28mGRHKaC8zwYJjVvXz9qMcXRWeyQRA9CYe6gW
         QH73ZqtMo/upi0Dr5CiiZaSyfPGv2kE2nk5RyVvqaCq9sFsyT4uFidNsDBmi5TR3HmWX
         n3ti3uY14jy339QQHjVXiDuQU1wl8d6yRtH4qo7i1G9lxTuS1fXRroPpUvye3QOpYCCx
         bodDOWvzlOYqnJHlk+0PxRuayQz1ro3rvxgnm9klEcfyFbxMRWRRfLshrZJhK+gZxIAI
         EK7g==
X-Gm-Message-State: AOAM530qZB17vJACtzokVZXFu0J08VIEwRH+0d8wYC0uAN4HwY85nLqE
        NlkndDXu7uY/wJC72ouGrUIX9lSpiDsU84szJoBBEA==
X-Google-Smtp-Source: ABdhPJzKIX1tyqxO7DBuxtMjhEds0Yt3Gvxf2kvrIu6dSu4kg7r3sapM7iAm3kjKr+iyrDzk5lF6EH5VLy/XUJEFifg=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr800336ljj.326.1609886124436;
 Tue, 05 Jan 2021 14:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-3-samuel@sholland.org>
In-Reply-To: <20210103100007.32867-3-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 23:35:13 +0100
Message-ID: <CACRpkdZbNUxizfV5Oo8F8b0bsjNcBF6JfP=ufykNLeqErvU-ug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 3, 2021 at 11:00 AM Samuel Holland <samuel@sholland.org> wrote:

> As there is an RSB controller in the H6 SoC, there should be some pin
> configuration for it. While no such configuration is documented, the
> "s_i2c" pins are suspiciously on the "alternate" function 3, with no
> primary function 2 given. This suggests the primary function for these
> pins is actually RSB, and that is indeed the case.
>
> Add the "s_rsb" pin functions so the RSB controller can be used.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Is it OK if I just apply this patch to the pinctrl tree?

Yours,
Linus Walleij
