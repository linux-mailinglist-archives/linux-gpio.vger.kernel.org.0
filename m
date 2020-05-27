Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32111E4369
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgE0NUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0NUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 09:20:33 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43119C08C5C2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:20:32 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id g7so569768qvx.11
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KV6zG4cB1TmvCG+onKER+oAfw/b83fhJrAY9mKJ4IX4=;
        b=kEdFbISxbLAlPlOnpWxFL041LUl3yybQwYa8/qJu8zfW/RMBvv95nieJdalNvuqmtB
         K4B0VQ2ac6lOYqbG4+P6tmbToSbSkL7l9znId/SY95HKrXBqJpgDPugxuBh8pe+/wQS7
         pCn3ui+rJ6v+DN2mtdfnKC+nAF4JwecNz+rs8jn+99lAOp7IolN0Uhqq4iwJI3jo+Hq/
         70lMSRPSD1jkjdpOj1cGufOdYPb/aHCnki+YR9qxBO25C1wxrxx/s9OvzSCss6CDtXpC
         p1vgiPDXuzT3T5ZwbeFR/u93j1s7Ltjc8VV1IN2eJe4weXd26qlRF06/2OsXIRFMh8oq
         V2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KV6zG4cB1TmvCG+onKER+oAfw/b83fhJrAY9mKJ4IX4=;
        b=TmmacML/HWmMkgFujhdX7tAD66CW16S3T1ym9EVso3Br+sijOY6kteo1kUvemMabs7
         zCoK/eFo3n3/pIHRBNPJXr44nurZiIYFPTJ90ACsxPRGIO2w2vLipPyvgUG33TtExe7p
         OoWd+Dff7czA99rTgfJrmQfBYxbCENgWS+3LUryCGP5HwX/4MKqg6pP1AmUJRF34PwOe
         mWCXbWqTzOkSPbh+N4kB1Xe8g4bdnfiIkRMWmB9aujkGrov4VeDx3WdgQLLkRJdnOUwP
         kXeumbWvGJWv/97pvu4En+FhXbSxrfhlElCZPpPW6jKL9SG91+c0tL9F7/8xBd2KE9P7
         ZOJQ==
X-Gm-Message-State: AOAM532E6Rhzdl/qjMhCKFEvyMovZtHWrw0jRSfZiVB/geeKb9wNL4Lv
        a5oOoMUmZz5bMUWVoBX8zSGjOQyK8Zr91HIB00X/3w==
X-Google-Smtp-Source: ABdhPJwzRARN9Q565WylyoA/xCwjE11ERR6pKR3YXwMYcP6ODWIn8ti89n4ijMHzSLO3YJHosprJQlXHqGPNYlMg6IE=
X-Received: by 2002:a05:6214:1506:: with SMTP id e6mr25590948qvy.61.1590585631524;
 Wed, 27 May 2020 06:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200525160741.21729-1-michael@walle.cc>
In-Reply-To: <20200525160741.21729-1-michael@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 May 2020 15:20:20 +0200
Message-ID: <CAMpxmJUMqYxodT8Y_VOkizZ5bTjkQT2i8o9yw9p=BYn-8j0R=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] gpio: generic regmap implementation
To:     Michael Walle <michael@walle.cc>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 maj 2020 o 18:07 Michael Walle <michael@walle.cc> napisa=C5=82(a):
>
> This series is a split off of the sl28cpld series:
> https://lore.kernel.org/linux-gpio/20200423174543.17161-1-michael@walle.c=
c/
>
> I wasn't sure if I should also include the gpiochip_irqchip_add_domain()
> patch here. So feel free to skip it. OTOH if you use interrupts with
> gpio-regmap it is quite handy.
>
> For an actual user see the patch 11/16 ("gpio: add support for the sl28cp=
ld
> GPIO controller") of the series above.
>
> Changes since v3:
>  - set reg_dat_base, that was actually broken
>  - fix typo
>  - fix swapped reg_in_dir/reg_out_dir documentation
>  - use "goto err" in error path in gpio_regmap_register()
>
> Changes since v2:
>  See changelog in the former patch series.
>
> Michael Walle (2):
>   gpiolib: Introduce gpiochip_irqchip_add_domain()
>   gpio: add a reusable generic gpio_chip using regmap
>
>  drivers/gpio/Kconfig        |   4 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-regmap.c  | 343 ++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.c      |  20 +++
>  include/linux/gpio-regmap.h |  69 ++++++++
>  include/linux/gpio/driver.h |   3 +
>  6 files changed, 440 insertions(+)
>  create mode 100644 drivers/gpio/gpio-regmap.c
>  create mode 100644 include/linux/gpio-regmap.h
>
> --
> 2.20.1
>

Both patches look good to me. I'd say we should apply them now and
then fix any potential problems during the v5.8 release cycle. It's
not like it's a user-space facing, stable interface, we don't have to
be super careful when merging this kind of stuff.

Bart
