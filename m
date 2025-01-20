Return-Path: <linux-gpio+bounces-14937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D4A1672D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 08:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51CDF1889851
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261061922E0;
	Mon, 20 Jan 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ICHvNupe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D55191F92;
	Mon, 20 Jan 2025 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357284; cv=fail; b=Qa5UUW2+BNZkE1MAmauf9B/Xq+8L6uW5x2pLGkWraSV2y77H+tiRpcgdq3CzPILcZucAxLVKWWO62igyFGInMj4m15jAq/d2nSIMLkS4NxtuBkfAzKblBWzJMo5AUA49hwGCa/TLHBMuBhKlPI8X2lmoVfmSAHu2SKlJmFB0vPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357284; c=relaxed/simple;
	bh=AxZ1+A8ksw8Nyhdc+1dKlBIilh5HETwjGy2jFH+8qzA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pizLB6d9mli8ICMEMK/D0+goWmSqektbMtc50dFUSGHXivA9+/BtQTRQj/i7EUoTkeBf7qQLCQH00jS7iJ+Wib6uMynWBa8sloNqlp0LBM1bgWLgeUTMugGuDSmNmKWXDojgnmQBKrD0FlBbJcF9qXncZ0AOB0AKDAYTP6ONrzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ICHvNupe; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnHWYyw5FYac+g54BFkbfYguepicGAyWBnGtAI8yP1EbzopKUH6dAQcG3IuVTjXZN5We7Szbvr4ulVdJh1OXNth0LKNWQZnIcFOxtqamRUeTb5USQhyn2lLzyoFxndSipS3LMTHXRPghiQK/RiLWo7DtA6rQCTuEyy/FYd+kxayizLb06p6E9DIjdT5PDO51gFlFIdeSz6nZX5Pahzi3KuKUEMdGpWfZUiwwX9LlCsAL1EogaDc7+gUqvUj5V8sfwke0bX7kbTR70mYgU1IU/PlnVeKdX4iP9Et9PlD58uV1hIdvRZvm6kqFBd6O1fi6aMc22hNZiXitgn0wv8M19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLP9ePf8DIdQ8k6igl4N111BxUUl2NNmcWYXPawAUf0=;
 b=xtpPgymMjgF84Cu50ZKhkesMCQeM8rGmrPf7J2K6Sul7I1AfeIVAoGNNarb73kY1vewNRwLW6lLsWzW18GWqLxrNKChW9QZn7sp3sUtKiX+KK6Vbe5ketIelyhigDj+6qQIc0DFeYt5PqyBTJ0XxYg4bBNXgbb0Vh0FM3gs3c64ZukSdFqkYgMarH1UGo1hrDPKT9tNX+YUWaPy5txvwBaumyQk6+rdmOCf/SD9TI4veXCmSwWTYwYROcJtV9IWl9J2RpiEXCacble0mc6ol/TAhtv2H5IlHRzwC96FJxVfe4vc9B4jYGfZOsu5foAyGMXS/na7DiBwW4mlmgBZ3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLP9ePf8DIdQ8k6igl4N111BxUUl2NNmcWYXPawAUf0=;
 b=ICHvNupeJrrSOrckpvttE+KTLTe0XmeY69oHH/t8nPNAbgeNhBFJJz0/1NmvvNmOSO4CyfM9QU2Sz8Jl70kTfZoHOdK1fBSZRpq6iLE7gfCc028+zDYlAEzYhiRttntmluuva4iCzvBVdfe1vF1b5nvEZ9WG5ySy1EL2tw7+pEqdTl7xBxAR7Oe34wzQsJopyw8WJ0IAZyJZ/Z87PyZA6ixKg4Lwust5PqZQzGT670sYDx+D1QFHVgbxMOzddz52RGMxZHlIGaj50bC+vLVd/vt16E8ImYzmPrRLokSfHz3X3hwGugf8lA8tZvBzzHdv9ws0c6dHtAl/4UyKSl8Mrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 07:14:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 15:13:31 +0800
Subject: [PATCH v2 3/4] pinctrl: freescale: scmi: Switch to use
 machine_allowlist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=1763;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2s7AFkufdGtLMEQE7ZFE1TCbdTfpzQN0LEcffg2DHes=;
 b=OmHYdKsZn53XzTgHlqAfjmWlrWi56j4pV6t8zldbvzdb5Onl8BAvIssNRRvl75m5TcyZbVzsd
 zTg/3xdGzJSAbygPKMXchIItDH47Ddqr4sWDu6419a3m+d6DIdv5kax
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acb8423-1591-46a1-9848-08dd39221a78
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3dHb01JYWJBaUcwdVJRTC9BQlpqdlRKNGphMElRVGNZdVNKK0tadmlqM3Zz?=
 =?utf-8?B?Y2FrYXpuOWJNYjBvWmxJSVo5MzhtYUZ0T2xiYU9YclBQQmh0VEt0RGo5Nyti?=
 =?utf-8?B?T2xrYXI4U2xpU1NWMXcyMlRmU0pFQUg3U1ZHWSttUU0rQTZMc1lOOE9YQ1B2?=
 =?utf-8?B?UG9Vb085NzczYlY1R1FFNFhpRDZWWHd6MWdNK3NSbXRVVW5pRU1vSG9ZM3pp?=
 =?utf-8?B?dzVXWjhpcmtVN1FDYWdGUnFNa0U2YWFHWHVEZGZoTTAwWWZaTWJKRkNpc3BD?=
 =?utf-8?B?U29TMDltTUdxK1ZuV2VkT3paM0UxN0ovOUFkTVBOYXc3ejl5Y0M0cERoWnJY?=
 =?utf-8?B?NTgwZ0M0Q3BHZ1lZaCtYTGI2bG8vQ1VQSFV6R25uUjExeTV6Lyt1QnFzZlp5?=
 =?utf-8?B?T0kwOHliMmpnNHh6VFhaSjF5WlVjNzRMQ1FlUkoyd092bHZPcUNxbzhpOVhE?=
 =?utf-8?B?THV6RS9Pb1BxS3ZRK09FVys0dkhMeGZPY3RlUDNEREh5S3ZVOWdBVHUxMzh2?=
 =?utf-8?B?NWYxbUJJL2xNdWlZS2U2OHNmd2JzTXAyUEhrL2FlT3N6OUNoSCtaUnZFa1Nh?=
 =?utf-8?B?cXZTK0hlYlcxYXRkcG1wSTJKK3RFY2EydklYcXVQVCtwVEdSV0F4bXNBdGdm?=
 =?utf-8?B?Yk14Vk5uZG5vSHArOHRscm1ZbGNqb1hCdnpHMHZvN0dXZG0zWDFmRDVPYVZo?=
 =?utf-8?B?ZUd3VlhwdnYrZ09GdEwvWWZ3TFZETmhmTkRZZVcvemdqbDc4ZFVnMlFaNVc3?=
 =?utf-8?B?VlIzZXB3RGd6V2pQNDFxUCs4Ri80d056TWdId2dhRUdqemt2cGhuYUJwWTlp?=
 =?utf-8?B?ZGxUQ055UlgyTFBrbXJpUXRhUzN5WUFmYUF2ODVUcVhReFJ3ak00ZmszZDQx?=
 =?utf-8?B?dHFpM0Y1Z3pLOWcxbXUzaDdIS0lNalBTelVuMi9idmJSS0wvM1BVRGNJU1BY?=
 =?utf-8?B?blBNUUl0WjM3RGw4eU1ERW5BSzcrS1lWWm8zWjlBc2dVMDFFdlR4ai9nUnpR?=
 =?utf-8?B?TWk2dkVuRThnNlZDTnZhaFlpRXBRM0dDcDQxbFAyYmp2SWVvMDJKNlFsSUVC?=
 =?utf-8?B?akFiSEt5WnlockNmZ2RsdytzYlU2Vk5QTk41VVJYV1plZFoxYlVSZm1wYjI3?=
 =?utf-8?B?eFNFemNXd3pYMlpQazZBakdnZ1h1ZHRKYW9USG1tK2dRc0hWMXRMU0kwQzM5?=
 =?utf-8?B?SHRBOW9PK1l5Zkx1U01TN2dOZUlVcXk2QXJBZXJsbHBxUElXMnpYZXNUSzQx?=
 =?utf-8?B?elVWMWZpUGs4KytWUk53TjhoL1ZyODdrRnNIM1ozSXRmcWdxTkViaWRLQlNa?=
 =?utf-8?B?M2FOUUcwTWtqVGRPSXdtUzh6bng1QXkxVWN4WUpoZUgxRnIrUWxObzRzbmo4?=
 =?utf-8?B?R3BHeFFKMU1FWURzdzhhb2p1blkwNCtBNFQvU1lXNndUd2k1S2d4djMzVGdv?=
 =?utf-8?B?RnUyOHBmK0pPdWRxWjY4c0gveGdMalJjeDRQbGMrOUl2QjVRVEdhOSs5WTVV?=
 =?utf-8?B?dGdpZlVCRi9GVkQ0QTFPSTRoWE5HaDdwd0M0Qk1TcWs3SklJd2RiVkIyZ0Nk?=
 =?utf-8?B?OTA0U0hYdkozWlYrQWFOdEVEQWFYZ2hSbDVJaDgyZVdFSDYwUjJlamlHK0xX?=
 =?utf-8?B?a1l1MFpJNDlvQitrMDVmcnh5Qk5IUkJ5VXZlVHg1N21VMDF4ZWNieEpURDYy?=
 =?utf-8?B?cFhPS2ticEhPYXJETTAxbnkwbXFMS1NFdjM4MThmdXkyL2JxM0JPSlpKM3VL?=
 =?utf-8?B?YUdXcEVjUzlGdU4zTzRmcmlWbGhiWHhPVFhyVVArU2xHaUI1dWF6U1BhYkk0?=
 =?utf-8?B?dzg0OU9BSEZadGphS3BtLzlldEdLd2JNUlNNeGkzTU5qUDhSYzRTL0g1b3Bh?=
 =?utf-8?B?TVJJK3IwT2wvT3hpREFGejhvNmtpL1kvNCtFbmFwUmMvSDhKRW4rU2VCK09s?=
 =?utf-8?B?Uk41SGZRaWpyNUQrQ1hPNjZBMjV4VDlWUVdzczNGVzBXSkFBU3NLUFdCQm42?=
 =?utf-8?B?R3IxM1VWYjVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWpNWGc1VjRmVlVkQ0pqYjBOVDhnbHdSMDBXSWFKTHppRVNsaGNDbWRsVmdW?=
 =?utf-8?B?UW85QU9oRnp1Wm1sdmkzZksrZk5RVThZYmQzZ2lHaGpOMk5obUdrR3BsSHRn?=
 =?utf-8?B?ZDk5SURlT0s4NmdtMDVVMkJYRC9qWTF5bmlFazF4b0c2OXVhci8xaE5TajQ2?=
 =?utf-8?B?dUREWDdUSTlraE5EcW8yRE9hQW1mN1ltdlVGc1BHYjdGRHBldEduR0UzcGsz?=
 =?utf-8?B?YzZyMTJqajRFM0dLdzVKM0VQZWNqZnk5bS9pQURPcmpsdXZHOU1KdHBTdVFH?=
 =?utf-8?B?WERGbXBSWmpmdjlRWUYxbEM1UkQ2dVV0US9kWm9DOTJjaXJXQzlHK0FGV3Y1?=
 =?utf-8?B?RW9UVVRqM2RteTZseUFpK01Ga3k4dVVXL243YXpRMDRwV0RlK0M2TzMzT0R1?=
 =?utf-8?B?dmxjdWF1RzFBeUpEOWcreGFqa05XUXZWZ1hqYkNzVTQxeGNURjg3WEtvZ0JK?=
 =?utf-8?B?TzhSbDVkV0pFeHQxY2NLV1owVlByVFAwQWs0SDBqTEg2OUw1ZU1QN1BCaE8z?=
 =?utf-8?B?R0EveFIvTnlwTzY2QVJjMndEVUNZUmIyenJyN2lRMEN1eWdTWmZIRDlldE9t?=
 =?utf-8?B?RjVVV1RFV2t5eWFFOCtRNnBBc0YvelU5a014dDhBVmFxa1ZSUVZlN1gzRDEx?=
 =?utf-8?B?R2VYMm55NHhkOW1MZGliNm83bThTRzBPVnhGMm1xSFh4MXdwRGtwTkwxZEZn?=
 =?utf-8?B?aXZUbUgyRG8vTEYrM0FLR2pZcmphWnJVQXVPNWJvdE85djRwZkdyVEZpeFBW?=
 =?utf-8?B?Vk9XcnU5b0dHeEVzMWE0S1ZwVUZSbVExenRQR21ZQzREblZUcnJYVTNOdWJZ?=
 =?utf-8?B?dUdER1Y3MmNDdndaOUsvRTN4SThYSlVFR2Q1cnZvR0kxYlM4cXAwdzZWSm1s?=
 =?utf-8?B?ZGE0RkoydkQwVkFwZVRLNHN5MzB2MWdNNWJXTEhZeHVXb21VQUl4NVNHOE9L?=
 =?utf-8?B?aEwvQm92RzdWRlBEUzdIQjhTMDNzQTNlY2JyYlpJN1JRWHBqL2tXY01qcG5L?=
 =?utf-8?B?VStKM2hOVUpmc0pvOTcwemwvT3l3MitGM1BiYUNGYVh4MWV6SVVKcExQNkd2?=
 =?utf-8?B?a3MyZjcvb1hkK2IrSmhMTFBwUVVRc2xSSXhHZ0dqRERLb3Qyd0M0YmVxd0FT?=
 =?utf-8?B?K2RacENraW1yOXZxMlZlMEErQ2xWemphaGJZdER1bVFOb0h4T2ptK1A3S2hr?=
 =?utf-8?B?TkF1dUt6NW92SmVLcE1ndzUxWXdWbkNZQWxiT1lJdDdONWQxVDh2Mzh2NVA1?=
 =?utf-8?B?TlFMeXpZY1JoRWZ6cVZlZzJtWFBUQ0dMTkJlWnV2akhtd3lCY1ZzajQxN2xv?=
 =?utf-8?B?Q1hLeEl5NjVCeC9HdTVqU1JzSGg4ZVNvTHNzNmcrSnZjYnVoWkFHQUhiNkdW?=
 =?utf-8?B?TWx6WWgrUGRTQWR3RUR2Z0VpWHpLbEFDYzliNFlWV0tNbmtQQUduZXRncitK?=
 =?utf-8?B?Z0RsZUFWM3J6TFZaM1NNSCsySnNTYlFHUnNoMDBYbmw1T1YxbTBvRlhQV0dG?=
 =?utf-8?B?TmxJeGJxVnlVV3F5S1VpdE1BMXF6cVp2M2p6ZEZTbzdrUUJ5Y1RLS25OTXQ5?=
 =?utf-8?B?dkd2TFJ5UXZLUGtoU2x6YmVTVENPZEhEZmFQVm1WQzZvOUx3RjJicTdoYThZ?=
 =?utf-8?B?Y0tGMkJvcVR3bFVIWEIxclFoS0RnNlYyYXkxbVVIUjhhd2I2Q3ZtK09jbGw2?=
 =?utf-8?B?eEdjRWJVYUI2S3V6NGtBWHdYUzFmeVNOWnFCTzhPNWNrR2VjYllydlBOME1I?=
 =?utf-8?B?dVJaWGlsa0NCb3FhM1BoaE9RajV4SUtlZGNsNEZrVyswL3NENXFxWWkxUG5G?=
 =?utf-8?B?akFkdVFnYTFPMzhKU0RDOEhoN0o4SmxoWmZOV3pxV1c1eGQ1cjZzSWUyRW84?=
 =?utf-8?B?dW1sQXVtU012MlIvTkU3OEt6S2ZPT0NyK0xZRlNFeUM2T1Y4b3VUYWxkOTZx?=
 =?utf-8?B?MkVCYmtuL3hZMDUydDFPeHRoZ0RDV2lWaFhxTzcvalBnNXZnNnRZdDkyZjdY?=
 =?utf-8?B?SW9yd3QwUmtPb0hhc24xL3kyZXNhZFRWZ3VzMGwydkpQTU44RlBYaDU3Y0Z3?=
 =?utf-8?B?Q2hGT1BsQWdFVjdRWDRiQjdHcFMzb0F5cHplNEUxSWRHMTFkREg1WDRKSGtM?=
 =?utf-8?Q?Q0slfq3e1WHxu+NpHXBLL4MWk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acb8423-1591-46a1-9848-08dd39221a78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:39.3248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDk7pnRgzhcu7x+9aK7fB3dtQ6b19ALlBADvihW9UTlbWDr0BwpBHRHHK9Z7kd7Q0ss0nGnq6ZC9cabRr42kBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778

From: Peng Fan <peng.fan@nxp.com>

With machine_allowlist, only allowed machines have pinctrl imx scmi
devices created. The fw_devlink will link consumer and supplier
correctly.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..058b4f0477039d57ddae06f385ad809cbb4784d6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -287,11 +287,6 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 	return 0;
 }
 
-static const char * const scmi_pinctrl_imx_allowlist[] = {
-	"fsl,imx95",
-	NULL
-};
-
 static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 {
 	struct device *dev = &sdev->dev;
@@ -304,9 +299,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -EINVAL;
 
-	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
-		return -ENODEV;
-
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
 	if (IS_ERR(pinctrl_ops))
 		return PTR_ERR(pinctrl_ops);
@@ -339,8 +331,13 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	return pinctrl_enable(pmx->pctldev);
 }
 
+static const char * const scmi_pinctrl_imx_allowlist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx", NULL, scmi_pinctrl_imx_allowlist },
 	{ }
 };
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);

-- 
2.37.1


