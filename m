Return-Path: <linux-gpio+bounces-31906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFvzCwh9l2nmzAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:13:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF3162AB0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EB5B30156F2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BBA326D73;
	Thu, 19 Feb 2026 21:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eHUjlOjk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60202302779;
	Thu, 19 Feb 2026 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535621; cv=fail; b=Kf2gLlYgc7P+L+JXUPVXRYiGTp9m8MHySEJfNfx/jAe51XeoTyBEZrKzlEAkyY5Vhe9hbHvumf1PgB3B2smpvyjBvykpchpJtbqPfpjLN0Eyd1DXPoqWkTr4O0Z19w089hcNmf/H6cmmXGl+WaS0/7Mwj6pi3GFxvNsOhLp6fYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535621; c=relaxed/simple;
	bh=P5e97d5q7iFulQgIdl7897Mp522dYleUUbFAgJSeOUI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eLyS5hsYClJ3Vjq8FjjSYEFjECHTXAT3pHKn6WspU4FnUykhF1lS6HtYHZPIb9+NWWjKpmYyID4QHmctmCXhBZFg9oB5/dq1ogwI9H2bQ90uS/1oFG3jGSUcsEAy1UN80NLKqwKfVohBrHRBbZ19OEeyxjACrLVpF5rdsvkP/6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eHUjlOjk; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5wy9gEMVUEZ6SfJvpVh7KvbrWj+6fuW93JFJYxZvDWa6Yg5JfyDOew8PPSpRmfJCxwSeKObhmx2Lb62JwENdbbBUPxnBRdZVBqTrnvPJdoby9R2mcukdOL8nwzz5Q/T2EkqfdBRCevHD9LlC9VEmzqnGXN730trV5v+kwjaLImfoFBQGU0d18ZMxp6D4k7AXjFbMKffUQ5tnK7Lx5fVA/6GW70D7KE7bYCu9lTkI4l+bWrtCxt+J29msvOJzs5Pnx98nNK753NEdcG9m8TeppltDszZCCYCpy8tl8paRsYmEA288l6VFFuXoqXo5eEM+lhv53oOvAn8t87cGZuvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5e97d5q7iFulQgIdl7897Mp522dYleUUbFAgJSeOUI=;
 b=gpPPA4YNlLwDe7abLc6dHsAyWD/8EKnAFzqQyMLeTx8ZAUhRGGUdr0ah4cQfeo1n48uaY6SWrlmwZKBOss5lAVUSzU41ZGO7tk7VwfUIhQ0XeESeqGKbvNrduFlIVyCsWxws2bwn6mxnS9Yl8Yw9/PdqbSSiFoBg4q1WOvW1DP9Pn1zihoYQ7dQa21nXw1CHANuXqEB9rxGfdIP/QTUVFv3tKez5nx6U/pvl40fVoRMOvIiv6AcCbVIdbAnAVk/nuKbxiCON1BriglFZgm2jSSIW/NO+6NB6Cs86/TWw3H5zPMkvTKJSetsVf+24Bm/zkFVtfyGiWKIzGmQqBON2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5e97d5q7iFulQgIdl7897Mp522dYleUUbFAgJSeOUI=;
 b=eHUjlOjkjpkMPacT35JgVxJAJiyJ8QVkqULsAWksQ6oB601vSmXSsHtMg7Wi3bUTp+YHaSumb1807vKTFv4jAhT318yMBnKe2raz5UhIIz04EHZvUP9WCofeRl6VTJBkT6QHzbq1MTrm72kGqol7bbxIPlB+GYD807+Q1JCXZs2+OT2pO0RZsZmCowpheXR/8IfgSXTCeSG18mOT5nugb0dii6mVV9W7tHm/NRX2ewFOKHJcDGO1fnkTB5xOsIVpndEzPAMko1Mn6yic2uD7bkbCIMSM8oXkukVdIg2w9e7SOV6ZjITiQ9xV3miH+caLH3BItx7hDPavv4b1+jlROQ==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AS5PR04MB10059.eurprd04.prod.outlook.com (2603:10a6:20b:680::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 21:13:34 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 21:13:34 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
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
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcoeSb9UWBljTGOk6EmFN4TOe43Q==
Date: Thu, 19 Feb 2026 21:13:34 +0000
Message-ID:
 <AS8PR04MB917654F40D80A2DBAD30ACD1896BA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
In-Reply-To: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|AS5PR04MB10059:EE_
x-ms-office365-filtering-correlation-id: 4bd6a984-4501-453f-3787-08de6ffbbde9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eTBSZzdDNUZrbllDTEFMeCtObnlRVDRwdlZQRFUvcEN0bS9qTzE5YnZnMzJt?=
 =?utf-8?B?VkM1QmtmcmVxMFlBRy9uTzluMHppZEg1Si85UUFPcEJSc3I2aXB0aWpRcGhY?=
 =?utf-8?B?c29PRjJGZ3JXWUVxM3FMQ0ZZZzFGQXNLajNqSmJqOExyNFlBK1ZoUi9rQVBM?=
 =?utf-8?B?VHVsbi9oaEZIVzJNak5Pc2p0WjhoVXI3N2k3d1JYWDZ2S3oyTVFhNzNrSVda?=
 =?utf-8?B?UzEwNTIreDRhbUIycHM1R3NlVWVmbnFlVXdkMzk3NHRLU0pUdG1qaW9QSXI2?=
 =?utf-8?B?b0lBSFdWSzZQRXN0bXRuZnVXcVhRR1ArL2VFcG80YnVsRjAra203aENYcUx6?=
 =?utf-8?B?cmZXUXFLQWVWblZWdmJReW1vUHFDeEhnRDlNQm02emRnZWRSQzV4akY0TjB4?=
 =?utf-8?B?alFyWE1Ta2RiZVBxRXdXdFVEZDNaOTVHUHYrdHJTVFlPck9jVk5xMEFITlBy?=
 =?utf-8?B?R0lNSWVzRkVvcktrV3VhNXhYbWJuWHI2a1hsSkxaaGtMV3MvUHJJdzBraUdy?=
 =?utf-8?B?dVdRRVg3dnZuWGlhOWl1ekxGQStoMG5zZEt4VEZjWFVmbCs4VUg5TFhUeEFv?=
 =?utf-8?B?azdPbzFMOXN6VFU3QzBNZElXWFN6eHBkN2ZadHIrR1ZlK2owdHpFcGNGR2ZS?=
 =?utf-8?B?a3I5RjRMd0Z3MHBUTVlOWkFjemFiMnNJMFgvODdPbitCMWIya2huazZWODhn?=
 =?utf-8?B?bXBUMTR3WHRQd09NcXk0UTc0TC9xNmFPeC9qTGVOTDJRV2VTbzVuV2ZsN3VM?=
 =?utf-8?B?SUV1UFliU1gweXZzRGVBb05pMGIrRExaaXVqb3BpVkNYZCtmYlBDMklmOXg2?=
 =?utf-8?B?MkpzY21yZ0FMM3ppU2I2ZFp3QklXbXkwcElaNlZLU1dWWmtPaFNhcERNNUg5?=
 =?utf-8?B?YnRQNXFaS1lEYWhkZFVmMndKQWZDNG1KVmFLUm42MkxrUFlkaGd6RU9tcEc3?=
 =?utf-8?B?UTRWUVNXak9MVHZTK2Z4SVZwQnA4RWhvLzdDK0I2N0lBL3pSMnFoaHVNRUNV?=
 =?utf-8?B?aUVPRlYxTldpVDJtNm1UWndLa0E4cFJieVBkc0oyVzMxL3E1eDFnckNwREJi?=
 =?utf-8?B?V0daUEtHMm5mdDRRempNVWZRenhWYnRNWlIvN3lBSm8zaWNQVEIvYnFtalRC?=
 =?utf-8?B?a2gySkZVd0xQdDFKZ0FFOW92TXlKQXZlUHQrUjdtRmo5QWk3dmJKQUVLRU1j?=
 =?utf-8?B?WnFkTHEwZDFPQVppbkZ4b1ZhSmxlUlNvZ1ZxcWo2WTJhaS80MHdkK0RVbGt3?=
 =?utf-8?B?NGZldFZuVHB1SlZ4NW9UOXhRaWRuSTlncVExTDJoYWxEVXMxZDJCNDFmYnRW?=
 =?utf-8?B?ZUZ1ME5TUWlBanJLYlo3b3VtVTh2bkNUYm9uRmpsN2xIZDF5VFNrQVBGTC9T?=
 =?utf-8?B?VTVXaTlnRTNSN3NQLytCdDA3dUUzZDBRMm1sanMvTmN1UDJubXVaVXRLWHBh?=
 =?utf-8?B?R1hKRktNUExTdFFzRHpaZHpKMkE0M2wxOTA5RmIxNUJTNlVVckVlZTREUHVl?=
 =?utf-8?B?SVBxNUdMaGl1YlBiQXNOcWU1SDljL2NnSzdDK0duR0Zubk1rMHppSlpmMnZY?=
 =?utf-8?B?RHlWWXVodWZpTUhuNEZ2bjdNVkdnMkJCUURhTGpaY1JJdUtIRGViVllhaGY3?=
 =?utf-8?B?RDhXRkhuQ3hBb0FtRkgvRVJ4YzRpN3BFQ204emdKY1RNSm5Sb2tCdnVEMmdn?=
 =?utf-8?B?ckkyZXYwd0F5N29uWU1TSUF3SlA3anZxalMvQnJ3L0h5QksyZXJkanBiQXM2?=
 =?utf-8?B?T3ViQ0JMemRkMktRTDJ3V2I5TFRtb3hGblRwS3FoZDJ1NWttNmZhUTZGRjY4?=
 =?utf-8?B?QjYxdGNYeTd6MHhlV21GOVE1ZG5jYXdCWVdPaS9Gd3J6SkE1di9KU1ZUT3p3?=
 =?utf-8?B?VWQ2dkdVaWJtaDFCZ0FnTHltQXk5TDU4b3prZmNGdGhKZFJIcSsrRXo3U3do?=
 =?utf-8?B?aExkMFJpS1NkRFdvQ1JHWVlrcm81a0tyQ2tTTDRzS0hpcG8xUjlBbnVmU0w3?=
 =?utf-8?B?QTJqekNhdnduZzBnYnJNZDJWN2xiT3U4ZEExczNBblZsQ1VUQmp2b00vb1Jj?=
 =?utf-8?B?YTBWaWdIUmF6VXZ3N21TcHhLa2xmT2tZYWlveEp1d1VvajFtKzQ1eFI0aC9p?=
 =?utf-8?B?RUpaeVdUZ2tmbEtLT0JUSnUyZnBWTTlURThhdkxzcFhOWGkvVmp6ZXc0OVNs?=
 =?utf-8?Q?4AkgKJzGZXf6v4u6MAvLZEecSEgScl2QAbScwH8YjUJK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEtzbUUyNGc4em16OHhYOXNNOUpSeDFyOUdtMU83MnBLcHRKVTgwYklnRU9D?=
 =?utf-8?B?bENGRzRnbllJS0ErRzhqejBFK3AvaS94TGluSWo2Nit6a2k4T242TUZRWFZz?=
 =?utf-8?B?WVFNMGdsZWEzSVdEVkJCSWI2TUMvc2xhdVZ5alYvaENlbXFRTkZLQTV4MjlZ?=
 =?utf-8?B?aWw1eVUrcEZycGZUaGN5YVNCSWIrQmxGNnovWFZXN1pPZkZ6R2pwcDBydkk4?=
 =?utf-8?B?Y1Bhek8xaTFIaGtjdklZb2N6Tlg0RTFRUXdRVUFWVGc4VnQ4ME44a21vb0dR?=
 =?utf-8?B?M3UrM3ZMTWpBNDVTbmlpRDlTcHBWN0E1YnVIRnhkWTNEQWxTbWhQb0x4WXBp?=
 =?utf-8?B?ckNlM3dXNVpndzdFYndDYmVoQ3A5bVgyUkkyRUpQMGhiaFdoRDgzS3JIemFK?=
 =?utf-8?B?V2xHODN0VHJnQld6dVkwd001Z2hkK0diNysvazhuWDJuakNvUlJEZ3pzUC96?=
 =?utf-8?B?ZkVxVS9mekNLK1RFV2pmUUQyY2lLU2p3ekVTTEhyKzBCd1NyQlZkVE9jazlx?=
 =?utf-8?B?ZjRBeW15Mk5DQnNEYXJQQ2RON3lXekVhVHhMVjFlR3Z1SDM5VURYbzh3Mnly?=
 =?utf-8?B?SlB5aFpoTm8reWNGeVNkdGdhejVpMWkzMkpIM0J6cENQbTZaZEpVb2QzdHVZ?=
 =?utf-8?B?NXErRTE3TlppQUF5UVBvV05HOHdnYlJ0aUJCcFNaSUJEcG82YXRZbEJmS3Yw?=
 =?utf-8?B?ZTg1eFh1WXdyQlNMc1pCeGlTRllLN0MrTnc4ZXpVQUdIdW9HeDMxVmNaVWRm?=
 =?utf-8?B?SjZ4dFNVNGdjc21rMVl5N3JGWHlXYmtzNC9UdnhJank5cTlGMERoRTRaRG9k?=
 =?utf-8?B?TGF2R1lUSHdTYU9tZVFhSjR0dDhhMXVSMEFkUXR6ZzA3WjFOOWFmcDdWNTI0?=
 =?utf-8?B?L1RPRGJFVEdrNE9WdW1xZzlrL0JrcGNsMmhiNTJmZVlIL2NiZXR3ZjFIVGxu?=
 =?utf-8?B?U3pwNmlPZzNkSFpxbXE3YXNYWnpDRlZlaWVldzZwaEkvVUJhQnUzT3IyK3pN?=
 =?utf-8?B?ZWdTYnN3dEk4V2dwTzVSV1dxVnlyRHNlUlNPZlA4cVBvYWREU2xxQlZrTitZ?=
 =?utf-8?B?cmRaaGJkTkd3ZDIzN1g4R2JOeU5XbkxxSHJtSnROT25DazlJWkRDY21saGxk?=
 =?utf-8?B?WU45eS9PYVZBMkFqZXVTNzV3clRtbzRZRTZHS0VXcFkxcUxDNElDa1JyaW1t?=
 =?utf-8?B?bVQvM29IY1lrU2VNSFFqU2hLeDNHTXhuRjhmajQ0ZUs0UHV5V3dwdllOVTEw?=
 =?utf-8?B?NjVOV3hGY3NpSUpNWmxINFlTbFNYZUgrcE5rcnE0MiszK1VBbjJMR29RUUNl?=
 =?utf-8?B?RXE5ZlE5UGtLL012SWVxamhJQzFQYlhUV2xzcUc3NE0yUHloTXlydFVXd1hl?=
 =?utf-8?B?NlJEOXFSc1FpcnAzV29QN1lVancybE9hd0RPTlNXOG8zeVQ0R3c0K0hVK25R?=
 =?utf-8?B?cHVYZEJOYzREZW1MRUtMT1VROFprcm5DSzUzb2lFZWJ0cmFQRlh4dEtqR1Y3?=
 =?utf-8?B?bEJTNDNJVXhTTjMzZmRyZHN3bjRna0pmNWtlTjAwWXdKN2FqUnY2QjVTVlVN?=
 =?utf-8?B?SDVtQiswTE9DYWorNENZTmF2L1pSOUxpOENOcldrbis5bGhZTUVlUG5FQzNO?=
 =?utf-8?B?K2xCUDcvZ0ZFM2lwVFc5S1dhVTJkMGJOWHA5ZkRSV2V1YlpwdXhCU0dYZ0pl?=
 =?utf-8?B?SHJrSzVWSE1kS1ZOTDQ5REp0dnNMNlN0KzFaUjF5OUU2dlRRSm5sK0Rwa205?=
 =?utf-8?B?VldXUlBHUG1JQVZQZjdJUWV1RUtUTk5yZkRZY1dhVHdIU3F3TU81cXZUb1Ry?=
 =?utf-8?B?Q1Z1dHl4UDFwZiszMzViQWdaWnlUSTQvT09LbWN3Q3dJRHhFbUNZaVNBYkVo?=
 =?utf-8?B?SHh3MU1oa1FKMmhoNENUbmhBZ3YyUnZta01Gb3N5cEk0enZCVWtuMklKaGVr?=
 =?utf-8?B?TjB3RzhvRHlNbkpLMk96QlAzS3JQVVNlWVBnemxCc21nZ1JuNVp1RTFjckRU?=
 =?utf-8?B?ckJQOEt1cEJ1SlowVlB1cmtrSzg4cVdYVXROWmJlSHo5VEU2V1ZvVzdHdmNR?=
 =?utf-8?B?N0lSYmw5RzVpYlJGcU0xQ21vd0pZd0pQVmpwNjcyaXVFUjBpc0N1TWFJR2F0?=
 =?utf-8?B?WkRGUStZeVRmbFdvVWJyWHhhc244a1ZrSEg0aTJXbFY4eFJsN1FzSHNQRTlh?=
 =?utf-8?B?cDBGSXI5S2tTZmZpMHZaMm96SnlRSm41cHVMSkk3VGR1MldkNXg1eHdxZmxM?=
 =?utf-8?B?cjVYTHl0eVlxM1dycXF6bDgwZlIyTkVZOEdZVUlremJvUDA3S0treVBVTjNR?=
 =?utf-8?B?VVZtZSs4ZTBVakJrcGNyN3Y1MWo2NUxOYkhsMlREVS9Fbk5TdHgxUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd6a984-4501-453f-3787-08de6ffbbde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 21:13:34.6322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dvThFe6fnQfA5ebb1wAfdijTKOhdkJMA6MmMLgKvwVYvsNibJ+wDObTs5KlvoQl9DY7UgZIh9nkOPDQtQBBBOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31906-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
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
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87EF3162AB0
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1
YXJ5IDE5LCAyMDI2IDM6MjEgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54
cC5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3
bi5uZXQ+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwu
b3JnPjsgQmpvcm4gQW5kZXJzc29uDQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUg
UG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsu
bGlAbnhwLmNvbT47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6
IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0
cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0K
PiA8cGVuZy5mYW5AbnhwLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4
LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgt
aW14QG54cC5jb20+OyBCYXJ0b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPjsgQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4
IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+ID4gKyAg
ICAgcnByb2MgPSBycHJvY19nZXRfYnlfY2hpbGQoJnJwZGV2LT5kZXYpOw0KPiA+ICsgICAgIGlm
ICghcnByb2MpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArDQo+ID4gKyAg
ICAgbnAgPSBvZl9ub2RlX2dldChycHJvYy0+ZGV2Lm9mX25vZGUpOw0KPiA+ICsgICAgIGlmICgh
bnAgJiYgcnByb2MtPmRldi5wYXJlbnQpDQo+ID4gKyAgICAgICAgICAgICBucCA9IG9mX25vZGVf
Z2V0KHJwcm9jLT5kZXYucGFyZW50LT5vZl9ub2RlKTsNCj4gDQo+IElzIGEgdG9wb2xvZ3kgd2hl
cmUgdGhleSBpcyBubyBycHJvYy0+ZGV2IG5vZGUgYnV0IGEgcGFyZW50IG5vZGUgZXhpc3Q/DQo+
IA0KDQpJZiBubyBycHJvYy0+ZGV2LCBpdCBzaG91bGQgcmV0dXJuIE5VTEwgaW4gdGhlIGFib3Zl
IGNoZWNrLg0KDQo+ID4gKw0KPiA+ICsgICAgIGlmIChucCkgew0KPiA+ICsgICAgICAgICAgICAg
LyogQmFsYW5jZSB0aGUgb2Zfbm9kZV9wdXQoKSBwZXJmb3JtZWQgYnkgb2ZfZmluZF9ub2RlX2J5
X25hbWUoKS4NCj4gKi8NCj4gPiArICAgICAgICAgICAgIG9mX25vZGVfZ2V0KG5wKTsNCj4gPiAr
ICAgICAgICAgICAgIG5wX2NoYW4gPSBvZl9maW5kX25vZGVfYnlfbmFtZShucCwgY2hhbl9uYW1l
KTsNCj4gPiArICAgICAgICAgICAgIG9mX25vZGVfcHV0KG5wKTsNCj4gPiArICAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgIHJldHVybiBucF9jaGFuOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW50DQo+ID4gK3JwbXNnX2dwaW9fY2hhbm5lbF9jYWxsYmFjayhzdHJ1Y3QgcnBtc2dfZGV2aWNl
ICpycGRldiwgdm9pZCAqZGF0YSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGludCBs
ZW4sIHZvaWQgKnByaXYsIHUzMiBzcmMpIHsNCj4gPiArICAgICBzdHJ1Y3QgZ3Bpb19ycG1zZ19w
YWNrZXQgKm1zZyA9IGRhdGE7DQo+ID4gKyAgICAgc3RydWN0IHJwbXNnX2dwaW9fcG9ydCAqcG9y
dCA9IE5VTEw7DQo+ID4gKyAgICAgc3RydWN0IHJwZGV2X2RydmRhdGEgKmRydmRhdGE7DQo+ID4g
Kw0KPiA+ICsgICAgIGRydmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoJnJwZGV2LT5kZXYpOw0KPiA+
ICsgICAgIGlmIChkcnZkYXRhICYmIG1zZyAmJiBtc2ctPnBvcnRfaWR4IDwgTUFYX1BPUlRfUEVS
X0NIQU5ORUwpDQo+ID4gKyAgICAgICAgICAgICBwb3J0ID0gZHJ2ZGF0YS0+Y2hhbm5lbF9kZXZp
Y2VzW21zZy0+cG9ydF9pZHhdOw0KPiA+ICsNCj4gPiArICAgICBpZiAoIXBvcnQpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArDQo+ID4gKyAgICAgaWYgKG1zZy0+aGVh
ZGVyLnR5cGUgPT0gR1BJT19SUE1TR19SRVBMWSkgew0KPiA+ICsgICAgICAgICAgICAgKnBvcnQt
PmluZm8ucmVwbHlfbXNnID0gKm1zZzsNCj4gPiArICAgICAgICAgICAgIGNvbXBsZXRlKCZwb3J0
LT5pbmZvLmNtZF9jb21wbGV0ZSk7DQo+IA0KPiBXaGF0IGhhcHBlbiBpZiB0aGUgcmVtb3RlcHJv
Y2Vzc29yIGFuc3dlciBhZnRlciB0aGUgY29tcGxldGlvbiB0aW1lb3V0Pw0KPiBDb3VsZCBpdCBy
ZXN1bHQgaW4gZGVzeW5jaHJvbml6YXRpb24gYmV0d2VlbiB0aGUgcmVxdWVzdCBhbmQgdGhlIGFu
c3dlcj8NCg0KSWYgdGhlIHJlbW90ZSBwcm9jZXNzb3IgcmVzcG9uZHMgYWZ0ZXIgdGhlIHRpbWVv
dXQsIHRoYXQgbGF0ZSByZXBseSB3aWxsIGJlIGlnbm9yZWQuIFRoZSBjdXJyZW50IA0KdHJhbnNm
ZXIgc2hvdWxkIGZhaWwgd2l0aCBUSU1FT1VULCBhbmQgdGhlIHN0YXRlIHdvbuKAmXQgYmUgY2Fy
cmllZCBvdmVyIGJlY2F1c2UgY21kX2NvbXBsZXRlIA0KaXMgcmVpbml0aWFsaXplZCBiZWZvcmUg
ZWFjaCBuZXcgcmVxdWVzdCwgc28gYSBzdGFsZSBjb21wbGV0aW9uIHdvbuKAmXQgZGVzeW5jaHJv
bml6ZSB0aGUgbmV4dCANCnRyYW5zYWN0aW9uLiBFYWNoIGNvbW1hbmTigJNyZXBseSBjeWNsZSBp
cyBpc29sYXRlZCwgc28gYSBkZWxheWVkIHJlcGx5IGNhbm5vdCBjb3JydXB0IG9yIG1peCB3aXRo
IA0KYSBzdWJzZXF1ZW50IHJlcXVlc3QuDQoNCj4gDQo+IEhhdmluZyBhIGNtZF9jb3VudGVyIGlu
IGdwaW9fcnBtc2dfaGVhZCBjb3VsZCBoZWxwIHRvIGlkZW50aWZ5IGN1cnJlbnQgcmVxdWVzdA0K
PiBhbmQgYW5zd2VyDQo+IA0KPiB0aGUgdXNlIG9mIHJlaW5pdF9jb21wbGV0aW9uIGNvdWxkIGJl
IGFsc28gbmVlZGVkDQo+IA0KPiA+ICsgICAgIH0gZWxzZSBpZiAobXNnLT5oZWFkZXIudHlwZSA9
PSBHUElPX1JQTVNHX05PVElGWSkgew0KPiA+ICsgICAgICAgICAgICAgZ2VuZXJpY19oYW5kbGVf
ZG9tYWluX2lycV9zYWZlKHBvcnQtPmdjLmlycS5kb21haW4sIG1zZy0+cGluX2lkeCk7DQo+ID4g
KyAgICAgfSBlbHNlDQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZycGRldi0+ZGV2LCAid3Jv
bmcgY29tbWFuZCB0eXBlIVxuIik7DQo+IA0KPiBDb3VsZCB5b3UgcHJpbnQgdGhlIG1zZy0+aGVh
ZGVyLnR5cGUgdmFsdWUgdG8gaGVscCBmb3IgZGVidWc/DQo+IA0KDQpTdXJlLiBXaWxsIGFkZCBp
dCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnBtc2dfZ3Bpb19jaGFubmVsX3Byb2JlKHN0cnVjdCBy
cG1zZ19kZXZpY2UgKnJwZGV2KSB7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnJw
ZGV2LT5kZXY7DQo+ID4gKyAgICAgc3RydWN0IHJwZGV2X2RydmRhdGEgKmRydmRhdGE7DQo+ID4g
KyAgICAgc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4gPiArICAgICBpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArICAgICBpZiAoIWRldi0+b2Zfbm9kZSkgew0KPiA+ICsgICAgICAgICAgICAgbnAgPSBy
cG1zZ19nZXRfY2hhbm5lbF9vZm5vZGUocnBkZXYsIHJwZGV2LT5pZC5uYW1lKTsNCj4gPiArICAg
ICAgICAgICAgIGlmIChucCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXYtPm9mX25v
ZGUgPSBucDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgc2V0X3ByaW1hcnlfZndub2RlKGRl
diwgb2ZfZndub2RlX2hhbmRsZShucCkpOw0KPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiAr
ICAgICBkcnZkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkcnZkYXRhKSwgR0ZQX0tF
Uk5FTCk7DQo+ID4gKyAgICAgaWYgKCFkcnZkYXRhKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgIGRydmRhdGEtPnJwcm9jX25hbWUgPSBycG1zZ19n
ZXRfcnByb2Nfbm9kZV9uYW1lKHJwZGV2KTsNCj4gPiArICAgICBkZXZfc2V0X2RydmRhdGEoZGV2
LCBkcnZkYXRhKTsNCj4gPiArDQo+ID4gKyAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29w
ZWQoZGV2LT5vZl9ub2RlLCBjaGlsZCkgew0KPiA+ICsgICAgICAgICAgICAgaWYgKCFvZl9kZXZp
Y2VfaXNfYXZhaWxhYmxlKGNoaWxkKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFvZl9tYXRjaF9ub2RlKGRldi0+ZHJp
dmVyLT5vZl9tYXRjaF90YWJsZSwgY2hpbGQpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICByZXQgPSBycG1zZ19ncGlvY2hpcF9y
ZWdpc3RlcihycGRldiwgY2hpbGQpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVy
OiAlcE9GXG4iLCBjaGlsZCk7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICByZXR1cm4g
MDsNCj4gDQo+IHJldHVybiByZXQNCj4gb3IgaW5kaWNhdGUgd2h5IHRoZSByZXR1cm4gb2YgcnBt
c2dfZ3Bpb2NoaXBfcmVnaXN0ZXIgaXMgbm90IHRha2VuIGludG8gYWNjb3VudA0KPiANCg0KcnBt
c2dfZ3Bpb2NoaXBfcmVnaXN0ZXIoKSBmYWlsaW5nIG9ubHkgYWZmZWN0cyB3aGV0aGVyIHRoZSBH
UElPIGluc3RhbmNlIGdldHMgY3JlYXRlZC4gVGhlIA0KcnBtc2cgY2hhbm5lbCBkcml2ZXIgaXRz
ZWxmIGNhbiBzdGlsbCBwcm9iZSBzdWNjZXNzZnVsbHkgYW5kIGNvbnRpbnVlIHRvIG9wZXJhdGUg
Zm9yIG90aGVyIGZlYXR1cmVzLiANCg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZv
aWQgcnBtc2dfZ3Bpb19jaGFubmVsX3JlbW92ZShzdHJ1Y3QgcnBtc2dfZGV2aWNlICpycGRldikg
ew0KPiA+ICsgICAgIGRldl9pbmZvKCZycGRldi0+ZGV2LCAicnBtc2cgZ3BpbyBjaGFubmVsIGRy
aXZlciBpcyByZW1vdmVkXG4iKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgcnBtc2dfZ3Bpb19kdF9pZHNbXSA9IHsNCj4gPiArICAgICB7IC5j
b21wYXRpYmxlID0gInJwbXNnLWdwaW8iIH0sDQo+ID4gKyAgICAgeyAvKiBzZW50aW5lbCAqLyB9
DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IHJwbXNnX2RldmljZV9pZCBycG1z
Z19ncGlvX2NoYW5uZWxfaWRfdGFibGVbXSA9IHsNCj4gPiArICAgICB7IC5uYW1lID0gInJwbXNn
LWlvLWNoYW5uZWwiIH0sDQo+IA0KPiBJIHdvdWxkIHJlbW92ZSB0aGUgIi1jaGFubmVsIiBzdWZm
aXggdG8gaGF2ZSBzaW1pbGFyIG5hbWluZyB0aGFuICJycG1zZy10dHkiIGFuZA0KPiAicnBtc2ct
cmF3Ig0KPiANCg0KVGhlIGNoYW5uZWwgbmFtZSBjb21lcyBmcm9tIHRoZSByZW1vdGUgZmlybXdh
cmUsIHNvIHdlIGNhbuKAmXQgZnJlZWx5IHJlbmFtZSBpdCBvbiB0aGUgDQpMaW51eCBzaWRlLiBP
biBpLk1YIHBsYXRmb3JtcyB0aGUgZmlybXdhcmUgZm9sbG93cyBpdHMgb3duIG5hbWluZyBjb252
ZW50aW9ucywgYW5kIHRoZSAqLWNoYW5uZWwgDQpzdWZmaXggaXMgcGFydCBvZiB0aGF0IHNjaGVt
ZS4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQo+IFJlZ2FyZHMsDQo+IEFybmF1ZA0KPiANCj4gPiAr
ICAgICB7IH0sDQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUocnBtc2csIHJwbXNn
X2dwaW9fY2hhbm5lbF9pZF90YWJsZSk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IHJwbXNn
X2RyaXZlciBycG1zZ19ncGlvX2NoYW5uZWxfY2xpZW50ID0gew0KPiA+ICsgICAgIC5kcnYubmFt
ZSAgICAgICA9IEtCVUlMRF9NT0ROQU1FLA0KPiA+ICsgICAgIC5kcnYub2ZfbWF0Y2hfdGFibGUg
PSBycG1zZ19ncGlvX2R0X2lkcywNCj4gPiArICAgICAuaWRfdGFibGUgICAgICAgPSBycG1zZ19n
cGlvX2NoYW5uZWxfaWRfdGFibGUsDQo+ID4gKyAgICAgLnByb2JlICAgICAgICAgID0gcnBtc2df
Z3Bpb19jaGFubmVsX3Byb2JlLA0KPiA+ICsgICAgIC5jYWxsYmFjayAgICAgICA9IHJwbXNnX2dw
aW9fY2hhbm5lbF9jYWxsYmFjaywNCj4gPiArICAgICAucmVtb3ZlICAgICAgICAgPSBycG1zZ19n
cGlvX2NoYW5uZWxfcmVtb3ZlLA0KPiA+ICt9Ow0KPiA+ICttb2R1bGVfcnBtc2dfZHJpdmVyKHJw
bXNnX2dwaW9fY2hhbm5lbF9jbGllbnQpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiU2hl
bndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4iKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJnZW5lcmljIHJwbXNnIGdwaW8gZHJpdmVyIik7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJH
UEwiKTsNCg0K

