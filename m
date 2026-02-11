Return-Path: <linux-gpio+bounces-31622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMilNDDujGmSvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822112795E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFFB302FAB1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D70359718;
	Wed, 11 Feb 2026 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a2oPaEd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED15352C22;
	Wed, 11 Feb 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843633; cv=fail; b=E23Y48uR0YAZH6piBC1s7oYf9CNs9UgW+ObNiQoWlVTPlGQDsOfMUVFZb2yT5E9aZkko5a3TC5Od4IR68Gr1pYX0nXiQGSKKzYIIOZHo22oWLVs9GYVs3EpXnzt56ttEyHgrYPwZi089/n1OlWc5nVmYlmGTLWfpEiPOejsARoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843633; c=relaxed/simple;
	bh=ZShXCoNwF6Vk1Q/Ievrx3k6u+0NbGUWsFgU6cPrTLfQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GBZAQBf9v/1iF6I9ITJLXRnbhAq509ZcsDXmxnl7BI7GX2mUyX6mwumO2rmocn4RYzZnHGTPxkjDTjZrTvaORjQU98oo00eQgkFmvHIH3eT4HjJa1kI3xfaYdehdEdWv5uLl3cjiw4XpN0iL/Ij/X9vAJluoHTholCUZMEi+lrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a2oPaEd5; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU+Xf2Azrfq4YjcBprW6Ts7yTkkLIjrPP/TnPkDeC00cWibn8RkaLlo+/MCi6sRe+MFz/KouwhoAGS/BI6yudIRY0AQlazuCcgGjWinthdXjLeFl4U3BypdqjVgUBmU0R5zX6HA3E6+keEdSjfHaxHu88jwb7QLodfJ7ryFZuuYflxjgbAVZ/zXVZp1Q3MTihnuq4MfU7FTNAGMTN5zmIXNIq28vZ2e79lL6roA4XNCtdrQgwwERy7oIk9SV/n8XZJfgx90u0CnpP0/aibdlLeV/2mRelbhzvPcN2KzxC+FNYmd1Bgy7ohAVxAveehNnue3Foa7C8jZuH3vzYGaNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmS09My3N0typIylUd9xHpWiSBYAME0QmcpUdz64un4=;
 b=IX2C3x0VrkqV+e/rOLZLDloSmoAtTqjbCij1wF2NUwy6m6CF9+5rvKcnB63sDN7yTZ0MJRrkiEMX7ZwJEYCWsH8vv6rW65r2zryFmxX1glq9ANORm/TJV23D5JnVsOYkcbO5vdkB3QtqbWfRm0JUCutdl2gqqpd2+4EhzGa7014ehCgHmwnu6jmt8LMemP94WRsrkXA6NnPKLyCGxYxSWQTwCDSMOTmT6COcSO9x/y3I5UWyg/Dlx5X12x5xn5Ecuy6lX7WECYZ8nZKKBLQ6aaavDYY0hJhUG5Shkrb02DA3ewzvWNqdEQMljgGcQV6H0k3guPWlsP5xam6kAhTJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmS09My3N0typIylUd9xHpWiSBYAME0QmcpUdz64un4=;
 b=a2oPaEd5lCEqAMWtvixZ7W+ZoZ4oO7J1IHEu2Vo1kcs6D4by+NF27+anzh+wS/4J2TWFfeuivMACluNgsloeJJmtD3Q3RsBpm3EOrhBIDgXWrsXRieeS9Pyzw44F7bRM+HdfC2mUEoakJimrefIsr6F2LOPKmpXzSDomuaZTsckFPaj6NB8KG17P6aJ62oZ4tVL2QtBBRvYbPtMpacETHQwc+AvxFHjbp8d7wzAHlcCIStHHYMOzHx59qOvf8bj/d0xNxiooM6dg3niGWjIZTL3YkijbzpJVoXqDdf0Cbb1jajmObJCfsuQzt6XVMtaYW32/cXRloDJQvzayDxqzuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:00:02 -0500
Subject: [PATCH 3/4] ARM: dts: imx: rename iomuxc to pinmux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx2_iomux_warning-v1-3-1c5233771b32@nxp.com>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=2085;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZShXCoNwF6Vk1Q/Ievrx3k6u+0NbGUWsFgU6cPrTLfQ=;
 b=vidVj93t2HAoR8359RMdY6wxj3GrrXPxXgpMPs1hbAyBIkm1WbXg2FHcKaKmKHGQlMM+yNa+M
 Jken+rJ9OUGB9ULx5Id42NmvKammA6ecbGQ0YXkAT+v0kasOREeaQ9I
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a712229-d7ef-4596-6f3e-08de69b0968d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3F1NjdmT1dqOHRtTDIyaGpDNi9UMFVjYVFhMmVPUFUyN1VIeEdRWGVpeXhF?=
 =?utf-8?B?dVZhSy9wK2FMMFNzdW0rczM4NmlqeG1oTWc3cjFXaFh0MThRWnA0LzJZZktl?=
 =?utf-8?B?bk9ZZDBteHp1WTRSdUN6cHpqSFNXRlk1MGoxQWN3akE5MmZvc1o0aVJBbVFL?=
 =?utf-8?B?dnJaYmxYanVrSlpXUitBT1pUaDJCSHJYNU9KOHdvcmN4bEVhSnRiNUVaOFFm?=
 =?utf-8?B?VnFxZXIwT0RIekMyTmo0UXYwUTdaSFZtdC9SY1I2YmJqZ3VEWEs2eHYyVFVB?=
 =?utf-8?B?VTMva3ZIdXd3SVlTMVlQZEUwV3hRSVpIaTBmRmUxRFNvU3RaMDJDc2xkdFYy?=
 =?utf-8?B?Tmw5RXM5L2RaUUFxcytyZmFnc1ZPbG8zcU02OGJhZkJxa2NEWFUxZkV2TDNl?=
 =?utf-8?B?d3AycUxYWFhBQlNlcHpLVmc0aVAyZE4zbWZsd0wwMDd6b0Zza1hyRlZ3Q21G?=
 =?utf-8?B?cU42ZnVrWEhobHNwZEFJTTh4Mnk0UzkzZXY3bFBWbjhwenJ3eVpyZFhIMWNy?=
 =?utf-8?B?Q2k0UHFSZ3BqWWhlRGZYWnFCUGxVM09XUU5PNmtlekZ3dDBCTHFmUEovQi9s?=
 =?utf-8?B?WjFaeTRQUjd5WFlkZXRxYnREUTNZM1NQV1MyZTZFZUx2SWVaQzI2cjFrc1du?=
 =?utf-8?B?VGVIdkVPQk5jN2JUcm15QVFJdHpKTFdOcDNiVGZ2UjJxZ2M2TXQ2VFY0MVhO?=
 =?utf-8?B?RVNPejBlTllrYkJ2UlFVYTVob3EzWVVTb3RDTEpNWTBoZTNvaHJVQnNnRTNM?=
 =?utf-8?B?NXJZOTZ3eVhyZzZKSzNrNjdUbHdQcFZSV2NnUGxYSmkycWJvSUl3UmxLQ3dx?=
 =?utf-8?B?SUxzVEpWZDZyckFzZktncU5ZQkNyN3p5cXdwU09XbEdFNy9lMTFVR2FZT2ho?=
 =?utf-8?B?UGRqU2hzVlVEZGQ2NTBYVVNHRDgxaGZ4MUJiSDdWUGFheTE5Qmt4ZHExVHYw?=
 =?utf-8?B?bWtQNHNjc3NDakpFVjNiOEpmZVUxQzlBU1dyVnlRN0QzMVovMm1pcGFSWGVj?=
 =?utf-8?B?NjNla1hmQjNMcHBQMDlnZmZBeWkxL0pIWkdheGI4K3NFS1FBWmdEdG5FOXQr?=
 =?utf-8?B?SXJRVklwbmROZ3RyWUFkeEhRSGxkclYrcE5DZzdkVkEyYmxBdFFENURjTVcr?=
 =?utf-8?B?UXE0RVczbElDS09BbTNROGk0bXRvVHRWL3pvZDQra3NldDhCLy9XdjZJRVhU?=
 =?utf-8?B?Z3F0ZXdyWjFKczB6WlpJTXpoOFE0OW8wMjZJbjZZT1NBUnpHb2Y2SVNzYUMr?=
 =?utf-8?B?TUpyRFBuZTExRVlYTGZlTExqK3poZ0dDdG9CTkFEclczKys0QlM1T0JuUm9z?=
 =?utf-8?B?QnpmbEl3K0hpNFp6UGN0T3pkcHRPanpuREJzbTYxSzVxY0dsWHpXdG8vQll0?=
 =?utf-8?B?Yk1tNVE0Wkd6MDVrcFNLKzBWbjZuQ0dEQ1pObGZJRnpFNTRPVU5XVkVDRWQz?=
 =?utf-8?B?VHEwQmxCTWUxd0hyTzFoM2hmRWs0ZUhRaGtaMEN0YWNIV0tuVGcyMjVJQk51?=
 =?utf-8?B?Q0VlZGRSTUlXeEZRUkZ3cTlreUNRc0Fua29xc3pucEw0YWk4Q3QreUxKZ2k5?=
 =?utf-8?B?d2NpVDBIck5PTlJCZ1c1MlVVdUhUWWFFeVR6WUFRWnY5OHVEUjdscEl1QXZw?=
 =?utf-8?B?VEFocXhkdVpwMWtOYTRJUjlSZ3Fuc0x6czNsTHl6ZTRYanpnZGpwY3BJUHF3?=
 =?utf-8?B?SGc4MU80OFFlUWtOS0t1T3lZRHdac0k2N1psRnQvQm94dnRQV2FTZXdXN3ND?=
 =?utf-8?B?dlRxVVdlajhTUFJWVUJESWh0Zm1PL0MwTVV2aDVZVEgrWFhMdmhYUUtNYjlG?=
 =?utf-8?B?SHAxa3gxU1MwbXRhVlZNNUlxRGovb04rU1k3SENjUTg3Z1MwcmUzWmRNYWMr?=
 =?utf-8?B?WG5HRzdDcDVkZmcrMmhZY29GVkFJZFU2M216M3FNTHU4bHhNWkl3djJRM3Zx?=
 =?utf-8?B?ODkvSHY5YjNud09ZN0ZDVTIzNk1FVUlsWlkyUlBla2ZNeVd6Q1A4UjZVQ1Zr?=
 =?utf-8?B?aWw0ZTZKeVNabFdRdnlBWElOWFJEMC93VkxrMkR4c3R2NU5tbVFnajc3dmFX?=
 =?utf-8?B?TmVudlNWZVBrRmNISWJVSVNnUXdlZ2I4SGNsSkcvVXEwaU9UWjhVVXNuTm0z?=
 =?utf-8?B?Z01ZT1ZwczcvR0pGWUxqWjlyeFhSdHN4VFJ1dEw2R1FEZWw4eDdPN1lqdDV1?=
 =?utf-8?Q?Ht9SaZBoTf4XfncqixJQfjTYoLYT4+AXOB3tfapkd4+W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGtMM1dVblA5WWVmWlNISXY2Z3FDWHdHTVpVWi81YW5pZFVNTFEyZkFpOTJZ?=
 =?utf-8?B?MHp6YUJpOWpGVlRSK0hPSUQrR0Z5K1hPaUVGZXJwaEJHc2t4a0tFMy92TEsy?=
 =?utf-8?B?L0RDYjNkNm1PK05xMHpmV3c0YjdRbTFWVCtpOXZubkttbjJKRE5hYkFoeWFR?=
 =?utf-8?B?Y3RKVnpTRS94MGlFRjF1eHFXUW9oSG1VV3RvT2sraTdURXVJSnNLLzdhbXlX?=
 =?utf-8?B?d2ZnTDYzM0pVaU5CL2JIbnZpVFZHUjRiQlE3RlZuczU2WkhyTVJRSjZ2TG5p?=
 =?utf-8?B?QldrTHd4Y2RzOVo0QWkxd2tYaEhQblJqdWEvazVOMkhtK1hzMENuYnhwSGFY?=
 =?utf-8?B?R3lreHk3c29UbXFXUE5XZGlZZDZaUnEzd2tLUmZKdG50L0pCUUZJNHVkRXpH?=
 =?utf-8?B?T2xzY2dJQUM1WEZjYXVTd1FLQlBIb2szWTh5MjFYTzZKSHBYV3JVaVVyOTF6?=
 =?utf-8?B?SEUrNjFoVEJ1N0prR1BMa1p5K0pRY3VJeHNxVVpxN3d0NXdwenBYZ3J3Q2lP?=
 =?utf-8?B?K1M1OEF6RzA5SThjMEhZMktHZ2lLaHdpTm8yOWROaEZPNjgzYlc5VUF0RDZ1?=
 =?utf-8?B?ZWE5WUJNNytjVVZYTWMwa2psdXlBa3lBQzFTUGtQVmszNGw5RjdhNGFKcUZm?=
 =?utf-8?B?Wmd4QnVaeHcxSW5tNm1OYnhJMTJYTzRyRUNZYis3STh4bmJuTEpKN1kwZXQ5?=
 =?utf-8?B?ekltcFh4eFFxd2VUSWlYaSttR3BHZ09NVng3b2RxaFJrSzFlSG9CeGZPZGtO?=
 =?utf-8?B?OXNQMUk5L2RzQy9qby9BbG1PcU94U2NESDJJSDRNZURxRnRjaG5jc3ROY1Jq?=
 =?utf-8?B?VDdHZXlxZ2VmK01RQ3dxMThoTG8xV1JPNG9PcWVHdjVERXJzUk9CNy91Nkp6?=
 =?utf-8?B?SytubWVDditlT3gxOFRqWmU2L0VEamhTQmgwb3NuM3E4QnBTZFlocTVPK21J?=
 =?utf-8?B?aW5EbjlEblZLZVhQMDRjOVhqV24rMDVHRDAvTGFoelZyUkdNazdYa1djdFY3?=
 =?utf-8?B?dm1McGx4RWkwVlh0b1l2R21kQUFoS2hiTnZXYnhLRFZzTXJiakJDdFQzdzVN?=
 =?utf-8?B?Rjl6WU5xcGhSSXFQenRhVDNxeElMUysyYVlrTFVwamE3THVWazVsVmNza0gx?=
 =?utf-8?B?OUt5TzJwMDNRTkZ6ZkhqUjJaY0dDWno1T2RDREsxMmdHbk8welROYXQ1YkpB?=
 =?utf-8?B?bUtyck12S2tYNEMwMWsvUjM4b0JBOU10NTA2bmJoVEVrWGZ0L1RrSkRSL0ZM?=
 =?utf-8?B?eFA3dW5Yb0VNL0pUS3ZvaEdibldqOVRockx6NHg2WlNOeUxrekxzdi96QXBq?=
 =?utf-8?B?NXZzeGd4K1pPcHZsWnlKTG5HVkJ3Y3NkSnlDQjcvdlFxNmhvcGZTN2NTcjFq?=
 =?utf-8?B?ZmRCVWxjVm9kSFZxeFc5bU1TUkoxZ0VmVTFyMXphTmUyV1BzMitpWER0eG4x?=
 =?utf-8?B?a1FmNE1tQTZBOEU0TDk1T2E5TGx1WTZTamRnWkl0VkhVUzNJdlZ3QlBZUlRZ?=
 =?utf-8?B?KzE0SlRGOU5YNktIelQ1ajBtdDV6MGU1dWJUTkZUazZEelJKVFdJUnBrTkM5?=
 =?utf-8?B?aFJFWFZsY09VbFdCQkMyQ3kzZ3ZOKzIza2FWaGkzOElCajRYckdSUnRwRjZF?=
 =?utf-8?B?VGNmZmV5bEVreXpFaFdzSXhPc3dnaHB4SFNNTjg5RXlLRWFCZ29JVkFPU2tu?=
 =?utf-8?B?em9lRW9xMFVlM3diOTFwc0xWdEM3TTd3TndjOUhOODZsMkZIZkFWb2NmVVlP?=
 =?utf-8?B?SUJRNldPUHhVQzE3NUhxelRsaCtTWEU1WnNqamt1NlZQaDk5RkZOL1lkaDNZ?=
 =?utf-8?B?Nm96cFV1cHpnZzZpQWxkWkFreElZQ0EraFFLRW1KV2FhVjJsdWZUMTV0em9M?=
 =?utf-8?B?NVBZY0VudkdmT21ja0Rmdm0yUEJlaE1ET2FjVmpKQUtCTlBKbjF2dUZEUXVH?=
 =?utf-8?B?TDB2bDRXVVhRVGphRnIwNWY2TlZnOTE3QkNSMm1OY0xTTFN5WjEra2pyVnh0?=
 =?utf-8?B?aGc5UUc0U0p0Vi9SV3h4VSt4WFpXaTdzQ25xK09lZzkxNkFyajdBRkF0bDFt?=
 =?utf-8?B?TGd0OHNpNld1Tmp5OXN6d3Nka0xIanpWNmQ0YXM2UXYyeGcrSDl6cnZ6dnZy?=
 =?utf-8?B?SFEvU3BHT1VkanV2VTFWc3hEMmpPTlhmQm1pa2x3bjh3d0U5cnhKbWs1RVdI?=
 =?utf-8?B?bEIvMFJjQVMzbVNVejhTaDYxZTZMMFZaT3Q0cGJtbmFKMGZoby9CT0lINU1R?=
 =?utf-8?B?dzVPN1AxWFVxQnpyZDk2b0xObTQ3L3EvaVJnSmljOFhLUzIxWUNTUlY1Ungv?=
 =?utf-8?Q?nsOX3QszL2Xzc9WIpS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a712229-d7ef-4596-6f3e-08de69b0968d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:29.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETGG7/Qf4Zc1KKwFwB7Nqtx2PuMoRwZvPSb5UJ9IQ9iRdunfnQ2HOjkRaWgdofKQPeH8aKANYMi7j2MJ68t4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31622-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[43fac000:email,nxp.com:mid,nxp.com:dkim,nxp.com:email,21c000:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3822112795E
X-Rspamd-Action: no action

Rename node name iomuxc to pinmux. Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: iomuxc@21c000 (fsl,imx1-iomuxc): $nodename:0: 'iomuxc@21c000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
        from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx27-iomuxc.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx1.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx25.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx1.dtsi b/arch/arm/boot/dts/nxp/imx/imx1.dtsi
index a1a89ccacf05589216d80e2b00bba2a1c3b32e62..ed04a907b3f795e45ce37963143915be05b56789 100644
--- a/arch/arm/boot/dts/nxp/imx/imx1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx1.dtsi
@@ -202,7 +202,7 @@ clks: ccm@21b000 {
 				#clock-cells = <1>;
 			};
 
-			iomuxc: iomuxc@21c000 {
+			iomuxc: pinmux@21c000 {
 				compatible = "fsl,imx1-iomuxc";
 				reg = <0x0021c000 0x1000>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
index 82601a4b7b4b5a90d744217beda68b19fbbb6767..54a116533c45883d9a2f7823a2e48b2f82a17b1e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
@@ -195,7 +195,7 @@ kpp: kpp@43fa8000 {
 				status = "disabled";
 			};
 
-			iomuxc: iomuxc@43fac000 {
+			iomuxc: pinmux@43fac000 {
 				compatible = "fsl,imx25-iomuxc";
 				reg = <0x43fac000 0x4000>;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
index 989b7659b6692afe23884748a58aa5a8484ff4f3..3a8ca1c3f179361870d95136b1141c147132c840 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
@@ -289,7 +289,7 @@ sdhci2: mmc@10014000 {
 				status = "disabled";
 			};
 
-			iomuxc: iomuxc@10015000 {
+			iomuxc: pinmux@10015000 {
 				compatible = "fsl,imx27-iomuxc";
 				reg = <0x10015000 0x600>;
 				#address-cells = <1>;

-- 
2.43.0


