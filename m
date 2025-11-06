Return-Path: <linux-gpio+bounces-28214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBEC3C68E
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4783D4FD384
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5C234F47D;
	Thu,  6 Nov 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYR71O7w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD734F24E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445805; cv=none; b=iOgs2BIL2OwlAwNftVlEjqYKfoG667LuP4TojXxMbavZRvVKVt4qjh/68EKo7RakAqNc7z3/egh8u1/76TeK3Knq4oGcrgdwSWX2U/Dr+q+km1XhkHgM0E/ZOpjTWrKRFEbD25tV3/EicyvtKIHROSIqxo42WDgox4Mk0zgVpTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445805; c=relaxed/simple;
	bh=8j8xzdpWWGIQJTuLOAuFntqmfK/jylg0S/LsK5+N6+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAiIOekSsf6HdEwNJwNlOGzFx1QKxEZJeRWMHSEJNH6MYLkJPgXjCIg69nycZXtSfrJqoTQQiPuk7ZIBIp+6b3SvwYH97IjEUnTZ3CoDOdW/j2HfchzHLasEVGVxEYXTsN8FMnvLrcCCuHzfqoJxAcofKolv0MpGnvfmLBCUwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYR71O7w; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-633b4861b79so231411a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445802; x=1763050602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB4z51LIflJklurj0g7UdBUTO3OdObbc/NJxwgKEh/c=;
        b=EYR71O7w5ZDH+gRdHILi2DG4dSLWbq3SivKjexJ0OaPIaARFtUKUihNkmULPQ4XAkZ
         R6OAIC+18WL7Reo5zR9VT+ocV9+Y+Yq1TOyyvOzJtogPe7Os6cP+eHZcySuCj7wInVMK
         9mtds0159cXdbA7LYOnFrwfVu11eSs27IAhejk9XlzKsZo4Mf+NWxfBROkR0kjwnGSVO
         dcvujGyV/4b5rhpgJplRKKuCXs0yf/0QgBSkKPLrDf5NqjDajk1sLlVFCHmb5nO0w5yE
         HRRW8Vjvgwf0PwXD69alxdWSS8/bjcsq4TBWlc4PcnnaYmPHtHEuPqyEqqv5zWMHGbLV
         PRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445802; x=1763050602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB4z51LIflJklurj0g7UdBUTO3OdObbc/NJxwgKEh/c=;
        b=tXoz2OAJEyFNe7K6MrM8ug37yr10APzJ4bbN0G/2dQyl28TMZI+V+1+MjxVIGT/ueU
         BQktM3O/y5v130H2qHZSYTgv502/EYe3gBT1m9F018tF5IrcQ+lKvwnInG4fgBywX3eR
         A//sGZTnEyHSAHHkfYuWJHLox8s2j+wWO8v6zs7O+ZFCVK1bWKp8CTTh6/k/A7huntaO
         d7EDeqlQziWcZ5YdmNhyzx/MvdL0cNn76YSAXLaIbUplu4fkBqACTRuEQa8pfufMMLRq
         V2cEUQGMHYfQeX5tsWGRxgYL0Q1ldQ9TF9pqQh2XtlzspvCs6viReAz0bzYaDlz7lkHK
         wctA==
X-Gm-Message-State: AOJu0YyubkRs/qlJfLxSNc0hsfBGUoaL3MTtZKXGgbXXUUL63IWNmrWb
	BU40HdbuY3Qho2k9QZSxAm9DL8DH9dxmKWkLifl5gpsrD+g3u61I4F/lbjGv67qlr2U=
X-Gm-Gg: ASbGncv1rQHdvnLFTfSSflD99BEbzM5+4ho4/YzWl/hjBwikU2PKXWMjN0RZnVTb96V
	kbWpwN8q+ZJPPkcF2+t/n7uJ08dhrtN0/9LwG5Qv37DjvfLiVns9xXYJqTkx3O7aCfFA92mFJvd
	tN40zhUtdpptxpHF3KoGIGvYtU9spHsy9vr1MAMU1SWzRsFwgzEwlfOjDei4snFWxM0kwMd8NrD
	v3W32bXhsJ+hIVA9hHhE3vi2azPK3EOUtjdtkfIkHoOPgeCezJtyWf/QDPyUhQp0IircN3HQ+Ii
	sDHG+lFTyYIaigFYpMkgh0fxyXWeBuWeMX46zYRq/UFRb+S72Q4ulKghVWp5x8rxww8Km7+L1Xr
	nLmEWHsqSD3MyaIz6vnPdoJWU6+7Ci+k7lATSO+2OPGErxZrb5HrJ/Vmot6ExX8ObQffEZ//LpM
	H6aYJIA89Q+6tN8T/YXIwQBgEDt70=
X-Google-Smtp-Source: AGHT+IFtC1GinaspbkQnd4wYug5IUHjv3SVNkj0rWIxppV9FyKPtYa1YcloDSaQrqrRVLMWxj8ovrQ==
X-Received: by 2002:a05:6402:26c9:b0:640:9eb3:3683 with SMTP id 4fb4d7f45d1cf-6411f615d03mr1806671a12.1.1762445802063;
        Thu, 06 Nov 2025 08:16:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:27 +0100
Subject: [PATCH 3/4] gpio: creg-snps: Simplify with
 of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-3-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8j8xzdpWWGIQJTuLOAuFntqmfK/jylg0S/LsK5+N6+E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMngzkBYrj3JN8lP0o3ovEK2e++MYdMvcveA8
 m4ZPs0/rzmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ4AAKCRDBN2bmhouD
 1/57D/4pRWUnTW5hXv8wZdB6uRuQ55K28z8ZH3FaoCDGOnKAN61qaX0gKcjyK1QpdBM92q8dQlX
 7WOn1TtYWAGTHFqZ0FYGKUVtRg4AA40VNmIBZS0onPYiR3iUWjL91r8g+jFJRB2IsLwSt7sl1Gq
 aA8Xl3cHY3fo+3OVmd2TcZNyffc2f+8zM23RJHTHC2vO2JO7UgyiwzK+D8FukZVWziot6mdGL0s
 Z7BNjDHl8QiwXA4KWruLpwle9ZSdWVEM3zYUXEHb/UmvDvDHtyIhrW/7+ar1nPSXgWNLAys3C6p
 e8aU5fpUXAotF7tV+80nDFZe1fMdKUzUX2y2aeR3ErcwwuH+S7B5biM0GMzctAs/JaADM6JIKVA
 twdMBzL4Gw+dgCByJDc7fyqMY+vu3YtPwyla7Lw8PbtVd1OFaXAsJMEKoBb03X6xoHosdxtBR+i
 xrFfcnQBVxZi8UDPDa8gIgfK84U7Hp/6B4S47THfEkyZuJF511L1ii8URMSs1sPrFGMbCi0jKoB
 9cBGcwJqifeOyVVm/O+r2r9CSMGKdf+pXk2RVCW1CtCGEt4QyVYtucVFqw96bgGmqaJwkp2wKC5
 JdUL+O0Tk9wvaEynfCPgNCQSDSUUhm78cVRhcsmdO40bTXxVrupADbP2q/6asWxvHK/z02SPoq4
 V5KGI9l4mXh3aFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index f8ea961fa1de..cdb103b0fae3 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -134,7 +134,6 @@ static const struct of_device_id creg_gpio_ids[] = {
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
 	u32 ngpios;
@@ -148,8 +147,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
-	hcg->layout = match->data;
+	hcg->layout = of_device_get_match_data(dev);
 	if (!hcg->layout)
 		return -EINVAL;
 

-- 
2.48.1


