Return-Path: <linux-gpio+bounces-24245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0FB220FB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F02188DE75
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7422E7BDE;
	Tue, 12 Aug 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oeKCm8Bs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AC42E7BAE
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987254; cv=none; b=aRR2jC8kHV44AKt4BDdPgQqOb01Ht7SnvQpJJ1zH9rsFAKTpsOa1XxFejC1WMp+q3YervTZMWvItbDpG7kHv5ucJh0QUTxvQEx3F8Gg3+zq7rZlOmltj1G5HjhymUpah0LSwv5GvaYQ/WBJnGPpsMkyA9959GChddsCVqH+mnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987254; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZT3ugwm39+f042O2T/xJxqFl5JyGqJ7+knQZ5iLS/EChLLS5qHtSnjj5iiiUSGcClTPlm26bHc9m1xpF/QBCG5+8tjlOznCxv9W7y4w7wwwVluuz9xnsE6E4jC3WrABoVR/er5rd2IQ+U731Yehb0JlpL/vI38pB/7MXVsyoSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oeKCm8Bs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so3350883f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987250; x=1755592050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=oeKCm8BsdOQl4noenc9fnWUoAMXYBMRMyGzcnG/qcUpcOj3i7+9aR6xSrFPPKt0h0/
         /eiuWHqNjcMZz+czcoRMU+sHQsVEQ+niDFv3hCIgkmiNATLK+HITlmgb5X6ZDTxkklcr
         2YVKCMFmwnTN2eG5PJyx9NqQOOUJWL2P4IXYgiKYmoWHrqbBYeqPZY/svKcm7TxIHJFq
         kUg38mt7RQvBed5Nh43+2CTW+Ii2a+psZCBQmN1i1r/Adrq4SjEc5UoryXdt7erGS800
         vToDoGAoRhUCJ2EF7VJrYfKXdZ2GxcK3pHAmt6Clm89DGvfVi/4RpmZTYpRboLUHyCgD
         udXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987250; x=1755592050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=pI8fgAR9jYLHlOHMxx3pvIL7CmVWGRq/r7xRANU5C9RkoJNApxdqBr2UnHmf2d4WXR
         huM/+X2CWC4OWG3NUBwTa7BPzXroTXMuhBtgik4ebN9VeU/8ooT+X5BR//raZLfUDKAh
         hGiXvLoPCpuxdwWwaek8IczZASWNOB68yqGiryC5Zq7V8EyCFuNkw+3lOkZl7kR5k6Fe
         3miCrsbBuvmIhfD4uzotVw6FVOKIsFr8D/I9nbjvUk1Te/qWjC4SldVRDLlcPeU2z02R
         J4k7gGTXVOmBiWHPnf8bpTs3qHJsQW0m0hUGdy5bKgKp0OWHWvwPai187oVv5P53gn92
         vj2Q==
X-Gm-Message-State: AOJu0Yz3PaPSBBjR2910RXsmbYXcT+40+09uOOq9eqJv8VVlaU+yGFYr
	pA2XEPgqHLvQlJOp+x9b7+5W6mGZtSynA8QABpclBIEEKGBipFgoJvgY3gsA1WE0nOE=
X-Gm-Gg: ASbGnct1WWcncHoJY+lfXFK3JU0gR4R6adzixV68NLCo2PBBQosM8Db+Tz6O8m2X/1B
	ePGEQxUkAEk+o2W8LacAWAIOhH7ZAY0GRg31/YfHFcGnDzyjkA3+OnVka2T2wwGf9+eyunu2kv6
	DLJ/tv+awDE3GfaSKN8ySLLeYalyw2rQyBSl62y/Hvu5p323r6AyJv0B7kmcdc5xLu90AVLJxvi
	BXp8v36UEX93uWmGShcVZfJE3tK0D3J59gfmxaUAxYGCteMrzeyj5+TpMHKOZYohRN94hQNndvi
	+wXoAaEa0PYl1wai3I5XqSu/U2wZZyYldHn2vwOgBerAKnFQSO0VLgjxozVs2WJMHqQYKnscmKh
	H3oQHsJAxAZ+bpf8=
X-Google-Smtp-Source: AGHT+IFshlOvFK729Q2HiNSttBuhYGO5t1MHAK8R1Tl8WnDbe/OVg6KL0Aon7hXzH1skJVAbXFREsA==
X-Received: by 2002:a5d:64ce:0:b0:3b7:8473:31bd with SMTP id ffacd0b85a97d-3b910f9ab5emr2145237f8f.0.1754987250520;
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:12 +0200
Subject: [PATCH v4 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-13-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZ/VR1c42/G4TctgjID2K26TyPL0+Vrg6x4
 9ryMo61KYWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cvCLEACYvBW59+M3gJi5bBpvwd53LIDA7Fi09bh7cf6sZQwrhnc+q7Z7XDWdo3gOU7A4yZx8nrE
 lf5eZ6c3y4GemvfNQDbmd0gu0FBsb/49YwP4k87d87Cdt8fNQd/08Gh/u32vbVpO16l2Je9VuY8
 3WZS7KC5/KJQPKXbmxUpP5C2z8mULdzAb4PKQT3dZ3s7f2T+hMUUwinrZx5u1klaFQrlOXkNTTE
 ba1l7tJFuZ8cxCTDfvpt3YSkOLMkDNM5HWjtfxL/gfiQ11OM42MAVw/QrrA0hu0Ez37gjOlTBx8
 ZfQwmRq7Gx7f8H5yXUyG7PrHQL+qjkqv673/8cqJFGcqwAse7K8jlSiu5yAKyPafqYT3neO/k4u
 APj8e2LBEwVjTBl0IhJdS6/+3AlWncZFxd6E60ROpK0huq9Ds5Fv1bIjzPvmGW2GKpF9MFCbdd/
 LX+uj8t8HrERHsIxj8Mov/RLEFgf1ECdyKINeMXsW0lLsbYkkDL62TYt2+/nXHkr6BSKZ1JX3gQ
 HmqI5/Ni9xR1d9/yvtzD91OFmakZA9BucAoum0WdD/tWCaF24vSjO/wdUntMJqmkxYWMM4CY0ro
 B/bQkovAcHO+am85u11GmUCv0se9FwLnggtnVe9u5hXKsKp22bC+38tNUX6xqHYV+hSPyXCLYu8
 hN8vLrtlGpDakqA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


