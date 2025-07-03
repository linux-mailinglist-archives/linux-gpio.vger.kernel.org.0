Return-Path: <linux-gpio+bounces-22680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486DAF66B2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A17F4883C9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659071BC07A;
	Thu,  3 Jul 2025 00:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="att1C5Tk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2112.outbound.protection.outlook.com [40.107.212.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34A16D9BF;
	Thu,  3 Jul 2025 00:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502176; cv=fail; b=o5qiDGQyZhvCph0Xtuk1VLMTnNQy1CEwxrEcbdwDGKo6A72LBe+9wdf+G9Cc9ZvhlqcOnmZNdbHNddsJPdhKnWwo0VjP7GeKDaBK02XEgQ9OLFC84Vo/koXfQx1JhCJPGJdddp/SGcKNr5NN7etc97deW485BqQJdknW9sNXVdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502176; c=relaxed/simple;
	bh=SWVzCFmx1N9TX43ihOxY22XfOyYQ4OQCfDW7EGZ2Gc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvEGNAmiinus7opUJy9OGR8e7SD2cxMYQ+Eilehfo1wKfTHdGf9ITVh05+BlvclMG5rOzVqLZKIDc3OZoqd1gesNiC31xPwjczHgctQOowbKNiyZI2Km0jEqdRLfyktjB2NG6ea/50Bs7ktQrBbwErKplStSlhKhPH8Ox9itifw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=att1C5Tk; arc=fail smtp.client-ip=40.107.212.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx2zxy+VJGuTnjGfUK89sv36obCENpFVi7l1vZDox2qrTeg2tSwUqMZyLIaynUDiaY74lH8Z8uaywnOTvy/fL9Am+PmxmL3PI8aGa47DuAxBnxi5Q+FLf9kmSUpKMB4ay0tDYhksCNYINid1v1s4m+RLiZQoJKOkBtPFpjgNxWfXWx9LvtS0VZoR5Q9W0bqMr1sbdX1RO1HNKlFKTYGyS2Jo7Ny0D6Pzcs5VdF69j0u1U7EjtlcMxmLgCns7GPf28yK+xsN/TuIQXPCFQPfJnbLoRvGAbnFZ0tAORT5cbsLzCbWARGoALXrRwWNk1ukmvqCQIj2jIqBT0m4/I4PhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i1INCWv7lPhNBJqTgbLE9SMoTP7JFe79lUtXbD3MfA=;
 b=GonkYhjV8go0bRxGq4StTSu0QYB9lfitp9rXG2vwaWF5DaLhAOCsQAyJuTBvri4G1g+eYwvvr0CAAbqW6+iMu9rbje68Gz2QOaR26OTv0RVCegs0S7P7eV+49p3HRKCIIe0tKBf4h6w2B+d0WL+ZNdomRNPpCSX9W11hniuyLJy652uDfPFqIvMD4OkmEhXVCRTqbK5K1qQ2rUVLTyy2jl7ItFRCV06nbOVRp3+B1Q2rw/fI4w1YcB43A0ko2CSCrzWDLCD0gJYUNjpa9QnusdEOIZwRDdvIWpR5DQvD1KzjB6kfsxjZZ0AeWBqZ/xSobmMO2myLSh4dcqaqGlphbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i1INCWv7lPhNBJqTgbLE9SMoTP7JFe79lUtXbD3MfA=;
 b=att1C5TkXvROQfcRAnrKeojLLLAyeQZcaoj4kHXILdf6Qk0oc/9BN5uP8ol4qalkkmz6QteqkteVk79inkCJsR+qhvXQwD/h/RGIHZmD2EhvVVwF54jqzx16ggwEYIODA0UHzoUGciIUEF3aljpk/fX+b5rwnSFm2IKii8+v7PLHgxORj0/wfjP7x4PqKbBGoM8D+OfC6Eyt/l7bShC83hFrmqA96CBKxqaZlCBxOqpoOK1aac033X69KVoZu5DCyvdwW22UcqIPsmLJq4fhIMQE3fkIO/LulOrMj0BBvuamngSQMQk7KRejLM26rlLQmm73y7nNLTe8K3vjSGc39A==
Received: from MW4PR03CA0113.namprd03.prod.outlook.com (2603:10b6:303:b7::28)
 by CO6PR18MB3988.namprd18.prod.outlook.com (2603:10b6:5:341::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:22:48 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::82) by MW4PR03CA0113.outlook.office365.com
 (2603:10b6:303:b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 3 Jul 2025 00:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:48 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:35 -0700
Subject: [PATCH v5 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-6-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=hshah@axiado.com;
 h=from:subject:message-id; bh=SWVzCFmx1N9TX43ihOxY22XfOyYQ4OQCfDW7EGZ2Gc0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1SOdsxiICfiKNpyIqhPDh4KNkRY8/jfduc0
 TAAvQ0B6iiJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUgAKCRDxWHMRoTLV
 ++xYC/9k3YL7savTqsH3fVT3N1HgwqmovWk9UnK1fshZcf9Td2hbQg6hf0JUYIjQDVtJHkVJZg0
 xCPkaFxgNgzR4tqnAULl9UvpGLXKyu40+RAaVqBrOAasxBsT5WKL1XiSEXO397iqWvVi0qPutZP
 eSkda7QZvmeYG8heAY2JP/1jX5UWiGx8mjwsk+iEVgiktZIoLCg1qtkgYQZGpNnuy3DllfL+vbp
 288HGAWuZEsAtEx4Faftv4iKsKxx5hxJFQZxWmEmNaM/VSXtWJzvmmORqX6BLP9pYUnRexFV18H
 TWP0JkTlhwewffXJmMqS/zfIBiyLFy/zovsF4rhTA1DfLrSOQbD4Qsf2UVuDK1h3rbYVsq7qryd
 TG6YKEA/nciLHdnEraTGFKILVCe5Anfklc2IGF5eDi2lXWC+w8TgQhDl0ZBLrgWuDtf72IAM5Jx
 g0EaPpiT0e+Oxmv8HQ2paE/Rl4YG8G1LXd+GfGfFPJyln8Op5vi0Iz4aKti3Yd/rRHs/8=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CO6PR18MB3988:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f56311-378a-4aa3-9ae2-08ddb9c7bd62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzRFd1h5ckhnMzRTNEg0c1VSSjFFQ3U2RlBrMnhtc3hRMy94dTRXN2tuVEQy?=
 =?utf-8?B?OTZtb3B3ZUU4VUt1QnpyWW9BMjIzK2NIZy8wa0p4TjFGZENKRVpIZXhCTFU0?=
 =?utf-8?B?VG1jM2ZzbEgwWTg3NjZNUjVVbkJERmxCcHZVOEhDd2hUSWtMekxTUlpBMStq?=
 =?utf-8?B?SjFmcmNzZlZlZ05yWkdEdmpqNzI2ZmhzRXhkQTI5S2h3Z1Y0Rm1QVklhUnEv?=
 =?utf-8?B?SjFhSXNTMnhaTkg2K1drUkZJa2VPYklaamdJTjBKOXRxOHJLVEwxdnRxTExO?=
 =?utf-8?B?VmNNTG9jVk9TSnVYNXpLQmpXMDY3RDZzUjRYZmJTM01Pa0RZbXZzNy9jbDBB?=
 =?utf-8?B?cytlQjVLU1RmS3VIVzZpdFB4T3l5VU9PbkZuR3ZwOUJyOXRRL3VFcU5lWml2?=
 =?utf-8?B?ZDlweU1iOTMzWHJxc2R3eFNiTGQ4WHVtbWV2V1Y3RklvdHRla2JhNnIxamVF?=
 =?utf-8?B?T1BiNnVEYWc1Z2RjMzhmWjliV3c0UmFBQ2J0d3MzNGY4cUd4ZmROaUxKRkRH?=
 =?utf-8?B?QVUwWVFxQUE3cjlkTVExZ3B2Ynh3Rm5wQkRVM2J3dk0vSisxUUt6cmx1djkv?=
 =?utf-8?B?SmNjaUxSajVsOU5LTUdUdDRUK2dCdTl2QzdSa1djVjNZTC9rcHBMbXFQMzlW?=
 =?utf-8?B?alNYdmgwTWpuWW1hbjVhVDZwdHJuQkh1SUlvZlNScWdrVHcrSDkzbFh6eVpq?=
 =?utf-8?B?MDMwelBzZDE4aUE0TnN5eGVoVUdIdi9SUkpKOEdBc1RLdmpVdXB1bFpQeWlz?=
 =?utf-8?B?VFJhL3pIcHY3RWRKYmt2U1EvS2psMEdKbjYrVHNDSk53a2laZHpBbUxXQTFs?=
 =?utf-8?B?L1o5VDRMczFtRVpCUVBmeVM1QmRGc1BJYUd3ZjQzc3RkS25tSEVQQWhrcVN3?=
 =?utf-8?B?RzZLK2xIUnppOFdSYlh6M1dDV04ycEJYV3c1WnYwM2NzUTNyMHptQUVuL3V3?=
 =?utf-8?B?SU1yVjdwTnkzTDRaM2NQWDlTcVBaWThZWFp3VG9UY2xOL04xTDZIQ3AzSi8z?=
 =?utf-8?B?aGJYcUlDVWIvQ25KY2hvbmFzMndHbTNveVY0SkJPQll1SDFJaUM1QWxack4y?=
 =?utf-8?B?UDBqN0ZZcFM5eDhXVmd0cUxXaXNySFRDZjBhcGFPM2FvSHVWTEZPNTZQV2RE?=
 =?utf-8?B?S3VvMFJ4UWQ1MGpsQVFSRU1HUU93RktKajNEZUdHNFZnbkJNY0NNUHM5N3lJ?=
 =?utf-8?B?TlBVN0lSUlUxVHdTaWZaS2xTajdPcGhKekNudk1yS2V4ZjdwM1lYdC9NQmFn?=
 =?utf-8?B?T3VPb1ZpMDRGSVJqb2YzMUNnMmlxd2JUZTQrOHZvUXZpS3ROb1VaUnhId3lp?=
 =?utf-8?B?TlUyY3lZZlVPRC8vTkNCTmsrMnlPMzIrYUlMeEJIbzNza01ERlNpK1NkbFkr?=
 =?utf-8?B?VGdQSlJNWlRsQ3gzQ1lTVW5HOVNISmFjWmg5WE95bVJrQ0R2ZDIyN3NUeTFs?=
 =?utf-8?B?LzFyS3hKVDRmRlZBNFFIWHBwUzVOWTZXK0RMVkNxekhncTB6dWlkeWhqbzJE?=
 =?utf-8?B?ZDAvc1dtVXZydS8vd2V0Q0FBTVhrM0JPZTAxalhneXFFajBVNVNVdFRaR0No?=
 =?utf-8?B?dW9SUGMyZEx3b0x0QmYxSHhKTVAySjFXUnNiZ1V6OGF3L25aR245b0dkZW9s?=
 =?utf-8?B?RTgvd3FVLytMTzhGNklHTzZrTVFxWStTd0lnSXNqSkVVbWZnQlJSNk95aWRG?=
 =?utf-8?B?K0liK1h6UW1weUNDODl6aFpiaGFqUnladHpZckdjbE5aclQ0dWFYdmdZTW5a?=
 =?utf-8?B?UElaa21XZ3ljL0hYS01Kazc4NVVrWEkwZS9nU1BmMEpVV0s3Z3Y4bmRhQ0ZJ?=
 =?utf-8?B?U3lDSldCczl5SFVRM0ZLNXBQU1pzRzVWMVg1OFdIRVQwalUwNm9LU1N4ZEdN?=
 =?utf-8?B?NDVJaGZKRjg3MzBIZTJWS2RMNENGMGxoVkNpU2FFM3Q2NmlyVGxSM0JuMk9n?=
 =?utf-8?B?SFV1TnJxYThPUE1oTXNabm53cGE0QkxxbVlJdmNvblV3NHhtUittUERQZWta?=
 =?utf-8?B?eXBHajE5dkg3S3JzVkRzM3lNL2U3aElMczZXNjcrM29aNnBaY3VESEJzU3hL?=
 =?utf-8?B?U004WllBcUdDWEFUUmNCcExMaHd2YzlTbjJSdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:48.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f56311-378a-4aa3-9ae2-08ddb9c7bd62
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3988

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - const: cdns,i3c-master
+      - items:
+          - enum:
+              - axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1

-- 
2.25.1


