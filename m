Return-Path: <linux-gpio+bounces-36410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DNFO3Xr/GmgVQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:43:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C94EE260
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE2A43019F12
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 19:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B144347CC80;
	Thu,  7 May 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Tb5N7ZLv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D692C0F81;
	Thu,  7 May 2026 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778183019; cv=fail; b=gzHcAE7+t0Lx3MR1Xuv8+UVzN0ixQ4R3oOyOvR4o9zo7lSfywN2iv1beh6CQzK4fjNe2r/SLXlJOELnS9bQSJ157sUm5MEO77zDvO4DFP8MT3ESmNlf1sEYE9GbYWyt8UjAQ5e0fhTTBgwc0ViykiS76vMEw40pCSwgR8thIgms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778183019; c=relaxed/simple;
	bh=qLygzQtVLqCYEh0JeGMRN3C86VKDf7xuNkAlc1skezI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a5SeWvh8UiuRmNrIBL+HuElQrmnK6r3o9G8Ms44cTgMQ1ZKh4NUj+MgxHGodcQT+IcNxgPPHF/pV+7Gb5VIfkf7A1BcovLvVGupbJlV584uQkVev07d+hTqN2iA4aeVIm3R8iOTYiM60wU/44A5An23I/1p74E8ICWraX5xbD6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Tb5N7ZLv; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCwMv+Ab/8JDbVmHdlmmdj77qp0dkGUm9aYShf376haIMoWzSGEC5xQt49LNK5RCu3IVRQgbmDCb19OrzGgdnBp6s49USZnsrU2eGEa6z/oZuFM5ctVSCh0+4FCfOsElI01Ec6jPuhtzxpwEfUcLt5jkZ7NeV9Z5BSlM1oUGUklMNGEY+WdNDbeOpwUCoL0xxHK73/GvWnc9OFuFVOgAP1p+N7SY40iZCVw5GP/H14Na1+8T0LiGRqvlXAA0Wf40KtkFLjRM5CKBqN7d5j9ZmktSvwsbkvvQIlAQgVB/eHou3tUYDH+29DmNEJzIVDDW+/RTipb770DGIx8szUIE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dawj3ok9U2QceLvNkRXFdRFB6rAdvvcFnyl0yXoJAs=;
 b=bvY+JHHu9rhqOLC+WJzi/zBtxT4x+7zyhinN+h5J73N9YVbVrLKkUePuM1Mh0hLOX1F7MxBKujR+5R7VQDCCFZkubRNU9O8Iy5ZOpbJi+bnUO5aK/DxbXHCRbbUAv5AXIGuyOXmLT0pXN41auP2T0QB3tD0OQ4G32ddFTZ8trzl5wKrInHE0SWgGMbXRSsjpLzaR6xv5y3TQaeC4nQwd8v2AqC72i9kzsLQJLRbzZndyoUw7GCxeXFP8nyAw6dOI7A0Cmtj8qSyo77z+pbY53N2eOPcWv/YIqytEUFqvFYGaOjW4KPPXEqrB5v7Q24ePpyPL7f9sM7Cc4a4TnMdhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dawj3ok9U2QceLvNkRXFdRFB6rAdvvcFnyl0yXoJAs=;
 b=Tb5N7ZLvRvKcc84lXcQLUGslXoM3HiMlWjAEU11bLKfNNvljuiXn+Ps4IDMLITtChkbRo7Dv7tghr5+DcFLWyM7Mei+C4OnqJucfrvCYcU6uX2OwnFz/wwR2QpcxWFcjlNUNMpF7hZNIY6r8WyiatMypzYuMp+ASQ2FxfvGOD2cWwWsmSW8iSGm7ycqpNvWYjOGw9c2U6k+f1/1+2l5WuiXcwx28Ke5tu64MAFTyD9kT1zm1bFXTghWAT6O55azhV4XoW3+2kN22Cxf6K2vMkw6bT+yC7ZY3s50e4f3iqXgp13UkF4ySYcURD1gpcBLj78v8lFCP6J19tyqlJwXVyQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by BESPR04MB12586.eurprd04.prod.outlook.com (2603:10a6:b10:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 7 May
 2026 19:43:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:43:33 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Beleswar Prasad Padhi <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc3lnJUssXz5z2XEizYuQgZMairw==
Date: Thu, 7 May 2026 19:43:33 +0000
Message-ID:
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
References:
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
In-Reply-To: <afzIABSh1xtMEGbf@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|BESPR04MB12586:EE_
x-ms-office365-filtering-correlation-id: f484087b-0633-4f27-6924-08deac70ec62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 8r0UnyfR1aJNwNsEaMuw1xDsCX+OTz7073/7Jo7aHY5ntjy5NB/rZ0OjfUBsLIf66255Nj4mUvt490ybWG5Zo631x3wnCyLkNzeqroVVp1hLbr4aLnhdoSXJ7VPHd5GVMCMn03+uotTuyQY6gR56VLcectBzXrjuqAX7bCWSgsgEcuhu2tHfQ+vpGk0MdIk/2XxmvQBpu3Bq1Txw1dp2u4rkoQUyOd9BWGxal4nkd9QflGfP6OhVY9KaPoCkm0gLvshvQZeqfG7CNij9EpP2omz4Qy67sdXzpJJgioFNn5Q/y4BOYWI2FIxXw1m4xjYtG3MZoy1olPMGI5eTeD9wsIry60YaTajzNPUBT4vDsl1Pq8uAkGReOiJiFCJIu1WSTGe0zLhuSeufnytKeBouUMVhqN3OJN5ZMyiuAV+WLruQZJzSw4uozubcQ4PSXFFc4Kc0/u2AixK734JhSpKIbE6yqeB9xVlceV8HW6qTwMcVvaIi0bMKusYCc1D7Nkr00hIr+MCGMc0dh9daWGbUp9ALzD5WKwxA1/3Y5DNGaRz/k+P+z1FnHZqBehuNKBw9TSYOkv++sqPiF6gI5Dw6ipvXrZetHn3ig2jS7oJP8Khq45BJMef2i1lXvY3xFkprVd5D4OoyilxTPI1UaRWIcn0Qyf9v3O5bpX6rndFzrc0z/cv7uviFqpDnry+NPLZBjjOEe04NXt1WbD0Z5FO5qPRFAlQ1UGKsFQFzBuMctX+dBqZlnT0gDzd10uVPTiMJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L9jEXAJk/KDzLVD/ESsOoyLKl8ZMLVjcJyuaZAsyUiM4zdAEypq2uIyXiMYD?=
 =?us-ascii?Q?aWXY0iZ8PQ0XtQ9+INtCNCdzsfgeH3OWnX6FW2cYZV9bS2AYMGGo0ZrD2zSi?=
 =?us-ascii?Q?GOKJGqqbuqcMcjKBasTrvODELAP46jZO06FV6ywZG5Zzs+nn0qai1wAQP/eK?=
 =?us-ascii?Q?LqaLmiFYWbo0mh0cfTulWGaZnQ7b0BN9/QY94yWcWpMX3BLnkOLmn8gQpGHT?=
 =?us-ascii?Q?PjV7mk2UM6KZRJL5T8f7tJq82Nk2iNDhzaqpHfIH54oXiu+zx/mrJvZmtHWr?=
 =?us-ascii?Q?7ajD4HytIYUjxlXfhvhMloqD7OPhTS2lSCiRUD/O6DOJo3igTm4nZfUz9AfB?=
 =?us-ascii?Q?eSDcqgBxIPN35VWLORXY2GGBNvydFLqjHxtpA+SN6PpJXifA/uKvCrAHnDMf?=
 =?us-ascii?Q?79ZxitmSqmsFPPydyOl+JPBcNtRHq/zMVfPDY/wTYbG1pqDLmJIph2SIHHGK?=
 =?us-ascii?Q?NIaI/ke7+oFdcD/UYgUg9HDpl1BwI2C9wo6ks6M8k6wMC08sinptTQCxg+6j?=
 =?us-ascii?Q?eyebJhyqjXgCgfNWd4J3s0TFQ5BDWoDanAMgElqOltm4fkPl7aLnL10OQ3Ui?=
 =?us-ascii?Q?96AimVGidwFzAD4+AoR4fluS25oibyie1lvY186itE56EfZh3rUg2nsD9ffF?=
 =?us-ascii?Q?++nBJ5eoowdibMrFF9aAziIGJw3L/+6hUb1QhI0XsJ42/DHe/1fCRzzQAq7y?=
 =?us-ascii?Q?g/onwhDiBqZdv3qWC5Jl/9fqutGSbqKOD66WEnJNxbn8gJCF4IuiK6huleUZ?=
 =?us-ascii?Q?2o/I5ad9OA4o6qdRN4DHYh1AGaNh9izEHBgbmbUoxh6+Pzj7yWO/xkxInG2b?=
 =?us-ascii?Q?V3j93QC3VbNS4rBL+PlHa7WQByib4V0oFj+7IuX1mrzByimlgNHdZfM2Myga?=
 =?us-ascii?Q?oiSU/z8viJXnRvvQgK+O2WdMIwVj+B9QOZsg+gejq4/KNYTnhkecbcYGtg/8?=
 =?us-ascii?Q?k7pj3hTvNfjog1l8rrkCKW1x/MplPfKdOnhM/jPB8/OJbfKDsXbVTk+qcV2s?=
 =?us-ascii?Q?Bn0hAVUhnjkfhuWsx3+2LsDFPSvGN5G1gk6iKwDrXR3/bfvCNtq95vYAgx1D?=
 =?us-ascii?Q?AKnaRY9rDAb5rE3VAvawa1Zmn0wHXLJLHnyNZJQYXDkiPHxFGlrVoaRj4wrJ?=
 =?us-ascii?Q?HETVpsNTI8LdbSMd/TLTt/QctHdkQx5xAZMavYHIk/ye4L0fR77ETM4kkYys?=
 =?us-ascii?Q?qNTabEzCNRyMowq9q9Z/A40ec5kSbHlt9ud87358fvW7TxH6vDjSUUgRow+f?=
 =?us-ascii?Q?JIdsHD9iuid+MiBvI1KVyXC8IJkUo2h3Go6gq7uJSa8RnXwxYewiuMAsiERd?=
 =?us-ascii?Q?beLh59YwPT3k10aC++qytKhFTY2q47SdomWUWGSmptXd6jmuauczEM7upnxL?=
 =?us-ascii?Q?Z3KHL0lLQRat9yq8d02Y5VnSXMzqjcLAJtfrgTbs+hsbskGDnFO0TueS8cFL?=
 =?us-ascii?Q?7OVH0TubEPlKRjhuJy9EZG3+OH5Qh8hwBA4CSb0NjKZk4yPuQsKSaPXILdLJ?=
 =?us-ascii?Q?uwA3oClOoNUOeXH864P1lrB2g8cLPc8w6I57DL3LV6o1Mpw5QVSKRNuVSdJ1?=
 =?us-ascii?Q?E69HiEG8zuUAv9Ftm+GQEniNNaVy3+WkdG+KqyKfSh4HhpX7rMw9lorfRfcH?=
 =?us-ascii?Q?oZyryL+ijKrOaIT9111WAtq4uTxh2wuI46zdEy3SWriBdFw/TJdpCBCBPZa4?=
 =?us-ascii?Q?VMT+2P1Ddx7wKA9d0ZKYh/8C1T/L528KX7KHppaT2YmdkTve?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f484087b-0633-4f27-6924-08deac70ec62
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 19:43:33.4833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2aCreb2CJwdt3y5RqW+c1kb5d9RSwrYzE56t280+snyfeAun0g5mQId+d4NjcW/7O+6K8x1kIkcI4sBnGK6hdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12586
X-Rspamd-Queue-Id: 921C94EE260
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
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36410-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Thursday, May 7, 2026 12:13 PM
> To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Beleswar Prasad Padhi <b-padhi@ti.com>; Shenwei Wang
> <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <=
linux-
> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> > > >  From my perspective, based on your proposal:
> > > >   1) Linux should send a get_config message to the remote proc (0x4=
05 ->
> 0xD). 2) The remote processor would respond with the list of ports, assoc=
iated
> > > >      with an remote endpoint addresses.
> > >
> > >
> > > Agreed, we can scale it for multiple remote endpoints like this.
> > >
> > > >   3) Linux would parse the response, compare it with the DT, enable=
 the
> GPIO
> > > >      ports accordingly, creating it local endpoint and associating =
it with
> > > >      the remote endpoint.
> > > > Using name service to identify the ports should avoid step 1 & 2 ..=
.
> > >
> > >
> > > Yes, but won't that make a lot of hard-codings in the driver?
> > >
> > > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] =3D {
> > > +    { .name =3D "rpmsg-io-25" },
> > > +    { .name =3D "rpmsg-io-32" },
> > > +    { .name =3D "rpmsg-io-35" },
> > > +    { },
> > > +};
> > >
> > > What if tomorrow another vendor decides to add more remoteproc
> > > controlled GPIO ports to Linux, they would have to update this
> > > struct in the driver everytime. And the port indexes (25/32/35)
> > > could also differ between vendors. We should make the driver dynamic
> > > i.e. vendor agnostic.
> > >
> > > I think querying the remote firmware at runtime (step 1 & 2 above)
> > > is a common design pattern and makes the driver vendor agnostic. But
> > > feel free to correct me.
> > >
> >
> > You are right. My proposal would require a patch in rpmsg-core. The
> > idea of allowing a postfix in the compatible string has been discussed
> > before, but, if I remember correctly, it was not concluded.
> >
>=20
> I also remember discussing this.  I even reviewed one of Arnaud's patch a=
nd
> submitted one myself.  This must have been in 2020 and the reason why it =
wasn't
> merged has escaped my memory.
>=20
> > /* rpmsg devices and drivers are matched using the service name */
> > static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >                                 const struct rpmsg_device_id *id) {
> >       size_t len;
> >
> > +     len =3D strnlen(id->name, RPMSG_NAME_SIZE);
> > +     if (len && id->name[len - 1] =3D=3D '*')
> > +             return !strncmp(id->name, rpdev->id.name, len - 1);
> >
> >       return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=3D =
0;
> > }
> >
> > Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty
> > and a future rpmsg-i2c, we could use:
> > static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] =3D {
> >     { .name =3D "rpmsg-io" },
> >     { .name =3D "rpmsg-io-*" },
> >     { },
> > };
>=20
> That was my initial approach.  We don't even need an additional "rpmsg-io=
-*" in
> rpmsg_gpio_channel_id_table[].  All we need is:
>=20
> /* rpmsg devices and drivers are matched using the service name */ static=
 inline
> int rpmsg_id_match(const struct rpmsg_device *rpdev,
>                                  const struct rpmsg_device_id *id) {
>  +     size_t len =3D strnlen(id->name, RPMSG_NAME_SIZE);
>=20
>  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=3D 0=
;
>  +     return strncmp(id->name, rpdev->id.name, len) =3D=3D 0;
> }
>=20

If we encode the port index directly into ept->src, for example:

    ept->src =3D (baseaddr << 8) | port_index;

where baseaddr can be derived from the channel address, we can avoid the po=
ssible address conflict.

With this approach, the patch to rpmsg-core would no longer be necessary.

Thanks,
Shenwei

> And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with =
a
> GPIO controller in the DT.
>=20
> >
> > If exact name matching is strongly required, then this proposal would
> > not be suitablea.
> >
> > A third option would be a combination of both approaches: instantiate
> > the device using the same name service from the remote side, as done
> > in rpmsg-tty. In that case, a get_config message, or a similar
> > mechanism, would also be needed to retrieve the port information from t=
he
> remote side.
> >
>=20
> I'm not overly fond of a get_config message because it is one more thing =
we have
> to define and maintain.
>=20
> Arnaud: is there a get_config message already defined for rpmsg_tty?
>=20
> Beleswar: Can you provide a link to a virtio device that would use a get_=
config
> message?
>=20
> > Tanmaya also proposed another alternative based on reserved addresses.
> >
> > At this point, I suggest letting Mathieu review the discussion and
> > recommend the most suitable approach.
> >
> > Thanks,
> > Arnaud
> >
> > > >
> > > > At the end, whatever solution is implemented, my main concern is
> > > > that the Linux driver design should, if possible, avoid adding
> > > > unnecessary complexity or limitations on the remote side (for insta=
nce in
> openAMP project).
> > >
> > >
> > > Yes definitely, I want the same. Feel free to let me know if this
> > > does not suit with the OpenAMP project.
> > >
> > > Thanks,
> > > Beleswar
> > >
> > > >
> > > > Thanks,
> > > > Arnaud
> > > >
> > > >
> > > > > So Linux does not need to send the port idx everytime while
> > > > > sending a gpio message anymore.
> > > > >
> > > > > Thanks,
> > > > > Beleswar
> > > > >
> > > > > [...]
> > > > >
> > > >
> >

