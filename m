Return-Path: <linux-gpio+bounces-38823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EXBlKmidOWqevgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 22:39:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 097516B2510
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 22:39:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=ftenAF2p;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38823-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38823-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E12F303CC1E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24ED358373;
	Mon, 22 Jun 2026 20:38:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3389B33B6CC;
	Mon, 22 Jun 2026 20:38:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782160684; cv=pass; b=dEWCxhcSPuFGjV5I31Hld3/evmZrknGQzrqJpt7F08Y9C/DTJ4B4xnwzFVweZFUdejQQ3yvRdOdyEOsGZoagj0P6PsWTiCpFAXtv1/j3lPuahzrv50iJW6pKt59vcqjoRSjK5V2IVZMvMgfUXeogHjx4VmNYFjnhlUCNpJrC+PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782160684; c=relaxed/simple;
	bh=WsDcKuA1gvo2wPOxdvdHPc1d4sATgEmk4SH3WC2S+lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuHfawblQAsmmC2AS2ckOmnyll1we17CddoDP43mjee5zU4gwFUbOAS32xEbvuPlfRFBKn+iyPasQnVz5E/dOp1Jmubztoq7L9s/s7Wf7wvGxY9hL2JUhzlYVHEL0H4H1lO02i4GsRzZmKt1ZRbNbTlEEgtWYPM7RH5k/qNUpJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=ftenAF2p; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1782160644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NbZ03RwDUpsPUGMBrvUdLdu9YwvBtwbJnzp1KGgnOw8bmxFm308mN3AT9TQxGf0hTvg6NQG4C2vMqEG28Kk9TYtSAwUBIsPuLMENiboDJ821z6UtEvkeDwz5+Jcm+re9M7ZFaWtEkR9uOKdar4YVHKXBp3rQHmkoCuJ+yoWpc4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782160644; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mN91JuTXlP9yH/fF2WAYmfPvIPkIj7NLhNIGrphtGFQ=; 
	b=cdn/QOUYXHEVxnnOG0Xz+v5hgIFdWmFnUWGGBrXE0BkN+/Y/SSTnkF8DIdXeHmsun1N1bTnfVSATEUntE3qlia7Tu2OXutygr1K/pScuMkRUqb8jzru748kl9eSG9NgAF6EAKY/Eq7kqq5AHGgy4zYxnRNwUhOnHfiaIKQmZ7Ec=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782160644;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=mN91JuTXlP9yH/fF2WAYmfPvIPkIj7NLhNIGrphtGFQ=;
	b=ftenAF2pLAzRlyNVRan8mKVLwnie2DhUAR+YqxoXAcc93rbXBpyH//u6VQz6uvu5
	NVnB16FfAhcMzP72FH86ULWAFvMa3rYocIFntWDDFHxLa7uuG26U7HA2MLbmUYNgfOb
	uJogOLlRuf0JNK3ahPODVSRWU84ISRiZWge9esxY=
Received: by mx.zohomail.com with SMTPS id 1782160642430172.91971762131618;
	Mon, 22 Jun 2026 13:37:22 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 6EF1E1824A2; Mon, 22 Jun 2026 22:37:11 +0200 (CEST)
Date: Mon, 22 Jun 2026 22:37:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Jonathan Marek <jonathan@marek.ca>, Taniya Das <quic_tdas@quicinc.com>, 
	Robert Marko <robimarko@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Adam Skladowski <a_skl39@protonmail.com>, 
	Sireesh Kodali <sireeshkodali@protonmail.com>, Barnabas Czeman <barnabas.czeman@mainlining.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
	Anusha Rao <quic_anusha@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Chanho Park <chanho61.park@samsung.com>, 
	Sunyeal Hong <sunyeal.hong@samsung.com>, Shin Son <shin.son@samsung.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alina Yu <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
Message-ID: <ajmcsfEXiTfFh-XH@venus>
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="he6mgtsui5z5w5dr"
Content-Disposition: inline
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/282.152.77
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-38823-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:ja
 vier@dowhile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:li
 nux-samsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sebastian.reichel@collabora.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_GT_50(0.00)[95];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:from_mime,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,venus:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 097516B2510


--he6mgtsui5z5w5dr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
MIME-Version: 1.0

Hi,

On Mon, Jun 22, 2026 at 12:16:08PM +0200, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
>=20
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
>=20
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Intention for this patch is to go via Rob's tree.
> ---

[...]

>  .../bindings/power/reset/restart-handler.yaml |  8 ++++----

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

[...]

Greetings,

-- Sebastian

--he6mgtsui5z5w5dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmo5nPIACgkQ2O7X88g7
+pqv2Q/+LMhPKKkmgsVnMejKBphG4p2N/zVrnMgxmg8lVO8rwgA7Kxo2wlLqu2H5
iapTV4a2dMXB0SUw8UGbt9Lt6JjHaORZnybu95mZEZMS+G7HRl5M8DE+LWMJXLX0
S+G43Cv1O/d5dV/rM2nJqOItOK+KIbHQI4+oY/O8P7ENnU2h3X2HxOtWxtg6+9gz
UNPZgoZdEE38SJVzhHrCO1+NfGikbo7vUZC0BmyxiNuVTK9eFjie/eIS3ST4W5T9
3v2n+F2fD7+xsfSzUyjRc3p+zLyweImjiS6J5GAmTf4qxL9hQ3nXEW2gtRQQvB2l
W62s4eZt9jFlQjhXVjUeIkEPkORE4RrDInyktgSc6BKm/D5SylQgwytebDtJC2s4
QceoYrV7CHNsQ0vr9oITDlBN4Ik2TTsqhK2Sw0/2P0W7VU7y8uoHsm2xHPkf17l+
svy9/UvPf4f5kyBIPwySRFS4IUXcdP8MhscNstvyw1GJqxtCNNRfDX6z0isLIU6Q
yfIbxBsgCdHQMyM3HekxaofPcGx9LRJtbbNt2YA4SbqEKnzci/ToUY+z8a2svvDM
Ko5OrYJ/yAjPYjcoQ7ajynJC+BxvFRMTtfCEQmDLiaxN9+ueXJJMXe26hLYClF9g
ADHM+PuYvQrF2GfU9DgvPXkJHh3yEtyPk1rE6O1f4Q9xvKZMblg=
=cVKh
-----END PGP SIGNATURE-----

--he6mgtsui5z5w5dr--

