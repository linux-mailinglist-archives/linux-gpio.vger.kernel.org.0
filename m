Return-Path: <linux-gpio+bounces-30960-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOdeNRETc2lksAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30960-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:20:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1BC70D2A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3974301440E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 06:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C0A3806D8;
	Fri, 23 Jan 2026 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OIhlv61C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00649346795
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149193; cv=fail; b=LojdUlvx/LCjy4i61YiEJBW3G+w+nJOlUSbu6EBH90az7RKLAG8kNxQGvUUhvLQKnHpOTIGLDJKqRSSLZ5G27ZcMC1oeTn4rZ8dS7H7/IJwtoW2gShO5eHmkq+IIUifbdJSqGFLtE0oKc3rkTyH92oLzFObxTX+CJzzDXiOWO6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149193; c=relaxed/simple;
	bh=j5epHkmwrqtSvqg2Zgnp+Pdq8cz3GKwUSdxu0OJ9Wis=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WMje9yAoxSwsYtJDupCzAhT2xhBVVDsFfoX9ileer0gkjdkuOQNJ3tizEf0iJRHq3qVMcEfjPtZLMVf3x6VXp0W/ru/nEADaMKBfxxriWUCMFIA14iQbZyUI815gW7YY/Mq+mQ2QCtM5RG877OQjyvS7nj4dQzMkgggpSE8LFtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OIhlv61C; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqAdkKDn2YUJFfl1tYD5UmvbauqNhENqQeaiQnB9G0rtHMhO8UOb4UzwyD3efYNUmst2/sQ2/1m2K1A7qbt65Pi14Shk1Dt2wdVofDMCy7mgLbounmK4Fl9cts1q7ziq6Pt/ffRGlsLXmrt71cYsJev7m0Yc5ivubaB0FRyZYjGsVG2YKXmvAuApWFsCuBMiaPrZk3X1iJN4yMmpCbMVOf9o7qcqOzzh79VS3TdqzOvn0xLfk64a07GEdvt5cvhg1i3CBbghz8engBld03HP3YFRfJgi3R9MHzRC+EPtgJye3xmCAS+gPugdSKBXzZP7quE2UKJu3bhAITbcBczZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBfUtoDuCcsCrqrZKKzJronxIKPbWJkej0z0u1fLILg=;
 b=etCYdMowR2+0qwRgQeHqLneC1qYsQHsKaB6W1YVhv1srINUYqooQkk2L/MyGsp3t1TxAJ8G0a/03y/yeG/OTmKAzlImjDtQjL4cPA1ru+JQLefx4MvDg5HmlzuPGHLG8Q3/R2ph6RDGwRI0Xvkl31fumIzobKzgiI9i05GEe2M3SSCJ4MfLNwxtE2axn3nwhgu8PGwCn5iC5MNX4hOnwYH6s75+KNqE+zmZElp3ZMESWXOgcsac6iQ8jllhG8Zc2CT5LIfkNaqxnYt0nzUO5Cy8N0e8CiiKDQUp+S0PPtP95/NHuDWSv8FbcfFQVUIk4jQUy2UTomFlKQeqpgDVxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBfUtoDuCcsCrqrZKKzJronxIKPbWJkej0z0u1fLILg=;
 b=OIhlv61CyNoqc/UIxnWdp8bWY+/BrC2LerjV35kMfqTkmcfGWnuVXUzyu/Af3ft608X8ZjUvG0UuOzFXXlvZsId4NXrHtofTZfo9A3oVG0/AoTUEblYDiuDTimGQbAW9knRVEFHI5Cg3m92S5oL5qe2LFIKZJJcw8JHcze4r+1Tms6OLxrhGJXsE3hASpI4MulUcM6XZsM8qmvN1y4lq93XkjIxljjWwQveH/yeBmb26ZbADSLfJ+3HG8pb9z3nN6FQ9kMsr0xGYCwHoGy93hvXT5rFpo85YWelcYckTcG/eSeNdXzjbCfDTBgjppRAIshKGdXfuMnix2g+qkW4Luw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:19:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 06:19:34 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frank Li
	<frank.li@nxp.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Thread-Topic: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Thread-Index: AQHciuSDHNZ2Q5qLAkeEvaIFAF5qgLVfSWeg
Date: Fri, 23 Jan 2026 06:19:34 +0000
Message-ID:
 <PAXPR04MB845967532BD6F03E525320578894A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9994:EE_
x-ms-office365-filtering-correlation-id: b3ebbfb7-e379-4c88-6c9d-08de5a4760bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?22tWQdINWDYNuyHq1GZ/L0tnT2ZB6JksvtJ1qsACbsrmW1Ohw1cMdps9EI+1?=
 =?us-ascii?Q?0akNrvagfYF1roFsSZ1KGlW5lk2TZLHcAg1efRjZ/2F1oUXJ9gIX6q19ye+x?=
 =?us-ascii?Q?xyCYaDle6KswmKZ4PS1+l2XgJkiSwvWjWl9qwpirHS+MZaphEiZlDCsyvTWG?=
 =?us-ascii?Q?H5xlZTKXYYpdoCvMu/6SM7w4bcGudvUFrKh0shjoM/oTdLCvqx9zUGZ8XwH/?=
 =?us-ascii?Q?n+Vv1mazBzsFVO5OR30/M7ujZJSfgk+OHSHyKq3I6healeO+cnF6Wuwfkluf?=
 =?us-ascii?Q?Du88nDO3mJq/VtlJuj+/D7tvg43pNkV/pN72szsFTRtUY0Jcv/e5nEzvMCSo?=
 =?us-ascii?Q?DgMc/f/YavonkdwiMT5QEYRK5BiuGFAeVljyW/wm4vhNV8dysvGKkKQf09en?=
 =?us-ascii?Q?dVrBQHzRA34gADjzAZPYwuNmgCmFCWak5bNeS47eQZNUA6/jtHfg///eGqEy?=
 =?us-ascii?Q?V9HQBJ12QT+W+y7H7ziiPg965M1A2Vk+8oAyu9GjSn9T9xEewla5jycHdRgA?=
 =?us-ascii?Q?U4ijtb0MVlVu22DFX0RomHLzYRgBru/4kGIW6+tYGYRol44zLiZb5qaJ8xDQ?=
 =?us-ascii?Q?MngQyZovmT2ET9bSdjY6vidaquH2iNKT4abLzJ6CeH1gmdjzy4WyUUDSwMmo?=
 =?us-ascii?Q?f1AdiWNg5dJLBGe2ooWUbuOD9nnssA2SuBY1aegjPQmPkaqv2SPysXbsBwP/?=
 =?us-ascii?Q?qbblwld3WFOfELLGp+a3wmBdKTfOcOU+lUuGTwEXy9piy91pgURRW8TBQ+Bh?=
 =?us-ascii?Q?nZz76uGuFTKMsUfMS+VvmOuh50mmy9D8g+NMou2h1b2lRM/DswadxsCWx2iq?=
 =?us-ascii?Q?qBgPhZg8uqV3B/6xm2i3S0B7vL2jTNky9kX8fL8X6g3MJSsZJgE3l9Zikevz?=
 =?us-ascii?Q?V1IKjJG9+dL8rxgXGJZLz3i+aGsM/ubTGX32QdDE7dj9Aj7qeuKgEXZRVzls?=
 =?us-ascii?Q?njLaClzK1ODTuWuH1BQhT70q6WxqtqTmWcek7QsGsNWx+bKpBotRCa+E/LdE?=
 =?us-ascii?Q?dOIMNtKyy5Rh3f4I/jrHbMFhZKUYn7Cnz00GMESKa/+8HaN91X4TSyYmNmNK?=
 =?us-ascii?Q?4cZu7e5zjO9R5FRFJ83DLCmM77jEjRunWH4HQAk3njU8ts2Rud1MNATC6TWi?=
 =?us-ascii?Q?Orf7xtnfBURMkJdLsdSYPSIEQ7WGT8y23bUewUNGI4y+hvK1W1cDGhB36Jkw?=
 =?us-ascii?Q?793wy9qm8w4miUUEVLCiF+aatPg8xUYW9wWmVf8+Q2BnKrfcyTdBfSHWEglC?=
 =?us-ascii?Q?5/vtXdHejpL7AMIXFZIVnlyuxb9VVKacnAY0U4tE61FXG4k1WIETcEHivKQX?=
 =?us-ascii?Q?Tuy59fMdhXLstVDmdkX2Yg/TNRUpzmikbJaGBEfV4q8BNTCCXGKUNv67uMJ+?=
 =?us-ascii?Q?4zVp96nLAECzIwG9/iyxwlWiLcgYsh13VX09iu+GiGSgH2JCmbGgm8J8jos5?=
 =?us-ascii?Q?TT3p1yUno2QqJymbkygpc/SxGeXtC5USeH8a0US0fULD+FvY6E35LH6SfUQy?=
 =?us-ascii?Q?CHhBdgxjpkEhuTtFKNjbW8LAxLBTjIli/6YWd8ud8Cg/Vg/DfjeplVa6VbFA?=
 =?us-ascii?Q?6v3J2oc5rcf4gHqpBz+Ij6y7ijCDAfY/5PaKammMakIp7kRibW/ND0JJ85c5?=
 =?us-ascii?Q?CeVcL04ArMXISowXB5Frb8s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vx71ERmIaTg7bfYv/vy0yLEWmJ+FT234Ps8NZHreot6zx8i6RFMgut7gBDNS?=
 =?us-ascii?Q?joKWXtKELoDC0oHag6UX2gotqiGTr6BwdO89f2YMVHAfKCIceaY+JjqEIlYB?=
 =?us-ascii?Q?ZIA/SWGDzJKBN6a/nZpTkUghPr0+9lTo/h2d3KGd/euqtxlNPKNrmI0SyQJP?=
 =?us-ascii?Q?R1VUlfM+G/1gb6WeBIyzzEdRR049NZfmCUy7W2f2UAteST8047u6eF9dh9NY?=
 =?us-ascii?Q?8IJzQv6A1Sfxh9tqK/WD1vtLP4uVNBTI42o6JSt+KJhknBOCvFDHopgCcBw2?=
 =?us-ascii?Q?0AzPagE4eFC58PUtz3S6C7iXtrXPYLQ/FbKcGxX/JqgCk0dFijMygImO5WBM?=
 =?us-ascii?Q?6yPUKP3YG82wuHslLJ0IFgGOe/UWegaxGUnox1Y07Xao9lRKsBaQXKyaECKF?=
 =?us-ascii?Q?IdvrBqYYly4pD0SGpGTXNt4PdibEfDvGADc+DusnqjlkesLS92AMkXCZbfCb?=
 =?us-ascii?Q?tof+KCAGP5TQu8bV3xxEh3EYZOHTJRYTpNdvHA/KoawfpUL8i+FnDWzlYUE0?=
 =?us-ascii?Q?93ubvM5sqJd6Yb0fnt36/CvSiCnx3x7VMIiIDrLQiR/9tG24rliVoFTpyCHq?=
 =?us-ascii?Q?cWPPMmyliVWkqT5IlYVRFuDSu/DmFksKP59ZS1tUj7xlxMYIlHnU9oMxcYVM?=
 =?us-ascii?Q?ygzlWZrTWDUO5k3VyvieeH3sLU7YDDXLeRjaxPbB9hilB+5UWASax+4F3jho?=
 =?us-ascii?Q?n/XOHZ9F+bqk5E4PwJQVput0BrObGPOHogvbYigjDGJNTDSiAcHC3TMNC16S?=
 =?us-ascii?Q?88RQWY828GvujUf30xcS/Syjx1CBuM5y0IQ62XbnGE90ZoOj2xo669oCPTb3?=
 =?us-ascii?Q?WocGs8ApN6KNXJIlG03RWG3EPDokoM8XMlMteB3eEHNhApvXhcaKFC5tKtbQ?=
 =?us-ascii?Q?uFQ3nlrs7GuASzU2Qu7OYlLRKgIxdAxUsoHKzG4tdaFmhzbzw5Na0UX4yVrY?=
 =?us-ascii?Q?RhQmQg9fEhozTn9KUlhe7oIA4CTX9J6wequKBX+wTdvxgbvEZq4obpRYdZbb?=
 =?us-ascii?Q?TBJyxAYQNoPGu6GxhD6z10R1xAP6QH/ILftNzB0t+ajibGtq4e+5Mfo6dEnh?=
 =?us-ascii?Q?ngTdIcyqW4/CbUufOF9erbOVnqEaIRhmjw+DlNrcbSOKiyRh/eRARc8RWdf3?=
 =?us-ascii?Q?wxQMCVgr6h3HpiBZiNqTeJhePb64wtfD7R0kHTZ19Fp8OFo1wZ1Vc+EaoqCP?=
 =?us-ascii?Q?3JDmoE8xVLAxnDBa6Tja03AXugvxhcTahHINE1XeKqEKyWEf59peTb4AVa3K?=
 =?us-ascii?Q?MVTDnqNOWV3jObfCHpGwIlj96nMOJBY2+s8FSDvGI5EF7B9vWP/M9rxNTHoX?=
 =?us-ascii?Q?Pb0b2wdRAMKBZhOkd5KQXSKtVoYXj6NLzNp0HGRY/giSTlUZJtVnR8OYtfDQ?=
 =?us-ascii?Q?40Ew35Q9CAHjC1upQ7Pf7BV0+aKFM/JyluIdsCdcEIsTCs5jwq0inwdcAW5x?=
 =?us-ascii?Q?EE5MWbGrN6dAj1UPQfR1Mn4TiNUzvuVWVmU7P1RS7PYJXVmN2PvgHXgu4mb+?=
 =?us-ascii?Q?wxvwb1J+2eLjLI3YBk037miBuvVT39gux8WrflEQEciJGml6jUxeh6q32kon?=
 =?us-ascii?Q?VrhjZ8DIVMxFxVkHd0Fq0E6sAC3OTVu1AUBH/mO3kSvLNL245JwpgiGmYKLG?=
 =?us-ascii?Q?xZrPkeV4P/ivTATJU0VlkBfPjx0G/r1sNJjhpe/aippU4o6SZifv4hxElblu?=
 =?us-ascii?Q?Ay4Fc+KZ2mbOBljsxzHxWAe0WblJJuzydE029EMqykGVM1HX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ebbfb7-e379-4c88-6c9d-08de5a4760bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 06:19:34.5247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJherEZnQ/R7cKMVwekEVf4xACIhYyoVMh20d9ED/3tdNBQoyCmSFXzRva5Qz/T7O/c2MW8qUlufSQoumeI8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,kernel.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30960-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,i.mx:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E1BC70D2A
X-Rspamd-Action: no action

> Subject: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX
> platform maintainer
>=20
> Shawn is no longer interested in maintaining i.MX platform, and would
> like to step down.  On the other hand, Frank seems to be the best
> successor for this role.
>=20
>  - He has been one of the most outstanding contributors to i.MX
> platform
>    in the recent years.
>=20
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>=20
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>=20
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Great thanks for the maintenance work done by Shawn.=20
Congratulations to Frank on becoming the new i.MX maintainer.
Great job and well deserved!

Acked-by: Peng Fan <peng.fan@nxp.com>

