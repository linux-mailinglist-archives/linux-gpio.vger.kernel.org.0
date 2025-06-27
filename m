Return-Path: <linux-gpio+bounces-22367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C76AEC0B0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 22:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B56613AC215
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 20:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F63A2EBDEF;
	Fri, 27 Jun 2025 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="KvrF/9Lu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2138.outbound.protection.outlook.com [40.107.236.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBB020B80B;
	Fri, 27 Jun 2025 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055046; cv=fail; b=LemjWtybc6YIg5aosZuZNqCkES5UI05y6LzU9Su/Y2xoh5iuEn9ev0bt8Yh4aEr1fmI7sGjLXRM+SYrhjriVLRHEd4AO96PJ3QJ4l0er7e+B1kkKvpyhMVN0+vaADphrveCcebc4QUDHMiiAzxTRGHJDPizGAXMcEjZfPvizBTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055046; c=relaxed/simple;
	bh=3c4cP6L5gpteUrCz2ovO+1/06rZ6rOuqHkMPJX3qamI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OVSuTp7V1Lleh2kbmhypwge2/Vr9a6giJzd+C+UBMTB6hPIUZ14anQozDcUzrh1Q0VbygE2b/e4ULIUTLZI9mtXZtrv6ZhAzYiGBog56Tl8jPQeW6xWHX9AyJD/K75TDR46mqJKMFMrEOHFe6JrUfrIXZ7RcW/Dgo5eYGt2ek9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=KvrF/9Lu; arc=fail smtp.client-ip=40.107.236.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJkc0NJsO6f4DgampoHtkAqTTSkhTZSfKXHsyNVsoIFVp2I81vBqCS4rAjGbe67GZ17AHxgMRW4Ua6L8gadUl3v4KFhfv6BJ2UZovhMdMadl0SWhvug0cJN87WIQNy14/MSbWMob9v/wwS/DPBBtME5/S78i4l3cHYQrZd/5fDkqWTZ5y+bSSI7oybQMo7VqEqy08kT58gG6mkvDN9vuHk7d3weTF4gyShOqFqVGpitrwwE+PfHv7Xrvn3ElQdfgePu45Bi3F+f6DOV+2IF0NoHuLNkpziy0nEqyyx1L8ESQxTDrPh1Ag7DvG/h3ofwD6pYyjLuINAh+cvNx11S+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c4cP6L5gpteUrCz2ovO+1/06rZ6rOuqHkMPJX3qamI=;
 b=YxNE87N3ANNVKp1lpjd48h80vAYeSC5UlTN8u3jegP0ZKPPuchuzXShe29ccAfYlmoNS2nrBBb/ieRFr9NCiQB6iJjHA+OxX5W7cNcuhKfmg8DwWTeQ/s4WI7U2v/d2VGOxMptxwUlLVREvUv7WeuYM9DKMWyri4yOa54ykRxbqSjyd3Nf2T0qfQQSZZL207GBph1yWVMUAr/iQHGvul6Ote+o/8djqaN4jpWdwy3te/nKsHcmvMdulbBVz5BPgWxIAxBT3GKkDlfJuKXxTaoOY1jfDdI+Q22IK67jviECjBB74Gf8H1YLUEdNcZfhPEuO0J6G4hH2kQXMSvOyLm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c4cP6L5gpteUrCz2ovO+1/06rZ6rOuqHkMPJX3qamI=;
 b=KvrF/9LurQI2ysOlgAkaMupqjEWUrid1xYRMdgqnVzCtQNanuWujZP13VwXkilyRoXlVQEdFNQmKZXMS/ZT+TgGn6VdDhoKRPdaEN22JtXFuxLSkLj+83m+p4NAuAEWq1z6wz5Fm/tx4EAbZI5ufgwDLH1qRnk/4TfEcsL1grR/aS37pZdjSuXZ5zLb5VnP2vkUfRBRwK9iObQ82jMZh355QVvxnY6WFPkBGg7zEZIuyNgyhH0J6OdAVR7eTTfV6DOojMfLuSlKHgFECIP228xKSIjV1WlMpP2egrnsg4YJbQqNzwYIO817LlOJapr/KtCoelYm4u4zU0EBCbXvgLA==
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 (2603:10b6:518:1::cbe) by MN6PR18MB5495.namprd18.prod.outlook.com
 (2603:10b6:208:471::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 20:10:40 +0000
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161]) by PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161%5]) with mapi id 15.20.8769.035; Fri, 27 Jun 2025
 20:10:39 +0000
From: Harshit Shah <hshah@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QXdkqA
Date: Fri, 27 Jun 2025 20:10:39 +0000
Message-ID: <19176da2-920e-43b0-8286-b6864a412195@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
In-Reply-To:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFA7616390B:EE_|MN6PR18MB5495:EE_
x-ms-office365-filtering-correlation-id: 595940b6-ec63-49cd-c0ec-08ddb5b6afab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?akZ2TEhEMmhleFNoaEhEdUoyT0grZng2ZjdiTnk0V2xRQzBIeDhsTk1CSnBW?=
 =?utf-8?B?c2tFZjlmekRFMyswbzFEcHBKVE93VFJDTDJ4VDRwUk5PNGFUcGRnUlZiOVRp?=
 =?utf-8?B?NzZWYjU5Ym1wODhtbGRvZzJxOW82TTRGdXpDc1ZTOXdUanJodGhpTWJTTXZq?=
 =?utf-8?B?TVF4ZTRJSkVpTFVQdDFUSjJCMDVpTnNMODRIanBCM1o3ZWJldUJKUG1BTXlG?=
 =?utf-8?B?Zis4UTBkdWpjeXZXVytWNDVsZGtzemVoOU1PTWFsNTY5QjBid3BqQlhmZDRr?=
 =?utf-8?B?TE1nQi9YVEM5UEwwRHVvSnR4RlZZd2FlYjFJSEJLYUtKN3FVVjRabTBtS1Bm?=
 =?utf-8?B?cDJPMTFOTWhFcGFUZHNDQU1ISnlJTFdIZkRadlJUL3A0eEE4TWxRM1ErRXM4?=
 =?utf-8?B?VHh5WTVPeDRYS3NGZHh6WnR1UnJTTEdsZExXdWI2TEdJUC9kYzdpWDV4QUty?=
 =?utf-8?B?S1FZQXltbm1pMFV5Q1NOaVpqekdrZ2J3SndaOWFYaVUrcm5PZjV0RUpOTDhW?=
 =?utf-8?B?U1QrSVlKUStRS08yc0ZJQVpuWWJRR0RsTXRDdmZlR3BUVzVyRVlNdjBsc29j?=
 =?utf-8?B?bU9Pc1dac08rRnFSejkwdVJERCs4OC9rS2k0ZkRPUnN0U3ptY1RBVmhzUENO?=
 =?utf-8?B?TWQxNVlyWGZzWnpjNzA1RXRaZ0VFVHBKakZBZkxJU2VORDFFU3h6UXJzNnox?=
 =?utf-8?B?VGJ0WU5laElZY3ovSld1T244S0g0NWorVDFUb3hjSTBPL1JrUUZhWXZKa0Vn?=
 =?utf-8?B?eCtHaXlMRE52SVJ2SlYySllKWmdyWXRqOGZFcUJRYWV4Y0VuckVtNWozK2VY?=
 =?utf-8?B?NnNFV1NwSWNZM3RNTkIzSUQycyt0Sm1aYTk4Z1RoZ2xsaGUzV2dlQ1RNL1Q0?=
 =?utf-8?B?OFJOdjZJYzJpMFcyczVteWc1SXdjaG0xYk1SblFHZE90QmxFZmEzckpMbDh6?=
 =?utf-8?B?dURnSU84TFVRVXppMmorQ3JmNUIvWmhKbXFTNGdJbXZVczhCWUEvTFpIcnNi?=
 =?utf-8?B?bnpIZ2VxZVh5OWQ3UUM5MGsrNmkvdmlPV0hWb0NKZERFY3lFVjNJdlJVWU5k?=
 =?utf-8?B?ald2VU5LU0RkemRKRnBFdTBlSnhYOVZJUUxUU2FBdlY5Tm0yVDJUUTVZVmR5?=
 =?utf-8?B?cjRQSFVRd1hlRk1GRDFJdGp4VWFTbDZkVTROT3VycmR1MXI1OWxINmMyTkxp?=
 =?utf-8?B?SHhML0UwK011cWlibDVzNERKaE8vaTljR01NeWMxTWo5UUlya3hjRmFqcHZF?=
 =?utf-8?B?b2owbmhEQ1Q0cDZVd2VZQlBLN21OTWZBdjlnRk1qcWVsbFdNVnBrTEd2cnRj?=
 =?utf-8?B?Y0YzbEtFRXhFOURLTnB4M1lxWkpmU2dLVk9nVE03c3JKV3h6dUduUjMwZ2kz?=
 =?utf-8?B?bTRSWkN5RFlsTkZwMHhIQkJPR2VHdzhQVm5HRXgrVEFmVWhDdDNNWkg4dlBM?=
 =?utf-8?B?Q3VoSDdjbk4wbTNBYnY2T2tONWtxdjdzOGFHMkNwM2gyWTdXS2VONEtENXY1?=
 =?utf-8?B?MXorbndhVi92eVFjblRzaG1kRmJjYmV5QWVwRjR5RUtuY1d1dHJBcUFLOGdq?=
 =?utf-8?B?L1k3c3JIZ2JBZ3BKSzY2WVp5Rk9zNzY0eC9mTDZDVVpSWk5lZnpqSjFmMXNS?=
 =?utf-8?B?aGs1YXhBNVdUT3NRT3lIZXo1TEMyVVVhT2VzaDNtUlRsYXJCL0k5b0d2YWhU?=
 =?utf-8?B?TTJPTXh0NTVhZXZKSW5hbXJ1eVhLQmQvVVdBRm1JTzJJd3laRmZ5N2k2SlVD?=
 =?utf-8?B?bnFPZHlta01YUHNzbjVaSkNxUUtsNy9mUmtnOFRjYWQxdGhHWDlGTHRPUVVW?=
 =?utf-8?B?ZE1ubzRZOGFGRHBJYkpLV2dsVGdTN0FXSTRRU0ZUNGlwb0lxZ3ZoVFQ5bm5i?=
 =?utf-8?B?T1JWT2VsbmlBUmdrVTA2dk9jdXRiRkNCVWxFSE5KdEc5b0NWaktybllkc0N1?=
 =?utf-8?B?S1g4dUxXc01ZL3VvVU1yZ05TUzUwOFhPeFJ5OU9XZTVoNWxpVzZQUzQwMFkz?=
 =?utf-8?B?U0tDT1lPbXB3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA7616390B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlJ1NkNvaGhOcXBqbHRYbXZZVUtwd3hkMnFlSnVlbE1hbzF0WEJjWWdKQWxo?=
 =?utf-8?B?SS9mZHUwK1M0dzgwRTFLMTRqclFqZThNVWVwM0ZiQ1BxWVpvOGxQb1J1Y21H?=
 =?utf-8?B?UlBaMVlvMnV4NFN6cC9yTDlvT1lmYWhoYWgyWFhMWk1iL21RSzJneG44Q1N1?=
 =?utf-8?B?eVRzQ25Sckk4YXJpYkh3VEtJMiszelEyeVBKT2NhbXZpZ1FMbmcwTUp2bnkz?=
 =?utf-8?B?NzBXbC9wTFNkeVBiMEROdDA3VEZrOVZ2RlUvTXdnZUdYUkZTcGlhcnAxVC9Y?=
 =?utf-8?B?Y3l2a1FVQ0lRQ3ZzOVVKMDlTQ1dVWWhiQlBaalhYR3d5QW5FU2JZZ3Q4T3lk?=
 =?utf-8?B?Skx0VCtNWTQ0RXFUNENIUzlyb24vcHJFa0pFaElrcnVIOTZSVktZSGt1aVp4?=
 =?utf-8?B?ZWxtWkxkNDllK20rWTJHZWN5bm91VTh2dEMzdUlIR0JqY0c3OU9ibkk1RDBC?=
 =?utf-8?B?cjkrTkxiT05ZbkhmdFFoOUh3MVp0cjVQQmZlN29iVG9LV004VDlQQlRZN09u?=
 =?utf-8?B?MXNKVTBaUVIrWHpOamx6cHpEM2J6UTVXM2wwb0t4MElCNTB0QkJXcEEwYUw3?=
 =?utf-8?B?SU1jc2w1U1IvUHlxR0s4cVp4MEM4d0tZMDBHQndic0FDb3NBT1lCdzNDUjRo?=
 =?utf-8?B?cVVPUTgwUkJ1U1lFN1k4VTdTa2p0bXNzcVN2T1lvQm1HZ2RFa2xITnFCWU02?=
 =?utf-8?B?dDMzSzVYZDdOS01ZemVoZjNEZUJqenpSYnp4a3RqSlhYNXRZdm8xZk11M2JB?=
 =?utf-8?B?aWVEUkViODBEQzZPd2M4dGZIMDNyaEprb2tYWVBnbG1YYm0wUFdNQk5GYUtD?=
 =?utf-8?B?R0FkWHVQNXRsTFRTNVQzZ0lTZlRMTFZWWmdheWNLYUJlcjBueHAvQVcwR1Zm?=
 =?utf-8?B?blFDdzZjUExKSDRNRi9IcS9FRFJJSDFVakd6QU9WUGN6OTZRd2xUZ2NXbVMw?=
 =?utf-8?B?RUx3RDhDam9ZOHNud2NnTWtEZVROSGVIOWQ4cElWVXVLSEg3MGdHQUVyeHpy?=
 =?utf-8?B?bUZWZ3h4TG5LV2NWM0JlVmRCV3Y2VEcrU2p4bkFBL1hkWXhaVTdqdlVKSzNV?=
 =?utf-8?B?VnpJb3FxSkExQ3F5djU2KzBZSWZQR25lSFVWd3lRWWNoejEwRDhIaGNla1hC?=
 =?utf-8?B?VitPb256enZjbmIxalNJNjFaNlltMnd0MGJXYjlQeWIxWnV6NDU0bXFnR3A4?=
 =?utf-8?B?MFZXUnpzU0hvbE96R0tvQ0ZRVWUwVVE3Y2NYQnlRN2VOTStmRElJR21IUTkx?=
 =?utf-8?B?SUdra09BcEJ2Q0h6UE0venNBcWd5SDBrRTAwTDRKTGtPdUNMczR0R00wVm5I?=
 =?utf-8?B?WDYxcUZWSGFmWW5OZ2luaEdNWU1hTk4raG4zSllCbmVNSHgrMDh6SmExeVNp?=
 =?utf-8?B?R0FndWpTczZmNEEwSGdSMUFVaFpobDVhQVNDeVRoYmwyaC9mbWNLb1VvQWd6?=
 =?utf-8?B?cHBzK0pYNTZIUFhyYUtteCtSRlpGSmpkT2VZZE9DVnJSMHp3K1NybDN5VDBw?=
 =?utf-8?B?UW9jS3BlSWFKQjhLYnZQbE5UZ0Jua291UDFWVm5IRTFyMUpsTU9TcElLWGdh?=
 =?utf-8?B?T0UwWmZsaU5PVE1ucStEOU5HMGVSdXBTRERmMytjZDk3VFN4ZEdDMC9yQTFs?=
 =?utf-8?B?TllqN3A3ZlVFaldrVk9FSUF5bVJtTnd6R0hjSWxQaDZEQXljNzVKeUJxbFl4?=
 =?utf-8?B?V1NNVExTTlhaY244b0RETWJWMUUxUEJmZDY3NDdDNWs0YzV3dDFMdmVScHhm?=
 =?utf-8?B?T3JFN2pYdzNUS3o1bERSUi9idlYrUWZPN0lHYWQwNnJzUWFDU2l1bDhCYjgy?=
 =?utf-8?B?SkIrYUFDS3ZhUld0QjJuS3pSSWY0Tnd0WnJwcnpTTy8zY3FuZkpZSUlRS0pT?=
 =?utf-8?B?dGhWdVkva2RuaWl6ZC9rYmtTMTNYVFU0cDdlYUdQSi9hVThJY2E3QXY2WFRX?=
 =?utf-8?B?UGpxRVBabExxVWpxODVvYUM0YTNHUDJvclc0NjJSQm5lUmk0M0hKalRjbFQ2?=
 =?utf-8?B?TE15OGQ4OVdTd3lWUG5TRzdzcjNBZnllZmZFd1pFQitxQk96eW1Ub1BPN3kv?=
 =?utf-8?B?VzgyRjBnNDc0WThkNlpOc3NidFpXbVRnVTRxVEsxMWpFalV6YnpqOGJ4N0dP?=
 =?utf-8?Q?RcGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F5FD60D9E973D448A4CA950F256D670@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA7616390B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595940b6-ec63-49cd-c0ec-08ddb5b6afab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 20:10:39.2341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDj4HijcxsyAsWKhpnz6EVX1GvVvyRYDKLBAw05Wche0zA6z9QunoRLUShIS/xyrlMUO95uyBQTmrKZqwT80kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5495

T24gNi8yMy8yMDI1IDEwOjI4IEFNLCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+ICsNCj4gKwkJLyog
STNDIENvbnRyb2xsZXIgMCAtIDE2ICovDQo+ICsJCWkzYzA6IGkzY0A4MDUwMDQwMCB7DQo+ICsJ
CQljb21wYXRpYmxlID0gImNkbnMsaTNjLW1hc3RlciI7DQoNCmNvbXBhdGlibGUgPSAiYXhpYWRv
LGF4MzAwMC1pM2MiLCAiY2RucyxpM2MtbWFzdGVyIjsNCg0KSXMgaXQgYmV0dGVyIHRvIGNoYW5n
ZSBhYm92ZSBhcyB3ZWxsPw0KDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoNCg0K

