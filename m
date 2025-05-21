Return-Path: <linux-gpio+bounces-20379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E9ABEA29
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80354A7E76
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A6019D07B;
	Wed, 21 May 2025 03:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WFSB7Oox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A622482EB;
	Wed, 21 May 2025 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747796848; cv=fail; b=U/qdZLSluJ1HEVkwIe2HLZugpYo/OIpuQ2JbhdSY+dm3tj6ln44eiUeIaz4CrFrDmbZSpWiM3VufuIsJOS6m89uxGZKgF/prIZpBPCtKv/WIEG+qRTrgviGufLBquFTisXhNaCgTfyduIxSIzZ+DnYagMQvDedkegi5gVeKP/G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747796848; c=relaxed/simple;
	bh=gZgE901MJl/ZajdQH/0ptrSIugpsK9J3yMzbPQ7Ptvs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VCyuzAUdc0PmFqc9Fc0wDJXsmntVvk25DI48VspXXq8Ghcp87MtEEb4JRpeIRHYtknF93REARrdeFvyjteRXlocPmUYTxwFa8tq5bbR4N8jynQWvhZ00GkNeUvI2e1FXRl1gn44hZcGccQkregNv5mDyZ2SvWyFjE/gVmCZpI7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WFSB7Oox; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isQ2ssek+uZGjlAgoK1a5F3KfaZt2uv1HdYVX1eryTSXOn3yzzOrcyE8qYLJ0bO9r02CKijuy9X1YcFZJmiLT4/vRBnuj+JJ4QrhQRi7/H6zwEUb+75f9+awt1cUjYuV7TDy9IvxPn6psEY2LRQYu/3/GN64qgHFrL45kDTwROHcaNlf9R9M80NpTN397deN9bye+6AOKA1GN8GJgfQuAnUu15CsgcRQ61oiYD3bonhPe/FgI2gX/jH+Q30ZBAiUGX9IDvtf3JJfDFWbwzdZ6CXw5iKI6/LsRqMDxTh6PjC3HtBAFsJ/f75QZzT9tgEtmrassKmryxmve+io13qXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZgE901MJl/ZajdQH/0ptrSIugpsK9J3yMzbPQ7Ptvs=;
 b=WJH4cBZQIhiFyOIvxRBU5deHQNWbh0XMMoD7N+K7oJBZpq0DXaXUwFunNfuTYPk7kkjNTbwQpomrnFHaXR701tX3N2o98VDXYMNVtx7PoZF/zQ6e3erC8V1UtpyTQ0oRX/g3950TVK2LjK3iBcgoU6NoHD0JQAPpPIAmSxYCzlDOhkxa0/3l5CTUHfmJWPPmz6PrLD6bw3LrMVsXJ04RTfK+qqYuclEaXGUtFJUKpHi0KzwuohuLKmPycGjZU1qjhNb8TTgJuOo3U6WhkxhY0lIferX1EiZaj26MiCtLJV5MBEbQ2hezVlXDKll+O/og2v73Ykd/FzI+FeXoif5VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZgE901MJl/ZajdQH/0ptrSIugpsK9J3yMzbPQ7Ptvs=;
 b=WFSB7OoxiWF5R330jTyRl46rza0ExjU9bydUSgVa8vXytTWqZx543zpXeBKk5JTmAmSAI3P0FezTRgJ3VPy3lQaaaMNuB97oaDzrCEqa7DzoHoaiFibdNfsz79GxKTFsNSkyEbsazy5/vHB5povc8RtXV0po8D89ZZVcmdpI5kb2yzOb9yBAlvG1YSDtx8zuffWHSNuqnqq9RJODxc/nhidHVFIbapiIlRditie3SI7UnriE3wp5YODLUte0+FITdGXzzkKnltA8TAQ+6md/OOtMFR9d2jK5g4M+q0kOVCCM/JY37piTMHqJNmWL0JSwXSv3jxF+Gq5IYHaOnClbBg==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 03:07:24 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 03:07:24 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: RE: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Topic: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Index: AQHbxkmshdqqFTR1bk6BZRspDgfdubPcFhSAgABLV1A=
Date: Wed, 21 May 2025 03:07:23 +0000
Message-ID:
 <AS8PR04MB86422BBCA00ED3F99DD60460879EA@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250516100423.1685732-1-ping.bai@nxp.com>
 <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
In-Reply-To:
 <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8428:EE_
x-ms-office365-filtering-correlation-id: 7dba9f72-7054-4c49-d04f-08dd98149bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFFReDVGUXhka2ovOHFuWm1jNjEyWXY5RGtHTlRlNGpFczQxYTlpL3VwSUto?=
 =?utf-8?B?VkVkUElZNXBrMkZUOTFZbE42N3ZSRzZKLzlVYmtacHRCTWJFK2M1TzJiOW5K?=
 =?utf-8?B?Y3E2Q3UxMnJXS290TlVNZ3AwSU9MY0ZwNjYzL2pBNllRRXZySW02ZGJBVWRF?=
 =?utf-8?B?UFFrVTNOakI0cXRiZ21qOTM5K0JaVUtWUlhiWERlRDJyaUxNczA1ZHh4cXEz?=
 =?utf-8?B?dkV0MExnbzZNT2hTY2hQRG1pRWJCaFFRNm1wSUN0aUF2Q1RHdGZOWHZubEZv?=
 =?utf-8?B?eFFEbkNIR05RVE1RSFZCNmlqVmpFcDhwMWtRUHAyRlFJbVUvVWNrLzlHNktY?=
 =?utf-8?B?VTF5R3pmNEVmaXBOd2o4L01BOEYyUkd6QzRjUm5tMlZFejBiK0J6dnRuTWwy?=
 =?utf-8?B?Mm0ybmN2RFZjZjZlcWxpcHY3bGFtblhnaEZ4ZjBIS1BiRHNMcXFiRDlVTlNr?=
 =?utf-8?B?WWJvMVRHYmZNSEFmWW16ZjlOamtpSGJyNHppT3ZQRk1GOUVob29zeTB6VWxY?=
 =?utf-8?B?MUR0RGprUTltMW9YYkNsdVJCNVpyQjVudjlSVGphdzRSMmhpSkZ6OUx6blNG?=
 =?utf-8?B?cVBDMDQ2b3dSbmNocFhDazJObE1GSVlNNmFvNUJnUzIvZkZQWDR2SW9QS2Zv?=
 =?utf-8?B?Q2ZHTmFpU0pVUXVoZHpCa3dDT1pZbFpLVUh2N3RYTTYzNXlCNU9oaDhidXRa?=
 =?utf-8?B?TnJ4cHpaSWk2MVNVVXI3V2k5eHRNZW1PekxweDBlZjUxL0FZcko0czdFNEdX?=
 =?utf-8?B?d3c5eVZyV0NmL3RHSkVHMEczaFB4YkRwN1hSTG1BWXRlQmpEZkJpQVpScGw4?=
 =?utf-8?B?TmVwMEQ3ekZhQUdqUXlkaHNWSFhPMXR3NnhyWVpNL2tJa0ZlZFBJWlJJUkVn?=
 =?utf-8?B?WVdRTVFXWU0rK2ZHNkc2SFFwWFRqaEtWL0QzV0U0bGwzMzF5UDFGSUU5QXpX?=
 =?utf-8?B?aTNQbGdlNVpjWUttQTg2V3hZSzdZTEdUcWZyYklDVW9XZHZXQWlvanRhRVY0?=
 =?utf-8?B?ZnhQbkdOb3dLNHZsY2ZkYlZ3RUUzb2RGZ0VIVmVBUmk4ZkxyUGV0eGhnVjJK?=
 =?utf-8?B?MDZaclFnbmlzUURvNkQ5WmVBL1F1dmErWE42WUZKUjFtY3hYNzBNL3U0RHhj?=
 =?utf-8?B?MnhxRmFxNUZmQXIveGVnQ3B6VjRvZXB2SGg4UUZyU1plZnR3QzZQSHZRZ0VQ?=
 =?utf-8?B?ZjdHRmEzanM3VmJYcEpBaDhORjl1ZmxlWnVlZUc5Vkk5dWliRUtTRUx6Wkls?=
 =?utf-8?B?ZWgwS0xzV24yUDByVEVWQ1B2N1FSMFVjRS9mMVpueXZUeXhVQlI2b3ViMEJN?=
 =?utf-8?B?aUwyRkFyWGVrbUQ4ODdiUFBxem5raC93YTB5VS83SnNQS2RCTHlZNG9rSG85?=
 =?utf-8?B?VW5pSlRtb3FYYmxwRERKR0Z4UUlESjRaUGpUUWs3YVdQZEVNNEN0eEZDdHJB?=
 =?utf-8?B?bU9WOGZHdXpZb2ljRFEvM2FQRTR3d1NsbmsrS0VsUUZuWllDQTc5UlNKblNv?=
 =?utf-8?B?ZlM2M0I1Q3BnODlRZEs1Nkh6eWhiN0piWWI5MXdwNkZ4NXNWc09EK0hNbmJh?=
 =?utf-8?B?dlp2eFpBYTQvTWxYaUhRWk14QUwzRlIvVUJnWFpuNmtyK3BubHJtb1NTczBE?=
 =?utf-8?B?dm1KUlFTNlpVeFMrZDdId3RoQ3lEZWdJcVNBbzlibTFZdms1YjdhUGFFQWFZ?=
 =?utf-8?B?VzZvYXNYOG9CS0pXVUIyYjBNVmVZOUc4N1hELzZYUUw5clIwclkvd21Zb3Ar?=
 =?utf-8?B?WFVzMXhKUlhLQ3M5bDMreVNuZUNTK1FuTDFCU0ZxZlMzSGZYUGFvOVBrL25H?=
 =?utf-8?B?OTZYUDVabkQ4UGlNRngvTXgvWWdSaHRPanUwSnorUmppR3J1RFBVN0lrWWha?=
 =?utf-8?B?aDJVUWlwOWw4ekNlWEZNNEFRRzQ4OUFQaGJxeEdSV1ViOHpMNFhFZVh3a3lm?=
 =?utf-8?Q?V8DYjFIegcA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHBKcjF5V3JUSkthVVl6VnQ3cVJSZE5PSGtiaW5IZThtU0RVNXFac3hhaXA4?=
 =?utf-8?B?M0x4R3J1SlFiODJYbEFxakFVL0ZUL2MvV2ZncW90WTRSSDM3dGNDL2hNWGUv?=
 =?utf-8?B?am1Ka3pnMFJvUXlPa2ZWNW5hR2lvcWtMblNNQ2JDMEVxOTFEeGlURHEzL2Ry?=
 =?utf-8?B?TjIvSm9Xbm0vMkdUNHNsaHdsci9TVVBYMHI5Zk45VGlZSEllZ25nY285OW5G?=
 =?utf-8?B?TTRsS01VdHNsZVVHQkRPWURYK1ZKWW1mM3ZhY1FKeUJzdUkzSVM3UnQxMjE4?=
 =?utf-8?B?QU5XS2ZQcXRVaDhBNEMwdDNZWVdQdVdzN1Y5d0RBZmg5SXlEeDkwcHZEVktz?=
 =?utf-8?B?bEtaZS9uekw2ZFZQTyszSXhleGFOSFA1QmlVZ2Y0VVRENThieG1xaE10YWQ2?=
 =?utf-8?B?MmRjWUl4TkdUODlvV2ZlQnEwUGdKNUUzU1ZQYklHT1hSQ0paR3VsaUhGbTdq?=
 =?utf-8?B?UDVWVk5pRjFqakVPT0VBYU1zZk4xRnd6R05FbXQxVUxnRUM5bkd0c1ZSOFhn?=
 =?utf-8?B?OTMxbmY2MW9SbkVzZDFUdjVQSTFpakZtRDFuTjBYTTFIVklyTmN2dXlQdzla?=
 =?utf-8?B?TWcvNFcxaDRYQ2VFcEROdmVMNml4LzR3NkV0T2d2YzFJaEp0Q3NvQlRsNldM?=
 =?utf-8?B?dEl5MW0vTU02RUVpR042NlZId1hadGtPNVpzK2VuU0laNzY0UCs4alliRFJy?=
 =?utf-8?B?dzdLTVZjaklxU2dCZjFzRVpHQWFSTTA1WHdoOWpveGczTU84S0lBSy9Zcm9U?=
 =?utf-8?B?WnIxb01IazJVL3gzMmxxclNwU1lJWE9KcDdMVFhJZlFuYzZsdm1vRmFOa0Nm?=
 =?utf-8?B?TEF0THVtTFZmSlByL3p6RjNLTnVKRVMzQk9ldSt1bVdnM0ZhNEl2M2tHb1Fk?=
 =?utf-8?B?NDdBOWpCdmowREdrUzNHWGV3UU92cURZOHRqdlArMDlvN2dYWlNoMDR1aXdj?=
 =?utf-8?B?c08vcXVsTkR0QWhuWjJxTko1bFptYjdINGgyelk1M3cwb21SMklBMU9zODJh?=
 =?utf-8?B?M0wwK3BjVjRHS3hFeUcrb2Q0L3BhL0dPbnVYdy9RWStUdHY4c3o3alkyMnZN?=
 =?utf-8?B?ei85OFZQZGZEd1M0cTR2QVRkeTBnTTlUdmRiRFJhMHQ5QzBrNTh1YmhUZU0y?=
 =?utf-8?B?ZjNtTzMydGhmSmRoa1Jvb0tyV1FWV0tVRXd0bHJhck5ZVzVQMURrVGh2MjFP?=
 =?utf-8?B?NUIvb091czgyVW5qdHV6c0hzS0ZkenllQlRiMll1bkZQL1c0TlpQYUNQQ0k5?=
 =?utf-8?B?Zkhtd05YZFp0dCtNdS9zNVJyRVY4aGc2bUJla0ZhRUVNQURndEFucCs1ZFgz?=
 =?utf-8?B?dlFmT0g4SU5vL3A2MXFmeThXaVl2ajRMczg3TnhBYjAzYldrR0xuSGVUT3Z6?=
 =?utf-8?B?bUtZR05oNG5sZFF2S29GOFdLL1NBVVE2ZGkwMDQ1ZUZ0Zk1PV1R6ZGJIWG83?=
 =?utf-8?B?U3BabDhyVUZRTzd6M1FYekxtUEdJemdKak4reTdDWWxraUtmb1dRd2RwWk4v?=
 =?utf-8?B?ZSswS05tUXFQUmUxbTQ2aGs1d0lVdjFFV0RxUkh5VFdqZTFTaTlMSlFHUU9i?=
 =?utf-8?B?Syt5SmNMendEdUNZT05OcGszZlJFV1o4SHdDY29wZlEvWUZsUTBNY1VEV1FB?=
 =?utf-8?B?NnBWVU83S05pNG8rTzRBNzc5eTJMYWxUOUw2b1UxRWlKUkc2emhBZDdoc1Vz?=
 =?utf-8?B?Z1NUeWhyQkp0WG15R1hpeDZlZTJBTlZCTHdRb1A4b0JxSW9GV2tRS0RZUnJB?=
 =?utf-8?B?ckNQR2p3UEo3YWZaRDA1OEZ1M2JpTzYvaUpKZnpzR0Y3ZnkrY0Nvd0NZZ0pX?=
 =?utf-8?B?Ni9PZ0tOdnE0RlMxL0JOWW1ILytRdTk5aEc4MU0reXZTYkZEZHYzaXVKaERU?=
 =?utf-8?B?LzRzcVY5Zkw0ZU9SbjZZYnd3WDU0YzZFT1A0K3R6ZU1iVHJmZmlsZThpZ1Ns?=
 =?utf-8?B?NElVaDdmNEtLcER5bDNjVnpLOEF6aExSQkQyWlFkVnN0MVpreDdpR0tMRHk4?=
 =?utf-8?B?bFh6NmVKcm9OSVdROSs1Q1lNNFMrU0FtZ2xUMVRkMDErbFl2NGNneUQ0T0Z6?=
 =?utf-8?B?c2tmWU1iWE0wTmVUVmlORjhCY3VaRGp6dFRqY1FLeER2M205VDg4ZFJqbktO?=
 =?utf-8?Q?jVSU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dba9f72-7054-4c49-d04f-08dd98149bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 03:07:23.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdgZlvEay2HGfZtSIoJXK0uwvjFDJ3peioN3fu/YTpU4Vbd5tf+8LCLCSDsltQsg2aIQHAmGW6FZYH2ZTtJQOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gcGluY3RybDogZnJlZXNjYWxl
OiBBZGQgc3VwcG9ydCBmb3IgaW14OTQzIHBpbmN0cmwNCj4gDQo+IE9uIEZyaSwgTWF5IDE2LCAy
MDI1IGF0IDEyOjAy4oCvUE0gSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPiB3cm90ZToNCj4g
DQo+ID4gVGhlIGkuTVg5NDMgU3lzdGVtIE1hbmFnZXIgKFNNKSBmaXJtd2FyZSBzdXBwb3J0cyB0
aGUgU3lzdGVtIENvbnRyb2wNCj4gPiBNYW5hZ2VtZW50IEludGVyZmFjZSAoU0NNSSkgcGluY3Ry
bCBwcm90b2NvbCwgc2ltaWxhciB0byB0aGUgaS5NWDk1IFNNLg0KPiA+IFRoZSBiYXNlIG9mZnNl
dCBmb3IgdGhlIGkuTVg5NDMgSU9NVVhDIERhaXN5IGlucHV0IHJlZ2lzdGVyIGRpZmZlcnMNCj4g
PiBmcm9tIHRoYXQgb2YgdGhlIGkuTVg5NS4gVXBkYXRlIHRoZSBwaW5jdHJsLWlteC1zY21pIGRy
aXZlciB0byBhZGQNCj4gPiBzdXBwb3J0IGZvciBpLk1YOTQzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQZW5n
IEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IA0KPiBJIHdvdWxkIG1lcmdlIGl0Li4uIGJ1
dCB5b3UgYWxzbyBuZWVkIGEgcGF0Y2ggYWRkaW5nIGZzbCxpbXg5NCB0bw0KPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+IGRvIHlvdSBub3Q/DQo+IA0K
DQpTb3JyeSwgSSBmb3Jnb3QgdG8gYWRkIHlvdSBpbiBDYyBsaXN0IG9mIGluIGJlbG93IHRocmVh
ZDoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRp
bmdzL3BhdGNoLzIwMjUwNDIxMDY1MTM5LjMwNzMyMzItMi1waW5nLmJhaUBueHAuY29tLw0KVGhl
ICJmc2wsaW14OTQiIGNvbXBhdGlibGUgY2hhbmdlcyBoYXMgYmVlbiBtZXJnZWQgaW4gbGludXgt
bmV4dCB0cmVlLg0KDQpCUg0KSmFja3kNCg0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

