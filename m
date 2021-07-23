Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFE53D3CA5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 17:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhGWPC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbhGWPC0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:02:26 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9046BC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:42:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h9so2206734ljq.8
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/f1g+Bd2m3qWx8HKI2UdTdvCSkFMuvtajEPkZseSXo=;
        b=P9WIEootakX6Goscgqro+lI7BeHd2NnvAGsPf77p8dHmtnMv5PdY+XquMleRjOo0en
         N8dQ9HMTolWKMbRpxmESYskXGStw0BdpZAQsqoXuhmojOIhJ53Sf6uQcQjQ9tG2RLPTZ
         DK4DQ5uJCDdpcyd+LAgvJ7+wh7S2b3FoMzV0i+2QMBVGLRM+mOsqIeADs/3lkS4+z1+A
         99y88jczDL0H+qZ3diqcU528DJKCL2eP/9ale4Sv7vMfvEd7WnL0y/xqtS6t8elZqsEY
         MN5cWFh21q1qmIBNQNsH8VgYf4mbUd/8wEympPPSlUh8I046ULUvC167RulQd0mVko7O
         jnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/f1g+Bd2m3qWx8HKI2UdTdvCSkFMuvtajEPkZseSXo=;
        b=BNAjP7+S6a8l677AJDKr/rI/PmYQEJnq0X97HAoVEG0HgwxrW4A6h/sH3D9TMVMOz4
         Uu4V3xdgEhQeFaH36SeUM0B33IsAuVaJvzv05It38EnZj0AM2SkPEIsEulrtXmtn+Klx
         vqS1R586q5ZaBh6HYNayALbIJmyhFbxCnVQ8s1JTuE71FtKJBsmZqD9J4NtgHLXeFjhg
         IF/mtNts3VDhXp+LsPUW5uyMOWR15qz4tsODBHMnVxd4Hh+Me6F17PCWDmer+7c2fewV
         KuHdCA+wf/0/bi7mgLmwsVs2Kb4wVM0pmWG54G7URQ++y59RuOU3dmVnXy41XZjLONUf
         +WvQ==
X-Gm-Message-State: AOAM531jf+ZggTAjrhHUoKLV1on2OLBVYmhb68E8DWhE9WDrwP7S6j+I
        3PBBlsNfJqpU4M7upBquC8p4bJNsIwLx/yUGchVb6Q==
X-Google-Smtp-Source: ABdhPJy1g6Lo0FVctRSfD7xM4QliObCTb5e2mkP+drcrUUsa0a8KNePvOCiQfbXrF4S6/RGLWayNHJSo1qU6BxwNWB0=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr3717379ljb.368.1627054976984;
 Fri, 23 Jul 2021 08:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210701080955.2660294-1-hsinyi@chromium.org>
In-Reply-To: <20210701080955.2660294-1-hsinyi@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:42:46 +0200
Message-ID: <CACRpkdbaeXTum_tpfyoHnaNtS8Kz1JiXtardc8UsRcGRLHO8Mw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for bias_set_combo
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hsin-Yi,

On Thu, Jul 1, 2021 at 10:10 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some pin doesn't support PUPD register, if it fails and fallbacks with
> bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> modify the PUPD pin again.
>
> Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> bias_set or bias_set_rev1 for the other fallback case. If the pin
> doesn't support neither PU/PD nor PULLSEL/PULLEN, it will return
> -ENOTSUPP.
>
> Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: fix v1 comments

Thanks for fixing this up so nicely, great work.
Patch applied for fixes!

Yours,
Linus Walleij
