Return-Path: <linux-gpio+bounces-29863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C71CDAE0E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 01:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FB793028FF8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 00:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FA02BAF7;
	Wed, 24 Dec 2025 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmHlMsNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C13C1F;
	Wed, 24 Dec 2025 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766534989; cv=none; b=cmkkbONUVqqw3O9Gaeeo5KehwcVKPf1BLo0mn6u7f3wY5tKgabgok6UsFt4JQKFaC9RcNvls3DilyC9W4BcnpXW6I3I2v74XNnLvt6ObnYFbFgIKTFJ6o7GTbdMypDBGiDj6WHh4ku6fDvbuv0FFynf0ME+qt1LnOLWyUHvXpJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766534989; c=relaxed/simple;
	bh=9762YMZ3e4dNH0leV0xqlBgFdKvF9MnhJqn+Wiy6al4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKU9OzTfOPQv03sVPbqMkYG1uoFnf9rGsafYkWqT0tEPcVFOCjSQ6/dAuJy5oFQiAQREHkn73qengKyNaLgjCCQrfqecNmBklaUHLhd1ejdNu2Rs16SnFGUn+UONANERGdETfMh65NWuL/HTDYzq9bZF8EeIMxejOowvsX4Zkk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmHlMsNd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AC5C113D0;
	Wed, 24 Dec 2025 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766534989;
	bh=9762YMZ3e4dNH0leV0xqlBgFdKvF9MnhJqn+Wiy6al4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmHlMsNddxVT09HRcBH/WYCdWtTAjhgNqDroROJ/EAyO7vCd9ktC5lPaCHV3OnOK4
	 Mexi8z/9J4MMsfuFpJyc5tPeegMajXKgbapMBe1RlPoi0dRaiiqiqXx4a60KOG1tKi
	 A5G5ble91/4izwKAn+3DXjs/Z0hXZs4OamgjP7649gyjg5R+Ovk2eQ8YusgjqzEZ0J
	 d27wfLTnWRrp5ZrU7wrkq7JAZLPe1MSOH6FJty/yJP9T2Ng+h0sGdXP2+Ca7/VhUoY
	 VrXLZklKFm1mPQwvat6ngYvvfRU8AWlKLp3tuOLhJpp5aDPEcMLl37jKw4J5fL2yrx
	 bK5yt1IiETvaw==
Date: Tue, 23 Dec 2025 18:09:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	dl-linux-imx <linux-imx@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <xiqftcgga24bypbux276u56t2lxjy4oxzggixrhy5h7woc4aon@2zbcfxxrzqig>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-5-shenwei.wang@nxp.com>
 <mnpg4xanzl45lal72c6kgog7qmqgk2zcp734eqdpk3gsonq63f@vlewh6jgdjy4>
 <PAXPR04MB9185B16A2B08E739B2FB64C889B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B16A2B08E739B2FB64C889B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Dec 23, 2025 at 08:20:49PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Thursday, December 18, 2025 9:58 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > On Fri, Dec 12, 2025 at 01:43:40PM -0600, Shenwei Wang wrote:
> > > On an AMP platform, the system may include two processors:
[..]
> > > +static int rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> > > +                            void *data, int len, void *priv, u32 src)
> > > +{
[..]
> > > +     init_completion(&port->info.cmd_complete);
> > > +     port->info.rpdev = pltdata->rpdev;
> > > +     port->info.port_store = pltdata->channel_devices;
> > > +     port->info.port_store[port->idx] = port;
> > > +     if (!pltdata->rx_callback)
> > > +             pltdata->rx_callback = rpmsg_gpio_callback;
> > 
> > What happens if you rmmod your rpmsg gpio driver and then trigger an interrupt?
> > 
> 
> The driver has a rpmsg_gpio_remove_action which will clear the devices in the pltdata->channel_devices[].
> In the rpmsg callback function, it will just return -NODEV error.

When you rmmod the rpmsg_gpio driver, the code will go away, so at the
address of rpmsg_gpio_callback there's going to be some undefined data.

> 
>      if (msg)
>              port = drvdata->channel_devices[msg->port_idx];

So this code is no longer going to be there, or maybe there's some
remnants of it? But jumping to the address of rpmsg_gpio_callback (not
the actual rpmsg_gpio_callback) is best case going to result in a crash.

> 
>      if (!port)
>              return -ENODEV;
> 
> > > +
[..]
> > > +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> > > +     { .compatible = "rpmsg-gpio" },
> > > +     { /* sentinel */ }
> > > +};
> > > +
> > > +static struct platform_driver rpmsg_gpio_driver = {
> > 
> > It's an "rpmsg gpio driver", but it's a platform_driver...
> > 
> > I don't think this is the correct design, but if it is then this needs to be well
> > documented.
> > 
> > Same thing as platform_data forms a strong ABI between some other driver and
> > this platform_driver, this needs to be well documented (but should be avoided).
> > 
> 
> Are you suggesting to use "rpmsg_driver" framework here?
> 

Yes, making the functional driver bind to the particular rpmsg channel
is exactly what I would expect from a "rpmsg gpio driver".

Regards,
Bjorn

> Thank you very much for the review.
> Shenwei
> 
> > Regards,
> > Bjorn
> > 
> > > +     .driver = {
> > > +             .name = "gpio-rpmsg",
> > > +             .of_match_table = rpmsg_gpio_dt_ids,
> > > +     },
> > > +     .probe = rpmsg_gpio_probe,
> > > +};
> > > +
> > > +module_platform_driver(rpmsg_gpio_driver);
> > > +
> > > +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> > > +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.43.0
> > >

