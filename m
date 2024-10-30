Return-Path: <linux-gpio+bounces-12295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F99B5C1E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 07:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9410283D7F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 06:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9831DC1A2;
	Wed, 30 Oct 2024 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bewQAceO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4741D9A47
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271566; cv=none; b=QtBOn4T6w46TzWYw6/vh54CoCne1Iu/R8bAfuCKZgmetert+zzOivYnpOZnLxvi5M2ajEqzRYFOp3xgJhjgWxvR3jXN2kf4TqdZocFZwJmi7lp97WL5Vm3MxLlRYc4rheiUI29RNnTiyGPQWxB9ACT4WEnNS+vb+QrsF5daIEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271566; c=relaxed/simple;
	bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRszyeUVNNF0ZNwFw2HAT/CtqjW1KzxATH/+VxO5GGq7Tz/qrQibW4ToXwQ6kR7FFRuaPd92486vz5Nkbjood9rLrBFYAgKJ37Lp0JdMXSteOUtsbMlgBn5a++tU59s/hLEzrnnd5WA7TeuBE9VTitnIpOzlxjjf9UmTjx1UR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bewQAceO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so3994728f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730271562; x=1730876362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=;
        b=bewQAceOUlkCq4sGvFwKgJAvRCBs+2FMXbT/xf/xKK2+bG9J6UNQCE9Ob6wEX7Hr7d
         6m3iZ9P+KrWnZ6dxEdOYQiYXeiPGM8PHmhqF5jcT6wk8fapUjJ2pPI4xjEPUEX+l8STD
         3cuCw32RsLK467pJ4nu7b6uVo+Zlg57pAeqMoOVwnpw3GVNVeViDeAGVJyBNJCsmpzvb
         Exsqt4SLG+/rOoy2kOTYS20YsdEX7UlDopAJRk4leXtxDWYb46z7HfA0zmZCe0V9ILA0
         uQ9gWfULPHIbjNtAblCsCzEUA/1yo/E06ZDL3BM60maIHdbi0Ze7dBs8QShIT46X6zgD
         4VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271562; x=1730876362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=;
        b=gyHc7P0xyUBn0W4KkiDAIYLa6r5bRhvwm0mp07l2Srn0wtfHSLGwemC8m6LkUQEogi
         ICpvxZfqVwSAtG6Dqb4Vx7LUS7Um5CEqubY4nEpuDGjf78CCPav1wS4HrNstJnlBbpQR
         UX23BytdnxTwGwHhaEcYLNsrS3yKqqyYxAHg/QgJlHnLRqdwc4z5GLaXFn3UccddUSbD
         MyonhPxQCPS7yV+iLrRfVvyoxJEIvUH5oaL4CE8o6LAQVCKTod7UMNmuB6ZT/KMPsg5j
         t3I1+K20beUR/C+XaOjDNuRMQWy1AZhww75jshznxgnE24IK9hbgLElSdwPZIR2/EJc+
         PU4w==
X-Forwarded-Encrypted: i=1; AJvYcCV4Nv17f4uIHLh4sLc2ulUgM9VQxwRskmczy5PMknFTcYQyetGI6bHPwDGYOS2dHD9TcOVABoVdUyir@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEdchdf9mJFNTEO3nUij/tYLSNBhVL1xtkvHxsEeRjw2/Hbta
	7a0MBik0L/3R73YV2bKGoWvRJZ1aXvhOSrunbeo2mNpw9c98W6RNUuQGfOg2QvA=
X-Google-Smtp-Source: AGHT+IFyqfOrZ4MI+sXiINodrY0EVZIGOc3drYiZoKJHu/kEVijxTqjjc6wOezZxjLb6iMiKoIcUbQ==
X-Received: by 2002:a5d:638b:0:b0:37d:387b:f080 with SMTP id ffacd0b85a97d-381b7075edfmr1643140f8f.15.1730271562350;
        Tue, 29 Oct 2024 23:59:22 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm14695531f8f.67.2024.10.29.23.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:59:21 -0700 (PDT)
Date: Wed, 30 Oct 2024 07:59:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <jzihr7yp5ftyl6ojhtnv2r4duos6or6hozip7yxxodycokwjms@nfa5clftyocy>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-3-afb0cbcab0ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv6ynghrtwc3g4ok"
Content-Disposition: inline
In-Reply-To: <20241023-en7581-pinctrl-v9-3-afb0cbcab0ec@kernel.org>


--xv6ynghrtwc3g4ok
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
MIME-Version: 1.0

Hello,

On Wed, Oct 23, 2024 at 01:20:03AM +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pwm
> controller.
>=20
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

LGTM

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--xv6ynghrtwc3g4ok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmch2UMACgkQj4D7WH0S
/k4AsAf/WTL0HrSsNuwSLR9YrYS9gYAReyTQAnpm7wbARGWjQE5VLwUF+noWxWP/
AWmOyJdCsgTFs3fXzuToK5SrEPTcsLv3lMAZl48Q7n6NNxMfHFFQSnLp7h+ZRKxu
OQcfRE0N2VD/4NNDTlKZ9/LoTUTCFhJzjlGnhI6YlEe9Rj97KA1GlBrpneUUfXJ/
ukXdcpGeN4W8DzvrzZSLjZYKT5EfDoFA0UFX6cDS1dZbe9LeCH/v13KFM5f7p1HU
+rs9IqNp62uk4YBbsaRjExCK9pcQsQMK/zxcTUn+jMbqR5wweK0wtulbSUdgChQE
Q1oE4Hk6LfFUUnRHCMrbhDER34YMOA==
=rEHm
-----END PGP SIGNATURE-----

--xv6ynghrtwc3g4ok--

