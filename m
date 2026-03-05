Return-Path: <linux-gpio+bounces-32544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDi1EEBQqWmd4gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:43:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D420EC1C
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2847430CC7A3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED56B3793BD;
	Thu,  5 Mar 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r8n3aZlu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510EE378813
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703397; cv=none; b=VUemOsagOe12ur4NfT99Sl1X7GRlwI6M6eU2hsW4800rqhHc63J3fxBnnAjyu+EBsijPgQtBYK5rqUg9En7iw2s9MvRGMnX5oCpl40NbcC1mChaWDu4JPF8h7IL6s16avgtEFWniGIgWieDhtp3qjDE6FeZPkEXDwi+qhHQNjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703397; c=relaxed/simple;
	bh=CMgXM6u7309Wn3e+oqvoc7hX9vYREWTZOtF5JH1MCY8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hzosIzW44mKH9tkPvj6C/BcqwWb95njnMoHEMxuN5wV4RPSR3JKNIlfuiBnOou8Px72AY+LF2o9CM6ADdmInLbyGyNfuRLDFvAkONBjJG6lKvQyQhdXhnKCaYaoOEZhAF0+XArxOeoai7XC/2Ag6MzePNG/31SWhxEIJ5jClB6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=r8n3aZlu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cb5af25bso1294572f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772703385; x=1773308185; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbidr/A9XxccdAFsJsVKLL2bBtmGRz8XUrt7LUMLgOs=;
        b=r8n3aZluVhBTCfb7BQuBR7rtMDtwMt/hhUveTeZDZQAO4wJxkqYdVnWInamwTvoasd
         njRsc4y1mlFqY6e8h+MrxsQmTwUtFPEr4bGcC2jwn78y+TT5X2hBUAy+EkXK3GfkPnMc
         efI7YRWZmXX4iWMH3mdtVwJdLQgh9b+NgkxQAUiokU1kYqlHFgrFqn8X6Kh54oqNRJvL
         W9KF9PgfXi06d+0sZ2isvDvqnFTaI47uFjf39desDXwhsR9fNqaB6S1RhpTym+6cBpi7
         37SVpkS6dpjv/ggxoqRfyQPvFp9lVwc3QY78bUWB4dZgVEV/oWO3UY/ChIwfz5zMSHTu
         wMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703385; x=1773308185;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mbidr/A9XxccdAFsJsVKLL2bBtmGRz8XUrt7LUMLgOs=;
        b=ehUBHeIg7vK6yCjQ1wy3egXzXx3heHUzewiBu7/XulXfOYDa/nE78NNemSEZkJckOb
         44olBoyMYexF9avTfvrATXQVyEtlXKZfB/KUUBJQHNCUHFGIT+I0m62d2VcNL78CAJ82
         qORrvyTwEtPlp91yfBybB+8DaLYUw+6dM++jU/RUnCp80s0bwU0lYeFpLclqOe94+Ep5
         ylNjj8tDwvYUQuBnMzUXHrw28grfmtQOrUvqdKz4PNV7okP4tT94nDFPQnCOe9vPFl0F
         To6BQem3Z0kseaKF6LhvopVvnl2+13/eeWZO1BKoZz0L2Ye1FcJNON7LeZS9ZjUbyBu1
         r8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUcb8UVBFz5sVPIbp8fxipMB3No7kI3NT7JP/yBMy61TvYNCOgStwLdlTs6j/enTCSGTW+1nlRO30Ns@vger.kernel.org
X-Gm-Message-State: AOJu0YxlIai4kl9Vzn04CX8+PEC+k+EMDO752SRGupx+OeqncdI0Y08n
	fcq+Q3Aq1aVADKScjj3aYe4tT6bLIO/bQiBAmtB3FUIaX1qYmBvgum7EoQ8QaONp+1A=
X-Gm-Gg: ATEYQzx8X3iwtSkedDtkNHEIuGUkvInhrRu6d9N03VlDZnUgY7UDBJuCIzrjVYD9rPW
	ppYM6x0tYi0QwP++50TkrcBIzDVM5tDTxyRuKBnRB1oUzB5W79BOu5CFbXHJ691YZuopoTtPzTQ
	8XmDkl3YP21Zndi2WaFVkcIqd3McQ4ulo8M6ypvPaFlUqAKf9llg+HfBVuLMCb9q6wE2MOiHAuU
	XY1cTf0CuXWQZ4F2ywcGMMwwbpuK+eriDYx1rNRi1m2v6J/ml1sFCMUDZEBKOlF3gwmnbcWF6mm
	C9VfEH9pvhjQq9mKXNKzNPv9SSH2bZNfnRVK2g8FVnD0Gu8JCAfv4sq5egWD8GuVdsdX7XFY3gG
	6KOt37iThY8cXa1CPYqxPcNpmkYS9f3ecSWX9CUGBj6twPAJXzY8iYWCnDQPHsStis+M0gDNYhv
	qmS17hNAPzeubR/2M=
X-Received: by 2002:a05:6000:144f:b0:439:b564:7a6c with SMTP id ffacd0b85a97d-439c7f6a2c9mr9158913f8f.4.1772703384539;
        Thu, 05 Mar 2026 01:36:24 -0800 (PST)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f7eca1sm14966458f8f.11.2026.03.05.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:36:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Mar 2026 10:36:14 +0100
Message-Id: <DGUQWFYCPRQZ.17SO07GXW2DYA@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 <linux-phy@lists.infradead.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-ide@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <UNGLinuxDriver@microchip.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Vincent Mailhol" <mailhol@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
X-Mailer: aerc 0.21.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
X-Rspamd-Queue-Id: 986D420EC1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32544-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com,glider.be];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msp@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Mar 4, 2026 at 6:57 PM CET, Vladimir Oltean wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Vincent Mailhol <mailhol@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c             | 2 +-
>  drivers/net/can/at91_can.c                          | 2 +-
>  drivers/net/can/flexcan/flexcan-core.c              | 2 +-
>  drivers/net/can/m_can/m_can_platform.c              | 2 +-
>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-
>  drivers/phy/phy-core.c                              | 6 ++++++
>  include/linux/phy/phy.h                             | 6 ++++++
>  8 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index a8b6ae58cb0a..ed7ed82ddb64 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1300,7 +1300,7 @@ static u32 cdns_mhdp_get_training_interval_us(struc=
t cdns_mhdp_device *mhdp,
> =20
>  static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
>  {
> -	unsigned int link_rate;
> +	u32 link_rate;
> =20
>  	/* Get source capabilities based on PHY attributes */
> =20
> @@ -1308,7 +1308,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mh=
dp_device *mhdp)
>  	if (!mhdp->host.lanes_cnt)
>  		mhdp->host.lanes_cnt =3D 4;
> =20
> -	link_rate =3D mhdp->phy->attrs.max_link_rate;
> +	link_rate =3D phy_get_max_link_rate(mhdp->phy);
>  	if (!link_rate)
>  		link_rate =3D drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
>  	else
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 4ab6922dd79c..79c72ee8e263 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -536,7 +536,7 @@ static int dw_dp_link_parse(struct dw_dp *dp, struct =
drm_connector *connector)
> =20
>  	link->revision =3D link->dpcd[DP_DPCD_REV];
>  	link->rate =3D min_t(u32, min(dp->plat_data.max_link_rate,
> -				    dp->phy->attrs.max_link_rate * 100),
> +				    phy_get_max_link_rate(dp->phy) * 100),
>  			   drm_dp_max_link_rate(link->dpcd));
>  	link->lanes =3D min_t(u8, phy_get_bus_width(dp->phy),
>  			    drm_dp_max_lane_count(link->dpcd));
> diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
> index 58da323f14d7..b56db253f02d 100644
> --- a/drivers/net/can/at91_can.c
> +++ b/drivers/net/can/at91_can.c
> @@ -1126,7 +1126,7 @@ static int at91_can_probe(struct platform_device *p=
dev)
>  	can_rx_offload_add_timestamp(dev, &priv->offload);
> =20
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (at91_is_sam9263(priv))
>  		dev->sysfs_groups[0] =3D &at91_sysfs_attr_group;
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..3a4307bc1d61 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -2211,7 +2211,7 @@ static int flexcan_probe(struct platform_device *pd=
ev)
>  	priv->transceiver =3D transceiver;
> =20
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>  		priv->irq_boff =3D platform_get_irq(pdev, 1);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 56da411878af..73525be6566b 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -132,7 +132,7 @@ static int m_can_plat_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	if (transceiver)
> -		mcan_class->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		mcan_class->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	priv->base =3D addr;
>  	priv->mram_base =3D mram_addr;
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rca=
r_canfd.c
> index eaf8cac78038..645d5671705d 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -1885,7 +1885,7 @@ static int rcar_canfd_channel_probe(struct rcar_can=
fd_global *gpriv, u32 ch,
>  	priv->channel =3D ch;
>  	priv->gpriv =3D gpriv;
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
>  	priv->can.clock.freq =3D fcan_freq;
>  	dev_info(dev, "can_clk rate is %u\n", priv->can.clock.freq);
> =20
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index a1aff00fba7c..89f7410241aa 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_widt=
h)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
> =20
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{

All of the can drivers that would use this function are checking phy
before assigning the max_link_rate:

  if (transceiver)
          priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;

Would it be reasonable to have

  if (!phy)
          return 0;

in this function to be able to drop these individual checks of the
drivers? This would be similar to clk_get_rate() which does the same
check and return 0 for convenience.

Best
Markus

> +	return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 36307e47760d..af9c3e795786 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);
>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string=
)
>  {
> @@ -256,6 +257,11 @@ static inline int phy_get_bus_width(struct phy *phy)
>  static inline void phy_set_bus_width(struct phy *phy, int bus_width)
>  {
>  }
> +
> +static inline u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +	return 0;
> +}
>  #endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
> =20
>  #endif /* __PHY_CONSUMER_H */


--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaalOjxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPc
SwEAt3Fg0ly9qnS+HJQv96JGhcc9ssPHPspnN0LcoiUH76oBAJJ1UWuuXcnIsBb3
namewJQN1U0nDnFUFRtJbSq49LcK
=6g8b
-----END PGP SIGNATURE-----

--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430--

