Return-Path: <linux-gpio+bounces-35241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKU+C17U5WmmoQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:23:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F8427B23
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5604300B139
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 07:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D2D38423F;
	Mon, 20 Apr 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="YRca/6tn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022136.outbound.protection.outlook.com [52.101.126.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389F2D738A;
	Mon, 20 Apr 2026 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669783; cv=fail; b=BL5S5MMOu5urU5FHlzqYRCciWBurUx8/lBrx9dwO+hMvd4TDo7FmdpmAYkye86esQXCe7mBrjDVYHZoTzEIeafMLCxlPcRjjmhwtxzq1ykuBOSGczms3UEjD7+Qf5BtrmMWHF57Rfkx1nA1nTgza2QD7flQIXjX1FrBKg7Vcccg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669783; c=relaxed/simple;
	bh=QszABz7taMe5qfYjY6GJXcTRX8XJrY4krhyrc3Ee5z0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OKSF0y00DjNLLv2VhcouvzJ60GSYJ7BlxrsV6Fn5MUMxYQPhylk5Sxba44IpV6Us0tU29dF0VB41yrA20MwZk4ahRh78y0J5Y6X8jcOQ1CepWLevrcIlntPm6y0bn/dQDvBHSB9kp5u7g1mkZor6r1IFqmtw7ZM6plNrTuh4Rxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=YRca/6tn; arc=fail smtp.client-ip=52.101.126.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uf2B2mlLI69k791S4B+v6JJbifgydOhWLPkmWHDnqUJ3qrFvNEZr+TYWrj+Gu4VBj27Ol0CutytFhk2+IREETyOiRoAcmYnBvk0eurDIpdmJwGzMnjUoivf6+igteT1gZ9H04Iq60S4kVw7pmc2Og8hbYBzQpDr3pJaIBi64LqyRktReGwQDcNYCX4ucRZ7vjpqCVHB0kljlleFnwVngoq7Z87/HBL7j5jyyafXHYuezx8/mI5QLcgRAxFu3nnLT1zLnAg+NybHJQpWWmTc3Cku03vcSP8Y+geSiQt4szkCj2KAZg1EQneL0QLxZAQZW1dnbexwqUzkVvXk23ZhCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA1SS64rK86AA89yR52Qj5t6mBiiFO6Jj0e5xY7n8N0=;
 b=oA+EYx+L3HhzPOvKDypr6ks8d3lPAWcHrBLZJxBFApV6Ctt+4KbMqwI8BlGTx4qugTZObAm6eWYU1GvbwFN1ztJx5GO5d80fg+sInr4sJekgSQIu6L4Zyp63yLlz68bbuBmm+nXXQFVa30A47lZVk2mDYdOhbSzkXHHnIg4bdXqEMR9HDANN4wyvcUE2lrEqg6cPcOAdHZ/M4OaQfYdoHTKS8nuHUiJ3clGUS+QA9Atr/i2cCWISCzh1eDUZVHA3m7euQHMBDUw5utEB7bgIHgeA3L4fA7yRNHctW05nKm3/ks4cB24VLEnojtJV3IK3M5Wz2sQzV94sfWznoU9COQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA1SS64rK86AA89yR52Qj5t6mBiiFO6Jj0e5xY7n8N0=;
 b=YRca/6tnySxc8Ztg/S5QP8Z4dZNQPw9GwtP7oRa8Z9cBp9YVGqhVgcroSGMmTIYZC6Yd7CTpqxA+oUGJdkiwSELuXOqjhCVoAcyWt72ZVNaGGw6tFpMX08ROjdLE4850SqR9N7Snvl0UP45LzTm9RYqbJoRXLEU8NEaZcTg1MOe7b8ColUQWcDv9CSdsdqL5UnK9QCf2dLEQNWoXExOH2cR2V5jKZga8kdL3C482U/ltQ2KfU0EVEJaMJWB6OP+ruAFXI5AG59PRbYuNmqvS7PiEs3L6OA+RMHHsuLSk12umK4UbHM0LfxGrqha0mWFcxQ9p0YoTrVOOk+/X7hF9eA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB7044.apcprd06.prod.outlook.com (2603:1096:101:1db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 07:22:57 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9818.031; Mon, 20 Apr 2026
 07:22:57 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
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
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Topic: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Index: AQHczXLoc0DWafBAUU23YFhFi4LfGrXh15uAgACsm2SAAOlSgIAEIoHU
Date: Mon, 20 Apr 2026 07:22:57 +0000
Message-ID:
 <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260417-anemia-borrower-fb90ac02b417@spud>
In-Reply-To: <20260417-anemia-borrower-fb90ac02b417@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB7044:EE_
x-ms-office365-filtering-correlation-id: 5d998068-2d00-4c47-66a0-08de9eada53b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QQ95Nrz8QBMlWRnZXGg7uhrakBwQzm9aSixPUo0aFsLDSXYSt51wzfu2UQQe0Ks/NSQZrQBjMbJ2ezibtlXz1TnIPdvMw1xRsrnByXCmJf9dWCjpj3zl7c8k0d9kvZhLrUkP6NttmL3y1CpJQO+12hkp6uhJsbc/MZT9qDM1YOXttZnwJApmFePjSYswI3c45KXsBlMcsZI5jz9EXMKMKpYUGLOvV8ng4ftbvTEr2b58ZhhjPCsN0+O91oTiEBV8GPlACGV7Zgwv7fKbB9RI8Qy5kt05YZ/bfz92juYVSMGMI5eRG21Q1gQb2nS80blm+7a+ZGwnw25FPtfAE8pzKnz8JDBp9BwQfHzR6QgZAe+RUUgyFys9o3WUqS8vO2UZb8jX1WC1hPtPEOUyii1ysmCqeaSdjw64Z2GFVVR4o1SRn9DFSjL3bIRe/1RFccfahUUb4bHXxsktj5x59iVKk51hK9cjXyTAJ+ehMe81TppTL6yJLDE6y+W1QmUnEbKq9EP0YiCNc6qvC+WEqi7YRfbV0LeVX0cRJ9lEO/4cZ6a/qTSJ7RnHBbi0ONq0xQazUbabuFTmxv1OGYCRYl5Qiw9hWu6gA66RC8D6bykZoPz6v+U3cL8+CijDOlF+oH3SWW6BShLfO6/WF1AZxVqGzJUtZgSM28SnlbgN3u2SsgdZX5QJ18Yzgo/xKBsSYnc6GQ7FQr+E72WsnitdV4gTHnqt9IMaGi7HRwxhf3jJoj/Prtb3kN0A3uOgFl4FiyggNN/LuZiTp6hjusQ7g4bF2KWGyJJPFxxH303ym2SBanM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0iYjePFxEZciiBquxEDqSzZu6z2k07UkvkcswDz7Ab8B8L1xIFHG9Ar0nL?=
 =?iso-8859-1?Q?pH4z5F/SygKQExNjn37qG3XEHEw9BR6tF56LqqGbnj40+ML+QSFTsCQxcH?=
 =?iso-8859-1?Q?75zhCHp+WniQU4BR4Pr80BkhWLPSZz3uzc0mURdWMvLgUS6Ihxg8ecM4FZ?=
 =?iso-8859-1?Q?aUeydy15VCE5oO0rX5DYehbMh/ALq2Vkj2PSCMPRdjDs/zS+2WJ0EtUUED?=
 =?iso-8859-1?Q?RjpcKd/O2wV2ZcLK06+7MEIoFGuqPJ+OddTdeR8JI4P3z+Q/84tY+PEQzP?=
 =?iso-8859-1?Q?jexVZNq419p8/4DAzmA0deRNJJcHx0urY/NiNbK0iPULjsijl+qh7AZBeE?=
 =?iso-8859-1?Q?uh48nfbqPSRBtym9Rz69fByQkkSwvuiOrKeRYkBoyia/d4d+hSpSc8PLVH?=
 =?iso-8859-1?Q?Wky3rfPBSRZkopr7axovJGIB2PzQzdS28mEoKetNVMzuf2LoAZfVAq5+fD?=
 =?iso-8859-1?Q?LdDJH/92Uh1XBUIMB26J/KjbY0nHnHKE9+gjh6CnftrAE3PTl7RxwjNKHd?=
 =?iso-8859-1?Q?kHjKrrk83L0vtEkbBX6UeOPiFCAXeH2HhR8585yL6FjM8y2n8jTJXdLRIH?=
 =?iso-8859-1?Q?TyzOvf6qoLKj0Ysuhjub6iAPAySozV9FI74Q3pKHCP6QIJp9FwcEdWNJ9D?=
 =?iso-8859-1?Q?4puw89qrK+irs6oitk2j7Rz+YAN/ugDbpzbxAEd3b5BimxnHVYcPoUAY8M?=
 =?iso-8859-1?Q?Ms7YnlQGR2jjQq2lTxTHV18CWxr4u0g8pGMPU9kDZme69hx3jcE/KiWId2?=
 =?iso-8859-1?Q?Io4SdB62xrXVSQGBeJpxinbrgleqCRxi7kbqqt0h0Gf2SRA3E/HY0ZY/pw?=
 =?iso-8859-1?Q?EKAtLp9Tx+udxmSu6W97e/YmQ6pEnm+LhgOO/0A2URXRFVj+peHgP9rw3y?=
 =?iso-8859-1?Q?Hm0MNopmcgS1jrtGPvtq93Nn4cG+pZsJDKNl7EWNMQ5v4UvMDMGYmbJ3Ns?=
 =?iso-8859-1?Q?Jjwpg2VgDwI0Td/cu0pRH0jh+otjOCPvpcPSBc8DNYQ2a/n69cjZH9lTF2?=
 =?iso-8859-1?Q?L6T6uCe0x3nMFF0SDCK7EU7omH8tV+TF1nou8NqDaKhYRiYTvPwM0beUo1?=
 =?iso-8859-1?Q?3fddnozvhnaIvhUV4qV7gHzzkuCfXemqhXhOXkJlpfWK7AXWZSsa5PpNLm?=
 =?iso-8859-1?Q?vwol5gIIE5JcqioTvQQwYR+SLMNVRiC8oOSiZ3Yy4VzEKCZYgRdPYkGo+a?=
 =?iso-8859-1?Q?sqU9XwJkjpFmNM+Sq6mnWVZ0PYbDMqi1vvugmbdAkphFmoKWlanTCSNPCU?=
 =?iso-8859-1?Q?ztuUeVY4eq0eBBaVSVAlnkMVziHhnmEhCSgkC/0XWuGwDJtuIghbmrb7Sl?=
 =?iso-8859-1?Q?cVGbK11gloLrX9TuB/JoZtaC0yTrs+P39CO6f/zirepKAuqlZRek/4uluz?=
 =?iso-8859-1?Q?fYYg4Q+Wk0ANwJMVI7VPO2xBfnOfabAPrE4I2lps0LFXXGo6frL6QDMkj4?=
 =?iso-8859-1?Q?6nxOIPzY8eg9g+9vKNZemXyUevzaD7upmyjDvIe5MGGQxPcMZHBUCkO2yi?=
 =?iso-8859-1?Q?QT90DoqP4TFZ4ce5CyyqyAssyGguhopZ7jlGcMgfwXH7w+72KAv5DNqXHH?=
 =?iso-8859-1?Q?VEyy3eOfHTWWJDKWOEnjJZCqzSiwfmbDfwFE3N8Af9rQQDWw679IJLDp+f?=
 =?iso-8859-1?Q?PIB4O7H3aI7IZalMxQpQz/CenZGSdDJbUwNVq0KA4cXzBV3IkjOo3fo9R6?=
 =?iso-8859-1?Q?+1wZlhmnJ1r+nBAmQkXiE9E0a2IQI6AwdSRBEBfluKpmEQIXxr2K6N3zQU?=
 =?iso-8859-1?Q?5i4y7qr41zHjocsnqscDrD5+lAIdVNU1qB/N7ZGbIViVaCqriplAlp7fLE?=
 =?iso-8859-1?Q?QxWCvR7APQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d998068-2d00-4c47-66a0-08de9eada53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 07:22:57.1828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4l5JLVY7glv4+hkSBCK9waNvf1O2t60RwmdBYYa+0BO26eBGwz23Uk3/Ehu2LAYOIKjHBqMBc5KVi9yeflbdO8ogzrrmfoqaOWid5kyXEKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7044
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35241-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,OSQPR06MB7252.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C93F8427B23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > > > +=A0=A0=A0 properties:=0A=
> > > > +=A0=A0=A0=A0=A0 function:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMC=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGDDR=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGM0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEA=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEB=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPSP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGSSP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGTSP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHPD0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH2B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP2B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHPD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHPD0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH2A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP2A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHPD1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH2B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHD=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP2B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHPD=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH2A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHD=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP2A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHPD=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC=0A=
> > > > +=0A=
> > > > +=A0=A0=A0=A0=A0 groups:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCCDN=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG4=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG8=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCWPN=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAG0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ABP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ADAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BBP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BDBP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHBP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3A=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3ABP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3B=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BAP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BBP=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB0=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC=0A=
> > > > +=A0=A0=A0=A0=A0 pins:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB13=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB14=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC13=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC14=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD13=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD14=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE13=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE14=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE15=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF13=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF14=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF15=0A=
=0A=
> > > Why do you have groups and pins?=0A=
> > > Is it valid in your device to have groups and pins in the same node?=
=0A=
=0A=
> > The intent is to support both group-based mux selection and=0A=
> > configuration, as well as per-pin configuration.=0A=
=0A=
> > In our hardware:=0A=
> > - `function` + `groups` are used for pinmux selection.=0A=
> > - `pins` is used for per-pin configuration (e.g. drive strength,=0A=
> >=A0=A0 bias settings).=0A=
> > - `groups` may also be used for group-level configuration.=0A=
=0A=
> > As a result, both `groups` and `pins` may appear in the same node,=0A=
> > but they serve different purposes and do not conflict:=0A=
> > - `groups` selects the mux function and may apply configuration to=0A=
> >=A0=A0 the entire group.=0A=
> > - `pins` allows overriding or specifying configuration for individual=
=0A=
> >=A0=A0 pins.=0A=
=0A=
> > In most cases, only one of them is needed, but both are allowed when=0A=
> > both group-level and per-pin configuration are required.=0A=
=0A=
> To be honest, that sounds like your groups are not sufficiently=0A=
> granular and should be reduced such that you can use them for pin=0A=
> settings.=0A=
=0A=
The intent was to keep the binding flexible, but in practice the mixed=0A=
use of `groups` and `pins` in the same node is not expected to be used.=0A=
=0A=
Given that, I agree this flexibility is unnecessary and makes the=0A=
binding semantics less clear. I'll rework the binding to make the=0A=
expected usage explicit rather than allowing combinations that do not=0A=
correspond to a real use case.=0A=
=0A=
In particular, I'll split the constraints as follows:=0A=
=0A=
- For pinmux, the presence of `function` will require `groups`, and=0A=
  `pins` will not be allowed. This reflects the hardware design, where=0A=
  the groups are defined by the pins affected by a given mux expression=0A=
=0A=
- For pin configuration, exactly one of `groups` or `pins` will be=0A=
  required (using oneOf), so that configuration is applied either at=0A=
  group level or per-pin, but not both.=0A=
=0A=
=0A=
- if:=0A=
    required:=0A=
      - function=0A=
  then:=0A=
    required:=0A=
      - groups=0A=
    not:=0A=
      required:=0A=
        - pins=0A=
  else:=0A=
    oneOf:=0A=
      - required:=0A=
          - groups=0A=
        not:=0A=
          required:=0A=
            - pins=0A=
      - required:=0A=
          - pins=0A=
        not:=0A=
          required:=0A=
            - groups=0A=
Does this match what you had in mind?=0A=
=0A=
Thanks=0A=
Billy Tsai=

