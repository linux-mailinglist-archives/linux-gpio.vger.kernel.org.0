Return-Path: <linux-gpio+bounces-7093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D098FA733
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 02:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFEE1C20C9C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 00:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062437462;
	Tue,  4 Jun 2024 00:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sdZJCYVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F338F8F45;
	Tue,  4 Jun 2024 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717462158; cv=fail; b=nYXWtwuEeYiX+JEqnGGK2KWuSaHmQyg/H1AdwFe+Os2PMASjMoBUX24B801YkC0KTeFPgiGgA6zfJIpeUd5R7lFnJs5L5LhHorXXCQ8ir+mPTcrv8a6ARRCwlo/9zuK6zTrRgPJa1w42ASJMH7F4ynIDnbWrpCuFAKmIh6xXfVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717462158; c=relaxed/simple;
	bh=Jl1N5O3C9dhNQQgEynLeHNXU1wbth1b7gxbwawkeWLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h8o72qXo+beEdt0s6rsPqtByYySQudLeWTXkJeqAL57EXx2fy2O6UvZVyUseIRHJ5TaOYcRUC2tBQCW5JVRf494AvGrdyNmUnKWoOwgh87dgDX3VFqsxEYAYtyJD8zePzbkZzBn22bYj9F0CV2APTFf/zC81YpC461jpR8P/SSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=sdZJCYVo; arc=fail smtp.client-ip=40.107.104.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKOTY7z/0YJe8epqsuiTljq79Dk4zi2um4eOe2SfFABeMCTd4+zxvAQ7cD2SlN/R/NjZODFB19aFDXIC92bx+jY7nt+BcIo+oGpgWXaPMeG2KVARME7WWvQEy1kAmEPrTXdlsAZWtihkn0PGPmpywmSA3dqOvl8aaXcQQYtJ1/kgVEHnB63Yz+/z2Ludrav+w+Gx2s1H7gw9umIC0127EBwc69BhBT3wbF+BW8BJ7UciWVIKwDw7az/U4RsUZKgoEo81tTBD3KpfAPWvTW1i10KRlLfi2BVNIpWVyqgAlZPHJ16ygcZcJevKXgDvpCzkpPuvmy0mTSxt/tQa2uxyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0y0BTU7qoW6FLGGzi/JQ7rggEE6NAcDcdipSrk1M8E=;
 b=MJ5pE7ts4zkioK+g8OyJPF9b1g5Hl980nA1blzA/YLcJ2OFo3D3gaadbjKKliPq1X/9bKYC/ZbcAEpYL2FCxTRq60o9dgT9MDH6O0UbOK0BiNyV6ltBSH5B+qsRU0Iq4jzeUC4YiW8DPhMj8AGICO3qDgnwVGbQ49h0YSj9QIra9pncAQXOVpDNu5Z+Y+7VEdwnPaZq/+ti/BcMnPZKIL0z8HCZBWYKBTwnDBSuR6cOgOTwddjI3sslt/29sIp8wecD8in3RltVonEWBG4cqzIj7OiDMNWFLEBO+yuD92++rjCLvMBmyIKBbACkDpnuabuH+qwKSXTDNckolg50tYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0y0BTU7qoW6FLGGzi/JQ7rggEE6NAcDcdipSrk1M8E=;
 b=sdZJCYVoTFRtiLNLejIvpJePoW1wUIbqZfXSbsY0Wh4vwBka0c2PGt1RAYo65ntBstEk28fVKgSBm/kHyVA1oVXfmt8yUGLBqFFM2vl5G1Mx15gAn64wvQf4ZKMJu4nxlsKzFPTAU2JG8V3GjvWeJwDwj6yYaUr6WF7gHsxac7Q=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 00:49:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 00:49:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
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
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z+AFfJc9w7tEOWjM+RsEK2hrGqyxrQgAtZjICAALMGcA==
Date: Tue, 4 Jun 2024 00:49:13 +0000
Message-ID:
 <DU0PR04MB941706D2E6FA25AD23B4863C88F82@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <Zl3LKRE-PT3u1AX7@bogus>
In-Reply-To: <Zl3LKRE-PT3u1AX7@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM7PR04MB7160:EE_
x-ms-office365-filtering-correlation-id: 32882376-80cd-44a3-7836-08dc8430279c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9ixRWM+B478Z2QcmEgg6aQLU/MyZdMsNTCgnE01CxmppLpNi69IlaHuwoFp/?=
 =?us-ascii?Q?FnWSxs2KB2cB3D+5HV1VFtUcW+lnNR90E/+oj19ib633O3O/QsT93OcFfypE?=
 =?us-ascii?Q?QBeJSfy1vyfpTWpffYX8hCn2sGv5sPOCc1yENSBDsxsR835DRWLI3v8VttHW?=
 =?us-ascii?Q?61mvdzjSY/ImI/Ybdn/1TA9u/cWs1/NDYDe3Tk8LHIJqWpGXuhy9Lk8H8y7r?=
 =?us-ascii?Q?stPQ0p33MB7VPItfg+tbDtmEmNGNVUtIGi+aQD1uCvDKmXYDOhyiJ+UrFwEq?=
 =?us-ascii?Q?0yeJRflYJJcRWDLkjBeAP7blSYuziX0ZxmIhRv4CwKbpeSaTepGlzQuIExb5?=
 =?us-ascii?Q?QPF28dV3ufHxjA4JL0NGrOP8ZoZEA58likou+Ipsb1NqX5+GrIR/hy0Ijyto?=
 =?us-ascii?Q?7zOjzBi/yzvbll0LZQL4HFW5Z5xjRs68ruakBB+rsxd6Edq74dfI6WQeWh5u?=
 =?us-ascii?Q?7itJ2hC54GekrRkUGMlctDFCyUnggBiXZk3088k8xjz3/lrtX73DfOluyrfZ?=
 =?us-ascii?Q?Eag05lqCpo24C/Xv8RZxVWs2wp1V3Ofj8NV2Zzfamu2L3V6Hq7PzaJ4cx/5i?=
 =?us-ascii?Q?ql4+5eYu46AFpFz6N5rkqbh0Up1/+whjZv4eY152Rx1jrNHj1VVhfeK/8Agg?=
 =?us-ascii?Q?scIWOc+RcpSSMPZZWclN1uKalsPBq0FY0h/GhkJ9ImyBm2udRXGyJOVgMILj?=
 =?us-ascii?Q?x+fO7woa4F31cOJoEkmBOZUyhy+zN12TI/sjCbJ4jMHpz2g2j5a+49BXeIGQ?=
 =?us-ascii?Q?1PMjkaHc7I7RWjMapeFma1fCwhEg/wIkIFneN6uBSVWTAb/YbaILcrSEGquH?=
 =?us-ascii?Q?p+KUz3G+Q3EkWPZ7B8R/5Mp6Mbeuq3J1fwKgaUWus+A65Jrjv+qhArh3LJWU?=
 =?us-ascii?Q?l94qa5p9GexsHRTOCwanNRfsWMJ/wx5g9s7Ig8XnMrHuXpqIr7qOtFMe5Iq7?=
 =?us-ascii?Q?T6gRRYK8jk8AxHCOkmu5y3EqdV1s5pe7f3fCYaHq0qs39PHxb/uCLpTMiwXO?=
 =?us-ascii?Q?3g3nqnnqBOGXO5hSeI/fjzbJzaPQFfTW++a97j1hcuHJ+HGuFd+NpQJPzQNl?=
 =?us-ascii?Q?nmfqPyVRo6Blf0wp+HtzKaBhWpSU9GtuDyq8JgwXPiTqNZ5QNkPyes3bEyUr?=
 =?us-ascii?Q?e45daGBB+GQkFEWB/vnKeMaxopXtj6BeWGFsWDrqTDw83D3TBOdB0nVo23Uz?=
 =?us-ascii?Q?bM/mHtzac4nn22Hg1wcaVDdo+COoWq8p4UfjL8i+dwLrPgWhHJ2+psjSaZEA?=
 =?us-ascii?Q?fyokFYxzKw4Yj4g2jV/N/YDN2Zu82sLrcqDtv53yY0jU6gLLLHcc4Z1vhvJt?=
 =?us-ascii?Q?C00m6ggbApPTASkuh6q9ZmR7ddADhQrP9Wto8bxf0i+q5g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fkN9uTxTeZNyQ4LLDHc79VI+VlTOwoqXe/duSaZOQ9kGzL7zWaQ7j3QNN5Xc?=
 =?us-ascii?Q?YscCzPXf4aAx7vwKeo6/yewCKZyhNEtU3V1XYq59nF3aBOTRtdzuantHrWe3?=
 =?us-ascii?Q?dHVWzboAqksx4QAH2XyRNcGz+Y9QIjUScTS7a430dmyXngwli7j7djHvSkMh?=
 =?us-ascii?Q?b6JvNuSCNBamm5NzRtjFYj+uDmfqsl8yZGZ//jqNG/O0TWne9CCm8eNDhFH+?=
 =?us-ascii?Q?1XVgRpX30eINWrahW15dFyOcZUllpgNahXdTE5f5JooN8YnqqK3RViuenm1M?=
 =?us-ascii?Q?bVeXaYo943hCHiZbPKJoXnWAm+P8kniM62ytc2CnYvQOSg+2AdZxFTHv9WZK?=
 =?us-ascii?Q?JbbUrVidIGDTusYHeRtnnHdC/zk5kFNN9vhloAliMhfUIJ0ZbJ3YU1FR9CuC?=
 =?us-ascii?Q?2eRgfr+FkxukpCu9cRfnKYikMKCT03UdIZ3PbFAwD0z7npGXr130iyMx4HWN?=
 =?us-ascii?Q?t0OLqsnr1rQBg6VSVTLLUi4rAH0SXcAiiGePxmSQON69dUtOqblD57ZmDdlf?=
 =?us-ascii?Q?oDGfFThnuJ3mJeKKQU5KMqCx4KhCZvb2g5ojSOxtlnwBnoYJNu5L53mAs366?=
 =?us-ascii?Q?EKN19oIVVuDA7r4zyK0JlWYw99tYo+k+aPFKuy+OejI0evlGdkHRlKZlzPmR?=
 =?us-ascii?Q?z3cRdfJuG9IT+wY6U3vrC+donW15XOevocn8qzagJ++0S6ARioWYw9lgf/y/?=
 =?us-ascii?Q?bDcvC6pl7l94RxOFz4EFezgiMsBTDRA473tEgo5ObB/zLlsW+tDlJvzM46+8?=
 =?us-ascii?Q?1Cn96N0M/oNkmEKfBVwNZo0f9RUbn8/ZrK+gUQ34RJj4l12peKHBky3avQrY?=
 =?us-ascii?Q?vBMN0RVk8eVtDewz6uEtLrV2XOMhj/UtJYLrgKg7A2Fpx/7hrc2i6GrTbhO4?=
 =?us-ascii?Q?N6tetd+3lmd8KCwGHZ2GIDWaYeVS0HyrxhVfLmBjzQWm+BDOaaGs5LMRzLN3?=
 =?us-ascii?Q?r5sBIVoGPds26AcPw0m1wY8uv6CZhTwaiOqeyin9sCIVRlI8ICdUwUThsK7f?=
 =?us-ascii?Q?x4kVP2nHIB7p1uzHS9I9gG2aClCGSllrpoVDySJu8LvA62Y7SH7zSVE+Ppbo?=
 =?us-ascii?Q?MEs5YIM8XpjG6R9wqt8uzLEfCOP+XG2j9Fer8Ec3n0rQ09ZvTHd6JaJ4NDAF?=
 =?us-ascii?Q?xoioUnDAOYSYkfMCQbUAt+LE9qhWV2Nb7AOB8LriY586k0QYLq5ryw8dgWOo?=
 =?us-ascii?Q?YEGq/tWKyWQHeNAaCV/JMKtl37211yWF79JFSxCxK19gqbZ9erUQe8yhXyBz?=
 =?us-ascii?Q?EaHW/z0FCEoiHdLp9N9a2e3Vw0UWXMmUWBqc9ZpKD5xoyVjGvm1K1vJ8Tmw1?=
 =?us-ascii?Q?/QVseCtA1/fwhjW+lmhtTdHF4EWtutsrn8KUXXr465A3PR6pONuQqR877LcI?=
 =?us-ascii?Q?VugtPPq1wzVFcdsbqlLLOXgwC3Py2MtjH1oy/2DCEelyVvXzRLJ0XcqExbx2?=
 =?us-ascii?Q?+RIvUOvQU0ugc+5RnLgFDUVTQZAtqJLq9/oq9e4PiywId7Q2VcMtUBRwwFVA?=
 =?us-ascii?Q?12im3gqXyeUUbSOX35TuPfQFFc3DZqkKMDwLdWN+ZNx6WNLNjlznKguB0+ZF?=
 =?us-ascii?Q?x/bZ6KCBhwUObsK7N6w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 32882376-80cd-44a3-7836-08dc8430279c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 00:49:13.7471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgV7U0DbWdxH4qMEjesCZZJf8wcaziNF2NiyLsI69XbHqDgU2TzzdBiCb6sXjWJvGT+1dB3hPVzqV426jIH4aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

Hi Sudeep,

> Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions wit=
h
> fsl,pins property
>=20
> On Mon, May 27, 2024 at 08:36:27AM +0000, Peng Fan wrote:
> > Hi Linus, Sudeep, Cristian,
> >
> > > Subject: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions
> > > with fsl,pins property
> >
> > Sorry if this is an early ping to you. Just wanna this not blocking
> > i.MX95 upstream support.
> >
>=20
> I would say yes as this was posted bang in the middle of the merge window=
.
> So it is possible for people to miss this if they are busy otherwise.
>=20
> I wouldn't have responded in general or if someone is new to the Linux ke=
rnel
> development. But you are no new to kernel development.
>=20
> In general I also have a suggestion for you. Avoid churning the dependent
> patch series if the base set of patches are not yet reviewed or agreed up=
on.
> I was super confused with the amount of different concurrent but dependen=
t
> patch series you had for this whole i.MX SCMI pinmux support. I had ignor=
ed
> and not responded in the past but thought it would be good to respond in
> this thread.

Thanks for your suggestion.  I tried to do different implementations that
could make all of us agree, so it was indeed many versions with different
implementations. Sorry. I will improve.

BTW: would you please also give an ACK for patch 3, because patch 3 uses
module_scmi_driver?

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep

