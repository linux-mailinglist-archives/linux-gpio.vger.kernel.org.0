Return-Path: <linux-gpio+bounces-29896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 67231CDE092
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 19:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11D9030010F7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 18:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF7F27B34F;
	Thu, 25 Dec 2025 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkJb9XCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4D1EC01B
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687844; cv=none; b=PBYBSWWU0bLnxNgkQT0TaCm0Lt7BFXJTaH/v3Uv4s6rmPvyeo7yTNXnGVpbIuLu7MHWewSgP1JBoLUcnHCG7WwJzovUrPzysUPQr9jv4BssovdN+K1Mb6GRAbJX3Lgy6TwHqfu4upVv/lSajGn1XGx/BeATxEf4SfBsAEjsr6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687844; c=relaxed/simple;
	bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VrTbS+lDZmlUst6DybaFeu09MwnOc46bvCJLXOsL+P6XfTM6t61owHBj7h5vFIJl9durxM2mOOo2cMdaswDvUwb9stqxZim4j2mowjiD1uzquxaOXmy9w68tkLIkFRs8WPsfBFdC1ycfngAdn8hMm/uSqGCEsHFgAeJp1CbFD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkJb9XCU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79e7112398so1177575366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687841; x=1767292641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=JkJb9XCUAWeiTcMq7ESspZPfSsOgKBWu/brlSnUIZFwXWE2q9i7iixd2K0CF62grQl
         0qBQnU7BdEfoAt+s9TwV7Kgp27qW0tgwjsm9+qKAWDVmNAVMNz5xJ30fOVTG/XmCgPzK
         lD7/o2nVn0cDUnrU2ANLIAO6pHh7DURb3tRLYKS5L/T3eo72BfoL/MPXIAtKtZIhydac
         v2LGmtCIA+PJGlD/IrL+1qIzpyvghqtt1pI6E6bntfV0qnBYpAeMnjElJPIIhMh0CP1d
         1YszRu3IBy08gXRX5gpb9fsW7AQPZoEPjVv446x5+UZSKt/IyudW7ykAWmc2/dRmRwWC
         DGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687841; x=1767292641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=d58cto1boYdVwdq5HmCuuNb7iGCfd1BD6nCU6vmGy9l88wJcCOQ0XAsfEkbiIg6Ey4
         R8F+oeYS/i1w6n3y5T/xT2T2jw1ICvppSMVLqDSga6qNjHefPVfe7oe8l0TW4Azt3bwn
         QG4KTY18Sa3IWlfcD/HA6D1GSq0oHVsNStXm0O9joS059F9JYpA2WjuklDnywwjbkWbN
         0WyOtdRbPMCZKlE/VH8O0GG5dvZw2lbtkdWHplefVskSXkzRu8TtW7/olRjSLPPGSlIO
         CTOcNMkGmGt8i99zfGxaO39/JOulxRoEpNdX251qVC91/GEE7O44hLsKCAUL7uB77/8z
         1HMA==
X-Forwarded-Encrypted: i=1; AJvYcCU1b77eg3moo5Tu7eX3WP0eO3ac4ZnR37SHjnXPzpRc4DQYqjMGBEcnWqjQTmXE980inb5hYTVHV6mR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60BPaFS5tOIP9drdF+GDsoWJhlZ06t1f94UnkmVcLnzc1efM/
	F84hBNavxulCRjDyppQ4ixy9cwmnxGQVtq4s6OpaKdWHbGDzE54UxO1Z
X-Gm-Gg: AY/fxX4Aox41SheD3m8DUu8EXkcDMiIavDpYckyxcG2ZyHNkLkTvsHJToF8caIe7/+c
	J/LbkP/vWLTqVMlfHy1676S+whbaExbWTys565jOKfxLipTKF4OioLzshhdG3cKIgIOQdQYOIjA
	8F53Oe2CTOvyloxDILmnCTYdix5PKywmabHKO2LgJiIzYfIRn9bDaLuh6Df84Jf9zZhNYwxJ6C4
	nEwmMgJIorMArAmcjkcdIxWLtNWbnmFFhJF3XL++Asir+1Ozq5HgKNr+VC4dcflmRQauLevIKvE
	yoZIE3781ar8kHn97JBH1nkFuuQt3amMRvvAodU1Rr5DC6HMeBMadTRF/9KM6+T5BxRGHkaq0up
	Yl+1NvMf7wYiwbKuXPCWEA/H+51ClO2gJwmmHMP1Kcpw98lRlu2s7+YQkWTgJb5tn2OJVQLehh9
	0DVX8FWBcL9otlLCtB2D/tK6bXQI5nW0pm
X-Google-Smtp-Source: AGHT+IH4B3XzX8QXujzZunFfKEc/cY4W3MiVUX7/1rzA6qLulDTYIhj8orR5H1uD8QCD+qBxL3d2xw==
X-Received: by 2002:a17:907:1c27:b0:b7c:eb19:6a3f with SMTP id a640c23a62f3a-b803705e31cmr2146669666b.35.1766687841205;
        Thu, 25 Dec 2025 10:37:21 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm2033127866b.34.2025.12.25.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:37:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Subject:
 Re: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios"
 property
Date: Thu, 25 Dec 2025 19:37:18 +0100
Message-ID: <2409366.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-4-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:14 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The P66's device tree includes the reference design dtsi files, which
> defines a node and properties for the touchpanel in the common design.
> The P66 dts file then overrides all the properties to match its own
> design, but as the touchpanel model is different, a different schema
> is matched. This other schema uses a different name for the GPIO.
>=20
> The original submission added the correct GPIO property, but did not
> delete the one inherited from the reference design, causing validation
> errors.
>=20
> Explicitly delete the incorrect GPIO property.
>=20
> Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



