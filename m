Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7BDDE7CE3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 00:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730554AbfJ1Xc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 19:32:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJ1Xc5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Oct 2019 19:32:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 798AD21479;
        Mon, 28 Oct 2019 23:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572305576;
        bh=A8fQbfzf/xn3KTHLUrgLxT6h14rtw3yrGoE4tKSOE1o=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=njFeY8jNMr17taXW5n7D7B1TbGRLyNZ1WuddS1sYMF3NHzWMDVtqgydnxwj9HK2hN
         h8D27nclgyaTCLpKiEsFtPOmT9TaRaE7lmEvAUh4Fz3xRavU/zAoVCYfICBqqa/wvF
         z75fwRjEAFXlQn3DQY9/k5yiROqOKhHaxttIpfFc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5c66ac7d43ae1f57c335b6e565553fe1df703a83.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com> <5c66ac7d43ae1f57c335b6e565553fe1df703a83.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk block
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 16:32:55 -0700
Message-Id: <20191028233256.798AD21479@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Matti Vaittinen (2019-10-24 04:44:40)
> diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
> index ae6e5baee330..d17a19e04592 100644
> --- a/drivers/clk/clk-bd718x7.c
> +++ b/drivers/clk/clk-bd718x7.c
> @@ -8,6 +8,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/mfd/rohm-bd718x7.h>
> +#include <linux/mfd/rohm-bd71828.h>
>  #include <linux/mfd/rohm-bd70528.h>

It would be really great to not need to include these random header
files in this driver and just use raw numbers somehow. Looks like maybe
it can be done by populating a different device name from the mfd driver
depending on the version of the clk controller desired? Then that can be
matched in this clk driver and we can just put the register info in this
file?

>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> @@ -21,10 +22,8 @@ struct bd718xx_clk {
>         struct rohm_regmap_dev *mfd;
>  };
> =20
> -static int bd71837_clk_set(struct clk_hw *hw, int status)
> +static int bd71837_clk_set(struct bd718xx_clk *c, int status)

should it be unsigned int status? Or maybe u32?

>  {
> -       struct bd718xx_clk *c =3D container_of(hw, struct bd718xx_clk, hw=
);
> -
>         return regmap_update_bits(c->mfd->regmap, c->reg, c->mask, status=
);
>  }
> =20
> @@ -33,14 +32,16 @@ static void bd71837_clk_disable(struct clk_hw *hw)
>         int rv;
>         struct bd718xx_clk *c =3D container_of(hw, struct bd718xx_clk, hw=
);
> =20
> -       rv =3D bd71837_clk_set(hw, 0);
> +       rv =3D bd71837_clk_set(c, 0);
>         if (rv)
>                 dev_dbg(&c->pdev->dev, "Failed to disable 32K clk (%d)\n"=
, rv);
>  }
> =20
>  static int bd71837_clk_enable(struct clk_hw *hw)
>  {
> -       return bd71837_clk_set(hw, 1);
> +       struct bd718xx_clk *c =3D container_of(hw, struct bd718xx_clk, hw=
);
> +
> +       return bd71837_clk_set(c, 0xffffffff);

Because now this is passing -1 to unsigned int taking
regmap_update_bits()?

