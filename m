Return-Path: <linux-gpio+bounces-28282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E770C45153
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 07:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CB584E4DCB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 06:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E12C221DAC;
	Mon, 10 Nov 2025 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5K2ISc6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C5F217705
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756259; cv=none; b=MMraf6+/pyyy1IPfZrY0AlYhQudvv7WqOzO0VVdEGIiYNY2vXlhoAxSCo2R+4EXyRvegYzWWEBKWqEithR37bHWb+NGuPvmuaS1xJ/cVyB8qSZPtA+1ceUzSMTNEoKO+J1vIZDMCLJYMZ1kNJMRBsCFplRa67I/2uxmm1Ve5c9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756259; c=relaxed/simple;
	bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxhubVL/rkP7C6hR455h3hQ8d41LRA80KGxsy9wUVZn1B0G6JLAtLh3R64M1NrkFjtBWqCpvX4h5Vv60wDFVNwBHtOYd4nccx4oFTrYywN4BkP8mxQ6mKF5tWKB6QwrDJzfmOh2iKdi2ptiG0bkL5730t3yThqQBidUoYDCLuDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5K2ISc6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47778704516so3841405e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Nov 2025 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756256; x=1763361056; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
        b=o5K2ISc6bhNVXY8bIHTQ4KKcAedMfYbNe98yDermdBMwnpULRRTdKPKZ3Zvut28qJR
         cmwK2eUxwEOxqO5EkuHQD/7u7OnUAKrhopL2L3XSi6NEbUN1+C2dL4jn/gewrnZ9mXzE
         2y+BsrEIQxSTyOcPON2cc5Uol1PsFSuDLAnBKm/NaipaFdHG6v6vjL+tO1cCnFb0/XAY
         01NGw6434F0cvFxzmB3Y/2nbw392X8uIUo7aaelS0hPTc2ZTZV7JWHz6gDypHZxnii0z
         S2jnPJ+/h7LdB5vdqWS6uj7/mU1ba1hNDmCGgANENjkgbhEu5PPW252M96TViTBBtiqi
         bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756256; x=1763361056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz2Tc2+ZpOYG2OzBbxLbgilswkkGbcUQjbej9kT3ykY=;
        b=b8lYAFXrUBED4fbM8TckThMAZrDWnFGsP9yliNFhHGArWwGFqdAx53vxQY5nntddxu
         Gx1bXySplAkC+de7UnBX6AfXUWEuerjfVBg2lV70lwKfoOOw5vEyCMNNNuJW7dcGvyPi
         HR7pVmM9lKMnnyPXiZBddyKpM/q+YWFxvfvkYsVjE2ik3SMdEck5a6F1RZ6Wd02vhX8C
         1C1ivzrDE6AHjBpfa1AgIuIZDteYkLOiAvQAsOGpIa2ncSdvLJDw/JVeTeRBiLD3hRwl
         BqDVlnMgPlhMoWNQaoz00zESeYRJCwIXDEbGgt5Ikpb5t5MlgUcZz3VvkHZLCBWJ9baA
         EcPg==
X-Forwarded-Encrypted: i=1; AJvYcCUQs0POSwccob3EkTVf7AOe7kYC4jXhw1TGizUTDTjMJiDbDgifag4sA0gh/xomW10X8gPFkYlh1ub6@vger.kernel.org
X-Gm-Message-State: AOJu0YzN91ib/0EhBan3CfT7tqyEaMdqTtc7lkLPvklkdZGwZAXZu/b0
	tK224juB0aIVKySrtm8ev/xLcw9Qx9a8qZdzprfIM7azc1ZHGBZqZ78GQgdCSxTJAN8=
X-Gm-Gg: ASbGncuYQ1e5H1bO7rIayicmVB7F3zgNHJMEKCePo/2tJcvRyiF7Wb0tBLAadv5RjzP
	l5UlAWq0GDoiYnSQvcqdTlDcESybfbMFauUUNsb8hmJ3vph5UnwogDgS2k2ljHPhopdfalH2gOd
	3F4uJUCDpeN0kfiAGxcpYiyyfYxJ+Ptb30yy7XMcBXq5WEZPD/aIvwVCa2LcJRaS4rDa9BLlyKq
	TWQJWRQJZxryP8OCzWPRY1RljG3+HmCebqXfFHwr0uik22pdnENF8o0sn8sGC2yRg3xLIqCc5GM
	/iQEl8uDmBbi99hXkkbj6gYp2UlvSLo41038ik/6m+Tt0DEkGEqp+I1jk4a77XbZm+U7cQv091P
	IYJ2zqXHMALeDqZ2qKNEBnJp+6huUDi1kdcb1L/lVtDC6vZe+mEostFzHjGS3TfjlYOYcZhKSPN
	NGuCRj+I4=
X-Google-Smtp-Source: AGHT+IEQw4YGmWYhhezCKKZpNUcmlZEpIju4sVG4oIvS3Njw1N4sMl3EeFVFvYxb/VKOCKvrHAj0Vg==
X-Received: by 2002:a05:600c:c84:b0:477:598c:6e1d with SMTP id 5b1f17b1804b1-4777325ab5emr48703165e9.17.1762756255657;
        Sun, 09 Nov 2025 22:30:55 -0800 (PST)
Received: from draszik.lan ([212.129.86.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776419d869sm106249085e9.3.2025.11.09.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:30:55 -0800 (PST)
Message-ID: <776ac9f7ec2858a89c03b735653070f2749b986d.camel@linaro.org>
Subject: Re: [PATCH v3 04/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Mon, 10 Nov 2025 06:30:47 +0000
In-Reply-To: <7d9fa7ab-8484-4d41-bc3b-be2eff3b6e95@kernel.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>
	 <20251104-zircon-lobster-of-agility-cbcbb0@kuoka>
	 <46b008c946e36ea0b317691356ff874c4a78882d.camel@linaro.org>
	 <7d9fa7ab-8484-4d41-bc3b-be2eff3b6e95@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-11-09 at 20:00 +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 12:14, Andr=C3=A9 Draszik wrote:
> > On Tue, 2025-11-04 at 10:39 +0100, Krzysztof Kozlowski wrote:
> > > On Mon, Nov 03, 2025 at 07:14:43PM +0000, Andr=C3=A9 Draszik wrote:
> > > > +=C2=A0 The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO=
 regulators.
> > > > +
> > > > +=C2=A0 See also Documentation/devicetree/bindings/mfd/samsung,s2mp=
s11.yaml for
> > > > +=C2=A0 additional information and example.
> > > > +
> > > > +definitions:
> > >=20
> > > defs:
> >=20
> > All existing bindings are using definitions, not defs. Shouldn't this s=
tay
> > consistent?
>=20
> Huh? git grep gives me 3 cases, so how is it "all existing"?
>=20
> But for defs it gives me ~98!=09

Didn't know it's ^$defs:, not ^defs: - thanks Krzysztof.

Cheers,
Andre'

