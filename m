Return-Path: <linux-gpio+bounces-25873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B7B50F3C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FBA73BB5A1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EB2309F07;
	Wed, 10 Sep 2025 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eQTHW4NR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D643030B500
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489156; cv=none; b=BzhJgD2wMnm4lQBQjE/ghaN9S/om3zv+R0IXctLp5SckRPQhyzF3oiv29Qh522fHQ5edAcY8PZlK9vY1qSat5HTVrZdYPj6VVaqsMstFBlFw+MFYIk6sybQSQXNXt9+oYSiiNda3XKfBrL/194nrNAhAi5MEmpAoj3m5tzmYA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489156; c=relaxed/simple;
	bh=OyfxzmIVdlqu/N33hp9H+6rXN65Nb5R46kDG4x3DQPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnID6geBF3aHpfKo7B2reHKWtYX9ubtMyLSeBzAPJk+qEUr31VKX4ZwfXTZwfgSBBm4W4cH2YLO1YmKTxWtCtgnPcKKLcQyph2dgazj9BenaFNjeSUtjsXbc7rEmhyYjAFj1HqBAHTDJZ8yAiQ7ppYo8FuU93xCFpWBzMdAxg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eQTHW4NR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3dae49b117bso5683348f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489153; x=1758093953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
        b=eQTHW4NRXpnLOgtCpTiJ+ydGli14Rcc/nU85fLkHEUt9j/ESXrOtvEqeKMDPNoGcg+
         xn5YCBxyqJCs/61OyMVGRMkXLmZNEjto4IaW8g2U8ZQLlXWacSEUeBgY4yS84bXWV33Q
         ir9D6LI139SyeOLbvzlmSR9zDZdqBNMfv0o9IKeJVaPGbEu/xNghb4o1HE347JxuHqkY
         3tHztI/ndyyxj3kUk4M8Zwws9GNcMRAFKsrtv6E6qFvnXwNZVVitmXhlBUdTNv5p6Pnl
         2OOtr4rjR3Ywkx10Ij9afhppbTJ48ToSHI3lL7PulEiijNEALZHEtsDl6bEDVKbzV/q3
         iKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489153; x=1758093953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
        b=QJAQZQMv9oMSI3I+OocXzKUGU7KLhvNiCEKxsj2i0oeyNTMdll20r8a0kjQgZJyUAy
         v5TixnwwdtjrdbARan8p04+9ceSt+cm2F2aKfgTwarkP5AcWfZPRjSfC65SCcbWHTnbY
         iBSfoIfa6sCHaHG2kQf0em1UurTSt4mGa1ZRtolA6jDmitVx9ED+prVvgNfqlzsR/deE
         ewy61Fa6Snh56QK+EOAfkBh1P9Ji7HlII5xJUbCHCNHska454qOHcIGWv6+FNUCw0gKB
         cKYtFIN1eowZWKc00JSgYhzkUGMFRH1/w+Oc0T9Yq1XCNhTT/5rtCbWv3Ku/WuDs2Riz
         JMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV87oSONBgvZ/GwYWsFjg/HIzvE87ajKb5/+Hj0NO2DHRVMDKMrYp6wT1u5K3Sgex0hzR+8lldq9tzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQK38bMZc+2TM+CdAGdIfcNmFfRxWUzOHDuG8Hsqgd+F9i+kW
	Sc5hTPorJUVnY0CyoRJ9SOaivFoq8305xQep1R32gFkUHVAKN3DFmiJpJGbAiSyLmcY=
X-Gm-Gg: ASbGnctcqp8NZJ54DgJoZdD5X67WGgDWhkZQS93DHt8hSL+QBRqRNxePBhskfgKKxku
	pVOIr0tIPvhhyeGQV/UGuXGaTNoAgqsXMezzg8G103h4v2pg3791WAuQCVPw9b9v/0cpbQ1SbeE
	iHYF/9W4juGn2CYalc0+vMiITtBUFUvgGZBAosjZYcGKDyNJqKI/Ih2qvE3Ua2fHrD4V1OmGLQL
	kvrIPdewORBOoiT5p1at4OHAOUuEbKmtO/HtIAe4K+sZAsbC7F4TRLDfD3DsW5NlgpZwTJ9rPJW
	vGM/rP2l+XZ+Xyv8RTmuXJvkonDIwmqrSbicWMYpllh2GVYeCOuV+bW60JG0m8wmFJ32AfEnUie
	9lrq7ixMS9nuMGTrCD4zCxq/wDkYDDzYL+plfRWE=
X-Google-Smtp-Source: AGHT+IFKdWd/MOTTMywYPHVw5YIDU4ZG0NZ3VmH44f3IGf1C3HlllFBC2cfty+fO45t0VoMp0fb6YA==
X-Received: by 2002:a05:6000:1a8d:b0:3e3:f332:73f6 with SMTP id ffacd0b85a97d-3e646257abcmr9958246f8f.31.1757489153027;
        Wed, 10 Sep 2025 00:25:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:45 +0200
Subject: [PATCH 1/3] mfd: vexpress-sysreg: use more common syntax for
 compound literals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
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
 Bartosz Golaszewski <brgl@bgdev.pl>, 
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
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2AiYFCloD/4RAraZbO+KeVDtX8xcEqWOa6di+UP2k+Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8VTnO9QVF1tR30IBvEZEbYU3RFZcMzjLBO
 2ZoExM1MEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 chgMEAC1UA+PKD6t6aGSJKb2WwHVdpLkaweVvLymwppdHKPAhq4e2ZXBwcfe2Xf21UCZiVRN5Pb
 sXKBL7TU2hsVJnh+nY1deWzVbeenzo8hfzM5je3+XttTa2Cd7DH6irICePcyIIAX9BlaWTAaKiP
 OzZfpmYjW0CygB3YYK5biWI3U5cbt8nLFSPKK/ST9iUNo1jaFukc6FipCfVUosMTABpdPQOqmxc
 EhVqSROfAU4VXT6X9L7y4z/srhtMFu2ufagfAW3sz0zMFPXiSOQcSirf7JyGZrRkwKN26VcH7XE
 SMpZQkhb/5/ccgPK9pObeHyNoII8VEhVuraYCkIOiW6C04U2HwPu6nfDQ0YdiITYx2gObHsjuKA
 dFyC1qARBLWkPpFha9B/WfdT4effL2+txlK5x8JKZY3ZYwbv+7kgyLjuwGt3fYKMneEXrd3GWwj
 Ob2IeaFzQUJplmbPWMbcU/LOW4JBy7aOXHImgg6G6fOJSUTexbqJflcFeQ6aqoJ+iMezbpCUVxX
 DaEUCGs/NEd4R7KcgIrmSebHGlPJot9MGekvnPntd4Xt/34GEdDUYMriQBIjB8jshF2MoPpqAbq
 MVDAbVmCWbgIP0Aljy2QDxkXCnS8MoTibWav6SmYomsrAUE1bXtWLPW/j4cOMWhP7q0xosfcc/0
 W2Qzs1Uc+uQvMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 9399eb850ca29b0a9d9be2173bee4bcf6888d10f..f49cee91f71cc2e6132cd3118dafd42a48821e0d 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -120,7 +120,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	if (!mmc_gpio_chip)
 		return -ENOMEM;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = base + SYS_MCI,

-- 
2.48.1


