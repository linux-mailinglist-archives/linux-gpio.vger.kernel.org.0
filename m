Return-Path: <linux-gpio+bounces-23555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB97B0BCC3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 08:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DB8A3AC280
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 06:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3159327F000;
	Mon, 21 Jul 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="WZFHfjQl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CF27D780
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079773; cv=none; b=JQP/jk5cZCbJcSqPtKhEujhjeyBNblqP1p1cmEAyrxd9BtKkZ0u/jaUoeS+ueNPDzLyEVJzZVR4OU5BBCUtdB/vSIU3b1HCjdcJ2U85mXFlkrucaCbxDzlpIxtFtbddBfXv+k+lU0EkauSdqSI63QtCP+dsuwF8Zg5JNL0C5nKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079773; c=relaxed/simple;
	bh=jz+hH1V+WuQ3MIMg5eXD97Fl665gq8f1oJ9WsY5WqKY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SVBFjWI1YC4mr/1Y35bhFvbzZE+GAwWdIFsTZDosUwsy4WaULgYUycAngKvmyOE+V0MUP3E5tBDweStCIcPggcFGkhoiCT2VdVHf9Hs30UQ0t66dRXUPxYDpB3A2i2lf4puv++yLMUjajsg9IHGo2f8DNJCRGwKVWxyeHUVSGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=WZFHfjQl; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753079767; bh=jz+hH1V+WuQ3MIMg5eXD97Fl665gq8f1oJ9WsY5WqKY=;
	l=924; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=WZFHfjQlx4HKgd2BM0FIUM5RYC68XnMBy2OR0xR57vwiDOgZYekJ6tq/FB0UjBON0
	 PLQ4++6zpKlB4sUL0QySMakvfyngkjfGkrfABMkSlrpSPel68UZgTMkjgS4q+bAJBM
	 +uTB9MORn0ukH0hRFqWbKjhhErSI0sYwtgfdqtN8=
Received: from unknown (HELO ?192.168.1.63?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 15:36:07 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: smn1196@coasia.com
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
	linux-arm-kernel@axis.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
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
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <28c32b2902ea03ad665f36301b6ab665fe7196d9.camel@coasia.com>
Subject: Re: [PATCH 13/16] dt-bindings: arm: Add Axis ARTPEC SoC platform
From: sungmin <smn1196@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ksk4725@coasia.com, Jesper
 Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 linux-arm-kernel@axis.com
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha
 Todi <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K S
 <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 15:36:07 +0900
In-Reply-To: <e805be4b-4fe8-42e6-9269-84112a16392f@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-14-ksk4725@coasia.com>
	 <e805be4b-4fe8-42e6-9269-84112a16392f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

2025-07-10 (=EB=AA=A9), 09:15 +0200, Krzysztof Kozlowski:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Ravi Patel <ravi.patel@samsung.com>
> >=20
> > Add device tree bindings for the Axis ARTPEC-8 SoC platform
> > and ARTPEC-8 Grizzly board.
> >=20
> > Also move the existing ARTPEC-6 related bindings from .txt
> > to yaml format.
>=20
> Don't mix conversion with new boards.
The original intention for conversion here is to satisfy the dt-
bindings check warnings.
I will break this patch into 2 patches where 1st will be conversion
from txt to yaml and 2nd will be adding new board.
>=20
> >=20
> > Signed-off-by: sungminpark <smn1196@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
>=20
> Same problems about SoB chain...
Ok, I will update the SoB section in next patches.

Thanks,
sungminpark
>=20
> > ---
>=20
>=20
>=20
> Best regards,
> Krzysztof


