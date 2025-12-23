Return-Path: <linux-gpio+bounces-29803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37DCD863D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 08:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657A5300A7EF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 07:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB1D27FB1F;
	Tue, 23 Dec 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="a19+OVJh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021096.outbound.protection.outlook.com [40.107.208.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927122127B;
	Tue, 23 Dec 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475044; cv=fail; b=RjLGaaqS4GZ07VhBCeTj5orykyxooUWeHWdPfYQuk800RtkUpA4s4l6VZwLDu+n/gtPk/GTQWYjlkhTWpOmdWVul0INvbbJOf7MHb/1XjmeR44ABTTb5kCi6s8tc9dv1Lb1H7TutKwE1iUhxsvGaj/zeiLiFc3lPSlcKU9pDdL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475044; c=relaxed/simple;
	bh=IjtU3lW1Qeg4lhCMo6KXpF13dMVge+NK/OZ9wHcdhjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJlZ8UB2oWamzx/lZy/ftXJ6fETgJR22gSoats6/r40SGx9M7ELzTD8BIX0x9LZ4vqxMHxwrgg/a30rrQ7R7QtMmyZg+Ym8DNMCcWjdk0iQr1ETlbA8S1kMbxOo42Yu4hwpBqOW6nbZmv8yva5xe9IpyJeYU4cTXN8XCFsUws4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=a19+OVJh; arc=fail smtp.client-ip=40.107.208.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulRtMkWD4GQZ6nXSpcj/+TtOLgbFTNrOCkOwQfRKO6GaxtezWjuuWSW2z9CXn9Jt28rKJFeNYLaomHCHpeFTScftsZ2U4AmGyKA+3HCHwIRoo6xigalmJLciRKhhEU4TJxOXQcX9qnvfBPtXaWmb7egV4YkiuFxl0S779VQC3IcKeBPzxqwST+McOuR8qRtFHYitmVR9QmDdiHrZL0/fO/pzbc2hfWUNdlbefeD98a589xXJBQ1Z0tBM4rF3mSxkQXnLsHWZOXEpn1h6RYIeDRHWdGE7pUxlgVImIyE7XJmOMh4VzMYW5wV2/w5cNFVL+wlBrqqd3sopJ0DHXXy0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/IH6KrtJSLX6f/NwEfatkzt/Ej8tVO7ZVUBDT615qY=;
 b=Yz4tHDdwhNZbivmoadOS5GYUSvbEFXqlTV8pIn9v37lNC64SkcY8A4Z3lS9ptyq5nTYZu/+ypEQv1CY5xTE1I5IYJFAk2ZgtaolRfSAimpW8SLZlKxT5bCCOd+JZN2yEmO6fM77oxlL0alozQbh14DPgg5gALN1jE8AB2NS6wg3jP+KqiEmmfJxxc3k1I81LOeOi8CsDfOVEBFG97qrcEYUBlbQtORPot4XRGsUpOE4fObku37a6JW6l0hoHF/rDBMoWVom/L/EdL3ja71cPuutmikwmW4NS/rJ0jVFW4l8Lv+qgGbaO8CT0KYa9SZt1ZAxaSiu2WHEtyzLruw5QrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/IH6KrtJSLX6f/NwEfatkzt/Ej8tVO7ZVUBDT615qY=;
 b=a19+OVJhxRwedqLGqQF3MzqDeGiwYAMiBLwwLDOTR6W4RB+13RN4x59i78o9/ggzrxQQz8j4tcEjG6277IzMWYkVpOBdA7WhTBZiFCFGRFF6tWMsuY9nZmxLI20YhFwmq3pj1bWaD3CRfvFyPL+tCioNzraAJ2/VZawhSkpVvEbSTkNtsGaXSWVbhsRtIvI2f7Y/mHhdXMnYlinrz1VjlbRKgLp4v98TN8H74/ZuTyxt98jhjNIO1DSyKnreoH6d6eRxY1pPFKifNBZF3rvHWta//hbaC/uTyJszGPVrYZmxZzBkNBcN+VXdCcOMOTf1vwj6y2MXhm5+NCPT4DUYNw==
Received: from SA0PR11CA0130.namprd11.prod.outlook.com (2603:10b6:806:131::15)
 by SJ0PR18MB4041.namprd18.prod.outlook.com (2603:10b6:a03:2e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 07:30:38 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::73) by SA0PR11CA0130.outlook.office365.com
 (2603:10b6:806:131::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 07:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Tue, 23 Dec 2025 07:30:38 +0000
From: Swark Yang <syang@axiado.com>
Date: Mon, 22 Dec 2025 23:28:58 -0800
Subject: [PATCH 2/2] gpio: cadence: Add support for edge-triggered
 interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-axiado-ax3000-cadence-gpio-support-v1-2-c9ef8e0d0bce@axiado.com>
References: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Swark Yang <syang@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=syang@axiado.com;
 h=from:subject:message-id; bh=M9S33BcKF20OD2ci7GDV3kwz9gbREFbcTlKnKDSLWs0=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhkwvV4ldqc7xtReMJymsjvt7z/yWwvFzr6oaS9jalrsJ+
 RULB7zqKGVhEONgkBVTZPmq8y3/ZK72vc69K0th5rAygQxh4OIUgIn84WD4Xx8j7+MWptxexrZv
 jdQjnfbTLfm97c9WHdXK19P7n/rlGiPD3zAvPgfx7mNZVSp2Gp4tm5umT7tVKBd/a5om6+yJUie
 5AQ==
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ0PR18MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: d32a5112-2b37-44bf-55a0-08de41f52b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3RxRVU4QVpTb2pKMG9vYUFpR0pEY2NUVGtKa1ZQUW15NjVlU212UHVGK1pN?=
 =?utf-8?B?TkdKbTBDaHdwWkdLWGtFeEQreC9vemx2WGJVSDZpZU0reW5XNUVvaVQxNGlS?=
 =?utf-8?B?TzIyVytzVHVKeUdiazRmbGIrTzRVKzFFeElHdVdwelREeE1PNlJUaHpINlI2?=
 =?utf-8?B?RDNZRUpFMkowSEVJN1hyMURqZDMwME5IcWdhWk9maFE5eHNQK2RTK3AzblFL?=
 =?utf-8?B?bkNuZnNKM1kyVS9qazBrbFBzZjJjZGlBNEVaWlR3TVF2TnJ2WGFscUF0RFJq?=
 =?utf-8?B?OTc2elVKWG5nZnV4eWErQnZyU1VRNFFPWUVDTU43UWh1SnJUWTloUTRreFYw?=
 =?utf-8?B?MjF5MEcxcE4rT0t2L1AwZVgvTTlkUk5QYk9xRFJORkhPN0d5NW05cXAyL0J6?=
 =?utf-8?B?TXIyejZSN1NaRzBhRFJWSERNbFBsTG84RExDR3pnTWxIeVRnRlI1djVEQUxq?=
 =?utf-8?B?YnBhaW5KS001YUFnVDdWYXdTQlV6ZTR4bXowc1d3OE4xVGZ3S2tEaEs2YnF4?=
 =?utf-8?B?c0lXSjJ3NENKbFdqY1N4cERXLzRxQnk5bWtlYm8yWm8vRWJUQ2I4eDFOZzIr?=
 =?utf-8?B?NkcvTml5MmozY1pWSi9SQ0FEeG11elhLVllqeHBvWHdmalVxQktjUStLT2lr?=
 =?utf-8?B?RCtKV3A1UEdqUFg2YXMrS1FPNzVhMnozQ0V0VC9WbHBXWWFIZUZvZDUvVmdp?=
 =?utf-8?B?R3hyNTBUWlM0UlNDc1l3MXZsS1l0QUlVWTdya0tqbzh3YzlVUGhlNDJieU1n?=
 =?utf-8?B?bVJWVXY4UzJzdzBqQzZzdHhGWW1XcW1lTUhKalNmOUh6dVozTUsxemNYR2pK?=
 =?utf-8?B?WWdYbmVVK0t4UytxTjB4QVpYd0oxbWQ1TjVRamVFZnF5aCsyQWV1TVFJNVVW?=
 =?utf-8?B?dVNOUkQ5em1Pa3pPQ2t3elNPckNwT2E4RUhPRXI2RjRib1dYN1Z1SVFmUWRn?=
 =?utf-8?B?UCtyaWFXcEZOZjVIWEMvVVptTHdDc2haMTMxV1QrbkdaS09uelVjRzFsYy9B?=
 =?utf-8?B?RWlvTmUxOEFjaUs3UFhCb1JpVWovN3BObkxRZmNERks1enRrajlmd0Z6QWQr?=
 =?utf-8?B?b1k3MGJLVXlodUFFMUVEMkVtenluVGtPcXUvZjEyMGlyTTIzNHJHZWprWkZv?=
 =?utf-8?B?OWxOK29ObnJTY0E4NVA1dnlGem5CbEtWOUcxdnd6SDVIRjU0THZFYUoxQ2pv?=
 =?utf-8?B?RURxd3AwblhnOUdYNVVENFBrdjkzd1dJbVZrNFFjQTQwUEU2dTVkR2JhUC91?=
 =?utf-8?B?d0VFZGlUZGdHak41cGFMQ0s3bkRoWS9oanJOeXBBcy80Q2t6WERaSjE1Z1pO?=
 =?utf-8?B?K0dzWDFvdXBsWXhrNGhjNy9vUEJIY3ZMM0dQSm4rWVJXeHppOEhoaFkyeTQ2?=
 =?utf-8?B?WEU1R0JBOFZjYys4TVhYYmZCaHRtQ0lXQmFYY3F6Q1QvenM3dTE0TDZOOVAw?=
 =?utf-8?B?K1FrY2JHREVIa2prY3FOeGFYeDNTNFNETy9qb0pNUHY3ODlrRXhBM09NM28z?=
 =?utf-8?B?YmdnaFFSUzhkemNNL2VwWXdpMU1xVyttcDU1ZlByb0dUU2gyTmhoaEgwem9I?=
 =?utf-8?B?L1dXVEljZE9yZzZnYXRDajZVb3V1dnh0U0pyWFRFc1pxTjUraWdNcjducU14?=
 =?utf-8?B?dXoxTFJMQWl2VnpYenVxamlicTBHS21tMWZWRUUvQlhqN3d0ZG9iZ1BpZzV4?=
 =?utf-8?B?SnVtaFd4T0cyZnBFcEJEMXpXVkxwU2sxK3RSUmdRdDg4enRTYTFjbnlqTWpQ?=
 =?utf-8?B?OEM1WGdsaWV1MFl3VVRqSk5UckdFTVFsTkpQYjFsTWpUYlhzRmI3N0NZZ3pO?=
 =?utf-8?B?OWVmQ3l0Qk96R1Z4ZkRjMEFFeit1bnh0Y3RCUXQ3bmlMeHBRV3pUdWNOT3o0?=
 =?utf-8?B?ZElMT3JiWVVnaXRZOVBacEFLNndOWjFCZ3pWOTgydjlrcnNjSTNBNjY2MzNO?=
 =?utf-8?B?dCtZUFdCSWt1QzF3REwzcTZvTWtnaWVOdGZCbTcwTDFyUEhCMkltUGJ3NVBs?=
 =?utf-8?B?YUpJMTdPQlpFK0pVd2lmTFdhaURESXBJS3dLenRabjhJYWpMckFwV1ViRTEx?=
 =?utf-8?B?Q3g5RFJyQ2l2c2pZTE1vTy9BYStPN25RUWc3ZVN6Vm9qUDdYeHFJUVh0U0pr?=
 =?utf-8?Q?aonQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:30:38.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32a5112-2b37-44bf-55a0-08de41f52b9c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4041

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
Signed-off-by: Swark Yang <syang@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
---
 drivers/gpio/gpio-cadence.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index b9f39566b0f9..e34a160088fb 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -93,6 +93,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 	u32 int_value;
 	u32 int_type;
+	u32 int_any;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
@@ -100,24 +101,26 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
-
-	/*
-	 * The GPIO controller doesn't have an ACK register.
-	 * All interrupt statuses are cleared on a status register read.
-	 * Don't support edge interrupts for now.
-	 */
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
2.25.1


