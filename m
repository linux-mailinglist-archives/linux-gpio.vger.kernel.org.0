Return-Path: <linux-gpio+bounces-32160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNf/AYgpnmn5TgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 23:43:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17C18D940
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 23:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6638302C83A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C0D34B1A3;
	Tue, 24 Feb 2026 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BDksaG5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009BE34A785;
	Tue, 24 Feb 2026 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771972991; cv=fail; b=WAkOpQzlusCEIA7nIJAGdFqoUT4neQCtKX0CUa6uhBwNVD6rSX/G+YiVWx2sVA7dsXRdozRSZKH6yGtBaMDQsv6iR/vy3VLbMwmRImAbfOqSIyh1Zr/mjNWBrtYBtCGLo+/AkxeQfEhed4SWOGac4/MPijH6I0lyUhvP8xa5+NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771972991; c=relaxed/simple;
	bh=U2gF0ZQrwu/0jPcN4hOzqsqRBS32Lj203Z50hlAPvGw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rgkeban5eFOcUaQWWwXqaOfdMmd3JgEJjQlnQ/+DRrtPGvYkijsZCnHNhO/Ylj+PpLVyYinfznOXfKC7/gEHkCLyGEqqX8RPCyXuWAPlsYIlnlP8RByaOMblyhuC/Mg9tc9CrucvFV5mkrhM9AzJTj9ii9533mZgzbm5XlEPtlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BDksaG5g; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYikpobYRlsCD653irbhEkb5E0lD+mkYEaLor2BRTp4lQaQPZHGBORE9tf/907uUUcD+IM10GL33UBA6BYKcyBYJQeq+WfTTtW29HoIOgjyRmDCUTjW9i1QtxOp+WQXBBdxkgXoO7g53JhjL9Dkz5nNUqGLwtL5kvdc6RfqDTQ4vYFYQ9+6hZJhpR0RNHzYOBbawSuDhTY71T5jkB2M3+oeCx2zGivRueQ5XvVcVyqZpgJ7aQkpat57M3tmCsKI6UFPgEqSRFa+1pEv9y9WIPg9WncUiDsvhTaKDLEOJFLTftQpXfpNMgEqZWMOIgWvhlDI7hpNcEdrhEYuWoXyXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2gF0ZQrwu/0jPcN4hOzqsqRBS32Lj203Z50hlAPvGw=;
 b=Uph+cau0LirqPiVoTtOZKPi6LOBa33GDs8aUhurwQMAUauEpz+GmPED4XUsBy5xuxTVts1hu2coo1/w+4dQ3zC9Ud7jTI4GAtA97KdI3WBy/4PKBsVDlXJGZzPRbg3puZMdzAyma7K0b8XD2iK9XrkGQyPJrp+tz3Z09kRVwbBhYuo9k79LbjhpZTaC9SoOdaBfS1jtGTh9/NoWAmDI1aY3y6hXjoawHHshGsORzwKJxJF03DlfxweJBsQIi7l4Z3QEVGe+Q/1mYjADQtliNkmqtGrDaTX0KmGl9IbZSexPrGztC1xVoZIro4M5XKkazDqGfqyM1F9A9/RH4Yhn6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2gF0ZQrwu/0jPcN4hOzqsqRBS32Lj203Z50hlAPvGw=;
 b=BDksaG5gHKmztVvCwwg5bse+Gyx0RRSNgnuWmDR/RDdj6XPxkYheBp0NRmM0pUerA5fuW71B9N+6OfPIQ0exq5REzraZfwL4ZGg6JVT4jtdDvc+QzBk9CI/NXHyZRlqGX4y+0lT1qhxpxjmTK+LI7QOlJA/CcoJitjTRgX8kr2aamYo51dwNxW8Iaqu9EQZ3AmoeAjoCX42uVemZPZI0azPj3WvaN8+9PNsWvcy6KnS1kxC3lxn26QT/C+h4UrjvEQiPB9KRxdIA9m+E4wl4Ftp63ROX9Iase1tb0JvOjnIdK8CFU+eeAPG1HsD3gYolq4tSbggqMzh6fI05uEJzIg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA1PR04MB11009.eurprd04.prod.outlook.com (2603:10a6:102:482::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:43:06 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:43:06 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
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
Thread-Index: AQHcpd7xL5ty+1Ea6USfp2XqZEz2Sg==
Date: Tue, 24 Feb 2026 22:43:06 +0000
Message-ID:
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
In-Reply-To: <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA1PR04MB11009:EE_
x-ms-office365-filtering-correlation-id: 50ddd549-862a-4f97-e2e8-08de73f613a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?REM3Wmh2dkZ3THF1Z3ppTlVjTWMvT0t1MjJCVm5wRHpRbi9UUFUwL3NGQkRn?=
 =?utf-8?B?UjYzNUR2V0tFTjJGajZaVmltcmRYZHVTQ1ozYndGQlVOWm5XTHpFK3JFbC84?=
 =?utf-8?B?UUFhWXBQeVN4RkdKejZrVTBnaWhxZmd5QTZ6UVBxUlp4UkMxWmE5WWd4Uzk5?=
 =?utf-8?B?dFp4ZFdaSjZBeGxVZWdPT0tDaHJZQno3QjJoRisrTzg3eFBaY0xUQURFQURj?=
 =?utf-8?B?aTdobHgrTzJsWGtnVzFiWnR0SjhKMGxrQUNwUnkwajJtRk5uSEd4SDRoM00y?=
 =?utf-8?B?YWpVOUxZSSttV3FDWkVsZVpxWFAwR2tHc1lmYk9rN3FEcVlYRitmODRJU0w1?=
 =?utf-8?B?SlZyRGg0VnQrUHE1VHMwRmZ1RmYvQWx4bjFoMDhQaFhEOE92UFI4Y0NZbHU2?=
 =?utf-8?B?czN6T0t5bC9QREtZUk5CNXBSbzJaSTVaZWsvZjB4V0IySTNrMVNIV2dlZG00?=
 =?utf-8?B?czdpRC9HTHMySEJLOHRkRnB0a2N4dllkL3ZRZjFnUlVOc0tZRmJDVFEvY3hx?=
 =?utf-8?B?akMydmovT3haVTFEREdLRWFidEs3d3cxT1pYZHhvalQydjlTN3pveUQvZmtF?=
 =?utf-8?B?MEdSWEdJRjBSWkxJSEJ6VEMwQmNZODhUQjJyUHVBMXJLMS9JQTBMaTR3MUND?=
 =?utf-8?B?dTYycGR1SS9UVmlXNlJxOTZtM0N5NG5STWIydFk0VlIrOGlqRHFTbTZOODJp?=
 =?utf-8?B?ZCtqMFoxaGtCM25ES0xqckxjZ3RPMHp2RGI4YXE1RmxTSFluSS9IQlVWUm02?=
 =?utf-8?B?dHhscjI4aE5IaEU1UVR2MitudmloU0xJU0xtWTlSM1ZSM1VZeTJBeklrODUy?=
 =?utf-8?B?emhHclFUaFhoMlNJQUZKSHVjNUhPUDNDRkR1Q0hib2NjclYvSWFDZ25SQmwy?=
 =?utf-8?B?WU8vSGNFZ2VOSEF3b2xSU3pOaUoyMDk1QnAvK2hLYmJxNjBIWkNUMk8xREhG?=
 =?utf-8?B?Q1JoejBqQXBhOFNnZ2FPL3U1YkE0MGF3ZWdGc0tMaFo4dnJoWm9iMXpPOWp6?=
 =?utf-8?B?VXQyVmdSY1doWlNZTlJieU5ZSkNsaXZaTDc0ZmVWK0xaRk5BWHpjdzNrL1Za?=
 =?utf-8?B?eWk5WGlqV2hkK0pjNjRNL0J5WkExcVorMm4yeFJIYThYKzAzbThXUldBSVo3?=
 =?utf-8?B?dndGSXZPMnpVYlJMQ0RqNTNnaVQ2ZVRSNDUyY2ZCSi9zdE90ZzBTOXEwZkZM?=
 =?utf-8?B?dktaWUIzVkhZdUdyNWlpcTdnNmI3dklCUUQvWkhOblJodVlBZ2tlSFBycHV6?=
 =?utf-8?B?ODdlK1d6bjVkQWlvbk5SUDF2ck9uRng5VzNjMTJva3hHeXRKY05vdWJ2U0tW?=
 =?utf-8?B?VGFzR3cvUkhma3F4VkRKTHVIMXhsSzFqODdWMFdKV0RlaXFPcW9jaFN2eC9a?=
 =?utf-8?B?dEhKSzk5dVNjY3JVeUFjN0NKZnlyQitrRlBueS9UeGpjV1N5Mm81c1ZFRDNq?=
 =?utf-8?B?c1FxdHFzVGhoSkR3TzJUL0xFZGVlaDhvV0tNdkpzWTROMytKYzFSd1FOSEJk?=
 =?utf-8?B?UEJTdllFbzNiK29UeGxYWHRCd1U2MSsxVnp1YVQ3MllOaWhEN3FWaFpSRmVx?=
 =?utf-8?B?T2VMUThOdmpiY2pyR09ncEE2MEZXZ0o1SzFPSkprZ1pKRkkranN2aGMzSDFV?=
 =?utf-8?B?NFdXeTZBUmgzWFdJM3ZJTE51akR2dzVRdG9MRk1hZk5ZY3pXQ3VxT0xnUFRy?=
 =?utf-8?B?aDVJV3RsT2l6TGZzL2NLWk9hVHZQcDg4RElsWTJXcmhjSkNUVThNVlBQbU0x?=
 =?utf-8?B?dGJaTjhROXYzYVRzV0F0YTBQWXQ3L1F1OHhWaDNoR3VCSGc1RjRqVWVHQWJ2?=
 =?utf-8?B?QmtBMEU2cHppQ01xZEpnQzJTUjB5VDFxeWRlQ0JQdVVxbjdXWTluVmdiOUVK?=
 =?utf-8?B?SVN5cUxzZzQ0UEFaekk1OFc4UjJXWi9NbnV6d09haldQMW93cmdTSm5Bd3NR?=
 =?utf-8?B?alIwaFI0NmdsMEVveVl0SUxJQUxpRVNLRm42M1N5UnFHaHF1NGhGWUxBVnZ3?=
 =?utf-8?B?RCtXYlNyVzhXYWM0SlZCNmk3MmlGUnB4amYvYm0wdW1QY2xpNGQrUlZrUXln?=
 =?utf-8?B?VktFbDk5bXlGZmhHRmRTRDJQT3E2aXNYc1dhdGp6NWtIeEhPTThYak85TFlK?=
 =?utf-8?B?QlkyVFFEb1VhTFFiTVg5SXdidlBxQ3dvNHpWbDI1WEJOUGdUUE0zSEQ3QVpX?=
 =?utf-8?Q?mB6XgogstbE/W8iI52NC+uE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ykc5M0lvV0x5SThQSkRnNTIzWHFrZ1hLZ0s3WDRaNGxCdDRNclBMVkRuN1N0?=
 =?utf-8?B?a29scDdhbmpCakRuRlNPS0F3dnkwcWRsYXpiQlN0SDRaanhLRFhZQkxtOWZa?=
 =?utf-8?B?L3hibFBEYmU2KzhmZFVGVS8yNW1qZ25PR0RBQUpOTXRFRmx1K2FKYSt0cmVk?=
 =?utf-8?B?OHNXa0VjVW9rTFlVeXRkUW1wSFFyNWNhVjJrdTkza0R0dDBRT0xlenB6Qm5t?=
 =?utf-8?B?NlQ4bnBqeFU2NUFWV0RSRHpTeFFFV3hINGRFSXVhdTdHLzVzajErOENOUkFq?=
 =?utf-8?B?akdCdlNCVHpScDcwa2lrWE5jc20yMXAxZ0NvdWp2OXN4UG5xbXpRTE1QMDA0?=
 =?utf-8?B?MHZOWXRnaHZKTjAveGFFRmlCMk9uRXc2ckw2cnVTVlZ4Ylk5Y0lsZittY0JN?=
 =?utf-8?B?YWE0MDY4c0F6NmtYbGNYcjBYSnZYK3IvTTBlZ00zdWFDWlEvQjBEU090TkJv?=
 =?utf-8?B?dFBLU05SNnlUSDF5ZkprWG40bm9zczFkRmdDdjZlelZuWCtqTjlMSWdqcVVz?=
 =?utf-8?B?d281S3M4eUhPSTd3djNFN29xUFN1RHVwS3dXRmJ1ZThoaDdmQ0d5RzY2c1N6?=
 =?utf-8?B?ZDl3aHQwWXozdE9YZzdlRTlZQk1MUm9hRTNoK2hwZmR1VzQzMDJKRjZRRzRj?=
 =?utf-8?B?NC9ZdHllQmxZWG5UMGNkNTczT1JjT3dTcEFmVnBkejdJYjk4dHJHK0hHaW9Y?=
 =?utf-8?B?L3IvWDUzNlJDamQ5R0RZKzJYeThLVkRNbVJ2R3ZjUG5GMXBwVHNKMFFxUkVi?=
 =?utf-8?B?ZHFnT1pIZXNPTDFKeTQ1K2Izb0pyVmI1bWVUNlFEV2JQaVlscDBoT2lCR29V?=
 =?utf-8?B?QlZBNm9SMjBVYWcxaEFObVRNSnE1Ny9ZMHZXMTdGVkZNQXNmUjl5S09QWDVR?=
 =?utf-8?B?WWZncEY1L2FNc1hCOWt3bVA1alNtc3pHdW9uWXg2eEYwMFVmcG5mM2pOUUdI?=
 =?utf-8?B?YUpCMEd6ZVllTG1RTldJSk9ubCtXU09GVGVkMmlKYlBsdmNNMzF4NHJsZlA2?=
 =?utf-8?B?QUxKbHVBYlJLQWxpZ1NpUCtCemtHUHdkSE1kNmZJbm1LeWlQcTh2T1pIWjBN?=
 =?utf-8?B?ejJ0MGVha0pZOEg4WUM3ZTZINEtwcEdWaWNmVnNIMFloV1hNVXhoWnhrNjB5?=
 =?utf-8?B?OXpVeFUrOG1mdjk2TERlQXFkT3Vob3M4QXRwamovTVAvaUE3TUxzTUFIaHZt?=
 =?utf-8?B?RUJpSlZyako5NlNLckQzY3lobjd3aURwdFl2TkhVRkRDNXhWc2hUQXNGK1Uy?=
 =?utf-8?B?N0huZW5FSlpDRTBtOU8wQWtEaXBMelljdW5yUWVwY0k4cFVoMi9WVXYxeHFL?=
 =?utf-8?B?Z0htR0FyQS9WZmdDcWdBRnZIelUrZ3loYWVQbnRuOEJJUk5YT1BKT01FYkRs?=
 =?utf-8?B?TmMvK1RMMVBBbFlsRWIvbG1rajF5QU1NbTVDUUZ5ZTJjUlZiU1hqOTlZbkNU?=
 =?utf-8?B?bkZ1VzJxc1RnUk5wOXNYa2h1UWtPS0M3VmM2SjJDS2ZCa3hLa0UyQlB3TzJ2?=
 =?utf-8?B?N2NpNmJyYkZWUC9QTWtiZ3VxQjVKTWhiUm4wWWNLMC9QaTZHRzY1M2FzaFNJ?=
 =?utf-8?B?S2pCTnhKTkVQR3k2TGlEWHk0NkxKMWJ4RFJ2cnh3enBqZnl3NmIyTGt3VkVP?=
 =?utf-8?B?dXcvUFhKWjFNSzJtU3B5L0g4RGh4SXV4WmxCajJNVENCcm5jU0lSNktrL29Z?=
 =?utf-8?B?VU1MM1B6WGsrMUM2N08wU1FSVjV1akkySHNKbzJLSk8wdGNUMS9Mc09sbWov?=
 =?utf-8?B?QVk3NEp0Q2p0Ni83Wk9SM0w4NDFuOXNrazk0YVE3ZEFtTjZqUHdnVDN1bE45?=
 =?utf-8?B?Z1ZZNzVBaHdiMlBmNStDM1kzNEhhczJFNE5vTWFEOFB2V2R0N20zZE43VU1m?=
 =?utf-8?B?VkRVOThnelVMSHZJQmtHS0R5NWxrZmllSWJlbXRYNVI3bXRQRmkwcTU5bUZR?=
 =?utf-8?B?Myttb3E2RXJKeWpKdlIrYWpUVzBmN1BuM2IzZlhqVjd2d3N6dkg2N1ltVnFj?=
 =?utf-8?B?TlVwNVl3Z0hkLzdBaWxVKzVWNGNQMGoyRjhybnpuQVpGWnJWYWcvMnlOV3Jw?=
 =?utf-8?B?c1l1MHp0RS9vejhPM1lNTFd0YWRxb2x5V0RMazNYeHNSQll5QVVvVTQ3YU9n?=
 =?utf-8?B?QUNjR0VGN3A1TGpkcDVvb295V1dVOWYzNWxLMGpKR05QdklNUmR6dHM3Nlcv?=
 =?utf-8?B?OUI2Qk8xSkZyOVZ0MWtYd3BuM3duN2s4ZVJjaks0NXdLVHI4RXQzd0lGd2Fa?=
 =?utf-8?B?UG90ZWFyQ2pOcDEzaVpnMlRaOSsybHlHaXM1QU5XYjQwT1ZBUzFjNVo4aTk0?=
 =?utf-8?B?OER4MUtiMDRsU0EzaTRJK3JKSFI1OGpzUkxQc3U2WmRTRnBnZmh5QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ddd549-862a-4f97-e2e8-08de73f613a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 22:43:06.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9c+FTjP6p0Mciy0bv2k1oq1V5Ya4A+SqDvm051dYlhmYgMes/kjKwoAJ/stvLK/6v/Cbr90ccV5gA9bpeQSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32160-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,foss.st.com,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.971];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB17C18D940
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiA0OjE1IFBN
DQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBDYzogTWF0aGll
dSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEJqb3JuIEFuZGVyc3Nvbg0K
PiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBBcm5hdWQgUE9VTElRVUVODQo+IDxhcm5hdWQucG91
bGlxdWVuQGZvc3Muc3QuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+OyBC
YXJ0b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQg
PGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcNCj4gPHJvYmhAa2VybmVsLm9yZz47IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0KPiA8Y29u
b3IrZHRAa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gUGVuZ3V0
cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0N
Cj4gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbW90ZXByb2NAdmdlci5rZXJuZWwu
b3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtDQo+IGlteEBueHAuY29tPjsgQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2
OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiA+IFBs
ZWFzZSBleHBsYWluIGhvdyB5b3Ugd291bGQgZGVzaWduIHlvdXIgZ2VuZXJpYyBycG1zZy1ncGlv
IGRyaXZlcg0KPiA+IHdoaWNoIGlzIGRlcml2ZWQgRnJvbSBncGlvLXZpcnRpbz8NCj4gDQo+IFdl
IGhhdmUgYWxyZWFkeSBzZWVuIHRoZSB2aXJ0aW8gY29tbWFuZHMgYXJlIHByZXR0eSBtdWNoIGlk
ZW50aWNhbCB0byB3aGF0IGkNCj4gc3VnZ2VzdGVkLg0KPiANCj4gWW91IGNvdWxkIGp1c3QgcmVw
bGFjZSB2aXJ0cXVldWVfYWRkX3NncygpIHdpdGggcnBtc2dfc2VuZHRvKCkgYW5kIHJlaW1wbGVt
ZW50DQo+IHZpcnRpb19ncGlvX3JlcXVlc3RfdnEoKSB0byBiZSB0aGUgY2FsbGJhY2sgcmVnaXN0
ZXJlZCB3aXRoIHJwbXNnX2NyZWF0ZV9lcHQoKS4NCj4gVGhlIHJlc3Qgb2YgYmFzaWMgR1BJTyBo
YW5kbGluZyBzaG91bGQgbm90IG5lZWQgYW55IGNoYW5nZXMgYXQgYWxsLg0KPiANCg0KQ3JlYXRp
bmcgZW5kcG9pbnRzIGFuZCBjYWxsaW5nIHJwbXNnX3NlbmR0bygpIGlzIG9ubHkgYSBzbWFsbCBw
YXJ0IG9mIHRoZSBwaWN0dXJlLiBZb3UgYWxzbyANCm5lZWQgdG8gbWFuYWdlIHRoZSBzZXJ2aWNl
IGFubm91bmNlbWVudCBmcm9tIHRoZSByZW1vdGUgc2lkZSBhbmQgaGFuZGxlIGFzeW5jaHJvbm91
cyANCm5vdGlmaWNhdGlvbiBtZXNzYWdlcy4gVGhhdCBlbnRpcmUgZmxvdyBpcyBhbHJlYWR5IGlt
cGxlbWVudGVkIGluIHRoZSBleGlzdGluZyB2aXJ0aW9fcnBtc2dfYnVzIA0KZHJpdmVyLiBSZeKA
kWltcGxlbWVudGluZyB0aG9zZSBwaWVjZXMganVzdCB0byBtaW1pYyBncGlv4oCRdmlydGlvIG92
ZXIgUlBNU0cgd291bGQgZXNzZW50aWFsbHkgDQptZWFuIHJlaW52ZW50aW5nIHRoZSB3aGVlbCB3
aXRob3V0IGFueSByZWFsIGJlbmVmaXQuDQoNClRoYW5rcywNClNoZW53ZWkNCg0KPiBJbnRlcnJ1
cHQgc3VwcG9ydCBkb2VzIGhvd2V2ZXIgbmVlZCBzb21lIGNoYW5nZXMuIFRoZQ0KPiB2aXJ0aW9f
Z3Bpb19yZXF1ZXN0X3ZxKCkgcmVwbGFjZW1lbnQgd291bGQgbmVlZCB0byBzZWUgaWYgdGhlIHJl
Y2VpdmVkIG1lc3NhZ2UNCj4gaW5kaWNhdGVzIGFuIGludGVycnVwdCBhbmQgY2FsbCB0aGUgZXF1
aXZhbGVudCBvZiB2aXJ0aW9fZ3Bpb19ldmVudF92cSgpLCBzaW5jZQ0KPiBycG1zZyBkb2VzIG5v
dCBoYXZlIGEgc2VwYXJhdGUgbWVjaGFuaXNtIHRvIGRlbGl2ZXIgaW50ZXJydXB0cywgdW5saWtl
IHJwbXNnLg0KPiANCj4gQXQgYSBndWVzcywgOTAlIG9mIHRoZSBjb2RlIHdvdWxkIHN0YXkgdGhl
IHNhbWU/DQo+IA0KPiAgICBBbmRyZXcNCg==

