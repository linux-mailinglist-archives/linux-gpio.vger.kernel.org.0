Return-Path: <linux-gpio+bounces-36067-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOwcI5id+GnHxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36067-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:22:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AF4BDCDC
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8C88301DD8F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBE73DA7D7;
	Mon,  4 May 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FbRSwHLA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314D43DA7DE;
	Mon,  4 May 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900319; cv=fail; b=KHuQLFQYZXxrnh+VFA14mEiQJdRGCzdpADP//3eZI840Ff8E0C/GNYlBMTtnl5iuqcqeLXzKHthvmzmhvMteXpJq/rhne9jHQU7cnXyR/zCabGuGiLCftvz1Ncv5YgkPqPC5bG5Kt39oJ+ddE2hz4t/ibUCaNz8RhBAsUlxRfhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900319; c=relaxed/simple;
	bh=nbINtXfeV3KkYnfx6CtAFWZMM/QttgFWoOlV7MwEPgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R9AmQreLFLmKg7QncUW6Stg1mp/zsCi5UPqBm6a75FsJdoUdo7nq4YWT6AfGDkaqigBLouHJnO6LBXoTugA/Q1lPvTxNv+ognFvQP9y8dwwR7l61UIOgQrCrwgnXVeeZ53BtO58flIxBiC3dV1SaGn/Jit01E3B/gsL42/mPPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FbRSwHLA; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lspz3S1eqXAQrKVLJhmH4tRANACV+Rot53hvV6bbjZEV6meAUcjJw1xVG9NCkyQlVM1yCL5ZgMBa1NAJ8JaIcdxM8RM8q7weEAawngpFX+WBLsiySF8BsnxC2Q6E0F+0tsEJqLW/rAD9dKSFTvp32eGoubgSNYFcvRTDZNxlJYX8Pt5FoB84625OSoutGvPXLnHzVSaVKmB9T/HwEkVGjx4K+CuZ7vNo6/GVKDU7GpXMt84TL6qjxS991nQnvkEL7e5glDz3co7PKALzGHKooKNM6QIu61HFLzZzqYHgMm1mdaFK4XkxvaBXJo1yngz9iXRoYzfkycf3VXApYC6zIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXvbYEddK0wAfBI+S/+67hQc8OHrNOXf973YsWEhIX0=;
 b=iB43TJ3YdidsoBTB8CWL7kl4cJBnsi7xeiVsh8SpZ4FLR5nTKGD5SCZBpKkihTDwOLmIo+wt23klkhSwJUDDz5tpz4GFXM5DcyHoN+mnuIh4GTmvqN8p+wmqUpVRh8CWNiaUI6eIS3o9sJCzPfoyFYaNqG1E2yr+NkDRM5KkPM4RT+WRg+StLii1i4tVa3JO6CI4EoFmygNw9RNPeNAO6HMB2z6++qTEm9QxaR60glbwcHMRtb9aIgderamZ7S9cS6ZhHJyHG5E02c28XaDHWGy+gLshlbbBYIuK34s0ZUBolzx5YOHJV7CX9s9GQ/aKM9vIsJXkmu2YEQAwjA1ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXvbYEddK0wAfBI+S/+67hQc8OHrNOXf973YsWEhIX0=;
 b=FbRSwHLAFPmeuYiBsENNnzH8im3VNAtJr2NDwTkXfGOfMVE9yU3eZHpPJbF9nMd4mQh6lkxhH3qrAnka69yAkmmY3hw2Ibgphgx449VD5x8xigB6hZEYr9x778A8KF+GJh1EIHOXAgBuMGdEYzifHN/SGue7jyD5xQI1i3Q61XqSTni16N0xi3Y0ZAQAQWaWAb5W7ac70nmJC5TyFr/hO3zKUCMYpHMCzmd7vLm41wxT+O+RN7o84Pn/CR0yTjdb4YlVsZUdgwBVablZ92X0AADAmSy5h+yQMvfGlNLj/BOPmI4U6pPvI+RKBfPLCgMZ02hFbBlpfCQvVQ9aX71mYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:49 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:49 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v9 0/7] gpio: siul2-s32g2: add initial GPIO driver
Date: Mon,  4 May 2026 15:11:41 +0200
Message-Id: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::13) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c9b233-35a5-4ef2-ca43-08dea9deb386
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 VJTo0b60HLEpuWpsTs7L0UoA3qOzkE+uTam31PyLlv9bGXg+MU45vgqMK8WNXxaPVv4NM8/0e9TJnq5OSVffTFP4mxbtPGLSWGzUUxWL1GdGM+8PnZKfy01toVPco/n4KILnr8a4gLwc67kGFrG5uykmsBQwTVbuj0w9WTqBaAFL/Z8By9VeZXLf2eqKHeDLXa0jEi0mqSKIdclZtum1Pb/yBI5jpvcJYs8MqhJ4irudKpxZY+qPUFywSPV1GpMu2kJM5eYbZKOt7jdOIhYv3MIhfkIqJjd4+51NYlH4BeqNlRRMFs0CO0oQhxPg8V9YdLL3FrrkroDjv0mZkjMnWHRrnIWMF/Q/QSY8wBWFabjuRuqMhdaeMEYVnzBni4Oqoc2JMmaKjjEuVyE0MEI32OGpBaknsEYf1/NGxD+9Mj3ifvycjqgjm4MA/aI9dOxeSE9cY2izwDe5ZSejPINRjW5xLYFfivkUkapg30oYq10wDOgqCtohlOU2yEhDn90Ihwl9xDZFxneJTMyLimxABb/52544KGJnpoPuw4vlaUfYMvOCXo+0Rcv2wH43HT+OwmR54n47GIAlyenZ5Bx+6SfnK0/0rOTYhHYp2gdjcw3UPUiqoTo4Jh2GT6n9M9+xC3cQ+jLgQw71hh+v1xtouvzUhxiV0kkJbKipNclAppHb0jyku0db6ECh6BtnVt/PQw3nEw70eWdXQICKGzQqQYZ3b0u+1QNEX0MK0kkuIf0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QXBENGk0V2ppTXZhUVpqNWZBa1VzdjJ0bzV4Sk9TMzJZYjVEMUZYdWhNeWU4?=
 =?utf-8?B?eFZMSHhEUHNpYWkrM0NURVZJcnBqL3R5WnpaRStMQThISTRxYWtqbGlPNkhH?=
 =?utf-8?B?ZDE3QjdDRHUySGN1akIwRHBBRzJ2V1FqV0EvSFlpZnQxbnN1UjVUTW1LcFNu?=
 =?utf-8?B?MnZodElKUFk4ZzdtWU82SkhKM2ZPZnZMQU1STVJ1VzVzNE1aWDI0MGRlcGFT?=
 =?utf-8?B?aE5uMW0zYXF1bXFGZllyU3ZESTRFS2Z6TzMvckVKbEFtMXFPdjBMZnNCSWFK?=
 =?utf-8?B?OXc2RVc1Z0plMDdiUkYyQy90VkpXZ3lheGNacWFBS21NWjZjRTlEVjhDNFVC?=
 =?utf-8?B?NmxtUGk0TW04d3BITzNEZFRYc1RYQXFhQjZpZGl0c3B6eXFTbENUVTBzNlVB?=
 =?utf-8?B?UVp5SG11RXpFaWhTUTVDOW9td3cwT3N4UEF6L3NmNTZmNm93dlZ6SExWdjlk?=
 =?utf-8?B?cWlQNVh4aEUzYVBpSDFacHRpYk1ONmRVMzllVWN1elY4cjJrRGNacUgxL0x4?=
 =?utf-8?B?WjdwTnQwYWJXVGNWVVZSSGIvMXp3SktnTXc0TVhVa1E4UHlVUzVNSmFwTHZC?=
 =?utf-8?B?OGJITzBTQmt3VU5xQVZITFBETmFuOHc5Y1FWblJyNU8ySEpGWW1XNktaNThh?=
 =?utf-8?B?cWo2UTFlVHpoZWlmU2tkaTM0d1BwNUdPSHZVYTB0Q3owZjFmTnJEYXltQStq?=
 =?utf-8?B?dzRLZkJLcGFmay9YSzIyNHBJQldDT2FsbnlHNFVlakl1cU5jUC9TcjFhc1kr?=
 =?utf-8?B?a2ZqSURQWEhyVUlqeFRpZXhDczVReVF4UnJnWHhQand0Z0dTc203UjAvTllT?=
 =?utf-8?B?UTdiWlh6RzExNTdSamlsazZ2ZkFlN3N2Y2I3bjhZNVR2d3h0eGY5SG13Z0NS?=
 =?utf-8?B?M002YVR5MkFwMmI2OUQxbU1RcjVTK09UYVRzZUN2d3YvcFJ0ZE0vdnM4REx5?=
 =?utf-8?B?UEJGdlNXcjJPaXVmSzI0VDNROVl3TDhKNDFHb0ZSclVUbHhYNTI3N3ZiVFpG?=
 =?utf-8?B?NWhaaHB4UVR6TU56b05wOEhsc0ZHMDdBL1lqYXYwS3VEeFNKUjZ3YlZ3aEpS?=
 =?utf-8?B?b1F4WmpNVUFkZUFzR05xNUVPWWZINW9idWg2bWlQc0pqK1VZWk9Hemc4cXdi?=
 =?utf-8?B?YXQ4akJmWGdycTFmbDZBT3V5M0FUOHZCWVdXdTc0TkM0SDFPRDNKM1M1clpq?=
 =?utf-8?B?Q2JoNE1oR3B2VU5HYUh1dVFLbi9Ea1RLcm9VWFJxY2dTSTNsOFhqc3hPN08z?=
 =?utf-8?B?WUdUNndwVEpwR2VJcnJFN3pRK204bXowWXUxWGdtWldpaTlDUE5ZczFERHFt?=
 =?utf-8?B?dU5wQmtJaGpVWDZRRU5GYnlCelRTeUpydmd4dld6aEg0ZlVSVEtKQ2lpR2hi?=
 =?utf-8?B?Y3VpaU4rTjNzNzM5Um5yaS9lZ1cxS0RxK0VuOUt1N21mMUExT0JnSktkbjFL?=
 =?utf-8?B?dmlSd2wxRW10dmtZZzdUOCsyUjZBUHV2SDZBdEhuOTdiSjc5N1M0MlhjYWF4?=
 =?utf-8?B?RitDUHNETWpxaUpoWFRCdjVLZjZ2OGZmNFdqcFNSMzM1ME5RNklTOE8rTkFo?=
 =?utf-8?B?K2VCamtRckZaY3c3aEVkemNiY0tkVVEzQjFZZGxCU2lEdnRiYk9ZVVlQUHpy?=
 =?utf-8?B?ZmV0ZzVOZHc1cFNOaVR0bjE4MTlEYVRoWWh6d3hBNFd6T1FZL3ZoUVhML3lB?=
 =?utf-8?B?NU5nWEhORkRubDZlVC9mVklUa1hsNkdwOG50S1RNak54cExwNkJEcDR3aDNR?=
 =?utf-8?B?K2dCR2FUR3lvaVdiODIxbEg2SUtmZHRmZXEwK1lZVHg0MmdFelMxc0RsZVlx?=
 =?utf-8?B?Qnkwc1I5WmFtRFdDTzkzdXd3YWtNQWRhdHhESWVqYmRXNlVYbnMwamdxekI0?=
 =?utf-8?B?ZjRLSXpmMEpSK014TmpzeEdWR2grZWgvbVJVMmNMb0FsTjA2MEtSNHJpWk5i?=
 =?utf-8?B?akJ5alVrWitYU3RRMDJQTk5qWjVHVWVJY00zQURWeS9kdlJtZ1hDSTc5SUhS?=
 =?utf-8?B?S1F6YnA5MVQxVUMrZTNGOXIwQmxySVFoc0FJUCtyVHlOdDZxT1VDSExEZXhs?=
 =?utf-8?B?bVZLRkhBaEVZUHRjcGVVcGhaQVNvandnWWNucHZTeHNMR252Mzd0Nk1IR21Y?=
 =?utf-8?B?WG9LcnVpWGpzOURYWWNjc1lOS2tic1dCdTBVanlWRGtHQXRHSVcwR0Q1UC8y?=
 =?utf-8?B?VGVNdUlXWkp5Um16ZVovN0hwRjY1a1FJNVVtYUx3VkRWV3FiVzNTeFJiWTMy?=
 =?utf-8?B?M04xQzRlMmtQaWk3TllZbFRzajNPaWdFSDlmWjduSlRqRjkzSVk3c2hYWGtU?=
 =?utf-8?B?R1dEYzVDUkdLSGgrd1RtUFBBemZXRUViMmdrNHZZYWNwQ291MDZBZ1JZRlVi?=
 =?utf-8?Q?CJEWOzobNOYrk0eQp9qbg5/qFz77Y5bwuaT4+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c9b233-35a5-4ef2-ca43-08dea9deb386
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:49.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsFaF5fEM1hucw0NDAIC3jwtBusKXDxGO20w4cDAN3r9UIMtxjwjStjBEmRnF8jdeop4BXKrPYjx4albLiyrsi26NF8xc+yd+eK++iuHysn/GTXXeud0Fqw+536lL3D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: 8F3AF4BDCDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36067-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

v9 -> v8
- remove the SIUL2 syscon child nodes from the
device tree and DT bindings
- remove syscon child handling from the MFD
and pinctrl drivers
- remove the MFD driver and use a single monolithic
pinctrl/gpio/irqchip driver
- add a new compatible for the pinctrl+gpio binding
while keeping the previous compatible for the legacy
pinctrl-only binding
- update bindings to include the PGPDO/PGPDI and
IRQ register regions in the DT node for the
pinctrl/gpio/irq binding
- add IRQ-related entries in the bindings to
document the intended hierarchy; IRQ support
itself will be added in a future patch series
- update DT nodes to match the new hierarchy and
compatible scheme
- fix dtb warnings
- reorder commits: bug fixes, API changes, DT bindings,
driver implementation, DTS changes
- split commits further to separate minor
style-only adjustments

v8 -> v7
- remove all ': true' lines from properties in dt bindings
- remove NVMEM MFD cell from SIUL2 in dtsi
- remove NVMEM driver and configs
- expose SoC information via syscon cells SIUL2_0
and SIUL2_1 in MFD driver
- add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
- add patternProperties for "^siul2_[0-1]$" for syscon nodes
- update example to include syscon cells with proper format
- remove `reg` property from pinctrl node in dt binding
- update Kconfig help text to reflect new syscon structure
instead of NVMEM for SoC information
- squash deprecated SIUL2 pinctrl binding with new MFD binding
- dropped "nxp,s32g3-siul2" from MFD driver match table
- fixed commit messages
- fixed dtb warnings

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (2):
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: implement GPIO functionality

Khristine Andreea Barbulescu (5):
  pinctrl: s32cc: use dev_err_probe() and improve error messages
  pinctrl: s32cc: add/fix some comments
  pinctrl: s32cc: remove inline specifiers
  dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
 drivers/pinctrl/nxp/pinctrl-s32.h             |  15 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 646 ++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  25 +-
 6 files changed, 707 insertions(+), 138 deletions(-)

-- 
2.34.1


