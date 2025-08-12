Return-Path: <linux-gpio+bounces-24239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D155B22101
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB723B37EC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568392E4246;
	Tue, 12 Aug 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AT2zV9KZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8F2E54C3
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987243; cv=none; b=SNDaduvaVHiFz0HXZ6rYSg0CbQnMezd2oSvb30JxF73g9YAByqBWRlmh/fgMcmeqO2K1tJMbIoa5xbGmjn8ptOeLEAiLEvqumnPpPBz0V5qom9X/LpK1+8yb6Ng9qgIhCuofMbdAOvgL1BT665pvi9tw0+7TP7ANI6fOVaQDoCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987243; c=relaxed/simple;
	bh=NN8N64azTZ6Tm9oD0O4UPA4GBXyAY9HuPJ1OulPwzrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8BrLutWhdY/xECPPsFFipxA9joEuSFcDFORWiS0wvbnyhj107xX7EOF5q4Uf/RAyZnq05mtW3EzRKtYGjmrt5DqLqB44sSVQ1pMlGzJysnvPJLUAc51BycSjIgZjXAfk6OKatyYgsdzuctABBaffhA93wuyvTqNRZRWfo2gnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AT2zV9KZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so24268125e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987239; x=1755592039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=AT2zV9KZCcgY4lPNqwXBx1+GbuveznMIOkMdpvSx7z5IqnVdAfM9GYT1jzCmqI8AB4
         2iyNCJ3DtGxeuxtEXBw3ELfi5GNne5UpESl5Vqyj3FTe4TsXX4wa4h+iba4ogXpbbHZZ
         tFd4V7iOhlBtVugF4Widtc1i7jEQr4mqHoISjPjfQZzfnXWTRTiPrR9n6RCyox/7P8oa
         RyIQ4TfIrbPWTQtujY2/39fLZVAmjMEh0e/KAr1pFMdLcD8cjiVED29q4C9aQxOxpt3f
         AzF3EjFletg0zwoxhbpXOgb1XOgsnkT0y1bBl30P+hrU1O4IyxOTtqFZHNgUI6OR1gDW
         /W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987239; x=1755592039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=BE+fbnthaAaY0bwx7v5hU6ZJu+L4DeV9+QKgTsH5FRckPWJyP1j4YEg0oSA2bMfZTC
         rMkitBhJwEPpkB/Hq2m4vEe4m8KBCWaqfodTGa2DKkWpannyV2C7WBTVDPq4ZWhd21SE
         FquLaafKXIDIE157hkLAECYCjsUkwUajVudFjXHdWiUV9jWdzUF0mrUutOqph8AnuqlL
         5pulk/JARoQd6YE+w7dZir1ORCr0duVc2Jc8BTouRQ6dpnjKf0B8opZD0m0HzPBjaQxo
         0kFX68V9mF6T1fQ2bBygvRmOwvTeMBLgXchzAWhugnZqMZHZyaFpnFIp99GFci02da6O
         K9GQ==
X-Gm-Message-State: AOJu0YyrMfEVqNN5QThESN9/kumAKmDVVHNelb7vl8XEVyhgbKTs1Uwk
	avLFjSI0QRBr4kpRhS1YCbGIQNJv8yHKbN+JaRstIoL/37oGARcGedkNS+YvTYEDRQc=
X-Gm-Gg: ASbGncvZwTh38NXxSodvOVWD8EjbsD9evwkskmrlotwuoct+HjcVZOENxxuq3g1HFq6
	Z6HYM0M5z1XkcqAe3KwkOsrv60ETFSlzUzcpB2NIvNtahmVWD4k9PjUVe2fu5HcXM8ublYKNI0A
	aqGhRKhtizxo45ViE+vVqikj/fUK0cM/cDMxRsdU89HBlRwKDDiSjSGk6cx7F3oWqNsNkuN9CSm
	9pohP7g1XERPQnQdMIOopGgQ16GK/k3jjszwFsqsSxRzhk95VtyoKaNuXJ5AbGT9l4QN5HHlUTo
	w8NO9E6O+RNOjPbp3bZT8gM31nqn+Qnwvg+B2C3ifj/4U36VJqRkw1WyJBOyHbCHlWuoZTKqknZ
	sAdAgc1229Z3WbnE=
X-Google-Smtp-Source: AGHT+IHCxxphw0C1ysWW25fo60uK0xUciNoK6/brqWeyF0IqKEcM+9QCTW7mxqYhhnP5CYPiuHCuHA==
X-Received: by 2002:a05:600c:4753:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45a10b95677mr23101005e9.4.1754987238810;
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:05 +0200
Subject: [PATCH v4 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-6-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXvfSwc1aR/VkXuzCwVe/jTr/RkVSkQok9/
 6ZfT3vraKiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 crU/D/47WmiHhr1jD4X7MX23IkaKdqa8H3X1+A1yMibQlOZwva+m91uzbA5E1KqKisV1OFMTrwM
 qQw8JodqYSC7dGdkQzBqDTIPr8qzRWzoSvMRK4SEMSkWN6JmzLvQkjkT0QFqmMWrU29Eu7a0K1F
 Dajot6d2+kAVgD6I14MGW8cJyorpzlsoHipAlEw12RWTEeduUUSmBSgSdFriSRaQ59MJPBKp8hZ
 kVe4zp0J0g84ajKZ+DnhXBhaHIQym7fLJR57ngkJWPemTobyqxz2105/iqorzBrO2YC4Y2pX36z
 cuDpKjunZLGwb4w0loqgMygcLK/bV/U5ML167wppqGTE781xJw8gTclK0ECkF06V9mMriWr5qog
 w0Iiq+SbqD84+qFscPmKzsUrqqSX0Ih35IZdHkB2+uOuY9wKhFsFauO5KIiHmPkgPvd1VHClNqm
 ItFa/4pd+kPjurFIxcHWHYyEQ5xM2PYjHpH1qPVzaQNzL0f+rZPoifcD1zBil+ildZtDLwNHbLj
 9bGuk4x45L/2ysZqyTqShL9pN8TnHn3mQrsZpHh+PUIe5e3hgaZi+P7oiTmtPmifDRFb/rJlKSM
 l7mYoB8Nx9U1KflhK7GPr2sCxhy436TecxSTqnjxs3nFe0iqlGJPyQMvKZURsDe/JEiBZVGu0+n
 KZOvfyXmKWunFeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1


