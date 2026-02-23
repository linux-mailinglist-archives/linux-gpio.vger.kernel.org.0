Return-Path: <linux-gpio+bounces-32084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFzULTe6nGlHKAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:36:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238A17CFA7
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AD883177235
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E6337755A;
	Mon, 23 Feb 2026 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZmwgaWtF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B55377572;
	Mon, 23 Feb 2026 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878789; cv=fail; b=AWQ+sdzCtEhi3a2shtl235a9FFt5cUSYHkUgbcsDoTssJfEbKTNzpnuocTY9mG+LmV8xC9fdWN35GNCkJ4veIjO/HPuSjZp8M1xzoT646Vxq+55qFIYAU2PZbS4reqbJTulXpe3uQZ6f2NsVgxXvrO+idDHTRP/FlQfJYoV7zYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878789; c=relaxed/simple;
	bh=fOIBv8N7T98yLtpWar9Uscz8oYcuwPoD3XYvXJ2bhEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QtgnuVGrAdkyilzsdZVFvAQSJ7N7iGuvYfBai+Pg0C+tUQpH2IIFsOFBCf+Kl1Jw9lt3FieYjSe20goMwQj1MJZB5LJ1HrsOHiUKQ+7AwYE7NdINXCdec3SVPtcP5jVcrQOnQPxrxfDBeRokrGuUJ9CWKhjWUt1Q9IUz4tP1uJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZmwgaWtF; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwlY6500mmclOXXrDKgBJmcdK1no7N6xiGCc0tfNiuak2zlHYzkPGlb3zUcVXn6iQ39IfOFZvN73GqqFxsUXmt7D0YtjnLqJiQoIWb6IXwJI1Uk+x0z1dsYWqvV7xVge5E5bXUN0jk0/7vgJlAYmb/zPFYN8HTc2YWqNPXIbYIapkS/g6b8NLywtVOjy4RvCDrYazTDercky6K09wTSzhUk0Uz3YEuE/E5JBvjvDEARoH8fisqpjjSIddlwHrUhADw4I/rAePhGN1iUjk7DWyRn6KS4UHor4VtokhdKL5KXAPN194becQWguAZC/XN/NooP18WOFn/3O8RKB4QogMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOIBv8N7T98yLtpWar9Uscz8oYcuwPoD3XYvXJ2bhEc=;
 b=CQtC3bwhfBpi7Nh/K47LqigvMCCbCGWyva7kTdxx+7SxYS9wES7hjb5c0/ZY5YnzeMj9mf8PHW1WbQiI8FGGhhYIUVY90JKtV9rlEgYKKYz2m3KCq+6ckOeF28+/sfyrIFx7T21LJVg8IWJD9RfKMG5GtaljHKTLy/6ynfl6q8yoKxMQk5JXq4129M7wXhVVvt9Luk/vfiLRQYYSmYbAEobEVULO8bcm1zZMasEVqfVKims5zld/GYpgpF6Pylzbtw0uu526nIa+KO3RcM5bPp2TCVdMf4zi+BrlEgJcwGZvjsehlsqYQpAM5HSN+4dnssIDoPiXiUPBzOnYJqpaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOIBv8N7T98yLtpWar9Uscz8oYcuwPoD3XYvXJ2bhEc=;
 b=ZmwgaWtFHmJtN2Z+2Qtl/nKuWARm68KJXQJd2DqvmrHZRSsDD6xgQvueoT4VLwPzd5vYjYDKNrM890HjxsPRnoQJ2LaFOsL0ACvkHjlqbPSMA7rcGf4nMqCozVrZE64OYPoGgod8x6ES6wNmldKmlR7VwJO+O4Q2lyxA/jhItFkb0hgf5b31kvcNn03UlpEL5ZtRqse+txWRBgh1GxXjYcFKFnHMbW5mIMmoO1Dqkub4mw94lUaSonJNrBAiZxTeltDeeLHIwOCZtdE6POXrXycydv68fY2AD6S2nVOKbOEKzkZ6BKk07ieumZ+QL+BAXeZKxI9DzhafnjwiR+Zrwg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB8PR04MB7017.eurprd04.prod.outlook.com (2603:10a6:10:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:33:04 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:33:04 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpQOcVQ5Xw+p/SkSJEf3cqmSVwQ==
Date: Mon, 23 Feb 2026 20:33:04 +0000
Message-ID:
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
In-Reply-To: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DB8PR04MB7017:EE_
x-ms-office365-filtering-correlation-id: 487a6b42-5495-4108-8a02-08de731abeee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVBVaWY0WGlSd095U1ZLQ0pwMnNJU2lhUGJoMk9jRS9tOXB1RnZTeTVBL1Vp?=
 =?utf-8?B?WGVkTjg1WGhZbGhETmN4eGJxeUVQTno5Zm9uRHkzZ1lpMnk1R0hybHNzR2lU?=
 =?utf-8?B?dk9LYzZKOWNnRGluN1JTb29Eb0g1UkhRSjY4Y3FVUjlRTWxmd1Zpam5UMGxo?=
 =?utf-8?B?S0hsZDhqQ2R6d3BvZjBGVnMvSFhtY0hMY2hHMklRUWpEclJmdXBlVUxVVHQ1?=
 =?utf-8?B?TmFVU3NRd1A1LzJPVU05bng3dDdDMzdETE9oUHpuWHNLeXdRY0ZPNVRmNGU5?=
 =?utf-8?B?Q2VaMGtUZUtnOVFHKytqaDBRNDR2NnFHRWZXZGNRYlJ0Z2d1T1BWaU1xUitt?=
 =?utf-8?B?L1gya0trTE4raXpxay9PQjIwZEFtVGU0U24vellYS3VtQ0NFOUN1dTdyY3E1?=
 =?utf-8?B?Rk1QMnExQnlYc2JCTmZCaTNpS2lWelFlU2RxVGZ2VzBMajNGdFpFa3dUL3lv?=
 =?utf-8?B?L1BiRGVwZDlEb08ydVNJOWxFL0dFZ2ZYeHp0dDhuTUVsMVFNT3I0Z2lvRkpo?=
 =?utf-8?B?KzJtZGxDK1FTSkRUZ2lIcW9ZcmVLdk9XVmFOaXNzaUYzTm9OYzh3Y2cyWHNa?=
 =?utf-8?B?bG5adU8vSmt6UU05THBkRlNXT1lVbTl3L0dzMGthL3hzRU8yVmwwdlk2Vy84?=
 =?utf-8?B?S2hCWUNVVFdCWWlub1BMWFoxaFR4UmZyaFFxVVZ5THBpeXhUNzRvcXBUMHBz?=
 =?utf-8?B?d1dWZmdSVGNQZ1M4TGMxVVlnM3FhbGV5dFo4YXdIVnFTamhJU3l6SHpuMFo5?=
 =?utf-8?B?U3JHdEx4Y3BtOVdyeU4zSThOUmRGUTV0SkQxalQ4bXo5amgwNzNvbU1iVm1h?=
 =?utf-8?B?K3lIaEx5dGtFMXNZT2UxQ2lNSnJhNVZWdkVWTkNTU2RtOGhBYmd1S3Uvemlk?=
 =?utf-8?B?Nm9uenZxSVlkVWpTOHJGTWFHaDhXaU11VGVFT3AvQ01nY24ybTFiTzZDeDB4?=
 =?utf-8?B?cVB1MnJXSURtQWtjSy82NCtLVllmL2tCUjdtUDJoUE55My94dzVvV3lmQXpB?=
 =?utf-8?B?azNCMGV5QUdkMzE3eUZTRXVWT2tTVGErM3Y3Q3c5Smw3QWRLb2lMMkNKdEVn?=
 =?utf-8?B?OC8vNTZNbjFHZ2dtNlNnbjZGU0RrR2lMVlZhaVlUVmVQZ1pHWWF1M3gxOE1C?=
 =?utf-8?B?MVVhT0wxVVlaMmZuRnI4NnF6TmxlVDMvMXo1cFF5MzlnWVpzNm5mb0pTcDFX?=
 =?utf-8?B?SHlPU2tNVFFMdnd3V2d3RFNHK2dYdVJsSGJub21JbENqVWk1c3JHclN2OG50?=
 =?utf-8?B?c0pEamwrcng3Y0FvVk42ZElkMkI5QmNMSk9OVzJ0Q0c3eWNCZE9IbS9sdzY3?=
 =?utf-8?B?amRmT2laa3FMSHQ4c2I2UW15R2s2bWs1VlcvNSttS0tzU3VISXhVdUJ0YVF4?=
 =?utf-8?B?WE5FSDZmLzVsU1VkeWovaEhyR0UzNFgrNnJJdHFEL3YvcmQvL2pSc08zc2Fp?=
 =?utf-8?B?cGhEY1pldVplNjQrTVB4NE1nUTRieWZuVFd6NzFEM0JveTVGZFZORXBhWlNn?=
 =?utf-8?B?dkNHMyt3RGdna1ZZYmZQbVFDdW14VERqTHlCMkFyeFF6RDRhS1ZrN0oxWVlV?=
 =?utf-8?B?QkFxSnIwSjh1bUY0S2JocE1pTU45RXNXU3JieHhUR094U0d1cit0dVBBSkR1?=
 =?utf-8?B?Z2pBMEZRS1VxbEdtV3dhSTd2bVpiNEpHNUpUa1lnTDYrRklzZ3BNdVRadS9E?=
 =?utf-8?B?WW41NFFmRExoc1dlT3YxWHV4Q29XVDBEdVowUFJGYXZSVFRuM3BRQXFsVi8v?=
 =?utf-8?B?NzdVZnVkckN4UE83ck9UWGJFdWExNHhLQnVLTmdpdzBQaUFUVVQzaW9XVFh2?=
 =?utf-8?B?OG9ub2NhVGd6dWJGc01lWURMeTlGdHRmMUVGb3NZREx0SU9JV1NYWTcvcEdD?=
 =?utf-8?B?UTBsSnRDREZIdURPSXBvVndYaFZVa3lPTUJOWGRkZS9oVFRpdTdjc2tpOTgr?=
 =?utf-8?B?QmJWQVpWS3l4ZUh3RGp1WjhVTlVMZk0rZ1N4NnJDL2t0cGI5dC9KNGFrVjN1?=
 =?utf-8?B?QzZaUks5WUllNzlpRlVESG41bXhjTm81WWRtYVFvVWVpOUtyRlQ2RHNNYjFC?=
 =?utf-8?B?dllGandsbHlTSjBZQWNpQ0hCeFhZbi9OaEE3d3ozdmUzdUkyTEZzdUY2QlZu?=
 =?utf-8?B?UEtQSGxSemtFUVNrbCsxNUk0MUFYVk1aWU02VS9FWUZFRU02cFRvV0kyeU9E?=
 =?utf-8?Q?n3Ub0fR4fIpe0F75T8tn8AM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGdpWStVT1BLMHZUbmdZMklqU2prUWlMaThwc2FoekhNbFZHOG1DZFcxby9B?=
 =?utf-8?B?OG9HZC8rcVN4em5ibTBpbEhvYlVQYVZFZG8yRGhPKzhjYndwSXRYbTAyN2tR?=
 =?utf-8?B?TnBkYW5rb3BQcVRkK3J4a0hpZ2dVN09xVmxoVkYrLzhCNTNXMW5oSGdIL1hu?=
 =?utf-8?B?NUYyNVFULytPV2cvWmhwS2N1V0g4dUJOZUhlckc4MmxRV3MyRGdoYlY5U0Zm?=
 =?utf-8?B?aXJJSnJrbnlXOERqVUpwdmhNMFJuOEMyVDI5amVDVUFlWVRVRU55MU1zQnJQ?=
 =?utf-8?B?NGZtSE9oUVFWWDB6V2R5SXpySmtud3oxYWk5ZXhMbjNmN0YvZmVuUmM3UVRY?=
 =?utf-8?B?UVBQbEl6OHI4REMzSzlwWkZSNm5hUjBOR21EMEJpUGZRVmpOVEpWaW13K3FZ?=
 =?utf-8?B?cENoQkhJcFVFUGxxSGQvOXRud2h2L1ZtMUJ5YU9xWVd3OU04MHhHN0ZLS0Rm?=
 =?utf-8?B?OUtReGhIcFFJaTM5R3dTcnJNTE1YTk01NFgvODErOFVvZTE4NlBKMzFlUDNZ?=
 =?utf-8?B?UCtJemFmUGx1OENLR0lzZ3VTU2pQTUR0UUdEbXJlTTZjNTB1R2pSUTA5Zk1D?=
 =?utf-8?B?cTZGRklvVjkrdUhhUmVya0pHVlpzR1h6YkFBZ2dQTEJJWFBVWlZtSVd4S1Az?=
 =?utf-8?B?ZlVIbzM1eXZBTU82VTVyVmliZnpUL0VJWG5MUVdxUDlBOEltenB6dkVRSnhR?=
 =?utf-8?B?cWRhWWd4ZXRQUXFheGRJR0ZJcTE3WGlwNmR2aDlTdzlWY1g1MnV2STg4L0pR?=
 =?utf-8?B?WFhXWmlwVndiZktySzBack1OVTNlM0Y5dWwwcEZmWVhVNTNheTFaaTJud3Bn?=
 =?utf-8?B?REZwL1FpR1FLT0lCYTREa1FxbG1hS3FhTTREMWYxMXY2RWtYbjBHSlBRRVha?=
 =?utf-8?B?NFZUZUlScjlFZ1NDNmRaRlZjcW9LeTQ2amdOckJjN3EzVS9mN1FaSnV0ZEo4?=
 =?utf-8?B?U2h1MzVEK05VQWRwY1pFeTUvYnBpcjluZTZyK2tYNEpQWGd0Yi9id0tmVjVv?=
 =?utf-8?B?YWxEeFNZUlZJdTN3bWFoNVVWVkJ0MGd6TVdwSzkxVnY2Yld4WTBLWTk3Qjdl?=
 =?utf-8?B?V3UxSHVxVGpRL3JnNUtlOE9mS25tT082WUNGdUsyclVzYmJweWRieUZqUmI2?=
 =?utf-8?B?WXJBZnJLYXBzeVZMR0IrV0N1VHBHQTc3YWtTZkM0YUc2aTVDY1hxbHNyWEZD?=
 =?utf-8?B?Ynl5MDV3akw2RUZJSHhka3ZhaTBnTmYySGZBdGVFZHdOTUJVTzEzTHE0Yy9o?=
 =?utf-8?B?MTArRGdyTDZxckJESGk0VldLcW1LY3RSUU9Cb3dzbTVsdXBZb2piVEhhVmhn?=
 =?utf-8?B?S1pWcVVtd0h2NDVkdnpHcko5KzJEUjRMR3Y2SjVlYmNEb0RmNkJ6RGphYzM5?=
 =?utf-8?B?L1VjQjRZQWUzcnRTSVRxWU1XSWF0enQwZzJWNksxMjdpdmVNcFR5ZkRQTHQv?=
 =?utf-8?B?NTJUcVJUTlRwZDVzSWFLdkVXRjNZWGxjUEo3ZFZzWm1odWYzdUtQM3M4dW9w?=
 =?utf-8?B?TXJadkI1bDQ5WnRNemFRZjZBdHRSVU5Qd3ZvbGZsUTJCMDZUYW1qWXk4ZkpH?=
 =?utf-8?B?THEvVm14VHRhTDdqc1FjK1IxblFYbnlIOWh2djFvTFZ0UGhHZzF1djg3aGN5?=
 =?utf-8?B?aUREaWVLREsraENWUXhTK1lqa0p0bWdyREhmYmhKRjJpeGJrdVBDMzNVN3k1?=
 =?utf-8?B?cHluRmJzdlJDeEk4eGUrZkw2UVBOTU5QbEpESEdrQmxQTncvQ3NTaHI4NDBF?=
 =?utf-8?B?VUdKMGJhMitjajNNeDYvazNISkVDQUxDODRaWUhodzF2RlFxR3BjaEJqclhl?=
 =?utf-8?B?Vm16S3c3ZWs5R3k4MGZYMlBOdlNibGZON1BERWUxSVJ3UXl5MUJ0aDlmckhZ?=
 =?utf-8?B?QytHR0IwR1Bmbm1GeXVWRFk2eXVoMytoMUdJeno2MGdvZUpvSWIweEY3SStS?=
 =?utf-8?B?V1F1b2IyeURia2hxZjBoU1Q0OHFDbURUOVRzNnNrVFFjaXhaVE1YVGNaZGNs?=
 =?utf-8?B?YWNiR2dKM3o2VStKSWl6RjdNVldGSTQwMm4wbVc0eTEralJMYjh0R09UQ1pP?=
 =?utf-8?B?dThsUTJUNG5mYldnVm8zMGM1L05GWmNvQlFhQzF6eVNObHFPeWI1clEwTitw?=
 =?utf-8?B?aWR4aFlaV0VJQjd6U2p2bTVYZXgyb2ZLcGQxU21SMVl1cXNIc2VNMldVYmI5?=
 =?utf-8?B?WHZ2dGxiZUh6bFBGT2pOV3A4TnYvRHhNVUYzT1JwQ3hBMW9JcG16dWtlTXNG?=
 =?utf-8?B?b3dmTS9TeEdSaFd6ZTJ6cGFsRXhIR1phZTBGYUpLTTlFVGszakhBclprQlZU?=
 =?utf-8?Q?AMuiqAsDwAqmEDPl6Z?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487a6b42-5495-4108-8a02-08de731abeee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 20:33:04.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhPAi4k6jAS/faFq38JI0LymNWRD/y+mu4wIB8Urd5yrHt3OJrnz91rAKXoERO+Ol/w5Mma2CfBq6cgs/6u94Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32084-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6238A17CFA7
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFy
eSAyMywgMjAyNiA4OjI1IEFNDQo+IFRvOiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9y
Zz47IFNoZW53ZWkgV2FuZw0KPiA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+IENjOiBBbmRyZXcg
THVubiA8YW5kcmV3QGx1bm4uY2g+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5v
cmc+Ow0KPiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEJqb3JuDQo+IEFuZGVyc3Nv
biA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9p
cmllckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1
ZXINCj4gPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZv
dW5kYXRpb24ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1kb2NA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBQZW5ndXRy
b25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0K
PiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ow0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5v
cmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4
IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IEhlbGxv
IExpbnVzLA0KPiANCj4gT24gMi8yMi8yNiAxNTo0OCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4g
PiBPbiBGcmksIEZlYiAyMCwgMjAyNiBhdCA3OjU34oCvUE0gU2hlbndlaSBXYW5nIDxzaGVud2Vp
LndhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPj4gR2l2ZW4gdGhhdCwgSeKAmWQgbGlr
ZSB0byBoZWFyIGZyb20gdGhlIEdQSU8gc3Vic3lzdGVtIG1haW50YWluZXJzIOKAlA0KPiA+PiBA
TGludXMgV2FsbGVpaiBhbmQgQEJhcnRvc3ogR29sYXN6ZXdza2kg4oCUIG9uIHdoZXRoZXIgYSBk
cml2ZXIgdGhhdA0KPiA+PiB3b3JrcyB3aXRoIHRoZSBjdXJyZW50IGhhcmR3YXJlL2Zpcm13YXJl
IGRlc2lnbiBjb3VsZCBzdGlsbCBiZQ0KPiA+PiBhY2NlcHRhYmxlIGZvciB1cHN0cmVhbSBpbmNs
dXNpb24uIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB1cHN0cmVhbQ0KPiBnZW5lcmFsbHkgc3Vw
cG9ydHMgZXhpc3RpbmcsIHJlYWwtd29ybGQgaGFyZHdhcmUgYXMgbG9uZyBhcyB0aGUgZHJpdmVy
IG1lZXRzDQo+IHN1YnN5c3RlbSBzdGFuZGFyZHMuDQo+ID4NCj4gPiBXaGF0IGEgc3dlbGwgcGFy
dHkgdGhpcyBoYXMgYmVjb21lLg0KPiA+DQo+ID4gSW4gdGhpcyBraW5kIG9mIHNpdHVhdGlvbnMg
SSB1c3VhbGx5IHJlZmVyIHRvDQo+ID4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21hbmFnZW1lbnQt
c3R5bGUucnN0DQo+ID4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoZSBkb2N1
bWVudCwgSSB3YXMgbm90IGF3YXJlIG9mIGl0cyBleGlzdGVuY2UuIFZlcnkNCj4gaW5mb3JtYXRp
dmUhDQo+IFRoYXQgaGVscCBtZSB0byB1bmRlcnN0YW5kIHlvdSBwcm9wb3NhbCBiZWxvdy4NCj4g
DQo+IA0KPiA+IFdoYXQgaXMgdGhlIG1lc3NhZ2UgSSBhcyBhIG1haW50YWluZXIgaXMgZ2V0dGlu
ZyBmcm9tIE5YUCByZWdhcmRpbmcNCj4gPiAiZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNn
IEdQSU8gZHJpdmVyIj8NCj4gPg0KPiA+IEFybmF1ZCwgd2hvIGlzIHRoZSBvbmx5IHBlcnNvbiBp
biB0aGlzIGRpc2N1c3Npb24gd2hvIGFjdHVhbGx5IHdyb3RlIGENCj4gPiBzdGFuZGFyZCBSUE1T
RyBkcml2ZXIgKGRyaXZlcnMvdHR5L3JwbXNnX3R0eS5jKSwgbXVzdCBBQ0sgdGhpcyBwYXRjaA0K
PiA+IGlmIGl0IHdhbnRzIHRvIGNhbGwgaXRzZWxmIGEgImdlbmVyaWMiIFJQTVNHIEdQSU8gZHJp
dmVyLCBpZiBoZSBkb2VzDQo+ID4gbm90LCB0aGVuIGl0IGlzbid0Lg0KPiANCj4gSW4gRmFjdCB0
aGVyZSBhcmUgYWxyZWFkeSAyICJnZW5lcmljIiBkcml2ZXJzLCB0aGUgc2Vjb25kIG9uZSBpdCB0
aGUNCj4gZHJpdmVycy9ycG1zZy9ycG1zZ19jaGFyLmMsIGJvdGggYXJlIHVzZWQgb24gc2V2ZXJh
bCBwbGF0Zm9ybXMuDQo+IA0KPiBJdCBpcyBpbiBteSBwbGFuIHRvIHRlc3QgdGhlIHJwbXNnLWdw
aW8gb24gU1QgcGxhdGZvcm0gaWYgd2UgZ28gd2l0aCB0aGUgZ2VuZXJpYw0KPiBhcHByb2FjaC4N
Cj4gDQo+ID4NCj4gPiBJcyBpdCBnZW5lcmljPyBJZiBpdCBpcyBub3QsIGxldCdzIGNhbGwgaXQg
Ik5YUCBycG1zZyBHUElPIGRyaXZlciIgYW5kDQo+ID4gcmVuYW1lIGZpbGVzIGV0YyBhY2NvcmRp
bmdseS4gTWF5YmUgaXQgY2FuIHNoYXJlIGNvZGUgd2l0aCB0aGUgYWN0dWFsDQo+ID4gZ2VuZXJp
YyBSUE1TRyBkcml2ZXIgb25jZSB0aGF0IGFycml2ZXMsIHRoYXQgaXMgbW9yZSBvZiBhIGxpYnJh
cnkgcXVlc3Rpb24uDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gKHJlKWV4cHJlc3MgbXkgY29uY2Vy
bnMgcmVnYXJkaW5nIHRoZSBjcmVhdGlvbiBvZiBhbiBOWFAtc3BlY2lmaWMNCj4gZHJpdmVyLiBU
byBjbGFyaWZ5IG15IGNvbmNlcm5zLCBTVCwgbGlrZSBwcm9iYWJseSBzb21lIG90aGVyIFNvQyB2
ZW5kb3JzLCBoYXMNCj4gcnBtc2ctZ3BpbyBhbmQgcnBtc2ctaTJjIGRyaXZlcnMgaW4gZG93bnN0
cmVhbSB3aXRoIHBsYW5zIHRvIHVwc3RyZWFtIHRoZW0uDQo+IA0KDQpMaW51cywgdGhhbmsgeW91
IGZvciBqdW1waW5nIGluIGFuZCBwcm92aWRpbmcgdGhlIGd1aWRhbmNlLg0KDQpJIHdvdWxkIGxp
a2UgdG8gY2xhcmlmeSBvbmUgcG9pbnQgaGVyZTogd2hhdCB3ZSBhcmUgZGlzY3Vzc2luZyBub3cg
aXMgbm90IHdoZXRoZXIgdGhlIA0KZHJpdmVyIGl0c2VsZiBpcyBnZW5lcmljLCBidXQgcmF0aGVy
IHRoYXQgdGhlIGN1cnJlbnQgcHJvdG9jb2wgaXMgbm90IGFzIHBlcmZlY3QgYXMgQXJuYXVkIA0K
d291bGQgZXhwZWN0LCBzaW5jZSBpdCBjb250YWlucyBhIGZldyBmaWVsZHMgdGhhdCBtYXkgbm90
IGJlIHJlcXVpcmVkIG9uIHRoZWlyIHBsYXRmb3Jtcy4NCg0KQXJuYXVkLCBpZiB5b3UgYWdyZWUg
d2l0aCB0aGUgcG9pbnRzIGFib3ZlLCBteSBwcm9wb3NhbCBpcyB0aGUgZm9sbG93aW5nOg0KIC0g
UmVtb3ZlIHRoZSBmaWVsZHMgeW91IG1lbnRpb25lZCBpbiB0aGUgcHJvdG9jb2wgYW5kIHVwZGF0
ZSB0aGUgZHJpdmVyIGFjY29yZGluZ2x5IHNvIA0KdGhhdCB3ZSBjYW4gZXN0YWJsaXNoIGEgdHJ1
ZSBiYXNlbGluZSBmb3IgYSBnZW5lcmljIGltcGxlbWVudGF0aW9uIHdlIGFsbCBhZ3JlZS4NCiAt
IFRoZW4gcHJlcGFyZSBhIHNlcGFyYXRlIHBhdGNoIHRvIGFkZCBzdXBwb3J0IGZvciBleGlzdGlu
ZyBOWFAgcGxhdGZvcm1zIGJ5IGludHJvZHVjaW5nIA0KdGhlIG5lY2Vzc2FyeSBmaXjigJF1cCBm
dW5jdGlvbnMuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGFwcHJvYWNoIHdvcmtzIGZv
ciB5b3UuIE15IGdvYWwgaXMgdG8gZmluZCBhIHNvbHV0aW9uIHRoYXQgd29ya3MgZm9yIA0KZXZl
cnlvbmUg4oCUIGV2ZW4gdGhvdWdoIEkga25vdyB0aGF0IHBsZWFzaW5nIGV2ZXJ5b25lIGlzIGFs
bW9zdCBpbXBvc3NpYmxlLg0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gSWYgd2UgcHJvY2VlZCBp
biB0aGlzIGRpcmVjdGlvbjoNCj4gDQo+IC1BbnkgdmVuZG9yIHdpc2hpbmcgdG8gdXBzdHJlYW0g
YW4gcnBtc2ctZ3BpbyBkcml2ZXIgbWlnaHQgc3VibWl0IHRoZWlyIG93bg0KPiBwbGF0Zm9ybS1z
cGVjaWZpYyB2ZXJzaW9uLg0KPiANCj4gLSBJZiBOWFAgdXBzdHJlYW1zIG90aGVyIHJwbXNnIGRy
aXZlcnMsIHRoZXNlIHdpbGwgbGlrZWx5IHJlbWFpbiBOWFAtY2VudHJpYyB0bw0KPiBtYWludGFp
biBjb21wYXRpYmlsaXR5IHdpdGggdGhlaXIgbGVnYWN5IGZpcm13YXJlIGFuZCB0aGUgbnhwLXJw
bXNnLWdwaW8gZHJpdmVyLA0KPiBsZWFkaW5nIHRvIHBsYXRmb3JtLXNwZWNpZmljIHZlcnNpb25z
IGluIHNldmVyYWwgZnJhbWV3b3Jrcy4NCj4gDQo+IC0gVGhlIGltcGxlbWVudGF0aW9uIHdpbGwg
aW1wYWN0IG5vdCBvbmx5IHRoZSBMaW51eCBzaWRlIGJ1dCBhbHNvIHRoZSByZW1vdGUgc2lkZS4N
Cj4gSW5kZWVkLCBzb21lIG9wZXJhdGluZyBzeXN0ZW1zIGxpa2UgWmVwaHlyIG9yIE51dHRYIGlt
cGxlbWVudCB0aGUgcnBtc2cgZGV2aWNlDQo+IHNpZGUgKFplcGh5ciBhbHJlYWR5IGltcGxlbWVu
dHMgdGhlIHJwbXNnLXR0eSkNCj4gDQo+IE1haW50YWluaW5nIGEgZ2VuZXJpYyBhcHByb2FjaCBm
b3IgUlBNc2csIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGZvciBWaXJ0aW8sDQo+IHNlZW1zIHRv
IG1lIGEgbW9yZSByZWxpYWJsZSBzb2x1dGlvbiwgZXZlbiB0aG91Z2ggaXQgbWF5IGluZHVjZSBz
b21lDQo+IGRvd25zdHJlYW0gY29zdHMgKFNUIHdvdWxkIGFsc28gbmVlZCB0byBicmVhayBjb21w
YXRpYmlsaXR5IHdpdGggbGVnYWN5IFNUDQo+IHJlbW90ZSBwcm9jIGZpcm13YXJlKS4NCj4gDQo+
IA0KPiBJbiB0aGUgZW5kLCBJIGFtIGp1c3QgdHJ5aW5nIHRvIGluZmx1ZW5jZSB0aGUgZGlyZWN0
aW9uIGZvciBSUE1zZywgYnV0IGJhc2VkIG9uIHRoZQ0KPiBkaXNjdXNzaW9ucyBpbiB0aGlzIHRo
cmVhZCwgaXQgc2VlbXMgb3RoZXJzIHNoYXJlIHNpbWlsYXIgZXhwZWN0YXRpb25zLCB3aGljaA0K
PiBzaG91bGQgcHJvYmFibHkgYmUgdGFrZW4gaW50byBhY2NvdW50IGFzIHdlbGwuDQo+IA0KPiBU
aGFua3MgYW5kIFJlZ2FyZHMsDQo+IEFybmF1ZA0KPiANCj4gDQo+IEkganVzdCB3YW50IHRvDQo+
IA0KPiA+DQo+ID4gWW91cnMsDQo+ID4gTGludXMgV2FsbGVpag0KDQo=

