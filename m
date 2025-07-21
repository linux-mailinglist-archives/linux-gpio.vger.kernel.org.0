Return-Path: <linux-gpio+bounces-23550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBACB0BBD6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 06:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B34BC7A7E95
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 04:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C2A21B9E0;
	Mon, 21 Jul 2025 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="p9U22kuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D491CFBC
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 04:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753072332; cv=none; b=H2x5Jp6GI5m8vHUEG7IK5RR/UElJbgNS9xGZqE/odNB6OIOT6KM63L6oD5DUzmEDvGF3Q7ijvUGxZeEuaTJPbmPvZh5aJMIyFIvV5SnMs/oFmq8P5XxjU7i9M7NQDc4sriRfAB+k8+SN84axotW6z4WQEcuzTmmSl/mQSFysYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753072332; c=relaxed/simple;
	bh=BUvt4uOf/Ru4kgfEPi2+qpIEYi6/+xiRiZIqZJyY9XA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YA2IGrFXEwT4hz3u4kLo6H9A1sPeNKzaubLnfoD+fEhTW0gol0xGd7/xavZqmLxNR2Vl2pdao2A7V+V0l3fYg8NyJSq2hdA/bY5H7gOD2eDI+JDKMhmK7piuN3F5yhHk47p5+CoE0rR9iGc1qrtUuIHuBygixEAL5q9S8SYmcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=p9U22kuo; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072328; bh=BUvt4uOf/Ru4kgfEPi2+qpIEYi6/+xiRiZIqZJyY9XA=;
	l=779; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=p9U22kuo9b8aaIP7HaMyDGVP6kJEFxbzwswB6a2qKxQh+98hzMzwCHV/LEWBlaWR8
	 wSakoJWIaB6Hd+1vD+hKXSe/1g7g6F+0rYP0/4je9j00bEvgJzlsmJYYERytjUNdDE
	 p6kUgpSZW5RggOt6nNUXj9PFT3EsPZHfE7U/6WI0=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:32:08 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: hgkim05@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	ksk4725@coasia.com,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	v.pavani@samsung.com
Message-ID: <e8b6dd576b006fe443451c1dbcd5db35f6f1d98b.camel@coasia.com>
Subject: Re: [PATCH 10/16] clk: samsung: artpec-8: Add clock support for
 CMU_PERI block
From: Hakyeong Kim <hgkim05@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ksk4725@coasia.com, Jesper
 Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, Pankaj
 Dubey <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
 Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>,
 Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang
 <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@axis.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, Varada Pavani
 <v.pavani@samsung.com>
Date: Mon, 21 Jul 2025 13:32:08 +0900
In-Reply-To: <6d5b4e08-ddf0-438b-a188-fd8b48f3e2d2@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-11-ksk4725@coasia.com>
	 <6d5b4e08-ddf0-438b-a188-fd8b48f3e2d2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-10 at 09:13 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Hakyeong Kim <hgkim05@coasia.com>
> >=20
> > Add clock support for below CMU block in ARTPEC-8 SoC.
> > =C2=A0- CMU_PERI
> >=20
> > Signed-off-by: Varada Pavani <v.pavani@samsung.com>
> > Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> > ---
> > =C2=A0drivers/clk/samsung/clk-artpec8.c | 90
> > +++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 90 insertions(+)
>=20
> Please squash all the clock driver patches.

My intention here is to split the clock changes so as to make smaller
patches.
I will squash patch 04 to 10 and make a single clock driver patch.

Thanks,
Hakyeong Kim

>=20
> Best regards,
> Krzysztof


