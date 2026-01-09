Return-Path: <linux-gpio+bounces-30313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EDD08344
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2596C30B0EE1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B9A3590DD;
	Fri,  9 Jan 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="ekCmx+mm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023082.outbound.protection.outlook.com [40.93.201.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E973590CB;
	Fri,  9 Jan 2026 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950798; cv=fail; b=AZztUQIf/m7jpvcdfuBdpVnUbSE7IVNYrPeoZgc9hgfkb5f6MbQ2G0Hvrh6+3CZCaUv4S1dyi5sbt/NMoBot2a1ofAySdLwFA1FqBDJdnTYt6ow/s32CeeRfpjrEhGkuz6ba42OQLr7szNx31kBIw2MetKgHSZXCZR51myBaVzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950798; c=relaxed/simple;
	bh=NV2tZZbdyexsymDxIPAhePK1/5r37WIXUUneNvu7ljg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuadlWZFwBTLgPcWh2SGDn9Nv7Yf13rA1IS0rnJ0TIdz305dLLnpD/nDhHsuZxrto2Ab/FwO7crajIH8nXkgy8Wg6FuSNwvD3r22cCMhlPWTFbkvCY/UwwCYMFQOi9dYEeB+XsT4JxiHNUxSm++yY5QbSBjKpsUqaIxMm7vNH4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=ekCmx+mm; arc=fail smtp.client-ip=40.93.201.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjDGzZhffvrRPp0bsYNhZ43znFA2wVqPl//7by7IhKlwUb3hDyXKtp/hWd2+F0lrAl/A1XR0Zfw0gC7IjuBcdwdF1j4dPu9h5UbUatAMB81/G9wQ36/a1noyQs4zQnUGSO2072kJsPO5W82RgPtulvaUtTfyY68Bxg7F2he02u1s8yNgRzqQYB3AzlLm7xkCetUf6fkyzvV2l3IGeiDbMn/4sJhx3satszR/Qu04r0QUXaWMcTOFxmGgFZ4PWxnF5HmfYvxEi2bofwx6CvGL4fFH+4TGBe3EDZf6ZHaYpyM1BoTYd+NdrxFiWeZi13Ygygg490sJgpJ+1bVrHT1XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HA2sFoBNP6wVN+uTvij3TArnSAMx7o7u+fZs5fLfvQ=;
 b=sIt1CKB6fQIUZ4GckhwRcLG9BNRp4gT3bVLHQea/+CecMuoMJOYnoURw4bCL7OVzbUqTaZ1GvBmtUm9btkCd0l5dsxCfbps1CTTvGXD2/a+YQu1zSYY1r3HJet5IDSuwxBwqI6DdIpEf5ANYUHTuWCxGl2sMwIgn0gRtsZWq2aVPHBiWR2jxkQqP8R8mIDfzYQa/iu82/n0lrbNDOEP9ICxXo0bpIKMFRioO+9Iijhj8y4caPYoXgiDpM1Fdh/UJ6t1AfQRQryJ4YOExy/Zfge/nB6n9dFOQgTFsKmQPdCmSFTX00KvYVduoPQl+/p2AsoTII7vM6lYVUgcfIQl6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HA2sFoBNP6wVN+uTvij3TArnSAMx7o7u+fZs5fLfvQ=;
 b=ekCmx+mmPz6FXz5N2Oh/fVJel2CGNjvzwdJkQCdx946omEM7vCdJhcbFnoRXc4JKmjyYl+LoeA8weKYg7X3q8diZs000BEH3Y7T1kX6RlR32/RXIImqptCRoo/M8bkiga5tx4RJujknM7gWWa5Yi5xHCssSHmuS5nW/IcWu4Z4v0zsy92HhmrkiTaaDJs1QlHvhxIny3ZiDdmyQlk8FsbjjNvJzS/IUSsMP3egUIQ0fFIgR+80IzPmsCs1VdgUihEy8DmbXEzh1jFGuAO0JBujBqNBfGuGA5ZYqLn6WJD7F8XHfaEDfdQxB419VJMZaFMaWWKth+orWs2aLxe9B2fg==
Received: from CH0PR03CA0414.namprd03.prod.outlook.com (2603:10b6:610:11b::32)
 by PH7PR18MB5258.namprd18.prod.outlook.com (2603:10b6:510:246::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:26:30 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::76) by CH0PR03CA0414.outlook.office365.com
 (2603:10b6:610:11b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 09:26:29 +0000
From: Swark Yang <syang@axiado.com>
Date: Fri, 09 Jan 2026 01:26:07 -0800
Subject: [PATCH v2 2/2] gpio: cadence: Add support for edge-triggered
 interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-cadence-gpio-support-v2-2-fc1e28edf68a@axiado.com>
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589; i=syang@axiado.com;
 h=from:subject:message-id; bh=+Ei84sJkYh5IrNtOI64McozQSee+JmlnIaM3DQK3poY=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyEk4cOtEekLFp1IG1vUlWS35TfsXekbcvOfrma0Fjt1
 HhpyxL7jlIWBjEOBlkxRZavOt/yT+Zq3+vcu7IUZg4rE8gQBi5OAZhIdSwjwxpegbvSLW7BDzpu
 3JY/I3z23P9ZT8zClL1maHxX+rYijJPhn/Yzq6U7TtgudJz7qZulxXnbp3uGuufjl156XjrdWe7
 Se3YA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|PH7PR18MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: d2268bc2-8653-48f5-f329-08de4f612c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWN0YnVmTlJIeklYQU9pRHhxcFdHLzFOWFhieG9BOGpjbTRzZTQzYUoxMGxV?=
 =?utf-8?B?WWRmbE5XdW93MS9ic0N1Lzg5YnVJNEUreUNtV0Z6Q2JZVFovSmNqZkdubVQw?=
 =?utf-8?B?aERWRkxmLzMzbmtIUHM5bldnNzdSbm43RXNDL1NhOVJoQkFYaFJrNUlabXNY?=
 =?utf-8?B?cmFMVUhRZWRJTitESG9kNzhCSTJqb1pEV3VWcDVGR2ZsTEgvMCtMS3gybjVj?=
 =?utf-8?B?aDkyR3BmRmQ2QkgwNTB4SGhZT1N2V3VZRVFUQ2h1b0k2R1V5RktJY05YUExT?=
 =?utf-8?B?OEhIMGVJVXdHUnZDaEpKM3RBaUlMQzRPUGozVUxuUzQvUFJKbUF5azZpWjYz?=
 =?utf-8?B?TGVwUHNPZ28xSEUyd3Yram50Yml4eXNkTzJCTzBDZmlaV3ZqSExVOWJiaWVN?=
 =?utf-8?B?Vy9oampUYjJpMFBkb0JKZktvVExnTFMyT3FKOHdVOWMyUmxYcnFIREVYb3BY?=
 =?utf-8?B?QjgxdHd0RTgxM0ZQVzVpQ1Z6OG10QXBIbUN4N1FkeTV3SXk0NVJvUnhzc0xI?=
 =?utf-8?B?WVdOcEJFTXpuNkIrQ0x6OGx1ZlV2enM0OFprR3NJVndrN1JBbHJWelBwVUdp?=
 =?utf-8?B?OTdRSVFqZVFyeHBNeXRQYVVyUWg4UGR1cHEvRjF6TWR5QjJhdzJJNUFSUWVm?=
 =?utf-8?B?aVdhTlc0VGFiS2xEdEhXamNlSEZhTkxYellablpabHE0cUhTYnNLdlkvWUFq?=
 =?utf-8?B?b0dPSXBzVVJBUlZxa2I0TFdxbUNWTTBvVlpESEFzY0wxS25FRW1UZjRhUVFv?=
 =?utf-8?B?NUluWml2YmN5akVBS3c0aFJvTWVmbVMxNG15WFdxbUJPMUszVndGL0NxZzBq?=
 =?utf-8?B?TXYwUHdjWi9UWU9JTjVCV2hHOVJxQmZEb1NEVjZGTXhOdm8vbGlBSmFmSWkv?=
 =?utf-8?B?MjVkQ3ZkL1ZzS0VHTDlVWUoxM3cwNVArb0Q5WUVzdUpTd0w2M3I0Z3h5TlFY?=
 =?utf-8?B?YktydEJyWkpEYjB3SFlqdHpPY3BKS25Da0hpaWY0bkhzL3B0eHZUOUVqNXBj?=
 =?utf-8?B?dXRzVzlmMjNZM2dZT3g3NzVabU8wYjh6clJnVk43WFY1b3k5Wm1VTEhkcWRF?=
 =?utf-8?B?ejlMczMwTkZhUmJ5YzFveHppK3lPaC9xVWhoby9USHFzNGVlQ01KaDVYR2c2?=
 =?utf-8?B?NmwyMlBtZjh4UGJvSXM0MlZFam9tY2RrMk5QOC9Qa3VrbUhJVDA5dTB3MG94?=
 =?utf-8?B?WTJ6RWFLa0RJa1NzNDc0eXNlMXZwaGs4TnZyRVhQVm9XSVFRNWhMT3ozRW53?=
 =?utf-8?B?S0dGQ2tRTURLM04zNjIrR3pjKzRqZnVaOGIrRVpzcWhIcG9sTFY1SFJUejNJ?=
 =?utf-8?B?K3lyd0xXa01JNWtXK1g1WnBPQ3kwSG90TGJPVEE3WWFsNUozZFNxZWFUbVRo?=
 =?utf-8?B?bzBaWThlRmc3RUVod3pWTDQxbnZock1JazRZZkQvd2VYMFBKSnZmM0hhUDF0?=
 =?utf-8?B?RzFMcUlvVzZQZUdobWF6eVFhejNzRWdKNWVqNHN0dnRwWjkwYlB2UWFWdzU3?=
 =?utf-8?B?L3MzT3NQZ1pVS2RPUk5KYUFNSlZrWTB2V1ZNR29JKzFGLzI5TnlzbTNiRisr?=
 =?utf-8?B?Y0g3SCtSTlZpUVpFei8rMm9OT1Nna0FrWHpmTXN4cVRaMXpzMXJFNk92ZitT?=
 =?utf-8?B?SDgyY3daWnVXa0c2L3FFRXk3Mmk0YjA1V1JzeFd0VldrWFBPaWNjQXRBMWY0?=
 =?utf-8?B?djRPVnVaSnQwWEc1anNjS0tTNEhrZmY2dFVneHR5YXZCc0hSdFhQaHlxbVha?=
 =?utf-8?B?ZXhFUm5HajRtdlVuQmVqOUVWaTJUSVdOaVIyN1I1TmRvYnM2S2w0VFluSmNo?=
 =?utf-8?B?MnAyeUNOWno4dlRJalRFNUIzNHRucGNOZGFmTkRRbm05RzlxZkdmbi9DaS8v?=
 =?utf-8?B?TCs1WkcreFNYQll4OFlEZGtVTlFjZDFVRVRKbFBJNm5wRG5waFVpYW5WSWxu?=
 =?utf-8?B?T1BBQ2cvZEQ3eGtuYXFqNGxzbDgrWHJydGVYdU11b2ZUVTY5S3N5VEcwcG9x?=
 =?utf-8?B?R1BTbHdzVVY5WVRZWFhRVU5saWpPSHlNd1BKUDMvZXN2UUU3Y0RtY0QxUDBy?=
 =?utf-8?B?MWVmRFlLdlFTTGhneUkzM1ZoakhScWphN2lpZDJEVngwSzBsWUtMSVg4TmRx?=
 =?utf-8?Q?q3ok=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:26:29.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2268bc2-8653-48f5-f329-08de4f612c04
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5258

From: Tzu-Hao Wei <twei@axiado.com>

The Cadence GPIO controller (CDNS IP6508) supports edge-triggered
interrupts (rising, falling, and both) via IRQ_TYPE, IRQ_VALUE,
and IRQ_ANY_EDGE registers. This commit enables support for these
modes in cdns_gpio_irq_set_type().

Although the interrupt status register is cleared on read and lacks
per-pin acknowledgment, the driver already handles this safely by
reading the ISR once and dispatching all pending interrupts immediately.
This allows edge IRQs to be used reliably in controlled environments.

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/gpio/gpio-cadence.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 85aef54d0aec..d7790fc35c22 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -98,6 +98,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 	u32 int_value;
 	u32 int_type;
+	u32 int_any;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
@@ -105,24 +106,35 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
-
 	/*
-	 * The GPIO controller doesn't have an ACK register.
-	 * All interrupt statuses are cleared on a status register read.
-	 * Don't support edge interrupts for now.
+	 * Interrupt polarity and trigger behaviour is configured like this:
+	 *
+	 * (type, value)
+	 * (0, 0) = Falling edge triggered
+	 * (0, 1) = Rising edge triggered
+	 * (1, 0) = Low level triggered
+	 * (1, 1) = High level triggered
 	 */
+	int_any = ioread32(cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE) & ~mask;
 
 	if (type == IRQ_TYPE_LEVEL_HIGH) {
 		int_type |= mask;
 		int_value |= mask;
 	} else if (type == IRQ_TYPE_LEVEL_LOW) {
 		int_type |= mask;
+	} else if (type == IRQ_TYPE_EDGE_RISING) {
+		int_value |= mask;
+	} else if (type == IRQ_TYPE_EDGE_FALLING) {
+		/* edge trigger, int_value remains cleared for falling */
+	} else if (type == IRQ_TYPE_EDGE_BOTH) {
+		int_any |= mask;
 	} else {
 		return -EINVAL;
 	}
 
 	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
 	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
+	iowrite32(int_any, cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
 
 	return ret;
 }

-- 
2.34.1


