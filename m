Return-Path: <linux-gpio+bounces-39210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wS6BIKC9Q2rvgAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3B6E4885
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=XYOgbDJ8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39210-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39210-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22A5E30A323A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADF6411673;
	Tue, 30 Jun 2026 12:54:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8EB40E8FD;
	Tue, 30 Jun 2026 12:54:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824056; cv=fail; b=Gq3NLQw7PIyHqTgw4DyVqXG6HGrbOIiT96dPXvsiiCk1Vro7I6G6ykDUfMNLmVxO25NpO2+Hb4Ia2TWBnss8rvC9n4rB23/V32PSknZRuEHwj5Ybo9bxljtqDG35kOY+wOvmgHGNXNpFhiXHDU2zL26sIblTKjI17pAdu0ht8Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824056; c=relaxed/simple;
	bh=YFvr/B22IqNYMwNg/Sz/zv0PiN9/kbm/qtHSgoyqzJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ptj4/Sfzrq8dzHLAGN24MJNgfbH63pVteAo7vX/fR307RNHZnefcn6YjMPj36gUgEV6f5DDtNIkf/J0ulrr2/6ymMZEsZVzAmR2UeUqzle8UTJOn4Dd+28CL4DRNcPQrGU/MKBUWhhnrhzJ1zynptQg70uuhUyYjZrGxuQhsAb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XYOgbDJ8; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1jvJc6U98gRTWVdIVG4Gr/Fw5bgu/DLe4isXa2pWFzlbrUOpygOyBNUn411t351UEUK3kqqH+gEucLFop2/nLXUgPOMY7w3tCqfDxM75QOq6mJrMqtCFXjStd2IvuCnHmcEDWjpKe1XMS3BI7rI0hzU88HL+pUHT2Y8eSaCQU+ZytgHn1oJQU8CyjxF618doNW2aOBx+9QqUtE2WKHNsQLK8v9g0RU1GScUrQu2u1eRRJC+w//lQPM7t7zGX1t0q4PeH9KlDNtsQ2nyk3LciJT4fXmTUxBVaOnGYkLUwKlj3tgwxyIzW9j0EsfS1Y8aRhIj2TsMQijnzt5+nniysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BStVqi3npxB8VCFIrr2J9OTRTQQ70QOJXxLmp7fEoIc=;
 b=hXLUBq94ND5orsXidYQo5Qs2RZEkUWVBnHkTR6T6PaFTzWVjMd8SplKIL+Bpkbacu17EUWIABTo8DJPOdZPJQUHF7pO+eGPQa0BKk5ppvig1o+oT4t2XDNBsEjtD0sbs4JEl6nLGXp6PCCDzdeNs7AKu6BD0zTrG3tRZ7taU43mN3cVB+LpUm0pUF1CslwkGyMWT9IwuUDe+NbGi6GVOm4zs69scQK/ksubXHpnuay+tt7t2Gs1HgTO0MUO1ujfQU8BL4AwKmzIrNJgmbMCujUbjb8Q+WS7WNc3rhXjYO+izVBqZ8z8CWSFVnX5vEUlNUcvWxmK0b3fw99wq4tvozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BStVqi3npxB8VCFIrr2J9OTRTQQ70QOJXxLmp7fEoIc=;
 b=XYOgbDJ85ycxA1eNSofcw3rS84GfR8YZ5f28bN1r/ua/IU+BS+2xvFOe8LMrzkBiXfyzmRXFK3xM+1fIiGBsEJ90rTGAmGH9KDYPFCBpOyOENg+yrW8ffmx7HFoC01R+gD5koYs/ToW/LOYfcHK1b/xyGz32Oa6GDamN88LXgSesGL2bbheN2tBLAITqBXqyCULsI78wDxwkwEhG50UJi8uQLJXbz0CUGRSXIJKXCPMWBJpkbBjCrZolKIp5yQvA1katllDE9hnYMlCrL0AakytObB2Y1C7cu1WNmTsl+gSgtY051DZsciPtM0FOOyIpyo084Y1BiqgIToraqO4/kQ==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:08 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:08 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
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
Subject: [PATCH v12 2/6] pinctrl: s32cc: remove inline specifiers
Date: Tue, 30 Jun 2026 14:53:59 +0200
Message-Id: <20260630125403.546375-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db4895b-25a7-4c10-8daa-08ded6a6acbb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 HJHGF5Ulrie6Eu0Mpz2fLkA+NPtKIBN6sSk71dyBFtvspq7aiRcOprP370QE/bWaAOCTRY+X0CCQi3Qt8idBTv06ULA+AQs9NWArBa9V5qx+MLbGW+LmTRPHGpKPBI01tSAZtCKPhPOBKJsl9jOHhIwtDf9sp2GOMcVFmVGDODjW92hrRBsOaUeElCmtICu8QRbMjvwQd+6ibcs3/p46NWlSMQB50SI0wBlExQcINho++6b3uK/DH2QIR9s7+PWDmuVYx1P+uf7OnYVqB1X3HkIRdrHrtjE2UdrEijAP4suRyvCQIapMqmI61f1t2eTT024jY2mIYFHOXWO+7MyPWVgkf/wCz0pyfxNM2nQJBkwiQerb4P9cwVQjLmCPfzNod8rUsXtGc2Zvo+vDfqsz1dnYfwtWee8srTi/tz+ypyADl7mw3Z47E20AjLqiMuKkr1cxnBbQZlTPCVhRjKhF+lFbKjL9um00saCfaThjWrXZGXzl/heKl8fvo1F47QqBNBnRAwpvBaV1W2hXim4EwWOoy4R73gxlPuxnYn4ce2+8owEMQpV10WWGmHA9RAXZX60GSPYBR/X/WGLOVXovkEX1WucEFH0E4OthDHRKIfuw7hL7jrtydWenYCCHMb0Bf8v++4R5rJl2AmuJo8vqTd8WfGa3ATmozm5NEjRMkh2r1+V8t740bKhAdfYnb1GCB2tW6ZtcgUSjR9zP9g5nlA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?KzNaQk9UNGJqTEt2YndHNXE2clhvMnl6UGFLeFFlQ1Q2cDhnQllIeFFrd0pL?=
 =?utf-8?B?M2hDQnUzQzhob2o2eVNTbjJuNGtONVhuRWIwbHhoWVQyTS9qUlBOTm45bzZM?=
 =?utf-8?B?c3VJc29HM3FYQmw5NXh3N2h3dUNDQkYrbi9VVm9VWGhzTW1iMllzdlhDZXVw?=
 =?utf-8?B?cGx6NFRIYVQySUZtbUhCVFpUbGZnVk9jYlFobmMwSnlCbGpQUjBXYzJBbzNW?=
 =?utf-8?B?QTZQVUt0QjhmbFdEalVQY2FJZDRkcjFaQWUrcTJ0RU9uak1GNzZCeEF6Z1V6?=
 =?utf-8?B?eHFPb3FTb3ovOTR4VWdCczhuQTE2a0dhU2hFczkzQkxIa3BIbVBCVlk4bndU?=
 =?utf-8?B?dXE4ajQrQldOVnN2WjdPRlZYY0R2c0lRNVhUZmhzeWhIRklGbzlBai9FdVA2?=
 =?utf-8?B?KzZod3MwQVFnYWZ3RWUxMDJKWFh1Q1M5UzlvaEFCZXNObUdGZUQwSTZmS0sx?=
 =?utf-8?B?OWo2dEJkWWMzNWl4VXhHSEJkTzN2ZW10UUh5dUxBWHN0SC9SSmhOdnBlRlA3?=
 =?utf-8?B?ekdOdnFva1RuZzRLbS9XUXVCV0xhZWJHK040V282S3M1MWVhZDU1ZXJXWEZh?=
 =?utf-8?B?c3pMQjMydW5PMlpEazUrN2hoL0UvYlJaZHJrbURkaXJUa1JDbFlCOE5DY2dy?=
 =?utf-8?B?RHJoY0tsakJ4bHZ3Qm9ZN0QwZmYxNGU4b0pTQm5ZV1pFRUFsZDdBaFJNMzNE?=
 =?utf-8?B?TlhwZFFuN24xV2xJVzVWTDlub1NMcWo2M0FPNUdYV0RibkR0YmFXTk4vZW9k?=
 =?utf-8?B?UzRLRzBlSFRmazlFVFFNSHk4R0FKVll5d3pHdzlPaFQ1THlhTkFEY2xUcE1x?=
 =?utf-8?B?NkJ4SUpuVzhIVVRuMjF5azhLTU9OMDFXRW9zTTgrL01yOFJPRk5sYWtTVjRi?=
 =?utf-8?B?c2VPNmVpSjE4cnVmYjNRN2MvNDBMbGVWcjFpRDZUY3ZiU1ZONXgxVjFCbnlI?=
 =?utf-8?B?RHpWNVg1T0RFbWswT3hJL1NnK1BhVURFWEcwOUxhcGViQ3pTbnhZNUdXWVVs?=
 =?utf-8?B?Um81bkN2cmE3WnpMZm93eThkSXBkVHN5R2FaWmhwS1NKNjFKcFRDR1ROYkYz?=
 =?utf-8?B?SlRNOFlwb05MMStNZWZJWXkrazB2c2RLdnI5U09TQVhDaU9RSjhaS3UwU0RZ?=
 =?utf-8?B?MHMyaDkyamZWV2cxSDcrRmV5U243K283SzFLRVJMV2NUeFliK1NrNnRQZGpR?=
 =?utf-8?B?MUJpS3FORjJBb21xNDN4ZTZMQ3VBZVU3dHZrc2JGK0RQczYxV2FRWXAySzdN?=
 =?utf-8?B?K2pJTDNQWEhaM1dCT3ovb2hKdk5qTDBEbW5lNmVmVjNFVlNUdVNCNk84YjBR?=
 =?utf-8?B?bVZaYXZCY1c0YjY2eStzb3lJQ2xxbTJMVm9pb2JnZGVFajl6M3VNNkg4ZW5p?=
 =?utf-8?B?RVd4Nytjb3hPS0NKZml0RVBieDQ4QXM1OXB5eEJLTUw3b2p3Vjdlc1FLSTEz?=
 =?utf-8?B?ZXdCT29DTzBJYWZZWWYwdTliQklZRXhmbTQrRnJPeEhYM25LYTVrUXZkQlNt?=
 =?utf-8?B?d2dSWnlFdU5TalJzcGpYVHQ3eG9uaTRHNmhEWjdLeUYxUVd2REE5Y1pXcjZO?=
 =?utf-8?B?YVdoMW1FemM5ckdQL3RKUHJnK0JIbmlIamlETC9Ba1l4OGt4cEFPMWRzdUF2?=
 =?utf-8?B?bHBhbWlBM24vR2F5TXVaUTgyZ215ak5pNWxPY3FhejVZSDZZMFBCd0FsTjJ6?=
 =?utf-8?B?UkdWT1E3Rnl4bGlMZ1BSVjlCa2Z3Zzc2ejlvZGorcVkyR1ZkcXNpQ3ZLb2Jj?=
 =?utf-8?B?Zmp0SXRGRkRoQWc4QjJBaHRTVEJOVDgxbnpMOHNQajVocmFVZWQyQjVLVnE5?=
 =?utf-8?B?Y1gvdFFyUFFjUkErcUpocGdtdlkwNGNWeWlJcW9WRHNTanlQUDdGTzJjcHlO?=
 =?utf-8?B?dDF1aGoySjdXU1pXNHFGOUtPREplWjZqSmh4dzUzZTB1Y0FBVlhGNktyU3c5?=
 =?utf-8?B?ZUw4SVY3L3kvODBYTGZTOFluTmI2VlpRREg2aHA4S0wzK2hLNXQyN2k4bkhH?=
 =?utf-8?B?YWNGQXFCckM3TURHcCtucWFDb1FQUG5BeVEvZXJoS1MzUERyQktlRXB4Ykpo?=
 =?utf-8?B?VDZMbGlHUTN2eXFrM3RrRFIrbVBTSi80RUtEcDR6UDBIZkVQQWtGZVpDL3NW?=
 =?utf-8?B?cWpMaGY2T2Z4MEMwMldnak9lVWZlSWhtOTJpbXZJeTF1bFBFOFFIcW80M2RJ?=
 =?utf-8?B?dWZuNk4rZkV1Um1BRVRGb0prV1diWWtxSnExSUNIamllWVNJUFFOWS9yaUJi?=
 =?utf-8?B?RmZpcWZmS1M4aDdVWjBrVzM4ejBxR090U2toLzZKcFcrSXdRRmpzMFNTa2FJ?=
 =?utf-8?B?RVcrSDQ0NGR3ZEVRS2dtN2NoSHhqeHNOd29JbzJnWDJyZ21Tc0k2RkNMZDVE?=
 =?utf-8?Q?/OeGcMxw3sW3XP3/NI9LFEORfi2tuWKY4QmHG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db4895b-25a7-4c10-8daa-08ded6a6acbb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:08.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDJgOaswLCq81ZitAZchoL4qYwIg4WOdysZG9o4QpvEYf97dfEolDywfJ1/Nhm3yZisuxmwJi3lFHn7V2E/TfgRIuTNuLHg1vlV/ic1ZrL66he5GlHdmdzKjIaKhlr2+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39210-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17E3B6E4885

Remove unnecessary inline specifiers from static functions.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 2a32df932d8a..8c5ec6a76a1f 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.34.1


