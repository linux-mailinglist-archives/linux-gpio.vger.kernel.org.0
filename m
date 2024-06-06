Return-Path: <linux-gpio+bounces-7234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D73428FE3DF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8A61C21CA9
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D364E19048A;
	Thu,  6 Jun 2024 10:11:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C018FDD2;
	Thu,  6 Jun 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668681; cv=none; b=ed9UsJvA0mEpJirliuV8aTaHQTiQLJGxXa4z5jO9RsLlSsqADGVojfS4rnqgvYKiw9ANZ95ZV/cbhRsiSTaBHJEXZuuFVB43B1LgVNd8bgAx1BgsVYtGlh4qaX2fKotvgObWNmSUp6JQDL1NxEQPOF77fR730lT9KSjFoJTsQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668681; c=relaxed/simple;
	bh=QXtVC1enNA9YYJkOjogs70JXV2p2K7eDU6IR7KJ0lec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bi0sOFvzTmcU5wb9gMetQsRI2Uqd2MMGW+I7pg7HX75w5f6LMJwWNBdLrHh0gbRiYWnqaiiexVSQk292M/O3xlC3VXIlhtR1lYe0dNsjNG3X+xUFMu3OmDzV92U2VkrCVckqwHd6SRbYAmiJXS+UUMK1/BivWKHtGMqa+xaHUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFA5U-0007s0-9t; Thu, 06 Jun 2024 12:11:16 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH 2/3] pinctrl: rockchip: use dedicated pinctrl type for RK3328
Date: Thu, 06 Jun 2024 12:11:15 +0200
Message-ID: <4429508.MSiuQNM8U4@diego>
In-Reply-To: <2182307.KiezcSG77Q@diego>
References:
 <20240606060435.765716-1-i@eh5.me> <20240606060435.765716-3-i@mail.eh5.me>
 <2182307.KiezcSG77Q@diego>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 6. Juni 2024, 11:43:56 CEST schrieb Heiko St=FCbner:
> Am Donnerstag, 6. Juni 2024, 08:04:34 CEST schrieb Huang-Huang Bao:
> > rk3328_pin_ctrl uses type of RK3288 which has a hack in
> > rockchip_pinctrl_suspend and rockchip_pinctrl_resume to restore GPIO6-C6
> > at assume, the hack is not applicable to RK3328 as GPIO6 is not even
> > exist in it. So use a dedicated pinctrl type to skip this hack.
> >=20
> > Signed-off-by: Huang-Huang Bao <i@eh5.me>
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I think this actually also warrants a Fixes-tag, because as you said, the
suspend handling for the rk3288 will change GRF registers it should not
touch on the rk3328.

=46ixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")



