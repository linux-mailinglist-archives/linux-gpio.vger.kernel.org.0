Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0652E975F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbhADOf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbhADOf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:35:56 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86D9C061794
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:35:15 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l11so64847333lfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TW153X6XO9OWKBuH8iDs0QiesX8TZcvMA18Jaw2lPzI=;
        b=QAcI3Q0PwjNBSMYaseEDWAXJd48p4nJWuHBuC57Dh2wbNECEpZ8v1n3ma9cEUHsifP
         l6PyhnpABxu+ZEyh4ShP9UP0TocCyKzLKs6L+Yoecuu211+k1EzFF16AU5+DwB2jgwx4
         Gvj37ZpGaiCB/AHYLHMZSby6oNMwqVAXLrYhLoEaAZCZtNe2eNCddjoeGuc+ttJE5R8O
         hL24CvNkjDqkRrFj+gAkObq8JZ2aKOcekP6bieuIWG+20EO/Vdz9WS4NJFp+D/qBf74x
         LqYnoq1NDXQTnS/KbKN74dX5PgEPQrSEuNjt8S0+d/lGanE3GzZE1io6kAIu1IVIXpVx
         7g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TW153X6XO9OWKBuH8iDs0QiesX8TZcvMA18Jaw2lPzI=;
        b=lxNTmVcvJTBY9aeBGqeQyg1NhQ1NFx9v7Rh07IEKVrhgZK/UFoTJkRVtIkV8MPEc53
         meOxl6LGJXtu9YH4oI091MYxB7NmU+9SYfQnjDNXlt1O8YVPaYf+sx+vk6Y2i4RAoQVF
         ubKd4+s19cN4TYuVsBPjEmXn7mCmL6wNnwUAgiw7Kq8+v3ZU+NMjxGhjMevUnGuS8MbU
         vD1qc0ovcOVJ9uO1dbooQdcMpSv8uibyKzPgTRGm4rbI/8IcQGrw38IlLzan/XolbbzQ
         14aMGUDSMxkP0Xr/DTgdvgV7Y6lkAiv4lzzcFi8zFxgQoPYQd+XsTDtHm4f/RfTo7m3U
         6h9g==
X-Gm-Message-State: AOAM5329v+NBLVqNcp0pPKJTEkcMOXbEdGkupFHk99BNuisr5G0FKs1Q
        A7QF5O5h16uRB7ejcTv+wP8WuE1w1wCyMjZCBE89jQ==
X-Google-Smtp-Source: ABdhPJxKKwIfJ7cBntoH60b53iHiOWb2o2pCowqmRBsVj8VGsF5lzhrWnRdqyyabKFxJPD9cqkqzfLGgJNQQraxyX+k=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr30618212lfd.291.1609770914213;
 Mon, 04 Jan 2021 06:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20201211232810.261565-1-paul@crapouillou.net>
In-Reply-To: <20201211232810.261565-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:35:03 +0100
Message-ID: <CACRpkdYPN5fhpWfo=hsK3Qut_a0P7KO3cTv=znJfH5OfvfJ6QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Fix JZ4760 support
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Zhou Yanjie <zhouyanjie@zoho.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 12:28 AM Paul Cercueil <paul@crapouillou.net> wrote:

> - JZ4760 and JZ4760B have a similar register layout as the JZ4740, and
>   don't use the new register layout, which was introduced with the
>   JZ4770 SoC and not the JZ4760 or JZ4760B SoCs.
>
> - The JZ4740 code path only expected two function modes to be
>   configurable for each pin, and wouldn't work with more than two. Fix
>   it for the JZ4760, which has four configurable function modes.
>
> Fixes: 0257595a5cf4 ("pinctrl: Ingenic: Add pinctrl driver for JZ4760 and JZ4760B.")
> Cc: <stable@vger.kernel.org> # 5.3
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patches applied for fixes, sorry for missing this for a long time...

Yours,
Linus Walleij
