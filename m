Return-Path: <linux-gpio+bounces-32868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMc8LdJyr2lYZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5C24384E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744D030AD4A2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 01:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5144626F29B;
	Tue, 10 Mar 2026 01:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muPISeKo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EE8175A7D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105857; cv=none; b=nqjXTPAFo3WhPMeuXy25KulTx8QOKkBKdbyCSfzTefjhTcYlw3xmp84BtLO/skCqH5j1/UEPVBv2kJnEXYbcqeFExx3JryLrSzlSpBd1cLtiJyxY5WCpE97pm4cA90S4dcuZ/nyAriANET3xAI5IHBDcRMqSWZot8W6yvXARruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105857; c=relaxed/simple;
	bh=azhP4OQfnKshtp5KSEfFcI9QFn852/dMLQQGiE9h/UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWGUJDjoWNORzRbQoUV2R01pptELbhL5a9DMSu0298bTjsJuqRcpuXMAx0x6QtQjYtpBWkOJIgGJHZhsNAB7YzOlvJgjNtzMoYyHAFZFNIui+51d7lFKEOMmpF863v/0X8z+/BoxEGVhCH2Md+XwjGP9CovcWWw/EGoa4bMq3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muPISeKo; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899fb2b94c1so111040956d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 18:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105854; x=1773710654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gZG4pObxgFQxZXmUVKBVBBQrg+Kzcp2eMS58uQAHOA=;
        b=muPISeKo1TTZleMjvQlpW/LTKclhb0YovvdYdEnFWELzxGqKzftdQmjAzz1Y91Q14T
         BYCi2MAtauHPLaCTUmIzYqDOqFspOAsfjU24uNGwUMqKu4I/zx3iAPb1HluPLMSwJ6RF
         2jjIg/ZcecVvDaKosOIUkbNX+aGicWIQpNugKUERyDAsOiDspq1C3VhNXY1lpSpY/Ndg
         wCDO2RGUe1KfoOStg1RTEWNH0x8SqfFk6xbznbOr7zrTbaUzLcMUv+YLpJGi9ctAljDn
         seQ99mrm7D/Hp7rpGUX/Ldz2R0ueI9smDa6xqV1Nlm6kaLDpHz8N/x9/VbSS7SX0Buic
         GgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105854; x=1773710654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gZG4pObxgFQxZXmUVKBVBBQrg+Kzcp2eMS58uQAHOA=;
        b=XFhqHQUtaz7jl/NboJMRaC20vxG0qlkj7Ox46V7ToBRM1tftl3u3FHdWcXoL1NvTP8
         B/vFiNx7u67HQcN2SC0zev/EBrTYagcJR5eJ3kL2U1lLu9iYilQjO/REaqsqZib7uDr7
         s+9gkYtWQqD9o4Xf7CU6i5JrlUEMJ+Ci0ZY+LAZI+oOAOT5a8wIw+1X2nN8Iu61R/bb6
         iHyIR0ic2yD1XwKplwe70cYL5g8C4lXDsffZ6e0vUvGB22M/C43pGj6TWKpCIkiQhuKW
         AiQuPXRtvzOBPUzpwX59mC+5pUCQESDpxGX/N9bxzGCj01owYnOcASfKn8Q4u+pTLKWK
         FFzw==
X-Forwarded-Encrypted: i=1; AJvYcCVvRInuQx5lELZv3t07MrR+g4fru361kT/1l+yWTWqo7nO+pmQAr8PCWrnzBK6znbRVbPWeKDm+hshq@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIy2Ohek73WQWyxYV8sJI4uji+Gq6wYKsVlyGSF/oN23eGaQw
	JMvAJi8POWf9PFRA3de1zXl3rwnkP17th4D7ffcSsdjVLQM0r/+yehae
X-Gm-Gg: ATEYQzxygUoUX+Y47AyRxi8nwXNEf7RdAEffUp+HnBBZSY310BimgiST4Gu4Ag2F4Pz
	M1NE+WSy1v6UtLDsk3CaNLe3OZ1REiTcSdcmq+Pd2qwmRuwRZp1K6x/kF4GL6P0LAZULljgcVNy
	G+NbAH9B6P4H6YGKFoB/lEjdPWgiiv0mDE9RtoW1ImG/iOe0pL2lpOqKV1tAeOTm+vK/nrN/ncv
	yKjyGUJQdjiP1PgOAuTfcDEhFG1imsELDTf8GADfA48VBtdWdG9hpsUj9mVGllAe6LBhD1Jo01S
	i2XdJa8tH4sQWZwYzXpyVPTiuSwJn9DDnA2RY0e55rqQJxozziDCGpQhwe09o4gJPeSPOWdYkuY
	ftfqffP9ono7XJgWZpd+31CXcXXzf4X3zYJJbixm6961HMy34Kyf7IQ4NsO8SH2QBfPUECNCJsb
	VTsVgzWOFdS7fv1pRKOAge5MyGhIM9z1a4IHGaCEMQOzjaFqcAuwuIKdUu8QXl8ZNqtOMYqzRpn
	Sa2ZcCunbDVgYQ=
X-Received: by 2002:a05:6214:250a:b0:89a:3ad:8bd9 with SMTP id 6a1803df08f44-89a30b03888mr185705346d6.50.1773105853993;
        Mon, 09 Mar 2026 18:24:13 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57c3e622sm8859416d6.47.2026.03.09.18.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:13 -0700 (PDT)
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
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Mon,  9 Mar 2026 21:24:45 -0400
Message-ID: <20260310012446.32226-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4AC5C24384E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32868-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,62b40000:email,17d78800:email]
X-Rspamd-Action: no action

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 4879d29d63c2..e21d42483378 100644
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


