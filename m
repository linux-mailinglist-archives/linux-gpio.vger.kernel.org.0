Return-Path: <linux-gpio+bounces-31541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDzDHLKTimlvMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A751162C3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F4D3026584
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1BB2D3EE5;
	Tue, 10 Feb 2026 02:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGsNGt4y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015942C2ABF
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689451; cv=none; b=PAoj6v0RQ3/hiAS75Vqz52A4MaX6Ufcyk03fBzpN9ak8NXvn48RahVq6uFQuEjbMKhVOH5vlidkiPNya5I20wEwm/54uDNsBGM829mf4w4VAnBPfJJIWLiseE7tLEdEckeaXMfd+twl1lM0RgyMGVU1vKDUqYXu5E4kVuk4oTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689451; c=relaxed/simple;
	bh=VLMiJ30Zh4FSBl/lJzi0hCV62oZODen57vCk75vfrQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHPJ5aMEw9TenRz/SkFwGUS7XJH1UIVb12has59d+vkJJaaSg2hyfanE/nihFhbh4lkWDA44EmK8eugwz3/x1/ZzTLVYPgOaM8dnEZEjEyM8u4XvLbMYcW5ui4C2vVDJU3+QX70oC3e7HBiOgUg6ASz/K+LnPy+3euyzh4ILHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGsNGt4y; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6a822068eso474514485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 18:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689449; x=1771294249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc2eBmVrRFfTIHMv2W/jMPK1Ew70fk81SksbXNihTds=;
        b=QGsNGt4yn1DDNlGXzdIDU8ltBTFs4SB1nHxyH/X5+XGdXZUcQlU8l+j+RfUqbVgVx9
         Gcn+fH13TuSRxzEiXUL0/GWTc/pBZfg4L/UFl5O6i2/8fDDgmqAnN2iXGIUwLlLUwaDU
         Lt15vKPqF/JTbkTRK+xf6aRoigs06q2e4lcLEZkb1vdYpO/mUlSpz1pmOW4vQUmdwNak
         2QwXqPReZ1ZNgQIqk22cZ1hZXsrzsA8vYMhEqi/tOXXTp2cWMaUM6UwVL6U1L31anuS5
         ofUG6AdeXthe0xoXhyQqK/cLJJBJ4s3xoI31Q+3CjcuZT7D7wY/dX6ksp+nBvIc4z1h1
         YJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689449; x=1771294249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bc2eBmVrRFfTIHMv2W/jMPK1Ew70fk81SksbXNihTds=;
        b=qeOeeM18I2GnC+gj+NAHWuj5Rnna5XpH5p2eIKormH/2VqRXrBzwq4PV6Gg9/ENY3f
         6hiivN35VDS9xL6OWwIkePt50GpEhKrfdsbPjBWVhttzck7lYkgbBY4L6jSItv7SLV5Y
         5semPSNAn7e8MGU4T6Rv+RGTGvHVecZ1iEYVTW8u+M29K6XIMblBEjMQyNC/1FnHBIrC
         b1mi2dBem3cVGgdAxsL34xfGRoIkM/pTbm187hhV0h1pbplujPYnRV8s4iVx3umAIsXJ
         I/2nD4qeoJk8vRBPvK8jHQJfm6/j8AkbR1HgZFOmlu/XyObkCWqRXUKEv5KqUJOKJBsx
         1pNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBkVMV0ZT3btkGUoow3qqKug/A6cLN8irR38zYcEDGfKzs0gpQ7EEc+zoeR6JfROEyjXdzx2TDTSNr@vger.kernel.org
X-Gm-Message-State: AOJu0YxOP6/zCZLH7rsyEcH/e+6Al6DBu7OVMEg/d+WtodtYs5QAdV78
	QMDJc/Sn3OFf8nn4kBL9XEOnkuBLgHL/qSLTcCvS+knMvYXCvz035MIM
X-Gm-Gg: AZuq6aLla1HALEIGwztRJKTC4UTfPoF4d1A31KCjCimbW6iwYDc4MLDr4GVo3eyja29
	mjla44wbaHZxY/DcnXh2mIpKe/zFOgvKy3yPLdPWhSKEfI+U9yzQSabl/bJN35NllGSy1Nr6p/R
	KTkivX7+lX9QF51SI60pJWBH+D58oNV2wGlvElkQ+1jzO4A1TYbwklVkKM+ExHUqpBezOw55BxA
	ttGpWtCWkpTWGgfH8/9zQoVp+wm9AZgwZ817Gnwd+5ooRQnJlJaPd5bjrzxWUycU6UkSGuwSdG+
	FucTXodDsYT5c94cIOXl+TtFyMCISqpI5Y1lLWlws2AJI342yTVxQbELj/JAEwpZqKnxhMw4H3z
	6UGm35T332lc7xt6qxL9BEiJUkSaxBBXM+jeG85JAeTDEOGIMXQ5GvAjE/vWRKW6t7wsBQ+hLZW
	TQHypfPRgp6KwxGwsqfMXpVjspvHPQeRIMpntfVQqYc8u198WcajrJsOYtC1PKpswsGJnsffCUA
	4R8DAqHw/e2kfo=
X-Received: by 2002:a05:620a:1992:b0:8ca:1107:1214 with SMTP id af79cd13be357-8caeef2f94fmr1843871385a.7.1770689449025;
        Mon, 09 Feb 2026 18:10:49 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7be4257sm924100685a.19.2026.02.09.18.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:10:48 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Mon,  9 Feb 2026 21:11:09 -0500
Message-ID: <20260210021109.11906-4-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31541-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,62b40000:email,17d43000:email]
X-Rspamd-Queue-Id: 17A751162C3
X-Rspamd-Action: no action

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..0da3e22ce402 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2273,5 +2273,79 @@ cpufreq_hw: cpufreq@17d43000 {
 
 			#freq-domain-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+			status = "disabled";
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "pdm_clk";
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
 };
-- 
2.53.0


