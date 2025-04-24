Return-Path: <linux-gpio+bounces-19269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D157A9ACD4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 14:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76A1D44388B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300C522B586;
	Thu, 24 Apr 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zDzjvDTY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338471FC0F3
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496391; cv=none; b=cX1kvZgeWQyS6qjfi84FwUF7lihgVfJgqMkYh0VeV18mNrULiyuGk7q+kAkx9ruR8J1pLFH4LbnVKiLnDAgIGQePXjfny2IR/p42JVVipXbL+A5EvL3g418S4nDjUJwXmyL05KTxn6vdTBkvE0aZjIEVOr7JL5j4FN5Hzb+WIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496391; c=relaxed/simple;
	bh=E17apN4/FvY8+8WPROx8SQVb30orZsn+3FR7H40wutc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMQlR1f5ISSLgzGNnYqWqKW12owV39R9CPQzmiz2MHZEgZIDXKYEo28HgEPpLOsEkyV43/K5TWcg/2y9+nl5PTHi+cC5S7b2O4JA0yQKMHhow5d0euGsONBPpQtuSSqme4W1IUcQ8ow+7ifdKDt6xvDnx5IPS+myHIpFJhP0SVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zDzjvDTY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfba946so662116f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745496388; x=1746101188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JZ1tbc2jldm1ypA78cgb9SagnhmvfhXzqqpq8uOXtg=;
        b=zDzjvDTYZkIB+90c9eOR6EoaAZqmRedHFjvtexiM93najUKEUkuqsD08YVFluBk9e4
         7DfFBfBY+02DI1tOgisgf3P3O7e/yJTRoh2YmE6jpBb5/pvxy0HbGDkFqkqHeU89pC+J
         mGLI/XnokWsZptPePSJdlf29e24kBkDXZGEeLmn8tcpJAM9LNbOW+dw5FVLPP1xt0KUH
         AXp2sTa1sK02enVxxPkmNsLvOiwD6jzOphvMdpbVJrqGgt/LkO7bt633qcop2QkJjPHw
         0pUCrsuhdqvKxYwz16Y4W7O+cdWIFijLDehKiEIc56oVy8sc3x1d3OaMKubBtauqo66s
         IOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496388; x=1746101188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JZ1tbc2jldm1ypA78cgb9SagnhmvfhXzqqpq8uOXtg=;
        b=jKGxAEhJItU693HejHK2ESdhnBT5zSfWSwqDgYKfKamq7IDPp8QC2jQV5gcikwiudk
         UX/2jR0We7k2tznBQwRw8LpSETPfXQCguYxF+iNBkOjFDEld7wfBOarxSf68JHWfdIAn
         UkhhG8wqOhlo+fCmNfZ1ci1B1BUy4dM5nyhBm9ZYaojHZBRDhMuJZyeb4fqMk1yZjUyL
         0te8D3ALGJyXgRTbAsctKbBG8zzm6nsLiuvz8RqgdDG+2/Vs0lqtUJTVG52cLDW0M+bF
         buAgeEFFWMXmKp7fc6sFIdYRGIjp+8E72dBekcGSFLJIsyuKaCD87zd0WsZn5ZuqEA6D
         IhNA==
X-Gm-Message-State: AOJu0Yw4ry+XRV1Gt32HBjFYGYXkrCM+cAzztHhWm3rbKBPFlLeUeH9y
	RpnIsbHGHGMx67/pEZcxj1DNHQN2NvWSclZC7taD3AJs2NRl8kOfhkkQoU/pZ30=
X-Gm-Gg: ASbGnct29hsmiZ6Ik2YICSSpD0OFjNo9AxfhGxVzQakfh0S6iIPWetg/cUtxYMXlir4
	bZcS4TTZ/tQAiEIMEzkv2Ozbl0mL4526J5Rq7R88wosSPpKBmujbGZs/oeSxPl4d3B02mxyjZOW
	ydtAHwS6oKsXlXKKlaolO7jXhbZr+fgGWWqUU5vmDO1lDHjU2eTm232WIyawYlysZvGnge3Auzr
	ZULD0g2cjQqG1D2XAmhkB3qjkoVLGVlmasNI+/aO9ve1pkLbit4tk5qWpVlwWXDuQULutTIPyYY
	7ly81sd2hyFntcSe43IPlfccsfse1GgDqQ==
X-Google-Smtp-Source: AGHT+IGsG4VUEswSS1V9LYbzvJK+dG3A5geKva6wNQIYeFolH/3qhfbZCVpBQ76Fy8TXkLKuokPKow==
X-Received: by 2002:a05:6000:438a:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-3a06cf4b69emr1977975f8f.5.1745496388214;
        Thu, 24 Apr 2025 05:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c108esm1881793f8f.40.2025.04.24.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:06:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 14:06:16 +0200
Subject: [PATCH libgpiod 1/2] core: keep memory usage of struct line_config
 in check
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-line_config_mem_use-v1-1-fa0abdcf0cdf@linaro.org>
References: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
In-Reply-To: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OpiXCiS8GEaSSqvMr+cMwA6cA9s2uZH8AiFO6/NdaCA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCilCk2YJ2IxON8nBtlOaLTzvyKjQQ4CN/MHk/
 Or/xEJvcNyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAopQgAKCRARpy6gFHHX
 cu0aD/oCVdq+nnfqm/V5K8/TK89LAEmIyTmZho+7XJ+izrnN3CNRDjTmglT2ufJTfrLPDQXV1l1
 9LpSN/wJ0/SZxlcDOOxcMzFG08HYlbBw/UxZOpMgR9GkN8HfWrhG8od9Mi62tAOFLLiSdhri10k
 QUoEuXxgwmAOsHWjAea9UE9QtgbcUSMFqHyPUpKzN58FzoefgUvrt+gBBgSMJrFzMg/WaNymNV3
 zEMIsCdL2gUjaD7eeU7gV0vb2QVqrz/ns9Ha8VQROI3RWYfR3ggB2ktZ46Dtk9ZEHKtU7JAcdbe
 wBkCE9DPiQ1GLbcpBZMKe93lB29NOQiL06eccBYe8zrn8XONPz51HvrsC47CPRGaiAjieYCCcVD
 tOnMvQUIX/kAprUkdHhylJr9NQZ2JMtgPlvU9dS5OzVFJKG9rNBuTxvxBsJNIG+rrTiicZoF3M9
 O/Y1zfSiTyOUrB0o8AboKyST+dtDSSEuHqw3+PH8Oxn8tyebsqXkStBT2oPhx0n0smLxoqK56ma
 OQAQj0Y1iqnh2QwAt32H+PeXnbBl/onAizj9AQ/Tdm5L6jfswXBG23399U4IuXrqxUTAHa70oSO
 IwCJjgyuOvYZWwcFbrBVrOUz74rO9Mzj3lJFlp9kMdzByBg15n/HnysIVUBcnLs1v1t26oA8K4g
 qpLjTUmBIHE1LfA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We keep a single instance of a struct gpiod_line_settings object shared
by all offsets using it. Everytime gpiod_line_config_add_line_settings()
is called, we append it to the per-line-config linked list and reference
it from every per-offset structure.

However we don't keep track of the offsets referencing a settings object
and don't remove it when there are no more offsets associated with it -
we only do it when the user frees or resets the line-config object.

Extend the settings_node structure: make it a doubly-linked list -
allowing to easily remove individual nodes - and add a reference count.
Keep track of how many offsets reference a line-settings object and when
that reference count drops to 0, remove it.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Closes: https://github.com/brgl/libgpiod/issues/130
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/line-config.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index 9302c1b..24357f3 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -13,8 +13,10 @@
 #define LINES_MAX (GPIO_V2_LINES_MAX)
 
 struct settings_node {
+	struct settings_node *prev;
 	struct settings_node *next;
 	struct gpiod_line_settings *settings;
+	unsigned int refcnt;
 };
 
 struct per_line_config {
@@ -93,7 +95,7 @@ GPIOD_API int gpiod_line_config_add_line_settings(
 	size_t num_offsets, struct gpiod_line_settings *settings)
 {
 	struct per_line_config *per_line;
-	struct settings_node *node;
+	struct settings_node *node, *old;
 	size_t i;
 
 	assert(config);
@@ -121,14 +123,29 @@ GPIOD_API int gpiod_line_config_add_line_settings(
 		return -1;
 	}
 
+	node->refcnt = 0;
 	node->next = config->sref_list;
+	if (config->sref_list)
+		config->sref_list->prev = node;
+	node->prev = NULL;
 	config->sref_list = node;
 
 	for (i = 0; i < num_offsets; i++) {
 		per_line = find_config(config, offsets[i]);
 
+		node->refcnt++;
 		per_line->offset = offsets[i];
+		old = per_line->node;
 		per_line->node = node;
+
+		if (old && !(--old->refcnt)) {
+			if (old->prev)
+				old->prev->next = old->next;
+			if (old->next)
+				old->next->prev = old->prev;
+			free(old->settings);
+			free(old);
+		}
 	}
 
 	return 0;

-- 
2.45.2


