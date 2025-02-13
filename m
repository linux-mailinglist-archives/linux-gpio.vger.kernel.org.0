Return-Path: <linux-gpio+bounces-15909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EACA3400F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C51116A12A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 13:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6695A22173E;
	Thu, 13 Feb 2025 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tMHcKQcX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519322172A;
	Thu, 13 Feb 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452644; cv=none; b=jErzA8y5F+mO1ZpQTOTjCeb5dMZN9ho2zLzzzt6nA/XKax8YQnkVo9E41OoVrYF/M4SxXBuPhrzqFwhROAIliuA6ZM1j/v5+F7w10Lx1KdDfxlqjz4jhsGQAidXCQSybsKu4wM3zkVJHw8XZJrbcJPrhZG2alvNvUcu6bB3O1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452644; c=relaxed/simple;
	bh=zmg4n43TTzYe1yjw3/tbki3+hsDfAsgg5osDVosRnTA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jnZCKwIuvVb/56TjkkDRjWzHc5PcR8lqxvdRAOpfP8CGQvN+DE2KAcIu8T2AS6xSE085TTy+LQmim8SPxzdSWU0h3m4z7Ax+iigx4+I0zjDOD/MTDAKOwxdYHwmIKxu6AnDYXDgcH8vouYIDyNtVzz+WL0202DN5eQoDW7MOpBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tMHcKQcX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DBX8lJ022860;
	Thu, 13 Feb 2025 08:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=8qGINRMLyN074V/A7Ax3H1SIPab
	+RSrMttSGAhbPLxA=; b=tMHcKQcXGhix/Qix/XIHG7D8ivxRIl9qFRHPQaRCtZm
	if/zW6fyHGFDmyBFu8NcYgukgzGOdN9aRBgQybeBOSFRR3B4s2W12lL2MVQ+jJe1
	TKW6D+J6wlrDYD8kVBKjTxhGTbsdO4kZR5388SDszbPspJbNFygqfa5ry6mmR1jr
	WWE7cNeHZQf5LDdoHNfprj3Hk35JqXD3HUB1qV0NcUNHXp5RCus58xE9wrHlak6b
	SkSI70Th0CBuSf5qa5WSbgwW55m4tL6Gy8B4EkbBBYgL4ipKz0mtnvZhGJrfEpaj
	33l9KeR5HqgPRhleGcefhIUpEF+TrFH6TWUo/Hy8J4Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44s2r2us0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:17:05 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 51DDH3Ye019703
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 08:17:04 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 13 Feb 2025 08:17:04 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 13 Feb 2025 08:17:04 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 13 Feb 2025 08:17:04 -0500
Received: from [127.0.1.1] (KPALLER2-L03.ad.analog.com [10.116.18.50])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51DDGm8W026310;
	Thu, 13 Feb 2025 08:16:51 -0500
From: Kim Seer Paller <kimseer.paller@analog.com>
Subject: [PATCH v2 0/2] Add support for ADG1414 Serially-Controlled Octal
 SPST Switches
Date: Thu, 13 Feb 2025 21:15:08 +0800
Message-ID: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzwrWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nj3bT8ovjSguKSotTEXN1EE0uDFMNEA5OkNCMloJaCotS0zAqwcdG
 xtbUAir+y8l4AAAA=
X-Change-ID: 20250213-for_upstream-a490d1a04bf2
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kim Seer Paller <kimseer.paller@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739452608; l=1804;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=zmg4n43TTzYe1yjw3/tbki3+hsDfAsgg5osDVosRnTA=;
 b=OubZUGk4D5zcZWW/JFCWyz9IfYdPDX5572FJ5mzD0LVSRM4oxpzWh9P7CAO2nudc5xwtU9B2Y
 JmERbrh7fcCCGEvKs7xGUjH/IqBo3loOrRhOXu9tju8oHa8+77NF5QQ
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 0GCoDffyBaSzaB0q2Es5rft2DUsXWbCm
X-Proofpoint-ORIG-GUID: 0GCoDffyBaSzaB0q2Es5rft2DUsXWbCm
X-Authority-Analysis: v=2.4 cv=NvYrc9dJ c=1 sm=1 tr=0 ts=67adf0d1 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gAnH3GRIAAAA:8 a=k4HhWpO2bGIb-syiGicA:9 a=QEXdDO2ut3YA:10
 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130102

Apologies for the long delay in following up on this patch series.
I checked the gpio-regmap abstraction to achieve a smaller footprint,
but found that it may not suitable for the ADG1414. The ADG1414 device
requires direct manipulation of individual bits to control the switches.
In the regmap_config, reg_bits and val_bits need to be set to reflect a
byte for instruction and a byte for data. However, the ADG1414 device
directly changes the bit itself (e.g., bit 0 to change on/off switch 0).
I think the standard regmap read/write API may not be applicable.
Additionally, the size of the transaction dynamically changes based on
the number of daisy-chained devices.

This version address the feedback provided and includes the necessary
improvements.

ADG1414:
* Define a static struct regmap_bus to wrap custom read/write functions.
* Use devm_mutex_init() to initialize the mutex.

Bindings:
* Modify filename to adi,adg1414-gpio.
* Add type definition for #daisy-chained-devices property.
* Modify title and description to describe hardware.

- Kim Seer Paller

Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
Kim Seer Paller (2):
      dt-bindings: gpio: add adg1414
      gpio: gpio-adg1414: New driver

 .../devicetree/bindings/gpio/adi,adg1414-gpio.yaml |  68 +++++++++
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  10 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-adg1414.c                        | 162 +++++++++++++++++++++
 5 files changed, 248 insertions(+)
---
base-commit: 4dc1d1bec89864d8076e5ab314f86f46442bfb02
change-id: 20250213-for_upstream-a490d1a04bf2

Best regards,
-- 
Kim Seer Paller <kimseer.paller@analog.com>


