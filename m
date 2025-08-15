Return-Path: <linux-gpio+bounces-24431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF7B27CB0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 489716230A7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBEC27144A;
	Fri, 15 Aug 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="srnib/1B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6AD2620FC
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248988; cv=none; b=R6DuM+pdQbhX6rji6Ak4aCtAG2w/SzMyWoQ6oD22M+fykISj1vFtQOGu4YBaMp/ImMoZ9oKCuYK+ZRw1Yn6egZDcHEbaF9SkE6oVSKXJPU8x3vb2nx1qmV5UkRFvWSvNU+rWt3Hvgq3mCBbwRxlUkCRYUGaNc59YjBHH7qqKslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248988; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guSICP3XuWqwq7iEzhPHWGwW5zh4YHj1h5huaVVul88TZAEhy4HbhD98kI44FxX8wDioMABbiJ/ucHeNsRm0hdqLzC4jEHIstMrvPMmYH43rvjTa7gjJGc8O4Z5GDee/3yq9rguooCTaP9ErP9uspYvhwd+TOmWGZiWCeXJZh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=srnib/1B; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so1199945f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248978; x=1755853778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=srnib/1BvaF0uy9WI33yxEDKIJJFMWHr9tgtrIPbDT1vBDXkcc9M58SZUb26xkCrWG
         RGLa8Kztd6pywSqq93ZPZYCfpPHBAkdm0EbZm4Pj1esgHm7AnRSaaqS4ItkgjVvFGPA1
         al8sAec0qOOzIyuI2ppGIMISxLpx1WEuWa8MgbtWTMn0Gv+Mcf6hAUNkw3nPu29Cit8r
         DaYSwtgb6rEvH3DGsb97F2Z4EVhyoIXnhBfwA14kuXSofxVzrkn/USVEyl0KyqVOC3ay
         4PKjgh1/QK2lokqU4yPBo7GOASab3yLvwliAyosVH9nBX1GZ97O0rvdP2ayGNb6aHI+H
         dMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248978; x=1755853778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=iJZI9Zlmft50LGK/fGB7ohJgSQlhJ+Rqwt/IcImDlqpnxgKybn4znbKHncHW07EFFp
         GWiHVH4Wg9SjvugG76Qr6sgBGeQWXZNnu+f58MyeO0OVdM+WaUcAge2JSh5FA0RjQyTy
         cQ7SYoQmyevZaZS3sxRgY/YD38PDViq9y2doENaEYA6mwH1yEISXOrjWWMuINYEIVxIs
         kE0ig/1u66POYRpG8hGeD22b0yg3fctuMnGVnrs0Dv9/lCELChk2XSYQ9PILRuRnGSMz
         tFYxRbnPliChgut0lP/asMZ15uvOJWnC/Brk03gbzKKuFAJcCMOYFZK2vr0i2pzuNDcZ
         IDsg==
X-Gm-Message-State: AOJu0YwDd5YandBpGvD6R91k87fR5T+owg4voVjGE/irpptMXezVXP2v
	312LtAEC9Yyls/WV1El7ynlhkxpW6BO438KQwpGd8qIWYXS3Nzuh76PMqg/W5sqw8Is=
X-Gm-Gg: ASbGncuwakbOeZ9iKOPZ18FyjVz2iaZyqGFCh9z9reDiTk6b44f2kXv+ZtUksIX4S1u
	ua27u+nnpPCudnI22xF6Wp3bb0FaNZcMZ/VuqAUlbFUIC+xCN/pgiJApORTbhhhhv4syIAtQDi3
	80ovgNOdFE111uFeHvKK7MqA/5LwX64iYT7kbI/DzFy7Ubql8ROtXh3Yc8n68I7CEAALVBiFM+2
	r7MhW5vOoS9IuyNviP8GD6rqAyqTisIeQinlSSgo7+JfpVms2VcSmrdoA4GFgQvPW4Dba1+QeRN
	8T4nOkyTT70ANDLOHobn0Eh2TiJUatClwS4HWndYObJkTowd0Mt+V6+AnkxWMPJegPw93FmX8CL
	Phrf3OGgK6IhU3fkV2w==
X-Google-Smtp-Source: AGHT+IG6tpzUVovgoQkKFLGI9UZEr33h0FppCamYKXGjED9LEMcOygc6BNR53lxBsyNw3EXRvTetsA==
X-Received: by 2002:a05:6000:4007:b0:3b7:8071:f902 with SMTP id ffacd0b85a97d-3bb4c5b80bcmr1159773f8f.13.1755248978027;
        Fri, 15 Aug 2025 02:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:15 +0200
Subject: [PATCH v5 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-13-955de9fd91db@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5msNNj4Ca68fb7+G6bZ73KBx3fzutVpC0Z
 9VENfY/MhyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 cqCREAC7WpcFRL2Sb/Hk+HNXVI+dbXjLvxVLapxOlsBcpesaDrR/NahYb6p/G62D/kWHKA2KVii
 lU/tMlPBnJHukaRydH6794HwaY5/+/S9wFa5rDdnOyj2dBp6a9S3jbED/+o43IIUf+rOrPuqibD
 NVr66kEWQYaOLX/t81nHetyX+Dd+P/d++xBXan8oWhwtXd9zHLda05S+jw/RrBxcx3fSK6UTtD7
 dNW9MUo9bAY1tlkU51qsjDfW+eRq5dAzdNdeURgAreCH162KFT+bIIAZQtswc6RS1AsC5M1kj6o
 S9cX5AF5K0XMaIorq5coITsfpWq/OxWi4L4P1TMTB6ctqiL01wOF/z3BSefdpr0MjAr5GsnAf/y
 LqKsz5hniCLTvZjgU1Ayvwq8usXkT8xaUY2zb9GfGdgGgmBRJSoleQR4XHmpHYNi5542R1lj46O
 y4qPwttgalxFYhy/FBpTsvlflTrGhicrlq+7hSDpjlvSXR6CYWn1w7gkVRb1cuHFR+Xj0BNYXvG
 A4i7Og4mKksF2x88F+5NOrW5SRklexTs4SBPGNo8Rz5cp+tYslwZmceoum3xCfLAbf0CVyMRym/
 +eQd0GP5pUkNj2Jtjub8fvLlUFd542dMVBls5yK0Vw2zFC/nKbLCz36IRltDZCXJlsYgs5j0tVX
 dAwrcGCy/BjpcWA==
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


