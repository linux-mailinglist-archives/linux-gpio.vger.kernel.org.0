Return-Path: <linux-gpio+bounces-26121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC42B56B4A
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30189189C2AF
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9C32DF15A;
	Sun, 14 Sep 2025 18:35:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06913BC0C;
	Sun, 14 Sep 2025 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757874912; cv=pass; b=Z9FCg7zulR8iKooS+diN6eW7Gi9L7saBWAuUx+bF26gwO3Al0gE1yuLK7TclPgfvcg6/9a2lQ+v6mP6/d4cCpsaEBDyQgpM49SkpWxYigW0JJMxIbwDLBzJPFc6kCqAkQKbXMDf0diDyGGmZ6m5k+Rm2e3Lu4KMsC/zbANkNTmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757874912; c=relaxed/simple;
	bh=EB4XHv8U5CC970p+L/TsQh6Kgp/Ym+QbI3sWln+mneQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=OCJWBXCyw28q1wnODGj+yv6PGqBOjtlt1fQobymCabR2Nfcj+6oSsvzrjHkHeGG25MnJZkXrEpzgSF88z3m263futQasg8e8jnNplMTaxl/rt1E04+mSwTLRLZLIbHrO7DGmi4JYSILYfY3HP5Fs1SgFHRDBiULAKuvxj3CNPBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 35D0B700B9E;
	Sun, 14 Sep 2025 18:35:10 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-15-22.trex-nlb.outbound.svc.cluster.local [100.107.15.22])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 50779700EBF;
	Sun, 14 Sep 2025 18:35:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874907; a=rsa-sha256;
	cv=none;
	b=jspQhYjIKWHx8zkCmPBGDW88UVunFLVII3O09UVzM6qUAsYcV6+taQXpH0L3uZlWVybs3c
	4UKLu3nC16cSW8SNPsK31cTfxsBvCo33TqEmhfEXGWwuqqBN7LYu05NA6qhf+BphIfDNmN
	6777w48s0+VN8FAwUtnooocMR6UAZulqqS3BUSLb0FfpR4RlJZr90W2t02aKJB4LgTm31+
	7JjIpGnbs5v8IGIuhXQtLF3t2faWCy2J7EhYFmdIHRN4ZFrQLyBN+vuTZdNMnk5yjoxF4v
	58V2HgfT+8y32f44AVxOmHmWvmMwI/TiwONMcrzT/8iR5Uz386uJphjKj2Mqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrSuu0/0luJawRVwP53vUDamOlXUoGP16XBVeeYJ5+Y=;
	b=mCim4WmK9v6ad/r6Aj80d8jQM+O9evA9lUshJpC6fzcTj8JXvisOVZ+wsUHn2VIwSveOdZ
	hrJ4kWPnsumIrGEda5ZT3LZsj72gNQSi7X+ypv9XW1vtGvJ2T1KSMiJT1rsv5o23/NXa2y
	wuSLTNBV8e4JSJrbyWfZemCif/4p660iRp94XkNEyA5TZgoKFV0tvSYHw+3DEVqZYcQoUq
	3cHBnRXCVYwzUWL0AXvpBnF0ozpb6ZLwRiAPU6Dx9ypyA/IHMZzvZxd7a+jDjSLQxVPsk6
	7peDgpKnNPQ2ZQfOzuCn9BXMRTXaw/o6XaKm1b7gjj2662uGnjTHWdc0WMxw/g==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-sqm4z;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Zesty-Fumbling: 76c12fcd0b1b6065_1757874910108_1509657283
X-MC-Loop-Signature: 1757874910108:2442260372
X-MC-Ingress-Time: 1757874910107
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.15.22 (trex/7.1.3);
	Sun, 14 Sep 2025 18:35:10 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfW6ksSzFK6mb;
	Sun, 14 Sep 2025 18:34:59 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 5/6] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio
 node to tlmm
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
In-Reply-To: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
 Shinjo Park <peremen@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=1287;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=EB4XHv8U5CC970p+L/TsQh6Kgp/Ym+QbI3sWln+mneQ=;
 b=+Slc/vUv4TFAW3V7mpTn8nNTA5YIcSC1ga6TJZvNfvj5/6NTn8mRHHLoEke6MF9o/rwgKcYRd
 46Zo/+0AFaMB6i6NXBvwDqsbsGVbG9094+e0uP/oW5YWPPO721uExlR
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:59 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70ad7 a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfMT+8416qEbjp7iz6nT1bFP/YRMv+D+kir2tjy0AaJnXDmRbp7grlffMjQtfbvyuuUoXj+VWtaCX8OdFMuu1MrWAXV2/bFqwUCd4CjxgwEPlo6n6y+C6 304SFf6Mz9eveEf44fG0UZHnxujz8siPLd3aqcABhz2Nv7qPa73CexPYCmM81znW1LG86FOQilr62+3yaeUMyymQ8Ips7TRX1fKXH51Mmxgn6qZtNCccPwSd qV7DYq5khmUEY5xIgwE6NyWBdeEL1HkoMD8Coj/kXOF05NtMxzJoTdRBhOhvGYu54LK0+4WOZ4STbxFddYcRoRaoNxqMeA+lYA2+LP3JLC1IBBg7RedC8x3v uj8GvW3fbTsogsofd64o6I8pzsIaWqQ3OjK+ziZm8rYJ16SG1LtUSlzhev4JigqM/CcL2uyjtOJjesCOyfob8HrglkzuHvt3/E183WZZgy1N0RhB34B7HYYc xpnbCifwjBnrTSFti0P9G8/5bU7RXcCH05vKWjrA3UWKPQSEX8sLISSpUO3XMWFh35cIr72PjwtaMs6d9/K1NKttSA/AcBLL5MZT3G03tSQg8DyKpb66Noat eUfpb10NaJsjw+PZcgAZvVLnBXcljuAfNh3PpDOlZFX2XKVwUHNZIPzau6PaxdA81k1T93StTYFtf4fZFk3519o54FolJzGQyVX50nGrjAQXWA==
X-AuthUser: linux@smankusors.com

Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
convention used by other Qualcomm SoCs.

Suggested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
index 46618740bd312b975321427e5ffa34811c68e652..03a3692770142048391577401869cea9a7735053 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
@@ -107,12 +107,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    msmgpio: pinctrl@800000 {
+    tlmm: pinctrl@800000 {
         compatible = "qcom,msm8960-pinctrl";
         reg = <0x800000 0x4000>;
         #gpio-cells = <2>;
         gpio-controller;
-        gpio-ranges = <&msmgpio 0 0 152>;
+        gpio-ranges = <&tlmm 0 0 152>;
         interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-controller;
         #interrupt-cells = <2>;

-- 
2.34.1


