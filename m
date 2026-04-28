Return-Path: <linux-gpio+bounces-35711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNp3ARzT8GkSZQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:32:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F846487F21
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51EE530AAF84
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1823382F08;
	Tue, 28 Apr 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RfOuTr12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A73195FC;
	Tue, 28 Apr 2026 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390294; cv=fail; b=Tdg99CTqfIiVs7BR+mrE8mqDryY06H8M75MMQsLBQ8hUqtT1zJgUevTHsmQhjubmsiHa50xIFshlp8+aLTktOlexpmchhHdK5eHxg6H08HbQ5haBZzphPSLCzOEK8s6rStDmdZ6KM0QEQAKqKp66IrfToGWH/HqrtkLCBQthpmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390294; c=relaxed/simple;
	bh=Npd6BpJLTQKMkGvkRAGLLi23p+/4cNdaddss1/B6gew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Us6qBaei9qSN4mJPEnHCJ1MJGsXhNGOZ/W8h1lJFmmiuA1bMShlvCfyFCm4HptgOF70ITfor1vnszJWU2LQnxFjU/SAOp4OLr6eY2yhMInwzFsiemvSJmwo2FmYFD6+Hyi0+Tpjs2TFV0NsV0xMcJ78E0SWGnH4Lco4YKFXwfU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RfOuTr12; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7eQ8wJNpg/cZAsAxQr86NY7d8ZM9wJeOIj/Xj7g4lTQkLoUTMQIEOo4Fp4laEDKwxKL/vnLpE/gI03oZ4r6yY0spXJ5BoLXjgY+0Q0nmOmD9Rfz8nqOarmBj7mlHTtJ8zdtEd8o0u/8qiq1UYn0t92UXJThlYAbf7qT1HCk0Ph+juM5QtXIenu0J+mlfnwkxhIPheGg1ZNumOZwhjvrRp1dh2i1dozYIBB4dvW3Y4lAcQcrupq1ss7wzAGrtifBSfezI1zf46Zuij1udQYeNO7wraHLoXLLdqA/dzDozkOB/zGqYUzkyH4FdX7U+j9VVhEMwHHEjMj73slB7qIzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZIOjXBuGroJou2XusPvBVI/ywEqY3wJxtE+DYMo1rw=;
 b=t46/0Cl5C/lme2QQ0M+bQznrBhm99Hm27uHXvYYtbMuht+4jdAFfUHnL3EIHzqosu+t6bqCLJjERieivo1qszM2bB0r3H3U4D2QbncJHJM0bvWPJNj9TqLQTQ9BIPQX25H3jpIWwdQkdKuB7B7bmAB1rMz4TAa82eCx2ENnCCSSt7WfFcO9SKUGqI9o0QnauLNes9VQ7zhVZENaqugF/uNI59+omOlnBMruIWmVgLk/gvoqM/krwCTirOhJ1RheN4D/Yj0imtgdvwlWcAvB19zS3eb3PsPn53HF4wgwwUQWsXclk+J62598t6ZSwpF4fFymVT7zsQ9qemKyQyGGWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZIOjXBuGroJou2XusPvBVI/ywEqY3wJxtE+DYMo1rw=;
 b=RfOuTr12pRnkZyYV+f1g15HGgYPQ+CEnXHy/cUwyQh+8lihmd++A7ea7/KXMQk/TH+Gs2G3ocyp4YkQb0Lagyr2cqfsh6LqjqTscXJrc+k85aAfbRIVVEhOaR6OdqTOuSYXKFvrbXz4f4/W1FuYg/tCBmwFG8Ux+3ChoYR31Rnstjnj7UKhkzJKrXon3dtLLzzTjjgvZchjqwry0b9+Q1QSg+TLMYCQpoQz0JDO7V+s9XVgEpZyh6Ns8cLmBT/flRGiJngrbTrftYjcPn/ICZ8y2ccvq7YMGk5pSW2XHpo2cxnzom0BJJW0wafdsa/SYWYH/jQl2U+D95PCX8+/RNg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB6914.eurprd04.prod.outlook.com (2603:10a6:208:189::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:31:28 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 15:31:28 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
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
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc1yQUDHfmt+MPLUilYvrUYpltcQ==
Date: Tue, 28 Apr 2026 15:31:27 +0000
Message-ID:
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
In-Reply-To: <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM0PR04MB6914:EE_
x-ms-office365-filtering-correlation-id: 62370773-4a07-42f0-5cc3-08dea53b3732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 NDg/KubipbOin26J5vH5UEbuScdEXoHaO0/E8bSUEblkDX24BklEimXQebD2saI/YjmRJEYpvwAw/8ITsuF3cx28valWbVJbgeGfmA0ZHL0OkIFaNEAu1Sfqmpxp4wf/RU7e9Bib8dSL/uDXBMdnRrvMH/0WBgP0+WH8Q0KuYvU5K+6oyomFOOY5b5VhQjb3hKch+g5GKiuS6M+0EcCPA9Nc+Le8ajGlC05FDT7KgWEWqY8YL2Hlg7IifcXEZvs7XXXwXemWUBEYHuDmERHxYFV3u/caE6ukgeeWCXxoxLRSdkqn0dFc84APCLquBFo51ckikI/imm6eiReVe/avyd76vrxNtu5Cf943AJJuXs+vE1S2qmL9Zwfv8sY9Eppdzhss4gdFFZG1BPfVu2jVj2giqdOnD7H7mku/sZ62vdbxUfJ5+3o6kJ8UXtR9/vw4QC6/l8gFp+R3w+nou53uFrfHsGY+flJeneinQfEJtT4fQ2tPd6dgaHPU/ASmiBrv3ARdkDD7SVqImmRTskWXPUB+kHzxNTe4T50PVIdi7NfJMh9bWgygznFC8SDEJ5Tmya/VCpMASs5ukzFx5msc031dot4SoDFLEQck61utDvsq8Y6hWUHzCOT+0HErVA89lOZ+5lXqU5VLkmD9g/C17FFRqcTZS8D/GWQ/J7NQE7RMLVe88smz2WsvdqQJbKUlacFAi/IgqyvGm7Q/3lslgGMVtnI1doPIt2gyuEK1jUG0BDmxpeqDUOR1J4Crt4Uo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LkW4IBvr/NMDx/PYNij9q4KsOU95Q7/IRRWrIttZZZYHdhc//b/94eHjKBqP?=
 =?us-ascii?Q?m4W5LCIOOXILrHaWktUZcOysnQrH1RF8grcpnO45XLEUApRcL+J5b2rRa1Vi?=
 =?us-ascii?Q?U43PyUMa0e8Siw5QYW71KV9ybeIJt4qlNLtmS1KSh5cIIEhkLfiu5XV3MAVE?=
 =?us-ascii?Q?66DO1fknvu9VsvFg8c1jl5Ou2dP7PHOznxH2IH4tl9FOcCIkmOxgAi/8NNH+?=
 =?us-ascii?Q?fkpLyK4LbRi79M55si6VeIx0nrR2vx54JIC9Ozm8Ylzfvyar5gOzTelbmnC0?=
 =?us-ascii?Q?cDZgqhIy6zn4SAFlxhfG7nHDHkQWGcr6fUEqOQjQbW0YSjX/WMiC6JGWtdXB?=
 =?us-ascii?Q?wTSI8QmckzR5Rs1/MFfbOIHH0G5r5WEf/EaOxXJEhuQxaRHhJKuG090reu6C?=
 =?us-ascii?Q?+7DTTEHZreL/nlVx5bO2lAgnfy47bChimK8ZQT+58S9FGZmqR8ILL50q0x9V?=
 =?us-ascii?Q?EFbyQFHWq7i7I76+X/KjWJO6rSFmf9+jd6ImX7cOZFv6rTq0OIuwXxIY9WW3?=
 =?us-ascii?Q?Zh+jPGw2spW8bxoqr+SlUy5Sw5mflMiPTD5Ppc75sCaIqyjQQcybDj+LInhb?=
 =?us-ascii?Q?dEcG/uMDh1UdiVqII66JA+OfSbvQbLIEYEU7KE4DTgYf8T64ll3VqlOxmY2c?=
 =?us-ascii?Q?N02TjSotZ2Ep8mdQo/ZBGZKZa3Bb0bAP/DNhvh185EIDOxplkifSTmDvJnzx?=
 =?us-ascii?Q?6qMClI3NagPDrQUblJBEwbN+09U24Ibd0TGI7fZwazM1ay8ksrt1esvQiNVH?=
 =?us-ascii?Q?tEAR02rxrtjhemv96F1y3Yao2AufWI0xRm2AB0ux69T+IF8it9hgXZU6Ag1s?=
 =?us-ascii?Q?brY6eg1rxZOpbUUte1Oe8/pHT83rzDI6FNjx+C9HbngZd1ZCBS6hRKudTIQa?=
 =?us-ascii?Q?LbiLAc0aNYevFrNj4aVF0m1DZIsVRsbiZfUxGOiSmH06ceau9XD3VuwoUjhW?=
 =?us-ascii?Q?RpHS7SzOkTZZjce4oqpeezoJAm5yOqBun5rqNYL6+JnXVgyhm6NuNEXqw5gd?=
 =?us-ascii?Q?WwBJQp3V8rhFOLPTbrmrIXjZ6uLTbRgAA9ukhTiBMmcDrb7IvOLbRGWHHwSz?=
 =?us-ascii?Q?0Ks814njaVK5X11aJHcUXTD2bwqMIgTkKT3PWuYH3ICv71Ol1EnAEgnN2+rX?=
 =?us-ascii?Q?ahZ+kpOPuxC3syN6RmgKLDsxo4DDcGL7tfGh59Kt4M4ICQ5dH2QV29OoarPJ?=
 =?us-ascii?Q?btg6Yb6oahzMdkHc5XWUl8uUHCGaT5gZSSJdxM4E0z+MvFiyfOlLuqJhukhx?=
 =?us-ascii?Q?eZ3zUMX13GrjQ7AVdsmywOnoVG/qXGPMDgUZtPa6ha+PdqQye2Ga+lZEqq7O?=
 =?us-ascii?Q?K02+zrwEBxULC0/Sf2AvIuNG+qlvgE4bSHyEBKwu+qcppS+mo91D1xh3lfSa?=
 =?us-ascii?Q?shvt5cRnb7/D9TccuxfyT5WY1hRq1rxvo+bCKzCuabS5B9SuT26DBIUBOfip?=
 =?us-ascii?Q?VvhxR2uryzdOQkZ1LhgTLN3QcXQ7tV+GDPmOtI3TfQshgOjm5IYA/V+Yi8Fm?=
 =?us-ascii?Q?9SRdqJp4ie+tViHwr5fcoA+PojIpmi1j2HPaPBSBiqSTemtqh9rc4xDKqaHU?=
 =?us-ascii?Q?/j7C4kbi+yyzn7aznuls3eqQxmBS4xBq9RdKnQcXUe5ez7vlAJlbAa5yVvvH?=
 =?us-ascii?Q?tt/NCJ+kGcSs8p3WThv7Qqv+R+99pcGb8KbDKrGEyLsBHXpWH4GduQe/ImbP?=
 =?us-ascii?Q?M64vYht5qlhgdXVfrGDdHS7bIjvS21izQTlVLpJIejKLCZEQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62370773-4a07-42f0-5cc3-08dea53b3732
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 15:31:28.0638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHcJ4WFUHf14iHW4t6hPUQgJr5bZjoUiHu6WEOvmMJLzBdPQGl5u5p0+/X4qSMypKpON8aVePdLx2/fQVY3chA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6914
X-Rspamd-Queue-Id: 9F846487F21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35711-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



> -----Original Message-----
> From: Padhi, Beleswar <b-padhi@ti.com>
> Sent: Tuesday, April 28, 2026 10:11 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; l=
inux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
> Subject: Re: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPI=
O
> driver
>
> Caution: This is an external email. Please take care when clicking links =
or opening
> attachments. When in doubt, report the message using the 'Report this ema=
il'
> button
>
>
> On 4/28/2026 8:13 PM, Shenwei Wang wrote:
> >
> >> -----Original Message-----
> >> From: Beleswar Prasad Padhi <b-padhi@ti.com>
> >> Sent: Tuesday, April 28, 2026 2:25 AM
> >> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> >> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> >> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> >> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> >> Hauer <s.hauer@pengutronix.de>
> >> Cc: Shuah Khan <skhan@linuxfoundation.org>;
> >> linux-gpio@vger.kernel.org; linux- doc@vger.kernel.org;
> >> linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> >> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> >> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> >> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> >> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> >> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
> >> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >> GPIO driver On 28/04/26 00:53, Shenwei Wang wrote:
> >> [...]
> >>
> >>>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
> >>>> So this is technically a rpmsg endpoint (struct rpmsg_endpoint)
> >>>> without naming it "endpoint". Every rpmsg endpoint has a reference
> >>>> to its parent rpmsg channel (struct rpmsg_device) which represents
> >>>> the same information here. So we should use the framework standard h=
ere.
> >>>>
> >>> Yes, agree to use "endpoint_devices".
> >>
> >> I did not mean to say to just change the variable name from
> >> "channel_devices" to "endpoint_devices". Infact you would not need to
> >> have this field & struct anymore.
> >>
> >> Pseudo-code:
> >> 1. Add a 'struct rpmsg_endpoint *ept' field to struct rpmsg_gpio_port
> >>      to maintain the ept to port idx map.
> >>
> >> 2. Call port->ept =3D rpmsg_create_ept(rpdev,
> >>                                                              rpmsg_gpi=
o_channel_callback,
> >>                                                              port, {rp=
dev.id.name,
> >>                                                              RPMSG_ADD=
R_ANY,
> >>                                                              RPMSG_ADD=
R_ANY})
> >>      from rpmsg_gpiochip_register().
> >>
> > On the Linux side, we invoke rpmsg_create_ept. What is expected from th=
e
> remote system in this case?
>
>
> Nothing extra in my opinion. rpmsg_create_ept() just creates a dynamic lo=
cal
> endpoint address for Linux's usage. The firmware just has to make sure to=
 reply
> to the same endpoint address where it received the message. This should a=
lready
> be in place IMO, because currently you are sending all messages in the de=
fault

Since rpmsg_create_ept creates a new local endpoint address on the Linux si=
de, how is
the remote system expected to learn and use this new address for communicat=
ion if no
additional logic is added on the remote side?

Is this handled automatically by the rpmsg stack software, or does it requi=
re explicit support
on the remote system to exchange and track endpoint addresses?

Thanks,
Shenwei

> endpoint (rpdev->ept) which is also dynamic[1] and is created when the ch=
annel
> is created. And you receive the responses correctly. (Unless you have har=
d-coded
> the default ept address in the firmware)
>
> [1]:
> https://github.co/
> m%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Frpmsg%2Frpmsg_core.
> c%23L480&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4ec06bf01bb14dd
> 2625708dea5387471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 39129859078622527%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> 3D%7C0%7C%7C%7C&sdata=3DOUmjqOdWqiXSTjPDv1TUvrjKP1YTx9ji44SdGlIR2n
> Q%3D&reserved=3D0
> (chinfo.src is RPMSG_ADDR_ANY)
>
> Thanks,
> Beleswar
>
> > If the remote side does not need any extra support, this would be an ex=
cellent
> solution.
> >
> > Thanks,
> > Shenwei
> >
> >> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
> >>      rpmsg_send(port->ept, msg, sizeof(*msg));
> >>
> >> 4. Get the port info in rpmsg_gpio_channel_callback() by:
> >>      struct rpmsg_gpio_port *port =3D priv;
> >>
> >> Which also eliminates the need for struct rpdev_drvdata as you can
> >> just do
> >> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
> >>

