Return-Path: <linux-gpio+bounces-31863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPD0H//6lmmbtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 12:58:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20EF15E763
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E3C6300D4F1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC033859B;
	Thu, 19 Feb 2026 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qqtwo+3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B57335097;
	Thu, 19 Feb 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502307; cv=none; b=QId5GRADXpGPbE3Q2o9A5C3cQfeN+esz4tyZNn+Lv6zPf3LEZzKWN0ormhSkselGF9jSK/2tNdqjD6tnFu8DikV/pAq1G9q2sUf68T/FINN1uSAzf2yc1sHxgtnKuHodjMtj4fT8jlqBxS7SoKsmA5DDXh1BtvOVG/dMtHZGtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502307; c=relaxed/simple;
	bh=OgvCo6hR/++GTzEfXdfTagXsc83NxebFXuduN+Wv1Lg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U7Tq/6zo9zGMWPFwWtu2vxVRVbtozPwpFW2oAHql8ngNdrHidK5XWYXAQW1yMFw2NKJMZEw2Q6gynLiUgi/NBPHsQmh0g5/EX85um30qIps/qf3qBrmEVpNetL9GTPc5JHcQbdmH3phZEs2hnHTEAdXwcsmyYLG5739Vwm/YShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qqtwo+3f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC83D673;
	Thu, 19 Feb 2026 12:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771502250;
	bh=OgvCo6hR/++GTzEfXdfTagXsc83NxebFXuduN+Wv1Lg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qqtwo+3fv1117zNi4RfnMr9NCM9iOZknnI0qqNNCPRROYvCfuRw+N3De7leV/gGPH
	 EmS7aV4NY5JkyIV6Df4B4nrdy31aVZDYwL6vQx5ydj/Wc1vkY2NhE9ni96PxG+5D1H
	 WE7FQyqW8DF5nlU8Cxn9edGPYnLBf5bniVskcUHg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZYmtq2CAWhMo1Eb@google.com>
References: <aZYmtq2CAWhMo1Eb@google.com>
Subject: Re: [PATCH] media: i2c: max9286: normalize return value of gpio_get
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Date: Thu, 19 Feb 2026 11:58:20 +0000
Message-ID: <177150230077.1693075.9254407824824108466@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31863-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,jmondi.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: A20EF15E763
X-Rspamd-Action: no action

Quoting Dmitry Torokhov (2026-02-18 20:53:48)
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by max9286_gpiochip_get() is
> normalized to the [0, 1] range.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index e6e214f8294b..ac0712ce1e65 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1205,7 +1205,7 @@ static int max9286_gpiochip_get(struct gpio_chip *c=
hip, unsigned int offset)
>  {
>         struct max9286_priv *priv =3D gpiochip_get_data(chip);
> =20
> -       return priv->gpio_state & BIT(offset);
> +       return !!(priv->gpio_state & BIT(offset));

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  }
> =20
>  static int max9286_register_gpio(struct max9286_priv *priv)
> --=20
> 2.53.0.335.g19a08e0c02-goog
>=20
>=20
> --=20
> Dmitry

