Return-Path: <linux-gpio+bounces-29895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE3CDE08C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 19:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4F423014AF1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 18:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A43B137930;
	Thu, 25 Dec 2025 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Hl5DzG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4D2798EA
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687775; cv=none; b=hbgIXk2KWA3jejm/bjHcb+vn9BbFpk/GiObE1kdCe+kIBNi1XrvxaMmr8csm7Ffe5etq5Ym0+pZHPRX2YPKgWsCWXYLcseFGskjiMVYLQTPKxePWh6ou/0WDCf7LAuU0H/s/54PQB2qe0A+bPUBFthJO35wLXwD4yDm/rwRBBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687775; c=relaxed/simple;
	bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVzOnh6NjTpyapZyZEo6o8vWrWrcGuXf3IOG9xaBnTNUj2X7pAkvNZ0KqQYy5jk4WII8/uLsNTosy+hP257+gpHEeYg2rOtkQzH52TXw2y07I0prB5OCPA0U5sOt0ZV7JbqvSgSSXYe/3176VmwV3HogITTBYXDvQd4QwKnnRJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Hl5DzG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso8066708a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687769; x=1767292569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=a7Hl5DzGX/VND598QcCWZ9gPceIhGhboJIXRtCEoZ4swuU7teT7UtlaKw+Qtdh3/RN
         TPjGTQ5+nd6hWVRpeRSGxF92o3mUJKn/cuPqrRfW16XkjRZZdaWSvJyRcIYzj5Uk0zUa
         f8w1uAvxqB+iK6zIJkNfSgmCqnS5LQjRtyxgUn1dvUBQ1bR5cPfrdu4lnOVegv5X9nTI
         xx/Li3Z8mHwh0w+sXPgq80+gZgxf8U/TlqffsZ854pRYNQzvBqCUR0wGEd8AHprtQOwF
         SUqpYiudnDGPz0ccD+n+USk4PDgK7eWPzBjqdeytQRimjvALbYwLaz55ck/qKwQo12/D
         9lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687769; x=1767292569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=J36zpkmzddv8xh/v8Lj09lewWQZ6qIXupB49cI68Nn8QDt6vovkxeuyv8FBSyOs70Q
         RfOfPFbvbPit5B+nqig8FmCaV+bBPC2aXVixdVMOjx5JklNgCZ3xopjuhr6osKl03mig
         7ufIuVzQYYGgcf2uXzsNXc1/2JhkjdIlqtjLgPjIWTJ14QpHknCy0zSTircgBHXMS4SO
         889tm7bAyKwVPGdR0og8IAyygAm8TzTXrUac365GLTJ5VDm3hO/LmwAUx1cEZmRaU7wm
         WQqxk12RWVsbKtdOkv70r04O6TvkFVuP9ivdg6wlLP2CNNDFZoBZuLSMFXkTZ4jueaeo
         cJoA==
X-Forwarded-Encrypted: i=1; AJvYcCX05IK7ui3UU9j0v+NuCP6JVlvW22i3WJe2o/QD5ArCb9x+2kHkinowBSQLvu1nlDFyWE1eWFTL3KlN@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+Fw6VkBhOKcNvYfrQubxGWk5vykL1gGE+b61q52cKacf5710
	6uXmH0JH5eix7a4MHCh0gcuF2N+SoqgPhfr8AACZ3Ht8Xrh6qN25WTGS
X-Gm-Gg: AY/fxX6gKfEfecAhMmLtUItIRZ7/WEsD8PTEYRqsrNZ5+GyOVLugJgUq/u65hLU9akq
	Q8LQkLmJBCoTpsAL5Mhi2qtgGjP+mr2/TIL5wboIMUPQfTMjLVZi10oPrxqQFgFfPQTK9E5Iozj
	+MWs+9b3X6vt3lrtDrGuIf+w2I+LDsflWDKQb6YWKZ44obqvhVBVwBzjpSShYKx00lMZ8iMMhIh
	aEyw1sgRuBkxpmQ8rbiS0T+Tf+UKrUJEi7JnfvPR/1tqiBaBUZ3pLAxpUvEWY6zFu8+ps4TUF71
	KOrczM8H4sYZkb6NNfmnUqGlHJdKKlUOUYaPfri7G0TDLEeF2Tfc508jJFLsJpz7TFPGCPLCM1K
	JN1OBK1xFZftsfSfqlAzSMrQFrKEkR2KBcoY4TxYGev7W11YIOuq5MPcLjgSNFw6G4AA2nNmpf0
	7kMcAeigvSIPfjYw2MPZS5sKDdl1pzNUdM4WLeOs0tHBY=
X-Google-Smtp-Source: AGHT+IHEIjHpbPASvhXMCNryNTALHso5yEhVN2Zt1Wti83jtrsqyLd89aktdU3iFdV+yBgA6+HZu7g==
X-Received: by 2002:a17:906:d54d:b0:b83:1400:482c with SMTP id a640c23a62f3a-b8314005538mr450270266b.64.1766687769040;
        Thu, 25 Dec 2025 10:36:09 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm2154858066b.23.2025.12.25.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:36:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with
 leading numbers
Date: Thu, 25 Dec 2025 19:36:06 +0100
Message-ID: <5080862.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:13 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>=20
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>=20
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



