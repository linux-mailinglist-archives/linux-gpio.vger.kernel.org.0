Return-Path: <linux-gpio+bounces-4974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D8894934
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 04:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B9A1F2308C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 02:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51ACE55F;
	Tue,  2 Apr 2024 02:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="msPDX7Ar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8DA168DD;
	Tue,  2 Apr 2024 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712024080; cv=fail; b=u/q38Eoc2M/Qi0ZoEaOjITovTMibZXEiPF5bd/CK56jnpA/O2oE6rQE7J54idOJASGiTZDEip3qSwAr1JXiyD6PQDHI+kFPCfHRvfpfciXAX2oRFdOFCbZT1wfSDnprJTq+0OzgYG1qGwb5KSGJAqNg3sC+kupsb9Vfm/mXhO/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712024080; c=relaxed/simple;
	bh=dmiAYDVkcsXStQaV0L5mjHp+nYreGOGih+jzIytrTwI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ag0jkvd6MbX2vBUUmy503xj73q4HXLWS0IIRwUTtx7Qyxd9v7Cx8t4kQIuAIlCUvSUCFHgLBmMXRir1QoDlvQU7DhAkmcK7RXRb0mHtAr1AkvEMBTmMMmEnto4iTver01sfmrGgNaBxcuhqP1XOgYQwS8ROmjtoIF9/cEV8U5W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=msPDX7Ar; arc=fail smtp.client-ip=40.107.22.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S63Ior2XNfZL+WKH6GWc06sUW3J+DPO3zp2bSVowo4zTxMkEM0Nyp4qNJoFG1CEvi9L9/EU46ZQedoHbnof3j4YXvJcmjyXn6bSuJkRJSstEgBuNDti3qazJHxan4Xp7PXx1HDed7R2vBYUestkgzdgbJXQKU14ta/p85tf67HFgp1v07O9klaYjmogFpOlA2S/cOtvUjfnpZlqhg270kAidrdZYbJLHYK1I4YfxdljUi9EfISaydidNHvUQKRpeBWspax6uDrtZcAG0UL93CW/oCoei/yqKbmWFs/3Vg5g2Dcyb14Git42ZSecB7szcLhYN8yAOj0GxGXqD/+hVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gMYasi0SC4BYrugBOBLUv0189SiY8AqhmUuhnnRxdw=;
 b=m4QdcwzXvDGuA5zbTAIonUfMG6bSMN3GlqYixj7u5QVQXZ31tAPnycZntNgY+B0b6Oa6QT977Vqo+sCn/U3Rp6Ro/GuqX/qFrYHlWZDAGULht+nsgBuJDSEsi2WfltKmorUvWFHlLHoJ4LLBEPNHf+xsYuZSDsZAeXWurSS6ygiCWVbQ/wjlY4IKZpu/p0I+WxPjCA39zrYdgqKoe128vgGgmhgM4KhgYXiVE5mGfuVPuDrHGa3yllEXT/ZYpQwnuwhqM6YoieS8RqxyYkrGBEZTGLSAThM6hYww/ziqMgPTxi0QwXRSi7rOpyJx/NvgUXA0OdDf72hGB5GgI6gMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gMYasi0SC4BYrugBOBLUv0189SiY8AqhmUuhnnRxdw=;
 b=msPDX7ArzLUgvmAQEuYq+AuJt0OvQ5/kovpe99CnObNFep1pf4HSn4UY1WCdz8S1q0zTwrQ82bydfrB7r6wcA17hcDEyQ0FhUaSnqhQICVHePt6gAsko6KC3hJidYD9Kjv9NHjgEEJC1cN0pNq+VtyANImUp1sWsg2qfyPatoNg=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI0PR04MB10163.eurprd04.prod.outlook.com (2603:10a6:800:245::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 02:14:34 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.037; Tue, 2 Apr 2024
 02:14:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 02 Apr 2024 10:22:23 +0800
Subject: [PATCH v7 3/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-pinctrl-scmi-v7-3-3ea519d12cf7@nxp.com>
References: <20240402-pinctrl-scmi-v7-0-3ea519d12cf7@nxp.com>
In-Reply-To: <20240402-pinctrl-scmi-v7-0-3ea519d12cf7@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712024557; l=29592;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=QDQMn/pyZt1DNvj+/EHowHOSwDsyja68SmLFdOEv/Zk=;
 b=rkQLI112MZ/YS0BS7kxTJwFPpG3auUwV2kUD8bW5gZVNpjF9rQL6d4AsLTbSyqZdZRpQNtLFk
 b7fZAJizCeoDtRCrgxpTEEK101Lsb1wNs3TzDrfIHtB1M/I4LDtTpUK
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|VI0PR04MB10163:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2qLpbynGKBupCWv6s4bV44979kSPge98EoH8WqyHaiDV/EW0pAnwlRmm0PABEyA/gyJoLLxhgZUciJakptLgroiVrLW68acHZFRJBbDB9MBapdrwAIG1A3+3Sbm/DpoJwnAjgCcL7/J6TkZe3Ht8DMyluCYtU375Z7rLg7dH5VsKr4tY8SLVjSUr3eSbshIv+BewyLEHGZLxNXR9dup/a7KiHQ7x+XWeHThbxxhab+rEjd5s9gGh6MRPWFzNYIa1YzjMVIpkBeYaSblYdwl0K/0VzlmjKe6DhWqWTkTD7KbzH8Qf/wN+aIZRuhSee1INZEbuo6n+aUOzd4VUdYEjFCh7zwAMQqazizmg92zGwDnO72WhlilzH2BJnfCSJe1kyEuxWUAXFl48IGjb7WbfIXsJ96V5nFVuPOix7rN/p6AwrNDZL2wKTXd0d88tAMZzsDE6WIM8yQ0tZITKT5Om0vsUVK+3aa4iiiDcK1cS4R+WurACptvbC15c3QAjIjecOxv8J8CJSmVATYs6l5dAg2sHtQwAZjHBmeW+CTQEAdnp+u7eG18FG941JQ09JnmRwheaXApDS40V1Uf1tq6vU7ncbtRJ/2YVaWUbncq6kCg6owdzehwf2L7MhmBZ0XBKuYYeDfNm2HtnlWc1YaIe/r9lfu1+riA3pNHzBM9DXDDNttMhuFb6QxwlaoVRgm7nFF3xtnbR3ZCC43oNJjPyx6u4p8hr7DgNezhk66G0Xm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejJvNVhTTldGTUQyWDQ3Qkx1TVo0Yld4dmM2TGd5QU9UY09lcE5sRWhOQ0Vw?=
 =?utf-8?B?aXBtbXVnbUppWGRWNjhtSlVDRVhYTmI2UTBBbXFQM1hLQ3l3aVhDNStYYVNw?=
 =?utf-8?B?cTR5OFBXRStSbkZyOFRRTHZKMWNUTEJybThYeDBGeEw1eWExT2luREZPb0Fj?=
 =?utf-8?B?L0hIVkNlZzFOQ2tmNlExU21hUnJWRzdmVmhDalZRRWUwVDViOHlpanNnT3BH?=
 =?utf-8?B?OHdTdTdhaWM2N0oyQnVyOHczaXlSZkhPM2pLRUxER1c1RnhnOVB0cS9ZbUpG?=
 =?utf-8?B?UXFFNThnNGFLbU9UNlFMS0pnekVReDdnMVVPVzJUVkhaSEJWcTN2SnhYSkZr?=
 =?utf-8?B?YTN2d3NqMW5sZ21MQUw5My9uQi9sUytQa2lxMk0yY1NQemk2SUhMcUFxTTVp?=
 =?utf-8?B?ZDhZU3pTb0RZcytqZHdmeDFucVYvNlMyNmFySllVZUVXV1NEN2tOOXRGY1Bt?=
 =?utf-8?B?L1hWNFEyNVB6MzA3WGVDcmdITVB0TGJFNXNmRmtuLzFoZWY4Y3BaMWlwcVZR?=
 =?utf-8?B?M1JTY3dPUHVCOGZ2eFRZTjFFbllDQnN1dzlET05qTEhOZmk2ekdKc3ZFZzh0?=
 =?utf-8?B?UExxQ3VlL2IzNzI1WTV5WjhWaG5aeHQzR1Z1cXdHZnNaSk1rR1daTkN3L1ZP?=
 =?utf-8?B?a1h5ZytyWDQvZzloYmpkUnpiQUFpMmFERFlnMGhqaktrSWYxUTZOWXkwL3Ax?=
 =?utf-8?B?TEJ0aGQ1Z0lnZHI1OE1xUDhkOGRsVlc5RzFkSFo0RVpoZVZNUmlUMzRreU5I?=
 =?utf-8?B?M2hJcXVhTWYwZ1FsbU5BVXpvNXpsYWoxSzZwb2RxdXFpOStaS0RFaFZNNjVX?=
 =?utf-8?B?dmlxTFVqUzBFWUZOYlc3TFZyNEZkemRESWEvcExFL3BZeEhWOFREY0Vxc0J4?=
 =?utf-8?B?RzdTOGNkUDF6ZTVXL3VzdEt3bks2MW9tN2ErVG10VXluTnR5VXZlWWEvbkNp?=
 =?utf-8?B?eDZhRDBENzU5QXZvVm1TWE9PZVluN09aWmc4RW15d21PV0hrR1dKL3AycEs5?=
 =?utf-8?B?WEZnWHkrNnUrN0tHVjZzRkVHNzY0bW96ZkZ5SEVWdlFKaTVXczhoNXV2c0Ny?=
 =?utf-8?B?dEVkY085NnRreFFDR3VLejg0WmFLeVFVOVlQNjN1bUdtcWFsOHUwaEhEMCti?=
 =?utf-8?B?R0ZPQjJ2ZThMQUhtMCticElwanppamQvaWVKeXVsMUdob3ZLTTJ0d04vTXdV?=
 =?utf-8?B?amdHR21McXVkUThoRjQxd0FpSnNraE9PcEhhWFA5QnN5WDBWWjdWNTZ5aEJ3?=
 =?utf-8?B?K0VNSUo5cFNiUDBWd3NsYXA2c0ovS0lEUlJha3JtMXN1Ukc2QXVhSzcwWnZY?=
 =?utf-8?B?ZllCM3VwZXMrMHJkbUNXbTduOWpkVlFJQWNXaXlFWnhxWXFWblRudk5iNUov?=
 =?utf-8?B?RkZiOUNnclcrajUvamN0M25oV2VVQ1pJZi9JSXhNWDIzdHllQ29FM2hjRFdH?=
 =?utf-8?B?K2ZrWTRCMnoxY1Y1bmtLS1o4TFd4UU92VHkxY0hsYTNFbXR5Q2Z3ZEtLa3ZO?=
 =?utf-8?B?YkFGZ0k0a3dWRnRSZnIweGF6akEzdXErOGhOWU5VUmZwODAwQkVHdEQ4Qk5J?=
 =?utf-8?B?c0RqR0NOS011Mmg4SjhiQzdtRHVvNDNZUWt3QkdVUS92RXlIaWVRUzZiR2FM?=
 =?utf-8?B?dEx3eDE4ZXpPSmNlUC81RXU1MXhqazJoUGdKUUVpcUc2TWJ2ZldMaUZmakk3?=
 =?utf-8?B?L1BHSnM4ek5Vd0lYZ0crdkNFWHJxUzlTMmo4dFJnWkhmWTBiSzVuUDFCb2w0?=
 =?utf-8?B?NWJpQnZoOHJLZUxONjJZVkpNYVVBcWlCQTVFYlZNZkpJVmo4SWFLSTVwR2JG?=
 =?utf-8?B?alVjaFZXV0FBRVdKMFlXMXJxdWZ5eEttMGtQVVdpd01RbzJTQzFFR0liam5F?=
 =?utf-8?B?bkI0Y0VJZlUvWFlDek1IY1RWQTFZZjZxOEFrdGxsV2x0OXRad1ZqVGZSWXJ3?=
 =?utf-8?B?dnBvRHpEaElPQ01ad3ZVRm1Pb1dzMURuVDFLWmpvR1FpSjBXTU9rdFF2b0ls?=
 =?utf-8?B?MXlpNE1hZWVKQUdVK0hCN2o1azVRZ0ZoM1lGL1NjNVlzL1dnVGw4QTFJcVlC?=
 =?utf-8?B?MmVaQThCS0tHZElZcHBibHFlSGRWRmNZdWRiMDJmY3RZSU5TdjMveWlyWTJs?=
 =?utf-8?Q?MbR0eAYaaeyTU5Xa52EbvMhGT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960689f1-052e-424f-90ef-08dc52baa38a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:14:34.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64wN+AAzpADEdk+uYfsOzI5CAE2l5w3ol+okWT7veYKXPKneI/qwL20+J7ZBizpB9BlKkrdKEQXgs/XvvnreqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10163

From: Peng Fan <peng.fan@nxp.com>

Add basic implementation of the SCMI v3.2 pincontrol protocol.

Co-developed-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/Makefile    |   3 +-
 drivers/firmware/arm_scmi/driver.c    |   2 +
 drivers/firmware/arm_scmi/pinctrl.c   | 897 ++++++++++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h |   1 +
 include/linux/scmi_protocol.h         |  83 ++++
 5 files changed, 985 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index a7bc4796519c..fd59f58ce8a2 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -10,7 +10,8 @@ scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_SMC) += smc.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_MSG) += msg.o
 scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_VIRTIO) += virtio.o
 scmi-transport-$(CONFIG_ARM_SCMI_TRANSPORT_OPTEE) += optee.o
-scmi-protocols-y = base.o clock.o perf.o power.o reset.o sensors.o system.o voltage.o powercap.o
+scmi-protocols-y := base.o clock.o perf.o power.o reset.o sensors.o system.o voltage.o powercap.o
+scmi-protocols-y += pinctrl.o
 scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 415e6f510057..ac2d4b19727c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3142,6 +3142,7 @@ static int __init scmi_driver_init(void)
 	scmi_voltage_register();
 	scmi_system_register();
 	scmi_powercap_register();
+	scmi_pinctrl_register();
 
 	return platform_driver_register(&scmi_driver);
 }
@@ -3159,6 +3160,7 @@ static void __exit scmi_driver_exit(void)
 	scmi_voltage_unregister();
 	scmi_system_unregister();
 	scmi_powercap_unregister();
+	scmi_pinctrl_unregister();
 
 	scmi_transports_exit();
 
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
new file mode 100644
index 000000000000..503cd1b55561
--- /dev/null
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -0,0 +1,897 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Pinctrl Protocol
+ *
+ * Copyright (C) 2024 EPAM
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/scmi_protocol.h>
+#include <linux/slab.h>
+
+#include "common.h"
+#include "protocols.h"
+
+/* Updated only after ALL the mandatory features for that version are merged */
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+#define GET_GROUPS_NR(x)	le32_get_bits((x), GENMASK(31, 16))
+#define GET_PINS_NR(x)		le32_get_bits((x), GENMASK(15, 0))
+#define GET_FUNCTIONS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+
+#define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
+#define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
+
+#define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
+#define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
+
+#define CONFIG_FLAG_MASK	GENMASK(19, 18)
+#define SELECTOR_MASK		GENMASK(17, 16)
+#define SKIP_CONFIGS_MASK	GENMASK(15, 8)
+#define CONFIG_TYPE_MASK	GENMASK(7, 0)
+
+enum scmi_pinctrl_protocol_cmd {
+	PINCTRL_ATTRIBUTES = 0x3,
+	PINCTRL_LIST_ASSOCIATIONS = 0x4,
+	PINCTRL_SETTINGS_GET = 0x5,
+	PINCTRL_SETTINGS_CONFIGURE = 0x6,
+	PINCTRL_REQUEST = 0x7,
+	PINCTRL_RELEASE = 0x8,
+	PINCTRL_NAME_GET = 0x9,
+	PINCTRL_SET_PERMISSIONS = 0xa,
+};
+
+struct scmi_msg_settings_conf {
+	__le32 identifier;
+	__le32 function_id;
+	__le32 attributes;
+	__le32 configs[];
+};
+
+struct scmi_msg_settings_get {
+	__le32 identifier;
+	__le32 attributes;
+};
+
+struct scmi_resp_settings_get {
+	__le32 function_selected;
+	__le32 num_configs;
+	__le32 configs[];
+};
+
+struct scmi_msg_pinctrl_protocol_attributes {
+	__le32 attributes_low;
+	__le32 attributes_high;
+};
+
+struct scmi_msg_pinctrl_attributes {
+	__le32 identifier;
+	__le32 flags;
+};
+
+struct scmi_resp_pinctrl_attributes {
+	__le32 attributes;
+	u8 name[SCMI_SHORT_NAME_MAX_SIZE];
+};
+
+struct scmi_msg_pinctrl_list_assoc {
+	__le32 identifier;
+	__le32 flags;
+	__le32 index;
+};
+
+struct scmi_resp_pinctrl_list_assoc {
+	__le32 flags;
+	__le16 array[];
+};
+
+struct scmi_msg_request {
+	__le32 identifier;
+	__le32 flags;
+};
+
+struct scmi_group_info {
+	char name[SCMI_MAX_STR_SIZE];
+	bool present;
+	u32 *group_pins;
+	u32 nr_pins;
+};
+
+struct scmi_function_info {
+	char name[SCMI_MAX_STR_SIZE];
+	bool present;
+	u32 *groups;
+	u32 nr_groups;
+};
+
+struct scmi_pin_info {
+	char name[SCMI_MAX_STR_SIZE];
+	bool present;
+};
+
+struct scmi_pinctrl_info {
+	u32 version;
+	int nr_groups;
+	int nr_functions;
+	int nr_pins;
+	struct scmi_group_info *groups;
+	struct scmi_function_info *functions;
+	struct scmi_pin_info *pins;
+};
+
+static int scmi_pinctrl_attributes_get(const struct scmi_protocol_handle *ph,
+				       struct scmi_pinctrl_info *pi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_pinctrl_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr),
+				      &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		pi->nr_functions = GET_FUNCTIONS_NR(attr->attributes_high);
+		pi->nr_groups = GET_GROUPS_NR(attr->attributes_low);
+		pi->nr_pins = GET_PINS_NR(attr->attributes_low);
+		if (pi->nr_pins == 0) {
+			dev_warn(ph->dev, "returned zero pins\n");
+			ret = -EINVAL;
+		}
+	}
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int scmi_pinctrl_count_get(const struct scmi_protocol_handle *ph,
+				  enum scmi_pinctrl_selector_type type)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	switch (type) {
+	case PIN_TYPE:
+		return pi->nr_pins;
+	case GROUP_TYPE:
+		return pi->nr_groups;
+	case FUNCTION_TYPE:
+		return pi->nr_functions;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
+				    u32 selector,
+				    enum scmi_pinctrl_selector_type type)
+{
+	int value;
+
+	value = scmi_pinctrl_count_get(ph, type);
+	if (value < 0)
+		return value;
+
+	if (selector >= value || value == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
+				   enum scmi_pinctrl_selector_type type,
+				   u32 selector, char *name,
+				   u32 *n_elems)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_pinctrl_attributes *tx;
+	struct scmi_resp_pinctrl_attributes *rx;
+	bool ext_name_flag;
+
+	if (!name)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_validate_id(ph, selector, type);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, PINCTRL_ATTRIBUTES, sizeof(*tx),
+				      sizeof(*rx), &t);
+	if (ret)
+		return ret;
+
+	tx = t->tx.buf;
+	rx = t->rx.buf;
+	tx->identifier = cpu_to_le32(selector);
+	tx->flags = cpu_to_le32(type);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		if (n_elems)
+			*n_elems = NUM_ELEMS(rx->attributes);
+
+		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
+
+		ext_name_flag = !!EXT_NAME_FLAG(rx->attributes);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	if (ret)
+		return ret;
+	/*
+	 * If supported overwrite short name with the extended one;
+	 * on error just carry on and use already provided short name.
+	 */
+	if (ext_name_flag)
+		ret = ph->hops->extended_name_get(ph, PINCTRL_NAME_GET,
+						  selector, (u32 *)&type, name,
+						  SCMI_MAX_STR_SIZE);
+	return ret;
+}
+
+struct scmi_pinctrl_ipriv {
+	u32 selector;
+	enum scmi_pinctrl_selector_type type;
+	u32 *array;
+};
+
+static void iter_pinctrl_assoc_prepare_message(void *message,
+					       u32 desc_index,
+					       const void *priv)
+{
+	struct scmi_msg_pinctrl_list_assoc *msg = message;
+	const struct scmi_pinctrl_ipriv *p = priv;
+
+	msg->identifier = cpu_to_le32(p->selector);
+	msg->flags = cpu_to_le32(p->type);
+	msg->index = cpu_to_le32(desc_index);
+}
+
+static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
+					   const void *response, void *priv)
+{
+	const struct scmi_resp_pinctrl_list_assoc *r = response;
+
+	st->num_returned = RETURNED(r->flags);
+	st->num_remaining = REMAINING(r->flags);
+
+	return 0;
+}
+
+static int
+iter_pinctrl_assoc_process_response(const struct scmi_protocol_handle *ph,
+				    const void *response,
+				    struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_resp_pinctrl_list_assoc *r = response;
+	struct scmi_pinctrl_ipriv *p = priv;
+
+	p->array[st->desc_index + st->loop_idx] =
+		le16_to_cpu(r->array[st->loop_idx]);
+
+	return 0;
+}
+
+static int scmi_pinctrl_list_associations(const struct scmi_protocol_handle *ph,
+					  u32 selector,
+					  enum scmi_pinctrl_selector_type type,
+					  u16 size, u32 *array)
+{
+	int ret;
+	void *iter;
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_pinctrl_assoc_prepare_message,
+		.update_state = iter_pinctrl_assoc_update_state,
+		.process_response = iter_pinctrl_assoc_process_response,
+	};
+	struct scmi_pinctrl_ipriv ipriv = {
+		.selector = selector,
+		.type = type,
+		.array = array,
+	};
+
+	if (!array || !size || type == PIN_TYPE)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_validate_id(ph, selector, type);
+	if (ret)
+		return ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, size,
+					    PINCTRL_LIST_ASSOCIATIONS,
+					    sizeof(struct scmi_msg_pinctrl_list_assoc),
+					    &ipriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	return ph->hops->iter_response_run(iter);
+}
+
+struct scmi_settings_get_ipriv {
+	u32 selector;
+	enum scmi_pinctrl_selector_type type;
+	bool get_all;
+	enum scmi_pinctrl_conf_type *config_types;
+	u32 *config_values;
+};
+
+static void
+iter_pinctrl_settings_get_prepare_message(void *message, u32 desc_index,
+					  const void *priv)
+{
+	struct scmi_msg_settings_get *msg = message;
+	const struct scmi_settings_get_ipriv *p = priv;
+	u32 attributes;
+
+	attributes = FIELD_PREP(SELECTOR_MASK, p->type);
+
+	if (p->get_all) {
+		attributes |= FIELD_PREP(CONFIG_FLAG_MASK, 1) |
+			FIELD_PREP(SKIP_CONFIGS_MASK, desc_index);
+	} else {
+		attributes |= FIELD_PREP(CONFIG_TYPE_MASK, p->config_types[0]);
+	}
+
+	msg->attributes = cpu_to_le32(attributes);
+	msg->identifier = cpu_to_le32(p->selector);
+}
+
+static int
+iter_pinctrl_settings_get_update_state(struct scmi_iterator_state *st,
+				       const void *response, void *priv)
+{
+	const struct scmi_resp_settings_get *r = response;
+	struct scmi_settings_get_ipriv *p = priv;
+
+	if (p->get_all) {
+		st->num_returned = le32_get_bits(r->num_configs, GENMASK(7, 0));
+		st->num_remaining = le32_get_bits(r->num_configs, GENMASK(31, 24));
+	} else {
+		st->num_returned = 1;
+		st->num_remaining = 0;
+	}
+
+	return 0;
+}
+
+static int
+iter_pinctrl_settings_get_process_response(const struct scmi_protocol_handle *ph,
+					   const void *response,
+					   struct scmi_iterator_state *st,
+					   void *priv)
+{
+	const struct scmi_resp_settings_get *r = response;
+	struct scmi_settings_get_ipriv *p = priv;
+	u32 type = le32_get_bits(r->configs[st->loop_idx * 2], GENMASK(7, 0));
+	u32 val = le32_to_cpu(r->configs[st->loop_idx * 2 + 1]);
+
+	if (p->get_all) {
+		p->config_types[st->desc_index + st->loop_idx] = type;
+	} else {
+		if (p->config_types[0] != type)
+			return -EINVAL;
+	}
+
+	p->config_values[st->desc_index + st->loop_idx] = val;
+
+	return 0;
+}
+
+static int
+scmi_pinctrl_settings_get(const struct scmi_protocol_handle *ph, u32 selector,
+			  enum scmi_pinctrl_selector_type type,
+			  enum scmi_pinctrl_conf_type config_type,
+			  u32 *config_value, bool get_all)
+{
+	int ret;
+	void *iter;
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_pinctrl_settings_get_prepare_message,
+		.update_state = iter_pinctrl_settings_get_update_state,
+		.process_response = iter_pinctrl_settings_get_process_response,
+	};
+	struct scmi_settings_get_ipriv ipriv = {
+		.selector = selector,
+		.type = type,
+		.get_all = get_all,
+		.config_types = &config_type,
+		.config_values = config_value,
+	};
+
+	if (!config_value || type == FUNCTION_TYPE)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_validate_id(ph, selector, type);
+	if (ret)
+		return ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, SCMI_PIN_OEM_END,
+					    PINCTRL_SETTINGS_GET,
+					    sizeof(struct scmi_msg_settings_get),
+					    &ipriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	return ph->hops->iter_response_run(iter);
+}
+
+static int scmi_pinctrl_settings_get_one(const struct scmi_protocol_handle *ph,
+					 u32 selector,
+					 enum scmi_pinctrl_selector_type type,
+					 enum scmi_pinctrl_conf_type config_type,
+					 u32 *config_value)
+{
+	return scmi_pinctrl_settings_get(ph, selector, type, config_type,
+					 config_value, false);
+}
+
+static int scmi_pinctrl_settings_get_all(const struct scmi_protocol_handle *ph,
+					 u32 selector,
+					 enum scmi_pinctrl_selector_type type,
+					 enum scmi_pinctrl_conf_type config_type,
+					 u32 *config_value)
+{
+	return scmi_pinctrl_settings_get(ph, selector, type, config_type,
+					 config_value, true);
+}
+
+static int
+scmi_pinctrl_settings_conf(const struct scmi_protocol_handle *ph,
+			   u32 selector,
+			   enum scmi_pinctrl_selector_type type,
+			   u32 nr_configs,
+			   enum scmi_pinctrl_conf_type *config_type,
+			   u32 *config_value)
+{
+	struct scmi_xfer *t;
+	struct scmi_msg_settings_conf *tx;
+	u32 attributes;
+	int ret, i;
+	u32 configs_in_chunk, conf_num = 0;
+	u32 chunk;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+
+	if (!config_type || !config_value || type == FUNCTION_TYPE)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_validate_id(ph, selector, type);
+	if (ret)
+		return ret;
+
+	configs_in_chunk = (max_msg_size - sizeof(*tx)) / (sizeof(__le32) * 2);
+	while (conf_num < nr_configs) {
+		chunk = (nr_configs - conf_num > configs_in_chunk) ?
+			configs_in_chunk : nr_configs - conf_num;
+
+		ret = ph->xops->xfer_get_init(ph, PINCTRL_SETTINGS_CONFIGURE,
+					      sizeof(*tx) +
+					      chunk * 2 * sizeof(__le32), 0, &t);
+		if (ret)
+			break;
+
+		tx = t->tx.buf;
+		tx->identifier = cpu_to_le32(selector);
+		tx->function_id = cpu_to_le32(0xFFFFFFFF);
+		attributes = FIELD_PREP(GENMASK(1, 0), type) |
+			FIELD_PREP(GENMASK(9, 2), chunk);
+		tx->attributes = cpu_to_le32(attributes);
+
+		for (i = 0; i < chunk; i++) {
+			tx->configs[i * 2] =
+				cpu_to_le32(config_type[conf_num + i]);
+			tx->configs[i * 2 + 1] =
+				cpu_to_le32(config_value[conf_num + i]);
+		}
+
+		ret = ph->xops->do_xfer(ph, t);
+
+		ph->xops->xfer_put(ph, t);
+
+		if (ret)
+			break;
+
+		conf_num += chunk;
+	}
+
+	return ret;
+}
+
+static int scmi_pinctrl_function_select(const struct scmi_protocol_handle *ph,
+					u32 group,
+					enum scmi_pinctrl_selector_type type,
+					u32 function_id)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_settings_conf *tx;
+	u32 attributes;
+
+	ret = scmi_pinctrl_validate_id(ph, group, type);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, PINCTRL_SETTINGS_CONFIGURE,
+				      sizeof(*tx), 0, &t);
+	if (ret)
+		return ret;
+
+	tx = t->tx.buf;
+	tx->identifier = cpu_to_le32(group);
+	tx->function_id = cpu_to_le32(function_id);
+	attributes = FIELD_PREP(GENMASK(1, 0), type) | BIT(10);
+	tx->attributes = cpu_to_le32(attributes);
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
+				     u32 identifier,
+				     enum scmi_pinctrl_selector_type type,
+				     enum scmi_pinctrl_protocol_cmd cmd)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_request *tx;
+
+	if (type == FUNCTION_TYPE)
+		return -EINVAL;
+
+	if (cmd != PINCTRL_REQUEST && cmd != PINCTRL_RELEASE)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_validate_id(ph, identifier, type);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, cmd, sizeof(*tx), 0, &t);
+	if (ret)
+		return ret;
+
+	tx = t->tx.buf;
+	tx->identifier = cpu_to_le32(identifier);
+	tx->flags = cpu_to_le32(type);
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_pinctrl_pin_request(const struct scmi_protocol_handle *ph,
+				    u32 pin)
+{
+	return scmi_pinctrl_request_free(ph, pin, PIN_TYPE, PINCTRL_REQUEST);
+}
+
+static int scmi_pinctrl_pin_free(const struct scmi_protocol_handle *ph, u32 pin)
+{
+	return scmi_pinctrl_request_free(ph, pin, PIN_TYPE, PINCTRL_RELEASE);
+}
+
+static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
+				       u32 selector,
+				       struct scmi_group_info *group)
+{
+	int ret;
+
+	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
+				      &group->nr_pins);
+	if (ret)
+		return ret;
+
+	if (!group->nr_pins) {
+		dev_err(ph->dev, "Group %d has 0 elements", selector);
+		return -ENODATA;
+	}
+
+	group->group_pins = kmalloc_array(group->nr_pins,
+					  sizeof(*group->group_pins),
+					  GFP_KERNEL);
+	if (!group->group_pins)
+		return -ENOMEM;
+
+	ret = scmi_pinctrl_list_associations(ph, selector, GROUP_TYPE,
+					     group->nr_pins, group->group_pins);
+	if (ret) {
+		kfree(group->group_pins);
+		return ret;
+	}
+
+	group->present = true;
+	return 0;
+}
+
+static int scmi_pinctrl_get_group_name(const struct scmi_protocol_handle *ph,
+				       u32 selector, const char **name)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	if (!name)
+		return -EINVAL;
+
+	if (selector >= pi->nr_groups || pi->nr_groups == 0)
+		return -EINVAL;
+
+	if (!pi->groups[selector].present) {
+		int ret;
+
+		ret = scmi_pinctrl_get_group_info(ph, selector,
+						  &pi->groups[selector]);
+		if (ret)
+			return ret;
+	}
+
+	*name = pi->groups[selector].name;
+
+	return 0;
+}
+
+static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
+				       u32 selector, const u32 **pins,
+				       u32 *nr_pins)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	if (!pins || !nr_pins)
+		return -EINVAL;
+
+	if (selector >= pi->nr_groups || pi->nr_groups == 0)
+		return -EINVAL;
+
+	if (!pi->groups[selector].present) {
+		int ret;
+
+		ret = scmi_pinctrl_get_group_info(ph, selector,
+						  &pi->groups[selector]);
+		if (ret)
+			return ret;
+	}
+
+	*pins = pi->groups[selector].group_pins;
+	*nr_pins = pi->groups[selector].nr_pins;
+
+	return 0;
+}
+
+static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
+					  u32 selector,
+					  struct scmi_function_info *func)
+{
+	int ret;
+
+	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
+				      &func->nr_groups);
+	if (ret)
+		return ret;
+
+	if (!func->nr_groups) {
+		dev_err(ph->dev, "Function %d has 0 elements", selector);
+		return -ENODATA;
+	}
+
+	func->groups = kmalloc_array(func->nr_groups, sizeof(*func->groups),
+				     GFP_KERNEL);
+	if (!func->groups)
+		return -ENOMEM;
+
+	ret = scmi_pinctrl_list_associations(ph, selector, FUNCTION_TYPE,
+					     func->nr_groups, func->groups);
+	if (ret) {
+		kfree(func->groups);
+		return ret;
+	}
+
+	func->present = true;
+	return 0;
+}
+
+static int scmi_pinctrl_get_function_name(const struct scmi_protocol_handle *ph,
+					  u32 selector, const char **name)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	if (!name)
+		return -EINVAL;
+
+	if (selector >= pi->nr_functions || pi->nr_functions == 0)
+		return -EINVAL;
+
+	if (!pi->functions[selector].present) {
+		int ret;
+
+		ret = scmi_pinctrl_get_function_info(ph, selector,
+						     &pi->functions[selector]);
+		if (ret)
+			return ret;
+	}
+
+	*name = pi->functions[selector].name;
+	return 0;
+}
+
+static int
+scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
+				 u32 selector, u32 *nr_groups,
+				 const u32 **groups)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	if (!groups || !nr_groups)
+		return -EINVAL;
+
+	if (selector >= pi->nr_functions || pi->nr_functions == 0)
+		return -EINVAL;
+
+	if (!pi->functions[selector].present) {
+		int ret;
+
+		ret = scmi_pinctrl_get_function_info(ph, selector,
+						     &pi->functions[selector]);
+		if (ret)
+			return ret;
+	}
+
+	*groups = pi->functions[selector].groups;
+	*nr_groups = pi->functions[selector].nr_groups;
+
+	return 0;
+}
+
+static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
+				u32 selector, u32 group)
+{
+	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
+}
+
+static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
+				     u32 selector, struct scmi_pin_info *pin)
+{
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	if (ret)
+		return ret;
+
+	pin->present = true;
+	return 0;
+}
+
+static int scmi_pinctrl_get_pin_name(const struct scmi_protocol_handle *ph,
+				     u32 selector, const char **name)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	if (!name)
+		return -EINVAL;
+
+	if (selector >= pi->nr_pins)
+		return -EINVAL;
+
+	if (!pi->pins[selector].present) {
+		int ret;
+
+		ret = scmi_pinctrl_get_pin_info(ph, selector,
+						&pi->pins[selector]);
+		if (ret)
+			return ret;
+	}
+
+	*name = pi->pins[selector].name;
+
+	return 0;
+}
+
+static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
+				 u32 selector,
+				 enum scmi_pinctrl_selector_type type,
+				 const char **name)
+{
+	switch (type) {
+	case PIN_TYPE:
+		return scmi_pinctrl_get_pin_name(ph, selector, name);
+	case GROUP_TYPE:
+		return scmi_pinctrl_get_group_name(ph, selector, name);
+	case FUNCTION_TYPE:
+		return scmi_pinctrl_get_function_name(ph, selector, name);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
+	.count_get = scmi_pinctrl_count_get,
+	.name_get = scmi_pinctrl_name_get,
+	.group_pins_get = scmi_pinctrl_group_pins_get,
+	.function_groups_get = scmi_pinctrl_function_groups_get,
+	.mux_set = scmi_pinctrl_mux_set,
+	.settings_get_one = scmi_pinctrl_settings_get_one,
+	.settings_get_all = scmi_pinctrl_settings_get_all,
+	.settings_conf = scmi_pinctrl_settings_conf,
+	.pin_request = scmi_pinctrl_pin_request,
+	.pin_free = scmi_pinctrl_pin_free,
+};
+
+static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	int ret;
+	u32 version;
+	struct scmi_pinctrl_info *pinfo;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_dbg(ph->dev, "Pinctrl Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	ret = scmi_pinctrl_attributes_get(ph, pinfo);
+	if (ret)
+		return ret;
+
+	pinfo->pins = devm_kcalloc(ph->dev, pinfo->nr_pins,
+				   sizeof(*pinfo->pins), GFP_KERNEL);
+	if (!pinfo->pins)
+		return -ENOMEM;
+
+	pinfo->groups = devm_kcalloc(ph->dev, pinfo->nr_groups,
+				     sizeof(*pinfo->groups), GFP_KERNEL);
+	if (!pinfo->groups)
+		return -ENOMEM;
+
+	pinfo->functions = devm_kcalloc(ph->dev, pinfo->nr_functions,
+					sizeof(*pinfo->functions), GFP_KERNEL);
+	if (!pinfo->functions)
+		return -ENOMEM;
+
+	pinfo->version = version;
+
+	return ph->set_priv(ph, pinfo, version);
+}
+
+static int scmi_pinctrl_protocol_deinit(const struct scmi_protocol_handle *ph)
+{
+	int i;
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+
+	for (i = 0; i < pi->nr_groups; i++) {
+		if (pi->groups[i].present) {
+			kfree(pi->groups[i].group_pins);
+			pi->groups[i].present = false;
+		}
+	}
+
+	for (i = 0; i < pi->nr_functions; i++) {
+		if (pi->functions[i].present) {
+			kfree(pi->functions[i].groups);
+			pi->functions[i].present = false;
+		}
+	}
+
+	return 0;
+}
+
+static const struct scmi_protocol scmi_pinctrl = {
+	.id = SCMI_PROTOCOL_PINCTRL,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_pinctrl_protocol_init,
+	.instance_deinit = &scmi_pinctrl_protocol_deinit,
+	.ops = &pinctrl_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+};
+DEFINE_SCMI_PROTOCOL_REGISTER_UNREGISTER(pinctrl, scmi_pinctrl)
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 3e91536a77a3..c02cbfd2bb03 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -355,6 +355,7 @@ void __exit scmi_##name##_unregister(void)			\
 DECLARE_SCMI_REGISTER_UNREGISTER(base);
 DECLARE_SCMI_REGISTER_UNREGISTER(clock);
 DECLARE_SCMI_REGISTER_UNREGISTER(perf);
+DECLARE_SCMI_REGISTER_UNREGISTER(pinctrl);
 DECLARE_SCMI_REGISTER_UNREGISTER(power);
 DECLARE_SCMI_REGISTER_UNREGISTER(reset);
 DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index b807141acc14..e59c48c1aed6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -737,6 +737,88 @@ struct scmi_powercap_proto_ops {
 					  u32 *power_thresh_high);
 };
 
+enum scmi_pinctrl_selector_type {
+	PIN_TYPE = 0,
+	GROUP_TYPE,
+	FUNCTION_TYPE,
+};
+
+enum scmi_pinctrl_conf_type {
+	SCMI_PIN_DEFAULT = 0,
+	SCMI_PIN_BIAS_BUS_HOLD = 1,
+	SCMI_PIN_BIAS_DISABLE = 2,
+	SCMI_PIN_BIAS_HIGH_IMPEDANCE = 3,
+	SCMI_PIN_BIAS_PULL_UP = 4,
+	SCMI_PIN_BIAS_PULL_DEFAULT = 5,
+	SCMI_PIN_BIAS_PULL_DOWN = 6,
+	SCMI_PIN_DRIVE_OPEN_DRAIN = 7,
+	SCMI_PIN_DRIVE_OPEN_SOURCE = 8,
+	SCMI_PIN_DRIVE_PUSH_PULL = 9,
+	SCMI_PIN_DRIVE_STRENGTH = 10,
+	SCMI_PIN_INPUT_DEBOUNCE = 11,
+	SCMI_PIN_INPUT_MODE = 12,
+	SCMI_PIN_PULL_MODE = 13,
+	SCMI_PIN_INPUT_VALUE = 14,
+	SCMI_PIN_INPUT_SCHMITT = 15,
+	SCMI_PIN_LOW_POWER_MODE = 16,
+	SCMI_PIN_OUTPUT_MODE = 17,
+	SCMI_PIN_OUTPUT_VALUE = 18,
+	SCMI_PIN_POWER_SOURCE = 19,
+	SCMI_PIN_SLEW_RATE = 20,
+	SCMI_PIN_OEM_START = 192,
+	SCMI_PIN_OEM_END = 255,
+};
+
+/**
+ * struct scmi_pinctrl_proto_ops - represents the various operations provided
+ * by SCMI Pinctrl Protocol
+ *
+ * @count_get: returns count of the registered elements in given type
+ * @name_get: returns name by index of given type
+ * @group_pins_get: returns the set of pins, assigned to the specified group
+ * @function_groups_get: returns the set of groups, assigned to the specified
+ *	function
+ * @mux_set: set muxing function for groups of pins
+ * @settings_get_one: returns one configuration parameter for pin or group
+ *	specified by config_type
+ * @settings_get_all: returns all configuration parameters for pin or group
+ * @settings_conf: sets the configuration parameter for pin or group
+ * @pin_request: aquire pin before selecting mux setting
+ * @pin_free: frees pin, acquired by request_pin call
+ */
+struct scmi_pinctrl_proto_ops {
+	int (*count_get)(const struct scmi_protocol_handle *ph,
+			 enum scmi_pinctrl_selector_type type);
+	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
+			enum scmi_pinctrl_selector_type type,
+			const char **name);
+	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
+			      u32 selector, const unsigned int **pins,
+			      unsigned int *nr_pins);
+	int (*function_groups_get)(const struct scmi_protocol_handle *ph,
+				   u32 selector, unsigned int *nr_groups,
+				   const unsigned int **groups);
+	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
+		       u32 group);
+	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type,
+				enum scmi_pinctrl_conf_type config_type,
+				u32 *config_value);
+	int (*settings_get_all)(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type,
+				enum scmi_pinctrl_conf_type config_type,
+				u32 *config_value);
+	int (*settings_conf)(const struct scmi_protocol_handle *ph,
+			     u32 selector, enum scmi_pinctrl_selector_type type,
+			     unsigned int nr_configs,
+			     enum scmi_pinctrl_conf_type *config_type,
+			     u32 *config_value);
+	int (*pin_request)(const struct scmi_protocol_handle *ph, u32 pin);
+	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
+};
+
 /**
  * struct scmi_notify_ops  - represents notifications' operations provided by
  * SCMI core
@@ -844,6 +926,7 @@ enum scmi_std_protocol {
 	SCMI_PROTOCOL_RESET = 0x16,
 	SCMI_PROTOCOL_VOLTAGE = 0x17,
 	SCMI_PROTOCOL_POWERCAP = 0x18,
+	SCMI_PROTOCOL_PINCTRL = 0x19,
 };
 
 enum scmi_system_events {

-- 
2.37.1


