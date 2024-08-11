Return-Path: <linux-gpio+bounces-8702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981794E230
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 18:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C7D1F213F2
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4FF1537A3;
	Sun, 11 Aug 2024 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNPkEiIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F12F152170;
	Sun, 11 Aug 2024 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723392759; cv=none; b=Ph7iCfiVCxFe/ymv8Bn0NRtkId1ndL7XOzcIhxgYXf5zTP954UN1+YghzMWM5qAi1Ejy5HmEpx7ZrUAS+gsYwCL8ODGuzBe6pho9Wd+NWDsamvYVv+vIXc7R50QJoO9ma3Bs96DiyNrE7EMThQOkvPsYbafz3/7jKnKaw8AgsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723392759; c=relaxed/simple;
	bh=ndhQ1iirqwmolkgMOneB7kzVvy9UDilTHgGgK02kysE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMjZEyLnjIe+QaELTal55YOaTTXwRLp7jsWD1taIpdiPBPQ/5ZqY6Qp6WQZOV2LbDcMa7GfxPBHUxGjq5zCuL0Ur3sgZrd53ZBl9LPGgzVOqmh/RwHAsL4vbkUbJc4i6BzXuXnQEnAZ5xnkmZsx3Z1iETgeZuecYmKRL/lsKIMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNPkEiIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0599AC32786;
	Sun, 11 Aug 2024 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723392758;
	bh=ndhQ1iirqwmolkgMOneB7kzVvy9UDilTHgGgK02kysE=;
	h=From:To:Cc:Subject:Date:From;
	b=UNPkEiIa9OApcgkcu/W3iG9xvPf51chsAg5Afa2qIJZ2REjAwBSFqbbUOFcucVl5A
	 llgpVY/kK9QR1+E0CHgp893OSrkRU6bEhEsoCFqfKWawFxaogyD1Rbx8U7q6xxAkZb
	 nKm46Mk37av4OyTbW6YnVcrWgplPmKzHkPLa6/rVMoIA9LkC1waaAvuSJkG0ec78Sw
	 SshCfBTe7l/AspQG8BVFHjOL80D4pztFbK3ZEuk6CrrHHPqOkK9KlVNRsk4cOxNDjZ
	 9HCVuvW17xyq68jn+4DRAEsa9EMI20mIT2f9K+M8XqwYqbfrZ+5dyge3u02FJDM5HZ
	 s/ZcJi5uhqkLg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: [PATCH 0/2] Add pinctrl support to EN7581 SoC
Date: Sun, 11 Aug 2024 18:12:11 +0200
Message-ID: <cover.1723392444.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
supports the following functionalities:
- pin multiplexing
- pin pull-up, pull-down, open-drain, current strength,
  {input,output}_enable, output_{low,high}
- gpio controller
- irq controller

Lorenzo Bianconi (2):
  dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
  pinctrl: airoha: Add support for EN7581 SoC

 .../pinctrl/airoha,en7581-pinctrl.yaml        |  467 +++
 MAINTAINERS                                   |    7 +
 drivers/pinctrl/mediatek/Kconfig              |   14 +-
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2983 +++++++++++++++++
 5 files changed, 3471 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-airoha.c

-- 
2.46.0


