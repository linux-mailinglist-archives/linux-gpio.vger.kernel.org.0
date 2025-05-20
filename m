Return-Path: <linux-gpio+bounces-20351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C6ABDE9C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E488A4E244C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAD3253321;
	Tue, 20 May 2025 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wJmAUVP0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B922505C7;
	Tue, 20 May 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753486; cv=none; b=rVpi3A6N5dNSYXNLIhPM9Bj6LCifMUCuEFR9yGIqWbab8jfVF+rgJO/J8o7v0J+yfIhjWzZ8KWALawRmsgFng9MN9o9iaR3MSclYoqXXyhUUTG+o5fVdW+hvihGf4U805//kk1myBFx+QhOdLeFVHK0//IiRfz+JCAUPv6KPL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753486; c=relaxed/simple;
	bh=sU2RhePat1aQjBO237+i5tjmIArbuVyp7bQ9whF+JYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QMT9NQYvGMniev0VfDUf8wKnQ1hIAHYDALWXCTPq6oUh+rYU2MziLeuR2eKdMCtEgtmp6t1k2G0wvA0hD8qPwm/BsE/3NIVkf4yT3TQTw9UZBv8VZqceo9d5mnv/0zeIXfdC2HZ1U2C2jTsDjZCX/bEMejl3IdRGVFAP8ymfUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wJmAUVP0; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KD0WJZ009394;
	Tue, 20 May 2025 17:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	R4Em2WOCtNmZnECHj9cB8orbqHwuCdEzrhZKZaFoeaU=; b=wJmAUVP0sW4c1M5j
	EthjR4xrl0Y3ZWbpm0PGN61kpA9U7SN6Fr5zS2atRDp/7O1P5VX3O35iiWFYojIO
	pq8MbqJswLVX66+XE8I8yVXTZZTd9u1fL4+hFGNqEIdS97QsLBQ/yHoZcjKhY1uo
	9PchrQ+SdYxGpCC2VLWcPQYjwyccEC7eSKX3fVdctQwUlpZ8W4D6WVI5cijYywU3
	5tDCDtYjTL9T4BcVEFxaKUilE2fPOicogMJe1C3kwKDrUyqmj3jsniJ7ttOmA4SD
	KH14o0t1vcQQbdgvdVCqB7Ctk32PjGvHncY3iNRU57v0mhrt65cM7QfIwJebwPnE
	A1Y53g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvke9ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51BC74005A;
	Tue, 20 May 2025 17:03:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA1B9B20B09;
	Tue, 20 May 2025 17:02:37 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:35 +0200
Subject: [PATCH v2 8/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp157c-dk2 board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250520-hdp-upstream-v2-8-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

On the stm32mp157fc-dk2 board, we can observe the hdp GPOVAL function on
SoC pin E13 accessible on the pin 5 on the Arduino connector CN13.
Add the relevant configuration but keep it disabled as it's used for
debug only.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 324f7bb988d1..8a8fdf338d1d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -63,6 +63,12 @@ &dsi_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&hdp {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdp2_gpo &hdp2_pins_a>;
+	pinctrl-1 = <&hdp2_sleep_pins_a>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";

-- 
2.43.0


