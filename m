Return-Path: <linux-gpio+bounces-36101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL0aI18y+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4154C5066
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7680430512BB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DA33FE665;
	Mon,  4 May 2026 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UEketMk0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A80401490;
	Mon,  4 May 2026 23:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938910; cv=fail; b=MW14/cyjVvahHhhqjPy950WyIM/trOLBUSvJiwMulXeihK4KuIUbUkqkicedPBUZX/QiFzLb6W7mW4AJwmrf68whQXVsn3tmx7P6QT2r9D+dDHqn82jgUaIQ7t7SWnTaaOBVOla6LsBQ5Qz5XHNCLpfBwFK3tNRQVDjzDst28bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938910; c=relaxed/simple;
	bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p8uedEE6rY3DcTXiy9jtHfWTpxFKtp3iL+SgRPXuAm9S7Dp5h4GYxJs9aWT1k35tQDFWJ9wKYReV5ND5FkFXg1UR6nWKVMzCNJKBt2rfiOc9qzXJGz8fguIFIyz6VXVIxeVZW0VaIFioMKpPpEYelDTB5z/c5i1eGjwGZdQtMBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UEketMk0; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3UIr8MTvR/p5U+919nJWUrK/yC8GciYicJDQz2yhlAiR5ZHJb8CdY6530mMOO9xVQVnRjFIbaKxiLfrZ/sxxHkPrDUi/ZdbJaqySsceF1e5RwqPeKNrVB3+Esu/+SBfcfw3oQUeyv/V8O1BBpk7an6XhYZgHG6VyECL/P2HEALm3iw3h3+n3zDgvmhg0D2dPaxwyygoXA16lxSHZRBPBsHfcuXoOrbC70srezEkKmySNAP8rW0gEdguhk0QD2DyTA8XKRg5zCP8jjZO2DmSmvbMDGnZzJH8gNCnZeX7coOr7ry95EoSBeB+jHxg1OfKZZPlJtNyaYGGOnSZdQW8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=NiUMjbr96CmNx0TEfuDromJWYLVW4oCaFLOlgpJMERL18Hhx0nIQjr5I7DDn6i4x6+AxoaZpGsqqFtGCJstSSg0Qed7MoKkXqM0NUOzIbbR+uUSu3xGzsID+zYLpVmcmfd50NlV3qTbGHY89PtZuFTF9aygQHBHpdDp9+RcBhKMsv6ea6vpx05O9EmURj0Y1ARx+JmRHtQhlgnH9GUNK4qLdwA8q3UDWqW9gJHKaozU2XUyH/teNyPUJKVqvxOvVIrB9vS1UEXfm71i6mt7Kklx5dL2u+5ZryncKZhSdo8J1iHA0Iyk4z3tiZVa63koY0yAQ/oi66SjxXov68sJJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=UEketMk0GPi/uucZ5Tkos8zOPD8rDcxGo3cbAFXgbTX38hLoMQGhOB0kP/oSD2l+WKexv4ryJzI80BDpJg5Z92I0JiCUm0EI2hcm7anRun3q1y8M3og1+SWPN95s5+/SJ7jD08gTTCNNR0COzZ1i+4kRq2wemg6TPMplrM06A78GYt//5sHX//1qP7rvF6ZDo6NtevV12s+fS7RbboiLPNjET/jsgxjcObsDYIkd61EJECoYtvxUCPQwlEz+2kjc9/KPf8SClqwHXwPo3onD9DVUNNFb+/cvDuBP5qtWl030D2lO9hSA96fKNHohV67okBTjtuZg113BIbAbcKbGgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:36 -0400
Subject: [PATCH v6 2/7] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-pinctrl-mux-v6-2-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=4615;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
 b=4XQ35G6Fz2FqyHKysktasbkRI/Qn/bf6GRdqW92/pDxIzP+7boX6JSDLKmbVwN1kkMYuzvvuU
 dxXZ5eYA29pCTERzuikEiAnOWiE4moNSaexhy+YEeBm/2NZj1NZcUSn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: 44710173-13a8-4389-6820-08deaa388f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Tx3Mn4pW0I3wSjG4N1AdtHKIjOfCQCS86FM5r7oTH6pbyPTC6hBOPgoqfJPXgG8wLeIapDiQ0KyCr7cLxW4YqjOkqf6i2QszjC2suJqN1T6ff9A6+LoF8Kstg7LV4ZDQVuFmnKKSr3l7ZVwcYiQIhdnIzu5H2A9/d0APFcCp41eJT2GUQENYWaWtqUwtOlJrp3Lcfn3EjB7gi6l3HooCt6vuQnh5C6xocG3vJu3ipkLMn/Q/KFWLnwIyJETw2gkIL1vWFhHcIsVCQkMF3m2iLvKBKfYVG5VAJ2p4hnZkdg3xqtjV5tGWZYs7ideaU6nAd5qdmO9LFbIuil9TioE2E005bC1pDPX3NkQr0OstzTHiaRw1Xr1vH+KNyve/5cj4P7vLxKJdUdLO0SqPSijJFQ3dY8S7uAuXapv4DBo8QeRkqOzFm+VShjZLlftgrJhyvM+13m3PtfGT+4g4DVbfqeMh8RKyvle8i5J9y8XmvsxOepT8gGL8UqCbwAc1WfVCqWUwnqcalPr8KohOeLexXSOzj6G46RkhHKUtzp439XT7/gnp8FT161O+oMQ/Ez3yqVoTY3+uTgH+869W027OB5UDdLflLHEa5+GYgRyvO1xRQ+093IBvvDgxFnicAyzMTA1UpyRNg1oHi9GEhZJkZUlVCK3BupYxYelIewtGYZrxUYQjHPTR0mO0Np+XI9oU+k+y/C69T10l8be9wSzEMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzY3b1ZWSjBIREtsd1lxL2tVK3BNRXFZZ3FlQ3ZKRFB0Ynh6N1B2UE9INmRZ?=
 =?utf-8?B?eDI2d0w1UWYvRldzcU1QTXBsNDdUaXBMVnBNK2ZUYk8zQk40dTdGbmFLWHEv?=
 =?utf-8?B?TGJ5eVJUWXlYOUxCM1ZSTUdwUWtLZnFCWk5xcFFUVXNCODB6RVpNUWtuM2l5?=
 =?utf-8?B?Y3l3SExRaGhMT25WMDI4aDdzS0dXYlUrTUZ1VXRucFBSTXNOcFNMZ3U3dzYx?=
 =?utf-8?B?YXlyTytpNS9IT0FFdElnUTd0SEl5ZVZ2L1NOd3FNNWxkTnIyZTloRXJjY1JP?=
 =?utf-8?B?Rlo4eEtvK1c1Z09pcUFqdTZCVWpIcGtoaGliay9VMkRHWXY5YU95WWZXSCtT?=
 =?utf-8?B?SjJJcExEVERONHBTSUZoNlIwMXdzQ1htQXpOemY4eW44bjhYN3pQdDFFQkpv?=
 =?utf-8?B?Rkh0VDBYYWJ0cjVTbThCYVFKNlh0S2FLR0wzUDBhQ1hSQ3pLT1d0QmtFc1RG?=
 =?utf-8?B?R3MrYUFKcWJ3aDlPVXNQV095QndHV21COTdybmVWdkMvQTlYeU55ZFN5SEpv?=
 =?utf-8?B?V2JiKzVWNEFTa0czUXYxcXZiRGRITE9FUzhvclpRbUFxL01BMERQSGI3cFQx?=
 =?utf-8?B?Y00zV3cyQVVpZHY4VHNtUUg1NEZIajE3YXR1eHdZdlE0bTlQaHF1UVVUejRk?=
 =?utf-8?B?VThLNlFIMXdLRmhESUUzWGtwNmtzL0E3MGoxSmdVcFRMUUpuaWU4SmkwRWxP?=
 =?utf-8?B?eDI5dVR5Unp5VGlJNmh2WWFEQjFBRmZPQ3VRT1ZWcEhUMVV2Y3dNT1h3TzhP?=
 =?utf-8?B?Tm9JODd4U3RWQ3kxMUR5T2Q0eDByRy9RQmtUYVZab3JpS21QaEZPa3JPbVNq?=
 =?utf-8?B?cDVPc1lkMkovVUdjZm9aWStzUENUYm14c1F4elN5VENsS1paZWlhb2VmTDJO?=
 =?utf-8?B?cXV2OTZ0NXdUbHl5TTk2MEZNMitPVUNnQzgzNlhYbUJEWSsyYjRKNlVmM3pY?=
 =?utf-8?B?ck5kK2VPQWFFbVZ1Z0I4RUFFM0t2YXBscTBoeXpDLzRCdElpcXBWTlU5NThM?=
 =?utf-8?B?enlvdWhXNDd5QW5HZDRWWDUwd0E5aHk1aXQzcGpwWitNbzEzVU5SSktmYlJx?=
 =?utf-8?B?cmV6K0JjKy9OQnJwaXVLZ1pJK2NXRVVidkZleDJFTkdkcnhrcUkxazRRa0ZM?=
 =?utf-8?B?OGQwNktUNDM4K2lFK1MraUJGVzR2aldHUXJWSFJJclJSVEhvT2syL3ZFK28r?=
 =?utf-8?B?b3Q2QUF0RWIrZm0yZC95K1VVUERNQi9kQmhrdDNyRFVWa2tHRGZCL29nOXlk?=
 =?utf-8?B?N3Z3MjIyZElwTzNQNnBvc2EyRjlkS0pDRHdGRW9reE0walBkYi9lOE54MUpZ?=
 =?utf-8?B?N2ZsZ2hKRy9BYk1lYkZLVHFMVTN4KzFDTDlScFZ1MUlzVCtHN1IrNWpuUU5V?=
 =?utf-8?B?eE1zOWtEbkxqeFBuWEtEMTN6dlNOa2RQdjZ0aUM0YzZybG1ibWNhaVRxMWpQ?=
 =?utf-8?B?Qm1GOExtZXkyN0ZZcU9VMTNBb2tINVc2T3lQK2JVYjJQN3NFOUp6azJKeEJQ?=
 =?utf-8?B?L0txUGdzTjhwbEc4Zk9Xa2FvOXNWQWtHVDA3djRJNjVGb0Q1SmpzUzl1Qzgz?=
 =?utf-8?B?dkJhVEwvMXdxTXZGd29jakxVa0tvWDJyMTVaNldnYXRUcTZYSWZwUHBsVnJq?=
 =?utf-8?B?OHZxYlg5Y2dZSEdYTkgzQ1dZa3FjQVdXQ3VibVE1L3AyL0g2SHd6WHZESkk2?=
 =?utf-8?B?eHpKUXE0SnowcXRSbStJNXpDVXhNVnVsNHQvdERMeWplTmwrdHE3RUhnTklH?=
 =?utf-8?B?ajBRV0pWZHo4ejhPdjFCSkVrVSttQXFEVTkyOFJicER3QUlSNE1HLzBtbVNF?=
 =?utf-8?B?U2lFNTZmV2NzeXZ6S0RqTlUyNXB4NlVySnZrcWQ0MG5LeUVQZThPbHJQTyt6?=
 =?utf-8?B?SlVsUzQyVGJTMkxQbUYwZVdJZjJVRzFwMjJwT0VQc2NPRnhueEl4QlpFMFlJ?=
 =?utf-8?B?RVJVNW42NXpmbmFTdVRvMnVUQmhjU3l3Q2pqNDNBTk56WTJyU1RmQWUzOHRO?=
 =?utf-8?B?U01XTnFUMEtSK1lqK0ZxTEJiKzBHZWI5WjlseEplRUNweVBSZlEyWDRBNE8r?=
 =?utf-8?B?UUFmQS9VdmZTMFpwSFV6bFM3akNsQkNxZ05BaytPeUVDYmNlTDB0WWpPc2lM?=
 =?utf-8?B?dWpsYzRienNxWFJySkZyZ2xpbCs5bE5SNTJ1TUpqSEMzRm9MK0NzK3JUYUdo?=
 =?utf-8?B?Y25HTWVweDMzL3dWS2lGMW0zWnFvZzFZY1lFMWFFb0hKOEVTRWE4TDBPVkNX?=
 =?utf-8?B?dE5qU1doZ0VhZzZSbXR5dGlsVWVoaDdVOTNRaVBoY04ydGsyMklaa0NxVHNr?=
 =?utf-8?Q?ZWt80g19BZmN3+iNUu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44710173-13a8-4389-6820-08deaa388f1d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:03.0529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsqSnuWY+TnzE9B/F0wSkHClvfetvEOK2HJZxWJAfU/KoEYZZ37W+Bcb/wQtvVhSy2QWQELWLm6vma2+YRjwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: EB4154C5066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36101-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

	┌──────┐      ┌─────┐
	│ SOC  │      │     │    ┌───────┐
	│      │      │     │───►│ MMC   │
	│      │      │ MUX │    └───────┘
	│      ├─────►│     │    ┌───────┐
	│      │      │     │───►│ UART  │
	│      │      └─────┘    └───────┘
	│      │         ▲
	│      │    ┌────┴──────────────┐
	│ I2C  ├───►│ GPIO Expander     │
	└──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v4
- add Linus Walleij's review by tags

change in v3:
- collect rob's reviewed-by tag.

change in v2:
 - change descriptions for device, not for driver
 - add missed additionalProperties: false
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2b0385ed879b70b24ca9c39b098c3840d08d7482
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pinctrl device for on-board MUX Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Generic pinctrl device for on-board MUX Chips, which switch SoC signals
+  between different peripherals (e.g. MMC and UART).
+
+  The MUX select lines are often driven by a I2C GPIO expander.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


