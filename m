Return-Path: <linux-gpio+bounces-30064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A469DCEE575
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32ED3300F19E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA542F12AB;
	Fri,  2 Jan 2026 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cc772S5a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E72F0699
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353212; cv=none; b=KAHVtS65p0W4Gr+o/W8DShYepcFaemCt7vx7u6DOOmuHUZGwurgccB9j8q/NYlYleOsQkhyT5wuicqyIDY+sWMxpg9iXjOkE11vWV4ZZSA4HubdEoB2O3nm17URVhI+yXEvGQZRsiZnukb4SvWRSRbzxMU4pvMUlyp6HL96S2x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353212; c=relaxed/simple;
	bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JZUNTIQGeAa/dhKhAaAfnUNRRMwBVcJXSelFmsbTdxbssy5Un7H7tqA56Un3T7PAn9LOEqqf+FU7G2bmgUck4VopVicRZATBoYq0YYcvtKzt8ItLcPAzz2ZyDsUMx9iuamLkVJNp7RbkxFMhSuxlY8Rjx0He5eQ6Oh6NSA6CAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cc772S5a; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b804646c718so1323444166b.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767353209; x=1767958009; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
        b=cc772S5a4VMMUdVSNVwm41kkCgYEgXMQr6YIlJKkgaP4LQvrMPOpAi/v0v+JeM8XD2
         W/8Bh5km53LMoX8TOcrXNvtU93GWDJNk6Ll005AtHiw1rjohlik6X2EKzUpGFWBh9SIV
         CEpo4mo8H1YBusC3JR+rW5CN/yqvnim3TjoHleMXyORMq0GrzXYwUsasqN8ycpQ0WWFG
         P/CmA86qaS1CQ6UelBIAWMtW4+V5JPO8diHsyMo+paDrq8S5NIm8J4EcBTwS47SssA5r
         pGntSTkoAqaeHHVIjQi3fYUbGKUvbWMnTz0dxdf0+XVxRWdzJFonIXUTnWYs5EUMDcfo
         HMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353209; x=1767958009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
        b=pjTMnni1qzy5JShKIKPMEENF5WY6LSfAjJTdGafNMfjP+I5COKZ++X/28onuCWAVql
         rUi7xm5+/hwyLP1KLY6be5FFqTTDx0+OPqZsL587TbVfKCi6BieF+TauNvuiJY3cZtr/
         BNh12mkRs6HZ8SqfJlDlPzLC20FcugICFilTyn9lchDDBti34t5xYA2M0awtIFu+n12U
         4atzWl37O5mPJvBzNVURhx1TwEr2X8SZ6l1suYNIV85T6I0Lwsqcmqp9+MjK9MtP88rY
         TMJ2b3oZg3GEh96K/IyF+X6BSOXIrjD6dbNUgx7KcT/RoIlnY+fRHIrF9+R0BL82JBXF
         73hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWirsxMHAzwGqb+WUJUcRGUgugJvXZqnRiIqLEuCbmR9gd+GXnwSNFuxJ2ypB3hvdPZvvaCML6O6n4F@vger.kernel.org
X-Gm-Message-State: AOJu0YzYM2na+viNYBEPAswIR/IjdYuDSP7QHMgJ7jQgqH4gb5o8uzvf
	fSRD9Fc8Pagt3oeJWdxPYUwG0Wo/d5g2e4gsWtYVmOGxsIyq3kSr9TG6DXJk1p1Xg4s=
X-Gm-Gg: AY/fxX7YArHlpzM1hirUmn1aBeZ8r6Gxp+vAlHTy8EmLKMN7wpoAyckA6GuwmYolqx5
	xbsgsVNsLZ9fP6WZ9hREb0H17ADenbEPADKg4zgjCukT3/C+YbUOQ3nIWnt56vU5PgF8qoRvrKy
	37z1EuFhL0HCjXcGbmP8A4kwR0BS0xnLDnFeShUH5BKoWIXl07Z5rly4LbmHJcauprpBGFsFoon
	TNeY2FGPteCwCG+4apmV9rCpeWZlmlFlFg7lveSisq5DqOkIXnwBYnymLVzf66aWggu2zaNHKJ1
	FfyVXewqYKM7Mx+8zKjzwnwE2AOj2QP2cj/6WLhU/SvXxLMb/jw6erEuYcpnh0xAlgaVUO8/ypn
	nMYYI6mcljCJ75aZl1zAREJ3Av0PUlBrWBZjCNLHyVlDRdCxNqOobelD9xpWUBLknUvKYze84v/
	K6zpwqGQlwiSufmGzJmGqne5QMzA==
X-Google-Smtp-Source: AGHT+IFb1cSu9KLCyJKAobmw+k0POeGJfgr/xC7uOSmUiVHIv6vit6M7ROfPJPxEhme+Gx1mdZY0qg==
X-Received: by 2002:a17:907:7e84:b0:b79:fc57:b598 with SMTP id a640c23a62f3a-b8037153443mr3708113166b.36.1767353208658;
        Fri, 02 Jan 2026 03:26:48 -0800 (PST)
Received: from salami.lan ([212.129.80.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm4468179566b.18.2026.01.02.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:26:48 -0800 (PST)
Message-ID: <4bfcb1420b9684f67bd4b8f583313c1a08a1616d.camel@linaro.org>
Subject: Re: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional
 on s2mpg1x
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Will
 McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Fri, 02 Jan 2026 11:26:42 +0000
In-Reply-To: <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
	 <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
	 <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-02 at 11:19 +0100, Bartosz Golaszewski wrote:
> On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > For s2mpg1x, enable-gpios is optional, but when not given, the driver
> > is complaining quite verbosely about the missing property.
> >=20
> > Refactor the code slightly to avoid printing those messages to the
> > kernel log in that case.
> >=20
>=20
> I don't get the point of this - you added this function in the same
> series, why can't it be done right the first time it's implemented?

Sure, I can merge this patch into the refactoring patch 15 - the intention
was to have incremental changes to simplify review.

Cheers,
Andre

