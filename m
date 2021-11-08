Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD8F449B26
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 18:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhKHR6d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 12:58:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhKHR6d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 12:58:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B10AA61994;
        Mon,  8 Nov 2021 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636394148;
        bh=OYVD+yF4GqAl/iyWfJTVCcMZnqTl3R3OTOp75lIVb5I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aaDGWltXDERpr9s6ruTG1YdI5olyXUVRUf3PiEuOrAd2ZejLdWe5Y2NGs4KEwBDxg
         jJzLGKwPxbMq8QA53S2aLCK7abVu3VLq41CL0Sk+856Lf4NsyJQDhxRQB4zUPVprB3
         WbTBkT9+I5fdAdEKqsUFj2+Pn7+pewxAN3qGh6x81+ndI8Bg4S1uopDvUB66xOMKuM
         RAU4y6yffvc4Ke1FkpgptduDAuKSRvF8diw1MJUTCbrKrmswYpdwMuhujuc8oxfyUb
         KGv2IMTc+iYKDHo4w0j0hlxm0z0tuqaQQ+q42dljnOTb65s89yDpiOZ0DU0CngefoV
         FCBQw4nPGIzfg==
Received: by mail-ed1-f50.google.com with SMTP id c8so49093348ede.13;
        Mon, 08 Nov 2021 09:55:48 -0800 (PST)
X-Gm-Message-State: AOAM530KhbqUiOVRX7sAT+vtvn3DU2NFzL2riIfOKoAeYW+NjSNPEyIY
        T8HXUq0EeALmGrKGmume/UdW8uONI/KhHGWsYw==
X-Google-Smtp-Source: ABdhPJye7ckCKLbYwwEcxwCvNhbBPRTK028g5dkSxPjZCrulB4a7/qRlAze8lPSC+981XN0NIraCm3W4A21yAtY93Lk=
X-Received: by 2002:a05:6402:50d0:: with SMTP id h16mr1250991edb.70.1636394147216;
 Mon, 08 Nov 2021 09:55:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com> <637f8aa5f1d65d54c90ed165c2476c32dff53c26.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <637f8aa5f1d65d54c90ed165c2476c32dff53c26.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Nov 2021 11:55:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLm5_Hu5tgN7aHPCATt8gk0V3k_1YC4bCiT6c8rp9yUQg@mail.gmail.com>
Message-ID: <CAL_JsqLm5_Hu5tgN7aHPCATt8gk0V3k_1YC4bCiT6c8rp9yUQg@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/4] dt-bindings: mfd: regulator: Drop BD70528 support
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 28, 2021 at 4:18 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> The only known BD70528 use-cases are such that the PMIC is controlled
> from separate MCU which is not running Linux. I am not aware of
> any Linux driver users. Furthermore, it seems there is no demand for
> this IC. Let's ease the maintenance burden and drop the driver. We can
> always add it back if there is sudden need for it.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 ------------------
>  .../regulator/rohm,bd70528-regulator.txt      |  68 ------------
>  2 files changed, 170 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt

Acked-by: Rob Herring <robh@kernel.org>
