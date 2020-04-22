Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D4E1B3B67
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 11:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgDVJcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 05:32:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgDVJcQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 05:32:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D5752075A;
        Wed, 22 Apr 2020 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587547936;
        bh=lIl6HImVJ6Dh/zIbLnzk79LumoD5Vgqca2ZsZri1L9M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2kFpEQIZIJ4lZcUA7T08f6TV99oT5xXQrAyVh3KqbohiFsYKkNCACfJshaKBda9So
         +KF0TH5tFfnbWpkpLSNVOi293lHsXSjKFMQpENVaZmDlvdcYnH4bquNMpfJ3m2rtlE
         K8cQcvWAtne6L9kmuXBUpKWpRUHvUgUvOLvn+P3Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com> <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
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
Date:   Wed, 22 Apr 2020 02:32:15 -0700
Message-ID: <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
> On ACPI platforms the of_ functions are irrelevant, conditionally
> compile them out and add devm_clk_hw_register_clkdev() call instead.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiber=
ry-dacpro.c
> index bf0616c959da..d01a90fed51b 100644
> --- a/drivers/clk/clk-hifiberry-dacpro.c
> +++ b/drivers/clk/clk-hifiberry-dacpro.c
> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct platfo=
rm_device *pdev)
>                 return ret;
>         }
> =20
> +#ifndef CONFIG_ACPI

Use if (!IS_ENABLED(CONFIG_ACPI)) instead?

>         ret =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
>                                      &proclk->hw);
> +#else
> +       ret =3D devm_clk_hw_register_clkdev(dev, &proclk->hw,
> +                                         init.name, NULL);
> +#endif
> =20
>         return ret;
>  }
> =20
>  static int clk_hifiberry_dacpro_remove(struct platform_device *pdev)
>  {
> +#ifndef CONFIG_ACPI
>         of_clk_del_provider(pdev->dev.of_node);
> +#endif
