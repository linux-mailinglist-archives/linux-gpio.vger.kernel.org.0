Return-Path: <linux-gpio+bounces-22113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A247AE74AF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 04:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AD107A9BC6
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 02:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170961A314B;
	Wed, 25 Jun 2025 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="EPTcst53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2095.outbound.protection.outlook.com [40.107.237.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103701A0BD6;
	Wed, 25 Jun 2025 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817780; cv=fail; b=bnT55MIb5D0NxRpiHs3Rud98iqHo1WqIfatYuMEgGl5SBJmDeH2md7/HS9IVn75nXARE3cK/Rx6Avzv83flPznqbSwIA/o5CZVtR0nzhAPE+8spoKwmFBc7Ynys8J36vSxHCATtXmzonyGdHHs9/P+56Ioh7abdyacox93PFUhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817780; c=relaxed/simple;
	bh=WLad6/FRxpIVSlEQmoCNF35iVrJTyykv9gCJ3v0ZLbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=og0gPp6Mldrwd02JsNZ6gEaxcGKhjT1BvAyT8TuZ11TE/2mIZV2Z+6ID2gS481TyMgwqt24rz4Q2RifDjPYsF84A1EENlqVKbtw6VKDS826vdM84JbPaWCmM0tQJsL9xKTZ1p9wlbARa7IbDNJtZBap7DmTZohmQjfdphVxSEns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=EPTcst53; arc=fail smtp.client-ip=40.107.237.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6ibDqI8hdN7bk9ard61Hxx9/T4fi1piqwa3i9NT9hUM/ejDrbkGWHnejg8gXFL7AB+gq1Ll0ynEq3ADRaqcKJJ2PXq4dup292IylR5o4wN9Ajas2+pVcoMeXJ0p+3gRK03YTntjbIWTzmJtTpMq6lqyly23dKZ6tVhYmEWhMiPvmBeAI116PuqAZDqV5EzhDEDR59paVeLYrivs+Hlv7E/E4d/2eICwfAnSiB0yrYRzj+TsOJfwAy8l2CuM3a5Mh3O2Ick9dBUBj/YW5eTBl9mwN4Oi+DJBdvqx6qqZbQRFqC2Qww5qTGJObThHkEWhMEmJA3PJz8KrUY4Hv0cQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLad6/FRxpIVSlEQmoCNF35iVrJTyykv9gCJ3v0ZLbI=;
 b=lHSMOOsmSy7CBpikD05nJQVsBI8GrKqhtux1hXXwLub3aJlYbxiR34jKIS25AX/Iv4wWZ9o9obu48AUao/L2lbBLKCH6NVL7YaegQYZAZaQ2LKIg6GhrAs1cNNyWKSUh3tq4xD70GaFkcB/ItuPS8Y3IZSJs4daSpCYt3UXSrGCMItYHOVSEejZoDXwzqMWoFZbVPauFTSQNLQkbqFK8YnpIvxiq0afTOJbQFY/YlcnwAe1E3zGqjRXgDVITIQpgGcivagmnMW+2r9/YVRfMApUVsZIUZHnRmkKiCE3jD/AiGQ4J+tmizMUuRAD0cTN9vukJ+d4QfuIGyRt+Ao0SEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLad6/FRxpIVSlEQmoCNF35iVrJTyykv9gCJ3v0ZLbI=;
 b=EPTcst534wuj3JFgXPo78WwS7V18WDi1yt9lGDyLhG5iyZj4GrZQIVkA5IsxiRCWeXHScTZj/ujG0oQExIp4FefQXfkwpgXNMobDKpj48wyY/Ckr++hn5DxYC3+dUSIbKdDDFLtZMmcimec1nISgsFt+UkTNdArx9Mzu/Qs7Np4ZXognVLNb23FEMW0CIZLqERdiWaqFk/O8fn0aLWadFB+ACDXiM9F0IjecL2KK6K4GjxuGUNUgkFrCE67ZsBQzZEH7JH1WNSz2oyqv9JjTOVLzWwZ7Wb08TtB6a2O9ec83Gjlp/hGQtrBWzQUoizZPm/Vr/Lwqe76+zE6ISCIPaA==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by DM4PR18MB5426.namprd18.prod.outlook.com
 (2603:10b6:8:18f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 02:16:15 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Wed, 25 Jun 2025
 02:16:15 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
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
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAFHOAA=
Date: Wed, 25 Jun 2025 02:16:15 +0000
Message-ID: <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
In-Reply-To: <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|DM4PR18MB5426:EE_
x-ms-office365-filtering-correlation-id: 5b59da28-6828-49b9-be82-08ddb38e433a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGdNMHhZazR3c1M5Vzh4TUdUTWRQTUc2ZDlZRlBlcWVCdlQ2Ty9wYmJEZU1w?=
 =?utf-8?B?OWZDdDJJSEtjbkc4Uy81aWZtV1ZDeEZqQTlPb3M1STk3WVNoYmxqR2k0cmV2?=
 =?utf-8?B?YTVBcWRsN2lQUFFuVkVtTTRuSWVhM2FEdXpZQS8rTGJKKzllNkVudnNrZm54?=
 =?utf-8?B?b095VnNKWWZZdzN3RTRQbEYzU0VmeGFjNUVqc3oxWTFOWXBFMkwxa1M3Uncr?=
 =?utf-8?B?M0Y5TGhhY2V6RGYzYmk4dE55U0dOYjByTjEyZUJFL2liaEVjMHVWY0FiSnN5?=
 =?utf-8?B?QTVRQVEzK2lJVFNuZmZXMzN0MlJmUm1GeUtRVWNteU9pZnZxbHI0T0ZraC9E?=
 =?utf-8?B?VVhnUHVnSGJEcXVXQjFpRFlCdXoreVdyS0IzbVdJcFBZQzVxUTRBeVJMZmFa?=
 =?utf-8?B?QW9DR2U0U04zMCs5YjB5SVJKUDFvRnVFS3dZT0IwTFNHc0U3M0VmT1JuUHV3?=
 =?utf-8?B?UmJVKzNuVDQybmNCRmwzdk00eWR4U0xPZVFiVWRWSkxhZEc5Q2k1MjBqVTNj?=
 =?utf-8?B?VlRrd1FlQVk2WUJmL3daL1VOc1hMOS84c1JVRHRqWGhZd0FTcVo2NjBaREJl?=
 =?utf-8?B?eXFPME5rdTlNWTgwRU1JTk1vdVQ4eXdQaHBiZmtGdFgrYXVsdlppQXNJQnB6?=
 =?utf-8?B?TWVBOUFaVVpvVnNwV0N5V29FdHlCeWcxZjFMVGRmL2drS012eDhLcDVJZGZ5?=
 =?utf-8?B?bW41bkdDRDRhYXUvRXdOVUlSNVR5VDVtMHJhaHNkUXRBZHR5V3Y0WlRlL3VE?=
 =?utf-8?B?dlMrbjB1VU9IVzRIc1F2bmdMbDNucmFzOUhhNmlDQy93TWNSc1d0NDlRVHdZ?=
 =?utf-8?B?NDVBdUVuekFGY05VekdiZlRFeFVVb0FaWVJSZUtKN3RLU2h6NEpmNnp1Um5T?=
 =?utf-8?B?bXdMdXhzYXJFMnVqVlhIMHgyMFN3ZUt5MFFCc1ZIbHMzWlBiMVhuQ1YvaFFl?=
 =?utf-8?B?Tjl5Y3I3Y1JtQWpNNGU2N2NHTi9GTzZLc2pjMmlHaUIrbXZEQUY5QXUvcGRU?=
 =?utf-8?B?ZUlKSDRKSmszRjBIRmR2elA4ckkrYXU1MjVvVnNkYTlncEFRQ3FpbW52bGNm?=
 =?utf-8?B?TW1Gamh2RjIwc0ZuUkg2YzJZOVZDaTUybUh3ampCczB1QS85RHUrT2FqQW5u?=
 =?utf-8?B?T0Vnck00TjZUaHJHUGFxd0lCdkJmVlN3SFJrbEQ0WmxIUE1XLzNCUFdZSXcr?=
 =?utf-8?B?YUUzYTR3elpLbUpKY1BjMXpqNkVnb0xQcEhtK01HNER4R2JKNXBjMG5PNita?=
 =?utf-8?B?Nm9SZWtFcENVencwSnJQUjZpaHRjT1ZpSVZIRytCTHZLS0tBem9lVHVIUk1i?=
 =?utf-8?B?eUloTjVMejZQbjdRUWdacUpwaVJmeC9MbzN4TCt2cEplUDUxbU9VNEVjOGx1?=
 =?utf-8?B?bWg0U2RUUGhVT2JlWWVEYThYdEFyZnZQaHNrRVZpajhOcXFvd1lCQXpQTXZX?=
 =?utf-8?B?d1J1LzRGWFhEZXg3RFBqNVBqSnJxR1E0SWtsUHhzQVhoelFWcHI1cHI3dGJF?=
 =?utf-8?B?Y0pKNnUxRnptRWxqbHpPOEpyVFUvRStpK0pOREl4R1pFZWc4d1pHcEZ5V014?=
 =?utf-8?B?dm9qV0E2allTS1J5Z0dNUG9JT09sTGM1RW9YdEJBTFgwbDh4blN6cTAxU0Ev?=
 =?utf-8?B?dzgrZjBwamxKc05MTGtWTEFmOHZ6NHBEWnc5ZnVxdG9HZVhCV0Zzdkt6WDhq?=
 =?utf-8?B?OUQ3Q1prNk9QTkh4czRtRFRDQTJVY3BvRVNPVHRhUVlIc1JnSFFYMEYrdG1z?=
 =?utf-8?B?eUkxdGtsU3lNRjUwVjBqOGZFeVFjRHVVUmhtQWEzZDBUTnliNzJsZFpEcjVR?=
 =?utf-8?B?SHdONC9ObmxnekVNZU5vOGt0VktMUU9oc2t2STR2dUhSTGxiNzQyRFhRNmV2?=
 =?utf-8?B?Mmx4SHVrSFVBaGFiUDJFb09NZHFYVXF6VHhIMHZiOGdWV256OE04SG1MYjRu?=
 =?utf-8?Q?DxtB+7MvEVMN2aUGsY7YEveetJYa+ipN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVp2VGJFOTVYT1lUSWw4Zkg4U2JwRnFFK3EzY0JtYzhuYnltMVA0Qi92cjYw?=
 =?utf-8?B?WjNHSmVOZzI4dFk0NFFqQXZ6TjhjbmNYb2NBWTlHeVNMcjI3SWpHeVpNLzdC?=
 =?utf-8?B?Y2hhMGJsZzdCa1RiRXRTY0NYQm4wRk83ODNPT05SK0R5TGlwdVhhUjlneFI4?=
 =?utf-8?B?WFQ5MDhiTXAxWmJOYWk4SmdNaWNObUZYdGNWdnJlTUdsaURSc05mSTFlTXZQ?=
 =?utf-8?B?VmRrVm5WbmQ4bm1UdmFWNHh5SnE5VS9nZnlEcDNvVXdhTHhESUhHMm03Vitn?=
 =?utf-8?B?UkJyZVdvc0xURzR5eld2WGtObjlMaEpqTHNGaWYxRHZ3QWZaQUVSaklHd2lN?=
 =?utf-8?B?aGZzZDVBMHdxZ0RkS0t2NVJGdk5XSDFrV005M1p3Rk5UNnhockxwc3pLZkpG?=
 =?utf-8?B?ZURtVk5Zak1DWndMdVBEZTVOaU5sM2J0MlFQc1ZYVHVOdUJsWHUvcXZHZHdK?=
 =?utf-8?B?NXNvZHN1Z0EwaWFGeU43Vm51QUxSQXVVZjN5Vld0UmNDb3BmMVBwdStaRjRu?=
 =?utf-8?B?K1dBR3VQS21IdDlvZUh0SHZham0wVk5YMzJoa1EzL2Y3aDlIandSM0F3ZFZB?=
 =?utf-8?B?dDRLeFkwbzNCUExqeTNpb2lubzJDb2hBTGlNYWpYNkRIVGVLV2d6ekljT1JQ?=
 =?utf-8?B?K1ZTbU5pbGFRR0NseFhNcWVHNkdOMzM0TTNuN3FNUGJVQ05kS3RHWXcvYkZu?=
 =?utf-8?B?YnR3aEkrci9qZDJLaFdtbzZjTkszU25pRFMvYjY2Y1FBTTA1bU9sbTk2Rno1?=
 =?utf-8?B?U2lYSXlhZDZsOFkyNTNzeWtSUnpWVHZqREpCZDhIN3ZnNzNjdkdjL2VyY01r?=
 =?utf-8?B?Y3F1T1BVT3ZEREdkRlFnL3M1dXg3QUxpdHYwSVZXYU9aRGlyYXluRkN6enMx?=
 =?utf-8?B?VGVGUjc3RmF3ZFhVUFdTdGs1YjhXdVVOK05IUUU5N3BqVkFYM3pjdENTZ3dO?=
 =?utf-8?B?d2JLK1IySzVNVlRudnVsbDVwZFNBWTRqTm5MS0I3MDY5UzBkUHlzdzBoNG5N?=
 =?utf-8?B?cEpvd0o4NWc3aS8reU84N0FPV1FZbS91aGo3MjNVdDJMOHdlY0J5Vk1uS0lw?=
 =?utf-8?B?QWlOR0lSZlN4VDBVaUxHTVdQMnIxdjhRbktBVzRNcTJVTURETzEwQkFpUEtm?=
 =?utf-8?B?Z0RLekV2U1JZRWNQNzI1b3ZBRForbDJ6UnJZdE11b0tDOWM2bHdibzdKOVhi?=
 =?utf-8?B?M2d4YXRERHdjd2tRbFI0YmgrRTVVU3NHOXdhRVExU3o4UVFWSmVpa3RkWnpF?=
 =?utf-8?B?UXY2Y3FuYjM3UmttZGM0bEVwVGt3NjA2RVBkaTJJY3NNQU5DanJYdEZ3aUdZ?=
 =?utf-8?B?eldnK3kvbmR3aUdpZTY0YW0xNUEvQnh5Umt0a0tMVnRDTWV2S1VMazFKREY1?=
 =?utf-8?B?TmRyWGRld0ladTQ4NFREb2JiRlIwMWlPYnpmSnFJODdKWEFzMENoamJYcXcv?=
 =?utf-8?B?RCtnd1RheS93TmJIUEdDSEhmanR4SDZHSXZ2TG5rSVFqZ2tiMThGb01scGJD?=
 =?utf-8?B?TTRCVzU0NmNBeTMzbW1GRmYzd1hjN0V2RTBHdlJoWjdrNDB3WGRkWG1wSkRx?=
 =?utf-8?B?am9hZ3FsS3MzS0ZCK2lIWWN5RFY4dVo1REFBTzA5UUhUMTFoSFRKSlY1cDNo?=
 =?utf-8?B?K2JGMmdWeVZuTVBjZktTTmNSeXBsUE1mRWtSb2NmR2huOG1rUTNoTlNNS09W?=
 =?utf-8?B?QVJnTFVvdnptQ2ExOWpPNWs0eWtWK1RlckJCalBwWS9IdE5YNkFDNVlhUXVs?=
 =?utf-8?B?WDk3WDNza2xiMUJuczFTTlB6ZlMvbnNJdTc4ZHViUU16aEVOZ1FhUTdWRWhX?=
 =?utf-8?B?TWxEUE1lRmM4bklqRzd4dEdIMHRFQ2tvTmovbjErVitMQU5oYnMrb0dtaGVC?=
 =?utf-8?B?WmtQenNNbFljR1VpdEIxdFUrNGN3bEt2cmRyVmw5S0ZwQmcwSE4rVHJJdzd3?=
 =?utf-8?B?cUpuUEN1ZjVYSmhqMlJadWdaK1UweWZoRVlFR2pKeUVUQjhCZnF4TmczTlFI?=
 =?utf-8?B?SDNZQzlmNGNUL01DcHFza2o1Z1BPT09XZWV3OU4zT2pnT3RDNDc3M25SZkk0?=
 =?utf-8?B?dGQ3cGtnalIxQktaK0lrZEJoQVhwRTUwMW44MWZJUC9WcFNxTXk4enpCSXFP?=
 =?utf-8?Q?NEaw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <892FF2B5B300184AB733E1E80706016E@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b59da28-6828-49b9-be82-08ddb38e433a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 02:16:15.0864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLWlD9EcmxHCi1JXqSD/v0D6h1CSbbcSlOVAifaq2WgITWc1k0M8/cYAfOswCfBMczp2WvsQaQy4pIT+bBDy6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5426

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3cy4gSSBoYXZlIHNvbWUgcXVlc3Rpb25zL2ZlZWRiYWNr
IHRvIGNsYXJpZnkgDQpiZWZvcmUgSSBmaXggc29tZSBvZiB0aGVtLg0KDQpPbiA2LzIzLzIwMjUg
MTE6NDUgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+DQo+IE9uIDIzLzA2LzIwMjUg
MTk6MjgsIEhhcnNoaXQgU2hhaCB3cm90ZToNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9j
a3MgPSA8JnJlZmNsaz47DQo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVu
dCA9IDwmZ2ljNTAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTgzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAg
IGdwaW8tY29udHJvbGxlcjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAjZ3Bpby1jZWxscyA9
IDwyPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiArICAgICAgICAgICAgIH07
DQo+IFBsZWFzZSBmb2xsb3cgRFRTIGNvZGluZyBzdHlsZS4NCg0KU29ycnksIEkgZGlkbid0IGdv
dCB0aGlzIGNvbW1lbnQuIElzIHRoaXMgZm9yIHRoZSBzcGFjZXMgYmV0d2VlbiB0aGUgDQpub2Rl
cyBvciBzb21ldGhpbmcgZWxzZT8NCg0KVGhlIGN1cnJlbnQgR1BJTyBub2RlIGlzIGFzIGZvbGxv
d3M6DQoNCmdwaW8wOiBncGlvLWNvbnRyb2xsZXJAODA1MDAwMDAgew0KIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAiY2RucyxncGlvLXIxcDAyIjsNCiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWcgPSA8MHgwMCAweDgwNTAwMDAw
IDB4MDAgMHg0MDA+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsb2Nr
cyA9IDwmcmVmY2xrPjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZnaWM1MDA+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxODMgSVJRX1RZUEVfTEVWRUxfSElHSD47DQog
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3Bpby1jb250cm9sbGVyOw0KIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNncGlvLWNlbGxzID0gPDI+Ow0KIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludGVycnVwdC1jb250cm9sbGVyOw0K
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNpbnRlcnJ1cHQtY2VsbHMgPSA8
Mj47DQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ow0KDQpJIGNoZWNrZWQgdGhlIGRvY3Vt
ZW50OiANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1L3NvdXJjZS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHRzLWNvZGluZy1zdHlsZS5yc3QjTDExMi4N
Cg0KPg0KPj4gKyAgICAgICAgICAgICBncGlvMTogZ3Bpby1jb250cm9sbGVyQDgwNTgwMDAwIHsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsZ3Bpby1yMXAwMiI7
DQo+IFRoaXMgc2hvdWxkIG5vdCBiZSBhY2NlcHRlZCB3aXRob3V0IHNwZWNpZmljIGNvbXBhdGli
bGUsIGJ1dCB0aGF0J3Mgc29tZQ0KPiBvbGQgYmluZGluZyBzbyBtYXliZSBtYXR0ZXJzIGxlc3Mu
IEFueXdheSwgaWYgeW91IGV2ZXIgbmVlZCBxdWlyayBvcg0KPiBjdXN0b20gcHJvcGVydGllcyB0
aGV5IEkgd2lsbCByZWplY3QgdGhlbSBiYXNlZCBvbiB3aGF0IHlvdSBjbGFpbSBoZXJlLg0KDQpZ
ZXMsIHdlIGFyZSBub3QgY2hhbmdpbmcgYW55dGhpbmcgb24gdGhpcyBkcml2ZXIuIElzIGl0IG9r
YXk/DQoNCg0KPg0KPg0KPj4gKyAgICAgICAgICAgICBpM2MxNjogaTNjQDgwNjIwNDAwIHsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsaTNjLW1hc3RlciI7DQo+
PiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAgMHg4MDYyMDQwMCAweDAwIDB4NDAw
PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnJlZmNsayAmY2xrX3hpbj47
DQo+PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIsICJzeXNjbGsi
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdpYzUwMD47
DQo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkyIElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGkyYy1zY2wtaHogPSA8
MTAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBpM2Mtc2NsLWh6ID0gPDQwMDAwMD47
DQo+PiArICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4+ICsgICAgICAgICAgICAgfTsNCj4+ICsgICAg
ICAgICAgICAgdWFydDA6IHNlcmlhbEA4MDUyMDAwMCB7DQo+IExvb2tzIGxpa2Ugbm90IG9yZGVy
ZWQgYnkgdW5pdCBhZGRyZXNzLiBXaGF0IGlzIHRoZSBvcmRlcmluZyBydWxlIHlvdQ0KPiBhcmUg
Z29pbmcgdG8gYWRvcHQgZm9yIGVudGlyZSBhcmNoPw0KDQpBcG9sb2dpZXMgZm9yIHRoZSBjb25m
dXNpb24uIEkgc2hvdWxkIGhhdmUgdXBkYXRlZCBpbiBsYXN0IHBhdGNoLXNldCANCmNvbW1lbnRz
Lg0KDQpXZSBhcmUgZm9sbG93aW5nIGFscGhhYmV0aWNhbCBvcmRlcmluZyBydWxlLiBJbiB0aG9z
ZSB3ZSBhcmUgZ3JvdXBpbmcgDQpzb21lIG5vZGVzIHRvZ2V0aGVyIGJhc2VkIG9uIHRoZSBudW1i
ZXJzLg0KDQpjcHVzDQoNCmNsb2Nrcw0KDQpzb2Mgew0KDQogwqAgwqBnaWM1MDAgeyB9DQoNCiDC
oCDCoGdwaW8wLTcgeyB9DQoNCiDCoCDCoGkzYzAtMTYgeyB9DQoNCiDCoCDCoHVhcnQwLTMgeyB9
DQoNCn0NCg0KdGltZXINCg0KDQpJcyB0aGlzIG9rYXk/DQoNCj4NCj4+ICsgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInhsbngsenlucW1wLXVhcnQiLCAiY2Rucyx1YXJ0LXIxcDEy
IjsNCj4gTkFLLCB5b3UgZG8gbm90IGhhdmUgeGxueCBoZXJlLiBMb29rIGF0IHlvdXIgU29DOiBu
YW1lIG9mIHZlbmRvciBpcw0KPiBheGlhZG8uIE5vdCB4bG54LiBIb3cgaXMgeW91ciBTb0MgY2Fs
bGVkPyBBbHNvIHp5bnFtcD8gWW91IGNhbm5vdCBqdXN0DQo+IHJhbmRvbWx5IHBpY2sgYW55IGNv
bXBhdGlibGVzIGFuZCBzdHVmZiB0aGVtIGFyb3VuZC4NCj4NCj4gUGxlYXNlIGNhcmVmdWxseSBy
ZWFkIHdyaXRpbmcgYmluZGluZ3MgZnJvbSBEVCBkaXJlY3RvcnkuDQoNCg0KV2UgYXJlIHVzaW5n
IHRoZSAiY2Rucyx1YXJ0LXIxcDEyIiBmb3IgdGhlIFVBUlQuIEhvd2V2ZXIsIHRoYXQgYWxvbmUg
DQpjYW4ndCBiZSBhZGRlZCBhbG9uZSBpbiB0aGUgY29tcGF0aWJsZSBhcyBwZXIgdGhlIERUIGJp
bmRpbmdzIGRvYy4NCg0KU28gdGhhdCdzIHRoZSByZWFzb24gd2UgaGF2ZSB1c2VkIHRoZSBvdGhl
ciBub2RlLiBIb3dldmVyLCB3aGljaCBpcyBub3QgDQpwcm9wZXIsIHVuZGVyc3Rvb2QgeW91ciBw
b2ludC4gVGhhbmsgeW91IGZvciB0aGUgc2FtZS4NCg0KDQpUaGlzIGRyaXZlcicgb24gb2YgdGhl
IGNvbXBhdGlibGUgaXMgImNkbnMsdWFydC1yMXAxMiIuIFJlZjogDQpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92Ni4xNS9zb3VyY2UvZHJpdmVycy90dHkvc2VyaWFsL3hpbGlueF91
YXJ0cHMuYyNMMTU5OC4gDQoNCg0KSXMgaXQgb2theSBpZiB3ZSBlZGl0IHRoaXMgZmlsZSANCiho
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9jZG5zLHVhcnQueWFtbCNMMTIpIA0KDQoNCnRv
IGhhdmUgdGhlIHN1cHBvcnRlZCAiT25lT2YiIGFzICJjZG5zLHVhcnQtcjFwMTIiID8NCg0KDQpS
ZWdhcmRzLA0KDQpIYXJzaGl0Lg0KDQoNCg==

