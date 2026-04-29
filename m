Return-Path: <linux-gpio+bounces-35803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKz4EoM38mk0pAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 18:53:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8C497CEB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 18:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E5B30263DE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 16:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BAE389119;
	Wed, 29 Apr 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZQqAcYIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F1330328;
	Wed, 29 Apr 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481590; cv=fail; b=ADdhW0k5O2Yc7sIfnUY1LoD2CX7cJH81dbwUio7scWdV0E9qd8SRIUyW6NAu3Qa/b5aCZMlAixDHDRp8QWA577tkolkQcdDRY/y4AOH+1Abso3nsFZJQSH/tNdVPatKl7hz6ruKMPFlYAWh10Flw1BESmxCgjOz/f3sO+MiGos0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481590; c=relaxed/simple;
	bh=q1XpYl8cmpLGgzSyG4HbGOR7qdLa2JbDEY2LZSDLdOQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kgh1A3XGUOYmyYowubMfxOIitRw14yn0Py8EvDZ78VghA6t8BFf7xj1qNbz+0CIZHzEQy/j2gfR4SZT/tIGe2OtxEeb0j+UKi9yHu39p42vpJWZlQZbjYkbbBALTnIXJ532Goo8/zO3ZHitCvrDUkAPYgrW0WnN5dcqeI0BhDNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZQqAcYIz; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5yR0do+45iaXKwY/6yiFETs+8IxNWxBCs7LD2KB1LM/8+xIBsRduJUyevWBUL3iDuTVtg/xJqSCFCdoXw2IYBVGDAGxX81rbE9IOiEhDAYPjh6sKvk/s8DUJMEAzto2yRpzeq+wk3xgiba1IBBFEMlTQm7zyRhmPb2SoPMaIckS336FmH6t85P2eGRdcsv9SXGPkAHLF2RMZ/W88UQCjwYq5sj+x/WxYorMKuBFXSRnHka0/f5WToJk/uOOemEp7CZLkocFiZ2W5yJhm0xOhygjMRvlat9SfSx1Z9zG1/2LDmAX8vZPI8i5aEOMbtmfdmOJLpZKBFJSVxaxx7PoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQG/jZC96L0E/Ud9G8CTygv7/TE13mn73WHCdycXfr0=;
 b=x5LIjFQ6HJKAszGV5Em9JeaSWIe/zsJYtt3sKw8TANdBXmNAuragXOXk9L8gUkYvPILwD7J9vAPJgUfeX+xOLkUJVyfA+Hqz7BzY891Fv55dVvtWgiYMDPZzNu112ZRWs9lpiuGyooy63offwoJ24idXrDzbq0o726hE+zzB3uV+SClUZduTE69nKOfoKpQz6LcfUfrjUbLHvCad8Ixf7iwmahfFagX7ELdDDk/GZ98xeVZDcmc+E2Kue9CoXXFk16P9pNK2DhXBfB/IQot1div85A/Fwr6OpM+evpEvRrLyAPNafEGMfiPmcgkbwDvgRzil8e7VkDSdVwIm4sJv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQG/jZC96L0E/Ud9G8CTygv7/TE13mn73WHCdycXfr0=;
 b=ZQqAcYIzlFO8pw9e/FkSgnuvqQQa+cYTyth69LUMZsXCqaYXRFNO2XlMNUoAfRHwjBr5EeWNJtYHYKgapjvKl072LjCiodITJCUozg9H8s/GXsWsZ9Y2KS01m/3JCjTkQKah1/mp0jV77cVIleUXHk91q35KazJKR/Fw/JBN7Nh8RcMzjuVVcK7FGc+AQ/DTFY/SYyIXoq/KRZlhBfxOJ5uFqZQ/BdodofnchxNz/+9w4q0qgQCtrKmIX2T4OPWh9GGanNQzV6ds8iEncO10ZZSH72J9IwRSteOIHFOSg9XvW9ZBpOggkPHseo+r5+22dUz/FV0N+ugqH4GtPl5pRA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBBPR04MB8043.eurprd04.prod.outlook.com (2603:10a6:10:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:53:03 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 16:53:03 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc1/ikfclJC7qTZE6i8eHFxM1UMg==
Date: Wed, 29 Apr 2026 16:53:03 +0000
Message-ID:
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
In-Reply-To: <afImuoeHolxGgw3H@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DBBPR04MB8043:EE_
x-ms-office365-filtering-correlation-id: 6bd65968-786c-4ba8-19b2-08dea60fc75c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 dHeMWdZVDnmF99hT1Oab518SXeN6ehgNHb6dwYlHOR3iiYvAnnb6PgODq8JtTrIkKq03abAQbqe4HnD+o1tHnHlb/WGVN4FmmoDf1sfeN5kDVP/yIhcH8hZpAk3gKCpJ+SQOlasidf/EEFCR3Q65jTvwGemRKmyTtToRzOCRe1tkI52WE0EZCFi0Ql7Zz9DeetCsRq17HgkDSqr/16HQ8qKGjBU5/XHoqmbbKz2ViOG5OaZ9k+ZFFaMSSa1/wbnpxEravzi8mA7Edy1GMRBw02IDc/8PC39v/LgWs2UkNIPCZSdxnlujDLlOqccoFbb06yljSQCBuSCmwpKiJO3T9caSWRYxVbtSBsf7OMdFlEPdKVttw9DSrUUyh5gYPrcB6uPIPxve6FWCaf+JxmcBKGnPBjDgHZZKVBdbGowaVabDAcvzM2+SW+fkYEgbmutDcMifXlhtDysAmKKTtSu+owks/fhw4+SQ0gvLhX2ScBkrz3zuwu89cPaQfLZFPRXUb7zti7OfDcKkUsqhAssUho7ne7Hj1/JJOaTqehziyGwVgHIMgmQQ1QbRYhBpX1YkQ96sWg4Vbg0cLJK4aOCEIwoL53lKwT5SL4WLrM51XA6J2+ohWn8esqMkHw7/bzMl2AtOZ+HBt1cbjaY7sk3OL9iKlo/AYvZfoEiizvOMKWFkuBb2EWCmshoyKghaRzvRtcGeW9LsfsdeovCzGzuc4sy5PZau+UJCg0oPFBwtq4SjyRpzO6ma2eOcqyTzT1PRS9l/YZrxisDCIQDwEuxnBdGlRcKArFMy9GP8Ip3GHy0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Omjp0mqMV8RgUvZbX79viuygzWPu/GgqU/IUKyr0ttwFPHexslZmRzYGWPZs?=
 =?us-ascii?Q?63GjAr4iLwfZ9dJD9bHFiA05o7pVkMQOuoodIDiiIL2oCcOT6o5t61a02d81?=
 =?us-ascii?Q?vWH3ZMrrSznbVWfmECHOOSbL0+2VzfjtK2VBSVAhv/f59GpmF9DCQMyvQVJE?=
 =?us-ascii?Q?GP6b5NOJarU36yhndThwri5BDcHZCZTYDO2h9MkTz7+hU6tsfdA+i0qmPqlI?=
 =?us-ascii?Q?vGvSTs0ko8q179Oi63UhSQTN746BgwPBB/iXcRyciSd6hbqjOSpqaEqBY5dW?=
 =?us-ascii?Q?j9waU8SM0uSZyf63jKg+a0A9Nksg1Oeiq0qYC7dkmoz1/ZyqEUbOwQjmIoPW?=
 =?us-ascii?Q?5zIr0n8R7ReBLwOp5vHc6ZVGjfeEBPl0tb9yVWhiuI11tKwujFwqj6dBk351?=
 =?us-ascii?Q?pU8REw/LzYRzc4udTQmvvsC/MJoR4Hfd90o9anT4WiPJnWxZQsdkgwjO1U1F?=
 =?us-ascii?Q?6sa5GVZDNnEu8GZ3YKe2u0c1hn5tk7BA+ZTtsCjsnzQQjEEc/2yCj6OoabBS?=
 =?us-ascii?Q?ml8yyzHmWY2TJ/V/Z7K2O0HM7VGC/SbXaNTnviYl6OllNqi68MXKb33vy5OV?=
 =?us-ascii?Q?XcEDbQneS9GqlbfC81AuMiuwxvKemW+v31IC56TajGS2KQ6sTAhcFN1SwFRG?=
 =?us-ascii?Q?F3qcci0KcO+ewZ0ftERXeV/aq+dpxI0ihhIcamAfQFQOCSm9RJIHo1s0OEsN?=
 =?us-ascii?Q?5vZATILRIZUEJnM4lgVQgqOaqbSaAwYNJy+j0/NB0Z7rUxsz/51RKcZYczxH?=
 =?us-ascii?Q?D656eYXK6VpxLMFrBbVJigzFB9bEU893WS+Rfim6+6m9zx/OiiE9Q1r8MCYx?=
 =?us-ascii?Q?krR8LMqNDP1YKwXbLwv8UYjj4OT057dbOhOFPUr8HXhXVtJxNE0JjxckyIg5?=
 =?us-ascii?Q?DKjPn/9vnBRLC6CLQru4kUSyvaoQueONdIbJBL62bsyaPD1PUnaIuto54pu3?=
 =?us-ascii?Q?9G3CQdGZI3fb4TVhAFnByK8z4C0ehvdCaedxp0hj/UqGAlNxvBsc/ka76VbL?=
 =?us-ascii?Q?6/Lrjq+AnG+hD5BhqSX03e5hK0WjTdWMs3RCWfVG9q1uk+NWAcn03yC3PLgZ?=
 =?us-ascii?Q?aHobz6vfUQV+bKlKAJghe7FiS4tg+O89rKLOdUpZJOdqHtwnIwp16rxUtlbR?=
 =?us-ascii?Q?vygxovI9gSwr4ZwAc3PzlTmbyX2ltnLO9qIMt6+GOpj8pe+3aKwzZOF2qVV3?=
 =?us-ascii?Q?SphnqLgOGOxGcvI3B89f5WdVwIGlxKxzMF3SFXlDE0cPSH+fhZZPv/FSATiG?=
 =?us-ascii?Q?BMaTvii1U/h5tp1J0VYhR235s0S5dKVQwvhtbUaCeiqBuR0K6OA8VtE8TwAQ?=
 =?us-ascii?Q?uOQeNFlBXu0Vd9EQIBU0PpKeG7qrxAxMFCOHdPQ0eJBl5q51OkUHLNT5ucxj?=
 =?us-ascii?Q?CyF3N//L3rgp9sy0SOGH5PSeVFWD6MgdA9P2Xgv1LbWFZdC6ui3vXUqSEJIH?=
 =?us-ascii?Q?xE00t1RJoOhi/Q+HtsozeJNb8umIAViRErsQipx9c4tawkjEtsQHU4mYHe5P?=
 =?us-ascii?Q?9Qr61cGwdxyBXr2i4/QaiP4UhkCSCmQomGyL7D+xBsILwfiMoLzBKzG9/emV?=
 =?us-ascii?Q?hKYzSSiG7+XTExo3BDqLGfoxLuhxjbniSF37Thl5aXfPf/Nb4uOfz5v/SmCy?=
 =?us-ascii?Q?0XfUDfDNqTI9qQ0MPutDvPC3a6Joa1ZrASDqEzF/TQExFre8afTGX+kbBpd6?=
 =?us-ascii?Q?/Mqu2TQGdz2Pc3dy/n5jpxuROoe5KNU/4kzvHc+7/ow/J10g?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd65968-786c-4ba8-19b2-08dea60fc75c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 16:53:03.1976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0L1EbGBo/kmXu546qg6mcp17S50pSs+nNph5ELXA9SQmpRPPrW+cSJmd6amfINty4oquPm+Im/3wfQXidvclQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8043
X-Rspamd-Queue-Id: DCB8C497CEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35803-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,ti.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Wednesday, April 29, 2026 10:42 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonat=
han
> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlows=
ki
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <=
linux-
> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Andrew Lunn <andrew@lunn.ch>
> > > Sent: Monday, April 27, 2026 3:49 PM
> > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > <brgl@bgdev.pl>
> > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > GPIO driver
> > > > > struct virtio_gpio_response {
> > > > >         __u8 status;
> > > > >         __u8 value;
> > > > > };
> > >
> > > > It is the same message format. Please see the message definition
> > > (GET_DIRECTION) below:
> > >
> > > > +   +-----+-----+-----+-----+-----+----+
> > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > +   | 1   | 2   |port |line | err | dir|
> > > > +   +-----+-----+-----+-----+-----+----+
> > >
> > > Sorry, but i don't see how two u8 vs six u8 are the same message form=
at.
> > >
> >
> > Some changes to the message format are necessary.
> >
> > Virtio uses two communication channels (virtqueues): one for requests a=
nd
> replies, and a second one for events.
> > In contrast, rpmsg provides only a single communication channel, so a
> > type field is required to distinguish between different kinds of messag=
es.
> >
> > Since rpmsg replies and events share the same message format, an additi=
onal
> line is introduced to handle both cases.
> >
> > Finally, rpmsg supports multiple GPIO controllers, so a port field is a=
dded to
> uniquely identify the target controller.
>=20
> I have commented on this before - RPMSG is already providing multiplexing
> capability by way of endpoints.  There is no need for a port field.  One =
endpoint,
> one GPIO controller.
>=20

You still need a way to let the remote side know which port the endpoint ma=
ps to, either=20
by embedding the port information in the message (the current way), or by s=
ending it=20
separately.

Shenwei

> >
> > Shenwei
> >
> > >        Andrew

