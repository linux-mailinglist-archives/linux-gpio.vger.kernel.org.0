Return-Path: <linux-gpio+bounces-23091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94FB00504
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CCB04E4037
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA69273D7D;
	Thu, 10 Jul 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p5Xpvlba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ED42737FD;
	Thu, 10 Jul 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157331; cv=fail; b=eVamTO6CZB3QiKC4jc51MXwcRnAa4SccPnzN3BSY5J337KG0wVnWU1nw5ZgvhT7uiwF4WUN9uPUY2MSYjuB5YrPUYM9NuuRYHtPGq5wDQH5bvK2rPjVQr+05u6k4dXe/pQa69mHBm9qSaxUVB/fymYGmVaOSixpmbPejL/zDCJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157331; c=relaxed/simple;
	bh=nLZY/+BNqYFUOq8Ol2YpP3n1EtQnNq58cHeOlkIMEvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Miw7srA1qgppDOMDrD4MbARGIM3xUL7DdpdeiyY71s6gMbPWexZcKWkO9MpKBYani0gF6lwJLGL4vWh9G4IphQzntx+SvcztTuraFmz6zNTNpT74g3x01ucr++EudGLulcSMF/3UU/TCpfOrPmdnXQ+fvJ62kc9wNf2c5LB0G5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p5Xpvlba; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9rRtDO/C+SbasKuxnUcsu7naGpSNmZkW3dG/J4rITWxIaUL1cZZoTkzxxola8Wo7pEd03stqV95ZR2qQ3Ynqxo+d1E8nL8qhTKTGvs55N9Nr3GikyAdYKgZBnI+3IO4cUtZbQHm9KhfJQj2X8Vrqq3VPDLktrYcyGB8ZdHkBoNLJ5bktyaNJKStIS6jFq60o1DnbWwggP8zFSTcNEez4YqJSlOM6pZsLx41tmOrxlJczwHMRaI9sndpcyVUO6RqAiDd5IEFarb7vDFUTbkr7VHpQmQnr0tEDC9uUwF+8fPVm7eudf82xrZb+IzQH55SvMPAgHSKJX14rg/XQRsV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPmVlmf4RzgEkCYidQe/Bg630/JxtcJbWILTfyTa8Fk=;
 b=rNr0iVqJ5Lxo6CPs3CbDbnuzyA38sRULzjOinIq++RYWsCobjP0kPb5xFs1oKqrYGaxFbxMbcI5bnfIEhrz5lMjkAYcR27NGIl5igyqs92kOLOuHF2qFtSF6mIs0qoOYTwJlHGDTCEXqlyh3M5QWd6WJP8vJeON3oeNQRa17Yfc9ZfbNrQctxRB1yxHwBmmmp6HSgjgBFEZ2At6QpWQszHkckCzkjRjRdqM0FYzKGa3NtyRqNbJSOd1hRcTX52ut7AFR5tK4+ASfTbdEtCnRAl3f+/D+5UCsEo1McPJ+Tjq8co4Ypo489YY46V88ThSMV/kxbOezyXvZ0qdltY5qFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPmVlmf4RzgEkCYidQe/Bg630/JxtcJbWILTfyTa8Fk=;
 b=p5Xpvlba+m9I8egYpFFK8gDFJ/J+j9TbK6DSwNBpIUEIUAucrQlDe21PLvXwYbFjhN27KARf+YpWZyKb3q1r71Xg7Z9pHm5qVtcY6gz+UWgVbI79BXDOpbtL0hpgBr50KD4rHHC7Ygpqg6OOeW/LR+bth58xKW189osl1f1EAwxigTc8gc5VxTSZMFjrh+ggQKK71C7RKXBj631tv8gsu7yyHaSCI7x3o7jaQcvgpIsuIygniK6e4XHfk0yUFwFNaNTrqsasKrrte9MSX3ZC4faa/jrf5P6O521uAqjtfeyU0Uw0MEn5oI8Lw/KjzUDdxBDoGkpSZg+HlFZ5R2sBww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:05 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:05 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 02/12] mfd: nxp-siul2: add support for NXP SIUL2
Date: Thu, 10 Jul 2025 17:20:25 +0300
Message-ID: <20250710142038.1986052-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: d37a42dc-43e9-4d9d-e51d-08ddbfbd2507
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djhhTFRCWWVSSVZua1BLNFJicXBoeUd3ZmlCY1ZoTGIxVHcrSmlpTnhiUWxU?=
 =?utf-8?B?N1lsdkN3bzFURWx3REpSdlVpOXVwTm5NeC9ELzdLNnNiMllFTXAyNFRWbHR4?=
 =?utf-8?B?R2NtV2pMRUNndWRMY3FhRmY3Z0ovakQ5V0poMUYxRTl4MytsbGQ1SmUybTI1?=
 =?utf-8?B?c2VvSEdqZm9LUGtrT3VGOHh2TmRFak41UGRIWHRsYkJHZzUzK1d6M3JzNWUv?=
 =?utf-8?B?ZFMrdUpKRWc4VmJJSFNoaHFTZXhleGFIWFdGUVNSTTVob3FubHIrTjNhV3lX?=
 =?utf-8?B?SXgzLzYzazJuMVcxdHFBaHZlczNjR01Qd3JJbTBvVEg2clFIMzIzWnF3Vk5D?=
 =?utf-8?B?UGdRc0RsOWRWbnRSMGkweTI3RHJhVWQ5UEpoTjQzZ0ZLSVFCRTZ5Z1I4ZGR4?=
 =?utf-8?B?Vm4za21naWZHVVM4SEUxem44ZkF6ZTJGL2ZwYk40YUZLTmE1TUJzdEpnK0Iw?=
 =?utf-8?B?MjRCRE9QREZZSmZIRFNyY3dtOFF5L2JFTUhEZFdjVzlCR1lvdmZNWVJ0WEJC?=
 =?utf-8?B?YXBXTkxrN3EwK2g5RUFwYm9hSVpqaDFOUUhDa1B4NEhBNW0rR25BazFPMWVk?=
 =?utf-8?B?SzlEMTdqMThWaHVKV0V1dmlURlI1ckZwbU4weFlUUHlQbjlKUU9ZVDJkLzMy?=
 =?utf-8?B?Z255Nk1aNUFnVmhiZzVJcHBQUkJ6Mmc5WUpoQlUvRUFyTUxLczRGNE1oVGEz?=
 =?utf-8?B?SFVCRzJNQ2NENXJZdGN6Q2pncHRCMVp4aTdhc21QMktVSG9LSmtnWDFIcUJT?=
 =?utf-8?B?d1ZlS3N1QUowWnk0OGg3ekR2dXhyTXI5aWtEZjdGdVBBT0tGMjU2S05CQ3Zh?=
 =?utf-8?B?WWpEOUNzYUlpUjArUVdyN3F3V2JNaUw3S3BuNkFlMzhwa25TZGhTRGh1YlNm?=
 =?utf-8?B?L3ByYTh1S2RXZjQ1UEVydVphU2dOeHh3UkRJZ2tXdFF5QTFrNVZQTDR5czJN?=
 =?utf-8?B?V2dKQ3R3NEZ0ZHlzcGVUakdQbnlVbW5NakhGR1pBVVRWRmJUei91T01NWjA3?=
 =?utf-8?B?L0JCWjIyZlc5UE8xVGJVMWJkQmN2bFh2Sy9jdmNwYm4yTElPSTFHYW1RdmFk?=
 =?utf-8?B?TDVXRGtOcE1xUUxLYTBmOW53SUpyYUdPM3hZZWdHdGltTXlDcHk4REN4cE9p?=
 =?utf-8?B?eGNHVUJFaitRd09KMGpVMzlaU0w1Wnl4SVRnVEs3dWFvS0tKMk55dy9DQkxN?=
 =?utf-8?B?Y25raTVPVmdqOGd2N2dvdk5uZWJxVk5hMzRnakhsekFpWGlwelc3alZrTjNF?=
 =?utf-8?B?ZWF0dXcvREFteTBCYytOOU1uWnIrNEJUaXhFV2RJenJPdG4vNlJzRlFNYU8v?=
 =?utf-8?B?Y1k3T0VuOHhDM01FZVFJalNjNVd5MlUvNEFhSUh6OXgxNVloWWZCS1lXQmFB?=
 =?utf-8?B?b0RqQVhVY0o1dWZoWTI4cUtvcVU0eDVjRzg0QjZsZUxOTXdrUUhwaXlNY3NF?=
 =?utf-8?B?QkFmSUlZYU5iSE1OZWlXU3dtTTluRnFNSUl1aVl3dUtPUTM1dUdGQ21ZUVRO?=
 =?utf-8?B?YUlQY29pTEtkYThyL0dPdTJUNGh6ZXJUM0QvNmRJZktIUk1oVG1qMXloWmM3?=
 =?utf-8?B?Y3lCbm1QYzFHdGNRank3WE9NTW95NUk1bjdlU0t5RDN6MnlxOWJKK1ZUU1hQ?=
 =?utf-8?B?a1dTOVJyd2h6V1RXSU8xR3N5eEJFNGY1THZQcE1xZ043cHBZTjV1QjlJRmdU?=
 =?utf-8?B?c2hGaDdXNEJvVjZkRUo5bllMdVVsdVlST3NzY3hMNVJRbzVzYmRMa0R6MVdN?=
 =?utf-8?B?aE1XZEdWRkliRld1eTlrUUY0RHZkZVBRM0Q0RWlHZXZlbHM1aUx5L2hwU1U1?=
 =?utf-8?B?aHRaUzRJMENodUxLYmRzUEFsUThpdzFkZlpKVHhSSUtlQTdZYjVZT1ZONXFz?=
 =?utf-8?B?eFhtZVB1Wm1ydjZKTHNmb0Qwc2lLUGQ4MFo1L0wrV3IzODM0RzRCbWNvcXM0?=
 =?utf-8?B?Uk9NUUM3WitGaXIzNlUxV2lZTEVBSlRKdW1tT3NERHptMjhFdUFiS2NZZzk5?=
 =?utf-8?Q?F52qf/XuBmBnmZO5I+kRO2bxYfstXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnJPY1pGaVFFa0dRbk1lQkVydXQ1eUJ2U25HK3k3cHV2aUNmZTcwWFdwKzJk?=
 =?utf-8?B?UWRQMmcvUkZnelAxV1BmMkJsY0MrN21POUhORUNLN0paYVlCK0dXMXJ5UmdM?=
 =?utf-8?B?MDZ1dlBIZ0I4eTVLZ0xZejNEcDJIQXdxdlpRQkFET1lydFUzeThXR1c3Qndj?=
 =?utf-8?B?RTF0aHZGMU1aYXNWak9tZExYK2RHY2ZNbFpjcENQbDNjZkJOS083UnFNRzVL?=
 =?utf-8?B?Rml3Z1lJTzRMZnA4ZEtKWklqRjI3R1RLUWFqN2gxdlVLZUVUYWcxc3JXSTV1?=
 =?utf-8?B?VVVFZ0tWY1NYYUljcG1DNlhzRThIUTJSY2pZNHJ5dGNna0RDcWY4K2JhMXJh?=
 =?utf-8?B?NnR4RnB2bXo4cE5YWCtINUN3N01GSXd4cVYxOEkzWWNBa0VidjVEYkRnZmtG?=
 =?utf-8?B?SGpqT2pWaGJMZW9TSFU2U1QxbWZ4STRkV2s0cnpYcXc0S3pjdnEvRitzcGJO?=
 =?utf-8?B?WFphVFZmUEVqNS9iL2F0U2QrWWM4SXlOMWlMWjhhaTZ5azIyUGJuQ3puZ3NC?=
 =?utf-8?B?ZVdVenBDOEIvbGZhY05pMDRCZkxERHhmWndWSzNsQVI3b0hNdWV3U1k0QWFa?=
 =?utf-8?B?Y1VQbnBsOXQzQnB3V0tiTE43Q2NYMHMwbEhMSXBPL2JZZTFMSGg2UjNkL3Ni?=
 =?utf-8?B?bUFoTGg1K3BxaEFWQkRSckQ0bFQwbUpOSkhYeHJ0cmdDMjhKRlN3M3pXM3Ju?=
 =?utf-8?B?YlY2V3pKd05WS20vMDJCQmFUK0FDOWd1Zk1XMTlpUjh4MVpvdUFWSFU5V2Mx?=
 =?utf-8?B?R0Q4eXcyazhmQjlDQU5PbEdLazgrRmhhQmVkc1dDZENBc0x6c3QzTk9Md1hF?=
 =?utf-8?B?YzFQVk1vN1piS0l4VU4zbzBTZWM4dWRxM0RISGIvVkNIOG5BQ1VSUU9KN2ZD?=
 =?utf-8?B?M3gwU29zcHltSndCRnlRMTNwNTBEeC9seEcrUlducUFLb1JxQzZ2M0IrUVZk?=
 =?utf-8?B?SFR2N3VHQVRSSFJzK1E5bWVIOGhLMW5xK2tsOTVxS3dKNDlRdHdKVXZTNm1h?=
 =?utf-8?B?OXJFVE1jd1h0cGxvQ1AvcTN1Q1FWNFV2cWQyNWRRSUdjNXZxMlVtWVN1WGVT?=
 =?utf-8?B?cWU5OUFuQytOZkVqTWo4OCt4a2hxOUd2T2tpdEpRWnpPVnJ2VEx1MkVQQXZk?=
 =?utf-8?B?OTgwMURPVUF1NDNRUVBsYlhhRzl3VUd6N2N6Vnc0dHdBVVZCVWJZZGN5cjAr?=
 =?utf-8?B?OWJwVzIvNVI2REh5blUzaWZCWENRaW5NU3hOOUp6ZjZnWU0zb0lIc0REeG53?=
 =?utf-8?B?VEdFYTl1RUYramo4VEdhcjl4ZmtpV0pCbXNGb05ESVFaNHNSb2Z2dkhnRldC?=
 =?utf-8?B?M2pBRDRCUnh3elRvUFZPVHhvMERkMEk4cU92amVPdjlBTHA2NkFCUSt4NUFy?=
 =?utf-8?B?cHl1NW95anNmM0E4dlZlbC9mVkdvdkhHeHpSdjJzYjFCWHlVZ0hCaTNpZmZi?=
 =?utf-8?B?czlwQmFJQ1kvOEdtWDZTb0F0OTBKemQ3OUdlOWFLRVVGUHVFZThLWEtTUXlN?=
 =?utf-8?B?aDNjTU9sS2FRRXQxNXUzOUV4eXdYVHFaVTExMUxjTFB4TXh0RnhqdU1VWHgy?=
 =?utf-8?B?UldGYWVpcDV1Vis2ZmV1aHFKODliWUYreExmL3FrVzduYUdkc2hGcTFzTVE3?=
 =?utf-8?B?TDNNL1djR3NEcGs4a1ozOUVxb0dTMVhPYmp5UmpQZldvYzZrZEFBM05sOWlH?=
 =?utf-8?B?SEhIcm9zQ3NzMU1FZkxvMjJtd0owMDY3N3JKN3ZlNTh1YjJLU2dhMlB0Mm1O?=
 =?utf-8?B?aG51WlgxM0FsckthbFg0K1kxN0N0RkN6QktSMTJLbmZsUVY4WDZucnhtZmZy?=
 =?utf-8?B?S2FUWS9zeTRQZEJGcWxkZWg1ejl6R2F1NzJ5bmJRQzk0cCtjZnBrcTczQ0F0?=
 =?utf-8?B?a0RmQkxwbmhOZzU5T3RhdnhlQVBSemU4aFh2VmhTU0luNnJMcVhBSksyTllY?=
 =?utf-8?B?SUpuUGRhaVpzNHo4WHZGdmFIcUlXNisxTVNYL29JeERxS0FSek5KMU8xZS9U?=
 =?utf-8?B?UUExVkV4d0cwRFdBMVJMZ0pmQzVhbzhCWnB1L3pZaUxxRDh0dzVnSFh0TmFz?=
 =?utf-8?B?a0pidHRrZy81YU9ONnBKM3BneEdlK0RHTlpQbEtlWWkxVjJ6Qi92emIzU1Jq?=
 =?utf-8?B?NXEzbmJIQWlWNFhCSzZuY0g4VEdIWXBUcUc5ZW9OMlNpK0grZ0NDUWtsVzFL?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37a42dc-43e9-4d9d-e51d-08ddbfbd2507
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:04.9675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xbd6mqhbBVe4LzVshmASgZJnP+w9p2ClJoGebUN45d4zIaDKB3xvFbgOP4/qAu6Fp0YQ1o9jbNyPtaMsj3sg+W8/DQtdhWYm+kiXQVceBb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

This commit will add support for the NXP SIUL2 module as an MFD device.

SIUL2 (System Integration Unit Lite) is a hardware module which
implements various functionalities:
- reading SoC information
- pinctrl
- GPIO (including interrupts)

This commit only adds support for pinctrl&GPIO(one cell). Further
commits will add nvmem functionality(a second cell).

There are multiple register types in the SIUL2 module:
- MIDR (MCU ID Register)
	* contains information about the SoC.
- Interrupt related registers
	* There are 32 interrupts named EIRQ. An EIRQ
	  may be routed to one or more GPIOs. Not all
	  GPIOs have EIRQs associated with them
- MSCR (Multiplexed Signal Configuration Register)
	* handle pinmuxing and pinconf
- IMCR (Input Multiplexed Signal Configuration Register)
	* are part of pinmuxing
- PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
	* Write/Read the GPIO value

There are two SIUL2 modules in the S32G SoC. This driver handles
both because functionality is shared between them. For example:
some GPIOs in SIUL2_0 have interrupt capability but the registers
configuring this are in SIUL2_1.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/mfd/Kconfig           |  12 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/nxp-siul2.c       | 410 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/nxp-siul2.h |  55 +++++
 4 files changed, 478 insertions(+)
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..e6634e05091e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1143,6 +1143,18 @@ config MFD_NTXEC
 	  certain e-book readers designed by the original design manufacturer
 	  Netronix.
 
+config MFD_NXP_SIUL2
+	tristate "NXP SIUL2 MFD driver"
+	select MFD_CORE
+	select REGMAP_MMIO
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this to get support for the NXP SIUL2 (System Integration
+	  Unit Lite) module. This hardware block contains registers for
+	  SoC information, pinctrl and GPIO functionality. This will
+	  probe a MFD driver which will contain cells for a combined
+	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
+
 config MFD_RETU
 	tristate "Nokia Retu and Tahvo multi-function device"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457..02e3cc0a2303 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -224,6 +224,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
+obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
new file mode 100644
index 000000000000..904f41b3c61b
--- /dev/null
+++ b/drivers/mfd/nxp-siul2.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2(System Integration Unit Lite) MFD driver
+ *
+ * Copyright 2025 NXP
+ */
+#include <linux/init.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nxp-siul2.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#define S32G_NUM_SIUL2 2
+
+#define S32_REG_RANGE(start, end, name, access)		\
+	{						\
+		.reg_name = (name),			\
+		.reg_start_offset = (start),		\
+		.reg_end_offset = (end),		\
+		.reg_access = (access),			\
+		.valid = true,				\
+	}
+
+#define S32_INVALID_REG_RANGE		\
+	{				\
+		.reg_name = NULL,	\
+		.reg_access = NULL,	\
+		.valid = false,		\
+	}
+
+static const struct mfd_cell nxp_siul2_devs[] = {
+	{
+		.name = "s32g-siul2-pinctrl",
+	}
+};
+
+/**
+ * struct nxp_siul2_reg_range_info: a register range in SIUL2
+ * @reg_name: the name for the register range
+ * @reg_access: the read/write access tables if not NULL
+ * @reg_start_offset: the first valid register offset
+ * @reg_end_offset: the last valid register offset
+ * @valid: whether the register range is valid or not
+ */
+struct nxp_siul2_reg_range_info {
+	const char *reg_name;
+	const struct regmap_access_table *reg_access;
+	unsigned int reg_start_offset;
+	unsigned int reg_end_offset;
+	bool valid;
+};
+
+static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
+	/* IMCR0 - IMCR1 */
+	regmap_reg_range(0, 4),
+	/* IMCR3 - IMCR61 */
+	regmap_reg_range(0xC, 0xF4),
+	/* IMCR68 - IMCR83 */
+	regmap_reg_range(0x110, 0x14C)
+};
+
+static const struct regmap_access_table s32g2_siul2_0_imcr = {
+	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
+	/* PGPD*0 - PGPD*5 */
+	regmap_reg_range(0, 0xA),
+	/* PGPD*6 - PGPD*6 */
+	regmap_reg_range(0xE, 0xE),
+};
+
+static const struct regmap_access_table s32g2_siul2_0_pgpd = {
+	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10),
+	/* DIRER0 */
+	regmap_reg_range(0x18, 0x18),
+	/* DIRSR0 */
+	regmap_reg_range(0x20, 0x20),
+	/* IREER0 */
+	regmap_reg_range(0x28, 0x28),
+	/* IFEER0 */
+	regmap_reg_range(0x30, 0x30),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq = {
+	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
+	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
+};
+
+static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
+	/* MSCR112 - MSCR122 */
+	regmap_reg_range(0, 0x28),
+	/* MSCR144 - MSCR190 */
+	regmap_reg_range(0x80, 0x138)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_mscr = {
+	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
+	/* IMCR119 - IMCR121 */
+	regmap_reg_range(0, 8),
+	/* IMCR128 - IMCR129 */
+	regmap_reg_range(0x24, 0x28),
+	/* IMCR143 - IMCR151 */
+	regmap_reg_range(0x60, 0x80),
+	/* IMCR153 - IMCR161 */
+	regmap_reg_range(0x88, 0xA8),
+	/* IMCR205 - IMCR212 */
+	regmap_reg_range(0x158, 0x174),
+	/* IMCR224 - IMCR225 */
+	regmap_reg_range(0x1A4, 0x1A8),
+	/* IMCR233 - IMCR248 */
+	regmap_reg_range(0x1C8, 0x204),
+	/* IMCR273 - IMCR274 */
+	regmap_reg_range(0x268, 0x26C),
+	/* IMCR278 - IMCR281 */
+	regmap_reg_range(0x27C, 0x288),
+	/* IMCR283 - IMCR286 */
+	regmap_reg_range(0x290, 0x29C),
+	/* IMCR288 - IMCR294 */
+	regmap_reg_range(0x2A4, 0x2BC),
+	/* IMCR296 - IMCR302 */
+	regmap_reg_range(0x2C4, 0x2DC),
+	/* IMCR304 - IMCR310 */
+	regmap_reg_range(0x2E4, 0x2FC),
+	/* IMCR312 - IMCR314 */
+	regmap_reg_range(0x304, 0x30C),
+	/* IMCR316 */
+	regmap_reg_range(0x314, 0x314),
+	/* IMCR 318 */
+	regmap_reg_range(0x31C, 0x31C),
+	/* IMCR322 - IMCR340 */
+	regmap_reg_range(0x32C, 0x374),
+	/* IMCR343 - IMCR360 */
+	regmap_reg_range(0x380, 0x3C4),
+	/* IMCR363 - IMCR380 */
+	regmap_reg_range(0x3D0, 0x414),
+	/* IMCR383 - IMCR393 */
+	regmap_reg_range(0x420, 0x448),
+	/* IMCR398 - IMCR433 */
+	regmap_reg_range(0x45C, 0x4E8),
+	/* IMCR467 - IMCR470 */
+	regmap_reg_range(0x570, 0x57C),
+	/* IMCR473 - IMCR475 */
+	regmap_reg_range(0x588, 0x590),
+	/* IMCR478 - IMCR480*/
+	regmap_reg_range(0x59C, 0x5A4),
+	/* IMCR483 - IMCR485 */
+	regmap_reg_range(0x5B0, 0x5B8),
+	/* IMCR488 - IMCR490 */
+	regmap_reg_range(0x5C4, 0x5CC),
+	/* IMCR493 - IMCR495 */
+	regmap_reg_range(0x5D8, 0x5E0),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_imcr = {
+	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
+	/* PGPD*7 */
+	regmap_reg_range(0xC, 0xC),
+	/* PGPD*9 */
+	regmap_reg_range(0x10, 0x10),
+	/* PDPG*10 - PGPD*11 */
+	regmap_reg_range(0x14, 0x16),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_pgpd = {
+	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
+};
+
+static const struct nxp_siul2_reg_range_info
+s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
+	/* SIUL2_0 */
+	{
+		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MIDR", NULL),
+		/* Interrupts are to be controlled from SIUL2_1 */
+		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
+		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
+					     NULL),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
+					     &s32g2_siul2_0_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
+					      "SIUL2_0_PGPDO",
+					      &s32g2_siul2_0_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
+					      "SIUL2_0_PGPDI",
+					      &s32g2_siul2_0_pgpd),
+	},
+	/* SIUL2_1 */
+	{
+		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MIDR", NULL),
+		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
+					    &s32g2_siul2_1_irq),
+		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
+					     &s32g2_siul2_1_mscr),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
+					     &s32g2_siul2_1_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
+					      "SIUL2_1_PGPDO",
+					      &s32g2_siul2_1_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
+					      "SIUL2_1_PGPDI",
+					      &s32g2_siul2_1_pgpd),
+	},
+};
+
+static const struct regmap_config nxp_siul2_regmap_irq_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+	.volatile_table = &s32g2_siul2_1_irq_volatile,
+};
+
+static const struct regmap_config nxp_siul2_regmap_generic_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_NONE,
+	.use_raw_spinlock = true,
+};
+
+static int nxp_siul2_init_regmap(struct platform_device *pdev,
+				 void __iomem *base, unsigned int siul)
+{
+	const struct regmap_config *regmap_configs[SIUL2_NUM_REG_TYPES] = {
+		[SIUL2_MIDR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IRQ]	= &nxp_siul2_regmap_irq_conf,
+		[SIUL2_MSCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IMCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_PGPDO]	= &nxp_siul2_regmap_pgpdo_conf,
+		[SIUL2_PGPDI]	= &nxp_siul2_regmap_pgpdi_conf,
+	};
+	const struct nxp_siul2_reg_range_info *tmp_range;
+	struct regmap_config tmp_conf;
+	struct nxp_siul2_info *info;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *reg_start;
+	int i;
+
+	priv = platform_get_drvdata(pdev);
+	info = &priv->siul2[siul];
+
+	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
+		if (!s32g2_reg_ranges[siul][i].valid)
+			continue;
+
+		tmp_range = &s32g2_reg_ranges[siul][i];
+		tmp_conf = *regmap_configs[i];
+		tmp_conf.name = tmp_range->reg_name;
+		tmp_conf.max_register =
+			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
+
+		if (tmp_conf.cache_type != REGCACHE_NONE)
+			tmp_conf.num_reg_defaults_raw =
+				1 + tmp_conf.max_register / tmp_conf.reg_stride;
+
+		if (tmp_range->reg_access) {
+			tmp_conf.wr_table = tmp_range->reg_access;
+			tmp_conf.rd_table = tmp_range->reg_access;
+		}
+
+		reg_start = base + tmp_range->reg_start_offset;
+		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
+							 &tmp_conf);
+		if (IS_ERR(info->regmaps[i]))
+			return dev_err_probe(&pdev->dev,
+					     PTR_ERR(info->regmaps[i]),
+					     "regmap %d init failed: %ld\n", i,
+					     PTR_ERR(info->regmaps[i]));
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_parse_dtb(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args pinspec;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *base;
+	char reg_name[16];
+	int i, ret;
+
+	priv = platform_get_drvdata(pdev);
+
+	for (i = 0; i < priv->num_siul2; i++) {
+		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
+		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
+			return ret;
+
+		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
+		if (IS_ERR(base))
+			return dev_err_probe(&pdev->dev, PTR_ERR(base),
+					     "Failed to get MEM resource: %s\n",
+					     reg_name);
+
+		ret = nxp_siul2_init_regmap(pdev, base, i);
+		if (ret)
+			return ret;
+
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						       i, &pinspec);
+		if (ret)
+			return ret;
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Invalid pinspec count: %d\n",
+					     pinspec.args_count);
+
+		priv->siul2[i].gpio_base = pinspec.args[1];
+		priv->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_probe(struct platform_device *pdev)
+{
+	struct nxp_siul2_mfd *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num_siul2 = S32G_NUM_SIUL2;
+	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
+				   sizeof(*priv->siul2), GFP_KERNEL);
+	if (!priv->siul2)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	ret = nxp_siul2_parse_dtb(pdev);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id nxp_siul2_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2" },
+	{ .compatible = "nxp,s32g3-siul2" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
+
+static struct platform_driver nxp_siul2_mfd_driver = {
+	.driver = {
+		.name		= "nxp-siul2-mfd",
+		.of_match_table	= nxp_siul2_dt_ids,
+	},
+	.probe = nxp_siul2_probe,
+};
+
+module_platform_driver(nxp_siul2_mfd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
+MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
new file mode 100644
index 000000000000..4603a97e40e4
--- /dev/null
+++ b/include/linux/mfd/nxp-siul2.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * S32 SIUL2 core definitions
+ *
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DRIVERS_MFD_NXP_SIUL2_H
+#define __DRIVERS_MFD_NXP_SIUL2_H
+
+#include <linux/regmap.h>
+
+/**
+ * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
+ * @SIUL2_MIDR - SoC info
+ * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
+ * @SIUL2_MSCR - used for pinmuxing and pinconf
+ * @SIUL2_IMCR - used for pinmuxing
+ * @SIUL2_PGPDO - writing the GPIO value
+ * @SIUL2_PGPDI - reading the GPIO value
+ */
+enum nxp_siul2_reg_type {
+	SIUL2_MIDR,
+	SIUL2_IRQ,
+	SIUL2_MSCR,
+	SIUL2_IMCR,
+	SIUL2_PGPDO,
+	SIUL2_PGPDI,
+
+	SIUL2_NUM_REG_TYPES
+};
+
+/**
+ * struct nxp_siul2_info - details about one SIUL2 hardware instance
+ * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
+ * @gpio_base: the first GPIO in this SIUL2 module
+ * @gpio_num: the number of GPIOs in this SIUL2 module
+ */
+struct nxp_siul2_info {
+	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct nxp_siul2_mfd - driver data
+ * @siul2: info about the SIUL2 modules present
+ * @num_siul2: number of siul2 modules
+ */
+struct nxp_siul2_mfd {
+	struct nxp_siul2_info *siul2;
+	u8 num_siul2;
+};
+
+#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
-- 
2.45.2


