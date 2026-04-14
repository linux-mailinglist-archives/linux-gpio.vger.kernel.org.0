Return-Path: <linux-gpio+bounces-35152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LLhDAZG3mnlpwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E836C3FAB8A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D85F306B535
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1FA3E7160;
	Tue, 14 Apr 2026 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="oc9d1yFn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022083.outbound.protection.outlook.com [40.93.195.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52ED3E6392;
	Tue, 14 Apr 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174542; cv=fail; b=ZVEY1ZcPExDy+9wdjMOPjVKlElRgOVB0Tx/v3kt9SDo/1K/nZQxg2SnyxB93ND7/6AvjKeBfhtmWCgOK9bTpcwbQyd7egnYWBRWctLqsUhLNDjj9iNvPF8K6glcDCe9C6E5ezVSzZDh0R3phpHUwa+wFIZ2iJ4woOi/PjtTudyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174542; c=relaxed/simple;
	bh=Io/GMsGRNQ4Tnemef2yZeU8ouOWgdCfKz7xZ73DOgKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bVts3oLt5M1PtP3l1IGsSnQJru+JRGv4+moygRgICiT5ZdypbLSdn0kPcQMZXDhZe3NeZgGniJ7MsAHiqWWPock0JIjG+DGjri43MHmAR0Vun/UK0ZI6FtKOnoetfjlFfD0pckvLhnEokSWAUuyv9Pf6E3yK080oPKHXmm88uco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=oc9d1yFn; arc=fail smtp.client-ip=40.93.195.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owju1sT/tw9vMyyMsAKH0d92KIKuyPG9gabf0k50Y+8bVy5zJ1sVmy1HQXGYb52o8JLC/nGFB6VxsE08Xyp70BokE87/JjJfLBPIipVddAPmleiKwAiG0Xi2ngDXjVeVEIwOcK+gn0J286sCUv3B5YYv503aqVRkM9AMLciVpL/fPjhASyHjm6ENT0Y4gTqlROx0vu26yGp237sYB4wCHDkBZ3r8kvmQSfraRZo5ONOMlcoJm3pN2kEuYy2y+a3gqznRp+YBK4DgWADmR4owITWH5Dv/d8nq4GvE0EWVQ0563ISBd2MHpwM1/RMdhGj0kko1p6lQn+AikNcmfkkd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSom+LQ2hgD1/KOY3xFyTW2hYyd2vO4j/9ZqnZ/JatM=;
 b=o3UUGbyFQHZrfFzu6RQI78QEN6tj4RDvs6jSgsTMIqKPi6pLBJV1DyPEGGt/ASV94vsxc4paDGAzB6nkPl4GOgseIgRPE9UwNSbBGJi9hs4P248wb0lAh6jHWJrphoqSMWk4NUpD2xBT/Nd2FJX1u8iDPOu1Rpg8ZozKPJn+lrmga20YLVP2RUdxEEro/7wdfaz/Ridln2iOSrmjZntxJlAYPpo0fKGi02AUNHpIJ88sHMz5tbL3Y3G54Glv+bTlh2rvuEMhABM8qhC3eRixFZAz31MrSbkOfVcmqTgbVMsk+rhteVkyG6xuHm8eVSUAxciaTcpODZQvosEcomM+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSom+LQ2hgD1/KOY3xFyTW2hYyd2vO4j/9ZqnZ/JatM=;
 b=oc9d1yFnuec813kDFriXAArZclAxmREMICPeWa9muDxbJCNp32goYeG9fEBHjyK+2p3+SfxZwzpcOMjHjdwasM6C8qkUW9RoIcRwXs6MqRFK7MgXCg+lUVyt8snuHvK3gozmaESeZFG4fITbcj9lCbbHEdDQrmX79dY91dpQGzB7DtJY9iIIT8ECvjqkin3qImhG/UevlRmzTRZnIkaHWRWhKHCwnSPHH2MDkeSFGzatXFpK7ZVdTMZKgyftLWlIHd8yxDR4p5wFhWw8fLlx7YwiAj3YGptl3thsBuDp7c9XuAkXt1Q0d/wAocvYRdLu8Shc3qHmxCcrM5gBr/yWLQ==
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by LV8PR18MB5808.namprd18.prod.outlook.com (2603:10b6:408:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:48:56 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::28) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.47 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:48:52 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 44ACA4186B55;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] gpio: add support for Axiado
 SGPIO controller
Date: Tue, 14 Apr 2026 06:48:31 -0700
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9F3mkC/x2NQQqEMAwAvyI5byBWKOhXxEO3jd2ANJIui1D8u
 2VPw1xmGlQ24QrL0MD4J1W0dBlfA8RPKJlRUndw5DxNjjBcEpJ2TESENZ+iGLV8TY+DDYl2z2N
 6+8gz9MhpvMv1H6zbfT+owj+jcAAAAA==
X-Change-ID: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=1471;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=Io/GMsGRNQ4Tnemef2yZeU8ouOWgdCfKz7xZ73DOgKk=;
 b=rnveu0X2ToRJZnkET/NNBaJTha2iRQu0sq5I+4fT6JVkIoaXn2Y4FaznLDrpt+vD7TtlftdZo
 SGDc+8JekKqDib6PJGAHF+eD1MVIntJJjrqGAZ5gkY6l7V0NPWQq0Xv
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|LV8PR18MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c6c96-1040-4729-da0d-08de9a2c90b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QzAVtDEIEZ/AAQIJCa+VrnYfG2eA02W6hQ+cDBNkt7p37YMIru+mGSJEdBeryYcS+ufwin3i4HTP3aej8usaxPwJSCPgF3SIgPOZu5XNwjBZ57cSrNrtaaalkWa67Kz2DSkzOIr3JBvymCFq/RL6FcjMVKUzt/vag0cRSV2ryMa/BougR7FZ9JAFO1nnoaQ2mjfMHcDe92J67dCLyMNehEKVDBQ9vGmSNWzG0q9kc+Wx4AduXqv2t5D0EcJVKdCbfwxY4YbF4QwxzUKGDfMWPjiFZPp7cm7J+IaAaSsrEHDbkj01XGRu4W3CgQ5ju/lhTlQJ641m8z5ZZWRi7bsVMY5chxaHWfI9PTzOHM9hL+lAfek1fBUQgxQqrT1+6934wA6VK+yD27UGZlXI53eGeH98x1E1+Pf1MLhnG9T4DWa1wF6lhi2kKjy2SSwS7pXnufJyYC3z5Nb6OXcAeix0PoqNc+jocn/Hv+rVojp0H0rLY/vrUhiE1S/lI9XhOBTN2BK1HMnkDf7MkC6LLSAjdJaZbATlywm4nmpWTLBNtj/Kj5ZN4qNVnSC236KINMRZX8RL3GjMVsS0HqWvut+qzUGjjeUOJv7Xkw18aEsPMUHAw3xM2gn9isdpdNng9yKe3RrhMKIX86Ych23Rr4uL9gFJvzektojyrY5FngCfkFPBG9BFaj7slhdkSI7GOV2h1+KgshFidsQVJ591f63jJ+yonm6SSCeJRskrM47aBt4NWr+malwOjHDI+a1Ww69PbLwoE5ZwkPO3uhyu2f5zuqmQ7wkxp93GZL8+Nu5+/ubGZxjgySouBcTc+iI0W1XA
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8bAJiByhE7wuYndQBFf5M5VjlTjgsp/W1yy7SvOXqI2lNcbsRPXnT/UJEjlH7AslgpED/0LDH+ZJrHLtqF4AuEkDU8LUK3ZPQgb8+SoCd5jC5YuTG9CsbtTKeeXsQraDxrk4RRTe9mHV2PVJQwEFvft5OizDJBEw/0h3vd5/RcDKJ5siXwqkgGZHQpyyrhkgFRJv3NFcinnPaBPT313lnRyV8IY/2+zdgarJnK4oDKS7wAEbySudYB1BTLhCwa0Ol6oYZP6IY04NO49NfSkK7nSJDcH3pQbPSvT6rqd1Q4NAc8QAJ0Y2ppxe2PH4f5gLqK/d89m7HTGj+cqmVZY5ej9KMd+T8rOvO6TeFUwLH9FC4NnsyxOUJNmswfXao6wNm8pO46s3MbGN5CjbTtxLpVJxBhmIEx8jroaCtg8j7IoEWF3wp0QDi/YtDDRHoQQ/
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:52.9908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c6c96-1040-4729-da0d-08de9a2c90b8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5808
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35152-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:dkim,axiado.com:email,axiado.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axiado.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E836C3FAB8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SGPIO controller provides a serialized interface for
controlling multiple GPIO signals over a limited number of
physical lines. It supports configurable data direction and
interrupt handling.

This series adds support for the Axiado SGPIO controller.

The series includes:
- Device tree binding documentation
- GPIO driver implementation
- MAINTAINERS entry

The driver integrates with the Linux GPIO subsystem and
registers the controller as a gpio_chip.

Tested on Axiado platforms.

---
Patch 1: dt-bindings: gpio: add Axiado SGPIO controller
Patch 2: gpio: axiado: add SGPIO controller support
Patch 3: MAINTAINERS: add Axiado SGPIO controller

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

---
Petar Stepanovic (3):
      dt-bindings: gpio: add Axiado SGPIO controller
      gpio: axiado: add SGPIO controller support
      MAINTAINERS: add Axiado SGPIO controller

 .../devicetree/bindings/gpio/axiado,sgpio.yaml     |  98 +++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  18 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axiado-sgpio.c                   | 780 +++++++++++++++++++++
 5 files changed, 906 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


