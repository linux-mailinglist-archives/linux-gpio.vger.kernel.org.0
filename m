Return-Path: <linux-gpio+bounces-9768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5B96B6C6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEF70B25FD8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5281CCED1;
	Wed,  4 Sep 2024 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i/R1/4z6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8211617C9AA;
	Wed,  4 Sep 2024 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442185; cv=fail; b=HHE31+lIcZSardQt3ob61l2+A1hoqYRD+yjGX+G2W7bCxW+IO52qL10Adx30UWyiSKH5wkzIrGKSrt2VF+pM3AwxQbSDgSYZfsvfo+ZbIPfJekuraEPSE438tU0IboHaINbg4DsnVJw0bFNuYlaCwECuvLthgiKAxjnzdC5fyAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442185; c=relaxed/simple;
	bh=v8KzG8QJmSAVLirlbAG9ssDMAdnJMIvfUPEaweYNQ+w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KGTDzIVc5pxzT5L62CSmptXJ0l3M7H68SChqGEx+H16VWQ0YEwNScpTZrlRuylrbCCMOTEdA5piHxqPxgzuftLeisbVgchYtEPTqmj3HhYDXKVU4Iw4IdtQFS0HlBtPwBneDoFp5Eut8LsT2avf04X+runBA75g3EVCBLq7aUGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i/R1/4z6; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeGz0/0FCMyxPvh4+V54xBF8/BZxpee8O3yAEX491t/+P25n8EYmIhd+nVs0oMbWi10RvbCiU5UlXYquA8YCjGnA3fUHAMlFB0GobeeYH2985A82fVzkBaKDEWexS/PLFXxeyJ7WyVl4w1l/KGFzr1KTnr7kUpAfDCcVcSK2jULcyTkzr7GM123yVBCll7lA1YT0c0Ic5PxJXa93BRzCiO4+/9r86rZV8qvicKjsGOCZMz/CKAWgLw9XLIYCRkNW5+e4HXMx4qEox0tKOY+1gsgvJNuxVurMvB7G/rb7wHqQPF8Yg8p3m0ifoPsxxzXGs6qtIs8fu25pn0GhXiVDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25PQ828mcl9cPhzX4oQqXZDlxK/8jLABb3tEXvbdtgY=;
 b=jtRAu8h2qYBqbEEFB7BjfTcTOoYxfncvzit8wlYB/yWL8bwpA8b/Pz3UIj8TnHGboUd6xBOSsY4F57blBFoiw748RSHi5P8CBZoKEhY6QIzK+l9vuDH5ZkmfYq8uoScHkzqe2rrpre5zOihPpX3MXd/WL7mCJVyoJopSS7vEkvmPPYnKtHBxPFTfQPXhQ6/6GJsySx4NyMzpirAsxl9zSbMa/FkO8bZmuofVc6yu6eTzvvEEQ2+C7mjQNUIC/xjx+wTlvxaMZQfgMQ7lZg/5Lmn2lnXLY+qqkgt29PGsC7KYKlD5sLsCg4DREkwl2yjHZDmRyBgI9SAdmLXKtZn5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25PQ828mcl9cPhzX4oQqXZDlxK/8jLABb3tEXvbdtgY=;
 b=i/R1/4z68vzvKGCv7zYzK6atcplKH5id1hc+aktx5UeHz3jEdBpvpUGJqX9V56VDhgVsz/H7qLpWLA1VyzXrkI4MCJAxnEkr1jcmkktRIMVrRLQVaFxuPeW/XwTb57Oy1UnNIDdGPAE6xBbwR3Lh0IhvSEofmS+4KMZYz+B2TRg=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by PH7PR12MB8107.namprd12.prod.outlook.com (2603:10b6:510:2bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 09:29:39 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%3]) with mapi id 15.20.7918.019; Wed, 4 Sep 2024
 09:29:38 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, "Simek, Michal"
	<michal.simek@amd.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>,
	"Kundanala, Praveen Teja" <praveen.teja.kundanala@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Topic: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Index: AQHa/fF/0WFqaHERoUWtBtA5swOzz7JGMcAAgAEoRIA=
Date: Wed, 4 Sep 2024 09:29:38 +0000
Message-ID:
 <BY5PR12MB4258A5457F953A1D3FC3A04BDB9C2@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240903110717.2283362-1-sai.krishna.potthuri@amd.com>
 <20240903110717.2283362-2-sai.krishna.potthuri@amd.com>
 <20240903153452.GA1050106-robh@kernel.org>
In-Reply-To: <20240903153452.GA1050106-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|PH7PR12MB8107:EE_
x-ms-office365-filtering-correlation-id: e0b9e59d-919d-4dec-e4a5-08dcccc4193e
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6k+Kr8qWEimLPLg+rZ/XNQgk9GVcvYB2N41jjCqVvu1oxRFXf50ykOh7Q63w?=
 =?us-ascii?Q?h0BQNwUNGVKw7cRvuTF98i8OVGDoVMx2/ZIBDHwsJyRH4ugfgVQXuHmc3RXI?=
 =?us-ascii?Q?PSgLF+eVj+3teI97YhA+jv2aK1hltcEbmKQDY/sEzZYgWGC5PDRQzejOhtMg?=
 =?us-ascii?Q?BP4Fs8yz/XxAhqVwRhaokNwTyJPFvRe0QiLxQ1X8r3h2xoMQHgzhZXTGWf5Z?=
 =?us-ascii?Q?ssaQ5/SZSrhTAmaYcKoFkABXhuSytVZQ97h4u9GbfpuiZNOcw2vQsOkZI1DG?=
 =?us-ascii?Q?IdxqSs1cVJWdz3qOpSr658v21R8kQ7JV5JDBHIkwc/c4bsQ6LZTny2O6LiXi?=
 =?us-ascii?Q?rO+zfGjj9VZBsRNvqm101JbktVzi/A87hAEp5LdDPmF4qjr5zUaAwOygXCEc?=
 =?us-ascii?Q?WcMW3iPm9QfdqXnJ/lKECRQb5ce9UfAbtG9dx1nkqIewAi978tLcpZnWlHX+?=
 =?us-ascii?Q?p/ZvErcTAZyeO92IhCFRs+jD/nCr/ApDvyucmdn5kfC4YV/Ybn6YSytYodu+?=
 =?us-ascii?Q?vmCnHo4V8C70U2Q5qbAxrhrWx4F1LkRTabthU5DpylxoojWTMUhQBQnE7kjp?=
 =?us-ascii?Q?GViMfSYUfFNg2UEU+MmI9Yah1JEHQvdnK8KXtDj9fNfXu/JN4kGacz48sz0Y?=
 =?us-ascii?Q?ErY8jshlBhveC0eIv1HwKI+9G7wb1033LSUcju5Dm0GSAA1OqiNANbv16XQ2?=
 =?us-ascii?Q?AZNPCthsdgYOh73NR+7xSmBVOJMw//3lZ6gPLSYbH+qRjqM/LDLLGBig79l9?=
 =?us-ascii?Q?8L5q94W7GHKpGr2dniUHx7mcvCBUqhbLhGOkOyfDfkU8XdeXgXwt5saRxs7K?=
 =?us-ascii?Q?MAqjCHAGzS639mvqBBQQkKWERAm5syaf6k0urIL6s6KnYMVvfr9BaFPs6XJW?=
 =?us-ascii?Q?VHo3dodLUOFDehfXShxPATkaHC27zx0b7ErG6laD2NxBGdcb68Ku7BI/B6NG?=
 =?us-ascii?Q?MAfxywy4nxoN5xjO1Q91TSIQKFF05uQQw+MHki/5CmrDBD9oW/9G7qN/sJoa?=
 =?us-ascii?Q?d+fca2mN4jy4OwI6ne39xRyw1uCao2yS8ENh9sTuwaIRgxJjfH4JiS1HvS63?=
 =?us-ascii?Q?XQR+tkS99slx4cnjxLr4h2cvkBRhJLZTLKYwgcrqZLHHfNkFw53v+/Ju/DE4?=
 =?us-ascii?Q?5p/szsbJ+NChjOleglPXpgTfZ8YwnbjarQFeOPamRQzAMGpVgF+xNPxoNzJN?=
 =?us-ascii?Q?NaGn5AjzHxfV5GN5ZlBw1OYRTPf5rrSd2k6tp1/vay7xN4oqCBfjO+lfXk7B?=
 =?us-ascii?Q?SdJ3TmiusGkGR65PIH8myqWnHG4kP8do5bOC7dnY/SP297UZIgjMWUxlAWVb?=
 =?us-ascii?Q?r6h3mfvE6TQIo91+85ESnedG4Pibjm01rwvzxzlh8gFV5PMvH5G47gzlVdCu?=
 =?us-ascii?Q?73PVD8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7DP/MOyDh5KMCvLc+I9C7BvAHwBJyJFEQT5x8w6ZBpc1njvc44LtSCEUCrZb?=
 =?us-ascii?Q?+NroYAYyvly5nArFI0A+Mks9j0in4m2VA7M42l4BQ3JBy69BKoWEnpqZWclL?=
 =?us-ascii?Q?Rjyljbx5gRgwpdobNXnTigv0WmGbLG230x8Q7vgE+t+krNBf6qG8TqD3BTkJ?=
 =?us-ascii?Q?MC1N04lQoT7LiWC//sVyzFA46tlb//Yym7TF1vHamRlHJHZz49vLiamstE/B?=
 =?us-ascii?Q?dIBFlAMW5YrbTj/9LGjEJ4H893JlWmiBKKcUKbHkfvFPH98QhASASMdEIxYu?=
 =?us-ascii?Q?7bsxx0TKiSJAV+ZNISCheBL3dAgh4D1KNMYX3+rYQ1Y8fXxRMD5fsd4z0w87?=
 =?us-ascii?Q?Ru6q1com8S2UMHfxqcfLC7F6pfbdwewgCLl2CeIleMttYGbiVaCBQaaCP8Y2?=
 =?us-ascii?Q?0WDmtfD+0L0b+Tl3DiL7VNoNuP9szavvM5tU6qNxitNdSpz9ZBpJkkDX0FJu?=
 =?us-ascii?Q?+QEQ962ln4dzkRksrE1W0iNGZBzOwAuOMP2WkWk1Yd4UYq7VDNpeHgSs9HXJ?=
 =?us-ascii?Q?aQQvDImATuPM807tNThdjXVL1bEvkvZQQzl4eartSYtwbPJgfI9hyT5+4CJu?=
 =?us-ascii?Q?9yyV6d+63o52/QA/itELhcsbsFNKzLg0s+q+iACvzDF0/GyVcGMklByf296Y?=
 =?us-ascii?Q?P+AHoADoHdnhZmczH7ZjO59ZrzRVfXmT/1HpDANrolb6D+QgPxOjwgfVT+xY?=
 =?us-ascii?Q?UL5VvJfKQ/RORhEcu0gAsivODr/E8t98/IfQvBcQruLN6DG8s8NFEpq+c7sa?=
 =?us-ascii?Q?fK9wN5c6ecV7b1qUQmivVuCgXM1D0J8sz2rJJ12mjvPJLrJwvajpyd9yIokW?=
 =?us-ascii?Q?XoFFiueF563XVNKyZg9APfRote6ZMjKTToPy+5bj37Dugz1rKK+1Tc53AnXV?=
 =?us-ascii?Q?wd1TUUOZZwjiT+47mCXSc4B5THBWRbfwCBD6SSFkOGI03dRqHYYU++h1nDa2?=
 =?us-ascii?Q?nztA1aD4fWsL+fqTjev598JkSK1D27VHHr8OmYN98zqk2xUZkFuc58Y0PI17?=
 =?us-ascii?Q?iUNhVWHrb79F0kosCaUMpy0jqHFIBzXgRQPXMOuZh+pT7OOhspMN9NG9umI6?=
 =?us-ascii?Q?apgAyejD/wf90gOXJfUSWCre9sHlJgBXrI6HThQ52RQTV/CJf/KVgWUR8X9h?=
 =?us-ascii?Q?xCnCfjyOnfsSwRB+lU3yWwfb1XWFdFVgx2wAwOm4MEQhBX98CdadaP+f/Oym?=
 =?us-ascii?Q?8YHkKhcKI+WDcqRxOsJkujh89K/vM2fz/lO234oI7Dp/LhC0cupKB2zNOJOw?=
 =?us-ascii?Q?oMsR8LAsgxD/eTuiRQsv9Af/3brXx7HUe6LUDC3Dj0DjF0WzfGDk/lzVagzg?=
 =?us-ascii?Q?XPHpB9594rhCdUnMV3Ffy5zdgZdSPCatrhDKqT6+hrQYMESqFw0NuT/inyXL?=
 =?us-ascii?Q?MnM97yTD+61cEMdDGedRJBZSwbkoxRXfggOIZIT90LLLOjZ1RMcKysZNFD0t?=
 =?us-ascii?Q?Y6BQEE6vAvd4tvXfU5anR84x8Zqb/Ra9RB7NBOkl+sTiSgIBRMqdTf4cUHbB?=
 =?us-ascii?Q?MJJAGRqlUgPl3sx1PB9RGT7bOjPxgsNhMPQ+RwZznXZ6Gz+/HcsiHamOQeHE?=
 =?us-ascii?Q?EFAlVEFeGA3vQT9kJeE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b9e59d-919d-4dec-e4a5-08dcccc4193e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 09:29:38.8905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89DwqBts/HOdWnC8tXmIbf1msoUj65lPTb4P4BFEm2063SZMI4mDHxXcxGKFqBvZx7QyoiuE+Hr+htmL+yN/SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8107

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 3, 2024 9:05 PM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> <michal.simek@amd.com>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Buddhabhatti, Jay
> <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; linux-arm-kernel@lists.infradead.org; linux=
-
> kernel@vger.kernel.org; linux-gpio@vger.kernel.org;
> devicetree@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
> <git@amd.com>
> Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Xilinx =
Versal
> platform
>=20
> On Tue, Sep 03, 2024 at 04:37:15PM +0530, Sai Krishna Potthuri wrote:
> > Add Xilinx Versal compatible string and corresponding groups, function
> > and pins properties to support pin controller features on Versal platfo=
rm.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> >  .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 385
> > ++++++++++++++++++
> >  1 file changed, 385 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..740f8f393427
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.ya
> > +++ ml
> > @@ -0,0 +1,385 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/xlnx,versal-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Xilinx Versal Pinctrl
> > +
> > +maintainers:
> > +  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > +
> > +description: |
> > +  Please refer to pinctrl-bindings.txt in this directory for details
> > +of the
> > +  common pinctrl bindings used by client devices, including the
> > +meaning of the
> > +  phrase "pin configuration node".
> > +
> > +  Versal's pin configuration nodes act as a container for an
> > + arbitrary number of  subnodes. Each of these subnodes represents
> > + some desired configuration for a  pin, a group, or a list of pins or
> > + groups. This configuration can include the  mux function to select
> > + on those pin(s)/group(s), and various pin configuration  parameters,
> such as pull-up, slew rate, etc.
> > +
> > +  Each configuration node can consist of multiple nodes describing
> > + the pinmux and  pinconf options. Those nodes can be pinmux nodes or
> pinconf nodes.
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,versal-pinctrl
> > +
> > +patternProperties:
> > +  '^(.*-)?(default|gpio-grp)$':
> > +    type: object
> > +    patternProperties:
> > +      '^mux':
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices use subnodes for pin muxes,
> > +          which in turn use below standard properties.
> > +        $ref: pinmux-node.yaml#
> > +
> > +        properties:
> > +          pins:
> > +            description:
> > +              List of pins to select (either this or "groups" must be =
specified)
> > +            items:
> > +              pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> > +            minItems: 1
> > +            maxItems: 78
> > +
> > +          groups:
> > +            description:
> > +              List of groups to select (either this or "pins" must be
> > +              specified), available groups for this subnode.
> > +            items:
> > +              anyOf:
> > +                - pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$=
'
> > +                - enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_gr=
p,
> spi0_4_grp, spi0_5_grp,
> > +                         spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp,
> spi0_ss_3_grp, spi0_ss_4_grp,
> > +                         spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp,
> spi0_ss_8_grp, spi0_ss_9_grp,
> > +                         spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_gr=
p,
> spi0_ss_13_grp, spi0_ss_14_grp,
> > +                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_gr=
p,
> spi1_0_grp, spi1_1_grp,
> > +                         spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_gr=
p,
> spi1_ss_0_grp, spi1_ss_1_grp,
> > +                         spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp,
> spi1_ss_5_grp, spi1_ss_6_grp,
> > +                         spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp,
> spi1_ss_10_grp, spi1_ss_11_grp,
> > +                         spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_gr=
p,
> spi1_ss_15_grp, spi1_ss_16_grp
> > +                         spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_=
2_grp,
> can0_3_grp, can0_4_grp,
> > +                         can0_5_grp, can0_6_grp, can0_7_grp, can0_8_gr=
p,
> can0_9_grp, can0_10_grp,
> > +                         can0_11_grp, can0_12_grp, can0_13_grp, can0_1=
4_grp,
> can0_15_grp, can0_16_grp,
> > +                         can0_17_grp, can1_0_grp, can1_1_grp, can1_2_g=
rp,
> can1_3_grp, can1_4_grp,
> > +                         can1_5_grp, can1_6_grp, can1_7_grp, can1_8_gr=
p,
> can1_9_grp, can1_10_grp,
> > +                         can1_11_grp, can1_12_grp, can1_13_grp, can1_1=
4_grp,
> can1_15_grp, can1_16_grp,
> > +                         can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_=
grp,
> i2c0_2_grp, i2c0_3_grp,
> > +                         i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_gr=
p,
> i2c0_8_grp, i2c0_9_grp,
> > +                         i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_1=
3_grp,
> i2c0_14_grp, i2c0_15_grp,
> > +                         i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_=
grp,
> i2c1_2_grp, i2c1_3_grp,
> > +                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_gr=
p,
> i2c1_8_grp, i2c1_9_grp,
> > +                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_1=
3_grp,
> i2c1_14_grp, i2c1_15_grp,
> > +                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pm=
c_0_grp,
> i2c_pmc_1_grp,
> > +                         i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp,
> i2c_pmc_5_grp, i2c_pmc_6_grp,
> > +                         i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp,
> i2c_pmc_10_grp, i2c_pmc_11_grp,
> > +                         i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_gr=
p,
> ttc0_clk_2_grp, ttc0_clk_3_grp,
> > +                         ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_gr=
p,
> ttc0_clk_7_grp, ttc0_clk_8_grp,
> > +                         ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_gr=
p,
> ttc0_wav_3_grp, ttc0_wav_4_grp,
> > +                         ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_gr=
p,
> ttc0_wav_8_grp, ttc1_clk_0_grp,
> > +                         ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_gr=
p,
> ttc1_clk_4_grp, ttc1_clk_5_grp,
> > +                         ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_gr=
p,
> ttc1_wav_0_grp, ttc1_wav_1_grp,
> > +                         ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_gr=
p,
> ttc1_wav_5_grp, ttc1_wav_6_grp,
> > +                         ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_gr=
p,
> ttc2_clk_1_grp, ttc2_clk_2_grp,
> > +                         ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_gr=
p,
> ttc2_clk_6_grp, ttc2_clk_7_grp,
> > +                         ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_gr=
p,
> ttc2_wav_2_grp, ttc2_wav_3_grp,
> > +                         ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_gr=
p,
> ttc2_wav_7_grp, ttc2_wav_8_grp,
> > +                         ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_gr=
p,
> ttc3_clk_3_grp, ttc3_clk_4_grp,
> > +                         ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_gr=
p,
> ttc3_clk_8_grp, ttc3_wav_0_grp,
> > +                         ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_gr=
p,
> ttc3_wav_4_grp, ttc3_wav_5_grp,
> > +                         ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_gr=
p,
> wwdt0_0_grp, wwdt0_1_grp,
> > +                         wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_=
5_grp,
> wwdt1_0_grp, wwdt1_1_grp,
> > +                         wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_=
5_grp,
> sysmon_i2c0_0_grp,
> > +                         sysmon_i2c0_1_grp, sysmon_i2c0_2_grp,
> sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
> > +                         sysmon_i2c0_5_grp, sysmon_i2c0_6_grp,
> sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
> > +                         sysmon_i2c0_9_grp, sysmon_i2c0_10_grp,
> sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
> > +                         sysmon_i2c0_13_grp, sysmon_i2c0_14_grp,
> sysmon_i2c0_15_grp,
> > +                         sysmon_i2c0_16_grp, sysmon_i2c0_17_grp,
> sysmon_i2c0_alrt_0_grp,
> > +                         sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_gr=
p,
> sysmon_i2c0_alrt_3_grp,
> > +                         sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_gr=
p,
> sysmon_i2c0_alrt_6_grp,
> > +                         sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_gr=
p,
> sysmon_i2c0_alrt_9_grp,
> > +                         sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_=
grp,
> sysmon_i2c0_alrt_12_grp,
> > +                         sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_=
grp,
> sysmon_i2c0_alrt_15_grp,
> > +                         sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_=
grp,
> uart0_0_grp, uart0_1_grp,
> > +                         uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_=
5_grp,
> uart0_6_grp, uart0_7_grp,
> > +                         uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_g=
rp,
> uart0_ctrl_2_grp,
> > +                         uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctr=
l_5_grp,
> uart0_ctrl_6_grp,
> > +                         uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_g=
rp,
> uart1_1_grp, uart1_2_grp,
> > +                         uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_=
6_grp,
> uart1_7_grp, uart1_8_grp,
> > +                         uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctr=
l_2_grp,
> uart1_ctrl_3_grp,
> > +                         uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctr=
l_6_grp,
> uart1_ctrl_7_grp,
> > +                         uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, g=
pio0_2_grp,
> gpio0_3_grp,
> > +                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_=
7_grp,
> gpio0_8_grp, gpio0_9_grp,
> > +                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpi=
o0_13_grp,
> gpio0_14_grp,
> > +                         gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpi=
o0_18_grp,
> gpio0_19_grp,
> > +                         gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpi=
o0_23_grp,
> gpio0_24_grp,
> > +                         gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1=
_2_grp,
> gpio1_3_grp, gpio1_4_grp,
> > +                         gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_=
8_grp,
> gpio1_9_grp,
> > +                         gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpi=
o1_13_grp,
> gpio1_14_grp,
> > +                         gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpi=
o1_18_grp,
> gpio1_19_grp,
> > +                         gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpi=
o1_23_grp,
> gpio1_24_grp,
> > +                         gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2=
_2_grp,
> gpio2_3_grp, gpio2_4_grp,
> > +                         gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_=
8_grp,
> gpio2_9_grp, gpio2_10_grp,
> > +                         gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpi=
o2_14_grp,
> gpio2_15_grp,
> > +                         gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpi=
o2_19_grp,
> gpio2_20_grp,
> > +                         gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpi=
o2_24_grp,
> gpio2_25_grp,
> > +                         emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_=
3_grp,
> emio0_4_grp, emio0_5_grp,
> > +                         emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_=
9_grp,
> emio0_10_grp,
> > +                         emio0_11_grp, emio0_12_grp, emio0_13_grp,
> emio0_14_grp, emio0_15_grp,
> > +                         emio0_16_grp, emio0_17_grp, emio0_18_grp,
> emio0_19_grp, emio0_20_grp,
> > +                         emio0_21_grp, emio0_22_grp, emio0_23_grp,
> emio0_24_grp, emio0_25_grp,
> > +                         emio0_26_grp, emio0_27_grp, emio0_28_grp,
> emio0_29_grp, emio0_30_grp,
> > +                         emio0_31_grp, emio0_32_grp, emio0_33_grp,
> emio0_34_grp, emio0_35_grp,
> > +                         emio0_36_grp, emio0_37_grp, emio0_38_grp,
> emio0_39_grp, emio0_40_grp,
> > +                         emio0_41_grp, emio0_42_grp, emio0_43_grp,
> emio0_44_grp, emio0_45_grp,
> > +                         emio0_46_grp, emio0_47_grp, emio0_48_grp,
> emio0_49_grp, emio0_50_grp,
> > +                         emio0_51_grp, emio0_52_grp, emio0_53_grp,
> emio0_54_grp, emio0_55_grp,
> > +                         emio0_56_grp, emio0_57_grp, emio0_58_grp,
> emio0_59_grp, emio0_60_grp,
> > +                         emio0_61_grp, emio0_62_grp, emio0_63_grp,
> emio0_64_grp, emio0_65_grp,
> > +                         emio0_66_grp, emio0_67_grp, emio0_68_grp,
> emio0_69_grp, emio0_70_grp,
> > +                         emio0_71_grp, emio0_72_grp, emio0_73_grp,
> emio0_74_grp, emio0_75_grp,
> > +                         emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_=
1_grp,
> gem1_0_grp, gem1_1_grp,
> > +                         trace0_0_grp, trace0_1_grp, trace0_2_grp,
> trace0_clk_0_grp, trace0_clk_1_grp,
> > +                         trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp,
> mdio1_0_grp, mdio1_1_grp,
> > +                         gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_gr=
p,
> gem_tsu0_3_grp, pcie0_0_grp,
> > +                         pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0=
_grp,
> sd0_0_grp, sd0_1_grp,
> > +                         sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, s=
d0_6_grp,
> sd0_7_grp, sd0_8_grp,
> > +                         sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp=
,
> sd0_13_grp, sd0_14_grp,
> > +                         sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_gr=
p,
> sd0_19_grp, sd0_20_grp,
> > +                         sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_c=
d_0_grp,
> sd0_cd_1_grp,
> > +                         sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_=
grp,
> sd1_2_grp, sd1_3_grp,
> > +                         sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, s=
d1_8_grp,
> sd1_9_grp, sd1_10_grp,
> > +                         sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_gr=
p,
> sd1_15_grp, sd1_16_grp,
> > +                         sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_gr=
p,
> sd1_21_grp, sd1_pc_0_grp,
> > +                         sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp,
> sd1_wp_0_grp, sd1_wp_1_grp,
> > +                         ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp,
> qspi0_fbclk_0_grp, qspi0_ss_0_grp,
> > +                         test_clk_0_grp, test_scan_0_grp, tamper_trigg=
er_0_grp]
> > +            minItems: 1
> > +            maxItems: 78
> > +
> > +          function:
> > +            description:
> > +              Specify the alternative function to be configured for th=
e
> > +              given pin groups.
> > +            enum: [spi0, spi0_ss, spi1, spi1_ss, can0, can1, i2c0, i2c=
1, i2c_pmc,
> ttc0_clk,
> > +                   ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav, t=
tc3_clk,
> ttc3_wav, wwdt0,
> > +                   wwdt1, sysmon_i2c0, sysmon_i2c0_alrt, uart0, uart0_=
ctrl,
> uart1, uart1_ctrl,
> > +                   gpio0, gpio1, gpio2, emio0, gem0, gem1, trace0, tra=
ce0_clk,
> mdio0, mdio1, gem_tsu0,
> > +                   pcie0, smap0, usb0, sd0, sd0_pc, sd0_cd, sd0_wp, sd=
1,
> sd1_pc, sd1_wp, sd1_cd,
> > +                   ospi0, ospi0_ss, qspi0, qspi0_fbclk, qspi0_ss,
> > + test_clk, test_scan, tamper_trigger]
> > +
> > +        required:
> > +          - function
> > +
> > +        oneOf:
> > +          - required: [ groups ]
> > +          - required: [ pins ]
> > +
> > +        additionalProperties: false
> > +
> > +      '^conf':
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices use subnodes for pin configura=
tions,
> > +          which in turn use the standard properties below.
> > +        allOf:
> > +          - $ref: pincfg-node.yaml#
> > +          - $ref: "#/$defs/pins"
> > +
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +$defs:
> > +  pins:
>=20
> You don't need $defs as you only have 1 reference to this.
>=20
> But then the enum for 'groups' looks to be the same in both places from a
> quick glance? So you should have another $ref to this?
Ok, i will update the above properties to make use of the pins and groups
properties reference available in $defs like below.

$ref: "#/$defs/pins/properties/pins"
$ref: "#/$defs/pins/properties/groups"

Regards
Sai Krishna

>=20
> > +    properties:
> > +      groups:
> > +        description:
> > +          List of pin groups to select in this subnode.
> > +        enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_=
grp,
> spi0_5_grp,
> > +               spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_=
grp,
> spi0_ss_4_grp,
> > +               spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_=
grp,
> spi0_ss_9_grp,
> > +               spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp,
> spi0_ss_13_grp, spi0_ss_14_grp,
> > +               spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_=
grp,
> spi1_1_grp,
> > +               spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss=
_0_grp,
> spi1_ss_1_grp,
> > +               spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_=
grp,
> spi1_ss_6_grp,
> > +               spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10=
_grp,
> spi1_ss_11_grp,
> > +               spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp,
> spi1_ss_15_grp, spi1_ss_16_grp
> > +               spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp,
> can0_3_grp, can0_4_grp,
> > +               can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_=
grp,
> can0_10_grp,
> > +               can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp,
> can0_15_grp, can0_16_grp,
> > +               can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3=
_grp,
> can1_4_grp,
> > +               can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_=
grp,
> can1_10_grp,
> > +               can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp,
> can1_15_grp, can1_16_grp,
> > +               can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_=
2_grp,
> i2c0_3_grp,
> > +               i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_=
grp,
> i2c0_9_grp,
> > +               i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
> i2c0_14_grp, i2c0_15_grp,
> > +               i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_=
2_grp,
> i2c1_3_grp,
> > +               i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_=
grp,
> i2c1_9_grp,
> > +               i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp,
> i2c1_14_grp, i2c1_15_grp,
> > +               i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp,
> i2c_pmc_1_grp,
> > +               i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_=
grp,
> i2c_pmc_6_grp,
> > +               i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp,
> i2c_pmc_10_grp, i2c_pmc_11_grp,
> > +               i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_cl=
k_2_grp,
> ttc0_clk_3_grp,
> > +               ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_cl=
k_7_grp,
> ttc0_clk_8_grp,
> > +               ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp,
> ttc0_wav_3_grp, ttc0_wav_4_grp,
> > +               ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp,
> ttc0_wav_8_grp, ttc1_clk_0_grp,
> > +               ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_cl=
k_4_grp,
> ttc1_clk_5_grp,
> > +               ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wa=
v_0_grp,
> ttc1_wav_1_grp,
> > +               ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp,
> ttc1_wav_5_grp, ttc1_wav_6_grp,
> > +               ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_cl=
k_1_grp,
> ttc2_clk_2_grp,
> > +               ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_cl=
k_6_grp,
> ttc2_clk_7_grp,
> > +               ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp,
> ttc2_wav_2_grp, ttc2_wav_3_grp,
> > +               ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp,
> ttc2_wav_7_grp, ttc2_wav_8_grp,
> > +               ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_cl=
k_3_grp,
> ttc3_clk_4_grp,
> > +               ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_cl=
k_8_grp,
> ttc3_wav_0_grp,
> > +               ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp,
> ttc3_wav_4_grp, ttc3_wav_5_grp,
> > +               ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0=
_grp,
> wwdt0_1_grp,
> > +               wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp,
> wwdt1_0_grp, wwdt1_1_grp,
> > +               wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp,
> sysmon_i2c0_0_grp,
> > +               sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp=
,
> sysmon_i2c0_4_grp,
> > +               sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp=
,
> sysmon_i2c0_8_grp,
> > +               sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_g=
rp,
> sysmon_i2c0_12_grp,
> > +               sysmon_i2c0_13_grp, sysmon_i2c0_14_grp,
> sysmon_i2c0_15_grp,
> > +               sysmon_i2c0_16_grp, sysmon_i2c0_17_grp,
> sysmon_i2c0_alrt_0_grp,
> > +               sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp,
> sysmon_i2c0_alrt_3_grp,
> > +               sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp,
> sysmon_i2c0_alrt_6_grp,
> > +               sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp,
> sysmon_i2c0_alrt_9_grp,
> > +               sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp,
> sysmon_i2c0_alrt_12_grp,
> > +               sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp,
> sysmon_i2c0_alrt_15_grp,
> > +               sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp,
> uart0_0_grp, uart0_1_grp,
> > +               uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp,
> uart0_6_grp, uart0_7_grp,
> > +               uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp,
> uart0_ctrl_2_grp,
> > +               uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp,
> uart0_ctrl_6_grp,
> > +               uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_=
1_grp,
> uart1_2_grp,
> > +               uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp,
> uart1_7_grp, uart1_8_grp,
> > +               uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp,
> uart1_ctrl_3_grp,
> > +               uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp,
> uart1_ctrl_7_grp,
> > +               uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp=
,
> gpio0_3_grp,
> > +               gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp,
> gpio0_8_grp, gpio0_9_grp,
> > +               gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp,
> gpio0_14_grp,
> > +               gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
> gpio0_19_grp,
> > +               gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp,
> gpio0_24_grp,
> > +               gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp,
> gpio1_3_grp, gpio1_4_grp,
> > +               gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp,
> gpio1_9_grp,
> > +               gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp,
> gpio1_14_grp,
> > +               gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp,
> gpio1_19_grp,
> > +               gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp,
> gpio1_24_grp,
> > +               gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp,
> gpio2_3_grp, gpio2_4_grp,
> > +               gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp,
> gpio2_9_grp, gpio2_10_grp,
> > +               gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp,
> gpio2_15_grp,
> > +               gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp,
> gpio2_20_grp,
> > +               gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp,
> gpio2_25_grp,
> > +               emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp,
> emio0_4_grp, emio0_5_grp,
> > +               emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp,
> emio0_10_grp,
> > +               emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp,
> emio0_15_grp,
> > +               emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp,
> emio0_20_grp,
> > +               emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp,
> emio0_25_grp,
> > +               emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp,
> emio0_30_grp,
> > +               emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp,
> emio0_35_grp,
> > +               emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp,
> emio0_40_grp,
> > +               emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp,
> emio0_45_grp,
> > +               emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp,
> emio0_50_grp,
> > +               emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp,
> emio0_55_grp,
> > +               emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp,
> emio0_60_grp,
> > +               emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp,
> emio0_65_grp,
> > +               emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp,
> emio0_70_grp,
> > +               emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp,
> emio0_75_grp,
> > +               emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp,
> gem1_0_grp, gem1_1_grp,
> > +               trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_=
grp,
> trace0_clk_1_grp,
> > +               trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp=
,
> mdio1_1_grp,
> > +               gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp,
> gem_tsu0_3_grp, pcie0_0_grp,
> > +               pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp,
> sd0_0_grp, sd0_1_grp,
> > +               sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp,
> sd0_7_grp, sd0_8_grp,
> > +               sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_g=
rp,
> sd0_14_grp,
> > +               sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_=
grp,
> sd0_20_grp,
> > +               sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp,
> sd0_cd_1_grp,
> > +               sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp,
> sd1_2_grp, sd1_3_grp,
> > +               sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp,
> sd1_9_grp, sd1_10_grp,
> > +               sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_=
grp,
> sd1_16_grp,
> > +               sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_=
grp,
> sd1_pc_0_grp,
> > +               sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp,
> sd1_wp_1_grp,
> > +               ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0=
_grp,
> qspi0_ss_0_grp,
> > +               test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]


