Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECC23F463F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 09:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbhHWH7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbhHWH7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 03:59:07 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B64C061757
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id a93so32484047ybi.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4LdKTAjdulkWp1Ey9+qLuBWHOHSRlpXXa8uWwlXNjo=;
        b=GslNxTVCcaBeHsIHdetgMcBsNjshjeP/C6kPGlWqGcT78U70fD6TFPTuGye0Chi+x0
         IXwyzql5xIXrd/4S1mW8KoLCeV7ZI3oNe7CNNK0eE6qm5CfB+w5xOe7j1SL+47mRaNOe
         ShhB6r3ngHUOoYI6ZRO+tZ6dF5vniJIKdlrJehAFPO2ehLPLElmTAYxwZd9viBkZaY9O
         VQaJQmey03oZVBDbxJxm16JJqFbgn48h+gyzdxmQaqKcFBVHcPH9yrlysDmXez99T8JA
         XUMhjQSV47tT2xXnrEwjvugrx0bqSBcAssa04Gyqq6xqAku9Z3J/Xrya4U4qDd/V0qkp
         6CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4LdKTAjdulkWp1Ey9+qLuBWHOHSRlpXXa8uWwlXNjo=;
        b=REZTlCtc2DaDdhecK/GLgzFdLd0KIEoIgw8731q7rBsXrwZ1YuuMzBoS6SsA/wsmnG
         yzk60MtOxfomkS2TZgiM4d5wsPuGxS1SXLvi09JDl2jjuRUZHkgnhXBRBroi7+vgWBKG
         fufchQ7Ab6g9qLol/W2BD/iE3N1gvgdxKRaPWfe+hDEb0BtoNn8aq02fT7otV52fNwQf
         HeIuolLPZ7y8CSme3y8cLAxRV1hDL+KPCzzV22BqrxVzXeyguSgMA83YVkyeMsytbGjC
         DHpS4XlG5DUcsA6+cZXfd+cKnE+u1kspfiz6CM+cVs61GlixAqRRov5z4sidXWabmpvs
         rAog==
X-Gm-Message-State: AOAM532vmb1jMZWGMdWs+rtv7Vl4dcoWfgfNZNlLuljfMTe/Lw3PHypz
        GRYiBB2ftdlEN1egUnLMeV/FUsBcMCaziwqNlRHEHQ==
X-Google-Smtp-Source: ABdhPJwjNaJ0hN3PHVi5IZ2QI8E+CCiS9LJzKyaG004QjwuuEnEOsH6ar0YZsZ6ezMCs/rcpcY3iHXosrDILyt8vmvA=
X-Received: by 2002:a25:abf1:: with SMTP id v104mr589768ybi.25.1629705505102;
 Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Aug 2021 09:58:14 +0200
Message-ID: <CAMpxmJVvz8G4XgE=12HVNgcdgwLgWnDY7M7oifBpNT76O2YWUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 17, 2021 at 10:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files") removes the
> config MACH_MX35_3DS in arch/arm/mach-imx/Kconfig.
>
> Hence, since then, the MX35 3DS BOARD MC9S08DZ60 GPIO functions are dead
> code as its config GPIO_MC9S08DZ60 depends on the config MACH_MX35_3DS.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> MACH_MX35_3DS
> Referencing files: drivers/gpio/Kconfig
>
> Remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied, thanks!

Bart
