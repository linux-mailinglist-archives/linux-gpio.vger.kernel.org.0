Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E7290AF0
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2019 00:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbfHPW32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 18:29:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36071 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfHPW32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 18:29:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id u15so6619504ljl.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2019 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UcIQ8f7uiCgBRDYQZgvf9BdkFXQfiqi4Jnab8kvYofM=;
        b=DDD0IAvtj0S3l02ltQU8EpNBnZXa/LPDRrS4ggAiitlDhWaKUUJDCnxA9iSvTLf+N9
         JZWiD52Bcwo2O1maT+VX7N3rDWG8fv9AAnOB7/f/1WWnGc/YMMnbRqLO9qyo/efPOZS/
         Vxx/aIR67dEPcfQpYYXixqhhM2QH0AZsUyogKTjNIBdasiZlwTXiIuexbtky0AZxHq1T
         3xYzXlFudhl39/1Zhd13U4fFewgwdGqBUSj1kW090KxlTnaKJ+VLSIzpIwgSbpiVNCJI
         TdAtYozC06bsrgLh4jUhwGe7flg7gHfJOcuhikauTII5mO35xtcuLhNYkNBH3dVA5HrL
         rYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UcIQ8f7uiCgBRDYQZgvf9BdkFXQfiqi4Jnab8kvYofM=;
        b=qK6B25TIYpT7awtKMA2BC4Wk8tfEq3cbExQB3QyTM7gYN5uoMBtPuFEl8GbvQUzyrg
         kLe3xfXaR98tAvdXJV/JxEKxufZ0fsKaDbCE+ySHLsC4gUJ1QfJJa7qiCVyj97pc91xB
         S89eqeOZ7PiykWH67ZOL74W7ZlwHyYnNKxjZ1BgPZupmol8jM4s7dZnTwgD+EIIcNkLM
         M5ZDPRlIm/Hw9oKqFXPi3LjRNLLgwxdRvaBFwry5sgWS7G/vDiHadXtahE4yOE6qYWf4
         sE6/xZA02Hn1JZgMwgbQSojvCVx6QEBb91lBT4qDlFCwHJHwNqP5MXgiHoieRYcyhEmG
         nQtw==
X-Gm-Message-State: APjAAAVgk+TTsVZsSOnVnEkea6tYGF+uQhExypNpUPHpaQLOKGFwoAcL
        74rxHHroKV1qfoXwJCfkegoXsndtjSi4D+kYrEFUWoSa6jY=
X-Google-Smtp-Source: APXvYqz/Um0VpLAdA90TWsPCo26kbKDPeGImTYJpGVkwKP0ZHIykSPf1mpDFbizhE48JPVnKM4VviobMERdB5LF39uY=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr4644548ljg.62.1565994566351;
 Fri, 16 Aug 2019 15:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190816165000.32334-1-andreas@kemnade.info>
In-Reply-To: <20190816165000.32334-1-andreas@kemnade.info>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 17 Aug 2019 00:29:14 +0200
Message-ID: <CACRpkdaVHPFgw9g8D=zrYECO5Syk1kMT3VgL+wq2ebKQxg_FGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: fix Freescale SPI CS quirk handling
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 16, 2019 at 6:50 PM Andreas Kemnade <andreas@kemnade.info> wrote:

> On the gta04 we see:
> spi_gpio: probe of spi_lcd failed with error -2
>
> The quirk introduced in
> commit e3023bf80639 ("gpio: of: Handle the Freescale SPI CS")
> can also be triggered by a temporary -EPROBE_DEFER and
> so "convert" it to a hard -ENOENT.
>
> Disable that conversion by checking for -EPROBE_DEFER.
>
> Fixes: e3023bf80639 ("gpio: of: Handle the Freescale SPI CS")
> Suggested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Good catch! Patch applied for fixes.

Yours,
Linus Walleij
