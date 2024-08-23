Return-Path: <linux-gpio+bounces-9046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95CB95CB05
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 12:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F472838AE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 10:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066EE18732C;
	Fri, 23 Aug 2024 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SNJdx/lL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m12746.qiye.163.com (mail-m12746.qiye.163.com [115.236.127.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5818308E;
	Fri, 23 Aug 2024 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724410339; cv=none; b=T1BLKxpG6gc3U+RsqEIge7eqqF7Il7EVKk9DQ3nKzFhDa1LFTeu16eHaAhv9uwETwa4p/qpjxFaKNg64rPDG9nh0Gy4DKHP1dqZtXBMxsz/PkNfD5saTvlIP6Fv5viqNDD00sAGVZafE9h8Mdtxijk86yoW+BvlRzeaGW71pMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724410339; c=relaxed/simple;
	bh=wSi10wMkLnXg3a79yYzfQu4844qfaNHbPq6WNr6DV5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fCunPOMJ9UpD0J6dz12yYKjkrMIe5CRyDFx8wgjHCwNiMFRtn8duCgoqYn06j0rSVobkyuHfsHj2XVpl1bsaJxKELTAdOsaI69ZM0YUAO0mfzEVleynYJG+Ir+gknipcWw44emxRRpew0lUjWKdmNYvTdd2PKXiud2pLJ8vnHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SNJdx/lL; arc=none smtp.client-ip=115.236.127.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=SNJdx/lLJ+XqSZa8nUFDAUj7xM4cIoDqgZ56tHsOYw3vnR64oAP7R2Hua6bLH+5PXyuoYEfIMKEO9gIkSbQtfRuqoM0AE/+jy8l912rcq0G/DuH7xuLaHLqN6MVD2jlRFKj6fkXUxf1e4za8awCsuql/xAcJQBhP7xlboMqaSDE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eJjVSniKx7WUT/3giA3ElUeCP+KKt/r8G5opCnpmFrk=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 2EC1C7E03F9;
	Fri, 23 Aug 2024 11:45:09 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: Set input direction when request irq
Date: Fri, 23 Aug 2024 11:43:12 +0800
Message-Id: <20240823034314.62305-10-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhIS1ZDGB1OS0MYGh8aTxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d568d0b09cfkunm2ec1c7e03f9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06ERw4DTI3Diw5CTQBTkIi
	AQMaCwlVSlVKTElPSENPTEpLT0tNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUhNSzcG

Since the GPIO can only generate interrupts when its direction is set to
input, it is set to input before requesting the interrupt resources.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 5289c94d5c60..4f8d50626fcc 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -469,6 +469,8 @@ static int rockchip_irq_reqres(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
+	rockchip_gpio_direction_input(&bank->gpio_chip, d->hwirq);
+
 	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
 }
 
-- 
2.34.1


