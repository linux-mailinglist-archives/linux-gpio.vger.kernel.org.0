Return-Path: <linux-gpio+bounces-34198-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAxEGY4NxWkI6AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34198-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:42:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBB333A1A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F363C31CAEF9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7163CEB86;
	Thu, 26 Mar 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLAVn+yy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E8B3C9454
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521211; cv=none; b=DoFJm/gP2D7w3cpbia633fK4/AxUdNZ3otMUGeX6Cdy4cqWDDbFyXdF2R3EUzK3+WAVP8yaEURvzTMeYiaw51oS+Y07GXJlYYxrFE3Mus/2I6fMZi3oPVyASZAZ4YQBhSoes02CY/65NSvlnRwTNbv1rfg26K+bIlvlP1fbc7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521211; c=relaxed/simple;
	bh=ZudevnbvHxuJFNRVUgY0l6TTlPYj57cCXzQfq18RxyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv/7g+c0zLudX8AdCv+BKl+7rtitcLmf5tacF9d1YnnA0hHhA4rP87Fwc8Ph593gKNGgWwXUi2rWt6Z7Zgb+dqb9DLFv9wisbvzMTIC2f+H78Ei+joSfwe8mkUqQn9lwxM1hLJ6Ej6TwApz2qc9Zio8Lf6t0jNo3B5Ij2XbOFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLAVn+yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E732C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774521211;
	bh=ZudevnbvHxuJFNRVUgY0l6TTlPYj57cCXzQfq18RxyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kLAVn+yyTl/Q8z+UhqbNmfz2LrWrp36HL1Ae4tSkcqPbq1qp3GRw4UjT323vqOUua
	 8ahJjFB01lxdM/2KIMuWIT/npAo065XzkAEJITt09khnLhIl+eLEP4WHkDeGlGhT4f
	 e0aeWHoRGhZBI4R40jiCJ1bYcjad052WCHxrFwLVGoii6XzPg7Pg1HGrPKXJuKh9dZ
	 FixFToi4dvl3Fnnmk6MV3sIitDaktMkzrAFWZVUVpwagZgrFRx2FtV0UYZvB2u1NgG
	 sqo55jxPVDBNxHLQcxm2vrGc3ZOgOvS+j+ZAYexlcyf+b06vLqMYU9z3zUlgUTwEUY
	 w55U+UPZxDs9w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-794719afcd4so8774877b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 03:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBFWyCpQc1NSm3ygdXyEqQ9ET+3khXUZpfWymZ1lO7cD6lCvAN/XzyzSrLXwY3POp2bngTKnytnLWY@vger.kernel.org
X-Gm-Message-State: AOJu0YzAigN/b+MNd3T8NZqp6t74vYc2ak0xs/4cOZm3RKZukSTHlIzx
	P8cUHDLF3PABYkQJC/sk98zfS6//hcDtOXpXqWEUBL4+EtGzSwvfM9ostTMC1lKWiwc+l0uenuj
	Fs0hFm1zMkHgkwJZrtkE0C0YaUsxJI3g=
X-Received: by 2002:a05:690c:6086:b0:79a:69bc:f20f with SMTP id
 00721157ae682-79acf3a8b76mr76387137b3.21.1774521210579; Thu, 26 Mar 2026
 03:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com> <20260325143555.451852-21-herve.codina@bootlin.com>
In-Reply-To: <20260325143555.451852-21-herve.codina@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 11:33:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFu+Z22QBFiaa9S+Epeh=RJZOYX8BOLVDFw4bhEoYF1Q@mail.gmail.com>
X-Gm-Features: AQROBzC4i_eE97sXtt89YSs_3fVQUuKW8eO9nnDvhVba5azUhozyRvIt7ceD-wY
Message-ID: <CAD++jLkFu+Z22QBFiaa9S+Epeh=RJZOYX8BOLVDFw4bhEoYF1Q@mail.gmail.com>
Subject: Re: [PATCH v6 20/27] misc: lan966x_pci: Fix dtso nodes ordering
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kalle Niemi <kaleposti@gmail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34198-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C3CBB333A1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herve,

this is nitpicking, but if you respin the series consider the following:

On Wed, Mar 25, 2026 at 3:42=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Nodes available in the dtso are not ordered by their unit address.
>
> Fix that re-ordering them according to their unit address.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
(...)
> +                               switch: switch@e0000000 {

Recommended practice is:

ethernet-switch@...

> +                                       compatible =3D "microchip,lan966x=
-switch";
> +                                       reg =3D <0xe0000000 0x0100000>,
> +                                             <0xe2000000 0x0800000>;
> +                                       reg-names =3D "cpu", "gcb";
> +
> +                                       interrupt-parent =3D <&oic>;
> +                                       interrupts =3D <12 IRQ_TYPE_LEVEL=
_HIGH>,
> +                                                    <9 IRQ_TYPE_LEVEL_HI=
GH>;
> +                                       interrupt-names =3D "xtr", "ana";
> +
> +                                       resets =3D <&reset 0>;
> +                                       reset-names =3D "switch";
> +
> +                                       pinctrl-names =3D "default";
> +                                       pinctrl-0 =3D <&tod_pins>;
> +
> +                                       ethernet-ports {
> +                                               #address-cells =3D <1>;
> +                                               #size-cells =3D <0>;
> +
> +                                               port0: port@0 {

Recommended practice is:
ethernet-port@...

Yours,
Linus Walleij

