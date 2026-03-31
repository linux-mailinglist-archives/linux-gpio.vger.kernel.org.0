Return-Path: <linux-gpio+bounces-34509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGDNAjsqzGkmQgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:10:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59217371066
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC57D3093E1F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E0C3CEB88;
	Tue, 31 Mar 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/8XDrzE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E3C3CE4BB
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987595; cv=none; b=hhLnDy4Zk4pMNJp1+jANDpxBbMTz4ONcam/IqVXgYi0F6HdTxULVvgDOQ4BqFnFYgAIGZHggQxnYCcfbUIXQEcmVYyXwaiKfWECaBjF/MpHrgg2hElBBAsT8phWxJ3M6HVCcXo/WheumoK4cXxB+6yQGs+m4cvDWuTlqoIfA3wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987595; c=relaxed/simple;
	bh=Jsw2LZX+24ad49I5ppoLXlXypBhq0fgDlxTOnH7YRDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fy9PIj7V6avfwY2NNl+wBhb+pClEikJ6b5lDe/7UDPjY1VufzQe9GD4ovH0llJ4Xq5IsQy+NXaeINfQ/x/WmzbSBCOfSkSmbMZZPRqHWmRF2IyeAF3xyh4XBin/nmUJNILER9/S/cEPN7TR5YASYIJZ5rVgBkGHgpLY72jWNRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/8XDrzE; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d0288d24f6so49201785a.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987591; x=1775592391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=H/8XDrzEjnkTZX0j3TkbF4zrSP79umb61uRp3hLK8f52G+O2gqx1/LJ4UTDWL5Rech
         Jgz171iUsGK4cojfYMHtJugESICe5/wAdUNwz7NsV6SOjyOdOjtR4JCxLAo87robJu6D
         7qR2JcUeAVvPCrwM3kvuPWmPwlT9ebMP6EVrmGF04DhMSvJLD5THRc1+7q9tvd07O5b7
         nh8zim3mugahkJEV1nn6eVs3cBw4zQle3LYlZeIbkP5/Ptpc9arHOdGLlWaCN7OKUoEk
         I0xn/8D0ATlr4sZnifHluJdq0/MPJvUQVgKqw680VXxKBgyJogGuUQGqPWkggJGGlLUH
         Vg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987591; x=1775592391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=XqAuzwWnHI9wpaGRD4HncNXcZM5M/8Spn6fwxxSPVQ8JcxGHenBRypCP5NyTOAcAww
         fSqraf73aZTmMEeDjOhU8mzZWZWF4p3Ny6YGkAXsiOCuqSeJY4t8BLy35tFT4ZU5gW1w
         /86VwTWeI8mGoRV6VVbkYhDOI19Oby+gt1CJM3T0FVj1jPjTPXci6tla0bT8Ftk9FZ02
         rNoWgGNtnMSSCu8n9ZJkIiFLnZwQdzcqqg8YER4zO5xoZMC60qAEY4jh4bCUzQnekLPg
         VqZznws9rHATf0v+bEmsHZ46jeYkAhSd6D7zkSiUCaADjozwIBneB2YhVDEaNZpCAiK2
         j/kg==
X-Forwarded-Encrypted: i=1; AJvYcCUnck8L8b2mT8g7cXA7rIB/4rQv2tc4K7cV2d0FoCimBcOoML6/cwYVYnuWDzz19Fb8bTqvR5QxywEa@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLltK5KSyEXlQmtExQP2Y84m46GB+jFU1NTcEck7hJCs1sAXT
	9APmDI/DK7x0xIc8pIloNbSSKv4pVto8WG8HFdRzA9ljK1tNqnq+YS1l
X-Gm-Gg: ATEYQzyNnxL0q9Kfy+B/hcUXc3Gup5HPVYhbICgEHZDj7XUXLaSbfo51M/k1CkbuJMu
	mAug4bQlyZeiAbnfATzdwxtsTabS1P8vlq2CPM81kNtaNMuq1STm7mICDjuGkPh2V5NCT+/q106
	bL5SfYjijdsjoHgyKMXZ0yOQ6cZ+M85C0lTQ9hDwxJ1S0KvGYvds+IwxsXk+sJqZu8xF7uY04Pr
	mrckWEaIQ9EuXt0cnt3Eqx56s2p5R23d3Z7DNiVqL70dGgfJQcC92M13r6KRn0L7zJQCug2BaaG
	XWXLlwI09rKJv/GbppYylSg7EQ24btM3KEQ3x26B29lL2mIYW+4KE7ByK6gVyeZCVmh9ChwOLoA
	7modODV2AerVrD3mCHghlML32Z3VNTbZddLVUGA25SVvVQNBo3QVhIDecprhu4xkHDzTtE4r3fz
	SNNbw9CNIq8dAY3GkAQijsGxsid0dHwnP0vlw=
X-Received: by 2002:a05:620a:28ca:b0:8cf:dbf0:502b with SMTP id af79cd13be357-8d1b642e06emr97471985a.31.1774987591205;
        Tue, 31 Mar 2026 13:06:31 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d0280428d1sm961054385a.25.2026.03.31.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:30 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Tue, 31 Mar 2026 16:06:58 -0400
Message-ID: <20260331200658.1306-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34509-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[62b40000:email,qualcomm.com:email,17d78800:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.12:email]
X-Rspamd-Queue-Id: 59217371066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Also add reserved GPIOs for the Pixel 3a, which blocks access to the
sensor GPIOs.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 73 +++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..b4854801a5f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -522,6 +522,11 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	/* sensor gpios are protected */
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5b41f8bac7bc..2d5728c75a93 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0


