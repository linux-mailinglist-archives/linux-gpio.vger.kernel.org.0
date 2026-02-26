Return-Path: <linux-gpio+bounces-32229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN02MBk1oGkqgwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:57:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8C1A56DF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49C103004CAF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FCB376BEB;
	Thu, 26 Feb 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dC8+a6Hp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863837C108;
	Thu, 26 Feb 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107024; cv=fail; b=Vwag1FLs+OizGojesoPjGBt6/vqx43Fu9+fzbp15IsrfFHrDmBQ03X9UfuLKvvUSKYkIlyfQTVUYl/98gRSjzO2NjAUqaiSxoZXUE9+5mYr2RE0Y8Gm5FtMh5F5X85Oit981zz2uyNsaqlVdDEHyNzPzFeYCd58LgxtFhrX1GhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107024; c=relaxed/simple;
	bh=3xhEaROmb2sQVCOtjGKyi29Lv/5zlkhpOWfYX+yaUKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rrexAFCmMT/JWy9YLEGGqJnT9pGvjbOEZoAI07noZsXSlFBwZah5Y5gv1Byvzf9pU0jwSj2BKMN6hzawmqN+LRvchmevCpzBXcRmAs17YlIOl9Frnr6IPaWqeYyspUmuyuwg3lNGVwbj2b+ys/GiXB50jBF5JX35FE4Vi/hCcPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dC8+a6Hp; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo2xS4mTbwUf4x0WZKASdgyNzLkInn9uthtdV7FDEqkvTcmdCNFSfVcPqTlKze2/jx7T9xbj3eBtqHs8i4I2ZvFJeCQVT9xMusjateGrDqSE2uKTfTaxsyvHWYM4VxPbRJfV6rM7LNL8J/k2HCRWpNqSdxdLk3Ncrae6sD5icNxcuTDPnvelfHWpDx6SaREafWMdFSjqSrbuw4xv6ecPOZGqPQksp8tXXls5+AIFGuqZVn1kNJooEQM0OgbHpkEClTzaVOqCU/NbRfNGoy+MF/H5j2E2lTziuEO9TV1UEEBKOSTf9CbhZ2m0WvhkxdTNGjKj7OWC6nPI2RQyAn1ZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xhEaROmb2sQVCOtjGKyi29Lv/5zlkhpOWfYX+yaUKY=;
 b=zQxxHvySouLpMsTBbgMEArItvQoOM5gEp0Vu9vRg9tQ/GDgKayIAdS0b0XGyKgPGTSDVR/XJk/IVX0lYZ9ucpeeq78V04n6pcpWDsuTh4NZ2WNW/eZWf5SE5h4gIFaoEq0HPKfkAJmB4lrKlPsbLsoTLW6AC//rluTIr/vKpIdOUgHlFM/qmAXfOp8NO2Cf/fIZtTfRZ+BBIs93YK4bQmi0meW1gSoWBmg2manxnQsoC5LBTHKLzFoFYh5k2SHA+9WBEiITOFOooMklUISy90XrY+shKCqX4VGy9gF2/4tV3P+VZ1mhbW0zPFbdwPsGB8ErPhc7faNKpL2C1u4cLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xhEaROmb2sQVCOtjGKyi29Lv/5zlkhpOWfYX+yaUKY=;
 b=dC8+a6Hp6ja65kpQAQmA+WfEloY371gJxUpQoUqDQhyaW5DSd1fRekwX28DHxPhzGgGUpz8A3fIh8dDcJLiEUcVXKWX7Rf9hlA5biSkuIMV51gXzcPzIuVCE7HE1v3d1NlL+ilcrxxef2m2c95GZ60+ydG2pxnG07l3Xl6x5IHFVNhAhOi7HOPUvDeDbVmS3q9KMIYB+jpXja7Sm7CxnyB4R8FqbGWCZnav95wfervzIjUZ3fobUXwIQssf+S2GFbL/FDt5e++AKVvAnGQPvNeIevmQk0fm771GelRcOYWfG13ZMbP5b7lVykNx7UnM1HvP2NgheEC7k79pJ/OVuCA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10830.eurprd04.prod.outlook.com (2603:10a6:800:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 11:56:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:56:52 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, dl-S32 <S32@nxp.com>, Linus Walleij
	<linusw@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi
	<cristian.marussi@arm.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Thread-Topic: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Thread-Index: AQHcpwkWn2NCemsOUUqU8WHKbktVeLWUyr1AgAAGi4CAAAk7QA==
Date: Thu, 26 Feb 2026 11:56:52 +0000
Message-ID:
 <PAXPR04MB8459BAAAAD7616A70DE238C38872A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <8ecad26c23ba35741f167b3753cd19e72c33c0b4.1772100926.git.geert+renesas@glider.be>
 <PAXPR04MB84595BC43F3205ADFB00D95D8872A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CAMuHMdUmnfeRcqg3HqdM7bgBtpnUucOCSzRcz=AoBeMKU=fxBg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUmnfeRcqg3HqdM7bgBtpnUucOCSzRcz=AoBeMKU=fxBg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI0PR04MB10830:EE_
x-ms-office365-filtering-correlation-id: e926ee5c-0d31-4053-95b1-08de752e2177
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 Tro38+026RupdFm0aVqBEE4WgfUYKwyKrEuFbz+7tRuXK4jjzcfkJ1dXQXTkxzDyMDcD0c3IOUvr8Y2QHDLPR22L7nA6QhUtonBAWCeGER3hxVtxPw1TR0Ij+P3zpD2pj7Ftwlddh6+JdWQF2OwQ2I+V/wCE3zaHE6166alOQ7Hd5xfoBgOMBcvXcZCkQEvGmlvob5opHlwQOCk/xYuPjks5uX/Z3nvTMfv2lKpPQ8fs+PaJTbINnTvAJI3oMsOLa/OjnpnsBirn1z9xtLDgC0LJiEnovpKHWgGoNxoKEFzaXpbYWNc4KQtiFp59lShNcq5y1F8hG+/T1D3iW8fyCqxS/CsIGpDaPSPKT98U6JVEUaNs3Vek1E+QTnPCBlF+eqwfqGlw0aWOehT2ct9aW4qP67SdCzgkBqOw0Ba1UT0XOsNBKcFTd5ntnajZWwJ40fQ76nehC3kSyv2GFK+0+qeeamvq8W8A9HEe7eSsHrivMXfXtmaRdpRAxHDyyqWPbpvBPrcaIZeXg4EwcDbVj3nv7i3+FFixng4ei8iz0f0ls8TTiOR04f1G5vPdsXOETMTAz5h7aE0EMLr9Y9nabsqfGQhFdwqszZhQeqXZOgVbh3nwFgm1GgB8OyxNI/y2GuaOsRqA+637jFpQwHUCKpR6SkXspsoA+BC7lihdhS83Vl8X2peHpFrD6HL36ohDggMrmE9YhxrMuOMCVbBOfZyyxEr/UzIzCXzmbNSYcitpo2V+VSdap/eGFp6LIVYAwUhWFX8ETlKYV9wHqlMcW7lbNwAv5jyZD1RF06kFng0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDlLaVZkMXNQd0xlaVZ6M1dFN3R6UUh3RFNMTDRQUHRRenQ1bWhpSHFUSHRM?=
 =?utf-8?B?ZmFiTHQ0dGUrbWg2bEE1aFMxUHFQSEI0STN2NnBpdzRVYXJ3U0UyaWtZRDFH?=
 =?utf-8?B?a1k2OHZ5NUlicGp4c1pleTFMN3R6REdHQ3VSSEVwMkVOclpJNWZWaFRZbUxO?=
 =?utf-8?B?bEd1aWpUSU5kTk1QaUxadm01RlFTSzJMcG9UaHJrenRGcWYrcXFCOGFvaitu?=
 =?utf-8?B?eDlqZUVFbG9sRFlVbHhhTEJWRjNaZlZzZFdUZFI3QUpPcmxUNmxva0EvN205?=
 =?utf-8?B?d0hjN1AxUFlFNGtkOUVwa1o2UHdnZ0hwVFBqaWFFTHhCSElVcWZ4MjllaWJF?=
 =?utf-8?B?MVZvVE14TnpueEp6SEFHSHZkZXZBcW1zZjdkbWRhUlNsTkM5djV1MTRrSS8w?=
 =?utf-8?B?ZVc1bUV0Vzd5WklORkZGaEQ2THFpVUNFcmxuK3RTTjFqcXkvVEFTVThoNXZ3?=
 =?utf-8?B?bXdLUzd6VEtudWxqdkxPUW1tb3RnK1pjbEpRZGNzS3hJSjlrRXRhR3Y0d1Rn?=
 =?utf-8?B?UXI3OHd0TEFpK1pCbm5qM2szUkZTWGlUV2NNTjFJMzBFaWRRc0pqa0FEOXVi?=
 =?utf-8?B?cjArbExzY1NlVHVSNGZnTW9SL0RjNkxHdUFGWFFsc2l4NitkRmxsT1FuQ0NB?=
 =?utf-8?B?cmJLRU1aeTEwTVRXZlZyc2NGZHVFaDRkbGdaWlhxVmZYQVNpMTRkbFJ6akk3?=
 =?utf-8?B?ZUxXZi9xNWlONGNhTVJCTE1HYXJ2MCtXa3orYnh6eFYyRkQ5Q0dnL29SZWNK?=
 =?utf-8?B?eWxQWXcveS9uMS9iVFpwL1lsZGdxd2Z5azhkc0dtY3BaUE8vYVdFRWtXZjl4?=
 =?utf-8?B?R0VreHpNNWV3MnN4TERzVkF5TlRqa1lCd2lveTU0QWVLbFB5aE5VR1VSanB0?=
 =?utf-8?B?OGVteTJtUUlTU21nT2pVVEVqTnJ3Skk2MW9nSVpuenozcVNseWVobk9nRW9j?=
 =?utf-8?B?Ny9uN2lYL3JoNzBhR2VxME14K0tpbDlxeEJoRjdHYWpKUHQxT21jUUxOYU1G?=
 =?utf-8?B?S21rZk5oUzBYMEtkY285dFNmdW5VZVVxamRYdFh2YUwycUpHU01CNVliRlpr?=
 =?utf-8?B?Q0RwOEQ0WFdOMGt5QmJTbEtlZkJIM1pvanJvNzdwTG1wYXF3SHFlblZPVy9B?=
 =?utf-8?B?cGdPR2tVc253N2pNdCs1eDY4b3ZrVGRjKyt1a09JMUFtS3Z2NTRoNUF0ZTNM?=
 =?utf-8?B?Mm5VYjFCMlBITGdHWkRDU25EM0JYNmV3UkE3Um55NzVTMUpTSXMydDVvTzRr?=
 =?utf-8?B?T1g0WDRLdEY0aVR4Z1B3eU4xUHg0K1QvTWJaVU9tbWg3VytWSzM4NXp4ZXh0?=
 =?utf-8?B?RHdwVUFtcEdvWjVvcUd3d01Kd0J0TUh3cnNtZHFzUkRRUENCNXhYYzNsQ0hi?=
 =?utf-8?B?UDVQVFV3SlZaNXZEV1dGU1BjcGxBbExxdlFWOTNEMVFsbmk5Wmc1WS9TS3NL?=
 =?utf-8?B?bENUSzA4NFF1Q0hJWG5iREdxMUEvaDJoY3hidURPU2djcFg3OEtqR1BXclNa?=
 =?utf-8?B?YUc4V3M4LzFqR1Nzb3VCSlBPV1JBRVMxY1JvaXFxZWxBYnFwNHlsemJtSjBG?=
 =?utf-8?B?ZEg2T0pEWjNFVWR6MlpnOEdZUzJIMHpzd0lTd3hZcVVGRE1KVGUrYTJNSnRD?=
 =?utf-8?B?enFVZ1paejRuMUtKdXMwSGloRjJoeUVTN1dIYmtuY3hhenlvOGNmRGFXamhW?=
 =?utf-8?B?MDBCejczWFF1ZTVYcVAzM0plWXhEeFJLbWsza2hIQ2djbjJTbmE2WEp4MmFX?=
 =?utf-8?B?cHFvRjB5UHZZLzJLalB3Qm9vUGRNZnRkc3BVREt5Q0ZZTFhOTEZtMkFxblZI?=
 =?utf-8?B?eC9KZE9aRDRjaVY5Z3hnY3lnOHJpQ2MrMmk0Q0pBbzliUzNtZUd0ZEM0dnVC?=
 =?utf-8?B?emFldTdtandJTm84SkNySHVjVUpDQlYzc25xOVdQYjdaeTQwenZHRFBBTjQy?=
 =?utf-8?B?TDdDMkE5aDJrRU1DY1QzRVJTcUdUV3RXR0ZnZ2hMeE81MVYrNzF0MmJmb2FR?=
 =?utf-8?B?aWNiR0lKTmYxZzEwMEJPYXlDWEIzaERaYWVnTnd2UlgyaVdNVGxnaE5BbHBn?=
 =?utf-8?B?Rll0USs0WEc4Z0VrWEhXQk9QQmFjRldqUXVkcFNmam1jK3FXcld0czkxOFJv?=
 =?utf-8?B?K0QrR0g0RkVTREJja3BlZEMrWmQ1MjM2L2lrbHF0d2pWZzBROWZxcmh4ZHNN?=
 =?utf-8?B?bDBYaHJjRkk1eGs2dnZTOW1ZRzlSWEh2UW5HTThRTFZ2SjJmSnk2MFBJWkhE?=
 =?utf-8?B?MlB1eVloSndaM0gxaTRuSHJDYzR0d2oyeHI4TlJmd04rc0wrb0FQQmZNYy84?=
 =?utf-8?Q?jh3CU4r3ieF/BN0K3b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e926ee5c-0d31-4053-95b1-08de752e2177
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 11:56:52.3340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUviWY4a0jONOoKrPn8yzqN1owVpaOR7ZI7f8LI6004tulK1KvjGHbwnwDsh2MGoQ1ls2kqgkXuo9y+R/gws2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32229-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,arm.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,nxp.com:email,nxp.com:dkim,PAXPR04MB8459.eurprd04.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0A8C1A56DF
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaW5jdHJsOiBpbXg6IFBJTkNUUkxfSU1YX1NDTUkgc2hv
dWxkIGRlcGVuZA0KPiBvbiBBUkNIX01YQw0KPiANCj4gSGkgUGVuZywNCj4gDQo+IE9uIFRodSwg
MjYgRmViIDIwMjYgYXQgMTE6NDYsIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToN
Cj4gPiA+IFN1YmplY3Q6IFtQQVRDSF0gcGluY3RybDogaW14OiBQSU5DVFJMX0lNWF9TQ01JIHNo
b3VsZCBkZXBlbmQNCj4gb24NCj4gPiA+DQo+ID4gPiBpLk1YOTUgU0NNSSBmaXJtd2FyZSBpcyBv
bmx5IHByZXNlbnQgb24gTlhQIGkuTVg5NCBhbmQgaS5NWDk1DQo+IFNvQ3MuDQo+ID4gPiBIZW5j
ZSBhZGQgYSBkZXBlbmRlbmN5IG9uIEFSQ0hfTVhDLCB0byBwcmV2ZW50IGFza2luZyB0aGUgdXNl
cg0KPiBhYm91dA0KPiA+ID4gdGhpcyBkcml2ZXIgd2hlbiBjb25maWd1cmluZyBhIGtlcm5lbCB3
aXRob3V0IE5YUCBpLk1YIFNvQyBmYW1pbHkNCj4gPiA+IHN1cHBvcnQuDQo+ID4gPg0KPiA+ID4g
Rml4ZXM6IGI3NTU1MjFmZDZlYjIyYWMgKCJwaW5jdHJsOiBpbXg6IHN1cHBvcnQgU0NNSSBwaW5j
dHJsDQo+ID4gPiBwcm90b2NvbCBmb3IgaS5NWDk1IikNCj4gPg0KPiA+IE5vdCBzdXJlIHRoaXMg
ZGVzZXJ2ZXMgYSBmaXggdGFnLg0KPiANCj4gSSBjYW4gZHJvcCBpdCBpZiB5b3Ugd2FudC4NCg0K
WWVzLCBwbGVhc2UuDQoNCj4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiA+IC0tLSBhL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvS2NvbmZpZw0KPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9LY29uZmlnDQo+ID4gPiBAQCAtMTAsNiArMTAsNyBAQCBjb25maWcgUElOQ1RSTF9JTVgg
IGNvbmZpZw0KPiBQSU5DVFJMX0lNWF9TQ01JDQo+ID4gPiAgICAgICAgIHRyaXN0YXRlICJpLk1Y
OTUgcGluY3RybCBkcml2ZXIgdXNpbmcgU0NNSSBwcm90b2NvbCBpbnRlcmZhY2UiDQo+ID4gPiAg
ICAgICAgIGRlcGVuZHMgb24gQVJNX1NDTUlfUFJPVE9DT0wgJiYgT0YNCj4gPiA+ICsgICAgICAg
ZGVwZW5kcyBvbiBBUkNIX01YQyB8fCBDT01QSUxFX1RFU1QNCj4gPg0KPiA+IEhvdyBhYm91dCB0
aGlzPw0KPiA+IGRlcGVuZHMgb24gKEFSTV9TQ01JX1BST1RPQ09MICYmIE9GICYmIEFSQ0hfTVhD
KSB8fA0KPiBDT01QSUxFX1RFU1QNCj4gDQo+IFN1cmUsIHRoZXNlIGRlcGVuZGVuY2llcyBjYW4g
aW5kZWVkIGJlIHJlbGF4ZWQsIGFzIHRoZSBkcml2ZXIgY29tcGlsZXMNCj4gZmluZSB3aXRob3V0
IEFSTV9TQ01JX1BST1RPQ09MIG9yIE9GLg0KDQpJIGp1c3QgZ2l2ZSBhIGJ1aWxkIHdpdGggeDg2
XzY0X2RlZmNvbmZpZyArIENPTVBJTEVfVEVTVCwgbm8NCkFSQ0hfTVhDLCBubyBTQ01JLCBubyBP
RiwgaXQgYnVpbGQgcGFzcy4NCg0KUmVnYXJkcw0KUGVuZw0KDQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
DQo+IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==

