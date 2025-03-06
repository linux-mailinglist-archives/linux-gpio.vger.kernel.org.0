Return-Path: <linux-gpio+bounces-17176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E2A5579F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98DBD3B3FCE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 20:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F5727702C;
	Thu,  6 Mar 2025 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hY+sKz3v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338926BD82
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293788; cv=none; b=Igb04CZ4LH/nG9ns3hFosFIk9eb0Wrya8D5tGckpBJvN+EFQpMwxzSluwRDTuTfPHd1UQszYVPWy03NoC3z4IOFoYVapsyygG6XHVGjERrQMtRyJbhX1vI3h146YzRGSnYUnDe/8jfKuzqBR4AWxzpxzCOPAL2fZVpiLYhKhWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293788; c=relaxed/simple;
	bh=gHaTPoGguUaCyPpPK7WmS93V+YbLGip8t6Q7NjDiqkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQF4EajOg686TV1oUl45Yz3NIF7TzUKzC4CIpwhjDOMFkoh24p7lK2TuGhtux5NN3VYvklAJE8HSECfmNWW0OCyjj/9br7F2ZC7NiNSiMnHgNbr4WCkIaXafzGWWDkth+3l+vH1L5swf6WnFckFN+gJsr5ru/kjI9bTFdOj3OCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hY+sKz3v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bd03ed604so9954725e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293784; x=1741898584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=hY+sKz3v+dIXucKWd625CFiBLnje5YoIofpChxN06F0yJYNhKHd6iIviBLqIV/FD8w
         2a2MZcN45Fpr+PwKSjKbVpEq8LmMN0w7pWFCCpSwaojyGq66SN8U3ryjULUjrp88jdfT
         +6zJR6iKJzrLhGGvEpGi+Cj/HZZC2RHwHKVFuffW1t33hrJiYNMSjXHnmcz0dIfjqXrt
         piWjoQ5h1J+TR4ZeFu+Ft2iXtKRpY7h+RsEM1gUUJicd3AvoP0zg4hi32jqY+vIm+i/k
         URUQcCySnjrThwPRXtzQ47DOUAm1pnErYAcOGWZUujGiLIrYAaNtURaoYHQ0LDMtY1md
         XykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293784; x=1741898584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=MKg4w8lyxrG3zy/WZi0qK1OYDDMwCEgX8G7h2rZ6CMcwuN3EXv/rvPzKvibxfIVREd
         u1DoX5kAih/tJsX/pCOhDYJztaHME9jWiPNYXUnBKIlcRiVis7c6JvGJCCXTsUqEigB0
         rLqw7pzZ8+fw/irc1QknS5nzG1zN3pwikAHkZaOXsSGkk3Jek9VN+/jQ3ok09ZEhVWW4
         UYvr+Qh2dQX65MMZlXXeHF4lPHNjJfFCbhrNLa5uy6pS9fhHxcISlEKh7NniihObLjPl
         EM3Z6rqEY1W12iOWxqnX5/2G+MofI6IIYpef44G8sQqQpEpAtB8UDyfliEGNdlG744Kn
         gPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWijdNgYspy4zVaiA5pwqaU2yCXAdeY44UGL36jUStUSos09ndgUSlnpckHnNfjzJkBA7mwRjT7+DvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuBdIekPU89ksm/oa/9IGxJNcMg7Qh+3HX/0DZwHa7C+hCFMPM
	5fM5BcxJmPbtdt6T7uyiOm3Jc3hV0JrTVPtYUbIbtlpU1H+caNMr5Ky857wAQew=
X-Gm-Gg: ASbGncudHxvURk2cXLr7jCVOaHqESYtx1JFLPRRCZQlR/kof65aeCdncyTAjKbOaW02
	1WzzMOcPLx2aHv+aXzaoA+2guYf93kMc/Pz5WqjibDXg08b0KcmlFrLMLH4tDRkJ2jGfVTVllyj
	XTmSSCRrzlW/1BX+cJd6i25qgnsqV6ZivDNDrUn1pRZ2kccD54rzWvJqUbtbl77dt75eMUceBNT
	QgzKPNcfCCWDcVlwrmbxQ0WXEMiQ8TKCv5wtP3K9JyOxeNQl5omUPJgHVB9PYyNXUsVqWgwZiWK
	cfKs0YN8kqENEBydhQjumISwL7+zeD5ZgU3+E4lSMqpJXyUWzcqW76PvVIrc6ja4o+SxY/7yXgk
	=
X-Google-Smtp-Source: AGHT+IHgHUeDmjhiF9nyuHnoUr9M18yZu06gnPHQEj7EciDvVVUWaTVo+z9sFmf8CxAHO8yxpTlr5Q==
X-Received: by 2002:a05:600c:548f:b0:43b:cfc2:fff with SMTP id 5b1f17b1804b1-43c601d94fdmr7143225e9.12.1741293784023;
        Thu, 06 Mar 2025 12:43:04 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:03 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:35 +0000
Subject: [PATCH v3 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-1-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11226;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=gHaTPoGguUaCyPpPK7WmS93V+YbLGip8t6Q7NjDiqkU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjPyirXVi0PKWBbwHwb+grQneE+DsUmjzlqM
 WK4bcg4ayaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oIzwAKCRDO6LjWAjRy
 unC9EACNXTd2SoUJia1DJ+KrmwnOJFstG+NfNsThz9ytN3TrgA2QwRmMEMJgrNdDmujvaolmhWd
 teve0f92xioLzTX0Po4rFC1WenU9VN+3wH4EQO5bXKAJMa4C4tFT/WAWq/ToBnamYIwOJnti77V
 4xkyxgplmClmTX/hRX2457kO6pXVtrKPa9hl32Czg8tj1Xh/GULgOoELkJk3le6FMWEwonmtNuG
 uO+aGPX10F3oocKloUrxn56IySBPKdpB1iFaVnUeCzej2M5Lg2zKSsARso5baOWeGnzYqlK5T5K
 cdX2oGfVZxdqtLZzIpU3OGRZVQZxg/PxBOlzRaa2qo5TTYYW/VUj7yv67OC0JJg0v/JwDV1YbY+
 axaxDgRgmbKXWxUgcG3Y83ljv5qrST4neVchJ8/sgIluPciuCTWzRygrXzSAfa+HsJZnwDgq02C
 biNIR+653gXTDo7RsGw4pFlI1iTNrylV7L3xmJNEDYHmwitA/6QnfPfty34ioiZCo8a5i6j0KhQ
 jxO7VkEjXB4PxKYtxK4Y0GRVAXaCzMMg1f/oCzUMGWSaCtTIhHEiPF755vfdBMrAD3Z6rG0W39+
 LryJahTe3Cbv1eVdspprbyGxKuwwZXz7IXumoGbNSjMqpRW3zFn6lPYkCc/sJxgZxwwK24xKQDM
 qR+8Up/k8Q0acoQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

On gs101 SoC the fltcon0 (filter configuration 0) offset
isn't at a fixed offset like previous SoCs as the fltcon1
register only exists when there are more than 4 pins in the
bank.

Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
macros that take an additional fltcon_offs variable.

This can then be used in suspend/resume callbacks to
save and restore the fltcon0 and fltcon1 registers.

Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 98 +++++++++++++-------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       | 22 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  4 ++
 4 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce5eae3c21f11790b5a40037042c1d407..e28fe81776466b693417c66bb15752d609b79eb1 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1370,83 +1370,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 
 /* pin banks of gs101 pin-controller (ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
 };
 
 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
 };
 
 /* pin banks of gs101 pin-controller (GSACORE) */
 static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
 };
 
 /* pin banks of gs101 pin-controller (GSACTRL) */
 static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
-	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+	GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
 };
 
 /* pin banks of gs101 pin-controller (PERIC0) */
 static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+	GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
 };
 
 /* pin banks of gs101 pin-controller (PERIC1) */
 static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+	GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
 };
 
 /* pin banks of gs101 pin-controller (HSI1) */
 static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of gs101 pin-controller (HSI2) */
 static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
 };
 
 static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7b7ff7ffeb56bdde2504ec90c8df13bdd1ace70e..33df21d5c9d61e852834031570d4a0ac0e51f6a4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -175,6 +175,28 @@
 		.name			= id				\
 	}
 
+#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type			= &exynos850_bank_type_off,	\
+		.pctl_offset		= reg,			\
+		.nr_pins		= pins,			\
+		.eint_type		= EINT_TYPE_GPIO,	\
+		.eint_offset		= offs,			\
+		.eint_fltcon_offset	= fltcon_offs,		\
+		.name			= id			\
+	}
+
+#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{								\
+		.type			= &exynos850_bank_type_alive,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_WKUP,		\
+		.eint_offset		= offs,				\
+		.eint_fltcon_offset	= fltcon_offs,			\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd4ca6e99c7e72a588d780f0542990ed9..963060920301ec90affb2ee6d758d3d602ffb4a9 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1230,6 +1230,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_con_offset = bdata->eint_con_offset;
 		bank->eint_mask_offset = bdata->eint_mask_offset;
 		bank->eint_pend_offset = bdata->eint_pend_offset;
+		bank->eint_fltcon_offset = bdata->eint_fltcon_offset;
 		bank->name = bdata->name;
 
 		raw_spin_lock_init(&bank->slock);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52ea0b4392714fa9bcdcbae8d253c73a1..371e4f02bbfb375964b7833beb9bbc098a51f4a3 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -144,6 +144,7 @@ struct samsung_pin_bank_type {
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -158,6 +159,7 @@ struct samsung_pin_bank_data {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 };
 
@@ -175,6 +177,7 @@ struct samsung_pin_bank_data {
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -201,6 +204,7 @@ struct samsung_pin_bank {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 	u32		id;
 

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


