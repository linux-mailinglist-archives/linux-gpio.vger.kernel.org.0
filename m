Return-Path: <linux-gpio+bounces-27411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C46BF9B48
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 04:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4806319A3013
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 02:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C3F2144C9;
	Wed, 22 Oct 2025 02:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6skFHix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C41F4190;
	Wed, 22 Oct 2025 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761099566; cv=none; b=fzywO5pigpdS8Jx/t2U2/Tu58aiiNiPN0Jlx6n+MTYOnGQ7fP/Pg6NtghYh6JqUR9ja/yj2nqGRjuQIGhbtKjYZehmZH6n1zay1ujNa+DVugfCdugS45PdaJmGqIKTqER0yDuZozKkstPtczgwcJUDGJYAkNkvsLAO5oGm9ZREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761099566; c=relaxed/simple;
	bh=bkgKqKQu5VAs+o04k4pRDHaDrNwYZ7TNN0PJnstGpEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQrLSou1DM/9cAB879IqJDl+ZznTm64riGoU7U9iDs/VGCQ3XS+wJS7kxoSenZsqTdX5VCQ0iKsmIU7yIGduIcNaYkUnod790ow+9u57jO1K12B4pEGLZxtI2+XbvvF4WY8JEKNLnKNjLBWeGTyQDOw2GwVejcDNdpFH5tTiGE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6skFHix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E6BC4CEF1;
	Wed, 22 Oct 2025 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761099565;
	bh=bkgKqKQu5VAs+o04k4pRDHaDrNwYZ7TNN0PJnstGpEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6skFHixOawFwhl98VgAmuIWpiWM0leim+twCMleNYAr3GZa0q5S9Q8k+tgMcdKGb
	 rmIyorY90KpEoO96IdP9IU2nh9HKDEcXJ0BEy+ZuAkxgZogzyk0tw4WC1zX8RAyq3D
	 OgF044q5OjW27nvfhTLm4/CUw9ClvXwyLQRwj6vtSj5pQrDDyC22I5R0Dz6cUdMPHf
	 w9l9hO640BCXsGAwiLhFe5w/6lYbidAujKoaQ1wYPlzxEjFFpmx+K/lmpwuePCBxY9
	 RQYMsQfkWgef6o00ysTLpTfcDzXrQ2C1IgP5UN1tV2eR4Sjnyr62LlrnB3NRdTPtE+
	 KkBVZ/WfrGMlQ==
From: William Breathitt Gray <wbg@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO lines
Date: Wed, 22 Oct 2025 11:18:42 +0900
Message-ID: <20251022021843.6073-1-wbg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
References: <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3324; i=wbg@kernel.org; h=from:subject; bh=bkgKqKQu5VAs+o04k4pRDHaDrNwYZ7TNN0PJnstGpEw=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBk/7L498rw30T48yGLlj1+S+VOXS0yfcGjGadcfWdeZ9 szanj97a0cpC4MYF4OsmCJLr/nZuw8uqWr8eDF/G8wcViaQIQxcnAIwkQ3XGRnOdYm0p6n7Fk1p CbFX4Jfo0NixbPsaAf2rMVsT8y4JfeNlZDjXZtLPwqky4Yhn0Nydj9ZOe7D4m1mua/kTE3GrGZP WTWUEAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Tue, Oct 21, 2025 at 09:21:38AM -0400, Bartosz Golaszewski wrote:
> On Mon, 20 Oct 2025 10:51:46 +0200, William Breathitt Gray
> <wbg@kernel.org> said:
> > The direction of the IDIO-16 GPIO lines is fixed with the first 16 lines
> > as output and the remaining 16 lines as input. Set the gpio_config
> > fixed_direction_output member to represent the fixed direction of the
> > GPIO lines.
> >
> > Fixes: db02247827ef ("gpio: idio-16: Migrate to the regmap API")
> > Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> > Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
> > Suggested-by: Michael Walle <mwalle@kernel.org>
> > Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fixed_direction_output configuration parameter
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: William Breathitt Gray <wbg@kernel.org>
> > ---
> >  drivers/gpio/gpio-idio-16.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
> > index 0103be977c66bb8d165c1c92123368be6832d120..4fbae6f6a49727df40f2793b42ca207d78ec272b 100644
> > --- a/drivers/gpio/gpio-idio-16.c
> > +++ b/drivers/gpio/gpio-idio-16.c
> > @@ -6,6 +6,7 @@
> >
> >  #define DEFAULT_SYMBOL_NAMESPACE "GPIO_IDIO_16"
> >
> > +#include <linux/bitmap.h>
> >  #include <linux/bits.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> > @@ -107,6 +108,7 @@ int devm_idio_16_regmap_register(struct device *const dev,
> >  	struct idio_16_data *data;
> >  	struct regmap_irq_chip *chip;
> >  	struct regmap_irq_chip_data *chip_data;
> > +	DECLARE_BITMAP(fixed_direction_output, IDIO_16_NGPIO);
> >
> >  	if (!config->parent)
> >  		return -EINVAL;
> > @@ -164,6 +166,9 @@ int devm_idio_16_regmap_register(struct device *const dev,
> >  	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
> >  	gpio_config.reg_mask_xlate = idio_16_reg_mask_xlate;
> >
> > +	bitmap_from_u64(fixed_direction_output, GENMASK_U64(15, 0));
> > +	gpio_config.fixed_direction_output = fixed_direction_output;
> > +
> >  	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
> >  }
> >  EXPORT_SYMBOL_GPL(devm_idio_16_regmap_register);
> >
> > --
> > 2.51.0
> >
> >
> 
> Turns out, this requires commit ae495810cffe ("gpio: regmap: add the
> .fixed_direction_output configuration parameter") so I cannot queue it for
> v6.18. What do you want me to do? Send the first two ones upstream and apply
> this for v6.19?
> 
> Bartosz

Sorry for the confusion this caused. It looks like `b4 prep --edit-deps`
will add explict dependencies, so I'll use that from now on to hopefully
prevent this kind of problem in the future.

So we'll need this fix in v6.18 as well because the IDIO-16 drivers are
completely broken right now. In theory we could revert the entire GPIO
regmap migration series [^1], but that would be a far more invasive
solution prone to further regressions. Instead, picking the commit
ae495810cffe dependency with the remaining patches is the cleanest
solution to this regression.

William Breathitt Gray

[^1] https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.org

