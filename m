Return-Path: <linux-gpio+bounces-39723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NR0lEF5hT2pCfgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:52:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CF72E82E
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:52:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=NzSxWxXf;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39723-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39723-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 006E73047902
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9663EA977;
	Thu,  9 Jul 2026 08:50:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAF3CE4B1;
	Thu,  9 Jul 2026 08:50:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587054; cv=none; b=rdrHfDT0zfmscEb+hvVa51SU8Sy/qOvXWWJ/QsQSdXbqlIwjIFV0zFseocdQjH2Hpd2eQLwt7js69OD4OV+7kNPry4TGXLMxPai5sFbn/5bdFpHHqruOxevIz4niBRkQ5Rlr1WyvR+JlfHiwK7op6lHyNV8WPHWFZ3bTQc1GK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587054; c=relaxed/simple;
	bh=bi9PWVrJuxHBQcOWRM2ZSnjMGuXeMgPX3Nc171NmM+c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YNbVcysV5D8bK9U2Crg9QKqcEXIJzgkAqmaj+YqtA6w3qxqJ6KhgR29qo51EwUmX66+HON+O+zH9LhcAPOfHv5pGwDqml+mUNzkI6b28/0yFFYK809w/7um/ypkKW3eLocOwXaH3oq7NBGrkgDBSbZztbAJMrqCmvfwq3R2lEqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NzSxWxXf; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697qG21413646;
	Thu, 9 Jul 2026 04:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=s7+RLKVKEtBtM3zaZvamjXSp1Pe
	p5+RPJ3cd61Exs9A=; b=NzSxWxXfn1HHn1Wq1P8/2UtdbkmPleD5rY7OlNs3e/3
	axcvmw7Zjb14xAHTj06plJDtoo8szRR85qO2HuHmrESHIr4NyVdD392RRQUcerwb
	Q1Ayp+sJx0VIDZtOyfLlI8RGv3/7QjIgc1pVpUmuxL6Yw3TSR5Owrk4H3N8cKDm3
	T9Nyt2Y9fz0wKzdE+YMizbv1QuahtueRW02RjLWfj6MQcGM41xMzdFlvE8/h9BdG
	XJqWA4ttbxU00eDlh+hEudkYEABCK7gjjLV9Soag0r5rJmIgrFzt5DukAWzV3LDB
	9DN0SMCRpK+ZFAShk/4Vmg7jBQ+Mk6WzqCMsQp4FdiQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fa7mug6hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:40 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698odGs003581
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:39 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:39 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:39 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:38 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLQu015849;
	Thu, 9 Jul 2026 04:50:23 -0400
From: Janani Sunil <janani.sunil@analog.com>
Subject: [PATCH 0/6] iio: adc: Add AD7768/AD7768-4 ADC driver support
Date: Thu, 9 Jul 2026 10:50:11 +0200
Message-ID: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMNgT2oC/x3MQQqAIBBA0avErBNGIbWuEi1Ep5qNxQgSSHdPW
 r7F/w0KCVOBZWggVLnwlTv0OEA8Qz5IceoGg8aiQ69Ccs56lYQridIYk57MbKNB6M0ttPPz/9b
 tfT/rRp30XwAAAA==
X-Change-ID: 20260708-ad7768-driver-10cd15296c20
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=5451;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=bi9PWVrJuxHBQcOWRM2ZSnjMGuXeMgPX3Nc171NmM+c=;
 b=l+WwEXmyCqSV5++zxa5+d+Y+H32OEitgDntYKOuYH98a2Sam7IBLRdU56N1d7fgTO9wgPQvCe
 WjVMXmkZ5rlCQ6hhkWaUjVwNPvfyQFGJt475hQP4Yb3Ldc8ibQBnRar
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fASKV-jZnKemKbLRdbZlbiJ0q7IdrttC
X-Authority-Analysis: v=2.4 cv=Bv6tB4X5 c=1 sm=1 tr=0 ts=6a4f60e0 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=8b9GpE9nAAAA:8 a=07d9gI8wAAAA:8
 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=k0hceuYl1n33KlZN5j0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXzXg+PA+TIvAj
 MiK6IXzSk6ehhGYFRz9lNAWeQz0RJzVG8G134WD3ewH2KT/W4uPtoMevvn8157wCgWqQjOExJJw
 dGD3PxYjjjSYfzsACASzo9bOm1Om2JPxzjzIzPCv2VGydyiOz1EIQnCWcel1M6G59ttH3uTxqGQ
 C7T89fU7bANKEZpJBWlxEjJV8WhKizeS4rcWp8fCp4366xJC62c2JQ63wvf5kEBqACvb/b9o6VM
 kmaiQ1JWVEayYkLFRgDkq5HegFOlph1b0qBlR/h5V/W/t1csgOXsau986Q47Sy/HPNfSmFMO60M
 bRuS/p+kKjvi6i/gLm81TVhRPF1ehTpwMgEb+qlna04PVdtZSM6K/dtFEjsVzgoJo1WR5MzlH6p
 jWOtV88S4Ig26+BP/4Y1fvKQdM/l8CvSVE97KcCw8Szowo8kA6bVN1GKOeTMrydc10cEVc+G7rv
 nNV43Vtp5qg8eIomkAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX+V6pIqsHxzsv
 hxPbfe4sR8vfQywZjukzp1LxXf/BoAQetQIWj5IFD0GlgSFUvPEQaIw7K50J75noUNgemN4AUnb
 xfd5aSpDBor1bRUkkCUu0d+/w/Xc3lNuMqY5A5+KPZ9WfCc4skZR
X-Proofpoint-ORIG-GUID: fASKV-jZnKemKbLRdbZlbiJ0q7IdrttC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-39723-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: C38CF72E82E

Add support for Analog Devices AD7768 and AD7768-4, 24-bit simultaneous
sampling Sigma-Delta ADCs with configurable power and performance modes.

Datasheet:
https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768.pdf

**Device Overview:**
The AD7768 is an 8-channel, 24-bit simultaneous sampling ADC. The
AD7768-4 is a 4-channel variant. Both support configurable power modes,
programmable decimation filters, and a high-speed serial interface with
1, 2, 4, or 8 data output lines. Per-channel offset, gain, and phase
calibration registers are available.

**Features Implemented:**
- Support for AD7768 (8-channel) and AD7768-4 (4-channel) via device
  match data.
- Configurable power modes (fast, median, low power) with associated
  decimation rate and output data rate tables.
- Per-channel offset, gain, and phase calibration via IIO attributes.
- SPI communication with custom regmap bus for the device's protocol.
- IIO backend integration with adi-axi-adc for high-speed data capture.
- CRC data integrity verification over the serial interface.
- GPIO auxiliary driver to expose the 5 on-chip GPIO pins.

**Patch Summary:**
1. **dt-bindings**: Binding documentation for AD7768 and AD7768-4,
   covering SPI interface, clock, power supplies, reference voltage,
   reset GPIO, serial data lane count, and on-chip GPIO controller.
2. **iio: backend**: Add CRC enable/disable backend operation for data
   integrity verification over the high-speed serial interface.
3. **iio: adi-axi-adc**: Implement the new CRC backend operation.
4. **driver**: Core IIO driver for AD7768/AD7768-4 with regmap, power
   mode, calibration, and IIO backend support. Registers an auxiliary
   device to expose the GPIO functionality.
5. **gpio**: Auxiliary bus GPIO driver for the AD7768's 5 general-purpose
   I/O pins, reusing the parent's regmap and runtime PM.
6. **docs**: Driver documentation.

**Testing:**
The driver was compiled and tested on the EVAL-AD7768FMCZ using a
Zedboard with a mainline kernel.

**Driver Rationale:**
The AD7768/AD7768-4 warrants its own driver due to several
device-specific characteristics:

1. A custom SPI framing protocol: register reads and writes use 16-bit
   frames with embedded read/write bits and register address fields,
   requiring a custom regmap bus implementation rather than the standard
   SPI regmap backend.

2. A coupled power mode / sample rate model: available output data rates
   are not a flat list but depend on the active power mode (fast, median,
   low power), each with its own set of valid decimation rates. This
   relationship must be managed in the driver.

3. Simultaneous sampling across all channels with per-channel calibration
   registers (24-bit offset, gain, and phase) that are laid out
   differently between the 8-channel AD7768 and the 4-channel AD7768-4,
   requiring device-specific register mapping.

4. IIO backend integration for high-speed data capture via adi-axi-adc,
   including CRC data integrity verification over the serial interface.

5. On-chip GPIO: 5 general-purpose I/O pins exposed via an auxiliary bus
   driver, sharing the parent's regmap and runtime PM.

To: Nuno Sá <nuno.sa@analog.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>
To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: jananisunil.dev@gmail.com

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
Janani Sunil (6):
      dt-bindings: iio: adc: Add AD7768
      iio: backend: Add support for CRC
      iio: adc: adi-axi-adc: Add support for CRC
      iio: adc: Add AD7768 IIO Driver support
      gpio: ad7768: Add AD7768 GPIO auxiliary driver
      Documentation: iio: Add AD7768 Documentation

 .../devicetree/bindings/iio/adc/adi,ad7768.yaml    |  285 +++++
 Documentation/iio/ad7768.rst                       |  207 ++++
 Documentation/iio/index.rst                        |    1 +
 MAINTAINERS                                        |   10 +
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ad7768.c                         |  208 ++++
 drivers/iio/adc/Kconfig                            |   16 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/ad7768.c                           | 1291 ++++++++++++++++++++
 drivers/iio/adc/adi-axi-adc.c                      |   20 +
 drivers/iio/industrialio-backend.c                 |   33 +
 include/linux/iio/backend.h                        |    4 +
 13 files changed, 2087 insertions(+)
---
base-commit: b75697ef53e435d894833dad2a8c2fa882cb9b19
change-id: 20260708-ad7768-driver-10cd15296c20

Best regards,
-- 
Janani Sunil <janani.sunil@analog.com>


