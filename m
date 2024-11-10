Return-Path: <linux-gpio+bounces-12776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED839C3150
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2746281C69
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12E91509BF;
	Sun, 10 Nov 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S9+SJeI9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5D14D70E;
	Sun, 10 Nov 2024 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227605; cv=fail; b=KV/5WjtNFiIL6z5Wuzg9a4QQUnt2oO3DjD06moMZe7WXKkFMWwRwsiSCX6IJXsufAIyrOucWzpVBZEfSsrc7BCi4FddD/hDxKNFLUBWPf7RUT4/WC3L7VkiBk2XIqi2JBrZr+rptyeVSEgFXizUEs52AFGDaxsly/4Kiud0TjcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227605; c=relaxed/simple;
	bh=idc4iXegAxw4Euk2HQMA9GjYXgvne/XQJJEqT3eF7ps=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aL8i5EUU8ZQq95bmUuzWd1KBk9vI9Z1uI2ykbi6a7QzaplslAbVQIFRjAhBS3JNistdHTunDIWD9YbOyud+9/guXvXMQWsXrnGZyL+Xvw1qncRYBOBrOjV0R4mh6mMLNXVTTyTgkIiGhUac6TRBfu7PQfdDHHv/k35doiE6Z8UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S9+SJeI9; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soojZ7DoBOoKLk06i9QrHEybTtqlm0HYfSfpZKgWkTRICvYwLMOXX85Jw+kS91Qw9LK62Oj8HXuTnjdnnNJgK3RJHYO/XpmU7sfghpz6qM2LGkKG3LQvcqkJKKxGh/N2biaJae3dhA86OMUqkb7JTRi3m/W5Rgyrva5uAjhVplmEsaSYqA2NJQk3JwI8QKxzku6Z0PlygZc9BZdvTlTd0iTdRBFjteXduZ/AfwIuw0/u9leoUZWAq6HEYipJeRAMaVjKY+Cptr+ZO67cW4Gm1foycVZ8fTTrm/uf5LMW8OXyWJQQh32NbHgsi4rvU1bacAtb9nS97zfChlduG9OPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x+1bXJklYzTU0oorAf8W76iqgbHTp32GRlQBidRDt8=;
 b=IeqvfgmZDTipKEPpD5ZaZ/El3gBYO1/Hu6qWFlaNiLO9HxIzvTfelHAxhRDapt9/OOQCe3Z4RKNRSWyhiwhz0U9JY11LxyQfch3f8p7LeFgGoAOIX3dlV1WZSDScA26jjpGdHKO/XBGhJHhlGaP4VHVygr3QoIrYABjl7wb1cy/SOm87FjIyYWMmnVDvAOpVxsD6Lbd8NEp6kcEzQvPm68tSVyjDzwoBYi+C9/bkC79xHvkrGV5iMMFGaaRVp1NxQCPFo+f7r3HlUVoprBti3B4fy/9mxOsS59FPnobO+lLuX8HutVeWXNRx31kkGphxOkudS7W6nfcB8zTkT17m8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x+1bXJklYzTU0oorAf8W76iqgbHTp32GRlQBidRDt8=;
 b=S9+SJeI9LLYozjtvRWdGOnDj/nTXNcdU+S5Sd09xcV+o4Al0vE1nXaBJEtr9nag0zxoAdjTIYiD8KrzNU6Nc6VBpItisc0c+FJwvOw4lUTMc3sE5dP123ogqGIq4ZXeLu0pTbIgj4nI3AmBdcy64LtWuRqigqit/TzeRIT5DldM=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8807.jpnprd01.prod.outlook.com (2603:1096:400:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:33:21 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:33:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 04/25] clk: versaclock3: Add support for the 5L35023
 variant
Thread-Topic: [PATCH v2 04/25] clk: versaclock3: Add support for the 5L35023
 variant
Thread-Index: AQHbMcwEr0nk5x6+TkezKholoG36vrKwMqQQ
Date: Sun, 10 Nov 2024 08:33:20 +0000
Message-ID:
 <TYCPR01MB1133207D64F46F227BB792398865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8807:EE_
x-ms-office365-filtering-correlation-id: 7e315268-bf27-4ab6-9427-08dd0162557c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BFfj2mum0Np11xSY6sQCS+1cp5JfF17S8622qkWsyI3yTjCtqwTmb4z7IiMI?=
 =?us-ascii?Q?lFZEjU2Piq9HgwD4p9/MFMozbh/JjPynlg3UK2CLb/GhorBAyTZjt3x6Sl9R?=
 =?us-ascii?Q?3l8vYEOllGChDUiUCxAvqls+ogJW29yxabR+J/Da4+cNWqLr+PsT8VWWtd5C?=
 =?us-ascii?Q?h6Om/rBfRwWVhjYrAKnalGBFHViQJOpv0TebHI1rY/lJrcx8RVQMUQRQAcCf?=
 =?us-ascii?Q?KP3gJV3/0UBXny5dGL/9BQJY8YAAsfksnSIPe+VOYByyE4lcYgVZt+BsGYDL?=
 =?us-ascii?Q?n4i0xSDKQ3+NpviF1KYyvn2P8lEYnRuT005XQ9fEsdhYyayKcg1W96s3Vt1W?=
 =?us-ascii?Q?xZFjAV+oTPJxz0V7t7Rzd3LLUS21eNlPFZeLJ9Kvk91dX3ck/nY6uP+e8crE?=
 =?us-ascii?Q?jwv7/Wccb2RzpvKcRQcwjqc+4xYTE/PqmJZDXLSm3MHQFsyByGpOR2+0XfN/?=
 =?us-ascii?Q?UvwXmy5AMv4VBWdPekrI25JmZS6EgYntBbTQ8fMIjgwLDmocIsApk2b7H2Y3?=
 =?us-ascii?Q?NTRLGT/Udb1SYw5iaCpulyXNKT6QJLrAaXB2Cw6+VyMaKMfqzfv96UaErZZI?=
 =?us-ascii?Q?2LZJ8XpFzCsXWMLrBaGwX+9UTsf/Zbde1ppg42MYSDMFMd1zASMVgcCMtZJV?=
 =?us-ascii?Q?c71bo12IsJqB7yc30Sm7kShv+En7MmZXFvZpxhEPJ3U++SSKp7rhz1hr617E?=
 =?us-ascii?Q?x9QjHd49PIwKWhY0tPZomSMpPQ5L6Sp6mqVX8oaGlmdsynVsfNOPZa36ksvC?=
 =?us-ascii?Q?X5Si45W/rvoMhIq0FvMbv4cVaF8YolWLZ/j3KXzxRJWlyGe8pQChG4opWb9H?=
 =?us-ascii?Q?lH0QFI8/baNYDvAgdiiX7aWDPQXOxhDrFHHIIm+CjkeVguP5rBHOxaHmsz6q?=
 =?us-ascii?Q?KBAlicyCDKB6s2W39aR6i9LD760VipqA4EkN5doB924U8jLQrrCmoGLewdzG?=
 =?us-ascii?Q?lCSU3zJMQbczOo0x9Oz0nT4VKB1oBIDa4GFjzgZeV2kYu0eedeN2+Tvq2+0L?=
 =?us-ascii?Q?ox61UnwOwmVCELGxzbzeJVsnMAk4FtHTw6jlD8mVFke0jVbL4Kgr/iVvwiUF?=
 =?us-ascii?Q?lvQdtmNjwI2EaTmJ24l300D0dE4Qq3iHXihn0wD/kQW31WXGMW0mHnXCCWKv?=
 =?us-ascii?Q?dDwCihYHbNermXKNITZWT8gexwMYpn5rEVsFUhbYbThR659fCPnl2G56o5bz?=
 =?us-ascii?Q?DiEvxnyBu03YLrZhvRMcCnuGWn8A29IazUuCDxsjNj9irPc7dyLz4ZBCRQdj?=
 =?us-ascii?Q?1C4stdg/GhNQNbnOmyqAasEdVidBSl4HhRj6oA89mYnwP7ucsF0i0AMbv1KN?=
 =?us-ascii?Q?nDwBqaS98kiPn2dw3h87cBf2veWbaO6vLyCFiauDGjmtom2RDiL1v4XesUtm?=
 =?us-ascii?Q?AKoB9Z1oQbraBV0xycviq2gdo0qR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MZmg97B4c2c6ipclw8jbkrZ7YDuRlXGwL/yenLnoLlQ8W1h5dWpNg0/TZrta?=
 =?us-ascii?Q?dkNrcrMqPUthx6/sO72oXKl7E5VBRpvgVZOQ4l16/Mx3K2MJC+5eELW9L696?=
 =?us-ascii?Q?cllnOb3S5imxJLZ5FtzUeGyMDNLaW8iSNtXAowKxYbCaPFrGSh5y1PXEJhFj?=
 =?us-ascii?Q?rTy8RSe2VG37Slz7WX5rj1zKRmW/AYcP5gKAOaQrIhZ+EhKEHPhxOzQB5qe8?=
 =?us-ascii?Q?8vkfbkqJdmR5Brwo2nfKjd+vGlonF3htqpVi8n68tF1URzZkbA9GR2MyL29n?=
 =?us-ascii?Q?p4Dkx09cyXoXpW8F2myEuuNhOjC4IkPUHSd/RmJjSbgVKMkK3JqU7FkcC+BC?=
 =?us-ascii?Q?PcwWLNCoyvkz8Q2smI5LEtf/lPMb+9JKED7kK9PstoSmrSld/kE4gkcKhE8r?=
 =?us-ascii?Q?6dXIPX0ExCIfnLpak6NPEeDrqGPFqt/Lk5QuHVLVmFM54w1lI3AGJMTkKE/z?=
 =?us-ascii?Q?zUZ9oTPAJT1kI3pTgHsszfgXRvh9kBblPVZhsLr2zAm4/6+TQheAd41qBIlC?=
 =?us-ascii?Q?oiWzCTUdWH5OnQlLOQP4YRpy11Ntt+93D83USatTbZ+8shFGqGW5SKOdBr+t?=
 =?us-ascii?Q?MhyR4h074poiSuWYXjmsJFTDN+ARKlSHekWkNWELIR1z7PmWSGJ4NWowNmdA?=
 =?us-ascii?Q?1XUNeixRxZcq4WDcDdDxonctTYtJ2o89tvMJ1C9LsZvtdMJXb7U8dkqJ1p1J?=
 =?us-ascii?Q?wP2fyhm5JaSyHfyloNev5FAMv+L4nkiP8CL5JVZSPIr2wkGXAOVCrmokML7X?=
 =?us-ascii?Q?MxHLDpSzPkNEUuP0vEgdFLUIbHAoD95xroHGRgjMrUSNC5W8O2iywmEwxdTM?=
 =?us-ascii?Q?bken/rZCWXBZQ6VsAwIwDktZtpbUK1Dtu1MRX3XEzU3JxRZcbV9s0WVJpI3F?=
 =?us-ascii?Q?cswu6jpZYs/WXCI2TTwO5a9/4j/ep9s4xMVQyH8RzBSSpppplzGmcPbGQDpz?=
 =?us-ascii?Q?qde4Aba70etxL99gUAL3s8z8otVZU8Ka7PrL6Zr3bGK09EB+QiQSuvxTO5tF?=
 =?us-ascii?Q?N1SrQDF7xT2Zm+9OVqVAKgJSoE6bueChiCvisgXuQ4DVX5mp8w+nT7DUY0tM?=
 =?us-ascii?Q?DsRyx9W3howUpyhJGFkVfjyKffhSPvcVmgabfwFqzvmao3/FTSo1Pmas2+l9?=
 =?us-ascii?Q?06VcF80OaMy2n8uomTy771Ef6g1+ld0QoiXsVYO/xUQQ7Z8OGxHZK5zuUkO3?=
 =?us-ascii?Q?KDS0oNMZqEYsVCyNSwv43Y1k6zLa99vdvVspNtT0Y2ZJHLorBVr5BT8kiMDr?=
 =?us-ascii?Q?yhJf+Yhz1EyFN/J5zouv7GJpG5050pe4fGuDHfz5uJcTeq6CEEPwa23m7xNZ?=
 =?us-ascii?Q?Wylq82JbVBStfsgMxgmE4U7y2aN+frSEwl7FwFKFmX7DjE4Lh6RD2CobreX7?=
 =?us-ascii?Q?zXmVSThE2hb3niDNFrnGrclyYvRnmzaTDQRc0AtbBCaePZ/9hPss3NCERyxN?=
 =?us-ascii?Q?rfSxIvO89v5Q9A1pCb44BcaeqEkVXJ35vgP3ngrkINfZx9xZ85WD8arfvV8m?=
 =?us-ascii?Q?aeo/KU7PHXHA0hyIWW6luD1TbxSyTp7jeb/G18JILGkxFoj80G/tCu3tG8E/?=
 =?us-ascii?Q?06XmtrGUgh+oABLn93Z0EBUfEYfoCBco2BM/E4pC?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e315268-bf27-4ab6-9427-08dd0162557c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:33:20.8959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rzgjet70XQNMNt4USKskY9n9N2JABThW32wMu9xl7YcObiKqdbpQjUkRTz4gjeDFFNa6QAVXmTE2k84FCIQ1kem9yk4kUcWyLTsQGePbx+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8807

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 04/25] clk: versaclock3: Add support for the 5L35023 v=
ariant
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add support for the 5L35023 variant of the Versa 3 clock generator.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>=20
> Changes in v2:
> - none
>=20
>  drivers/clk/clk-versaclock3.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c index
> 1398d16df5d0..9fe27dace111 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p =3D {
>  	.se2_clk_sel_msk =3D BIT(6),
>  };
>=20
> +static const struct vc3_hw_cfg vc3_5l =3D {
> +	.pll2_vco =3D { .min =3D 30000000UL, .max =3D 130000000UL },
> +	.se2_clk_sel_msk =3D BIT(0),
> +};
> +
>  static const struct of_device_id dev_ids[] =3D {
>  	{ .compatible =3D "renesas,5p35023", .data =3D &vc3_5p },
> +	{ .compatible =3D "renesas,5l35023", .data =3D &vc3_5l },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dev_ids);
> --
> 2.39.2


