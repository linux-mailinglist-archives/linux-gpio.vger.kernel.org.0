Return-Path: <linux-gpio+bounces-12932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BAC9C6EE4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89A68B2949D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053FD1FF60B;
	Wed, 13 Nov 2024 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2TfbbRJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57DB1FF7D9;
	Wed, 13 Nov 2024 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731499279; cv=none; b=n4mNjTRDmhU8y3sYIpjFu+vP0McL0C6nx1IF3xtcHuVMgO3FX+b+dYNVqG3/MAReWr9Vg48pqP1dJxraeddx8j7sujHH8vssocRjUsWBLeTcor1odj1C7JMbO4EIgJKAldIWrt+ecpsRRWYBPbZG2uMKB97fl9sz3GQPvc/kTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731499279; c=relaxed/simple;
	bh=+4NqzRrH1f3+zQnre34AsrBtFGySoLyIECrBwT6P6Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3p1aTY8FCiUIxYmp/5yBSwjf3rzqlDU+RJOs0aAEMDi7Ytlcz4trQdfnqsFbmGMcB8RvRS2VOWwgCqtZe6G0gC/7GJqEZjb/0gRGgUsh1RObGMXiez7cJF6z6GcHnLtBgF4AnGuSIRo4LGtvRwTIQYPujcSlvNVxv3PsPdWiXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2TfbbRJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D895DC4CECD;
	Wed, 13 Nov 2024 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731499278;
	bh=+4NqzRrH1f3+zQnre34AsrBtFGySoLyIECrBwT6P6Vg=;
	h=From:To:Cc:Subject:Date:From;
	b=N2TfbbRJ3Iys+sIVp3i6yoHrKehUuCdoBi06ktTLT4Xpv7miyo/eIgQajZYxjm2XJ
	 CNRpkW//fRNCy1KZ9ArREbxzNR7RxTbH1I0SHPLB3tAYHvfhs3x/4YlfLMfniFknzO
	 rcj0cvP5vF7z/U0zxfdCm9+Q1bO0i2p4Lt9AXlptlC3HEXoAAQ5GwLx2MINTZuMXY1
	 7aH3JEivXOaZEL14SvyVeDWrtKu78b5Lvcj3gEdo2DUAokD4z1UMzKEJioL/bJ+WZe
	 hmEFSbySptq/GOHPyie7fV/otugBvN7boWbwttUu6co6VKkBJAKA1Q4sWaUs9OfLSH
	 ZAuTQwzvxAFsQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] polarfire gpio driver follow-ups
Date: Wed, 13 Nov 2024 12:01:03 +0000
Message-ID: <20241113-ramble-blaspheme-b303dbf37271@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5qboaS+pJgvFjqKM3T0QsCZuSJyVY4J++h5ijdg6c1A=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkmU/6H1qfes/E2nileHu8YFDiz+Gz4j/K6LbucQt7Iz 7KZMMG8o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOpLGdkmPTiUM+ajLKfs6b5 HXux9VZcVll5gfwC45/crFsUWkx8vjD8z1aq/XXnzPaC3RdrXkRKhOhxFcTL2LcsjtNruPJQfks BLwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

I realised last week, while rebasing the interrupt portion of the
driver, that coregpio a compatible in the kernel as well as a dts user.
Given how long the driver has taken to even get partially accepted, I
waited to get it to gpio/for-next rather than showing up with last
minute additions to it.

Cheers,
Conor.

v2:
- drop maintainers patch, it was applied on v1
- use non-of match data acquisition function

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org

Conor Dooley (1):
  gpio: mpfs: add CoreGPIO support

 drivers/gpio/gpio-mpfs.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

-- 
2.45.2


