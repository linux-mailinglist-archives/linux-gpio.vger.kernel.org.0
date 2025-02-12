Return-Path: <linux-gpio+bounces-15800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F6A31E88
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09E833A70AE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858911FBE9C;
	Wed, 12 Feb 2025 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ch4JGw/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2084.outbound.protection.outlook.com [40.107.103.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0E1FBCBD;
	Wed, 12 Feb 2025 06:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739341149; cv=fail; b=oF9fqmkwSRRO5EDHC/IqPEnSUUDIr+J+4oduxKJtw8zRH1OUSqWloNQYYxzcBD78GNrGzQ7uvJ/UO1EeqghJ8+7dUNJhNEUoTK9x8HOI9PZnASjslEbol5AE++T2hnoDdpf3swE+3SIKN4Wkykg/Jkb7Uyqn6c3KKchGcL94NQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739341149; c=relaxed/simple;
	bh=kjgnZz9Ym74YGQxLZx+OX79dXk3PMavsa4onhvSlqs0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nNxDvXa3FjtG9m5wWXelUx4ymdp4z05qz45OrNk4szKw6Kh2hITQCZJcDJYY5o5lVMJYqoCIblcCzMtU5EaUgiovVvvDM/KaZ47YqYuSCcy6o4YWbJf3Br0MOf20PVIZtAFZhkBXVjR2+MT4Gu5OjXIIjhofol/pXuD+vxbTuDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ch4JGw/T; arc=fail smtp.client-ip=40.107.103.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTo6oGhbaB37unoFiJYbqlrFk1JE/zSBR8+mGRA9+e4IHgDF7mGA/iAaP2cvC/TS+eaYp8K+swpP4TncU+E1Dw0lYeorQazLSuTvnWGFvyl8vPoX0DM2HP6tISZBlsfdcSmKrHrWbyTbqKsvkV2k8R7Bj4/xkVS+d4FXJDiitQ4vlaeIWTxEyYYv2iQf41K6W9gQn2fiFus/0ztVgRFgqVecOgO+ZFAN3WExwwuqtUf2yZCggegJPkxH3JsAJwsDkiWr+shdX5Zz1C/redtN5rLewfzhDMuuaU4ieCEZSHQo5bHK6ifLpugow2+JTaVfbdwmMbN53Mc1wLVWgkFZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjgnZz9Ym74YGQxLZx+OX79dXk3PMavsa4onhvSlqs0=;
 b=jb3USuYr87PIVikDmri3K7CjdcKYpUkv/IxvRC3B7zZgopdWoFlx20uR4rQizntK/DAyveRlt1vkaKgzP+GGFFqBQvF/uUg5qHRUZMZlSB6muOTbkBxRvZVcoat5Val4N4cayzQrBQyqSmvY0YWKArzerZvO3hBrU248MlZlkeqNsmhGPnZpOG8yresBsN4Dj8qj69ci+uMlmjxGmndQg5zsB88qWP6cpf3mFwoTkzbLSDc//qUcCQu/67l1ecFAo5bGjNPQA1Kdu3Q8wrJzD+f58WLNsBVoZk92YBgOAwLWZA+xNzO2PY7dR5srZa3L8s2Et4rhL7CEby0ETLQVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjgnZz9Ym74YGQxLZx+OX79dXk3PMavsa4onhvSlqs0=;
 b=Ch4JGw/TgHUTEAMOUoczFw0N1Czh975dwFylLJ2xh6YAVnIbyUYFbps3EF+H82nzin7o49qG8uEVu+qk4szx4siGSVTpqg849N1kmlmO8GL0fdVRmLWjCRcmlWPqJCNM/Pwc7W8z/LJUKq6YY4SB2CNGzCtkimsYYe4+Xne1+4E4SkpFHAX2EgtpzmSr9R17uzFBjbQBtw8IC4ElR8urczSBRz2cLkDgMiWwjGR+6ja2ALLSSofvtz93iLwBmXoGzBedI3ggukScFkf+4nH+AC/lGenPtxBsMU5bRehR3HzTAxku5phlwm6cWrt6QeHOmKG8zFUYt5CbKkG3tyL0dw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 06:19:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 06:19:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan
	<saravanak@google.com>, Linus Walleij <linus.walleij@linaro.org>, Aisheng
 Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
	<shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Thread-Topic: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Thread-Index: AQHbawr1A1AsDxfmd0qSLN9sYWQ9t7M6SOaAgAZYiNCAAcC/AIAA9Z4A///9e3A=
Date: Wed, 12 Feb 2025 06:19:03 +0000
Message-ID:
 <PAXPR04MB84598869B5DEBF6260423B8088FC2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com> <Z6Slq4KjS_RJ3ItB@pluto>
 <PAXPR04MB8459A3750512708D2972687388F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6tw3HjhI8to4c-E@bogus> <20250212062542.GA15796@localhost.localdomain>
In-Reply-To: <20250212062542.GA15796@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8907:EE_
x-ms-office365-filtering-correlation-id: c2304bba-60bf-48cf-2471-08dd4b2d25fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FkQhmm2LD9xpib4vDbHRLRJXKiWW0gDb4HxSMr1QIQ6dnkkeNFamlVjx6F2i?=
 =?us-ascii?Q?20ttD4m9fZpQheaQxDU8IzLjC6Tz0ETi9Kjqegis8a9Lqd+UIPuZZRTCVwT4?=
 =?us-ascii?Q?ndwaldWt3yhZigHN/T60PszZEAQ/TlFVlcjJxFJEsW7kn2tQWyfuoPzuVkmw?=
 =?us-ascii?Q?iZO7DrNjIQnI7LUV0h+nWPyJnD4UJgSZedNb7jZyNZQkiJdYD+jddKANqkl5?=
 =?us-ascii?Q?jEJt1Rc4lGYnoFhf+TEjCuTIDVN/g6TCJ8FIPeA+zzknTgkrGiolrtfCAEL3?=
 =?us-ascii?Q?pKZHcXtTAUNOHKmgOSk8FQi7BFXFs3yh2edrIyDpFP2jWuKObxdD+Fg5PqNy?=
 =?us-ascii?Q?ulUTJ2INKzhVzROy14ip6mvhp/U+DbFLSaAG4Z7OXvFPgstB5ybD9E+fT2cG?=
 =?us-ascii?Q?Gsj79UkWgSsyDuPwJdYGz87/u4oF2iW5ZXp9ZTHLB9Rcrp+ItlUa/pehR8i8?=
 =?us-ascii?Q?GUZj30KikxxFP7pK+5Ky+uqNftIlynP/u+kEzFRArAcxod+93UqWGkSLT+RR?=
 =?us-ascii?Q?lk5GZrcvKWJjF62TyO+4QMugw40tVppH33rtxPPZD3hf7xStpafCtdLOzQmf?=
 =?us-ascii?Q?d0Fp6GLroyBhdW7WcDrUQgsW8OmxBBLP6MjJ9bsl5V48SxkQx7unYD+758S2?=
 =?us-ascii?Q?pUJFJ1g1fQVC27FMcdg7rI/CF3ZXqrpHIa7F4/FwDp0qGXWnOTziDphMRsqk?=
 =?us-ascii?Q?O4yq9Y70boGUsTRgwwj3/2Zh9PMn2XDHJKuY4Hv3Ot3Xv+gv/U6jr3PGktN6?=
 =?us-ascii?Q?usUEzqvQhFJ0shJ79XlEpe0dijcXTanE8jGTe4Fhu+83KzcPcVMrdKLVNUwf?=
 =?us-ascii?Q?1Qg6l6QXXAOyZLEgVFbDoxhcjK4gqeWJ0GwJFrYkFJkClSsJ4o+EGThdiMqM?=
 =?us-ascii?Q?BkNj4GthoDFQknTdwhcol2SvwNPUsvv6R3SadJnDOzfq+HDhRZMtLBSDKjhv?=
 =?us-ascii?Q?GxeWnNB/h4G0hvElVR23SwhIY6/iGBk21/T6kGq1wHN5fGS98Xf7Ib1vgrHG?=
 =?us-ascii?Q?WvGLsO2jas9DhMlH3ed1fZnXv8+wrw5om8+4dvgFB0+sBFn9rkArs7EXRsuX?=
 =?us-ascii?Q?UOIHZ36lD0rfNJT72vh7u0682QWtvLdaUKlHIOEs35DQeE6mv4ozkclm8A6P?=
 =?us-ascii?Q?3HIEgktWXCjDWih8zix/VHQ8AKPyvJlkB82/c3arVnPlEGJQjDVGhvQCIsgx?=
 =?us-ascii?Q?pPxJiNPEiLPQ0av8u6g+2mCjwbdB5yNFCeQpQLEC2MH6KaoJ8mo/g4mOdv1H?=
 =?us-ascii?Q?FLDVl6X1IYQ63XmZ6fJbe/qGdAcFHFs3DdDmQysGanNJHHcLHtcR3D3EhoVy?=
 =?us-ascii?Q?syE+S5qhZ/QAX5bSoV1u1yC8kBNUIfVXscHZvO7t55ZVbY1muMy7f5ZCBz+d?=
 =?us-ascii?Q?GoU6EvP96nJ0ntckYnQR/bKqf5jFzb5i1yowTwZId2lVTOQ4RjN5qCnvt1P/?=
 =?us-ascii?Q?BiAAAD3tY59+HF0ESJc03E8OHo31D+oN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gUsDASu4XCIYJasVZImJGV9Dzenh9L18AItsTNhI60I54KWrkmFRQAqnatp3?=
 =?us-ascii?Q?vIBq4y1iZmoZlqjw2bfmKsoDu2n98p20rLT5fTbAPUsz0PKnz5yrdfjrpgsU?=
 =?us-ascii?Q?7EVstWyuloEHJB95WMkgsk97Hb2QfzQfE0n1uFDBCv2DwybP7QVtNAc/xrqC?=
 =?us-ascii?Q?LDGIqhbIGgtE9sjZYicbJJ6GU3nimCcPEZ5hoj+JLE2ZVgliY9M/eDwGNwsT?=
 =?us-ascii?Q?f++D1XiI0feGVYq44sn1bW7miZAszS99zvVLjntZnM11zkhrH+9RhfLdMXSr?=
 =?us-ascii?Q?dvUrw1vmCmOgcNpOg9hAOXAH/B3DTQz9G+QEvH9PprCK6TRk2RVfwfEoPZul?=
 =?us-ascii?Q?le7rRALFMfhrku6xw4NArW6vz2+pzX9/7plvRPL5x/vCQaFbeeveQwlcJkSr?=
 =?us-ascii?Q?Ro+uUf5HXDsYQDAIGA/VqPcSyTfOXVY7ByvgIhADO3/AUWmYzbuKuvFbfjFL?=
 =?us-ascii?Q?bazKiE/Q0ao26YbIp62gF/03X3fTrbxs2cwJ2Rz18VSXn5aF/oPEDa1p9lGi?=
 =?us-ascii?Q?/5NsI78l4z4tGWtuG56c4eJO2ZxG0V0HlyXE5wrfVTrJ3Z9aAw7YRX5WZZxD?=
 =?us-ascii?Q?mlFjOOc+SE4nCrPlQTDRsB+pOwP9JVIUvqVfAYFQGuK0luDuxM0yyl/8MNvh?=
 =?us-ascii?Q?/FyJSOMDN+VxeU+czr82kzQTXpKneym2gPfMo66PKpFmpunaNMA1+dKHtnv7?=
 =?us-ascii?Q?M7xeDSfsztQ4lASMs84cQOe74ifvR8zwySuWuOJxnyjiDOUqLudwDyJR0HX9?=
 =?us-ascii?Q?CzchzsNl68MKizkLRAOqdcWvnx+ocAukvi3s4FK14+80OWyPJyjjhK5EXYI3?=
 =?us-ascii?Q?s2kg3Z33Vyf6KLz+Wt85Djwd8EBm5EzFTfWAzujqd3G4yLHy3kipptQ8y+Hd?=
 =?us-ascii?Q?Pmsb3YK4Cxakvc76MlXk3FnsUxK2nuxQx6Fzjwk7nESpjyeRIrGtpxcva7MI?=
 =?us-ascii?Q?5WqL/MAQS2p7UU1YyX0C/BaERydPWnEgwN6BW+d17J2V6JsqiQVFy0HPwjQV?=
 =?us-ascii?Q?EVot4Y1HYdXt6Xy1q9xUzDrFBBLc94Dj3vNtjMTadwAz+ZCVs4DAUyc1jZKr?=
 =?us-ascii?Q?kbJaA2eJJRUPXBvcZF2OEDf5d3d9YV39NmMogcjRO5jMI7Ymef0WNoap5+s8?=
 =?us-ascii?Q?cZs2+HwjTBCkcVEeaMJYRPdDoBr/wkkXbg2eIubw4TPaUWUEc2DJ/zfkEfL0?=
 =?us-ascii?Q?5l/FPx0d6AdUaq2YYV4AMDcoKmqKh3YyS47z4gpUKfEoyQxQXA7lJRQx7YGY?=
 =?us-ascii?Q?bgxGQ6i4EztVeqpKU78S6kuzjthQy7O3i1no7TH2SenACegw9SEKQ2v/1e0l?=
 =?us-ascii?Q?aRn5XPgx3P2NJ+PPte7rwQrFsLkpc/vWZCnnpbc8KGdRnOpxcYmC6K6bjHdV?=
 =?us-ascii?Q?sCaY+G6aIRcup+2e4UZQ68r6T/g8X49z/hPjbRt/7KwfT5jwFtRUfRnP1ksg?=
 =?us-ascii?Q?OoCV5jJ7osl2C10m2VIhGVnr3fZlhgyIgAEMW3/9AjvCpfuDir/CWsvfCY2P?=
 =?us-ascii?Q?RjdGTiEuvvnJUbA7rJXfIUrkqVlZp2l8WCfaFGFMOb6p/ufuZok/Nf6f3oye?=
 =?us-ascii?Q?zSCl3qCOViZjLOrJa1Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c2304bba-60bf-48cf-2471-08dd4b2d25fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 06:19:03.8959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yV/NH1nhBNsi2UqLvzjf9H6e6cXWqVko9ly9F+7LRQO7a5B2oiPp4Cu07Rm17QzzYObu1k6syAaaMFqRMPHPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8907

> Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add
> machine_allowlist and machine_blocklist
>=20
> On Tue, Feb 11, 2025 at 03:46:36PM +0000, Sudeep Holla wrote:
> >On Mon, Feb 10, 2025 at 01:19:14PM +0000, Peng Fan wrote:
> >>
> >> I just have a prototype and tested on i.MX95.
> >
> >You didn't answer me @[1]. How can we disable it for perf/cpufreq if
> >there are users already. I will look at the code once I am convince we
> can do that.
> >For now, I am not. I am worried we may break some platform.
>=20
> The only user in upstream kernel with using the dummy clock is juno-
> scmi.dtsi.
>=20
> SCMI_PROTOCOL_PERF is used by two drivers cpufreq-scmi.c,
> scmi_perf_domain.c.
>=20
> In cpufreq-scmi.c a dummy clock proviver is created, the gpu node in
> juno-scmi.dtsi takes "<&scmi_dvfs 2>" into clocks property. I think this
> is wrong.
>=20
> Why not use scmi_clk node? cpufreq created clk provider should only
> be limited for cpu device which will not be impacted by fwdevlink.
>=20
> If wanna to tune gpu performance, the power-domains property should
> be used, not clocks property.
>=20
> It is the juno-scmi.dtsi should be fixed.
>=20
> If juno-scmi.dtsi will keep as it is, please suggest possible solution on
> fixing the issue.

Ignore the upper which maybe wrong.

The dummy clock provider will always be ready before opp. So no issue.
But anyway if juno-scmi.dtsi using power-domains for perf, it should
be better.

I just replied in V1.

Regards,
Peng.

>=20
> Regards,
> Peng
>=20
> >
> >--
> >Regards,
> >Sudeep
> >
> >[1]
> https://lore.kernel.org/all/20241227151306.jh2oabc64xd54dms@bog
> us

