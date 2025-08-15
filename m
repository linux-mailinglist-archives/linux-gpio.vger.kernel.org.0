Return-Path: <linux-gpio+bounces-24423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F027AB27CBC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D731D20197
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350F92C1580;
	Fri, 15 Aug 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WwtJK5uG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098472D1900
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248970; cv=none; b=ZJ1+tL6vJh8Ms6MsnOhEwul4FdVqqDWwYkFkDnAQ9MFBpoGw4FiSOHDATV2N9ULvK9dMtPRmvkAsFVz0OYSwTtBByEvMVPsPd14kvFsp40WEwRlE9fAwdt1tYGoS5AWPoZK2QIOGfK9xPwc9YlSCCsYERykKbbb5TGg3UVDL7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248970; c=relaxed/simple;
	bh=CSmJ0hfP8RAK5IyMLaW7Q3B8iAjyvA/90HhyhsBSBCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZmDgMZ6b3CmRscGJyVldQoSPMbyX9EHGhR2vHwVJU9CIjZ6OF79spqGmQQNXy6Scj2ZRJxUAlvgKvWk16N+r8u8Mezj9+fYoqcQUpeUuWURa9IfTb5AFgV8zL+HjbzUzER3bp34lsu+sk/2+SjxKTvPlaSSc+D+EUHSGS+pSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WwtJK5uG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so1266084f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248965; x=1755853765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=WwtJK5uG0kG1i6jcsGCEZ5nDEQKc0RTOSoheaMvknQq+acd62NCw4WYO9NGR2DNE8D
         KBv5wVD4EpylrZVR+cK8DHrRZa6CeRUpP+AMD9swwTlRBpzqimxjZVym+3x0w8h9cOkX
         EqTY4MW71YwbdfKngtIesqcJAqcK2z3BVNyUxOgPgsdc0HmX2jLJMQyKGNYC1G0TwMX0
         9DpV5qpqyyI3ziI4kXQUqopAib7e+Q87jzgMrSKei8xWHluLfo6aobu68E3KcYUbN6+p
         KJO2U+YnVagaoWzMjy+BjAZESW+s2/TkT3zZVFycRnaxQVRvzKYhn3f66olDscEOjNEI
         uTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248965; x=1755853765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=Y6V4532uXcGnqZdZh1PKt1i0umprr2did0IK0zokAhGkiFDEb/uAuxfsW9pZHaH9Uz
         34O+zyDGwt3y2ivcPsa0fxa/SwFmJ3qN93PDE6NU5KYxHPRkW8z4lP+DAUIk4644o7Ef
         +fJ+paMC5E7ZlqhSDlYLD7Pd4ZxB/SpZHAz49xjMLo5wpChxqnZlPjHskKbpcbCeIHhH
         CDyKMVBJeICpGXhkUvhkw8YEH41wFJA8WlVrrjmzqY+auBmSNvQ/umSJTLfwtVIg5jB7
         PfcSDcM2Wt3EuWEzyEmXvmmSHg4WJIZix1rsuStuxP3bAR7j2XCD58gJ4f6AaP7pkSwD
         29ow==
X-Gm-Message-State: AOJu0Yw2Q5cfHLogkS9dzsKH0b7Jp/m5G0lbI/BibBP9ilm4fI53NSXe
	N5QAOugaiJ+Pn6cwlXB9zWKinyex2pbIYeGZFWqSUJHZ1IfgDGLW4Tkwfg6RXfL/VRM=
X-Gm-Gg: ASbGncsjsVFXhqHn8AnBlt6RRCunYdajrJ2o3m2uPn4kScHOYgxdhrj1S9p3+HoCCci
	Ru1KwfrJTEfahqvM3mzq0cja7un7ViT5GVr98RbyVF1NFYj9PIk/7ADcXLlQB0+xD76lFrcZ0Y6
	rD0o9UrXPIis22wd9I4jWxx81ckO4xNYu3q5d3VKoWMfWW3tq0aFsWNZQQwam2EgLPS5fuEaDxI
	wD9s8z2uAx+wRp+IBBDFWGWtSeRc2ozSFmvJvh+5DdVOFWcTcKvYxnh0G9o1KoxEUd0R8tF6qff
	z//bsYBPkuRt/ryfGJdpNxnaJ6FdoS/xwSfpL+Jv1D0R4OJKBdMzSU9oiGYUWK4xuZXz6cnKnrg
	syaHGOEAME3yyqiTI0g==
X-Google-Smtp-Source: AGHT+IH+JR178EPgAqIUUl1evmTTr1x2K4MvNmipyWtFLoqUSeH9zZZUWgL1QLgHWs1/dDUsekziEw==
X-Received: by 2002:a05:6000:4383:b0:3b8:dabe:bd8b with SMTP id ffacd0b85a97d-3bb68a185bdmr1038820f8f.27.1755248964740;
        Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:07 +0200
Subject: [PATCH v5 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-5-955de9fd91db@linaro.org>
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
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7850;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9BKGEvZq/gbYunbAXK1ZCTf6DpFoadfRkbzoE0vKzXo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3Pz4bZWLjCq9OyRjq8qSpMxa5kXSom7+Nn
 9lVVbxSSICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 cgEEEADAOXrKLcmzOeYsONGvgBthO2HBAzQ+lHZSBTn2F4QfTiqTjYSCWNaboTo5PtgNThVrvQh
 q03BXKYFwL/7IMjsYlfsEvqd1EOZoAIZ4Jl4C+aPyR+gR+R6PiEP11HwNQqR1YYfYeebhhwZFnV
 PGUV3D1w79KrlhgzsufjmSW+c+YQ5WJZDMLqeF2ZEIexXPNTd4PX1GEQ/BItpda3fLlt9jdHGIn
 w/jhWZRzo0GJ7s96NhRyV935oS+cUacE8lQc4dU+mr3QHDktqexVN8WK9jUWelV84TnQ+urZSSU
 /G3E3j4GoUHaVtTJ/PdG2S+zWzrkeG++Qb/2lj7zaGKCEB9cftBmPP0atTegNaETtXqvMOvMkuo
 6SyVCsGKxrPp6ee1wWtdEE7ferKv3Dn+lsozfP6rY0I66SoAdKGwsTNH4lFNo7FbZW/eal1TAE4
 U1YWk3ZKnzLVI9f9dr4gebddux/zek7590VjrED7EbsHk08bxR5uKGYwzqpP7UcnMM4oTCpaD/+
 +woGV9bb+PXmDDOzculdAJhPzGNlUSmRO9yqDjCbL3dcWPPjEO6TdXmZWI/0vg8dZ7OBAzI+1Ej
 9QoidEbK+PWSuHQ1Oqt+9XFZODd2wRU2JiJ+s/PxtwTBjJdnr+XNmcem/7B6LbT5baypfHI3KPX
 MeYcfhyRNgbpsow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 6 ++----
 drivers/pinctrl/mediatek/pinctrl-moore.h         | 7 ++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 9 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 6e4f6c07a509326a8a7e88b2dc32635b22e7b965..982b9887521d036538f67e9919de444693c458c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -622,11 +622,9 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 	int i, err;
 
 	for (i = 0; i < hw->soc->nfuncs ; i++) {
-		const struct function_desc *function = hw->soc->funcs + i;
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = hw->soc->funcs + i;
 
-		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func, NULL);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 229d19561e229c77714e5fccb3d4fb68eacc77fd..fe1f087cacd0446e40628cb4fa35a135496ca848 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -43,11 +43,8 @@
 		.data = id##_funcs,							\
 	}
 
-#define PINCTRL_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define PINCTRL_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 2dc1019910662a2a52e81f277a10a32bd83b33d4..d5777889448aab86e82fa6821fdea0d30a5a7246 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -822,7 +822,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 					    "uart4_2_rts_cts",};
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
-static const struct function_desc mt7622_functions[] = {
+static const struct pinfunction mt7622_functions[] = {
 	PINCTRL_PIN_FUNCTION("antsel", mt7622_antsel),
 	PINCTRL_PIN_FUNCTION("emmc", mt7622_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7622_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 3e59eada2825277b3d7500cb1f2cf740242a4a8b..69c06c2c0e21e4ce785f65539254eb070bff9a0d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1340,7 +1340,7 @@ static const char *mt7623_uart_groups[] = { "uart0_0_txd_rxd",
 					    "uart3_rts_cts", };
 static const char *mt7623_wdt_groups[] = { "watchdog_0", "watchdog_1", };
 
-static const struct function_desc mt7623_functions[] = {
+static const struct pinfunction mt7623_functions[] = {
 	PINCTRL_PIN_FUNCTION("audck", mt7623_aud_clk),
 	PINCTRL_PIN_FUNCTION("disp", mt7623_disp_pwm),
 	PINCTRL_PIN_FUNCTION("eth", mt7623_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 98142e8c98011d17339da74f61d6f917372dfcd5..cc0694881ac9dc536db0e46eefe5eb7359735a60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -384,7 +384,7 @@ static const char *mt7629_wdt_groups[] = { "watchdog", };
 static const char *mt7629_wifi_groups[] = { "wf0_5g", "wf0_2g", };
 static const char *mt7629_flash_groups[] = { "snfi", "spi_nor" };
 
-static const struct function_desc mt7629_functions[] = {
+static const struct pinfunction mt7629_functions[] = {
 	PINCTRL_PIN_FUNCTION("eth", mt7629_ethernet),
 	PINCTRL_PIN_FUNCTION("i2c", mt7629_i2c),
 	PINCTRL_PIN_FUNCTION("led", mt7629_led),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 83092be5b614cc164590fe5ec2b756fe6579b263..6216c2e057f6499b32741b6bd3a4854878c061c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -977,7 +977,7 @@ static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdi
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
 
-static const struct function_desc mt7981_functions[] = {
+static const struct pinfunction mt7981_functions[] = {
 	PINCTRL_PIN_FUNCTION("wa_aice", mt7981_wa_aice),
 	PINCTRL_PIN_FUNCTION("dfd", mt7981_dfd),
 	PINCTRL_PIN_FUNCTION("jtag", mt7981_jtag),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5816b5fdb7ca918486f57a890f73543b3198c728..2a762ade9c35505505c932b6fea75fa0cf77d961 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -878,7 +878,7 @@ static const char *mt7986_uart_groups[] = {
 static const char *mt7986_wdt_groups[] = { "watchdog", };
 static const char *mt7986_wf_groups[] = { "wf_2g", "wf_5g", "wf_dbdc", };
 
-static const struct function_desc mt7986_functions[] = {
+static const struct pinfunction mt7986_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7986_audio),
 	PINCTRL_PIN_FUNCTION("emmc", mt7986_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7986_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 55c8674d8d66f12d2f2246c215056d4e51296a9b..9569e8c0cec15fb6a4a8e359d6483fa163487b0c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1464,7 +1464,7 @@ static const char * const mt7988_usb_groups[] = {
 	"drv_vbus_p1",
 };
 
-static const struct function_desc mt7988_functions[] = {
+static const struct pinfunction mt7988_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
 	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
 	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 36d2898037dd041ebc7e06526ebc085eb42f2828..fa7c0ed49346486ba32ec615aa2b3483217f5077 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -238,7 +238,7 @@ struct mtk_pin_soc {
 	unsigned int			npins;
 	const struct group_desc		*grps;
 	unsigned int			ngrps;
-	const struct function_desc	*funcs;
+	const struct pinfunction	*funcs;
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;

-- 
2.48.1


