Return-Path: <linux-gpio+bounces-19872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDAAB17DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 17:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F7963B15EF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62963233736;
	Fri,  9 May 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEBrV2oQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DF224AF0
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802884; cv=none; b=WJA/HwsOpK9JJroQgfhyutPOUJlvQ8YvTekj4/Svjah2ZDWVcbnUeRFVtVADulQDF0k6KeQtInDTw5hoY1sinQ0um0ijutrM8oQ5gZG2n4dDoGgv2XH/z9rf1mHVJEHikxo7ZyYliAIq/G+DtoppzrAljvlU5ZmmfeoVhfKPGeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802884; c=relaxed/simple;
	bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbY2VSV84T7TK7FE5TGawcEHiaNfpgAF2wqlM2pb5rnpAFyBreT3y0rYXQewjzwLtB4y6N8xrhCyL2CcnxMuXPMShv5nF7KnPILbU6Yw1MdAHIbW2NVEB3b46JC6cQQTo/H0bUC0iIVaYHrUO+jU0dQFuW3KBh2vp3MoZt+UcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEBrV2oQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441c0d42233so1148245e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746802880; x=1747407680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=GEBrV2oQywcbh5Kr7O5SzAEYxMKoB6NP5O+BY0GUowv6zxPIKcy35H2JHAJw34OsXp
         0Z3PtJo2tebiqkr3sQnVYvYHbggstlcKhpeNldFFvI02hN1ZWlxo0QO7crZoxBN6Iklv
         zvof2vR//CAVxbtRkQaz51cljiel7VQKRQQ2Ov65ZCQ9zm0JLVKGGXdpInhASJW1eA6k
         iN1YfSFuK7Cn7grX25/t1lGkGd1ML9WzzjRBr1zQQEFG2rNo7dCCAOSy2jvQuC2lbpMe
         LmvbzwIHYwyctg/QZpONCB1czS6+vsm240mRjBCLgRJ5djTlJwRToaHqTU/k4Bwsh9Mj
         eN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802880; x=1747407680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=r4tCOhjuB831DzBTFpVybBojd2A8hYssGdSwN0QqCF4C6QNxI54f9KhVtU5sq+IEgf
         iE/YRdd1BjT1P7+sPgV2ig/X/z5dzSMF6iBMjjENdwxS8ad3TcPPeh/FbmWO4nQT9cyj
         BU0pMzev/kqWH2BTGjyMKxR/djRkq071jvLLh7eGQtAq4kGVnNnXzoJRiQ71TYKfztUB
         bcCu2YIA+i6yVtOnG64VogOTytF+dtw2lGsnzCEwv0OoKBqljsGEoOUMTTG8+6kK4Xk0
         Fq0CWF3lLxkLsZ7cfdyfF//ER64W+Ps4nTZbWald5qs8IoLeCJnh3Bw3aozftkq1iVwL
         Cl/w==
X-Forwarded-Encrypted: i=1; AJvYcCUqK61G4Z1Kfv3mH5v9myU3Fa4VfUlD4/DawtXM9W1T4Nhdgnl58/dB3S3ru+282KzG9cc67zaBuf62@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gHm+0MZv5WaUlwwXETwVjFr9LpcMDKEGtJeM7SXi85Z8dBqR
	1qSZyKzTBgmPf3C6RBY34EKjdcjH1MOQZXSdvULWKCyid2XY/GACn7aPkU8SvDU=
X-Gm-Gg: ASbGncsh2pzQdgPhi0tThgCKMQzlr+/GdJ01U1a5d34IxA/tazXspIiVg+1iVZL76pZ
	Hbt8AhbmEKETAytHet4BBK2j2+vxiDPcZ7B5Kf7C9z9QkrVXRiIWRWf1qLnDUkQb4r84OYYpYE7
	NezSxxEf6so2a7hlBhug793ZOyh1DeRGUTdAXN7n4qYfPHLx5soyECiUnfcJZYGabfbrHKPumhJ
	UW7W+W0mpZqHNqWjXgEHzFZdGOZBHvqMqiYZDX5caFUBOggO7l1jUlYhuwLU5f9Doh3S3Q2Ae0y
	ddvukjFqzhhNRQkMm1w2xj0rLFYyf+DzE6JeG5fuDtKgXEPTNQ==
X-Google-Smtp-Source: AGHT+IHkBCNBnWPS/LtBg9S6XT9b0O28ZZRzf7nzBT0Cq35AQorOtZe7qvsosSmWPjFrnfFCw+NYnA==
X-Received: by 2002:a05:600c:8207:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-442d6ddcedcmr10827805e9.6.1746802879590;
        Fri, 09 May 2025 08:01:19 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm32063275e9.10.2025.05.09.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
Date: Fri,  9 May 2025 17:01:15 +0200
Message-ID: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhi6pu+duuCQJsD1u7676gujslrvVm4Iw27Cv
 36hI4QfwzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4YugAKCRDBN2bmhouD
 186yEACA393kMv+ucbdEL6lZb/ug65wE7C5fY0na+UddUEAqfbdRTMW/MQNb98gck2H4JelcSfd
 OqvvlLQeKFMdWfdUO18CHwvvC6jx66XVCegvI4JxuvyksOrbdym5bdkndEtsvJU65+czjW31aQC
 bHRORJ2LIBPhhHFt3ciNC419Qf2mqrIbuTdCqXzPCYIAG8lyODGPRBf0LOzsou2eHbNKoe/9Y+R
 23eU21dwJrXTGQTdhZ4qfRdprxXwba89LAlR8QDQCVmK16b1qGaazYtoO91pGXtUR8rzkk2i48H
 Wq9kS0QV3rawviyRjAMKi85wG92NalX7ZfaI2Q5QuOdw7JC0O+0Q0AgxcwAxwRboQ39ip4LqGDk
 tvjnS4C68OSHUa3PX6JTLE+UXdCZe30u4UYdsIcmTTT3FgpzrXkJbKTXqGkK6uF0+3HYoijtD9g
 s+SAVZIrOX7WT9EelETCp43Y3cuWalfUBl6VVgIGPY1QmUU0ATKC65qnVOvh4fXdUuH16PWtHXV
 7Al9PQ3UL07lYL8o45wc9N4eZf11k0Jrxz/Y47WdnpUfH7JQ7PjUOs2+s+zD0+/QCmae9q45mJP
 YO9URaV6sm2hA0MKrtqU5s740gHW4t8rdh2BT/QLHRUNFxURM2zBsHQbIpt/eXKgkE5r6+FATnw Lzhd+0AQCGwUKJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

aml_pctl_find_group_by_name() is not used anywhere, as reported by W=1
clang build:

  pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group_by_name' [-Werror,-Wunused-function]

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a76f266b4b94..385cc619df13 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -596,20 +596,6 @@ static int aml_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static inline const struct aml_pctl_group *
-	aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
-				    const char *name)
-{
-	int i;
-
-	for (i = 0; i < info->ngroups; i++) {
-		if (!strcmp(info->groups[i].name, name))
-			return &info->groups[i];
-	}
-
-	return NULL;
-}
-
 static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 			     unsigned int offset)
 {
-- 
2.45.2


