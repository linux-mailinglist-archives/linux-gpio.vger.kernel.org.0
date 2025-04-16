Return-Path: <linux-gpio+bounces-18975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39CA90862
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E20D19E0645
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF292144C7;
	Wed, 16 Apr 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xslu3yuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8BF211A07
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819775; cv=none; b=DO0T+4xOBhoJNATb31oNXR/H4TRUmUUDcYCGnETsaEd+AMr+kD3HRTi9fnNBYOw2Aypx+KhD4oEf0+pVKXlJ1fMgQVbeBNQ7qLcmLACU/xfmoI8XCInPmy/DG70dUVy/VNiVh9J57Wj4R649YwCz3/LrhfX85QoPjScPobWoCyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819775; c=relaxed/simple;
	bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWO6klSi1tQckk5mLx+7SAdGP37dNABqrk8aVRC2DF3v9XTWfRjnFglPA6F30PRlcRwD1ezC/lmdBC5ac/Bp7yNKKxS8fTSGX/8C4gZZICAPS0uyISx2J1beOwYk7401SRJutmEcCqzd91hSZgCgpiplApz5GI3pq4V6iey806o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xslu3yuj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so60561755e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744819771; x=1745424571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=xslu3yujU9rfen0sstCfEHbTKdZNTT4pG0iSV1QQHlEFENzfycxQ88MVbEITU3CD53
         /Ug2h8sLkbKnV6RcxMvxyG5tZKu7WpOVytUfmM15n/8xL835qJ+RrWW9rNHs6VAdiNTt
         6iCEE9mh96JGwexEmzcn3TDdhXF8kzYwzO+GpYlVdoGyltLaaJseNEACrP70PtG5JRSt
         ydWsrDZACzCWXMbSNtF/masRf+OgbX9DTR/Kt5kFfensWtN9GjLq1YHiHQcNTx11dmBy
         QLJYIZexzKUEAUT/G4AmsxGmyfjzAxqMJj5KzOldkkoBtnLkKfH0R3bDCc2N0BJ2geSe
         +oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819771; x=1745424571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=QejSpeCuBp9lNTv+xyFQbwcK82JgvpJR1B1RpuoAqt5T7my3uumWbg/AAAwPPSZkAw
         mF88XAN5N3HFmd4PgI4QG0hjIvMRmL3uSx5CkAWrSI/h37BKgMGroGCQ2UV72LaJCtxW
         j857Vw3tfmqUmAYa2PXoIyR6vHOcaICOinQ3B1xO22MrphGSxY0OxJScvbRTWLwX6vkV
         MF0v7X/JZ163Sgi4m93vUz8MPzlLEBy51g/d5jXBZpZxkoLg9C8O7QgP1qUb55PP5Vp5
         H3nN8pTzrRVhItYqCNUN3q+gsDvGBP+K+e88KeVj1HYlDvwlXZAWd37htAE/hSbf7Fd5
         HMCA==
X-Forwarded-Encrypted: i=1; AJvYcCUVV9eik5e+GceVXyBqZ15GmAhy0wZGDsugWbnRu+PYDHJY04rrGKmudRkzC/DMvazvLxBdY2br6hpM@vger.kernel.org
X-Gm-Message-State: AOJu0YwMj3g6c8SgLKuxrAdzBmuwxB0qGnFdCnLboijelrwUJj25DWMY
	1YD1yEfAa3KjFR/UF3EzFnLZSMRwmIxbPya0woxL+B0I74DSBnZzzxSm8Ayy3To=
X-Gm-Gg: ASbGncs0J7wkSgm8w1Ihm2wlUWegPez7EAhQ2LwcRkUAZmyqPfq9fIUXof0SRlm9Jvb
	+yu6WWlo7C/mpKeaKBMCtQo7rHYTtk4yzu45mluOPoZ6dJ5IyDs0y6tO37B9ZuYSpdc8bhLvBKk
	mTxhR6q+S+QR2yt1d4FeafzQDWDZHnnHsKeaKIjRD4GGdd8eIPwoLo+RA9aVuotb1/84UlcZQgI
	MTiAtlVn2MGG8HWQNftXQS0/Dpms13oxDtx6CUX6l2+pV138sV3BJIjrwDRdWEJEmjX9Ym6EMix
	8b5E5nRcVBDccqi6L0iNTs7nWKn9sm3RC4JctptgR5xEQw3GjN7oht5EmVR0/4Xk8Ox1Ug9dlVz
	huih2XMs=
X-Google-Smtp-Source: AGHT+IF3ZHpE7zJB9IQ2y8x59SUdSUcwVopqWk1Zp0WNiDguj5I7CqqTziJa38Gb4iY+V+RufRzqeg==
X-Received: by 2002:a05:600c:3ecb:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-4405d625054mr30574145e9.13.1744819771461;
        Wed, 16 Apr 2025 09:09:31 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b4f3df8sm25248205e9.24.2025.04.16.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:09:30 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:09:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
Message-ID: <n3pyida4e4qhzzeyp4rpswiwiomgumgqeci7lwuimr6r4m5mxy@5s3w2ab3p75p>
References: <20250415112339.2385454-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed2ffzrhvzkyt6i3"
Content-Disposition: inline
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>


--ed2ffzrhvzkyt6i3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 07:23:37PM +0800, Chen-Yu Tsai wrote:
> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>=20
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>=20
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I confirm this fixes the booting issue on the mt8365-evk.

If it's not too late for that:

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--ed2ffzrhvzkyt6i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/1jcACgkQj4D7WH0S
/k5aXAf/UP6i2a3y5UocoQPs0pyP+rVPxb+aRfLPNEEqjbC2EfKVw3TBePDcSXYw
62fTt6kjxzOwm4tDzLbKcDzMIqHEIs2W2mE87RbAtUcp8Kobd1qUPJD++4lcIfjO
isr+ZlQXT3mG0xCiZF5AHmhgzz4c3Ggc8RqeGDYCxzD3hj30XznRrOTTCv2wovzt
Rlnu37XuzkHOGMJly86gPc5LSJHDUMyNs/66hNb5h+1v95Hpe8YZ+ZXreQsE9+8T
9QnXW/NtxHg37nY1XIxdE6pBbUbz1jF8Woe83eBWDIwciCTpAeQ+WOFk1bLKf7Fg
wRAaujOB3aa0qRpq3UL0vErWjNaMzg==
=PJFt
-----END PGP SIGNATURE-----

--ed2ffzrhvzkyt6i3--

