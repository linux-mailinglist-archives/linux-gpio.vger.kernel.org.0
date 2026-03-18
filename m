Return-Path: <linux-gpio+bounces-33736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEOFB16LumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:24:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C839A2BABFB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B959E300957E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE46277CA4;
	Wed, 18 Mar 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rkw3UAFB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E533B52E0;
	Wed, 18 Mar 2026 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832745; cv=fail; b=Ny/pZ6D316YlpxRsZ6P8+Dk8CHsiC2MMjKJe57Fy5TMIHDNkrgNJGRJlB9GUCwlyp+1If5mI9MLP1813nFl0eYFjy14WM5O4HVHQKhEGPsMnxtGCZNfWxbCdb/rPros00DTRswsYP0z74/5L+isvMsrXx1ljRHb7VOjsTMssPI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832745; c=relaxed/simple;
	bh=AOkUJXY2OfShzyfHl3Vj0CJcGhcsqEhlkKEA7SuKZHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pnSHGG22faKv0/6eYEeN5rj0nv0IfK50t3lRK1qN28amoykwiA7gG+DkM5jOXUIQzZKi61TyiIVNAWVfd6T7H1DOI4vpr02zljOpSy2j94Lu3DW0xOJjjd7VzpPLer7j0CUFU7expn8Uldr2JzA+lVobBZhkYqEGXDaKPkALbHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rkw3UAFB; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DraPwYG+/PiCw8XFlqa24zRL5ZS7JeIvpm/micmSCwXN0hRs3UE7YrfQgb/4mXjSNwoUIkloi2AfNJekjDHMxQZUSta267SOvWlMMqS28oooGCYmM7bqmuBPbu2N76/DisbsRGneSuw5479y+4D5XsvgV6CaqGi3qKu644yX9lgSLsu5uf8LFUder0moLMWpBTyBtrInzOeqUrGP9ijsTWgnuLzNvNqQg01iriuOlPtgKdo74DJhSPP4Vo3twU1UNatYO0kFcwIlEM0WplDVp9TWz9fpf9Oo5+CzRAnFRfsokTGgi4xXBYKxhe9Nt6B5YrUBtLb2RFTW7F7a1VSQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScJI/nVKpS4Kqj0+3r08hYtD1hVCY7mgynZxFHpCLLA=;
 b=RovqoX/gm3Z+e54F2U6j5POhxlRnKab7v5Q2iXcxpMrEwZswLHhWlbayr/rvuaWj0h/BU8NyMBhAcJk2l2QWeODBASFVlSM60C2YSGBlZ/DVHtHEoM0jFpo9pvLSdA3L+c5lGfJWNQYA4t2lP48LfX1zBs2pgIU5Bjwe1+nzmIpO5bqwZmONiTiIPpdKKpxQ/arUf3NbuxmLx7uNmNOwxII79nTofgRgGV2WzYpi24ZkLJgb44L/HQYN3s5ZqQqtMcc69XfLc7VRFDm5qXj5ut2oTlZ4A8Lj4RQSCEQbch7ndH4d5D9vBkPhWiv4Bs5VXpGxXVlqyetsUq//cgEb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScJI/nVKpS4Kqj0+3r08hYtD1hVCY7mgynZxFHpCLLA=;
 b=Rkw3UAFBpL3FYG1XR343KxQm+q5j93Ln0h8f6uW0SiX+rrFiDtL9V51PZyHbkA5Y3Nsq16mB2jkdwMEn+AbQgal/znJFbE8uEx6q727jPBZxpsdIzyG05N+qsuVIvzqrBsAYUpx6YYtM7jZkvU0BTTTRPcnZgyQNfXGgVMGbB4imCDQOF6AgaeYAeJE3UFp5/HeJEbaAs4WrLv3Fq0hpvbW5L442RO/0mQRoEEEB4rCSiqXvZFdT+fBRxzbTE/aAo8zo4p9G7+AZGJNl3CBjBakg0Xg6ep8z5y6/j78H+jXn8Bxj6tvPMyyeYz2ZdjhJV9SvHaLCW6cO7KSPzuq6Qg==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB9253.eurprd04.prod.outlook.com (2603:10a6:102:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:18:59 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Wed, 18 Mar 2026
 11:18:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Topic: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Index: AQHctkd9VzQPaIhsCEuLLM3IVi/TvrW0IVqg
Date: Wed, 18 Mar 2026 11:18:59 +0000
Message-ID:
 <DB9PR04MB8461D0BE47F09CFF41492A60884EA@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20260317195116.2301985-1-shenwei.wang@nxp.com>
In-Reply-To: <20260317195116.2301985-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PAXPR04MB9253:EE_
x-ms-office365-filtering-correlation-id: 7d7d898c-7749-4698-b985-08de84e026c4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 1+Bfnj0nhv7WpEN/utoA6pJmOPLw54VC+AmBqFQS4Dr5rXQqNU1ud60J/LYHJaPamnAsYNaWp0JonHOFCYGJjsA69XAoADfh3tyoS08evrzxXU8I+yEzTN3hRZE5VM3TNZcTe2s7uLwngn6I+7nQth5w0mIZQeQePDvqAUlhnpcL5A7JFk8H4jDmsmH3TUuvfsIOggQEbwLMPTs4xhNzOp9L0yll4SE60uGXp1LovoOosANot484KfNmYf/JKwt+AK5vxpF5TaeuRFbEMM18eX2s4fr+MUGI8eI/RY1GY1lMb9PrFzGiTIxyDqfnzaJAi+OpngQb2Psy9rtWZuwLMkswbAVYTTNuqW3pZNZvKzROwzBAqaplcGzdtIPBN1Bj1e5Ra/GiX+460ghem5bIqfxxNC5OEhn4e+f+Nz6kGn612F2cVdYuA9GhUliJW9MB7detlRH1XNyNnKcJOISbJ28V4gbStUInhgI5gLkYAMYl4hOcy3GuV55c2MKDU0XWOIwhcsFWvWssoBsZ3XlIGIsQ+/maSe+sg/O5DyrL1skbhI1MKQmzduKog+zibCA4IKVN7e9wkiFy6D4vjUzhNEH1QOYF+qmOSouzhVsaiP5ZkyzuPR3I6eBPus4xaru4Fh/I6uz1V38Y9f9BYM8FP++vvvgUPa9qL0ROXPm9oUSFJHQdkCHKueM2P6Eof6caZF5KePkhHIHB881VNMvzPFmJSrD1sYYRFjEZgj4S3SE8FGe1bND+oN5WcjvDWdYAFXml/3loSVbUTFdoa7eHeCkS1TJiw1azJC/lKtL/C+w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qej1oawRXleZFQw1urcV+w24Z8pmlg2VAiVgU2+fzmcZ8ba8OJRudTIjJ+so?=
 =?us-ascii?Q?MhVuHA2mKRND9aos078Rj6JGNyzKLAYRbZ3dMSJH5VmT1GsFoF3u54VN5mzY?=
 =?us-ascii?Q?mCVjLtpocZO0Tk1hESqnYTSqeWZIqKEsDd9R76bV4JBtdZW+2rhol2dPAUcD?=
 =?us-ascii?Q?gJDGteD3zR+InmMPeCPO6qbahnqxuGTQM1HWvpjAyWUzZAU7gi5iKwvSgrKz?=
 =?us-ascii?Q?GSGdNkZjo6RLjlhyHRLmZT9lVrRw2jJ50Rxn3rpT2ra/BESJvsSgaiw6fMxY?=
 =?us-ascii?Q?CdlYjwaP1IeEqihQ5oQvZfiIxfrrqm2XJp52tF0b4LEhfZe+xdmGkJOXq7bQ?=
 =?us-ascii?Q?KyRhKxM0XcGhlHJ96b5QgElaOLyPqREFC6plUGpFjmbNOf8P6d6FYu9oibi9?=
 =?us-ascii?Q?P/lDeNMhms9aOvaPDs8C9MrWjSyFuEBSUSV/ZRF1ixI4cSBL7MT0HNaWQfIU?=
 =?us-ascii?Q?F4xDUqNEragnWAxDQRGH0HQrxF2rzGlnjXW/kLme9WxeYXRUNs5yIZOvLLT7?=
 =?us-ascii?Q?U1I5ilKDaLCeAobItDq8yeYcCBTx806nW2selK6SaWDGmOqEzpygZ7OPNw0x?=
 =?us-ascii?Q?PStEPhpCXflKmneJ8mZIigTWknN+gAoSXQ+uC3kJ0pkeqYSQnOqhjMN0oJv/?=
 =?us-ascii?Q?5dQ/R5WJLaY6ai60F2J7XGVyQqc5KAv1sIOmk/tubatuCrmyry1j5lNh5NMs?=
 =?us-ascii?Q?r5pT79oHDyORsw0uBVN7xcX/+aoum6gGqV5Gt9i1yDopJx8SKCN4PTbE4JzR?=
 =?us-ascii?Q?1OSmPYVc9A/CPo12fW3BKQJb4crGOaSiAJ5/JSl2fOMKLdrTKSvrIliy5xFo?=
 =?us-ascii?Q?hVQhbhrq1K4nd+qQOET28tJJPQTiKaFAFgeBIHxpQfqPwmeaTg09FjkVCMA2?=
 =?us-ascii?Q?1Fg5PcmXfvu4cTwH5BOXC/W4B7aUPv9Cpb3h40gFx6Iq5aw5v5McsWCBqS+U?=
 =?us-ascii?Q?FmhkKETFvZ7yi/7eF7SbaeNku1690jBCg0LG8UuBPiViguITZrV+TmrgakmR?=
 =?us-ascii?Q?zGvNxyMFY3E2vj0O8UM660ovtciflMputoL2MAOdZ2HEAUmMsKffhRmGI1u1?=
 =?us-ascii?Q?Q8Av6VAIMlgoqkW2sE4B6rtIOdoNSU9JNWB2ugMrApdckWeT0V4gLKyFRAmS?=
 =?us-ascii?Q?EkOHuyLQFTT7f0o1khyamlDengVsdiQodpEyobbruFi+6JH0+T9ufs7g7iWC?=
 =?us-ascii?Q?FWQdlDI2VE2Woakb4D+YfrATdngBigmDgHuKwcH7ZqPimwh7RVVyLUTFpVB4?=
 =?us-ascii?Q?IP1pXx+SDjaRHlSHfSj93+Eky5HDR1x9G8rAONKLollUMw4ojEB4wnvn8hAx?=
 =?us-ascii?Q?4tECpYFmt0kh82nv1+EvazyrT8FCL3e3IXNj8qzjMPgboDULQwVx6Qba/M09?=
 =?us-ascii?Q?pW4/ut+1G72gtRi9NykX2rz2idEQlGtq1AO/VUYMQIFpSH2V+U6RDR2OSVSr?=
 =?us-ascii?Q?cUhLriJkwt4g3Wl8e3wjaKT0do2t5FV4+Zkx5qsC8ynbJlD0fFUulRCIiGoj?=
 =?us-ascii?Q?zMzs28vdsP1iBKxTRJXCySIRuYX7NQx2ksSwXthBunwdMQ4rwukMK3kY0mH4?=
 =?us-ascii?Q?teRdDNpEugZprwulnEKFcO8AxE6td5OazYd+l5LGUBfNh/sA1iqqraU5bICL?=
 =?us-ascii?Q?ccLnl9xuBNG2Dbqkeheb9lHVLVAQxYaxqy0a8Y4fC1M8f2GnSJ/0THdjfb6C?=
 =?us-ascii?Q?Dv9r2VbekMbsgPiX8Vs6fbdbWuQfsn/9x8Mjl26a1gQbmuDR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7d898c-7749-4698-b985-08de84e026c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 11:18:59.1054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQT4HRuLRW46qxucZ02HafblsVHLtnDfceUCk7NeaP7xrtiCXM295bHcGwoJofn1qZcWAJL7mG4pL+5gXJx8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9253
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33736-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DB9PR04MB8461.eurprd04.prod.outlook.com:mid,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C839A2BABFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shenwei,

> Subject: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising
> Edge
>=20
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad
> wakeup trigger due to a hardware bug in the detection logic.=20

This hardware bug exists on i.MX8QM/QXP/DXL, or just 8QM?

More information better to add why suspend may fail.
Do you mean not able to resume back because of failing
to detect falling edge?

Since the
> hardware does not support Both Edge wakeup, remap requests for
> Both Edge to Rising Edge by default to avoid hitting this issue.
>=20
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x
> platforms")
> cc: stable@vger.kernel.org
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c index
> d7666fe9dbf8..f8300690ac05 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -589,7 +589,7 @@ static bool mxc_gpio_set_pad_wakeup(struct
> mxc_gpio_port *port, bool enable)
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
>  		IMX_SCU_WAKEUP_RISE_EDGE,	/*
> IRQ_TYPE_EDGE_RISING */
>  		IMX_SCU_WAKEUP_FALL_EDGE,	/*
> IRQ_TYPE_EDGE_FALLING */
> -		IMX_SCU_WAKEUP_FALL_EDGE,	/*
> IRQ_TYPE_EDGE_BOTH */
> +		IMX_SCU_WAKEUP_RISE_EDGE,	/*
> IRQ_TYPE_EDGE_BOTH */

For IRQ_TYPE_EDGE_BOTH, use IMX_SCU_WAKEUP_RISE_EDGE.
Do we need to also add a check for IRQ_TYPE_EDGE_FALLING?
Saying not support IRQ_TYPE_EDGE_FALLING because of xxx.

Regards
Peng.

>  		IMX_SCU_WAKEUP_HIGH_LVL,	/*
> IRQ_TYPE_LEVEL_HIGH */
>  		IMX_SCU_WAKEUP_OFF,		/* 5 */
>  		IMX_SCU_WAKEUP_OFF,		/* 6 */
> --
> 2.43.0


