Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F6111A830
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfLKJt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:49:58 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45139 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbfLKJt6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:49:58 -0500
Received: by mail-qk1-f193.google.com with SMTP id x1so19049736qkl.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PRwWqEm87Y3mE+uDRr8vd75sWvjuh4jzyEbcRDVDPx4=;
        b=NGxnBlnUBU9MZY6JcoPMSiAcTl6CctG9SGAryIgpUmRH4wVo3hFfsJmZy5/OVcmS9E
         f3pzCS7ALmIjBCMUa25XBuPlbmkrvZWfPTc9dS9BJU7hUTzQc5YTZdphnGXuaLUC8Bls
         WEOgdA0HVlcz2sfQgFgCmlIqie0NiGd3sDNu4GxnMEw3yTFBINZqbHZE4o2qU8ElRU5O
         QoqaQ2wRGhD0JZsNc6b50/oMtIDQzQ1FcgsRcAjQ+891vZ1pye0v1DyxPRYE0zH+hlM2
         rgnmcjUB2bG+8vQhK0Bjk2MKDgZ033dZpuXCiBOjYUuejaeHSEdcZu8nlgqxdsweUgM3
         4VUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PRwWqEm87Y3mE+uDRr8vd75sWvjuh4jzyEbcRDVDPx4=;
        b=BOne015P9MFWhzPFmOVq40nv0SfCPh9z+iohTYMZgjZiCsKt5dD6z3hGynStDxVn7o
         NW0uTxIk/KZDmEdbqbKnxqpalBhxpmLOrjbJvpX/mo445elqjXH4vqNZ6us8iyki/D8U
         GMoWdg4pIR7+w4qCZh+PvxFFYyaw4DFWXnbq8d/QFzNlObtOU90tqoT3KIIn5a6drM78
         dMR6fWx0epA2SNLr+OtjoEmYXDL2pPXRRgLmKFoiW5BRNTAbVa1gxAIPCD7OPrDUU8BD
         2vGdvYEIYWpAGhuZqQtBe3tJgIljH4SGxetSxr83djzi460gYLZxYcxhzUOiRECyS+fR
         wRlA==
X-Gm-Message-State: APjAAAXSzCAyWapP0E2HfF9f/2GcaQlRfsle4xBSXW87mxYtr9Vk7Vzg
        xPsoR24pXErBOWsF2MBYH2E52rp99kM5cQqxbp4RQA==
X-Google-Smtp-Source: APXvYqxfwglLC4+0DY3VebT2ECUqA58KLRPhLdRFcoylVtGuAcyVgCmxa5/YkyMwuuQ6gpaN69RU+WrirGG4K5+bDnw=
X-Received: by 2002:a05:620a:136e:: with SMTP id d14mr1804213qkl.263.1576057797605;
 Wed, 11 Dec 2019 01:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20191209123545.85309-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191209123545.85309-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:49:46 +0100
Message-ID: <CAMpxmJVV8iHiz7CEmcYq9QTMGR-hgLE9k+Xg0K4ZZcrHaCatYw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pca953x: Switch to bitops in IRQ callbacks
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 gru 2019 o 13:35 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Since we have driver converted to use bitmap API we must use
> traditional bit operations (set_bit(), clear_bit(), etc.)
> against it.
>
> Currently IRQ callbacks are missed in the conversion and
> thus broken.
>
> Let's fix it right here right now.
>
> Fixes: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>

Applied for fixes.

Bart
