Return-Path: <linux-gpio+bounces-14561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86805A03D67
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0831652E7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76F41EBA1C;
	Tue,  7 Jan 2025 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZLqsIqlf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A71E9B2D;
	Tue,  7 Jan 2025 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248514; cv=fail; b=qVyaFhlp795Xn8nhJqEug7Qz16VrFpch1gyNwRfTUaQJTyAHPr19CpOKwIWIMJByBHWaOwNLjBuDhAPQMw1bw59Cv2gEKE647sjrt4qCssaMYS4j0Pzqf2VSkGWM9vb+ZeCLcGxTehVhvLSDX6njH14ucs4dB+/lNFsn3X9xxPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248514; c=relaxed/simple;
	bh=tIShT7jbf1PN2xuEC8lbT2IgiaK9qc8dkgbdtjgdbfE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hSQ+S+iM8Kf1RBEFLWXlS7ZI10Vfd6LJ1CBLHtJ0e8X+WfRt3AdhO8E5K+rGCcSFgrkNZqtjKE4VArq2s/huWneY/a3gbkhcyc3V3gvRlEkZ1rd/RSsFRW8bX6CpgOBadrh4Sk9D7uvT6MYl8d0C0ZOGBBYLOhzHkPb56B1lEts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZLqsIqlf; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuAoqsGNLetfwFzkt5AjsXij4xPX0cJ29iiN4K8M/AZPJolG09LPOEm+3/RZ5Zm2sidgRgFZWNyWEK+Zba7WdGlyd5VQE0hBZn+VDkWsR8Wc7iteTbb66cStvnfcfg8EdbOWphga6zZKyGTvNsxh8YUnuDIAGjUVWNLtfW2jj0Tbb71Rql2P0IadMtnJRS3InXi/hvT6d03uA7M/cTn1BR+p0sA6ePRENFgl3Bolkfw7Cfxk+kFi4AlCJYlDM1J+C12dg71aiSYcJnO2FXLK31k5PZsGAvbtEk8a0W0ml0IvdO95UuNP1QqkNA5YF9+A3ohwXUjnXJLZPjFR802ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIShT7jbf1PN2xuEC8lbT2IgiaK9qc8dkgbdtjgdbfE=;
 b=rTQx23ZQIuDfxaM10Q285LRabaJaxWLjfKq1x84/s6Qy2tgqs34cvmdL6f0F46mcYC73Dt+uXhL1LnTHCqcnvqao4N5l4DK+ZEOmxmYPWF8XzfXWqu0tyr5KF4g9gKnp6jekjFofLuR1JQvVFG2/kv6uemGYToXRkfq5K7X526zSaLjVwRLO4oGBg3IcXWQjPqKqsNq/gRaFSHwl0ehmBbe0v+HlRaHNBaUPYVi7gTerHU0DredVVhnWk/Db43k3oBIrMfxEsJaBf2LtGEcmpuukNOTUdWwoD+mcMdx9ijyfLVpBWXMOxxeySBpI0TmgXk2S9X2/qJWj59Fvvh7x6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIShT7jbf1PN2xuEC8lbT2IgiaK9qc8dkgbdtjgdbfE=;
 b=ZLqsIqlfQiLyA6SdWZaZAGeyIBa4UvoCD1422LNVZgHPBsZpy+U8gehlEUX4HN5NHTN+zOoBp6RCsq0l2x5w1n1kHXkiV1wu90LTbgSbICY9oderv9bv1cz3x8eG7RNQsew6cx+jPy8R/CsUzyHKCu25IKSwg1zynZB3Vg3GSao=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10510.jpnprd01.prod.outlook.com (2603:1096:400:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 11:15:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 11:15:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v4 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Topic: [PATCH v4 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E
 SoC
Thread-Index: AQHbT/Q61YxPzqbHokGB9ZMVbEtX8LMFf3YAgAXLGhA=
Date: Tue, 7 Jan 2025 11:15:06 +0000
Message-ID:
 <TY3PR01MB113468C66C40AAB27E18A7DC486112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXBt_awS3p2GSd3eB9EGMm+L3iBSaNf+t7d-014w5aVjw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXBt_awS3p2GSd3eB9EGMm+L3iBSaNf+t7d-014w5aVjw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10510:EE_
x-ms-office365-filtering-correlation-id: fcb5cf7d-8cfa-4c33-e51b-08dd2f0c8a73
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFN0cUordjk4MEpNai9sVi9JMHF5R2JVdkhlME9JSTVVdXU1aUZFMnlvMXQx?=
 =?utf-8?B?ZmsrZC94c201cHJiZjZPM3NlNFMrdzlCdGF0UkN2d01uSldGcmZJVUFrRURI?=
 =?utf-8?B?NWRWVTU3OWs4T2RyN0dPRjVkSyt4MGFNYWYzWG1qSTdJZUlacGNTa3lVcUlx?=
 =?utf-8?B?OVZITjdBTEJsT25sRENVbU1KbURWdmIzK1ZDd1dWZG5IbXhmcEF5SXg4SDhk?=
 =?utf-8?B?NkJXb0hxaDBaS3lEbHcxQ0dMYzdCUzUvMFFwOGtHTzkrOVp3eW9nako3TzVK?=
 =?utf-8?B?MVdOMERSZ1c3LzROb3ZZektpeWp5K2RIckx0QVBFL29ja2wzbU0zUXpRcHVz?=
 =?utf-8?B?YWVPd254Y3JGU0JWajkzOHJBZjFzbm1KakR3QmQvYldoZlVyeldQRHVOTVBm?=
 =?utf-8?B?N0ZMa0ozbk1rWFhTbnJKZEJYUDVTVmwvTmppUWRydU9wVk92d2Q1S294QkVs?=
 =?utf-8?B?Y2hDVkp0bmdLNTg0T1hGdm9rRFFpL0VraVMrVzRJOUhaaWg1UjhIOGdiVCtN?=
 =?utf-8?B?andHTVhLR3VuZEVYZkVvVW8vc2NlZG94alp1SlA2MmVoeUNsdUVnU3dvZExs?=
 =?utf-8?B?VUZrUERKVDlUUHllMk5HV2YrVmNsc3JMUERPZGxqbDBvaEl0OGM5SzVvdjBT?=
 =?utf-8?B?UkxmUkZmbmdDUUlIR3VhMkppSU9sektYTm13TnlTQWovb3lMUmRrQi9UNXpy?=
 =?utf-8?B?SStCem9OaWkyYzRFZDRtQlFUYWdhOWZ3YkVNTzlVb09ETUVIckhPUmUrdmRD?=
 =?utf-8?B?QXlpbkJwVmJ3cTRhMXFycmdwbmlKQkk3bTJQdGNwWmxoNStPSDNCdUNiaUdT?=
 =?utf-8?B?ZGJzL1lBeHIvZER2UE15VFQxdklpdkxXSTJlOUxVdFBmZFkzcjFKcGJUajRr?=
 =?utf-8?B?MHNPY2FMTkZBa25pMlYrSDVoK2dvU0xXcDN5UGwvUWpweGE1bHJLV00wQ1Iy?=
 =?utf-8?B?OGNvM1NJWmw1bkl5ZkNZb3hJTk1zZjB0TWVGeGpUV3NFd1FKMVJVTDdDdk5B?=
 =?utf-8?B?bWlRRktuZjNTNnRmMk9ReVNGTStFN1dzS2NQajJZYzhLTjVxWXRpemRuSXpD?=
 =?utf-8?B?Mk02S3NsVDhqdElqV25SNEtnRDNaUnBUOHhtTEIycVJLWEV2bE81OWMrWlQ5?=
 =?utf-8?B?QWZjRmdaS0E1bENmcW03NHdXSEJMbEpGS1g1akRMQ0xvc1R6VGxCbzh3NGRx?=
 =?utf-8?B?QzlURGFSSWdDU2RBNko3YityTGxYMEFhUzk3ZHVaTGl6b3JNSVN2ZWtYaXVM?=
 =?utf-8?B?Z25HZGJuL2thSVZ6d1NCeGtUMjdWbkd2aGNwQytqSzFSdzkwU3BnVExCNTI3?=
 =?utf-8?B?dU0xby9USXBIRTJtTjg3d2wxbE14cmUwRnZNS0RDdkFLZGVEK256Nm1tUnNq?=
 =?utf-8?B?bEhPUUhTOVFad3c3L2NYcUhBd1N2SUdveFF4S2hlb2RNSDBBM2xRdTRMSEZh?=
 =?utf-8?B?N1R0RVlLc0c4LzFMVHhZQklITFlqSlQ2Rlhhb3VTMWJUbzdZQXNEZSt2OWpo?=
 =?utf-8?B?V0ZKWTZkdzYzNTFxWG5VcE5KV2NtZEdTQlJtQ2NXSDN2VUZkQzZHRXMxTTdF?=
 =?utf-8?B?R0lISUNvQ3RySndrcFduK3p5alBLbUhjS0VuR3ZRLy9qanYyMWxXMW5IOCtj?=
 =?utf-8?B?ZDlBZ3hEaEp0cmx6NEZUSjdHSS9YOG5HZjZJcFgybTE3VE8wbmZJNzZndU5Q?=
 =?utf-8?B?UWQ4QzJnRlVSKzJ3MWgwMHBLSWFRanVkcmh3U1hWNEdxV2h2UXFUVlFhRGFY?=
 =?utf-8?B?WlVMbWlCYkJqeG8wNFpnbkFjcXU3Um93K204MWEydkxRV2dnRnBKTXdRaTV3?=
 =?utf-8?B?WDNHYTIwdUhqVTlWUG8xSVRxRlEzdHJwOFgyMFlBb253MUZ1NW00YnlRMjhD?=
 =?utf-8?B?UjM0TStpWTFFVWtZeU9hd043Zm9jeXR3QmJsNUp1WHczdnBLRk1qdWtLOUUx?=
 =?utf-8?Q?lWjZ69XIJBkSss9/xVyNw1jqOijBU3Un?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEdVbU45R1A0bkE3d0h1YnArQjZqNHpyWTUwN3dHdFgzZHdqbVRpdlMrWnNB?=
 =?utf-8?B?OGFzS2taWjMwOHByRGxLSVRNaG10M1BIKzdNOS91Q1ZTS3AzZzE1V1YvNndB?=
 =?utf-8?B?aHNYQ3NnR0NDREp2dlFycENLRHdiZXYyU09sM2txYWVDQWxWaGdIK0NoMlU3?=
 =?utf-8?B?Tzk4TSt1QmlqN2hqd2wrbDE3b0hvVDAyMGFuS1JBQWtWMU0xT3V6UUtETEly?=
 =?utf-8?B?bWplNVh2WFJrR2FFcnBPcm5HTWRES25jZFBzU1kyZUw3OS9jNW50RVJ0ZTNx?=
 =?utf-8?B?cUxweVpFWjhzQzFwT3VuUE5KYklFSUZyRWlVSTZPS3R3T3crK2laR1FLWm5x?=
 =?utf-8?B?NUJEQmRPN0p6cVZ6ZjNlZkVUekxISFlBQ3pGYlZxaEFycitJdVNyeGtubHpO?=
 =?utf-8?B?OGkwQkZSNWJpT0tLNDJpL1RuY2c4NmY4VzFvaGZqRy9jbFY0UWQ3U3ZmTlNa?=
 =?utf-8?B?cVRKbFFycndKMzJjdTM5elV0V3cxYW9xQUtMazFiOWs2ODlCRk9UamtNbzN3?=
 =?utf-8?B?bGdDdGlxMWZGTmVOUW9kaVNTMkZyTFdnaURmTzhLMTN4Mm5YR2hTME9LVkZI?=
 =?utf-8?B?L2tMV3hEOEdCLzlyaWd2algvRlhaL1VoQW5sNHBXREp5Ymp0WUtqeXYyZXpY?=
 =?utf-8?B?c2NtV1c0c2VVTER3RzhoeW15aGtmaFZPMXFwYkpQb2J6Vjc4REJaRTJjcFhj?=
 =?utf-8?B?dkpSY0VJclJkNjRYTVdJRHZra002U1I1QWxzZ25tenRzejFwdlcwRmMvMThk?=
 =?utf-8?B?Y1RXdWZrb0I1WFN2WUYwa2drZkZ5Y0E4Qlhrb3N2MTJCeHlsRzh3UUpxaHU5?=
 =?utf-8?B?OENGbGpVYzR4TXg3SmRTQnVMT2dUV0dUZDFKc1V4aFFUV0FPeVZsTWUyK3Bj?=
 =?utf-8?B?SVROVkdScnRBOFQ0U0pPUWdOSkFQcDBCLy9BeksvelNiN0RSUVZxZFV6R0RY?=
 =?utf-8?B?TFdkK1Qwa1RzeHExNDZzb0hRV0ZoVUJ4NGhuRTNFczVXTC90Qy91eGtydEZ5?=
 =?utf-8?B?VVhRbG5YbGhwekgwc3ZmSEVmRlRrU3ZNdXNSOG1VNFM3MFhwNXdlU3MvOXI2?=
 =?utf-8?B?Qk1vZU5TSVd2L3QvYlE5eTE3ODNLbXJSUHFlUVMwdlRURlFkbjl4TkFnYlFP?=
 =?utf-8?B?RDhRUHJXOG8vYzJnSmNrV1hpYlREOUV4ZVo4OVNWYnlnK2tMdjVuc1NsOE0y?=
 =?utf-8?B?OUdzcFNCdlE2NFk5ME5ONkxjK05nR2NNbHNObDArQ0lQNS9haXNkdmNiMDRQ?=
 =?utf-8?B?MTN4dlIwV0c3K1JkbTNYaFhibTlVRjJZdWQ1eWZIWUxHOENJV3VWNm1qdnBw?=
 =?utf-8?B?TjJvU2hkUGhVdEtRb1Nnc1MwK0s1Ull1ZVdHajU4MHRiWlNGZnJ2SUxBZW8x?=
 =?utf-8?B?WXNNdGxPcnhXcTVuWVNSSjBlYzNoY1htajdRa1ZXYXAwWk1EeVdQNHRVOE83?=
 =?utf-8?B?Zis3amRsZGdqZGJpTE5EYlR1TXd1dW00WWt3NWtMcWZiSXp5dm85NnJKOFJi?=
 =?utf-8?B?TG5CZFJMQU1WMXIxSkxtZTU0Zk1FWjY5cjh2b2RMMGdXWWdNWEhieG1GOEZN?=
 =?utf-8?B?YmNNTlp6QnVSWHN2dFFBcG56QWVkb2llQm1EY0IvSEp2NHhZNVdvcy96QWcv?=
 =?utf-8?B?a0lrK2U5TWlNVENWd1R4UG5YUmMyWnlyTndwQjNOVjNZSnZJM0s2MFBXTGM0?=
 =?utf-8?B?V2Y5K2hCVUtvWEw3cjJkUVZTNWRDMUhyd1lDd0hoakM5bU5VOUpUV3JzUE56?=
 =?utf-8?B?dlFIZndUc2ZON2xnTThvVlRFT1lCdGNBSTZONDBqelRoOWNCcURXc2tRVHFa?=
 =?utf-8?B?WGpCNVp6OXdQZWx6emU4SjJ2bnhwOXJLU1hlNlNvdUwwTDUrVUVZZmhjUkpL?=
 =?utf-8?B?eTdRM0RKcXBoVGE0ME1mNzhpYzhZVDc3K3RCa3hsZHd1dmtUampLaU1BNTd3?=
 =?utf-8?B?cXkyNEFJRW9wTFdUL0hpc21JbUsxcE0weTgrVS90Y21TWEVuaEwyQVFZdzBZ?=
 =?utf-8?B?WHFCOEhNcUNYTXJCdTFyZE1RTEZabUtsUVZhQnJhMHQ4OUFJaWt6SG5jWEJM?=
 =?utf-8?B?RmdXU0psTGJZMnhLNFZ2T1lzaWd0TU5jMUdnOHJ3cjExWlJXQnZDMTYwaVJM?=
 =?utf-8?B?ZnY2VFo2cjJKdENDbXR2WTJBTk9hbnNJT1pkZzdzSVpCK2krL1lIcFF5MGVX?=
 =?utf-8?B?UHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb5cf7d-8cfa-4c33-e51b-08dd2f0c8a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 11:15:06.5357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLzGeg/hiJM6tKACB2/MnDN9eTHxY+5nYaG4SKiD70V/Qi0Us10/X0ZpunuqDbDwW9zW/O/zjSnfCVPmMrTJTfudM5DcBe5ein1rDz4+/yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDMgSmFudWFyeSAy
MDI1IDE4OjQ2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi83XSBkdC1iaW5kaW5nczogcGlu
Y3RybDogcmVuZXNhczogRG9jdW1lbnQgUlovRzNFIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+IE9uIE1vbiwgRGVjIDE2LCAyMDI0IGF0IDg6
NTPigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
IEFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgcGluIGNvbnRyb2xsZXIgZm91bmQgb24gdGhlIFJl
bmVzYXMgUlovRzNFDQo+ID4gKFI5QTA5RzA0NykgU29DLiBUaGUgUlovRzNFIFBGQyBpcyBzaW1p
bGFyIHRvIHRoZSBSWi9WMkggU29DIGJ1dCBoYXMNCj4gPiBtb3JlIHBpbnMoUDAwLVBTMykuDQo+
ID4NCj4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIERyb3BwZWQgYWNrIHRhZyBmcm9tIENv
bm9yIGFzIHRoZXJlIGlzIHNlcGFyYXRlIGZpbGUgZm9yIFJaRzNFX1AqDQo+ID4gICAgZGVmaW5p
dGlvbnMNCj4gDQo+IFlvdSBmb3Jnb3QgdG8gYWN0dWFsbHkgZHJvcCBpdD8NCg0KT29wcy4gSSBt
aXNzZWQgaXQuDQoNCj4gSSBndWVzcyBpdCBkb2Vzbid0IG1hdHRlciBtdWNoLi4uDQoNCk9LLg0K
DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bp
bmN0cmwvcmVuZXNhcyxyOWEwOWcwNDctcGluY3RybC5oDQo+ID4gQEAgLTAsMCArMSw0MSBAQA0K
PiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpICovDQo+ID4gKy8qDQo+ID4gKyAqIFRoaXMgaGVhZGVyIHByb3ZpZGVzIGNvbnN0YW50
cyBmb3IgUmVuZXNhcyBSWi9HM0UgZmFtaWx5IHBpbmN0cmwgYmluZGluZ3MuDQo+ID4gKyAqDQo+
ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4g
KyAqDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX0RUX0JJTkRJTkdTX1JaRzNFX1BJ
TkNUUkxfSCAjZGVmaW5lDQo+ID4gK19fRFRfQklORElOR1NfUlpHM0VfUElOQ1RSTF9IDQo+IA0K
PiA+ICsjZW5kaWYgLyogX19EVF9CSU5ESU5HU19SWkczRV9QSU5DVFJMX0ggKi8NCj4gDQo+IF9f
RFRfQklORElOR1NfUElOQ1RSTF9SRU5FU0FTX1I5QTA5RzA0N19QSU5DVFJMX0hfXw0KPiANCg0K
VGhhbmtzIGZvciBmaXhpbmcgaXQuDQoNCkNoZWVycywNCkJpanUNCg==

