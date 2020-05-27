Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24F11E4202
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgE0MYW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 08:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgE0MYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 08:24:21 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC89C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:24:21 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id z80so24118167qka.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TcRHTDl7vi2xUVpvs1kiVii1xE4jxH6moTjCyvelYJU=;
        b=VthgRZZg6WXTHR1uqeh658/rtCioMgPka2eTVwCTgVdit0d2y8KfZTbXbI6eAr45EC
         MN0lPYcZPvEh8jDZR4seEQP81MzABOrbyQ0lUjaTKo2M2vOS3jBP5EcixGNRTth5lL0S
         qT2yOcFoJW0NaBYqXnBwoH+U0NX8wAOh0QkssRZA8hYdrugCyjZhPCAPHFwkjNbuBzIO
         yn0YEiOhNpzUzgGEtpVDfVflGf9hqcjTcsTxIbcMzh2fr+16BqQnd6xqTKiv2Z0osM01
         bJjjYib76TAXMVakKT2Iay/NXamEsAYoUtnTAf7+6ZEPvndjyI+6t1n3/8V0atVQIN03
         SQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TcRHTDl7vi2xUVpvs1kiVii1xE4jxH6moTjCyvelYJU=;
        b=TZsyeq1B/mmKyAbO8pz4zZEOK+uWmwpKp2tmwaZA5F7xd4ggUGiKFxEnjEh+tqbODM
         1nyhLiNZ7nuEKEkAYkLVJzUf5K9PDaN+1kqo/GWKd9tp2JykwHxI+AmZNCbCazFgw4Bb
         8O+gospcNax7JfcT9N74L/hHz6nvim6mwPxSKAilCqxTd/2MgAp7G4JMaUfS1Le37Pyl
         bEPC2Ak/l3P9knp5tqZyRobPr/QdJe757OQjHsJOua45ppgQhlJ5EexOHuYk5xYvgPFV
         VTR/U7PRWSyl+tB7dmYvjEDBNWaUoyBrRyX6fhBBG6LWpOc3crRpvHBvIqSG+YDOlD3z
         TjTg==
X-Gm-Message-State: AOAM532Bh4wK07864jw2rbAuvmXVU9c4veRIcuDmq2+mCjF6CbVmlq7P
        tMaflyWcvd2nCoxU5FMLJsljEjNH7x3uSMJZTho+wkn/
X-Google-Smtp-Source: ABdhPJyq03ER95OsQv6cUtUFsHwAMqMKQHKubMMRuCLafkK/rDiwa7hjXRjGxeI+DHgOmefUQyuDaspMIbQKVXLZpV4=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr3551114qkn.323.1590582260455;
 Wed, 27 May 2020 05:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200525194028.74236-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200525194028.74236-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 May 2020 14:24:09 +0200
Message-ID: <CAMpxmJWEVrthte6y-aKmqYxrjeOnL=1XRUEHaiyF1E9my7fyLg@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Separate GPIO_GET_LINEINFO_WATCH_IOCTL conditional
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 maj 2020 o 21:40 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> We already have two conditionals inside the outer one to check
> if the command is GPIO_GET_LINEINFO_WATCH_IOCTL. I think it's
> time to actually do what I have proposed in the first place, i.e.
> to separate GPIO_GET_LINEINFO_WATCH_IOCTL from GPIO_GET_LINEINFO_IOCTL.
> It's +13 LOCs, and surprisingly only +13 bytes of binary on x86_32,
> but for the price of much better readability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Well... fair enough.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
