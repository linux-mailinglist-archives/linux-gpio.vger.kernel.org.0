Return-Path: <linux-gpio+bounces-32149-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COyjJk4BnmkfTAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32149-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:51:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C418C38D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12515305DEC7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 19:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FA7330641;
	Tue, 24 Feb 2026 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BKdBUneO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CB32C94B;
	Tue, 24 Feb 2026 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962672; cv=fail; b=n28SN29IDz9DRzxG31RkrPtcfiX9hp2461YUyFlXiZ5R1V34nqWFvxb6n1+mYm17mXocw2jhuAmqLZsHvlweCxmvrQrVJ/JHnscK3Defe04fPLCgwLxniYtwDhRbS3FTaoIGldffeaQ83V0x/GH8eFHWmR1ylhvmCUM6J9meTIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962672; c=relaxed/simple;
	bh=PkVTZ0eEeYK2YbjbNb7n/uk9iSvNtKHBfDRmM11tP38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rDqyBex4O3wV/yRdg+bw34zA+ET4f1WRvQBMYk8+2RNj1mGBVCJw6w6LYlxar+m46bYIwUxY8p1cWaVQrR8xmBbrRGXlWGBKRCW7ZjVdzfan9VgtxxHJkN9efkiZzVjrDc0ur3HyOdWJFRQ5ZEzcecNQgIziDBHrDhMhuLyxv0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BKdBUneO; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl9ZA4D/biQzSMnbBRXRTDIFuK/v0+fkg4wChuKdlLqOd5AV10adayySBY4wCGt2L6NelVdRaPptpSGbGzBCw43KoDXs+HZgLPsFw1ADJ0jeq2HUg62t+JxaWi+vum/3WT/9Hh5On+gl7eLZn6dqDX/6nC+0eeG1KaC682ClQYmf2EcK2uzavQCjDu8LLT80/uGzqIBhQfLvJJn3knTZLjaQVUSil20LdipqetjOWK/wZoHrRSjGt973cibe/G+XrGaCXySV/0ZCkjMV0zIUuVPWJkczsu24CMXcRX4kOfoeKNukfAkqI0a3/yBcqLaSDaFZRZPowqKqyNt9EKyiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkVTZ0eEeYK2YbjbNb7n/uk9iSvNtKHBfDRmM11tP38=;
 b=QJ5Ptl2P2bQaaDpKvXLmTWuznoB8NqfPR0qRjStmifaiyVYTfxsQ5+c5QvLeXwvTqA8ocyO1thF777/2QdWwv8TjSrPWMncpxMeua/QbVdgUZrg3/PDhQadyovKEU16K/crun/fMqERdgID8djIZQcLnciPjyWSOojLjkqIjZlrTS/elnrbDzCJsD9RAxYZuRLUd4Y7kQD13Z0rIvfszACb4/Kmuddc3+kmoxwRMPcbAzmK5XRZtBXIJOGo3ehc34s9Z5GwI3bvPn+AfxaAWWxwT9V54Sn54oZCA8vTf1VbkNSHGMp4saMPk1q+sElEI/Ldv/4iL+GmmXKV+UXVREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkVTZ0eEeYK2YbjbNb7n/uk9iSvNtKHBfDRmM11tP38=;
 b=BKdBUneOMP50Q6K2WjvIw+fJpVjGSE160Fm59ysBu3a9l4/Z/rvcJBtK1YWQRiB3CxMZdyW8ZS4VpYSgApKRFNWxGqvyrlPTEebTVvgkW4lSX878+XhUuY9aKtbxVElPJrlPlHBJF9rX/5CvykMTNEmPbYIhJV8UotZhSgW+j0FDMvpSMzdK4BLOYCy4jA8JWZM4fHnQzEisWkf3Lra9Rh6lgOg4n46iYia1YAXsHHWWnOc7Vf75hI1nDLJh0idNZV5XbpMQHbt964M7r9Q53CCqoZ6OxIqMNIqaqfND5G/Sf2MbxkHwUH6vBa+FsYgJXbht9XX461nAojsRqRD4SQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8340.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:51:07 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:51:07 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpcbqyuKnLu7nVEOA8R+860c+Kg==
Date: Tue, 24 Feb 2026 19:51:07 +0000
Message-ID:
 <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
In-Reply-To: <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8340:EE_
x-ms-office365-filtering-correlation-id: 8952923d-bded-465b-46ad-08de73de0d2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2I4T3QvaThHQXpOdjJUSHVXdTIvUHBiQUFSVFVMWFo0bjliYzhFYUJubElP?=
 =?utf-8?B?Zy9YN2JrckVlbDJKN0NlVjNCY2Q5Y2IwbWVMUnhPMmlMdmE0ZXpIMUsxTHVL?=
 =?utf-8?B?b2toSkVUQlBuWkpEOHpiVFdwL3kxZDBPVE9CeE1MczdUa2Fpay9PS0FvdWNS?=
 =?utf-8?B?UERaUjNKWGlyTTZoYUlwV1p4Z1BZb1RUT3RJZWQ0V0ZpL0RpdFc4c3BVZ2lQ?=
 =?utf-8?B?RUdhdk94Sm15WEhQeDBPVGxYbXEyUTdic2luT09iZ2FVeWcyWnp3dmNranVN?=
 =?utf-8?B?Ulo4OXNvV0ZoUGxWaTU3cXhFdkRVMmZZdDY3UTAyMm9PNG1STGJnL3JRK241?=
 =?utf-8?B?SWZGL3cwcFQ4ZmJIcFNKa0xObEFnZmVJMkRyZE1ySTNTeVVsaTJjRjI5Tzlq?=
 =?utf-8?B?dHBJOW8xdjdJZURqNENtaWxNbEI4elZPOGZJY2k1TmVmRTEweFFxTDZKaklZ?=
 =?utf-8?B?Z3NpUWxKekZjWllxaytnemdZa0JBUFN1TGZvSHZtRkJCMHVLbHNjMlBUdzZ6?=
 =?utf-8?B?UHZFOGpDL0JQcWJQVWtMUnFua09qdmV2bUZ6by9WMEg0N1pKSzRFeEhpK0VJ?=
 =?utf-8?B?OTgvb2FCZDVvM3BLWnB1RzVoN2hhTDkwOUh5dkJzdlJrVEVreUFRY0VQRGla?=
 =?utf-8?B?b1JWeUZBYTdoQS8yRFJEZ0ZOM25neCtFaUJDTkFrb3V0eVRJdStkckRqdjlp?=
 =?utf-8?B?b0hQQnl5d0tFUy8wYVVBRkphS0RzWGl3VEhMSktQb3UzcjRWUXVobGlkdHFj?=
 =?utf-8?B?S3BuUlpRTk10NUZRUno4UHJKdzZab1A3Y3FIOHBSa2lvbjVsMXN0MVFmRzY3?=
 =?utf-8?B?YWxvWGRqYXhsT1pxY0czSUxoYUovNmNiR01RS3VaNXdET0t6b1FmUkZKV3p3?=
 =?utf-8?B?RkZXQXZpVlovekhWeUZVb1JEZHM3TmFobFZjMCtFVllwZ0V4M2tySXVjNHdE?=
 =?utf-8?B?b05MdTVKbGtTOHNvc2RHZmk1WkRwOE1WdERrN1lRQm4yMTN3TVR4ckZZcnZ5?=
 =?utf-8?B?Y202Z3BvcjFsaWF3NkJaWlJnQ0lnWWwvOXFBeTNGN29pQVV3d216VllrcTdY?=
 =?utf-8?B?emsrcEowY0pPWFNISmlRd0NRdkpxQ3J0ZDNRelM5Z2lCcEx5cXVJSmpNMm9X?=
 =?utf-8?B?T3NUTEEzQWpSMHhRUEx0TlZ3ZVovbnpxeW00OXlCeUFyQWFBOW5mbHVQOWM2?=
 =?utf-8?B?VnRHTVVaUzU2SmZBcHlwVHB3Mk9tSzFrQy9UU2Zab1hzbzhSRE42cmVsamVH?=
 =?utf-8?B?WGhrWit6M1RRck5ZUSs1akZDa0hZVXVaVjlGazk3ZmtzOVhFaG5JQzE4bUFO?=
 =?utf-8?B?eElPSWZadGRYcENlZWRZUk1CNVlOWndzMjFyNnVtaWsyMC9YRlg3MU1QTWF2?=
 =?utf-8?B?ZEJuK0VIRW9UL0h4VnlTNnpLUW44WWhERmljSDEzd2w5QnNzUzNIVHFOL0xF?=
 =?utf-8?B?KzdoYXBab3lEQnlIQW10VXdwQmQvenJScjFEbVJuczhtREFFczJ1amlNN2ZQ?=
 =?utf-8?B?VlVxcVFPdzlKNlptcGxPTTQ5Y0tMd05tS2QyS0MyYXVpWS9Tb0g2bFFpQUEx?=
 =?utf-8?B?aE4yVEp2aUUxOHVEdUxBaDdTTWNkRS9WQTJMblkwWUc4ZHFMZ2hYTExVMm5z?=
 =?utf-8?B?a3QzTXB4QmFYZlpEcDA4bzg2UWE0UjlxUjNYUXc1NXkxbkg4T3NZSlBDa2ly?=
 =?utf-8?B?Nk9qK1dGbHN0WnI3am9KZ1dlQWxKZTN4MHVieHJXT2w4anhhQnIzT3cvaW5U?=
 =?utf-8?B?eGpYNS9pcUpqQUxVdFVlK05oQTFHN1NBTVk2UStWNGpRVk1vVmw2NzlJaU5Q?=
 =?utf-8?B?NDh3cEprdG5kRjk5K1hscHNmc0dyb1dreTc1UDVvN3ZEUkpYR01EWlR2RlA2?=
 =?utf-8?B?bkFDZUd6d2ZyeGQwbGVhNFhRQ1dYOWFLbmtSaGVvQ21KOEVGOFQvOTI0TWlk?=
 =?utf-8?B?SDFvenlseXd0ZmE4RVd6ZERiaytlb0h5SDhZUElQbGRlbUtWK0Q0Q3paZi9F?=
 =?utf-8?B?SktPS2ExeHo4TUM2VnpXL3RjS2RzZVpHM3F2cFpxSW00QjFkK3dpbmJ5c1Az?=
 =?utf-8?B?SUxGcUpKVXRIenRCTzNmeHZGMWtMcWYxSmoyQ0ltT1JOSitkdHN5ZDFHT0N2?=
 =?utf-8?B?eHZ2U1N0RHhKajI0cU9CQXEvRkdKV1hYYkYxQmhtTmFrZjQ1ZzNaL0dsZ2VG?=
 =?utf-8?Q?/8rwEpQeOsTAhNMOomBAef4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTd6OXBYVWFMZkR2aVRLN0NBRTFYQjJJdDAxaVNBeTZQTld3Ty9zcjVqMHRN?=
 =?utf-8?B?K1pLV2JVbTVzZGVyMGVibFI4TGcrb3JveGw2ZGhmdm9zWHRSQWpjSkpINEFp?=
 =?utf-8?B?dFo3ZFpXdmNkcXBLVjI4Y0RtUStudDJTbk9rcWNWT2htWFZVdDV4d3R2MXRI?=
 =?utf-8?B?ODA2Y2tiRlBSSnJDV0Z0dEtqelNERm5oMnh0KzNDS05OMmd4LytXb0VSaEc2?=
 =?utf-8?B?MUI1UXl3UUlBR28xM1hnSFFBYW9QYjhQaE9xcjlSdm5TMEx3em16MzVGOHVL?=
 =?utf-8?B?QUtRMi9hbkIzejJ2c0hhK1M5TFBJb2hNcVJvbjJUc1JqMzFLTmhSSzBSRmVs?=
 =?utf-8?B?NjNXTXRDN1N2ZmhTL0gxUzNzeHB2eGZWbkJGc3EzNmRyUElRVmo3YXQxVTVK?=
 =?utf-8?B?WUZHY0dEL3NIL0VNN05Tb2N0V0xRanM1OUp6Z0JKeTJ1azZ6M09oSW10MXg5?=
 =?utf-8?B?OGowcW5EYlRBbEZaYUVMYTlyd0pITVI3ZVRiVjhqK3NEbDlOdHlMTkNUb0Fk?=
 =?utf-8?B?ZFVHdklsYXg1NFF6eWZEVStOb0xpY3Rvd1RXcEx1TnZ4TkFkWnpPcGFFbnpa?=
 =?utf-8?B?NWR0NFRnV0I1Ti9wN0p2YWlKcTdXcGQ0eHc2cWZGcWl0amlMdnpNdElIcHhu?=
 =?utf-8?B?TzVma1M2UWV3My93N0VjYW42UFB5cDJWSkE5Z1JDejFXUzRYanV3RE5FcERD?=
 =?utf-8?B?QmZSMzdLUTJTbmVZUXZIOXBheXlRU0M0eHM2bTg0dWRYTW1YZkxuMDFlbFpm?=
 =?utf-8?B?YUQ2SE9JVWozZE5Zb2REaGo4cUlBUW12ZDliVnhVV25QNWdDWjFhMHVWcHpZ?=
 =?utf-8?B?cUdVMzN1cWdsMzNuS1VvNU9hRGhzMlJkZmJZbDcrOE9SWU9IOWhzS3UzMVpv?=
 =?utf-8?B?YnpXZDdWMHRXN2hEYmNrZGl5djZLN3o3c3NvSmc2QVRvenQ5Vkoxak0zM3Ex?=
 =?utf-8?B?R3N1NkF1WGJ0Q0E3VlhCVnI5eHV6TjloaTZRN0diMjVoamRTOEJlWmdJeU9s?=
 =?utf-8?B?Q3BEdUt1MnpXQkRxazZmclZpcjdxY2IyZENTa2UweTJ2MWd3c2NmdFNWZzk5?=
 =?utf-8?B?WUEwajI1NlM1QndmSmNCQmFWMWpNWWI4eVA4ZXlqYW1kOE5yQ1pOMytEbGZF?=
 =?utf-8?B?a2EvZlpsQXh5SURJSUw5K3A4Sk4xOG9PNkN3WUF6RHRVVVE3ME5aYTc0K2NX?=
 =?utf-8?B?Yk10R2s1SzdESHlsMHN2UllLUmVRNzRTWFZGY3d4R0VlbWNUSnJKbDJmYWxC?=
 =?utf-8?B?ZHY0OEtQQjVvN09QUFFxejh4ZXFtZlVoUEFoeGtyeUhLdncxczRFV3g0VzVO?=
 =?utf-8?B?R2hhcDVZc3RQem1TN3lkK05OdWJHNUFXNjlmSCtkYnVsZEdOV2M5MzlUV09P?=
 =?utf-8?B?VzE2WEtLTnFCZUdsT0tUd3k2Uzd4K3AvV2RNWnlrcnJabml2VjY0M3lQU3RI?=
 =?utf-8?B?eTNobzZVQ1dhZnNrUHdiMzVBS2pqZjZFc2U1WjllYWR2Nlc4dEwrZjZMc2pa?=
 =?utf-8?B?N2YxQnFteFBBb1p5QmNtWTRTVUVycXJ2MjMzQVROUDFXR2tuaXZ0Z0QrZHFB?=
 =?utf-8?B?VmFZMjMrZlVvR2ZOYjZnN0orZG9FZkQzVlN6U3VoVjArcTh5RVJhM3draS93?=
 =?utf-8?B?anVzeUNITTRjMzREMFZaWnpYa3lFaSt2djBxS1UxemFyTk1PanZnZXM1T0hw?=
 =?utf-8?B?Z3paRE1ZVDFjalRoK2dndUprTHFHODZ5b2VFaGE0TXF2QXdvSkk2K2dxMnpp?=
 =?utf-8?B?dE5wUWl2d2o0QTNveDM0blVtMmtSQlpET0xFVnJXREgzTXZNN01pWU1UczBW?=
 =?utf-8?B?WnFvYTJTUU1QUmE4R2pRUWplOUJIOXZ4VWIwWHNId3R1QTRoanZGVE5xQ255?=
 =?utf-8?B?RFhsODF1WUhSQlVZR3BnZlZ1MktYNmlZM2VXK21jM211dFo1YTZ5V0FQMmpF?=
 =?utf-8?B?NmtMYTFlQlRRbm5IN0x4RnQ3TzhmTkVKdEZDWEh0L1hQblF0K2xJWE4wckpl?=
 =?utf-8?B?MkhqNTE2bHY1SXNVc0p6Um5OWHY4M005a3daS212RlJTSXBKUjk5d0hnUzNM?=
 =?utf-8?B?aElXK3RHRWNVNjhQQzZUd21DM1JqakFkL0Iyd21OKy9aamhGWFc4My80SSt5?=
 =?utf-8?B?QlRVVUlQUWF1Tld5K1p6c1g0Z1o2dUd4MWVzZEVuWWNHbjhaSTBzSWVDa0tF?=
 =?utf-8?B?YkxEZ296TFFXYlgyQ01SUzl2aXhDREhBbkk5aitkTWM5QUFtRkI5ejJIUVli?=
 =?utf-8?B?L2RFVFdkSVZLRE04Y3hVN01RKysrTHNEWnl0Wm1oSTBUYnJMWXBleWZpSXJj?=
 =?utf-8?B?eUpob0VEOElWYzhzWUxEeUZhWTJGdHAyNStHL3pMZ01LckUweWdPUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8952923d-bded-465b-46ad-08de73de0d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 19:51:07.4042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NvO25wu5AV+eCwXrbiUkQZB/2ebK4/5sVUlrq7225nwRCwk9zQ2LS6Z90hRlzOetLW5JNmBTb5qG9+D1ZGA80Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32149-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.965];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D0C418C38D
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiAxMjoxOCBQ
TQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gQ2M6IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlq
DQo+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVs
Lm9yZz47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29u
DQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2ly
aWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNodWFoIEtoYW4NCj4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGRv
Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6DQo+
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IA0K
PiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdo
ZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3Vi
dCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1
dHRvbg0KPiANCj4gDQo+ID4gSSBkb27igJl0IHRoaW5rIHdlIGNhbiByZW1vdmUgcG9ydF9pZHgg
aWYgdGhlIHByb3RvY29sIGlzIGV4cGVjdGVkIHRvDQo+ID4gc3VwcG9ydCBtdWx0aXBsZSBpbnN0
YW5jZXMuIElmIHlvdSBvbmx5IGV2ZXIgc3VwcG9ydCBhIHNpbmdsZQ0KPiA+IGluc3RhbmNlLCB0
aGVuIHN1cmUsIGl0IGJlY29tZXMgcmVkdW5kYW504oCUYnV0IGltcG9zaW5nIGEgc2luZ2xl4oCR
aW5zdGFuY2UNCj4gbGltaXRhdGlvbiBvbiBhIGdlbmVyaWMgcHJvdG9jb2wgZG9lc27igJl0IHNl
ZW0gYXBwcm9wcmlhdGUuDQo+IA0KPiBUaGUgRFQgYmluZGluZyBleGFtcGxlIGlzOg0KPiANCj4g
KyAgICAgIHJwbXNnIHsNCj4gKyAgICAgICAgcnBtc2ctaW8tY2hhbm5lbCB7DQo+ICsgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICsgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQo+ICsNCj4gKyAgICAgICAgICBncGlvQDAgew0KPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJycG1zZy1ncGlvIjsNCj4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gKyAgICAgICAgICAg
IGdwaW8tY29udHJvbGxlcjsNCj4gKyAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPiAr
ICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4gKyAgICAgICAgICAgIGludGVy
cnVwdC1jb250cm9sbGVyOw0KPiArICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgICBncGlv
QDEgew0KPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJycG1zZy1ncGlvIjsNCj4gKyAgICAg
ICAgICAgIHJlZyA9IDwxPjsNCj4gKyAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCj4gKyAg
ICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPiArICAgICAgICAgICAgI2ludGVycnVwdC1j
ZWxscyA9IDwyPjsNCj4gKyAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPiArICAg
ICAgICAgIH07DQo+ICsgICAgICAgIH07DQo+ICsgICAgICB9Ow0KPiANCj4gRG9lc24ndCB0aGlz
IGluc3RhbnRpYXRlcyB0aGUgZHJpdmVyIHR3aWNlLCBvbmNlIG9uIGNoYW5uZWwgMCBhbmQgb25j
ZSBvbiBjaGFubmVsDQo+IDE/DQo+IA0KPiBIb3cgZG9lcyBwb3J0X2lkeCBmaXQgaW50byB0aGlz
Pw0KDQpJIHRoaW5rIHlvdSB3ZXJlIGFzc3VtaW5nIHRoZXJlIGlzIG9ubHkgb25lIHJlbW90ZXBy
b2MgaW4gdGhlIHN5c3RlbT8NCkluIHByYWN0aWNlLCB0aGUgc2V0dXAgY2FuIGxvb2sgbW9yZSBs
aWtlIHRoaXM6DQoNCisgcmVtb3RlX2NtMzN7DQorICAgICBycG1zZyB7DQorICAgICAgICBycG1z
Zy1pby1jaGFubmVsIHsNCisgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAg
ICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAgICBncGlvQDAgew0KKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicnBtc2ctZ3BpbyI7DQorICAgICAgICAgICAgcmVnID0gPDA+Ow0K
KyAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCisgICAgICAgICAgICAjZ3Bpby1jZWxscyA9
IDwyPjsNCisgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0KKyAgICAgICAgICAg
IGludGVycnVwdC1jb250cm9sbGVyOw0KKyAgICAgICAgICB9Ow0KKyAgICAgICAgICBncGlvQDEg
ew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicnBtc2ctZ3BpbyI7DQorICAgICAgICAgICAg
cmVnID0gPDE+Ow0KKyAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCisgICAgICAgICAgICAj
Z3Bpby1jZWxscyA9IDwyPjsNCisgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0K
KyAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KKyAgICAgICAgICB9Ow0KKyAgLi4u
DQorICAgICAgICB9Ow0KKyAgICAgIH07DQorfTsNCisNCisgcmVtb3RlX2RzcCB7DQorICAgICBy
cG1zZyB7DQorICAgICAgICBycG1zZy1pby1jaGFubmVsIHsNCisgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQorICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAg
ICBncGlvQDAgew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicnBtc2ctZ3BpbyI7DQorICAg
ICAgICAgICAgcmVnID0gPDA+Ow0KKyAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCisgICAg
ICAgICAgICAjZ3Bpby1jZWxscyA9IDwyPjsNCisgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxz
ID0gPDI+Ow0KKyAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KKyAgICAgICAgICB9
Ow0KKyAgLi4uDQorICAgICAgICB9Ow0KKyAgICAgIH07DQorfTsNCg0KPiANCj4gPiBSZWdhcmRp
bmcgdHlwZSwgaXTigJlzIG5lZWRlZCwgZXNwZWNpYWxseSBmb3IgdGhlIGluIHBhY2tldHMuIFRo
ZXJlIGFyZQ0KPiA+IHR3byBkaXN0aW5jdCBraW5kcyBvZiBpbmNvbWluZw0KPiA+IHBhY2tldHM6
IG5vdGlmaWNhdGlvbuKAkWluIGFuZCByZXBseeKAkWluLiBCZWNhdXNlIG9mIHRoYXQgZGlmZmVy
ZW5jZXMsDQo+ID4gQ29tYmluaW5nIGNtZCBhbmQgdHlwZSB3b3VsZCBibHVyIHRoYXQgZGlzdGlu
Y3Rpb24gYW5kIGNvbXBsaWNhdGUgdGhlDQo+IGltcGxlbWVudGF0aW9uLg0KPiANCj4gPiA+ICNk
ZWZpbmUgR1BJT19SUE1TR19DTURfRElSX0lOUFVUICAgICAgICAxDQo+ID4gPiAjZGVmaW5lIEdQ
SU9fUlBNU0dfQ01EX0RJUl9PVVRQVVQgICAgICAgMg0KPiA+ID4gI2RlZmluZSBHUElPX1JQTVNH
X0NNRF9HRVRfRElSICAgICAgICAgIDMNCj4gPiA+ICNkZWZpbmUgR1BJT19SUE1TR19DTURfR0VU
ICAgICAgICAgICAgICA0DQo+ID4gPiAjZGVmaW5lIEdQSU9fUlBNU0dfQ01EX1NFVCAgICAgICAg
ICAgICAgNQ0KPiANCj4gVGhlc2UgYXJlIGFsbCBzaW1wbGUgUlBDcy4gWW91IG1ha2UgYSByZXF1
ZXN0LCB5b3VyIGdldCBhIHJlcGx5LCB1c2luZyB0aGUgc2FtZQ0KPiBDTUQuIEkgZG9uJ3Qgc2Vl
IGhvdyB5b3UgY2FuIG1ha2UgYW55IG1peHVwIGhlcmUuDQo+IA0KDQpNZXNzYWdlIHR5cGUgYW5k
IGNtZCBhcmUgbm90IHRoZSBzYW1lIHRoaW5nLg0KS2VlcGluZyB0aGVtIHNlcGFyYXRlIGFsbG93
cyB0aGUgc2FtZSBwYWNrZXQgZm9ybWF0IHRvIGJlIHVzZWQgZm9yIGJvdGggSU4gYW5kIE9VVCAN
Cm1lc3NhZ2VzLiBUaGUgdHlwZSBmaWVsZCBpZGVudGlmaWVzIHdoZXRoZXIgYSBwYWNrZXQgaXMg
YSByZXF1ZXN0LCBhIHJlcGx5LCBvciBhIG5vdGlmaWNhdGlvbiwgDQp3aGlsZSBjbWQgaWRlbnRp
ZmllcyB0aGUgYWN0dWFsIG9wZXJhdGlvbi4gTm8gYmVuZWZpdHMgdG8gY29tYmluZSB0aGVtLg0K
DQo+ID4gPiBUaGVzZSBtYXAgb250byB0aGUgZ3Bpb19jaGlwIG9wcy4gQW5kIGkgbGVhdmUgc3Bh
Y2UgZm9yIHRoZQ0KPiA+ID4gX211bHRpcGxlIG9wcyBpZiB0aGV5IGFyZSBuZWVkZWQgaW4gdGhl
IGZ1dHVyZS4NCj4gPiA+DQo+ID4gPiAjZGVmaW5lIEdQSU9fUFJNU0dfQ01EX0lOVFJfQ09ORklH
ICAgICAgMzINCj4gPiA+ICNkZWZpbmUgR1BJT19QUk1TR19DTURfSU5UUl9FVkVOVCAgICAgICAz
Mw0KPiANCj4gR1BJT19QUk1TR19DTURfSU5UUl9DT05GSUcgaXMgYWdhaW4ganVzdCBhIHBsYWlu
IFJQQywgcmVxdWVzdCBvZiAicGxlYXNlDQo+IGNvbmZpZ3VyZSB0aGUgaW50ZXJydXB0IGhhbmRs
aW5nIGxpa2UgdGhpcyIsIHJlcGxheSBvZiAieWVzLCBkb25lIi4NCj4gDQo+IEdQSU9fUFJNU0df
Q01EX0lOVFJfRVZFTlQgaXMgbW9yZSBpbnRlcmVzdGluZy4gVGhlIG90aGVyIGVuZCBjYW4NCj4g
c3BvbnRhbmVvdXNseSBzZW5kIHRoaXMsIGluZGljYXRpbmcgYW4gaW50ZXJydXB0LiBPbmNlIExp
bnV4IGhhcyBoYW5kbGVkIHRoZQ0KPiBpbnRlcnJ1cHQsIGVzcGVjaWFsbHkgbGV2ZWwgaW50ZXJy
dXB0cywgaXQgbmVlZHMgdG8gYmUgYWNrbm93bGVkZ2VkLiBTbyBpdCBzZW5kcw0KPiBiYWNrIGFu
IEdQSU9fUFJNU0dfQ01EX0lOVFJfRVZFTlQuIEl0IGNvdWxkIGJlIGNvbnNpZGVyZWQgYW4gUlBD
IGluIHRoZQ0KPiBvcHBvc2l0ZSBkaXJlY3Rpb24sIGJ1dCBpIHRoaW5rIHRoYXQgd291bGQgYmUg
d3JvbmcuIEkgZXhwZWN0IHRoZXJlIGFyZSBtdWx0aXBsZQ0KPiBvdmVybGFwcGluZyBHUElPX1BS
TVNHX0NNRF9JTlRSX0VWRU5UIGZseWluZyBhcm91bmQsIHNvIHlvdSBjYW5ub3QNCj4gZW5mb3Jj
ZSBhIHN0cmljdCBSUEMgc3R5bGUgY29tbXVuaWNhdGlvbi4NCj4gDQoNCkluIHY4IGdwaW8tcnBt
c2cucnN0LCB3ZSBhbHJlYWR5IGFkZGVkIHRoZSBmb2xsb3dpbmcgY21kOg0KK0dQSU9fUlBNU0df
Tk9USUZZX1JFUExZIChDbWQ9NCkNCit+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0K
K1RoZSByZXBseSBtZXNzYWdlIGZvciB0aGUgbm90aWZpY2F0aW9uIGlzIG9wdGlvbmFsLiBUaGUg
cmVtb3RlIGZpcm13YXJlIGNhbg0KK2ltcGxlbWVudCBpdCB0byBzaW11bGF0ZSB0aGUgaW50ZXJy
dXB0IGFja25vd2xlZGdtZW50IGJlaGF2aW9yLg0KKw0KKyoqUmVxdWVzdDoqKg0KKw0KKy4uIGNv
ZGUtYmxvY2s6OiBub25lDQorDQorICAgKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tKy0t
LS0tLS0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0rDQorICAgfDB4MDAgfDB4MDEgfDB4MDIg
fDB4MDMgfDB4MDQgfDB4MDUuLjB4MDkgfDB4MEEgfDB4MEIgfDB4MEMgfDB4MER8DQorICAgfCA1
ICAgfCAxICAgfCAwICAgfCAwICAgfCA0ICAgfCAgMCAgICAgICAgfGxpbmUgfHBvcnQgfGxldmVs
fCAwICB8DQorICAgKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tKy0tLS0tLS0tLS0tKy0t
LS0tKy0tLS0tKy0tLS0tKy0tLS0rDQorDQorLSAqKmxpbmUqKjogVGhlIEdQSU8gbGluZShwaW4p
IGluZGV4IG9mIHRoZSBwb3J0Lg0KKy0gKipwb3J0Kio6IFRoZSBHUElPIHBvcnQoYmFuaykgaW5k
ZXguDQorDQoNCkF0IHRoaXMgcG9pbnQsIEkgZG9u4oCZdCBzZWUgYSBuZWVkIHRvIGludHJvZHVj
ZSB0aGUgdHdvIGNvbW1hbmRzIHlvdSBwcm9wb3NlZC4gSWYgdGhleSANCmJlY29tZSB1c2VmdWwg
bGF0ZXIsIHdlIGNhbiBhZGQgdGhlbSB0aGVuLg0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gV2hh
dCBpcyBibHVycnkgb3IgY29tcGxpY2F0ZWQgaGVyZT8NCj4gDQo+ICAgICAgICBBbmRyZXcNCg==

