Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F126432C806
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241794AbhCDAda (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392372AbhCDAOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 19:14:34 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BDAC0613E7
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 16:13:26 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v5so40111401lft.13
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 16:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OKu9rvgBil0k6tR4pYyiR6wjoHr0+cu17RpPhjhwkTc=;
        b=IpjtF+K+hruehTwmwGiSLec3MXobzKIJ30Y6ZmWQJunyXLeup+LmOCVT5Nxumb+LXq
         qIRGRRxLUv+vvqSMVM5R9D6dxubkhFTO6ayZNQiAMtwEzLbswTymeuz7Ozkv4oCczk6L
         CGKaTot0aoO4H5QxO/3lg7K/snPxuWNCpZgTFKt9efgx5VmtbYn+223I0yjuc6ElJuPU
         +NqBvtxU4Fd36vrsMJUY/djET0UEYnRbDdxCcq8eA8dcqpZvIerGhwjHFU6iNyiN/wcM
         Dfz7xc117A/msLNFmaaR9w9LEAC7eSVn0DOmpNIbhZkJuce2a4LijAnAwOJRk8s14UWG
         rKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OKu9rvgBil0k6tR4pYyiR6wjoHr0+cu17RpPhjhwkTc=;
        b=K2E+5zBfn0XHOYhv0b+DSZ4kcCunE54YtlATZet4Fodq1950061uA2xCAbuIUVONMk
         HNecLzxauow66UP3VhWOaN+skImtOeGSuUbObR8zylqJt9BO9ENTvTsy6JUV9zlxDB00
         waqKzgwDqjQrYAUtZClAM10tV1JWdKaNdqoB8bPUDpNdi4qiMWgmMkG4C2KCaepH/mXw
         lIYKXAafV8Al4PfI1mLMf1Q82XrvXiim6tL/w4dhhiZh8gXDquuwUweqY7gjc20EKRI0
         dQcspEgmlnMGtdFA+D4hcA3myt0opJao7v8wc5n4CItxKm/C35Y3gyC5OWPBKandK9lO
         WA1A==
X-Gm-Message-State: AOAM532XcZnXXILN7blxEiHcImdafxoh+8bptosUGx51mfgfLfsL9nsQ
        0px+Lj9y0nflm2xxll1qgAYaIuxJY9Ddxv4QNprIeA==
X-Google-Smtp-Source: ABdhPJwUF1F8cAZ3I10nUfVKg6JQz8+hWV9fUNGUsjQoMGB56CK2zNgX/OcKAfDexLsxS2Tm4fxqKsRx+PeSf7Mqulg=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr709694lfs.586.1614816804951;
 Wed, 03 Mar 2021 16:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20210303142310.6371-1-noltari@gmail.com> <CACRpkdbi77SBsssMOnx43fP9RgqnzkUUw=TXaE2_LDexpE2WEg@mail.gmail.com>
 <D875EBA4-F881-4F1E-A251-78CEF8E6A40B@gmail.com>
In-Reply-To: <D875EBA4-F881-4F1E-A251-78CEF8E6A40B@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 01:13:13 +0100
Message-ID: <CACRpkdYPMT_D=pKau1c9Df7rq9gwVGtA8ZYvPHDYU6zO-y+SgQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] pinctrl: add BCM63XX pincontrol support
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 5:23 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> Or maybe we could guard these lines of gpio-regmap.c with #ifdef GPIOLIB_=
IRQCHIP:
> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba3=
70f797/drivers/gpio/gpio-regmap.c#L282-L286

That's the best approach. I wasn't a big fan of this ability to insert
an external
irqdomain in the first place, so it should be as optional as possible.

Yours,
Linus Walleij
