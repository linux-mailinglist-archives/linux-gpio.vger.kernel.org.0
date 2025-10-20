Return-Path: <linux-gpio+bounces-27315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F41CBF33EE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6E1484FE1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 19:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74445331A4F;
	Mon, 20 Oct 2025 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="DrErvCRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39212D738E
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989212; cv=none; b=NEbB9QRzVs1yf1Z72rNkOkB3FnnwVYKNIZe+jsxIwuA2+6n51C/Qz925lBN84BJDq/vN3D2/RgP5oVJ/Q3oMYR3buunRiK+z5WaaULKmf4j+NCXSoVqaC2N463E4dSTN9oRwaVrycY2GjxLkqZsz+umlGCzEJ3A2AL4NjEszcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989212; c=relaxed/simple;
	bh=fwOmHCsXzx/Fac0v9yeNlwfuzxzhrZw7Z/eeVgNNziA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NqeGHD9zoBpCKAbL7Csb9JkbO3JjcSnqnw9wMRRBDSDxVXzCxNLE9VfscW0GLZJ0/tk7BdWXkFavFVAq4KOyUYIBnI8HqWuCHwiAuC6wb7CjWgy352IKLgpLlqHwvV2RCi0se9bsfBGTaFVLIg/Q4jVyomEUR4sgzpiMAM55j5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=DrErvCRb; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 2ECE66895BA;
	Mon, 20 Oct 2025 21:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760989206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j17aJCB4WLcY6pIqkY+HxxakA4ilC4679SdKR5qqsDA=;
	b=DrErvCRbY5XdWSAxr/j6+8Mg9DDf+e4IJu/1ZgwnhHY3Y/i7ZM19vncmTto3nNvjkG663c
	PLYh9DC1KTsWvJQc51nmnJ9Bp3vHQs2eaYA1c1Of4jBo6unOL4QKQFvoLplT+DL7ulSBMV
	nczDklR6c42y5LJGeM9VGTEz/fl9beJLH1RgGy4gcrTuapWeO7NrbnCXqWA6PJt60/M+uj
	/66OaQ8HhxG36KCYNygez8Rs9d2kjTaBzEvjW7vDSrNJRMQWq7DGQ0ZoBzvsuSm30F1UvQ
	asyl/XF6JCUdmyfjy9B6VJABxySXoeUChD6QP3FuQdsLhh7kU7WJJ7wRnr1RFA==
Message-ID: <c046ace3d4569405e167db9cc6ede90048dc0450.camel@svanheule.net>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to
 avoid cache sync issues
From: Sander Vanheule <sander@svanheule.net>
To: bigunclemax@gmail.com
Cc: Mike Looijmans <mike.looijmans@topic.nl>, Linus Walleij	
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Date: Mon, 20 Oct 2025 21:40:04 +0200
In-Reply-To: <20251009132651.649099-2-bigunclemax@gmail.com>
References: <20251009132651.649099-2-bigunclemax@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Thu, 2025-10-09 at 16:26 +0300, bigunclemax@gmail.com wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
>=20
> The probe function does not guarantee that chip registers are in their
> default state. Thus using reg_defaults for regmap is incorrect.
>=20
> ---
>=20
> @@ -82,25 +71,12 @@ const struct regmap_config mcp23x08_regmap =3D {
> =C2=A0 .reg_stride =3D 1,
> =C2=A0 .volatile_table =3D &mcp23x08_volatile_table,
> =C2=A0 .precious_table =3D &mcp23x08_precious_table,
> - .reg_defaults =3D mcp23x08_defaults,
> - .num_reg_defaults =3D ARRAY_SIZE(mcp23x08_defaults),
> =C2=A0 .cache_type =3D REGCACHE_FLAT,
> =C2=A0 .max_register =3D MCP_OLAT,
> =C2=A0 .disable_locking =3D true, /* mcp->lock protects the regmap */

As Andy mentioned, the problem you will now have to deal with is that your =
cache
is not initialized at all. Unlike the other cache types, REGCACHE_FLAT will
zero-initialize its cache, perhaps making your cache sync issues worse.

You have two options to initialize the cache properly:
 * Provide .num_reg_defaults_raw (=3D MCP_OLAT + 1). This will give you a w=
arning
   on probe about the cache defaults being initialized from hardware.
 * Switch to another cache type (REGCACHE_MAPLE), which is aware of (in)val=
id
   cache entries. regmap will then init the cache on the first access to a
   register.

You could also combine the two, like the Cypress driver Andy referred to
(pinctrl-cy8c95x0.c). In that case you get cache loading at init, instead o=
f at
first use, but without the risk of missing something.

Best,
Sander

