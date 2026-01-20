Return-Path: <linux-gpio+bounces-30781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKBeFXircmkkogAAu9opvQ
	(envelope-from <linux-gpio+bounces-30781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 23:58:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5906E57A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 23:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0474480AF7D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59647426D23;
	Tue, 20 Jan 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c1qfSgle"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF39421EE1;
	Tue, 20 Jan 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910372; cv=fail; b=HslUx6ZABAMypwWz30pGQcElOdzLQVhnoVbHMlAkgOD53RIqB/IJkfptw91QSpZX+0d3GTwu60cqh6v1TZJXafJwsJGaWnlBd4y1t/FQ8S2LSs8L8KE4gMV3aGCZoueg0J1O2HoTRQxXXMjdIXgYyyPbKQO4H/atWBPAHvvRD10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910372; c=relaxed/simple;
	bh=8D7yJ8zBxhTacc+49bbZcZSpL8XHqfZvAG0QYAS1QEA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q/kzUM0Bl/TV/FL43Q835TWAiV7EZ45lYlzkStJ2ixLM2hLLQWiYciulmzk/ZAOQf6oH9RliiyMCk+H1tIdn3ptOUvh/G8YiXdaVOvV1RzTBx73UzZZTP4PlnJ3CfwS/Lu+mu+/jmk/ec7mB9p9aJGh2f2OWZGRDzyHB6GM9xq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c1qfSgle; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBauu1w4E8trwEjVrdcN92oQSrldTADXfMtg43zomnqays8BOyLldTOQ5y9TrMTT6vjLXyA/H3lEr9d1HuPwoNDjQ1Dm0GDNSe9qVd6uXhRbgUNgH/VUrXj0bkzncojoXRfKVzOFWI1hJlbznwbYYK6SzMoFQo/R+MRQyZBR1aq5U4CwMeDp2ztnpLA034pA0qBCO7akI9GfPzMB3kH7DlzsWcIsU71ewIY6wDXVO7uEN/Kd5oiTNOC1iXw9f0qIkuNIoL3PGOfuqToa6fX6fCpLLGIAzqg7CT4rr4YsyDIaIbPg4fLwAFqkSz3TVdMZROmUq1A4EWl/WmCbutFEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKUCOduGXf5OZTFcrAvCNbeKRpNn5BD6S3bJX80/cKc=;
 b=cGtud9mumIpLWY6i7Oxl2ISU2rX2gtsQyeaNJ60iHXE+zGDAusus045ud5secQXWAbuHlMt8VFF4rOpyUhEsNbMNAM7u8G9XWE6X/9Voz3YzOHcwJa/VtwiM6pLmDayy2y/AkYS//vBtj4nR8RM3B+XFjgZKereD9zpIBNIY+Sgh4s8PBSKUWJPn0XIRv0TXJ8C1FJjV8OVLq/eN3f92+s5w4hFEexHy7a1raXASk1sgFhP7Wg5VPEpeqQ6Xhkn112IKevOu5kBhwD29XCfTib1gbxYXr3T/kNKdgm1yaxfPHwFSQZGGNvgFK1C7lkAqV/cQHj/DEwXlDrOEF0vbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKUCOduGXf5OZTFcrAvCNbeKRpNn5BD6S3bJX80/cKc=;
 b=c1qfSgleLgrcuPDfq/t6LSWNVhnlLA/2Q6dtUH2nyf9L4BKQOkz65GDG7M369hZ7uA8yYyU824JrTK3XnsIvHYMH+op3RSJ0BxA+cn5CuQRR+9TLn6m52bnaPrzq4r6Gw+hxB5mFtmCyzrNgsW7phEGpwku0m01wqUZOtZkQjBLyl07cSH9wBYhCJsnvWQHizTgaAetjvkRUqh0nD92Ivy2N8XL6fEd8RdN9gErelunUqtv5pHIJIQ8COOu6VUXVeYWIw1kADBkXcgROMA+POJkXBZ2BdtlsM+4Os1oFHfq2I0/L8MD3P6HvkgtxEx1FV8ArioL74x7S83ZZeXcA+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:25 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:25 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 00/10] gpio: siul2-s32g2: add initial GPIO driver
Date: Tue, 20 Jan 2026 13:59:12 +0200
Message-ID: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: e19a9f24-828d-47fa-aba2-08de581b5b80
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rVA92LsvS4dKyNyzDs752PRJhFeP+8Nku/hpB3eqj/TTd0pbb5MSk2PYq3ud?=
 =?us-ascii?Q?fADO52QML8qFiOtmY9uxiyYNI+BM61Zff9DVD1/5XVvfdyGU5SVob7/uzvsd?=
 =?us-ascii?Q?dd/z8PLRQi4OLZPHp/k4O4Kh66W/PYp8JFuKp7fvYyVd3ubk/QL8S5CR/tJw?=
 =?us-ascii?Q?eQGJ/kOGDoyLLP1XxC7hVn5k4dYKtOtKNuK3LJ77e2fqK79ZaKPBXi+hMFNm?=
 =?us-ascii?Q?T+Na0yZkvBl79rDaFSsxmwSX7VGE7f/CJQ86bEnkA9+DtAspvxcDf6or29b2?=
 =?us-ascii?Q?kNWUYJnx5n2X5cGK+6jar7NLK/IaLTUHUmJrzPR2XvHph6Xxpm/2+eJ9phB5?=
 =?us-ascii?Q?DD57y5DhaJm1yTSjaqUKdGmcvqz9mBMlY6590HLJJnEW1Rl5glyG8w+Hpehj?=
 =?us-ascii?Q?WWUmmhje2LK6LFauiAtWI7lmBqhKTOMZ8UAnuBzH+8CbVY0Z1PYWr7vQATOB?=
 =?us-ascii?Q?j1AThuX9ZTOuLEkvvyQ/8y8rxDa2P856eRlObrQS+6krQPSOejz8UC2GgNrm?=
 =?us-ascii?Q?PRMdT60MzC+d2l3MpQ3iOhx5K8ZDe5unVlLhSL3Dc4idzk+Wz2+NTxflbucu?=
 =?us-ascii?Q?yXqWxVqJVLfPBMeOt/whbf5ASAHNKbJTM8p6vuh5oYvLd1C09dv32EJZon5n?=
 =?us-ascii?Q?WaHYn4Vvw15NVCvwUl74BTYxD340h6xvWrDr2+zk3pndGKdyq+GfOQoGZNFX?=
 =?us-ascii?Q?Hr/JcY19yupQ98/J1wX63Fn4oh6zAiyhqM4sBx7lVSCCF9xfodPVHxaLemiw?=
 =?us-ascii?Q?KJOM0sC/SbGCDMzCdKQ8lbx5xmc4p2QZr4q4YvFjE0wTWot45WfCSmlnOinf?=
 =?us-ascii?Q?Mk0C86ESm7IqoadVHOy3O+svb3NeDURpL/7oFQz7LnOjmeHo+X/DTAmbyCjN?=
 =?us-ascii?Q?8SOpr4k1GlMaujgwEvlJ0U5AERPPT5EYMnqwg6phiMfWN3sAPZiX/DQ5jwXl?=
 =?us-ascii?Q?/g52dAgOG26iltBoV5AuFsFAkd74oiMOxERFG99ZxYvadfXShRYXWkGSO8a0?=
 =?us-ascii?Q?6IZ22tPgo1H8cqVpwXCz2DEYs+QX6woR5lwxy72oLSvIc32xFHjpoGMUBrdh?=
 =?us-ascii?Q?dBQL1TEQIPaQAF8SI1Ebp01K0N1OPR/0QrqYXqsn1+6MtVxB3D+R2i05uAri?=
 =?us-ascii?Q?p5geYM+6+i6JZZmtMYMcHrdtQVTN1SOvGZ2sXwE0EgmuosaAymiX/n9Ahtp8?=
 =?us-ascii?Q?zYrD2kHnJRcMsbRgM/SSnfmOW4RdXYZRqgdbgmzBrCW7d9hlBBsleYcvnfU+?=
 =?us-ascii?Q?JpeikwFbkspUPIP+Ejr4+6572hhRUJyYZX/DcXEnDw/XQKKnsNvGUPEU1P69?=
 =?us-ascii?Q?YqwleSf4+h5sCQXfouXd/vy7pGLtwbIX59q5MW5lkKOgWVdWi2zKdSh4xu8h?=
 =?us-ascii?Q?Xf7pfjgy8E7jbFLQulN1/TU8RNWei9Wc5rT5oLI040QYNAsRTuAmwsvHV8XC?=
 =?us-ascii?Q?x0R8I1MH+RSnEwaLJK1zjq4q23ouOv8xtFMmf1zSZsBBUyAvJbmRZLJtjEMd?=
 =?us-ascii?Q?sNGHaAC33QqERISrIJM6Sepb072eBuIiJABW/T8iCXoOmFgxNY2ghuMKXxK9?=
 =?us-ascii?Q?InjG/2yRL49o283PRiggfoeg7ZQIA1g69jmbvOY76nXUZabf33THBoFoiOiC?=
 =?us-ascii?Q?8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rm5XnnrQo3+R1qgt7XYl1xMaKcpPLdVVgKJ83OVuMbBf5aeX9aRRRa8MlukM?=
 =?us-ascii?Q?u5UY5FfYc88nshJc1LWyo7TQkIDpR4Uxvu48KusjFJRAZFPI86LA0Jszpn+L?=
 =?us-ascii?Q?fSZit/TrwHgQGd8OBwcTNRVOBf/rbMZz6IcRi07O4+2V9otyfucgLfshvNrF?=
 =?us-ascii?Q?E0FFRey9n+V38cNWfLKv9QMNwKONxObTBm+Kh7VyEE4s9pw8rAnfy43MfmZg?=
 =?us-ascii?Q?gtmrm3guixc+fuQFnpFvcfQc+6lQF68L+9fTgWde/NGbdppbPo4CK6WNyLsg?=
 =?us-ascii?Q?DCzaxaVTRDRJO8i9ekh6UzEHTx9VrYAxNSGxyIly32O2O0KgSBaNteR2U1Ub?=
 =?us-ascii?Q?IdQGhADQ/LtQsj4Q2DjpaSgn8MHwh9RWBmdXemfht4WJi49n4XKPsFPjsWb0?=
 =?us-ascii?Q?Ga9JYPP3Og667CWw/Esm/tNWI5X1vR/t4FCEEmC6qwkodV1zUYPrwR/Ghgff?=
 =?us-ascii?Q?feq8b3q2pdDrkmxmSSAcyE++AI9r3TMVssHB0Pk6BOS+AVirxm/btUUIeYGI?=
 =?us-ascii?Q?7JudSkHb518gIRiJco9xntvnI9lIVRKFFYTMqm0JKK0BqkMYotMj2BJkdzQi?=
 =?us-ascii?Q?tMe7bPqPAGOoD7bpvKw7YGreIQ1lsFzldhe3eAdkL7fPJeVVt+J9PTQoyIWx?=
 =?us-ascii?Q?yfIuxIljELerDMvkhHdDVxMtWeAyax+luid/VpMHmwNCvA+CJOMQyL/UFHj9?=
 =?us-ascii?Q?vRKvri3uJ4tAb1CjOguy3gGgGIP9ClfaYzIIqRzY5GCPqHsYWL9xMr5OHK/R?=
 =?us-ascii?Q?wEHo71DKVCVv3lg/uy5tQKqbWwAGP+hOSBtofECfmgz7zzFPQuQUydUPt0bU?=
 =?us-ascii?Q?49TIIHgvyVVZXBCUjd9HuhrYFIOGDePPptD9Mwy8zyNQ/faTKPENhZr/Qa4W?=
 =?us-ascii?Q?a7Ro2nzg0nN3AIbUVtUvF042jB6XGstuEzHjk/m8caqbXzmYdvYApenvNZPl?=
 =?us-ascii?Q?rRYJMTFgZo0DAFfsdmSLkYlfB2OCNYMD5+dLAyQd5fOvgJkHrGCRx/L2ScmD?=
 =?us-ascii?Q?MmEB35gJLwgpOolf5qdyaIASciv1EjLaie7fFRTFWJONRQdLT+RYEhrI/Amz?=
 =?us-ascii?Q?gojT3kO2J8uHa8G/ct3ex1R1TQaVOrKlOyn9c6SRwKgH2iM3nL13mNSuUSgK?=
 =?us-ascii?Q?Xau5m5SKzsORK+AF3ODKdPmp9HarQOuFxmWmMp1JMm61xI46jd03wSqDqjZw?=
 =?us-ascii?Q?rmoMNAzibKkzDM4mvYGQOkzSQqCZaHsiAZceTqZunM7Jlc+kNfXV75qUYbwC?=
 =?us-ascii?Q?B6wmMqqCj6ce5ltKMTUr77gy/N4QMWwiw4dJ9NUM1z6g6CItabJG2qOJIyxB?=
 =?us-ascii?Q?T4plQqqlc80JvU5e7AW+LOOQKLceLCNOTuKc3WQVohoZppBwEzhxdkktqZhS?=
 =?us-ascii?Q?SRDfftd+VXOxIi0XJzwHwg+Op33RIZaW6mbW/oMQUHJWc7xPLdAObfRvb2nS?=
 =?us-ascii?Q?TSQJNf5IvgkeOKcp8kL9wDX6slGD7bhc7l6Z1OZ96op1EATcMTafzTIEhZkv?=
 =?us-ascii?Q?NTbF0/0Ogq283euM4RI+j4i/dOfc+zmy/XYeDRzzYuoRh6hqV0CZXoX9lMMB?=
 =?us-ascii?Q?namDkeNl8gk0hfoX+aHU/Ed7WvjaXd3HkXDHOHKlBybDmV7NC98XGMkv50ki?=
 =?us-ascii?Q?ujb8ohffVuIbMkrCRLsshgYpBruoYZesdCJ3aeRdWpPYRrQku1xaS9BTd9jD?=
 =?us-ascii?Q?a8XXHpevDJ/bjigjpaOCewj/Z0ZoZK77s7b6x5jWTKHbuRYGOw/+LVJEiZ+F?=
 =?us-ascii?Q?V4s1KK0TCTYWIHrLLszdLnCo6wpUz7zDKuGupwqlOPC6INpzzYyQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19a9f24-828d-47fa-aba2-08de581b5b80
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:25.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MFKUOT0NAy48npqwxSru5KqabFq05AvZB17M/o74e1b7kmf2SH2cMaJolfD9t2QM7sja8hyQsjkucGo4njKrp4WRCRXwD/+1ZCmGPZtrSLI1GJjXMDGTSQ62i/gLbi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[58];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:142.0.200.124:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30781-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: BE5906E57A
X-Rspamd-Action: no action

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

v8 -> v7
- remove all ': true' lines from properties in dt bindings
- remove NVMEM MFD cell from SIUL2 in dtsi
- remove NVMEM driver and configs
- expose SoC information via syscon cells SIUL2_0
and SIUL2_1 in MFD driver
- add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
- add patternProperties for "^siul2_[0-1]$" for syscon nodes
- update example to include syscon cells with proper format
- remove `reg` property from pinctrl node in dt binding
- update Kconfig help text to reflect new syscon structure
instead of NVMEM for SoC information
- squash deprecated SIUL2 pinctrl binding with new MFD binding
- dropped "nxp,s32g3-siul2" from MFD driver match table
- fixed commit messages
- fixed dtb warnings

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (9):
  dt-bindings: mfd: add support for the NXP SIUL2 module
  mfd: nxp-siul2: add support for NXP SIUL2
  arm64: dts: s32g: change pinctrl node into the new mfd node
  pinctrl: s32cc: use dev_err_probe() and improve error messages
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32g2: change the driver to also be probed as an MFD cell
  pinctrl: s32cc: implement GPIO functionality
  MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
  pinctrl: s32cc: set num_custom_params to 0

Khristine Andreea Barbulescu (1):
  pinctrl: s32cc: skip syscon child nodes when parsing funcs and groups

 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 +++++
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  35 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  35 +-
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nxp-siul2.c                       | 440 ++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32.h             |   4 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 652 ++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  32 +-
 include/linux/mfd/nxp-siul2.h                 |  55 ++
 12 files changed, 1259 insertions(+), 177 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

-- 
2.50.1


