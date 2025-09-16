Return-Path: <linux-gpio+bounces-26207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46732B599E0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4478E4676B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 14:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31425324B1B;
	Tue, 16 Sep 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/W6kloe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40D1A0728;
	Tue, 16 Sep 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032288; cv=none; b=qDEjy6Q9xc+CoUBi7QEjqNfF0V6OqQm/DWfagFOv5T6pbv2E8ILPkPjRzmFXVetTU8Yubk4XWBeQBY6Q4apg4kbVsnxiqG28A7kRf+lG7p6agIKN3tHzYvSoLO4BStkwEGli35XMZWBdm8ls8pquOZWlfBARrxCHp7OCdUeJvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032288; c=relaxed/simple;
	bh=MHGfGuchcAt29gAf8ZZAge+ONTorOmrLa6kSLpgeWZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iYnW6BQHeXdUiT41oPhCb4b7oxAyOegeHLWqDZpWSffnmwneiQSZPBUPszvDbwbBk0IZjDgDJt6SVOEn+OQtVG8cmkXeBuqVabHVarmDRhDB6AXwjNUI7QA9xgCeV+ZZvpKAnp/zbge+htqYv8Mn91VMjub2+yMkvBLVcVUNv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/W6kloe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4A3C4CEFC;
	Tue, 16 Sep 2025 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758032287;
	bh=MHGfGuchcAt29gAf8ZZAge+ONTorOmrLa6kSLpgeWZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F/W6kloe5Ooa5vCU4qDrZO3r1d7KJtj+Gak0Q9Me8sYdmZ1CBp12ReGezCg9qiVIq
	 3WdX/lPq/AakhJYk4OsmNboW/hypMsRQUOMZBOqhAXdQ2YHSGQScugk282pdoy4C8W
	 V78jhgk+QUnlPUs2Q6S0LfMLfMoFHmQ98wCc3xx4EaMKWWAaDBMjhJgYpQLukDOaF1
	 P+P/Y1+1q2fal5LAaK9hmBES3nMwan/jbYnrV+72oiMWJ3zCHHpjM90NEmH8jzzUrM
	 7vvmSbi+eHXMjSXibDCV1WvG7OpN2r/lGun4yvA3/PjgTD0bJ+XuFF/XMtA/hsXJIx
	 OCumt0iWlbyyQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
Subject: Re: (subset) [PATCH 1/3] mfd: vexpress-sysreg: use more common
 syntax for compound literals
Message-Id: <175803227904.3821457.282370095352768515.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 15:17:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 10 Sep 2025 09:25:45 +0200, Bartosz Golaszewski wrote:
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.
> 
> 

Applied, thanks!

[1/3] mfd: vexpress-sysreg: use more common syntax for compound literals
      commit: f8cba973e4e51b8a166cbf81f827ff926f64d92e

--
Lee Jones [李琼斯]


