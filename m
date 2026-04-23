Return-Path: <linux-gpio+bounces-35425-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A8yL89u6mlBzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35425-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:11:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EF4567D1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C58306FC04
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD57F3921C1;
	Thu, 23 Apr 2026 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H721eNAU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F939182F;
	Thu, 23 Apr 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971293; cv=fail; b=Wy7b1w6A3tpu2V/GGL8JIoPYSsxGixvBUF/p1bBJCvOI9L2UDkezx9SHeLuMe4bX9/eATJZHzgvwtjNsJ/COcuJCsxON/rPYsD92dIAbH9jmWS7/SiY2bbWrpTKMmbLGlApS4L3hb7MszO4VZAI3F6uZnlrXDDuE0cZzf99d924=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971293; c=relaxed/simple;
	bh=SAbxC2qgJ8z4+1Q1J2vPTB5rFOqJbf4yWmNnxkQX7fE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qFw8FvHFigHD+UQUuiFWn+iV4V6T2+NzCcRn+zLldCoOJO0rmgeEjscPYqbITaw+aWMkXoG625jiHgWjKrBxWhByQInNFDV0JdIOnoNQbLjEWvg4X9zoHn4FGBxjWUG2ABvCwMJYJsMng4o9Qu6YJcjZ0VGJ5vDXB/qoN6zmnzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H721eNAU; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3WcWfKqgL2To1TWAp6i6G5IXtn1n7XN/AShNNDdv6ASIYnYTkbdD8nN+3QpNpBb6GXzKeVqnOJxJYvZ24lG7zCgTC2QdAsg6JOnrtXb4jcyQVu9cG7la4xIS85tcAb3Hx0cGujpvei0ta6A0Bg6rqdxUIf34ABqH6s3d+uGORl6L8vvGR/46xf76b1DEafDxcLrxO+TEgs6dCtWd7bca6sIsUDEgkbpkK4HPW6LOFeO4SN5BEJew3reWv4rvlu/2ABUoJSpWW9tniSz+X5ZAE3K+y9780CKR5gP5T6vi/lPiJ9OgNh/+POu7PqurD6b9S0pWb0W/JVaDqP4XnheFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAbxC2qgJ8z4+1Q1J2vPTB5rFOqJbf4yWmNnxkQX7fE=;
 b=NdfA/7jsbDk/HITQmy2ebSyf9X712jKie5k5fmS8kNX4yHLuMdVGU8NkXUmnBr2JpI/FGIUd5qkk+Hq/Tdz+VV17K4ue44zUchVk628WBddQWeVtAANKt4xp32lG0mpQtShYKu036Jslzz4AkdcgcohDvQKoSiY5UOb253mmr6HGTyK2DhBD9/GcvhVh5rXIRLWljS6/WUW2r4ulK5Nzftr61un2qMfaCuAOXlqGBZnwwTscwSprws3l1jPRwsrzbQ3XfoDBuktP7X0U9FJCS+0RgX88f9YoCPDLkyt+WvyGnhXb4Xiq5CGBlSeHJLcl8pfqc6MPddmGy/FXiKazYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAbxC2qgJ8z4+1Q1J2vPTB5rFOqJbf4yWmNnxkQX7fE=;
 b=H721eNAUEPlqvJRNSM9lusa96WUGyeZFPBy2awV3cNR0m38oA3M+NXgSMa9ETsRp2rsrhTEm4UJC2jpQh+sVlOL3Zl3Osv6S7C+EavELGgb8Oj3z2ftDWj6H0e86floHZP92nOeVbDAEmIIn9AEItA3P0DNAoqRh2QdmkAKoPwFdANhrWdliTTrL5DzENvTXLPg2bmvH+wiLxU2DWS6XIMobXLT/9bUDbGYuxRVg1vv2gy/NocECva4gZ4ai5DxVEIV2CChRPCARSZ9DGJMEcMWnXqL6Y4wlgxxfhQaUtI8S+0/7idjt51fGoFLsUcLtpSeGn3sj0zcUEVYyedLw2w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS5PR04MB10044.eurprd04.prod.outlook.com (2603:10a6:20b:682::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 19:08:07 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 19:08:07 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHc01SE13wCpB8JwEe/WT6W+mkoYw==
Date: Thu, 23 Apr 2026 19:08:07 +0000
Message-ID:
 <PAXPR04MB9185AFF861DA3C4B8A8FB1B8892A2@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
In-Reply-To:
 <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS5PR04MB10044:EE_
x-ms-office365-filtering-correlation-id: 1ac45f3f-1055-41f6-c8be-08dea16ba735
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|56012099003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 JBrCsKcpYlupcH1cZcymHkr8jh2LcEhx1fDUb5GgfT6cNDsdNhNEfag9XiU1FxpS0E3qJplXPQVvbhjeLmUIGrE0PQ5cXvrQi5NEmmcp3XWBmmz0yuxnedpu42eJh4A+VPesSP9xpLJ6YAmwFse5IJ6yzY1ZJX/yL6Z/usI2EoGGLsyIU1z4uSfDT8t9LRexhbOsWxJcfpGIdzNqAxnkIhmZFbD7I9SlZeLlAWJ/jRAw0IjxKZs4Mzyn04uFXJdp7kTouBPvKRuj5vNSJpaH1Au+3eBZmFT3It8IjfeQFpow1xK0iNAJuvS1UlxB4eqy05WEu+shYT5RSZmjgGU3Tcd5FYE0v69mRvPeuvcgz1xwmHmnCxUOiuoO2M9Q9DzL2apwt1MyJSlLiCM+iJ26NX7bXUrrGfxKXuY6QqJPL5QQEqIbGwHRa/i5QCjL5fnSvlNHDXvsAxYiPwPPK6p898+74zasOMkoliRZ0MpLuC7U8iF3Ps5dJv7tnz06JGGzDsADAl4g4B5bjlwO8OWWrjy/Am4S78JMivdRfbfgXPE+Dbqqr3zEufc2P1bfJ/UjjptoC7w9y9gjnHqCKueTDY7MKHMRweJxldNjFCbqIpIQ56Zjxy99r7g+2k2kbDmxAKP9D9lkVOsbEfJgWaIAXvXmK58Xr7AtCVyCODqtwyFNW3OhTf0suYxpZePvdb8fBgU7Yr684tzpaRay7wi7iVwC2Gf94eQebAGI+YloVb0K+Sbwcf8YSvzIRYu10vgJD1qqU065XFGH/qY94hhNvx/i0tUEyt5fKsNS9SusnKM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(56012099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUhNZkJEYVhLSjZka3p0SDFGZ3BCdWlyZmxnciszRitJYnNSN2Z3aU05Z2FY?=
 =?utf-8?B?YW8rRUpRMy96em9pc2FlM1V4aTBHWU8wcCtMQ2NmbUhKNkpyTHlDcWkrbGVx?=
 =?utf-8?B?cThwdWhUSnJtdi9sOUtaeWJqTVRVQytnUWNzKzFnU0JaYXYxWnNQREtTQjJY?=
 =?utf-8?B?TThMVmdMSHQ0SWhpK3FpclN1TzZXZi9nSUxvcHpwRE9SYmpVY2EvREhROGNP?=
 =?utf-8?B?QldFbFRtcU0raStHWnFkYWROeVVkL1ZUNHBBUmhkbXlFY0JscnhpN2JrMmV4?=
 =?utf-8?B?QzRxSE9jZWhocXh5OVIvc2NiSVZkT1ZwQVNCSW5pd1VVMitIWGs3QU1qRWhm?=
 =?utf-8?B?OHBFVFREQjZUcmVhZWNaWFZIdU14dUhIWlh6WTVLWkY0TGsrN2QxUW5JWHdi?=
 =?utf-8?B?VC9KWmhqR3lqSTJFL015cXRGRXZIMStMUGVycXlCTnVVQjY2TWNtQVdJWUdN?=
 =?utf-8?B?UTVTNkROL2d1WUV1NGh1cVg4R2xIZVpJU1RKdzVqYW1tNmZiVWkzOG5XblBZ?=
 =?utf-8?B?K1FkMHowOThJaGtzVURQZEdzdGp2L2tWVFM1QW1jeFpuaFdXQTNCZVM3RkJ3?=
 =?utf-8?B?NFR4cmZDbWRCcFViUTM5Qm15Y21sNGMxbWEvZHVBdlBvL0I0VnNNbTdBaXI1?=
 =?utf-8?B?ZUIzdmxPTlk1SnROTlVWOG9nNFR2bkw1bzkzRU5oZFAxYld4c0N3dmUzQm80?=
 =?utf-8?B?NkRXZFhPUWxkNjdUd0Jha250Z2QzYWFLblFETDE0Vy91UFFGaTZyUG9kZm9t?=
 =?utf-8?B?SFdmRCs1clpRUGExSmV2amw4NFVDZjNsV2FRWWFoNUFPd0wvUzFuUjJEakdQ?=
 =?utf-8?B?cmRQbXZWRjQza2gxMWFIQm05Yk1uNnA1TEtnVC9adFd0QlFUbG5qeVZ1NWZF?=
 =?utf-8?B?N3hLREROU0kyUjFPQWtqclJyK3p5cXBOQlh1Z0dSTFZBdlRsaENVbE0zMWZ1?=
 =?utf-8?B?M1p0OXVmZmNSQmdrZU9GaGNXWmMrNUUxZmZacVpLSTRLS1lxaHd3azduZGxX?=
 =?utf-8?B?WEdWS2l0dHdKLyszQUhhOCtJZnFPQXRLMUh5aDY4NnJvZllGdm14YkNtL1o0?=
 =?utf-8?B?M2FnTEVvYWJmMWVhY285Q21vMnJMOFAxaE5Ia2hpdzRESkJUdW5sLytMOUtv?=
 =?utf-8?B?VDQ4KzBXVWw3QVZFbFJOSzJCT203bkZZS3Q5S2d2WWhSNVdpei9LeC9SZnBi?=
 =?utf-8?B?WHQ1TzVEOERLR1VBZkhyVmhzdlNwUkU4NTFqVHM4OEpWUTVCSXpmMHA3dGli?=
 =?utf-8?B?RjdDZERoMzljQVd2T1cvTS9qcllmNGVob3RIQjhCVUFRSEVOUWNnQ001cDY3?=
 =?utf-8?B?UDdMWXVBVFg5SG5wa095bi9nR1ZOL3pTQWw1SWlqUGxFbEwvRnNFdWErY3lC?=
 =?utf-8?B?ZkpYT3ErVi9DSEwyTlhkaG1FTDdIaEp6cm9CMmVvOTByc0s0b09ZT1ZCaUdx?=
 =?utf-8?B?eE5xZ1VIUU14ZzZReW5WU3J5TkwrSlRrWlU5dDc1a1ZIL1N3d3djZG9YNXN1?=
 =?utf-8?B?dEJFR0pkRlVreGhmYXpGNnJ0b1QrcmZ6ZDBlbUtuZ0JhQ3VGYzZXQ3Z3c3NL?=
 =?utf-8?B?WStmRFRTVFlSdUVyVUhqL3VGa2VzWlRwQTg1S2tjeWZuWG82OC9FdVBDOVA1?=
 =?utf-8?B?dmpGRk9ib1YzblZKK1ljanZ1eEFkTE5uWkd4TGdLUHB4YSs5NXMxcWVKMzhU?=
 =?utf-8?B?a1dRZE5LMVJTc1RMbTdGenAxV3VTU0FtTVNTZml6UmFmcTBqWFFQcFRBZzZo?=
 =?utf-8?B?R0U2ZjNieldGZm5xWE1CODZSOTNyUzhkR0N4SkJGa0I5RFJXSjJWTytZK2xz?=
 =?utf-8?B?WUR1ZU1JOWVRTklPYWp3OTk3MW9QUk91ZGxqbnRiWjVIckJIYTdmVEptWUFw?=
 =?utf-8?B?dEFOd0RheExoY2ZSc1B5eHMvcXJtSWVHekU3ZUJNMXl0Smx0dFhFMDFtdnc2?=
 =?utf-8?B?NmEyeGFXTm1lY3ZmK3lMUHk0OVg3eXpLUU1zQVNGaTF1c2Y1ZEZIQ1BMUXg5?=
 =?utf-8?B?VXAwbExQWTU1WFc1MVdBL01Jdzg3dlF6UUZLTml2S3ppK2Rwb0wxTkRqYWpn?=
 =?utf-8?B?TFBkNno4Nzk5ZFNhcWlUWWwwaXdTakxVVUhDM3lHM0pTOVJLbDlFNGpIOVQ3?=
 =?utf-8?B?aUszS3ZuMVg2Zk05NG1BTUpORXo2Z3RLaWpVcVBFalB3NjFIa1FaSlAweVo0?=
 =?utf-8?B?VXpsZVhNdFhzblJZZmt0MlVTM2FDZVFrZDFiYXNHcHcwZlZtc1BDd3dDVmtI?=
 =?utf-8?B?MFhxYkREaHlzSGFUdDRzTC96bXZMbER0MGpoL2JHK2tHUHJTWVJXeERvaUdM?=
 =?utf-8?Q?u+5nEBD3ZdPN+dC/b5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac45f3f-1055-41f6-c8be-08dea16ba735
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 19:08:07.1958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d6JyrrBWtHpLwwKZTxUb3J6qFnFeoVg18wevzxixNNhmxQpnNMwwPBBPE3x74JDWJUwpjgvh4MfHR4Hg6KhUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10044
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35425-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,i.mx:url,lunn.ch:email,linuxfoundation.org:email,lwn.net:email,linaro.org:email,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 073EF4567D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDIz
LCAyMDI2IDc6NTMgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+
OyBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47DQo+
IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4NCj4gQW5kZXJzc29uIDxhbmRl
cnNzb25Aa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LQ0KPiANCj4gT25jZSBhZ2FpbiBBbmRyZXcgTHVubiB3YXMg
bGVmdCBvdXQuDQo+IA0KDQpTZWVtcyBhbiBpc3N1ZSBvZiBnZXRfbWFpbnRhaW5lci5wbCwgYnV0
IGhlIGlzIGluY2x1ZGVkIGluIHRoZSB0aHJlYWQgZm9yIHRoZSBncGlv4oCRcnBtc2cgZHJpdmVy
IHBhdGNoLi4NCkNjOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+DQoNCj4gT24gV2VkLCAy
MiBBcHIgMjAyNiBhdCAxNToyOSwgU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4N
Cj4gd3JvdGU6DQo+ID4NCj4gPiBTdXBwb3J0IHRoZSByZW1vdGUgZGV2aWNlcyBvbiB0aGUgcmVt
b3RlIHByb2Nlc3NvciB2aWEgdGhlIFJQTVNHIGJ1cw0KPiA+IG9uIGkuTVggcGxhdGZvcm0uDQo+
ID4NCj4gPiBDaGFuZ2VzIGluIHYxMzoNCj4gPiAgLSBkcm9wIHRoZSBzdXBwb3J0IGZvciBsZWdh
Y3kgTlhQIGZpcm13YXJlLg0KPiA+ICAtIHJlbW92ZSB0aGUgZml4ZWRfdXAgaG9va3MgZnJvbSB0
aGUgcnBtc2cgZ3BpbyBkcml2ZXIuDQo+ID4gIC0gY29kZSBjbGVhbnVwLg0KPiA+DQo+ID4gQ2hh
bmdlcyBpbiB2MTI6DQo+ID4gIC0gRml4ZWQgdGhlICJ1bmRlcmxpbmUiIHdhcm5pbmcgcmVwb3J0
ZWQgYnkgUmFuZHkuDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHYxMToNCj4gPiAgLSBFeHBhbmQgUlBN
U0cgZm9yIHRoZSBmaXJzdCB0aW1lIHBlciBTaHVhaCdzIHJldmlldyBjb21tZW50Lg0KPiA+DQo+
ID4gQ2hhbmdlcyBpbiB2MTA6DQo+ID4gIC0gVXBkYXRlIGdwaW8tcnBtc2cucnN0IGFjY29yZGlu
ZyB0byBEYW5pZWwgQmFsdXRhJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPiA+ICAtIEFkZCBhIGtlcm5l
bCBDT05GSUcgZm9yIGZpeGVkIHVwIGhhbmRsZXJzIGFuZCBvbmx5IGVuYWJsZSBpdCBvbg0KPiA+
ICAgIGkuTVggcHJvZHVjdHMuDQo+ID4gIC0gRml4ZWQgYnVncyByZXBvcnRlZCBieSBrZXJuZWwg
dGVzdCByb2JvdC4NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjk6DQo+ID4gIC0gUmV1c2UgdGhlIGdw
aW8tdmlydGlvIGRlc2lnbiBmb3IgY29tbWFuZCBhbmQgSVJRIHR5cGUgZGVmaW5pdGlvbnMuDQo+
ID4gIC0gUmVtb3ZlIG1zZ19pZCwgdmVyc2lvbiwgYW5kIHZlbmRvciBmaWVsZHMgZnJvbSB0aGUg
Z2VuZXJpYyBwcm90b2NvbC4NCj4gPiAgLSBBZGQgZml4ZWQtdXAgaGFuZGxlcnMgdG8gc3VwcG9y
dCBsZWdhY3kgZmlybXdhcmUuDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHY4Og0KPiA+ICAtIEFkZCAi
ZGVwZW5kcyBvbiBSRU1PVEVQUk9DIiBpbiBLY29uZmlnIHRvIGZpeCB0aGUgYnVpbGQgZXJyb3Ig
cmVwb3J0ZWQNCj4gPiAgICBieSB0aGUga2VybmVsIHRlc3Qgcm9ib3QuDQo+ID4gIC0gTW92ZSB0
aGUgLnJzdCBwYXRjaCBiZWZvcmUgdGhlIC55YW1sIHBhdGNoLg0KPiA+ICAtIEhhbmRsZSB0aGUg
Im5ncGlvcyIgRFQgcHJvcGVydHkgYmFzZWQgb24gQW5kcmV3J3MgZmVlZGJhY2suDQo+ID4NCj4g
PiBDaGFuZ2VzIGluIHY3Og0KPiA+ICAtIFJld29ya2VkIHRoZSBkcml2ZXIgdG8gdXNlIHRoZSBy
cG1zZ19kcml2ZXIgZnJhbWV3b3JrIGluc3RlYWQgb2YNCj4gPiAgICBwbGF0Zm9ybV9kcml2ZXIs
IGJhc2VkIG9uIGZlZWRiYWNrIGZyb20gQmpvcm4gYW5kIEFybmF1ZC4NCj4gPiAgLSBVcGRhdGVk
IGdwaW8tcnBtc2cueWFtbCBhbmQgaW14X3Jwcm9jLnlhbWwgYWNjb3JkaW5nIHRvIGNvbW1lbnRz
IGZyb20NCj4gPiAgICBSb2IgYW5kIEFybmF1ZC4NCj4gPiAgLSBGdXJ0aGVyIHJlZmluZW1lbnRz
IHRvIGdwaW8tcnBtc2cueWFtbCBwZXIgQXJuYXVkJ3MgZmVlZGJhY2suDQo+ID4NCj4gPiBDaGFu
Z2VzIGluIHY2Og0KPiA+ICAtIG1ha2UgdGhlIGRyaXZlciBtb3JlIGdlbmVyaWMgd2l0aCB0aGUg
YWN0aW9ucyBiZWxvdzoNCj4gPiAgICAgIHJlbmFtZSB0aGUgZHJpdmVyIGZpbGUgdG8gZ3Bpby1y
cG1zZy5jDQo+ID4gICAgICByZW1vdmUgdGhlIGlteCByZWxhdGVkIGluZm8gaW4gdGhlIGZ1bmN0
aW9uIGFuZCB2YXJpYWJsZSBuYW1lcw0KPiA+ICAgICAgcmVuYW1lIHRoZSBpbXhfcnBtc2cuaCB0
byBycGRldl9pbmZvLmgNCj4gPiAgICAgIGNyZWF0ZSBhIGdwaW8tcnBtc2cueWFtbCBhbmQgcmVm
ZXIgaXQgaW4gaW14X3Jwcm9jLnlhbWwNCj4gPiAgLSB1cGRhdGUgdGhlIGdwaW8tcnBtc2cucnN0
IGFjY29yZGluZyB0byB0aGUgZmVlZGJhY2sgZnJvbSBBbmRyZXcgYW5kDQo+ID4gICAgbW92ZSB0
aGUgc291cmNlIGZpbGUgdG8gZHJpdmVyLWFwaS9ncGlvDQo+ID4gIC0gZml4IHRoZSBidWcgcmVw
b3J0ZWQgYnkgWmhvbmdxaXUgSGFuDQo+ID4gIC0gcmVtb3ZlIHRoZSBJMkMgcmVsYXRlZCBpbmZv
DQo+ID4NCj4gPiBDaGFuZ2VzIGluIHY1Og0KPiA+ICAtIG1vdmUgdGhlIGdwaW8tcnBtc2cucnN0
IGZyb20gYWRtaW4tZ3VpZGUgdG8gc3RhZ2luZyBkaXJlY3RvcnkgYWZ0ZXINCj4gPiAgICBkaXNj
dXNzaW9uIHdpdGggUmFuZHkgRHVubGFwLg0KPiA+ICAtIGFkZCBpbmNsdWRlIGZpbGVzIHdpdGgg
c29tZSBjb2RlIGltcHJvdmVtZW50cyBwZXIgQmFydG9zeidzIGNvbW1lbnRzLg0KPiA+DQo+ID4g
Q2hhbmdlcyBpbiB2NDoNCj4gPiAgLSBhZGQgYSBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIHRo
ZSB0cmFuc3BvcnQgcHJvdG9jb2wgcGVyIEFuZHJldydzDQo+ID4gICAgY29tbWVudHMuDQo+ID4g
IC0gYWRkIGEgbmV3IGhhbmRsZXIgdG8gZ2V0IHRoZSBncGlvIGRpcmVjdGlvbi4NCj4gPg0KPiA+
IENoYW5nZXMgaW4gdjM6DQo+ID4gIC0gZml4IHZhcmlvdXMgZm9ybWF0IGlzc3VlIGFuZCByZXR1
cm4gdmFsdWUgY2hlY2sgcGVyIFBlbmcgJ3MgcmV2aWV3DQo+ID4gICAgY29tbWVudHMuDQo+ID4g
IC0gYWRkIHRoZSBsb2dpYyB0byBhbHNvIHBvcHVsYXRlIHRoZSBzdWJub2RlcyB3aGljaCBhcmUg
bm90IGluIHRoZQ0KPiA+ICAgIGRldmljZSBtYXAgcGVyIEFybmF1ZCdzIHJlcXVlc3QuIChpbiBp
bXhfcnByb2MuYykNCj4gPiAgLSB1cGRhdGUgdGhlIHlhbWwgcGVyIEZyYW5rJ3MgcmV2aWV3IGNv
bW1lbnRzLg0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSByZS1pbXBsZW1lbnRlZCB0
aGUgZ3BpbyBkcml2ZXIgcGVyIExpbnVzIFdhbGxlaWoncyBmZWVkYmFjayBieSB1c2luZw0KPiA+
ICAgIEdQSU9MSUJfSVJRQ0hJUCBoZWxwZXIgbGlicmFyeS4NCj4gPiAgLSBmaXggdmFyaW91cyBm
b3JtYXQgaXNzdWUgcGVyIE1hdGhpZXUvUGVuZyAncyByZXZpZXcgY29tbWVudHMuDQo+ID4gIC0g
dXBkYXRlIHRoZSB5YW1sIGRvYyBwZXIgUm9iJ3MgZmVlZGJhY2sNCj4gPg0KPiA+IFNoZW53ZWkg
V2FuZyAoNCk6DQo+ID4gICBkb2NzOiBkcml2ZXItYXBpOiBncGlvOiBycG1zZyBncGlvIGRyaXZl
ciBvdmVyIHJwbXNnIGJ1cw0KPiA+ICAgZHQtYmluZGluZ3M6IHJlbW90ZXByb2M6IGlteF9ycHJv
YzogQWRkICJycG1zZyIgc3Vibm9kZSBzdXBwb3J0DQo+ID4gICBncGlvOiBycG1zZzogYWRkIGdl
bmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiAgIGFybTY0OiBkdHM6IGlteDh1bHA6IEFkZCBy
cG1zZyBub2RlIHVuZGVyIGlteF9ycHJvYw0KPiA+DQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwaW8vZ3Bpby1ycG1zZy55YW1sICB8ICA1NSArKw0KPiA+ICAuLi4vYmluZGluZ3MvcmVt
b3RlcHJvYy9mc2wsaW14LXJwcm9jLnlhbWwgICAgfCAgNTMgKysNCj4gPiAgRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL2dwaW8vZ3Bpby1ycG1zZy5yc3QgIHwgMjY2ICsrKysrKysrDQo+ID4gIERv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlvL2luZGV4LnJzdCAgICAgICB8ICAgMSArDQo+ID4g
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDh1bHAuZHRzaSAgICB8ICAyNSArDQo+
ID4gIGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNyAr
DQo+ID4gIGRyaXZlcnMvZ3Bpby9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvLXJwbXNnLmMgICAgICAgICAgICAgICAgICAgICB8
IDU3MyArKysrKysrKysrKysrKysrKysNCj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCA5OTEgaW5zZXJ0
aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXJwbXNnLnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlvL2dwaW8tcnBtc2cucnN0DQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwaW8vZ3Bpby1ycG1zZy5jDQo+ID4NCj4gPiAtLQ0K
PiA+IDIuNDMuMA0KPiA+DQo=

