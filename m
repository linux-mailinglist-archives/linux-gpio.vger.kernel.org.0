Return-Path: <linux-gpio+bounces-7831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F091CA0A
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 03:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B46283A86
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 01:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF78B1859;
	Sat, 29 Jun 2024 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XR8EXPLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDF628;
	Sat, 29 Jun 2024 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719624741; cv=fail; b=m/BIBB6WSCosdvH0ofB+bITtzZ1/SyzFkoVjDsvfLw+Abu3y5f648KyeHTW2hszuWeqrK6UswUMvBJFxcpG273SvWmNncWI8lKJpO7srVPaMdGQcOIH+3/cJui1Z57cnewqwI2Tb8/h6Gvb8OI3oWcKhLmNrB1kcP/MriiThXEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719624741; c=relaxed/simple;
	bh=trV1WNi4cpjCU/+j/p0oX38ccLM8OG+b7zkzplPFeLE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FxSloXrKKbr3p8SMIOFfja+zr99VyYSXp5FAFi1+g9lIC/D01TO5ZXpNMAV7sb6lPiCgRgog/2k8DmgiyebZhu8I7yE+1y34GSP6khh0asjuWW1Kw0N7tUvoP4/uWjdbuj79UC4VaR8pof+/f4GimGV+bZmxjrjWIAq7CQ9hmPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=XR8EXPLH; arc=fail smtp.client-ip=40.107.21.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDCRg7iaXMTWHpmppbOsaaGt4ZjceQbv09NQbeVragmxc2+JwvQ9ofL+jaOw3/VkkbOkURqFZyBBqyc/1i3ttconlFWgs2D/vXbE7D4o/C0GYkVS6qcFpFehH3qRapm7Mm0PzZUlPYKRAiyfkQCMMjR6KOuFL/78yUwT2oyXF8WIW+ajOWYbiL5tCzHWaC0trXKKojWrDmyRbNoLUQIp9qt/Hk4L2lzkfg3x8IH9lfNFM8o1MNX/esInroiKOD7iHAqY8wDCaGx2yasv9xzsY12hLTW4RRots3xtvYNI41Eh1PFCpoN+cG6khDICvVPAtb4Rb/nKaKzd6C1GL+HOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFDZXnNc2XUjRovE13jI4JetQy2LmSKNXQDYtZhPtfo=;
 b=RZ5+Spdg6sCn1e0gUJdT1uI7VkAC/P7XCSDarpd8317qerdqzx7E9RYyqCsStjVtnUBtylhgkXQ73QfARMgPa+aiu9mDWHoNpyBL5gfRgojAxcsMwVY9bRK3bgALgj3kHVRWnjVMqa+ssjKbn8kKlQKsOHfBUwXwkb3gg2OWWbzER+6qI+8IsMlWJ6NYzVEeyVD+soCl01dwFIw+HP3sDK1NMQoOUfQJX88nwgGHG6aFPQ2D9vE90/ERvdm3PrxaUjf5CCkWq61stFc14oycPoHmGNe/mqnj1iWreOqjobpvLkpccLETHdFFVj27buqVbziHMSXIYLeEoDff/9UkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFDZXnNc2XUjRovE13jI4JetQy2LmSKNXQDYtZhPtfo=;
 b=XR8EXPLHv/qD9x59o8quSFFsqBqJ11wCrwBY0z0EofZbdQgdJ4rBTqunda8pjWmlhUruwahB8k2m4xQuaRYBMB7I3cGT+2ulHD9N98wuNgbmtp5ng/wwquohR1ijwUbimbVYblE0ZJ86TTPR58qek7QM0DuonQXCKFtha39n6JA=
Received: from DB7PR04MB5948.eurprd04.prod.outlook.com (2603:10a6:10:8b::21)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Sat, 29 Jun
 2024 01:32:16 +0000
Received: from DB7PR04MB5948.eurprd04.prod.outlook.com
 ([fe80::c0af:95ea:134a:5cda]) by DB7PR04MB5948.eurprd04.prod.outlook.com
 ([fe80::c0af:95ea:134a:5cda%6]) with mapi id 15.20.7719.022; Sat, 29 Jun 2024
 01:32:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, "Peng
 Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Thread-Topic: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Thread-Index: AQHayJMbdLsb0Iqn7kOQP85Gdz5bhLHdAS2AgAD1oBA=
Date: Sat, 29 Jun 2024 01:32:15 +0000
Message-ID:
 <DB7PR04MB59481B0994BE9D1175C4949A88D12@DB7PR04MB5948.eurprd04.prod.outlook.com>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
 <20240627131721.678727-2-peng.fan@oss.nxp.com>
 <dldl7dkdcsuajjjpg2pczfnupqrsghmpz27i45xi5beeou5ntg@y2ysounw3pqq>
In-Reply-To: <dldl7dkdcsuajjjpg2pczfnupqrsghmpz27i45xi5beeou5ntg@y2ysounw3pqq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5948:EE_|AS8PR04MB8199:EE_
x-ms-office365-filtering-correlation-id: 5727aba1-8976-4f23-9e14-08dc97db4ece
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FPQ7KNu/OnWIxATvmLK7dqIfoUrPenbEO1MbhAb3QzrGf/nlxyXEc+xOoZ?=
 =?iso-8859-1?Q?yWNpFSDYCV9n59K00gxpF85REuRPZSp+iyKcUwh1nSS8N1o1ld21Hg1sax?=
 =?iso-8859-1?Q?tYm+DEdBHtXRGwLd5gG+hBGFyLF9dxjL96rmscha/PrIZWqQX9/MwPdgwu?=
 =?iso-8859-1?Q?NC63b3COQ4Nvdvm7qoya2e7fEXcJEbVvXsLWESMgUaSPVLpVfWnp7tv2KF?=
 =?iso-8859-1?Q?C0jkn95edjr6UptTxdsjK4wiO2eRofVLSHPtFH25jJ+1Ly3t140b+hcPb/?=
 =?iso-8859-1?Q?YRaIyd8EVpucWutH+Q8NqUy2jFiVgA4to5sMJgihwCFsI72/P98yfb7old?=
 =?iso-8859-1?Q?QSH+zdIfaFASkUiD3baO/Eawe+KzsEBx+2cCD9hr8a8bcq2M+ViTEBcWya?=
 =?iso-8859-1?Q?DAiwstrxThF0RfcHTG1PZ2HXcWVuP5HPsPoffZhA8HzZWm2DRiIlenVhcl?=
 =?iso-8859-1?Q?tYd8t4XeGsgOGBnZqiI3Bf7cG1lyUn4fNz/Ul6nClaNh01NxxofpFFdf7C?=
 =?iso-8859-1?Q?pa2Ni8SG6sdG9mVKy/Rbeqt6jqjbNZPAou7zyHIGSfLcag+3hpx+olKTxZ?=
 =?iso-8859-1?Q?xQhDAQuHXOCMWmdY84VyHDjbXxQSAjlcPc3lGpGl79iUjyqaR9oyQdwn32?=
 =?iso-8859-1?Q?Pdop8KxwzFPqPtRI/IYdKpjEFxDX4L/neiLxMPNaQ0A2aCsOtUn2UIyvsv?=
 =?iso-8859-1?Q?qhkhjowI1hZYHvK+qKYw22J+DwE37nMHRHjQbbNApaTGvZDRzj5rUSIU82?=
 =?iso-8859-1?Q?DbFS5DWQ1twVuWmHpjzmlvsG/fRU7/u+HUG85gTqi/KLXVDVMjgkDZUGy4?=
 =?iso-8859-1?Q?5s0QQyicg1hgZYgCWd0zjHconCVJFbsdqxUrUJLs67XcEXW1vGAN76WYr4?=
 =?iso-8859-1?Q?LEAWVCXQ716SMYa8ObQj7mlPCgEVGjIfNI3EkBh5nsPWIt9I8NvuyhZegF?=
 =?iso-8859-1?Q?TsLM6qfkBPzx+xntdN1XoXWuEmqw7YRr9jEGnRwCOnjQ2MpyhZE21Y80VS?=
 =?iso-8859-1?Q?dkfttEHNtci8EEArwGd66Jp2znFjUnoN6EX14s0vLNpNLSjNdFZzg8UfgN?=
 =?iso-8859-1?Q?MnZsuxQFj2qFyj9v8MAjuDj8dw6BchP6uvaRFYIzMG7zRcWasPceF/NoFo?=
 =?iso-8859-1?Q?uOEfxQLOcmpRPuS5xtqnyCqB/KwYPJ0EjkFhX+yuhM5/n9QUcH7DXIWYz+?=
 =?iso-8859-1?Q?a/oh+U1PhlEl3nDYJcfx3zMRKWtzhCzskqTpUC9WWqjhya/jzyEa7mP3jl?=
 =?iso-8859-1?Q?qud39mvTIpssZlqsZfg1CmkP3xVQaRJrtUHOXjs9NLyH7wZkBhoUp1IxxL?=
 =?iso-8859-1?Q?GSG9LDVEFv0nTtCu0bpO0CVWsOZmF0tH+NO/jpURo8kmp4cveECnHCGrzn?=
 =?iso-8859-1?Q?ZCboMtXXgEhaSdl2G1p05Vke5NpvLR6MmR2nHqIDwq7uTZGosrjXYuLnDZ?=
 =?iso-8859-1?Q?joigmCXHV3ZMtOkkGhnpmfoV/bjvemd9c+BqVA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bH4aJH1McFsdUU+bmhXeN6a+VRLc2ywLlRUzpccIeVbpbEGrlo1IbntiwN?=
 =?iso-8859-1?Q?ksN4l8q3ddoYtpD/GpWJLbk3UR2WezX6Ym6VVLqKN5AxgfXV/KOsQzU7LB?=
 =?iso-8859-1?Q?aXFYWRnebDQIBosQu3NFz20tihxHIH7CkuII89MYszv5VSYkZiwf0omnZV?=
 =?iso-8859-1?Q?ZgDADxyhXZmAwYMkjP2Z0porAymKPxrDN1np8hNftExDqWy5W6Z64aGNBN?=
 =?iso-8859-1?Q?opeIWBgDKXD8CtWG8/Bdtg5vPrYEa2Hv3/A2FJGH54jrMg+1mtqeoEAMHx?=
 =?iso-8859-1?Q?rgzcu3H+D+QXKm0PSk+orLlu6B3mISXkbc1IOVmfH6JtFNNJjx3lYw8Uaz?=
 =?iso-8859-1?Q?W35k1QwsYcCbCSdiNqQ9xCovETR984j5oSkQ1nDy5smMParlaHIP/lSfiz?=
 =?iso-8859-1?Q?ByUMQwLeI84gTugs0w/bNAtal/G34fK41Gs0vgjXSVEXnEPnNv3KVSQGe2?=
 =?iso-8859-1?Q?8N4byhdBkdakP/7PJyC/7ST+WznK/E1aHxfjvt3vNny4xOm66p5oVjYI/7?=
 =?iso-8859-1?Q?JW41uu+qs0EOhNUTr5dzniYJdV++WjmM/IQfA9d+I9YoPIUWGCAYubrUFp?=
 =?iso-8859-1?Q?E7W5R0GgXEvPemGK/7dVIWN2JwAe2p68pqV73hy78qy719ZxQrk21Dh3bX?=
 =?iso-8859-1?Q?9LkyWPChr+uSKKU9jOgCTLYaujCb3sEkBoBcTwPT5GsDeoN/sSAx7p3gGE?=
 =?iso-8859-1?Q?FAM9fky4+GuuWqDoxTBN5HANyrd8oFn2QgcBnbttmXxEEwEJ0J1eWTtlcA?=
 =?iso-8859-1?Q?d40Idux9PYg/hZQ/R6P8RaaXoakNIzGZWsQwBPtTUIBBfcwsKnbY/X5vET?=
 =?iso-8859-1?Q?IMyjwG0Cg9u6qRKtpHMxR1SY6HsPXLErKMsaxfQpc78oF2ljydAe/W/FOP?=
 =?iso-8859-1?Q?AVPiahh627tZydOCwtC9d6NdF7+80R8lVd+RSnJmLfHR7Juop66VKvV2r+?=
 =?iso-8859-1?Q?VEfsED1uIrMYOquPAwUq78z+AMPP0ZybylDnl7UjHNfQRXFrmv8rXlUMIf?=
 =?iso-8859-1?Q?peRCms353MlqNO96CcgKUXJdREjl67tftbCgFBQMOLiyEyZpUBNubQbgEV?=
 =?iso-8859-1?Q?2XIPNEmMPLrLYhmNGSgTKm/jMNESwQyMM0dpWuGj+NM2mrNUXkzaK9TRwn?=
 =?iso-8859-1?Q?zQOOtfkfpyT64jbqnmEeKWY1xsD/L8+e4lV3ioZDU29bOfUfV3ZrB57DT9?=
 =?iso-8859-1?Q?g8yp4ipqJnRcmwjYBiUxdKH7FesejJxUZF+pohDYconc0dSNLEVFOF2MOU?=
 =?iso-8859-1?Q?/atfllCgywDCcaLCQpAmhZuUmn9fqg3YHNwo8eXtoU3RAoRWvrPEvp5VMt?=
 =?iso-8859-1?Q?ooUpb11f6rlGZDrudJIexnbPvMiR7YsjhuzKmJvIkPUlxg6tnAS0gPVjLn?=
 =?iso-8859-1?Q?8DpC1zSLXPXnlIXm96Avn7hNuAIrbd9HrQx9T7iHbCNdRzFOxuTPTpIPTS?=
 =?iso-8859-1?Q?F34m+qEJWngtK+rHMUIB8IeFyjRQrslqsmSqPDDqDFTYiHuWFSOsAi/TR+?=
 =?iso-8859-1?Q?LkzSUE5np7DlUFxJl6whVP2EeMf6JHdpxj2fSXgyHGIhiQt/gwF/oTBbvP?=
 =?iso-8859-1?Q?moQvYX8HiORcS40RzyU2oXsCsYUvaHwL9pzxK7UpWmz9WKeymvNeKTEEKL?=
 =?iso-8859-1?Q?J6h8ZWnHO4m3w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5727aba1-8976-4f23-9e14-08dc97db4ece
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 01:32:15.5401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9Y8U1By8a3VE3rR/0y16vrbjbaFQDSCeVh9Iy4aN4d9CRt9lXzJb3Fswm327HFxN93LMMSG8DruCUfDFTwuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199

> Subject: Re: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
> of_node_put() cleanups
>=20
> Hello Peng,
>=20
> On Thu, Jun 27, 2024 at 09:17:19PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use scope based of_node_put() cleanup to simplify code.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 43
> > +++++++++----------------
> >  1 file changed, 15 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > index ef9758638501..f5e5a23d2226 100644
> > --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > @@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of,
> ti_iodelay_of_match);
> > static int ti_iodelay_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > -	struct device_node *np =3D of_node_get(dev->of_node);
> > +	struct device_node *np __free(device_node) =3D
> > +of_node_get(dev->of_node);
>=20
> of_node_put? -------------------------------------------^

You mean use of_node_put here?
of_node_get should be used here. The __free will automatically
do of_node_put when function return.

Thanks,
Peng.

>=20
> Best regards
> Uwe

