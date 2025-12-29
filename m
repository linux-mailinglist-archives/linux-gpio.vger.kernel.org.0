Return-Path: <linux-gpio+bounces-29973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2068CCE60C4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 07:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E893430034A5
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 06:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC64423A58F;
	Mon, 29 Dec 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFduY41G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13522333B
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990885; cv=none; b=L4IV3Uq7Wl/ptH4xTKyRDlU7hsUPkZThOkb+YmMlYactfEHnKg5zvnUPBmuy/NNK5Dhh80rA05jar+uvPjXCVjHkmxp20EHNVZf0QFLy0E5fPg0TTfngpaHqfGWIeQbHuENqgiBWJFNUlW7Bn320a92gNtrBY8LMF/b/0jVPfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990885; c=relaxed/simple;
	bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CITI2UOWfWxmcX32VJWxYEYbixBN/2hozU5CgvUR2j67XCcWuhnsfm3AbNBEZz5c25yqhOxCpWmoHunUYqZukzHlXwic+RiB0lU++5+meSsPyv3/xSxB+FIQVP9oabqei4nUOKtsYgBBfP1I4fshkgdWTfy5zOEcBckNF64wmlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFduY41G; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1299519066b.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Dec 2025 22:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766990882; x=1767595682; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
        b=xFduY41Gix57+U7ifvJyavEcSA7re5yz3g5JhhXQqY8cwv6VBP5iGvNlET6qVDohdS
         9fGbV7771Id/xLUIfDRCb3jSDY6nwnn7+IOZGg/QpolIG+WcVLTpoHJvB5soE8Q3lQY0
         /+pB+/l9rCvwgrRQFJwZr/hh+xDgbK9SJTHU6Kq2NrltRaQaQdavQ7Ju5ttAWhUwXOj1
         GGxrZsVyKaaj+CLzhzUMwgIIEFuTAmab5s/wMpngnRccojoaiDVUhnJ3Yhj8J66Cs1vF
         WUYcCrDaIH/hGPmKTVHVEFyE0Fx72YXKEB1LiOYY07MeXrBAAeCsZgU8kiokujj+7bNL
         mS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990882; x=1767595682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZvhZ7NpA5Ybm+ZyBhQlb2l5FV9Gu92NCEHcOuIiZT4=;
        b=GtR0vYJgWKGZDXl4KF65GuRpPnqlDk7X2xzNTs1Zz6kzuxoC+puH99oC2QEjTznGud
         X4hYGYtAO3qFlKij6R0BwjucDzxnU8DoDhpbEFH1eC4EeKxgBOuWI5tiTsdP6Qd6Yt5M
         z4LxuLLX56uwY0Kfao5P4hg+jzOWlrWDnSWbXwsNB1QuKhvslABCBnTeyRcaYqYm3EPl
         h/Et1jkwLYmdWFhmZmaxRBXwcaNoZjOwwJ5OlFqG8N26Osm2FbPU2HTaxtFVbgawXRVZ
         LHEEnWFvtzP8HbbGUZhTKQrQfdlwB3TDPTCjm+Rrikf3rNBlEvjvQIxOVl+3jj9JaCzT
         relA==
X-Forwarded-Encrypted: i=1; AJvYcCWN4lhx42+98zi6vgg5DRXbVFoc4qKiZV/y/JLWNb5s8+MMhVs/UIMmqU3bsw1fBDbZL3clvxfoECaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfHg2LO7Gf2gabSnHYn5XSeLLCosKKsQ11GfZAtRgXaqXfHI9
	nntMZTCC7YZ2B8kxlesVY/cal/aapKTVFEBNOn57QBpF7tm0N6CZyUUXso1kpVcEpbQ=
X-Gm-Gg: AY/fxX6zOFTFLl2weyRS8R1G+p8jxuu94+hF/8fX/oYdVUB7IAKXKlneX6D+rP9tyA5
	s0nULWQBO4qvvawgacbSSB5nwGzCy0Ki+mymRpQerUcv+8xrv6SHmxQs8XPcS/Tx8fjWSXDsYDT
	0t7SJCScYT6G5U1RyzQDO/oHgh6imhIJ7ECnRBpSiSQe5LVfWRHdtbX3wgmOal67CNBaOdq4xfp
	jokybA3jkprCkyXa5T0Z02R7FeOgi+pU7O3ZGdAsUXii0fwoJDqYRvE8LAM2lCj6y/PIFOgtH2R
	WYizEBQ/muehAf0ronx+/DTXUQnL7UDXUW9h5zDrVMDum2gxmcW5MkLIlVkFbO0dNNCAhL/B+10
	5zZzCfINUP0pybUfK5bFvm3oYTt1xMPdirCnCyzK0tZEtA/m9wFSD+fWIIoZuVW6RGM+NKhgiA+
	PiVvBq2UzxLZ68k5fbWA==
X-Google-Smtp-Source: AGHT+IFKJOEnoMT9pd7t4bMOfdAuLJ3dwRnOBx+hhm/y0iCl4h0HCimfd94oOij5S8bCa43IL/8WUQ==
X-Received: by 2002:a17:907:7f15:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b8037159828mr3025066266b.42.1766990882195;
        Sun, 28 Dec 2025 22:48:02 -0800 (PST)
Received: from draszik.lan ([212.129.79.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm3338654666b.25.2025.12.28.22.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:48:01 -0800 (PST)
Message-ID: <fe1428dd0d6b744ad3c57bf5797550b54f85ff96.camel@linaro.org>
Subject: Re: [PATCH v5 00/21] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 29 Dec 2025 06:48:21 +0000
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-27 at 12:24 +0000, Andr=C3=A9 Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
>=20
> As part of this it was necessary to update the regulator core to allow
> regulator registration to succeed when supplies aren't ready yet,
> because on the current user of those PMICs (Google Pixel 6) multiple
> PMICs supply each other and otherwise regulator registration would fail
> altogether. This is implemented via an additional 'regulator-bus' which
> allows us to keep track of regulators with missing supply and retry
> supply resolution whenever new regulators are registered.

Forgot to drop this paragraph from the message, as I sent a separate
series series for that in
https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linar=
o.org

A.

