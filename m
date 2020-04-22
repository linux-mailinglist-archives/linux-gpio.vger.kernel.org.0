Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E06D1B3B7D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 11:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgDVJfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 05:35:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:38670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgDVJfI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 05:35:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FBB52076B;
        Wed, 22 Apr 2020 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587548108;
        bh=5DNBkHR6a+WVtLqdbWXqDmcSPGo1U6AntaC8sObehFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IoecbU53MGHU4OIbquC13L8j+2LL3jXiSkDNYkI3LvP3Y10smFBzY5WmEkRy7npAz
         RNOFynyvWuaqMOctvCNmFdqSjX837qKSiX1XDaX2YCQrP3UEiRHY+tipBTJVFawHUP
         ARfRcyfM6HeUv6bogHBFQq6LYoG0he3xbL6z8MbU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com> <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Date:   Wed, 22 Apr 2020 02:35:07 -0700
Message-ID: <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Pierre-Louis Bossart (2020-04-09 12:58:38)
> devm_clk_get() fails on ACPI platforms when a NULL string is used.
> Create a "sclk" lookup to make sure codec and machine drivers can get
> the clock.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/clk/clk-hifiberry-dacpro.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiber=
ry-dacpro.c
> index d01a90fed51b..36210f52c624 100644
> --- a/drivers/clk/clk-hifiberry-dacpro.c
> +++ b/drivers/clk/clk-hifiberry-dacpro.c
> @@ -24,10 +24,12 @@
>   * struct clk_hifiberry_hw - Common struct to the HiFiBerry DAC Pro
>   * @hw: clk_hw for the common clk framework
>   * @mode: 0 =3D> CLK44EN, 1 =3D> CLK48EN
> + * @sclk_lookup: handle for "sclk"
>   */
>  struct clk_hifiberry_hw {
>         struct clk_hw hw;
>         u8 mode;
> +       struct clk_lookup *sclk_lookup;
>  };
> =20
>  #define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw,=
 hw)
> @@ -121,15 +123,34 @@ static int clk_hifiberry_dacpro_probe(struct platfo=
rm_device *pdev)
>         ret =3D devm_clk_hw_register_clkdev(dev, &proclk->hw,
>                                           init.name, NULL);
>  #endif
> +       if (ret) {
> +               dev_err(dev, "Fail to add clock driver\n");
> +               return ret;
> +       }
> +
> +       proclk->sclk_lookup =3D clkdev_hw_create(&proclk->hw, "sclk", NUL=
L);
> +       if (!proclk->sclk_lookup) {
> +#ifndef CONFIG_ACPI

Is it to save code space? Otherwise the ifdefs are pretty ugly and I'd
prefer we just call of_clk APIs and rely on the inline stubs when
CONFIG_OF isn't enabled to be optimized out.

> +               of_clk_del_provider(dev->of_node);
> +#endif
> +               return -ENOMEM;
> +       }
> +
