Return-Path: <linux-gpio+bounces-29801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7148CD8637
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 08:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B5BE30124F8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 07:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAA91DF75C;
	Tue, 23 Dec 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Scnn7i5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E893A1E6A;
	Tue, 23 Dec 2025 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475040; cv=fail; b=iAKjQhMYaEpyHfdKvp6eiTk7WX+nwbgWKerI7jG9XaoZ6JmiEHAlnQtFuelynzV1FxJldnT7I76RCaK+J18MorLcQxN7EULk/nJTeJ14E8vvy+c3gTkxovNV3hLurGqKbJzS9FsTSnaKdUGF1B7Aw8CkBuvHl43ycXFzNsps414=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475040; c=relaxed/simple;
	bh=XMoWZClp9TQhFF9Xi6Uxjsqftnk/vl0RlZctRbLTel4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZK12+VvWNe2hBz72+j+c8h83UEMH3bn8stpk/ZW+w2q4X5o+2ZtyiU0dggeU6TEDUD+lJpTtBG5rwpPpYzYmP+6p5s09IptBLh5MqeLhS4UswM1Etbk2pQQoRoimFMELJhImtDouVELKGP88uS8g3ssKYsgUTz9z73WHjp7jZGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Scnn7i5w; arc=fail smtp.client-ip=40.93.198.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9+xuyK7C+ZlYiJeIaWJbxz9z4Nchdz/RFxTvXJHnOYVZpNCVgJQi86QwEt2sFfYqZey4+j5ejGlr8uyc4om15cw9ag6pJg4K39pul2QGePbnw1CiZcRXQ+JqJuCtOIHGObURqJRQqIyHNoevFDadpXH3T0a0XywpIbVb6iM8M3adzkVIBqLhtlJZ89ZUuZj3aX3h5d1OfBNSDTJSRIjM+kvKFHQsrO5XZOwvDz0ClA8JTi1cP7cVcF4MgeMRW74STDHEcdRlIjQG/0+JZnKrTHama2IbOsi4mq1yp06uuLxY7wuY5MUH3OwF6ihrtxE9UpxmMsxLQjgPKkBkjZ5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFL0Hb+LEPnn2V/XfG1No3srsWsY35tCrGoMRGthu5k=;
 b=H1gpyrcp3V6sDjjBRjo9lAklUSY7ak7xWhZYZcCKJx+/C3WNrjbJWWqdxNs1swvz93uMjd8ovrE5z3Z/PqpznY2guJNH2qfj4icCOCKlwTmQUWkcx+sxwkEruHk8dXD/Hpj5L1dOcomKsVo2QgpKFU2hGMMQlam7cxPeKEEk3JOw5BC5LacjATpxffSlqE4TGdAUjuZ1cYJrtZ4Sfor3E5QRhIPv1ARfEsj1D7yn8gB/Abv661KnuweYfdYQsgnyq2Vp4BNT6utYP6bXQvJePIlXn4W6Tfb1UlYGDQUpyJMuqUvhdz1Rt1n3K00m0fF5N5rJJ4YIjqVt5aafIMxihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFL0Hb+LEPnn2V/XfG1No3srsWsY35tCrGoMRGthu5k=;
 b=Scnn7i5wS8fuC3UZKv6Lv1XZl/Sc6Zcyu8HgkRyclmAdk7wflHHYY9gUwQZQGz5niq8TMd3m0v3es0LYv0BzzdPhpE5elyriIElzvQXVuodkhVg53wHArtbO8id9c0rRR/wU6FP+Xdg4K1IdlFs4rAZatCMq01bMWW/sUSYNN43p2TO28oLhM246WvTSjSI11GCF1zLZcacsTywQv29WuIFXD8Ej6b4CEhp1MaKNZ7a3Vjw2kJ0110zXa5QkPK9DFU+rGtVLG9H3J7uOOrFcHIGrZqtZ0J5W4v7L+RQTSDITt6WDajjj8hpWEJSOAMSnydP2A145xf4wkt4H68xzCw==
Received: from SA0PR11CA0136.namprd11.prod.outlook.com (2603:10b6:806:131::21)
 by PH0PR18MB4751.namprd18.prod.outlook.com (2603:10b6:510:ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:30:35 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::ae) by SA0PR11CA0136.outlook.office365.com
 (2603:10b6:806:131::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 07:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Tue, 23 Dec 2025 07:30:33 +0000
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] gpio: cadence: Add Axiado AX3000 support and edge
 interrupts
Date: Mon, 22 Dec 2025 23:28:56 -0800
Message-Id: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhESmkC/x2NMQ6EIBAAv2K2dhNA0Du/YiwQVt0GCNwZE+PfJ
 VaTaWYuKJSZCozNBZkOLhxDFdk24HYbNkL21UEJZaSSBu3J1seKTgiBznoKjnBLHLH8U4r5h4P
 R38Xpnlb9gRpKmVY+38k03/cDNDFw+XQAAAA=
X-Change-ID: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Swark Yang <syang@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=syang@axiado.com;
 h=from:subject:message-id; bh=XMoWZClp9TQhFF9Xi6Uxjsqftnk/vl0RlZctRbLTel4=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhkwvV06L39+di0VqPy+e9OK/5CPB9gWq1RviW9kKk6XWe
 t5tnPylo5SFQYyDQVZMkeWrzrf8k7na9zr3riyFmcPKBDKEgYtTACYS1sjI0PsvtTHrdqTsf/HP
 zvs0s7Sry2/HB3A5p+z5kJu5RtGxnJHhuU7Hntz/U/y+dfM/TtrxzVl+4ZuC7piuU1H3Jumq8J/
 nBAA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH0PR18MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d2fc25-74aa-4e6f-cbfc-08de41f5287b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmhrTDVxMnBDTGlUNlROOUI4M0drWmcwU3lPb2o1NHFPa09wMFN2ZzZWMy8w?=
 =?utf-8?B?T08vQndBMHFta2tXVytUYkM0RnExSTlHMmF1d0FOWXJQZXdxUU5NQU9mOFky?=
 =?utf-8?B?WCtXNkJ6anFoQURqUnFUYjNibC84eWQ4eWJLNEJtazBoVm9QaGUxWlF1UXRN?=
 =?utf-8?B?M0QwVm12RHZuWUYxbmFWWm9HN0d4ZnQ5WC8wSjQvM25DUGhCYnppRnRPS2gr?=
 =?utf-8?B?U3p5ZU9hVURURkpoY1krWGpxajRXYU41MkxZdjdqVzNsVXdwQlZkM3Fja2JC?=
 =?utf-8?B?YUNlZHZ0U2tBaEpRaGlsNE5teTBudnhxaUM2cWUzRW04eFFKR1ZvQlpYcm5x?=
 =?utf-8?B?K0tJNldhenZyQ3lLK1JFalRtblA2ZXNYVEpmUDVzMCs3MUl1YlIvTkc1SkxK?=
 =?utf-8?B?Qk5EdUg1STZobVFoa1VRdmRGVFZUU1hobFI2dGdYRlFtN1NoSU5iV29tQnVh?=
 =?utf-8?B?MWM4MTlSTk9CK213elI3YVBDM1Raa3ZDYnJnR2hNcTduNnhHYmhZZmRGVG8r?=
 =?utf-8?B?eWp3aGFBMGR2OVljUDZPazFQOHE5R0YwaEtEcW0wWDAwVk96aTJMa1JQYWt6?=
 =?utf-8?B?aTJMU3gwMFd1WjErUVNXTmpqaVFkdEl5Z1kzNVVOeWxpMHJVbEdpdGc0ODRw?=
 =?utf-8?B?Y1FoUCtkYThhMm1mV3R4UEVOZU5BQXNzYXJuMjFqdHlld3B1allQZndyR3l3?=
 =?utf-8?B?bmIvSUxyOEZsQ083WFVEeU1wK0hSVnN1cnlZeWpyQWdpeUl5NVZJWEg1MkJq?=
 =?utf-8?B?T3FTSXB1QXZzUWw3ZVFjeitsRTRRVjIrZHlvcXlmQ0wxdTdlUEtMQlVSSHov?=
 =?utf-8?B?RmJuKzAxVDFLWlpKQUxoNmJnRTZROExaOVpGcUdjem80YzYxNEZxdlhZVVlq?=
 =?utf-8?B?aCtIRmZlUERHU1hrczdrNzIxTVZzN0hVMDJ6ZVpIV3pLZEdSWE9XT0hNak80?=
 =?utf-8?B?ZlQ2YUtvVTNLN0RDRUZMaEhLZ2NadlhucDM5Mk1YZWdPWlBoUVhGSW5UK1lv?=
 =?utf-8?B?V2ZXSXl5RDByME9vd0tEMTBseitWOTRZZlhuT0lleFR3Z2N5WUM2MlRBNzlX?=
 =?utf-8?B?Y3pjRkdoS0N6TUdXRXVIVllFYjA3TllodG84d2RPbUpnVk5CT2IvN2ZWcmlG?=
 =?utf-8?B?anFZTm1HS1VHcEpjMm1rZ3ZnU2ZGR0VRMUpyK1c0TmlHVnRnaW0veWVLaUJJ?=
 =?utf-8?B?Q2RETDFYWWFieUsvRHVFRDBWQS9PcUFEZ1VScHdnQVdZR3UvVUkyOXcxWmdS?=
 =?utf-8?B?U09mV2hsb2d3VmkySTFORjg1dkNRN0Raa3ozKzA5YkhLMFVhaFVMMkFLVEh2?=
 =?utf-8?B?d0NLSHpLaGpXVHNWZ0tTWW5GMlN3OUQwdDRGTmJ4Mzl2YUZUdmpwelBINlkx?=
 =?utf-8?B?OUZaNSs2RGFWbVZYd3RDNDZEVWNMVktBSEZJbFJTUWd6RlRmV1B6N3VOOTFV?=
 =?utf-8?B?Lzk1R21GQ3hQbWUybUpLSEx4OG9KZHVIVXhSMThYdThwdEs5Z0ZNS3dFL0oy?=
 =?utf-8?B?NTlDM3JpdGVTZG5uWGp0cjNhSTJITjArdElGSXpYRkR1ZjErMDJ5bzlkTUdS?=
 =?utf-8?B?R0lSQVczRC9BV2xiQW1sTlVXelJIVFBFNmoyUDgxVVRVZTNVU0F0eTB2a1VD?=
 =?utf-8?B?K044ZWYraTJRYzcvbTA3Q2dydXBwSWxwaUh5cDY1dW1hVzUvL3BNMWVWSlcx?=
 =?utf-8?B?cUFkUXhSVGg3Vzlxc1ZzZkE3THQ5VWxoVTJWQ1c5UjhpL1R3OERDOHZMQmZ6?=
 =?utf-8?B?Y0FyQ2VaS1ZyYzhoaGM0Ylc3cWxoSDQreFdDeFRmMi84Yjk4NGtDOTRReWlr?=
 =?utf-8?B?UUJ3Uit3bFRSeVg3U3NLKzA4cytzZ2ZJK0JYRjZuempuVmR2RU9UTEVOdWE4?=
 =?utf-8?B?cTF0M291UVN0U29WKzJLS2YyS2FQMzdhUTRrNmRqeTFQejVicFdPclpWWk1L?=
 =?utf-8?B?bFQ5WEVsVWw3d2EzQnBsMG92Y04ySUxmMzhxdnl1aTM0Z1pSbm5WZTRhOUdQ?=
 =?utf-8?B?NHY2NEYyejVEVE1JeUt5YWxuMWpnaFl2QVZWc1RrVlY3Y0JkSjk2Zi8wOE95?=
 =?utf-8?B?cGw4bTJDNVhtS0NIRHdSY2Yxc2Q4bWdqb2dOakxVdVk1Qmw5WWN1OXpJenFn?=
 =?utf-8?Q?UZZE=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:30:33.1791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d2fc25-74aa-4e6f-cbfc-08de41f5287b
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4751

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
Swark Yang (1):
      gpio: cadence: Add quirk for Axiado AX3000 platform

Tzu-Hao Wei (1):
      gpio: cadence: Add support for edge-triggered interrupts

 drivers/gpio/gpio-cadence.c | 68 +++++++++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 17 deletions(-)
---
base-commit: e538109ac71d801d26776af5f3c54f548296c29c
change-id: 20251215-axiado-ax3000-cadence-gpio-support-7549bc46ef48

Best regards,
-- 
Swark Yang <syang@axiado.com>


