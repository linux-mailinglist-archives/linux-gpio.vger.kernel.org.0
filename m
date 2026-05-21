Return-Path: <linux-gpio+bounces-37235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBjMJ5dvDmq8+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-37235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:36:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA559E215
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7622A3082CE3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 02:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA6C3750D6;
	Thu, 21 May 2026 02:35:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EF375F69;
	Thu, 21 May 2026 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330914; cv=fail; b=MUM28MYtEq+CLZOcWz3wWT1TPOuD5Omcg+MhXK7Lev6lbljAECfaKJS8f4YT3zLGL9fBZz5qf2hQR2DOTSxUAeUL93WcwijuRBWYQYGmdLJamTayuM1n09BaK/qJ0VRDf/2p+MAhz8E/e5JGLEEmgfqAqtd51BjzDjPPLAtxIcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330914; c=relaxed/simple;
	bh=SZBeXYDC5PzaZ92+yU+guTgbz1jf/RyJcMj8mXeqLlE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UA6ik58On5HTOLiWUrnqAFRKb88PBSkxTJVV+f1Iyaikd2REc6z29Badm8kI0QpYAxYoEouJBrQs6PrW3n86RYpKQ1TbFOqJCeUNXb3wcpuQHQHpe93cZDr0aeYQySvjXzyi7aEiBwIhPqx0cE4pHrMYnSGXhQYf9jNXRZk/4Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUA6b/tnzLJ9nqmqeY5y6NX8ngDwL03HMvwhOzSeEj/dyRJ+vNoMREhzp8PuJuZp5707JZJNpm1HCq/OB9b5KgX2+Z1CH/jfBNFh6vNbVEoAcnlVeUgL7E0GMnBYr7ctnbdXJO/uuhKxARlh6m/Ub8p7L7c7a9dSDZOdT+Gy3HG5BaHbNXs5X4ctQppgNUOMl2rUVTm3/Yj35a3CL+ifK1ufQt+JrMiPZ063iJs3wUZk1DX7GsmgTkBV9xjM0GWNlj9/ApUtldg5luh1GVxs5aZCuQgGzh/seP6ULg7EYU1AZ3yIa3v6kXcau3/5o7tU1Axfq/yuspG38n7hLkgYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggB94krP4t5rUd7NZUo4kmzQ+M/f75xT7KXs8/sKEdY=;
 b=WneEv22xn1uUSMCvlp6X0WIpbSpIg4YnlUgtPEMYDzZ32EE4kD70AwLjQK9MCfl1mp9j/2t/B5csJOhPE0TmW/FAZ/BuCV9PdHvZDhFEzI6n1yBOy0hNex/EN8mnCiuFPA6bCxxl7eEy8+MhG7uQZMnWtnhiZ2RQveCCFcJG4uQMHO77ust+os7xYapyrxmwVa44ToMzCP48uQ//IRx8ygu4YlGH5wL6X4EmGQhgPjgKfy2rQQJDDUuHuau03osjKpT5vEWrxkb1Yyye/DLhWfp0edoLJ6ApQVXDg6ugzmYLUejqnsI7pP0RuWfe84qzvvW0ZBJaOTqa0uKuSLbgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0596.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 02:34:57 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 02:34:57 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
Date: Thu, 21 May 2026 10:34:49 +0800
Subject: [PATCH 1/2] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-lecarc-acpi-ids-v1-1-ae0ae90b2817@lecomputing.com>
References: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
In-Reply-To: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
To: Hoan Tran <hoan@os.amperecomputing.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org, 
 Thomas Lin <thomas_lin@lecomputing.com>, braden_zhang@lecomputing.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779330894; l=833;
 i=thomas_lin@lecomputing.com; s=20260518; h=from:subject:message-id;
 bh=SZBeXYDC5PzaZ92+yU+guTgbz1jf/RyJcMj8mXeqLlE=;
 b=SOMZfhNWnbtEUPh9wfkVB8gsC3q3rA3/lZgGUdOaXOyt05dk/Y477ey3wWRgtJ9RxkdH89Zhp
 FEjY8b7OtuLCKLfsrE0ZiQtTM80x1EHQ8FOkarpAVKAOKQoBnpOV7hF
X-Developer-Key: i=thomas_lin@lecomputing.com; a=ed25519;
 pk=d7V8RTvs1pxSx8mPaXNAe9XWo7K/eHkcVBWTjw1rwrQ=
X-ClientProxiedBy: SH0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::32) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0596:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bcbcc2b-8b39-4a54-c625-08deb6e18bf2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2wTSJEyA1rDpGiCxTZQ0QDV9iTserSTOqyDseKsVtXlQOpdHQWhaWvbfPdKDldhDEGgTZfvKS2g9O+aPD4gAdcL4DTPUC20SC87btJY1DKVyRrFQlzZJwLaVcV8v4qDiXKmQNb1YpBIeYuqVzDKD+cDaCqYCpt8IokCAA9vPAw/fuYXa70bj7+XL4nejUj7R8H47BizcvcEHfUvjdb7ToLpgldeXb5ae1bvUP0V/iLPUd9wRYLIi/cUeCORl65YNj2o+Af7u6Tq3B2YwgriTklimR1EDB96frZtAO0ouuo9HxqwTWT5vg+A8jourg+h7FmbSej5KL1AH+g8JVD09dZA52WKAToY5lvVshle+CoffoGlL/rgfSdiT9MjeFaIC1tohvO/NkFIGlyEZ2rujLcyfP7gPHLDQZGGw+n+DaP6dC3/6kOFxra6cfBTLmRgWupbU6dnhRe8HwSouYRMolyna3VVOpFXohX07EpaqFnQRqJ7jXdmSup/A2WaH8HmmsjJVU7uAmipEVip/XqW/hTZjL/gR1WcL0RCh45AQgWojoX8wTkaVjxpSk44vuzCB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE5mRmRkZjVpK2ZsUGM5U3hyUWZWcWxadlYvc2d2UjNVTnBUQnYxUi9QSnY2?=
 =?utf-8?B?NTIrTXB2Tzh0M2NObHFNZmJOcUNaeWVYaFNHOTgxTGFYeUhZYnBSNkNYd1E3?=
 =?utf-8?B?bWxtSkNSdDJkWGo4ZmhyanRhTXZ2YkpRRGc2cTFVUlp2Rk5ZZDJFdlQxOVJI?=
 =?utf-8?B?QkdNMFdnc2M0UHZxYnNYOS9qMXl0aENzaFlYZVVTRmF2Uk1Hdm1vSnF6eVg5?=
 =?utf-8?B?SGxxYzkwazMrRWp4R2pBaG5lRmdxUnFNS2ZaSzFNT1RXcitmTWVvdWdIbCs3?=
 =?utf-8?B?WDVwM0gyeDNWbExxTy9pdmt3OGZGOWtMaGhNZ2lMeXBVRVM1bk5CZ3NDUThz?=
 =?utf-8?B?T2tlZ1JjcTVXNGpwYnNWR01uRDgwZk10Z0kvb29VaFhRTGZ5WWJ4UWcyWWpT?=
 =?utf-8?B?YmZWWjdVYmhUQXBqekpYTTJiOVkrd1YwUDlyUFdzcnpueTBMdmtIendBWGJH?=
 =?utf-8?B?aVlTSmhGYzFaT1U4YlQzRTFPRFZVcXRBZXhBU3ZuZDAzdlRCRlhtQnJMNXl6?=
 =?utf-8?B?Qyt1K3B2NnA2N2FPTDdMN3NzUmxkOGlTdGdhREwyb091dXBqeXQrRUtpT2NT?=
 =?utf-8?B?Q2JTbkkwM0pielB2Z0huMkViZUJYaENPVFFGMTRTTGlFRWhiejBwd1VNVVZh?=
 =?utf-8?B?algwdEhUNjkvRlFGaUVlSi9OK3NtMHhQNVBQMExoWXBUc1k0SkQzUnVySDJR?=
 =?utf-8?B?UVQrOHVqdFlyRW5qejdUNWU5OEpOWTlCRW5ORmJReXh3OCt6eWYzM3dubGJk?=
 =?utf-8?B?dVhCVndicGJUR1dYWDUwdi8xMlVEWG1DZ1RveFJjSktLZGpET29CRkh6OG4y?=
 =?utf-8?B?RlRWNWZ1NmlCUXhlcE50UXdhTDhqNWlqaDZGZmhDNUIyaVRrMllxTDk5Um9J?=
 =?utf-8?B?UWN5MFkyRWlvUzJyTmtZZXlpS1FTZkZJdEl4eklWUE9RY25RclFIWlgyRkVz?=
 =?utf-8?B?KzlCNEs0dGZHR0d3ZjY2aENJRjZsV2VwalZBbEp2K0QweWxJQ2xNOG4raFRk?=
 =?utf-8?B?M2p0UHNsMDlNOTYybkhrZ3d4a0hjY1VNVUoybGVOSHN4K01ESGZtT0w1c1J4?=
 =?utf-8?B?a3NBV3VvRzVxdndhSVRtVjZLYnpMTldKc2cydEdybVVwbzJ2clpKRDdNOURJ?=
 =?utf-8?B?NVlBclRHUmN4clVtQ3FweStDS3MvaWdzT0FVUTg3OWNoejFwOUxSTE45V2d6?=
 =?utf-8?B?Y3J5WC94N1gzam5iaFAySHRmbFJVQzRINUJwbEg5M200Q0svYlJQV2JjczVu?=
 =?utf-8?B?OEd1QW9IMEhHT1RacEJNV3pKRVRhVGZxcVR4QjNTanp3NmJqcXBPNGNWU1dX?=
 =?utf-8?B?cE1IUlZVQk1aeStjcTJ4eGtoaWIyeVYvam5ZQlRnWGs1TVhoUGwzVDdhR0d5?=
 =?utf-8?B?bVc2YWNlaEprMHRXT1l4VlhUVWNJUGR6bU0wZk1TNDY1NTJ6S0VvTjY1SkZy?=
 =?utf-8?B?NWdUVFBhcFczVGNDNU15c3EzeUUwL1F5MzFxUUk4cmNzZ3JuczB3SUdWRnNZ?=
 =?utf-8?B?YWh3Nndvc0hIVEx3UCtyNEFPdjRGRDY5R3hXOFExSng5Y0w2eUVrbHFTTWxS?=
 =?utf-8?B?VEJNczZXM0pEYzdqajN4djBYbXUxbmdwNWtPdmM4N2ZKdysvdTdrc2JXQWRa?=
 =?utf-8?B?YnVOR25TeFF2aWp2T1ZtZForNXFjZ3NEbFhSa3BoNTdKSGc4QThsbXZvZkdk?=
 =?utf-8?B?OVY3a3R3RnY3ZHZycmlXdVlheUgxQXNicUxvTHJjQ0VmUFl6WEVqczNwdS96?=
 =?utf-8?B?cEdEaXVKbDdYS3FBMlZhNTM3Wm9sY2ZvL1NmMFBnV2NxMU53Y0thVHFvNW9B?=
 =?utf-8?B?eXJoK1R3NHJyQUJSeGd2YzBsWlBpOHZ5THkwck9PcGtSNCs4U0V4QkZqV1FB?=
 =?utf-8?B?NFdRRVA3Z2hVQ21CLzZrS2Uza21kSTAvVFRUZVE2MnpFaENLWlFlSVpndTky?=
 =?utf-8?B?QXNlUjNzRVI0Vitlekw4amcrVk5jS2lTTHZqRHVJUzBTczNSajNuQmkxNGFT?=
 =?utf-8?B?Z3Q2KzBvbGRCUlRBVWkxNithUlY3eEEvNk90eDg5ckVzT2ROWWVWTWN0dWJB?=
 =?utf-8?B?SlNUNHJmREE0bnhUelJBOEQwMHBpUC94N09UckZRYklrNGp0blhaMDB5aDdQ?=
 =?utf-8?B?OVphV0NaRDVKeUt4dUYyeUphTDBDRDVVVnR2NGpJbjVmbUlVWVhLRzNjY1hI?=
 =?utf-8?B?NWZrd2ZtRmk3MWRxOEZQemRGa3NSSkRPMUdqem4yVkxqRmFKa01UQVRlNEY0?=
 =?utf-8?B?TDUrZDQyVjc5RnRIWGdwa05VY0RMZ1ZsSzRCaEV1V3FGR0V4U2MvQ2dOK1RN?=
 =?utf-8?B?U205QjQ5VEtxVTZZRTZxN2x4dExyVEhJM0plb0F0RndMQUx0MmJYa1ZWQjlv?=
 =?utf-8?Q?+j8aP0/3rGan8KDI=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcbcc2b-8b39-4a54-c625-08deb6e18bf2
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 02:34:56.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eCdvsCesnmu0KcuvkHFtX97CL05B7PlkTHf5ChsDtmm8YVM9xOPS6raryMwZcSnJcKL1wwn9hvSb4gOrlWnq4Svyun3RhUIFlTQdcho57A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0596
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37235-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,lecomputing.com:mid,lecomputing.com:email]
X-Rspamd-Queue-Id: 06DA559E215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare
GPIO controller with V1 register offsets.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 15cebc8b5d66..c1f3d83a67c1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"APMC0D07", GPIO_REG_OFFSET_V1},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
 	{"FUJI200A", GPIO_REG_OFFSET_V1},
+	{"LECA0001", GPIO_REG_OFFSET_V1},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);

-- 
2.43.0


