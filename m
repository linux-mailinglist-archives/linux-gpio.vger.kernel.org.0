Return-Path: <linux-gpio+bounces-39724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d9CgHmxhT2pFfgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:53:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662472E83B
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=DaJYNLbt;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39724-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39724-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28FC73065D31
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5640F3F0746;
	Thu,  9 Jul 2026 08:50:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3F289367;
	Thu,  9 Jul 2026 08:50:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587056; cv=none; b=krFWUS9mn8fmADm5rm7zncHHj6T4GPUlgSR+4ZTuFzsegwpMk4s8I6SxGmty+p/gLg2vRFU2s9bl9gFfnOEUkFnWl0xEo3NhH/lbItGUmumBwvH+3F0BDUApMW5FQVslX9aSdQrznOMbDnk/oe0l193zRdqAcq/EhWd5gITtiaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587056; c=relaxed/simple;
	bh=qoKJRxCDvhOI/3abcr0nC1nh+TpgnhS2WICWL066dv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q9wyUygP5F5E2FdfPOUEvmtk0cn6ZNMAAkXqP8DdumnDCnu155Z+DVkvkiadMlSEbBDqGSd7YEVFBCkXP5uKqMS8K98657qFckSt59s69D5+gq54cHaKPCTNl4/wR9A50zWATrf6MKuLGyFXWVI/b0WpFlfTs7gwgHQdqLGZPOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DaJYNLbt; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697qGcj413647;
	Thu, 9 Jul 2026 04:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=2ZSHG
	Go1dc4mzZi79OfTPBAmym/lpLtjKTPVmVM1+r8=; b=DaJYNLbtlGOOesc5XrKCE
	NiDkHN5712UiDQZU3nSEZBitkj6hts9O4003wey3i7paL/UVhdDSqzttQs3whZMn
	Se7rnI9pNpzBV6wGoyAqzp1y7RePI9K64ckTkIF8lDBeR+hglyWIcIPAIM2wpTHc
	iRrwulYuBX/jLTdl00YfsUcRCkKJI0rAI6CKLWq3tTXwiebEiHS9v4HmcFjtBEyD
	++g0uAXVCMQ+HioUpI3nnVQjK4YU0mbsNmxlPnsaZgA8qKnIqhFiDMw3PpzFSHXJ
	k1Ye17XYjBZuIandkovHSjaccGmBpC3JHvUoaxAvgu7xmSvYsnvyj2abJzSIDkL4
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fa7mug6hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:42 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698ofVp003591
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:41 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:41 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLQv015849;
	Thu, 9 Jul 2026 04:50:34 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:12 +0200
Subject: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "David
 Lechner" <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux@analog.com>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <jananisunil.dev@gmail.com>, Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=8597;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=qoKJRxCDvhOI/3abcr0nC1nh+TpgnhS2WICWL066dv4=;
 b=z8U6zZK1UsO+k6dCeUQhgTDykcMrRmzHoAuSP2DFvQeVtJftFDiF9Bs87Hs69Qhpe7OpLj/4P
 xYiC79j648CD/Wj117N+eK6PJJtxs+DC0Q5HMryQtrtoz0qiWBe21Bb
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: V5cYK9tq97KD25WESPrsfUawXDVmmFyr
X-Authority-Analysis: v=2.4 cv=Bv6tB4X5 c=1 sm=1 tr=0 ts=6a4f60e3 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=YXAFElg86Y56I11HveQA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX56mAwHI9WBbh
 dJpDe3PyIrjukuJkR+7HNXVD29iF8F2el1dmKgjkkJ9mtV1cR6FjTufg/6qaKSuMKPDTea3aAmt
 9qbmyi+xi5HiD9+OozrPBwN8r/YTNRxwAiy3Ez4nRQAjSv401rEh7r0HOQ5FnLGPo2BuUXZAHhm
 01Sx5vwoADcHVC/N7j+I8CH7/qi7WYp8MsbNoAzSYv2p/rJBZWTGLg+DaN3kkVpstH0K+d27+td
 vBJGX4yZod5fwivs9mjaOBy3us8qydxttmAH5NUUs3kzgCpN9yiDBdhSkoohDmb82aG5IKpuxMb
 Yv17R6n58omg4sffAxcAQBajGXc0oPTlQXKd14P9JD28NBIVgZPVenz0J0OrpeemUSVAGABu/MK
 +NirHxMZWT0O456otnUlO0c37yzKu6WvcaT6WELuSn7NfRMwIN8ha8nXdKn0FmV5Ge7IHTHCBHG
 M/7DiXhYDv6fKiPSKxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX+m1mY0kmKE8e
 ilZr5lPWwmcJcEyjY5dmiPwkYy2+oI3aOH5ku05vyoZbCPCpuPdeLK5Z8LEzmfHxE3uWRDhzgUp
 f2Z6hfN+Jkrv1OXqTHCrCjj0Ch0YvlopZmnBI++AlgqvXXmbIf5j
X-Proofpoint-ORIG-GUID: V5cYK9tq97KD25WESPrsfUawXDVmmFyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39724-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0662472E83B

Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
simultaneous sampling ADC

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7768.yaml    | 285 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 292 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
new file mode 100644
index 000000000000..b74fe6aef01c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
@@ -0,0 +1,285 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7768.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7768 and AD7768-4 ADC
+
+maintainers:
+  - Janani Sunil <janani.sunil@analog.com>
+
+description: |
+  The AD7768 is a 8-channel, 24-bit simultaneous sampling ADC with configurable
+  power and performance modes. The AD7768-4 is a 4-channel version.
+
+  Datasheet at:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7768
+      - adi,ad7768-4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Master clock (MCLK)
+
+  avdd-supply:
+    description: Analog power supply AVDD1 (4.5V to 5.5V)
+
+  avss-supply:
+    description: Analog ground/negative supply AVSS (0V to -2.75V)
+
+  dvdd-supply:
+    description: Analog power supply AVDD2 (2.0V to 5.5V)
+
+  iovdd-supply:
+    description: Digital I/O power supply (1.8V or 2.25V to 3.6V)
+
+  vref-supply:
+    description: ADC reference voltage supply
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESET pin
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  adi,data-lines-number:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+    description:
+      Number of data output lines used for serial interface.
+      AD7768 supports 1, 2, or 8 lines. AD7768-4 supports 1 or 4 lines.
+
+  adi,common-mode-output:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - avdd-avss-half
+      - 1.65V
+      - 2.5V
+      - 2.14V
+    description:
+      Common mode voltage output selection.
+
+  adi,vcm-power-down:
+    type: boolean
+    description: Power down the common mode output buffer
+
+  adi,power-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - low
+      - median
+      - fast
+    description:
+      Power mode selection.
+
+  io-backends:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^channel@[0-7]$":
+    type: object
+    description: |
+      Represents the external channels which are connected to the device.
+      AD7768 supports channels 0-7, AD7768-4 supports channels 0-3.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+        description: The channel number
+
+      adi,ch-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1
+        description: |
+          Channel mode selection. The AD7768 supports two independent
+          configuration profiles (Mode A and Mode B) for filter and
+          decimation settings. Each channel can be assigned to either mode:
+            0 - Channel uses Mode A filter and decimation settings
+            1 - Channel uses Mode B filter and decimation settings
+
+      adi,prebuf-pos-en:
+        type: boolean
+        description: Enable positive input precharge buffer
+
+      adi,prebuf-neg-en:
+        type: boolean
+        description: Enable negative input precharge buffer
+
+      adi,refbuf-pos-en:
+        type: boolean
+        description: Enable positive reference buffer
+
+      adi,refbuf-neg-en:
+        type: boolean
+        description: Enable negative reference buffer
+
+    required:
+      - reg
+      - adi,ch-mode
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - avss-supply
+  - dvdd-supply
+  - iovdd-supply
+  - vref-supply
+  - adi,data-lines-number
+  - adi,common-mode-output
+  - io-backends
+
+dependencies:
+  gpio-controller:
+    - '#gpio-cells'
+  '#gpio-cells':
+    - gpio-controller
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ad7768-4
+    then:
+      properties:
+        adi,data-lines-number:
+          enum: [1, 4]
+      patternProperties:
+        "^channel@[0-3]$":
+          properties:
+            reg:
+              maximum: 3
+        "^channel@[4-7]$": false
+    else:
+      properties:
+        adi,data-lines-number:
+          enum: [1, 2, 8]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,ad7768";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+
+            avdd-supply = <&avdd_regulator>;
+            avss-supply = <&avss_regulator>;
+            dvdd-supply = <&dvdd_regulator>;
+            iovdd-supply = <&iovdd_regulator>;
+            vref-supply = <&vref_regulator>;
+            reset-gpios = <&gpio0 86 GPIO_ACTIVE_LOW>;
+
+            clocks = <&ad7768_mclk>;
+
+            adi,data-lines-number = <8>;
+            adi,common-mode-output = "2.5V";
+            adi,vcm-power-down;
+            adi,power-mode = "median";
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            io-backends = <&iio_backend>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                adi,ch-mode = <0>;
+                adi,prebuf-pos-en;
+                adi,refbuf-pos-en;
+            };
+
+            channel@1 {
+                reg = <1>;
+                adi,ch-mode = <1>;
+                adi,prebuf-pos-en;
+                adi,prebuf-neg-en;
+                adi,refbuf-pos-en;
+                adi,refbuf-neg-en;
+            };
+
+            channel@7 {
+                reg = <7>;
+                adi,ch-mode = <1>;
+                adi,prebuf-pos-en;
+                adi,refbuf-pos-en;
+            };
+        };
+    };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@1 {
+            compatible = "adi,ad7768-4";
+            reg = <1>;
+            spi-max-frequency = <1000000>;
+
+            avdd-supply = <&avdd_regulator>;
+            avss-supply = <&avss_regulator>;
+            dvdd-supply = <&dvdd_regulator>;
+            iovdd-supply = <&iovdd_regulator>;
+            vref-supply = <&vref_regulator>;
+
+            clocks = <&ad7768_mclk>;
+
+            adi,data-lines-number = <4>;
+            adi,common-mode-output = "2.14V";
+            adi,power-mode = "fast";
+
+            io-backends = <&iio_backend>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                adi,ch-mode = <0>;
+                adi,prebuf-pos-en;
+                adi,refbuf-pos-en;
+            };
+
+            channel@3 {
+                reg = <3>;
+                adi,ch-mode = <1>;
+                adi,prebuf-pos-en;
+                adi,refbuf-pos-en;
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1ec46c5919..d667a0411f28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1633,6 +1633,13 @@ F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
 F:	drivers/iio/adc/ad7768-1.c
 F:	include/dt-bindings/iio/adc/adi,ad7768-1.h
 
+ANALOG DEVICES INC AD7768 DRIVER
+M:	Janani Sunil <janani.sunil@analog.com>
+L:	linux-iio@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
+
 ANALOG DEVICES INC AD7780 DRIVER
 M:	Michael Hennerich <Michael.Hennerich@analog.com>
 M:	Renato Lui Geh <renatogeh@gmail.com>

-- 
2.43.0


