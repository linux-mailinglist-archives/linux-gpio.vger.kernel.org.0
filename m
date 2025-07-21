Return-Path: <linux-gpio+bounces-23552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8731B0BBE1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 06:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CBAC172CBD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 04:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C863A218E97;
	Mon, 21 Jul 2025 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="JlqRXQCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0A1F0995
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753072710; cv=none; b=pvDp4XHJ0iBNeuYvvii6HkeCXnv7W2toS6NyBAcOYSXPOWv34fFqFMlXZZQJVyXpkPf2n3Oe1RwRrHVLh3Qp5DW3xzlm31plOAiyj5tGQwIzNP1ExLKSaqKsmPb6rhlsFGBplKj/gIriSbyD38EhaNPG4nOxhElTH8SgiXkeegA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753072710; c=relaxed/simple;
	bh=bgnLbbDsz4HQmQCmQhtR9GGT2j7K0do7fmhsJaorGvo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lGGIXrLKCweCGdFVSRugJZmZIYPG00H6FWyA7FE8HUpv6ACPgWevZnq4BtrzU7K2UAC7+LDpNdbl4ZhsxoARrA7wl0jhqpC+q+ACuao9TV0QEccNvpcL08qmgaqZg1RrqM56PfCvabDkAiPSMP5RjwI6u1BB00U+cmWSAQ0E1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=JlqRXQCy; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072304; bh=bgnLbbDsz4HQmQCmQhtR9GGT2j7K0do7fmhsJaorGvo=;
	l=915; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=JlqRXQCymNdkc80PVNqFxOjSe2TMmviAP4a+FPHsJf3covGIC1bEOTi70paDJe3si
	 BvTkCAIQnuDm67kUIQ0r895XSWqjvDjRbik4kckPXye5s7NONfKetqGV2dEBsA0Zm2
	 Xq/5TmrFPjvq/I+wTpeLv4U9Bj4pGT9LNo/ZR4ZY=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:31:44 +0900
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
	soc@lists.linux.dev
Message-ID: <5bf8677f0779e06092f912a92a8e63225a4fe627.camel@coasia.com>
Subject: Re: [PATCH 01/16] dt-bindings: clock: Add CMU bindings definitions
 for ARTPEC-8 platform
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
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:31:44 +0900
In-Reply-To: <cd5c268b-1340-4d66-9b08-75e2b7efd241@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-2-ksk4725@coasia.com>
	 <cd5c268b-1340-4d66-9b08-75e2b7efd241@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-10 at 09:07 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Ravi Patel <ravi.patel@samsung.com>
> >=20
> > Add device tree clock definitions constants for ARTPEC-8 platform.
> > ARTPEC-8 platform has separate instances for each particular CMU.
> > So clock IDs in this bindings header also start from 1 for each CMU
> > block.
> >=20
> > Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > ---
> > =C2=A0include/dt-bindings/clock/axis,artpec8-clk.h | 122
> > +++++++++++++++++++
> > =C2=A01 file changed, 122 insertions(+)
> > =C2=A0create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h
>=20
> This is not a separate commit, squash with bindings.

Ok, I will merge patch 01 and 02 into single patch.

Thanks,
Hakyeong Kim

>=20
> Best regards,
> Krzysztof


