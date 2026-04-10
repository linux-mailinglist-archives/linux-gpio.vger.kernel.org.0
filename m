Return-Path: <linux-gpio+bounces-34977-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDASEvFZ2GmWcQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34977-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 04:01:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BF3D1485
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 04:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 384E43038AED
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 02:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5628031E85E;
	Fri, 10 Apr 2026 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="ibX7K69o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023085.outbound.protection.outlook.com [52.101.127.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86C2C21DD;
	Fri, 10 Apr 2026 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786436; cv=fail; b=TT6sKDvGj9SRr4HcW7Yv/ckQeFFlmFHVNTF0f4+VmQP5pSEHAkQhqQkBn5wGQAusDj8O4zZTy0Mtc1gAUhwuzWz3dudV9xVPemGX0nxVEYgPUhPXUr3urxqnSDW1t5jD3AjBMJuBV07cckaEIAGKk9TYHr3C22+u0eVtCVljTTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786436; c=relaxed/simple;
	bh=jdgD6MY09cHmoInU5rgarnsmCCRD888s3F7xzaHndr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iD5qc6cyISYbhN6jUExIvXSVh6eEX4TngHz626PP++mPjqQ5NH/KggI0d/0R9Vhq6oAF8psr1GCxrlZY4j64DCDa6dEA2fVOjI+CrT8qRm1bmtE1ha70+nv3YbElgLBSwo4xM5kmd38VwQr3SCzS37c/Vtogz3vKj5+QxnlZ4R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=ibX7K69o; arc=fail smtp.client-ip=52.101.127.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJp9Nwul9/Puf8nLGXCLwhNs4LqoXAxD9etLB5x22qM/UA1srOlgM7FOA22M2Ex/3ZfW/IQx9Bmvvic8LeFSoC0q3TGvidvQopdBoNKmMmcX0jWRkcmCroVtDwFfcqATTatvUNN3aEVIHT7XJYEdWERLZvpX2uRXiv7rITCk8bqA6La35reuFM/oQJJBNEQrmM3HZsHOG+CHifSh/J+JuWlmSbtzHkg6+zbcGg5aGyMJDE+UAx7gQJnoCtEPAB5dN0PxOw7QfhrpyrFfbQQZHplRW7k3qasndMJzD5W16SsScYyFHBhPAja3VBcE9rVcnRyIngkTLjRhoBpwSJXwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHK71ON6lJ+MXR67GSxYCwlNPv1i5XQntjwfSxkfAgM=;
 b=VqgM6SFb8PTVkbeaPWS5Aroihvl8RI2coYsAisL3GXCMFS60uWyPLZJockh8C3Ulqpj76rWhelaDm1UZTBEmhuq0tLI9R7CyYlH8GPL/WixAd8JAFYPhGEVyOA679oymb1ItWzyLWTmzN2uukKKLYNDnnFZoHPzZJ1JgX72n+rD+2st4y7bJZJhG+Ku21vamN1f/Ignf8uwAuF3nWe3tIkO3ZJqT+nD4E5q0oqZ4qfgPTBMvgvK3wrLdswmnl51gOtR69dV1DHv0MaKw6hN/MrJWDu1yM8Q2dljPv/5N80Q452gOp2RFlUwrUhxCUhGyw6XBwP3kcItOR5PDYK5vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHK71ON6lJ+MXR67GSxYCwlNPv1i5XQntjwfSxkfAgM=;
 b=ibX7K69ouaEMJp//eGYiU38Wp7qPuiC/U/nmzDcWtpszXG0zWiv/t2BU1fw5rHBe5bQiDUJUb6Is/c5RNwyxSpkmS98rqTMk2lebYGn7huhK8LYuBTbNjnFrvSJBAFPxLH/qHR4sIZs74lzYI7NZbjhnMRfdOSLaAlJUcE44dXgRfzYWLB1zEPNnFzCp1XuaAqOXhYFmwqQkBZEK2gNChxqNe3GequFxBwjPz/3z9Id/23XsAhIfUX6h6tTWN509kEW14oP+8c5Knl9X+sknaZtvasZ+Uh0kZqWp1UHP8lr9cOBBljPKCaj/OGe/oHu/vipiSDhSrl46GUAqy/FpLQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by PUZPR06MB5793.apcprd06.prod.outlook.com (2603:1096:301:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 02:00:29 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 02:00:29 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Thread-Topic: [PATCH v5 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Thread-Index: AQHcwOBzpo2LGWLrJkiaaIjatlvHtrXJwg2AgAGLixmACeiYAIACYRWN
Date: Fri, 10 Apr 2026 02:00:28 +0000
Message-ID:
 <OSQPR06MB7252443E4B4B7A4EE7CCE4818B592@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-upstream_pinctrl-v5-0-8994f59ff367@aspeedtech.com>
 <20260331-upstream_pinctrl-v5-2-8994f59ff367@aspeedtech.com>
 <20260401-adept-zebra-of-bloom-5bb68b@quoll>
 <OSQPR06MB725204B2FAE543A71AEA52C38B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260408133114.GA1938858-robh@kernel.org>
In-Reply-To: <20260408133114.GA1938858-robh@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|PUZPR06MB5793:EE_
x-ms-office365-filtering-correlation-id: 8e937c3e-b787-408f-b7c0-08de96a4f0bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 ww5RLuwxWKd3vwGZ6E2ZJH8plG+WxCGEpgu4SrUQpuqJ3p1JNm95jN4d/jTBIQUZ/eDxc0HB4e/xRoD2Fe2jov2GAE6DbaMEviVIjo7P8vX59/s6VpTr7uBvYIxxIw2O6d//rENvW+yIX6/Wf0NVF7iFrUKNH5SckVNC3vGmIimVj5saiHOPIJ0I3K5af2omIxf//YUc3GaVXXxwR0ScEw3t0lonu5I1Az1DypWrElPfnQwWI7iT2vlDUYQjqyt+8gXJxCP9/qh7/8XHtdRjYWqy/VUbxVhkRtzssYrCVxgZtVTXZWnSRsOLzdrEqpqf7zuljRCYK4WEjbjfz80wDGG6gYWHGS5KRpBXOAAKcJQQFX3lwYogfOaep2Rv+Y5daq9e3aQ5V8JK95aAUKie1ykiXMtoWnJjTME9iRRFRWNmV4aJgueRiVAzhmtxF4RPULlNJDvGmQFc82OYb4D2y8Gd3k+7yAv9UdAd9a8M8VKpVip/vOOUE0yrwH2oz5PjBMNppnEuEJEJkeWoESkX/YsuqejKarNF8UROPytfh6+D6xkzzu80qnlMVudHs5kCZCgUKJVJeNg14w726yyeF9KavfvR7l4gXuLQVIAGqZTe/x7qUTccz0k1H6Wlm3UVMR+udipmIJCAn7gi4gjgsFLmzxU7BWKlQwN1aXopHU4dW2G02a4OGADFZq/XI80ahJKakUZ9udP8ToiNodg5ftwVfRhn8gNEmsDJ1b2ZCJcwvPhJZ9XhFYa8T4e/K56KWt4CSjwvj91lj2YEmF3Nq1+o2qfTer1WsWdXddpicII=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7eRj9MKeKHteIwaP28hicev6bmEE8mM3ekgY3EhYTjWbDpLfltDTce4ekd?=
 =?iso-8859-1?Q?9/9FzHWEKmKe0w2xmOPj/KIZNc+7v2TR/WQiQtXfzJcbU8eIDPVty874ZY?=
 =?iso-8859-1?Q?e2NqixOkZN5sUf+p/OPAsdUzGsQCoGuxP4yIXm28wK7GUUctPiN4zY6kpH?=
 =?iso-8859-1?Q?S/mqHrSUWGxjMt6S/SPSuq0stTYsyLDsUXicmtdEXfScy0zV3spf1zIA+V?=
 =?iso-8859-1?Q?+8thBKLwR47EwqzRsaEEXEEteYoErP2DmD6cT6cfORfF8IWrHTpmA/d9vw?=
 =?iso-8859-1?Q?NXXSTlpRJ2XvWjPwdl/mkNnYjURjRVqXba0wes22jY79Fw42KTvJZ15zX9?=
 =?iso-8859-1?Q?I7iGBZ6KKzIM5k4JCuQXMTxWFGmIBIFZiaWsEbM8BC/MYLR279KbbtqXno?=
 =?iso-8859-1?Q?l2nqE3FhztHX+QYW3J1kRYAOhMP0LmsBJEtiFf9N0vxC7zVOfV+YPm0oHg?=
 =?iso-8859-1?Q?UDpM38H7z85DWnS6AenplWjGPIZ8olytyZtWgFFEZ/PpgorWfcRCqOstiV?=
 =?iso-8859-1?Q?8wip/8zlZE2ZqteWgQKxMxJMIt4DC2nzJaXhtQI0AUBdlfHRFhi5qCkPQZ?=
 =?iso-8859-1?Q?f2ytZXv8iGBQJlcLLdiYzvIR7Xro0iGbBPsFkMLenEzjv8PpyJdlHsBEM4?=
 =?iso-8859-1?Q?fMqbUxGmhlZjdFqdJ7lnfwYTRacub6dDh+Kk4Ly+Os7iKrRe9z4RSfSfrF?=
 =?iso-8859-1?Q?tvy+EqapqIPgmnRGONznib/5LRwgSNZngiZbIFR6sEcTX5OAMuK+UoOVtC?=
 =?iso-8859-1?Q?gekspSf6nm7Z+WPL+fGM3blQFMYjcS2s7TBbRr6lmIJ62smPVuFm0rEX5N?=
 =?iso-8859-1?Q?wDaX0MLguN/p1iL1zSaKRTcdYVcvIuaAhswQhq6XqpxSgm9c1CZUhJvCX6?=
 =?iso-8859-1?Q?1/t4wtfOKKg+6ALF+3dJzB4+s+VNmGzgvaOaao82oPUWwLlmZciTQ3SN1I?=
 =?iso-8859-1?Q?sn5Sz4jUIGtrccD3gHzKB/z/Q7A1ZOz5k9UbREw0s14BJGOFOtVtTtJcUM?=
 =?iso-8859-1?Q?p6Vb0xCAiNk6qe/V4+uVRZuvpVqCqGobLHs7CQEeZwON6JrvDRZ6CreLdN?=
 =?iso-8859-1?Q?TmaM9lzCA/I6sJUZy+lWTDzgdWjTzfv3t5e9boKTOx0Bx6bpdDSHoAgFvN?=
 =?iso-8859-1?Q?kcvvuFYW6gL04jM5t4I2OA9gxwjzMc7qKaBkCyL09Fa6dk4SIkKopa0YM8?=
 =?iso-8859-1?Q?8r8gM82q4rHkH01LZ4dihhMDb7RbNuAC828+wKAvIkhRd6psRZoWQLkvDn?=
 =?iso-8859-1?Q?Cuno7A6vl5OlheDQcmUswB+ki3x5vrSd3bIroWbjQQogloZKsXmpUg0oEv?=
 =?iso-8859-1?Q?/1IJAgPhs4bxezjcN4q3bRf7o21vReHKO6HSglGjw85P/c46KZWCFFS4Z1?=
 =?iso-8859-1?Q?S2abj4JYFxdxzx5qMYDgnJ42WqxJWxL5b06mOVPkka9ktxONePCQGfacWM?=
 =?iso-8859-1?Q?pLQwq9PNyjdbcBEVAgTBQPOFzb5yyqvh4YTi/kMsh/V8U8XzpYxy87hCdb?=
 =?iso-8859-1?Q?qAeHpr3j+j99bOg3pop8dnybj1DEjNL39RyU30j+0G0R/6CwWXNk7u18Sh?=
 =?iso-8859-1?Q?CE33rvJ4Pn+M8UH3+uyCP99RTxyJWyXKWMNk3GqiT4Dt8kre/2pbTJ/mq9?=
 =?iso-8859-1?Q?WCgEfmya7BHywC0VQquG4t/plFZYEVme8rjhPcPeJmyCd480KreGbaeKin?=
 =?iso-8859-1?Q?uX7go813v5FPGt09qpBcHZlnDkdjZ8ND7zvpWHZL8SilU+4zGsVnjj6h30?=
 =?iso-8859-1?Q?vgw6xafJ7hcZrr9V+qu1WwNrAaJ3NYIuP0gWfyhi4BxE4YK58j+9SSz6SQ?=
 =?iso-8859-1?Q?NB/tJrlaeg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e937c3e-b787-408f-b7c0-08de96a4f0bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 02:00:28.9955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgKteBeHeOzp1E/94/C1nxjMbmYCHcWbB6Sfr6BFQLy9B6kI8/iTtuRzzg3dXn8aqzlZA9WMvOqiWpkGhCrMvnUHb3Hjyh09nQGqmpw/dqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5793
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34977-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:dkim,aspeedtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,OSQPR06MB7252.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E32BF3D1485
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > > > AST2700 consists of two interconnected SoC instances, each with its=
 own=0A=
> > > > System Control Unit (SCU). The SCU0 provides pin control, interrupt=
=0A=
> > > > controllers, clocks, resets, and address-space mappings for the=0A=
> > > > Secondary and Tertiary Service Processors (SSP and TSP).=0A=
> > > >=0A=
> > > > Describe the SSP/TSP address mappings using the standard=0A=
> > > > memory-region and memory-region-names properties.=0A=
> > > >=0A=
> > > > Disallow legacy child nodes that are not present on AST2700, includ=
ing=0A=
> > > > p2a-control and smp-memram. The latter is unnecessary as software c=
an=0A=
> > > > access the scratch registers via the SCU syscon.=0A=
> > > >=0A=
> > > > Also allow the AST2700 SoC0 pin controller to be described as a chi=
ld=0A=
> > > > node of the SCU0, and add an example illustrating the SCU0 layout,=
=0A=
> > > > including reserved-memory, interrupt controllers, and pinctrl.=0A=
> > > >=0A=
> > > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > > > ---=0A=
> > > >  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 117 +++++++++=
++++++++++++=0A=
> > > >  1 file changed, 117 insertions(+)=0A=
> > > >=0A=
> > > > diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-s=
cu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=0A=
> > > > index a87f31fce019..86d51389689c 100644=0A=
> > > > --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=
=0A=
> > > > +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=
=0A=
> > > > @@ -46,6 +46,9 @@ properties:=0A=
> > > >    '#reset-cells':=0A=
> > > >      const: 1=0A=
> > > >=0A=
> > > > +  memory-region: true=0A=
> > > > +  memory-region-names: true=0A=
> >=0A=
> > > Missing constraints. From where did you take such syntax (so I can fi=
x=0A=
> > > it)?=0A=
> >=0A=
> > The intention was to constrain these properties conditionally for=0A=
> > AST2700 SCU0 as done further down in the patch.=0A=
> >=0A=
> > I can update the binding so that memory-region and memory-region-names=
=0A=
> > have baseline constraints (e.g. minItems and maxItems), and then refine=
 them in the=0A=
> > conditional branches for AST2700SCU0, AST2700SCU1 and others=0A=
> >=0A=
> >   memory-region:=0A=
> >     minItems: 2=0A=
> >     maxItems: 3=0A=
> >   memory-region-names:=0A=
> >     minItems: 2=0A=
> >     maxItems: 3=0A=
=0A=
> As of this patch, you don't need that. You can just define the regions=0A=
> and names at the top-level. And the conditional schema only needs to=0A=
> disallow them for the appropriate case.=0A=
=0A=
Based on your suggestion, I will simplify the schema and define=0A=
memory-region and memory-region-names at the top-level without item=0A=
constraints, and only disallow them for the non-AST2700 cases.=0A=
=0A=
The updated structure would look like:=0A=
=0A=
    memory-region:=0A=
      description:=0A=
        Reserved memory regions used by AST2700 SCU to configure=0A=
        coprocessor address mapping windows.=0A=
=0A=
    memory-region-names:=0A=
      description:=0A=
        Names corresponding to the AST2700 coprocessor mapping windows=0A=
        listed in memory-region.=0A=
=0A=
    ...=0A=
=0A=
    - if:=0A=
        properties:=0A=
          compatible:=0A=
            contains:=0A=
              anyOf:=0A=
                - const: aspeed,ast2700-scu0=0A=
                - const: aspeed,ast2700-scu1=0A=
      then:=0A=
        patternProperties:=0A=
          '^p2a-control@[0-9a-f]+$': false=0A=
          '^smp-memram@[0-9a-f]+$': false=0A=
      else:=0A=
        properties:=0A=
          memory-region: false=0A=
          memory-region-names: false=0A=
=0A=
Does this match what you had in mind?=0A=
=0A=
Thanks=0A=
=0A=
Billy Tsai=

