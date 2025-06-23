Return-Path: <linux-gpio+bounces-22020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03CAE4BCD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF711189D9EB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20A62BD01A;
	Mon, 23 Jun 2025 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="O6eBCMEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2120.outbound.protection.outlook.com [40.107.102.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005892BCF48;
	Mon, 23 Jun 2025 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699720; cv=fail; b=VAq+fh0C50W5TF19istu6t+dZFKXVk6hnKMuqwLMmGavTCK4U2x1EpYJbpiNEBtiSaFxH6eCh4A3E6/B+EFtePEoxSeGhk6o2ecs5VTi9AOkOjx1lgfTNDCOdmz2MF4EL8FBDmYxbxcDKu6JT70ebW8AEDt6we1XBBFYIR3jIQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699720; c=relaxed/simple;
	bh=/M+qg08yaKOzLFHtceJtpWfQFs1X685TrZwKlW1sFCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqL55iNklS/KS6YPHz012T4mvz5XV/FYJQG9b3MfqI+xAq3oVatxYBjdPTQolOhhianw22i+HgGZ/ZbXAib0x5vzt/3HyeByDYEv4qUIBRgC7BgCNdVEzFOqLNIV++IK00Vq0Dw5WOfYUqsxyOpv5c5BAnceMVrLy2e5iqXMFd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=O6eBCMEr; arc=fail smtp.client-ip=40.107.102.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlGH4Ciw1/it3IiH7LJcgTKjHloqGau6mhxMZ6mTqcy4Wo/+x7izp9NaZ16XGkxhAvoFD4PDzIYbNeC6QppcbJtqjFtdPiDqdVp9w1N+9JrZYOSHtfhhqZK7O+leDjMwzgPot4LOZSRfOOtBHhxtO1seR70Xg9w3Irr2At25nx3fMRtLkkpA8Jp0ALIZXcw3upKHXLV9aqK5CVLEenlFyA1lP1vFMPUbtDvsS5k8zIYinoyUqExCSQnWRpEegSaLqvpeuFRf7np74AMS4KQ0thXAmYxtpiTiRPWpeDzMLMXD9uUU6ttCKdboV3N8q1w4tkbboHI6QqurzDnFtyj56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+5arzelawkdxrUIdsj1u+qDqq8wHoFVL0tDWwOTmyA=;
 b=K1p2CprWEOB/XspPLzIGrhFODrWY0v/+7jr7UZ1EMOm58E94Sb+k+5yTWMD9IqsJbXGoWPgt7eZdyo5Zs5uvoHKNRB8Pa8NAh1JRQZqs+mAiN1bLGtUbezV6UtndwQ8RH/bsHkOfWjvTCrC0JQWdbVdlNvRx5QGK1toZZ0VD3cVII4HaanOMzRSO5bQB9xe1FHH+cDUu+nfk/w76T+gPY0k5EPkYyqZ+pEIjjKm/Q4bcCmvD6BzVT0LmoqAsIBQDybMoVo9W26dROuNQxp9y8qKQBhr9IHR2EUpTdPzZ8k7CkDfySfqrQvnpXaqp6f8upbu6uA1rPsFUKoRaaAywnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+5arzelawkdxrUIdsj1u+qDqq8wHoFVL0tDWwOTmyA=;
 b=O6eBCMEr1vMHs3mlOpKeyfA/GZcd7G/INFpz3UnMGLUIOr9h87MoFXfxFl8aulrQuNrEk6rjriMs+QjZYaTCzXFeKZ8ZJ9f68YGqgyjr8l+RMUd31S6SwDKJj0FD7dVL8rrVRWkWO6dAdF6gXzuIlHV/1KJLKP0Wq5ZIATpjOd34Bz6USgey6UcEQ2azFTiOEUqMKjNDacYDWYo8NkLGo9qCXEreJ7MhF1yq9WlNEUMVRhQT2Y4wsrnDtY0r6R6d3F8F7pbcKR2BBWPEkPyl9n9CUY4l0jkYmvJp2dcYZkDMT9OxTpn6VBPx98OgT05gLd+S7M5viv199CKbP1JfKw==
Received: from BN9PR03CA0112.namprd03.prod.outlook.com (2603:10b6:408:fd::27)
 by DS1PR18MB6135.namprd18.prod.outlook.com (2603:10b6:8:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 17:28:35 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::f3) by BN9PR03CA0112.outlook.office365.com
 (2603:10b6:408:fd::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 17:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:34 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:13 -0700
Subject: [PATCH v3 2/7] dt-bindings: arm: axiado: add AX3000 EVK compatible
 strings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-2-b3e66a7491f5@axiado.com>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=hshah@axiado.com;
 h=from:subject:message-id; bh=/M+qg08yaKOzLFHtceJtpWfQFs1X685TrZwKlW1sFCQ=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY65QDcie2pyvhKrsgpXc0n5ws1OlDnp2gBcQ
 scRWUlPNOmJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOuQAKCRDxWHMRoTLV
 +wdGDACDnaxP351WkKPKu/Y+45k9G2+qJ3M17rQ5a0Z6TjxhRRSNTM41BYUtEsByFFZgGCSz986
 BXEa0XBHHk4teQX9jFhlD5nmSJrBcHrn1eZAV+XUcvg5ho9Z8ijqyEQ6ovDhBkA4DecXBeukUOJ
 JOEUDuMMq75AUCeqayUyiHDz1/NYYx4cLRWIntlroJKqkf5p7Gsig6aoXuBxsR0YxFo7uKpElE0
 CP3z+TAIbxr6RZEKhNv1Zkj331FkDhYmaaBS/ZOME95EL1mAEoA+GLT0va/ObmUWM2U6CeD1+Tc
 J0k+5Ph6EsnCa8XQ369KHZeWsIjc/7ujxx7VLhuBl2LY/muFxMAHyMw9pz40f505YCZ1YK92wNO
 h1QfiFWrUwAQmMV9IQwHqJsXlofrhaqZSi7vw+27AQ7F2HlXO6ESNtTiF29mQSHvZAEeSfr2JAd
 yR2+memabLQ3VFCUXT6CfYs69wDN2rtA2KQB8KbUCrMSIQ07p+Jn6r8hlEUAuo3sFltmI=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|DS1PR18MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 508c2373-f29e-41a2-86c9-08ddb27b6227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zkl1NHlhKzB1dGV5cUlYRXVNQUdrWmNidXdkRit2VEJSbjdvcjV4T2FzclBR?=
 =?utf-8?B?bnlJdGhCUVFZbTdLNjdZbXZoRU80Yk5pY2h5cXd4V2hmZHRWSnc4K0JrY0xD?=
 =?utf-8?B?SDZLeTBVTFhheEVDeXVVa1hINkJGT3pkbSsrZ3lpZTN1dlcwRmV0bjd6aHp6?=
 =?utf-8?B?bkIydHpTTlZXMitxL1pLcnhZWEV5Ujd6M3MvTytXR2wyakhjdFl2eDJ0Z3VY?=
 =?utf-8?B?L1RrOXBpTXdnRnpTKzUweVRzZXZ4MURSRXhVUGxhZEJRNkpUTFdIcHN1U05R?=
 =?utf-8?B?czlHeE1QVGFvODBBczl6cE8xdFRqVTlNMmNIdkxDYWtEOUtLOGdPU05NbnU3?=
 =?utf-8?B?YlZQclBoTWpCWnIyV2pVMzZudHJSSEozZVl5SEtoMFYzUW4rblc0bTdodEdq?=
 =?utf-8?B?SzJESG5BYitmY3dqMmh2L1dNUDR3T0xibmNIQ1Bac3FWZFdlcm9COHlzWUNK?=
 =?utf-8?B?dTJBNkJycmczcHpRRVRySERpM01nYjYwb0JZdndQVEdOLzVPMExybTM2ODBC?=
 =?utf-8?B?bk1DSjg5cWNBQXYyUGpFYTFxV2hpTjc1cVRPMWI2UkgxeDE0UVI4NXpYY2VR?=
 =?utf-8?B?VUJ0WXJiV2RUVFJYKzdXckc4OGRTSzdraXVoNm9yc1Q4WTgwSGRBYTJyMWY4?=
 =?utf-8?B?dHRLSlA4dEhKZENoeUtSZzN5OTY5T2ZuTjlkKytLbXkxNlNPS2xnTjBqSmhM?=
 =?utf-8?B?T1NmVWlnbzZnS2dYaCsxWVFCdVRTaDVuQ0ZUb2tqOU80L3I2ZngwNmorTmJq?=
 =?utf-8?B?Y1RlMTNXbFpwVHlUY2grb1JFNFZuV0xwR0JHZXh2TVhhZ1RnZTV6enU5emVq?=
 =?utf-8?B?RFdnNTQ4ZWRiREZ1akE4YTg1d2dUNzluNUhxdWRTUGFJNVRyb2V4MElzcEx3?=
 =?utf-8?B?VG9CQzcwLzd5VHEreThSTWlYRTdZcGtKbEViaWtJZFVBSzBPQ0U3MDd0RmZT?=
 =?utf-8?B?RDM2WkxldnNhM0wrUEF2ZkJjU2w0RXlldDFkNktoTUxxRkFoaFJyUjhNUUtB?=
 =?utf-8?B?eUN1Zld4RUlUc09KcVZQK2FVREZGMXlrVTRjK2pES1dkOFp4L2dSYXRRbW55?=
 =?utf-8?B?aThSQ3dyVkZCVTZOOEY2azBWajlYRzRYckdwYy9RbEViOFhMa2lma1FJYXNF?=
 =?utf-8?B?UlVZN1hZNFdJWm1wdHBwZFdSMkxLYThYUGJwWG1JYlBRb25LcEFFb0RYaTJz?=
 =?utf-8?B?NjR5UGh3c3lmY2pzYy9GOWNIbWhCTHdVQmY4ZkQza1dzT2dFc2h6cDVabFN1?=
 =?utf-8?B?bTdlM3c4dVhIT3VtYzJzMTN3cHpxV0pRY2puTzJNZHJ3dHROai9KZTBNYWJC?=
 =?utf-8?B?M3REWlBwTWphcWZFakdVNTZXSmpmMWhGN0x6Y0lZS0U0dE95M2NlWnZLRElW?=
 =?utf-8?B?Z2lRSEdVaDVrQjNmU3hXUS83RUptZUhwdjA3QVJ3V3I4VXV6KzBQelRuVmQw?=
 =?utf-8?B?VlhMYXZPL3hCUGV5ZVlGTUdFZm41WTBwWUU1OW95eHd3N3hCVGd4Z29IQ1RU?=
 =?utf-8?B?N0JIdlBwbCtlK2ZjbUtJdnM2QTAra3ZBaXJzaFVBbWlOdGhTZ1NqRmR5eDRq?=
 =?utf-8?B?bysxME40d3lXV1JvSWs1djhZWmUvamp2OFdrYnRaaGRPc3lEZVlDS1lHbnpn?=
 =?utf-8?B?MWlvbVZKKzd0K3NxTHovSE5EWXlPOTNPMnBNa2FjdHMvcE9POUhkK2VPSkMv?=
 =?utf-8?B?OFFMR2puVEo3eWJ0empsbjBIZDQ4Rkw0Sjd1WklqQlliSWJ1bW9hWWFwSm9t?=
 =?utf-8?B?N0dVMWMva0d1d3ExQVQzbWNFdlRLYlVlZW1JdnVOYUtTWTd1K0piMTJuZkxD?=
 =?utf-8?B?ZG9VVEdtckF0bW4xeEVQSXllK09tcVpCVFR0bXRtL2hWZ3hNeVptZGJ4ZDhT?=
 =?utf-8?B?M0NJMGhtZ0ZtT2RvMW9Kei9GOFl3M0JwUSt2MTZaMFRlNnB4VVlLU0s5YTNI?=
 =?utf-8?B?anJ4MXF0UXQvSTY1UWJRbGlrVWFYTUJhVkFvK3o4SEN5K1dyL3RFeUxjdS85?=
 =?utf-8?B?U0RXNmFKWHhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:34.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c2373-f29e-41a2-86c9-08ddb27b6227
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR18MB6135

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfabe7b32e65fb06d1f4faecfad032219f95dfca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado Platforms
+
+maintainers:
+  - Harshit Shah <hshah@axiado.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AX3000 based boards
+        items:
+          - enum:
+              - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000       # Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1


