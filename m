Return-Path: <linux-gpio+bounces-4983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E70894E81
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B60B21B2A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 09:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F9E5731E;
	Tue,  2 Apr 2024 09:19:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5524256766
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049552; cv=none; b=NGN7kRyvFKEYvAbYHunS4guJQUhqFsZO8kA3Rt8tVPBtl0R/xJkvqcpvRfTWAtUTzeUaoUNSQO2cL6yE2eenLuXCbtGkcYiwNlbZ0loWGJp4pXS1f0ZL24v1vILPnIr8yqOJ8h0Hd2WTcJwYLG9FF9QjkWcfxnOJOtcPMA9o/GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049552; c=relaxed/simple;
	bh=bFAZYHwrpF+JXr3rbobmwXR310GrycsHKlGradx9oD8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YHH1WpioDfHoK+B+uPs3q1ZEpLduG+kzQS8cY70XIAzPe2x/obtJXIGOL9plqnTAyXrx5st0nZQwdBRuHuqhe7B3sS8AjuNofiOInpDQWcM8P/hyusVjTWkSac3QNoGjjrfpX3mkyQ4lqATdwAnw1FA0hcn+rB1tJ4Bh0PnAtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraIB-0005sb-80; Tue, 02 Apr 2024 11:18:55 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraI7-009xBm-My; Tue, 02 Apr 2024 11:18:51 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraI7-0007gh-21;
	Tue, 02 Apr 2024 11:18:51 +0200
Message-ID: <cb394a00585091554df47f6e29758c17f89ed56b.camel@pengutronix.de>
Subject: Re: [PATCH v1 5/5] reset: k210: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Tue, 02 Apr 2024 11:18:51 +0200
In-Reply-To: <tencent_8A35663124AED1894F53905E1BC0F1091705@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
	 <tencent_8A35663124AED1894F53905E1BC0F1091705@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Fr, 2024-03-29 at 01:06 +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already in the mailing list [2,3,4,5], we remove the use of
> SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
>=20
> Thus, we replace its drivers depends on SOC_CANAAN_K210 and default selec=
t
> when it has the symbol SOC_CANAAN_K210.
>=20
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@ker=
nel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0=
a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46b=
b29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655=
a4d@spud/
> [5] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0=
a@spud/
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

