Return-Path: <linux-gpio+bounces-25169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB35B3B225
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 06:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9482A568256
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 04:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6F318DB2A;
	Fri, 29 Aug 2025 04:33:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023107.outbound.protection.outlook.com [40.107.44.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126830CD9F;
	Fri, 29 Aug 2025 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756442037; cv=fail; b=et9BxZmg/Znnwt3X0aqcbXzycnNkaLEFEoEXKiYFXaW5UFzaBaFaZoLLbX+iIpfBrF2irCP+c4ErnO9VC10wmu+RNvqMFWLUhzHnqZHif/3T3vynJVS5ijmi16Lj1LCjUwrGhkOaxyysxP3icGddKaF8SFUrDr6RxS87Zvh6eUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756442037; c=relaxed/simple;
	bh=AUXr+tIIsAviTnLCGBJOVogZQldpneFjN8eUz1HAQwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cm2mApXuw/EYxMAfmMW0s9egBFRDSwYw8UqbNrDqNjBxVXTS/pvZZuTpfNmb7Gl9CIpC/zACttSvbOHS61+estD576H9fK8TAgHYZ4qhzUBwYXislyGC/gby8QLJLihBTtgObIwSgzSx/jxdkH25NFJRLGAnnGVi646vT07P1Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FggevE17fOPE1qAaaahyyQuVlgsq5DIqhi5ra/QgSsUPrAOU3ikjBIAK1lRr0hKncNGZmFxOVKj6aT7XVorhmnVN05qXS795jR9RTnJmaIkwj+WIS3r7ZBy9k2oc3Gw9emCWRITQKAGh3q1Y3cr0WPt62EJ+aslwdHLa6nZPFX240QhYWeYDYPas6cdswYQcx7KwACtiUz3BBffEdPGHYDWyzMRh7CXW4VqALmFkBRaVppCIbwuJyd+uPLufrDaW7TBVtNRN6ujX1ckkxH0DBD0vKCCPOlokwV0F77uGypU6CNDiHuRV+PMc6GmGXPMxKppjBvx5fn/UfczaTz9Uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUXr+tIIsAviTnLCGBJOVogZQldpneFjN8eUz1HAQwo=;
 b=OgDi2U6uYmTGY9vSQAtayk/xDh9JTB5zglRrWrPvhfC4CqtRzhH3JXnUt1iic6g08rZmZIeKnStRCkbKwD0aeJ5a1aX1CSjqJxpjLqIRePDELSX9ZUAYg/jp8PMu8RIzJwYmMwG/L3b8K/vv2ELa5CnK4/Wh03s1kwnHPhX9qIulpGGzMTsgM7FXMF4UIjaL5iHjVkV0HsK5KZOUuS0vGh325hcylnb8ppZLZYyJ2LhhV2CCKM/y+LMaihUmX6g7sqdfq9wblQgNCEv1yS7QZITQ8NY2M2Ap/1kOCH+p9WlCd4aWkstoAji0eFkDuHQDlfsBlBbhWgYfaq/U7H0MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by JH0PR06MB7015.apcprd06.prod.outlook.com (2603:1096:990:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 04:33:50 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Fri, 29 Aug 2025
 04:33:49 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIDEvM10gcGluY3RybDog?=
 =?utf-8?Q?cix:_Add_pin-controller_support_for_sky1?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCAxLzNdIHBpbmN0cmw6IGNpeDogQWRk?=
 =?utf-8?Q?_pin-controller_support_for_sky1?=
Thread-Index:
 AQHcFvw6qghsaPXOZ0esSR04j9LnwLR2NgmAgAFjVFCAAAhkgIAAG+4AgACflACAAJmccA==
Date: Fri, 29 Aug 2025 04:33:48 +0000
Message-ID:
 <PUZPR06MB58879645FFBD2B7D2B7E9BE4EF3AA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <PUZPR06MB5887BFF27AAD64ACA625126BEF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <5d8aa064-6dcf-40ce-9e73-feaebca06965@kernel.org>
 <PUZPR06MB5887436E03C17498E80E43C7EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <f54d43ca-87cc-40bb-a56b-e49ee6a0a441@kernel.org>
In-Reply-To: <f54d43ca-87cc-40bb-a56b-e49ee6a0a441@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|JH0PR06MB7015:EE_
x-ms-office365-filtering-correlation-id: 9f56e484-8e4f-4933-8942-08dde6b53fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elgxMXYwekorM3VIbHpETDdVMU40RmVwRFFEUHNSYmV6ODE4WVJXKy8zVXNL?=
 =?utf-8?B?MUliWW52a0JaZTZ4RXlwcTEzVkwxZndHMFNWN2llYWlOWXVMc2FQeE90d2l2?=
 =?utf-8?B?WmVzQUJsN1VrZDR1akxnRExmSkYxM0Qwa280dk1wVHFEaUlVeEZwK1RwZUlU?=
 =?utf-8?B?bmVOY244Zjc0OWJ4RFltWWxtN1RRYXo0bXdaaVo5MFNXbEhrcElPSmxmNmJT?=
 =?utf-8?B?RHNsbVcybGQ3L2dMbTh2azZRNXlWcVRPL0pZSG90SHdJaDVxcWVxNjRRM3or?=
 =?utf-8?B?OHFYUDc4dlZRMlZ4Y0dNQ1VUMHhYdFhPdERjT3ZLR0Z2UFlST1d1RVR0V2t0?=
 =?utf-8?B?REx0cjZYaVA1Vk5PQm4wVEI5cUwvaS82VlA1R3FJdWhrUk44VWJqYTEwNHdo?=
 =?utf-8?B?SDFoVnBQK3dZeHFFL08wZHM3c1RlYlhRc1RtVjFoZXFTNUZGQkt6WUJEd2Vz?=
 =?utf-8?B?RWF4Z0ZWRHJSQ2tJWW1WOHJZd2ZJU1J3Z0pxM0JJN0FBOUdPU25PVmI2SXph?=
 =?utf-8?B?bGtJVS9UT05PL2plZlZ6UGFrbFRGRzdCQmVVc0pLd2RuRzVCNnFGdW9jcjNU?=
 =?utf-8?B?eVgzWnh0bDBrZ0ZjbVg5T1hUejBiZHdlczRTUHZvTWxJVUxzenRKOU54T2Vt?=
 =?utf-8?B?WFlMOVRoWmcyS2tzZldVOFVKRWZyTHpTeW1yNHBtd3hBQ216emlveG0reTJH?=
 =?utf-8?B?UUtQU1FXbUtsSDRyUFhmc1RkZTlqYzBySjdXS3dxblZUSXNYSEpQU3JOWU9C?=
 =?utf-8?B?WHlGRVczNXBEUWhTNHc5YmdpVitwQUcyVkxVeFFNemtHNyt6RVNlNUt0cXUx?=
 =?utf-8?B?RlBPSmkvRkEzejBYRXV4dDZiSU1UQTZHRGNsSzFhMGV6UEpjZElORHNIL05X?=
 =?utf-8?B?ZGpXbEk2RVRSNEJaUy9lVGhOa1FyYS9yVEQ4WFozQUZnck1LcXVXaWMxRVdN?=
 =?utf-8?B?Wnd1alNDV2NJU0NxWkw5NTREY2xGNGdZZlZOd0x0UVA4UEtMK3U0TmV4cVhn?=
 =?utf-8?B?OWEyL3BoaUQwVlNvV2x1TkViZFA4aGdmdHAzY2RCSVpLV0tiTWpFNjBSSnlI?=
 =?utf-8?B?ejE2MXJNY2Jwb2VuNlZMbnVaekdMVTNoMmRseTRSeEF6QWxFYWMzUFZCc2hT?=
 =?utf-8?B?eWNtTXRGbVVRS01pR0xFNUlTcUpVdEpNWDVXTmNZQURtQUYwSzI4Mmk2NnBI?=
 =?utf-8?B?ZS9DaU5WZ29wTVdqQmdCRHByWGNMa1pLdEtsV3dJZWgxL3FrWHJERTdyL2Fu?=
 =?utf-8?B?bEdQRTBnKzNueGdZaVlpKzVBN2lLb0dsQVFvRDNQbi9KRmoraHZyRGNScGVx?=
 =?utf-8?B?VVI2Vkx3L1lOcFJKUHYvM3dDd0tpZlhBTlNVWExvYktFbElwQ1g4N0FLdlc2?=
 =?utf-8?B?V29rSjBTZ0pxZnpOQ3VpMmhvZXBUbDcxK2M0enpEeHN5Y3kzcU0rUzBSZVV6?=
 =?utf-8?B?cUtBTDBNNHpsT2wzZDdvT1FVOUZqQ1FiaTE2RmIwcXdFVWpDN1BEMFB4Vk9x?=
 =?utf-8?B?Njk3SkxVOFArMTlYYmE5UllMQTk4SzIvTzcwWkk3SDI3em1hNkttM1MxL0JK?=
 =?utf-8?B?SE8rRGt3OGUyTWtiaWtHMlIwbmlTU1F0K1M4bGh2a1d4ek9qMkszZHlTVzNR?=
 =?utf-8?B?cTJqd2tTM0U2SVRvVU5sM0F1K08rQnZYNTdYRnBSc3BKSHJwY1Q1RnhKYWlE?=
 =?utf-8?B?b1FrMVBFeE1MUmJZUGtmMTFoSXZwUVFsOUpVaUwwZWZ1TDNMUkdvTkRSMDNm?=
 =?utf-8?B?ZmZXUm5CMjlCOUNWZGVkT1NHc2xLdWJ0aHhyWTFYRlNwT0pTT0pSOW1YZWUr?=
 =?utf-8?B?UThrOFZmRVVqUFF3M0Z1T1hJeEZ0blUzNHY4emFkWUFDSkxmdmFUa0dqUWtB?=
 =?utf-8?B?Uzc2dk8zRGcyNFl1N3RMeGw4aGpRUUF2d3JtOGk5ZzhCK3FQREIrbHp0VDkx?=
 =?utf-8?B?b0JUOWE3NXYwN1F4VlFndmJrWGROTk5aWW8yQzVBYUpHc2FCSWlucWRWTnRs?=
 =?utf-8?B?NTdjdnB1dDFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0hYaWxHZUpVTU9VdVZPL2lUWmJTZVkxUkk1emloT0p0Uy94bDNYTnhnd3Bz?=
 =?utf-8?B?UjhlMkRyM2U5NjE0SjJQdEFtd3d0MnZRZGltd21BYzN0MnVJazJTdDIxeHc5?=
 =?utf-8?B?NHEzdUlCNFBrZ0lMVStUWk92VWdwTG1YT1d3SG9CQ3ZxalNXMEQwMk11NWZv?=
 =?utf-8?B?RExkY0xpNUF2VFVUNEVlUHY1RFErM0ovV0lyVkxmUlFqdnRtOXpENFZFZlJH?=
 =?utf-8?B?RVluZ3pKK2JDb2VOQU9hYWIzWFQ3RHhTWkZXTFRJeVloYmVVQ3hTWGJWKzdN?=
 =?utf-8?B?bzBzaVlVLzA2SkFQM3o0VEwvOHA1bmhaVnRRSS9iTzllK1ZuR1RxVGVOK2k4?=
 =?utf-8?B?S21EdzdDWnd6ZFpIWnRWMUJvR3Z6WUJrbjFVWUl3dHlPanlXM0ZibGdjTTZz?=
 =?utf-8?B?bmRRYzUrZjV0Rm1qWEFqRjhKczlRR1ArZkNRQUQ2K2k0QkJyS2xrbUhnZldl?=
 =?utf-8?B?MytGOWdHYzNUeldmRE04a1RCN2Jsand1cG1ra1h4ZXVFVXNjbzNLYnBhRThw?=
 =?utf-8?B?Z0V5eEhGZS80aFI5T0dwd0NGNWpWdmRaTE01UE52TFhTUU1JNjZWMEswY2Fa?=
 =?utf-8?B?N1dORFNDWHdwdExCRy90ak13UkQ4Q25sTlBpeUdYM0pjNlBjOExGZDlmaE5s?=
 =?utf-8?B?angzeGVHMzFjV0djZ1VhY3V6RUtVM294aEloemY0M1F1NVlISHlka1dINnZx?=
 =?utf-8?B?OE51K3U2dUl3dENPY2pjVXVIZEE2YldnV0ZtWThTQnBIamFXYnkxaGJEYkFu?=
 =?utf-8?B?aEEzaS95QkF1NW5yTGhzR3BkQk0ybTBSVERKZ24rNVhxWDh1YkZtMFlySml6?=
 =?utf-8?B?V1BicEdadWszVmtIQ2JoOWhnYzREeTVvK0NHTm5XemxLZ3BGSVhFWDZ6VUZU?=
 =?utf-8?B?YXUzQ2FLVHN0VlI1QU1JWUU1clZ5My95akZnREhEZkI5SFd3MTh3WXdCQU9p?=
 =?utf-8?B?NldXbk5TL1h5K2JiRzlUMjBwd0hicWFSajhiRFVXOHh0a2V4dFdUQWVQVy9E?=
 =?utf-8?B?cHM2RWJlV0psUVBFMGFtN2tjOTErL2FRYmwrUlc0OWZLTnhCVW1LRHV5VGE0?=
 =?utf-8?B?dTZKU3JmNHVjWi9BKyt1OCs4dW53OXJ5dS9BcUFNVGp4akRyQks5cG9BVzBE?=
 =?utf-8?B?T3c5aTlBMnI0SXAyTnI4OTQ2RjhRRkx2RFJzT1FBM0l6bEhEYzBDVlRMNDlV?=
 =?utf-8?B?Um1kanhKUkdXYjBtaE5lYnJNcjRNT1dGeXl0QnVLZXVsQzdGb2dlbDQ4blp6?=
 =?utf-8?B?Z2lhMUl2U1JLTkRlZjJ4QWRaOHAyOHA1TFg4QWpmTDY4QnFvMHFHYVBnT0k0?=
 =?utf-8?B?Z2dxZ0RsclZHbWZiaXQraVZBTXMyaEMyaW5OcjA2VHFEQzJ2Um9yT3VtdUNY?=
 =?utf-8?B?MFRuNklQbVZDSGw0OW9pTFdTTkt3bnkyTTRHeGg1eHNsVFo2QUdoVE9lajl6?=
 =?utf-8?B?ZW12MXRwVDU4cFFSamFMdmd4YWxLUzYxSGVHK0VRVjJIYUcveno4N0UrQXVR?=
 =?utf-8?B?bVp2WFV4TENZV1RpRHJFU2w1ZUZ2R0xvYUVBVnR5ZG1uU0sxcXE3VGljbkJF?=
 =?utf-8?B?Z2lxK2lCcjNvU1g2NjVQVS9vMTVtemhIWFNyYWFjRUh6dHI3RXl6V2VMWmYy?=
 =?utf-8?B?bmNua3hZM0lXbkFoQWtxbVV6OFZnM2dCWENpT3VEaUY2S1NhRHVVSnNXSEpM?=
 =?utf-8?B?V2xLemNxRC9zL1NkYXRTQVJoNGh2WVZYTzdrc3IxRVZobUprNEl0S0JXSG1u?=
 =?utf-8?B?ajd6ZjRVZzhseS9XRWJHejY0ZzF1a1lhT084cDk1Y1p6SHBLZFJJRkovNUhX?=
 =?utf-8?B?MHRsL3M1SWptME15WHRsZmoyb3JRTTFYTnYxMG5CanNtMUdhbUpvMTBGeVVM?=
 =?utf-8?B?S1JPZW1raXd6YVVzZjBqVjE0VWxyb0xzeXZGOUl3VytrQ1hRZ2hSc2c4aCsz?=
 =?utf-8?B?UXZxTDRLb2dJNUdyZUgzeWlEYjZBbnZHcTg2S3E1cUJlMlVOa0pBWktkTGl6?=
 =?utf-8?B?djBUSU83UTE4Rjl4d1VmMUZ2YUxXVnhJNk52a25GV0htZFFtMStiekpkbkRY?=
 =?utf-8?B?Ri9WWjJ4N3RIUUNObU1Qa3RZd2ovbElRUVczSHpTWktFVUtWUVUxUURXVU1z?=
 =?utf-8?Q?FwgY9kkGHZYmbfZGvFL1pJqhn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f56e484-8e4f-4933-8942-08dde6b53fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 04:33:48.9734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: spa/jZGwLhw+ded36fJ/OMuVOXwsqZWy7pOTCcMoepGauYTNqWY7FNInzUFvWNqAy39/KGprQuroOGEtrWDrmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7015

SGkgS3J6eXN6dG9mLA0KPiANCj4gT24gMjgvMDgvMjAyNSAxMDozMiwgR2FyeSBZYW5nIHdyb3Rl
Og0KPiA+IEhpIEtyenlzenRvZiwNCj4gPg0KPiA+Pg0KPiA+PiBPbiAyOC8wOC8yMDI1IDA4OjQ0
LCBHYXJ5IFlhbmcgd3JvdGU6DQo+ID4+Pj4NCj4gPj4+Pj4gKyAgICAgaWYgKHJldCkgew0KPiA+
Pj4+PiArICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImZhaWwgdG8gcHJvYmUgZHQN
Cj4gPj4+Pj4gKyBwcm9wZXJ0aWVzXG4iKTsNCj4gPj4+Pg0KPiA+Pj4+IFlvdSBhcmUgcHJpbnRp
bmcgc2FtZSBlcnJvciB0d2ljZS4gRHJvcCB0aGlzIGFuZCBqdXN0IGhhbmRsZSBlcnJvcg0KPiA+
Pj4+IHByaW50aW5nIGluIHNreTFfcGluY3RybF9wcm9iZV9kdCgpLg0KPiA+Pj4+IEVzcGVjaWFs
bHkgdGhhdCB5b3Ugbm93IHByaW50IGVycm9ycyBvbiBFTk9NRU0uDQo+ID4+Pj4NCj4gPj4+DQo+
ID4+PiBTb3JyeSwgdGhpcyBwcmludCBtZXNzYWdlIGlzIG9ubHkgb25jZSwgbm90IHR3aWNlLCBw
bGVhc2UgZ2l2ZSBtb3JlDQo+ID4+PiBpbmZvcm1hdGlvbg0KPiA+Pg0KPiA+PiBUcmlnZ2VyIHRo
ZSBlcnJvciBhbmQgY2hlY2sgaG93IG1hbnkgZXJyb3IgbWVzc2FnZXMgeW91IHNlZS4gSSBzZWUg
dHdvLg0KPiA+PiBZb3Ugc2hvdWxkIGtub3cgeW91ciBjb2RlIGJldHRlciB0aGFuIG1lLi4uDQo+
ID4+DQo+ID4NCj4gPiBUaGVyZSBhcmUgdHdvIHBpbi1jb250cm9sbGVyIG9uIHNreTEuIFRoZXkg
c2hhcmUgdGhlIHNhbWUgZHJpdmVyLiBUaGUgcHJvYmUNCj4gaXMgY2FsbGVkIHR3aWNlLg0KPiA+
DQo+ID4gU28gd2Ugc2VlIHRoZSBwcmludCBtZXNzYWdlIHR3aWNlLg0KPiANCj4gDQo+IE5vLCB5
b3UgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgaG93IHRoaXMgd29ya3MuIFRlc3QgeW91ciBjb2Rl
IGFuZCBpdHMgZXJyb3INCj4gcGF0aHMgYW5kIHlvdSB3aWxsIHNlZSBGT1IgT05FIEJJTkQgbW9y
ZSB0aGFuIG9uZSBlcnJvciBtZXNzYWdlLg0KPiBQbHVzIG15IHNlY29uZCBjb21tZW50IHdoaWNo
IHlvdSBjb21wbGV0ZWx5IGlnbm9yZWQuDQo+IA0KPiBJIGFtIHNvcnJ5LCBidXQgdGhpcyBpcyBi
YXNpYyBDLg0KPiANCg0KSW4gb3JkZXIgdG8gdHJpZ2dlciBhIGVycm9yLCB3ZSBhZGQgYSBzZW50
ZW5jZSBpbiBza3kxX3BpbmN0cmxfcHJvYmVfZHQoKSBhcyBmb2xsb3c6DQoNCnN0YXRpYyBpbnQg
c2t5MV9waW5jdHJsX3Byb2JlX2R0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2t5MV9waW5jdHJsICpzcGN0bCkN
CnsNCg0KKyAgICAgICAgIHJldHVybiAtRU5PREVWOw0KICAgICAgICAgIC4uLi4uLi4NCn0NCg0K
ZG1lc2cgc2hvd3MgYXMgZm9sbG93aW5nOg0KDQpbICAgIDAuODEyNzgwXSAvc29jQDAvcGluY3Ry
bEA0MTcwMDAwOiBGaXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGggL3NvY0AwL3BpbmN0cmxA
NDE3MDAwMC9ob2ctcGlucw0KWyAgICAwLjgyMTkyMF0gc2t5MS1waW5jdHJsIDQxNzAwMDAucGlu
Y3RybDogZmFpbCB0byBwcm9iZSBkdCBwcm9wZXJ0aWVzDQpbICAgIDAuODI4NTAzXSAvc29jQDAv
cGluY3RybEAxNjAwNzAwMDogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9zb2NAMC9w
aW5jdHJsQDE2MDA3MDAwL2hvZy1zNS1waW5zDQpbICAgIDAuODM4MDU4XSBza3kxLXBpbmN0cmwg
MTYwMDcwMDAucGluY3RybDogZmFpbCB0byBwcm9iZSBkdCBwcm9wZXJ0aWVzDQoNCkkgZG9uJ3Qg
c2VlIHRoZSBlcnJvciBtZXNzYWdlIHR3aWNlIHBlciBvbmUuIFRoZXJlIGFyZSB0d28gcGluLWNv
bnRyb2xsZXIuIE9uZSBpcyAvc29jQDAvcGluY3RybEA0MTcwMDAwLiBPdGhlciBpcyAvc29jQDAv
cGluY3RybEAxNjAwNzAwMC4NCg0KU28geW91IHNlZSB0aGUgdHdpY2UsIG9uY2UgcGVyIG9uZSBw
aW4tY29udHJvbGxlci4gQlRXIGFzIHlvdSBzdWdnZXN0ZWQgYmVmb3JlLCB3ZSB3aWxsIHByaW50
IHRoZSB2YWx1ZSBvZiByZXQgaW4gdGhlIGVycm9yIG1lc3NhZ2UuDQoNCklmIEkgbWlzcyBhbnkg
aW5mb3JtYXRpb24sIHBsZWFzZSBraW5kbHkgcmVtaW5kIG1lLiBUaGFua3MNCg0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEtyenlzenRvZg0KDQpCZXN0IHdpc2hlcw0KR2FyeQ0KDQo=

