Return-Path: <linux-gpio+bounces-30311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46FD082E1
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33410300EF7B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32473590B9;
	Fri,  9 Jan 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="OnJblCx4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022126.outbound.protection.outlook.com [40.107.209.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD903590CE;
	Fri,  9 Jan 2026 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950794; cv=fail; b=I+5OEeFMKSQkLFieB6HaRng0gNyPji/KV3Y69LnBC3w/79CpcMEjUSmZFlUhU7i0JkQfzbWurieDrPqr8KcOQEvhO8jAOgsWur8nYuOQ1WGhsPXP0x1tt68JYNiyGXodLgw5Rah0SIVxfTYVREbbTzKg5+YT95VhCgfctnVO1WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950794; c=relaxed/simple;
	bh=zzpsSY+0JRXzBh/rngHXCGyyMo6UCRyfyhn4qMX0VGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FVrMj+4DSTcqYxznKZT8P3XXQqCkid9284Vn1Yzz05aaWwtZF0ADJnrhTJz8+yniBVBs1ENGt2GbBxps4gnWmOssyQGFYK2H4rvRQ59FYs86RtuQezYOpEJ7QkuYVmwee13+cRhFEHWrzMKVXud28CTRsVCqLM9uH12mMzKI3ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=OnJblCx4; arc=fail smtp.client-ip=40.107.209.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GctEpT+eYvO5/ECAE3o7Bv+mewODPb9dpWwNvbH6iNWH5r15tctouJ1deg3Cm0yJOYKO3Z6jpcBa40+DBfsEJJL2CtunSE2iOKeEzUQVzCUlcuXqGP4fcZUFE0F6+f3XpYAmTcq7v7LbKkRNTlDvxIYaO+lwYvQyhRZH+83Rz0VdcjJbU8sd5FRxnWIHsbyjd9/YTUXG+F25QZ5XuGQqJUB3PO0Jn0lkGxxJsSjBi+rvhEJZQEF1LWNwHytA0ToLDN0w8BtQDAouK90LLEVo5W19RWb346y3fNBuWjRJT/4eJIynsvluEbgL6yoCdB+nuxq01e+hj5AHBgtF2kbi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz/0FWo9lxgS4PH1tNfTL/TbcWoWPEmEbFfHZnBInC0=;
 b=GKLLLAYiIVv0cIHYLGlaNvl1qyU4pW3CJl6G/0vXk8+LITs0fH7DwXhvn3hd7VeKBi4vcpE6FzPGDNjJmUyaYRnns3GEHNzC4hsXz2OU4wHLX2rurfUZDaruO/2ld3NNzWcrdkymmNKLD4NfT9DGn49umsA39MoPMARqY3a0AiL79flQufzAfjltLYfKeXEzm0AYVFFpNMvpI1o4RRg3y5JuKluGn+Bj+rRgoceFlgOjk0K5bswNY6yRQukJ5TYw9YSH3iA+l7BR9ZTnAuN7vZnwXEQOKApqgF57VYjBPF8vE8956GUS9BkqOFI8f1KxSNcr+YBAT8boVy5fdsymTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz/0FWo9lxgS4PH1tNfTL/TbcWoWPEmEbFfHZnBInC0=;
 b=OnJblCx4yh7Sm4dKLvAzGDO09xEjdYt701/zFhw4XAnEhxJTi5lBnCGrbKIzFoRfugFY+CXicP/hb78/uWuYPgLuh9MwwJd/dy1SSvkwP9AeeC0nkX9qqGkcbhVOdP8oFtm8iWElb7iWT9SkrSZ5M1XEbXSsqwVsyo8WBoSGRpLiONLcK5xMY1Cy22dMoN6WxL7AEAwFUDGx6MjttLByUEwEu44aqcfmS8HfWMz19WsjjD6QY/r8rSpWM//X7cv2GcP6frebFPMnNoRZrMa+jNh1YiqqdAysrmUXt8r9yECJXojDHJg2OMWAxfI4IR2xIozjy8Z91vMJAJRn1kEBlA==
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by BY3PR18MB4785.namprd18.prod.outlook.com (2603:10b6:a03:3cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 09:26:27 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::55) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 09:26:26 +0000
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v2 0/2] gpio: cadence: Add Axiado AX3000 support and edge
 interrupts
Date: Fri, 09 Jan 2026 01:26:05 -0800
Message-Id: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3JYGkC/42NQQ6CMBBFr0Jm7Zi2goIr72FYlHaAWUibFhsM4
 e5W9ACuft6fzPsrRApMEa7FCoESR3ZTBnUowIx6GgjZZgYlVCWVrFAvrK3LcRJCoNGWJkM4eHY
 Yn967MOOlKpvOlGfqyxqyyAfqedlH7m3mkePswmvfTPLT/vRK/aNPEvOlob4mYUVn6PZ9Ohr3g
 HbbtjfgbiUM1QAAAA==
X-Change-ID: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=syang@axiado.com;
 h=from:subject:message-id; bh=zzpsSY+0JRXzBh/rngHXCGyyMo6UCRyfyhn4qMX0VGE=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyEk1u5PPxefOWfqcqYmLivW8Yiae6lxGXVpSdLfj9ds
 Cv5aFhGRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEzkjCLD/+iND1YtXD69SuWV
 wrI1b80Nn3VnB9+sU42wP2D4Qn+mRwcjwwYp9nsThaJ/C331fBJf26gYzjm1pnyW2x4dkbPKYr+
 0+AE=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|BY3PR18MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e2d076-1d1e-45c8-4cf6-08de4f612a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T25FdnZ3Q0JkaVRTbWxwMVA5WVlQaXExSEZFLzU4UmZHcHN3K1RxSmx4UWtl?=
 =?utf-8?B?TnVMeTdkUk9SeFFTcE0xYitVQTEzSzJSaGZMZnB1UUxuM0JDdHZybVd4L2Iy?=
 =?utf-8?B?OGVnc0NLQmplOFVnWlNmRmxHeDlBbmtCcW1XeG4rc3JmUmZBckZzSnlSaEJ2?=
 =?utf-8?B?K2NaS2tLUmFqd1dtL1I1dmZQY3VXWERQUmNiMFBJTnFML2ZqMkY5ZHZqaG5r?=
 =?utf-8?B?QjBmNUdWOUpTQVg4T3BGbVFoZ293bUVuMnJzTWtrdlFaOGNKQVZyK0piSHlD?=
 =?utf-8?B?OU5pNUptMFIvaHBmZTFFVDlRZDcxanl4QVhXU3BLS1plRHJUWkowK3V6SWhj?=
 =?utf-8?B?cnA4TkJTb1U0Tk4wYW5WeUhBSERKbCtJbVlnd3IrajB0TnFZekc5R3lzSkFm?=
 =?utf-8?B?dXR6VTZFZUJNbHpDTU0yRkVJN29hT3BBb3ZMNloycWtWZExNd0NKWEkrREhv?=
 =?utf-8?B?RlM5dyt3SW1McUh3N2Q5ZFgvSmtLdUxWUit6bDIzcEFuTGx0dERKVjVvT0xT?=
 =?utf-8?B?OThNSmNRblRQTThKNFozVnpSVVdObXU1RVpBR2JIUG1YTHpNZm92TXFIK0pN?=
 =?utf-8?B?VFRwVm90U2RhTXIyS3ExVXlCRGhkckhPd3hMV1J6cEZTUXJaN0RSLzZPM1hQ?=
 =?utf-8?B?a21HYzdUMG5LTnVYNUFCMTk3QUxidDBaSmE4ODRwTHRYZU1Qb2RhME91a2hG?=
 =?utf-8?B?SndKVXFlRlhnczlaY1lZMkRQTGdUanV3YXhPU3lQeGR2ZmdVVEhHZ0lUYnF5?=
 =?utf-8?B?TDFwVzZCUVNLWk9CS1RqSEJxZzd6d3YzWkRRM1U3K2NQSTU0em5la1Q0b3pM?=
 =?utf-8?B?UXVVQjIvQmhneUw1ZzdRY3hCN2Q2WEJEWFZucldFbzB4STVseG9rdms0RGRM?=
 =?utf-8?B?VFIyWnczT3Q3TjZ5QjdOQWh0Y2ZIUzRyTEJUeERMa21YZnJ3SFNHR2R6TC9j?=
 =?utf-8?B?SzQ1akpuaEZ0TlkzdG1nZzNoc05ta2h4YmhlbHdzK3Jha2FIT2g4R2FTOEIy?=
 =?utf-8?B?N2dOblQ4VFh3ZVFGbitFcENrbFdFSHp5bnpWK0hJTzdheSs5amYzZW1rWmNQ?=
 =?utf-8?B?VGxEZ3ZoaUZYTGdld3NPSldsMmVOOGd0cVQwbHo0cmN3SkJZWFdHVFlweUNl?=
 =?utf-8?B?eUtVRVh4Q1RrMTlLY0phalMwMXVid0dKT2JoVjdIZHNoUW5sdW9sTEhQQ0tO?=
 =?utf-8?B?bEVTOHplRWpYdHVCcU5ZZWdtUDN4VldsYTdndHNvcHNiMFhpY2k0RkNsNHAz?=
 =?utf-8?B?Y044T0R6RmwyRUxXMDgwN1dDTFhNNi93Q0k4Q2kxeFprcmlRTEZNSlpxclVZ?=
 =?utf-8?B?cWtqMURRY1RiTDVHL2Q5a0U3WnNZNkJ3U29JZHRTTHNRZHNlZ0RLMGxBZDRJ?=
 =?utf-8?B?V211c0N1NWNlT3R5UGo2VVlYSmxJclBrKzZPYU9TTEp2bUdCNFpOcDZQdWNM?=
 =?utf-8?B?MkdCbytlZHRxS0dGdTVTcEFQd2NhL1JGbTY5S2w5a0IvR1JJUTA5V29JSUFX?=
 =?utf-8?B?aWpIUTdqd1crbG5JNXpVcjZUbzQxS2kzdVF0SWNlR3RRemdqajdnVzZobUVP?=
 =?utf-8?B?OGpzanpDMXRiN3F0YkREOHJWWkZWd2VnTUZwYVVJQk5sSkFCOTNLR0FLWE5Y?=
 =?utf-8?B?aVdGdFAyUWRkbEdEUjRkdmU0bitEby8xR1cwWG96NFVWYmZoTW1uY29FZUhK?=
 =?utf-8?B?VGVRT1dRTE9KalJjNU1IQUdqTXIzMkE3b2VMcGpNQ3JPV2YrdUVOVXRUb1RM?=
 =?utf-8?B?SzdzSGZkdWlBVE5QVGZQV2t6OG8zSmhJcm1wWFI0NmtmZzFYTW50WTdpMU9s?=
 =?utf-8?B?UjJEKy9jVGxaalNWbmlIaVYraitUWnI0NnRQZ2wrT3lScmlnVFJpV1ErQS85?=
 =?utf-8?B?dWh0RU9FT2xtWlo1TWVReUpCZWFacVNha2treFNIcDZERXlDNDZkRUZ2Zlkx?=
 =?utf-8?B?VkJVbDFYWnlFbFlXek1xVU0zK2RGL1ZxN3piRkJialVMQ215MG84a1ZTNHA4?=
 =?utf-8?B?MTl6aGFjQmE5dlZrVzk3M0RkSm9LdkVERE1Td01WcnRFdlJRYzBlWDVDK1hH?=
 =?utf-8?B?UG5IN0pxNXhjN3R3RGtJWmEzRGZzUlRTdTZidHk3SklvUzlQZkhWMXU2bXFY?=
 =?utf-8?Q?pV6E=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:26:26.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e2d076-1d1e-45c8-4cf6-08de4f612a21
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4785

This patch series updates the gpio-cadence driver to support the Axiado
AX3000 platform and extends its interrupt capabilities.

On the Axiado AX3000 platform, pinmux and pin configuration (such as
direction and output enable) are configured by the hardware/firmware at
boot time before Linux boots. To support this architecture, this series
introduces a platform-specific quirk to skip default pin initialization
during the probe sequence, preserving the pre-boot configuration.

The series also enables support for edge-triggered interrupts (rising,
falling, and both edges). The Cadence IP6508 hardware supports these
modes via its IRQ registers, but they were previously unimplemented in
the driver.

Patch breakdown:
 - Patch 1 adds a quirk for the Axiado AX3000 platform
 - Patch 2 enables edge-triggered interrupt support

These patches are expected to go via the GPIO subsystem tree.

Feedback is welcome.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Changes in v2:
- Patch 1: Refactored quirk handling to use "struct cdns_gpio_quirks" 
  and "device_get_match_data()" instead of bitmasks, as suggested by 
  Linus Walleij and Bartosz Golaszewski.
- Patch 1: Moved Copyright notice to the correct location.
- Patch 2: Added a comment table explaining the interrupt trigger 
  behavior, as suggested by Linus Walleij.
- Patch 2: Collected Reviewed-by tag from Linus Walleij.
- Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com

---
Swark Yang (1):
      gpio: cadence: Add quirk for Axiado AX3000 platform

Tzu-Hao Wei (1):
      gpio: cadence: Add support for edge-triggered interrupts

 drivers/gpio/gpio-cadence.c | 76 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 15 deletions(-)
---
base-commit: 4d70843ea1294cf8ff78492643c73ddbe4663aea
change-id: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48

Best regards,
-- 
Swark Yang <syang@axiado.com>


