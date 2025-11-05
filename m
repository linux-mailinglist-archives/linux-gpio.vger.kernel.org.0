Return-Path: <linux-gpio+bounces-28123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F12C35FE5
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 15:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23CFE342A52
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 14:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E1329381;
	Wed,  5 Nov 2025 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C/XHsbgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A13101B9;
	Wed,  5 Nov 2025 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762351968; cv=fail; b=i9pK+Q6Vco/LuvPR1bOWqYYv0vKAHr1bBg0fGVuF1d5LQQZfEYayQCN9c9SNmNOZympHc4eW5sAVyrfaZbbG8nx79xQnPLHHwe6YBrDSvSfS4A3NsPbOLY9pCjbs+JmecPCN5iYop4xkxcAUyA3eilTb/vL/LcSBF9oZ1UZdzK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762351968; c=relaxed/simple;
	bh=TDJXGlustZDnrVY87SwDTupAo8zNTPktltf/7fSVt2A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VoUlIAHF0t3FKM5zCRf6rXt2XYeiVo6xr1s6t7Q5aI4NZQT/0MkV9A6OGnUVLmZq8aHX9TwPmCdIKlRmN3Usp0KbJ3gZVFqR4b4hMJLzFCpne1CIPhlQ+UuaqTTisIhajcdgjf/0LOcV+bcrYhExKUentZPsFdN2LLTA3LwF4Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C/XHsbgQ; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7YnjH9EGLU9w+msn3TckTjlMU4f7xvM/IYXe6jGRa1/o5y0xHCEH7nRdpRtbY9ec53lfFEuykW908Ytks9er8hL0z9hmfRCrN69CsIzpYNuSaES0GZSMfupLidOe7NVQSkONfGSfMHk5v6dkrD8f7HUpXmdzlZ1jPDf/fq6kyFCi+qoZhaG3fRlIHh56KHNwSAgyCSnR7BeJP1J/cXifsTJ3G2Z3bJv5J8R6SdFksGZaw2bn3JqqtSyqgQ1UTw8qdgVnJqLkIdEjCV8+6kPTHCxgyjyCuYvdd5b20ahRNubZ0WYEn/NbDCkQU07JJIA99lSlSeGSwMqK7N+cd/z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDJXGlustZDnrVY87SwDTupAo8zNTPktltf/7fSVt2A=;
 b=q+r3SrXJQlaXRdZr3NfiDJlyuqX881Je7jB/1eQP8RVhEfzrVIp8cyvkW+/3irP3jntsN1ZEkAlasyW7RW6Hq6vsVwDVibFQFeZxMvaaGfNQQlxKZAwzPi7neH1FDBUV3MRZO8xFNKYODsy+3GprPrCpLSnvuL7ztC8kxdvxwTog3H6ydH1Zxv3yxQZ96b0Ox/Wm8FtmoDPxnU/3A8Lx4qn7n/6rSkoO5CPCOq8naiUZWVTSuXbR+kJfCmCxjMAE6ZMzxdAMNM/TYZaOI6WN/4X48+5JA8/nhMd3DOvrYfRrf2J5my6K2YWBHJaiVaJqZob75+wPxLH6eZ8QuQSU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDJXGlustZDnrVY87SwDTupAo8zNTPktltf/7fSVt2A=;
 b=C/XHsbgQ2DnFI/QJrGHwx/vOB3kJcA4MGdqC+ZSPfCx7p/HpVAY6SERuQqDW17muPOUuYFsoIgnDW+9/O6kzFy+aa1FLAf0eNPtaKpVjTDpq0+l13tsGh+aHJcFRVJgoAe9tsMsnLeMi8STwdPQ2hXV1Cvm6O4SC9i2c5Hs+pmT4DVF25jSrnZh1xARZYyiC4Ou6voAupaVLCu07NTDK59ARxaRZlU54M4sKAX9xZGc1fz0cITssAuz17TMqnp3Z+1AAckaYQ4C03dq8ffkdkwgbQjrP/k+y5BYrEYAMxzwQPPKPrNUNe+6N4nMbdoEtP9seARIaHOEbaE5wu3xbzw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7403.eurprd04.prod.outlook.com (2603:10a6:102:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 14:12:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 14:12:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Peng Fan
	<peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Randy Dunlap
	<rdunlap@infradead.org>, Andrew Lunn <andrew@lunn.ch>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcTl5ANC5U96uYo02NDScvc4wsJQ==
Date: Wed, 5 Nov 2025 14:12:42 +0000
Message-ID:
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
In-Reply-To: <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PR3PR04MB7403:EE_
x-ms-office365-filtering-correlation-id: 749455c9-37c1-43a5-f8d4-08de1c7562dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEE5ZHdLTHFXblorOGZqUzRvblVnVUUzSWg2WjhQRzFNVTFuRStNUTZJV2hq?=
 =?utf-8?B?QXhhNkpHRytzc0t1dzJsdHgyWTFqS0ZNaHBlc3QrRUYwODIzZEp5MlE0YXhL?=
 =?utf-8?B?NTVhZDVBcmZBQVlrdFh5cy9CalRYSENGRkxIYnB3aHlXZEtFbElZMTRvc1JW?=
 =?utf-8?B?WXVobVJQRks3U1lPQ1QzU20yMXJIeGlEUFVLSVNYSUZQR2xNU0h1b0ZWeWhU?=
 =?utf-8?B?Q2ZrT1VXbmJNMnE2NWpJUnM0T0FscWoza3gwMjhXdExnL2ZxVVJjRVNkTWIw?=
 =?utf-8?B?OXgxZEwxdGpHODBDZUU3eDFvNlg3Qys4S2RLb0JQc1lYeXpqNS9tZklpTjFH?=
 =?utf-8?B?ZGVwMWVyT2lzSWljOFArbXU4UkUzdk56NVRVQ3Z4d2piOXNmTnJISnRRQTlW?=
 =?utf-8?B?cWNBR3cvUkdxVWk1eXVuQ3FiUVVpOHU3MUdrQ2VHd3RzdDdBZkdGVjBFY3Fx?=
 =?utf-8?B?Q0hKVFFSWTAyMXQvNUdPRGI0dUkzM3J3Y1RVd1RDTS9jQ0trcXlqUDRRSS9r?=
 =?utf-8?B?eTMraUd4N3V5Y0xUY3JPZmQrN1JpKy81aG1lSkFkd1hRaEhQYUllalgrOFVt?=
 =?utf-8?B?SWdqUGhNNHV6ZUtWVjc5ZXpibFJDQjduWVltdmUxbXM4SjBTREh4L0R5Z0J4?=
 =?utf-8?B?MkxXRUc2cUhlR0drZVY2d0l2WnZtMEFXczNCOGZSRkJ3Tnl0M3g5MlFLWU13?=
 =?utf-8?B?ZWR6WDRGT2VyTmYvc1I0RExTWDZFZzBsdU9Fb3dyUDlEMnlzR29xOE1EWi9Q?=
 =?utf-8?B?Vmo0TW4rYys3ZmRkQ0cyaFcwQU81Vjg3b0xUUzJqQjFjOFN0WlgwRzZOQXBt?=
 =?utf-8?B?RjM1bENYRUdlQkw0cmM5QWRsNkhQamhwUGdoUEFlbzN5SlJVcHlMKzZQK0RR?=
 =?utf-8?B?KytTVW1iVDJ2bUVRajZqb2tJVm0zWWtBK0MydVRLdGxzQVkrNTMrR0ptYTY1?=
 =?utf-8?B?VHhxZG9KWXV4M1VtTllOU2kvdXZkZ1ZxZFFnVHpOcDVuU1VrSnJiNVJwZzJL?=
 =?utf-8?B?WDBNd0svSWRDR296dE5vMVc5dmJ5YW5CZlRIamFJNi9rMG9SQjlxS1FiSmFN?=
 =?utf-8?B?VkQ5bHlSQ21ya3F4U3l4NG5sY08rb29nUHR2RXZnM05kL000NGFHd2RyWmdS?=
 =?utf-8?B?ZCtvRktXMndEZW1Gc3JpQVg1YzhHb0J6elhGQS9oZG8rcHhrT1dJY1FSbE1a?=
 =?utf-8?B?aVg0SjRST2w4U294RE56WkM1MWdScURPalgybmRmRDhPa2UraW9BY082bFNr?=
 =?utf-8?B?RzBwSHFDWm1pczg0UlJ6cVRLS3NQaElmSU5WOWs3VGJMeTVaclp0Z3FBNmc3?=
 =?utf-8?B?Z2pEQWloOXhsdEYya3dMVGJ6Rmd1Z0FwTzQ4bVlyQlNFQ05QOHpRZWE4NWtT?=
 =?utf-8?B?MlhTcUpOVnhBTlYrMlVSNW84U3hKQmVvWVlqTnYvUFBJNXBINnFYbnhDMEpz?=
 =?utf-8?B?QnVZcHVXUlVBQTU5YWRJOEhUYk03REpOMVMyeFhYaFNnSW1GYXRENitIeXUv?=
 =?utf-8?B?RURGclBKRGM0V05wMEVpMGtNbWpiVGxxQWlnbUpCd3gyVEtjdThKS3dqL3Z3?=
 =?utf-8?B?N2htU3NaMVdtekxscUs2TkJjMjc1R3NER0lYQnVHVCs5SjlsUk9mSlpYeVh0?=
 =?utf-8?B?SmFNR2E1dlNtRysrRURZaUx0TXNwV1AxM1c3bFJYSGpzVkxUV09YVHJPbStv?=
 =?utf-8?B?RkNmaU4zTkMwWUxmWHZDa3hsLzdsRHRjQWJtWHhrbXZtQUx6Z21iNUIrL0d4?=
 =?utf-8?B?cUlZVGc0U2oxdjFJeVQ5THNSbElTQXZFMVNKSnRKUlMzRlB4by9WSXNFSU1P?=
 =?utf-8?B?THpGVlVQcjZoeVNLN2kzWElkRlArNUNHdGp6eVRiZmRYTERBb0UyUE1zK3hv?=
 =?utf-8?B?OVl5Zmw1UkxYMjVkYUtTZ3dGblkvcm9VNVAvcE9CeXB1MlhRMjJuSFRPNzNT?=
 =?utf-8?B?U0tTeFRqa3lYY3B0bUpJYlduMUtRSXhkeG1DbFhaZE9hMGgvSzlyTmtROTBh?=
 =?utf-8?B?eUtMRytEbVN5QVNoZjRKd1JCQ0RNdUFtZ3BNMTVHZ2E4c3NtaW5vaGpkeXd0?=
 =?utf-8?B?eHU5SEwwUkRoaDczSTB2QTkwT0RlcG1Tc1N4QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajc4NWdaR2lXTFpOVnhPYWxYNEUrUjdybEhFUTZ0V0d6OTNoT1l1MzZVU0h3?=
 =?utf-8?B?TkIvdWpuRmc0SnorVC9OYlVqTGIyYjJjT2c4T2pKUS9WVkxJYjJlZjdWWmZl?=
 =?utf-8?B?M3UyMGVBTStQNjZpV2tDYmtrdTd6Yk9KaFcyRytEQnpzMUhNWEpoODBEbHI5?=
 =?utf-8?B?M3JOSEVCaWl6WEhHYzA5c0Y0WkdGWm0vU1FJUmlTZWoreTErZnp4bjFqUUhr?=
 =?utf-8?B?OXBzdDlBdWozTXQ3SkVDMTlmb1VEdWJ2c0NvSnYzQ2plalpvSHp3VkxoTFVu?=
 =?utf-8?B?OEFEWllMZXI4WG8zREdDSlU3N3BidjJVUzhiTlVSbFZubzJIYnVUUFJzaW4w?=
 =?utf-8?B?TmdHTkdVK0ZEZ0dRZTF4RjZ2ZHI5bzZ3VzVpWE1SR1lCTmJLSnhVSldLTUMr?=
 =?utf-8?B?M3BpZ0JXbU5nZmpjSlNsUGR3NHo1d3BiUVRXb3N0VjY5aEVLS0puSkJZTGd6?=
 =?utf-8?B?QWUyU1NYRytCeG5XR2wzbmQ5eUlrR2RDM1ZyNTFVcHU2Zm1sT25WOEZFL2tD?=
 =?utf-8?B?MEVWUVBMNllLY3NOc2w0aDVzbXBoUjR5VzcxQWJETUN0SjNBZUVMZkJwMTJu?=
 =?utf-8?B?RGtzaXBQejRmNGlaRS9xVnRnQUwwY1dIa0c5N1J4NXlJU2Z3dFVQTnMzS1lP?=
 =?utf-8?B?YlVZanREakNHS245MFV6Y1RiRlZKTmVtOTFxZnkwMThBckdDQS9HQkFxR2xo?=
 =?utf-8?B?VXJSOCtraHlrZFgvc00vQ0N5TVRuc0xwY2l0T01MYUlvMWh2cm1WSXMwTllu?=
 =?utf-8?B?Z043WHBmcjdzaGJIcnVDMGI3OXIrVnhYb01LbWEyWDhOcUhWZ3h6THNLTUx6?=
 =?utf-8?B?SjhKZmhDYnlYVDdVak56a3krMXlhbDB2YWl2MHhzdGc3Z0xVVEQvNFdsMHhM?=
 =?utf-8?B?ZW5DN251QlZLOTNZU0R6azErME9aS0xBZUhCakxQMnd5Vm1ETmFkSTBnamQw?=
 =?utf-8?B?YzBtVExPTW9tWWVZN3kzTkhpUmhOZndyZ3Zvdm9yWU1IN0pJTnRWUDRGNGNK?=
 =?utf-8?B?bERhU1JKd1phaDBUSEZwak5kRlcrNUdjc3JDVjBQRXduYmxac3ZlaEkvS0Nr?=
 =?utf-8?B?OUhvcmJMQkpJeWNLKzY4UDRteUxEWFk3Q2VTS2U2VDI2Y0Z6U3NqdmV0ZWhM?=
 =?utf-8?B?U213LzZPRWhuSHpJeU5hWVBldVBiNTlyMDBicXlmd0IwbVVDUk91T2FsMnpB?=
 =?utf-8?B?STBFSnZXMUVIWmNyKzJGOFBYRVpTalV1d2xqVDF4NVU5MVArSTRDNG83ZklW?=
 =?utf-8?B?cFBNbkIvckR3V1VNRE5sZURZN1drNE9paFA0bS82Sm5JR1QvSUdsaEZ4WmF3?=
 =?utf-8?B?cVdXeTBGT0RLM0tnRFR5OW5LV3JRM3hDOHBwNDJlemhUQWE3TVBOSGdIYWpI?=
 =?utf-8?B?cWpuSm8rMFZWb2hpdjR4azd2QU83RjRQUUN6akRYcjQ1OEFvd2NDMXIzdTZO?=
 =?utf-8?B?eExOY3g2ZVNVbDMwUDA3bGdKaVd3TWdWWk91UG9YYkh0Mlo5QkpiTjRKeGU1?=
 =?utf-8?B?aXV0V01mdUZjeGR2Wlh6clpBV0Vwcm9RbEdVRjhTSkpuOUs5NmgweHFlei9p?=
 =?utf-8?B?aytCblRmMzgzdlFaeUlWWG4yWlR0eU4wYk5QeGlKak1CWFNGOTZYZnJ0SzMy?=
 =?utf-8?B?ejJNSDY3Z0VlcHVrRldlc3Q5TytxQVJNbFl3K3JFemZyWkhvZ3E5dWxSb2l2?=
 =?utf-8?B?RDhveEoySHJVQTg2eXlMNUJsTVJjdWZzRXk4NGRuZlZtZ29IcUxtUCtNaUY4?=
 =?utf-8?B?RndTQkY0bzV0bWFnYnhOWjBQV0xDT0N5OVQxOGVlT05LMW0vSkFpMDF0S2JP?=
 =?utf-8?B?WjNwc0VKVVE3d3dLQWpja1NqMHk1ZkR1VjRDMXMrU3lVdit2eWI2eUxkdCt0?=
 =?utf-8?B?alluOVZEK25SQkswZ2c0UGN5dVo4Mjhqb21BWU03dDNrSmlsdmR4UDJIYWxN?=
 =?utf-8?B?bWlrbmgvd0VISFBWWS9DbHVCTTdhWkJjV25qRmR2KzgwaDJtZ3dpQmFoSGcr?=
 =?utf-8?B?dWdJaUFNbW5leWE4c2I4dlBrV1d0Nm1keERpV3g3TnlHWE8zMVdVcm12THBy?=
 =?utf-8?B?NGc4OTFkQnhjYzB1eUxIa2EvRWZINzhtTk1wWmhFU1QrNUN2dmtCR2Y4WEhy?=
 =?utf-8?Q?oSeY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 749455c9-37c1-43a5-f8d4-08de1c7562dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 14:12:42.8467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do023iXIPG9CLhib44S5b6tvZ7ilPYn1k0lJSRSuG5uXodiG7a0tcfAiLo28bpEEJtCo7Qu/rQ+gLK0hIxco6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7403

SGkgQXJuYXVkLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgNSwgMjAyNSA0OjI2IEFNDQo+IFRvOiBQZW5nIEZhbiA8cGVuZy5mYW5A
bnhwLmNvbT47IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+Ow0KPiBCam9ybiBB
bmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyDQo+IDxtYXRo
aWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBL
cnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkg
PGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3bg0KPiBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+
OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Ow0KPiBKb25hdGhhbiBDb3Ji
ZXQgPGNvcmJldEBsd24ubmV0PjsgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPjsNCj4gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gQ2M6IFBlbmd1
dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
DQo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxp
bnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgg
PGxpbnV4LWlteEBueHAuY29tPjsgUmFuZHkgRHVubGFwDQo+IDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+OyBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2NSAwLzVdIEVuYWJsZSBSZW1v
dGUgR1BJTyBvdmVyIFJQTVNHIG9uIGkuTVgNCj4gUGxhdGZvcm0NCj4gSGksDQo+IA0KPiBPbiAx
MS81LzI1IDAyOjEyLCBQZW5nIEZhbiB3cm90ZToNCj4gPiBIaSBTaGVud2VpDQo+ID4NCj4gPj4g
U3ViamVjdDogW1BBVENIIHY1IDAvNV0gRW5hYmxlIFJlbW90ZSBHUElPIG92ZXIgUlBNU0cgb24g
aS5NWA0KPiA+PiBQbGF0Zm9ybQ0KPiA+Pg0KPiA+PiBTdXBwb3J0IHRoZSByZW1vdGUgZGV2aWNl
cyBvbiB0aGUgcmVtb3RlIHByb2Nlc3NvciB2aWEgdGhlIFJQTVNHIGJ1cw0KPiA+PiBvbiBpLk1Y
IHBsYXRmb3JtLg0KPiA+Pg0KPiA+DQo+ID4gSSBoYXZlIG5vdCBsb29rIGludG8gdGhlIGRldGFp
bHMgb2YgbmV3IHZlcnNpb24sIGJ1dCBiZWZvcmUgdGhhdCwganVzdA0KPiA+IHdhbnQgdG8gY2hl
Y2ssIGhhdmUgd2UgYWdyZWVkIG9uIHdoYXQgQXJuYXVkIHN1Z2dlc3RlZD8NCj4gPiBvciBjb250
aW51ZSB0byBwcm9jZWVkIHRvIGJlIHRoaXMgYXMgaS5NWCBzcGVjaWZpYz8NCj4gDQo+IFRoYW5r
cywgUGVuZywgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBSZWdhcmRpbmcgdGhlIFYzIGRpc2N1c3Np
b25zLCBpdCBzZWVtcyB0aGF0IEkNCj4gYW0gbm90IHRoZSBvbmx5IG9uZSBzdWdnZXN0aW5nIGEg
Z2VuZXJpYyBkcml2ZXIuDQo+IA0KDQpBcyBJIG1lbnRpb25lZCBiZWZvcmUsIHRoZSBvbmx5IGku
TVgtc3BlY2lmaWMgcGFydCBpcyB0aGUgdHJhbnNwb3J0IHByb3RvY29sIG92ZXIgdGhlIFJQTVNH
IGJ1cy4gDQpJbiB0aGlzIHY1IHBhdGNoZXMsIHdl4oCZdmUgaW5jbHVkZWQgZGV0YWlsZWQgZG9j
dW1lbnRhdGlvbiBmb3IgdGhlIHByb3RvY29sIGluIGEgc2VwYXJhdGUgZmlsZS4gQW55IA0KcGxh
dGZvcm0gdGhhdCBmb2xsb3dzIHRoZSBzYW1lIHByb3RvY29sIHNob3VsZCB3b3JrIHJpZ2h0IG91
dCBvZiB0aGUgYm94LiANCg0KSWYgeW91IHNwb3QgYW55dGhpbmcgdGhhdCBjb3VsZCBiZSBpbXBy
b3ZlZCwgcGxlYXNlIGxldCBtZSBrbm93IQ0KDQpUaGFua3MsDQpTaGVud2VpIA0KDQo+IFRoYW5r
cywNCj4gQXJuYXVkDQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gUGVuZy4NCg0K

