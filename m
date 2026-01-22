Return-Path: <linux-gpio+bounces-30949-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHhvMdFzcmlpkwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30949-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:00:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 403966CD45
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3AA33005AEF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD57E37D100;
	Thu, 22 Jan 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="scWXGvmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5D2F549D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108425; cv=none; b=cPhoXHERwd7bgf71wcbtFZ/PL2uR0PuB62vRx7uNq+7IZuvvkazK+wuTklJ++5hXAgtpPEaytkMIXDgeRTpxwsSRC8K/Pa1/peeamKmHWMC1C2ekLTq22HNdt7tZsUz2lNyq3g81/jXQgQhJDrM5rbVDhgSmVMeol921Qr1mWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108425; c=relaxed/simple;
	bh=swrlHPUBKtlnhMtciE5+QOaGnR0HJsJDWjwTDiXUfRA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JPz4c5NoVGV6gkvacqMIrGitY37qR85XBxudS/tsUw27Gfe2AUb6ighSB7vEAE4ttIdvX3sOZz9fjB77DrGJaprznXelB6ROTTnrQmBvOO7iKm6L2xHYZEbOSFmHVz9xGLAaz785uPrkf+wt/c9ta1I+ANbD4L404Yitz2e9RyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=scWXGvmN; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d] (2a02-1812-162c-8f00-19d9-5e35-1cd7-5d5d.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id AD3656CF57C;
	Thu, 22 Jan 2026 19:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1769107980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XN4B5DCK0dBB222GFaDnpJxzaLb0lnsfXuQUUNsyrak=;
	b=scWXGvmNainY1kQ77gLARjznXHp6TO+wM6m+tn1/+83ESV/HT6d1twjbe2ueHYcn1LskEI
	zCr4pexsV9ktEqIDhFMO2pRHYvqeI7AHUV7/yHj+EkGt2iP49UTW/3ueGTDHwboGX3dvSZ
	h14cTdHbs8+iEL5vkbS2Z80FBJK2hYZ/UMIhrYxEBV9i2JMKWw7pzbF2wFBU4hBbfE8M9x
	AstzPZbmUZjsJWC48dlWh1KuePneV3+CR4beym6x8oIAxl+pXz+0lc6YdJEt/hKuVdTMmL
	PF4hyJpcpvSr/gPWmCLK6jCr4eOBp4C4GPP+C3WgHnHGgI2ru28Cs7B8/8OaHQ==
Message-ID: <25fb1bb85424e9d27348a51ce5bb1fe727d363ed.camel@svanheule.net>
Subject: Re: [PATCH v8 02/10] mfd: nxp-siul2: add support for NXP SIUL2
From: Sander Vanheule <sander@svanheule.net>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chester Lin	
 <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Ghennadi
 Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore
 <larisa.grigore@nxp.com>, Lee Jones	 <lee@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer	 <s.hauer@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Dong Aisheng	 <aisheng.dong@nxp.com>, Jacky
 Bai <ping.bai@nxp.com>, Greg Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi
 <clizzi@redhat.com>, 	devicetree@vger.kernel.org, Enric Balletbo
 <eballetb@redhat.com>, Eric Chanudet	 <echanude@redhat.com>,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, 	linux-kernel@vger.kernel.org, NXP S32 Linux
 Team <s32@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 22 Jan 2026 19:52:57 +0100
In-Reply-To: <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
References: 
	<20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
	 <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30949-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.nxp.com,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[svanheule.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,svanheule.net:mid,svanheule.net:dkim]
X-Rspamd-Queue-Id: 403966CD45
X-Rspamd-Action: no action

Hi Khristine,

On Tue, 2026-01-20 at 13:59 +0200, Khristine Andreea Barbulescu wrote:
> +static const struct regmap_config nxp_siul2_regmap_pgpdo_conf =3D {
> +	.val_bits =3D 16,
> +	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 2,
> +	.cache_type =3D REGCACHE_FLAT,
> +	.use_raw_spinlock =3D true,
> +};

I see you are using REGCACHE_FLAT ...

> +		if (tmp_conf.cache_type !=3D REGCACHE_NONE)
> +			tmp_conf.num_reg_defaults_raw =3D
> +				1 + tmp_conf.max_register /
> tmp_conf.reg_stride;

... and initialize the cache defaults from hardware.

This series predates the addition of REGCACHE_FLAT_S in v6.19 with commit
9c7f7262bc1a ("regmap: add flat cache with sparse validity"), but I think
switching to the sparse flat cache would allow you to drop this. Then the c=
ache
will just be initialized on the first hardware access instead of at regmap =
init.


Best,
Sander

