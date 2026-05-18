Return-Path: <linux-gpio+bounces-37073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D6PD7UhC2reDgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:27:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAE56EBC4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54C29302DC1C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7A847CC72;
	Mon, 18 May 2026 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JD649LyF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA803D330A;
	Mon, 18 May 2026 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114305; cv=fail; b=PghaRebN+o6uDQS8/Z2zS7XgFCEDCtEPLoz8L2RsiZr5o5fsjDCf4ZtT2tQLeEYT4df1v1yxPPhzNhiXcVRWKfOoNjaDs7cUiYXoxhuw4cZ/bi7jN9phm2EmPgdoEn80XVm1L8zeS/l/skbMFMwlYKIW9i8uhZBKhLa/DllnKVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114305; c=relaxed/simple;
	bh=gtDkKBoka/4fPhh9RFpwNZkNfPLoLPSj9IS/ZG41XPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pULXC3tKGizLuqMYDzBFmQ81fwJBwSWL/iocM6fsoVg2HpA2Cj9OuzLaWPArxiT0EXZo5oCr5Le6fM0ELYijDyv8DTOuKhLf5t6Ywq9+ARSiALSte4OPQWecow7v5SC86JEK76qtTMXI+980f35tX0STWOHkXRPzjCbulFje7m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JD649LyF; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn/DUjonm5cW2K+AKb2AXlddk0+XiQtev8CX02potS5OaH5+57nQhTDoZtC+g/SQ+UIppWgDxxgX1sYWEMtiSHhk48/4l/m4jZqfBZDbgDSoShh9e31rAhvTR6eI+2is3oVEA0OnyDzdFLo/edgmy1G2uK6q8J1bK1TDIyWS2tedSwk17uesTlnppEfwtX7H4w+5n1ozuunrb26PlJGq7CF+plrm1zqQL2euFQz9ZhOFAVlxEbr3Ycc679Gfj0cEhEJEVAOzs5v7+kM2NI0Vk3J8sZzPrSepiuN7QKgenjgm8XTbUJclDTJcTdAQR56keLwzVUQOj6mNso0LB1BjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxHm4meEDR/VqQA5H0e8VZkmUep5xrh1RAghaDopVXc=;
 b=B0mAkfcleZxB0YxJHriGOI9CPF0sLWyaulU9dH818YVMYCHQDixObeeEzhbKP4XVTjiQTE1pXR38t8W2eSsr5/KEDvKDQIucbSCdsxXu//Ko/CUhbQH2vdCtqB45LtlylN2yPTfm9Mo0EykLXAJEF5rYGeZo3Z91v5+nZIeterByLyfCsLpiEKIIkD94TnEI0WijpzB7jzKP7uGAjtigdiorIz0d2PSToQSgO1Ylm9mw9bgkaWuk9cJzkw3auuWaWY8VJChjIxGqBIyM65t38vxU7geuWtUhLwyRfS57mQQ3eXVcfGUWIEHsUElR5tXaWnRd5IL8e9DgrmMKvLlmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxHm4meEDR/VqQA5H0e8VZkmUep5xrh1RAghaDopVXc=;
 b=JD649LyFqZURxDpCB7eWadVS//daWutY8YoloIfOECbQKpcOQAAy++SbZdwMrVfdEnEYXFExn4KB8EWGmouKLDghkrN8l9hXdQeg0zRrzwXMB5/2H9Ot4na7DA2SgB9jfGWTuNE4HvWCXN+G/DAXtwVe3Q+P7wzAu8d1a3R0+lfeTXOuLxHQVYuzUQFsERFzX3biw+UXj3ZUgekjOsmCrBHXXfSfcNw29elctgg++ApItV3QrC53ejgN3Oz0qBPzb0meav0Wij2vxs4qIwqkFqDRBpJX2PWlzz+KN199uSgI2UtOLHmxFO//XwYKGvT9UJOoUK5z+WIpT1Q1q6efsQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:24:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 14:24:52 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
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
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc5tIXt84GDNmf8UW04dpFalLnKg==
Date: Mon, 18 May 2026 14:24:52 +0000
Message-ID:
 <PAXPR04MB918587A8812B51BBB2A46A2C89032@PAXPR04MB9185.eurprd04.prod.outlook.com>
References:
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <agYHzH-nJLl1HFIn@p14s>
In-Reply-To: <agYHzH-nJLl1HFIn@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8566:EE_
x-ms-office365-filtering-correlation-id: d0ac6241-20cc-47c8-52ae-08deb4e93a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|18002099003|56012099003|22082099003|11063799003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 U1ZutsWIEoHWD0nClukdc+2LWVu6209SN6YbjCDw/tPNDf5o8sN578GO0482igKzgnPkGtW2NqOb0hR77ls5G9hL87QmYB4YOgukCbmwb1uAqUObQmS6dsANeec1ludvxwbTzwFcBeeqs4ArUJ69mhoceCCFonTvV+oWX5++IfbLQ+PSbqT5DRzzSSmCdAGUXOvz5O+HlI+dankOg5upYu5NcxAAKxqvEMgTyGF3Ow3HJFOhPTt8SXXVUPGLjtk+HZGKryU/gfv/5dh5nMQCtXDCG5z1E5Le97k60JQEaQEWkUJK1nvMRiKlusbIIuU8AhqEDU+XsaWivE9qHtaoEvwvfXMhHdLIeot5apDXpx6VkRqUB9fQO1nZbHxqeMPlmNqdeSqjFXC5tPJRwT9+L/h3jBeFWcIMMrfiWCU/qO/7TxMxtTUCadp38iiI4MxF5Uc3sl+YlnfWG/ocZpIoAxqhi6GdT3sI3OP4YxToZzTbHrZ3C6Iehf/S3I1IOwv9k7l7dDb5DBauW7ekAa3jjDxIqoeIATq9JRgNDn0F6hMBhGAuiGrUp5QLsY60QPCk+OakHb93zTZwVZjYsc6SoismQ9o9Y3XxWJ1iacBjq4u+q/cVbBgHFOHKgyh85ROgaCLooFnyLEFqpIzEt1b+oB+ZBpU61HcEVvymfo4fUw5f5knCZSgjaNcYTNS0t8sfPhYinua8DXZrSZ0XF1N8lmDUMxFJ8QHMSm4uK5B/TmPgUFZGgHAqBji2ze3/0bQz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kvJ1K/0MTw5f+vLk69iqVnMvUwPq7F485yLiwpVsefAPxpLogCaHppRD9fih?=
 =?us-ascii?Q?3/DV6j1DuiekbHrTJB0KngRzuD2Cf/acHnROlG0YL8okrt5iivPumOL4BMhc?=
 =?us-ascii?Q?L3jKgARg5BkMbYDGC3CSEi4bXHmETSm02jkFouOmUuz4kGbgVLAA2qmI0Ae0?=
 =?us-ascii?Q?rE4/wvjkQ+V6VunjqR8mXkhMHRU2Mh+BjKlcWYtvmil9IC4IAE7vcZNvaWF7?=
 =?us-ascii?Q?G+wFphozNKkI7y4HRBFcpCSWyzhJVJDIytoX25zAYzB6WN7jkNG2gS+Ld0UG?=
 =?us-ascii?Q?EY5F2k8PFUrIkRuuhkVRYyASX7WeqbGL6S5BvH26Sh5AubUj6dwVdsZWsM3b?=
 =?us-ascii?Q?YU8rC+oEWC0L3/JaYT7r+TRO9KSHYCI8o/VDjTzzJw7mEJoRdgnwVfqExert?=
 =?us-ascii?Q?TAttnPvzPp+EsJx2VNG4hz7RNDy2KFUQFfMP6626CXBCcbZwaEPEvrHKhr+e?=
 =?us-ascii?Q?8Rt8ZdlxTvVcCC+KD+80nbOH/SktmeAD8OrbzC3WcwMHBUn3hviVAiNeyJwS?=
 =?us-ascii?Q?fva6Rjp+G7Ar6H60cnczBiRTtwLsuDdiG23z6dtnXS30qS4NnQXUfrWcdFVI?=
 =?us-ascii?Q?P8dgcXFFNnCrOhN4dVAbF4usru3KebaXBJMJb5zFw+oiQCTSmHHAkuI7O/7A?=
 =?us-ascii?Q?ip3fbWqvy0KwQjL1CpjohupT0ncWMpODqe98mk075QzoAi/xoY/BIx55uEHY?=
 =?us-ascii?Q?rI6mYYljwmxbIyHXwHfNT4bP/1JsD/9LwdLdJP8BzD9u+0PxoGiQ9+oOTpob?=
 =?us-ascii?Q?XsY5M1DcGv1/IEnfUu8wXcVwr2jMOMQmVrjdLD8hNHgEhnGSo3YzdnouCK8w?=
 =?us-ascii?Q?vFzN7/L2VI/aqdQmKB9Bzi5kBxjPdKV/zx1Gs1C6hkkNkUt4cvNDjZXSETZA?=
 =?us-ascii?Q?ttzyteYWBF0dM9gMG619caB61Syialsf+9DPNjAUjjXutS52FKuUiAMFLam/?=
 =?us-ascii?Q?GJjKVGoByC5/ZSDJrkF9TC3BSUyXRkAS1DL4IDFiaEtvyTnMQxELzUQmyoy6?=
 =?us-ascii?Q?OZBztcCEg4Jijjy5YZ1vKvFzWBBYo7Pc8TqVQF3MBSjUY5HnUzfSsxNS43E2?=
 =?us-ascii?Q?kV3TgjCD8w3P5eQ9mEAjOSfoyj49HRWPKxU0Ij0a8Je9FeIQ9Vsxpjs1shfB?=
 =?us-ascii?Q?UE73or8pBrF7+XwhGUqUNswMqXDhdT0NV1be1hpGVYE6+I4SXHlH8HFpD9KU?=
 =?us-ascii?Q?Fo/AIf+XpwoSNiZw9eXTrNFSgiUVuLAfhxbvkDNLVM4TaP3QhrG9DYPjQ22x?=
 =?us-ascii?Q?tKN3q5uMpv0FcSuqHD5NlqR655lNX/RCYtkV+5ubfejCMwtrKCLWeJxkDERB?=
 =?us-ascii?Q?F5P1yHoPb6/8DhtgqRekzxAWV+fTvlHynqwfEyzSRaMR+fgNMyibjE0Px1y0?=
 =?us-ascii?Q?olRsh33I+skRWliDQPwyVPGmmLF5pEw9O4kRiq66+uIlbtJq+NLmd+x/D16q?=
 =?us-ascii?Q?xWZkL/AXsXvEanJU6u7UqFGW7cwad4EFkHu42K4ZcLO13r2SCXFUZRsKnVhh?=
 =?us-ascii?Q?oMRHkEG8rKD/pK2B2+6XuOvkYnQlxd5ZhqYN6pWAnQNce7llJJDYER5uPRfm?=
 =?us-ascii?Q?s9IxL3c3PqIyMkcWIxyfYGVLRxccJxAU2lX/5NpBBV179Ihv1y6+1iQf55ec?=
 =?us-ascii?Q?4c2d5kdWShOidkhOlz5QnweTR0LCllpjVi10O2WzuKh5HYk1k+FteVvzphJI?=
 =?us-ascii?Q?u2OKsFi4eA4HHsq0rTYj9MRnka2Vw2sf+RurH3QI6QBRcb9H?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ac6241-20cc-47c8-52ae-08deb4e93a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 14:24:52.6773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X090dRCRvWPZqulirG8/212UIsZc0XOKVIgOP9CfAZhqqcXed1BHrM7xMqBpCaqxAi5GqsORtyYK27nmAAHCKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-37073-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,ti.com,lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:dkim]
X-Rspamd-Queue-Id: D2FAE56EBC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



=20
>=20
> On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
> >
> >
> > > That was my initial approach.  We don't even need an additional
> > > "rpmsg-io-*" in rpmsg_gpio_channel_id_table[].  All we need is:
> > >
> > > /* rpmsg devices and drivers are matched using the service name */
> > > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> > >                                  const struct rpmsg_device_id *id) {
> > >  +     size_t len =3D strnlen(id->name, RPMSG_NAME_SIZE);
> > >
> > >  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=
=3D 0;
> > >  +     return strncmp(id->name, rpdev->id.name, len) =3D=3D 0;
> > > }
> > >
> >
> > If we encode the port index directly into ept->src, for example:
> >
> >     ept->src =3D (baseaddr << 8) | port_index;
> >
>=20
> There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would=
 work
> but not optimal on two front:
>=20
> (1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As su=
ch there is a
> possibility of conflict.  I concede the possibility is marginal, but it s=
till exists.
>=20

I think there may be a misunderstanding in the implementation. In this case=
, we do not=20
need the return value from idr_alloc.

When the driver calls rpmsg_create_ept, it can pass an rpmsg_channel_info s=
tructure as an
 input parameter. This allows you to specify the source address you want to=
 bind.
Please refer to the definitions below:

struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
					rpmsg_rx_cb_t cb, void *priv,
					struct rpmsg_channel_info chinfo)

struct rpmsg_channel_info {
	char name[RPMSG_NAME_SIZE];
	u32 src;
	u32 dst;
};

> (2) By proceeding this way, the kernel exposes the GPIO controller it kno=
ws
> about.  It is preferrable to have the remote processor tell the kernel ab=
out the
> GPIO controller it wants.
>=20

If everyone agrees with this namespace announcement approach, I will prepar=
e the=20
next revision based on it, even though it is not as clean as the source add=
ress encoding solution.

Shenwei

> I am done reviewing this revision.  Given the amount of refactoring neede=
d, I will
> not look at the code.  Please refer to this reply [1] for what I am expec=
ting in the
> next revision.
>=20

