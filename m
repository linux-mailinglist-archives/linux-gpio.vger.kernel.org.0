Return-Path: <linux-gpio+bounces-6322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2308C3DD0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9845284356
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 09:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D2F149C56;
	Mon, 13 May 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QuOrX+Bc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FDF1487C3;
	Mon, 13 May 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591349; cv=fail; b=b0UL47O4TOH2Q9dCC2HQKQXT8xTzt1q5MSgEMnPWgYN3c0/ZDIOVL29MPuAnGq8bxwS0iaxNiPH5mzlrVyBmjBOxHSRd+hF1dTmWuCbmZraglf/KGuGpE5mm/EMm8IgvzMybxbU2f1l8sYXsVU5uvUqjPfwa5YnewFUeW1PZM50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591349; c=relaxed/simple;
	bh=mxQvsgka4rLLd9U3rpTJPz9gTT27v0T8bd/xhDL2xoQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sECePw1NPbszABmsCxvoSfJ6XpeoRgT8oMkYxhQUBRYS5pgaGq75VT97wCG6oY1+LtVl+XmP5YyeaHmYLaDXgASR5fcrK48UsgEZCQ5N+4azWWI5JSHUqGDVERGK8jsjBWOlhH4cllnplaowMvjVdORrJQTvZ03UZEasKOhw3ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=QuOrX+Bc; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClCZAU0dIdZoJWBsBWYRjh1r967Ubg3CpaWAIGnPXH+8+DGP6moFfztWQy+4EZsBygp96sLLUKRprULxrcb/hT+iou1bq7OXc+UBpBB7KKHCcWl//F2IAZhSWaNTcJZ5kUxWwwbUZUwJor+ECZhr3qGZl/D11dH9/Zk/c22YFFjAQ5BjsIoLZxy164Pm5megc/zWrsTyg8siJkQHGpboVIxITsihTkCokjT2Hh621//teIZcIe8UzPNa2mr0ZADyrfgldpgkQzYOaGdLUV/4ivlrqIHOd2mH14cdZjS7Qjz8+M24mjLWpK65kltjEhYVOMM3+LMtHkIQlpYrlxyksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoXMEMNrYuv5qsMMHum4d5JR+Dk+VoDaYPKCIzCWws0=;
 b=YYN3h0/q2+4RjbUWDYBN4pJUd3o+atHEvSFMa+8dg03DxVrBKMghqRGoqVGDGEX4fx35qcp+Npejys1hkRzE1fXeuUIoDVk7oPpKNAO/1xScF0owjVNEWvg/049ulre5PyGw1L7XsBj8HNf4ov6busIp7AamphPNAcASHf+htOY+HZA3pVgH+JiDxhXjnRyIflIagocJZ92h99hQr94U4quXY7vbdCgSKnLU3oZDJFpk/6mqIbzj6FzLTP3+GHx88kVkbzOgEMyAbeE+yGg2LzMLIo0fCIWAUHYPcF0B7leMvYwmmUlf7dEW7fJQ1GOW9fATMtVL3ao+D0WC82sBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoXMEMNrYuv5qsMMHum4d5JR+Dk+VoDaYPKCIzCWws0=;
 b=QuOrX+Bc803DaaT/pZdgJSo5zr0jOAXlhaxa1Vgok9gFqe+UWyH6iIet+F9L+cXn5pls6v20JQwGOicGSDGZw32dAsEzxeRVUKRExKs+3Kts7Uh/2c5lKv/51+DfGCHy82rX8HohWMhwTgqO6VO/bdu02c6bB+Bd17CUrTg2jLY=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA1PR04MB10206.eurprd04.prod.outlook.com (2603:10a6:102:456::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:09:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:09:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Aisheng Dong
	<aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Topic: [PATCH v4 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Index: AQHanp3bntBZVxVwuE+ylwKb1N1Nl7GSddeAgAJ1tqA=
Date: Mon, 13 May 2024 09:09:04 +0000
Message-ID:
 <DU0PR04MB94179C67B46BD5F644FC2DF288E22@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
 <20240505-pinctrl-scmi-oem-v3-v4-3-7c99f989e9ba@nxp.com>
 <Zj_HFxHMV57EXfYm@surfacebook.localdomain>
In-Reply-To: <Zj_HFxHMV57EXfYm@surfacebook.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PA1PR04MB10206:EE_
x-ms-office365-filtering-correlation-id: 9ab95370-99d8-4d43-e4ac-08dc732c5638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EJctN4xh9zQ+2hX7x0Bp+saU1inpuJywTXgXNHK0oHa5kp2S6nt1uCPFYp9Y?=
 =?us-ascii?Q?QNY8zI0W75Tcvm8FSF9hI0AzpcXIuqflWN5gPK3johdMTXrP6rQ1DBIlHD2w?=
 =?us-ascii?Q?jcbLsRqvEUslPVQxK1FBH/0QCVY78S+DfwbpUut/GEOK4b2x7ZNHLyGenc19?=
 =?us-ascii?Q?lYOHx3B8C42bux2W8qGF6MLuLMnMFe8Ept+kSa7RC5PgS3vADOY3NTU7vy2a?=
 =?us-ascii?Q?WHUUAuFv1KWIbrdOsZKObDmimlaVK6FgQzwq5l6YL+41JUd52Qg6ga9VRp8y?=
 =?us-ascii?Q?5LMRSxr4bSU5ZAkwZnNwNxjHIMgxhmoxSGF6MmGDK3tsZ5kBfZiKr1pjy3+g?=
 =?us-ascii?Q?sZzln6CkrkudtLbU7k8jLPn/wu6QUZkhIIKGNstbthXIxklFwiCv2vK29zc2?=
 =?us-ascii?Q?oW4xfiaLPWO9+mUAUB/KeN4BwL4vP6py9pxkoBPf8R9kgeXG4OYGjXyY1SSI?=
 =?us-ascii?Q?V9h0Nb7eTytJfILipVfRz50BKLizWKbpn7jvPcTA+iRS/AV5/NeteWtrKi8i?=
 =?us-ascii?Q?83yjFedIRN543Fr076qcMRUDaabQ0d5wRtz8E1r6F/xM3IrIgBBvimEBYIHa?=
 =?us-ascii?Q?uhvZnn9HvU7sogykwv/wnKnGZK9s5VuJami6cyLSU1mD2qMxx4nYc/WnXYtt?=
 =?us-ascii?Q?q91k8D+8FmatU5bJ/IGGt3mRleb0f5XJ26oma46XRdAlcmG5AXLQ9Gzq+riy?=
 =?us-ascii?Q?/bCcOIVRbXrCAFs1PRZfhrnWIH/u3Y6TSXDHgtd6DYL4kY2YzEJ4eIjcQeK8?=
 =?us-ascii?Q?gcUhrKcnjNJ1FIgdpzPfxlpwDIIwum/1tAToC4humvk/qS66kdR0sXwmMOY3?=
 =?us-ascii?Q?/zN5UBIFjzG+wvyRBokL2HCH9YrM6XIsGEwAqFeakWvMIaAPLvvGDEC7iPO+?=
 =?us-ascii?Q?LX6eVrqxd1XPFz4ZsHE5OMOZ45xvf78szzvPYINfhBOBv6l2ULeVynu9J5jf?=
 =?us-ascii?Q?FEbDCmcnpTuUrRTVXcI6Y5P/uYCRjzZOBsdAT0q6UkJq/pYXOr1DOAXpG8jL?=
 =?us-ascii?Q?E8xfLQry80lJlG9UBpTmKsfojS9LXzU9OxhG9SgLhDvqKcdMKv4mQksO9Ojq?=
 =?us-ascii?Q?d8buImfhMSZG7Esjg3EJXl+VMyDx/kU/7pT7sF1LGzjlgjRZWEVW1IRGB6CM?=
 =?us-ascii?Q?dUEAECNFlmIHNTr1wLeategpDZbPdwqHPFbPXdbWQZoBiX9l0ourio5bWiRY?=
 =?us-ascii?Q?KjEyW2qOS7K6eGbrzv8CGRxen2wwbTfb96vv5khRART/ccHh95PT10ugjRwY?=
 =?us-ascii?Q?Rcd/4YHkG6yOJxdUHq+HiIk3/PnLfQ57iLoGJGGbt6F2WcO+m4IVQDfTWU+n?=
 =?us-ascii?Q?3ftjNmqjzwqOTlplszMn1MEiHPsLyj6SlyUxlXqy8LRVWg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tNlkMVamggzyqeJAzn6bMotHuwRVwIEP6umzlfOjDqcKPwbQgCHKMm2VTHQH?=
 =?us-ascii?Q?8hEdjCrdxbqjLxFQy6BO8RPjFSaLLRnEiGxiScgWjF/nDDcT4Gx2g+IG97wL?=
 =?us-ascii?Q?Ej6zPPKKBRLs4V/wYQ7nrV+xwL6yUWDx+Aq8hLhjm7FP7MYQcnW1qkj6kvSW?=
 =?us-ascii?Q?LDH1E+meHuyAADOCH9eOjBa5ShqPBPL+qRZB0I4Mz8YWCTIMAKeeT8Gpc3xo?=
 =?us-ascii?Q?5f3t7igeGeR+t4NZ/sFManZy4b8B/r0NhttYWSFFP1b/hnOrM6cWEZqPQ+eo?=
 =?us-ascii?Q?iGa9IXqWYE3fPVzTT4CRQ/3KwCfJKBUi065on+fyXftwxM054IIx4boJ9vSQ?=
 =?us-ascii?Q?ShXptkYtRj3PQS7ev7TI3AYjTAFhX1iZAnP9ESusib4ZS7MvdZBa8jfrgXZx?=
 =?us-ascii?Q?w/sX9DRJvsLZZiZr4JSLBlzhgP3cTttQnBooNkklWn5D22NSN4Bbq6bhw0GS?=
 =?us-ascii?Q?gKPUDfUWMCVbu9a8+4xLB+HbShbBERUFF4esyJs3EhlaC7xBdGwGLQcS+rL1?=
 =?us-ascii?Q?2ZjlCBdR2wTZW7wZAKCRuV9gXdg1ZhnZkBKDx9pzkCOdAAMhoH/OppE6CHUS?=
 =?us-ascii?Q?zqvX+fjXPNNrNdTjaU3EFAqqJMFfkodgtqCrsqIQq2uGLOA6miseeAivQfCE?=
 =?us-ascii?Q?jb+LmSmAXbikZXHT1QtewyeoP7GxGfdUypPzKDpBlGZ1r4AUqxpUiDuIvxHU?=
 =?us-ascii?Q?ysf2rlqCHIZiOzVCQoRJWI5qdXA10DdV3ijEDFNz/5WMUd6Hm96fN2+4WOAy?=
 =?us-ascii?Q?jCL/O8VFnUKvuiHJzeP0sKWAVcs9GtG20nxQcZpSEIldC+dP5lnbg0lh4Fbr?=
 =?us-ascii?Q?8UuDy3khmU62FVnQfmln1r3X6dKdZvqAaIkQgid/77HfwH8cvcZB1gQFeIfJ?=
 =?us-ascii?Q?qbq/uuV/MszQn1zjAupxrZHI6lqD0feocv+OlJaQfK4pf/vJ+L7DUahyt3H6?=
 =?us-ascii?Q?LVIySZJG+k8K0BwXdR85cJ7pVRTzfE23YrjFbMct5esQxYot+cKbnUCybbs2?=
 =?us-ascii?Q?BcAMe0LZ85ruDQNAum7WzAeD51VTPe1SsuAFtanl9tX+D50z8PTeCveiqpCc?=
 =?us-ascii?Q?UeQQ67Y3M9lDQ4D8uMfcE2GHRcnr04X1vfRjYiAUDdD2nMwDVHP0x/w1xtIz?=
 =?us-ascii?Q?wZFkjxqyQJvKnAEtRtraTPk1oVZsk1Ghl/bR7Rdm2WzdYItTl/USEWBgi4la?=
 =?us-ascii?Q?GHUFpU5vLDnZyz5Tuk0Mm9HaKrd4zv1Hf/snAbK7cmLAL9OwmF5/RCJ1yDo0?=
 =?us-ascii?Q?woJNuzGxloGwuPoD/w28gRMDkoCWOHbH3IL3eSWxgIOuQgCeb/NMo9MNnTVE?=
 =?us-ascii?Q?/fi2wa89FmuTqPJAWBznIdwc7JXuVGcZFzPxUvwY3yYJd0AB9pdyD7+Qf/Ec?=
 =?us-ascii?Q?9E1dGBgCHQdQY2ZIOrHQ+jmxQfSdJhy2k2veYIBYkEiXJMZTZVBVBwjeqCD5?=
 =?us-ascii?Q?/wF2x4zLseJ7Wycs+5xC6Cp/oXXkrugb2CcHefc71lzHJSrOQfL1Oqc1XLy2?=
 =?us-ascii?Q?PaS9dmElt062y2rFErkBHlvf19lm8HqX9ySZ/ocTBFWfYRPnJghtUSNMm1DS?=
 =?us-ascii?Q?NKIZQ3OLCIPW9vVJ+/M=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab95370-99d8-4d43-e4ac-08dc732c5638
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 09:09:04.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SUnrGXD0OvIm+RcpXawHjeDgf1LXaIlXCHHNNWP3tKjFiMSY+DPLErrzXUzjt99S7KyEZef2TWCSx0mOB767A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10206

> Subject: Re: [PATCH v4 3/3] pinctrl: imx: support SCMI pinctrl protocol f=
or
> i.MX95
>=20
> Sun, May 05, 2024 at 11:47:19AM +0800, Peng Fan (OSS) kirjoitti:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The generic pinctrl-scmi.c driver could not be used for i.MX95 because
> > i.MX95 SCMI firmware not supports functions, groups or generic 'Pin
> > Configuration Type and Enumerations' listed in SCMI Specification.
> >
> > i.MX95 System Control Management Interface(SCMI) firmware only
> > supports below pin configuration types which are OEM specific types:
> >     192: PIN MUX
> >     193: PIN CONF
> >     194: DAISY ID
> >     195: DAISY VAL
> >
> > To support Linux generic pinctrl properties(pinmux, bias-pull-[up,
> > down], and etc), need extract the value from the property and map them
> > to the format that i.MX95 SCMI pinctrl protocol understands, so add
> > this driver.
>=20

Thanks for refining this.

> ...
>=20
> > +struct imx_pin_group {
> > +	struct pingroup data;
> > +};
>=20
> I don't see the necessity of having this wrapper structure. Can't you sim=
ply
> use struct pingroup directly?

Yeah. Let me drop the wrapper in v6.

>=20
> ...
>=20
> > +static int scmi_pinctrl_imx_probe(struct scmi_device *sdev) {
> > +	int ret;
> > +	struct device *dev =3D &sdev->dev;
> > +	struct scmi_pinctrl_imx *pmx;
> > +	const struct scmi_handle *handle;
> > +	struct scmi_protocol_handle *ph;
> > +	struct device_node *np __free(device_node) =3D
> of_find_node_by_path("/");
> > +	const struct scmi_pinctrl_proto_ops *pinctrl_ops;
>=20
> > +	if (!sdev->handle)
> > +		return -EINVAL;
>=20
> When this conditional can be true?

Just follow what other SCMI drivers do.
scmi_set_handle will get handles, per the code, there
might be NULL.

>=20
> > +	if (!of_match_node(scmi_pinctrl_imx_allowlist, np))
> > +		return -ENODEV;
>=20
> > +	handle =3D sdev->handle;
>=20
> It's even better to assign first and then check if the above check is nee=
ded at
> all.

Yeah. Update in v6.

>=20
> > +	pinctrl_ops =3D handle->devm_protocol_get(sdev,
> SCMI_PROTOCOL_PINCTRL, &ph);
> > +	if (IS_ERR(pinctrl_ops))
> > +		return PTR_ERR(pinctrl_ops);
> > +
> > +	pmx =3D devm_kzalloc(dev, sizeof(*pmx), GFP_KERNEL);
> > +	if (!pmx)
> > +		return -ENOMEM;
> > +
> > +	pmx->ph =3D ph;
> > +	pmx->ops =3D pinctrl_ops;
> > +
> > +	pmx->dev =3D dev;
> > +	pmx->pctl_desc.name =3D DRV_NAME;
> > +	pmx->pctl_desc.owner =3D THIS_MODULE;
> > +	pmx->pctl_desc.pctlops =3D &pinctrl_scmi_imx_pinctrl_ops;
> > +	pmx->pctl_desc.pmxops =3D &pinctrl_scmi_imx_pinmux_ops;
> > +	pmx->pctl_desc.confops =3D &pinctrl_scmi_imx_pinconf_ops;
> > +
> > +	ret =3D scmi_pinctrl_imx_get_pins(pmx, &pmx->pctl_desc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D scmi_pinctrl_imx_probe_dt(sdev, pmx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_pinctrl_register_and_init(dev, &pmx->pctl_desc, pmx,
> > +					     &pmx->pctldev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
> > +
> > +	return pinctrl_enable(pmx->pctldev); }

Thanks,
Peng.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


