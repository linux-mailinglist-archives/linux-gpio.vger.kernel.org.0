Return-Path: <linux-gpio+bounces-21984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF038AE36EA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F4E1893435
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0B204C07;
	Mon, 23 Jun 2025 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oKgafiSA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE81EFF9B;
	Mon, 23 Jun 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663951; cv=none; b=R4VWtua7xkJAd7tgLpHAWAnE/bCWauzgal8TcVwnFd3vcHRIb7TEgsj+Ix5IBgskFAJFaVyMJbSPR2ik6exPoOe2Zhcfrr/tfaKv+sm6VR+aHOg6r8nFpxpZGPGa9BoYuCOHOq4bw6LEB73M1ejuXK1sbq1vQ74sdT6cWVcwoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663951; c=relaxed/simple;
	bh=P8a+DcLfMOt2qJJBryEw3cxweFZmrrMySmHyPB0vk8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a6sglNyKGz6Gn7vCa9UiBqY9RuesyR4TFZkaMV/6o8zNzaKUuVLMlwZZi6Hm+S0JWsTd5ctuc74uqTLQ1Oi0aKN8UiKaer5A++sQdzTz/VTZ6ILlZAxF/LAJgywKmi+ETrGtqMXQ9lIbwta4NfFpQcMitG7aAkdar5fL3WN4VLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oKgafiSA; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4bYPo006473;
	Mon, 23 Jun 2025 09:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZTQBEKKpUKJ2EHlkrbcRSsrVXSaMIyD8QzSmT3bFAXA=; b=oKgafiSAS9XMZXqt
	6jwgcRnnZpdvlS6FwFHA8XzABA4P2yY9hEXfb7wsIqHy2ebDOHW78vobjJRSUlGr
	kNrFUWkq/lX5npdq704U+E0h6xFpsUK+aW1lVwqm/aUYQWhzU7/Y4NyIJAV5zhob
	3mr8Q5XOU15RfsjW1s/A76DPrrHmh+UMsmdWLEiAsjrgh6bYpKnJUUlmcenNirUr
	aTnnY5eXnENVyc9uZV0rQhnIaW7LiZmnT6blwPtBSMvOLw/C8b5xIuMexdP/SdDT
	SbYOfXOI2gCdrIQ3UKLcJK7KQ4H+uLQL7zDmcpWSW+VWqALioBTCZECuESjKxajS
	vo3KiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5ner57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:32:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64DD740057;
	Mon, 23 Jun 2025 09:30:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56593B5A33F;
	Mon, 23 Jun 2025 09:29:48 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:48 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:18 +0200
Subject: [PATCH v6 8/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp157c-dk2 board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-hdp-upstream-v6-8-387536f08398@foss.st.com>
References: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
In-Reply-To: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01

On the stm32mp157fc-dk2 board, we can observe the hdp GPOVAL function on
SoC pin E13 accessible on the pin 5 on the Arduino connector CN13.
Add the relevant configuration but keep it disabled as it's used for
debug only.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1b34fbe10b4f..a6ae6ca14cdc 100644
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


