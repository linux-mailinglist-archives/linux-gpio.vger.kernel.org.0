Return-Path: <linux-gpio+bounces-13528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7579E4D1D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 05:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1651880708
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 04:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05B71925A3;
	Thu,  5 Dec 2024 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL8DlbJL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B614A90;
	Thu,  5 Dec 2024 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374586; cv=none; b=tC6eEJsfCEGGSxZ5UJr356uQ97+aDywb8JN/df1JCde0GHRT7fx5/C7Rq79J1jt64U0u0/8OPTP+HXgAsC6F2/HTEsir6O5Gui2/NhuIioqUAqlBHJWVB2dMpu+7JAA/unEJwmyeF8o0RGiz8nJ1bGwMSMuwiVCzYDs6l51YdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374586; c=relaxed/simple;
	bh=PkPObrcFl+EnAQgbSTQ0loUbiD1LPSz9Ck39uq73TY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WPF4Up9j76IYpDvNvjYLOPcIJZr+lfb0d0iXPX8tUY61QkavX4Jw8CgZ3OngqPWwDoqqZjEo6R9EZPFjSjJi05QEaPW6ZsH0zzzQ4xWmxTXIX8kaVXi9060BB7wsw2Pn/kMo7M5ylIhGKTNMm5WYXI4eHAyDXc+eSoV/2hYz32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL8DlbJL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b68e73188cso41096985a.0;
        Wed, 04 Dec 2024 20:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733374584; x=1733979384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
        b=fL8DlbJLBSVspXuBN0d41/E+tZRioldSdBFi1+S84I09rNWSex/iPOBI3VsYuJDnWF
         A1RT7puT/OwvrxhgjopANhnZNEvDAFWO0Cbuz4y2RwzqjHStGRIa6eWsS/Gi7+wZdP0W
         8ks9qHxOtogtEoFN6dM+2tHbF1Nhhy8GYsKZxiuuCLEQoaEyipVB1laatX2okBtbl01a
         WvDHNAwBxucJ7QNPwKMRbCS2uOsf2o5PkptjIZQXOACerxAg5UhhhUIw51zkI8yowJjF
         /qTaDo00SL0tdpqBXGWKTDd8SzmNz/a7To2+188CoT75ieC7ZuJwbJ3Am6VmMI2s3Df9
         BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374584; x=1733979384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
        b=xIUwCheunTbAEGOpG4DKRZjrxGoyN4KDvNA34m0vVyF5vRVu38aelz1tptpUz+z3uF
         9S3e6dMT7SnY5hve+r24cnZfEaxWz3GKHer1NPFwBjXViXtditey6bmqqG1fs/gnW8YN
         xar/YdxRWHWLZLpadBY7+y8mXVzgSDkjc8tpFa/XKkAU2hQXIjabfbG2XYi65LO9mBMS
         +m1JhOeYz4mQfXYyvhdOmryAEw9Fy/G4jsHFspse50VtSCCCTlx2d+f1vVXNT6BTo/c7
         hq4s/5bwywnXYL+WIhqT4VOJltv8OEnvH0LMPcdyW1WaxSCXb7uXl49uIsaehKLsfwq6
         SW8w==
X-Forwarded-Encrypted: i=1; AJvYcCWoKWTCFdtBFeg94eMSnQh4llgHwlgjEp7S1PWYX84xRQaGDgcLTVsZ40f6gKZLFU3gcWpBB9BnBHit1/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6QKFfsA563q03I17mb7m9sSByxwibSNtLSyP7f03yspHjLk0
	8nfhlHYf2y+eBZpgQBCrGu/zYwnD7X1IVwzTJpk9A9jR9MUlyLhh
X-Gm-Gg: ASbGncuc5tyi5vjAsNTXvU9mDrNmKPsN05WEne5QPRy/gGZXU3yuzgp9438yIitl55Q
	KZgnksh6nAg9qsvU3ujznQFddcuva2X8ucyX/E0qr34IVWUtqFMm1NG+C5rNMsx4RbH4NBjzI45
	qNn/2syjLwXjWZZ4fpVzC0B7K4tZNIfW9TuB8DeeqZOY4tqbQ155mpDd/FmXDl6HD1r2qUEBnCE
	7JXnWepUy+g56NVRZAcmdUVAq4fJi4PQYvlMbm5duTO6h68xdranNOwZXi2RRcigQ==
X-Google-Smtp-Source: AGHT+IHIuNQrbgjQ4cjH2cjwVpjstCmf4cB0AAn5tmajUXvL3AEVai2cjHK2prUL6uzLmimt8pbxNA==
X-Received: by 2002:a05:620a:2625:b0:7b1:52a9:ae15 with SMTP id af79cd13be357-7b6a5d2ac8fmr1106699585a.9.1733374584037;
        Wed, 04 Dec 2024 20:56:24 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a83abbsm28121185a.92.2024.12.04.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:56:22 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	make24@iscas.ac.cn,
	peng.fan@nxp.com,
	fabien.dessenne@foss.st.com,
	marex@denx.de
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pinctrl: stm32: Add check for clk_enable()
Date: Wed,  4 Dec 2024 23:59:42 -0500
Message-Id: <20241205045942.2441430-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch the potential
error. Add a cleanup loop to disable clocks already enabled in case
of an error during clock enabling for subsequent banks.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..eb7b2f864d88 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, j, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	for (i = 0; i < pctl->nbanks; i++) {
+		ret = clk_enable(pctl->banks[i].clk);
+		if (ret) {
+			for (j = 0; j < i; j++)
+				clk_disable(pctl->banks[j].clk);
+			return ret;
+		}
+	}
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1


