Return-Path: <linux-gpio+bounces-31978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJnxB4yumGl4KwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 19:57:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE116A378
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 19:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A79EF30470D4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5157C366DB2;
	Fri, 20 Feb 2026 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F4lRRgzh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF031A7E1;
	Fri, 20 Feb 2026 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613830; cv=fail; b=rY/bUDSHhQ1miPXI6FIFnY81ZhW5Np/MlLs00Ted0+24qp5Uy12dUoCA8YkL5VtTqda8aWJlcmSdFJM7xchiUBvs6Eb2mdtcz5uMf+40zbvcHW2DW/r1D9lobttZr1+RRWqjRuGkgG+T7l4AmYGDnqvAcUBVQewQ7b+g+xutD/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613830; c=relaxed/simple;
	bh=UP7PrTCje7Bg2YOz2scQF5oFpOVuhG+aLIQlGhIVc54=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jwtx4YeomtzUFbhDUZQ91yeI8MqCM1WTf5P2i5SEiKn6iBD08GKmM844R1ASLqFwKj8lJfDGuUxJf635kVGwPaBpaXIeqr48DqoxpcHbBLxTjHywSSVkgts0Uj31r0DBJUX26yf8dAAAmMiZQjzA9qmRjXul/UQN/20d5Gr2KWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F4lRRgzh; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjF1M1xwsP+Q3zvnSnXhkLcU54Y2HGIySKrSBC61QNI3qlj46PcQywMD2Clzpt1vmjPyAaw9t0H1BIcWCh/lZarNUfG4FCgucWstH8uc3PfGItM1KSE3L5ycgCyVtWL8sRDT+oQYTomOnuE0RVXwkv2kz83OtCMekC51QEdM5QmY3un4W+uSFH4yMLsH4taKhgdf/ZOUBDsqS8NDKZvI2i2RShcYw4JEm/lFYuGj3NfGAUuOSvKo1LiVGES+h3p3WdhgKhZ1j6C1BZQm1EylRpZm4EI0ikeXOaaXdcXjPLnJqi9k7NiWw/MEtfLAz6CB3D4XEGqSMSTBlvr66F2Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP7PrTCje7Bg2YOz2scQF5oFpOVuhG+aLIQlGhIVc54=;
 b=TVC2arg1ZGBGHNI1nStYfVoidkRP7PgB49cqi06AOX8zZoJt2yYTFdNs64CNwHN82N2mLar+nY0tDsLJ51+9vb+CQT76idC7VE7OJMcumfkfmsR5IJYzn2BY/fq2GYOQ8ORPkb5emfLfo22ILpcl6Wa1Mbk4bNNYxaw/gUnlHdL4WIVbrnsO3mO7LEACt2D7lAoTZGWtbRCfnp4TQslOi+qJ02RfarKtI3yvuRKXg7PeAoGRmjNAEOW6io11N41yzUUlHqdVPDRG7j5xawKCURtJyhBUxvciIYYQzQUmKEzLvvhA14G5QOkDfnEdymynfZ97aw/NhZzJv7Kd1LWlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UP7PrTCje7Bg2YOz2scQF5oFpOVuhG+aLIQlGhIVc54=;
 b=F4lRRgzhQHI8lMWULgBR6zZhIKEKm7L6k2IPkPVxrMgVcl4fX6zhaSvMUl/f4XiqBKb0KuATpSt68JENV6Qp1dgTfzRYheBDPvFht+EDtBKPLaEyc/xObLST4Bh2kHPWu+bs7Wr98OuVfCjjNmplHHx2KTqXV5R4/MHDBxfSqMKHqimhHh1PgJE2lyZ5q37sfsiCIDKTIOve8ozXUI1vHsbMH6q4EduBZ2WY9jAuM5cdlBQJu62TKEnfqpzcJOGgC/+kPYxcGrZZlJjsSNj9RPDBn3JbtBkpHIqox66RiJH/YKBEnbUmdqjA6W5XYYKbB9a4ZrV62dm1OyYnpOypkg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 18:57:04 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 18:57:04 +0000
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
Thread-Index: AQHcopqzxqVF6JjAuk2PY3nP4y7fgw==
Date: Fri, 20 Feb 2026 18:57:04 +0000
Message-ID:
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
In-Reply-To: <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB9204:EE_
x-ms-office365-filtering-correlation-id: b105af3c-5ff4-4602-239f-08de70b1d668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VlFTMEFkdkJoMXc4N3IvN0NqMWg2Z3ptM0hMTit0aVQxd2crdE5sYUVZSUxS?=
 =?utf-8?B?bW1CamwxRURFMEpzdHpmMSthWHFsSC9HTGkwTHBETzNnUmFVYXJ0L2pjSDZ6?=
 =?utf-8?B?dWZybFFRR1FZUGkraUdZRzVYeGJOTDdOcjE3cFYwV3dUMmhQbmorTFRuNVNG?=
 =?utf-8?B?di9QSUdDL2pDdDlMUUhJWXRRZ3MzdFZYRzlHdDNTSGZ6N20raFZUaTVINHZK?=
 =?utf-8?B?YXEvd2lpenFXMHA3aWgxU2dVMzF2WnVJRTVVVDVkWkViYXNUMzJkNUdsRHdG?=
 =?utf-8?B?TmJqNVJqUDhvUkp4dHI4ZUR6ZUdXcHM5OEhkWVBrNEdzTVZZNW9xRGZjTFFL?=
 =?utf-8?B?eXhvcUxtRmFHeGh4S3RVbkJXNWs4VlRldTB6Q3FjYnU0R1crL0xEZHlCWi9I?=
 =?utf-8?B?SlNBZi9DTGR5aUx6VDRiaHhXZXhISkUrUVdieEpIZi9PajN5dzZZR0VDSVRm?=
 =?utf-8?B?cFhjM2tuaWxVcXBaSVFaa0wxSUNRYi84TitlVGRXc3BnUDZPVEJnMmxFZUN4?=
 =?utf-8?B?SVlKVkpzSWxqZnhvbE5xZnpJWTg4SEMxUE5sTGkvU2RaL1I5bFZkMHE1dUNM?=
 =?utf-8?B?amZtOTB6SzNhMjBkdHdlSVJDVnZ4amdPRHg5R1RKWGFNNGJiZ1E5aWNnOFdp?=
 =?utf-8?B?OHRha21rUFEzMnRoVDV0RnBRWXA5b2ptam4zYkd0NGFoVlBxTU11UjM5bGVK?=
 =?utf-8?B?OWRnYy9XVDhSNTZoTzIzTThRUWhnS04wWHEzb0RvdWh2OWhmTytMYzhtQmts?=
 =?utf-8?B?Uy8rM3MvSnhGWVZjeHJZS0grOGRIcVZLdytvL0RBTldsZEkxOGdIVHhLZUNv?=
 =?utf-8?B?QkczSVlURENqcjFyYnZpdWdiL0dYdzA4ZCtnZlNoY3o0eTh5RTVIcG9rMHYy?=
 =?utf-8?B?L3hYQitpRnFoclh5VWdkY09EREdQOHBRbDd2MHZ6alphRHliSHg1M3Q3ODdO?=
 =?utf-8?B?QUFjOXVUUkpxSU5pMzUzdTNJYW5EQVJHcDJWT2pibjR6UW0renYwTFR4RDFw?=
 =?utf-8?B?MkRTRzRHUXRYUkVrcUxuNEF2MFdQL29FczJvakhBS1lTVE9XWURpNjVSQzdL?=
 =?utf-8?B?RERCb3NlOFVGeVlpMkJVS0ppSmxyc2RSR2FacmtSYlJSNmRVNzJrVy9TeXdK?=
 =?utf-8?B?Z1VUTGIwRW1hNkVnRWJjNUNoUHFQcjQzOGszdVB6cG5mSmlyWWRtMk5WaVdy?=
 =?utf-8?B?SDgwMTROcUFmTzVkU2dvMXN3Zi9Gc2xtUGVPNnkzSzhKMmlOQ2Z1dHVkS1JC?=
 =?utf-8?B?aEFteUdtRXZWc3FWOHphRTNNVWFPOHFUNDdWZHZLUGNkbjlLOFJ3UE1zTDFX?=
 =?utf-8?B?K3JVakNHOEFVODBxcGg1SFRPSDNLeDhYRGtEckE4bllPTGhMcVkrd0MwdWxJ?=
 =?utf-8?B?SmltVTJjc01SMGxtUTgzK0ZNMWJVWXVPTzRkeHpDaFJMc2JwQzZ0M01hMmRZ?=
 =?utf-8?B?WDU5TGRBMENFWmM5amEzK2lnVjNRck0vZGdyOVdvQ2kwZmhrQ3Z6NEh6Qnl2?=
 =?utf-8?B?REYyVHkybzFBRGF1WDl3OGJCVkFERVRKYllNdnVPQ1R3RDhBall0RTVMZkxU?=
 =?utf-8?B?UFQzeEVYMGd1N3Nzc3FWRGQ4VGtDVHRRdXlDekhJSTR5b21ROHlMaXQvblh4?=
 =?utf-8?B?cXc0RkZhNXcrK09nNnUrcFBDZDlwcGFGMGhNNkd1ZFcvVGswL1gxQ3NsejQw?=
 =?utf-8?B?ZGFUcmozS1FLZ3h6Zk9lZmtLcEpjYmtTNkZaUmJKc2NoT1BPQmlyTTI1QjFM?=
 =?utf-8?B?ZWxLUWVUdVdHalZCOWE0b1VMRWw2SWtJTHZDT0NUREJHZDQzZDJMcElUb05s?=
 =?utf-8?B?cUhFS0U2aEZ5WWVIbUZVcEZ3dHUxTVQ1RDBPT3FmZ0pyd0RvWFJoUWd4b3Bh?=
 =?utf-8?B?ZlhLWGhmOFBZekZiZGk0ekl5OExSaXRFdzI5QUU0OE9VVEJWdk10eXpxWDRM?=
 =?utf-8?B?Wk9OdWR5L3FFeFpLMmZ4bzYraU1ld0hlS0tlUWloK0dhVHNKSHdBOW53bUpr?=
 =?utf-8?B?cnhQTHVJUE50V3haU29tazdEWHVQUVErNnl5T2ZKclUzM3dTbGQ3VThaL1NP?=
 =?utf-8?B?SmlITDRDSitOMUVlYTBPeVRXaWZwc1RXc1FFV0JWbnNJREhMMExpSzZIUVAv?=
 =?utf-8?B?VkRHV24wNkdqV1FvWmlNSFduVS9GbHpsNGUwR2dDNXVCNzFwU21UZHNSSkNi?=
 =?utf-8?Q?9Cdp+vCyzn7s7VEk5XGKzS0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzdmTnBvdGwzeVlkendVZE50TkxnaHZaZEtoUTE5aTZXeDNPWjNOV21CQnJp?=
 =?utf-8?B?eHE1SHVLMEtBUWdOS0ZZTlo1U0tRWkR1Zm0vL29GeFk4RzlTNEdNMHVZOC91?=
 =?utf-8?B?bHh6MVlQaVRXbEJnT0RjNVRSMTBFcjNCOHhjaE90RzRtL1oxQjN0WEZMSWNi?=
 =?utf-8?B?VGVELzg4UTJUd0Rxc1JmYmVwTHRKbHNuNEJ4cVFFRFY1YjRlUzllWlV4SUVh?=
 =?utf-8?B?THlzSEd0ODhKenk0aU9mVFpKbW95eU5oZlkyT3doZzlFT09KbklHajJKVTI3?=
 =?utf-8?B?UW9ERTRkbjFVdTJWOURyNjEyeU5GTFRkbUloV2poanBWWHIrYXQ1aEthVUhB?=
 =?utf-8?B?Z2FpRS94ZDRUYXNsTTJKc2pkT2lPdHJVVEpqMXVxcmNHTFRUYmJHR0FtUXNI?=
 =?utf-8?B?S0JGVWNKa0VCYTlCMytQVDVRSEkvUGcvb3E3UWNRT2xTVG9YQklaZUE3emhh?=
 =?utf-8?B?NzNaemlvZWhxaEhSRWtvL0UrazZtMnJaTnlnRnpJRTd6Mzh2MDJzTnM5U3Zx?=
 =?utf-8?B?NDZVdFJHUkp1clR2OEI2WFpIK1g2SGJRVXBEMExoc3VFbFBlc2o2RnI0aDhz?=
 =?utf-8?B?aEI2K1VMK0VVeGg3OVBobDFGallrK3NhbnJjTHdLRUljZE9LaGg3cUZ5OUtS?=
 =?utf-8?B?Q1BFNXF0NzVLdCtUTFQ2Mzh6NG01QkhvNGh6ZVpWQ1FFUDZOcDNON2VibWpK?=
 =?utf-8?B?NHRSdk4wVUwvY2U3dHhrbEJFUXoyeTFQTWpjOXJBRnN5MWV5MFFpUFNLODhF?=
 =?utf-8?B?S20xTXZmY3dWeVBza1l6WTZKUGZ5ZHY3VGQxdVNIbENnQW5vNHpDVllpSUxR?=
 =?utf-8?B?ZHA2R0YyWVpJTW55cERCVDU3NHRHcExRMm81emNGb1VjY3BraVpDZGg0STRp?=
 =?utf-8?B?NXYyTFJwdXJ2R3QzVWllbUVyT29LQ1hQUlRNQWlvYk01aldiSmFWeFBwTE1N?=
 =?utf-8?B?V2hXSUVyNi9nbWxKVXhwRFU3aG5qSmd6eEdWVkxXVFAxMnRNYzA1QjNvQWhq?=
 =?utf-8?B?NmI4aHZ5cCthWk96UFluUkxWcFJ5VmNMUGZNdlJNTVIycU0wWWxRYlRKSnc2?=
 =?utf-8?B?MHB3aW9RSHRGS3c3R3dxUGh3eUtIQ3VmTnMyQXI5ZVZSSEZLSXgzZS8wcXFV?=
 =?utf-8?B?QzV3QnBQZWtsV0dHb2Q1SmRZNmtYTHUzSHVZNHp5dEw0YzdJZloyVGtFVnh0?=
 =?utf-8?B?blRFVWJlMndIVGwxZm5GakUvdVFEL3BSOWhibWtIQ0ZReTVkN1IwTjBuNVFS?=
 =?utf-8?B?eGQrTVNBeWJRYzdvWCszVDNtSEdxaGd6Z1ZkM0tUbEdxWFBwakhTN1B2aVlR?=
 =?utf-8?B?YmRZRFJRMitEczhpZEFRQjdvTlA0ZGY2WFlYQTdXZWRrMGdxdnhVU2VpUnh2?=
 =?utf-8?B?OTdObzBDTlFXZzlaWndZcVhua3M5UDdKSHNWNFQzdDIzekJuVG9TN1U5Zzgz?=
 =?utf-8?B?UE9JZFJRaGNEZWh3OGp1czQyMC9sRDFFQm95SGRhQ3RncHFGc0VsQ0dMdDla?=
 =?utf-8?B?Z1VCNTVaTVhqT0lUK0QrVnJGY3U5Q1VMeTlObWJZRFJqT0t1THhPaWxwMXQ1?=
 =?utf-8?B?K21OL21rVUI2ZUdIYXAxWG1Rb2dybEtTZVpjYXM3TC9SZVg5UjcrTFBSN2wy?=
 =?utf-8?B?MWlhRExBclZBTkxiR1ZyYnFnV1B2NU5UUTVNZStEU29iaFhqSWExSkpmYlFu?=
 =?utf-8?B?QnIzWTJIOWpDUWZ1MytiNmxoZS9JN0orVzFiOHNKblZyaC9PQnJzais3ZEs1?=
 =?utf-8?B?ZzdaMlJTZTN5VjA1RU9UMkJ6RVh6TzhnY0VHVEpTOHZuQ29WazNuRmJ2Skl1?=
 =?utf-8?B?STdrY2tKQ2RTSGx6VFJQaFVmQko1dkRoU054aWlkUlkxb0cyNFh3bjZDeVdv?=
 =?utf-8?B?T29wcXdSMVFkcTVFazUySVBraFhUd1VURUVqR09kb2t4OWZUWmNxdjlSaVRl?=
 =?utf-8?B?L2ZQem9ZMGVQczJyTFU4cnZkeWpxaXo5NGw5VVA1SEhES1VOT2NOL3d6Nmdx?=
 =?utf-8?B?ejhOTVNJSGdUMExLZ1BFVWVjbTkwanNYMlB3V0tBZVVNQ25lZ3NpNENaREQ4?=
 =?utf-8?B?Q3hBTFgxeHV1eXVCQkE0T3JJU01wM0lnVFhpZHo5NUJkQ0F0RHZrZEUvaHdP?=
 =?utf-8?B?VEdsbVBCS2Irb0xXRUk4QXNUWmM1c0ZaSW1GbDkxZVFrOUpzZitDOWY5S3Bp?=
 =?utf-8?B?Ny93QVhvSDMxK2VpOC9zaGlSK0VJekt0dVYwZThVajcvWHpTTWtyQ0U1bDRz?=
 =?utf-8?B?dDBKaXB1Y3RaUzkrTFdPLzA4STE5YlppMGxvMkRCYmlqeXJZazNkN0dQbjN2?=
 =?utf-8?Q?XAis1FphQOxpvUCalD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b105af3c-5ff4-4602-239f-08de70b1d668
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 18:57:04.1514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnHUY7x4JFjXDPlMjf62M/OPbDLNwvpq2yt23GVYbygXunod7iowONnEO1IUz2QC+c4SV1vSefkSh1EsoUj7Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
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
	TAGGED_FROM(0.00)[bounces-31978-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92AE116A378
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDExOjQ1IEFN
DQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBDYzogQXJuYXVk
IFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT47IExpbnVzIFdhbGxlaWoN
Cj4gPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwu
b3JnPjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24N
Cj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJp
ZXJAbGluYXJvLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiBJ
ZiB0aGVyZSBhcmUgY29uY2VybnMgYWJvdXQgc3BlY2lmaWMgZGVzaWduIGVsZW1lbnRzIHdpdGhp
biB0aGUNCj4gPiBkcml2ZXIsIEnigJltIGhhcHB5IHRvIGFkZHJlc3MgdGhvc2UsIGJ1dCByZWRl
c2lnbmluZyB0aGUgaGFyZHdhcmUvZmlybXdhcmUNCj4gaW50ZXJmYWNlIGlzIG5vdCBzb21ldGhp
bmcgdGhpcyBzZXJpZXMgY2FuIHNvbHZlLg0KPiANCj4gVGhlbiBpIHRoaW5rIHlvdSBhcmUgbGlt
aXRlZCB0byB1c2luZyB0aGUgb3V0IG9mIHRyZWUgZHJpdmVyLg0KPiANCg0KVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2suDQoNClRvIGNsYXJpZnk6IGlzIExpbnV4IG1vdmluZyB0b3dhcmQgc3VwcG9y
dGluZyBvbmx5IGZ1bGx5IG9wZW4gaGFyZHdhcmUgcGxhdGZvcm1zPyBJ4oCZbSANCm5vdCBhd2Fy
ZSBvZiBhbnkgcnVsZSB0aGF0IHByZXZlbnRzIGEgY29tcGFueSBmcm9tIHVwc3RyZWFtaW5nIGEg
ZHJpdmVyIHRoYXQgaW1wbGVtZW50cyANCnN1cHBvcnQgZm9yIGFuIGV4aXN0aW5nIGhhcmR3YXJl
L2Zpcm13YXJlIGludGVyZmFjZS4NCg0KR2l2ZW4gdGhhdCwgSeKAmWQgbGlrZSB0byBoZWFyIGZy
b20gdGhlIEdQSU8gc3Vic3lzdGVtIG1haW50YWluZXJzIOKAlCBATGludXMgV2FsbGVpaiBhbmQg
DQpAQmFydG9zeiBHb2xhc3pld3NraSDigJQgb24gd2hldGhlciBhIGRyaXZlciB0aGF0IHdvcmtz
IHdpdGggdGhlIGN1cnJlbnQgaGFyZHdhcmUvZmlybXdhcmUgDQpkZXNpZ24gY291bGQgc3RpbGwg
YmUgYWNjZXB0YWJsZSBmb3IgdXBzdHJlYW0gaW5jbHVzaW9uLiBNeSB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgdXBzdHJlYW0gDQpnZW5lcmFsbHkgc3VwcG9ydHMgZXhpc3RpbmcsIHJlYWwtd29ybGQg
aGFyZHdhcmUgYXMgbG9uZyBhcyB0aGUgZHJpdmVyIG1lZXRzIHN1YnN5c3RlbSBzdGFuZGFyZHMu
DQoNClJlZ2FyZHMsDQpTaGVud2VpDQoNCj4gU29ycnkuDQo+IA0KPiAgICAgICAgIEFuZHJldw0K

