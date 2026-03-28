Return-Path: <linux-gpio+bounces-34340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsHJ+Q4x2nSUQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:11:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71334D061
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 03:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02FC4305365B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 02:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A2D356A08;
	Sat, 28 Mar 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fad2Qgoe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB6356A3E
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663841; cv=none; b=X1zeokK0Hi+zZ/sID4iDYrsRtLff1vWSlVg3gzU17ZpO2HJ68WUsXmoyvxaBVpPOsHBf5jxwE0ymFdx6O1WfTBZ9CXZfdiXzI9qXaCdIVI0BTE9lUmphsdU0Ik1WJjM2+stBvKOKINoQF7r/2b1XRJkDnKpK8JgEAxpH5EvHO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663841; c=relaxed/simple;
	bh=W+TQhMNYqZr87339dE/iOc/6pEhejlYbKY3ZjAJcsWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtW2vlN9TLTy8JMXxhzqgaqEPRPROoR82W4RiUO6jGrhXRCh+dWPZsu03AWtvsa47P8YZecMFBjhxbgHkLNOUt87mDQeWJQZRQWXVzQ7exKyUG0IfgF8SXVFTvqDIk8nnOu805bop3BOQgizNnfuh56JqbZCmbduA2LwSPKr4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fad2Qgoe; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50baafd6c4aso10885961cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663839; x=1775268639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me055uooF9VJUXEMWA5n9SFzAa+xup4cKpJ/xh9KqF0=;
        b=fad2QgoeVz456d1syFLkj8xL168hH6G3gIUo59C6rY+u98f8umQNEpCUjbmy43QFpQ
         JlAOSx7/H0HD3g67Q8Z6wsqXMpfHK8dPFBotPwRCmUisKCJUhCumSfCsQ+Glhs/qcg9x
         Pi1kreJtBMCKZ8rp3KNxQptQmkiGWTIddZ0FSPtx34B6SJ+L/pEFEk2C0ASCV/1ERCyk
         SxuYweD7twnXoP68VEI0ZBHmjcPXTf+EctppyghlKxdp0/00MX38th+q35d91a/eVaNy
         wSLPSiy37WsEueyRfoxK1w9G5+IG4XdhVV5zQEU5CcRol4hVyyvA55wQTJ65dwwCS+A/
         pQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663839; x=1775268639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=me055uooF9VJUXEMWA5n9SFzAa+xup4cKpJ/xh9KqF0=;
        b=OkpFhagl9pUI31YoKSyRXkrpktTOO9N8tUwbBAgnJqJPU9ZzlmkOdJ5cv2YdN1WYRl
         nYfx3Y4D10OjtzRhLJZ6qYK2+oFcB7QcdrzxLGsNmExzvgh0LDW5lwgXUeZyz2I0tj9K
         7rgjWiRDAgynQ3kht2T5577yFzidiWvXutcSGRngQkXSxYaKpSojmlhx8crOZXUuStTX
         ZdOlU5nSnka1bokoll2w2BPPD5nGCg9SUeKZUYtIJAzRTChseq9S1w+5r/wPtVzAlVdp
         qQxYPAcIAaQ+3nb0ZGLKRYFhfwO5fwHtFeZKRvrifbBYMn0sJl8cMLn+arHyl691Inmc
         U3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7ofk7Ljm+n9U/6BvlW/qsRQedaMlvub7zr3JquGLsOHvqbQHdZ92eoXROK4XilxrGp49PaGxq7KzD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WB5BFD0ZOVqNTORrKg1mLqO4UcdcXIJq/VoRqbn3NxZ/jL0t
	zgt4Yv9sqpmG0uBM4KSqYgHXeQ5zawTh3lwBys5ZgVahBO7y+Zo6smxqN5Ft9g==
X-Gm-Gg: ATEYQzwzqtjkTwsd2mVi1EBJe4A/LgG0VHSMHnlLWTlKFfSfnABWzsknzhC68OyEdRe
	JGXOLThlo93ipcgQeVr8tr+AkswgBIBU7jdQ9z2KslgEmIaGUIRrvOyfPVG0rzWR6RKq47jZoeG
	j8bHAKxBfCtgOlYeQH9sIAmS1w22Nknxl5udxSFuSikqgOCdBGAX8wOWuGhmaUtEXEZtWrRHc2w
	flshrFe7AYgoCUiEFQjZ1bf/pxAgylDIfFQ9d0Iohz1rrr7nQNFaQQ2u9xBSs7LLvCvKywZsfKj
	69mYRLjwkz64Zj6sWNP+EZofe/hRSy/7RQ0hutGURr07hdBdDoTYiEe/TW4ykSubHH9eqUr6OvD
	h2WU4xbONvHLCAmzaymEKZC0kXSLBhKGas3Fi9FWeTSIdXfK5APcDxk5yGVsfxMHQyeHyEeyLOG
	DJa2F5R2eXAi4XIil04uoSgBeI34eTopvWKgiNNNRI8OvSNhmfrw+iLvFIqWXvCSuoomzxLN9Qr
	XgCAEtzJXmFlaU=
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr64885111cf.59.1774663839241;
        Fri, 27 Mar 2026 19:10:39 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbba4bd0sm7497766d6.11.2026.03.27.19.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:38 -0700 (PDT)
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
Subject: [PATCH v3 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Fri, 27 Mar 2026 22:10:35 -0400
Message-ID: <20260328021036.85945-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34340-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[17d78800:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,62b40000:email]
X-Rspamd-Queue-Id: 0D71334D061
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c5f7655421a3..85a34e2f0907 100644
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


