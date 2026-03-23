Return-Path: <linux-gpio+bounces-33991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG9WImXrwGl6OQQAu9opvQ
	(envelope-from <linux-gpio+bounces-33991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:27:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B242ED94F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E506330117C2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 07:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010A63164B4;
	Mon, 23 Mar 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R0hPVjz/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1102D7DDB;
	Mon, 23 Mar 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250823; cv=none; b=ZHX1J9i/cN5Ve/RtDuS15xJd+DK+6l+eWLvXGEHxHfH8h+4IZcAe1+l+hh6YN8TedoCX6HqDcDTAaElJlZxeH2QvU6qqUfPR9IzkwyJ9fHHOg0LVX79kylx+P88itMOK15S7rxyfWC1y62RZ44kQivwmqGuYksXUtAkoqDimujU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250823; c=relaxed/simple;
	bh=QMLfOSHN7yBX7dd2DeMRSHAPCl1Q8shqK91AzimibIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+ZAtwKdTSNSLRaDamSx3OBq7oMvnak2tJZtNFEVd2oamduXX4KpQLrOWpJCFU5F6+dIpYULxcq99025avjBbKb1el/guylvdvzUhh/iUZgmKV36zkypew7zTJdYEonecyc4vZYMSSiY682yrxpgXK+4Y4/J9otFT3JAra841qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R0hPVjz/; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=foORgteAPlfrIAS1ba1QdpFRcnbJ/IN133dyq0cl3iU=; b=R0hPVjz/e4re407HofT8dGEi1i
	3JQFkXx9UO3s9OlU19vdAjXPHEUcBzvdyiBPi3DsLnMUCj9uOVolF6dMKHg5ofWtTd1S1/g65GYA0
	bTUmFtRmprxRn8aON9G+L2Rws5xyEd/NkeZSCXRLAUfcPgsoMVHlTQZyiXaZVRhC1zOegPlo/iW3Z
	d/liLWIOX6ww6cXhLLmsDBL0UeG8/+mGp7VPpE/Q3CuMTKazScNmAjIkVDNJJEItjcHdrFUR5oNfP
	sog5+bH2+knmqkgqP4jQ7fxHYpymAa1Z5a2dJbVWA7/ss/yw7vI80ZLEOadk7aEOl5i2ASn5wrvat
	VpK0VGpg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4Zga-000OD6-1i;
	Mon, 23 Mar 2026 08:26:52 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4Zg2-000N2t-2c;
	Mon, 23 Mar 2026 08:26:52 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Mon, 23 Mar 2026 08:26:51 +0100
Message-ID: <2826794.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260320193150.2508850-1-shenwei.wang@nxp.com>
References: <20260320193150.2508850-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27948/Sun Mar 22 07:24:25 2026)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33991-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 30B242ED94F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Freitag, 20. M=E4rz 2026, 20:31:50 CET schrieb Shenwei Wang:
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> trigger due to a hardware bug in the detection logic. Since the hardware
> does not support Both Edge wakeup, remap requests for Both Edge to Rising
> Edge by default to avoid hitting this issue.
>=20
> A warning is emitted when Falling Edge is selected on i.MX8QM.
>=20
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
> cc: stable@vger.kernel.org
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Changes in V2:
>   - add a check for i.mx8qm and emit a warning when Falling Edge is
>     selected.
>=20
>  drivers/gpio/gpio-mxc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index d7666fe9dbf8..095bcfbc56e0 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -584,12 +584,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio=
_port *port, bool enable)
>  	unsigned long config;
>  	bool ret =3D false;
>  	int i, type;
> +	bool is_imx8qm =3D of_device_is_compatible(port->dev->of_node, "fsl,imx=
8qm-gpio");
>=20
>  	static const u32 pad_type_map[] =3D {
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
>  		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
>  		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
> -		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
> +		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
>  		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
>  		IMX_SCU_WAKEUP_OFF,		/* 5 */
>  		IMX_SCU_WAKEUP_OFF,		/* 6 */
> @@ -604,6 +605,12 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_=
port *port, bool enable)
>  				config =3D pad_type_map[type];
>  			else
>  				config =3D IMX_SCU_WAKEUP_OFF;
> +
> +			if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) {
> +				dev_warn_once(port->dev, "No falling-edge support on i.MX8QM\n");

How about "No falling-edge support for wakeup on i.MX8QM"? Without
context this message in the kernellog is confusing.

Best regards,
Alexander

> +				config =3D IMX_SCU_WAKEUP_OFF;
> +			}
> +
>  			ret |=3D mxc_gpio_generic_config(port, i, config);
>  		}
>  	}
> --
> 2.43.0
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



