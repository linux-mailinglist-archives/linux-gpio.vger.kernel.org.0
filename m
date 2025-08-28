Return-Path: <linux-gpio+bounces-25120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C0B3A54C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A9C87B5FBB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000A3275854;
	Thu, 28 Aug 2025 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="waYYbO/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E530426461F
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396837; cv=none; b=Y9gBSNjnVhhz2KDL/sW9UEyw8lMo7JYsGEEmA3Gu33WG2BDRvWHi9nYbLzaaMcwR+3wD65+U85bOARyZFZa0W8fwrweRru9VPY5FOA+36dX//96gA5YmVlpMoxM4OMpnhtA6q+FLADKSMDBzMqy7Zl6WI8AIu76ieV+GD8nzDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396837; c=relaxed/simple;
	bh=HSTxkhC3WyBFM1G4jv4j8GQuTAWxbn2e8t0aXkOzg+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6Xprr7jXvJnytuZwHHNuZ0F08fXI+eGug08ZFy+tgpZn8uz9jEhqy0bPurVwEh8B+KN/N+X7zj2iB3Au7gqBv4J1iBlDQ6WSrTOdMoENGxeNcsTSuVaRDgMyx19YlQ1SpKoMYPVP+k3Iag86fWomqOzu5MF5LNxpn1ODQ3G0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=waYYbO/m; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso7109825e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396832; x=1757001632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=waYYbO/mcj66/4zehBg0Vr/7oSR3oU7GdWJXAsqMumiepPaoA3qtvyuqoLyTjlWoVu
         IpFMmbEyURvV0ld5c33VLCWwwgAw7N5S0GK3+OEL6DouxLlg9N9MHp/SiEcATqusQLDx
         bKgfqBbR0cN9QxgLw6eaKOnztplIr18kYM53MiB7ELuRVNI8jSWtY6QmS+Ykeb4SfgyG
         6Cp2GIkxRSpJOspx74LfEX+mROxX91BTXHhW0a3sgXnLqvPtHzbiA9oMkY16QNKJl7K5
         1k4EBXdXlv1BUBm9yN6M3XJi1scPuWMTp5SjcLnBYlNLUaZ3kwFLKeYAD+aXv0ejn/rE
         g89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396832; x=1757001632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=M0JzYP+MNZ4B79UsdbjMzQTpXlkqE/stCCaMYFc2Yb+RSUijF1ULjVKuB04Ml0Xt3n
         BqQIJfrleYTtgznFt6/P9oeps/8YduRvX3qzJZqqjrA78b0jXt9bvEMdTqKqqEY1op3g
         iELELBFUNFkCfyi453vgmtElBRVmcc1jnqXn7AqTQBT3ml1UDWtLt216PAqRnKmxBHXR
         XMxmpbNnbLcxv8TEBRFmCkKfMyykKwYkGLmbLfUH9wcKGDPE/3Btz7X/34B3+cg+Iz32
         KZCMWVWbFiuyzteh3fcB1pdI5GnqW2cmWYxV5VfsA6s6drPo3GzcmR/i9KzKl319mPA4
         ZGMQ==
X-Gm-Message-State: AOJu0Yzagd0GN3DITjt0EE6qgAp8VAq0EUAG+9wTfUHMF+fewAEz/jk+
	h5D3toKu8dH4f0i42ERSNdJFuMIq1sKXy4br1K6/pxJVCt0dnVXhLrmI4IUNLXFORTs=
X-Gm-Gg: ASbGnct4Q5NncwFrHiuhLLIOAwEEo798g6imSiJ75/Xvh74eaHMOpHgt6JofEZ2QpcK
	5604MwhD2CXlfuZMyCzqU0fAgNDQpW0I5f9a4eO2Czr1c5gRyPPgOenD9cWcYBy2ihCOJtb/2CV
	DBegkIUh8/UlIK2yfTNsWi5wAog+NvIKFhuZUYB0bPhkyGLUAhibQkLys9XK1dT8XlCRr25cqQ1
	Rk3gttbtYPCjRoYwVHB2S7C4/4cwFps0x7sagLM5hNGvtOd0HDRsvLhlXIoFNRsvM/9iWc/gppD
	MxD6JgLc14yPt+1BrH0HrAsu/e8MVdg9st/km2rp6p27UHj/pDmnzJiMPFpEN1N1CMXZRVGyUYM
	OOpDNU6EBJlmqbXxAysA+b2cydTcn7pGW2k+d4+E=
X-Google-Smtp-Source: AGHT+IHLEb+XALx3SQT5OlVRvtOHeQcEx93SoK5JAJJrN3hgR1oVUvTEfB3KUoR77aDoDBkXnhfeRQ==
X-Received: by 2002:a05:600c:45c8:b0:45b:627a:60c7 with SMTP id 5b1f17b1804b1-45b627a62e6mr140635195e9.6.1756396832146;
        Thu, 28 Aug 2025 09:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:16 +0200
Subject: [PATCH v6 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-8-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OqeB42/YsplOuPBdejGDZ/d5WKJRcg95WZ
 LR104xQjUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 ct8cD/0ZuQK3BRMs5wFLGQuOWZuN0q36r1G7AhQcVy4P7PCRDLcyiRs/WAoNUAxuaMt/WwFIkRO
 hROoXg0+TORn04NnzEVYQhTRbqJnwFISsG27ucFDhABh7y5SOZAAEGAgDlmr87Wj7BXyliVSG4F
 pveiULJuhiooGFP3u3dmVo4/fksZ2iNxe1F6Shfa02B1qtZrPp80GW8KrPmkyWiXmvnBdpr6jft
 smrDNxHL4z1e1B4Q4Vm11l1dWwpD09tf229YOZsHkOJHC+PLAI54oiNWw/e3RbsyJ9xoXCKZL4b
 3UAlirH9CoqoulHfkqYeck+FpiINai8UDbl757HTSOvr5y/NC1SKghf5Sqs1Ltlko+1rCexnQy6
 d3sz1GFWgtO1sMkKdFszISAXPg1mPITBS0afAMVUs+Ubz8zwNQEQHc6Fr1/RryMhvKlD4Ic3qds
 DStKOup5b4+KcfB+dmW2pXus3SYVlmgIVpnuwfPi8aNU6bFwKc08EPXn9LYBDNrVpAl8PKyaXFs
 hMuv74QQ0Rb/0y/urOvaoYVoZZjlzgU5L3OYCWXSaoHyHqC1lFGH3PA3jpMY8wKOJdDOr+Ugx+d
 jppbIfhciMtsHe9+7bBfnwJ2MhpzRZXMsMGY8dnba+fJOj7cYEgnMUFWpcChK9su76J4X0jsLs1
 +9KYwX3UDLTLIwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. We're working towards reducing the usage
of struct function_desc in pinctrl drivers - they should only be created
by pinmux core and accessed by drivers using
pinmux_generic_get_function(). This driver uses the data pointer so in
order to stop using struct function_desc, we need to provide an
alternative that also wraps the mux mode which is passed to pinctrl core
as user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 6aefcbc31309995ec1e235416b40aab3e4a073a9..e78c8b3ec245aad56e3e74a26d27c41ba4a98281 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -135,6 +135,11 @@ struct keembay_pin_soc {
 	const struct pinctrl_pin_desc *pins;
 };
 
+struct keembay_pinfunction {
+	struct pinfunction func;
+	u8 mux_mode;
+};
+
 static const struct pinctrl_pin_desc keembay_pins[] = {
 	KEEMBAY_PIN_DESC(0, "GPIO0",
 			 KEEMBAY_MUX(0x0, "I2S0_M0"),
@@ -1556,13 +1561,13 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *functions)
+				 struct keembay_pinfunction *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
 	for (i = 0; i < kpc->nfuncs; i++) {
-		struct function_desc *func = &functions[i];
+		struct keembay_pinfunction *func = &functions[i];
 		const char **group_names;
 		unsigned int grp_idx = 0;
 		int j;
@@ -1588,14 +1593,14 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++)
 		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
-					       functions[i].data);
+					       &functions[i].mux_mode);
 
 	return 0;
 }
 
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
-	struct function_desc *keembay_funcs, *new_funcs;
+	struct keembay_pinfunction *keembay_funcs, *new_funcs;
 	int i;
 
 	/*
@@ -1614,7 +1619,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		struct keembay_mux_desc *mux;
 
 		for (mux = pdesc->drv_data; mux->name; mux++) {
-			struct function_desc *fdesc;
+			struct keembay_pinfunction *fdesc;
 
 			/* Check if we already have function for this mux */
 			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
@@ -1628,7 +1633,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
-				fdesc->data = &mux->mode;
+				fdesc->mux_mode = mux->mode;
 				kpc->nfuncs++;
 			}
 		}

-- 
2.48.1


