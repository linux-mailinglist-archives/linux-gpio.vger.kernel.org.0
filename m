Return-Path: <linux-gpio+bounces-31708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tSKbGHnzkmnZ0QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:37:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3914266F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27DEF3006125
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0942B3002A0;
	Mon, 16 Feb 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OIFVwI/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332126E165;
	Mon, 16 Feb 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238261; cv=fail; b=bKEpb+iHa7ydHTw+u8GlMSIaLSsf9lEeGWh+yKbw5iADiw7TyZOdRfP79TMLpdV14F8yuJKz+L+J83RPtkHL5hKmAKkBS3AVhN9ZQit71jlRB+PzPEx8scPz5KUQvSTAJlMb52u7xDlDWn8LfXKGoA87unHVsWwN06KtGv7TkSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238261; c=relaxed/simple;
	bh=W+XCK1afP9bbUvp/uDjljjBD+qNWAp/2MJY8kXvtll8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CnFGaEp1dKhSxJX2aLK+MBNdxPVEFxIGDdv0wCUf4Kh9w3I0a//Ln2sfW2eEXAwbyePjAb5RJP3HLRutuduGuKndZDRZMM71zX3eaPyQl/164Bsgu9WFbX/8CJEDkjN4BUughEMXiDjfNObUceGf3Mej2P2GWDCaKRGkTn+xicA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OIFVwI/d; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOEexw0D1GoJyjJBY+2YAKHXOmiyB3XojgwPu3AMDWLgMGkhdTRKBDMwb45UIT415K9Ia3h5hH3tCoOzKQc6rl3tmqXLqwVb9UGDo6+l0k37vjvcVY0R4POpCvv9lLwg9DOUusC8vK1tvPv2DQGG3SrojlaWRHe4ptgmAh9dC8RIdPF7B6tzPY+UZJs1SkkDh/Ol6VTlQ4FCRL3n8N3fd8lWQIRhyAgIY3Dl/gJvoRJZAh3NIi9noVZnCYEtU3LYzcl+C35BHj9AAf9biUPgZBbQqHClYVksciT3lGCj7B+6daZnnWKdlT41xjAyxMSjVN7jP+iFz8HjhOxKJif0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIV6kBWpl/EzRPAGJuDiiPPEtpEkUHhCP2cn8oKC/MY=;
 b=o7U6qDljHalJxGN1hB2vqTVcbEzhMn0ZfqNCOBG7s6kUzmVvj4F+wRJHHhiGMO910gOKm8u9cxoi9axyjlAO1R+iNz+UBGEGc91VeDJNIR+z+PDJ1vYeiCsmq3JhQvJytv6/rGU3mVoFy8tSGPzuMg2tVF6ymPtQcUWjQCvSxk17WuZP8M++vtYFVVdI/h5lCcRXGmIiOyFwA2j7X55cqBi/fkgvyRv2mrZo0Z5x55eKn8qN1RtV9yPR4gqxMXLpM4rjM0F9vLvh7YkfxFcvJA/Ec1NaUJ5vcnjd4Kdg0Afeb1A08nyjBa/+Xv/dD/cQV49CpiwClR7Uyk5pB99X4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIV6kBWpl/EzRPAGJuDiiPPEtpEkUHhCP2cn8oKC/MY=;
 b=OIFVwI/dez2dvzNY1Ao+PoQJCG7S1lDU5Zjq2Jkire7irhNLuy1Yolksk7fEhxtc2D47AS4DoFQ97VzzCNWPfphbaKgFUJDocVFKcxRMX7BpzIGnN5mf8WKd3aX9UzpBZoGnoaQkx7g3d9GjFLuXPGOzZf4TqJth4eD7yrl/AjQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17173.jpnprd01.prod.outlook.com (2603:1096:405:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:37:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 10:37:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 06/10] pinctrl: renesas: rzg2l: Add support for RZ/G3L
 SoC
Thread-Topic: [PATCH v2 06/10] pinctrl: renesas: rzg2l: Add support for RZ/G3L
 SoC
Thread-Index: AQHclQ6M1o9Jy/EnF0ioYd8GOqnn5bWFM4fw
Date: Mon, 16 Feb 2026 10:37:34 +0000
Message-ID:
 <TY3PR01MB11346CA9DB9C9ECD9A250E1FA866CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
 <20260203131048.421708-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203131048.421708-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17173:EE_
x-ms-office365-filtering-correlation-id: 6cc85c7e-671c-430c-3526-08de6d476534
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ziDd2Ic/UZBafje9IKWIft7jIFOzmZRDrUPaf0AgWNqUMKgFNaSpzSXffzVh?=
 =?us-ascii?Q?BpWU9isBCc4dRqHhG468No+0irGHdG8RRxqLQH4UFhdqpywBkLc2i8npIMil?=
 =?us-ascii?Q?MAo2ufkFlmLZFTruFtK9zYpD7vPv/pMgcFeGdXkFcYoQXT6sNm7t4eIgnvs5?=
 =?us-ascii?Q?YIlU8ZUEUSNrMEOUfTdhVyVWgLwSkm7b6CWL5ekJH/15nSi8V4/dGnB7uqR7?=
 =?us-ascii?Q?l+PfkWx9GVrLPsI6lHf30TEWB+rcKZ7Eg+IdjUusclUwyvNZeud9mwFT03VG?=
 =?us-ascii?Q?rJK1FQNUU1yMqB+Rx902/B34oXVHXT7QwS5V6DHE5fepi8xD4iBcEQ9ltUyh?=
 =?us-ascii?Q?6+TcK0hrWgPhFs0wTk+BvtRj816oJOyJbHDnbHcj1DQwHX9KqWNdideLWVpZ?=
 =?us-ascii?Q?Zb50mT5+EWujWeEHGuNfeNPaKhEKx8GGsUx03TR1h9gVRT2yzEzr245masDk?=
 =?us-ascii?Q?vHpkDXdf8RxZrx4rP101DMC1tNCkcujJrmInHgKEgfPBzDoSzDcjfU0lGnSI?=
 =?us-ascii?Q?yZyjd1PeyeB4YkFD+6KXh5cYAn+Hs4zqUjphtEXfcOQJZqOlZVlgyNZxx4u7?=
 =?us-ascii?Q?kolPyb/E9UA2SFI05Ed41g0xoFFIXnfUnXvycmyMuvGrxRGoU4hSQuS5wMoB?=
 =?us-ascii?Q?VDHA35PDfh8d7bHh1D7Ef+TlT2oUUq1gX8mgMfJRB/2LVBh851ucThcz1K4G?=
 =?us-ascii?Q?YiySvfgJkzey2WURas7TvJzTrQP88OpVVQtnuHJ2+KTteglYIg/5gLy/USvt?=
 =?us-ascii?Q?YXE3rVJ6m4sDj+u23K5p8E/Cjz0wVAlpuHTWOwShtiGn/MN3xhE9g3xM1Bg3?=
 =?us-ascii?Q?eM6PoDk83IbahbMFUtBE/AXjXTCTIH8y1dT4wF3RTm4rpuEd+RAaQav1B6q/?=
 =?us-ascii?Q?2cFfDUlSU/+mVt/Uau6vWISsHvjVj1OWECekU2/FhTyRarRIxNFSeRJ7d3ip?=
 =?us-ascii?Q?0L1M3cHGqDKx4T1HTTD7KKiBrO+lmsu44ScsTeizI//PVrK0oyVp42e0Jr+k?=
 =?us-ascii?Q?D+NJmhiNvE8jw8i6kXtsI6YVYs58p9TdzaNz7Swkj9wPFEFHDUg6RFv78VgQ?=
 =?us-ascii?Q?nzy8a9w8xwBSzflRP2eInAezkoLd2N2GBtsuOuOH6BafebUPNHHsu/YDLiEe?=
 =?us-ascii?Q?Ng5FbH+mp/TeJIM08/FDMTL2T92ejQQpISaCT3IeEoD2x+z6K558/JvHn0+O?=
 =?us-ascii?Q?vK8A+H3Pc93a1j3ZTlgEV+lgxSIjzPiqMxrzigqk+qaKX0HA0YCVppI746Pz?=
 =?us-ascii?Q?08n0bUWS7GeRkwnTrrjZjggh7DNWIbn8s6Vl7CHa+Tn8vH4dk5krGZbHC1aE?=
 =?us-ascii?Q?2Qcl1dUni6FqxTAbdDc97Us5BJZzyNg868GhAB0HnCHQOWBjfTS/xJYtTN2E?=
 =?us-ascii?Q?kj0xoZWfQjbV22TeJ4hy7XcfY2X7iNDQphIpJCA94tBUHrmUIGEm7TpBAZCj?=
 =?us-ascii?Q?nge9UnDrHLPIStp8XXUKb8JhAsAH9R3cxq0bYeL3dcmyHl7KE1j+0sgZA74Y?=
 =?us-ascii?Q?6eYpl31zxXGzxNLRYkxt0laijEwGGYQtIfvxzFB6I79jIc3BCby1piAhYl49?=
 =?us-ascii?Q?gmG1rdPAHm77n9VGhEA1vjGmNqY1sErs/ViMnOvpzMG4TNPw+dDC94+DAKLr?=
 =?us-ascii?Q?HGbeYazl8i64F7Ld8f+0qnY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kzL35wkdxZhiw7tKfQW0S2zGyiOkWkGoXGDbCJHicqYFZ7V3VFDesVDcQ6OH?=
 =?us-ascii?Q?AKUC2nsBXd1iK0GUxkQeL7njwLD0zKjVfIrTQv1sL1hOYINBxR1zs93c+RqJ?=
 =?us-ascii?Q?cGAPqH39Nd6keuRxP3PuObG2HluKnHd83sNAblSyT1ZIM8DgTT72JSPgK1r8?=
 =?us-ascii?Q?P2ccOjpkOd3qbaI0UKhXGxL/bIjbgQCIjnNdwj2tRhX7aLOskFm2x0ESoofj?=
 =?us-ascii?Q?hK+5xnbU+Q/eQuQwZpuKhcCzn91nnLQMXvzlLEC/eBb492sffTA0M4dyzLmM?=
 =?us-ascii?Q?1FCZim6m9+mBvOaXpx1SNuaXPoNSpSU36kW5Hk0TSaDx+nR5VslCJbWv5WRI?=
 =?us-ascii?Q?RfyIn9ovyYQ0/Zm7SCA3hsArE3WXgthI0WhcOZ7JsmH14TVEBALqp9LaOWLg?=
 =?us-ascii?Q?rZJaREJuPZ0xqjtI73q14R2rHNxgB47hRvvJAQo5mS8I49GPmCvHRsKzxdVp?=
 =?us-ascii?Q?ROorHRlUNaWd+w+6uv9n0O2XqfwHkKhRm5Wt+CpI+BZbvhvWoCvJMNM6u2Iw?=
 =?us-ascii?Q?N5Z3XiFqkTPOqw6hSJLU+os+hzPKKmsaoqBeUXL5kgEX1D7aZ40Xg59YToxk?=
 =?us-ascii?Q?F7I7mO2cyHlB7x03f8LWKL8289y2eI9svrDkEzYt/w3fN8g4HAeC+OxIIRwO?=
 =?us-ascii?Q?XfjarDa4EDpX/uUVCiK/mFA++Va9MY5xyZCJAIk0SmgmwnCnidt/zNxIW5a4?=
 =?us-ascii?Q?SgQTVNdeWjSTlS+8VbJ4++sRynFd5yszIW52C+pvRF+ytGazsC1/wpLHjJKY?=
 =?us-ascii?Q?t4UXYDgp5wHPWXOo4qNZPsT05SaE8lj+gziFj9fGzvUyyNEQqDgyat1FT7HF?=
 =?us-ascii?Q?Gaczt1FMCXSOwUVINPB+oTOSHsPLICgAgsvd+bn0OnjZdS8neCu8v1AaorS1?=
 =?us-ascii?Q?dkN+ZuYF2yNgCkNylmacBpkwd0bbz4RKbajQ/NDqNSB+exBQODbcf3sXGvie?=
 =?us-ascii?Q?isRrvgEe+EAHXUrqvLnSha6NPnoq8JinA0d/BcaQ7tLX2nwiGTRP6TLmBMwn?=
 =?us-ascii?Q?uO1H4MTOCpyNKjVZjLLfKo0bkJYAlIaCYVvoMdgyPSAjHGUP0WSD77HadHXX?=
 =?us-ascii?Q?K2uwCg77VhXdcHJ/kdkFReRyNXb2MdWpHmCFv0HzGhh/X7vNNFRIdK5nrpV0?=
 =?us-ascii?Q?qSJbAeGnt7FPIDlHkU4ytvphYXr2S9pLPVzsCt3sQPNy327Pno/KbYFUXFCO?=
 =?us-ascii?Q?aDoArjC8o4AO2qYo4d+ILVlKJVJLQHhF3G6ICIs1l9AAYsbh7sScsTjpfUFe?=
 =?us-ascii?Q?bMIUkGyrwFa3zvQbwl6rcQcqJTjzpz2dMZoz+zqj8sUwkSwVNfkpbv0V5jVS?=
 =?us-ascii?Q?vGOmET5G2zxl415oBNSbJ9cTscT9QjNKIx6zR3AfVtTPr/jlAD5T5YOPdZhJ?=
 =?us-ascii?Q?XW59a1lSE3cYo7qatcywA5DmwJgdY2f1T3P0XMe62SPi60n8AW+6rDAw6Mtq?=
 =?us-ascii?Q?X7N17XcBK1YXySuJZpEZb8IjxsGrRjn/oMFwXbakuudhANgV0gXS85N5PS1M?=
 =?us-ascii?Q?ZpuplzCJy1bo38sLe0n7kKepx3nvtuMNvQdqBWzckhcgdNwiTXFhX/ASZstI?=
 =?us-ascii?Q?oLwT02QSQrfovFY0G6Nw7BTBjj+Yg6O7GavAQAqo9BXkPGcH02GAVmbp4KEs?=
 =?us-ascii?Q?YewRD9D0TFT6ust9ZyGldlT4y233+dIpjkqjvqzAnKbRLBvJf1MzUg1e+JDh?=
 =?us-ascii?Q?+c5NFO9MjHuFyJgL3CZaRTYn7un0Dg+asKbTV+M11KVe8C9GQKplPZYJW0mf?=
 =?us-ascii?Q?2Q/cgCxwiQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc85c7e-671c-430c-3526-08de6d476534
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 10:37:34.0865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duFnXVdppcn0uiZ/SxPxkWEUWb9Md6zJuu2mU7I9oto98b7UpPgL5GBIZpwP6KAZ2JeGE+TV1Ah+159LuvWAwJ8SbxstUPDH8TrLuUXUKns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17173
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31708-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: B3F3914266F
X-Rspamd-Action: no action

Hi All,

I have found some mistakes in the pinctrl tables during testing
after adding the pinctrl clone channel,i2c, display, audio, wdt,
rsci and rspi support.=20

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 February 2026 13:10
> Subject: [PATCH v2 06/10] pinctrl: renesas: rzg2l: Add support for RZ/G3L=
 SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add pinctrl driver support for RZ/G3L SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 228 ++++++++++++++++++++++++
>  1 file changed, 228 insertions(+)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 5e3e56e32cea..e45282afcf86 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -26,6 +26,7 @@
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
>=20
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> @@ -93,6 +94,17 @@
>=20
>  #define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | PIN_CFG_NF)
>=20
> +#define RZG3L_MPXED_ETH_PIN_FUNCS(ether) \
> +					(PIN_CFG_IO_VMC_##ether | \
> +					 PIN_CFG_IOLH_C | \

PIN_CFG_PUPD is missing.

> +					 PIN_CFG_NF)
> +
> +#define RZG3L_MPXED_PIN_FUNCS(group)	(RZG2L_MPXED_COMMON_PIN_FUNCS(group=
) | \
> +					 PIN_CFG_SOFT_PS)
> +
> +#define RZG3L_MPXED_PIN_FUNCS_POC(grp, poc) (RZG3L_MPXED_PIN_FUNCS(grp) =
| \

RZG3L_MPXED_PIN_FUNCS->RZG2L_MPXED_COMMON_PIN_FUNCS, so that driver sets th=
e PoC register.


> +					 PIN_CFG_PVDD1833_OTH_##poc##_POC)
> +
>  #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
>  #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
>  #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
> @@ -229,12 +241,14 @@ static const struct pin_config_item renesas_rzv2h_c=
onf_items[] =3D {
>   * @sd_ch: SD_CH register offset
>   * @eth_poc: ETH_POC register offset
>   * @oen: OEN register offset
> + * @other_poc: OTHER_POC register offset
>   */
>  struct rzg2l_register_offsets {
>  	u16 pwpr;
>  	u16 sd_ch;
>  	u16 eth_poc;
>  	u16 oen;
> +	u16 other_poc;
>  };
>=20
>  /**
> @@ -333,6 +347,7 @@ struct rzg2l_pinctrl_pin_settings {
>   * @smt: SMT registers cache
>   * @sd_ch: SD_CH registers cache
>   * @eth_poc: ET_POC registers cache
> + * @other_poc: OTHER_POC register cache
>   * @oen: Output Enable register cache
>   * @qspi: QSPI registers cache
>   */
> @@ -348,6 +363,7 @@ struct rzg2l_pinctrl_reg_cache {
>  	u8	sd_ch[2];
>  	u8	eth_poc[2];
>  	u8	oen;
> +	u8      other_poc;
>  	u8	qspi;
>  };
>=20
> @@ -397,6 +413,60 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct=
 rzg2l_pinctrl *pctrl,
>  	return 0;
>  }
>=20
> +static const u64 r9a08g046_variable_pin_cfg[] =3D {
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
) | PIN_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
) | PIN_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
) | PIN_CFG_OEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
) | PIN_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
) | PIN_CFG_OEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1=
)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, I=
SO)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, I=
SO)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN=
_CFG_IEN),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 3, RZG3L_MPXED_PIN_FUNCS(A)),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 4, RZG3L_MPXED_PIN_FUNCS(A)), };
> +
>  static const u64 r9a09g047_variable_pin_cfg[] =3D {
>  	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CF=
G_IEN),
>  	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 1, RZV2H_MPXED_PIN_FUNCS), @@ -21=
41,6 +2211,70 @@ static
> const u64 r9a09g047_gpio_configs[] =3D {
>  	RZG2L_GPIO_PORT_PACK(4, 0x3c, RZV2H_MPXED_PIN_FUNCS),	/* PS */
>  };
>=20
> +static const char * const rzg3l_gpio_names[] =3D {
> +	"", "", "", "", "", "", "", "",
> +	"", "", "", "", "", "", "", "",
> +	"P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
> +	"P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
> +	"", "", "", "", "", "", "", "",
> +	"P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
> +	"P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
> +	"P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
> +	"P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
> +	"", "", "", "", "", "", "", "",
> +	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
> +	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
> +	"PC0", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7",
> +	"PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +	"PE0", "PE1", "PE2", "PE3", "PE4", "PE5", "PE6", "PE7",
> +	"PF0", "PF1", "PF2", "PF3", "PF4", "PF5", "PF6", "PF7",
> +	"PG0", "PG1", "PG2", "PG3", "PG4", "PG5", "PG6", "PG7",
> +	"PH0", "PH1", "PH2", "PH3", "PH4", "PH5", "PH6", "PH7",
> +	"", "", "", "", "", "", "", "",
> +	"PJ0", "PJ1", "PJ2", "PJ3", "PJ4", "PJ5", "PJ6", "PJ7",
> +	"PK0", "PK1", "PK2", "PK3", "PK4", "PK5", "PK6", "PK7",
> +	"PL0", "PL1", "PL2", "PL3", "PL4", "PL5", "PL6", "PL7",
> +	"PM0", "PM1", "PM2", "PM3", "PM4", "PM5", "PM6", "PM7",
> +	"", "", "", "", "", "", "", "",
> +	"", "", "", "", "", "", "", "",
> +	"", "", "", "", "", "", "", "",
> +	"", "", "", "", "", "", "", "",
> +	"", "", "", "", "", "", "", "",
> +	"PS0", "PS1", "PS2", "PS3", "PS4", "PS5", "PS6", "PS7", };
> +
> +static const u64 r9a08g046_gpio_configs[] =3D {
> +	0x0,
> +	0x0,
> +	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN),	/* P2 */
> +	RZG2L_GPIO_PORT_PACK(7, 0x23, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P3=
 */
> +	0x0,
> +	RZG2L_GPIO_PORT_PACK(7, 0x25, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P5=
 */
> +	RZG2L_GPIO_PORT_PACK(7, 0x26, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P6=
 */
> +	RZG2L_GPIO_PORT_PACK(8, 0x27, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P7=
 */
> +	RZG2L_GPIO_PORT_PACK(6, 0x28, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P8=
 */

P{5,6,7,8} IO domain is ISO.

> +	0x0,
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),				/* PA */
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2b),				/* PB */
> +	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),	/* PC *=
/
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),				/* PD */
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2e),				/* PE */
> +	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),	/* PF *=
/
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),				/* PG */
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),				/* PH */
> +	0x0,
> +	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),				/* PJ */
> +	RZG2L_GPIO_PORT_PACK(4, 0x34, RZG3L_MPXED_PIN_FUNCS_POC(B, AWO)), /* PK=
 */

AWO->ISO.

Cheers,
Biju



