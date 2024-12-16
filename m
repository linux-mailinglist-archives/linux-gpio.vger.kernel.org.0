Return-Path: <linux-gpio+bounces-13911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B8C9F2F1F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1861885A05
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAB1204573;
	Mon, 16 Dec 2024 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="L6sHYQMC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2088.outbound.protection.outlook.com [40.107.103.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A49F204097;
	Mon, 16 Dec 2024 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348436; cv=fail; b=LWVz6X8Fjc8vB84CqhKf2z4KDYy3hmj5+/7zkjtISwCdSerlLHPAtYCefPQQFUBRya+DwaYFO6cxI0r3NPT92RDB6I0uxTigTXimzAOlVxzbmMUxiueuGZ1ysyeuNCpWd1XPhYbkWL3S709gsZzgPIF0M98KYegMMahv47opD4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348436; c=relaxed/simple;
	bh=mbDLynGIcFmvotPvii1IuylGlhNPf6CC42FKU1HYbbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fcQ6SdDt5bVFekBiWbqOkg30c8r0R3LDbJRUKeYORInUq5ruZ9mrjbKNVP7H/L2YJbItgLZoRHtqtcCjJne1Hg2uhczzyJ0IgexhhgrkB7hvOBpzV4mkKrIkQnCwskFeuNZ+3JRT4IL/ttCQMdOt+hIG1Pbmu1YVlbhrKmlqcdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=L6sHYQMC; arc=fail smtp.client-ip=40.107.103.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn96nzJMhawW0wBH2fWpCgdnl+JpkW14CwZZa4akuyLYXAfYnfXd5Q3xa+yXFEaxlexvCYWWUrEqjvl6tYtgZqcpaxSPNkYHARLZNGv5Uqrs6H04PQSa/pdRbFmESLJ67gq41m0hg1GFNuX6KNwpM5pY0aBEkS2xfDVXt8OWi8BhNfsL19ppbiyUdUTnO0H0GHP2C0TmoC10RkDoxtpKrM2mqIiZo2OXX9RC48PN4js7bcOMr/nb2uqc1i+KchyOU/l8PNbSq/Mmqdy73ENRljT3gmOVhh04fZsY3vh1/KOmVjz3z0Y52Lv0mTasxrdyzIy2eWF/HiZYAmRPwkoQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbDLynGIcFmvotPvii1IuylGlhNPf6CC42FKU1HYbbE=;
 b=r5Npto1hYcaM+q3/JFML2ABZiPe/mJNmDUajOXFfdxFnaemWPDm+0uwpowBqREw1AYAiResSyDG6PwIGb8O4/tHNLYsmY8esyc5qtozbwNV8x86hBCWjmEuCUXix/hJJlROdDBA4vchYFvv1j1XAqKj5pKS0Nkpsv/bm/yazfUfyq1Z/Qe1Qd0nGfrBlxdQv3FGXB6kb3/dTnKaGUAE1PY2jHrF/JccQChmKDPwJpx4JrjvOUByem0FNpNToDS8UHmahG+QGB3qsh6mPes8XV3tXEOt+nJohvlHI9mleRjrW4WcoAeKeza4hnoR5aTRCrrmHUQ+eBQENgcm/f28v/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbDLynGIcFmvotPvii1IuylGlhNPf6CC42FKU1HYbbE=;
 b=L6sHYQMCj5loezDN+BkGBCahCVFnwptSRt3fzh0Yz5qpALqact2bi1JIEN/sYocMGYapIdY39HeJYzG1KBME9zMGQ8h2auXiqK155PIisu6Jnr7gCp94PQDTmu1vMp0KCGUw70Uj4a/wdxyYYCmMb1y4YAiJ20wN7c6gvskz9fGl2SjCVtN7TYG75EsIMLMEROCHE3rKxC3J7SwpbOCjd4mC+GEqV++JB9XG+cDaz3o5nu3Dm1nlb9XK2gpG0qJNB6dSClWGkXcArjfET6VRVyy9ju65iQSHkLYlA9yNq4ecvjigh7SefDqkFahRjfxoBy2fRQt1rdXAsBzztNmq9g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB6078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:535::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.11; Mon, 16 Dec
 2024 11:27:11 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8272.005; Mon, 16 Dec 2024
 11:27:11 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Topic: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Index:
 AQHbRaJCThPj1tY640qXcJUSCr5fNbLkJk8AgAADvYCAABgWgIAEY40AgAAld4CAAAR4gA==
Date: Mon, 16 Dec 2024 11:27:11 +0000
Message-ID: <af9d1d0a28b4f2c6a341f45f7f5e29247deb47e7.camel@siemens.com>
References: <20241203164143.29852-1-brgl@bgdev.pl>
	 <20241203164143.29852-2-brgl@bgdev.pl>
	 <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
	 <0bf97a477f1c547b960c63607395b82d92986ef3.camel@siemens.com>
	 <a175fd56-c21b-46f5-bd0a-ccaa7c0f3efa@gmail.com>
	 <828da89cff6dd2c49df9af6131aa3b43675abc87.camel@siemens.com>
	 <72c52d8a-b0f2-4767-9e8c-ce869d203d0b@gmail.com>
In-Reply-To: <72c52d8a-b0f2-4767-9e8c-ce869d203d0b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB6078:EE_
x-ms-office365-filtering-correlation-id: c3489e39-18d7-4e31-028a-08dd1dc4953b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDhyUzlvazUrN3grcnJMaDdZMUQ0RXFRYllmdnBWZVhKY2lOVzZQTVR1UWV4?=
 =?utf-8?B?SDluYVZ6ekoyeGhmeDU0dTR1UHoyUzM1M1pDM1RzUFVmSEZ5Zk5pZHRSKzQ4?=
 =?utf-8?B?Y2gvYlVFMzZuYWg4ZW4rbmViZDl5M09HcFhMVTJhQWl4Z25BNkRNdmI4dGhG?=
 =?utf-8?B?RXgxUjk1K0xiZjBTQnJRekJwMDhTeGZ4N2gxQnlpYzI2NVIyZmJmZHB4VmtY?=
 =?utf-8?B?MDFWYkRsTWcyK2VEQUMwSklZREV0K2dXZW9NSHpDMGJXRStOZnV4bmkySlZV?=
 =?utf-8?B?T0dLKytuRlIvRlhMTlh6dVVkajlJbHdhMGxtcFpGZlhCUWpNR0YzRHFiVWVG?=
 =?utf-8?B?eFFPUWNjZkNDVGtRL2J4RWdGeUxvSDBLdEgxYXZqeVFBTjdyLzFuQzEwSlcw?=
 =?utf-8?B?OWZsWnJ4ZTBBWWdoNEt6VkZHWThHNDVWYnpTMWl1RUc2ckEza1BTb1BWZnVF?=
 =?utf-8?B?Ylp4RUVrZzBjUkdZc3F2cU9ocjdCbW8yVy9hK3ZjUHF2QWd3S1ZoVTVoQTNs?=
 =?utf-8?B?YUNxRW1BVWhCM0RQZHBLNFhiYy9NWVlnNGZhdjAzdm1zMWFUNHZvT0RxMTZi?=
 =?utf-8?B?UzJHemlHRDlRbnZnU3pJMDlWa3NJVlN5ZE9WWnFsbVNlUCsvbnpOQlZ2bVBr?=
 =?utf-8?B?NjBCYmhENmJIMEhMRitqaG5ONTB3VEtsVklqTkFVM1NpRXRWMDRESWhUakVC?=
 =?utf-8?B?ZE12Qk5GeUJkM0FtNGdUNmJQZVIwWXFISE1ja0JtSmdWSFVzNm9SYTllZTFZ?=
 =?utf-8?B?Y1RveFY4SEoxRGRCdVd2MHN2OW5Bb2dNZzQwRW54dlRpV2tRV2JlUTZod09Z?=
 =?utf-8?B?aGhsSVhIbkFRdFNjeUxHTjBmb1hRdU5RSzJFaUNmOWdTc2VZbXBDUmJRK3hw?=
 =?utf-8?B?aTdiNTNlMmdOMnZFYVhpQkJqdktnZ0VSR1FVd281cnN6V1haVzNpS3hHaXhH?=
 =?utf-8?B?V2ppeGd0aTk3OGgzb29JSWdQejdwTDNaSHFoV21wRDBPK3daNkJ3a0tORXkw?=
 =?utf-8?B?MnFySWVKM3dnMFlDcmZwMm52Y1ExcnhhcU0yWm1rS0ZUWWJOc3UrU2dQVWky?=
 =?utf-8?B?ZkpJVDBsWVI0TWluRkQvWGhNTm1KMEovdTIrWVFKRTNCU1JqbHNPbzNrN1Ns?=
 =?utf-8?B?L0ZZVHNIRG5hdkdxdlB3cElScC9INkZQckIzd3Z2aEw1b21LMnV3S2ZhSFhl?=
 =?utf-8?B?Ui9XeEdRKy9qYlhjVVhHSFhOb3hNRkJHY1JBSHJPUG5lV1cxS1BBcHUvZUZ6?=
 =?utf-8?B?VHNKcGh5aWp2UHlCL1gyakovOVRiOER5ZWNRcVdMYnVJODVPN3NHcUVieVEz?=
 =?utf-8?B?eVJGWldqdmNiMWxvMmJwcjRWS3RKVDdMcjBZSnVsRUgvWUJJVDhvaXhsc1dz?=
 =?utf-8?B?ZFZqQVFOeXZzMVcwL2gwRmZNUnMrSjlvRUNoQ2VieVpMdko0ZnBBQU5nT0Nn?=
 =?utf-8?B?QkR6NW9VbzdEMkttek1sRUNwYkFuaFljRGZ4eC9VNGlwVTV0NUhUQVZKWC9k?=
 =?utf-8?B?eUNReEsxSjV1WHRVMnlTSmVzMmV0YTZ4SXVPMG9DRldMSklpb0kwSFdyaFhm?=
 =?utf-8?B?TXBlWG5OTUdoMjhCK1o5TERkRklWZ3NMM1VFbUtBYWpKWnlBNmZTdk1RVTN2?=
 =?utf-8?B?TG1xRTYyejFTSW1KT1Q1bFpBVzhaaG5IMEVwZ3c0aFVPc3hDd1NENlFSZzE4?=
 =?utf-8?B?eENXKzNHbXJGbWJ4ay9hemRyR0c4dlM5aWk5Wnc4K0ZLaW1PajJzdDdqUXp5?=
 =?utf-8?B?dWM2Rm5sRER1KzI1Ym1RNUc0TkNnZzZvUzY2VzB5dnlmVGNvblB4VnpiTEJX?=
 =?utf-8?B?eGFlVER0bUN0VGVmUnh6Njh6cjJ0YVVTVVR6Nk4wNVBwbnhMclFMSnBqMjA3?=
 =?utf-8?Q?IPICkdmVt7nhL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXV0UHhCeGpjWGo1MUllU1pvYjlBUWthakVVbkRzdEo5RmlwV0VVZFR4c3BN?=
 =?utf-8?B?enkrSlBzQ1kwYlV0MkhYcVN2T3JCMkJJeVlZcjl6bzAzeDBJMitlSWhWQ2RN?=
 =?utf-8?B?ZFNOWTFhNUdYaTBiMGNxZk1yY2RKYXJUV0hFRXFpWXByM1UrQjc2OEZQREw1?=
 =?utf-8?B?c1BpQzUyYlZoMWlpaEpyY09pK1FKUTJoODA2VVJHeXg2VU41NVl2elhSVXd0?=
 =?utf-8?B?Z3J6NklIc3FRWks4STFQbWpoLzBaV1FicGNLS0ZiNVptNVBxdUFSN2FOY0hU?=
 =?utf-8?B?L3IrdjZueVdWRjlYQURERDI0VEU3YjE1N01wVTVHM2l3RTJQUmZXQVBibXFu?=
 =?utf-8?B?cTFIazc5RG1JSVljNmZnU0tvaERLVWRZcStGeTI4aW16TytkVzFDNmpkVWk3?=
 =?utf-8?B?Ym9VaUhiTEFIYjVqWEI0TFY3RlNOclR5dFRXVmNIVTRScFNyZzFZNGhlTG41?=
 =?utf-8?B?cU15ampIazgva1lrQVo4alkwWTl0UlQ4bjA4S1FFVEtrWG9KY1gwWXFydXB0?=
 =?utf-8?B?RzkwUUV3UlFMQ1FNVVRxZ29lZjVUT3JYTU5UK0hLa0xqMzVCWjh0WXJWUzRt?=
 =?utf-8?B?VVJhZm9ZYXI2OS92ek5naDZuNFRTT3BpSUV3S2VpY1l1WjdsRFVKU2FGdjkx?=
 =?utf-8?B?SnM0QVJkQURNZVl2OUVLSldFNnlER2ZWT2tucmREQW0ybVZ2alVUZWJSU0Fj?=
 =?utf-8?B?NW03ZitLdkRyNndJMjJTV2ZOQjRFS3JQcjhvRStXazVnMkhScVphcEljc3pE?=
 =?utf-8?B?YWlYYW9NQTV1V1NpMVVONDh1azlNeUdteUtQRjdOZlVlaEEya0g5bEdpWkxO?=
 =?utf-8?B?MVUxdTkrYzlPeGRnYzd5NWxrMWg4Y05oQlVwYmNncDFBdjJOeGg4d1U2eUd1?=
 =?utf-8?B?SHlxaXhtRkJvQ1BTRWh2U0pwZHhBYVdyWHM3MGtWOUN4TmZGeWFZZW50Y1RR?=
 =?utf-8?B?VDAvTG1XZnZIY09Ba3JHWGNBZWpVb1Bvc3hRdzdRNkc5UTlWRDhwWm00Qll2?=
 =?utf-8?B?NlFjdHNsbE1kQkNOVDZRN0NmZGRpTDNRdUhkM0NpQVhFN3V3NnpTUzRuQ01T?=
 =?utf-8?B?SWRxa1kvL2dzUlRSd1dKVEE4T3JGbFhUUkI5KzFwRUtYbW1uamNQQWg5YXhE?=
 =?utf-8?B?d2dzQU1zTnRBSXVpbUEzUkd1dGZTcHEvbUpCVnZvSzA0Nmc1SmVsNXcranRq?=
 =?utf-8?B?OGNTWmZkMG1sdi9Wdk1CSGdJajNMQXUvOUhOU1JSY2JKKzk2c3V1QVF1Yy95?=
 =?utf-8?B?L2pDTU5tWXpKeDZFcXRXZW1YUXN1TGc1MHJjRVoxM1g0WUF2TzdtdEhCZStz?=
 =?utf-8?B?TUJySWpmZjFBbkZlK2RqS1VPMUNMYzRDaWVTcU8wTXhVejFUUVJNTEg2WUlY?=
 =?utf-8?B?U0RjY0pxaGo4cFVpMURLWHpwNTFEZ2l0UWVNVFh4VWtJTUtLWk13SHBaZWsz?=
 =?utf-8?B?NFFSSkNBNkYyeXJnRVZRS0oySStwR0tobFFkMVBsSFh5dGVBZGtoOGdLTllM?=
 =?utf-8?B?UUJSeWdHN0NqN1k3Wm54dCt5MnBuQzFWYzZDL05qNkhVQ3JUZk83YnFJbWc1?=
 =?utf-8?B?eEJCazg4aEE2eGgvdC9DMm9QYk82MzlWeC9Jbi9EYUZ1ZnQ0dzhIcmpadWxs?=
 =?utf-8?B?QmVNSVYxblFFUEZ0YU9MZXdRb1pxaU5GcVJRbmtRcllWSXU0TkVUMUpmNHhS?=
 =?utf-8?B?RWgzQ29ucnVoRUs0VjZJMitUb3Z6N0x2RzZxRGRyQlJlMUdNT2dLYTZ2TG15?=
 =?utf-8?B?cXQ5cWtueUpyYldTZmFKU1ptbFdTZ2x0UURWSllVZ295bXltWFp6b2dVdnR5?=
 =?utf-8?B?Y09WTUl0TzYzNEZJYStUWm84ckNSNUtRQ2xNNjVWV0tlNWxwVUhMbG1ZNzgv?=
 =?utf-8?B?cEk0TWJHMjZhVWZvOG9zc28vZlZJdjU1UU5wN0x5UXBaZ2l5WnhlS2xZTjVR?=
 =?utf-8?B?UVVhRDB0d283NlczT2pQRFFFNWUxbE1odHk3NU9JbDZWTXVBNlBKc0x6OEpK?=
 =?utf-8?B?UHpSLzFWUS93bWNXellnSTFrci81d1RTMFJLc01EMk5DMzBUVWE4OVU3VCtJ?=
 =?utf-8?B?WnRhWXZlVG9reGhqMmVDRzRaMzNiSUFZOFV5eG1FQnlpa3RUb2Y0R29Gekhr?=
 =?utf-8?B?YXBBU3dTVFRmSWVqZDMxYWJOayttWWVCSHhqektwMW1BUndqMkhXZ1UwLzBi?=
 =?utf-8?Q?ffagg0vRDr6Lpje0RcVuODc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F76DE1826C1D0C41B2919CCEB5265E34@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3489e39-18d7-4e31-028a-08dd1dc4953b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 11:27:11.0318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqZanQ7rEuu6MgJBledb/0jnWGFebjLpl+1RdKp7EMWgaDDUjecg+MjWB7XEwTUOAYpg8fzuXkfzqZkl3w4785iiSbWjcyA0Xd0vM8LLT8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6078

VGhhbmtzIGZvciBxdWljayByZS10ZXN0IE1hdHRpIQ0KDQpPbiBNb24sIDIwMjQtMTItMTYgYXQg
MTM6MTEgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+ID4gPiA+IEZyb206IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gV2UgY2FuIGRyb3AgdGhlIGVsc2UgYnJhbmNoIGlmIHdlIGdl
dCB0aGUgY2xvY2sgYWxyZWFkeSBwcmVwYXJlZCB1c2luZw0KPiA+ID4gPiA+ID4gdGhlIHJlbGV2
YW50IGhlbHBlci4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiA+ID4g
PiA+ID4gLS0tDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQm9vdGluZyBhIGJlYWdsZWJvbmUgYmxh
Y2sgd2l0aCB0aGUgbGludXgtbmV4dCBmcm9tIFRvZGF5IGZhaWxzDQo+ID4gPiA+ID4gKG5leHQt
MjAyNDEyMTMpLiBFbmFibGluZyBlYXJseWNvbiArIGRlYnVnIHlpZWxkcyBiZWxvdyBzcGxhdCB0
byBiZQ0KPiA+ID4gPiA+IHByaW50ZWQgdG8gdGhlIGNvbnNvbGU6DQo+ID4gPiA+ID4gDQo+ID4g
DQo+ID4gTm8gcHJvYmxlbSEgVGhhbmtzIGZvciB0aGUgbG9ncyEgSSB0aGluayBJIGtub3cgd2hh
dCBoYXBwZW5lZDogSSBzdXBwb3NlDQo+ID4gaXQncyAicHJlcGFyZWQiIGNvdW50ZXIgdW5kZXJm
bG93IG9uIHByb2JlIGRlZmVycmFsIG9mIEdQSU8gZHJpdmVyDQo+ID4gKHRoZXJlIGFyZSAicHJv
YmUgb2YgNDRlMDcwMDAuZ3BpbyByZXR1cm5lZCA1MTciIHZpc2libGUpLg0KPiANCj4gQWguIElu
ZGVlZC4gVGhlIGRlZmVycmFsIGlzIHZpc2libGUgaW4gdGhlIGxvZ3MuDQo+IA0KPiA+IA0KPiA+
IElmIHlvdSdkIHN0aWxsIGhhdmUgYSBjaGFuY2UgdG8gdGVzdCA2LjEzLjAtcmMyLW5leHQtMjAy
NDEyMTMsDQo+ID4gSSBiZWxpZXZlIHRoaXMgd2FzIG1pc3NpbmcgaW4gdGhlDQo+ID4gImdwaW86
IG9tYXA6IHNhdmUgdHdvIGxpbmVzIGJ5IHVzaW5nIGRldm1fY2xrX2dldF9wcmVwYXJlZCgpIjoN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jIGIvZHJpdmVy
cy9ncGlvL2dwaW8tb21hcC5jDQo+ID4gaW5kZXggNzZkNWQ4N2U5NjgxLi4wYzMwMDEzZDJiNDgg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncGlvL2dwaW8tb21hcC5jDQo+ID4gQEAgLTE0NzMsOCArMTQ3Myw2IEBAIHN0YXRpYyBp
bnQgb21hcF9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gwqDC
oMKgCWlmIChyZXQpIHsNCj4gPiDCoMKgwqAJCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2KTsNCj4g
PiDCoMKgwqAJCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiA+IC0JCWlmIChiYW5rLT5kYmNr
X2ZsYWcpDQo+ID4gLQkJCWNsa191bnByZXBhcmUoYmFuay0+ZGJjayk7DQo+ID4gwqDCoMKgCQly
ZXR1cm4gcmV0Ow0KPiA+IMKgwqDCoAl9DQo+ID4gwqDCoCANCj4gPiBAQCAtMTQ5NSw4ICsxNDkz
LDYgQEAgc3RhdGljIHZvaWQgb21hcF9ncGlvX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+IMKgwqDCoAljcHVfcG1fdW5yZWdpc3Rlcl9ub3RpZmllcigmYmFuay0+bmIp
Ow0KPiA+IMKgwqDCoAlncGlvY2hpcF9yZW1vdmUoJmJhbmstPmNoaXApOw0KPiA+IMKgwqDCoAlw
bV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+ID4gLQlpZiAoYmFuay0+ZGJja19mbGFn
KQ0KPiA+IC0JCWNsa191bnByZXBhcmUoYmFuay0+ZGJjayk7DQo+ID4gwqDCoCB9DQo+ID4gwqDC
oCANCj4gPiDCoMKgIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgb21hcF9ncGlvX3J1bnRpbWVf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gDQo+IA0KPiBUaGlzIGZpeGVzIHRoZSBi
b290IGFzIHlvdSBhc3N1bWVkLg0KPiBJIHN1cHBvc2UgdGhpcyBzaG91bGQgYmUgYmFrZWQgaW4g
dGhlIEJhcnRvc3oncyBvcmlnaW5hbCBwYXRjaCBhc3N1bWVkIA0KPiBpdCB3YXMgZHJvcHBlZCBm
cm9tIHRoZSBHUElPIHRyZWUuDQoNClllcywgdGhpcyBtZWFudCB0byBiZSBhICJmaXh1cCEiLi4u
DQoNCj4gRnVydGhlcm1vcmUsIHRoaXMgc2VlbXMgdG8gYmUgYSBmaXggdG8gYSBoaWRkZW4gcHJv
YmxlbSBvbiBvcmlnaW5hbCANCj4gY29kZS4gSWYgdGhlIG9yaWdpbmFsIGNvZGUgZmFpbGVkIGlu
IHRoZSBjbGtfcHJlcGFyZSgpIGFuZCB0aGVuIGRlZmVycmVkIA0KPiBwcm9iZSgpLCB0aGlzIHNh
bWUgcHJvYmxlbSBzaG91bGQgaGF2ZSBhcHBlYXJlZCwgcmlnaHQ/DQo+IA0KPiBNYXliZSBjb25z
aWRlciB1c2luZyBGaXhlcyAtIHRhZyBldmVuIGlmIHRoaXMgYW5kIHRoZSBvcmlnaW5hbCBjaGFu
Z2UgDQoNCkl0IGNvdWxkIGJlDQpGaXhlczogNWQ5NDUyZTdjNTJhICgiZ3Bpbzogb21hcDogZml4
IGNsa19wcmVwYXJlL3VucHJlcGFyZSB1c2FnZSIpDQpsZXQncyBzZWUgd2hhdCBCYXJ0b3N6IHNh
eXMgb24gdGhpcy4uLg0KDQo+IGdvdCBzcXVhc2hlZC4gRmVlbCBmcmVlIHRvIGFkZCBhOg0KPiAN
Cj4gVGVzdGVkLUJ5OiBNYXR0aSBWYWl0dGluZW4gPG1henppZXNhY2NvdW50QGdtYWlsLmNvbT4N
Cj4gDQo+IGlmIHRoaXMgZml4IGdvZXMgdG8gdGhlIHRyZWUgImFzIGlzIi4NCg0KLS0gDQpBbGV4
YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

