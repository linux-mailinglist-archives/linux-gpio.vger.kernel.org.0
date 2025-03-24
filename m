Return-Path: <linux-gpio+bounces-17903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132EA6D5F3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23FD9189399E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B23C25D1ED;
	Mon, 24 Mar 2025 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXyUc87S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CF14F9FB;
	Mon, 24 Mar 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804003; cv=none; b=VGtB8jq5vfN4Loww1P2ZxChKGeCSu56/RHoe8yFrxDu3RXtrWFyY2V4N0O/pKhqsgMembc0RXNo0bieEfvnXmPcSSAzojhdrCRyiTNQZidJtyfTVtleUT3068LgSm/HyCKhtUsltOJjNlMshhoddcgHOtazxG1jo84JOcqjWmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804003; c=relaxed/simple;
	bh=E39d+lttBV/+aG+RVDxp3Vp3axsJukiiE8ph8/Qv0vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdXpbu3e6zLp1CzJMZTPDGXRRIZcuZtbszxtUMl9xLCyfRLqjVFwn94DfV2MAEGPfX484kVw/kc++Ti6ETIRl/k9XrMb9O7XcMS9hJcT1CbKHOErzkKjmAbyJJEp/ktp7XmOeTlf9tXUgogbAhI2hahNMgYZE1UopNaFXHRntxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXyUc87S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A35DC4CEDD;
	Mon, 24 Mar 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742804002;
	bh=E39d+lttBV/+aG+RVDxp3Vp3axsJukiiE8ph8/Qv0vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXyUc87SzfL70lsGZtGdygVrxoGNYigJRRki3STcdq3jiTrWllYAgd8LMvZeiXM+T
	 6RwrRmKw3iqD+fPWUztn8QB+Hw/eGxzfQ+e4NR+xy3l7M6Kb5wmH0t8W7wPIkdaSVe
	 mgUCDbJRusQGoJOfBpFEWoFOU/I+KY46CjquELUS3IJWzDMQ9E1IO/vKipkrJS7kPt
	 cVtjC4kwXRS2KQHm9oMH8R4na1BbKFWbnPyI9TXmc3dKOSIpbWe6JKXPpbOQ06Sz/5
	 UaENBe0IGQ6aroBqPxC3WWuZn8iYSxL06yOafDK+ojpIsptavxWZvrcXDRZNNp9HXP
	 hjKq0MRq3RF0w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twcvw-000000004Ev-2Kpu;
	Mon, 24 Mar 2025 09:13:21 +0100
Date: Mon, 24 Mar 2025 09:13:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Message-ID: <Z-EUIDHL1rL6HpmC@hovoldconsulting.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>

On Sun, Mar 23, 2025 at 10:40:51PM -0500, Steev Klimaszewski wrote:
> On Sun, Mar 23, 2025 at 9:28 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> >  - Use dev_gpiod_get to get GPIO descriptor.
> >  - Use gpiod_set_value to configure output value.
> >
> > With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> > and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> > DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> > output low, set value 0 means output high with gpiod API.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>

> > @@ -3251,9 +3250,9 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> >         struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
> >         int ret;
> >
> > -       wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
> > -       if (wcd938x->reset_gpio < 0)
> > -               return dev_err_probe(dev, wcd938x->reset_gpio,
> > +       wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> > +       if (IS_ERR(wcd938x->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(wcd938x->reset_gpio),
> >                                      "Failed to get reset gpio\n");
> >
> >         wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> > @@ -3297,10 +3296,10 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> >
> >  static int wcd938x_reset(struct wcd938x_priv *wcd938x)
> >  {
> > -       gpio_direction_output(wcd938x->reset_gpio, 0);
> > +       gpiod_set_value(wcd938x->reset_gpio, 1);

This may be what is causing the regression; the driver no longer
configures the reset line as an output. From the docs:

	* GPIOD_ASIS or 0 to not initialize the GPIO at all. The
	  direction must be set later with one of the dedicated
	  functions.

> >         /* 20us sleep required after pulling the reset gpio to LOW */
> >         usleep_range(20, 30);
> > -       gpio_set_value(wcd938x->reset_gpio, 1);
> > +       gpiod_set_value(wcd938x->reset_gpio, 0);
> >         /* 20us sleep required after pulling the reset gpio to HIGH */
> >         usleep_range(20, 30);

> With this patchset applied, the wcd938x codec used in the Thinkpad
> X13s stops working:
> 
> wcd938x_codec audio-codec: soundwire device init timeout
> wcd938x_codec audio-codec: ASoC: error at snd_soc_component_probe on
> audio-codec: -110
> snd-sc8280xp sound: ASoC: failed to instantiate card -110
> snd-sc8280xp sound: probe with driver snd-sc8280xp failed with error -110

Johan

