Return-Path: <linux-gpio+bounces-10242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B497BA19
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 11:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50721C21F75
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 09:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C5D17994F;
	Wed, 18 Sep 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XYUXcdzj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694A176AB6;
	Wed, 18 Sep 2024 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651626; cv=fail; b=AM0e5olkA3JL3rvHt8oEEJnIK10ZsCQDzNqYlfXEyb6ePyOD5r45IoXW3OtFcN6Dl/eqfX6uSpEjX4twh6GdEU7PA8krAF9BhTaICQugTcyQ8Y3U8GnuQSLCv3cfy1lwejECoPq3euqMRvYMbncQpQhqM7CuG4eha3e3XuIpq4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651626; c=relaxed/simple;
	bh=IBR6bTsOQUcVbXSpPyjQsQ0/jbISdG226ORloQsV3nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u+tyR5FRWBdt/ReZyMPEUQgJ6NjXlU6C1ujRCZWxsPbaDfrKTKEfvV23MFaUPzZEg2VNfDNgheDvmBMxoLwGj8DP68k4yYbvvxwQfBfp8RePa+7mneBxFDq2tItETFpFQ/k0lKpwoO4sstz/YugvPBV7MHtrhRKEXjACpDo9+P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XYUXcdzj; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7Td7NfybHHsr9H7yJlGNODyzyj7oMCMoHBFbvJGLPfOVqNLdKodJxdl5WrKr7NJg3yQqopDGZ1SeBgW0RZIbE4WwW9tYKn+LuZpBXNKrZqLhuHa/wKuUPfdUGAzpp08eUCVqXP22tIK6UaG6+4pvsedCcA1nPSwUfUzWK8jtXqrarj5vJCGtMFB+9tlXwqOzuRycAvQG39ff+maHlSKXFsGHn+ahhQFaUdmvKtKjbEXXFqNXdMga+gp6+PpaQsnTu+5Cd7QKy0eMULozm4BqU/9Wts9Hx2qvgcrVWpM3o/PjWePVYBsfOLg32/Dyr0A2KGB2G233H3te1Fu8RG0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhnpUlU7a6ufk/zzMd7RKq9UhSRelzOOhGv/BqW19jU=;
 b=Sfg217RRhk/jFphK6numRu/zAbAba+MoVG/l6OJG0id3VBelhqU2YjR5gvOU6u4XLIFlcjChMJkeqwiFsORCV2QerH/36AfBdJIASMH4aSadF/JfMiy9tRec1Yg1kR6dx3a1/h1UaHMljQxUGnmfyD4Pm+e8mOm/XxV6feeWwWirqO1r9zaxCkHpKOVno17B6Z8bcrlqjxbAwWPCZ8tQNK5wX9cC0AlKkzvwO8j59RUnWAHNrJdR22m/kO1zAvIsUz1KpClg4feUnwBRkA0r8wqc9WP/A5My7qZZ9q6pwskd8X7kbCEw1QByjGSsi0PHR4sa8uZDb1KIZmrcNtNAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhnpUlU7a6ufk/zzMd7RKq9UhSRelzOOhGv/BqW19jU=;
 b=XYUXcdzjfoPj3zmsZT1GHplFdHi4fwO2iJ1nyv8BMza43GFSakkULSnUGqobmEtaRJQkDo0i6HaRGhNiwxFyUbWyNv2fHabhIMhidyo7cwnkP5dxsCaoZrv1SarUyf54hiTj0UjPlM7GkUTQ7e0QTNI6Japm4T3ynIqtaPLTyNk=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSAPR01MB7448.jpnprd01.prod.outlook.com (2603:1096:604:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 09:27:01 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 09:27:01 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier
	<maz@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add
 interrupt-parent
Thread-Topic: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add
 interrupt-parent
Thread-Index: AQHbCSetpd3ms9eA20edVCCQq/5T8LJci58AgAC3wUA=
Date: Wed, 18 Sep 2024 09:27:00 +0000
Message-ID:
 <TYCPR01MB12093A5339C944FAB7ED7D50AC2622@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>
 <20240917221430.GA4049704-robh@kernel.org>
In-Reply-To: <20240917221430.GA4049704-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSAPR01MB7448:EE_
x-ms-office365-filtering-correlation-id: b5e526ca-3606-4701-54e7-08dcd7c40ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ENSZp2jFJD9z5V6QwUSIBbn7CloZKHJD/1T2+thdmv3wUa10m2hU1NupEhL5?=
 =?us-ascii?Q?k3sciTxkTWg+npu7Hfb7ITXOQY6ziMMlY6hsds9I+AxiM6sIEI0zwUnD4lTJ?=
 =?us-ascii?Q?dFkDiEqZfOhdXZAsBEdMsb/Euy+OlH4Kqogav8XRQ6VKCczciq3TPLNqNf3M?=
 =?us-ascii?Q?vDqdy6ewdxlACpAAK1LkhRUwCs45wjUVlv0tFfLPOMZVkcCCwWHstqokSQQF?=
 =?us-ascii?Q?/+1q22k8s0pzrwaV9FwCGn7f8SGzN/KXk2D98/Gwjpp+AIFX7Iz4B4QPaHIq?=
 =?us-ascii?Q?doA6PF4iPm4SLlKN4g9UX5qpBurAcTe4yTV1kwLzQc8fO9q0aFXbZoVKJk6z?=
 =?us-ascii?Q?aclyUfX42tSGItveGAJC+ClqKUP0lYVOyz3N4MobGrWRPHEEduefrN0ogyEZ?=
 =?us-ascii?Q?APm/kDRc6vYv1EU1pJGa1RRWBiReQXj4eKG+2ZFIvRlCtOexymPx1AgYCRdV?=
 =?us-ascii?Q?Rtds+Mpn6ZfP+RVOoczsZoLhqJK5tnlhtokaq6pxlVKD7pKIZYmV/95PQlQt?=
 =?us-ascii?Q?+3RVbg/qTGlNQh/ktZ0Jw3Luv0deve9DdNHMNAaVN0lMUn5sjwmO43+lwpnn?=
 =?us-ascii?Q?IjK958b2kXGoB/wngx5Grb2PkCmMpqKzC0dG9dx+F0huCuii+R+xIn953n3t?=
 =?us-ascii?Q?LSVngwXTWTErHh4q2dnn3+NUwguWW5+f4RzRVY3jEh87GBdZO80uimCS9cmu?=
 =?us-ascii?Q?KC+LfRtKgXXXiy7xAdsToe57ow5L4w824wolHkuyHHUgrj2csDs7ORILr1hH?=
 =?us-ascii?Q?xAmgz6Yn5+iyMCNrssRT2YsjMTzKgOUetReY2zeVVTuZ5SocbcoMSG+QDErT?=
 =?us-ascii?Q?w88t8DhtilAcJ+tJNW/YLUBlh//2jRl3WJ6Eim9SqC0tl+QOvdL7Mk7C+Y+g?=
 =?us-ascii?Q?xAvztsukYn0GBAfUQ0NP3uiSfrHBMrQ65Nb5yIF6Yj2rdfxbdHfD300sf8V8?=
 =?us-ascii?Q?fmS939AWdXjiaXWr7N5ZRyGPUNuyvWtWN8Yu2HxcYNcpAuB4QxEXuQnPlIFR?=
 =?us-ascii?Q?lJGTdTycS/w/BGkVefiXso2CaM+8olg0XU3d+axFEwe/HI6FA+nfrpTNcz4L?=
 =?us-ascii?Q?ZkHhI+bqe+XS3KZF6ajelZ4HBQECPvpIzXgvYf1JIeMF9wJY8m/QjJl9nDqW?=
 =?us-ascii?Q?PIksJwwFQydCAZYGkvk1UGfdyhDxqadA35iIta+GSQMwvjKg5fWCXR4RI0Wd?=
 =?us-ascii?Q?niK8zexCdciLLcd5wAupIxzf2rUxZnApaBafOKk2Uvoci6nAsWZvgiVwYxJE?=
 =?us-ascii?Q?zxsciguMuGJcd8dQvH4BlAFbOOIB5JQHl0V0d41I6yMXnoaCpNH7/yV+0jQN?=
 =?us-ascii?Q?tcP19X0U+FJ7jgPLBKxpOHKZnxpofkTA61rNgeF5fa7kV7xsBAlrMv7HclPC?=
 =?us-ascii?Q?j4RKh57H9TuYtgiNOT6dxy0gRu1v0myPPAs1XGrMAFuVUxIKlQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VNZ2GyEZKxltQkAGWZHS0bSzMeLLEUEHBC522viMrxg2UkP/wyEnEK38TtNR?=
 =?us-ascii?Q?kBn5nhZ9C/DnOJuTsInsIoQ3Xk4Jdq0cZioxvis9Z5w8V9dIcYdjBYqF/jKC?=
 =?us-ascii?Q?McSijvGdtwV/WcfQkaapeiEycNGzjYxuzYyiyBx6XhD+ve41ZeJJ3dqFPM5O?=
 =?us-ascii?Q?KXuRETXfG1h0tpBTu9IfUxBptZBgwDvpO1aUjYtZiyO7GvSZLcjkMy3KRxOf?=
 =?us-ascii?Q?xTaA9q/9CBy6/A1Jj6I2DxD75QCq+6divh4wr/RO3xyJP0WoY17ZkWIjpuNH?=
 =?us-ascii?Q?tlqLlMhIL2+Tye2JPg5V+n4SLHZrivkBUl/K+IX2e5Gavr7qWlId/AaOgymO?=
 =?us-ascii?Q?9TnKWQAjWZ5a1je3JvAcDh5Cc6ZFY62mVJNvxE8eEUW9Ecco7Diyk62olQ3T?=
 =?us-ascii?Q?QET3sqwl1SZ/X8OUBm0lf319C44zp1uYTNX52jScHOGCA5oYPBvsShEVvMTM?=
 =?us-ascii?Q?1p5NZO0DhV71IGtMfZIInuqoqLd7lptP9btObsJJe1rjuA+LolAIj/mihvdq?=
 =?us-ascii?Q?6WccTjssygiN3xxFJ36Sh6Ol5d6istjV1kMyW6vicwbTPSIbMF/7AaFK+VHk?=
 =?us-ascii?Q?4wkLj6kkafkjxlI+X2y9IUEeuKpF0v2cHNT3prrC3+cMEmJpJ7lc6LKBHx0F?=
 =?us-ascii?Q?QnRtpEbeG0AwfYt24dDBfzfmSz1U3KOYuN2zyvIDjkvfagbb4BwBS3mGzwW5?=
 =?us-ascii?Q?B50mN1RrRhCBbX5QFUi9z8DQELGk/8L9T6EhZw+xmFVz2Hkap8sOcC35XBLu?=
 =?us-ascii?Q?+vyh92ERAoXpGgN3IvYSRMVcR85ILCipXSIlbFxlKgJMpKAxzzQLRk3IPrtL?=
 =?us-ascii?Q?jN3mZ1FW7AHVFfw1I+UUVStoxZTcAwT4NPMIrNg2BE2OA/YzZ7RAljVE8pw0?=
 =?us-ascii?Q?qRKIdqzxTTMYwEbTRLaS/phFGYgvK0nudK6LOfKJdsuLLbIWJEgq9TNaMOCb?=
 =?us-ascii?Q?mDCKCgVSqnG26/eHHpsBRE8DlLf3MOEHHhOiN2D9StU+C6yrlt92K8IMw6Zc?=
 =?us-ascii?Q?s71C3di5DFWN9XdFOBEOwiT+Qok33IKDRqkGj0nS8t7nRRC637FTCDg6O3QS?=
 =?us-ascii?Q?2Oi8qMqAmnyMn9uDQPwzneaay5JnWqW07XkusVSL3A/ZlIj3lLcsXzEjD6Xp?=
 =?us-ascii?Q?pLsgndtsanio1fVKjtbxxTL126kKoLyWezPzH19hvQN5o945m8qhL3MghKd+?=
 =?us-ascii?Q?WhtCQU0M6ltwQufZAVjRp7po6T5taC8nDU64TLPzIJ8ekUreXNZzNQ4yyLXL?=
 =?us-ascii?Q?ykl45y16hA9r7vzbJlC3FOBeWGP5drbKoji+gAcvUWock5eML9eR86OlSPEW?=
 =?us-ascii?Q?kDnqozr50MBthz8KUfA30TdfIdYXLcGDtlQu/1x0UBDgIQ4a9Xm2oVAR0PuT?=
 =?us-ascii?Q?hetOTkX724aVsfeXOFRTGwbiYnvIXMV6XB/smXGUWekiqcv3H7hFnqpFd8By?=
 =?us-ascii?Q?N23ZFbjNnW0apEVMbX06kXxOy8vqjPhurnZeumx3VqdUwBHocwbxogMizdxf?=
 =?us-ascii?Q?3sgaIQNk7lRvCqWN4t4xp6BAv/Sqa3uApU+YnhPZ1R63teZOGy0ANcLoNCvs?=
 =?us-ascii?Q?BmNmGyUNaewo0K4UzA0HIomjKddI/xe2ZrHgxMOIgITTUY+P78vUowz5/foH?=
 =?us-ascii?Q?/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e526ca-3606-4701-54e7-08dcd7c40ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 09:27:00.9525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUy8dX3Ni5GSFc0aXmH02HJVHBn+AATeyqhBmBU3e0/LebeYc7sn0Y73c991oJhBuJUP7+pnYWSTkTZSxweWoK9t48hvqDjRNWJWNxKzFrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7448

Hi Rob,

Thank you for your reply.

> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 17, 2024 11:15 PM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Ad=
d interrupt-parent
>=20
> On Tue, Sep 17, 2024 at 06:32:44PM +0100, Fabrizio Castro wrote:
> > All the platforms from the renesas,rzg2l-pinctrl.yaml binding actually
> > require the interrupt-parent property. Add it.
>=20
> But they don't require it. It *never* is required. If interrupt-parent is=
 not found in a node, the
> parent will be checked.

Indeed.

I am dropping this patch.

>=20
> The check failure is because the example extraction has to play with inte=
rrupt-parent to make interrupt
> parsing work.

Gotcha.

Thank you for the explanation.

Cheers,
Fab

>=20
> >
> > Fixes: 35c37efd1273 ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
> > Document the properties to handle GPIO IRQ")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > ---
> >  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
> >  1 file changed, 4 insertions(+)
> >

