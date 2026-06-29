Return-Path: <linux-gpio+bounces-39160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WjFRNf64QmrVAAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 20:27:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DF6DE090
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 20:27:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="k/HhT1e8";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39160-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39160-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08BCD3033D07
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF2C3876B7;
	Mon, 29 Jun 2026 18:26:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE718385D61;
	Mon, 29 Jun 2026 18:26:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757600; cv=fail; b=uOdbWHd9M0ux2KXo/Lrk5I1mVDcHSdQZOXtkotVTQXBwCPhVzRm3L78YyIYcrHCh6moAdWqRXqaIFUQR466Y0EWel/sLWp3VTl7ktvH9+SYtTioZ7yCwsw8QLIrIYAfMZtU7ITDhyTgV80ObjrJYcQSx2kjBgysi/vaTk86pXs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757600; c=relaxed/simple;
	bh=K5WsiiBDz6fl7qo97RpJozgkxj0/SdUo6MG4pkIyHTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YVeO81WnEOGtCjRKx5KndoLuPJJ2wsqGAlZ+d2eYy5h5LxbSjZk7FNzcqWRRINR3J7BkFUD2iwpz1618m5CqhqfftYGIwWEohvYbR8YvGniNrgMIHIFNyxBhfmMrT8pG+13QDRCBNC/95SqIGOG7cSliXiznEccwzPcMkSabXSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k/HhT1e8; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiSC3JjpzDQrt2wKkrgecSeKisMhULdnOeYucj4tEC1ylPfhDFOA842O14a68osA54bQTkOK3F5+rsjfSNeOizUOnkrH5O+0gU5kJMC3xFcR2RcFNOaTzr327GHI1P5qqGWNnFSg8tR1IXdhM+5FC+qCGlqfEZurrV6kDqLQA1T6pBKXFwqHuNYn53ZRqZUYJrIVAaQlhryVBU7fglTIWMpLIml39mH1tcnDkd1xjZSuNeQQX9t/rfXe44wWN5DvEu2UY4MwGfxsDAKUQZN9tX5wwFvhdSMStX+nier+C9PwDv/2YITr13Mb/YcPBfgkTiVN0FWFg/2uOK3/+LjMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5WsiiBDz6fl7qo97RpJozgkxj0/SdUo6MG4pkIyHTo=;
 b=C5pR4IhhVfkX7+ELJYYPxO0YTbMYlRvv1xBVRAsrJexzmOYx1j88xnHR1oDUAejsRu7jgKl8OeY0x++7+SijfjCxqZxQiGEj6K2os9OodG23H/h8/3MpTx4GO29fgtAFuUtC6dss5H0+sReL34j3NZafir7DGrMayr3dvuPcsYmrakH6ImyYCz55nv3c5mcM0CfhfdTXqaCUwpvfOa6w5vbmliVZLd4sjBZqtHvG7zRLOfquBz8pDVFfpVt7+2mQ6n9Qc32VWNoKnqHFmlhrVel93W4luj8ahg0SY8EoYi/af4sg+OXo9RabwLABV7Lmc98wC/XJVRoqBL0ACw57Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5WsiiBDz6fl7qo97RpJozgkxj0/SdUo6MG4pkIyHTo=;
 b=k/HhT1e8cObedHKAOK3OQmXcpYqctLJ+C3itC7L/GgkmxYHrIv7kM83hlCBQcQNNbD8GrASfXLa0C+ogIsJCI8MKes9yg8I1UxiB2dcaOFAK+1vO0ATjj2sjFbhG3oUjo9R4xKlZh1y5EUFVYce0xXYVmDddVDGWqNJYSXredKZlhC5IwKvGQHS/+BExsu0JCBIwXav7ozAEMlCpfIeSB548tHnrhB/RQgN+s4L4uVVRJHHCXtqS5vAo5eqrZ/ukJYXLF5ZvOJBJZ+dj99DzMHtZuXdWrH/IohbWnYThQGYFvazjuDRboVLIUv/zSLPJ8SgOHJ6qqDMO+pi5l9Bpug==
Received: from DB8PR04MB7129.eurprd04.prod.outlook.com (2603:10a6:10:127::12)
 by VI0PR04MB10370.eurprd04.prod.outlook.com (2603:10a6:800:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 18:26:34 +0000
Received: from DB8PR04MB7129.eurprd04.prod.outlook.com
 ([fe80::2f1f:4609:d75e:9629]) by DB8PR04MB7129.eurprd04.prod.outlook.com
 ([fe80::2f1f:4609:d75e:9629%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 18:26:34 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Andrew Davis <afd@ti.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski
	<brgl@bgdev.pl>
Subject: RE: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHdBLr3f0ChmNZre06GPApXto491rZPufCAgAYKl6A=
Date: Mon, 29 Jun 2026 18:26:34 +0000
Message-ID:
 <DB8PR04MB712990DF9806BBCF36B1076DC8E82@DB8PR04MB7129.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
 <655ef1d6-08fd-43a9-8507-c2d478c058d8@ti.com>
In-Reply-To: <655ef1d6-08fd-43a9-8507-c2d478c058d8@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7129:EE_|VI0PR04MB10370:EE_
x-ms-office365-filtering-correlation-id: d77f88f9-4536-4b1d-64c7-08ded60bf31b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|1800799024|366016|921020|38070700021|4143699003|3023799007|56012099006|6133799003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 hRV7VwGN9vZWeKHMz0d8+nw4lCvXP3m4TXfFiunsaGmi2zO86A0f1pCwVubAmZTaHjYBpkMytvkt/5I5HtP2XR7CNAbXKMO7Bsuvl76oEviRoH0K8sI4lbWnFrk2gM65rLrP4jmovKXZBtinYbKH5E8y0O+BGgo2HAxL5erDl2okLwY4vmKIRu/z7G6DnqvwEG2covfPB6a9rDTFhRsHzMU0zzxtApGzz6IzU1M/N/nqrCUitZ5Bvvf263ovaPhsG1LRUDZMDJi5E6TEYSOurfHBnbTIpFATqfpqCtZ7oq8rUTSIGT44IDTjn/actr5uJi404Nc2GjNva3vXMKi+niMGliKTw4s9befy+6hI4+p/E/2OyAJmTc843w+hvCbanaY1qEqMXXWMMWPwkgy93OzttQNwsVqMBpWINzDs3fdjsIoKcWOlTKxVimDm+WB/Bi8Ac555K+6siObjoBba0dxKyLjSO/mAfMEG9Woct/868TTr6OuG+zRSwvLkiFDrxIaMvgaOOHpdcB6fWqUE91Jx1ZK3heB4CYKu9tmRb478QV4cOr1h7jvbX1NhM1II0KxyXiXhPyY+7FBD79oRUvajuJD8WAb17gZ8Esk1IOn/Yc4GleNw6XAKqadGYIuhku+65HtzMLD9AeCTjjXrd4jMuv7bCEkN2g+0lwVOWb+bSFsK89GNcJNay8ChiKYJeKFkfOyunUUyVy3uvKdVeuNvl7cOLm9pAabFt+HWauM6e9OAcgBk60ONLqjLZuh8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7129.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(1800799024)(366016)(921020)(38070700021)(4143699003)(3023799007)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVFNeXUvYnkxZ2pJVndCR1cyeVU2SEsycVZuTzVZcmtFTDVaOXdta2dvUjR2?=
 =?utf-8?B?L0lqclZFM045aDY2YkJoK1JmRGs2TXZxZUFpTW8rSWRQbzgyMWt1U0V4Tm9Y?=
 =?utf-8?B?VitaNUdhd3ZaVTAwRVU0UTdwZGhMYU93aFh1Uk85dm4yK3RKNTBYdG11OEdy?=
 =?utf-8?B?UnVqOWFUOGJsN3l5d3lESHhoUlY4NFgwS1hNLzJXYlk1SFhTYW1wZUNpTlBs?=
 =?utf-8?B?azVxQk5UR1EwaTJCVkc4alQ1cFM1RnI5bURqRlV3ZXNBQ1h3Rm1HNVJWNiti?=
 =?utf-8?B?aVY5cEhUblhDSlgxZVJUcTRjL3IxZmgydWl3R0xLVDBEN00wdktOVUMxUHl2?=
 =?utf-8?B?aUtlVFRwL05QUHdYdENnQVFnQm1CQmFtaWczYmZuWE1CMGUvVlNmOHdURXFJ?=
 =?utf-8?B?WFNraDRnNDN6Y2VwamNvQUN0V1dOSFNPWXF4ekNYb1A5RGpiZUcyU3JlK1lz?=
 =?utf-8?B?emZOM21MZGJPazhoRnhEQXVpTUh5Um5XRnBmWmluOWxBbXBiSUZITTQ2Q2cv?=
 =?utf-8?B?d0dtOGlzY1FJL25UQ0FhMFJLaWEzSHNLMWlZOWpjbjljRzBrWjNVa1RBVE5i?=
 =?utf-8?B?N3ZZNU5IR05pbE5qTm9DM1RrMWdMQjIzZ3JFY3ZyQ1FYU3N3bCsrNmRWSkl1?=
 =?utf-8?B?TlF0aEt4U1lPY0FoVHNzODdjeE1LTlUxdWxnV2t2SG5iY3JqbU55cGFPVVd5?=
 =?utf-8?B?Y0ZXSlBpNXZQTmtZdlF6OUwxTDFjeFhjYkdiUml0c2cyWHJ1VTZ5Y29YRXBR?=
 =?utf-8?B?Y0NSckszOW1pYlpSV2laRXZESzVFdjJGdm1WSkpJRmxNU0VFS2ZjcWxxRHhU?=
 =?utf-8?B?dnMvTUZRVW9ZK3dxUzNjZ2dRSWZwMG51NHNhcGZnMkE0R3E4bzJVeWdGalZQ?=
 =?utf-8?B?bmRxb3NSWUJWUi9qVC9HSkIyV29QT1YvOTI5T0hGd3cxai9YWWdkTWhkSHBG?=
 =?utf-8?B?RTI5dkhrNDFkU1h3QTRUdWNOSm5ndFJuK2tPUTg2NlNWaDhkVjIwNjFZVGUr?=
 =?utf-8?B?Tm80VFk3Rk5ycDJZSENjbnpUTjV5QmNPQmIvc09xVkZMQk1WM0EzZUN5SUFW?=
 =?utf-8?B?ZVAxSndqbkhPRWdITFRTNm1rSjhyS095S0ZrQmg5RUFvMklQdmptcXlVSi83?=
 =?utf-8?B?eE9NRXJVbkNUWHIwZnd4N2lvcWZqZlhjcUxESzZvRjR0dVlwTW9nR2pxdU5j?=
 =?utf-8?B?dFBtUzFQUXkzTnRlQlZlM1dKcEl0S3FJOWZZRjZmYWZPVkNONHZkdlhtbjF0?=
 =?utf-8?B?ekVmOXkvaDJzWmQzMURPRVpHQVlhb3dxSVpzK3lWYkZRdVZCMHVQWEVoRldy?=
 =?utf-8?B?L2UvV2VUUkIrcmc3YzVkSnlYeUx1ZTN1R2NxaEg4QXJ4ZmdMOFJHVis4NURR?=
 =?utf-8?B?WWdFSlpuTWFqSGJYNTVXbHF5Ty9wM2t0bE9jblV0QVpCL0E3Wm5admt6MlNH?=
 =?utf-8?B?UnkxQXEyZDZoRmlYOUhxamxxL0Nzbk1QalhSdkNZTUs5TXJCNjNmQWdYVE1a?=
 =?utf-8?B?bFJBWFlYTkhUSXlOLzZvK1FKRlZyTElvenB6MGdEVVZXYUhYd1crbzRxY2VE?=
 =?utf-8?B?VEZsaGU4Q2IxRmxSc3NtY0VYY0QwcUlwanpML1I2Mi9GS1gvQUFvT1Q1QXda?=
 =?utf-8?B?Q2EweDdtbzVHWkpDKzdRamFMdC9sTy9YR1Erb1h0TWZpQlV4Z1hYdHdMQ1l6?=
 =?utf-8?B?SjhBY1dPSDBsNUt1VE5tMlhiQXRJc0s3Yi9SQnFOWlExSVdSSUhMK3QvVDBS?=
 =?utf-8?B?OTh2dytqVnFPeGpmTWlDOXFydENDemdPMTlrSnhSSzc5MTUwSnhpTVZSb2xi?=
 =?utf-8?B?M0xOMEtZL0R6TkRDdTZjc0IwVG1BS3dieGQ3VEZxQ3ZyZUlUMlZDWnZMOS82?=
 =?utf-8?B?K3BFTWZ1TjQ1NWVYUjh0eHRDSG43Z2dEeHJWZFNnUjhtRE40VDlXNGdiY0Vy?=
 =?utf-8?B?cnRXWUEwS2M0Zk1ka0MrYnVncTdOWXpveG9hRzM1VlMxZkNKdHlzYmdiMyt2?=
 =?utf-8?B?c0hjUWNoQXpsRFFod0d4SG44akprbnNtdVJOQ2pERGdjT2VHUkNMSlI2RkIx?=
 =?utf-8?B?NVNucGd0M0sxbGZYcGFVZHZGOFZTS0JQREppalpPU3RRWWtzVlF3MG4vK01C?=
 =?utf-8?B?WWsrSkFPaVJ3VzZEOHJkVTExWk1NUnF1WUx6cU9laERPUUFmMDB2WEEvTXds?=
 =?utf-8?B?VVVNczVZcGpVZXNVeVAzWU9sQmN0eHJiLzl2Ni9ZdkhVRjlCc0oxYmRMWFdl?=
 =?utf-8?B?alI2UmhyUXptYzcrUnk2SG92bDFmTEtMNUk1RnI5VGs5RUp3Q0N1VUxtYzlu?=
 =?utf-8?B?SytnTXRpYVFqWlc1ZmxuYUJFWFBhRC9FWlROWGRRbytWK3pWMVJNa1JoNGpU?=
 =?utf-8?Q?6ifHjPsWIiLr9Qjos5GjT6+pSTHuyZtZGkX2R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7129.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77f88f9-4536-4b1d-64c7-08ded60bf31b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 18:26:34.4594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52TghDtBR2UdOYNhlYwhGPEY+ayBtI9do4/UvlR7qGLHLo+Ddk0B5eu/sfBIMbXVj81PgiQQTCkD20pTHKRFv5J66oou8xVHCG/9XHKvTUDp/kIzfASumN2tS8HFtPg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10370
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39160-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:afd@ti.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:brgl@bgdev.pl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch,bgdev.pl];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,DB8PR04MB7129.eurprd04.prod.outlook.com:mid,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,ti.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D5DF6DE090

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IERhdmlzIDxh
ZmRAdGkuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAyNSwgMjAyNiAzOjMyIFBNDQoNCi4u
Lg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNCA0LzVdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJp
YyBycG1zZyBHUElPIGRyaXZlcg0KPiA+ICsgICAgICAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQg
dGhlIGdlbmVyaWMgR1BJTyBmdW5jdGlvbnMgb3ZlciB0aGUgUlBNU0cNCj4gPiArICAgICAgIGJ1
cy4gQ3VycmVudGx5IHN1cHBvcnRlZCBkZXZpY2VzOiBpLk1YN1VMUCwgaS5NWDhVTFAsIGkuTVg4
eCwgYW5kDQo+ID4gKyAgICAgICBpLk1YOXguDQo+IA0KPiBUaGUgc3VwcG9ydCB3b3VsZCBkZXBl
bmQgb24gaWYgdGhlIHJpZ2h0IGZpcm13YXJlIGlzIGxvYWRlZC9ydW5uaW5nIG9uIHRoZSBnaXZl
bg0KPiByZW1vdGUgY29yZS4gQWxzbyBpZiB5b3Ugd2FudCB0byBtYWtlIHRoaXMgZ2VuZXJpYywg
dGhlbiBhbnkgdmVuZG9yIHNob3VsZCBiZQ0KPiBhYmxlIHRvIG1ha2UgYSBmaXJtd2FyZSB0aGF0
IGltcGxlbWVudHMgdGhpcyBwcm90b2NvbCBhbmQgbWFrZSB1c2Ugb2YgdGhpcw0KPiBkcml2ZXIu
DQo+IFN1Z2dlc3QgZHJvcHBpbmcgdGhpcyBOWFAgc3BlY2lmaWMgZGV2aWNlIGxpc3QuDQo+IA0K
DQpBZ3JlZS4NCg0KPiA+ICsNCj4gPiArICAgICAgIElmIHVuc3VyZSwgc2F5IE4uDQo+ID4gKw0K
PiA+ICtlbmRtZW51DQo+ID4gKw0KPiA+ICAgbWVudSAiU1BJIEdQSU8gZXhwYW5kZXJzIg0KPiA+
ICAgICAgIGRlcGVuZHMgb24gU1BJX01BU1RFUg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3Bpby9NYWtlZmlsZSBiL2RyaXZlcnMvZ3Bpby9NYWtlZmlsZSBpbmRleA0KPiA+IGIyNjc1
OThiNTE3ZC4uZWU3NWMwZTY1YjhiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9NYWtl
ZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9NYWtlZmlsZQ0KPiA+IEBAIC0xNTcsNiArMTU3
LDcgQEAgb2JqLSQoQ09ORklHX0dQSU9fUkRDMzIxWCkgICAgICAgICAgICAgICAgKz0gZ3Bpby0N
Cg0KLi4uDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJwbXNnX2dwaW9fY2hhbm5lbF9wcm9iZShz
dHJ1Y3QgcnBtc2dfZGV2aWNlICpycGRldikgew0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRl
diA9ICZycGRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+ID4g
KyAgICAgY29uc3QgY2hhciAqcnByb2NfbmFtZTsNCj4gPiArICAgICBpbnQgaWR4Ow0KPiA+ICsN
Cj4gPiArICAgICBpZHggPSBycG1zZ19nZXRfZ3Bpb19pbmRleChycGRldi0+aWQubmFtZSwgQ0hB
Tl9OQU1FX1BSRUZJWCk7DQo+ID4gKyAgICAgaWYgKGlkeCA8IDApDQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICAgaWYgKCFkZXYtPm9mX25vZGUpIHsN
Cj4gPiArICAgICAgICAgICAgIG5wID0gcnBtc2dfZ2V0X2NoYW5uZWxfb2Zub2RlKHJwZGV2LCBH
UElPX0NPTVBBVF9TVFIsIGlkeCk7DQo+ID4gKyAgICAgICAgICAgICBpZiAoIW5wKQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gDQo+IFRoaXMgc2VlbXMgdG8g
aW1wbHkgdGhhdCBEVCBub2RlcyBhcmUgcmVxdWlyZWQuIFJQTVNHIGlzIGEgZGlzY292ZXJhYmxl
IGJ1cw0KPiB3aXRoIGEgbmFtZXNlcnZpY2UgdGhhdCBjYW4gYmluZC9wcm9iZSBuZXcgZGV2aWNl
cy4gV2hpbGUgdGhlbiBvcHRpb25hbGx5DQo+IGJpbmRpbmcgdG8gYSBEVCBub2RlIHdoZW4gYXZh
aWxhYmxlIHNvIHN1Yi1kZXZpY2VzIGNhbiBiZSBkZXNjcmliZWQgaW4gRFQgaXMgZmluZSwNCj4g
SSBkb24ndCBzZWUgd2h5IGl0IHNob3VsZCBiZSByZXF1aXJlZC4NCj4gDQoNCkZpcnN0LCBhIEdQ
SU8gbm9kZSB0eXBpY2FsbHkgYWN0cyBhcyBhIHByb3ZpZGVyIGZvciBvdGhlciBkZXZpY2VzLg0K
U2Vjb25kLCBieSByZXF1aXJpbmcgYSBEVCBub2RlLCB3ZSBjYW4gZW5zdXJlIHRoYXQgb25seSBl
eHBsaWNpdGx5IGVuYWJsZWQgR1BJTyByZXNvdXJjZXMgYXJlIG1hbmFnZWQgYW5kIGFjY2Vzc2li
bGUuDQoNCj4gPiArc3RhdGljIHN0cnVjdCBycG1zZ19kcml2ZXIgcnBtc2dfZ3Bpb19jaGFubmVs
X2NsaWVudCA9IHsNCj4gPiArICAgICAuY2FsbGJhY2sgICAgICAgPSBycG1zZ19ncGlvX2NoYW5u
ZWxfY2FsbGJhY2ssDQo+ID4gKyAgICAgLmlkX3RhYmxlICAgICAgID0gcnBtc2dfZ3Bpb19jaGFu
bmVsX2lkX3RhYmxlLA0KPiA+ICsgICAgIC5wcm9iZSAgICAgICAgICA9IHJwbXNnX2dwaW9fY2hh
bm5lbF9wcm9iZSwNCj4gPiArICAgICAuZHJ2ICAgICAgICAgICAgPSB7DQo+ID4gKyAgICAgICAg
ICAgICAubmFtZSAgID0gS0JVSUxEX01PRE5BTUUsDQo+ID4gKyAgICAgICAgICAgICAub2ZfbWF0
Y2hfdGFibGUgPSBycG1zZ19ncGlvX2R0X2lkcywNCj4gDQo+IERvZXMgdGhpcyBsaW5lIGFjdHVh
bGx5IGRvIGFueXRoaW5nIGFueW1vcmU/IE1heWJlIGl0IGRpZCB3aGVuIHRoaXMgd2FzIGENCj4g
cGxhdGZvcm1fZHJpdmVyLCBidXQgdGhpcyBpcyBhIHJwbXNnX2RyaXZlciBhbmQgd2lsbCBwcm9i
ZSB0aG91Z2ggLmlkX3RhYmxlDQo+IG1hdGNoZXMuDQo+IA0KDQpZZXMsIGl0IGNhbiBiZSByZW1v
dmVkIGJlY2F1c2UgdGhlIGRyaXZlciB3aWxsIGZpbmQgdGhlIGR0IG5vZGUgb24gaXRzIG93bi4N
Cg0KVGhhbmtzLA0KU2hlbndlaQ0KDQo+IEFuZHJldw0KPiANCj4gPiArICAgICB9LA0KPiA+ICt9
Ow0KPiA+ICttb2R1bGVfcnBtc2dfZHJpdmVyKHJwbXNnX2dwaW9fY2hhbm5lbF9jbGllbnQpOw0K
PiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhw
LmNvbT4iKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJnZW5lcmljIHJwbXNnIGdwaW8gZHJp
dmVyIik7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gDQoNCg==

