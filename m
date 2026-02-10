Return-Path: <linux-gpio+bounces-31540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FlBIayTimlzMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011D111629F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 027DC302B81B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9CB2D0C9A;
	Tue, 10 Feb 2026 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi/FiaAd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905332C21FE
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 02:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689449; cv=none; b=cbXFTE+4BnSL83DytwucPC/O8AXQ1WPonbuZ3DqPzIB8yPbgSLGXZzaa6Shx+vlFDKtuFPxnsmBYShPUFK25ZGg8JrCDgbpnX/NdNwJxU+Bhkn+mtkgtiDPBIJfnuU7YukoRMS0Ef4WdfxlMm5nX5RXskT3cONLxB29I0KW7MxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689449; c=relaxed/simple;
	bh=kObBLPV24++jKWnv5OZd3hqNI1rL0oiKn0/YgAzJU68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXShq/fR1Sk5EbhuXNZs7eGRbdKrE/3zimvxYFnjnB1Nz4kyy62MMsO52kBdHDC0DXlge1mF27PgkgDuIQOa8XxAp1U6vcc1A2mAz32yGQfGLs5WQbf61ppoQqOW9jv3M+Cep1cI69CXQ5WcShr738oMdRnEAc1SDcJd39sBBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi/FiaAd; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5029af2b4bcso1517161cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 18:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689447; x=1771294247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwpa7Jk7HISW3Pm7AtrKojQr13lgSrqB+ZHX4kldeI4=;
        b=bi/FiaAdyWA6cTSTyW1OOpbkxp1UiCTaIZ0aB3dX9lELXBfxoCO6koeq/d46ZXh55K
         Ki2VE2UAZsIT/cd0Tg0sUeLFbfaY7CRvqRomlCxIE0U6eLLubwuOrvaaOHPbUAjc64/f
         T36swavcpdQZpF6UmquFRWlC6mCLG8e1VGDh0MviZcfWYtsR04k1dwvn+b8Sw1NNMUbk
         Nwpt3WczxVzwZ/Hd+MHv4Shbvsr54mkysL2Duz+VD7Amt6JRZUFjRClVbvPI3CDRqVm+
         BTf6j/3d+1FDsifqsjPsJJmR1LzmEz34U2RJqgCbmAat3WHmhVfYsY7gA3wsyBomqZwj
         F9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689447; x=1771294247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bwpa7Jk7HISW3Pm7AtrKojQr13lgSrqB+ZHX4kldeI4=;
        b=jIebGggA6zW6BIIhHACLwWfR6FM+74Ys/SizNRRyRY5l4WbjwYRegKrwvyaSDpSl4n
         PKUOgf+xNAWGVPIEbj5CcMAb+A22KDTgy6MFICuwv+W6pEJIx0gat/3J+Y0e6ysxBbZQ
         qNDet4I1KRVjaVaPjVx44IUr1viqJ418d/OhIUziXIFD0BAEoPh1TjIg2geoWAD5kJnK
         zNqDB9BLe3xO5TNZXLDearzMcSOYBog2uMt+V38CeKA6eDYz8toMGZ3s5fID8CXg+gbg
         TQMWgxbFaZO8XEy5xtFq8N/ALXjgIFjpJPNUrBvsIv+dGwnTlWJo/IghagnJQGSKo7m0
         ObPg==
X-Forwarded-Encrypted: i=1; AJvYcCW0zcDZz9fGnMsrxlf75NVQPPZ12NAvhLtHd1u+GErbO43xZ9IknN54EHSjWrnHCbVdUe4hZVAGv0KX@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiVsiqin0XI7g2276EKzKAsR6LznsviY0lrG0+11/yM8GfUDf
	l8QKMWl2UBWO3RktaNPelb31/XhDdaJhWifUHTueUKZK2HcVlQYj0Lbu
X-Gm-Gg: AZuq6aJga/d7w3ePO/BMd6fT+spGRX/H7lG0S8RxrHKpwMk3r93sQRt4Ok1VQIglZ1B
	V6K5qRvOGchyD86IX51/y3NrJcGOYsW+oF3IylS0u2reTChMh19MfBuVRBNUpII0fzCGwFuFerD
	Ui/mF+oL/7Wfsct1MfimGXK5fEuU6CfaO3e4u8wwXtb/zpU5OkQjNvteZF8eokor8MaoPzl99ei
	U6LL5nzyztVvZS1i6W5Svqr1W4KpfSjXI1ZQqiF0livmUg4u2pfYugCjLepWf6Qg6BOb9Nqkz70
	xXdyvagz45biEbVfzrOmzLl3+D4cVkywbF9MeZCKekvZR5xMGzgeo8JfEy9VRkRN5TKJZAxFKTR
	ulH3NoXYTBRqCa5HNPq2v4HrcTVsQP1c6l5Om3QB9W96sehCWNw7gBFCc2Z57fMNboh8KIHDVAl
	6+qSG74ysO6KkcjcQrdxEO7WfbVg==
X-Received: by 2002:a05:622a:514:b0:503:2e6f:7690 with SMTP id d75a77b69052e-506399b1bb2mr170444201cf.38.1770689447506;
        Mon, 09 Feb 2026 18:10:47 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063d5b807dsm83285211cf.20.2026.02.09.18.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:10:47 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] pinctrl: qcom: add sdm670 lpi tlmm
Date: Mon,  9 Feb 2026 21:11:08 -0500
Message-ID: <20260210021109.11906-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021109.11906-1-mailingradian@gmail.com>
References: <20260210021109.11906-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31540-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 011D111629F
X-Rspamd-Action: no action

The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
pins related to audio. Add the driver for this.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 174 ++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index c480e8b78503..a88f1db96841 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -88,6 +88,16 @@ config PINCTRL_SM4250_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM4250 platform.
 
+config PINCTRL_SDM670_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SDM670 LPASS LPI pin controller driver"
+	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SDM670 platform.
+
 config PINCTRL_SM6115_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM6115 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 748b17a77b2c..a0520e1f8aa0 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_SC8280XP)	+= pinctrl-sc8280xp.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM660_LPASS_LPI) += pinctrl-sdm660-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM670) += pinctrl-sdm670.o
+obj-$(CONFIG_PINCTRL_SDM670_LPASS_LPI) += pinctrl-sdm670-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
new file mode 100644
index 000000000000..604a445d4ec5
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2026, Richard Acayan. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_sec_tdm,
+	LPI_MUX_sec_tdm_din,
+	LPI_MUX_sec_tdm_dout,
+
+	LPI_MUX_comp_rx,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_lpi_cdc_rst,
+	LPI_MUX_mclk0,
+	LPI_MUX_pdm_clk,
+	LPI_MUX_pdm_rx,
+	LPI_MUX_pdm_sync,
+	LPI_MUX_pdm_tx,
+
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sdm670_lpi_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+};
+
+static const char * const sec_tdm_groups[] = { "gpio8", "gpio9" };
+static const char * const sec_tdm_din_groups[] = { "gpio10" };
+static const char * const sec_tdm_dout_groups[] = { "gpio11" };
+
+static const char * const comp_rx_groups[] = { "gpio22", "gpio24" };
+static const char * const dmic1_clk_groups[] = { "gpio26" };
+static const char * const dmic1_data_groups[] = { "gpio27" };
+static const char * const dmic2_clk_groups[] = { "gpio28" };
+static const char * const dmic2_data_groups[] = { "gpio29" };
+static const char * const lpi_cdc_rst_groups[] = { "gpio29" };
+static const char * const mclk0_groups[] = { "gpio19" };
+static const char * const pdm_clk_groups[] = { "gpio18" };
+static const char * const pdm_rx_groups[] = { "gpio21", "gpio23", "gpio25" };
+static const char * const pdm_sync_groups[] = { "gpio19" };
+static const char * const pdm_tx_groups[] = { "gpio20" };
+
+const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
+	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
+
+	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, sec_tdm, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, sec_tdm, _),
+	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, sec_tdm_din),
+	LPI_PINGROUP(11, LPI_NO_SLEW, _, sec_tdm_dout, _, _),
+
+	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, pdm_clk, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, mclk0, _, pdm_sync, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, _, pdm_tx, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, _, pdm_rx, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, _, comp_rx, _, _),
+	LPI_PINGROUP(23, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(24, LPI_NO_SLEW, comp_rx, _, _, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, _, _, _),
+	LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, _, _, _),
+	LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, _, _, _),
+	LPI_PINGROUP(29, LPI_NO_SLEW, dmic2_data, lpi_cdc_rst, _, _),
+
+	LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
+};
+
+const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
+	LPI_FUNCTION(sec_tdm),
+	LPI_FUNCTION(sec_tdm_din),
+	LPI_FUNCTION(sec_tdm_dout),
+
+	LPI_FUNCTION(comp_rx),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(lpi_cdc_rst),
+	LPI_FUNCTION(mclk0),
+	LPI_FUNCTION(pdm_tx),
+	LPI_FUNCTION(pdm_clk),
+	LPI_FUNCTION(pdm_rx),
+	LPI_FUNCTION(pdm_sync),
+};
+
+static const struct lpi_pinctrl_variant_data sdm670_lpi_pinctrl_data = {
+	.pins = sdm670_lpi_pinctrl_pins,
+	.npins = ARRAY_SIZE(sdm670_lpi_pinctrl_pins),
+	.groups = sdm670_lpi_pinctrl_groups,
+	.ngroups = ARRAY_SIZE(sdm670_lpi_pinctrl_groups),
+	.functions = sdm670_lpi_pinctrl_functions,
+	.nfunctions = ARRAY_SIZE(sdm670_lpi_pinctrl_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
+static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,sdm670-lpass-lpi-pinctrl",
+		.data = &sdm670_lpi_pinctrl_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
+
+static struct platform_driver sdm670_lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-sdm670-lpass-lpi-pinctrl",
+		.of_match_table = sdm670_lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+module_platform_driver(sdm670_lpi_pinctrl_driver);
+
+MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
+MODULE_DESCRIPTION("QTI SDM670 LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


