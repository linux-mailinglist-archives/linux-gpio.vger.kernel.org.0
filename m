Return-Path: <linux-gpio+bounces-37623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AkoHH/7F2oTYQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:23:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFE5EE7DF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34A1530072B1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC363750B6;
	Thu, 28 May 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AHbupVNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7738372691;
	Thu, 28 May 2026 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956203; cv=fail; b=lay96IOOntUROpRvKwCF0ZTjIuhnV1g2l7Gp7yxATpGNq8k/WVLYxRCY4pPsn6d80/wERBAQmAaPaKpaiaJbZhbvB3/GAslCNndj2oL92CVdXE8wzWVQ8SEVRfJF1WievdJeZ9U9eJitJPA+Wx/3ZftsyNFDTf0GWlnVM6y9Wl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956203; c=relaxed/simple;
	bh=EC0KHzGMRk5NcmFTLxN3m9nwcm9tM0CTJ9u8Y3mUgmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RY3tbVZYnhVajkJHtLEE5Y+++9XWGD6xEQSH9zOJe1CSY4qcQpD9b+/JPU7bqeKtb5DEgl4/8xnDroisvtswy87JjFrTVgTiqC1gYM6lqoCaiN1a64mM6LmBQQWURFOu8WUsr5LOpGR2ZRGS5M4bh+YUZiFf+wbxHUQtu6BHTKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AHbupVNC; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNtzFJjmb1GNqVKJcnLmd1r6Ayvw/HWp8c0WzPB/gU+FocoxSQF7c6yn1MTyyjd0wzaU9erj9mYXN4ikMJi0jQmo2zNpq6j7lntoxMdiJrU1SWoLRaxP5DLdn0HCsXJGgnjVcgiz4yMzNxQme33BQVSdU+zcVJ44DFMUTFY+/7sdvR07ryBiNo0jTSMTNz269GIa6+0Ex+1gZFFQ8dlhO5uR4QVLVxGMyIT4cMirx9QTtzo3lqiKVUOrocXbrX96alCMwm+cKuV0KVxBzpGmXPsHjhUHWx3m7TQXR1+FemFNCHd+XVy6LfPQrVCwfJ/f2g1OSnj6y69DqBLAUvKbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amF1V68n/KIndDxDZaEz0kIWHe+qcGCfAydIH+8bfi0=;
 b=TqmmSThvnh06JQsMT5NxhJ2ixC2D1dcY6l98AHk34DGPqAydn5noDjc9gHQ6s+CXa/MMC0nY0p0BktdIjbE/cJa+pe4tpLi6y16WeLjrg5D8NEViB8AF19rDnFPMIwVvpv1BsMT2esuW8TnXwzuxfjUyWKdqMP8TWU0c4bZLv7Ttgpr+4A1AFzz9JeLI36Y0JEqp2nPJGAfMKQMYw6dchib0uy0+x21RSKpBECxaGu6Ncbw9FF/GZp/hZC3GlgeIVcpX82lr6Okav+vN8bhKYEj9nglwY9TxNU3Ze1qJmi9+AuQvcjcVETqavhGYmlruXOCg0iBNDxyPDuBh2h9tsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amF1V68n/KIndDxDZaEz0kIWHe+qcGCfAydIH+8bfi0=;
 b=AHbupVNCdawgZcJBgAMvciwmteHIQX3bTS1C9n2xnc/AcKi8PLOPOIcDJ+YDI/GLbfNfQ5U5gQtNyQAS4Jk6vjrRC6EPY38F6OzRaPZukxBJQCUEt7zr3YRiZ/IpgAPZJYSNj3E0DPWd8rFjlFYvUpkMfCvcLdWMIH5tqfrQE2M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13497.jpnprd01.prod.outlook.com (2603:1096:405:1c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 08:16:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 08:16:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Thread-Topic: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Thread-Index: AQHc7njDSOFJlV923USesFQzr0mwDbYjFqgw
Date: Thu, 28 May 2026 08:16:36 +0000
Message-ID:
 <TY3PR01MB113461A5FC6EEB722B947671586092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-3-claudiu.beznea@kernel.org>
In-Reply-To: <20260528080439.615958-3-claudiu.beznea@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13497:EE_
x-ms-office365-filtering-correlation-id: f25ef6c3-f422-4177-e001-08debc916fcf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 IhYwfjAbfIfFlC5xFJdf5uRXNSIFbpyRDosxh9XXBskCn7/+ZBjLkbwS+jtB6VInVFJVSGrrlMzADeVGCTV96nD4MvJG7TIMoiNLIaSsxQZeKpa0mMyqBlM2QbN6V2UkEa4eKUEpnYxMrBi1YGuO60dQZ+xPNfP1edEDpKXa3WLL6NfW0bz63mo3nVTLTCPGIOqCYJ0LKZR0BHDtPaUvjx8sH6Dx8ggLbK44azrYfC5EnNl5rUQBWkZ1q/nGUuK9CeVir4PxJ2bny4PG4qAYD8+4qkpqs5ng/uGGVks1fpn9hDilfz9mbRTxHP6xFh9bOrqIl49W5FgQfdIqxb3gvL6czamIpGx/q1M1k4fPEoErsNgX5/y4P2HfPZm/qoqGR2kk+1nvjH2nXjzOuoqG4atbLgYXdT+NNtRdu6ZEkJAw5NAAkBTVLZAlEd9b9xY4Pu6xFsdpynqsl84zyZUfgLXjGkGgR98xlSTTvhM7A1PA50wP3WVDo9q+EUi70BDEdFoh8AZL3a+gz48ezHd8jNkW9Ra8v8X6a08zYtNWHLK/ZNiC8f5pEXv4+kugln9Ofp2XU/O2g7z3GYpMuy1hos56yau2YRr+nOlHdHwIIS6NpyE6/3IN5vm42kT9+VzP/cJzq8a0rhpoYw9lfxXzZ6lHdv++4kLiu8fwch6RF/jW55EdQE+uIJ/xa70HfZxMWg10v7YCfizW1V1h9v6PnP0j0WMYoVBaWWRMPjFAdSgoiR7O02RhlUG8zS/qSdfC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AHoEQ7YOpz3hANyz/6P+0a0ulTNAk9nB8X3dUhN3psbPtfCuQTMtMfcvWSJ/?=
 =?us-ascii?Q?tSTHpUZo1BOkG6UfiozVxo6Uk6D0qyfgKqUK2iVojZ1RJKkZuqzcOxo+3Ser?=
 =?us-ascii?Q?iXV2WhW3k0aYBZ5qXXv150u96uJX+6FX5YgYrDC0aQVXG5sajUBbs11Pe1He?=
 =?us-ascii?Q?DU+8/h5ZwoGsogbvKW8weFP8wgoFeR+f/RZEUToEbyQucj3shwCqaMi8iwUH?=
 =?us-ascii?Q?pFYkhOh5/XbvBRIiJgBeN8GXevwZeJEqlslqo6PXUgBWlgPGOpUwMg8dBai+?=
 =?us-ascii?Q?aYYGJ6dHOvysPEQ2BEL2836YJSpaPyeOB+EoAt3T5Ccaxma0fGvk4xJcMFFp?=
 =?us-ascii?Q?CRG1GmUg7mQfGbY6SMimrPgOKeC+qtkc+GQ1wP43WMyXQN4CgCI4xTrlLv2l?=
 =?us-ascii?Q?2YGDaQWC+wpWKPNdxaumRWTG42pLixpkfFj+AC2dixcmv+3B4+3jC1kE3AsB?=
 =?us-ascii?Q?2dYFZSFi0yeGEIib39HOv0U9LFM63e2NHB8e1/Rcsfc+RLEx2i58nthvg4v3?=
 =?us-ascii?Q?MBCtUJ2O4YUdy9DHGsGSFbvF612/TBuE+zCA2p1GgR2gqI4nlI3nEUDAn6dX?=
 =?us-ascii?Q?whNAy8qtPrp69sX1Q/jbo2Hxr8zWDFtPvXSHOpCTMCKO4uBODnbAZlzuiHgg?=
 =?us-ascii?Q?oPkBzz2oVHkL7Kd4LlW2X/2Bs/Vdg9zVqHof3qUY4NgGR17dpq/XF/Pd4tPE?=
 =?us-ascii?Q?v7GPHGo8AGqMW5y53qgyfh3pXrJ227L2SdCOQYsTwsQuXL8uYT+ZZJtSaxmQ?=
 =?us-ascii?Q?vBEMoDO79x2snfwwMQMh9/GEU2F0UokWweWvhVgdeRGfnaSoXhlyBjnamhFu?=
 =?us-ascii?Q?/99HXQeb/YvwTbC8k33QdPlMdPdc+/cSNgYWGBuVqbXZxTiAr87bCmyicFmK?=
 =?us-ascii?Q?pETCOHlKIMkuByZ1WVSpVQZPXiP+u83iohCnsdHMdhezV0NyeSzeQi/F5Dqq?=
 =?us-ascii?Q?DSCCyY8UXFc2O22Ob2x7FIATAkARHjODpq1CQ47XvwxnDkjSFdspd+G307tb?=
 =?us-ascii?Q?5eQsq09Bu4pw2jg/wHR30XzFKuFDiSb/TenfFLEHrWvE1VQctoYUqdDBINJ3?=
 =?us-ascii?Q?t6vU+9pqHFCbhxdrpbTE6dVGiEkf0ERVU/tIJF8YUR/ouX+6w8dhSp5qiBCq?=
 =?us-ascii?Q?upCtfElef3NnWIzLNUBsJ+moXup0y8jJyC3N3kzML3aA2/w5fMCjoQut/m9E?=
 =?us-ascii?Q?0En3pJdBv2hJMYlzBiKXYIyoG4z6e1TOz39igM4WlVN8K/Y//Xcb70gWBRVM?=
 =?us-ascii?Q?WtKsa+IoKitB3PECnGiApcrASJZzSr0Lq3WQCLNryWLF+GXlwhyOkr+pDwbx?=
 =?us-ascii?Q?sLFeL6aPBbHFGFJR8J3g1LjMOvqu8IMa/5N9jwngaL1+QN3Diaz80kyI+cLe?=
 =?us-ascii?Q?6C0MBiI3E6yoiJWsfY/3G6IJflbsM4BLVQhLYy/NywQiTWR9xljp2Tl/Lma1?=
 =?us-ascii?Q?lvdPXYu9vbKDSelAhaPOBcRYu77Br9ebaL7Y0LMiigGS2RF1MImALwhGtIs1?=
 =?us-ascii?Q?J4P3BnXNIrBNQP5zPtWGZhnJ1JTCTQYiIYSZUwLo4y/I3q9GQhHMpfH9TR68?=
 =?us-ascii?Q?OBrKpWhI+NI8xzuDdOi8ARPBd2KEXpeH1ddwaP4G3uRD3t7+a8AqYbnY8kfO?=
 =?us-ascii?Q?+iArqtutJVbsvN0M/GZxWc/SHXKs20Ec2bdzrSjs5yZ+plf9VnMutEuHVOSu?=
 =?us-ascii?Q?+w4LTv1IbEmMhNmmjsj7fKWAdk8XTZF6mFG7iq4QCJgPPJXx0eAKj4G+3v6z?=
 =?us-ascii?Q?/tuhFTNbyw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25ef6c3-f422-4177-e001-08debc916fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 08:16:36.5173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8Btx9whkmSDqiTlCL3K7PzgiRQK9v1ROI7esMGMxpJhfVapubJOdfBLv8uX+a9OiSCD6feoCVlW8q+aOLyCNRYQhTX8FY4gXC9VSN9JXw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13497
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37623-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 58DFE5EE7DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu Beznea,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu Beznea <claudiu.beznea@kernel.org>
> Sent: 28 May 2026 09:05
> Subject: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in =
struct rzg2l_hwcfg
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and =
accessible through struct
> rzg2l_hwcfg::{qspi, other_poc}.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - none
>=20
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index a648d75a2bd2..77443cf1f431 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -180,8 +180,6 @@
>  #define SMT(off)		(0x3400 + (off) * 8)
>  #define SD_CH(off, ch)		((off) + (ch) * 4)
>  #define ETH_POC(off, ch)	((off) + (ch) * 4)
> -#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
> -#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
>=20
>  #define PVDD_2500		2	/* I/O domain voltage 2.5V */
>  #define PVDD_1800		1	/* I/O domain voltage <=3D 1.8V */
> @@ -3816,9 +3814,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg =3D {
>  	.regs =3D {
>  		.pwpr =3D 0x3014,
>  		.sd_ch =3D 0x3000,
> +		.qspi =3D 0x3008,
>  		.eth_poc =3D 0x300c,
>  		.oen =3D 0x3018,
> -		.qspi =3D QSPI,

Any reason for moving the assignment?

struct rzg2l_register_offsets {
	u16 pwpr;
	u16 sd_ch;
	u16 eth_poc;
	u16 oen;
	u16 qspi;
	u16 other_poc;
};

Cheers,
Biju

>  	},
>  	.iolh_groupa_ua =3D {
>  		/* 3v3 power source */
> @@ -3835,7 +3833,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg =3D {
>  		.sd_ch =3D 0x3004,
>  		.eth_poc =3D 0x3010,
>  		.oen =3D 0x3018,
> -		.other_poc =3D OTHER_POC,
> +		.other_poc =3D 0x3028,
>  	},
>  	.masks =3D {
>  		.other_poc_pvdd1833_oth_awo_poc =3D BIT(0),
> --
> 2.43.0
>=20


