Return-Path: <linux-gpio+bounces-22080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35591AE6EE2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 20:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9F2E3A2E39
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 18:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5423926CE3E;
	Tue, 24 Jun 2025 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9SDKxy0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862D19DF4A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790883; cv=none; b=SGdgLtuTGj8b5Scrp5sxoccdJ1boTAfFzFnKqeM0CStxlSxPzZnzzbSdO9+qlV3lblgT+VULmql8RrvPpxUuSPrc+PNqK4lYh7XZPvFrosQhaaBw+luUolyr3FOS2ckFWc8WK6p3Hz35UwkJxC79vdChQTs//72eYLOjZMJWzzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790883; c=relaxed/simple;
	bh=9lDfUAdQbqFh72EXTgKQK0zQM6sRnDxbvr+VAN/1mIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NrwalWkSMeUOAB65w3FY8lI1L0QpCl2Z7C94EtG2UtDOXy7r4AqtUmEz5dQaU4N8Acq6aCDays28NQEZswMQ8Dgg9+MtE/8RyvxDmNU1HnbsUGYmnq8qi3C5B2R3z8e2ppKRJH4VWVu3MFma5Ox9MEtEUOoU9kODKScs0CARfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9SDKxy0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30f30200b51so71171611fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750790878; x=1751395678; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ4aYOtUH2D67botXZIPmEAuCddc1X0QVoLWqw3GU0o=;
        b=f9SDKxy01/mz3f428vjVLPm6vmEQ80lAxivE0wi5HtTgw+fOB9keanHrinEG2o/jZG
         3vWOH+WByybfjPRpYGSkagbvBudQzCqXZluSU9P2cwM87LBWVTKRRwEqEC9Li3Jq6NFe
         4irbBkLn6NidWS8g9EqyoS/t//lekrYfJZtuSvLUqTodssFHvYiEzvBI2Y7lDlpXwn0M
         NlXqSBWU/w1+nrz+OjdpMaQ/Z1T7CrFRh/zC7W3kzdg6pQA29moefdMQ9AHvOey3Z2yM
         xNyDfhbDzbRnrjGDeufdyYpcGrcD0keTIvA1u5PifxoN0J684E0wlUpA2bdszZbHK4dL
         kpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750790878; x=1751395678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ4aYOtUH2D67botXZIPmEAuCddc1X0QVoLWqw3GU0o=;
        b=oMgX/ccz9I/9ku2rrUtPpr2uX14dy6Pm6yGeb1rMWdRrizOjUQa7mqyFAEJWE8H/Ec
         RcNYBIBRWzNSmUsgC9Sgz2woe0hFNdb+W29q+p/XJfvJ+wIuWhx4tbNGeEEcqHgBN6Ma
         R7XRnRAzQFDKohsyCjSxaS0LOvVOnhpO2YVTqi+Ybub3iJW4BP6c/9Nah1KwnfNE9Kky
         +PJZUwfA9pzMP8pSt6sRq+DnqQp2vR/GqryEo01boIIFx2LCIPbf+Yg2Q6tLzYBh3VHD
         1Cf0kFk3DiTbHcDlDmnd2r5wINGRFoJRFiW8rhOjxFhTbWMJ4ZdRSyw1le/cXKfmHHMO
         HPEA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0zSdGM+TxMWAYl4P7NZQCHhsX/+Y8GeVlEtBtpPRs5aHmfyQKu1fxcakK/SO3qw1PFVZk6nDCQbd@vger.kernel.org
X-Gm-Message-State: AOJu0YyXx1C1mq777qGhNP9Mkf92zspH4PCrw4GfyAqXiqTK3hv4eXnV
	undrGPIu1WsAyqLe6rhp1WLpG+AWawErvIXgXy3Yxi1GOXce51F44wzQRPOffLmDt9VxruCQVYp
	9zHTz
X-Gm-Gg: ASbGncsV3zbk8z6OQeKrDRC5oN0Tx2MKCi25PJ27t45HeamHqeSLws9HB+QRn3d4BQB
	ke9fGyx9+SEtZP8oKJXJfKtPFCh310/MAGgLQkz/ySXfW7efxavkIDArKrhoxw6aZSBuwNFUVTl
	P7AP2vcSsR+IMSNqdK2p1lgS+o2t57CArZ/UOAjr9M4fKvEZRlatC5lEEjrVrDZaCJ+5ju9lVZn
	gbe2niuc0EK+UGNOhvwloDW5TQri1fGrS1vV9PRkgin6spA4UED34HKG8GcPuhHYHFYadiyJxlK
	aXUsO+6vKPGIq/07kcTN0Th414aiXvM0mSkQgUHq977MfpHzOvATB909Kyz5tZrnG5KRY/rB
X-Google-Smtp-Source: AGHT+IGiNY2UE/DVqUZK41BbE2ZhZRACPdbBezmjb1wgmyqrkO2QOdl2aBb163iWHVwOIyBSpgPhaA==
X-Received: by 2002:a2e:a7c1:0:b0:32b:43a3:68a1 with SMTP id 38308e7fff4ca-32b98cb3b7dmr52071881fa.0.1750790878230;
        Tue, 24 Jun 2025 11:47:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dbd22sm17466651fa.90.2025.06.24.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:47:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:47:57 +0200
Subject: [PATCH] pinctrl: amlogic: Staticize some local structs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-amlogic-a4-fix-v1-1-03f0856d10cb@linaro.org>
X-B4-Tracking: v=1; b=H4sIANzyWmgC/x2MQQqAIBAAvyJ7bsHUlPpKdDDbaqEyFCKI/p50n
 IGZBzIlpgydeCDRxZnjUaCuBITVHwshT4VBSdVIqwz6fYsLB/QGZ76xdaNxWlpnlYYSnYmK/of
 98L4fhtx7lWAAAAA=
X-Change-ID: 20250624-amlogic-a4-fix-97b473067623
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Sparse complains:

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:126:24: sparse: sparse:
   symbol 'multi_mux_s7' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:135:28: sparse: sparse:
   symbol 's7_priv_data' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:140:24: sparse: sparse:
   symbol 'multi_mux_s6' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:154:28: sparse: sparse:
   symbol 's6_priv_data' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506122145.wWAtKBoy-lkp@intel.com/
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Fixes: 1f8e5dfddaa7 ("pinctrl: meson: support amlogic S6/S7/S7D SoC")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 2541c864086d6a5a81737810dc3a65eb15fb31d8..c8958222df8c736a79155456594e358d3afbfc31 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -123,7 +123,7 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
-const struct multi_mux multi_mux_s7[] = {
+static const struct multi_mux multi_mux_s7[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
@@ -132,12 +132,12 @@ const struct multi_mux multi_mux_s7[] = {
 	},
 };
 
-const struct aml_pctl_data s7_priv_data = {
+static const struct aml_pctl_data s7_priv_data = {
 	.number = ARRAY_SIZE(multi_mux_s7),
 	.p_mux = multi_mux_s7,
 };
 
-const struct multi_mux multi_mux_s6[] = {
+static const struct multi_mux multi_mux_s6[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
@@ -151,7 +151,7 @@ const struct multi_mux multi_mux_s6[] = {
 	},
 };
 
-const struct aml_pctl_data s6_priv_data = {
+static const struct aml_pctl_data s6_priv_data = {
 	.number = ARRAY_SIZE(multi_mux_s6),
 	.p_mux = multi_mux_s6,
 };

---
base-commit: 62be3d6e481122f02364993fee8322a681072918
change-id: 20250624-amlogic-a4-fix-97b473067623

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


