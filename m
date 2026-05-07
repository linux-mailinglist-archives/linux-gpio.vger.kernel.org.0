Return-Path: <linux-gpio+bounces-36399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEwcJyDL/GmPTwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:25:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDFD4ECDB4
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9401F302DE3C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 17:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16C93EF666;
	Thu,  7 May 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEvjn09H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB12F87B;
	Thu,  7 May 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174746; cv=none; b=EzE/WaiNcjuFU8HUfFwNW9i9RPR2Gxpgtud5ijkFH0QbjrwUwmoMJR7/x05UVjuqy78xgtHI45YnELPnvt2NIF7qstW4miqAykQ5oZkVCCjyeeovQURPcE+qL+htCmZmj2UEPcORTJkPUJV7CyXeetC3mrw0rtQABVGoTfxbNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174746; c=relaxed/simple;
	bh=BRATCdkBntVsh6dTxg3ZZlQZe9izWAZz2BngadhsNyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5Iq6jYd8WLXvGWKp9aSNMHAlr/RUGgD9S1apRU2/Z/hIEdjy9cvTtANHwFiJeKC/n46bt4NSEF8M1j6uBaB2L9fFfzqHt+O3Khp7Py0gQ/A0gtuTMELhsytmdPy+f1cLoPPkGZbyrFuHngC0CMdSOFT8rwervj+v1A4y+vgR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEvjn09H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33C0C2BCC4;
	Thu,  7 May 2026 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174746;
	bh=BRATCdkBntVsh6dTxg3ZZlQZe9izWAZz2BngadhsNyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEvjn09HKyh0q5X4GrpdNVlait/ttUZ8Stnp/9XxyVKhw7v6mChVOxdjP3v3jUW5O
	 OGTH8Fwm4WVZB38ZHjZ11eXi5Eym0o2JEWvSQkHu7iPLpLio/MQrmEPYVVUlQ5VRMN
	 /hO06O8UK9rvr7/Dc4vA4EjxM1ZUjC+xBamGeqw8vw4egCCUTdqCAZ5NHt5HxY34TC
	 0s2d8MHSuw3n+8N3NKNoqGzKS7Xko+XEAPpL+Ewabs5sme5og9Hefgo0nUxfGYzu/W
	 EEZzgirWT3P757sQ0hABnUDzzpg3GGkNPouMBLzqtGdjB/xYvJ6y91Hwcr124d6IrU
	 62i5Zpl0Areqw==
Date: Thu, 7 May 2026 18:25:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 07/12] dt-bindings: gpio: dwapb: allow GPIO hogs
Message-ID: <20260507-appointee-munchkin-184b6d09cda1@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-8-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YzdBYMg3lPWHS/mZ"
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-8-zhengxingda@iscas.ac.cn>
X-Rspamd-Queue-Id: 5CDFD4ECDB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36399-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,os.amperecomputing.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amperecomputing.com:email,iscas.ac.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Action: no action


--YzdBYMg3lPWHS/mZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:17:05PM +0800, Icenowy Zheng wrote:
> GPIO hogs are described in the gpio.txt binding as automatic default
> GPIO configuration items.
>=20
> Allow them for GPIO ports in DesignWare APB GPIO controller nodes.
>=20
> Cc: Hoan Tran <hoan@os.amperecomputing.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YzdBYMg3lPWHS/mZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzLEgAKCRB4tDGHoIJi
0gp5AQDSo+numoKPTKMVoNorzaz2xolwawU0ckw6qMrfEGBlIgD+MGXlWcHakPV1
2E3fc+bby97qY6CDyJjEJbDTUCUCOw0=
=i7uX
-----END PGP SIGNATURE-----

--YzdBYMg3lPWHS/mZ--

