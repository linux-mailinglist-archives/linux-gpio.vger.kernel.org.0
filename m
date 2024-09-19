Return-Path: <linux-gpio+bounces-10274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30B97CA7A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD7D1F24CD7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF961A00EE;
	Thu, 19 Sep 2024 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jqeZ103Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC619FA98;
	Thu, 19 Sep 2024 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753753; cv=fail; b=Ve588/ZRvJwwbXZOzObK1+eVF5yJooX6DAkR4HyMThWNP3haeviL2qHcK5zvvLRDHoD/y3kQ910xzGUcSs1YBU4YPRmOWq0qn8X2+Sa9Pe/03yf2FixaUUGbxV7Tg7SRZ4RmE0UrVK9eK7BoLvkNb4TAU/BuDShXyFvQCu+DTlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753753; c=relaxed/simple;
	bh=moCczoN7ygS1III28g3DdgZgeHE7RKxMfZar/BqQvHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WsNrEYG/PTg3kqCrnUL+XPkwogW5l++TcQ0YByhtymiRkCTmA+qdxqqolYoUp4DER3kean8VC4BsRmebEgu038JSVrP1XJJy4GfpZHTTEA1Hc5nrieAmZUErJq7Zo5yTOcwShZEgFaa/HPGOhSu6E/dr7LQoQWmVgX8XyIK5iOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jqeZ103Z; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJaxtyj0tUw98PHfj+hlDt5IkJH9Pk3vqbUyV7gYULztzMTBMxl/mY0rzAPPWqh5wcwSjufCXlL1eCaLsFe2Vcidi9rFCH4xKlghlaty1P3pR41L8CyCBJMHvZ/Up1F6sAIi84SkA5IWgzODGjItMXMq5oZcA7rtjBFkcWVDQ6xAjV67eGT/Rl9XZJ3ysA16fD4YWneD10h+F0BKk8jdir0Dcm896XmrkfIyXAMkTixGBs9scyN+EdInCYEnTv+8HaV++GPAB4tuYKIHitYgP7YohugKzZ3ekd4L8V8hPs2Cru7B5YJVVN+vk5o7MxhrCirlXLB3rYO5gHS6UDv5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty0jPpd6KG9GHfJpRmF6LhWq9lq8U/PuHPpZO7NbLfI=;
 b=RzD8N7TtmeuA4Lla0yBWQbr8FkTc+47uTdZKH6giYVLHmjIlz8lKuRLp8l7+9wc8PkV1bNO21nZ2bYzhpdPHSN+DJQFqJOOgcKf46T+pfdkQ1NZ0J5oOslaaSVAKXY5j/8v2KpgXADwn2dBmMIevobAjv/TJF69YJy9zDWE5X5Id2KscizEgm4ssMfamg1ptaHCMbEo/s7L/9DIMzMywXzqSRnwafxnyj8m0H+pGfrfkNx/RkNIZ/l6R118HqeSDp+Kd+ameTUBuGdzJ5PX0YeOYkWYntqhJXcVsz3XSUAJFbVSke8fJlLlvqffHWvWSuDgkpFJdLt72VEpo99RrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty0jPpd6KG9GHfJpRmF6LhWq9lq8U/PuHPpZO7NbLfI=;
 b=jqeZ103ZFyvPpKdFQOFmgXpKibChZMZnDDm/zzL7YlNFlr7tNQnaxBD+2TAYQRvN5H0SgjhyJWsoyrIYgkAmW1JwILRoixcKi28xGdMW/Vh/nZv+T6E7fAjGjXrjWSVN155mlS05h7vQjfA6E0tTEj8yyyGrzQ4WXD911qKKFUkFtD7zhp+U5ADRh/3vbAcV5CmHaMWaXmSlXA/ZYCvYFyRSmh+lfFQAJCaEtNIM0zHBBWQxtPr6uPvu8nQDc3dLIhKlmSXrMbJWR2gSPTjDxQo2aq6Uj5djJs4Ubps2wlJzla+f3YmyhFFpwlqXMnGJkJUsNHrKeCUAaO0+Nq9b4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI2PR04MB10267.eurprd04.prod.outlook.com (2603:10a6:800:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 13:48:56 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:48:56 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver
Date: Thu, 19 Sep 2024 16:47:24 +0300
Message-ID: <20240919134732.2626144-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI2PR04MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: 554d5ef2-dc84-44cd-5b20-08dcd8b1ce1c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk5MejlEazNYUG9sK09Jd05YQitwUTgvR2lUSWtWS0NTeUZqNCtPcUJxYmIz?=
 =?utf-8?B?bG5aUHZ3bmFOWTltaHlmOThLSzNYSzk4MGZyMGJLMUkxa0NuSWdEQUU5bjVH?=
 =?utf-8?B?TXlYVVVzR0FRZUtZT2VLQ1ZiVEdmNThzYVJ2Sy93bnZxRVdvOGZUOWV0bjJH?=
 =?utf-8?B?dXRObFdicUE4L3MxKzFGYkp1NlhMUTNtMFBnQTZtRlh2UjVDR0R6TUFsZTY1?=
 =?utf-8?B?V1gybHMyeURiNXc3dTNNZEdyYmxWUkJpNy94UzJMdWZpajh6MzF1S3l0NmVY?=
 =?utf-8?B?TGJiM2FNTGZLODgvNTdFNGIrak9ydlBzajdUNWVTU3IzR0N0WTdrWmE5U2hF?=
 =?utf-8?B?SXljaEFlNXQ2SlNDdForQ1IxZ1NBTzVzZnpoNTBnQ21sVFdZTDVlQktFOEVZ?=
 =?utf-8?B?QmdqVEtTY3YzU0Y3bDRrUkd5M0loWHV6WEJCNjVsWEliUVZ3MkJZaENIN0hy?=
 =?utf-8?B?RzIrbmJqVC9KUmhmdmFKY1VOZTF5bGxVQnBTTzQ4Vnc1S3BxOEtnbWxib0d3?=
 =?utf-8?B?S3I5N1E3ZG9TdjZtdFE2M0F4QjcxaXN4dmlLTVFVMkEyTHYzdFlpeDYvU1Ry?=
 =?utf-8?B?NFM4MDFVUmoveFRwc0ZFVE9OMGVMMDZSbGxpaVhmWHNuYllZaHRpbkNHK3E2?=
 =?utf-8?B?YUhCU0RERGVEN1d6ZnNLY1Z6cG50TUVOdXBQdGh0LzhQT3Vyd0daMnorNWxn?=
 =?utf-8?B?MFRjbzdLSlR6SmxCeVg3UlJra2k5TEJzWUdNNzQ4QUROV0RiaTZGVGRZVVJ4?=
 =?utf-8?B?RDVMM3hrQ0dpNXJZa25PM0hCUlAzbVRvclYwUURoTlhBR0tIbHI3eDI2Wi9n?=
 =?utf-8?B?dFhpNWkrY3RkZDI3U1d0Y3h5ejErU3JLQm5SUGx5N2dGaEsvR3kxaWdmODR3?=
 =?utf-8?B?ckNpM3pucWp3RUVTeEV4T0xnUFZqbDdtZFZtaWx0amNnZjZDcVFSK1NtZ2Vk?=
 =?utf-8?B?ZjVPMEo1UHljaXRONndFNHp4N0tLb2pGdkp6NHUzY2pQZFliTHphenRtN2lE?=
 =?utf-8?B?SE0zdjZFK2pnRm1JdkhLK1ZLTzFDaCtiRWlwNTIvOVBudE1JaE9FQ2VlQytW?=
 =?utf-8?B?VjgzZHJ1UXVFcGc1R2loRS9vUVRBbEJlcHg3bXhNUDl5aGdDYU5VblpnZktL?=
 =?utf-8?B?d2dCNE1GUmdJVEdLY1BRbWIwaC9CUFcxNWZSdXlpeUI3dVlqQlhaS2l0NWF5?=
 =?utf-8?B?QTNEb0w2cDh0TmFTa3RvczNqalpqc2lvRFRxNmk0MmRnb0FtWlBPTEttU0FL?=
 =?utf-8?B?YUxxNENiZ0FVQlVtQ2Y0cUd1U2N6a21UWjlLYVgxVEh2TzByTEJJWWcvTEQ1?=
 =?utf-8?B?RDlmMlFsQUs0ckNJT0tlMjQ3VHNZeFVEYU44WEk3eXNkcWg2ZHZ4WFdUenFX?=
 =?utf-8?B?ek5VVkJSSjNSVnF1YURXZzRzcVVWT0RIcjJ4L3dRTTRsWCs2TFR6bGJnYmI2?=
 =?utf-8?B?aWRUZ2VkdEpCUGhaSlpGcFBoeVl2ZkN6bk1qTFc5d3pReHlmRmp5aHRHOWRz?=
 =?utf-8?B?VmRnS1BndGlKRXNWeGFEZDE5b2Z5MUpEWEtUR2RaZTV4OTYwWDNmd2crcGVr?=
 =?utf-8?B?NDVaek8rQTB5eGd1czljTmp6MWs0ajZKV1BQNmxKajFCS29wUHl3NERXUmFr?=
 =?utf-8?B?RCtqbjU0TU5EY0phNEJkRU1OYTJPQ1JORmd0ZWhtSnFxeWVtM1BVaTh5ZHJz?=
 =?utf-8?B?NzhsdmdHbjJnd2lKRWUvSWdnS2xZVVFNT0lyQUczamVXeHlPemRKanNiMHVx?=
 =?utf-8?B?NWd4Zk8wV0JLZHFjRDljcWNwRkpISStkNWtsc3hSeTcwS1A3RTNady9ZM21r?=
 =?utf-8?B?Um5YSmF5NDh3YlIxRWloRHhvakgzc3ZlckNUeXR2N2xDK25lR1ZlQWRkZmlF?=
 =?utf-8?B?ZENUSjlGb3hjdlVSalBsdEduTm5UVXIvTCs0eXVXUU5KbEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk4weGtDOG9LMHQvbGs5bXBxaWJlRjZqNUh4QXcrQ3dpVVp1cFl6bGdmZlJG?=
 =?utf-8?B?dk1HVmJTVEFRbWhFR1FiTUdJL3YyQnRNVURjejkxNC9jb2kvL080WllRd0h2?=
 =?utf-8?B?cGZxWWxBaTNCUjdZaHpqODd0TkQyOWxwNWxoRXI0ci9iQ2NVRDlCb2UyVyt3?=
 =?utf-8?B?Unp6Ynh3eG9HclU2UFh4L0xZcFBOV21BbmZBNlYySEVxaThpZUlQMFZMVUsv?=
 =?utf-8?B?MVppZ0M0MXVhanU5MDFqVHg4bW1kSldCRG9XRTg4MzNDS3JnS3hmNTlXZW4w?=
 =?utf-8?B?WTBnRzNqT2JqWWFWekg3MURqVlhmVU1BRGEwaHdHdlp1enhFNjF0T0xESmhI?=
 =?utf-8?B?NFkvY1loR0UrWkpXNFVXVHM0eXFheVViYWs0Y3J4aHVlQWZ5cXpzdDJDNktQ?=
 =?utf-8?B?WTJRdGZUT1V6RUhOVGNRSEcwRWNFYTRKeXNNR3NXUWFMT3d5VGNodkk0clpT?=
 =?utf-8?B?STVza1c2MFhTU3FHdVlWV1VZV0tpWlBub1JkbHhKVWMwTkJCTmRGOUFpWWV1?=
 =?utf-8?B?ZHdJTWkxM0F1cEtkTWRCbzNQUXBrc016Q1phZVJXdkhjeWZEMHpUWkF5Z2dt?=
 =?utf-8?B?dXZiaVdqeElNdjI2dGV4UWYxL2h3V1VMMHp5Q1JzMEVlMm52ZFRHaU9qQmJY?=
 =?utf-8?B?TldIeWgrRFlib1owSDcyVVZOQjVEWkQ2MVk2ZE44aWhjUzFuMzFzNVRtS1hY?=
 =?utf-8?B?V3VkVTBXVWNkd3dCRjFJckNCQ1Qzb21XVDk4WWlUbXJieWdXYnF1WmkzNmxK?=
 =?utf-8?B?Yk4zUzk0WE96YjVtVytHblNEa1p0dE0rS0FOOUhPeFYrWW1KNTZtRDNiY2hz?=
 =?utf-8?B?UVFjekIvb0o5NmpRa0drUjA5TkJmdlRtbjNybWxOUllTT2ozVkgwVms5eU5q?=
 =?utf-8?B?OFFyaU1QQnhxOWpmM3krajM3b1c3ZTNxZUJxSGY3R0RSRG9wT2I5OWJCVUIw?=
 =?utf-8?B?d1hhTHVpNStreHE4cEx2ZnJsUzlBR0xzZVdBa3ZOR0sySm1BVXpkS0J3T1hq?=
 =?utf-8?B?V3lEUWFmcFNxa2NheXU2VFVCRlVFY2p5RjNpODRFQm44R2ZDN0pidDdpNk9k?=
 =?utf-8?B?YStMZFcxZ2J3OTdFdU10N0MxQ3gzWUdtYUw1TitHQmVaYjJZOXJxcUJFZlpT?=
 =?utf-8?B?bnIveDUvdUJHdjRGaVE4OFJWRFNwVEFFbFhOQzNjWmFVaTFkSU1mRUtBVGZG?=
 =?utf-8?B?V2tzaDRscjcxVTJoWEJudEpEdjExdGZ5aWhWTGpDUUgwZnZISVhRT3Y1OHFC?=
 =?utf-8?B?UGtWajNsc2JPUWE1RURlVEhFbTUrMnRLdi9QWXd6Syt0WnR3ckFXRWlYc1RO?=
 =?utf-8?B?NmE3cmxDS1l0N0orQjB2TXBqb1VQL21La0FrR0FCQUJwWUhrajRxT01TTGdv?=
 =?utf-8?B?VE1uQy8wTklEbjNvTDg3QWthQ1NwVlNxVm5uVjVaVTkzcVhDN1RiMjQ4S210?=
 =?utf-8?B?Q0ZvY2RmWUh4aDFkbWh0Q0t4SnZjNWtONG9QL0ZVZ29reC9ESkEyeFZUbG42?=
 =?utf-8?B?N0VLZ282UHVrSXUzMmVycjdJLzNudlpjT3hUQzZMUTZYM2tlYWVKQi9XV3Jn?=
 =?utf-8?B?ZmgxZDNqNjdoV3Y4d2xGVDg2aUl3eHlUaGI1S1BoTHJoMnZvK3lCS2U4WFAy?=
 =?utf-8?B?WnNNMlFHUnJaeGt6VHE0ZFRBYTQwTVdVRHdkbCtBVW5hYkxLcE5FdWZud2Ri?=
 =?utf-8?B?S2VuVVArcERMTFFqaXB6RXoxR1grV2ZhenFXVk9uTmdWdmpXdEZGWDBZdXY5?=
 =?utf-8?B?SVpCbXpZblpWUlc1TTRPL2g0SzFYRVU4Z29yT0NWVjlTSjFjOTBDTEVRa25X?=
 =?utf-8?B?UGtrK3hLbHRITUVvbzBlbTM1dFB3TWdPZXVuNWVocW4wUWNRUWp5SXZicVpX?=
 =?utf-8?B?ZGpNeTRuYklJTzJZaDZLeDUzazVta0ZDZGhYQmFBWU5JMW05UVVPaTNLd25J?=
 =?utf-8?B?THdXek1McGt3KzJkeWVPbmFQTE5PUEhaNGNkRm1lTHNmdGJYNnZIVHZQM3p6?=
 =?utf-8?B?NHhLQmQ4VmFIU2xHRDFaVEtCYzg3MHhQVXR1SFkvK2s4bG5YOFQxaTBjUldC?=
 =?utf-8?B?L05FUGcrN0J6aE80azlaZG5kalhNRS9LZXhiNSswUlhPb1g4V3o3bkhOMFdU?=
 =?utf-8?B?eldiaTBXZGFBSXYzVXUxYUxmc2JYbmhLWVA5cjBEUTBrYW9HeDNMMjU5VjZB?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554d5ef2-dc84-44cd-5b20-08dcd8b1ce1c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:48:55.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDEu7Uk+WqGhH41FDzvyZtwtB9fcf+8JBVj8knCvGN4uZy6sQFjkzFhkmPVDQ9nz1G+sLZwsnDgviI8cdtoQOpov6CMNKASBPjodRH7l5vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10267

Add myself as a maintainer for the S32G2 SIUL2 GPIO driver and
the NXP S32 mailing list for reviews.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42d2d950877c..f47bdcb2c1c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16585,6 +16585,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/fsl,sgtl5000.yaml
 F:	sound/soc/codecs/sgtl5000*
 
+NXP SIUL2 GPIO DRIVER
+M: 	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
+F:	drivers/gpio/gpio-siul2-s32g2.c
+
 NXP SJA1105 ETHERNET SWITCH DRIVER
 M:	Vladimir Oltean <olteanv@gmail.com>
 L:	linux-kernel@vger.kernel.org
-- 
2.45.2


