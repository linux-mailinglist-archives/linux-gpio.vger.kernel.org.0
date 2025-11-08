Return-Path: <linux-gpio+bounces-28261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90EC4322C
	for <lists+linux-gpio@lfdr.de>; Sat, 08 Nov 2025 18:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB719188B24A
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Nov 2025 17:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4954126C3BD;
	Sat,  8 Nov 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="kKYpcsWT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840541448E0;
	Sat,  8 Nov 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623786; cv=none; b=m4Zm41ZE7TWE2jeN4YBYgIQP1vjGn7zFjbIxknDaZcNjW8J5nPWpkWaGoHSm+HVm79M/+4ky/CuWgvNesfOGLJNL6TFGYMjiJNpQnW/rxmIaeSD/HvZdmm1weIIZ0RanYwO9/CAErNL0PJIL30xp/1QYkD801P+j7w/6zzQMUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623786; c=relaxed/simple;
	bh=hb7zQpliD7lIQ+rQmjC/FHvYdoMnJ1jrTB6R9cIuky4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YRxOV7sYGGv1VutCi6Ztl2q3W++vzK+YBEnJPw66xfpvPPfl423TPRUJDgbjxGhheTqpWiXY+LdlFyRAk6xAdAnlVPciISrYHu8vwvgYGdfY0ICCrYfwYk1Jw3elFTOmXSfDYt5eAatZux+EKbD896d8Xqq+qTqAnpjij7wvvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kKYpcsWT; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8CMdLQ3114133;
	Sat, 8 Nov 2025 12:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=48NWMNTjw/btD9iGtRYjnI8SD9a
	wxYVduSmKN5jIfRQ=; b=kKYpcsWT9bj6VjSCAWpTxFVu3yRoH8MrrfdsEYp57ij
	E8oGkF7YFiRaFJt6M2QWEuaI11eVNX9ZleinF2VGwUNA3Z2L88W5Z44khTL6W22G
	PcP/Na3NAvfxr9q03wTeT9vPsMNJQQomWcxjytpByPWEut7CdoMIJvFpJueA2e21
	lXYde0iEfgGuqG4TLTqvxEJk8QLCuuWEq/yTl2PwbhwIzXo3JoRKlwA03W4a3noj
	PEXRGKz3hJvPJrNbGZ+5BDbJtFuagUpZBZXC8brBMspoRfXCmNoiys49T/J8lLb4
	kCdqYeBSpvePpnXNB1aAVfhAqSF8H2VwpWpZn9563tQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4a9xtx29k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:42:48 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5A8Hgl6x010175
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Nov 2025 12:42:47 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sat, 8 Nov
 2025 12:42:47 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sat, 8 Nov 2025 12:42:47 -0500
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5A8HgarD028532;
	Sat, 8 Nov 2025 12:42:38 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH v2 0/2] gpio: Add support for ADG1712 quad SPST switch
Date: Sat, 8 Nov 2025 17:40:27 +0000
Message-ID: <20251108174055.3665-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: _R43hDgVr2M0I3M7zUwhtxJyLRuI7KlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0MiBTYWx0ZWRfX7ByLCZTZX3gM
 U+7tEO1jU7YNaT/b4Xc1NyFsWy2cbxd7+jOUva0nndSfvxQeLow8J36m5Z6P+rcnweVNfdPvDWa
 gB6HxBJFMz3t6bhiOZhNR5cqsZJoGwDcTwSszI50eBOx85rCT49PIp2cILDT2rDpjM0yV6ZlGZX
 1mTcQXbENgIyZrjAkVc3Fc9muwIla3X8696B8WDmn/oZCryDL2/jWM7D89M+jx3toF0SQ/TFcfV
 9M2n/ZrOv8k+ZgVOdZ2b55yNkJW2dWwlKXNrIugTXuiaDgHuppNS5xrEzEUWk8pZJQGaFg7hsVv
 iqLSCnRfbCWI/15oZ/IFpQXzgfVaJkXs+vSjBeZlfopHCX4QLHHqRuE1I13Kg7/uZ6binVw/y1G
 u2jNrlsZqZT4HWx7zfrdX/UlHU6tTg==
X-Authority-Analysis: v=2.4 cv=Ao/jHe9P c=1 sm=1 tr=0 ts=690f8118 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p9Z7yoRph7NKER1LKQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _R43hDgVr2M0I3M7zUwhtxJyLRuI7KlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080142

This patch series adds support for the Analog Devices ADG1712 quad
single-pole/single-throw (SPST) switch GPIO driver.

The ADG1712 contains four independent SPST switches and operates with a
low-voltage single supply range from +1.08V to +5.5V or a low-voltage
dual supply range from ±1.08V to ±2.75V. Each switch is controlled by
a dedicated GPIO input pin.

The driver provides a GPIO controller interface where each GPIO line
controls one of the four independent analog switches on the ADG1712.
This allows software to dynamically control signal routing through
the analog switches.

Patch 1 adds the device tree bindings documentation.
Patch 2 adds the GPIO driver implementation.

Antoniu Miclaus (2):
  dt-bindings: gpio: adg1712: add adg1712 support
  gpio: adg1712: add driver support

 .../devicetree/bindings/gpio/adi,adg1712.yaml |  65 ++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-adg1712.c                   | 119 ++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
 create mode 100644 drivers/gpio/gpio-adg1712.c

-- 
2.43.0


