Return-Path: <linux-gpio+bounces-6727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CA8D1A4B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDCDAB267A0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E1916C856;
	Tue, 28 May 2024 11:52:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A316D308;
	Tue, 28 May 2024 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897144; cv=none; b=H6Xa6eOxzg2nWY8E5ZwJki6/MppbybFGqCOtJD+lTwa8nCrH9Rk+2pLibYEvWHrhhSDwXyXR2yCy/iLi1C4L1bVEKkCRQPCoBHuEGGTrDAyXO5zHJC7AyZhly9IOWupDW7D/vyOoZsX8foUNlWqJj3m3Rm1iZRpw3Ek01KY+04w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897144; c=relaxed/simple;
	bh=7nJOrIbNRBb2wO3PiDfHyphKLt0y6wyGs2WF4qB8lcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osf+78gPHYmZObseWPiVzPt1O3skJtRtLa34Osz+SDgAThtVsdpCGzFJX+R4om2RHlBlvMwFtQV1BZO1CZLDEPZeDw6e5TD8U3J7Jumn+MxWRdYCxHkxL36IPxEbrofQkg1aI+//Vynj1SrNvMHFHKsQI8dh18xnJr4LePH01Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sBvNH-0003GJ-RU; Tue, 28 May 2024 13:52:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dmitry Yashin <dmt.yashin@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
Date: Tue, 28 May 2024 13:52:14 +0200
Message-ID: <1770701.X513TT2pbd@diego>
In-Reply-To:
 <CACRpkdYO_zr=OEZCv8LKtw+fNOwJ906ZVKyPhbbyA=9gP5XQgg@mail.gmail.com>
References:
 <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-2-dmt.yashin@gmail.com>
 <CACRpkdYO_zr=OEZCv8LKtw+fNOwJ906ZVKyPhbbyA=9gP5XQgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Am Dienstag, 28. Mai 2024, 13:29:12 CEST schrieb Linus Walleij:
> On Wed, May 15, 2024 at 2:17=E2=80=AFPM Dmitry Yashin <dmt.yashin@gmail.c=
om> wrote:
>=20
> > Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
> > the rk3308b SoC. Remove them and correct i2c3 routes.
> >
> > Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
> > Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
>=20
> While you guys are thinking about the RK3308B support, is this fix
> something I can just apply?

I'd think so. I've detailed stuff in my Review mail I just sent.
Both the soc itself and also the affected pin functions are niche
enough that this should not cause breakage.


Heiko



