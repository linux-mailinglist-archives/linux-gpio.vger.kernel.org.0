Return-Path: <linux-gpio+bounces-31798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCFkEsvolWlWWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 17:28:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8939157BE4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 17:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 528773008C0E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DBF343D6F;
	Wed, 18 Feb 2026 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZRom9QkU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0DD3446A9;
	Wed, 18 Feb 2026 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432133; cv=fail; b=oHabcxnooeT6yfYycXqpEqQqyN6m2VswbzJ3Frm3cQr4tTELuAy7WahS3ky9mPDCRF9W9jyEzVsTuQCuphkKkRgni51V/QLH1a63nFJng4yPDY99/1qW9jnAnZqI7Qd8i4WjPB7qHF0DDBpsJj2QR8DctShkJMSaxHrlytkQLWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432133; c=relaxed/simple;
	bh=t9MNmcgYmT+OhnOEDlwI+vg0DzvDM5V8JacWWb6LV20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DxMu29OTbZXor83I0Q59nM0H6/soU3f43+LWa6BOjZNUjDbVOHLqQ3+TBPRC+vjBTH03wCFUgNqvFfgOXjLdI5ARIOw3TTjD1aCqMQn+AXbjijVy/UoMNKj/DJjDvjsogYriffEGtZoxxSSwYVkJj6NH20HDLWKMvg6XzYn2Cqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZRom9QkU; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E81whGXqA3ZfFjd0dfFkWaqZcS66+Wxl3wLwGl2S4UEXA8WD9qWrgixtv5MOQzIpK97LRbL4nB5n23HdCDXU4mSXEkM+HcsBHsMVfuBQE3fCL9e2AokbnUMTwM49dFEuaREtjEKHlczlxPbMczEDBBS5QbcfITREz1EjoJZWeI6qQENbOIUkczmHCXALu90bFVZz65uo69Y82pAOJ9E6fRZqreQs5aNd75UWpMYW17X+3ybZLomf8X9O2guMgh/G8zgi8eV+XhpWYxvSv8d8OFtz4Am52TMvRHRtltMFVY3jW4ZMqn4nOEZKckvObhIjueT5Tv6WQ+oZMEIgYI57CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9MNmcgYmT+OhnOEDlwI+vg0DzvDM5V8JacWWb6LV20=;
 b=K0MYvvMY7WPYTGcoTaEcrfeeUHzIDqgMNsYMZztNajmWmeB+A1H5p6smKVnYYaRpo9PDD50W0y9YT8UqZStBFk5cvIVgdGMI2w6NNnenOD/c/Wh8pnvG30FxkRSp68EKa5QnpTRdm9jj1/xhgAgkJZ6E4UgsKijW7n4o436TLK3XqyHOkPA7dq2HdQLLbRDsu8bBuU7ia9dd4QwBaY3kDCQBvFGPSVq6QPnTM/tBKr8GDaIFSKI/wi2ANxzz4Q1pf6iogo1IvRpclYvJl0E9BIrfQfaBibiJ/fix64pDCC6fRAqJ3RDb4IfpKGkf6D3MRwJnoxZ0PrmFmfKXj/1X1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9MNmcgYmT+OhnOEDlwI+vg0DzvDM5V8JacWWb6LV20=;
 b=ZRom9QkUmGxwLyVzEpVhP5dMMoP2SYHaAwPlSS/1dvwqijv0LD0Xl+fJtHCxTzUVqSbMn1lQzrYzTqQufTGyzBh7Uoaw9bX6Qtrdy74BACYPMxf++ciwc8yufDdPaNtLExn09vlCpcafhR/E+tZ1JTS5OcTT0QsQB+OVvUaIhrKxFmQ9av0KZI39YZa8vX7gleevdgnUFBZ2aWEc4rzCcminSi0u5lNdxZNa7jyprZRA4UVtsE0mF+Tfpi79neQHUxpb0SUarZerxVDsAGCQUKSQOmbKVPtbmnpefDdXyBJPsq/WVk4gTWrixSpgprfknSpAqKioIYTewIaZDvFsvQ==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AS8PR04MB8594.eurprd04.prod.outlook.com (2603:10a6:20b:425::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 18 Feb
 2026 16:28:46 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 16:28:46 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij
	<linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcoPOn5dgduhiVtkCcf17Ap+lTeQ==
Date: Wed, 18 Feb 2026 16:28:45 +0000
Message-ID:
 <AS8PR04MB9176D01F4E2F008A049C76B0896AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <CAMRc=MfM7Wc6ae+thPnqBdJUKhLVkrgZYYD_9EjAzxbE5mtSgg@mail.gmail.com>
In-Reply-To:
 <CAMRc=MfM7Wc6ae+thPnqBdJUKhLVkrgZYYD_9EjAzxbE5mtSgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|AS8PR04MB8594:EE_
x-ms-office365-filtering-correlation-id: a2ed42ef-6f21-4b45-803e-08de6f0ac9d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QTQzZTdBbXQvV1RkRWp4SHZqOTY0dDRuR1VCdWptSEJKeFh6em5wSHdyNEF4?=
 =?utf-8?B?NFZLZXY5SEZkWS9teHZNT2tpOHhrNjFIeXVhbkdEK0xYS0tEb1BZRHhYUmUx?=
 =?utf-8?B?SENnZUFYR29zb1hmL0c3OFZxaFRid3F1KzFGUThZcFpJbVlmMW9qb3lOS0tO?=
 =?utf-8?B?dkN6elIydVNRTHQzL0pTczZGczhLVENBTU90c00wZEVLL2N3U2lzSXR6c2Ur?=
 =?utf-8?B?UWVnUU5TV1Y5ZStrY3krTjJhNXpMODl4M1lCWE9LYUF5UVc4Nk1qbnNpMDNX?=
 =?utf-8?B?RklUWlRmdk13eHR0bUJMTmU2dkE4YVpUOXNIRHVnTkE1MlIyWDh6RlFaYU5E?=
 =?utf-8?B?TlV2SG1pQlV6ZEdWZGcrb3RmZUp6L2orVDR2bHFPLysycjNPNG90OUk1WnZV?=
 =?utf-8?B?VXhqclR1T2FEYmZKSzdtME92WXIwalV6Q1dLZUYvdkpuTVdUd0VmbGdIclJK?=
 =?utf-8?B?L1NENUtTSmxYOGRqQTJhSGdlTmtQL3JHemJRcnVGWnFRS3hwamtmWCt5cU5W?=
 =?utf-8?B?ZTVvRlRxNlMzKzRrdERVV2ZzTTYzTnhiUWd4bCtYVUVMNjNKaEtoVlY4ZVdP?=
 =?utf-8?B?L2dYSzJtRG5xb0xETU1sL3huN3JWNmJPMGRnSGpHNVpGemVUcUxSbWs1L2dh?=
 =?utf-8?B?TmxTTW1TbkM2alB1TTBtdUh1QTVyYXdiVXU3dllXUjFBRUVqRmVVWXNoM2k3?=
 =?utf-8?B?d0JDV3ArMlg4eVVDczRKYkN6a3p0eCtZMmpsTGNpaVNWM2Q0ODhFSWRWOUl1?=
 =?utf-8?B?ME40dHU5OUw3djBBQWpUOHh5SkV1ZWhiM3k3WldxdWZORlF1MEhTTXI2NGhu?=
 =?utf-8?B?aXJTK1d5dnR5M1ZaZE1pREFSRDN0dmF1ZXFGUEtxSVEvcndYM0xoNnpSclov?=
 =?utf-8?B?Q0dWeGZvbEdaS0NVZk5kUVM4RVBHQnpXcThJNUpQZVVrczlDanhFR0tsQU9B?=
 =?utf-8?B?SVBGMEMxeDVpWU1YM2ROeDhGeXBISUVrK0lTZ1h1NGovRlZwMVVWZFdrcUtq?=
 =?utf-8?B?OEozWUZvWTBaam81UGpxRjloOUo1UXVCamQ3dWNtdGxkc2hFVWF0YXpEZUVx?=
 =?utf-8?B?dGs4RVZFcnZZdnViU3BCNUVpRWFBQmErYVVSUlYvcVBVUGtqcDJMWlljRTZG?=
 =?utf-8?B?SHVXYlg4S3ltTnorMmovaUFtWWJ3N3V3bDRFemRNcCtIMnMwaVJ3S3VGZnYx?=
 =?utf-8?B?ZTlTaGtheGxpb1I3UE8zSS81d2l3WGU0ZEtqWThFOC9ZZkZhSGdyQndtcCtT?=
 =?utf-8?B?ZmNyQ0FnRS9RaUR0R0pLRDFpTU91WGcwZWhjRFV5TXUrVGNKV012YnEySnhL?=
 =?utf-8?B?OSs1NU5GWi8wSFZCYTVvVUsrSTBCOTVudVluaURDbUZ6U0RqV0xjTTlrQVRE?=
 =?utf-8?B?ZGk3VnZ4eml1TlZ0WC80OC9PUEZqQUZ2TzlYWFFDVXlITk1hVUE2bkhrZ0gy?=
 =?utf-8?B?TDdubXZOcmpXZjNpcVlxajBNQ2xvdTEzSEJGcHVjRzVTVkJqbjJ2K2tKQ2ZQ?=
 =?utf-8?B?ZGVTMnpFOE1lc0RUVkNsRm95TC8yRUlMV3pLb2dMZmo3K0FoWkZEbmdKZ3d4?=
 =?utf-8?B?RUNwN2krVEQzQ0VaTnVCd3kxTm1CbkxwdEpKdFE3STJvTEFNM0N2VmxLSG9B?=
 =?utf-8?B?VkxxcnAvMmxWeUxCRW9SLzVpdmtISjNkbENZYUREZ2RVVVhQRmIzblBsbC9K?=
 =?utf-8?B?VlkwWjhudTZOMEFFS0tWV1FxWVRTWDV1UDB3Znc3Mlh4aWVwdEZvZ1dQcFNV?=
 =?utf-8?B?VTZKRXpZWExLVjA0WUJvRmVKQUVGOXdwSXlvaGFnRUNLU08yMUU4OTUzTlB6?=
 =?utf-8?B?WDJDMVFWWjZPQXNmUk9wYy9BeUE0S0ZqZHhLRDNvTWJleVR5R2M3V2FwbEVF?=
 =?utf-8?B?eFZFNFV5OW9paGJObHB3Smt4WXJ0SUY3QkV3OTN6MXpIODVETE5Uc3pOU1I4?=
 =?utf-8?B?Nk51NHJBeEdMZVZGTVhBanNnNnVwSE51MTd3VVZGNHhLRWl4YXluNmJSa0w0?=
 =?utf-8?B?dTRzWUdENnVJTUxLb1hyeEFsT3BtbUtXOERTMXYranlaMTFKdHNqZVA3MjFR?=
 =?utf-8?B?MG5CYXhIRGlOOUxaQlN6WGJsSk0vc1ZiYkIwR0sra1pMYk1EcDNvSXlLQUd5?=
 =?utf-8?B?ZG1ubVZQYVROTGt1RXRWNEtvMUVnR0lCRG5BWGpnanlMYStWaTlYQ2Y1OW9M?=
 =?utf-8?Q?5/Qc3kRxPZhPx4h51qsLuNI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d05YaUNUc1ZTNzN5WkJueVl1UVRPMHNXYUw2Tkc5L3IxbkVGVHM0TjJoYm5R?=
 =?utf-8?B?ME90aEpHdXJFRmI0Ykxsekl3Z05aaTFiUHJwQ1h4aEZBTnRQM2lxQWM1eDFJ?=
 =?utf-8?B?aXhtdEFialBkV0tIKzgxekJYSWhKWWEyQjY5R01ZMHAydEVva0ZLYkVyTlVr?=
 =?utf-8?B?VER2MWNWVDNjSmNoWU1kc0ZoeFd3V0o0bk1KSDBLRDFPV05oMXduZmxGaEZ1?=
 =?utf-8?B?Y1ZxWHJGZlBnTUFLMCt3THBRcFAzWndMZU0yc0dScGhMUHNwZGY1OG1oUDBI?=
 =?utf-8?B?ZWxMT0EySTJRWmZPVUpFZjFKTm4wa1p0WlZscjZZQ2FzMTgrQkc4a2Exb2Q5?=
 =?utf-8?B?bDdKQlVUQWxMR0plSGI4bjByYjZwaXZjYXBGVDZ3eTArT2V1S3dpbHF1cnF6?=
 =?utf-8?B?WVhjTkVWdWgyODlTcU41U0RmeGF6bzgwWFd5cHdhbEpKQ1p0ZzZxNkJLekxK?=
 =?utf-8?B?VUFQMTkvbXYxTFNSSXBKUUgxemxzbmtxM2lYQSt4a2d3WVhIQ2hicmdCSW5R?=
 =?utf-8?B?K1lhZmxtRjVTdFdYNzRTOXpTcHpQWmZyTURscGVTVmdMQXkwK24yWWJkZVhQ?=
 =?utf-8?B?UFY5YlNxQ09OcmVIaTdteGRKNEpjUWUyMjVKTmlPcSszRTl1NHkvRnVNVzRE?=
 =?utf-8?B?Q01XV3VoN3BBMElZZ0RtZVV6QjRpaG1ZUE91ejRDWkl4QTR3ZHdEV1RZN0Ru?=
 =?utf-8?B?SFZNR2lQRDJITU5JMVZnbFZTK3JJUFNCYkJ1dzdJeVBzUDNRWlVJWnpCbGt3?=
 =?utf-8?B?YnVYTStVVDJRV2lzQlNCRXJrMTZpYXViTmRQS2dtaG8vcnZ1Y1ZFOGg5SnVp?=
 =?utf-8?B?YWNVSVlMcFY4bDJ6NGJMbFN3ZTNFMmRFcFYyKzlRZ0lHRS9DSU5YdXBQZVN2?=
 =?utf-8?B?dlhQbVowb2tSVGdSWXRHdGhHK056a1lhTmdoY1NhY0lkcCt3Z1MzR1liVDZl?=
 =?utf-8?B?d0VGb0ticGlMUndiTVVPNTE3SGZHOFh3UUxLSzV0MXFOeXpNT0hscEx6QUkr?=
 =?utf-8?B?U1F2RVhYVzN3NDR4eGk5NmFSNDVqbVViVktWdFlDMmZPY25Jd2NvR3ZYYUxt?=
 =?utf-8?B?RzcrY2R4YTQ2MVBMakZyeUFURUxkM24vMmE3T0pMZkRuYjZ1SVBSeXJzOXZv?=
 =?utf-8?B?bVlwdG1NdVNTeVB1di9ReXFDY05vU2pLcnBEVE9aQjdNaElkdDBtS3FxMmRr?=
 =?utf-8?B?bFdwbE1wVHBFTnI4Smo1eGY5Zm1kc1FmZVZMSGF0d0cyT250OTdHdjRGVjdn?=
 =?utf-8?B?ZGxvU3g2azVEOFpyQWRYNjU5N29yOHlFeUtUTis1VWpjZjNtV0t5UzE0NzMy?=
 =?utf-8?B?R3NuZ0tmeG16dUQ5N2dRN1BXaFE2a2FzY09YSkd6SVBlVnBudHFoQXR2UzM0?=
 =?utf-8?B?WTZyWlc0MmNWdU8wcFpXV3RhVzBiVXh6M3RWcDhnSXFhWC9hQ0lRTlZDSFNZ?=
 =?utf-8?B?OVVMNEpMZTZIdnBRR1pSZUU1MkZMNHpVQW9pMnFqN2NuQTNwWVgrTHUySWtE?=
 =?utf-8?B?OGFIZHF1UUVOVi9jdnN5b1lsbkZ6K0JvNVUvcnQrdExKZ1h5STJPUHd1WFhC?=
 =?utf-8?B?VEJWK1h4dm5LWjAva3MxR1l6dzJ1bWxpYWpDdzJ5LzJPd2tiU1U3azI2YTZX?=
 =?utf-8?B?NlYzT01pV3kvdHBoMVdzcFBlWFBXekU0TVZyQ000TnIyZUlaeFdRcWdpTktH?=
 =?utf-8?B?T3E0RFRwK090SzZIN1BsYzFIUU13ZmhiZXhPS3kvL01STW9KUzJUWmw2NWVs?=
 =?utf-8?B?a21jL2NCeEtEcUNiRUxmbzhTM1V4UzRnYzVOblJiOHhnV0xxNGYxNjk4MVJB?=
 =?utf-8?B?d0JSWlpPbmgrWDNRdW5UVEpLZ2kvV2QwdWdubGQydjhvQXJpbXZXRzZwWk9u?=
 =?utf-8?B?NHlMN2g2WGhnODVwUVNoM1ZHR2RsUktOL0N4VmljWi9lWkdHeE10eXRjckZS?=
 =?utf-8?B?WDZGb2FkNVU3eExKWnN1VjFCU21qQ0lHUlhrWE9NNGR0cC82Y3ZLZHlXZWlV?=
 =?utf-8?B?WU5wemR1RHgycHE4S0tXKytEbFVTUk53SmtHaXRONU13Vk5QUFlta3NMNFZE?=
 =?utf-8?B?bCtUNVpFbmFZU0hTUUpRVjVQTGhrcmZxMUFqZFBqbmlQQzVVTXFSVlV2dzZS?=
 =?utf-8?B?d2dZMDAvc28rOTFjakxpeExFU2x0R0RDczJxREFObWNZM3hra2hnQWl2c1Vw?=
 =?utf-8?B?aWF5Wndyc2RmUmE3SjJRdlk5VXZuRnF1SzF1Qm5mYmk4YlNOUVc5VFlvTldt?=
 =?utf-8?B?alpHV3JMTkJNRnFVQjJuKzZabEVKanF6THVPMUU4b3QvOS8rNGVrZHdMZGxj?=
 =?utf-8?Q?xFBRvJrHv71Niv7oL5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ed42ef-6f21-4b45-803e-08de6f0ac9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 16:28:45.9573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WO8fLsN7NfT2uO1yK04mwLddI1R/0klCGWz6lz5gc1JkSH9h7MBJW5nmHffSC7l8rRo9uboyRA4EXQt6v4zWkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8594
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31798-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl,lunn.ch,kernel.org,lwn.net,linaro.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8939157BE4
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE4LCAy
MDI2IDQ6MjAgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+
IENjOiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBl
bmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBG
YW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtDQo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBs
aW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxp
bnV4LWlteEBueHAuY29tPjsNCj4gYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbTsgQmFydG9z
eiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47IEFuZHJldw0KPiBMdW5uIDxhbmRyZXdAbHVu
bi5jaD47IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeg0KPiBHb2xh
c3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5l
dD47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5v
cmc+OyBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldQ0KPiBQ
b2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBu
eHAuY29tPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJw
bXNnIEdQSU8gZHJpdmVyDQo+ID4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+DQo+ID4gQ2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwaW8vS2NvbmZpZyAgICAgIHwgIDE3ICsrDQo+ID4gIGRyaXZlcnMvZ3Bpby9NYWtl
ZmlsZSAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1ycG1zZy5jIHwgNTg4DQo+
ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCA2MDYgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncGlvL2dwaW8tcnBtc2cuYw0KPiA+DQo+ID4gKyAgICAgcnByb2MgPSBycHJvY19nZXRfYnlf
Y2hpbGQoJnJwZGV2LT5kZXYpOw0KPiA+ICsgICAgIGlmICghcnByb2MpDQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsNCj4gPiArDQo+ID4gKyAgICAgbnAgPSBvZl9ub2RlX2dldChycHJv
Yy0+ZGV2Lm9mX25vZGUpOw0KPiA+ICsgICAgIGlmICghbnAgJiYgcnByb2MtPmRldi5wYXJlbnQp
DQo+ID4gKyAgICAgICAgICAgICBucCA9IG9mX25vZGVfZ2V0KHJwcm9jLT5kZXYucGFyZW50LT5v
Zl9ub2RlKTsNCj4gPiArDQo+ID4gKyAgICAgaWYgKG5wKSB7DQo+ID4gKyAgICAgICAgICAgICAv
KiBCYWxhbmNlIHRoZSBvZl9ub2RlX3B1dCgpIHBlcmZvcm1lZCBieSBvZl9maW5kX25vZGVfYnlf
bmFtZSgpLg0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgb2Zfbm9kZV9nZXQobnApOw0KPiA+ICsg
ICAgICAgICAgICAgbnBfY2hhbiA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKG5wLCBjaGFuX25hbWUp
Ow0KPiA+ICsgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobnApOw0KPiANCj4gSWYgeW91IHB1dCBu
cCBoZXJlLCB3aHkgZXZlbiBib3RoZXIgd2l0aCAiYmFsYW5jaW5nIi4gSWYgeW91IGRvbid0IGRv
DQo+IG9mX25vZGVfZ2V0KCkgYmVmb3JlIGNhbGxpbmcgb2ZfZmluZF9ub2RlX2J5X25hbWUoKSwg
eW91J2xsIGJlIGluIHRoZSBzYW1lDQo+IHBsYWNlLCBubz8NCj4gDQoNClllYWgsIHRoZSBlbmQg
cmVzdWx0IGlzIHRoZSBzYW1lLiBJbiB0aGlzIGNhc2UsIHRoZSBjb21tZW50IGp1c3QgbmVlZHMg
dG8gc2F5IHRoYXQgDQpvZl9maW5kX25vZGVfYnlfbmFtZSgpIGRvZXMgYW4gaW50ZXJuYWwgb2Zf
bm9kZV9wdXQoKSwgc28gd2UgZG9u4oCZdCBuZWVkIHRvIA0KY2FsbCBvZl9ub2RlX3B1dCgpIGFn
YWluLg0KDQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gbnBfY2hhbjsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludA0KPiA+ICtycG1zZ19ncGlvX2NoYW5uZWxfY2Fs
bGJhY2soc3RydWN0IHJwbXNnX2RldmljZSAqcnBkZXYsIHZvaWQgKmRhdGEsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgbGVuLCB2b2lkICpwcml2LCB1MzIgc3JjKSB7DQo+ID4g
KyAgICAgc3RydWN0IGdwaW9fcnBtc2dfcGFja2V0ICptc2cgPSBkYXRhOw0KPiA+ICsgICAgIHN0
cnVjdCBycG1zZ19ncGlvX3BvcnQgKnBvcnQgPSBOVUxMOw0KPiA+ICsgICAgIHN0cnVjdCBycGRl
dl9kcnZkYXRhICpkcnZkYXRhOw0KPiA+ICsNCj4gPiArICAgICBkcnZkYXRhID0gZGV2X2dldF9k
cnZkYXRhKCZycGRldi0+ZGV2KTsNCj4gPiArICAgICBpZiAoZHJ2ZGF0YSAmJiBtc2cgJiYgbXNn
LT5wb3J0X2lkeCA8IE1BWF9QT1JUX1BFUl9DSEFOTkVMKQ0KPiA+ICsgICAgICAgICAgICAgcG9y
dCA9IGRydmRhdGEtPmNoYW5uZWxfZGV2aWNlc1ttc2ctPnBvcnRfaWR4XTsNCj4gPiArDQo+ID4g
KyAgICAgaWYgKCFwb3J0KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4g
Kw0KPiA+ICsgICAgIGlmIChtc2ctPmhlYWRlci50eXBlID09IEdQSU9fUlBNU0dfUkVQTFkpIHsN
Cj4gPiArICAgICAgICAgICAgICpwb3J0LT5pbmZvLnJlcGx5X21zZyA9ICptc2c7DQo+ID4gKyAg
ICAgICAgICAgICBjb21wbGV0ZSgmcG9ydC0+aW5mby5jbWRfY29tcGxldGUpOw0KPiA+ICsgICAg
IH0gZWxzZSBpZiAobXNnLT5oZWFkZXIudHlwZSA9PSBHUElPX1JQTVNHX05PVElGWSkgew0KPiA+
ICsgICAgICAgICAgICAgZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycV9zYWZlKHBvcnQtPmdjLmly
cS5kb21haW4sIG1zZy0+cGluX2lkeCk7DQo+ID4gKyAgICAgfSBlbHNlDQo+ID4gKyAgICAgICAg
ICAgICBkZXZfZXJyKCZycGRldi0+ZGV2LCAid3JvbmcgY29tbWFuZCB0eXBlIVxuIik7DQo+ID4g
Kw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJw
bXNnX2dwaW9fY2hhbm5lbF9wcm9iZShzdHJ1Y3QgcnBtc2dfZGV2aWNlICpycGRldikgew0KPiA+
ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZycGRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVj
dCBycGRldl9kcnZkYXRhICpkcnZkYXRhOw0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnA7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgaWYgKCFkZXYtPm9mX25v
ZGUpIHsNCj4gPiArICAgICAgICAgICAgIG5wID0gcnBtc2dfZ2V0X2NoYW5uZWxfb2Zub2RlKHJw
ZGV2LCBycGRldi0+aWQubmFtZSk7DQo+ID4gKyAgICAgICAgICAgICBpZiAobnApIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgZGV2LT5vZl9ub2RlID0gbnA7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHNldF9wcmltYXJ5X2Z3bm9kZShkZXYsIG9mX2Z3bm9kZV9oYW5kbGUobnApKTsN
Cj4gPiArICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RF
RkVSOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgZHJ2ZGF0YSA9IGRldm1fa3phbGxv
YyhkZXYsIHNpemVvZigqZHJ2ZGF0YSksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgIGlmICghZHJ2
ZGF0YSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAg
ICBkcnZkYXRhLT5ycHJvY19uYW1lID0gcnBtc2dfZ2V0X3Jwcm9jX25vZGVfbmFtZShycGRldik7
DQo+ID4gKyAgICAgZGV2X3NldF9kcnZkYXRhKGRldiwgZHJ2ZGF0YSk7DQo+ID4gKw0KPiA+ICsg
ICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKGRldi0+b2Zfbm9kZSwgY2hpbGQpIHsN
Cj4gDQo+IExpa2UgbWVudGlvbmVkIGFib3ZlOiB0aGlzIGNvdWxkIGJlOg0KPiANCj4gZGV2aWNl
X2Zvcl9lYWNoX2NoaWxkX25vZGUoKSB7DQo+ICAgICAgICAgZndub2RlX2RldmljZV9pc19hdmFp
bGFibGUoKTsNCj4gICAgICAgICAuLi4NCj4gfQ0KPiANCg0KU2luY2UgdGhlIHN1Z2dlc3RlZCBj
aGFuZ2Ugc3RpbGwgd291bGRu4oCZdCByZW1vdmUgdGhlIE9G4oCRc3BlY2lmaWMgY2FsbHMgdXNl
ZCBsYXRlciwgSeKAmWQgcmF0aGVyIA0Ka2VlcCB0aGUgY3VycmVudCBhcHByb2FjaCBhbmQganVz
dCBhZGQgdGhlIE9GIGRlcGVuZGVudHMgaW4gS2NvbmZpZy4NCg0KVGhhbmtzLA0KU2hlbndlaQ0K
DQo+ID4gKyAgICAgICAgICAgICBpZiAoIW9mX2RldmljZV9pc19hdmFpbGFibGUoY2hpbGQpKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICBpZiAoIW9mX21hdGNoX25vZGUoZGV2LT5kcml2ZXItPm9mX21hdGNoX3RhYmxlLCBjaGls
ZCkpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAg
ICAgICAgICAgIHJldCA9IHJwbXNnX2dwaW9jaGlwX3JlZ2lzdGVyKHJwZGV2LCBjaGlsZCk7DQo+
ID4gKyAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXI6ICVwT0ZcbiIsIGNoaWxkKTsNCj4gPiAr
ICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgdm9pZCBycG1zZ19ncGlvX2NoYW5uZWxfcmVtb3ZlKHN0cnVjdCBycG1zZ19kZXZpY2Ug
KnJwZGV2KSB7DQo+ID4gKyAgICAgZGV2X2luZm8oJnJwZGV2LT5kZXYsICJycG1zZyBncGlvIGNo
YW5uZWwgZHJpdmVyIGlzIHJlbW92ZWRcbiIpOw0KPiA+ICt9DQo+IA0KPiBQbGVhc2UgZHJvcCB0
aGlzLCBubyBuZWVkIHRvIGxvZyBpdCwNCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBycG1zZ19ncGlvX2R0X2lkc1tdID0gew0KPiA+ICsgICAgIHsgLmNv
bXBhdGlibGUgPSAicnBtc2ctZ3BpbyIgfSwNCj4gPiArICAgICB7IC8qIHNlbnRpbmVsICovIH0N
Cj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcnBtc2dfZGV2aWNlX2lkIHJwbXNn
X2dwaW9fY2hhbm5lbF9pZF90YWJsZVtdID0gew0KPiA+ICsgICAgIHsgLm5hbWUgPSAicnBtc2ct
aW8tY2hhbm5lbCIgfSwNCj4gPiArICAgICB7IH0sDQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUocnBtc2csIHJwbXNnX2dwaW9fY2hhbm5lbF9pZF90YWJsZSk7DQo+ID4gKw0KPiA+
ICtzdGF0aWMgc3RydWN0IHJwbXNnX2RyaXZlciBycG1zZ19ncGlvX2NoYW5uZWxfY2xpZW50ID0g
ew0KPiA+ICsgICAgIC5kcnYubmFtZSAgICAgICA9IEtCVUlMRF9NT0ROQU1FLA0KPiA+ICsgICAg
IC5kcnYub2ZfbWF0Y2hfdGFibGUgPSBycG1zZ19ncGlvX2R0X2lkcywNCj4gDQo+IENhbiB5b3Ug
cGxlYXNlIGRvOg0KPiANCj4gICAgICAgICAuZHJ2ID0gew0KPiAgICAgICAgICAgICAgICAgLm5h
bWUgPSAib3Blbi1jb2RlZC1uYW1lIiwNCj4gICAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJs
ZSA9IC4uLg0KPiAgICAgICAgIH07DQo+IA0KPiA/DQo+IA0KPiBCYXJ0b3N6DQo+IA0KPiA+ICsg
ICAgIC5pZF90YWJsZSAgICAgICA9IHJwbXNnX2dwaW9fY2hhbm5lbF9pZF90YWJsZSwNCj4gPiAr
ICAgICAucHJvYmUgICAgICAgICAgPSBycG1zZ19ncGlvX2NoYW5uZWxfcHJvYmUsDQo+ID4gKyAg
ICAgLmNhbGxiYWNrICAgICAgID0gcnBtc2dfZ3Bpb19jaGFubmVsX2NhbGxiYWNrLA0KPiA+ICsg
ICAgIC5yZW1vdmUgICAgICAgICA9IHJwbXNnX2dwaW9fY2hhbm5lbF9yZW1vdmUsDQo+ID4gK307
DQo+ID4gK21vZHVsZV9ycG1zZ19kcml2ZXIocnBtc2dfZ3Bpb19jaGFubmVsX2NsaWVudCk7DQo+
ID4gKw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAu
Y29tPiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oImdlbmVyaWMgcnBtc2cgZ3BpbyBkcml2
ZXIiKTsNCj4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiA+IC0tDQo+ID4gMi40My4wDQo+
ID4NCj4gPg0K

