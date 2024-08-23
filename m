Return-Path: <linux-gpio+bounces-9051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62BB95CC6D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C6CB23596
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 12:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C12185941;
	Fri, 23 Aug 2024 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1oDYwBqT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A371850AF;
	Fri, 23 Aug 2024 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416489; cv=none; b=WY1Whutiie7HGGwIuQRZyPQjJ7ZJh7QjdSF6XZ8ElgxwonuTw7EwsL3Dv2UuC/LmKKP7pmNW5/6Brz09EtLOOQlV/IbusjklikxMBFB8vRM5um1lObNn6GHR4eN1RJO72w7I1r9OoKUMCmCUFFG3i03Wb3heImKQx55KBIBHnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416489; c=relaxed/simple;
	bh=SbZ2XwhxXiEK21m52VQejON5kHLWb7eAOFmyH/wPO2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL73DuxoudeHWVwWkApBu7w0rvV1Z+RYoloh5fVe/jXGSq+ow7XPqNtCJtSkX8ze0rJmM70ldX6viFQMuRhS54GsbZVKp/x141CB6JdEkoMOXPKEhZCWtxz6+CsuIzGKAyzcW2EVc2X9WHMe/og1Z4hd+dYhvducuJqseZYK7pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1oDYwBqT; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IL8m+tZRH0NH7TTs3Y3T6ZKZMW0ktdt17CP3zTeJE78=; b=1oDYwBqTlDD8oyW4lxmsQ9JX+q
	x7WCVI6a0TNOq4R9fUha8rmSOcrIMYtWYy6oQCcAcZ65ECjJ8dCFNShmnRQZ9HePbHH8DbFo016zj
	P4p4SWA4pqWDABOpjRQmiEsOzoc+ZQhHChjzSu4SeaHHFdqno2zo3eOwn51icxBAs9MqndcQprx0D
	M9ttVQXXcCzkxtxV7GuUydx6y6J1N4uv9tbxUfAkVsfaQ+jXPjE/Jt8AMcZPyeMCdzkngCv5yQ5Hy
	7AE65LRbU2KJBuE+rhnQ5JkA4EacOp8qqx1Yc2Z0nMIect6BU2G735I28DsEzOqLbYqUZunKPk4PB
	wWSCtrww==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shTV2-0004zK-0B; Fri, 23 Aug 2024 14:34:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel@collabora.com,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Add pinctrl support for rk3576
Date: Fri, 23 Aug 2024 14:34:37 +0200
Message-ID: <172441646605.877570.8075942261050000.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 22 Aug 2024 15:53:35 -0400, Detlev Casanova wrote:
> Add support for the pinctrl core on the rk3576 SoC.
> The patch from downstream has been rebased.
> 
> The grf driver is added support for the rk3576 default values:
> - enable i3c weakpull SW control
> - disable jtag on sdmmc IO lines
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
      commit: 4261b5804661f75408a8e2b63038308d2aae1f31
[2/4] grf: rk3576: Add default GRF values
      commit: e1aaecacfa135cd264a0db331d3ab8b2a04a54a3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

