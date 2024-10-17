Return-Path: <linux-gpio+bounces-11494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49F9A1B1A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD8A1F239EB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216381B2189;
	Thu, 17 Oct 2024 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VCOiX7s+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SSQdTJ+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC919409C;
	Thu, 17 Oct 2024 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148129; cv=none; b=BrkgmXXlorp/Llsn0vsaMqkn4DeiGDLyya82MmSM2/z7l9BO1+DCF/Kq8wkeX1QEYcEX9J56nU/pEJaFINggqGc5aVhG+xAKf3Q7Jo+HRKHgsQVsm61DSrlyZ+nBTXlhTCUOLUv0lLmaU/kENO1ZuB0cNjaERUvj+dNf0Ze0ZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148129; c=relaxed/simple;
	bh=6YD5Cpi+w5UzlJe8jXh9Eokm8yqHtO7+XpX7JpvbRrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQeDMm5X1fMeRmpI5P23qs87gTcizYMQzHBBqdR5EbkgfU4NT7Z+78GKCbnadvM55h8KmB+p/1bLytuxaxeqkRg6MJc96Y0Y52SVsohWnCpVL5exBHAO381BsRLpDht4nkvu5eeyNWVRRD2RgO8GTwv4HmPUkEdxvOYlHhoYHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VCOiX7s+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SSQdTJ+r reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729148125; x=1760684125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gvM3ylQqJpV87mr3f63xQKKWoegM6/qRcERu3MpW1Rk=;
  b=VCOiX7s+CAZIxTXdwP+1hgpB6O7BMtoYLNA9kXmt6FDrsQBlPg7JSjFz
   X60KAvTJdKLE9BH/mUkdSai7Yh9FRkslK9whlXrCwfqr7T8y86WMBvYC7
   H1XxmuWXBevFyNjWoVJYBHQGXnpkP644B7ve6ERP4BztJlMiOTmgYFVHn
   juyw7VEISNV92ccHexU2J7uGJ3Dah0zMJVy2jQZZHrT7m/CkoFIq3A96O
   x8H0HNiq0wOiuJx6Sx6pncjOLRwnV2a78lzJ1W0ilZCDoN438DKlR5de0
   blJXS7S2YXuT/L0yItUMF6n/e75X8dK6kndZT7cUgJ3KuKo+VPE3cVBMn
   Q==;
X-CSE-ConnectionGUID: Ymo5EWPfRfS0qgAvOdrI9w==
X-CSE-MsgGUID: PIfOfzyLRiedtZbMLCiKKA==
X-IronPort-AV: E=Sophos;i="6.11,210,1725314400"; 
   d="scan'208";a="39509098"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Oct 2024 08:55:21 +0200
X-CheckPoint: {6710B4D9-27-21611FC3-DAD22B0C}
X-MAIL-CPID: 9CBEAB64C40454D6C197246A96EC91C0_4
X-Control-Analysis: str=0001.0A682F1A.6710B4D8.007E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9072A167B0B;
	Thu, 17 Oct 2024 08:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729148117;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gvM3ylQqJpV87mr3f63xQKKWoegM6/qRcERu3MpW1Rk=;
	b=SSQdTJ+rAYW1U9hBi0ygz/AEsbS/rgh/gaUBxWc/bdQZb7J5JwvIHf36JH4WHcgrYuu50l
	WOOCzipZg0OU8992x85QtsNVENnlM4YLGL2zq4UVTBNpT/tWDfSGSyqO6lPNuMUi7tNt87
	OWamhhixbPeRTkVO+ky3iTcVs02LJSG9h7zlNKPh+yyhCHUPyUr4k4VgWRjLch6gjz+7HN
	nbnGjnENnc5krzrJOzZFOm3CBsFe3yC3ZqDweYtHeYVg+abDPcxmrYk/Q/FGLt3U9g1Dlz
	U0xTOdby7KPXPqj1QH2/M9QpVy4o1XUX9ka9uRF666jZinu2Gvc3pvOWwlBnQw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 07/12] ARM: dts: imx6q: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 08:55:15 +0200
Message-ID: <23695903.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241017000801.149276-7-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de> <20241017000801.149276-7-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Marek,

Am Donnerstag, 17. Oktober 2024, 02:06:53 CEST schrieb Marek Vasut:
> Bindings expect pin configuration nodes in pinctrl to match certain
> naming and not be part of another fake node:
>=20
> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinct=
rl-[0-9]+'
>=20
> Drop the wrapping node and adjust the names to have "grp" prefix.
> Diff looks big but this should have no functional impact, use e.g.
> git show -w to view the diff.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
> V2: New patch
> ---
>  arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi     |   2 +-
>  .../boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 232 +++++++++---------
>  arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts     |  92 ++++---
>  arch/arm/boot/dts/nxp/imx/imx6q-h100.dts      | 200 ++++++++-------
>  arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts   |   4 +-
>  arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi     |   2 +-

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx6q-mba6

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



