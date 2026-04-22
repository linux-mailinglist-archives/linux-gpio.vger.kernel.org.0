Return-Path: <linux-gpio+bounces-35320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMYZIDof6GnWFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:07:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122544101B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3514302A53D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E756324468C;
	Wed, 22 Apr 2026 01:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="HLyyoFEu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023101.outbound.protection.outlook.com [40.107.44.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62192233134;
	Wed, 22 Apr 2026 01:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820019; cv=fail; b=Ojv8UMEZhbp/3tfKo64oiW7TW6QTlhzJSIxQ/19V24Ce2VOkIaojOr53zpW8hLLNb8JSj+pwbxbsUwPOKhcUlF6YzY5LKPZchmXuvfyjPSz8Lw0HJ0JmFVA3NU9UfJp6gZPwpOIGtOGHcg5r71ijmVCt5KIHHgSfXBOwfB2pG1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820019; c=relaxed/simple;
	bh=76vAiwc4Bf6f+cpkBoU5Ude7k+2Jyv/M21JvcRTJHBk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XpKhgbfck7+atnwQhua8FejoGxpL6ZIUD1zK5qFYq+o4Kg1VvZO0hMQJyCP0O/A3b7vnXfM9JbIaTbvXKyGJUgyDNBsPIZSKCfnfPL0wnAW8n+lrgWcrjQetbxoSV5HBWD6z/BwkpFBSJmiMQljoiSE6yC7ImyyGXKNthORQ03c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=HLyyoFEu; arc=fail smtp.client-ip=40.107.44.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx5YNCGZ9e2ebzbpBy+7rzuVzS/BN/0qBujAwkp2gPShlrw3BWcng2T27dwHCSgZ1uDr2KOQmR78FcXXMgg1YtDGJNFNnGtRyMyxplA4WaY1uJ0FXVVnxJ/DPdFN89x3pD5G//j/gq9biQoo0htHEDIOJ9aYp9zvfTB+kf7rfH7Tzlpb9mVWJcZoJyDz9zsURfNBwEPWOb2N8CsGJFdcWhTN8l6YVAnLUnQDeF5t5/YviH9Xmpp0KP3K0C4Az4zprNQ4XS6HIq6QnBSKN0OqSt9RW3zaajnhOGmEcJS1p/Uqsz4TGD6X7gl/kDNnNI2DoKHOsr6CpjmzNAUhTaec+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT+3XuDhs7GULl5YDK7pOHQ5KZP/iSv4ZOfPNIpO21o=;
 b=Y7FA6R8zmZ4JB/3N96Rk4p+lRlsiqZgsYKHJFBZp3oybeXN1R3KiK3zPBE+AYPj8OQuB6KRY4KsBtlcjP/7cueoC89ye7tumNGOuFigvaqMQyk0B8fjreMzyS9UjBHU6oyvIrzvs1OS+WYm99klzyUalcEcwHhe1L1aC/YZXWSwBy5noQceItjNssBrX/k6dK6TB+fsISK53DURgZt+qI7ceXwZOj5vCltLnbqzYBdFRrvHXFhc4FGafprynUS9uumarSbu1Xe52Q0dAK3VgW01WGDECuaKtATjnRmgzeSWx/+Vn0+iUaNBh1CbpgPG/Br3RHFyK8jiM5e37f7Wawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT+3XuDhs7GULl5YDK7pOHQ5KZP/iSv4ZOfPNIpO21o=;
 b=HLyyoFEuUXe2d+R0wnsPrigKzNlSny5Fvv0hUS1RFIPkEpvj/E+kUI63DQ8N6rcxdggYs1VZrfq8RpMym46W0wiK2XZawPLO0yanHjH1cnpm4ElAAcWMVGaOUHQpHANxIStQA+Y5y42+R+x8Y7ajExtbs+6mWIGue2H8PK3/Amp0GE/KDnfynuXJdrp2CINYm6jqt+tVJbwdlHbZRMxWwX6ZxcCd2NLf935/ra5W6dXKHxLIdhrM/xDko2raOvPha/qWjtXaR7Izmn3eOrAkcEH+EHBzWNXoXDYKUK1mBTHbL1YMSj+UE723oCKAN4DiEC+txhxOOhv+zAL7rA6syw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB5272.apcprd06.prod.outlook.com (2603:1096:101:7b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 01:06:53 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 01:06:53 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Thread-Topic: [PATCH v7 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Thread-Index: AQHczXLpJStwR9kHuky/e4RlVSXKhLXp4ZiAgABrV74=
Date: Wed, 22 Apr 2026 01:06:52 +0000
Message-ID:
 <OSQPR06MB725203E4A4D3FBC113AE8D408B2D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-2-d72762253163@aspeedtech.com>
 <20260421183955.GA1448377-robh@kernel.org>
In-Reply-To: <20260421183955.GA1448377-robh@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB5272:EE_
x-ms-office365-filtering-correlation-id: ac4fd618-b9fe-4d23-9eca-08dea00b70bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 SfnlGPe0vR2JpKqaSi5v3t2O3I7MWVozGX1MuvlQSV2dEwDlAlZRuwUvBbBCoeur3W9gfHAVHO3eijQqus8o8Sjq50PxXsfWfTwpeMla+dwFZiiXxFEj4LfJ5S63XPRkTLcZNl3JH7jBhqhs+paBFDop1ZsqGt8uzTXI+/XagoEhJr1EpEihPl1c2CgMjbjYtZ6Hilct73KqGQrsBMk6rRnh1VaqZLkN7ynMYCV0VxBRtN/6phCNxKRBcwkaNJUdBEPR3XsmZHn6/LUJlUfsToRWP39sS7Ouy7QZ1wHTXgD9eyX0K7hPOlpMhOX0eYBYcOxC10/wSQmMevGMstVfbBtizhkXVVDuGM8x+3o2q7aMsWMTAkqt7w+ZXhbuzfz1VGlqjQCpcZirdVziYceUOPL2fs2NDAJwOGfnlpI4yHk4n/fA7oc4YEA0qD0OMJXcosXf7bqSHZGjep2+iQ3geJDmF2VcymiWMGrmcx4evQ0T9bvyAE5bjM2P4Zr4rmov5lmaD7ShhplY+DRon19Ka91qudkiB4+U2MJbhfLeJZZ2qAkPr1ICKaD3Wmmqr2YhOUL85LE6JApbzAnVahYsy8UDaRVve4HUZemtv8XBmFd9LNEGIZxR0A/tjK0g3nHAKN3tf8r3cFE6x4s84T4GThvAN0k7HmvgJrQy2XZVIOAXv1GNvBxkxlqWAR9shERRTHHlLVXqbrd30/gi1VpaFP8OkwiGJtCp4F6fdfsRGQ04aYC8B+KFj1ysJUMk+Lh08c7bCJHQkhHepWBBXOp91LIwrQTkikpAI2iANstZVN0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?/aMN9nBmlCLq5t73G1gnRS9caD7pss+QppBvGyPmc90UsAWsfKGjoH4s?=
 =?Windows-1252?Q?cCPBkFaT09ZCPwRj6xcg13zORdIg58/UklZj2+pmRXBKK3BXGzkEL551?=
 =?Windows-1252?Q?+iycvmJHvQlspOy4vG7fSCA3XZnzBr2R9yHKVj6rF87Yc1q7ccxSXVap?=
 =?Windows-1252?Q?jgygoExBeoAfJBR4uKFu0NvqDWu19rdsmczQUIPe+YBaEOvnX8SkXSxZ?=
 =?Windows-1252?Q?lXjAKkeaxuSInGGHgboko3lif7HbinYJMth+/DGxdh1E3FedJPCAqgn9?=
 =?Windows-1252?Q?p13JsFAikmTke3FAMN4Qex6mm5QMLCi1bxa2LtGDRA5QiG7tYVbavj9Z?=
 =?Windows-1252?Q?X9l/3Klqlsuq8o5+zT257DxPZ58DYAjRcWAtCGhkfrrWn5ZRaViss4Jj?=
 =?Windows-1252?Q?O4628yaWGBY+dQdM8oRsqXdGjYnouqdtndvcM/V3nrzSsUYa6ez7d9OT?=
 =?Windows-1252?Q?mlsNCFJDdFZZKm5h0OWHGRWBDhe1dZiFhJ/tn93V2RgfvoDDbG9UfFjY?=
 =?Windows-1252?Q?3K16cV/BB0pUpP2JvOV9e5+PRhysPNcOQ2pOC1sSNq1DiXmBcK7Rxjrs?=
 =?Windows-1252?Q?TxEiKJMTmoqbTU/Q+5byhx3oHTVKyfleNyhcPLWHYs9HrltE0ExGEiid?=
 =?Windows-1252?Q?j5etkd1TWCmA+tRpZivGeNoGoZiaQYcFCZ1PMDSyrCB1wDg2kU6d4mr4?=
 =?Windows-1252?Q?bgiHQYdxEJQLI3WoIUUWJj5ppriC8yiVv3kQCCcKdGN6zdwZmUn1da2p?=
 =?Windows-1252?Q?P7CJH450wCAdrPkUxUjDrHJBoQrHAJQhhDbmmpTFeLDmpR1TAlcd6Xvm?=
 =?Windows-1252?Q?88zDetkaW977HUhmkhkzrShdtmlcTgB++h+hiESIPTYIh2+OgLFc88O6?=
 =?Windows-1252?Q?bDpiGOv5Li3g6alvgTilap/XniubnJpsVOw119jPV4QB7c+QmhOVSsWj?=
 =?Windows-1252?Q?YV+8GcAaHUMzNvdmC46c7QDsR4JklWZZf6G61ByDO45R5o0w2JqcgvaV?=
 =?Windows-1252?Q?TBZI6kjqLLC4qh4QEzVYmnvfg8/lC8f1uf2JfZlYDJgGVl6O8/vp3wZ/?=
 =?Windows-1252?Q?2Cxkib5xMRiXsJVfyGeUZEuD2y0d4TR/nFeiHBguBWzKKvub3KZv39+i?=
 =?Windows-1252?Q?WKOBTD1DJPAgWgQFSuZv1+KcwhVi95f333HKKDzW7SDiQCJM/JZyziI0?=
 =?Windows-1252?Q?wcBScWwl3pzBESZ400Aj9/EEbB8ffu3xqTNduuLQ+fsDUQQWhTkACxOi?=
 =?Windows-1252?Q?iJYy4YwR3AvvPfcAwEJPUWoRVHZpQ84eKlEwWORANIdGOtYIJWLCm1tF?=
 =?Windows-1252?Q?9WGpd988KtUOlVv6Az0IYJdnJz43fMT1/AwEXr9vei8st1GVC2Ke+p5G?=
 =?Windows-1252?Q?skkqlFRalAIdPm73dkMXraYN4tWUbYP7CmmbJ1FDGc4EUd3NxiyYhsRA?=
 =?Windows-1252?Q?0Bwt6NZ6scAlPdJLUmyJBOHJZxGjwSM/7yPRdZRm3DJeogwA2YHddz4I?=
 =?Windows-1252?Q?LIsiWfqHBvDuqEW/0T6YduBOwnD4AW9lWgnnenVrFEYc7HWe8g2frUJn?=
 =?Windows-1252?Q?Cb42QJH5CUISNeMRoHwsQxO70OrzUsooc5eR9D1FCNDVuAd6pZy4o/5M?=
 =?Windows-1252?Q?319EddphbPuL4U6oNFzDgxlZaFO6f8ayaf8rYCgBl5sWxxjyMPK+Xy3p?=
 =?Windows-1252?Q?sGqFQiTup2C7dX27GE1qxZjU7DfhmI2D4bj39cVw35kcHqWSogA+RUYC?=
 =?Windows-1252?Q?2wOtQRtGeC1aSb3//Amd9TWA2UV0lEAF9kDl/JxyJBboXcL6TQaf1qde?=
 =?Windows-1252?Q?pVkKucTnfoCBs9UcWAgG+S3wE+6/g9Z4kVO3VKH8vU1dFmnOQiyi2L+P?=
 =?Windows-1252?Q?jOR3vR8Lr1BEXw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4fd618-b9fe-4d23-9eca-08dea00b70bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 01:06:52.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLHVn7ujdm02cTMXe8+N9zWHUhVS2164E0c7my1WoB27ihTvAJ32+UALlYHU+Xz+8BVP+4ndQSdcScm/ILDGQCl9lAlCsG+yy1Gve6U8lZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5272
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35320-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OSQPR06MB7252.apcprd06.prod.outlook.com:mid,aspeedtech.com:dkim,aspeedtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7122544101B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > AST2700 consists of two interconnected SoC instances, each with its own=
=0A=
> > System Control Unit (SCU). The SCU0 provides pin control, interrupt=0A=
> > controllers, clocks, resets, and address-space mappings for the=0A=
> > Secondary and Tertiary Service Processors (SSP and TSP).=0A=
> >=0A=
> > Describe the SSP/TSP address mappings using the standard=0A=
> > memory-region and memory-region-names properties.=0A=
> >=0A=
> > Disallow legacy child nodes that are not present on AST2700, including=
=0A=
> > p2a-control and smp-memram. The latter is unnecessary as software can=
=0A=
> > access the scratch registers via the SCU syscon.=0A=
> >=0A=
> > Also allow the AST2700 SoC0 pin controller to be described as a child=
=0A=
> > node of the SCU0, and add an example illustrating the SCU0 layout,=0A=
> > including reserved-memory, interrupt controllers, and pinctrl.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 113 +++++++++++++=
++++++++=0A=
> >  1 file changed, 113 insertions(+)=0A=
> >=0A=
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.y=
aml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
> > index a87f31fce019..215ff59b38ea 100644=0A=
> > --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
> > @@ -46,6 +46,17 @@ properties:=0A=
> >    '#reset-cells':=0A=
> >      const: 1=0A=
> >=0A=
> > +  memory-region:=0A=
> > +    items:=0A=
> > +      - description: Region mapped through the first SSP address windo=
w.=0A=
> > +      - description: Region mapped through the second SSP address wind=
ow.=0A=
> > +      - description: Region mapped through the TSP address window.=0A=
=0A=
> blank line=0A=
=0A=
Got it.=0A=
=0A=
> > +  memory-region-names:=0A=
> > +    items:=0A=
> > +      - const: ssp-0=0A=
> > +      - const: ssp-1=0A=
> > +      - const: tsp=0A=
> > +=0A=
> >  patternProperties:=0A=
> >    '^p2a-control@[0-9a-f]+$':=0A=
> >      description: >=0A=
> > @@ -87,6 +98,7 @@ patternProperties:=0A=
> >              - aspeed,ast2400-pinctrl=0A=
> >              - aspeed,ast2500-pinctrl=0A=
> >              - aspeed,ast2600-pinctrl=0A=
> > +            - aspeed,ast2700-soc0-pinctrl=0A=
> >=0A=
> >      required:=0A=
> >        - compatible=0A=
> > @@ -156,6 +168,30 @@ required:=0A=
> >    - '#clock-cells'=0A=
> >    - '#reset-cells'=0A=
> >=0A=
> > +allOf:=0A=
> > +  - if:=0A=
> > +      properties:=0A=
> > +        compatible:=0A=
> > +          contains:=0A=
> > +            anyOf:=0A=
> > +              - const: aspeed,ast2700-scu0=0A=
> > +              - const: aspeed,ast2700-scu1=0A=
=0A=
> More simply expressed as:=0A=
> =0A=
> contains:=0A=
>   enum:=0A=
>     - aspeed,ast2700-scu0=0A=
>     - aspeed,ast2700-scu1=0A=
=0A=
=0A=
Thanks, I=92ll follow this simpler approach.=0A=
=0A=
Billy Tsai=

