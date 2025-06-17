Return-Path: <linux-gpio+bounces-21679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC100ADBF6F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 05:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE92A1892C96
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 03:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DB2236A9C;
	Tue, 17 Jun 2025 03:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EM1jlLQi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0691ADC97;
	Tue, 17 Jun 2025 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129372; cv=fail; b=AF1I69IQxEcyZ0n9lnIbUvODHtYx6aHFNwa4FNLYJ3uZajjRGPdezixsm6qVftqMqChLikJKuddMpX5ryK2lTD8VdmK4H9EklVOlWLoAom7K2UmnqrAou+roqcbAI8DgTqZyzTW8RSLQBfdT+dy7wEKswRFbdaHQSFckaX4J9yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129372; c=relaxed/simple;
	bh=NT6NBCK8fd7GQQY3GehKczL3+DrICKfrTpjtvSk3Xyg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qPkdMS7mxA63VwolGDd+I+hk/FqRSdBK0sClQqoibxlKcgKPVVQoF+DibVn+Scdec2PBFrAXJoj20E7NL6ZeGySumP2mOttSXsG6uzyv8Bo+ks8aLx+niT3iogiFAPta/WQPBBmhBTDaPBQQwnP6o18YYXabhV9xszo8UYW7aEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EM1jlLQi; arc=fail smtp.client-ip=52.101.66.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8fIyh5mBAZ2FfdGGoOORJcBlSyMwIadD2J2Dfw9ExUgA8Xq6pzxnUbYJ2ttsDJF+3wOfmGfnVdKOfmK02z7b7Xneqlx8by8O4mTzZaGyOZwtZp19gfUwE0wShXdDooRCsJ0Ww4xevnYeU4wg1uFMoFG5cycUISah9lD/9UyCYCRYjRKg7ZWkPOkbDp9q5xsJOke4deCYguZRiwFfAZvYdHtXIUEoGV+7FeEc75cV19Kctni9YJIDBxkTgMOa6c8M7NELukM3c/OA5hMgORtMh7hyrpnR4dK3kBeHyTKshd/bUt4o5m02BjrcAd2XRrV5IU567EXOirz9GmAIQe7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT6NBCK8fd7GQQY3GehKczL3+DrICKfrTpjtvSk3Xyg=;
 b=WLcUpgEomrlXfYFON+sWRemK9hI5HAtvXQJD4CgKPsstat1Mqyw3BOF6h2TDC456gC7RBLgD9CF9Tb6cFxPjYuD9mE+jnJjrd/kPZvXVgnzAKKCJI5o+Uyg6HQUoU2dddRVDTJorvZ8pZdrN96FgjDLhvxSczUkACvJoWCZn4ako3GK6yOhrPGa2XsuavOFpNm/cHX5gloz19IbHH+NGN9/fd8IZQDMgEMGaS4arzft/ObWtCmVIhcp/ehFk8IBizzXPu4B2gLUXDD1tUcf+3AJMHA2pai+tr2C0z2NM3MUdJzLwpyEUAh7/EDvzia00wkNaK95Wp5Q6Of0/45D18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT6NBCK8fd7GQQY3GehKczL3+DrICKfrTpjtvSk3Xyg=;
 b=EM1jlLQi1uAWfkFGuaDTHlWZZZU3dRPdgrxIop6i1kGvCfV6WlrSqBG7eguMChMlaUsNSOp/QxbSQBFIvwdCk9em2i1NkvRGhIL//urlkKyNFK9LB7bGAmNPMYDL8t17N/js6x/ESlspx5bd/AHBMID3U0vzXSmEQTiwwkDj+qsWDc8RV99+tOOjGz86xp05p+YclcBO17EeARRiKK6e5F0G4idSE0sOWGljWBXddM59469Tl+fdaOre26aJ3ah1OPo5IL3HKEI0RxxmCx0i+bB67zbbSx0p9cuW32ae0g8cMibuMy8ZnUj0LzpItJ50wfxXhLcSCtCtOG2bisXXBg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB9254.eurprd04.prod.outlook.com (2603:10a6:102:2bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 03:02:47 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 03:02:47 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, "wahrenst@gmx.net"
	<wahrenst@gmx.net>, "conor@kernel.org" <conor@kernel.org>, Frank Li
	<frank.li@nxp.com>
Subject: RE: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Thread-Topic: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Thread-Index: AQHbyTmSS2ByNa3XwEy9ij0ftmJOsrQG1hIA
Date: Tue, 17 Jun 2025 03:02:47 +0000
Message-ID:
 <DU0PR04MB9496AB6D9DDBD83E07C8E0989073A@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PAXPR04MB9254:EE_
x-ms-office365-filtering-correlation-id: 476d81df-bbb4-4967-6e7c-08ddad4b701b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2RFZnl2TWlicFN3RTUwcms2YjdnTTJKYk1xeUtaL0NidnkycXM1SG1aSXF1?=
 =?utf-8?B?UU41bmM2eWFOV2JxTHR4dXdOZW5tOU8zN0NJeUxBdEJBNjRNeFRxcEh6eFBJ?=
 =?utf-8?B?citEVnNsY2RjQVEwc1ZwM0dYUEpvTlo2dzE2RGIySXlzeFFuYWxFSGU1SGhP?=
 =?utf-8?B?dDh2YkZWSUtxU1JkUkk5bVJ2NUkzamZFdCthTlVuZnluU2ZCclVnNXhwVWRC?=
 =?utf-8?B?MmZUZko3WXVBQ3VlcmZxUkZhSTE1QUtKcVpCSUJadmo1S0l1eUdLYkd4c0Y1?=
 =?utf-8?B?b1l0bmJNMnZKZUpuNzNtanVuT3A1NDMyZDBqOWpGdm1LV205Q1dKdGdibUxQ?=
 =?utf-8?B?SjhGKzhqVTZ3cks1SFNLY0tjeS90K2oyODFIakVGVUh0UmFPMFRHL2lHUkxm?=
 =?utf-8?B?WmZiNVVLODRkSktwMW9uYnUzMkZpQnlRRm1UaEN3WjJMNDZZc2VQU2dkWHhj?=
 =?utf-8?B?MmJ0YTl6aXNZSW4wcmtNTDNxdzVsdlFBNTJVUUY2S1Vmb24xV1kzak84VWVr?=
 =?utf-8?B?T2h6RFJmQ1JlNzJMdkNqbmszM1ZFR3VyU3BldDhQN1JWWitoRXByWktmemtF?=
 =?utf-8?B?UGpwbWNpeTBsRFdSZG5BR1dNOHZnNmRkRFMyclpwOEwyRU1rUkwveldFdmpX?=
 =?utf-8?B?SjJzcGMrZUZDMXRtc1p4TW1HdVF1MVhpeXdBWnZTd0pJdHFMcENqZkdqVmV4?=
 =?utf-8?B?TlFDd2FGeEJnam0zay9ab1AvN3A0cUtTMnBNRkgvV1VXZ2I5Y3h3S1dlQzky?=
 =?utf-8?B?NmlGWnZyMGNqOVg1MGQxNXlRNHlVQWFpVnk3Sndsay9EMzJDaG9pOU50WVAw?=
 =?utf-8?B?LzY5OWMwZnpscVU4TmRqdFJ5Y1JmMUpNZkpWQVVuNTNQS29VTWt0MmRaa0VX?=
 =?utf-8?B?Ull5NmRJMVR4MlVFSjUyVmdPRFliTk81dzI4UmpPWEdiUW83UlZtZ2ZBUTNh?=
 =?utf-8?B?UEdyV2ZtUEdEMXV3RS94VEpYcnV3MWJvYzRqRzV5bFZOL2xCQVZwNWYzQXZT?=
 =?utf-8?B?aG5qc2hUY1BSR2hUL1B4ZnU1LytpY0EzaHBrRjFOY2ljYW05U1FmZHFiMzg3?=
 =?utf-8?B?SWVzYkZKejVxVHVQUXBieDVGWm51UnJQWmhPRG9uMURBZENRQ0tPSlUrNWR6?=
 =?utf-8?B?d2lJL0h4QUhPVFlHN0U5N0pTRExhTHVPbjR3bGNFOTluR3Z0WGFLUWd6Ylpa?=
 =?utf-8?B?K0lObzVrZDVHcGZZb1hIY3dYUFFSVkNaUUNYV3hhR1lxQzU5OFQvc0ZPNFln?=
 =?utf-8?B?RVhZdEhld29IS3piL3creTRmNWJxUFcwbm9XcjRyek5ZM3RmaWMybzF3akNZ?=
 =?utf-8?B?cG54dWxNR3F5d1dkSVArTUJoY01ucndLalhkeldoQ1ZrZVBJeFcrTzBmaHB1?=
 =?utf-8?B?Ym9TdHpadysxQStTL0V5SGRPcXFIdFdnS0lBa3M2b0hLNVp0Y0M1eUxyVTU4?=
 =?utf-8?B?QVZESVNWTWQzOFNlTy81TVBrZjVGZ1Z4QThKejhKWkxyaStwMldlYzRZNGVm?=
 =?utf-8?B?ZGRTUmRqOGJVME1FZmI2K2orcERDN3o5Wjl6OUpJekFCVEpJUEFCbU9UYTRN?=
 =?utf-8?B?OEc1eHRzWFIxdXhPSjg2MHB6eDlVTm0vNGVra0hBNi9rT040YVpuTStaN2xo?=
 =?utf-8?B?ZnRJZm5FRWpqUnpGMTR0a1lsY2U4RDAvVkZyV3hESDUrMWhKU1JIdnRpd2I2?=
 =?utf-8?B?OCtGR0tPZTJick5haFVTUDA2M1F2VG15UDZMZUVObDdJT25tWVJlRE9QcFZG?=
 =?utf-8?B?ODlhSHdCRE5jUUpWcnNnQ01QVzRpRkhQQi9yUEl0N0NqWDk4YXdhVXBocVhh?=
 =?utf-8?B?bnJmUlpvT2NMVnhrMlR4TnpiUWY3NHprcEVyaUhMc09ZaXREQS9mVXhqY0Fo?=
 =?utf-8?B?clU2bVFjUjJyUDlvUVg0czBScjNTOGtPNVkzQUEyUEQrdWYwcmhGTGthU2Mv?=
 =?utf-8?B?cWFaZjBHWnJWMitFVlpXNzFGK3ZYQ1N2QTZTSVg2bDJMUXFIVy84Y0RLRVg4?=
 =?utf-8?Q?s0KE0XCY/wMx8SIuhewIFGdIyGLBqE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVJSd25uUzEwRFZEWWxOOWNrUUdCUjlmOC9lbVhEaEs3MTVYMUF6c3dKWFpT?=
 =?utf-8?B?d3JMN2h3cnNWUG5YV3pJOURvelovYUZaSWpHSXpaN1hhMEE4S2JlYUgvR1Nv?=
 =?utf-8?B?TThNdjZQY2RhU0paRVVveUhtZ3Q4Yjh4VVUyQ25jWWxQR0VOYnlsaENmN3ZE?=
 =?utf-8?B?ZU1NK0l6ZW5tVmg4Z3JLKzV1bSsvUG4remlYUU5vb0ZnTjN6dWxCOFFVNC9q?=
 =?utf-8?B?cWtQS2dBWjF5TVVrMEN3US9DYUozK2xYUkkxa3RRSEQrTUhoMlZRSi9oVjFD?=
 =?utf-8?B?YTBjS0xSeGNkWks3b2hXbGtvV3p2UHczZHBXQ0tUdVV3N29yRHFQZ1UrNXJD?=
 =?utf-8?B?TVNwdDlFNzFzUUJoanlJdXJZbjRwZ2dxRnJ2OEcxeFNVT3NYWUd2WW9veXJX?=
 =?utf-8?B?N25DOEFLN2RBZUpvYjZJRDZQNFZ5OVNFVVkrL0U1UzdQZlgwRGJFZE1KczZY?=
 =?utf-8?B?a2pYSXNOVjMrVlNRVTZWdHB6NHVhL2pZM1ZWRzFpN0IzRFkyWnFDcm0zZERV?=
 =?utf-8?B?OGprRC9nSE5EVGVWNWdjNjZpMXhHNnlyWU4wMldkQ2FMZ3JrbmdTa1l0Mnlp?=
 =?utf-8?B?c3dIVDdGbFBWMUNqRTVRTjJaM0poM3hNdlNQYlJLNktaRk5LWlg3VzRvajY4?=
 =?utf-8?B?a284Lzk4eU5qYXl4MmQxaitqL0pYSW9VUVNFSkxlaWo1ZHNVeS9FendUcEtR?=
 =?utf-8?B?dHhUUGhxU0xDZmUrMjVIbHdoai8zVEhxY1JCdWdGWDAvU2NWOHlwZy9DajFQ?=
 =?utf-8?B?Sy85V0JTRWdjckl2RFNFNGNjdm0rTC8zNGVZN29EanA4RUdpTE5kN3NjVDNo?=
 =?utf-8?B?bG9TMGVNdFZEakNxdURSSVF2WE1UcWVkMkR4NmtLeUNsTkNwZHJGdmhLVWlr?=
 =?utf-8?B?RVI2OTZlSExJM1dJSlZhdVF0ZnNPMzJTT2xTRHZZa1BMZE5kMjcwVEZ2OG5M?=
 =?utf-8?B?ZjhpUTV6WUIrRjNGWFFjei9WanJZUHRqR0x3QUpnNDdIUUdmYThmejN0K1NC?=
 =?utf-8?B?cFppNEdPSlowOUxRdTRycFFUd0FDMjBXODFCV2dFRTZPMVZDVDF5MDMzemNO?=
 =?utf-8?B?U29OYUhLUlI1eGZ1Q05VYkQ3RkhtSi9ya2RKaFlHNlVmNWtCWEFtSHJndXow?=
 =?utf-8?B?d3U4Q1FFRzkwWEs5T3RBQ3RoajNxcWpYem9JYUJVb25ocFdmNUlObHV2WWVj?=
 =?utf-8?B?QUk4VDlYZEg4RkRaWlV2WmVkN3ErNHJ6WTlyZ0h0RFlRTlR3T0t3K2NQM05P?=
 =?utf-8?B?WDZJdFN2NmJ4bksvTFE3V0dIbGhCRUpJOHptRWNOQm9YZ2VPY0pYQ2tKMzdv?=
 =?utf-8?B?ZithZXRCRjBVS3VXRXQ5bDdhdElsTzVCR3BkeGJUcmJCN1FoblNoMnNwdzly?=
 =?utf-8?B?Z3F1c2ZWYzdhM0lySVI5ank5ekkzeVZjQ24xSjdlZ2NBTlFiU0dmOTNuUFY4?=
 =?utf-8?B?L1B4TTVXZmszc1NERUE2ZEltUUU0UHpsTUl0UnZDMzczVE5pdktkTURQUmRY?=
 =?utf-8?B?TlJvZERmR1dJa2hrdVc5WUZhemw1VzRCZm41b21CNkxtdnV6RXVybXp3OGtY?=
 =?utf-8?B?eEFGbjVTYzNuVW9jWGRXeEdiOFloTGQ0NkJ5ZERVcnhKdmRRSkJuMERhTzgy?=
 =?utf-8?B?VmZkT1ZGVk1yeWtnQi9iNzIvd0Zoa2xCM2owRDVlc1hhT1pWbS9xOHpFamZE?=
 =?utf-8?B?MWFoK1I5ck9FbytCZDRiUUdCUWNUTVVQVnJjTVFFV1FMOEVOM3ZSeFJSaHJS?=
 =?utf-8?B?OHdwRFU0WUsrRC9LdW56ZTVtc1lLdm9QYW95MTA0N1VoR3VUQ0w5MDhUd3JX?=
 =?utf-8?B?UE11YW9LWWh5M0liL2VJTnQ0V0NNN3BKcUY4R0drL1FoSXN5MjFoOE1EcGIz?=
 =?utf-8?B?ODZ6anl0QUdlV01tdzhGS2tkR01RTkV1OWI4LzZHdGZyZVdHcHVCWFZxempH?=
 =?utf-8?B?U1BGQVB2Y3pnQzZHYTcvMTVubkxxNUNneFQ0bmd0MC9uK0tVUjNVSlFNQURL?=
 =?utf-8?B?eFFBL2FyWkJGODBYell1OTJhVWJrdnVDVk42eW5hZlpTa1ZSSkp2bG9NR1Vx?=
 =?utf-8?B?ZDAxUUc2ZG9yMWlFU0ZoMUhvSW1tUzkrVTB6NGZFY2gyeXVRM1dYK1VWUk5k?=
 =?utf-8?Q?nr6s=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476d81df-bbb4-4967-6e7c-08ddad4b701b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 03:02:47.1247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRj6EM/4hzVz2K33I8o80GxNbhfnmdhbykRroETmuCsXq+/QjK/3xRHJSAaLV9NBIEoWuKHVsAkR7n9g+4hjjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9254

R2VudGxlIHBpbmcuLi4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjXlubQ15pyIMjDml6Ug
MTE6NDYNCj4gVG86IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Ow0KPiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Ow0KPiBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8
a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29t
PjsgU3RlZmFuDQo+IEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+OyBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+OyBCYXJ0b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5k
ZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJvdWdoIENo
ZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsg
d2FocmVuc3RAZ214Lm5ldDsgY29ub3JAa2VybmVsLm9yZzsgRnJhbmsgTGkNCj4gPGZyYW5rLmxp
QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAzLzNdIEFSTTY0OiBkdHM6IGFkZCBuZ3Bp
b3MgZm9yIHZmNjEwIGNvbXBhdGlibGUgZ3Bpbw0KPiBjb250cm9sbGVycw0KPiANCj4gQWZ0ZXIg
Y29tbWl0IGRhNWRkMzFlZmQyNCAoImdwaW86IHZmNjEwOiBTd2l0Y2ggdG8gZ3Bpby1tbWlvIiks
IHRoZSB2ZjYxMA0KPiBHUElPIGRyaXZlciBubyBsb25nZXIgdXNlcyB0aGUgc3RhdGljIG51bWJl
ciAzMiBmb3INCj4gZ2MtPm5ncGlvLiBUaGlzIGFsbG93cyB1c2VycyB0byBjb25maWd1cmUgdGhl
IG51bWJlciBvZiBHUElPcw0KPiBwZXIgcG9ydC4NCj4gDQo+IEFuZCBzb21lIGdwaW8gY29udHJv
bGxlcnMgZGlkIGhhdmUgbGVzcyBwYWRzLiBTbyBhZGQgJ25ncGlvcycgaGVyZSwgdGhpcyBjYW4g
c2F2ZQ0KPiBzb21lIG1lbW9yeSB3aGVuIHJlcXVlc3QgYml0bWFwLCBhbmQgYWxzbyBzaG93IHVz
ZXIgbW9yZSBhY2N1cmF0ZQ0KPiBpbmZvcm1hdGlvbiB3aGVuIHVzZSBncGlvIHRvb2xzLg0KPiAN
Cj4gQmVzaWRlcywgc29tZSBncGlvIGNvbnRyb2xsZXJzIGhhdmUgaG9sZSBpbiB0aGUgZ3BpbyBy
YW5nZXMsIHNvIHVzZQ0KPiAnZ3Bpby1yZXNlcnZlZC1yYW5nZXMnIHRvIGNvdmVyIHRoYXQsIHRo
ZW4gdGhlIGdwaW9pbmZvIHRvb2wgc2hvdyB0aGUgY29ycmVjdA0KPiByZXN1bHQuDQo+IA0KPiBS
ZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4dWxwLmR0c2kgfCAzICsrKw0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OTMuZHRzaSAgIHwgNCArKysrDQo+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg5NC5kdHNpICAgfCA3ICsrKysrKysNCj4gIGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDk1LmR0c2kgICB8IDUgKysrKysNCj4gIDQgZmlsZXMgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDh1bHAuZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDh1bHAuZHRzaQ0KPiBpbmRleA0KPiAyNTYyYTM1Mjg2YzIwODg2OWQxMWQ3ZmI5NzBh
Yzg0NjM4ZjQ1MDg4Li4xM2IwMWYzYWEyYTQ5NTBjMzdlNzJlMDRmDQo+IDZiZmI1OTk1ZGMxOTE3
OCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHVscC5k
dHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDh1bHAuZHRzaQ0K
PiBAQCAtNjg2LDYgKzY4Niw3IEBAIGdwaW9lOiBncGlvQDJkMDAwMDAwIHsNCj4gIAkJCQkJIDwm
cGNjNCBJTVg4VUxQX0NMS19QQ1RMRT47DQo+ICAJCQkJY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJw
b3J0IjsNCj4gIAkJCQlncGlvLXJhbmdlcyA9IDwmaW9tdXhjMSAwIDMyIDI0PjsNCj4gKwkJCQlu
Z3Bpb3MgPSA8MjQ+Ow0KPiAgCQl9Ow0KPiANCj4gIAkJZ3Bpb2Y6IGdwaW9AMmQwMTAwMDAgew0K
PiBAQCAtNzAxLDYgKzcwMiw3IEBAIGdwaW9mOiBncGlvQDJkMDEwMDAwIHsNCj4gIAkJCQkJIDwm
cGNjNCBJTVg4VUxQX0NMS19QQ1RMRj47DQo+ICAJCQkJY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJw
b3J0IjsNCj4gIAkJCQlncGlvLXJhbmdlcyA9IDwmaW9tdXhjMSAwIDY0IDMyPjsNCj4gKwkJCQlu
Z3Bpb3MgPSA8MzI+Ow0KPiAgCQl9Ow0KPiANCj4gIAkJcGVyX2JyaWRnZTU6IGJ1c0AyZDgwMDAw
MCB7DQo+IEBAIC04NTUsNiArODU3LDcgQEAgZ3Bpb2Q6IGdwaW9AMmUyMDAwMDAgew0KPiAgCQkJ
CSA8JnBjYzUgSU1YOFVMUF9DTEtfUkdQSU9EPjsNCj4gIAkJCWNsb2NrLW5hbWVzID0gImdwaW8i
LCAicG9ydCI7DQo+ICAJCQlncGlvLXJhbmdlcyA9IDwmaW9tdXhjMSAwIDAgMjQ+Ow0KPiArCQkJ
bmdwaW9zID0gPDI0PjsNCj4gIAkJfTsNCj4gIAl9Ow0KPiAgfTsNCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg5My5kdHNpDQo+IGluZGV4DQo+IDY0Y2QwNzc2YjQzZDM4MjE5
ZmVlMzEyYmFhZGQ0NjY1Njc0YTE0MWUuLjUyYmU4M2ExNjhkOWVlNjQ1MmE2MzAzDQo+IDljODkx
NjlkNDliNjNlYjYwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg5My5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkz
LmR0c2kNCj4gQEAgLTExOTcsNiArMTE5Nyw3IEBAIGdwaW8yOiBncGlvQDQzODEwMDAwIHsNCj4g
IAkJCQkgPCZjbGsgSU1YOTNfQ0xLX0dQSU8yX0dBVEU+Ow0KPiAgCQkJY2xvY2stbmFtZXMgPSAi
Z3BpbyIsICJwb3J0IjsNCj4gIAkJCWdwaW8tcmFuZ2VzID0gPCZpb211eGMgMCA0IDMwPjsNCj4g
KwkJCW5ncGlvcyA9IDwzMD47DQo+ICAJCX07DQo+IA0KPiAgCQlncGlvMzogZ3Bpb0A0MzgyMDAw
MCB7DQo+IEBAIC0xMjEzLDYgKzEyMTQsNyBAQCBncGlvMzogZ3Bpb0A0MzgyMDAwMCB7DQo+ICAJ
CQljbG9jay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiAgCQkJZ3Bpby1yYW5nZXMgPSA8Jmlv
bXV4YyAwIDg0IDg+LCA8JmlvbXV4YyA4IDY2IDE4PiwNCj4gIAkJCQkgICAgICA8JmlvbXV4YyAy
NiAzNCAyPiwgPCZpb211eGMgMjggMCA0PjsNCj4gKwkJCW5ncGlvcyA9IDwzMj47DQo+ICAJCX07
DQo+IA0KPiAgCQlncGlvNDogZ3Bpb0A0MzgzMDAwMCB7DQo+IEBAIC0xMjI4LDYgKzEyMzAsNyBA
QCBncGlvNDogZ3Bpb0A0MzgzMDAwMCB7DQo+ICAJCQkJIDwmY2xrIElNWDkzX0NMS19HUElPNF9H
QVRFPjsNCj4gIAkJCWNsb2NrLW5hbWVzID0gImdwaW8iLCAicG9ydCI7DQo+ICAJCQlncGlvLXJh
bmdlcyA9IDwmaW9tdXhjIDAgMzggMjg+LCA8JmlvbXV4YyAyOCAzNiAyPjsNCj4gKwkJCW5ncGlv
cyA9IDwzMD47DQo+ICAJCX07DQo+IA0KPiAgCQlncGlvMTogZ3Bpb0A0NzQwMDAwMCB7DQo+IEBA
IC0xMjQzLDYgKzEyNDYsNyBAQCBncGlvMTogZ3Bpb0A0NzQwMDAwMCB7DQo+ICAJCQkJIDwmY2xr
IElNWDkzX0NMS19HUElPMV9HQVRFPjsNCj4gIAkJCWNsb2NrLW5hbWVzID0gImdwaW8iLCAicG9y
dCI7DQo+ICAJCQlncGlvLXJhbmdlcyA9IDwmaW9tdXhjIDAgOTIgMTY+Ow0KPiArCQkJbmdwaW9z
ID0gPDE2PjsNCj4gIAkJfTsNCj4gDQo+ICAJCW9jb3RwOiBlZnVzZUA0NzUxMDAwMCB7DQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NC5kdHNpDQo+IGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQuZHRzaQ0KPiBpbmRleA0KPiAzNjYx
ZWE0OGQ3ZDI5OTRkZjdiMDIwODRlOTY4MWJlYjMwM2FhMTMzLi5iOGZmYzQyOGU5NWJlMTkzOGJm
NWU3MzMNCj4gMTZiNDE2M2FjYWEwNDcwMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OTQuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg5NC5kdHNpDQo+IEBAIC03ODUsNiArNzg1LDcgQEAgZ3BpbzI6IGdwaW9ANDM4
MTAwMDAgew0KPiAgCQkJI2dwaW8tY2VsbHMgPSA8Mj47DQo+ICAJCQlncGlvLWNvbnRyb2xsZXI7
DQo+ICAJCQlncGlvLXJhbmdlcyA9IDwmc2NtaV9pb211eGMgMCA0IDMyPjsNCj4gKwkJCW5ncGlv
cyA9IDwzMj47DQo+ICAJCX07DQo+IA0KPiAgCQlncGlvMzogZ3Bpb0A0MzgyMDAwMCB7DQo+IEBA
IC03OTcsNiArNzk4LDcgQEAgZ3BpbzM6IGdwaW9ANDM4MjAwMDAgew0KPiAgCQkJI2dwaW8tY2Vs
bHMgPSA8Mj47DQo+ICAJCQlncGlvLWNvbnRyb2xsZXI7DQo+ICAJCQlncGlvLXJhbmdlcyA9IDwm
c2NtaV9pb211eGMgMCAzNiAyNj47DQo+ICsJCQluZ3Bpb3MgPSA8MjY+Ow0KPiAgCQl9Ow0KPiAN
Cj4gIAkJZ3BpbzQ6IGdwaW9ANDM4NDAwMDAgew0KPiBAQCAtODEwLDYgKzgxMiw3IEBAIGdwaW80
OiBncGlvQDQzODQwMDAwIHsNCj4gIAkJCWdwaW8tY29udHJvbGxlcjsNCj4gIAkJCWdwaW8tcmFu
Z2VzID0gPCZzY21pX2lvbXV4YyAwIDYyIDQ+LCA8JnNjbWlfaW9tdXhjIDQgMCA0PiwNCj4gIAkJ
CQkgICAgICA8JnNjbWlfaW9tdXhjIDggMTQwIDEyPiwgPCZzY21pX2lvbXV4YyAyMCAxNjQNCj4g
MTI+Ow0KPiArCQkJbmdwaW9zID0gPDMyPjsNCj4gIAkJfTsNCj4gDQo+ICAJCWdwaW81OiBncGlv
QDQzODUwMDAwIHsNCj4gQEAgLTgyMiw2ICs4MjUsNyBAQCBncGlvNTogZ3Bpb0A0Mzg1MDAwMCB7
DQo+ICAJCQkjZ3Bpby1jZWxscyA9IDwyPjsNCj4gIAkJCWdwaW8tY29udHJvbGxlcjsNCj4gIAkJ
CWdwaW8tcmFuZ2VzID0gPCZzY21pX2lvbXV4YyAwIDEwOCAzMj47DQo+ICsJCQluZ3Bpb3MgPSA8
MzI+Ow0KPiAgCQl9Ow0KPiANCj4gIAkJZ3BpbzY6IGdwaW9ANDM4NjAwMDAgew0KPiBAQCAtODM0
LDYgKzgzOCw3IEBAIGdwaW82OiBncGlvQDQzODYwMDAwIHsNCj4gIAkJCSNncGlvLWNlbGxzID0g
PDI+Ow0KPiAgCQkJZ3Bpby1jb250cm9sbGVyOw0KPiAgCQkJZ3Bpby1yYW5nZXMgPSA8JnNjbWlf
aW9tdXhjIDAgNjYgMzI+Ow0KPiArCQkJbmdwaW9zID0gPDMyPjsNCj4gIAkJfTsNCj4gDQo+ICAJ
CWdwaW83OiBncGlvQDQzODcwMDAwIHsNCj4gQEAgLTg0Niw2ICs4NTEsOCBAQCBncGlvNzogZ3Bp
b0A0Mzg3MDAwMCB7DQo+ICAJCQkjZ3Bpby1jZWxscyA9IDwyPjsNCj4gIAkJCWdwaW8tY29udHJv
bGxlcjsNCj4gIAkJCWdwaW8tcmFuZ2VzID0gPCZzY21pX2lvbXV4YyAwIDk4IDEwPiwgPCZzY21p
X2lvbXV4YyAxNiAxNTINCj4gMTI+Ow0KPiArCQkJZ3Bpby1yZXNlcnZlZC1yYW5nZXMgPSA8MTAg
Nj47DQo+ICsJCQluZ3Bpb3MgPSA8Mjg+Ow0KPiAgCQl9Ow0KPiANCj4gIAkJYWlwczE6IGJ1c0A0
NDAwMDAwMCB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg5NS5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTUuZHRzaQ0K
PiBpbmRleA0KPiA2MzI2MzFhMjkxMTIyNGNhZGMxNmE5NDNjZGI0NjdlMDkxZTQzMzg0Li5hMmY0
ZmNmZmNkZTU5ODQ5YmFmY2VkY2VkMw0KPiBmZjMxN2NhNmM3Y2Y3OCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTUuZHRzaQ0KPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NS5kdHNpDQo+IEBAIC0xMTUyLDYgKzExNTIsNyBA
QCBncGlvMjogZ3Bpb0A0MzgxMDAwMCB7DQo+ICAJCQkJIDwmc2NtaV9jbGsgSU1YOTVfQ0xLX0JV
U1dBS0VVUD47DQo+ICAJCQljbG9jay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiAgCQkJZ3Bp
by1yYW5nZXMgPSA8JnNjbWlfaW9tdXhjIDAgNCAzMj47DQo+ICsJCQluZ3Bpb3MgPSA8MzI+Ow0K
PiAgCQl9Ow0KPiANCj4gIAkJZ3BpbzM6IGdwaW9ANDM4MjAwMDAgew0KPiBAQCAtMTE2OCw2ICsx
MTY5LDcgQEAgZ3BpbzM6IGdwaW9ANDM4MjAwMDAgew0KPiAgCQkJY2xvY2stbmFtZXMgPSAiZ3Bp
byIsICJwb3J0IjsNCj4gIAkJCWdwaW8tcmFuZ2VzID0gPCZzY21pX2lvbXV4YyAwIDEwNCA4Piwg
PCZzY21pX2lvbXV4YyA4IDc0DQo+IDE4PiwNCj4gIAkJCQkgICAgICA8JnNjbWlfaW9tdXhjIDI2
IDQyIDI+LCA8JnNjbWlfaW9tdXhjIDI4IDAgND47DQo+ICsJCQluZ3Bpb3MgPSA8MzI+Ow0KPiAg
CQl9Ow0KPiANCj4gIAkJZ3BpbzQ6IGdwaW9ANDM4NDAwMDAgew0KPiBAQCAtMTE4Myw2ICsxMTg1
LDcgQEAgZ3BpbzQ6IGdwaW9ANDM4NDAwMDAgew0KPiAgCQkJCSA8JnNjbWlfY2xrIElNWDk1X0NM
S19CVVNXQUtFVVA+Ow0KPiAgCQkJY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJwb3J0IjsNCj4gIAkJ
CWdwaW8tcmFuZ2VzID0gPCZzY21pX2lvbXV4YyAwIDQ2IDI4PiwgPCZzY21pX2lvbXV4YyAyOCA0
NA0KPiAyPjsNCj4gKwkJCW5ncGlvcyA9IDwzMD47DQo+ICAJCX07DQo+IA0KPiAgCQlncGlvNTog
Z3Bpb0A0Mzg1MDAwMCB7DQo+IEBAIC0xMTk4LDYgKzEyMDEsNyBAQCBncGlvNTogZ3Bpb0A0Mzg1
MDAwMCB7DQo+ICAJCQkJIDwmc2NtaV9jbGsgSU1YOTVfQ0xLX0JVU1dBS0VVUD47DQo+ICAJCQlj
bG9jay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiAgCQkJZ3Bpby1yYW5nZXMgPSA8JnNjbWlf
aW9tdXhjIDAgOTIgMTI+LCA8JnNjbWlfaW9tdXhjIDEyIDM2DQo+IDY+Ow0KPiArCQkJbmdwaW9z
ID0gPDE4PjsNCj4gIAkJfTsNCj4gDQo+ICAJCWFpcHMxOiBidXNANDQwMDAwMDAgew0KPiBAQCAt
MTUwOCw2ICsxNTEyLDcgQEAgZ3BpbzE6IGdwaW9ANDc0MDAwMDAgew0KPiAgCQkJCSA8JnNjbWlf
Y2xrIElNWDk1X0NMS19NMzM+Ow0KPiAgCQkJY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJwb3J0IjsN
Cj4gIAkJCWdwaW8tcmFuZ2VzID0gPCZzY21pX2lvbXV4YyAwIDExMiAxNj47DQo+ICsJCQluZ3Bp
b3MgPSA8MTY+Ow0KPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gIAkJfTsNCj4gDQo+IA0K
PiAtLQ0KPiAyLjM0LjENCg0K

