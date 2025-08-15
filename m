Return-Path: <linux-gpio+bounces-24426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F5B27CA7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BCEF6276B2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B752E11BC;
	Fri, 15 Aug 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ze+NKNg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517282D12E6
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248979; cv=none; b=mfjRgFO535etM1qkbWpEpyE69HeITzEE/YwhnFPQdUQiTYHbO9rl9yWZf3edYmmnTfy/iztIPCQhcyentoQxo5eUD+MfJDxmupoyjiX+gGwjXm/JkgStaqHOktIwknwZGVvNpHjDSyal26jpHSvah6qHhUuUSsH5ds3L+pjSXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248979; c=relaxed/simple;
	bh=HSTxkhC3WyBFM1G4jv4j8GQuTAWxbn2e8t0aXkOzg+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3MbzGx1lfvh2fVGbqezm3rjYnCiKbbrfpGByv8q58fnKkdLqOD6gg55Ze+0lAIEFt1SH3uIAjXRSumUo/mXyTrySvFWamrKQ7AKdlg1tk6FoGAmLceG5MsMsGYI0io8MN1HkS1wVq15zVg7xhYybOIBVCGeRjnkSQlVUZdMJew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ze+NKNg7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso12620115e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248970; x=1755853770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=ze+NKNg7MAVoYEpAs9cqRkqpt7tPvRqQn5J8w0Ph4MYNHJQbInwYGtMH1VHKAo8KKZ
         UX8FAqckxv/iW6LGkK1PMNIRC5LRkh2AnUVM/u8N7sy+7X+gtjp8KkWAVEkYMdX6iNfT
         a5UgkU0nyLa0RA5ByICi8QVLQexrMGSDb4pFyyS+uOJPfgQivsE2RwWpsPkUYxrdCk+/
         9g0DTmFZmEvNeSxaqCN3F64z8aHo5/cf0GGFDhihPUtY7EZ41Rviafe0623jqSbLNbVG
         WFFv00w6AwiAmCjzbqgasAX7QDE56whswRSZlr1cj8Ncp5Siq33EqFzIjAS1UEXWHXBw
         X/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248970; x=1755853770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=AMn2V21VgvSlZCUeIw9PJ2Z4MhBMI1Scz37C9b1/1U7r9LYOP01VbGxKs6kzkg1Xmd
         v8f5AFGEuGUPsBFlXK5xR6rj7w/kYXPO9Yoh5qiw4b1vyzaWDDuvm9MpSuB1I+jWtHTz
         fXjXh7rYUatTuvirBK0bOcA0OCFPKY8WV6Zzj70P8pNrAFooTO5C7g9f/R40pMMsEHlh
         QY63/UV1MgE+wYys/um9WwZ3Fjfok9KhUPRtiHdajj6YW5j648Tbkh5IW6YrUpaFmA0A
         pPAwUjtoEpZleJg+KiSQmgZGoY06vMcah/y+Rau8Q96a5o0fnEGojNN2cuMtIGTQ1bjx
         ZlZQ==
X-Gm-Message-State: AOJu0YzA01T8l/lU6bJip77QvV6Sd+pzS7n3B79IIS/dDLkp+GX55D9Q
	PEBiAE3KbFUmTRheJm77PEdR9an+OHfpLbXhXtGYlmh7jaKLk88KlK7QS4s2D0d0Qk4=
X-Gm-Gg: ASbGncvagbdYNn5p2ah7/HSLGWST/u94AwyO9TnMWqJI9DdBWAX3VTrxAhfeKPONybF
	bbXvSEUrYQIT1qM4Oguf8ckhbSCxXeMiRvL2PLwxMTBOvI36jUGuizIKykhdu9I9JVTFnP51MHS
	F7fGF6S0Q/hf9sfQyAcv5sn9P36xYaqKeicUxnNJ1cblX56e7WMeeXBR5h/sc6Lxign+5KPf+9e
	tR6NKKDbFPiknLwvA05iiuYcHZ6+ct0mD/NH5d+3VfRMityOz4DSVw7GGH7jPhg/z8Jy0C3oo3i
	mL2YeEVhH2Th0L5k4DFrQVXD2P8FghpQx9XO29jGKthS9KgPTEW0a7vk2mwvaY88tj+Z/x8jGHC
	u8d2v4PjPO+7vxWG2gg==
X-Google-Smtp-Source: AGHT+IEuSRLd3B0h4SE3RR2S2yHycoqFTSLj7jDNuZgFZPq4txV7qE0+ov1t4k8bQpePbvf3meSvDg==
X-Received: by 2002:a05:600c:5286:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45a21e7f2e8mr9560235e9.7.1755248969664;
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:10 +0200
Subject: [PATCH v5 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-8-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk4AelBkHWJWZSjBIznNV8JlLBDYLHWXKinX
 +GiHJ5uogmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 codHEACM4UcW4XmQxoTdvJG0sbAVF+QyQHCaGbqkMyiyny6aH7RK2tq8Xl6yZSAoDRX9DIkdLsV
 cjvfs0JZcnSCGBsxTN0eEICrrspOHQJRa0Wz7f9MKd9Mfp7PkVGQBphWEZafv185lvBfoQYn10/
 KMtkOfMe5hOMHj/bH0r2Pc+DV6X5sEMdx/LSX4oRC8+cpTqF3s+mMLqSOrQN1alY6PnM/461gt2
 eI0f1lIQyiWLUH6ciwIJP9DWMIWGmXQP+TPp+em65RkBCAYoqFmoeyXOlz2RCO8St5K6+fuqAFp
 5nFyEPiGfSr/wntSpNNNoZNz0fVOdELEgqJ0275bDqBW5cek9dhFtaO6MFMvPn1FGP7wpac46ie
 ZX0acGHA+eBIISkExKYmPTBWlX4UNY3tLCaHgedPbnTVe/8blQMS+jtcmlT8N0vTDcLPocFUqVm
 m98XIN8qONHj6xwZHnc05CyexQgealE1ZYeYBYHkpC/2FWyUzIpZ0dnN2HiEpj8H2J0+PoZ1l8A
 ZguDBgwMeJJF1j0ZYFn4ZZKDu8zgJoZeGsNcp1BnOb0+ALnGFfMwsfTeOg4e6NiqXThqwizkUXp
 0ln7J9lak+xaWe5YElclyG7HeWIY7RLTvgOSJd+mhwsTItLmpI417ypQDquLMvaUrdEKVlQwWyM
 1H1INlqKY1Feo3g==
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


