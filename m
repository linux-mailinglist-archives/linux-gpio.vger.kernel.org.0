Return-Path: <linux-gpio+bounces-14757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B3A1020D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 205B41888ED5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A201C5D43;
	Tue, 14 Jan 2025 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JDnq5i9o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627841C07C3;
	Tue, 14 Jan 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843470; cv=fail; b=Hbq3QWQ4qCNhI9FQ6ZBkSwzWgdHVIxcOO9VwwEJR/P7CLDTmSUp7cf1WdcnOol4WzTXqdRrK2dsNuV7SE3GCNHzAN6oEhmSLCRGrtK+1UgyltMY9xpjJiRuVUlWUB0mADZjExpnEHnnQWJSNST/7u5EBogL2lk+zTCJHtZ0PfkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843470; c=relaxed/simple;
	bh=jVEjq+qigRoQxCKJPNWz8O9xUoi60lLsCQzjrld47iQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k+NlUXLyH7AMm1OvWOdcNhAPEs1DX9iSOOtUrV7lu3v8UPTOHpOoihc6oVbzqjMHvHcVZHuDFa4o5troIpstLHEJsL+sZMtmsCaNoTAsdV5R8loT4khoOzNJUm5CWhhrTSoZZiqdapISfi/IejdqSjbMmnyInMM03Ry/091W5cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JDnq5i9o; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRz2Ypea8qce/u7Z6d/yO52jCd7ldJrOg6rIv2gPSvyCQvJYy/x7wibmqM5JXdCCQJUUBsVJSkn5hbYeNfz3ZeBZnLdc01R1wdhR+kEFDeaRRfY3RdHjsJwuTHBJAdNyRNBh0oPK2VzrT7sGaUj1nfHHEbCwOdF4TYr2Ig9FcWVb8eirjYiSH6nJpSCXvEfbAy/3Mhre9nNOP81kSWFvrXOCillz4TOJgnkrObDHJFNYE8o7iBJ8aBn19MpbfYgf1OpEnSzO3GXB3vYwS310So3pDo5AjC+W/68gilXJNFlnWYIiPTou9omSUMLEMRH5ERng+wxbJq7cO2KAACGg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1DNPJ2XjBrMAD/VcbDHm6XfeQjlX6g1X8pyIarczXc=;
 b=RsAcZswZDNSANrxOFVgwgoqnYViQd+39PA2tOKBN8CsrKSX4HvnPzDDkZS18ZBb6mAU2NdiH/nJTD44i/IpwiS5dfEPFMVOesCryVwD2ttsszM25wf7KiqSOSGIHyV0sNw7FJ/18r+bhu8VXoNyqvnxRVnEvIZJXyiTu6Ew6c1XzdWtlA3e5enunPSEeLRyp12Io2tWOtbUjiKXF0fHC4NBzrk5TT1aWui+147HcOZeBBOED66L6y3E8zfNyex8JwGm88uR+8fa4EwZXiy1fzqBO/szfQ9S+YqRgDSEG5uG78qMX/WAS1btb4x62Oi66topDnajG4nYRWrMfJq1xng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1DNPJ2XjBrMAD/VcbDHm6XfeQjlX6g1X8pyIarczXc=;
 b=JDnq5i9oLDW1J+YVWVOdf/tkjgRgT9A+n7GDvzMwuujIhkPCl//di33rbSTHt7DLPypBOhhbW6obeSngs3gw0riANKqau+M+ppdBc/h21nbYoMnI8h+/lYzIK/BdOTZgkVQo27EvJ/Rf2lZZJ7ZvhaWuqTOB5YelIlJLobxQSHlHFM9nkrz4kU1FERfJROTnRDwDdPKqWvy56b36+gqEkpSf5YbJFdg4xP7R64Eu2TXhQMRSSka8OXb1A0RRwPZrv8ZKF8C86QjE42NGpesBwcdHfQE9bcvyHIcrorl0N66KdW3eRPvdjQxpEkDYtEC6aTsBXL3zZwHRhhFmQAiZ9A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9436.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 08:31:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 08:31:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, Linus
 Walleij <linus.walleij@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky
 Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Thread-Topic: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Thread-Index: AQHbVqX+0+eluachFU+QGh2fdZQsprL6Oo+AgAZ4SQCACIpSAIAM0h/Q
Date: Tue, 14 Jan 2025 08:31:03 +0000
Message-ID:
 <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus> <Z3Q07EDfN0kTiVRV@pluto>
 <20250106044120.GB14389@localhost.localdomain>
In-Reply-To: <20250106044120.GB14389@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9436:EE_
x-ms-office365-filtering-correlation-id: a871942f-edcd-48df-0ca4-08dd3475c85e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z/cLLFfjlH6+PX4z97Fo1ViDCIqpOkV6KmZveMLDeGQuK2wUMaY+URvw42yP?=
 =?us-ascii?Q?0Os6p+wqHEDYiboY2ekgaS3FVQVHytiZe1vJkGR9zIH7WTdgKpSjMYg1RZaU?=
 =?us-ascii?Q?NX3YxJ19AuWdpKwkeSAQWhH3Nwycg3Sb0sRnre7yUkbubHmyvrTldkGlxdp6?=
 =?us-ascii?Q?jM4B7yu5i/84yICzpucZx+3//nL4/VdKLe5sFIiwU0B++FtnZVGlpG6vADsV?=
 =?us-ascii?Q?vbEXk2RLonyRf4jZewKCYEvGvNTXHzUiBc1aY9lbXusgcBBGoppWmQDcySoU?=
 =?us-ascii?Q?CT8FAJ+/XuVs69CIhxYxVrCCVnqWszMiCULNSOgyeAxRIbFLkzrwV+Qbe26m?=
 =?us-ascii?Q?A/LaPgbmq52dSgX4BHdlp47E3OxnXG69OaBf80Pc1PCDvkn/r+4E/4OVS1AO?=
 =?us-ascii?Q?BTCupE/7VUmL4osaZSbDC444jFr4ccO5n1+i3fEx5D96kj/JPiavceopiyUr?=
 =?us-ascii?Q?YCK0m/89h9LXhL+1L8SEiJY4QxYLI5WAH21voy8t317egGlEVc80/w35bWSo?=
 =?us-ascii?Q?PPR2UBUqZ3Qxli9hy8ScRRML0SOKjbvkta93CUONfksh5QYtGjCkeMHHH4kh?=
 =?us-ascii?Q?BzPXK/Mk9EM5v3RbK+t1JfpYyC+nEYRkiPB0UvKnZG0kSDcQVRubxsCopzv3?=
 =?us-ascii?Q?gfohgD+vu2n4UrM06Nh52z3jQrW/7VxfpCIS9m9f6KrHf/W0y//Sn1T0RDk4?=
 =?us-ascii?Q?REszR+IqkHLWufiQDjhhqkhTzp89G0f/nJFhfxswkVgY4cdupGWWnC5F39lj?=
 =?us-ascii?Q?pOrvt9ok2sikuF5MmUbxreQOYZfj9x0cU6HL2EqDdCtZI2OMk2qfsmPxK9NO?=
 =?us-ascii?Q?+5brytNbL+nSKGRnB2xwyPH0V2lPQx7k4SWg2B9vdkAtFGXrRZDdpfaOuidv?=
 =?us-ascii?Q?C6Q6BKyARWsbCC376TH7IV+CtqkHnhE+U0LJo9xek+Cb4EtKp6Jro3G6bWyl?=
 =?us-ascii?Q?uuzQKjaAOeCcKHbOCYoBxki0RDJ0rhjxHLxIAbL0JVPo+v6BWPRK9kLjtVba?=
 =?us-ascii?Q?qJYKNK0G1bwcHNEya8VoFMQJgOiFKE+1/BC8OocVVibqUcV57+iCIFDK8lhm?=
 =?us-ascii?Q?8oGvXAdmPUDbmQHoMyjLhjfZIv+WJEpG7mfm5oTmmiNtyfDNoYTFNZXtKy02?=
 =?us-ascii?Q?H4x5Bz/C88fi87onXOYFaodGJPOMJZqtdLa/u6JbpiGA7gS77f7rYCqnGBZe?=
 =?us-ascii?Q?JELxhuyxWUaXrpzEisuVO6uRlhURoSv8mduGqwOd9e+JYc8jt4AwahUuB1Rr?=
 =?us-ascii?Q?3s2WhdIiRwAe4/aWByp0FP0mkZY5fgpXUlr1mTfhWYFWnLT4rzS3f3qIfgWM?=
 =?us-ascii?Q?FNya04voOEjzEVLfapBBtX96L2yu47OxO/KlCE/O71kFCaJcGQR2pYWGBm9W?=
 =?us-ascii?Q?d6M1+zL/u0NWCOfVIE/i3TU5VOtx6PFwlGqpsuL42XuVXE0yJpS9UtPHsWhw?=
 =?us-ascii?Q?L4jt+ciT8cI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Lc6eGn8CJv0Y3rOibJxy1YeqWOytQX4yb9RbM0bZq/eWCiCKnpUVMAljCGI/?=
 =?us-ascii?Q?HDcJFAcOlhKE+oeHe6TjfHXnZAc/FebSziA+k+yvAQM7rBnjUo6nlnu55pbt?=
 =?us-ascii?Q?TU/MBti+jDNZYi0HtXa3e0i2u7KaUE1MWZd+hLDB399E5xsrjj2Rg35JXnVw?=
 =?us-ascii?Q?+NSy2X/FQAt+R93CjesjTNhVH7EldUJ0NuwsPjUj8cyYwWYYdwMDaPBEFfLv?=
 =?us-ascii?Q?9wtbY5h4kDJ3FS2cdT2MlI7NGZ/ajrMtgElltFimg3TiOTOEp+ArX5t11J7U?=
 =?us-ascii?Q?LplZCRYLfGtp7QtL3xv4zR37BMOVnIcA+HTeuszOwlIkvD1uYHL+u4noyEMW?=
 =?us-ascii?Q?uNoMHrflZPgVOrpe93l8nAcIkY2RE/g403E07gQG3bw4aR6pIqyLNDFd0Wh5?=
 =?us-ascii?Q?Rcet2ejxzf+Ox647Qc40D3T2TaDvb4LAlf/onAkKC7SCOL62NhkutfMiDX51?=
 =?us-ascii?Q?Lpa/JM8zaC/+ytCGZoDXaZh9sh1kkUOcCb8gV8DUuUTd0mYBpX2Wh52uTioi?=
 =?us-ascii?Q?JlR5TnRiv5YZbVCMkNagWuKAI4Jn/rSPIW519wVVCQ56LN69Av34GVAQA8+c?=
 =?us-ascii?Q?ldjsBydJsnC0wHIx84H2U+jQPyMhmOCzRwSwuBq+MV+xyEdMaTg0hNW6gU5t?=
 =?us-ascii?Q?WzTI28sZbwPqzRBaLhsdFGlHwN6z8It+vwxjEeIM29eoMkhJ7zWomed5+NW8?=
 =?us-ascii?Q?wrZ+3UGki52A5iByFievFDK9F4V7J1lfgSYjE7V2nc9H6iyHrG24CZ103c6D?=
 =?us-ascii?Q?6qBGDL+tsNp/vl5o6kUwjdq2xRiD3t1btGZe5N8BWLDh0u5/nXKwgUCis8wb?=
 =?us-ascii?Q?ycAqJ08Nj2QgA5kG2LI8KCKUf+qZq+gL5PUYFIrQmNG4g6NWb7s27IZz6ij3?=
 =?us-ascii?Q?dQ8ug3AzH9KOdiSKZeqC7WEGEUFPlharJYx40IqKCOqlawz9x2ILCU/9WxzF?=
 =?us-ascii?Q?J6fniDqG3hNvNSEyWe9ubkqLBkMq4FTW/kbBP0iccwfnTFnrIak2DWdfq7MT?=
 =?us-ascii?Q?DF8PoTye142/kYvb4W5HCNLTumvhDh2B8mE9SJvsIVM4reEpujZAz0TWGGew?=
 =?us-ascii?Q?zs2INpGC/3an9/SBcW7tYYaIsWH1waAtbrhJsbciP8J7JmNuqNLjCz9mDmLe?=
 =?us-ascii?Q?T2ZRyqiWXRHPY1eqOE9ldpGo1qwCOf1nZ/O28hiBm+sognoVJs2NIqDwSNUk?=
 =?us-ascii?Q?S2nvoT7Aup7768D4eaHDnLar/5qfuoUtJqK4itUyNmtIyrEIPwTfbzS8EfJ2?=
 =?us-ascii?Q?6PjPz0jr7E8zfu6vWngslzy9lspzypO7Ut/Ogrtnk0s3t0m2zNmRed5k+Yxv?=
 =?us-ascii?Q?yF8Kcc8bhrOmpXz0E3JGTYkG/L0wyo3nX3pIT7Ihhx867vSpkEFpABN9MNHq?=
 =?us-ascii?Q?ye8asYYv60NlmxaENR/AmOYDI1Vgz5PFvOTwFLauKlCVlGTuNlkHP1aQbo8S?=
 =?us-ascii?Q?vyPXlevQXmKrvO1fMdrWlxKzMjFlNg6+VQZ9PqYxf5TSsQ5XCmOSAzgtAVQu?=
 =?us-ascii?Q?aJJxMAUn+wCIrDpwjryHaXAF2SvQm8YqXDCOrOhKIPeMbT/WKQZtQ/DO9CE2?=
 =?us-ascii?Q?SPf/8T5wmWcMBXeYKkU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a871942f-edcd-48df-0ca4-08dd3475c85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 08:31:03.3333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JrFIQp/YSropLnDYHl05OMLAhE3Ns1u5H8WLkhpsAPUuTkDIZbeJcnylQdbidlx/99eBSIBD+hA2pikZBV5Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9436

Hi Cristian, Sudeep

> Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for pinctrl
>=20
[...]

> >> fix here) than this change.
> >
> >...or indeed this is another possibility
>=20
> I am doing a patch as below, how to do you think?

Do you have any comments on below ideas?

I am thinking to send out new patchset based on
below ideas in this week.

>=20
> With below patch, we could resolve the devlink issue and also support
> mutitple vendor drivers built in, with each vendor driver has a
> machine_allowlist.
>=20
> diff --git a/drivers/firmware/arm_scmi/bus.c
> b/drivers/firmware/arm_scmi/bus.c index
> 1d2aedfcfdb4..c1c45b545480 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -55,6 +55,20 @@ static int scmi_protocol_device_request(const
> struct scmi_device_id *id_table)
>         unsigned int id =3D 0;
>         struct list_head *head, *phead =3D NULL;
>         struct scmi_requested_dev *rdev;
> +       const char * const *allowlist =3D id_table->machine_allowlist;
> +       const char * const *blocklist =3D id_table->machine_blocklist;
> +
> +       if (blocklist && of_machine_compatible_match(blocklist)) {
> +               pr_debug("block SCMI device (%s) for protocol %x\n",
> +                        id_table->name, id_table->protocol_id);
> +               return 0;
> +       }
> +
> +       if (allowlist && !of_machine_compatible_match(allowlist)) {
> +               pr_debug("block SCMI device (%s) for protocol %x\n",
> +                        id_table->name, id_table->protocol_id);
> +               return 0;
> +       }
>=20
>         pr_debug("Requesting SCMI device (%s) for protocol %x\n",
>                  id_table->name, id_table->protocol_id); diff --git
> a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h index
> 688466a0e816..e1b822d3522f 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -950,6 +950,9 @@ struct scmi_device {  struct scmi_device_id {
>         u8 protocol_id;
>         const char *name;
> +       /* Optional */
> +       const char * const *machine_blocklist;
> +       const char * const *machine_allowlist;
>  };

Thanks,
Peng.

>=20
>  struct scmi_driver {
>=20
> Thanks,
> Peng
> >
> >Thanks,
> >Cristian

