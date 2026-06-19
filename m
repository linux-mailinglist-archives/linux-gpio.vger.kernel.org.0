Return-Path: <linux-gpio+bounces-38713-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1yA2GChjNWoyuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38713-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:41:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCC6A6C2C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:41:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=vDG6jG2m;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38713-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38713-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 201E13012B00
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B8B3B3895;
	Fri, 19 Jun 2026 15:41:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11033B27FB;
	Fri, 19 Jun 2026 15:41:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883685; cv=fail; b=GnTHwKW6772WpTYmabuk1xXkHgNfORrcMONISC57bs4L6QLxYqWHBF2FQHWD9tRG1tTsiWgaeX3mVj/9HOIFfIWkaDAOPi8T/IzS3+1QH7JALytp5FBQ3GhORwn0VFPrk7la5CRd4dt9ioVMAjYKh761EhIiAv3hNIMXDfbtk5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883685; c=relaxed/simple;
	bh=niBM/b6MzXcCC9rb3Vc9QoKu6antCXoFNtrcCraXi0U=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CvZcEHXs00d5MItPSfK0hF+ntHy8m/uHGTkXa5QnIlobMUuo1PXqPk3ppA9T1zR9e28L1NPSbtGYzEjPcKzgfL3iMeMSI1LVVZi8IQgiYh5gG7z49JCgxHAq8/pQYpYsXtg2PtRI8u9mEQXR+VB1zdsAXKeEqkyOhBwFkTH1EFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vDG6jG2m; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qz1EPCMEC62a5AogpGvBb4LGdhzUNdUGDzcmz1B/zJVWV0S9FFnAIC6Iz0umBEj/L5IjCu3jnQOejebjMAr1IgdLzdV5zb+XzjAU+tfNTHYn8oAA6UGjA8Lg0AdWHI+/y2CVtRNizV1BxDB81po0YOBVj7khC+/cCdB8vv9zFHXOroJFfDecX3tAP3/0+6/7O0bJyfSYXl2CZ22ukNUzSVoYjYcyPR0JiIlVS7vgDSJjO0xAVDB/Rvc3sQY1KFDlaWl3C0/yGom/CdKf6zoyBvUBG2sd7qQfc02aUM0EV6sf3iTiYuRY0O8Tr21p3cScZJ3tZfUwuvi7Te1w9/eUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilbHr1lGO9j/58JqrowiSOskTablvvYVRbPsw93jPzA=;
 b=XWtQi2rpBoUkhVLbHvc7MB3kvvuLk5nb62/YBsxMBA5dZqFEgA9CPxKivRXV2Tl8DCangvZuJk2Ks0dG6MfOQ91ZM4QyHrp9I1p15oag13+FDGwV1tUg45NiDA4OGU3LQnLFVf+/vulVPcLjcn1Y76eZaQkDbMIQwpFzQaeCkTASJI5bNaW+9ZyHWX9VhqtESJXve6twRDTBCD/MhqHex6gz5tRt7X5PooNpZn7oLJRn9MxJpwbqNqwmjk2aCwtV7wFAPGLRHihOxF4xcULnzAtkjzCZQLrSXJlYTdLlLo+3YgaKcZusTa8LUH+LRKsmZPTr3eRDG3JX2oeaXnOauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilbHr1lGO9j/58JqrowiSOskTablvvYVRbPsw93jPzA=;
 b=vDG6jG2mvyJwvtS9Pw6wb2ahlXhsEqHcRsnTZs2pSBAUOVdE/ijA+eOnFqQSt9lHAyLFsW+by/V3P1LZN7hFjM+j33I/IxDb9hrgCkxpwMU4fb7Rjneum+uk5GijZgDt+JFcEn/ZbCF2iYO+4/LVofC1ZTmdW6Ynf2Wt0linpPfku8TVPwSoEWw9vT1Gb/ZxSUS3//K9LDFLp+/Ws5RJ7+W72shuz3pCbH9En87fIW+UlQaMeIVYzyejzek0dPKTXwF45KjoRXZDaTSDRWv35WChVZFfdX/2i+A0mu22a8g4ufvq+PQE0JL7ul5G2GG4j4tUVDbTCGsw61OfQDgvWQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11550.eurprd04.prod.outlook.com (2603:10a6:102:50b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:20 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 00/11] ARM: NXP: Drop NOMMU platform support
Date: Fri, 19 Jun 2026 11:40:57 -0400
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAljNWoC/yXMWwrCMBBG4a2UeTbQC/TiVkTCmPzqiE3LTCtC6
 d6N+vg9nLORQQVGx2IjxUtMppRRHQoKd043OInZVJd1W7ZV7+JiPjzBaZ096+jHMCkcOgxNE7k
 beqbczoqrvH/f0/lvWy8PhOU7o33/AGYPz7R5AAAA
X-Change-ID: 20260618-dts_cleanup_arm_mcore-e7e933da798a
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=5122;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=niBM/b6MzXcCC9rb3Vc9QoKu6antCXoFNtrcCraXi0U=;
 b=T7m8qnxdpcwc1H6erHQ0rgLnV+uZgSFOEo58G6BNDS3kluzYUaNx6bJsF9DjfT+4iRIXoPMY9
 zIFwW0XeDupDXaD77x3hAm56TGusJNjR42z0BUJzFBV9TrlLvJev5/f
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11550:EE_
X-MS-Office365-Filtering-Correlation-Id: 813898f6-133b-446f-b1f9-08dece193596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|11063799006|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	/8SOAH5jpSPBni6a3VH/ooyfh4amhBciN7T+4PACNDW2r9QC0WK/QtLiBH72XuCgiLGb9nyamr5fdlpsRi7hLyUNr6Bq87RfwQbK6bFDCvY0XMKNd892ArIrx+vUqxlkWcjL8ilvQyqjFeOYSwrSX13KyrMDAAAeBYpJ1Is9fbYc6QdWbLN/QIjbfJN2jLJWU01KeHngkrcluywiv6iLg2vfJ+Z/NFvsBYWsC746tMmxsPXsoPdk6jZi0GbJyb631+jYL4cH/bb4Imuy2moaGyICvjLUjPS8EJXWGyn1ztpBaH0fbRcQNXmB6F4AyeWSQxOnVKlEOD0Qgekyu5svrCcU7Y6olRnuZzRysd/PJ4P3p933NCiAWkloI9Q0tTTW2ScFX989V8RNwsYaTU0g25EvKVnC59qzVbHk4RIslsUm4x3//EuYUkatXr49A7Dte1osloF27KycndXpm1hTtBmJMCpIcDIi4ONv0LmsUxpKteg6yh/QTPXGRybpxSsgfcTJrhpxAiY1rtl3MFylKzQE5LgbyIk+HbRcnAQoqx6w/sKiJbhZu6km0ZUF5v+pbTidENmX8kWtO7GX4gVDZI/XMF/0KlHlSfpE8P7/RGSHJdB0WI6hPXAbtJC2s9NAbr7yQ2rxNi101t44F3HJtpDm49qXFnhduUuZ242JVb8skUft0M9pYDRzrggA2S2r9w7pSUa0uGJCeEcdLnS3jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(11063799006)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3oxWERoNUg2aThqTnNFYzNKTUZKNnYyZCt1V29tWFhxLzdSVFdBRUswUkJH?=
 =?utf-8?B?eVhPSkgzeUszVytoMnBEd3BVVHNIbW1iUGIyTk1COUJmWkhMUjVvV2NCbjMr?=
 =?utf-8?B?Z3dCbUlWWFdIb2U0ZkJHQWkwRi9hWnh5bmNLckNSaVBndHBqYkVsVlVSN3pk?=
 =?utf-8?B?OS9FK2FPTEhrMk9OTEFxZkFFeUEyWXVWOGU2UG5LMk12NnZmajFkMHFPaVRh?=
 =?utf-8?B?eTdBOUxxUUdDVlVsNGUrKzhKcDFHMjdpSE5WQlAyMkNQV3REY1k0ZWxIemtn?=
 =?utf-8?B?dkVoQ1Z4QmhNekdUeitYdk5ieEtyY0lORE9CT2JXVXlKYUxMUjd5bU51aTZW?=
 =?utf-8?B?ekJFalpNTzFpRGpDSWNXcWorb1dybm5ZcElqcDloRmJjZlJ5N3pJY1hWaHdZ?=
 =?utf-8?B?Ri9qOTNwN1o1ODFaRlI0Mjh3cDVuUmRERXNyQzJic09GY1dBVVFUZXRnVnIv?=
 =?utf-8?B?RHRZK1plY3pScmNobGppTHd3TjljSENuTHU4Rnd1NnZHNW42d0hwQjEzODF6?=
 =?utf-8?B?NDR4MzVUeXJwTFFYRUxSbTFEMmJaOUFxdGxxV3puQ2xzTkRoRWxibmlCTmFR?=
 =?utf-8?B?RDloZFpKM3FyWGNQUEpKaXJIaEpkNmxIZFJXU2tCSG8rQ3RTRjFJZnNWTDFq?=
 =?utf-8?B?NGNBZG5PR0VJcnJjMkVCaDV5RFRpSXJTcDRsQUZRVURMei8yb005VHZSdHFM?=
 =?utf-8?B?Rk1uSWJNcFhsZ0w3Y3R0V1FVOHJjUndTdmowZFpQaEJiWE1TQXlPOWxROUNR?=
 =?utf-8?B?MS9CenhpSWlzTGJwQUo5TlNoa2tDY3NXODF5WmNDWHFuaHZQdFZ0eVF3ODVE?=
 =?utf-8?B?Szg4dXJNK2JPNUtPaFFLeUM4U0p3ZUFlTVQrUStOMEdOZWFiVzF5bWM2ZXlM?=
 =?utf-8?B?ay9DMHlHWENnanRmb0x0cE91RDhnOGQ2NDJ6amVVdjZnOWpXSC9pa0padlVt?=
 =?utf-8?B?cFF0MXNoVzNqdFkydGRDcEg4MHZKanBlS1lUQ3VtOElMa1FRU3QvN3NKa0cr?=
 =?utf-8?B?LzVTSG9sS3UwK1QvSGF0L0prRWptTk1QNElhK3Z0dE5MZkVKWTlhZlU2Sm9O?=
 =?utf-8?B?VVhJaHA1MHQxVFJYY1YzZnR0dTBMYnYvR2Y0RnU5RlErMCtVL3R5QjJpaE1R?=
 =?utf-8?B?QndzMEZZS3RMaVpIZ0ZFc25COTZjWjU0U0R0WHh6QlJFT2Fjc0Q3dXpsSVdP?=
 =?utf-8?B?VVE3UnViYktFWWNxTVRBbTBZQTlsLzUra1A1Rkhhdm10RCtVSG9RSDhyQ0pW?=
 =?utf-8?B?bmFsSmgvQ3FZd1YvajhjUTc2QVdWVGJJNnpBaVRVbjJJL2tFRzc1RmxlUWpr?=
 =?utf-8?B?cThkbXh5QjNCZkJ5Vk9QM3E1ekNEeWsyYjZvNXRWMUZHU2NPYURvZ0NldnYr?=
 =?utf-8?B?cjd1NWFBWWNTVlJ3WXIrNmtOeXpkRjdGZkJCL3ZRM3JyUVBEQWtLc0FObWFu?=
 =?utf-8?B?Y2V3MzdnSzFEV1FOK0xzdVFRZnBRd2ZPK0liNk02REtxOFdBdTlNN1lWT2tC?=
 =?utf-8?B?NzB6Q1VlSlA3Z1pnSVJLN3pIT0dSVHN2bmNCTHRrQ2xqQzJVNXdab05OR1Ar?=
 =?utf-8?B?VmJMWmkreHF1bEJ1Z0prcWlpYVlEVjVRN1dRbGkxVElPVUtQRjc5NDBGUi96?=
 =?utf-8?B?d2NwMEMyQkJsYjVJS2dTTnd3Q2thNHd4Z0ltbTRpSkVheEpiLzlhL2puWjAr?=
 =?utf-8?B?WXVhaUZqc3RnaDVzV1gzWUVSeEFVYzE0WlM1TTdHa2RyR05PWEloc2FzeEpw?=
 =?utf-8?B?cTh3alBGbVlkaGtpNFoyRnZuampzQXczeDB2MzVWbkt3NXhvUVBPK01pUjRJ?=
 =?utf-8?B?Tmx1Zk1aVW82czVUeGhDTGR4NXZrREVVZmxUaVJ3REpMNEtxbXI4a3JFUFVx?=
 =?utf-8?B?MWlSbWNsNnptOWNQL0hZVWRjaWQ3aDBDY2xEcXFQRU8xUUFNaTJFYytTYm51?=
 =?utf-8?B?N1ZyWStlaVlEQmw5bE9wMW5EaXFXT1dKQTFVVUtLOUFxWFdDRzJla2oxMmJ1?=
 =?utf-8?B?U2hXWW8vZjZkaFVjNUpjMjN3T0IvMnhFRHBtMU45cXMvWVEwWitzYnhWRWs3?=
 =?utf-8?B?ZGZGT1hYVlZOZHg5cjhxL2t4MXlENWpudXl6andrbU9vVWQ0alVScHJnc0R0?=
 =?utf-8?B?anJ2VmcxK2N1ZnV5R0xZdElqbXlkVmhkclE4aGlDcmpMY1JHR1dLa0c2eWFt?=
 =?utf-8?B?OTViZ3V2dGYzQjNyU25oamU5V2kvSHFJamNLaFdoclRNc0N2L2FSZ0I4Zk5M?=
 =?utf-8?B?ekpTam52c0tLcm42Rm54eklWSEs1TWFRajN0NDZmZlYvc2puS0pQTnFGNlU0?=
 =?utf-8?B?S0h0Z0hxOVNIS0lWTnBMb0VpRExTcHBkb2tZT21qUDhTOEJiclpKNXRoZXZW?=
 =?utf-8?Q?yFshvkvELmEdgaOJ8+LSZJmfT6uVjU5E31ugy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813898f6-133b-446f-b1f9-08dece193596
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:20.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0dWtwrTxG8ISc0hOM+9mu153YY8yVBNNC7RYk4hpIOCCmQGyBJR5dOIEbXAjVTMxqwOw4kdbAxitcMQd2TvpFKa1TMzRoRCdfVr2T5BZCFjlmV8wlAWfvWzf3dlYgXA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38713-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECDCC6A6C2C

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
Freescale/nxp platform code.

Some driver code still be kept and may clean up later since it is possible
reused by other SoC.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (11):
      ARM: dts: vf610m4: Remove NOMMU platform support
      ARM: dts: imxrt1050: Remove NOMMU platform support
      ARM: imx: Remove NOMMU platform support
      clk: imx: imxrt1050: Remove NOMMU platform support
      pinctrl: freescale: IMXRT: Remove NOMMU platform support
      ARM: imxrt_defconfig: Remove NOMMU platform support
      ARM: dts: lpc: Remove NOMMU platform support
      ARM: mach-lpc: Remove NOMMU platform support
      ARM: configs: lpc*: Remove NOMMU platform support
      clk: nxp: lpc: Remove NOMMU platform support
      pinctrl: nxp: lpc: Remove NOMMU platform support

 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |   79 -
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |   77 -
 arch/arm/Kconfig                                   |   12 -
 arch/arm/Makefile                                  |    2 -
 arch/arm/boot/dts/nxp/Makefile                     |    1 -
 arch/arm/boot/dts/nxp/imx/Makefile                 |    2 -
 arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts        |   72 -
 arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h      |  993 ------------
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           |  160 --
 arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h      | 1561 -------------------
 arch/arm/boot/dts/nxp/lpc/Makefile                 |    9 -
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             |  543 -------
 arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts       |  273 ----
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts      |  236 ---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  540 -------
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  221 ---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   |  485 ------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |   48 -
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts |  624 --------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  621 --------
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |   52 -
 arch/arm/boot/dts/nxp/vf/Makefile                  |    2 -
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts       |   61 -
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts        |   88 --
 arch/arm/boot/dts/nxp/vf/vf610m4.dtsi              |   61 -
 arch/arm/configs/imxrt_defconfig                   |   35 -
 arch/arm/configs/lpc18xx_defconfig                 |  158 --
 arch/arm/configs/lpc32xx_defconfig                 |  192 ---
 arch/arm/mach-imx/Kconfig                          |    7 -
 arch/arm/mach-imx/Makefile                         |    2 -
 arch/arm/mach-imx/mach-imxrt.c                     |   19 -
 arch/arm/mach-lpc18xx/Makefile                     |    2 -
 arch/arm/mach-lpc18xx/board-dt.c                   |   19 -
 arch/arm/mach-lpc32xx/Kconfig                      |   13 -
 arch/arm/mach-lpc32xx/Makefile                     |    8 -
 arch/arm/mach-lpc32xx/common.c                     |  125 --
 arch/arm/mach-lpc32xx/common.h                     |   32 -
 arch/arm/mach-lpc32xx/lpc32xx.h                    |  717 ---------
 arch/arm/mach-lpc32xx/phy3250.c                    |   92 --
 arch/arm/mach-lpc32xx/pm.c                         |  135 --
 arch/arm/mach-lpc32xx/serial.c                     |  148 --
 arch/arm/mach-lpc32xx/suspend.S                    |  148 --
 drivers/clk/Kconfig                                |    7 -
 drivers/clk/Makefile                               |    1 -
 drivers/clk/imx/Kconfig                            |    6 -
 drivers/clk/imx/Makefile                           |    1 -
 drivers/clk/imx/clk-imxrt1050.c                    |  182 ---
 drivers/clk/nxp/Makefile                           |    5 -
 drivers/clk/nxp/clk-lpc18xx-ccu.c                  |  301 ----
 drivers/clk/nxp/clk-lpc18xx-cgu.c                  |  668 --------
 drivers/clk/nxp/clk-lpc18xx-creg.c                 |  225 ---
 drivers/clk/nxp/clk-lpc32xx.c                      | 1591 --------------------
 drivers/pinctrl/Kconfig                            |    9 -
 drivers/pinctrl/Makefile                           |    1 -
 drivers/pinctrl/freescale/Kconfig                  |   16 -
 drivers/pinctrl/freescale/Makefile                 |    2 -
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c      |  309 ----
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c      |  349 -----
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 1382 -----------------
 include/dt-bindings/clock/imxrt1050-clock.h        |   72 -
 60 files changed, 13802 deletions(-)
---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260618-dts_cleanup_arm_mcore-e7e933da798a

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


