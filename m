Return-Path: <linux-gpio+bounces-33979-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GuEGj5cv2ms3QMAu9opvQ
	(envelope-from <linux-gpio+bounces-33979-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 04:04:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16F2E806B
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 04:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30A83010D95
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 03:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948A327F19F;
	Sun, 22 Mar 2026 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OIzaZsCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0566BFCE;
	Sun, 22 Mar 2026 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774148657; cv=fail; b=iqMLcH22JwFagze1KTg5lktotzQSRjDsE/Z0vdVQckn7z/DoXuFfqTYJi29H4us6v1Fl37JS5QjpIpRZWqRRf6eD4TNpwr5s/+ONhBTwOhNMKPeIKFes1cglV2amHPnpn1EvJGg6QHpTyW6PpXNptSaEOblbaSEJm5AIqCUdhKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774148657; c=relaxed/simple;
	bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjmTTMpGV8jSowjO7HEqzKXpPYmABMhBAVOTUlu+fwhL7e7o3h51Iis39/4HYsSzfxzzqAMuF2gj8JzUz/EG+bAaYCYnmDFIMdKNkT/Bdi0XFVZENRcwQPo4NaOf+1bdmjncL6KyQrbK0EUMPh6Qr0PH9yTSIszTaPbroF0WBEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OIzaZsCm; arc=fail smtp.client-ip=52.101.72.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBZRaUCQr52frbLMmrWO2uIhxzCHR/BYvJbe17FhwhtCWvEcFP2RWfC2PXZM2xVuRtX5p35LYrk9G88Kh9nm0Ku3ChJDcOc/DQLLgskefDqX5KLeg+aTZgzksCTcEhKuOo3jsrVVPgZZyEdxjOMkZDSgCXcpRQ3X6u9/1Jn0SZQigsbwRfNOChm03uaK3jrwEBuucBAx+ZsxVKiY9w8mVN/a6ZAITgD59bN6kr6VkOvFN6j0qOeiSprIArJgY6VGZdVgCzJjm0EVQOKqw/x+DeTgRMPisJsfiIqWxG06tqaSJ3t8ySpIU4RTO0UY4NB8hy2nKd1AgDZAiN30R32msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=;
 b=tYUjmzK7AmAy+UDDmhc4LCuU54eQgTPjRhBDbznUMKJEYmGViA4FNdhtkoYZXuw3hjiRl2sxSGur7ehmZj7djkB68BXnCNLPZxtnQp41A7uAUO78RtWQNZt+FIQhysg6FwDHryCo/RBqkRFzbaRsDwKCy5nAfbhLvNeWPMbaZqD11AznS3FdiyIsOe82nSfD36tZsZxApCfteuq5Jl60yQnzyXz0guJmzALyqkIT+E0wqfkNqXx6MVzPEl/p5tX3Fp+HpQGNhH1k/iIynUTNM/IA7/FrBU/JZMv6YPvD/s2z7N2ix3Rz1WHABxmPgubGWpLXr/ogaVwBtJvAzrzX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=;
 b=OIzaZsCmjZGHNpIBvtdrwEJ4nzQyuPA+dtqDv0lNH7hTW1+YAzoBh/M+NEAkigG999cK8B2ajXBecCaNwLTRWJRuaOGQei1m+rsj0JuFFRFGx4wrj7IZUx/yk3xdfjyQzSlEwVBaMj7dah4PCxuBD+Qlt6aACpoSCqIb9tYCibaEvzrJdgmQYIEXhiv3hb2N7IAQJ0A/d/yjk9goH/CXyqmYXOk4mT9w7a9bxlameEkwlHPIPBnv6XwqbHocfzjoYS2dTE0NrN7IMCB/SAuh2Jvj8ZabtG33LdbuwVUSxVjwnPRBrKLbySSb0a+P52BzL7vzLdm18TkQf0+EAwEQEQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 03:03:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.022; Sun, 22 Mar 2026
 03:03:59 +0000
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
Subject: RE: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Topic: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Index: AQHcuKA+G1eOINrPn0OSZMvrGuC3iLW536mw
Date: Sun, 22 Mar 2026 03:03:58 +0000
Message-ID:
 <PAXPR04MB84592EFE18236DC4D3C71E4C884AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260320193150.2508850-1-shenwei.wang@nxp.com>
In-Reply-To: <20260320193150.2508850-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8811:EE_
x-ms-office365-filtering-correlation-id: 4c1dc546-99ec-4c16-6b4b-08de87bfa9a4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 K3c4qOXK/j8JS4H9f2Y/6geZ4YWrKL9PKYBiBqH4j1jatk8TtjadCs8xlRYBPe1OKyTD3YIO9dPyZgDNgbXQVTtBxpxl6sWM35+mPJR/njLmN68QwZMTrtGWpOvHzChMIkzWCmeRBowNCgnz3KRA4FSbYsEnqwcNi5bOuDLVVO3tCo9OXX0rTG7qUxGpWeNaO0dm0OcMFIRg/m5rGNpADyBO63EkiG7A9zB5LyrcQS1tkewnanuiNCmGCESysWi6kd98BlNpmgXu5n5P6rnPPjt9eBoteDPmINSFzyJBDio80kdxYXpWDFN3q6zaRhG0PP3q/A7zv/yK8BL2wcRmyeir6f5l6Ds5HhuFaUWpcn4JkTG0eqaNMxFkLw5VOmObSiwzyCLPxhkNj4XKlyVEjE+mlOftGFW9f4hmrgk8IzxLC2XEeDUHFaZvucEnKJJq4hXbVw0wKBRbeGk1F08lcZ7P1q3aitntiSDsW+F/SgfUJqUooibIP9CHN/QWeIrxthq7SomXxBAZyUXIrT1QAWq1ArGPhq//xMGqgb1xgWTDMjSm81ZFizda5Cec4SB/qJkjTlUMXBobjktEDeU8Y+Faem0w5C9hBeCAR5bVJ8OwQFyh5Vv7yaITx9C2RxRraVvtxOK1qEKNiQNx3KpNuTm7/76OeXF87xK4g40RSKtIR/agwEcxh3AX85v0tEo4uOQQ+0AG1ZxEE/lJvBFutS4NaSlKSfUDTUcjdbIfZtpgU0tVQJOU6in9LQaPjXQ8ommZ1ApYokNNR5Tsq9x1s67/ZgtpBTL9CxFdbuy1K0s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zpU59tqv6ZSAa2y1g5mc7nRgbrGhX3ihmgNMRqD8tZvcrnwRb0jRGQ6M4UfF?=
 =?us-ascii?Q?JBAFP6TfK8oqo34MTx69o3WTLol5KR5BQYmreOaF9H56h4H4ItzaOSQ0hXvG?=
 =?us-ascii?Q?CGGIZjUkjV0dKboKDgb42i3paThMTmpaN3uhHan58NGH7A82553C0NeEFVn7?=
 =?us-ascii?Q?Gi2xXgZiHUNRGYXhmuoL1W4e54Ea37TeoNBuAnLIP+3/oG/DQK5NvnC/IqhN?=
 =?us-ascii?Q?dpyKjO2nicHo0zf3y30Agr1xyMwoOsLa2OEk4XzyjEWidR3ycWog9HI1FR9+?=
 =?us-ascii?Q?vNp0YtvRKcAq155X12hl1bnHw5TY5LBUdxnEKQRbzHDUs3xL9WVk1QyLg+jh?=
 =?us-ascii?Q?H6+XnTSrON7/Ua615e8OccCn3+w6T/ixDDXrhlbdeoOV2HnBEHAp8JvVtt1z?=
 =?us-ascii?Q?TMFATWQf1j6bZC6PQGzWDscKKHnNfCkB2c4JDjqXizpAF8koa6hn7pA+kKks?=
 =?us-ascii?Q?UApfZLRCFQFVEqJfDSIJLvwgHDVTu6x4vssU00MbJCZYNhSb+Q0XRiW5RqXj?=
 =?us-ascii?Q?AgtJk0j8VU4myKddxKiFglkl1gftpAWptM5fFDSfaS1Fl+lb4MIGlThodfJ/?=
 =?us-ascii?Q?3yf5d/vTqonfVKhagnzRh+u5lO7k9D+/Gvrr81CJc06kkWipHLtsHKgPutUs?=
 =?us-ascii?Q?iuO7dyCIksi6XOqPfYSc6bnlc6LaLJain/RHWbHHzXKQSkdan5k9+x9RY7f7?=
 =?us-ascii?Q?04X8775nNnJgadUqJHP74MbhQjH6lqYdWqLZVL0nDJ17LolU9b5zIYTXhzlW?=
 =?us-ascii?Q?9fQZikP4dv+DBQBmcQ1EQ6VG1kCyrPVVEdHA+bIsdxd1PQNjh4pshVWFht+n?=
 =?us-ascii?Q?ahbtTDa3NsfITlgGtCjKtmvvd7HXLkuY8e+5FenR2ASKg2T6GF5AZNFG3HYb?=
 =?us-ascii?Q?RkEkmDI8Iq6Bomcx6oiNysjuOIZiDqXYIYtvN4rar91QG/0iQ5P2gdQcfSLi?=
 =?us-ascii?Q?Xr3KKgZ9NZt7p74UfZuVd9JVbof+GvZBAltUBjmaxBFfoidVPJb93EkZZCsL?=
 =?us-ascii?Q?amf8JxP3COdlDN8K2mhwpvx4UCNFMG2s/Blyk+C/gTaBvmixF2f4Lwd8WKcY?=
 =?us-ascii?Q?mJFY7s6g6BpeG4mdGeKFve4fKh3hxxPazDId30ZqMeBOboclgDsW6UMhnVDe?=
 =?us-ascii?Q?jyRHbxkCHzrCMadRWn3JLbiol7FJkoN+9b9XANUFU9Pn78XRdHcCc/8tARM+?=
 =?us-ascii?Q?l1/5+xOpgz7sRqU9OjIZHstdqCcPTHSkjdcLjOL5HY/yumfdzMYV9WmqzarV?=
 =?us-ascii?Q?mm7M1PlgFpTBn/4IKo5PEzpb8/ZE9tv0TMJudFXec8ye/gAmrWTKEzoetWwJ?=
 =?us-ascii?Q?1d5aGJsrxfygOOuc4JJj1zUL8fS0S94UXRaCha/IFpj/bwrDaCrTvFY/zF3l?=
 =?us-ascii?Q?wYAQkJ7ivw2K6ibo7bEkR/5saBn1pav+qz8qVJTqWl0Vd0/5jmluxB+j1Vtn?=
 =?us-ascii?Q?CEmhoi5hpdE9AD9PH8IALx58MiN9AguHDkNBjX6rrCzbl/a2ABEEWMHynYcV?=
 =?us-ascii?Q?xb8VIWhEilXLFQ9q0xAJaaF3DfcvMumjN08M1mZdncDloa4leXxU6IWsuh3v?=
 =?us-ascii?Q?PshsO7xCBlAbPf424e8zsyLSDspAab6+SMyCJOqqIyFPhdys5RenOZJUk9or?=
 =?us-ascii?Q?TVNlx+4G4c04YRFKRjW6Sbetvm7Nh8dogI+DN4UJuUdm76qebYrL1BM7e1z4?=
 =?us-ascii?Q?S288wL06SsDu+4qtk5ZoQOLCylUnrY141++xCWP1ivcFa/v/?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1dc546-99ec-4c16-6b4b-08de87bfa9a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2026 03:03:58.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzH4zHaW+vELrCFzy1v3CvuB3IHC69mMbRUvC45pcxGvgf43dRzt50RIPxnMddH52wP83b35T4nDPHM2daWgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33979-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: CD16F2E806B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Subject: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising
> Edge
>=20
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad
> wakeup trigger due to a hardware bug in the detection logic. Since the
> hardware does not support Both Edge wakeup, remap requests for
> Both Edge to Rising Edge by default to avoid hitting this issue.
>=20
> A warning is emitted when Falling Edge is selected on i.MX8QM.
>=20
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x
> platforms")
> cc: stable@vger.kernel.org
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

