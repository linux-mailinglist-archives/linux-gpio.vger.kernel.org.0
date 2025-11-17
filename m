Return-Path: <linux-gpio+bounces-28571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691FC63220
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43C3D353573
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 09:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BC9327797;
	Mon, 17 Nov 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="B0OY+zrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D6932692A;
	Mon, 17 Nov 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370943; cv=none; b=Cbpjuh2fVsZUoz71mPwHlekbt6AU39Oj0c4/3v1It/8ND5xCU4T5qqThrFXBNqWtnAzDQWSn6gB4IqG6YAOG9umewlrpDft3YmtjdK0q0dn62Wt6lWFMQKP4z8LYqdKMrfC59K1k4EV2o5ruhwAzia+no2uegpGhFiO9W9rumqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370943; c=relaxed/simple;
	bh=2U+MZnxqSl9SXuyhukdChN4MXzGHyjpe8HD9sP5OFYM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TCf8N3HFyglz8fz/noDTLbfT+hijQ6gqat+rzvP0vqxGjqHT+HiyCCSAw6lViLE+aa3++Fy3DKfxDd8mOmyRk9zA54JOREBcDkiLMgBbOEbYANiMFo+LamEhE1jdsTQTNl9W78auXM0FkXqnrtzMp5RuRgC3TWgzM7z85SDH63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=B0OY+zrL; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH91oFF836739;
	Mon, 17 Nov 2025 04:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=2fu14MlUZT6b3QMyj0mxiqUW4p7
	QgfYDIDYixstSF5k=; b=B0OY+zrLUliAtzkRMyMCEF1jo+1c3pp3PbGH6afscrd
	Ge7wEvtEHFZApNzpewL2cwXqrcVkLCypM6kGM1r8AsHwqQcrDUpx72F3FygbFyed
	JHMH3o75u/yAl7PrR0QdfIKx/xLd49qp6oHEBPKt9/CqSYBhW1Ns30eOJHy6/DL/
	EopybRs9iX2ZzL9nj8xO/rrwVr63cEJbnqbyjRIB7tgRfl/J35nh3MtHKN+PFVzQ
	e/QzDfPswSkdNf8L4RH3ZxiJY5o3VRJwKGHSz59qM6tapcrZafsZZ3isBYlv8mc8
	EKxfFKQMdTdhCRYbPZ4bzDX5n/i5lKbKoozTTy0QhRg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4af8qhvbjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:15:31 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5AH9FUF1005363
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Nov 2025 04:15:30 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:30 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:30 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 17 Nov 2025 04:15:29 -0500
Received: from Ubuntu.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5AH9FE4D003532;
	Mon, 17 Nov 2025 04:15:17 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antoniu Miclaus
	<antoniu.miclaus@analog.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 0/2] Add ADG1712 SPST switch controller support
Date: Mon, 17 Nov 2025 09:13:21 +0000
Message-ID: <20251117091427.3624-1-antoniu.miclaus@analog.com>
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
X-Proofpoint-GUID: Vz88QlOf_FNoAnK1IOw87PvIuzb-ue-C
X-Proofpoint-ORIG-GUID: Vz88QlOf_FNoAnK1IOw87PvIuzb-ue-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NyBTYWx0ZWRfXzD/tT3bI5V6F
 KGX8USQMrVNrkAkeCac04jyN5LCR/AJAXE4BegWMTMVhqzCb0mtCqp5PQI1IpCBdY/lhUUYMRp/
 dkLAMu+oLlCK/TBhZygVfdzEjOP8qMUl4NiBfYF3h12DQvPfUFwkxeebPXHqr9bzuoCoChQR2AD
 nbtbxvZn4NmqRQ5Caur25cJVQm1WmW/TRJao7mC4AQNhgDRbGj9b229bQoMJOKHkwWH/4z+9fLd
 xA/rqhYkwsqRSufW4xMHUUqUV36C8fMbYTzBrgS3PGXWFrdvAf7spTacZ4MEsFeou0UY24F67ql
 TglYxDBBhF/qA89LTuOoJo0AHBZ3ukPOT7zQTc+LBIS6kNNEamo4Si3H76ucR9XUqV8qdlLB36u
 abflaLtXBbcu7FLoMlwefeVBQdhysQ==
X-Authority-Analysis: v=2.4 cv=B7+0EetM c=1 sm=1 tr=0 ts=691ae7b3 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hQFzqgNBGMN7-N6NMNUA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170077

This series adds support for the Analog Devices ADG1712 quad single-pole,
single-throw (SPST) switch controller.

The ADG1712 contains four independent analog switches, each controlled by
a dedicated GPIO input pin. This implementation configures the switches
once at probe time based on device tree properties.

Changes in v3:
- Moved device tree bindings from gpio/ to switch/ subsystem
- Completely redesigned driver architecture: removed GPIO controller interface
- Added 'switch-states' device tree property for configuring initial switch states
- Driver now sets switches once at probe time based on DT properties
- Updated descriptions to clarify that switches cannot be changed from userspace
- Simplified driver structure and removed all GPIO chip functionality

Antoniu Miclaus (2):
  dt-bindings: switch: adg1712: add adg1712 support
  gpio: adg1712: add driver support

 .../bindings/switch/adi,adg1712.yaml          | 68 +++++++++++++++
 drivers/gpio/Kconfig                          |  9 ++
 drivers/gpio/Makefile                         |  1 +
 drivers/gpio/gpio-adg1712.c                   | 87 +++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/switch/adi,adg1712.yaml
 create mode 100644 drivers/gpio/gpio-adg1712.c

-- 
2.43.0


