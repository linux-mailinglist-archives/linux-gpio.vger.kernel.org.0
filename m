Return-Path: <linux-gpio+bounces-14597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D96EAA05CEB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 14:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3684D3A4ED2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 13:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FC91FC104;
	Wed,  8 Jan 2025 13:37:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97391FBEAF;
	Wed,  8 Jan 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343421; cv=none; b=cmiFc224LB48kQDZzUXbAMfY5Pqux8z18twqNG+L5zuowUz1SkQ8ZKTVteB9Nv0+0M1tBbvgQbEqDNHYisuSbzOMPGy1G5S2gC/KKM9EvnKbFcaeVeF9h5cfbriiuSZXg65R7Jq8vuYOQhzxFGFdJ0YAU0wEZSY9n2tuEzlyP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343421; c=relaxed/simple;
	bh=V0ugStryKdUIVAmQdEJNntR3muSGhnx6uoggCJJmRkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SN5FSj/eD5LijIEqB3p2xJkAhu0h6Jj7SyMx8hBxGmumDtO0R7KXgEzq3VabkHAhjp2mHBJpX6tBDT1U9UoVb92uMtzUJ0kEsivW4/8jvMsIbA3i5UayIgXQnD7wqliqDT89k/yYXwbF0lqIkWYQuScc4xL0nQmB8uI95Zq3G74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/3] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed,  8 Jan 2025 21:36:22 +0800
Message-ID: <173595809801.25800.8363611457846698976.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 08:59:40 +0800, Yixun Lan wrote:
> This series adds pinctrl support to SpacemiT's K1 SoC, the controller
> uses a single register to describe all pin functions, including
> bias pull up/down, drive strength, schmitter trigger, slew rate,
> strong pull-up, mux mode. In patch #3, we add the pinctrl property of
> uart device for the Bananapi-F3 board.
> 
> You can find the pinctrl docs of K1 here[1], and the original vendor's
> pinctrl dts data here[2].
> 
> [...]

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[3/3] riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
      commit: e7cd95ad8013bc232316bba0a52ea11ecd5c81bd

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan


