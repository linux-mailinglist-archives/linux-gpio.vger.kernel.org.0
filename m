Return-Path: <linux-gpio+bounces-36398-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI52JgfL/GmPTwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36398-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:25:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC794ECD9B
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7336030247C1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 17:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD04534A9;
	Thu,  7 May 2026 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VICY621r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3D3F0755;
	Thu,  7 May 2026 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174717; cv=none; b=QF3yYtR3yMabVn2maHIyHMSttLnXdm5nazcd2kQVFjTvgdX64qUdCN6XBz6syYc6at3OMCXDtiETCK8kIeuVmelk2IDByulZE9Klfs9g9MBuPsP5hHfYJzI2snBKfHOc6a/ILqAxcAXQaEQG+L0ybmQoQ24ec2zqzUwr2dULFms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174717; c=relaxed/simple;
	bh=K8jMkHMZxPz+n1rEKyGtdtouBs+Nm+NdaoS8omC6jIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJAQSk3v+Za6y1CuzBTwvn6BzkE2ufzcWV1g19lVWFWo43m550xz1XX50n76rEzPBh7ByjZeISP3aKTJ8wFF7tLGmA0tuWyngmKKePcHoh5tuaOPPwl5vUko6Js2+bDgF0YQxPbxQB9zkvUjAW6IItnbBoBexjXe8AIBSLdeCbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VICY621r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C12C2BCB2;
	Thu,  7 May 2026 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174716;
	bh=K8jMkHMZxPz+n1rEKyGtdtouBs+Nm+NdaoS8omC6jIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VICY621rCMrKv4q8tZ4Dp7bUJmDfVpmYwpJRM0JZDqxdTrDmJ2w7+i2esPqt3jj62
	 X0jsR/OvG2a7hnqfuz1hLShZZGtRlPSzl+9IsCw9LQDdgsroApmKczyneeopzhxsPk
	 FP2qbA+lFSAfhlOOHkihNle4ZMqFsyjuqlgBe1CyBXhl41/AxUOIGsaGXPuLkg7Q/3
	 dh8RI6LUP8wnYPU0B1ucMSImCParqYxH0mjZTPGGaQU7HNetCTlZhcQmMlWVVXkVNd
	 GzoyB0zZwmIlva79rldI4ZxPTvY/m3csktHtWe8cGIgpJ5HiN4QV+GrbZGoF0YBQ9y
	 lcxSQTRfg1FzA==
Date: Thu, 7 May 2026 18:25:09 +0100
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
	Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 08/12] dt-bindings: usb: vialab,vl817: allow ports
 property
Message-ID: <20260507-escalator-important-0105ccd73bd6@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-9-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nZtZj26UQ1XQEAQt"
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-9-zhengxingda@iscas.ac.cn>
X-Rspamd-Queue-Id: 4AC794ECD9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36398-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Action: no action


--nZtZj26UQ1XQEAQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nZtZj26UQ1XQEAQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzK9AAKCRB4tDGHoIJi
0rndAQDJ23LQ9WQwWM/XfJKivc5KbhVY0JCID0/Kp8ObE+DdlAEApUj38tg4kRpa
DHm/ajsN2EwgPzKWoFFe1mv24DwCsgw=
=dqpO
-----END PGP SIGNATURE-----

--nZtZj26UQ1XQEAQt--

