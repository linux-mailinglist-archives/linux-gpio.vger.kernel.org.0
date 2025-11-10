Return-Path: <linux-gpio+bounces-28334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51470C49B1E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DEF188A351
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882F23009F1;
	Mon, 10 Nov 2025 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhQ1D1Km"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEB2F7471
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815867; cv=none; b=bHv8TPnpEpm2Sks0YkeBUNg/kbZhmwaCpJmp3vxOL2l7NO16s1iHcdp1BZJWkvDMSLn12JWst8o5sI6BURUsubId94zP7cRZ69Xnmduth46vKqGWmUKVL1mCEaPAXkoKNp6JjNbFUtBaN2GYCIhRffhNh/MVwAujbvWZLWWB7d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815867; c=relaxed/simple;
	bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLssv6GrEzAKtiu9tQVfH9xSw6L07mgdFHc9xNHOXdcusGYU+R6mUWhWWHePEbdfLEJLvrCDfppNp53l7BVQ3lEkWzi6Yy6osj/4Y7fVguc0MuFyJMzRQXfWV0rq01y63zZqwx0etfoRiNzjhgYHvpARjFtvJ4UABq93YMtUg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhQ1D1Km; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78665368a5cso34201757b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815864; x=1763420664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=UhQ1D1KmPSyna4F/76ZCUiG8KhIv95nF4dhc49qrIM3p2GzZR8fl4PtKw6Yk5uaenr
         Jxo6B1MPDizlQu/eAzhlHvAjPysa3NgZUqffrBat8sUZCey95AmWJHKnSMiP9zRpfVwn
         yDf7hD9zPMNJY5K/TDMfIBp874x/FBBHi88+dxfp8g2/um8X8UHQj372t+OGfbo82eR1
         O1hbOAThw5oCk4Sy/TkWbTHXa+HDjeRny+D/HCyIsPlxXxKrnhIkL79zMZOuophqGxN7
         HEm1Hqzly5dxGv5sdqIOUUxBQAtVaiVswEfsuQw5gUpO4MhmxEB5Nma4Cgn7+HcHKITN
         65kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815864; x=1763420664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=o14QbCg+XM4oUkc8W497SP4cDK9RKqaQgRXd/hrnfet4/617v4XDUmuYEI0pVyepwA
         A51SNbvP3HcsLcqdo8d+XJyFMBBXFh7mfwEaVHzR812Jy9ShlizNE/YhhjrNB6ATr2BS
         gPlxwBLzoa18MrdrV3o9/AKotcflV9CCQuYzlXYYLiz1zgjCU8qV0RiaY795q8tu2Zsg
         7QQT48TLhzCk6a8s4bfnG8FpE+A1rzTpJV4GK9snVHHKOLlx4xTlsjvaDjnAndpPoJtb
         Ap0I+kjbFMKoXlDzSoaCnT5ODe3+KjkHIfQnvX13fBLWMqLMwXVjfXN1ZmAKIVmvEiaf
         MiHA==
X-Forwarded-Encrypted: i=1; AJvYcCXGTSYozSFleq+fqhp1+HZSolL19QHSsMnbHNF/Z3Yx6mNZ32FifS1sZUvstpxWofmQ7JnixBQOdfPO@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvgWNRbTAl1tbmMydNqpgS33P04TIdBXzpJd4VY7dYztZYKS9
	cCNrwPznP1knlYBcUGrdC95lvm0vbEFhiPLs/oFh7iuEWelsfakAzp33yoG9JSDW0jkcGUVq1iW
	N+j1K/uROiqytcHstE3PV2rBolCT3BeIjANmTnD7ifA==
X-Gm-Gg: ASbGncteTxecsQd8fslPAVRb6xzrcy5qBPbS9q95O8/N7ltEoK678zDN1L/zpMaAMgK
	RW5PqPx/cyRScEX/zONxiXpzspkJQYvuxAT9+d6yTcDPK90VLD+X2nynCoMXE+EGwVyGZJjs87i
	g/WtFmGrJauS0IaeJaTDcLEQ7cafqamGCDKBNMNgNEKUecBnwstjKeOllDxQHZBPSdjoRnFCJ6C
	sPzn1BKQe9tU9h7spS5JqtiD7b+OXZo8sPi13XWMbPADWZexKnlapxloWcHLiqLxGm5uGc=
X-Google-Smtp-Source: AGHT+IHoC/R8TGWkSsRmVYTrTznpjr4STw1JDCmsU2sbR9qoad5PnTy6Rrlwiey4S9ikwN3xlZNQtXBlBuI95lMoqZY=
X-Received: by 2002:a05:690c:6385:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-787d541b7f3mr90568307b3.35.1762815864323; Mon, 10 Nov 2025
 15:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762327887.git.mazziesaccount@gmail.com> <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
In-Reply-To: <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:04:09 +0100
X-Gm-Features: AWmQ_blNtjThswk7W8THjiE7tdsgu2zFtwGMw_ARgVxMcfWy78tjHu1U0YBhMO0
Message-ID: <CACRpkdbP-GZXtj_-AuZ=q8zUKwt0qWQ1L6v7WsoQ50JwTs6JUA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: battery: Clarify trickle-charge
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:36=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The term 'trickle-charging' is used to describe a very slow charging
> phase, where electrons "trickle-in" the battery.
>
> There are two different use-cases for this type of charging. At least
> some Li-Ion batteries can benefit from very slow, constant current,
> pre-pre phase 'trickle-charging', if a battery is very empty.
>
> Some other batteries use top-off phase 'trickle-charging', which is
> different from the above case.
>
> The battery bindings use the term 'trickle-charge' without specifying
> which of the use-cases properties are addressing. This has already
> caused some confusion.
>
> Clarify that the 'trickle-charge-current-microamp' refers to the first
> one, the "pre-pre" -charging use-case.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

