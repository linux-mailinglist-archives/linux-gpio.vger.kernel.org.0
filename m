Return-Path: <linux-gpio+bounces-28951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BDC78F2A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 13:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7880B4EB3CA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21EA34C150;
	Fri, 21 Nov 2025 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PTot4QF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18DE349B14;
	Fri, 21 Nov 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726939; cv=none; b=LXy2f10u65YtyFqSsMVcugPF4ppw/2fiW+lL8UYvIGm1IK2dt9rAJEmvL6D0hP+mXUSzGwb2IuPQKeDmIN0Ccv123LDcYfJnJZwZwfL9witoWPUf9wsc68NErlCanq9GiVVZ/+3iqdgp6gFTCnSpmA7VpQa1K7jVD1b2PYbV8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726939; c=relaxed/simple;
	bh=oHrS5InW6hOBk7ULsKBjxk7spfe02VUB3smcxI02oV0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuWtQVC5KGZIBPY5C5Llc6isac1gqhcMfClgCPhvLk58HB0CBZswyJe2CFyOneJALO3ezAW5zEv2Mt7+NkaDt8LiFHHq6E+Deg+x0Fu2T/HADiSlVXOk+u1KTVzj8FprZJc0DHt/2WKX4K0JI+2miqKrw3O/zr8DIlvRrlUDjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PTot4QF8; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALAbwpY2556843;
	Fri, 21 Nov 2025 07:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gmoAp
	ZMs0T/8N/BI95wYOcVCj4fyECTkDbU8BFznDjE=; b=PTot4QF8QTaLkzPyirDU6
	kaLHA52S++ZVFvevANFxREUaySD9etVL7VWTSaecjlHRMBzJ7vtYQBS6hLYKxBOF
	eVdYpz0mkUIlMkOc40I7TbEDHOTfkuDat5sQFWIahNvDauBld5mAf7ikjpPWkj62
	BbP1nd0xhu3fIC8sRBtIxwaH90269pRtqhQSBbttJS3HRwEa3TtbT2e8U2iC/edp
	SnMBucrIM/KRZ7l+IndljBlPFVfv2Evq2z3uD6nlvYqKNPFiqP0OccBQGLPRtu0c
	DZAA52vlfV96xsrHRN7cV096E76XsLEQHrEl3kIrpRq7NXvOvz6Ds8Vxq1Zphr3i
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ajjqjscxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 07:08:42 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5ALC8fsY022184
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Nov 2025 07:08:41 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 21 Nov
 2025 07:08:41 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 21 Nov 2025 07:08:41 -0500
Received: from Ubuntu.ad.analog.com (AMICLAUS-L01.ad.analog.com [10.48.65.187])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5ALC8G74001559;
	Fri, 21 Nov 2025 07:08:35 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Srinivas Kandagatla <srini@kernel.org>,
        Antoniu Miclaus
	<antoniu.miclaus@analog.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: mux: gpio-mux: add support for ADG1712
Date: Fri, 21 Nov 2025 11:57:31 +0000
Message-ID: <20251121115750.20119-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121115750.20119-1-antoniu.miclaus@analog.com>
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: gV6wplcPI74fch3C5r9M63a8hS0PSFEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MSBTYWx0ZWRfX4nRH8We7uNWj
 gt9dZQlaNmOkaCegy/LxGty2iORkzFYASWs5zYWJA9hk88uf11dNaWoMuKawgD+kAMjX/cmeGu1
 USq5PVHEImy2Te0ICXmpvy9nnB1IEYe4wdLGMg2+Ec4ptfmqPYsdSnuEu1e/3N7niZo0mtR5HNI
 Llgopiy0r1U6PwJvI7M3/NudJkA+N6YRA7JokDCal2+MGxxCvYO6cy/nMPvM6onhJkHGjEMbFtK
 MNilCiVShb4EjvKbmxwMeZ2db2zf39FaQwLvkfCvzSQpacmFuC6FuaHQZw2K9U02z4Zp/VkALDP
 m3r0u4nln9/8GssgpqVoR7GqjHRgdcGxWEdxTALbUdwcMwHAjedbyNSh3wj9SRCSebloUqVuVej
 GQNR2BhzawMwHNEnGrPi2nIl4R6Mog==
X-Proofpoint-ORIG-GUID: gV6wplcPI74fch3C5r9M63a8hS0PSFEL
X-Authority-Analysis: v=2.4 cv=ffygCkQF c=1 sm=1 tr=0 ts=6920564a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=d5aaZAUBg0qRrIhVtL8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210091

Add support for the Analog Devices ADG1712 quad SPST switch to the
existing GPIO multiplexer bindings. The ADG1712 contains four
independent single-pole/single-throw (SPST) switches, each controlled
by a dedicated GPIO pin.

Unlike traditional multiplexers that use GPIOs as binary-encoded
selectors, the ADG1712 treats each GPIO as a direct switch controller.
The mux state represents the combination of all four switches, with
values from 0-15 corresponding to different switch combinations.

For example, state 5 (binary 0101) represents:
- SW1: ON (GPIO0 = 1)
- SW2: OFF (GPIO1 = 0)
- SW3: ON (GPIO2 = 1)
- SW4: OFF (GPIO3 = 0)

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 .../devicetree/bindings/mux/gpio-mux.yaml     | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index ef7e33ec85d4..7c5784875683 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -17,9 +17,14 @@ description: |+
   multiplexer GPIO pins, where the first pin is the least significant
   bit. An active pin is a binary 1, an inactive pin is a binary 0.
 
+  For ADG1712, each GPIO directly controls one independent switch, and
+  the state represents the combination of all four switches (0-15).
+
 properties:
   compatible:
-    const: gpio-mux
+    enum:
+      - gpio-mux
+      - adi,adg1712
 
   mux-gpios:
     description:
@@ -100,4 +105,21 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    // ADG1712 quad SPST switch controller
+    adg1712: switch-controller {
+        compatible = "adi,adg1712";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>,
+                    <&gpio 11 GPIO_ACTIVE_HIGH>,
+                    <&gpio 12 GPIO_ACTIVE_HIGH>,
+                    <&gpio 13 GPIO_ACTIVE_HIGH>;
+
+        // Initial state: SW1=ON, SW2=OFF, SW3=ON, SW4=OFF (binary: 0101 = 5)
+        idle-state = <5>;
+    };
 ...
-- 
2.43.0


