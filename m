Return-Path: <linux-gpio+bounces-38010-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wR+2BW+oImp9bgEAu9opvQ
	(envelope-from <linux-gpio+bounces-38010-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:43:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED18647735
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:43:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=uS11i0zK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38010-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38010-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35837303D0D9
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 10:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3FA44D01C;
	Fri,  5 Jun 2026 10:33:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7D3FAE0D;
	Fri,  5 Jun 2026 10:33:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655587; cv=fail; b=IHYA2iWiCWE4KtrFwbVbWeiKSqjF3XTthGVwy9pNAnbolTj8I6bgstuagQIeFFJJApR6DxFEyg9FwRI8G29+wA6WBIIK1NPwk2w0gsLHxg92vayAKzEM9eqroe4qzqq7EJ2h6W28fUdT48OMjVUIylz7mPqvmjK7LRQEokkBzO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655587; c=relaxed/simple;
	bh=OT3+E1/peZBeaIEp+3i0PcMqA+sXizbud/CNz5wbojw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bBlY97KKyPYGPc8YK894juiS8OyzhHNZlyecLwwxz0fTQGUoSrZMdgGRAVZV4Ig4ElRJBdGsdYnzBeedT4lRxABBc1zKq84Z23xntYCOh5Hp2UTm1vyC6qjRzoz91QjajRpMP5CxMFoyzsapif1SrsiZCVtfLHyoShS0ViNakEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uS11i0zK; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwaDd+vpfTZO3X2uaRgBdNmq5iZEjxLa9TxoabbzC/aS6bLAnhITN6HsJjBwoD833jjV0SCx5aAewLURVuSjPCAB5+kzsFrbFaZgHnK4V/VdvaKYkXCJmiW4sE2ChXyBebmW1tkMczzIGk1TKo/FwpR/qjVrmXT59UBSao5x6mnq6Rc8Be5yzKv6VhnwjnFgmV/gDibXVFE1MdmT04floFg0hOWEFraATtH8iSrnsfOneTrGV8iwE2peFjiWVzGaOlOAZZieHnbJhv4k0gOuTBSR7WV9zqpC4vwzXaWKBmlbHCe7f/50iLADySICJICT8HZaupTYzQGavZwR9+3xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT3+E1/peZBeaIEp+3i0PcMqA+sXizbud/CNz5wbojw=;
 b=utDPz1bGs8skK+5fDhU+GfjPwkKjeS6cIiOGx2o+MQSVyD5ActZXqPhLvs//hIh1d9368lNcrwnCyNUxNzXLhK6bYXUJ3cpUPGh0FYEsBwF3xBpFN48FSyQbsHZVQrYplU6jDwqekNbi3BxmcpiFGWFGmommCmkhN7lIT4UfDkdP0sj+M0kjqYwvMR4rzMT17e6OLhhuRVERsyKpkSRickUSOpcF31Rqe1Y+rTpLKIcd9uaHhm0AJrhbFIwdXw/vLPdJVv87UIlbFK5MdcQcr4f27aBaaBz/2MSVkTx8TBbywxy/vAJvopU3B5t3+ChjWPTr4SmTMKuSC0orxONWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT3+E1/peZBeaIEp+3i0PcMqA+sXizbud/CNz5wbojw=;
 b=uS11i0zKVnIEYiAybLBeuXzipFzUqEOFPjy9EM4lrfxOXB6kFb+e4YH3r2k5W6N9qrl2/IQAd4SscTYAtv/sXODQcC2vWEz3H4t4OSdURqX2bzBEDGOYQo6I/ZoQcNA/oWlWBmIqkQt60XEhfiv7gab1x/NNNar20PElJAGMsL4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10538.jpnprd01.prod.outlook.com (2603:1096:400:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 10:32:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 10:32:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Claudiu Beznea <claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use
 raw_spinlock_irqsave() on power source update
Thread-Topic: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use
 raw_spinlock_irqsave() on power source update
Thread-Index: AQHc82wIl3xaircai06rtQdp8q6PcrYuJ9KAgAASdPCAAX+VgIAADH5Q
Date: Fri, 5 Jun 2026 10:32:59 +0000
Message-ID:
 <TY3PR01MB11346C36EA5510C786D549D0886112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
 <20260603151642.4075678-2-claudiu.beznea@kernel.org>
 <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
 <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10538:EE_
x-ms-office365-filtering-correlation-id: e5efd7f1-bd3a-43fc-5c70-08dec2edd0ae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 W46+4kmLwcFz9qO2/GZ9bimqDibOUbNFgnarySN3jlHj3i+g9M/AcBHurP4zl0oXstJfiDDssnZd3nNTGhxADWPriLqN2t4LvWeorhlbGAzLrICSNqE+tSnx6QhGgiyUlXbiGts4APCrjZD9TdsM5OXUd7LrVoXB8Zj5F1pW0BXOXYGuhzGtSACb60lIv3Geq2irlntAkU797Swh9C/5qjbYbcPfy2GHKggdWE3bQrzDfq0uE3ScVlPhInxBMOvMygJIKIHloRAD78W30uREF31F6H3z02L50yfu1eNGgUSV5JL1MeVnHtCtZ4bibDAObtch5GRMaEmE5deMjyzCZL25vgoZ7RyFYJMHtvZTgzEbsDRHRhjSpuh7C3dofuDmNEp+eAORMlRgj2rtwySwgyBcTHx/Uz+nEEWhkLt454wDbDv5LTetumplutnmTXY1gtlo+xT31oG6bTTXIEBQH26Wx5dNYlE5iZTpq1HYU+550Ok/r1+NPk8LkfVCZW+71Q2hKkKmyDgZAz00SbEXlgDMzmVPhOq/IV+4SaoyjE1zxSmZP0fFr4d6MzU1uWoaiXxjSUfRX6ms0aqkdgXp8BXbSAny0QHe2zyLFh9VleVZLf9OX8cY0zoClR/h8hOj1sytarIndcsbMXnT5CsjEN3Qfw/AiQ1b+q9IxvNRfx/b8QteFFoo4F9ZzbAJWtV6emH3JEau30XOWbUwyiQktmyhTkuMFM+Rl3ktLOmGtlg4+4/0zeTK351JDbAdfNEV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ako4NFY3YVBuTVpuNkNRM2RKeHp3Q21xUlFKOHBCMTZuZEdnTERGbnhjWTBO?=
 =?utf-8?B?eVNpcDE3SUQ3SnV5eXM4ZWhwV0RWcmRNbDlicHdYdVNFbFprd1lYMGVFVVVv?=
 =?utf-8?B?SUxWOWVwK0ZicE1MZUVyZzJmdVhDZGNlZURJQnE3bW5wZzREQVdpSFhPdExn?=
 =?utf-8?B?T1J3WGhWaFZHNUgzQTVSVFB1YjRsQnhIZGNsb1haeHJpTkkyZW9RM2hiQW1E?=
 =?utf-8?B?am82bkpXaktIYnVodkpCcXNDWjRJbzJ5cDExWFovVzY2RnFlYnQ2blE3SHps?=
 =?utf-8?B?MjJLZXZMb3NEU0pZSVdKZGhpREhtK2RlKzFCMStUZmU5WUJWSE11RXNjdHMx?=
 =?utf-8?B?dGMzSTVMaVFCK291dHV1QlpZbVdrVHpKd0ZQNFc3N1Fnc240TFhNRXJyOWlF?=
 =?utf-8?B?OUFXRUdjQmFac09rRXBJbXUwV3NBS3h3MWUxVlVtck0xSllpMWwvVDlIM0Rl?=
 =?utf-8?B?di9sZjlFRllTdVBnUmw3ZHZLT0dqbHpRQkt3dExFSXUwWTdoU3RIRjZwck5u?=
 =?utf-8?B?VDBLanhZZTZXMzhHREdlVURvYTk5cU9lb0JuMkNCRmRyZFZJV3JCaEt5eXBq?=
 =?utf-8?B?cmZOdFZ5QXBQUWNMeFgrNmpMYlpWRDkwTzAzVFc5SmxyMkhQNUV3UWJxbTNR?=
 =?utf-8?B?K1lmUGJTZ0RsZndDQnZMS1p4ZXBtVWZTaml3dS9YaG1ZRHlIc3VmWUtaWFh4?=
 =?utf-8?B?MmliVW1jUWdKbHFlcVVtUmZyUEMxL0xnVHpLZElIdWN0Z3UrTFpubUlzalRL?=
 =?utf-8?B?STZaU1VRVUtWLzNTQU55UEN5OGQ0eUhKTzV3RTJkQWs1TU8rWFoyWVNDUGlX?=
 =?utf-8?B?R0Q4SkxDYWVwQnllWmkyYkpEY1JoMEo4SWo0VWRHaTdINjA5TjVJRlNTeU9k?=
 =?utf-8?B?Rnd3ZjFUbFI0ckFlL1BuVkVXaG1CSWM0UThOQlpMNU5rM21CVjlZNmQrMXhj?=
 =?utf-8?B?T3pUMlljL0R6WjFqM2pRMklKTWZLdzBXTnVtbnBabTNDUCs5aGZqdkNXS2JV?=
 =?utf-8?B?aXNYWDVSc041MktQcEkrSzhsdnE0UGpxb1NBTDJqTUpYSXR6UE1oYnp0bzlw?=
 =?utf-8?B?b0J0bEZwbjU4WTdmNXFtUkZ4bjg5RWpQVk16RzIvOUhUbVhDdUlpMWVQTXNo?=
 =?utf-8?B?THAxcjFJcFlqTHVsVE1SMjE1eW1FTC9KSmRVZmQyQ3RIeXM1cy82S2JHNEo2?=
 =?utf-8?B?ZzNKY1FkT3UrVTN0UDQ3M04xaDlnc1ExMEwxMTNCV0w2ZVZyYmNHMWNzRWJB?=
 =?utf-8?B?RlpzeWlSdjgrMlhrTTZHNW8zRm1VelZlS0NEdm1xaHArTHpHdmE1ZVRjY2FP?=
 =?utf-8?B?OW1UMWwwdXg2dVlpQTJMVk1GaVF4MGdWK2xKb1NIZHptQXZXWmdHVDlkazYv?=
 =?utf-8?B?M1EwNjk5VWtPU0V5T3JSdXpuQTdKbFU3UVVyaVNHeDZ1N0Q4SEcrcGlXbndu?=
 =?utf-8?B?QXFhd1M4Sm9jakNmV2lIbC9wN3UzMXE5Y1hrelBZbEhMNy9DUk1Fekx1L1Nn?=
 =?utf-8?B?bjdvS203MG1iWUZ4eUM4ZmdXYnhTWjJMZks2Tk9SY1VFZml6MFIxY3Nxc2Rl?=
 =?utf-8?B?eUhkdzJkZlFnQ3M3M0hMT1RabjdBNmJ0U3ZkUWFvT2ZpOTFqZzN2L0trblhx?=
 =?utf-8?B?MzY0Q251ZkkrbzJLbWpGNU5VcDlXNGlxa2lpNTBxbWo3MGU2ZWNDL0oydCs0?=
 =?utf-8?B?d2xRWEY2SjlGdW1sOTFDNnRjbUs0SkYzR3g5YkxMVjRUYldOZjdsT3k0SURB?=
 =?utf-8?B?UXp5OEV4L0VYVGhyVjNZOWM2bDBlK3dTUkJMbHdSRHNlbitwbDU4Y0VLNlNl?=
 =?utf-8?B?dkF1b3RsU0FQbUVlUElnVUJ6ak1FdDA5QU9aRVg4YS9zL0xLc2kzNVJCaGcw?=
 =?utf-8?B?QlBBTDIwcmZYU0s3c1BGcHp6dEZBT1RVNmN5d09VenhGa2RnNE5kbjNaMzhj?=
 =?utf-8?B?NWNHZ3BLVXg0eC9EcWd6clI1eWtVY3kzZmJ4UXFzTDZtb2g5UjRveHUrZC9t?=
 =?utf-8?B?bFB6YXV5RzQwcmFjNGV1dmVTUXNIdDFaTS9CLyttRDNRWUFyeEFXWFFFTE5m?=
 =?utf-8?B?TzlyN3dMUU9tOXpVa1VPNVZTbFlNTmVRM2pWUnQrNHVYRS9qNVlqUTVic0Fu?=
 =?utf-8?B?TmtQZUN1K1hOMngrN2xiajBpakUyU3UvV3NYMjNNMlZsaTVaU0VYSHNwSE5n?=
 =?utf-8?B?QWg3OVpwZGhTMUdFY2RCVGE1U2RJZVZQSVcwMlB6VUZaZEV0bWJBMW5TS1V5?=
 =?utf-8?B?Sjk2VjI4WnlyYzVER2ZwcGwrR00veHJQV0hKL05ZbzJ6Sk04Q1UvdVQvVmVY?=
 =?utf-8?B?YmZmY2c0VWdkOFVIUWdDSXBZVW1WZFB4NjJBdkg3R2VBT2xjbE1KZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5efd7f1-bd3a-43fc-5c70-08dec2edd0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 10:32:59.6783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3uMYwuWQt+EGhqCXvOuPIFPnox/B9Fyvq/EWeUp/2BPatrT5AKAQxRvxUdmkjIPKudjwjtW9qLlljb4N2FfJFpkARorGt/1SE3Rnx4dGA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10538
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38010-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ED18647735

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDUgSnVuZSAyMDI2
IDEwOjQ4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS82XSBwaW5jdHJsOiByZW5lc2FzOiBy
emcybDogVXNlIHJhd19zcGlubG9ja19pcnFzYXZlKCkgb24gcG93ZXIgc291cmNlIHVwZGF0ZQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgNCBKdW4gMjAyNiBhdCAxMjo1OCwgQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiAwNCBKdW5l
IDIwMjYgMTA6NDkNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS82XSBwaW5jdHJsOiBy
ZW5lc2FzOiByemcybDogVXNlDQo+ID4gPiByYXdfc3BpbmxvY2tfaXJxc2F2ZSgpIG9uIHBvd2Vy
IHNvdXJjZSB1cGRhdGUNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIDMgSnVuIDIwMjYgYXQgMTc6MTcs
IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnPiB3cm90ZToNCj4gPiA+
ID4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgcmVzdCBvZiB0aGUgZHJpdmVyIHVzZXMNCj4gPiA+ID4g
cmF3X3NwaW5fbG9ja19pcnFzYXZlKCkvcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoKSBmb3Ig
bG9ja2luZy4NCj4gPiA+ID4gVG8gYXZvaWQgY29uY3VycmVuY3kgaXNzdWVzIG9yIGRlYWRsb2Nr
cywgdXNlDQo+ID4gPiA+IHJhd19zcGlubG9ja19pcnFzYXZlKCkgdmlhIHRoZSBzY29wZWRfZ3Vh
cmQoKSBoZWxwZXIgZm9yIHBvd2VyIHNvdXJjZSB1cGRhdGVzIGFzIHdlbGwuDQo+ID4NCj4gPiBK
dXN0IGEgcXVlc3Rpb24sIHdpbGwgcnpnMmxfc2V0X3Bvd2VyX3NvdXJjZSgpIGNhbGxlZCBmcm9t
IElSUSBjb250ZXh0Pw0KPiA+DQo+ID4gVGhpcyBkcml2ZXIgZG9lcyBub3QgaGF2ZSBJUlEuIElm
IGFueSBjb25zdW1lciBjYWxscw0KPiA+IHJ6ZzJsX3NldF9wb3dlcl9zb3VyY2UoKSBpbiBJUlEg
Y29udGVzdD8NCj4gPg0KPiA+IEhhdmUgd2Ugc2VlbiBhbnkgc3VjaCBkZWFkIGxvY2tzL2NvbmN1
cnJlbmN5IGlzc3VlIGR1cmluZyBhbnkgdGVzdGluZz8NCj4gDQo+IEFsbCBwaW4gY29udHJvbCBk
cml2ZXJzIHVzZSB0aGUgaXJxc2F2ZSB2YXJpYW50cy4NCg0KT0ssIHRoZW4gY29uc2lzdGVuY3kg
cG9pbnQgaXQgbWFrZSBzZW5zZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

