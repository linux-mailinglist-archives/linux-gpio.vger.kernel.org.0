Return-Path: <linux-gpio+bounces-15835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59701A3232F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 11:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94163A072C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319512066E1;
	Wed, 12 Feb 2025 10:05:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D312B9BC;
	Wed, 12 Feb 2025 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354755; cv=none; b=CPTagm5I888prJQxCkPbbVuqszFonokOJksRjNmDlSclyq3r4FCQKy0omQcc1lUPq3RIu3F4cV3o+xIVUAerNJB/34KVbjEzE14xU/J6+8IsRnb8FGUC7+d16EvkeGPVYl3MZ8Vh067F2494hustMoB07NbkpDwligfwo4gx/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354755; c=relaxed/simple;
	bh=mOjyNtiZg/CJICnPP13bn3ZDqJTR2ZsKEeg7wHb6epk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OkXI5YWEy+34LtJ0PT3GrFrr6Fqy09XqGK2Slj4PO04DLf7vJ/dQJlpEHELDxkT0fFnahk/cocyqUVIvdGYC3KZBRmFge9YBMwCf380yBXUYHU8YRfd+irQkyl3pKpMOyMbCDXuLzQpmTL0lvk0Z4xcAZHNItUod4y/Bfa9k/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id KES00136;
        Wed, 12 Feb 2025 18:05:36 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Feb 2025 18:05:36 +0800
Received: from locahost.localdomain (10.94.3.204) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Feb 2025 18:05:35 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw
Date: Wed, 12 Feb 2025 18:05:32 +0800
Message-ID: <20250212100532.4317-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201618.home.langchao.com (10.100.2.18) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2025212180536ac220fe9cd78e875c27752d06b511bb8
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() calls can return null pointers on failure.
But the return values were not checked in npcm8xx_gpio_fw().
Add NULL check in npcm8xx_gpio_fw(), to handle kernel NULL
pointer dereference error.

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 70e6966049e4..17825bbe1421 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2374,6 +2374,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.parent = dev;
 		pctrl->gpio_bank[id].gc.fwnode = child;
 		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].gc.label == NULL)
+			return -ENOMEM;
+
 		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
 		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
 		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-- 
2.43.0


