Return-Path: <linux-gpio+bounces-31967-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB2CCAR6mGlrJAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31967-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:13:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22B168C99
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B00F130158A8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36F4337BB0;
	Fri, 20 Feb 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NNZHe1+y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A924A069;
	Fri, 20 Feb 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771600382; cv=fail; b=lJWhtBbgbvTtnfX8L+3TcupUz+zz75W8Fnyz+KKaBt13TV1Np/3770zMCaX/mzD0YwomzMq9TgUFmz4S0HXMSGRdsHJn+ygVUPlSA+Fc6xYZn+O98xY/5Y7sceuDcVsUtuE3HYIEzgWmcoQEZSjbVVKLNStwUXHyjetxQXoWQaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771600382; c=relaxed/simple;
	bh=mqtmXKiB9J/q2cj37pvVFXWt70v8ubzp/cC8Dm+4eZk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E6fh05sF5PID7czRVv5XoipBdXj3PBuGGM60jPLK9bvMzX5aq5cnwTsV2dVmb0/DqiucOYBHevLOYakh5BREXFBcfEBKXRxfjnHQP3xQYBWBvV8vYjmjsszWTXY70GGnFckL21m269k9ou9w5Bzr+HEEtikmYq+tmd4aswae92I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NNZHe1+y; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAZCOJjSJYM79onXUdYmFc49Xz8RZpt/KWeNW975TQm+5gsFQUbOOy5b8NBidaa+4TSrU6TqYMqUs4JV1zPDNSRgpeP9wYsGkVnEiCHIke92N9L3LZ2mH2Odvj3XEnF2KXYBzZwou1XGrDf+AlCKJHnNyabkeONxtnJu5yQaG5U/OHNfZJ012BX0PR72CkU0DovX3YRAKRIgnDzFxq0giiyoyL/AYzuK3mJAE/wZSyzedQEiQXDrV2aNCIeQHH3ah8GyHB1XhXIP507KQ+NGoM0YB7pTTRbmRtkeKKhLkzT8zPdq7liC/cDLgfy7X0wVHFyQA1a5gHsrr0dAzf0mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqtmXKiB9J/q2cj37pvVFXWt70v8ubzp/cC8Dm+4eZk=;
 b=gbJiDTdCxQre0siqyGaG0r/os0fDy2IOkbNBSK5PI0RmeFrdnRKEp6GuahaGOyk7DY8jFXq5EFOq92xSGg+GTuxLZE6BFnUQrGHqjwvOSOas9m0xYap2YJkxkszBzB3t9lEtJ6R0RVvX6mpC0Mie0fdiV1YkufOoqXRVrxrAcxLjH+HBozW3jclpnpx7ET/oG3p3tUt77VWsNNc7/49hvfHflKCvDYJ27VSN39rg45lDx7xBYqoNsuDRoUULGhRrNIa+Tbb4R0+Vzrx8QVxEbyV/EvoFl5NDrXkP3UOoXkDrtzd7r0Wlu2gX1WMnDCKhVJWCZh1Ma6oQvU5dvaNOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqtmXKiB9J/q2cj37pvVFXWt70v8ubzp/cC8Dm+4eZk=;
 b=NNZHe1+yWbUNYyewDxz0kdb1g4m73cIIecXN/mjxQbHhLhPxFGo45Jv65d03dOylOm42fCcMk1RISg4tFovTZL4pX0VcpA7ZgAiYbXdSB3b78S0gDSwWqPunqFUvCJDO75HMbhh3oOp5IM7vcU3rSiMXQuV8oOzU/Pr4AIuVORRjwXznrMgTNN1AV61JaXC0zC2VhG/270WTB5y9PlGULtH1OjFfyl3BpSXQ/FF7td/iJZI++O6+Q/VoPOIKE67mIkg3Ft4wuG+YRzhS2BAM3CTJi86VPdBKRY/W0P9sMT8lxGOGbvYIWpA5MIezX7068+FO3IOVffx6SEVwL6tIUQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AMBPR04MB11764.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 15:12:56 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 15:12:56 +0000
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
Thread-Index: AQHcontkB/mspzIEdEmBz0UpL0t3TA==
Date: Fri, 20 Feb 2026 15:12:56 +0000
Message-ID:
 <PAXPR04MB9185F045DC869E62B272D9538968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <AS8PR04MB917654F40D80A2DBAD30ACD1896BA@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <fdbdfd15-1848-4d17-ab1c-53472ab6c817@foss.st.com>
In-Reply-To: <fdbdfd15-1848-4d17-ab1c-53472ab6c817@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AMBPR04MB11764:EE_
x-ms-office365-filtering-correlation-id: 3d3bcbf6-0ed3-4b6b-0a5d-08de70928708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTdEMW9zdGhZU1MzTjRFR1hQblJTMCtHSGJGWUZLTWRUZ3VlSitJSjNPd3NI?=
 =?utf-8?B?YVFtZkUySTdvNnBqTFZIZW05OGgyVXl6ajVVWCt2bUtKZzh4RGlhRllCZ2V5?=
 =?utf-8?B?M092L3dYMTdINUFXcHBSSGtYQm4wdTA0RGtoSGd2SW9HaG53SEZyUi9UV0p0?=
 =?utf-8?B?dWVac3RMOG83RnA1SFg4dUVCejFFdVN6Tnh2cm1pbTJ5YUhaWlpXV3Z6MTdO?=
 =?utf-8?B?YThSZUpvejlhamhBUHB2VW5jbzZMVGI4dVRqN2NCQm5oYmRiOUhCbkxCZG05?=
 =?utf-8?B?LzVJbXFOUlR3RUpaZlZES2dUenJJVW54M2c5UWhkYndQWERYR2VsYkdydXdG?=
 =?utf-8?B?Uk51NkJpVjB4NDdJNVdaaVU2RTVWbWpVYzFjeURBUlpSUFQ3VlFqNGpMRlM2?=
 =?utf-8?B?T2ZyaTRMRVhRMXk3UjlIVmZodGt0WmRjUk45a2NQTHpwaThpN0VoNUo0eWJ2?=
 =?utf-8?B?QXFSQldYeFpubUhzV3RlVjhkdGwybnJFb0ZGV3ZpYjU5VWdyeDdka0ZnTzNG?=
 =?utf-8?B?K1JISVFKSUdWNXJXN3NPZG8zVnc1cHJTck5wTVNjVFF1NXFaS2t5YVgwUlFK?=
 =?utf-8?B?QTlWc2dVYkZFTmtRcFVaUjRxbjF4L2V5bmpvbGdrLzY5MlIza01qRGxLVytk?=
 =?utf-8?B?anpMMTdGRUhRMFJpUnZVMTVyMFZ3b0h5aDBld2FicXp1L2N0dXNXeS8wU3dj?=
 =?utf-8?B?T3hpS0FSclB0U1VJSzBTU0w3TVVnUy9xa2ZsTWpxVmJPK0hvUE5FaWF4MHp5?=
 =?utf-8?B?M1hhSXdyN3VSVkFkVjlQZEdRZTNHOTFzdldyQ09BclFHSFJIQnFBM1JZNVV3?=
 =?utf-8?B?dTZ4SEpYSlE3eTVHV0hUbmpITlhjd0tVcktvUERnVUZJMkdYM2ZEVE5McGlw?=
 =?utf-8?B?aHd1YkhmN1drcDdueGloRDlJYlZ3MHFlL1Jibk84TlBDSXE2dHYxMlFlZEdm?=
 =?utf-8?B?c2pVK2lwV281Z0NldUlpR0tYeWFmQjZtS3hWOE9venU2dUlpN3VuZWFnOG82?=
 =?utf-8?B?MnFGY1doRXY0QVFHOUVMWUJKTlhlZWZxM3pVaUtzcVIxNjduNVpoY2Q1M0kz?=
 =?utf-8?B?Y2lHL0JDNkxQU2hzWmRsTkZ3aFhVWkViTzRiZTBBbjZjZGlIcUMyWVFxam1Q?=
 =?utf-8?B?V0V3eEdGa3ZUdGNLL1dDUEpYdmUrc2FDWEFYYTJaY1JkaXR1bGpkNEFKZi9E?=
 =?utf-8?B?T09DazRMYUVVTjJiMW0xMTRsQTA3Z2FtbjRuR2svc0ZZejlFbm5EODJWYndv?=
 =?utf-8?B?a1R1VWVnc2Z3UERTL3lnZldJVFhnRmZIbzA1LzF1UmdJWkxWWW1odUEvbGtB?=
 =?utf-8?B?amg5ZHkxams2Q245eUZuaGl5RHZFZ1N3SHRDTlVkVHRQZlhjTWRDeGVoM2pX?=
 =?utf-8?B?LzJob1BJME1GUUtzT3QyekwzUlNkUUxTTlJNWlE0clVzVmplMVFRUlZNTFFU?=
 =?utf-8?B?T1FYaEhQU1F6aTd5VUFNMW1rS3dKa2djdy9hUWp3aGFFczBXUXJVTU1YTTd5?=
 =?utf-8?B?NnRjeU0xUG0vcnFkRFdFNGYzZ1krbWJZRWN3SzI4c3p1b3VGbm4wdFIwTGtV?=
 =?utf-8?B?blF0SThHdzVRVzJZSkgvRWpPazNvWnpHc2dYZUE4dFZ5UFRUeWhFSDVHWnJ0?=
 =?utf-8?B?bThPWEFyYldFUW85TjJFN0R2dHNNZDNTdE5vTzR5eHZiMUwrS0dGdzZRWkpP?=
 =?utf-8?B?MFVyVnZLTmtHT1dEM1kvMHRJYmhlbUNnZjBFWElMUFZsM1A1ZzVXWThMSlpU?=
 =?utf-8?B?eXlpcndpTjNqNHhlUU5pcnZlM0NsOXdEL2l5d1E1UXkwMGpJSDRyMHJwSlJw?=
 =?utf-8?B?VDJiTVNPNlE3VzBCZVc2TGtOSG1EbkJ3cXNTY2syUUtMTVZPdngzeEEveGNX?=
 =?utf-8?B?OG9MOUZmK0tLZnpQdXBWT090aGxZd2dxS2sra1IxNFh5UDJKRzRDYTd5V1Vp?=
 =?utf-8?B?MiszVGFsekVScE5ubnNEMkZjT3JIakxtTDFqMUVNYVJ4RUg5R3diWEZ0ck5q?=
 =?utf-8?B?K1FpbHE3eWZaWmVRdHAwUDBHdVNCaHF2dDZadlhvN1J5U1ZJZnNLTmhNaU42?=
 =?utf-8?B?MHNsRGgyYlRSdnJoeFcwaXNEQWE3Y1R2UkR6UGxoTnZDV0hqQlV6ekZxNlUr?=
 =?utf-8?B?VjlySnpKaEJqMC94Ukxwemd0RDZlYkJmcmt5djRFclNDOUNLbU1GRHBuNmU0?=
 =?utf-8?Q?usGcHJRgald4XI5dfxipy4wwZaJYUxm3sXBa5+zyrG4r?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDFtaEM5dFBNVWRTWWVnVWc4ZGcrRlJxWFNQbnUzZHl2WkpzNlg1QitPdkpv?=
 =?utf-8?B?Q3VvM1k3WkhLWnhyYW9uNjBaL0sydWplczlaNloyTmFNZmpnZ3BodERKTWpw?=
 =?utf-8?B?NDJtK3NGK2E0dE5JUERmTzFmRVRRQ3FNZnlNalQ2NGl1UGJQU3BESnd3Q2px?=
 =?utf-8?B?eURFaklidDBKK0h6T2ZvQllEY2M3NmdQN3BLWmxDeE55dDlUdmNGR095aHpu?=
 =?utf-8?B?OVpldC9CanR4UXYyUXV1UkJ5bzZ2dUh6aDNsS2puWXlDTXA5ZEprSEZTczlL?=
 =?utf-8?B?UGhjZVNENVhWMWNtL1VIVzF4SFp1T2VVYmVERUpJcTMwVjA4ZVhZNzVDQnJV?=
 =?utf-8?B?MEdlSXRLSjhwQnM2SlRmOUFUWG40aWUwblRPUENjNDVmNVFUM0tONVRkKzQr?=
 =?utf-8?B?SWtQdVZtTFk3aitUUG9vUDBlbUNzMWhNNUVvZDZ0UHA0VUJIelBkRDlHUndB?=
 =?utf-8?B?YzRiSFhON1pwNXRSZ1dud0JDdmc2VERNMFpUdmxQOTV4WXR0aFZhZmVuVXdJ?=
 =?utf-8?B?Sm5zSGc1S1RITXZuSzdvWm13WWlDallUbUhDQk5Nb0tBV00va3JQWHNxajR5?=
 =?utf-8?B?ZWhiV1ZLSGNhOGRSMCtHM2JkdTVMMVpPcmMraDg5ZklUREhQSW1xdU0rSTdn?=
 =?utf-8?B?UHY2Zlphc215QldlWUlMNm1pcm0ycTF0Rm8xSmRYRXdvd0dTSlg1QlVXc1lv?=
 =?utf-8?B?MzNua0lINCsyUXlmUmNnWGVZa1JjK3B4RWZHN3o4R1BybnZGdTZSTXpJV1dw?=
 =?utf-8?B?VkhKSjhZeGE0dld5ZHVNWVA2Uy9hSjJqR2xGT1V1MkZYZThvVXNTWDRaYTI2?=
 =?utf-8?B?S0g4VmlmaVZMaS95T0FYUzRvQ3E2R0doS3Nmakp0ZW9naUxkK284cFRpWGVM?=
 =?utf-8?B?RU9saEFkdUpKMm85dHpZa1RDKytqQ2JvVkdKL0grRE5XVE5FRVJsem5pY09X?=
 =?utf-8?B?cmZlMGZNdERLcnIvODA4aEVZdXVSOGd2NWFtQ0E5c2lXcFBzYTB6Nm82a052?=
 =?utf-8?B?cFVWZGRId2hBZ2tyK3JldUFLWTVUZlhUdnMwYWJxYjdPa0h1cG8yMlUxSkk3?=
 =?utf-8?B?d2Vvc2hsMXRiL0o2c2ZnNVEyZENhWkVMdGZpVkhlR2hvNHp1bGVwYlA3V3VF?=
 =?utf-8?B?SGRiSklZNzBXZWpnWi9rZWhoSnFOOVdERHEvQUhMWHFPL3JxWmRXWXU0dyt1?=
 =?utf-8?B?YnBlWmpadWJUam51by8wbWh5cVdKS2tqbUJwaGM0djZlQ2NBOEJuc0tsRFBS?=
 =?utf-8?B?Ni9oYmJwbFBoY2tCcWt3QUNLNCtsMm0xNXNaUDEwL1FuYTR1MmFwM3hKQW0v?=
 =?utf-8?B?SXVoZUVHRXlvOXp4eWgyZGpnbVNsOVgyNzQxaS9EdVI2OGVFSU9HcVc2MVNG?=
 =?utf-8?B?QWFzZWdoQXE1V1BKTWtiWVJ0Wjg3Nzlobmt2V2RTOVk4M2QvNlExRmx3SmNY?=
 =?utf-8?B?TCtEZk1RNkQycVlBVElmcE1mZjV3bVNlOUNzbUpaRVQwODlWRDRtZEhYVnRx?=
 =?utf-8?B?THBhbldFNUpjanFRaDV1RkJwc2FrRXZ1MHk5R1Qvb1VYT0VseVJhdk1NWGZa?=
 =?utf-8?B?ZVhGaFlHRzNGOXh6M3lZbVlOb2lPb3ZYdFY1RkR3V1pFNGV3UStoWDhLZmZJ?=
 =?utf-8?B?S00vUGo0VFdkc2NVZzNzTHRXcFRicGdVTkJsdk1MVzhjU1Fmb3NVRlhaNy9E?=
 =?utf-8?B?MmVpV2JxOG9Xb0JQeGgzaEx5Znp5RWowYzJWWjZQbXk2UHFlMmdWYnJBZktK?=
 =?utf-8?B?OWUwV1VlYzlzczd1TFoxTkJTMkhhcXlNTFpnd09rei91d2JPVmRpZndmSjNl?=
 =?utf-8?B?RDVPdWw3WXh1eWxxZFkzZ2piQy9QeHhXVW5FaGlMNEdUREJvMUsxUDhMSXA5?=
 =?utf-8?B?bm0vVkdvbUs5Y2JGKy9vekw4Smk4UG42UFVsSEVldHBGa2VmeHozbDRvZnVC?=
 =?utf-8?B?cW9aZUVSZzB1VGM0N215aVhBcGREZU9CcFgzd0ZDWHp5cTZHV1hFQ1NndWtL?=
 =?utf-8?B?bjFNaGsyak9pQzBYcGFROHk0QVVWZ3Q4RCszMXRlK2FPUGdZcjJYZjBuUGRM?=
 =?utf-8?B?dXRHTnpQYmk2cnBKODdvN0ZLSkZOKzFuN1JOSDViaXJQcHp2ODZRaWttWWhC?=
 =?utf-8?B?RWlBa3JDUm9ZQnVyYTgzdGVINWVNVVZkbUZQbU5vZ0VzNWFMOVE1Q3Z6UEhC?=
 =?utf-8?B?d0NpT3dPdEZxSDR3M2pDRWNXM2V5OE53S3h5NDB4cW1JZUNOSVhXVzJrZUc0?=
 =?utf-8?B?WFFLNVY1NVB1ZWFvNjRtVnBXMC9UakFybFMrK2p4LzJJZTVTMXpWU0g2NHhh?=
 =?utf-8?Q?wTbNUlmqi4aV0544Yi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3bcbf6-0ed3-4b6b-0a5d-08de70928708
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 15:12:56.5211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+KyVYdpd8XjhrIWRfIcAFWAiLk+tx8yFFU7HKg96sEgemCTueG4BsDzDqvkSJQm51wSJvONNR0Fh8NzUWVQ5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31967-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD22B168C99
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFy
eSAyMCwgMjAyNiAzOjMzIEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAu
Y29tPjsgTGludXMgV2FsbGVpag0KPiA8bGludXN3QGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24u
bmV0PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IEJqb3JuIEFuZGVyc3Nvbg0KPiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBv
aXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxp
QG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBT
aHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJv
bml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4g
PHBlbmcuZmFuQG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1h
cm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPjsgQmFydG9zeg0KPiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47IEFuZHJl
dyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2OCAz
LzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiA+PiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJw
bXNnIEdQSU8NCj4gPj4gZHJpdmVyDQo+ID4+PiArICAgICBycHJvYyA9IHJwcm9jX2dldF9ieV9j
aGlsZCgmcnBkZXYtPmRldik7DQo+ID4+PiArICAgICBpZiAoIXJwcm9jKQ0KPiA+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gTlVMTDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIG5wID0gb2Zfbm9kZV9n
ZXQocnByb2MtPmRldi5vZl9ub2RlKTsNCj4gPj4+ICsgICAgIGlmICghbnAgJiYgcnByb2MtPmRl
di5wYXJlbnQpDQo+ID4+PiArICAgICAgICAgICAgIG5wID0gb2Zfbm9kZV9nZXQocnByb2MtPmRl
di5wYXJlbnQtPm9mX25vZGUpOw0KPiA+Pg0KPiA+PiBJcyBhIHRvcG9sb2d5IHdoZXJlIHRoZXkg
aXMgbm8gcnByb2MtPmRldiBub2RlIGJ1dCBhIHBhcmVudCBub2RlIGV4aXN0Pw0KPiA+Pg0KPiA+
DQo+ID4gSWYgbm8gcnByb2MtPmRldiwgaXQgc2hvdWxkIHJldHVybiBOVUxMIGluIHRoZSBhYm92
ZSBjaGVjay4NCj4gDQo+IFJlZ2FyZGluZyBycHJvY19hbGxvYywgc2VlbXMgdGhhdCBycHJvYy0+
ZGV2Lm9mX25vZGUgaXMgYWx3YXlzIE5VTEwuDQo+IHNvIHByb2JhYmx5IHRlc3Qgb24gaXQgaXMg
dXNlbGVzcy4NCj4gDQoNCkV2ZW4gaWYgcnByb2MtPmRldi5vZl9ub2RlIGhhcHBlbnMgdG8gYmUg
TlVMTCBpbiBjdXJyZW50IHJwcm9jX2FsbG9jKCkgdXNhZ2UsIHRoZSBsb2dpYyBoZXJlIGlzDQp3
cml0dGVuIHRvIGhhbmRsZSBib3RoIGNhc2VzIGNvcnJlY3RseS4gSXTigJlzIHNhZmVyIG5vdCB0
byByZWx5IG9uIHRoYXQgYXNzdW1wdGlvbiwgc2luY2UgbWFraW5nIA0KZGVjaXNpb25zIGJhc2Vk
IG9uIGFuIGV4cGVjdGVkIE5VTEwgdmFsdWUgY291bGQgYnJlYWsgaWYgdGhlIGFsbG9jYXRpb24g
cGF0aCBjaGFuZ2VzIGluIHRoZSBmdXR1cmUuIA0KS2VlcGluZyB0aGUgY2hlY2sgYXZvaWRzIHRo
aXMgdW5uZWNlc3NhcnkgY29uc3RyYWludC4NCg0KPiA+DQo+ID4+PiArDQo+ID4+PiArICAgICBp
ZiAobnApIHsNCj4gPj4+ICsgICAgICAgICAgICAgLyogQmFsYW5jZSB0aGUgb2Zfbm9kZV9wdXQo
KSBwZXJmb3JtZWQgYnkNCj4gb2ZfZmluZF9ub2RlX2J5X25hbWUoKS4NCj4gPj4gKi8NCj4gPj4+
ICsgICAgICAgICAgICAgb2Zfbm9kZV9nZXQobnApOw0KPiA+Pj4gKyAgICAgICAgICAgICBucF9j
aGFuID0gb2ZfZmluZF9ub2RlX2J5X25hbWUobnAsIGNoYW5fbmFtZSk7DQo+ID4+PiArICAgICAg
ICAgICAgIG9mX25vZGVfcHV0KG5wKTsNCj4gPj4+ICsgICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsg
ICAgIHJldHVybiBucF9jaGFuOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50
DQo+ID4+PiArcnBtc2dfZ3Bpb19jaGFubmVsX2NhbGxiYWNrKHN0cnVjdCBycG1zZ19kZXZpY2Ug
KnJwZGV2LCB2b2lkICpkYXRhLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
bGVuLCB2b2lkICpwcml2LCB1MzIgc3JjKSB7DQo+ID4+PiArICAgICBzdHJ1Y3QgZ3Bpb19ycG1z
Z19wYWNrZXQgKm1zZyA9IGRhdGE7DQo+ID4+PiArICAgICBzdHJ1Y3QgcnBtc2dfZ3Bpb19wb3J0
ICpwb3J0ID0gTlVMTDsNCj4gPj4+ICsgICAgIHN0cnVjdCBycGRldl9kcnZkYXRhICpkcnZkYXRh
Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgZHJ2ZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YSgmcnBkZXYt
PmRldik7DQo+ID4+PiArICAgICBpZiAoZHJ2ZGF0YSAmJiBtc2cgJiYgbXNnLT5wb3J0X2lkeCA8
IE1BWF9QT1JUX1BFUl9DSEFOTkVMKQ0KPiA+Pj4gKyAgICAgICAgICAgICBwb3J0ID0gZHJ2ZGF0
YS0+Y2hhbm5lbF9kZXZpY2VzW21zZy0+cG9ydF9pZHhdOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAg
aWYgKCFwb3J0KQ0KPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPj4+ICsN
Cj4gPj4+ICsgICAgIGlmIChtc2ctPmhlYWRlci50eXBlID09IEdQSU9fUlBNU0dfUkVQTFkpIHsN
Cj4gPj4+ICsgICAgICAgICAgICAgKnBvcnQtPmluZm8ucmVwbHlfbXNnID0gKm1zZzsNCj4gPj4+
ICsgICAgICAgICAgICAgY29tcGxldGUoJnBvcnQtPmluZm8uY21kX2NvbXBsZXRlKTsNCj4gPj4N
Cj4gPj4gV2hhdCBoYXBwZW4gaWYgdGhlIHJlbW90ZXByb2Nlc3NvciBhbnN3ZXIgYWZ0ZXIgdGhl
IGNvbXBsZXRpb24gdGltZW91dD8NCj4gPj4gQ291bGQgaXQgcmVzdWx0IGluIGRlc3luY2hyb25p
emF0aW9uIGJldHdlZW4gdGhlIHJlcXVlc3QgYW5kIHRoZSBhbnN3ZXI/DQo+ID4NCj4gPiBJZiB0
aGUgcmVtb3RlIHByb2Nlc3NvciByZXNwb25kcyBhZnRlciB0aGUgdGltZW91dCwgdGhhdCBsYXRl
IHJlcGx5DQo+ID4gd2lsbCBiZSBpZ25vcmVkLiBUaGUgY3VycmVudCB0cmFuc2ZlciBzaG91bGQg
ZmFpbCB3aXRoIFRJTUVPVVQsIGFuZA0KPiA+IHRoZSBzdGF0ZSB3b27igJl0IGJlIGNhcnJpZWQg
b3ZlciBiZWNhdXNlIGNtZF9jb21wbGV0ZSBpcyByZWluaXRpYWxpemVkDQo+ID4gYmVmb3JlIGVh
Y2ggbmV3IHJlcXVlc3QsIHNvIGEgc3RhbGUgY29tcGxldGlvbiB3b27igJl0IGRlc3luY2hyb25p
emUgdGhlDQo+ID4gbmV4dCB0cmFuc2FjdGlvbi4gRWFjaCBjb21tYW5k4oCTcmVwbHkgY3ljbGUg
aXMgaXNvbGF0ZWQsIHNvIGEgZGVsYXllZCByZXBseQ0KPiBjYW5ub3QgY29ycnVwdCBvciBtaXgg
d2l0aCBhIHN1YnNlcXVlbnQgcmVxdWVzdC4NCj4gDQo+IEkgbWlzc2VkIHRoZSByZWluaXRfY29t
cGxldGlvbi4gSW5kZWVkLCB0aGF0IHByZXZlbnRzIGlzc3VlIGlmIHJlcGx5IGFycml2ZSBhZnRl
cg0KPiB0aGUgdGltZSBvdXQuDQo+IA0KPiBUaGF0IHNhaWQgYSBzZWNvbmQgcmVxdWVzdCBjYW4g
YmUgc2VudCBiZWZvcmUgdGhlIHJlbW90ZSBwcm9jZXNzb3IgcmVzcG9uZHMgdG8NCj4gdGhlIGZp
cnN0IG9uZToNCj4gLSByZXNxdWVzdCAxIHNlbnQgdG8gcmVtb3RlcHJvY2Vzc29yLg0KPiAtIHRp
bWVvdXQgb2NjdXJzDQo+IC0gcmVxdWVzdCAyIHNlbnQgdG8gcmVtb3RlIHByb2Nlc3Nvcg0KPiAt
IHJlcGx5IG9mIHJlcXVlc3QgMSByZWNlaXZlZA0KPiANCj4gV291bGRuJ3QgdGhpcyBsZWFkIHRv
IGEgZGVzeW5jaHJvbml6YXRpb24gYmV0d2VlbiByZXF1ZXN0cyBhbmQgcmVwbGllcz8NCj4gSSBk
byBub3Qgc2VlIGEgbWVjaGFuaXNtIHRoYXQgd291bGQgcHJldmVudCB0aGlzDQo+IA0KDQpUaGVy
ZeKAmXMgYSBsb2NrIGluIHBsYWNlIHRoYXQgc2VxdWVuY2VzIHRoZSByZXF1ZXN0cywgc28gd2Ug
d29u4oCZdCBlbmQgdXAgd2l0aCB0d28gcmVxdWVzdHMgDQpydW5uaW5nIGluIHBhcmFsbGVsLiBJ
ZiByZXF1ZXN0IDEgaGFzbuKAmXQgY29tcGxldGVkIHlldCwgcmVxdWVzdCAyIHdvbuKAmXQgc3Rh
cnQuDQoNCj4gPg0KPiA+Pg0KPiA+PiBIYXZpbmcgYSBjbWRfY291bnRlciBpbiBncGlvX3JwbXNn
X2hlYWQgY291bGQgaGVscCB0byBpZGVudGlmeQ0KPiA+PiBjdXJyZW50IHJlcXVlc3QgYW5kIGFu
c3dlcg0KPiA+Pg0KPiA+PiB0aGUgdXNlIG9mIHJlaW5pdF9jb21wbGV0aW9uIGNvdWxkIGJlIGFs
c28gbmVlZGVkDQo+ID4+DQo+ID4+PiArICAgICB9IGVsc2UgaWYgKG1zZy0+aGVhZGVyLnR5cGUg
PT0gR1BJT19SUE1TR19OT1RJRlkpIHsNCj4gPj4+ICsgICAgICAgICAgICAgZ2VuZXJpY19oYW5k
bGVfZG9tYWluX2lycV9zYWZlKHBvcnQtPmdjLmlycS5kb21haW4sIG1zZy0NCj4gPnBpbl9pZHgp
Ow0KPiA+Pj4gKyAgICAgfSBlbHNlDQo+ID4+PiArICAgICAgICAgICAgIGRldl9lcnIoJnJwZGV2
LT5kZXYsICJ3cm9uZyBjb21tYW5kIHR5cGUhXG4iKTsNCj4gPj4NCj4gPj4gQ291bGQgeW91IHBy
aW50IHRoZSBtc2ctPmhlYWRlci50eXBlIHZhbHVlIHRvIGhlbHAgZm9yIGRlYnVnPw0KPiA+Pg0K
PiA+DQo+ID4gU3VyZS4gV2lsbCBhZGQgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+DQo+ID4+PiAr
DQo+ID4+PiArICAgICByZXR1cm4gMDsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGlj
IGludCBycG1zZ19ncGlvX2NoYW5uZWxfcHJvYmUoc3RydWN0IHJwbXNnX2RldmljZSAqcnBkZXYp
IHsNCj4gPj4+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZycGRldi0+ZGV2Ow0KPiA+Pj4g
KyAgICAgc3RydWN0IHJwZGV2X2RydmRhdGEgKmRydmRhdGE7DQo+ID4+PiArICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wOw0KPiA+Pj4gKyAgICAgaW50IHJldDsNCj4gPj4+ICsNCj4gPj4+ICsg
ICAgIGlmICghZGV2LT5vZl9ub2RlKSB7DQo+ID4+PiArICAgICAgICAgICAgIG5wID0gcnBtc2df
Z2V0X2NoYW5uZWxfb2Zub2RlKHJwZGV2LCBycGRldi0+aWQubmFtZSk7DQo+ID4+PiArICAgICAg
ICAgICAgIGlmIChucCkgew0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGRldi0+b2Zfbm9k
ZSA9IG5wOw0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNldF9wcmltYXJ5X2Z3bm9kZShk
ZXYsIG9mX2Z3bm9kZV9oYW5kbGUobnApKTsNCj4gPj4+ICsgICAgICAgICAgICAgfQ0KPiA+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gPj4+ICsgICAgIH0NCj4gPj4+
ICsNCj4gPj4+ICsgICAgIGRydmRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRydmRh
dGEpLCBHRlBfS0VSTkVMKTsNCj4gPj4+ICsgICAgIGlmICghZHJ2ZGF0YSkNCj4gPj4+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4+PiArDQo+ID4+PiArICAgICBkcnZkYXRhLT5y
cHJvY19uYW1lID0gcnBtc2dfZ2V0X3Jwcm9jX25vZGVfbmFtZShycGRldik7DQo+ID4+PiArICAg
ICBkZXZfc2V0X2RydmRhdGEoZGV2LCBkcnZkYXRhKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIGZv
cl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKGRldi0+b2Zfbm9kZSwgY2hpbGQpIHsNCj4gPj4+
ICsgICAgICAgICAgICAgaWYgKCFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKGNoaWxkKSkNCj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAg
ICAgICAgaWYgKCFvZl9tYXRjaF9ub2RlKGRldi0+ZHJpdmVyLT5vZl9tYXRjaF90YWJsZSwgY2hp
bGQpKQ0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+Pj4gKw0KPiA+
Pj4gKyAgICAgICAgICAgICByZXQgPSBycG1zZ19ncGlvY2hpcF9yZWdpc3RlcihycGRldiwgY2hp
bGQpOw0KPiA+Pj4gKyAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gPj4+ICsgICAgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWdpc3RlcjogJXBPRlxuIiwgY2hp
bGQpOw0KPiA+Pj4gKyAgICAgfQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgcmV0dXJuIDA7DQo+ID4+
DQo+ID4+IHJldHVybiByZXQNCj4gPj4gb3IgaW5kaWNhdGUgd2h5IHRoZSByZXR1cm4gb2YgcnBt
c2dfZ3Bpb2NoaXBfcmVnaXN0ZXIgaXMgbm90IHRha2VuDQo+ID4+IGludG8gYWNjb3VudA0KPiA+
Pg0KPiA+DQo+ID4gcnBtc2dfZ3Bpb2NoaXBfcmVnaXN0ZXIoKSBmYWlsaW5nIG9ubHkgYWZmZWN0
cyB3aGV0aGVyIHRoZSBHUElPDQo+ID4gaW5zdGFuY2UgZ2V0cyBjcmVhdGVkLiBUaGUgcnBtc2cg
Y2hhbm5lbCBkcml2ZXIgaXRzZWxmIGNhbiBzdGlsbCBwcm9iZQ0KPiBzdWNjZXNzZnVsbHkgYW5k
IGNvbnRpbnVlIHRvIG9wZXJhdGUgZm9yIG90aGVyIGZlYXR1cmVzLg0KPiANCj4gVGhpcyBpcyBu
b3Qgc2FmZSwgYnkgZGVmYXVsdCB5b3UgaGF2ZSB0byBleGlzdCB3aXRoIGVycm9yIGlmIHNvbWV0
aGluZyBmYWlscywgZW5zdXJpbmcNCj4gdGhhdCBhbGwgcmVzb3VyY2VzIGFsbG9jYXRlZCBkdXJp
bmcgdGhlIHByb2JlIGFyZSByZWxlYXNlZC4NCj4gSWYgdGhlcmUgaXMgYSBzdHJvbmcgcmVhc29u
IHRvIG5vdCBkbyB0aGlzIHlvdSBoYXZlIHRvIGV4cGxhaW4gdGhlIGV4Y2VwdGlvbiBpbiBhDQo+
IGNvbW1lbnQuDQo+IA0KDQpJIHdvdWxkbuKAmXQgc2F5IGl0IGlzIG5vdCBzYWZlLiBUaGUgYmVo
YXZpb3IgaGVyZSByZWFsbHkgZGVwZW5kcyBvbiB0aGUgcG9saWN5IHdlIHdhbnQgZm9yIHRoaXMg
DQpkcml2ZXI6IGVpdGhlciBmYWlsIGZhc3QgKG9uZSBmYWlsdXJlIGNhdXNlcyB0aGUgZW50aXJl
IHByb2JlIHRvIGZhaWwpIG9yIGJlc3TigJFlZmZvcnQgKGNvbnRpbnVlIGV2ZW4gDQppZiBzb21l
IHBhcnRzIGZhaWwpLiBCb3RoIGFwcHJvYWNoZXMgY2FuIGJlIHZhbGlkIGFzIGxvbmcgYXMgdGhl
IGxvZ2ljIGlzIGNvbnNpc3RlbnQuDQoNCj4gPg0KPiA+Pg0KPiA+Pj4gK30NCj4gPj4+ICsNCj4g
Pj4+ICtzdGF0aWMgdm9pZCBycG1zZ19ncGlvX2NoYW5uZWxfcmVtb3ZlKHN0cnVjdCBycG1zZ19k
ZXZpY2UgKnJwZGV2KSB7DQo+ID4+PiArICAgICBkZXZfaW5mbygmcnBkZXYtPmRldiwgInJwbXNn
IGdwaW8gY2hhbm5lbCBkcml2ZXIgaXMNCj4gPj4+ICtyZW1vdmVkXG4iKTsgfQ0KPiA+Pj4gKw0K
PiA+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJwbXNnX2dwaW9fZHRfaWRz
W10gPSB7DQo+ID4+PiArICAgICB7IC5jb21wYXRpYmxlID0gInJwbXNnLWdwaW8iIH0sDQo+ID4+
PiArICAgICB7IC8qIHNlbnRpbmVsICovIH0NCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gK3N0
YXRpYyBzdHJ1Y3QgcnBtc2dfZGV2aWNlX2lkIHJwbXNnX2dwaW9fY2hhbm5lbF9pZF90YWJsZVtd
ID0gew0KPiA+Pj4gKyAgICAgeyAubmFtZSA9ICJycG1zZy1pby1jaGFubmVsIiB9LA0KPiA+Pg0K
PiA+PiBJIHdvdWxkIHJlbW92ZSB0aGUgIi1jaGFubmVsIiBzdWZmaXggdG8gaGF2ZSBzaW1pbGFy
IG5hbWluZyB0aGFuDQo+ID4+ICJycG1zZy10dHkiIGFuZCAicnBtc2ctcmF3Ig0KPiA+Pg0KPiA+
DQo+ID4gVGhlIGNoYW5uZWwgbmFtZSBjb21lcyBmcm9tIHRoZSByZW1vdGUgZmlybXdhcmUsIHNv
IHdlIGNhbuKAmXQgZnJlZWx5DQo+ID4gcmVuYW1lIGl0IG9uIHRoZSBMaW51eCBzaWRlLiBPbiBp
Lk1YIHBsYXRmb3JtcyB0aGUgZmlybXdhcmUgZm9sbG93cw0KPiA+IGl0cyBvd24gbmFtaW5nIGNv
bnZlbnRpb25zLCBhbmQgdGhlICotY2hhbm5lbCBzdWZmaXggaXMgcGFydCBvZiB0aGF0IHNjaGVt
ZS4NCj4gDQo+IEFzIEFuZHJldyBtZW50aW9uZWQsIGluIG90aGVyIHdvcmRzLCB5b3UgY2Fubm90
IGV4cGVjdCB0byBpbXBvc2UgdXBzdHJlYW0NCj4gY29uc3RyYWludHMgYmFzZWQgb24geW91ciBk
b3duc3RyZWFtIGxlZ2FjeS4gWW91ciBsZWdhY3kgZmlybXdhcmUgd2lsbA0KPiBjb250aW51ZSB0
byBiZSBzdXBwb3J0ZWQgYnkgeW91ciBsZWdhY3kgTlhQIHJwbXNnIEdQSU8gZHJpdmVyLg0KPiAN
Cj4gTW9yZW92ZXIsIGNoYW5naW5nIHRoZSBuYW1lIG9mIHRoaXMgcnBtc2cgY2hhbm5lbCB3aWxs
IGhlbHAgeW91IGhhdmUgYm90aA0KPiBkcml2ZXJzIGNvZXhpc3QgaW4geW91ciBkb3duc3RyZWFt
IGtlcm5lbC4NCj4gDQoNClRoZSBpZF90YWJsZSBjYW4gc3VwcG9ydCBtdWx0aXBsZSBjaGFubmVs
IG5hbWVzLCBzbyB3ZSBkb27igJl0IGhhdmUgdG8gY2hvb3NlIG9ubHkgb25lLiANCk91ciBkcml2
ZXIgZGVwZW5kcyBvbiB0aGUgY29tcGFueeKAmXMgSVAsIHdoaWNoIGhhcyBiZWVuIHdpZGVseSBk
ZXBsb3llZCBieSBvdXIgY3VzdG9tZXJzLCANCnNvIHdlIHN0aWxsIG5lZWQgdG8ga2VlcCBzdXBw
b3J0aW5nIHRoZSBleGlzdGluZyBjaGFubmVsIG5hbWUgdXNlZCBvbiBpLk1YIHBsYXRmb3Jtcy4N
Cg0KQXQgdGhlIHNhbWUgdGltZSwgd2UgY2FuIGFkZCB0aGUgc3VnZ2VzdGVkICJycG1zZy1pbyIg
ZW50cnkgdG8gdGhlIHRhYmxlIHNvIHRoZSBkcml2ZXIgd29ya3MgZm9yIA0KYm90aCB0aGUgZ2Vu
ZXJpYyB1c2UgY2FzZSBhbmQgaS5NWCBwbGF0Zm9ybXMuDQoNClRoYW5rcywNClNoZW53ZWkNCg0K
PiBSZWdhcmRzDQo+IEFybmF1ZA0KPiANCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gU2hlbndl
aQ0KPiA+DQo+ID4+IFJlZ2FyZHMsDQo+ID4+IEFybmF1ZA0KPiA+Pg0KPiA+Pj4gKyAgICAgeyB9
LA0KPiA+Pj4gK307DQo+ID4+PiArTU9EVUxFX0RFVklDRV9UQUJMRShycG1zZywgcnBtc2dfZ3Bp
b19jaGFubmVsX2lkX3RhYmxlKTsNCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgc3RydWN0IHJwbXNn
X2RyaXZlciBycG1zZ19ncGlvX2NoYW5uZWxfY2xpZW50ID0gew0KPiA+Pj4gKyAgICAgLmRydi5u
YW1lICAgICAgID0gS0JVSUxEX01PRE5BTUUsDQo+ID4+PiArICAgICAuZHJ2Lm9mX21hdGNoX3Rh
YmxlID0gcnBtc2dfZ3Bpb19kdF9pZHMsDQo+ID4+PiArICAgICAuaWRfdGFibGUgICAgICAgPSBy
cG1zZ19ncGlvX2NoYW5uZWxfaWRfdGFibGUsDQo+ID4+PiArICAgICAucHJvYmUgICAgICAgICAg
PSBycG1zZ19ncGlvX2NoYW5uZWxfcHJvYmUsDQo+ID4+PiArICAgICAuY2FsbGJhY2sgICAgICAg
PSBycG1zZ19ncGlvX2NoYW5uZWxfY2FsbGJhY2ssDQo+ID4+PiArICAgICAucmVtb3ZlICAgICAg
ICAgPSBycG1zZ19ncGlvX2NoYW5uZWxfcmVtb3ZlLA0KPiA+Pj4gK307DQo+ID4+PiArbW9kdWxl
X3JwbXNnX2RyaXZlcihycG1zZ19ncGlvX2NoYW5uZWxfY2xpZW50KTsNCj4gPj4+ICsNCj4gPj4+
ICtNT0RVTEVfQVVUSE9SKCJTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPiIpOw0K
PiA+Pj4gK01PRFVMRV9ERVNDUklQVElPTigiZ2VuZXJpYyBycG1zZyBncGlvIGRyaXZlciIpOw0K
PiA+Pj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPg0KDQo=

