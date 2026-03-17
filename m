Return-Path: <linux-gpio+bounces-33662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNqIE/V/uWmxHAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 17:23:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0A2ADE1A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 17:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14D30304DD01
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37A12FFDCC;
	Tue, 17 Mar 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EElVw1yY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B852DC359;
	Tue, 17 Mar 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764223; cv=fail; b=pOVXZAhfDXa88u9hZKoYy+vFojQAuM/kdprrbM6PqTgYP77xTIfwHFy11L54GqCnjs1iKbY4gVb1mtQZwaeMbDKh7LalPODDcfzCTYoCJSPd9jlZFkxgNOkxzI8Wih5Uaw4Qm+T3WXeHFJcC14FxscVhr0M81JBcQh3X4wL6ylc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764223; c=relaxed/simple;
	bh=qh455aihwojANRIvpf8L7XYDiY3BZSM/lbmhaOkNW7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X2Szrhx1KH+gX93oAt5+ONADd10wV4sz25qYB2oNBLpr4wHYEDRfNx/QGgsDgArCnJJDuDcsRRej29FNzrhTKmotnPT6ziY0GcaNoAekPDQ419dbmYby8j+FqwCMr87FeafTisreN7XUoVuLROO0k6NKNMCRv/ip2SCJAjRL1Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EElVw1yY; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5t2S65T3XuNzbV4HPkh+VTNxSP38DaB127tz2raNSVKufLhP5qU6Ea39miB5LU4UySz417GBZft/t8xYpWpjhFedS8OJNmEb9Wh9HoGmmx32LZpoLfzifOJAWFT6/apD8TLxH2mbgBu6wOHnc14vDha+7fo1uC5WESTnzU+bzsV5IosU7MmzPsQE0RbIhvMIsK02/aXCaY3Jf2xXmhpI1CMKTK3wXHGGlGsmTIKhySVzcSX/90KFbYAIOwOc2ZHhbI1iWquPiTOv5XaNOO9ZNXzl0oM76eWLBGACB1rpLD1SwwbIbx2uWc0fM+I2LOCgPF7oPlERj2RaJfvTwbovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh455aihwojANRIvpf8L7XYDiY3BZSM/lbmhaOkNW7Y=;
 b=H5/iOg00mXsnlLlPLwTQVauUc70m8tpI73G1lwxJ5taNy101le5jB00C56KmuXnlyOznpEe6dCOlILVnkH+CFOGMuozr+SpKGe51AnSejKPbtcvBedf7j0l+PrrPnP8zec9qvFPc+wbAgiPyXzZmZBY6fO/kvyU59VzJtuBHyhBO3BWt4h0g7LmhwV/HlFX1kiPQjMWpGq9SyNnzMMaDT6ZvmWxxc+KC39uIWEo5Efl70n7fD4Je58mo/FkoJZ5VwfdccK73F6O3riZviZy02OBmBGKHqBkNgIshS0jN6aR0S/ZbIU8OWE9F2/NKNS2q5PWoq5xMwzfiUGxAeRSwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh455aihwojANRIvpf8L7XYDiY3BZSM/lbmhaOkNW7Y=;
 b=EElVw1yYkeAMEf6HOIPfG4EOkan5kxc4YwHzzyNh6w7L/9KFtWICWFAGkaNWru+QOgAcf+g5/8z4G/KIQhRzBotcN8XtTpZXaGbiTQzNcyNcZ+zPM7PvEIgHBu2JPjcAxy8ZZPKrFB73gEBEoZjsqxKhbcunjT+yBk9+QYSdI9tPlYkRUrAYZY84qAo/hvTeSe03EibCaYGJepPLUSu4SvU10A1UYYoPGpeRzUH5fJ3HuDWhSLzXjKSJ3+wQNmRY9hnVsPqVzf0Hc3rG2ZcKmrVqFR492JUN7KAM2ba6GoZaG7wH3aZOZ4PspqpSt7xNwHf2S3LblcgFBo/n7kzIDg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 16:16:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 16:16:54 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHctil4GHl+Jrxl9E+3SBsyPSC17A==
Date: Tue, 17 Mar 2026 16:16:54 +0000
Message-ID:
 <PAXPR04MB918544CBA418DA709BBA0E808941A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DB9PR04MB9790:EE_
x-ms-office365-filtering-correlation-id: 4d44fc0f-6a16-4511-87be-08de84409b20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 AAP+xolOa/AUKzIOa2637iIOsfy/CmK6Mp4C3qFQRJznO1S/lAVb+SvXOTkhY2yS7dSaT/Iz1MNqS/795skoV8IBnW8ZMf0ZvMDz+dVoBENhXrQZd6U7ivj8rk3l4pIuu2nvDLq2ZUVcnF8HSNooISZe8h9GlNunKrgXqDhmjNPWv0oPR8d5n7MbwtP4Za3RG90zpcTI5X+ITEyMKc9SRWqCcg/phSM7EBxzvCY2qEvyMAMvKNUfy/FFCH78ytvOvrpZ6O1wEwhDchtb4kpmFdo5kd8i4GUSoI5OalT8tifv6hDcuh2I6hRjxNUHPOvO8syEy1NZyKTou5p1thGKJB2daQ0d4Tdqenbf5Q4S1ld0W1JU27aUASt/ndhj252a2awVc6LIp1H5PGUnIUqI3bKqmxTIzW4xs8GOFYhgZsnJs2aXelbxD+ZGP6i8EvEYWllP+cSOmqxqqkxD1Ub4fTzRLEP7x9pSQFhtQeOAeH2q+6CFopQy9iwCdjJWJK9DZSG8ZpTRFhcl7A7gP55/gvkjUgH0oA3sUkV8L5EuHZvTg2lnTPJPly3Dhe4dpYtNBhvSbDAjz8H6bWU7ymv4hA8Zez3fHvB3BHIoGy7pr+fTGgPXjSecNGIAEvqFWGJ0jrig+IU3A7347yPRpKg8BARgis7DzYfdznAdolYa8cfInHNAJlnICC7U50Orm74IaZSp4wrkMs8I3SNA2syI5UbME8wvF2qqXdj3+/TJ+2WuKMnv0RYaLBl1+7S2pUle
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUZGKy9FaW9WU3BndE1hRDVwY3hOelZzeXhvS3lDV00wc1dramhsUVd3WWtn?=
 =?utf-8?B?YUkvRGhvc1J2UHcxOGo1NDNtQkI1L2NLREtXZDdqYXh1ZmYwZ1Fjemdxb0sw?=
 =?utf-8?B?cndqZXdYUUk5N09IcXBERWpKSCs5S0c3anJYSncyTndMWFVEZENSeURvRzdv?=
 =?utf-8?B?VVNQeHROdURNNlBuZysyWm10Y1ptNVlESm5GOWg4YkFRcVkySis0RWNkekx1?=
 =?utf-8?B?d0FROC9QZEdjRE5uK3REbkhUQjNZclRZVHF6V0FUTUhPRVhhQWNSVDIyK3Iy?=
 =?utf-8?B?QmZCR1FvbUc4WmZGTnRkTDBXTFd3aUtSTndJYW12ZDNVaE5uVTVXd0tPVzYv?=
 =?utf-8?B?SUpabUFjSGpXbks5dXdUUnNFeS9lSElmQytBdGs4a3pZdGVqaStZVFBIQnE5?=
 =?utf-8?B?Ri95M20yR3Y1WTVKYzhNazRSSS8weFFOVDFiN1hwTXhtMTN5UVhEV3J1aE1K?=
 =?utf-8?B?eTc1RVFPRXZ1em1lQVk2Q3hjUS94M3l4emkrNkJLRlcycWxRZWExVUM5citz?=
 =?utf-8?B?azl4djk2LytEdytib1FoWnNYRzVZMXAwUmc3M1VtVHh0YkxVWkxOVkU3T1dE?=
 =?utf-8?B?a2M0S0g3cVhhT3AxcWFMb0t2cS9Rc3NvK2E5ZWlpd2hXbkRPeDNLblVhR1FD?=
 =?utf-8?B?dzEzdnJNRFY4OE8vcWtYeHFtTlBsQWRqSlppUHdwam5KbkkzVnl6YTZvMVhu?=
 =?utf-8?B?WWZPMjFLYmVWQ28xZE1sYXhMRlZqdTRKWHBqRVFNREhYMDNielNkOTBLK0cw?=
 =?utf-8?B?Wm1qaEw3QUhxVm1oL1Y1cWpsYUdmRFo2SkR0QjlHMTRKVFF1YTlDTzlMSnFp?=
 =?utf-8?B?Nzl5QjJ4L1hSbnJYK2hVb2laY1RDOGNWT2xMbHQ1UWgvM2dBTzJoOGZqRnNY?=
 =?utf-8?B?bWFVTGVac1BaaExqd1NkRDlycHZIZ29OOFRzQ2NjWmJNcm9MZkdlZVpoc0t5?=
 =?utf-8?B?Y1lqTVppVW1xaFVjdUtyS2dsaHJmZ1dWcUxONXVvSTZiUVJGaytjakwwMTlu?=
 =?utf-8?B?VkIwRnErNkhQYlRsZHVRdExoMWpwVlJMYld4RHlDWHlZdEN5ZXh5ZmhXVHE0?=
 =?utf-8?B?OXhKTkswa0Fid0lQSEtEZTBNOG1oc1lzaE94a04wdEtlbDhxVDBUenZ6MEcw?=
 =?utf-8?B?ZVNUOGdFcE4xck0zTW9ONFhaUldWRXAxYTNtWllhMnRTeDhzUlAxclNEdEMy?=
 =?utf-8?B?M0NhVGVkTXlzOGpDZkNES3BucjFsQzdMRnhwcnJOaWg3Ykd3bHloMGt5QUd6?=
 =?utf-8?B?VDRlcTN1N0VydVFRZGhKenlUOTZpNVlheUN6SDN1OUFmSnB1OHRiaS9xa1Ix?=
 =?utf-8?B?R3JpbEVNTTgxaXVQMmNSN3lyVFduYk9aVHFZK0N3Nm4xQ3ZWSnRRR3g0NmZs?=
 =?utf-8?B?T3BhQjNOZk1jV2laQkpyL0xLZEYrd2ppVkllb2lzUFErVjFxdXpFY1NvQlZC?=
 =?utf-8?B?SVhaWjQyem92VVZQL1V5SjllWTNjeisvVzJTdkpaN1QxREhkL0swNkVVdkhm?=
 =?utf-8?B?QVcxTytHb0pIRDl1a09nVXUxYnNoS0JaTnpRMVc4MUdNUm1TMXQ0MTJKMFlp?=
 =?utf-8?B?RTg1N29XRDlwNW1SK05JaWZGcHR5TGYxeThLdmg0V2FJcXNZc1ZFMEcycnp2?=
 =?utf-8?B?WXRnZ0VhdFJyc1c5dXNQc1NvajU0bHMwWjQyZVlyYWJ2VHh5bGJwZzZHQjIz?=
 =?utf-8?B?M3RiS2dOZTB4ZW1Sak9scUNwNWJpbjE4aFVJazdSeGdnMEt2LzErZm9uSThn?=
 =?utf-8?B?NEpVbVJNYXBtc2NycVVhcnExTGphZVJrR25uV1lKVkVYNEZ1MW1MeVlKSE5k?=
 =?utf-8?B?MnZCSDQyaGlJVGFnMXFxZnVPZGZsMklwdHE2UEZYNjFuaHllUW5EcWRpVE1z?=
 =?utf-8?B?c0hqYitQbHE1enZ1U0JWZkpMMnpCcy9Mb29ORzlVNExFRjl0UStCbFBqZTJt?=
 =?utf-8?B?cWlKL09JYUE5amdhOGlIZytncVcxZmI2RzJGTmU0T0xuUGpucWxyVHB0UGpw?=
 =?utf-8?B?K054dU4vTHVjZnUrejJ5OWQ0UVMxcytoUURXMHNmRUc1ZUlhUVhVT1dvTnRa?=
 =?utf-8?B?NXhQUCtOY2N0clR4MUVjN0duWWNSZW0xc0pzZU5qb2p2cnZBUXd5UnFTMnlK?=
 =?utf-8?B?eTRnNUxPM1BBYnl5QTlXTmgvN1lXbHRaWHhFRjJtTGcyTDRHWGdFSUI1b2VN?=
 =?utf-8?B?ZGVCcnJpbm5FTjBWS084ZmJ0L284T2pHZUZCY3VSckFJRXZ1ZUJBcWNFWEsw?=
 =?utf-8?B?cVJOQXJuQTI5UFEzMnA1a1FsSXdRdTFxU0RSSXRMZXBQenJWSzgveElMTVNa?=
 =?utf-8?Q?AQOQvA81h6dJ1Sb5P8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d44fc0f-6a16-4511-87be-08de84409b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 16:16:54.8437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRZdLkj/Pxi7RQEpjBRORKNyH52AJMB4BlpP9zpSoi7ebv7OpgmSji/dZwJa+XmQefQuae2yQX484nzyiT2ErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33662-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47B0A2ADE1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxNywgMjAyNiA5OjEyIEFNDQo+
IFRvOiBBcm5hdWQgUE9VTElRVUVOIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPg0KPiBD
YzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3Jn
PjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24NCj4g
PGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJA
bGluYXJvLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhmb3Vu
ZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9jQHZn
ZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9uaXgg
S2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVsLm9y
ZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4gR29s
YXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjEy
IDMvNV0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+ID4gPiAr
c3RydWN0IHJwbXNnX2dwaW9faW5mbyB7DQo+ID4gPiArICAgc3RydWN0IHJwbXNnX2RldmljZSAq
cnBkZXY7DQo+ID4gPiArICAgc3RydWN0IHJwbXNnX2dwaW9fcGFja2V0ICpyZXBseV9tc2c7DQo+
ID4gPiArICAgc3RydWN0IGNvbXBsZXRpb24gY21kX2NvbXBsZXRlOw0KPiA+ID4gKyAgIHN0cnVj
dCBtdXRleCBsb2NrOw0KPiA+ID4gKyAgIHZvaWQgKipwb3J0X3N0b3JlOw0KPiA+ID4gK307DQo+
ID4NCj4gPiBFeGNlcHQgaWYgSSBtaXNzdW5kZXJzdG9vZCBNYXRoaWV1IGFuZCBCam9ybidzIHJl
cXVlc3Q6DQo+ID4gInJldXNlIGFsbCB0aGUgZGVzaWduLXdvcmsgZG9uZSBpbiB0aGUgZ3Bpby12
aXJ0aW8iDQo+ID4gV2Ugc2hvdWxkIGZpbmQgc2ltaWxhciBzdHJ1Y3R1cmVzIGhlcmUgdG8gdGhv
c2UgZGVmaW5lZCBpbg0KPiA+IHZpcnRpb19ncGlvLmguDQo+ID4gc3RydWN0IHJwbXNnX2dwaW9f
Y29uZmlnIHsNCj4gPiAgICAgICBfX2xlMTYgbmdwaW87DQo+ID4gICAgICAgX191OCBwYWRkaW5n
WzJdOw0KPiA+ICAgICAgIF9fbGUzMiBncGlvX25hbWVzX3NpemU7DQo+ID4gfTsNCj4gPg0KPiA+
IC8qIFZpcnRpbyBHUElPIFJlcXVlc3QgLyBSZXNwb25zZSAqLw0KPiA+IHN0cnVjdCB2aXJ0aW9f
Z3Bpb19yZXF1ZXN0IHsNCj4gPiAgICAgICBfX2xlMTYgdHlwZTsNCj4gPiAgICAgICBfX2xlMTYg
Z3BpbzsNCj4gPiAgICAgICBfX2xlMzIgdmFsdWU7DQo+ID4gfTsNCj4gDQo+IFRoZSBjb3JlIG9m
IHRoZSBpc3N1ZSBpcyB0aGF0IFNoZW53ZWkgaXMgc3RvbmUgd2FsbGluZyBhbnkgY2hhbmdlIHdo
aWNoIG1ha2VzIGl0DQo+IGhhcmQgdG8ga2VlcCB0aGUgbGVnYWN5IGZpcm13YXJlLiBJdCBpcyBw
b3NzaWJsZSB0byB1c2UgdGhlc2Ugc3RydWN0dXJlcywgYnV0IGl0DQo+IG1ha2VzIHRoZSBleHRy
YSBjb2RlIFNoZW53ZWkgbmVlZHMgdG8gdHJhbnNsYXRlIHRoaXMgcHJvdG9jb2wgdG8gdGhlIGxl
Z2FjeQ0KPiBwcm90b2NvbCBtb3JlIGRpZmZpY3VsdC4gSXQgbWlnaHQgbmVlZCB0byBrZWVwIHN0
YXRlLCBldGMuDQo+IA0KDQpJ4oCZbSBmdWxseSBvcGVuIHRvIHJlYXNvbmFibGUgY2hhbmdlcywg
YnV0IGR1cGxpY2F0aW5nIHRoZXNlIHN0cnVjdHVyZXMgaXMgbm90IGhlbHBmdWwuDQpUaGUgd2hv
bGUgcG9pbnQgb2YgYWxpZ25pbmcgd2l0aCBncGlv4oCRdmlydGlvIGlzIHRvIGtlZXAgdGhlIGxv
d+KAkWxldmVsIGNvbW1hbmQgYW5kIGluZm9ybWF0aW9uIA0KZXhjaGFuZ2UgaWRlbnRpY2FsLCBz
byB0aGUgYmVoYXZpb3Igb24gYm90aCBzaWRlcyBjb3VsZCByZW1haW4gY29uc2lzdGVudC4gVGhp
cyBtYWtlcyBpdCANCnBvc3NpYmxlIHRvIHJldXNlIHRoZSBiYWNrZW5kIGltcGxlbWVudGF0aW9u
IG9uIHRoZSBvdGhlciBzaWRlIGVhc2lseS4NCg0KPiBUd28gcG9pbnRzLi4uDQo+IA0KPiBUaGUg
ZmlybXdhcmUgaW1wbGVtZW50cyBtb3JlIHRoYW4gR1BJTy4gVGhlcmUgaXMgZGVmaW5pdGVseSBJ
MkMgYXMgd2VsbCwgdGhlDQo+IGZpcnN0IHZlcnNpb24gb2YgdGhlIHBhdGNoIGhhcyBiaXRzIG9m
IEkyQyBjb2RlLiBMb29raW5nIGF0Og0KPiANCg0KUGxlYXNlIGtlZXAgdGhlIGRpc2N1c3Npb24g
Zm9jdXNlZCBvbiB0aGUgR1BJTyBpbnRlcmZhY2UuDQpJbiB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiwgdGhlcmUgaXMgbm90aGluZyBiZXlvbmQgR1BJTywgYW5kIHlvdSB3aWxsIG5vdCBmaW5k
IA0KYW55IGluZm9ybWF0aW9uIG9yIGluZGljYXRpb24gb2Ygb3RoZXIgaW50ZXJmYWNlcyBzdWNo
IGFzIEkyQyBoZXJlLg0KDQpTaGVud2VpDQoNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbHduLm5ldCUyDQo+IEZtbCUy
RmFsbCUyRjIwMjUwOTIyMjAwNDEzLjMwOTcwNy0zLQ0KPiBzaGVud2VpLndhbmclNDBueHAuY29t
JTJGJmRhdGE9MDUlN0MwMiU3Q3NoZW53ZWkud2FuZyU0MG54cC5jb20NCj4gJTdDMjQ5MzQ1ZGIy
Y2RhNGUzNWUwOWMwOGRlODQyZjJhYzIlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwDQo+
IDE2MzUlN0MwJTdDMCU3QzYzOTA5MzUzNTI4NTYyOTMwMSU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUoNCj4gRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lK
WGFXNHpNaUlzSWtGT0lqb2lUV0YNCj4gcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3
QyZzZGF0YT1ObG1Tb3dLWFhHcWRPdEFLRVdYUnoNCj4gQWRRWmFVMTl5SnR5SnlmSW0lMkI4WlEw
JTNEJnJlc2VydmVkPTANCj4gDQo+IFRoZXJlIGlzIGFsc28gUlRDLCBhbmQgYSBmZXcgb3RoZXIg
dGhpbmdzIHdoaWNoIGRvbid0IGRpcmVjdGx5IG1hcCB0byBMaW51eA0KPiBzdWJzeXN0ZW1zLCBi
dXQgbWF5YmUgZG8gaGF2ZSBMaW51eCBkcml2ZXJzPw0KPiANCj4gR2l2ZSBob3cgbXVjaCBwdXNo
YmFjayB0aGVyZSBoYXMgYmVlbiBvbiB0aGUgZXhpc3RpbmcgcHJvdG9jb2wgZm9yIEdQSU8sIGl0
DQo+IHdvdWxkIGJlIHdpc2UgdG8gYXNzdW1lIHRoYXQgSTJDLCBhbmQgUlRDIGlzIGdvaW5nIHRv
IGdldCB0aGUgc2FtZSBhbW91bnQgb2YNCj4gcHVzaGJhY2suIElmIGFueSBvZiB0aGVzZSB0aHJl
ZSwgR1BJTywgSTJDLCBvciBSVEMgZGVjaWRlIHRoYXQgb25seSBhIG5ldywgY2xlYW4NCj4gcHJv
dG9jb2wgd2lsbCBiZSBhY2NlcHRlZCwgbm8gbGVnYWN5IHNoaW1zLCB0aGUgZmlybXdhcmUgaGFz
IHRvIGNoYW5nZSwgYnJlYWtpbmcNCj4gY29tcGF0aWJpbGl0eSB0byBsZWdhY3kgcHJvdG9jb2xz
LCBhbmQgdGhlIGFjY2VwdGVkIHNoaW1zIGJlY29tZSBwb2ludGxlc3MNCj4gTWFpbnRlbmFuY2Ug
YnVyZGVuLg0KPiANCj4gUG9pbnQgdHdvIGlzIHRoYXQgdGhlIGN1c3RvbWVycyB3aG8gYXJlIHB1
c2hpbmcgZm9yIHRoZXNlIGRyaXZlcnMgdG8gYmUgYWRkZWQgdG8NCj4gTWFpbmxpbmUgcHJvYmFi
bHkga25vdyB0aGF0IG5lYXJseSBub3RoaW5nIGdldHMgaW50byBNYWlubGluZSB3aXRob3V0IHNv
bWUNCj4gY2hhbmdlcy4gVGhlcmUgaXMgc29tZSBzaG9ydCB0ZXJtIHBhaW4gdG8gc3dhcHBpbmcg
dG8gTWFpbmxpbmUgYmVjYXVzZSBvZiB0aGVzZQ0KPiBjaGFuZ2VzLCBpbiB0aGlzIGNhc2UsIGZp
cm13YXJlIHVwZ3JhZGVzLiBCdXQgaW4gdGhlIGxvbmcgcnVuLCBpdCBpcyB3b3J0aCB0aGUgcGFp
bg0KPiB0byBiZSBhYmxlIHRvIHVzZSBNYWlubGluZS4gQW5kIHRob3NlIGN1c3RvbWVycyB3aG8g
ZG9uJ3Qgd2FudCB0byB1cGdyYWRlIHRoZQ0KPiBmaXJtd2FyZSBjYW4ga2VlcCB3aXRoIHRoZSBv
dXQgb2YgdHJlZSBkcml2ZXMuDQo+IA0KPiBTbywgd2hhdCBhcmUgb3VyIGNob2ljZXM/DQo+IA0K
PiAxKSBXZSBhY2NlcHQgdGhlIGNvZGUgYXMgaXQgaXMgbm93LCB3aXRoIHRoZSBzaGltPw0KPiAN
Cj4gMikgV2Uga2VlcCBwdXNoaW5nIGZvciB0aGUgdmlydGlvIHByb3RvY29sLCB3aXRoIHRoZSBz
aGltPw0KPiANCj4gMykgV2Uga2VlcCBwdXNoaW5nIGZvciB0aGUgdmlydGlvIHByb3RvY29sLCBu
byBzaGltLCBmaXJtd2FyZSBjaGFuZ2VzDQo+IA0KPiA0KSBXZSBwYXVzZSBHUElPIHdoZXJlIGl0
IGlzIHRvZGF5LCBhbmQgcmVzdGFydCBhbGwgdGhlIGFyZ3VtZW50cyB3aXRoDQo+ICAgIHRoZSBJ
MkMgZHJpdmVyLiBXZSBjYW4gY29tZSBiYWNrIHRvIHRoZSBHUElPIGRyaXZlciBpbiBhIGZldyBt
b250aHMNCj4gICAgdGltZSBvbmNlIHdlIGhhdmUgYSBiZXR0ZXIgaWRlYSBob3cgSTJDIGlzIGdv
aW5nLiBBbmQgbWF5YmUgd2UgYWxzbw0KPiAgICBuZWVkIHRvIHNlZSB0aGUgd2F0Y2hkb2cgZHJp
dmVyLCBhbmQgYXJndWUgYWJvdXQgaXRzIHByb3RvY29sLg0KPiANCj4gSSBhbHNvIHVuZGVyc3Rh
bmQgU1QgaGFzIGEgZ2VuZXJpYyBJMkMgZHJpdmVyIG5lYXJseSByZWFkeSwgaWYgdGhhdCBnZXRz
IG1lcmdlZA0KPiBmaXJzdCwgdGhhdCBwcm9iYWJseSBraWxscyB0aGUgTlhQIEkyQyBwcm90b2Nv
bCwgYW5kIG1heWJlIHRoZSBOWFAgR1BJTyBhbmQgUlRDDQo+IHByb3RvY29scy4NCj4gDQo+IE15
IHZvdGUgaXMgZm9yIDMuIElmIG5vdCAzLCB0aGVuIDQuDQo+IA0KPiAgICAgIEFuZHJldw0KDQo=

