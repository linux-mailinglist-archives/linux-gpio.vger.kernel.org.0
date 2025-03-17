Return-Path: <linux-gpio+bounces-17663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49323A64263
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 08:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F7F16F291
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 07:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFA2219A7E;
	Mon, 17 Mar 2025 07:00:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7C215046;
	Mon, 17 Mar 2025 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742194831; cv=none; b=MXfgpbphnWcWXx81V+PWf9i8wfn6I3IijH7YKAEpKYI2pbcQtRMmzWLmAWexO1tpkM8M+q4ZMqrB46JvyiWdDQPKFbAa2m5oVHGcpzf3exK6SVq/Nx05UinxvpO5IlKQ9cslSBmMfBLMcF95WRHgn6hg/+i6p+3XUDtyXVTVSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742194831; c=relaxed/simple;
	bh=Zpaf/pJV1J99D1wD14Wnn0N60Xlfht3DiiblH2GvNK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iwg62O72SOVi3n9+boCM/GJhnulUbB8s5JpRm9Qrhuhe2kZQSEGO4hs3tijD/kwF6h5+0hUPjyHmp0rZ+YgTRNezTR/mrdmhiJNzIlQ/xaaGzIm/L/I77+8m/x2ZhP6d8lnrOq59WdpJoZBG0ChS8pWgyBjz6y5Q/QvPIWludhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id e81d55a5;
	Mon, 17 Mar 2025 15:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	ziyao@disroot.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
Date: Mon, 17 Mar 2025 15:00:02 +0800
Message-Id: <20250317070002.707674-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250228064024.3200000-4-jonas@kwiboo.se>
References: <20250228064024.3200000-4-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0IfVkpMGBkaSEweTB5KHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a2e7360503a2kunme81d55a5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46TTo*LzJPLgwKMDMCKhRK
	OC9PCxlVSlVKTE9JSkJPQ0pMTEpMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBSkpITzcG

Hi,

> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.

https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/blob/rk3528/drivers/pinctrl/rockchip/pinctrl-rk3528.c#L204-L207

I noticed that there is a little difference between u-boot and kernel
pinctrl driver. Does kernel need to sync this changes from u-boot?

```
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 930c454e0cec..c77d9a6cd535 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3070,6 +3070,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 
 	data >>= bit;
 	switch (ctrl->type) {
+	case RK3528:
 	case RK3562:
 	case RK3568:
 		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
@@ -3100,6 +3101,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 
 	/* enable the write to the equivalent lower bits */
 	switch (ctrl->type) {
+	case RK3528:
 	case RK3562:
 	case RK3568:
 		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
```

Thanks,
Chukun

--
2.25.1


