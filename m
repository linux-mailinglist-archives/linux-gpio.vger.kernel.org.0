Return-Path: <linux-gpio+bounces-30610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D0D25B1B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 17:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7920E30230DC
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE043B8BA5;
	Thu, 15 Jan 2026 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="SgdIcZUf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA029DB9A;
	Thu, 15 Jan 2026 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493724; cv=none; b=NdRZZyXT7OpmtQJ7LcKJDJMjvmxCC8Yv5TFVnD2CP68mur698q3ooyQg5Es0FqMfQWhy4RBkqjvCsUyaAeNFFCIphq0Km9RCsxWAyFbM0N5HlNGhbFLMBW4Q2bWOy2o98v0nGy26VR6vNhOSzIY9Rk23yo1hASM/LfClzIeEk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493724; c=relaxed/simple;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJMsVWBxL+pbf5csOVC3OOY6/dXFXj39kOnoLbJwCDA2Llh0gXPcZQe9a2SZuBuOf6XZw3V9627cFxA7HH3/NBJ0UJGkuaCTQXxMt9EyDp9E+7iyjVm2KMKoGyvkrPe2LWLgQH055SpW0VW6FqC19/PLdTMhDGG2aE7+R9GT/sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=SgdIcZUf; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=; b=SgdIcZUflo3NqJzUtZoYf3GC3K
	JoftSOW3X/lY1Pi0hsKuGnEAdP4Xkf5RvordXf9jqy/NXsqZI+Z3rm0864ea3sOV7wd/8n9x7TvtR
	ARiOH/6XDRwyxFUUZHmrpZt0rTw3cKAEfr/8D2rBa/g7KXdHd4XnhJA71SnSWDqVtE46lIRk+gy1J
	Q0WOnuPWm0qZF9cm/OdeCNOkNotf4XE+ZUvm31xeAo65yyG78TGmmnh9t5FRX88lrDB46GzObUFAh
	+/gpCNBZZk3YysdtvJL0VWcu3kTeeVsfbo57gmVuXzvKtkhX3JI40zs0p7BTnQcxIo1BAyB3m1W7H
	bUiVO0eg==;
Received: from i53875b85.versanet.de ([83.135.91.133] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgPzV-002UXc-0C; Thu, 15 Jan 2026 17:14:33 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject:
 Re: [PATCH 10/11] pinctrl: rockchip: Simplify locking with scoped_guard()
Date: Thu, 15 Jan 2026 17:14:32 +0100
Message-ID: <2415619.22IY78Rhhi@diego>
In-Reply-To:
 <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
References:
 <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 14. Januar 2026, 16:30:11 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



