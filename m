Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9761E3034B3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbhAZF0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728630AbhAYNKb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 08:10:31 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BC7C061574
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 05:09:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id i187so7356596lfd.4
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YeRHqNmrouDWJP/xkxDkX2LI+peKn9k+q09qI8S2TU8=;
        b=dRVZmgfvGhNAzk/IwBG53sc+pQ/aIk70Exr8NAd5htfE7TJ870KtfGQJ+l+P6uCCE4
         /+B0cXnGctt84l20uGzfNPBJctSj8oXCYK+wGlTIm0yzims6GZ1aOY7iNP8cXqxVn5Bt
         jXJt0MLcwgi7Ydvx8am7ngO0e0b9WElQkR3hWotojQqRyoejRV6WtXULC3bAAdJwve1A
         bqiBs7ugsUPTjkQVNzh8sz7+33Nou6rMmH1/l7u8jRQJyKighLL3qfSN9b7yPSnzmrwH
         n+vgIoKr4txjpEO3dmQA3FAz3acdb2P/vnz+sIwaKxlc4YoW5iRw+/n4iO6+KnF5+i0b
         LXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeRHqNmrouDWJP/xkxDkX2LI+peKn9k+q09qI8S2TU8=;
        b=VyEU0JyHTwsX2hfZFKTfZNQFdnHfDFrHMq5AmlyIa9CtJFbWBQXzGmgR2b3dBeA2QI
         AU03x1LVdyzf1/oKoXUHHfC7HF4WAEzCwljfWAZG3FMujCQcvkFPcokNKZ9+mygFax3r
         d06Tk/3247sdMvPs/h9WBW1MpxR3YT1RRkl0rt3vmRliQnYswGONB6/lTYRP93j2FDts
         eXa7l4PgWPUIjOZz3sS2/ev33nAELYFiz08OM1idWHLeGxA3RI8n2D71k7j0f7tGrFck
         5m9ADyx2MzRxdPTdxu1usTwlYhbiX1OIkxGq9JYNICIV3nJs1bifcJuYQqEJo4H7Ct88
         tLFg==
X-Gm-Message-State: AOAM533GOgSiBPkgw+HdLKYvF5V7X6Bo5TmG6UBMPiIz5Z5621l2t152
        NePbHdis8ENheLOkJFym/v/Aja9qL1g/bcqlJus2yQ==
X-Google-Smtp-Source: ABdhPJzro6MMf5skyu/xHZKuqomtw3z3XDeraz1uFn6qnVK7gkFAUnggvPcpKtvVQmySxqcXpRINt7L7FwdHXrWZ3HA=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr249156lfl.29.1611580188141;
 Mon, 25 Jan 2021 05:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20210125031946.1882-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125031946.1882-1-hailong.fan@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Jan 2021 14:09:37 +0100
Message-ID: <CACRpkdZV0dgqsCn1Ke+fy8W4eA0Eg9ksW-NJLp2AbLv8_j37qg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To:     Hailong Fan <hailong.fan@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com, chentsung@chromium.org,
        gtk_pangao@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
        yong.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 4:19 AM Hailong Fan <hailong.fan@mediatek.com> wrote:

> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.
>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Patch applied for fixes.

Yours,
Linus Walleij
