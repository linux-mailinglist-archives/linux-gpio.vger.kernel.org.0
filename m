Return-Path: <linux-gpio+bounces-32142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBoLOV7YnWk0SQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:57:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A418A2B6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B938308D76E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB293A4F54;
	Tue, 24 Feb 2026 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gK9jV1Gy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86413A8FE0;
	Tue, 24 Feb 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952217; cv=fail; b=sXnK6Lz2JL60TSkxkKDK0WDZS2fc2MS8rlgDOsQbkHrU4JcDLMHRnJ53uWYSClEdvssKCpnMjzNMgi3C8x2rzWZ+teQOvZMhwt9YAd/UViaJ0DsGozTyjGHPd+9eHEV7njJXjUOaPHcsR01ant9plkY3w3HTbug1XcTNo/vJrq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952217; c=relaxed/simple;
	bh=25IY6vCVop+2wnPeeeHiJj7tpzVIA+bVcbDnldbtMUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hqGqBxtsuwa8CDAOEULeQICpczDDifC/GodIDxo8EG7rIgcELRys7EA3TTAy1zB1qcFo5OV0nwZXjDrtTqU2OlGBkq38wQajsYJwntkYWWJU5Q0u2fFa5NB+x8zbCAqTf9JnYJ8pr0KovrFSekMkhG11bbjigFIFxlB3Xpp0X4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gK9jV1Gy; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRdKnnw4N9ytIv0RhZWwsvoaLbSz2YH5fZQOvVgfeHe4Ikce72fPlC6pY1HAxrNyeF8lbC4EUsMPy+lU6BmVc9Oc1p5FDaIxkg7IfVmcnw9Wqy4EKm3j5Q365WKYp38zq2OlBh2/OI0d+c8BtCXTtefSLzgTnWWgn/450LbktECHSDbfCW3bEN6c6q3comi5CH8K8YRPggUmOJb1WfSrcZMeRGn5kkcg3RIwfw/uLAS3tsfSWB+MI+jW9IWOr/QMFzrhCLtDMVNHPuDgKTP5ZB+WQvaLuOeAlWmcqi+MlsgUr4PdLNMxI7RT5oI0vicI/DZd54zetP2uhdxurxt7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25IY6vCVop+2wnPeeeHiJj7tpzVIA+bVcbDnldbtMUU=;
 b=Xe7Ankvpv0ywmLrogbBdct1H3zB2/ni0A8x/yVfLUC/lf/ZndhiNkhBNopRf6n8/b1EQiL91coC4aPZ0ZXfBNMEZ/6HP87GfOvoe/Kl1WHgE0yrohksxVbiK7ZZ74CQMZUMNKII+vQ6ZR5yKuSce6mxfvMKquTlDTPUPzBvUZL3aSdHGr3YnQr14w4P8JvTpQ/d2YfAE/LJvWEUj4Z7FENfSCKVtUpjiqJvVIYEdl5rS6urIVKJa+dbuNU8zsU0Fxu1nG7iTk6+gLl2MTG7g0tltuAjxDXmZvQMHV9FDp7SVHGkht5NhIc4ZlnRcm8GkJyY9c2NvlCaHo7KeddS3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25IY6vCVop+2wnPeeeHiJj7tpzVIA+bVcbDnldbtMUU=;
 b=gK9jV1GysvzupbRrBzynHKDWgHsSihJMTailiZ4ZVpGUrsrBV6Dg7CS58M2H3nGnplPh8YHknhmFAQKDkqoBJgrO36XuhDQjMNiZ+WzuHPTT+5FOiOJm0tqnZGSzxnuPnrFCNrvydS2VXtqahXvdecSIxyOJoke/LZnNFT1a8Xp3uAFNnWA+UCSU8RrBllXYFjWLOB+LPkNN7yl3MmfOOpYj3DCWfnvuSwIsoGkWS6JKQXVODgbCApB7sFHWWjQLzSsSf10GjwfQfSNMqQHCx1H2fz8KDsvDOZoUPt+TeExBKX9BMdB1oWM9gA3v+iP4aKf06G9SNGniQXXz2gwakw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA1PR04MB10604.eurprd04.prod.outlook.com (2603:10a6:102:48e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:56:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:56:51 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li
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
Subject: RE: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpaYtdzi2pyWaOEmnCqo0H3Nut7WSAy+AgAAMHjA=
Date: Tue, 24 Feb 2026 16:56:51 +0000
Message-ID:
 <PAXPR04MB9185D672825E39E1ADD199968974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c024e8d2-858f-4a88-ae38-17b8c5e830e9@oss.nxp.com>
In-Reply-To: <c024e8d2-858f-4a88-ae38-17b8c5e830e9@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA1PR04MB10604:EE_
x-ms-office365-filtering-correlation-id: a5406f4c-3bfc-4bbf-4b8b-08de73c5b534
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlZoNEw3V0U3RXdpa2VFbFVDQnZaTENINkwwMkxnV2plck4wSzlnSDBycWhh?=
 =?utf-8?B?NDVZMTJOb3RDelhVV2Vwby9qZU50NmpEbFhuWmJjVGRLbUppMnZwcEJHOWNt?=
 =?utf-8?B?Q0FoeHorTEJyN3l0ZldRd282a2ZyMDdSeTRNazcrMWtYZVhJWFBvWWIzMHZ2?=
 =?utf-8?B?TWdpN0NKMzNNRFpEQ3BQTVdWNUsrU2tuMk1sb1BkYnprWXNMS1lwalkyVEtt?=
 =?utf-8?B?NE5PZ2NyQzRXNWY4QjRvSldHSFViQUNrb2RLU3IwSnhHajZ3eERpaXVEVjFP?=
 =?utf-8?B?Z0d3L053WE1XZjNNWi85NnBNWDRMZkJFcmdRRVBhY0N6aWhkc1ZnTGFYUVps?=
 =?utf-8?B?RGp3SFlyTGlVNzZVVnhVcmNQR0JJYU5rRXpKdlF3Rmh5Y2hDZ2ZsS0o1dHJN?=
 =?utf-8?B?L1N4Z0JxaEV0NjJtaGJoOG1FRmlmN3dPMFF0QjhBcDRiL2l6dHBEYW1STXFm?=
 =?utf-8?B?OXY2WUhNSkgyelc1enl1YldvOU5iWUluREdNWUtsS01reFN2RkduMGtqRFFD?=
 =?utf-8?B?RGJ5dDVIc2hLRGdUZkdoZTdGV1hWK1NHK0NTWWErdzhqNjRNZEZTOThkZFlw?=
 =?utf-8?B?ZmVYWVR4TnJnNENOZzBQd28vZFIvaU9uamZ0QlMrbDdpMElVZE13TE5zYk9u?=
 =?utf-8?B?TkNYalBKQjFSdUcvVVlabVdlTk04OFJ3T2Fac2pSeUgrWTNNeWF6cnZuaWx2?=
 =?utf-8?B?WG90Y1RRS2dqMWd0MFFvZGd4WnVLUkVFRVUvd0M4VFh3RG84S1pGNHlYVlFK?=
 =?utf-8?B?UFF1ckN2QnlUNFlrOWZVZVJMM21aSUZHZmlsbmx0SHRQK1ZRaUpZNXoxZHF6?=
 =?utf-8?B?cS9JcEs3NGNwVzBreVlaWFl5NHAzcmxtSEt4RFgrdXg3MmhNVUp6Wm9YMTV0?=
 =?utf-8?B?akFEeDlDK0hxS1RFa2xLTTNDdlpnOGU1dC84WlV0NStrZUJCdHZFdFRvRmFy?=
 =?utf-8?B?T2xwMEtYU0JTc1pqajV4SkNCbG5PNjZPSXlIcTVxMlVuelNXcXNxL0JwOVFr?=
 =?utf-8?B?MHVhS1hIVnFYNlVPYU9HejlZUkNEOHFnL1hJZ0I1QnhIQ095dmQyZXcwTVQ5?=
 =?utf-8?B?aWJUOEtuMGhRZGRSaFNpNVhvbEY5T1B3WDB0YmZoT3FZcWNmQmhSTWdGckRu?=
 =?utf-8?B?ZFVqSm5CSi9uSkpoWnRzSU0rdTZoUWZGZE5NVkRzbFdGaHFneWw1UkUzT1hw?=
 =?utf-8?B?blpaaktROS9lZmx1ck9iNmd1WlZyQTZyK1ZPMTJUTUVXMkpwd0lDNTFjVFRr?=
 =?utf-8?B?NGVsbDNRdDV5cWJIR2tvN0t1RXQzYmp5QzdabWRzRDg5RTRURHBBaXhhSXli?=
 =?utf-8?B?TVBHVlp2anVJS21yZ1hOYkx1M1dabVNiQVpnaW1iREdtamRjaVlWSlkrQXBT?=
 =?utf-8?B?bVh4TGVRNDVtbzZXbG1tZUY0VTJ2WkdZZFd4T1dpK0dZN2R4L0tSMGZ5VE9w?=
 =?utf-8?B?RU5tUU4wUmpHRjJMb05ERnZLd25qK1lsTmRVMEgwcWViU29kNXZiZUpCSW10?=
 =?utf-8?B?VDBMcGRtUVg1YTN0K0VWYSttNmY1OTR0NFlObGl6c2krclFBeCtrTDBPa2tU?=
 =?utf-8?B?RGd0UUdQeEhUOXdvSHluaFY5S2hJY2FPN0VKWkd3cEgzNDFPeXp2dlU2VDdN?=
 =?utf-8?B?azJVS29Gc2pQSkRlRFhvOCtnM1M4eEY2M2liU0pNSXozSjFHVldtYmpUMFdG?=
 =?utf-8?B?YlJVV2lSOEcxUUlHSi9NWG1rc0kzUTBGRUhXNnBKME93UEJlei9JWVR1cWxh?=
 =?utf-8?B?WmZPbDZLM0tmdHprRGtLY1p3dm9mZWxZVlp3NzBSQkt3ZmZPS2YzclhmMGRo?=
 =?utf-8?B?UGY1MzBPSXhPTm03OGplcHNjNTVFOHdJSVBuZCtXcVJacVFQS0Viekhaa2Vw?=
 =?utf-8?B?eFp1UStsN3EzZXdtMUdrQ05OUnEveDBKY2tRQm1hSWdycHU1eE42dmwydGdw?=
 =?utf-8?B?dEEvd1ZVa0ltQnRhQVhQcDBRSGh1ZWQvOU0wUEU1ckZHYjJGNGhzZlJmVXhn?=
 =?utf-8?B?cnVFMEt2bTE1YkswSFdkSGtuZU16YW5QSmRVbVRBSmtTRG1CQVd2bGRwYmJ2?=
 =?utf-8?B?c1J0NGt0d09mZTlNWXloTDNVTUJxam1mUXB4SElUeXRwYVUyNGJzcW80eW1G?=
 =?utf-8?B?a3MrQVd6SmsxSkJrcnFma3dkdWlxbG91NFZ3MHBaOG04aFJlN3lDSFNMMVls?=
 =?utf-8?Q?q4+asWnAivfKGCfWlDYuh3Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHo4cDEwZVNxcjE4V0xyN05LRDRzbHJaS3hqUEowZXdpSnVjQmhPOWpEOUhT?=
 =?utf-8?B?bzZ0c0tKWFZWTTJHS1BXQzZveVluOGFvdEY2RnJwNUtVSlRZRVRlYWJPcTBD?=
 =?utf-8?B?QmI5YzVkQkdOMFljV3VQNGo1dU9IekZzOEg1YmdKaTF1ZEtHcnV2SnVjREls?=
 =?utf-8?B?c2hpTHlWVDR2UHF2QVdnZ2RyUjJNdmpsbVRXU1RFSHBVaXdkbjczNmNOR0hL?=
 =?utf-8?B?MVdxRjF4RmltV1dSUXI1OHlUTVFYemlrY1VnVDBoMzQ5b3BQVlNpVEV5Z2tv?=
 =?utf-8?B?SVRaRktZbXNZdUJRdmJSYi80S1pIYytjZlpQKzBLaTFpdGdHR21od05Ka3Qr?=
 =?utf-8?B?d09tOGlYdzl2Zm91TmR4TmFmMHZxdjlQSVU5dnBxNy94WDB3Q2xMMHF0UXU0?=
 =?utf-8?B?bzJIZG1ha25wTDdKQ2JWcGkxTkFabkVVQlVaMkczQ3ZEYnBxcWZ6c1NjWHBD?=
 =?utf-8?B?dU5Zd0I2Q1VzVjB1YzVHL2pVY3BjUWg3MlFubnE1QXFCVTIybE9yTnNTZk8w?=
 =?utf-8?B?aTBQR3IweEdCYmwvQy9ueFRaTWNGK1g3YWI2YWplVExrc29VYUhLL21CdGxm?=
 =?utf-8?B?dnpSYjFnMnExR3lvV21QZnA2TmswQ3FSSXBxTEYvbGR6bi9GQ2JVTzF1RWk5?=
 =?utf-8?B?cFdPRG5hOUpqTGZzSnVtYzZsZzBQUCtkUFB3OS9qSlRRK25MczFKN2N5eHA4?=
 =?utf-8?B?bWJBUVR3UmtrNnIyTHFFenU3clhib0VsN3kzN0NkdUM3THJvMnozb2hndXpZ?=
 =?utf-8?B?VzFXbkNvNkczL2dCNlA0eW82ZG5KL1F6c21qNUkwci8vTHNJb09abjhocWcy?=
 =?utf-8?B?QVM0cHh2allWaG1UMGNRenFvWklYSDgwMEhacEx3Vm5tQWR0REdENVR3elUx?=
 =?utf-8?B?Q1FDM0c0R0NQOVVab3hHWUlEV1V3Q3VlcTVDYUtHY0psUndQbGJ5QytER2hz?=
 =?utf-8?B?N3NnMjlUZlFMK1dENG42NmZ1MGNDU3NCL3VtTmxCRGlsd0lIT2swS2Zid3o2?=
 =?utf-8?B?bzdsMlNsUCsvbkhIbDVLRzQ5TXdBZEUxbE9WbkM0OFhkTi95TE1KYTIvZHlr?=
 =?utf-8?B?NUljUXVGbjdMMkF4VXMzVVRZNlJtZUdZMDhPK1hkODZQWWxhdDI1c1U4UzJ6?=
 =?utf-8?B?cjhQaHB1eVhHOXZETm43eVlZSEZZR252a2RKRXV3NzVhbTJFeFZtN1N4TUls?=
 =?utf-8?B?WVV4OTRUUHV2Y1N6R2FOWWZWQ25TU2pUaW9tS1Z1ZmoycXlBMWp0OEx0RHBu?=
 =?utf-8?B?YXNhVW1ESTA3V2lVeEF3OWhyRDB5YzExSlo2VjN1THRxRHRiS0J5VHIwWGlm?=
 =?utf-8?B?YUdHTkNSbUVsdzZhV0RyOFFnbitEeXIrdDlpTmNGZFAzQlV3OHhWVEZrTEVp?=
 =?utf-8?B?bWhxOXMvM2phM0pMeUg3SkhsUjJqOWh5KzR6SC94RGZkdStZREcrOTBQeENp?=
 =?utf-8?B?d0lWejhxcjYrL0o0NGY0dWYxb3F6Nm42akpmVXNHVnBSRjkrQ29sR2tnSTlk?=
 =?utf-8?B?Y1pWUC9TUVp5YUlYeFR5UHMwbDV6cmQ1RzYwVzBrUUZWNjVSZS9KREx6enR5?=
 =?utf-8?B?MkQ2emdYNGhLQXprS3JIaVpoYzBsaklrRFVNL2dONWx4aHNiVisrUnc3OS9l?=
 =?utf-8?B?RWRKSkNkcktqcHQyN0ZxanZZMFFwUWp5T3lYRk9OTmJSbjZYNmZuK0FMMytV?=
 =?utf-8?B?Rmdmb09MdDVnRHVlamZUeGVkMUV3dzdDKzc2STFYUmZvaC93cWJBYmQ2Vkwr?=
 =?utf-8?B?RjU5NDMyWEh4T2dLNDExWHBiVmVPVDR4L3VsOVpDNGlwYlhrd2hsVVlXYk5N?=
 =?utf-8?B?RndVc0VTM0hMcUxoYmlFRm5CVUw2SGVOcE9pWFg0dGlSbDRIRjluelFvS3I0?=
 =?utf-8?B?TTFxaUlkMnE2b0RqaE1USE5kdkUwRnduZFVKZTlQUENRYjVUWXdqc0pvWHlO?=
 =?utf-8?B?T3pIend2d29iYXdJSlN1a3Z3NFl5dHBLRktpWC9TeGpiT2hqc0lFKzY4L1Ja?=
 =?utf-8?B?M0RNakpocnBybExwSlkySnlVWHNpNmNCa3h3UnJuSGFCbXFjdllQVFY1NDFO?=
 =?utf-8?B?djV2elVGcUlySk5qelpCTCtNQlRmZTFnMnlOczZ0dUtIQml3cUlZYjJiNjRR?=
 =?utf-8?B?ZkhFaGdEZyt3VEZxRCtDYlBwb0ROMFlnR1IrQ0krc1VIbDdmSDBQdGM3cWsr?=
 =?utf-8?B?aDdzMUs2aXNsV1h6bitMUG1DbnlJZGpwbmo4ZDZKUUttMlJGdnZsRjliS2sw?=
 =?utf-8?B?SHk1VkJCeXpsZnlZRHl3TEVFNS9ZTGl2K21QVW1hVTdDMzB0OEliZnhISm0w?=
 =?utf-8?B?MVdFN0F6TGU1dUN1T0NJSDlQQ29kc2hCMDJranRQdW0rMyt2c3Jvdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a5406f4c-3bfc-4bbf-4b8b-08de73c5b534
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 16:56:51.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciKsYYQD6QILoAwiwjt6Bmir6nnewm4rFvkbz5GGtzWcQ/QLKtVlswp4aSwVQk5EPDnaBQksY7FjBE2gXH4H0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10604
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
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32142-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.973];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C5A418A2B6
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIEJhbHV0YSAo
T1NTKSA8ZGFuaWVsLmJhbHV0YUBvc3MubnhwLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVh
cnkgMjQsIDIwMjYgMTA6MDQgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54
cC5jb20+OyBCam9ybiBBbmRlcnNzb24NCj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgQXJuYXVk
IFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gQ2M6IExpbnVzIFdh
bGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsgQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsg
QmFydG9zeg0KPiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNv
bm9yK2R0QGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5h
cm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuDQo+IDxza2hhbkBsaW51eGZvdW5kYXRp
b24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZW5ndXRyb25peCBLZXJu
ZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2
YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOyBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQmFydG9zeg0KPiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAzLzRdIGdwaW86
IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiANCj4gT24gMi8yNC8yNiAx
Nzo1NiwgU2hlbndlaSBXYW5nIHdyb3RlOg0KPiA+IFRlY2huaWNhbGx5LCB5ZXPigJRpdCdzIHBv
c3NpYmxlIHRvIHVzZSB0aGUgdmlydGlvIG1lY2hhbmlzbSBkaXJlY3RseSB3aXRob3V0DQo+IHJw
bXNnLg0KPiA+IEl04oCZcyBhIGJpdCBsaWtlIHRhbGtpbmcgc3RyYWlnaHQgdG8gdGhlIElQIGxh
eWVyIHdpdGhvdXQgaW52b2x2aW5nIFRDUA0KPiA+IG9yIFVEUDogZG9hYmxlLCBidXQgYXQgYSBs
b3dlcuKAkWxldmVsIGFwcHJvYWNoLg0KPiA+DQo+ID4gQXMgZm9yIHRoZSBpZGVhIG9mIGdwaW/i
gJF2aXJ0aW8sIHdoaWNoIGNvdWxkIGJlIGFuIG9wdGlvbmFsIHNvbHV0aW9uDQo+ID4gdGhhdCBj
ZXJ0YWluIGN1c3RvbWVycyBtaWdodCBwcmVmZXIuIEkgcmVjYWxsIGhlYXJpbmcgdGhpcyBpZGVh
IGZyb20NCj4gPiBNYXRoaWV1IG9yaWdpbmFsbHksIHRob3VnaCBJ4oCZbSBub3Qgc3VyZSB3aGV0
aGVyIGhlIHBsYW5zIHRvIGltcGxlbWVudCBpdC4NCj4gDQo+IGdwaW8tdmlydGlvIGlzIGFscmVh
ZHkgdXBzdHJlYW0gaW4gZHJpdmVycy9ncGlvL2dwaW8tdmlydGlvLmMNCj4gDQoNCknigJltIG5v
dCBhbiBleHBlcnQgb24gdmlydGlvLCBidXQgaGF2aW5nIHRoZSBncGlv4oCRdmlydGlvIGRyaXZl
ciB1cHN0cmVhbSBvbiB0aGUgTGludXggc2lkZSBkb2VzbuKAmXQgDQpuZWNlc3NhcmlseSBtZWFu
IHRoZSBvdmVyYWxsIHNvbHV0aW9uIGlzIGNvbXBsZXRlLiBUaGUgcmVtb3RlIGZpcm13YXJlIHN0
aWxsIG5lZWRzIHRvIGltcGxlbWVudCANCnRoZSB2aXJ0aW/igJFHUElPIGJhY2tlbmQsIGV4cG9z
ZSB0aGUgdmlydGlv4oCRR1BJTyBkZXZpY2UsIGFuZCBoYW5kbGUgYWxsIG9mIHRoZSB1bmRlcmx5
aW5nIGhhcmR3YXJlIA0KaW50ZXJhY3Rpb25zLg0KDQpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
dGhpcyBmaXJtd2FyZS1zaWRlIGltcGxlbWVudGF0aW9uIGlzIHRoZSBwYXJ0IHdlIHdlcmUgaW50
ZXJlc3RlZCBpbi4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQoNCg==

