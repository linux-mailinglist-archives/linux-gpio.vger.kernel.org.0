Return-Path: <linux-gpio+bounces-28217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA69C3C6B6
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 70D9135234E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0525630E85E;
	Thu,  6 Nov 2025 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nlU1r1BU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBA32B99C;
	Thu,  6 Nov 2025 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446386; cv=fail; b=h1IHreUI7EH8bB+WmhRBkGceEJEJCHRQp/GBV9MFyqxrXoRVg64zhGGM/pwHgPbGk/G3gVVfndv7GcSGY/d8vAmPFOJwZdx2FBRDayJvILaaFBUXBJ9+emvuyjzX1BhmA///0QHmFqHwOlM0ZTN41yAC8jP8Q7KjsLE62I8H3WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446386; c=relaxed/simple;
	bh=k76W+9LXQEPJ6MoH/uMH0UGDqaK0UULs4owUEXrGcT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhwr839xLisEeNTqVoXjXxITlJnNGYLtQW7NIrjCAZYJrsQZunfJS3a4Ooi/gQEZzMOf+n8I3WLKfJruAsHlhV992EwTCj/bTdt+GW8oh9K8XhuF9yy1BXIMmY6CDZIyfOEqHxrimTLm5/v2f+uFJXcOgRelvwBJNq/LPvGq+ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nlU1r1BU; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1YjfOEjw4K2xfhpgUDzTxeqBjQGUN6F5hIzgZjN1ZXy7WPKEkwpjkJR6q9DtMVRJYXR4sTAsiZfn0qJOHS9n+iXIx8AAyY506wbM0OEPfPb+kTeNnblIq6YSC9VhUuapf38FCUsGCeDgITnNKSll3uxNUuGRr5lE8OwiG8G8XiTAd0HgPNaWoikL82D/Xa0A6y4IHsjPWS9AYnTn2weWrRIDXlKf3T2z4xrZRve3kPP7e6LKVgEKRqUXHBjpv0FhdGRShK5EvGEgoHYBTp5EtXjjxV8zKI4whwFH3sAAuQoy0J0J5qWO5YIHoy4qT9JSf5Tr4mj2Z+6tk0l5rAVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k76W+9LXQEPJ6MoH/uMH0UGDqaK0UULs4owUEXrGcT8=;
 b=u+SKcHTbqwKimqL4LkSzoqtZZw67iE9h39AnEDmLz7cG3CiZCIWpdCg5xrVrf2t7VMZx8Bm2iaGffSjFW8IKgPn8ZXePicA/cepyzezyIqEwt1AN508+NLPgtAtGacPBKqMsWkC+4ka1OrkpJ1ldDHGnZ9knaqoOdhCtSFKanhNy5yLoJ07vzyAP7bB0AasQWy7Rbge/pJt/DJt7deB7oq19xUQDugSjGsw+yx9a6qi9sqL31rLIgKbA/t1nzj9bqNDwBsaOB+IXgd1GDRY7qlf6mi9M4XkUbXOdTf64pU67m2PbMj8lgnNIt9eP33UM35e65j0AdqpxmaoLB0Tfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k76W+9LXQEPJ6MoH/uMH0UGDqaK0UULs4owUEXrGcT8=;
 b=nlU1r1BUZemVjFqRBAts+fbcWgYM3rr8bNLNwvxonrbFlWxl6LsTUY4m7VRgyQ8p6bB00ReofP3h+kGXoUKRBXBmFv0dnP38JFoeCQBj/JLW2mbvn13V8OniIpg6tkC+xt217ZTSAiyHGpeCjdx13VI7bA8V41ZmYLTsOEyO+OrO6prfhSYUnz6aFYMZCn0E2SDSRGCCnS0JHCBI8kFVUHqDoWM0CDJa/+0ITGEOvAXFcgbiMjXs+2LmJoUVG37SA4zFjpYvstfQRdROXH85uJH+JKNPO+iqd9NzrSJ5m6vy6bMTv24ZKzC+Uenryip4gNRQQzfeGqSmJRXer386DQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS5PR04MB9999.eurprd04.prod.outlook.com (2603:10a6:20b:67f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 16:26:19 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 16:26:19 +0000
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
Thread-Index: AQHcTzoVt8T4z/7qZUyKoLYzARST4A==
Date: Thu, 6 Nov 2025 16:26:19 +0000
Message-ID:
 <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
In-Reply-To: <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS5PR04MB9999:EE_
x-ms-office365-filtering-correlation-id: 4f8b781b-bf09-4cd8-62b6-08de1d5137a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?b3NPdWVuS1Rsd29sZkJJcVh1cCtJazdjeVVUdzRrclltdkZjeEtYMGc0OUpK?=
 =?utf-8?B?WFQ0VGxteVd3VnJmWHZYck56UXY1THV1RmtSQ3lld2daSmhMS0g1Tmd4djYz?=
 =?utf-8?B?VklxMjR1NzQyWkh3aUo2ckZOc0RkK2pxcUtoOUJiV2psZWNXT0RBM0Jxc2t0?=
 =?utf-8?B?cUdUV3luS1JQSjFDcWV2ZkhlaHF3Tm1vU0ltR1Zmb053VGNKaXNDaXhBb3pm?=
 =?utf-8?B?YStyQWtVSzBmQ2ltMFQ2R3dUUUpZSE9paXZkZldrczZ2T2lMZHg0dUhmWUsw?=
 =?utf-8?B?OERyYU9iR1lqMzRyNzRLYVdvd1JVL1loVy9IUjdaS2JQNVlPZ3kveXhnZHFy?=
 =?utf-8?B?bCtHU3RmS2FKMGNwc3R3NmJCSDdBRWdmWUJzRHpxb3pTZmtEd0ZxL3ZKdkFn?=
 =?utf-8?B?K002Ym5lQ055NExJQWJWdGloa09vL3pkM3MwaGw1V1hVWENST2hzK0xkUWFn?=
 =?utf-8?B?YjJUdVRwOElSOU9FM2t5TTNtejdkS0JCcTBVaU9iY2YyNkF6Z3QwZnorYTFK?=
 =?utf-8?B?UDdvUm1wbHMrYVBkY2U4dEJCbWkzSENvNmF2T01STDdKaVIrMUE5Nlp0L2tU?=
 =?utf-8?B?cnl0NlNWMmZBUEtYV0JhckgvOUlEVUc4cWsxVERGNDEzYXE1cXUwTTdwSnVL?=
 =?utf-8?B?V0NsZTZ5OTUxL0Mwd2liY0RuVWhONC9yUS9ncnNYb0Eya0h5S05GaGxUTjJM?=
 =?utf-8?B?NGlyVllIbS9BR1lEMnQ3NXgrZEFrN1FrWmgxSHJRZWp1Rm1VbnZUc3kyMmxx?=
 =?utf-8?B?alp3RjdiRTlBaEZwenR2T2ZYUzFIWDZGdUpsVVEybU5nNStDZkk1WnlHdkZh?=
 =?utf-8?B?OE9laUNiY1N0YThTL21MUnpjOFdXYmFpeis5VVZ0bDUySXZlTnJnUk1jVmpE?=
 =?utf-8?B?TThGU25FUkJtMHRtb3hZMkhpdjIxU013bVNCaDJTUUYveGxnUGhDSGxlbnlQ?=
 =?utf-8?B?ZnNFclN0Q2FQS0h6V0pCOFQ2YUh3UXVvcjVPS0hqSEcwR01ubGFqcVFpQm1p?=
 =?utf-8?B?dnFvdGhmNTVnMTdpZFordUNjdnBzTFc2MUtrTHE5djBaRG5tVk1HYWdLT0xy?=
 =?utf-8?B?UDcvOUFmb21pNFRxd1gvdzdMMkN6VmtCZHY0Yi9BemltY1l3QXdRTDNkOVE2?=
 =?utf-8?B?NUU4RGZ5QStpUGo1SXIzaytENVdHVXdTbEdXVmhuNng4ek1QWDNaeUJwUDls?=
 =?utf-8?B?TGZsYit6SkYwKzRSRXNHS3c2R2YxRkxmTXBCUWpVemY1cVFGbml3QjRTNWx5?=
 =?utf-8?B?RXpUR2V6dmRCbGQvcmxPWXNZekFSK2o2MGlhemQ3ZWlwbXRrT3VhM0pzR0pL?=
 =?utf-8?B?ZjFwYVhKaWc4NXJpOWoxdld1bE9EK0pVZVB3ZUFZVmsvYUlXczJZcGlRV0pN?=
 =?utf-8?B?dzgwdFZjWEY3QjlOelU0MHVHVnFCVmxJNzFNU2Y2dlFhNnlBWEJFaWRnVmUz?=
 =?utf-8?B?ZnNjditDSTZERnZlbms2T0U2ZFVLYWdUblhtcU5TWnY3N3FWeXFCWDZPNUc5?=
 =?utf-8?B?ZGpFL0gwR2o3RWx4WkRmZ2tqb20xdVFvdEhGRjJETzNmNGJQKzY1R21tZlds?=
 =?utf-8?B?TFJ6SUFwelZ5NHczQmNOaE9pa3g5M2FYTHZJZFA5THFWUVhMN0tpZjBOQ0RK?=
 =?utf-8?B?OFpNMG9sVlo0MWRPR01nSkpNUDlVbUtUUjlLQ2ptNTRRRU43R0EvSWRoeEQ4?=
 =?utf-8?B?bmc5NWZ5ZGxQUGMvUnFkSzRNWlM1NEIzSThINE5iWDZrZHQ0Wm5KMWtvdzdY?=
 =?utf-8?B?emN0OGRvQ0xJYUI3MEFRU0lKV1IrdXMwWStOL0NRRjRUd3lpd3JLOHMxUDUz?=
 =?utf-8?B?VEVGQlNxa0NHYk5BdHFZQmI1OVV3U3VuNDE0Vi9HWHdZbW9uYVMrOVZ4UWFs?=
 =?utf-8?B?M0RBNU85NGZua3B3Q0tMd28vOWZYbWRNVFJsOHluanJzbVcydG1qTGNaWlpy?=
 =?utf-8?B?WGhnY3E3aktwY3JvSEZzSTY0WWRkcUdsRnJia0UyeW84SGRWQVlWQWszcDhp?=
 =?utf-8?B?MG5nUUJ4MWlTQXFnczM0Q2wyVFFadmhrUTRPS2RtcUxSZHU2L2FaeTE3RXZB?=
 =?utf-8?B?ZUgwdjQ2dlRxT1hhcXBPUWJ0R3VLOFpwc01iZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1AyTG1qN08zSHBpdGc4TFR1RnJEVmZIWGo2Rm9qZ3FuSXJ2UCtNNmlJZEFX?=
 =?utf-8?B?dVdNcXVuM0lWSlZkRTlvUWsweXQxa0R0MDVxTHczZHdrWVBPb2FCQURUNk1B?=
 =?utf-8?B?YlJGdm4yMDFIdHZBd0QvK1lKUlNWRFZPL2J6SXRvOWhUdUN4bXh5clVBSkxK?=
 =?utf-8?B?cmVZVkdjUU1DaE9XQkhvZmFoSnpyemZvSlZQTjY0VU45Z1M0cGdFRnpNS0hV?=
 =?utf-8?B?QU81LzhzbnFsNkcvVnJiUkVKNzJFYlZCcWxxMkdqL1ZSQ1JMR016TFNQN2hi?=
 =?utf-8?B?SVVkQVQrVWpKeXcrRWRiU0FPdlRRcTJGdTR3ckMyQ3d1dXRUNzRSRndYTk5H?=
 =?utf-8?B?UFNpNmFzSFBKV3RZV3BldldJdUU2ZU5MZTA2cmw3dlo4bnZrdHJMQi9xbXEr?=
 =?utf-8?B?dktOa09DZHFYekdVelBadTR1SEFTSENJVzFBSW1ENFo5Zk1qQmQ2RzQwaXc0?=
 =?utf-8?B?S1gwZURBSERqMms2NHYwZENTdGZDRmxRMnJaU1FJQTB6MWZBU2NiS0wrRllq?=
 =?utf-8?B?WFh4SHdDZUdPZUcxbjJxSjVzSHRyQXh3SmdYd2xXSm4wWGdtYW1vbjJUUnFp?=
 =?utf-8?B?MUx6bzBDOU5lSm5rQTY4ZEYrYjZKUlBxUUd4dGpmUFhOTjZXSlR6bmsxWE9v?=
 =?utf-8?B?N0JmVUd4c0wrOVhJNlZyTVgrdWlvU2hPN2N6SlpuRVcrVDc3dC9EbjkxRDVU?=
 =?utf-8?B?YUdIYjNpeXdOWENlS1lFbVkvTytvTS9HN3dqdW1TQm5uU3RMclRRWlpxM1RV?=
 =?utf-8?B?WTVLd09sZm5obVZUWGFMbTB4WXRicWE3a2o4NWowbUNoalQ4UDQvMEF4Mmo2?=
 =?utf-8?B?aGdvNjlFWWF3OUlLRlFVUnVydlgwMVhFVVQ1MXFFc0d0aDgrRTZFSm9rQ0Zo?=
 =?utf-8?B?akRpeTZRdnhZT28xc1NNOEllSFNDZDlReWZyQmpvcG1kSUJWUXg3ZXQ0REFp?=
 =?utf-8?B?cFhNZHA1elc1cU5EcTM1RFVieVpIekNoMFp1TnpOZ3luT1Y3bGxoMkZhbTFw?=
 =?utf-8?B?NUJZSW9lMmY0ZG9VRFNCbU9tVmZpYVBjUkVBVHdPL0hCVDVXZW1NOWJ0VlRB?=
 =?utf-8?B?T1JRd0lhK3ZYbklCSDBObWFCT2RaMzFxdG8ySDRjdDdzbWJ1eU83ZXN0RFpU?=
 =?utf-8?B?WEJGczRrR2Mrbm9jN3g3S3ptU05NaHJSYUlIWWViV2hVTVVCMmFZVzFDSFhE?=
 =?utf-8?B?enFhVlZMU2dqbnhIeXBVTFZiQXA1enVPZ2d4ellWOXJJS21SbUI4ZFdtRHJl?=
 =?utf-8?B?T0lTbkx3RldhaWtRWWhZdWNaV0JyRnJQQUcweXBWTCtZVlgzTnQveGZQeGln?=
 =?utf-8?B?Snc5ZnVKWFZRRkdZWXhzVW90eTBheEpQWUVrbGZ2VCt0U205MEJGU2NQekgz?=
 =?utf-8?B?Q3ByQ2hocWNQOTFwVjBSNWhlVmk5ckFXc0xMTUJoNHRiNnNwVUdhdWZPcDZD?=
 =?utf-8?B?S1BsNjRmTDJpOTI0Wkdway94WjFabHNVRWVPK2NHQnc4T2hSV3ZMamRwV0tH?=
 =?utf-8?B?Wm9BaFJpZHhtWjJoYThUV1ZWdncrNXNQVHQyWUpYT2IwQWdyNkwvb29EUGlE?=
 =?utf-8?B?Q1AwUisxNTc0SXphMk9mUFRzT1JyU0o2amFhQjlSTHdocWs2OTZsMkVsYS84?=
 =?utf-8?B?WlQ2cTBsRXV2M3UwMjU2dmt6Q3pZemh6bElrbG9MYzJ5ZVZrMXlNSmQ2MDZO?=
 =?utf-8?B?czRKMkd6RHFVWm9KMXdJNWhoQWorMFpEUFpmSmdERFR6ZDkxZW40SWtQK0tp?=
 =?utf-8?B?YVByTGxXamZleDJjek9yZXlMdGhCN0U4N2FUQzlKNW1ZRUU0SGY2TkRWRys3?=
 =?utf-8?B?NzZ2QURQMWh4U1BCOFdKM056N2tmdU9nemhNcXJsNUlKNXF1OU5PVjh1ckk3?=
 =?utf-8?B?YUVURTg0amV4MjlVajA2WmMrZXlXN252UFdWY29jdlBWekhGVjVPTS9JR0pZ?=
 =?utf-8?B?Vm1YaFdIRHZQL0xTUWJmVFB6NnlCSU42T3ppbU9XaTdyR05HdDdNWkZ0Q09N?=
 =?utf-8?B?ZEVnVHkrc05STWxSbTFRN3NhdjRDQmlRbU5wVUJmalI1TzJOS1haMGRvamQ3?=
 =?utf-8?B?R0JjNFBuVTFoSHV4WVNvc04xdTk3NE1KQkkzaDBPZ2EvQWs1dFlab2dRR1hm?=
 =?utf-8?Q?NIaw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b781b-bf09-4cd8-62b6-08de1d5137a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 16:26:19.5975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pyg5heyEs+89GOl6rekNrbWQvQxRoDz/r60BraGJCRR+MoaWhqGG5DYTo5SPtjJL9gwSm0lPeXe877/2YhgG8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9999

SGkgQXJuYXVkLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBOb3ZlbWJlciA2LCAyMDI1IDQ6MTcgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndl
aS53YW5nQG54cC5jb20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47DQo+IEJqb3JuIEFu
ZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhp
ZXUucG9pcmllckBsaW5hcm8ub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEty
enlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8
Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduDQo+IEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47
IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47DQo+IEpvbmF0aGFuIENvcmJl
dCA8Y29yYmV0QGx3bi5uZXQ+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Ow0KPiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBDYzogUGVuZ3V0
cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0N
Cj4gPGZlc3RldmFtQGdtYWlsLmNvbT47IGxpbnV4LXJlbW90ZXByb2NAdmdlci5rZXJuZWwub3Jn
Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGlu
dXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8
bGludXgtaW14QG54cC5jb20+OyBSYW5keSBEdW5sYXANCj4gPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz47IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY1IDAvNV0gRW5hYmxlIFJlbW90
ZSBHUElPIG92ZXIgUlBNU0cgb24gaS5NWA0KPiBQbGF0Zm9ybQ0KPiANCj4gSGkgU2hlbndlaSwN
Cj4gDQo+IE9uIDExLzUvMjUgMTU6MTIsIFNoZW53ZWkgV2FuZyB3cm90ZToNCj4gPiBIaSBBcm5h
dWQsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4NCj4gPj4gT24g
MTEvNS8yNSAwMjoxMiwgUGVuZyBGYW4gd3JvdGU6DQo+ID4+PiBIaSBTaGVud2VpDQo+ID4+Pg0K
PiA+Pj4+IFN1YmplY3Q6IFtQQVRDSCB2NSAwLzVdIEVuYWJsZSBSZW1vdGUgR1BJTyBvdmVyIFJQ
TVNHIG9uIGkuTVgNCj4gPj4+PiBQbGF0Zm9ybQ0KPiA+Pj4+DQo+ID4+Pj4gU3VwcG9ydCB0aGUg
cmVtb3RlIGRldmljZXMgb24gdGhlIHJlbW90ZSBwcm9jZXNzb3IgdmlhIHRoZSBSUE1TRw0KPiA+
Pj4+IGJ1cyBvbiBpLk1YIHBsYXRmb3JtLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSSBoYXZlIG5v
dCBsb29rIGludG8gdGhlIGRldGFpbHMgb2YgbmV3IHZlcnNpb24sIGJ1dCBiZWZvcmUgdGhhdCwN
Cj4gPj4+IGp1c3Qgd2FudCB0byBjaGVjaywgaGF2ZSB3ZSBhZ3JlZWQgb24gd2hhdCBBcm5hdWQg
c3VnZ2VzdGVkPw0KPiA+Pj4gb3IgY29udGludWUgdG8gcHJvY2VlZCB0byBiZSB0aGlzIGFzIGku
TVggc3BlY2lmaWM/DQo+ID4+DQo+ID4+IFRoYW5rcywgUGVuZywgZm9yIHBvaW50aW5nIHRoaXMg
b3V0LiBSZWdhcmRpbmcgdGhlIFYzIGRpc2N1c3Npb25zLCBpdA0KPiA+PiBzZWVtcyB0aGF0IEkg
YW0gbm90IHRoZSBvbmx5IG9uZSBzdWdnZXN0aW5nIGEgZ2VuZXJpYyBkcml2ZXIuDQo+ID4+DQo+
ID4NCj4gPiBBcyBJIG1lbnRpb25lZCBiZWZvcmUsIHRoZSBvbmx5IGkuTVgtc3BlY2lmaWMgcGFy
dCBpcyB0aGUgdHJhbnNwb3J0IHByb3RvY29sIG92ZXINCj4gdGhlIFJQTVNHIGJ1cy4NCj4gPiBJ
biB0aGlzIHY1IHBhdGNoZXMsIHdl4oCZdmUgaW5jbHVkZWQgZGV0YWlsZWQgZG9jdW1lbnRhdGlv
biBmb3IgdGhlDQo+ID4gcHJvdG9jb2wgaW4gYSBzZXBhcmF0ZSBmaWxlLiBBbnkgcGxhdGZvcm0g
dGhhdCBmb2xsb3dzIHRoZSBzYW1lIHByb3RvY29sIHNob3VsZA0KPiB3b3JrIHJpZ2h0IG91dCBv
ZiB0aGUgYm94Lg0KPiA+DQo+ID4gSWYgeW91IHNwb3QgYW55dGhpbmcgdGhhdCBjb3VsZCBiZSBp
bXByb3ZlZCwgcGxlYXNlIGxldCBtZSBrbm93IQ0KPiANCj4gTXkgY29uY2VybnMgcmVtYWluIHRo
ZSBzYW1lIGFzIHRob3NlIHNoYXJlZCBwcmV2aW91c2x5Og0KPiANCj4gMSkgVGhlIHNpbXBsZXIg
b25lOiBncGlvLWlteC1ycG1zZy5jIHNob3VsZCBiZSByZW5hbWVkIHRvIGdwaW8tcnBtc2cuYy4N
Cj4gDQoNCkFncmVlLiBXaWxsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IDIpIFRo
ZSBtb3JlIGNvbXBsZXggb25lOiB0aGUgZHJpdmVyIHNob3VsZCBiZSBpbmRlcGVuZGVudCBvZiB0
aGUgcmVtb3RlcHJvYw0KPiBkcml2ZXIuIFRoZSBycG1zZyBwcm90b2NvbCByZWxpZXMgb24gdmly
dGlvIGFuZCBjYW4gYmUgdXNlZCBpbiBjb250ZXh0cyBvdGhlciB0aGFuDQo+IHJlbW90ZXByb2Mu
IEluIG90aGVyIHdvcmRzLCB0aGUgc3RydWN0IHJwbXNnX2RyaXZlciBhbmQgaXRzIGFzc29jaWF0
ZWQNCj4gb3BlcmF0aW9ucyBzaG91bGQgYmUgZGVmaW5lZCB3aXRoaW4gdGhlIHJwbXNnLWdwaW8g
ZHJpdmVyLCBub3QgaW4gdGhlIHJlbW90ZXByb2MNCj4gZHJpdmVyLg0KPiANCg0KVGhlIEdQSU8g
ZHJpdmVyIG9wZXJhdGVzIGluZGVwZW5kZW50bHkgb2YgdGhlIHJlbW90ZXByb2MgZHJpdmVyLiBJ
dCBmdW5jdGlvbnMgYmFzZWQgDQpvbiB0aGUgZGVmaW5lZCBHUElPLVJQTVNHIHRyYW5zcG9ydCBw
cm90b2NvbC4gQW55IHJlbW90ZXByb2MgdGhhdCBzdXBwb3J0cyANCnRoaXMgcHJvdG9jb2wgY2Fu
IGV4Y2hhbmdlIGRhdGEgd2l0aCB0aGUgR1BJTyBkcml2ZXIgdmlhIHRoZSB1bmRlcmx5aW5nIHJw
bXNnIGJ1cy4gDQpQbGFjaW5nIHRoZSBycG1zZ19kcml2ZXIgKHdoaWNoIG1hbmFnZXMgdGhlIHJw
bXNnIGNoYW5uZWwpIHdpdGhpbiB0aGUgcmVtb3RlcHJvYyANCmRyaXZlciBpcyBtb3JlIGxvZ2lj
YWwsIGFzIHJwbXNnIGNoYW5uZWxzIHJ1biBvbiB0aGUgcnBtc2cgYnVzLiBUaGlzIGJ1cyBpcyBk
ZWZpbmVkIGluc2lkZSANCnRoZSByZW1vdGVwcm9jIGRldmljZSB0cmVlIG5vZGUgYW5kIGlzIHBv
cHVsYXRlZCBieSB0aGUgY29ycmVzcG9uZGluZyByZW1vdGVwcm9jIGRyaXZlci4gDQoNClRoYW5r
cywNClNoZW53ZWkNCg0KPiANCj4gVGhhbmtzLA0KPiBBcm5hdWQNCj4gDQo+ID4NCj4gPiBUaGFu
a3MsDQo+ID4gU2hlbndlaQ0KPiA+DQo+ID4+IFRoYW5rcywNCj4gPj4gQXJuYXVkDQo+ID4+DQo+
ID4+Pg0KPiA+Pj4gVGhhbmtzDQo+ID4+PiBQZW5nLg0KPiA+DQoNCg==

