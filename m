Return-Path: <linux-gpio+bounces-13084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3E9D174F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 18:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAA3282DEA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 17:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F801B21A0;
	Mon, 18 Nov 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2r1ToH7D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997318B46E
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731951626; cv=none; b=YFBtZ7CwPaw8L0rl/CksZtl4jOlEhjpDwnAma6DaCCejuJkZukwVZLFv87hpkPt4hGtarkU/aeRFqnkXiEmLPTNs15rPwgpqZfzGkZQPDb33RT8idCtynYg5MOCW5uQjTYZPscVe/mebdCk4Zu7J74BWZIofkk46CEGZ76sdvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731951626; c=relaxed/simple;
	bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a993BroolMhZ0mU2E/YjV/fhix+505EBrTfovobrjH9ISt6Nqw7PhGtKK2XNATu2Fy0bqhCglVo3za56+tVJ96PLW7xNwCfwxuMCja7XIwJ6vSOEK9Tiwhe9OvKb40T0H9YaM0P/zgt1qxnuaDINezlk2RufM5/OZqsM10YA+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2r1ToH7D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so39215295e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731951623; x=1732556423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=2r1ToH7DkB1PODZpX6WrAs85twuB0dCTANxEEJrHLssz33/hPC5z5a9Y8fb4I0bqzv
         mz6NHGrJu2eQAEbHgdIb9EeYCDtIFVbzuwGmQA78YqAY8oU70ThJhRtFh7eOhOZwCgiv
         cP3rJiorQqn95L2yJR5bC92qIqW67oY99AFbiRnksqW505+4GDw5dZM/vXZCYf6lR93m
         4Ny87OD11zNydu2pToF8PmxVrLTbkIc/pgNOE8ZdtSKw4hus4KdB6oQnmjl2xPYMdZJG
         KcdV4Wja6/dbzXSx0j/A6hc+yqRhAw0dLZcbk2JngY7UrzLB5tI4lF5oK7gNfzEix5NG
         c4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731951623; x=1732556423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=Pn53Ukl/nyT/Nsbk9YiRAeGA2nZtd7yOWhCCT/KzLfxwYI70HvM8b4FAe5MVWDS9po
         XqADSRiYOwI99fUCtcl46vD1d4b5IAhh0RbFbqFtw6veae0BeYCv5R6BtZQELkLUS1Br
         hukczq2wUeSGbkfWg/4bgoM+i2/sn0ygkL4m1AWLYs8//EAF6tIkUFRJSApYxx79zK7t
         yN6bJvyi0mxvRuaWFXqoZNMYdmQrzkwzrcsrf3XJYp/mhtQ0/C9XYM0hr4Kdls1mATyL
         NFy0Kq9fwhrjxRWptgo6hlrQuNovGS4lTAsozHHxNbeCYQPXrKh5V5HoV/aZ3t3nHdER
         fmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUdNGkIGCsLUL9L1raZBbmP/hxQ4FIrggQ6PcSE8BNAQ9qoVS0qj5jNOdPudMj7ScN9AzwktnKut4Pd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeb3J0HRjM1dXEs4dg6wwWV0jlgF0sdHExnqIAczwgDZUEnp/u
	dXwv7+HECFCrJ/vAnA2c2ktnRTSOKDDpsqg3AYW6VBeOhK46J31Etm90n8cVX0U=
X-Google-Smtp-Source: AGHT+IF3nj2yHydrx7Ks+n+zytE68ZdQxoMq1sSNeM0Nynyzk3P/uHdIYwyssSFKYkQ+6vZqXuvURA==
X-Received: by 2002:a05:600c:198c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-432df78a99emr105241745e9.24.1731951622735;
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298760sm166249345e9.37.2024.11.18.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Date: Mon, 18 Nov 2024 18:40:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
Message-ID: <kpbylpee46nmxxvzxfbylscfafrlkpzjt37lkfdt4vtoq3qvfc@5v7khvwwohty>
References: <20241103-en7581-pinctrl-v10-1-1990fb6996a0@kernel.org>
 <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5bt3c2qqssojeolk"
Content-Disposition: inline
In-Reply-To: <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>


--5bt3c2qqssojeolk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 02:56:58PM +0100, Christian Marangi wrote:
> since you gave revision for v9, any news with this? Is everything good
> now? It's sad if this last piece doesn't get through after all this
> efforts with the previous series :(

I'm sorry. I still have your patch on my radar, my todo list is just too
long to give feedback on a short-term basis. See
https://patchwork.ozlabs.org/project/linux-pwm/list/ for parts of my
queue.

Best regards
Uwe

--5bt3c2qqssojeolk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc7fAIACgkQj4D7WH0S
/k6GNAf/Uv0TP2XG1eM5gVUAzPsO8nIbVqSQu0qVstgU2m0w4fwe4Sf5ikqykVsD
jeYs+uIgK1r055ifeUSf32mcXOb5nW1GPob8stTVfViOL0diAuv4d88kPzGnDi/D
vn+BwCd2pOi6dGopB+ZqtajsRasx7NNFvTf8ZRcq5V0/kpElLAcLQLjAJZGigjbt
a9d1Y1lnBUk+GeCg1rLvNDo5MPkL1t0xcRZgxr6qp+VVGBuO2SsL2IpW/eZz9HU+
M+evGLlT8hwlrNoBgZQ5vGvfZtda51JmcHTiF9b28iZC3pOnws8QiXpmznPlVhDN
5Jp1+kkmy5YbonA6ZlI/SncX7LzzKw==
=eBCO
-----END PGP SIGNATURE-----

--5bt3c2qqssojeolk--

