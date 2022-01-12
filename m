Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504BD48BEC3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 08:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351073AbiALHCY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 02:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351072AbiALHCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 02:02:24 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4604C061748
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 23:02:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s30so4762161lfo.7
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qPlvZ7SgaEi0S0R2Ekpno8fmedH18d4jSr4icAzwWOE=;
        b=TdR+xGF+2F0wNO02bRUsRfwz/8CbD6jzJ4E9pT7NuZrDanOybqP6w47UXHAfz0mldv
         DJdsVkYfNjB+vP+swMqx0mViYs76MGXFC9VbWbnzG6BpTXEftkZp1rIhnSsw7LTMM85V
         YXOnBqnIVvIKLjqrJ7vMq6UiXZxw9GaIwvo7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qPlvZ7SgaEi0S0R2Ekpno8fmedH18d4jSr4icAzwWOE=;
        b=RsP3a41zslMzKDtkIQsBc9ChxuE4xYYTEJWL+ngmu4pQaSRCiuEMwrNr/wZ/7QnmLR
         ywkPZYDWxxL4y4T91CF6E2sdQXkRH8dmp07xLCUwojZ60lUGLyQf8OUwK0UpJnpZHLmj
         fZQRDtlZDqVbPeIOjfJ9kw5u++IONdM2qHpj5/iuTRI+oLgNt4YTj6tnQL2F8ev1f2Wa
         mNUNy2tZ6C59fETiDxG8g4cFFu7Mzd7dV32O47742SuxtaOUe0V5RWxMduDfTQxZS/1S
         gk4n8aJcJYGBLh2pbkSptCmEUPQJvJQGRuHeifA1/t6dpaN0e8/8GXMHVZU8kH6Uq1ZR
         ovvQ==
X-Gm-Message-State: AOAM532tRmuVnzcOk65Ig5GD3r77lJwt/h+I3qTbzn01Lw/ZaV7e8nQn
        dmXeIG6a8in7rt//CZoctovqcZU/z2qu/h/EbY2K3g==
X-Google-Smtp-Source: ABdhPJxXvYqx3G6aIa/2DKUhp3bz33YZPpV3/zrmpMFnHua1Juqcg44GELc9DoNFmlb2euiiasfXIykUXtIFH0KZolk=
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr5945256lfd.670.1641970941956;
 Tue, 11 Jan 2022 23:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org> <20220111112244.1483783-2-wenst@chromium.org>
 <2dc957b1-300f-161c-edb6-efacf11942e0@collabora.com>
In-Reply-To: <2dc957b1-300f-161c-edb6-efacf11942e0@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 12 Jan 2022 15:02:10 +0800
Message-ID: <CAGXv+5HV+Ca74paF-L54owyCBtBwTNU0r2aT7drjmBxo2dV=uA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl: pinconf-generic: Print arguments for bias-pull-*
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> > The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
> > parameters, accept optional arguments in ohms denoting the strength of
> > the pin bias.
> >
> > Print these values out in debugfs as well.
> >
> > Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Tested on qcom-SC7180 Trogdor, mtk-MT8173 Elm, and others;

Cool! I'll take that as a Tested-by tag.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
