Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8962FA1DF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 14:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404661AbhARNlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 08:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404707AbhARNk4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 08:40:56 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB90C0613C1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:40:06 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id m10so18249378lji.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agRpMrek+Sppj7GIr8oRcD/VoAZuQ4C+XG8ubwmjo4k=;
        b=rocze4a/cGqaTl37flewv1kZPlkcZC9Q9GsT3LiMVLV4JD2GajATAopnT7qRD69wU4
         m0KgxlHf3pEq/+MUD29LiuAm+v7BInGssiPywyFKZkz16/+AWlEv13Nt2YprofI2SVxs
         nqlrR7i1XvjYhJJlOeMW7jiRbGy5/e4u8Ed4srNbFCH7mMoCFXr4aFVuQlfSkGbAN5zY
         HIk5z8BBJ+iis8mmOm/OYKMatP40OzQH6ziMc1219ug3iLjnjZy+6LcLmj39a4qZtSUU
         3gJdT9ikQ97hGpsCqXtr924Fc6VPbm27drkGXsnsSrIpheyWNp9j7yP+v+nPjYDPfE/s
         piwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=agRpMrek+Sppj7GIr8oRcD/VoAZuQ4C+XG8ubwmjo4k=;
        b=pakbDBekyDQQ/168+b1NqOQ6btUMgVbF868q9xp2JA8UZfdLeIM8qOFzsZNZqiMHZ3
         KGgwAAocU/n8fnFpRWovjuy9n3WfaEY5Sie8lXvr1MHIVKZ0JYhjUQs7YX6oPo/deWu1
         Mqk8FBy7For3MQlZVTyd9o7bbOlSOFoFMKM3Ooo0D9TncnfaG8ITy6MG0Cjd99r4ydDP
         fxv2/+rCBAoxWPlTHnTcBKLIjaJ4sidRVBGpIzUwNf3x9aMK2fZgjZWl14O15I4SQPGK
         2jSYss68York2Bv914eY9yeAKLnzHYy3cFBjwQdS5zu5dWs3X5yvrgz04s9YLf2EefyS
         efRA==
X-Gm-Message-State: AOAM530VgcN+Vo5l9dW6o9yw3JFVqRDnKSzDBuuma6wKmvn7sO2bSRY2
        J7ctya251Q+Ah4Tuyb44Rs3rFYnUvQHnsserbqeXjw==
X-Google-Smtp-Source: ABdhPJwAvKK/U4EUCHlui/R7DHrDRKoSCCyv/UBKJaKwItG3nr4+TGKZ/eoC10L2NTt8VIP1H8+TMonSXEUM/aAoSCY=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr11263570ljz.74.1610977205079;
 Mon, 18 Jan 2021 05:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20210112133010.21397-1-digetx@gmail.com> <20210112133010.21397-2-digetx@gmail.com>
In-Reply-To: <20210112133010.21397-2-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:39:53 +0100
Message-ID: <CACRpkdZunRyQhWcMxKC1qXfO9gni_n_1Hr90C-RA3jSpXcOYzA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: tegra: Add dependency on GPIOLIB_IRQCHIP
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 12, 2021 at 2:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Add dependency on GPIOLIB_IRQCHIP in order to fix driver compilation.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
