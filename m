Return-Path: <linux-gpio+bounces-17418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE1A5BE8F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6613B0B40
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CED1252913;
	Tue, 11 Mar 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hQ9w/Ikn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2082.outbound.protection.outlook.com [40.107.103.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080741DEFFC;
	Tue, 11 Mar 2025 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691571; cv=fail; b=XMErWVNFBmidKBwObK0Wx2A0E0OAvgRux4eVeTvnqohoE7P5MOtEKEFtmdu0G81wED6jbfIAjuyPSX3h+wx6iAXhXhzwi3sstcSkIXAV6Nbdx0UyxmGDt0GWNFH9Bpl5Jjen4LgQLTGSp86Ikuckp6sV4bEfkhPkE/K4tJi9GCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691571; c=relaxed/simple;
	bh=dJDw12+M+6W1sejDRkI0ENffTDagSyupTSXs8MoUlN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OgfOxsN8bYIAY0bd0ciOAToehlowSjkoZjjCAwnk4nzul/bNUGS07iDIxgf8MljN+nTmQvfTZdTT65Vrpv/nIlu+TQQnebQ4PuRXFYuVhlTtCDa2K9WFoK5LCix2K3ZgyT1YQUyV/ICXp29hiVj5XDqA+WYJnTpYL9yuairqreM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hQ9w/Ikn; arc=fail smtp.client-ip=40.107.103.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl/E8/DjEdEYmBBhnjZhpVi3/AGwm8laVSq7ZMEU+snpkMfySPlWVBnlAbnyoPmOcX0E1VYYsrSnr+98EmDo+dwxqtWnNpQllAg+vh+6avwiANbMJxLt+u473//be2THEcNfA+T1BVcrtMKd7vafYXalhxsRvorFeRFv6wKJA9Tf5WBjB6Zds+MNanU22r8lYnsGiwhEgMkJjUkyK4M3L2kjtbBkoq01V2GYVVGzD1RB8tdwwWxgoWikDH84RelawkU3ViOTeOClkAQvONWQD9Yuw+MJhG6/QKWnO+2sOr+BvUjQWPI2AQq09jbj8aQOMHEDyTJmzBZn0dPP8dzEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZy5EnWUrVwf9b1uFWyS1vTb/FbG0dPCtpPBXX2bjLI=;
 b=oKB+dKaq97eCxzQWzc4iVH/8cCaci5HoYbQkq8Z2KQELozryUuV7f0yRm2tR2KtZFxlrrbY6BLICszZucSKKPgI7BTlRvM0D50nDNk4Xl66YPCF578jA2lMVBcfT+bpCwqCOX+be6kOBoqg+n4pA2D7alIwKrUjlpCt7m+VGXHArFJdhv0jmHduIFmFD5f3Wo6q1xAio1+PigdRZZgMekGSQ3o2COHfY5ds+Lmj52S70BKfLM7K53SbvHwWNvfpXcYhCLFrvdd2ZtGFbZ4q+cAk+YxXUb2RjDql50x0eWW7vN3HdJ+3eetLMPuJfTd9dWOZojPuT0KtDUJX6fOipMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZy5EnWUrVwf9b1uFWyS1vTb/FbG0dPCtpPBXX2bjLI=;
 b=hQ9w/IknvN0PmPKh6IByplFxqvOo3qh7Y6ajViCxmFQ3buaxdUtdiYfpaz0I45Gyus/t0jacV6+8rIXCEbh7KyhxvY0Y/TFdFUZhOCOVJrkOX/Q8Uk4OQUNJnPDpF2RfkJUDDk/wLx9GUdgI38deJy0cMehi7ID2qc9Zj5EgS+Az1zijBqRRltffO5oZpDAT+14YQ7KNBdW+Mur4iI62gb2Ct4NRYPlVJ4D2CdxvFGs3kYbSq6wU6A3HmcxLuyztvFGG0zGcOIj6N9X8La6tjuf3ECqvCOMq+A1k3M5i/rB/f7qclGcsven3ZgSzvNMM3dMoolvIbrnonk55qDHbZg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:12:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 11:12:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
	<linus.walleij@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Fabio
 Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai
	<ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Index:
 AQHbVqX7U3UKEfrBUUq6t/L7CeKKLbNCozSAgADnVgCAAD9nAIABZDqAgADO7oCABpk3gIAAmxUAgAA1fYCAAVrcAIAA9kwAgBzYYICAABSfQIAAFXCAgAAcjQCAATyK0IAAKikw
Date: Tue, 11 Mar 2025 11:12:45 +0000
Message-ID:
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto> <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus> <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus> <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus> <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM0PR04MB6915:EE_
x-ms-office365-filtering-correlation-id: 4461fb6e-0422-416c-f4c7-08dd608da677
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bZ48pPuJZPv8XFK3Ioqv5eOyAdN9QGRMKNDIsJPN63vjOkym8r4x2TFZS7vS?=
 =?us-ascii?Q?x4Gfu5eIRlNPx+PBJP3k5dU+JJl6j8ThOwyXlssz0DDC0euQC0aDWnDZRK3Z?=
 =?us-ascii?Q?i84OAIlcjBCYSnU7mvrodMfROODZ6a0kofI8jDW39SV1GeVMSO82BVWW1U7S?=
 =?us-ascii?Q?Cdmj4HhFc7guEcFK8EJS/v8SVhuozAiFngAm95/ublNHBubfecpMiIV+pulI?=
 =?us-ascii?Q?sA+nlsrYbqJaLVWvgdKS8I6YGDcvXOqRnmuzmmukUqkPcmtgWCRdPoPSUj9f?=
 =?us-ascii?Q?AEimW0byqQD4lCMu8oRflipqDGnDTm8le9xqW+K2HMyL1x1uWyLa20CthDch?=
 =?us-ascii?Q?XJEh1H2TabpBkhCFmtHt2on13tjiw3/mpFj4lF2Pw26Zb+6SaZ80hefWLmJU?=
 =?us-ascii?Q?jfTIpk+S/UGwttsNJ9FyhMx8pUB2p+I6DuiOlkr96YxN6uc6IH5wPoa5YE/F?=
 =?us-ascii?Q?SuS7CKbR5r/u4ikrKuJd1Kn3iUX8rlajAvZ1Akd3OsB+HIoOmpoathREbHOU?=
 =?us-ascii?Q?VQee4EDEuKlYDDGAYv+e63euF9kt6VIgO97ovLZDcvNOQGPdBO8DzPsj85Zw?=
 =?us-ascii?Q?juadvk8WymjV8UXv+OKWH7QgZPZu3nNbTFeYVBhF5d5vPsoyxQgLSCiGzaGW?=
 =?us-ascii?Q?hYIgndpXet6z87GW2O2BreWOOjve1BjzozeQClD0nj3zzCSAPLbOpYb/k+Mi?=
 =?us-ascii?Q?1aE9JreFbkgXd3mNgw2bAzSV1hc06eIH/14Qddry2C/FW419V1zFJHnHp8x6?=
 =?us-ascii?Q?ItgqfAnp0e88tG95MZ/tZ0lgfWQ8p6wI6G7XAhViQnc4iGx/+oKXkJQJOqu0?=
 =?us-ascii?Q?uXC0hdCYFJTXkxHNjXamLaEm867mN9RRq8Qlw8aye2P3XFoaTZ+TqXKbOYkB?=
 =?us-ascii?Q?QPaFRY7ZnrFo7ASTcnXstmu5DUTqJxaaIxI0FfHTspua/s8NSs8NMfJIuh5L?=
 =?us-ascii?Q?s87Fqy076aoFg7jP0nVkFc6Mo9DrUsJ2Nq7L52AbOhFMpBwG3iV5zXJl/hTQ?=
 =?us-ascii?Q?cJII2iw7ZNinqFA+5RNw1H1LZWQiuS5KE9myi/8dw471iVQ5eZxGkJI+mJXf?=
 =?us-ascii?Q?IvoP5/L/54o5HujzTDQWPXkeG0yQygT36nKBv38ieshCbWptRoE+XQ8Snt6v?=
 =?us-ascii?Q?qsINXcjMwwwOpYddBMxVDnVsxSKnA1BFIIr93EugnVWAydfxwbntrQgmz16U?=
 =?us-ascii?Q?K8MwiMRluCAzIA6p6rTWLsbKRZwuqnGoFq/+73rszt9quJZRXRbLAAfSFPiI?=
 =?us-ascii?Q?EQM88zBTFUvUmt3ON/yKdh27cnAXHXz0txlwprrPo3caPkZ+45xqIbCqGo5q?=
 =?us-ascii?Q?4mqHawmUM606RGnE7dDB3ORh3+6Tbv/+GjZy08CMsn4c3rfG42NOb3cLoCaa?=
 =?us-ascii?Q?x05ywkY7mqEpUS1AfSNmV676gBje?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FCpyUbp7MI34IfgO6m/55izgPqSfJH9MyUQXWsx+75kbGyBHljt9ArgworuH?=
 =?us-ascii?Q?BIFQzG15VGKIczSmAc+NF38BBqMNILbeNaWKrx8ObiatScirUpjmW/F5qLcF?=
 =?us-ascii?Q?lwQMiOfMelUOiTDWX/qhnmyWqi6rAEAHOlLS4nrLj7rYZ0Pt4aVOD6fAzlvz?=
 =?us-ascii?Q?u72G7NYT5vd/UbBrlwCNXlTz6ne3ekd7N3n2zoZD3rgO4DBQqfVbxwST0AG+?=
 =?us-ascii?Q?h9u/o6DtNIeSdUVfGH+SkhSlg0lNwfqt1ezk8NFwwHM/CumNZ4X7ajfwfCAp?=
 =?us-ascii?Q?HdeCH1YxUCeCYfbXQWsBG+I0tVGku8qra5qoegNytFsEKoEps7tt69fspm95?=
 =?us-ascii?Q?9FkwVHNgPucnhRlEd8qFIN008pjygYPOZCw645q9W55bM97jOtnil6WY1r8d?=
 =?us-ascii?Q?ri/V5/b3KVbKE5tNGTBC9qTaKFa3cxncnCT3mrLBExZPKc1MS4sqi65WxsyM?=
 =?us-ascii?Q?3PUsvpvyeuZz5/WX1iH+0sXe1JAi649oajJB2kZlWu7ZDMYalU7huQcrLTkj?=
 =?us-ascii?Q?cmI1uONGmQOv9+RdMCrUcz6Rksas9WUzqXmezLH2enTgyrm8TovrCVZlZtDi?=
 =?us-ascii?Q?wv1toQ1pIRuQjzvQA4VQHecI5aj0YwUd8fFkqsTxOS9DjLema6jTbKqjeK9P?=
 =?us-ascii?Q?dx9OlEjvARaSOxNTdcFgVc8ovS7Yg2nlp0yRmrBnuRoSjQvSwaImoTXmubpI?=
 =?us-ascii?Q?C3x0Hhi+dJvXJ8LheqDTLnNfsy9ndS+BB+/zEfVygtnKA5DuL91iB6yUEikP?=
 =?us-ascii?Q?W9E7hvZ90ygO06+iW3VAt9BxgX9EAQ84ZjehAGMzpUxD/OM0YxKqzuBfTfAV?=
 =?us-ascii?Q?f2pt86bCgifocBbUExl8/bvSvlhyZhA8EVqMp3avUoVqk+oTGldsh5p5xy0L?=
 =?us-ascii?Q?JoJy/cNtQ9Ezxa5kY7brxTtixjmACxRzspMggSnFsy4BFZ06q+3tDDg/pzCZ?=
 =?us-ascii?Q?EyziOpVeyTnAqK2UKauoJJ91+9fmOP4Fr7RxQEVa5mh2p1r2fweH8Kwj6iYK?=
 =?us-ascii?Q?cDAhSx7rLKyQk8bl8xtbLsUmq5CemOLMuJ0S+cyXmYWhtIZJvEYewHe7euCt?=
 =?us-ascii?Q?7U/DoXfRtfSl1uJocnEVB6ONIdrR2stH4Tr63dOv12kOh849OTVdfnbGNBXm?=
 =?us-ascii?Q?0eFZwq1D7ijwMNe1fT45BmLX+hhO7uqF2RJW0JZBcw9kK2NELOhq0W8jlDPt?=
 =?us-ascii?Q?I2oJMN6aBbEEl1O6Lbu2dU3Y7sChEOIJin/wa72PqNuRzUELvgurbEjvtq0j?=
 =?us-ascii?Q?mEZiGUZzOkLCusz0InzvaZhMaW43QWzsXhGZVOsCfsDsUG7J4t8o3fWTZqZv?=
 =?us-ascii?Q?gPkA3Bo9bZ9Sljab04lhYK/Z4XS61h4yrHLWe6r3Iq214tHkIk/GTVh0mMbf?=
 =?us-ascii?Q?LqmNbIeuiFfq6IXdBBqGibdhPivlc5OFj+0qYgL3kN1L7AIX1otaBTFzmAbT?=
 =?us-ascii?Q?bJ2gnrS2Gad+ipMo9ZZYCGywxb0tsrbVVNIeKq/J3ZW+NvXuQcPTk5sTiA13?=
 =?us-ascii?Q?A+9dqVMgrMGuSIqTfhiNmg2lXj9EblzDt5LyO6Ewi4vhUJJQpxfxwrut8GIF?=
 =?us-ascii?Q?tqVfTabegttjypasGLI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4461fb6e-0422-416c-f4c7-08dd608da677
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 11:12:45.5817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MiI9VgH3r5ZiJEA4UmNg+3Hvgnb7cnDC5nUB86AiMk0/Jt7XbsqUaVdX1cz0G3b1f+di+Q2ErVt9zw0oMXfazw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915

> Subject: RE: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for scmi cpufreq
>=20
> > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > fwnode for scmi cpufreq
> >
> > On Mon, Mar 10, 2025 at 11:59:33AM +0000, Sudeep Holla wrote:
> > > On Mon, Mar 10, 2025 at 10:45:44AM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass
> setting
> > > > > fwnode for scmi cpufreq
> > > > >
> > > > > On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> > > > > >
> > > > > > Sorry, if I misunderstood.
> > > > > >
> > > > > > I will give a look on this and propose a RFC.
> > > > > >
> > > > > > DT maintainers may ask for a patchset including binding
> change
> > > > > > and driver changes to get a whole view on the compatible
> stuff.
> > > > > >
> > > > > > BTW, Cristian, Saravana if you have any objections/ideas or
> > > > > > would
> > > > > take
> > > > > > on this effort, please let me know.
> > > > > >
> > > > >
> > > > > Can you point me to the DTS with which you are seeing this
> issue ?
> > > > > I am trying to reproduce the issue but so far not successful. I
> > > > > did move to power-domains for CPUFreq on Juno. IIUC all we
> > need is
> > > > > both cpufreq and performance genpd drivers in the kernel and
> > then
> > > > > GPU using perf genpd fails with probe deferral right ? I need
> > > > > pointers to reproduce the issue so that I can check if what I
> > > > > have cooked up as a solution really works.
> > > >
> > > > This is in downstream tree:
> > > >
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> > gi
> > > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> > 6.6.y%2Farch%2Farm64%2Fbo
> > > >
> >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L2971&data=3D05%7C02%7Cpe
> > ng.fan%40
> > > >
> >
> nxp.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2
> > b4c6fa92cd99
> > > >
> > c5c301635%7C0%7C0%7C638772109152491267%7CUnknown%7CT
> > WFpbGZsb3d8eyJFb
> > > >
> >
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> > joiTWFpb
> > > >
> >
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DnHFiE5qD7NpmdGmj
> > SUL0mIdOq8P4W
> > > > ErqVq8xE%2Fb3WM0%3D&reserved=3D0
> > > >
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> > gi
> > > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> > 6.6.y%2Farch%2Farm64%2Fbo
> > > >
> >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L3043&data=3D05%7C02%7Cpe
> > ng.fan%40
> > > >
> >
> nxp.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2
> > b4c6fa92cd99
> > > >
> > c5c301635%7C0%7C0%7C638772109152521215%7CUnknown%7CT
> > WFpbGZsb3d8eyJFb
> > > >
> >
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> > joiTWFpb
> > > >
> >
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DM4LJumL6y9bQ%2FL
> > ocPvlNiMnCFtO
> > > > vODYNrC0DGbbydxY%3D&reserved=3D0
> > > >
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> > gi
> > > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> > 6.6.y%2Farch%2Farm64%2Fbo
> > > >
> >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L80&data=3D05%7C02%7Cpeng
> > .fan%40nx
> > > >
> >
> p.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2b4
> > c6fa92cd99c5
> > > >
> >
> c301635%7C0%7C0%7C638772109152541725%7CUnknown%7CTWF
> > pbGZsb3d8eyJFbXB
> > > >
> >
> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> > TWFpbCI
> > > >
> >
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DVpxcGrB6Dnr9yCO%2F
> > wl8sEw1LYSlX5
> > > > nPHqnlJ5mKm%2B7A%3D&reserved=3D0
> > > >
> > > > we are using "power-domains" property for cpu perf and gpu/vpu
> > perf.
> > > >
> > > > If cpufreq.off=3D1 is set in bootargs, the vpu/gpu driver will defe=
r
> > probe.
> > > >
> > >
> > > OK, does the probe of these drivers get called or they don't as the
> > > driver core doesn't allow that ? I just have a dummy driver for mali
> > > on Juno which just does dev_pm_domain_attach_list() in the probe
> > and
> > > it seem to succeed even when cpufreq.off=3D1 is passed. I see
> > > scmi-cpufreq failing with -ENODEV as expected.
> > >
> > > I need to follow the code and check if I can somehow reproduce.
> Also
> > > are you sure this is not with anything in the downstream code ?
> Also
> > > have you tried this with v6.14-rc* ? Are you sure all the fw_devlink
> > > code is backported in the tree you pointed me which is v6.6-stable ?
> > >
> >
> > I even tried the above branch, but no luck. The above is neither
> > latest stable version nor pure stable. It has few extra patches
> > backported though IIUC. Anyways any pointers to enable me to
> reproduce
> > the issue would be much appreciated.
>=20
> I will setup test based latest linux-next and share results. Please wait.


Based on linux-next, I added below node:

+
+               test@4f000000 {
+                       compatible =3D "fsl,imx-test";
+                       power-domains =3D <&scmi_devpd IMX95_PD_VPU>, <&scm=
i_perf IMX95_PERF_VPU>;
+                       power-domain-names =3D "vpumix", "vpuperf";
+               };

I not write a driver for it, so just check devlink information from sysfs i=
nterface.

From below sys directory, this test device takes scmi_dev.4 and scmi_dev.3 =
as supplier.
root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# ls
driver_override  of_node  subsystem                          supplier:scmi_=
protocol:scmi_dev.4  waiting_for_supplier
modalias         power    supplier:scmi_protocol:scmi_dev.3  uevent

Checking scmi_dev.4 below, it is scmi cpufreq, not the scmi perf device.
scmi_dev.3 is correct, it is genpd.

root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scm=
i_protocol/devices/scmi_dev.4/modalias
scmi_dev.4:13:cpufreq
root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scm=
i_protocol/devices/scmi_dev.3/modalias
scmi_dev.3:11:genpd
root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000#


So it is clear that wrong fw_devlink is created, it is because scmi cpufreq=
 device is
created earlier and when device_add, the below logic makes the fwnode point=
er points
to scmi cpufreq device.
        if (dev->fwnode && !dev->fwnode->dev) {                            =
                        =20
                dev->fwnode->dev =3D dev;                                  =
                          =20
                fw_devlink_link_device(dev);                               =
                        =20
        }

Hope this is clear.

Regards,
Peng.

>=20
> Thanks,
> Peng.
> >
> > --
> > Regards,
> > Sudeep


