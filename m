Return-Path: <linux-gpio+bounces-33890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFiEEQH0vGms4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 08:15:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A712D6780
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 08:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 810C8303608A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 07:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC71359A96;
	Fri, 20 Mar 2026 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="d1YFm8mH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023109.outbound.protection.outlook.com [52.101.127.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564328507E;
	Fri, 20 Mar 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990905; cv=fail; b=B5FIBm/aQ10kGbStyaZ7GZOB1H2lUuN97Hr0n3UDMT2rL3UjTMGKfBX+E4ojZfAcxy8H5PYVOeOmPGvWNUY/lWl+mbLoSge85QdgdhPIE+Z+6yXIyN7Nk1GZ9GSOBbRRpopRpWc4Gw14e3RhmrL75JSYXL+amqu0QYnH4SAZDYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990905; c=relaxed/simple;
	bh=C0rvmYyqaQ48rK72nw8oTKJpOC/zcbC74EmqPpLMeE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T8ySMU3sTZU86G+V8AOLUXSt3PItDl/ch5eEqyz1F6PQKdUoSijnBsUfscmMYX23c+24GDWIOQrD8F2o0bjOR/SeA0ewUdsrOckJLtuxS8JWhMZPxxWGSyaVGY4A7dORjagz4m9pB+3L2SX8aZcMiNh3LMcEl0IpqHRGWf/+nJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=d1YFm8mH; arc=fail smtp.client-ip=52.101.127.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yev4y3jMHc1fF5uHZ1JuJXdtH9IxN19l5TRQt1NtzXjXKE5LV5raChDsHo3iKj+6a0M/PZa7ShcT5sRhlxJLdKS4zWpybcFSUnXX9VbPEtbuCBoYBjgC+6DRTsytw5jsyfTTRr1F4go/vP0GjGGMRdS5Ssm03o376lT8HjuPPuba1gx7cxURo3hXLnazDgpuiZVPm8vflOAjz9VxjXUAM0jqAJ0tNsEYiIv6cRy++e8VuAcaCEMZ4FyD44v7dg3SeevwVpvWHK43kQvSYInnIWbmqwTmgWJztDmbEhR+giNovXXFGHWobN2jrNn1878iFSj8S/VbUpUxz5ewczLvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFYhT+op7r1uuVGfqk/L96fvzJnE+/lErmqGUzlnw3A=;
 b=gY8PIHLA+MTNtOtqi8nOrIRgtxKJiFpXQqe7A4Jed5rGegZZ6o0fILFdnUdMyJ+nTN18OG4kdQYvaf7v0Aq0BBrpGroTNoM+9eqp4JpLJMqoUnAlg/NjJqYLgyDzMdWuDrrM6+bpP6jJfzUDCTrK5DAGhPpQ3qVTBWlnghcmZQgh9cVgp94oZAYAHjrMGrj4iIK+XrQ7JiIzXQgvB+qJI4ilr+VDtfElAb1bYMkf+W0O97HhN0nTZ3RYX1RU9LO0oBQoikPz6uMTKOAb4k/nr9dTsHY/rQhkUGy2bjhjODw9nxlJ33zknSlafow5HpiUDHXrfe0DU63as2+snMoZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFYhT+op7r1uuVGfqk/L96fvzJnE+/lErmqGUzlnw3A=;
 b=d1YFm8mHnpAgs4lOfVdTxGEGOV6U33fsYhCwEkcXf49AQfjOkZYs/MlVt+HaBpVm5SkVN2E/V/KRTtegXh34i94VMSRM/yx9oREzm+iJiIEtAeWrwLvUjK33Uq+xYXtuyidR2JvsSaYh3fAItfRqgkeUiYKvkmLB5mIrubDWtDtg2SL+VQSUttBSOc86wBeoDDYO+aXu75MY0PLBZUwjV05yVLquTmFhB1CDIzCNyCM20Apii8l9n7KCwAw2zTQ4VBcghJeaMSjmkAxtxIXYbMb7T7ZsO/4XpHsbb0hRZhXbwNwRiLZvVcJ7YzLo99+9fLvZKrWXqsgmkePwQ2L+4A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SI3PR06MB8684.apcprd06.prod.outlook.com (2603:1096:4:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 07:15:00 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9700.022; Fri, 20 Mar 2026
 07:15:00 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Topic: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Index: AQHcrWasfLNWtX5/y0SkB1cDA4lWiLWi5wYAgAkqVmqACwRrwg==
Date: Fri, 20 Mar 2026 07:15:00 +0000
Message-ID:
 <OSQPR06MB72522FADFC47F158B5E27AFE8B4CA@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
 <20260307-weightless-quirky-spoonbill-dacd89@quoll>
 <OSQPR06MB72521BCD9B380D43E3E3590D8B45A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To:
 <OSQPR06MB72521BCD9B380D43E3E3590D8B45A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SI3PR06MB8684:EE_
x-ms-office365-filtering-correlation-id: 796fcd23-c4bf-4bcf-f8f5-08de8650666b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 RxEz/qbO0Q07TvyYLX50DCy78iQx2pnhB8cJf21eym/x1qWda4UzUSNpAK0WvzScCia6KKv7SiZO+lrl+fAhGBm8jCUNDyfgiOmt1Hn700uNgByjQfk8My+SUAhonHAj/vU3eB+5vCfZKX3Bq3Ykn6OfVJPSuMlAF7O3WdBT6FXS4v3LuKG94Pf35OMiqMBtJD42ZBV/oaHHKOunJWPwxoLbbxLm2g+jacEe2P/Jp6V7R/RueQ2r+4VpVocB7RQB4EYqSMOAwICJxsvd9I6QY4q7NFKrUGe5q+iM2a/E1sIAoNNT8DMYRv7R2F6r82kHzLdiFYanRWFcH5AxbGwV//2mMivavGmpRYz4/nLAIBx4j5MP1rlDcFeyZb99OLXM9+DqOsns0wtTrqNSz/Haolo88Le9/4D+kOngYhrBuFZk9LjK6fIaKd1S60YI+9Lx8U8eWLYa18eDbuB8y/ZO+eOcWhspqL9bg8lqgl2tHBMp/KiYHCeM6BSOF2i0XPPFafwc4B+KriJnka9kl3ajZnm4EPHg9ir9uQrKR4wbNEE/a4obSb7BSmvg2bDEbAEsk6hTITOzxmv5sufIdu9kULHzBNuUsVMEEX/gMiVgDQGj5EAnSxcBXPgiPatZHFV3y9OoQpwinA7HVoO3oy/5CzTJ5h34fQLGCcat7RXqAGyosfLnQc+oPZqKU9SWrQz5GGbIBQC3Oo0qlNRf55qFwoq/ROAqxFKC0MP3HdPWVd5Bs4icxFzNpvBunhL8To+l2QwEg9FfwMNu2EnYxDj6YI3x3X1nfubSv1hvmlNirGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HMByKg4jmUEpImdh0yjAdg7aKuEz2Prxg5wTXg3gUvWYH75iQj1wfgL4cA?=
 =?iso-8859-1?Q?7VhT6S6tVUffhTONgoCu2IkUi7OfaCRGdJf4+UPHw3zP803bkOki0NgMDl?=
 =?iso-8859-1?Q?ddbnZf3kicr9UWl7B+L5l+YGTFvqOUN7RjMw6TJGyX1Xsi9kTMX2p0OsaY?=
 =?iso-8859-1?Q?NqE/QU6iSCsYeOzzDHvsApzH0GUFmMFXBbLJsip9C6kd1vcC31HTBCtBzW?=
 =?iso-8859-1?Q?MQXxLiinztWXaj7sMF99mmrqK3I2eDvH7++QpTo7UyLvH5x28gbhJpPlOi?=
 =?iso-8859-1?Q?JalDl572KwlF7uzVFR9JrdGPxo1cPug9xYVvzLfzFfqjgVtcJD1CY0UA86?=
 =?iso-8859-1?Q?SM6iNjVL19+66QEEr39cN7365Lg8YIHbRXQ/2KEp3HwgyKKggMwnTkrOGT?=
 =?iso-8859-1?Q?b4noDY7Q5Mgg2ksqCBQdB1RJCa4HiRAaIyloskkYzCy7kXfOVQbgiTBIxX?=
 =?iso-8859-1?Q?N9KMhiRqrxklNQqFpZzGwBNBUmLayYYpA5eiRqcd0sidA9Vdxlvqk2Ewsv?=
 =?iso-8859-1?Q?uYHF6/VehMPsbrS6WMjQCqA9jy7IQtMhPWplt7fY+TWrKfdYUNRCdG+Yxm?=
 =?iso-8859-1?Q?6ntcrdH1Bu2PgqDCnyDnLuV0EZVjlWtO8qpmzgrFMnA8vybXAjf313UqIs?=
 =?iso-8859-1?Q?WXSTM0w6zLjKOcvyKmBlpvEoz+ptTrDbXmGDBkOrwbeJ0ZfgF5SRB8hKRz?=
 =?iso-8859-1?Q?DbvVsqJMgb73zTibmc5N4wrPI1UjxinlVELXYrTNzURjKMCSmuKchLBZN/?=
 =?iso-8859-1?Q?nxt1ICGcpxnpL0EdHfVAGGPm/CQ0ix67G/FhT1wJeaOXr8T1Oa4J244cGq?=
 =?iso-8859-1?Q?jbeAVMYRpJ5DPD/e8jSXE868dsO/SLZukR1/RYxOM6jqkQ8bIned/JZsU0?=
 =?iso-8859-1?Q?1tRLNOXf3Bbp3eVgkHUVOrn4vDMUwxzb1odaHQQbG99LVBoZGSY5SP/sbT?=
 =?iso-8859-1?Q?8QCbEaCJiY6byElpFTQt5tS+bST2PxpeoKJ24VFXwdJDsQhu9lg+U+AITv?=
 =?iso-8859-1?Q?GSuYQJIMchXUgT85B2oSVH9VjJdrw+m0m+X46LtNJzyhHp2XmDJ4r8aR2b?=
 =?iso-8859-1?Q?7waZDZY93SVVUK5YtvuxE0cvHhvhcgTdQCHT7AN4kryBkR4ySTMls1CSd0?=
 =?iso-8859-1?Q?kJ/Mx4tJbQGtHl4ohr1c+LcofyG/BVPrkVBz+FgWUDsI6spCtMiHxDwyTo?=
 =?iso-8859-1?Q?wBQaqgfIdWN8chjdJS9kitcr68vQSHzSqvODE1ZrPyO4YO1mrCzF0ULi0U?=
 =?iso-8859-1?Q?IMqRLv1n+5/oAgMEbaEIBWpdEOHbbgPEpdIs4+YMgDG3iNf4RfXSrxl2hh?=
 =?iso-8859-1?Q?qJ55P1psFJ0tmqAjlE4HnYf7QW2g7GZXoMByQKO9U0+8JWuTgt60CSNHrD?=
 =?iso-8859-1?Q?rOHNH1QI5q4ZYPB2bjVSTiv/aNteke9bFOrE3T4Gr9jJqVajjC47JTeGup?=
 =?iso-8859-1?Q?aQ91i8Jzw75cDH67v7IpdnY+zSUWepRNsVBk37iAmmFB3xpevZXOmDPX8P?=
 =?iso-8859-1?Q?57rd7lkL6uAbcpDVVAdS47ijxDFsYCI0tGgEge17CilnubrMcHdtu6CBJR?=
 =?iso-8859-1?Q?1XpmVYoCxkSr2f/DqzNTe1DFeV8wm4wKfTU1rFg9myKzcTUGQr7sBf4Bxl?=
 =?iso-8859-1?Q?fGRqW/zdPcJIaZ2T1Gjsz2usFvP9Qb1fRifQMnGXTyhantSMjeczfcOomw?=
 =?iso-8859-1?Q?AxTfzJs7K8ph5cZa9IFnXU0DB7p+fNvWOvbfkR6CTE0cnCSwy+HcoZnd6N?=
 =?iso-8859-1?Q?JyUN4wTWLwh2a6kAVoKvKaTBjin6y5EoxhsvqlS+8ZoPiMlgba528iEXhf?=
 =?iso-8859-1?Q?qeBnNFMplQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 796fcd23-c4bf-4bcf-f8f5-08de8650666b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 07:15:00.6909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLu8g6XYOrbY/yEI/6b22UGmDakFO6ZRFtBvovZdieXmCsSqlVgWsVU39MEuFXGTmC7GqDLxn6CypX+SYEsy+mkLG4sfogKTx15APSwIY6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8684
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33890-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.960];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E5A712D6780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

...=0A=
=0A=
> What remains unclear is how best to model the secondary and tertiary=0A=
> service processor control blocks (SSP/TSP) and the PCI control region.=0A=
> The SSP and TSP controls consume reserved memory regions used to=0A=
> configure the processors' address spaces, while the PCI control region=0A=
> contains the VGA scratch registers used to communicate host display=0A=
> ownership.=0A=
=0A=
> The p2a and smp-ram features are supported on earlier generations=0A=
> but are not present on AST2700, and should be disabled in the binding=0A=
> for the AST2700 as you suggested.=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Following up on my previous email, I've reworked the AST2700 SCU0=0A=
binding to better reflect the hardware capabilities and address the=0A=
issues discussed.=0A=
=0A=
In particular:=0A=
- Restrict p2a-control and smp-memram for AST2700, as these features=0A=
  are not present.=0A=
- Add SSP/TSP address mapping support using memory-region and=0A=
  memory-region-names.=0A=
- Rework the example so it reflects the AST2700 SCU0 layout and validates=
=0A=
  against the binding schema.=0A=
=0A=
I wanted to share the current binding update for feedback.=0A=
=0A=
Below is the current SCU0 binding diff:=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml =
b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
index a87f31fce019..86e560876cf2 100644=0A=
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
@@ -46,6 +46,9 @@ properties:=0A=
   '#reset-cells':=0A=
     const: 1=0A=
 =0A=
+  memory-region: true=0A=
+  memory-region-names: true=0A=
+=0A=
 patternProperties:=0A=
   '^p2a-control@[0-9a-f]+$':=0A=
     description: >=0A=
@@ -87,6 +90,7 @@ patternProperties:=0A=
             - aspeed,ast2400-pinctrl=0A=
             - aspeed,ast2500-pinctrl=0A=
             - aspeed,ast2600-pinctrl=0A=
+            - aspeed,ast2700-soc0-pinctrl=0A=
 =0A=
     required:=0A=
       - compatible=0A=
@@ -156,6 +160,42 @@ required:=0A=
   - '#clock-cells'=0A=
   - '#reset-cells'=0A=
 =0A=
+allOf:=0A=
+  - if:=0A=
+      properties:=0A=
+        compatible:=0A=
+          contains:=0A=
+            anyOf:=0A=
+              - const: aspeed,ast2700-scu0=0A=
+              - const: aspeed,ast2700-scu1=0A=
+    then:=0A=
+      patternProperties:=0A=
+        '^p2a-control@[0-9a-f]+$': false=0A=
+        '^smp-memram@[0-9a-f]+$': false=0A=
+=0A=
+  - if:=0A=
+      properties:=0A=
+        compatible:=0A=
+          contains:=0A=
+            const: aspeed,ast2700-scu0=0A=
+    then:=0A=
+      properties:=0A=
+        memory-region:=0A=
+          items:=0A=
+            - description: Region mapped through the first SSP address win=
dow.=0A=
+            - description: Region mapped through the second SSP address wi=
ndow.=0A=
+            - description: Region mapped through the TSP address window.=
=0A=
+=0A=
+        memory-region-names:=0A=
+          items:=0A=
+            - const: ssp-0=0A=
+            - const: ssp-1=0A=
+            - const: tsp=0A=
+    else:=0A=
+      properties:=0A=
+        memory-region: false=0A=
+        memory-region-names: false=0A=
+=0A=
 additionalProperties: false=0A=
 =0A=
 examples:=0A=
@@ -180,4 +220,81 @@ examples:=0A=
             reg =3D <0x7c 0x4>, <0x150 0x8>;=0A=
         };=0A=
     };=0A=
+=0A=
+  - |=0A=
+    / {=0A=
+        #address-cells =3D <2>;=0A=
+        #size-cells =3D <2>;=0A=
+=0A=
+        reserved-memory {=0A=
+            #address-cells =3D <2>;=0A=
+            #size-cells =3D <2>;=0A=
+            ranges;=0A=
+=0A=
+            ssp_region_0: memory@90000000 {=0A=
+                reg =3D <0x4 0x00000000 0x0 0x01000000>;=0A=
+                no-map;=0A=
+            };=0A=
+=0A=
+            ssp_region_1: memory@91000000 {=0A=
+                reg =3D <0x4 0x01000000 0x0 0x01000000>;=0A=
+                no-map;=0A=
+            };=0A=
+=0A=
+            tsp_region: memory@92000000 {=0A=
+                reg =3D <0x4 0x02000000 0x0 0x01000000>;=0A=
+                no-map;=0A=
+            };=0A=
+        };=0A=
+=0A=
+        bus {=0A=
+            #address-cells =3D <2>;=0A=
+            #size-cells =3D <2>;=0A=
+=0A=
+            syscon@12c02000 {=0A=
+                compatible =3D "aspeed,ast2700-scu0", "syscon", "simple-mf=
d";=0A=
+                reg =3D <0 0x12c02000 0 0x1000>;=0A=
+                ranges =3D <0x0 0x0 0x12c02000 0x1000>;=0A=
+                #address-cells =3D <1>;=0A=
+                #size-cells =3D <1>;=0A=
+                #clock-cells =3D <1>;=0A=
+                #reset-cells =3D <1>;=0A=
+=0A=
+                memory-region =3D <&ssp_region_0>, <&ssp_region_1>,=0A=
+                                <&tsp_region>;=0A=
+                memory-region-names =3D "ssp-0", "ssp-1", "tsp";=0A=
+=0A=
+                silicon-id@0 {=0A=
+                    compatible =3D "aspeed,ast2700-silicon-id", "aspeed,si=
licon-id";=0A=
+                    reg =3D <0x0 0x4>;=0A=
+                };=0A=
+=0A=
+                interrupt-controller@1b0 {=0A=
+                    compatible =3D "aspeed,ast2700-scu-ic0";=0A=
+                    reg =3D <0x1b0 0x4>;=0A=
+                    #interrupt-cells =3D <1>;=0A=
+                    interrupts-extended =3D <&intc0 97>;=0A=
+                    interrupt-controller;=0A=
+                };=0A=
+=0A=
+                interrupt-controller@1e0 {=0A=
+                    compatible =3D "aspeed,ast2700-scu-ic1";=0A=
+                    reg =3D <0x1e0 0x4>;=0A=
+                    #interrupt-cells =3D <1>;=0A=
+                    interrupts-extended =3D <&intc0 98>;=0A=
+                    interrupt-controller;=0A=
+                };=0A=
+=0A=
+                pinctrl@400 {=0A=
+                    compatible =3D "aspeed,ast2700-soc0-pinctrl";=0A=
+                    reg =3D <0x400 0x318>;=0A=
+                    emmc-state {=0A=
+                        function =3D "EMMC";=0A=
+                        groups =3D "EMMCG1";=0A=
+                    };=0A=
+                };=0A=
+            };=0A=
+        };=0A=
+    };=0A=
+=0A=
 ...=0A=
=0A=
One additional question regarding the example: Since the AST2700 SCU0=0A=
node is not significantly different from previous generations and the=0A=
example mostly uses standard properties, do you think keeping this=0A=
additional example is useful, or would you prefer to keep the binding=0A=
minimal?=0A=
=0A=
Thanks=0A=
Billy Tsai=0A=

