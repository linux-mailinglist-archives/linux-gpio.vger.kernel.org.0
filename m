Return-Path: <linux-gpio+bounces-25951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D6B533EA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E974D1C86D73
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4C832CF9C;
	Thu, 11 Sep 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QyjmWEpW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2073.outbound.protection.outlook.com [40.107.114.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54023CEF9;
	Thu, 11 Sep 2025 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597951; cv=fail; b=YEm5lh8bHQmuWEydGXWBNUMW76O60lgCDH3pcbgLVwa2aSS5jIIoGQuP8rVuc8ywWQFMuiWs66pwMGUzgWlVuQGxvlZqPxVnXsq4bU583F/V0qX8aRIm5jvpXf3yeLIRTgzZOoCDAHw7bQmz6Y9heOSExFZBei57bn7cw7jqRpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597951; c=relaxed/simple;
	bh=VjkhgMfxrjXxowJd6Mt6aSh6bDR5DuChhQdRAEhDM1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UiCciqCdLjKQtDxQaUXa4v9Ouf9a4QiPThF7FSgLdfCjfUNXTphT//l5GUfmJQTqrnb6kp6Nr45pR2UVIdQtySQAhkhidddGxtGgZEOMrPLMCoL6zy3yA2TbZ0dQLG2IOoFSmFSNsUqaSZOXSZ7ISe3+n5ZvTOdqf4ewhlYHCcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QyjmWEpW; arc=fail smtp.client-ip=40.107.114.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia/tDxwTv/yCq1VHARLP0dZ//NzCD0LLJhHGts19eOg3OqRG1GPFo1yts/I1+Ld92ssMSV2K4FhHn/+pIvt5Y95CvZCB2IyZXdkHJGeRbjcgoF9p0MfUhtjQ2JeehpXXtqVhFdzIAvqIATd7HYRQ281olZGqXNn5iZH5WQ9pm61d0+Kx/cOq/y4u+QzSZLTBkslrRFWi4VBEa2l8EOIJtf1Oa6LAG+SupnaRbOPKl0LOZWLc1AEiaL1yr5n7FuSXvbfNDs0IfZaz0yRs66lUbDYxb7LuNTMl+OHG1ewwLN+NI0ozMkOsXWhtScqF6Khw/NT3XyZc3LOHUYsdzeHVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjkhgMfxrjXxowJd6Mt6aSh6bDR5DuChhQdRAEhDM1k=;
 b=c4mMnu8PZ7ChS1AaZyG962dY5weRaZGAYbBaPkRSgs2H8A2UdyRZRaLmk6Penvl6qVyrJMg5HRUd8r+4uc4op1OktAmK9TisKALukW25iVvp7PHczs80N/O1kZ4ItHH6uHQfSa8G8CsgJkNYODuO6A7KGxFD2SfouH6kDjh4pWCpqD/0qlcaHSOsgEyTU/0Tv8evkK9S6goFoMmkbttjTq6td4nkLoB49BiImt7RG4cbM3S4Hpp8/6tBEcxliLo+jZlNsdl/wc50JHxZA435WDRK6u7KZVWGVb+UV/uoaBBn2eIamxEDKxxTdUe1T2Ng5ugp+bAEQtLp6Wa+oPCilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjkhgMfxrjXxowJd6Mt6aSh6bDR5DuChhQdRAEhDM1k=;
 b=QyjmWEpWOrRIFYE6FtKRCeLolw/niMFX+2dvci8SIWKDHmGA8P6U02asQH/LF8Rv13Vv7uAfc/TvXJA4Mjj8pIgav/mzvD9UnGpSG5K37x+UchWhIn8+oXSyotu59nRbprehlxv8RWDoFfGLLoZ+EHvVeKBqY395vF1u/UTd/VY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17308.jpnprd01.prod.outlook.com (2603:1096:405:357::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 13:39:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 13:39:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
Thread-Index: AQHcIM7gM4gUjrlV/0KGKodi3f4+P7SNz30wgAAtbgCAAAJy4A==
Date: Thu, 11 Sep 2025 13:39:04 +0000
Message-ID:
 <TY3PR01MB113469D5FBD53A8B507E5DC4A8609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113460BE4B4D20305021D85328609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54d7c3b2-762f-4f61-af21-02247a471251@tuxon.dev>
In-Reply-To: <54d7c3b2-762f-4f61-af21-02247a471251@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17308:EE_
x-ms-office365-filtering-correlation-id: a4c551f9-8375-43a0-148a-08ddf138930d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S3ZiVnBqWTlJbFRDbkpvcGlzWkZZWHYxV0dzem05bHdJaTRrK3FSVDdlSTE3?=
 =?utf-8?B?QTdNTnZ4RVlQK2lleFFjRzdHdVlzZmJLRndWYmsrUjhFRWNPeEdVRGdsWith?=
 =?utf-8?B?dDd6TG5ieTJEZGNCOHJXTjdwWERMWDc2TGNMUytBdEtXZmd3N1FTczBFUFJm?=
 =?utf-8?B?bFgzbmo0OWU3eVhvOXlzU21ydjU4RS9qNWtva2FRMnZvRUZGNVlKUTBoK20r?=
 =?utf-8?B?Ym4vUUVkTEtWTG1JLzNNWEt4ajRtS0JRL1F4TE96SGM2dHhzdmkySkxQdmM3?=
 =?utf-8?B?VytpSXlJUWpPQVZnNVZOUndmakxhRk5Xc3FtVzlrMnVCZXpXd244N1NQUzRR?=
 =?utf-8?B?NG85eWlZT3BweFNjQ3plVW9GY0ZWZllyYkVsZDdwb2JxbXBROVFMaXhudTdU?=
 =?utf-8?B?WWRaTEZCZ3cyV0p4eWV1VmlqRlNGcmpndnh1eEtHeWdLai9GQVFGd2VmSVNn?=
 =?utf-8?B?QmtkTjdySHMrOEJmWTJ6OEs4WVQ0cVYrcDhyNVRKT0pnQTFDenY5akdzdnhC?=
 =?utf-8?B?NTdBd3E0eko0dVdGTjNpRGpLZHc1dFNxQ0xzN2dzU2p4Q0F1N3lYRmQ2TTJa?=
 =?utf-8?B?bFVURE1pT255M1ZtejlqaUNyYUgzbnhhaWhNY2o5ODhtcDI0ZitSVUNTaGI3?=
 =?utf-8?B?Kzd3TTI1aUl1cktmTEhCUnRySmozK1NmQ1RXeEsva21TSzIveUVFYlRlQWs0?=
 =?utf-8?B?UWkxY01tcHVjU2p3RDg2ZmV6R1MrRnphamhQYlk4MldlMEtYSG5UaGROTk9X?=
 =?utf-8?B?VGpuWnFNNnZWSjhxNG5CWTdyZDFJZkQ2NE5XUzRwZWcxOWtVU2F5ZUxVUisv?=
 =?utf-8?B?WG5SdWNBanJzbGIwY3YwMER4ZnpPajFLRm9SZ3hqWVVQSXZBem91VXdkNHBY?=
 =?utf-8?B?a0xUbmc3OGFYOW9XK1dyVnBTSTFlWStjSk9DK3pGL0c0ZlRTUGo2Z01HWm9l?=
 =?utf-8?B?MzVzbWlLVTdHTFMrTGhpbDF5VDJiTmE2N0Y0NElHNnd3OFFENXhJdlBrN3Z5?=
 =?utf-8?B?WU1yUUg2R3c0czZTQ0JkZWdvK2lWcnhFMk1yd1lZdHFFMDQ4U3NBUElBVDFH?=
 =?utf-8?B?Tmt0aHpFOTJhUEh2WFJXaHp4dCtiUlRDazNGNWs5ZlFTU1ZHNW0zajAwNkpK?=
 =?utf-8?B?WEtkbTBwaEd0VE9rVXZvcTJhRTd1UjNjVnJ2d3VNdU5wL1cyWC9MeUh3MDFF?=
 =?utf-8?B?N2RTclljbGFQN1hQYWFHR3NRYWoyUFNhVS9FZkRYcGFFemp3Rk8yZTFzeGxB?=
 =?utf-8?B?M1o4aFZsL280ejU5V1RVSDVEdFR6Y2x3VkIxNXNRUkxSZjhIZkJoZS9adTA2?=
 =?utf-8?B?QUx1ZmhCczBReHV6UkxhUEY1OVh2dkNvUXNMZUR6eGJTZ3ZOUVE4SmNUc3lp?=
 =?utf-8?B?TnFGUEZPMkQyTE5lNGxUdjBaVENXUStlb21JeGllazJJVnNaYTlqTjB0dUsv?=
 =?utf-8?B?WjR6c1ZpMzhOT1dnbjJQek95OXZDakpaNDZBdTdwZ1hSano1Zm05SitQUUJK?=
 =?utf-8?B?Wk9wU3llMGtLL3owL1VzYXdEUmx5TnppOWJFOVhHc1pObittK3dTc2FJUDBu?=
 =?utf-8?B?NHVnclkrWVg3YlNrTHkyQWVsMEpqUDEwMHhFYUtnUENnSEwyZzhnNjJBNnhY?=
 =?utf-8?B?dDhPWHgzTnFhakkwRnEvTjBkalhPNXlmRkFXeTRBejVneGoydjFTNjFaR0NJ?=
 =?utf-8?B?bW5DSGVweFUxeVJsSEdJY3BQUWt5L2R4TFlLbTh6UFVGSlc1UThYU1FKaElt?=
 =?utf-8?B?WC9obURnVHl5aXVyWDFrVjZFVlM2d3ZXRloxVmRLTTRGRlpEei9VTTZBdnVj?=
 =?utf-8?B?RkZhUDNoTWx0c0FrZy9HZEtxSVN4aTR2cXV6aW9VVTdVN29sKzlnSi9wVUZ2?=
 =?utf-8?B?L2prNHFQejRSU2IzdWxGZ0NsSGtZY2wydnZmai9rSGV5YWdpTHJIZzJRQmhF?=
 =?utf-8?B?Mi9jbkY0L09aM21MVXZRS2dpZWxlRVozQ2UrUE5qQmFnVUpOU2EzRXBsWmk1?=
 =?utf-8?B?ZTdEU1BsVElnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk9iTmhsWFFJa3l2cGw0Z0laaUY2bk1iSXZxNHdsaEVCaVFyYWlTTWdIQ1RJ?=
 =?utf-8?B?cnNad2JvWDd2aDhpK2hUd1BNN3ZlT1ZRYmUzUExXcEc3NjhXcG1RbE9kRWtk?=
 =?utf-8?B?YTBvSXo2U2NBcHhYMWhPcTNuek5xbEg5QzE2UHl0bWd3NkNaTDhpV0sxVjY3?=
 =?utf-8?B?WUt0aEx5WWZ2a0h2U0M4Y2o4S0hCSlhUZHBuVWpIcVdmSCtiTmIzRFN1TFRn?=
 =?utf-8?B?R3F6enY1YlpMdzlINkdqaXFHNXlzd2pSZElNRUpkVU1qTnhoOGNwNEJKWm5k?=
 =?utf-8?B?emZTZlByVmdLWms3MW1EUGFhNUtZdlRNRVFJWVN1aTVxYi96dUVMVTRnblZO?=
 =?utf-8?B?WlI4REtyc1VGUE5ROVJVOWZqV0ZERzBhWi9WS0t5WUFXeXRTQUJEbG5aeUI5?=
 =?utf-8?B?MVVTTTRzWVR5ZVd4QU9DT1IwSWozSnI3d0VrQisrbFBhbHBBTFFnVmZNdi96?=
 =?utf-8?B?cWpwMGpLS0QvQ0NlVDZHQktqR3V6azc5VTNxNUtwMGFhazdUQVkxNUJIcEZ3?=
 =?utf-8?B?K0F1YlZHcVlmWEhNbkVQKzE2di9yUGFXWnNuVXArbjJveGdUWjIwREQ3WlBl?=
 =?utf-8?B?YmlQY2tOTGpNZGlHVGJGczRpNWVKZzRlVVovNHpIbGhGemxhSDlLbHJlNDZK?=
 =?utf-8?B?ZUJhZnBNcGhseEFsTWVQRFRTblVSRU9Za3hxbWQ3NlNtbGd6emJsTERaT1pv?=
 =?utf-8?B?VTlObnBWd25ZQjNFTWJJYzJucFM0OEJJS1hhN3FFL0RyNFpLSE9kSWFNMS9y?=
 =?utf-8?B?ejJwbTVEKy9VZkRvamRibTdKK0ZRcFN5SndleEF6K2RPZno4V0hOTG9IdURJ?=
 =?utf-8?B?WTFuVURXem1WUklKSmh3dE5hQ2lKTFBkM3ZMemNUL1lHOHNJNTdhZmFQZHVS?=
 =?utf-8?B?NXp4ZUlVcFpuTVFldGxjamhZZHJuWHhPTW9RVyt0ZHNEWmNNWDJnTCtGSEpp?=
 =?utf-8?B?QjNkWU5aMXFUdnZIVVlaQkozREhWbkRtdE5kbUZrQXgxOWN2VGp0aXV0VmZJ?=
 =?utf-8?B?Z1kyS3A2NXRlOWtYdkxvR0pDOU9KQzdLTzlzcW9PVit2aCtCKzZ1dlVHT1k0?=
 =?utf-8?B?VUJheDRZM3hwakdTNmN4NzZ0UWJsYlZHWDI4SWxoQVVKZTY2bzRxaUl6Ukhv?=
 =?utf-8?B?Q2I5N2E0S3hwTWpUR09Lb29Bc0N0eFZoMzZiWHRNa05ZQzF3ZDZZenYzaERq?=
 =?utf-8?B?MkEwUWQ2NnF2TWxnMHV2cnZwVm9xUWdqanZLWUI3YWl6dUFkMm1zRDVlOXJ0?=
 =?utf-8?B?TFE2bGgzeUdqd2c1N09GOU1obzZwTTJyQnZZejNyUldaUmVzQklxVzNjTG5t?=
 =?utf-8?B?a05WOG5la1VyMVlLaEp2dFRxcm00OUcwLzhQQm5oTDEzSjJyejhMQmpYeWo2?=
 =?utf-8?B?alBVOHpRM2w2QmI5SFV0YVUveksyWS83UElZcUJTZzVWcGFnRUxQYnhYb2RS?=
 =?utf-8?B?bEFTR0RTRjRDV3VkV0J5ZllJbWk3QkxwaDgrSXZEWGVyODZHRkRxRnc5K2Ni?=
 =?utf-8?B?YzVSV0p4MmExN1RKU3o1UXpJSGcvVlpFRkx2UFprRE13bjhwRTBmbUgvMUlk?=
 =?utf-8?B?ME1iTVA3K1kvS0pJWktIWDREdDFOSnl2b0RVSHBNcXgwQ0EwOWQxRGkwbm9Q?=
 =?utf-8?B?eVUra09ySlRMejB0Mkd2cnR3Z1ZheXl6Z1lTZGRnTGhZeXdBMElJMTVuM2hS?=
 =?utf-8?B?SG56bWprNEc0VWwxbjZ1ZzNldlRCcW5LVkx3NjllS3lDdnhZTlV5TmRDL0wx?=
 =?utf-8?B?NEZnRjcyWVU3Y2FXanN1ZmtSeTZUTHlqZ3hEVk1DSW1XQkZDVEYwaHF3R1lO?=
 =?utf-8?B?ek1Fc2RtekhsT3k4NVN0YS9pZENOaWJoY3RtSUVTT2VReDNocWYvaEFBblR0?=
 =?utf-8?B?M3F0NVg2RTVBV2Y4RkVPZEFiYzJ0Wjhra0JwUzdVcFpXK0JXelN6R2RBUTFH?=
 =?utf-8?B?aUZRdElXaGREb0VBcHBWT1JUQ0c1V21BZjdqNVJ5WEY4Ly9VdDg3TTFQWERZ?=
 =?utf-8?B?S0dQUkNCSXptM1lnOEY1MmdIRXZPMkRPcmdneitVMDFkTzdBcmlVNFZHSzdO?=
 =?utf-8?B?dmhHMXZrd3pDY2tLcU9iczJEN210dzFTRHl1M20ybFBaWGhIckcwenNhOFQ2?=
 =?utf-8?B?R1l4VkswK3pOdTZUZ1BHMERyVFFNMTVFYzlNYkVaMTA2b3ZLa2FlN2VRUTFR?=
 =?utf-8?B?b2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c551f9-8375-43a0-148a-08ddf138930d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 13:39:04.3509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTHMFuao48ml+u/KT4MPhzK25f3Yp7a33De7EYibAxa7hblZlfTtsTtLFUMYcu2ZwUHUuuKpUBocTiUGTOWCwyyh8m+jQUxbJMYl2yKvQ68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17308

SEkgQ2FsdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxMSBTZXB0ZW1i
ZXIgMjAyNSAxNDoyNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaW5jdHJsOiByZW5lc2FzOiBy
emcybDogRml4IElTRUwgcmVzdG9yZSBvbiByZXN1bWUNCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4g
T24gOS8xMS8yNSAxMzo0MywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6IDA4IFNlcHRlbWJlciAyMDI1IDE1OjQz
DQo+ID4+IFN1YmplY3Q6IFtQQVRDSF0gcGluY3RybDogcmVuZXNhczogcnpnMmw6IEZpeCBJU0VM
IHJlc3RvcmUgb24gcmVzdW1lDQo+ID4+DQo+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4NCj4gPj4gQ29tbWl0IDFkMmRhNzk3
MDhjYiAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBdm9pZCBjb25maWd1cmluZyBJU0VMDQo+
ID4+IGluDQo+ID4+IGdwaW9faXJxX3tlbixkaXN9YWJsZSooKSIpIGRyb3BwZWQgdGhlIGNvbmZp
Z3VyYXRpb24gb2YgSVNFTCBmcm9tDQo+ID4+IHJ6ZzJsX2dwaW9faXJxX2VuYWJsZSgpL3J6ZzJs
X2dwaW9faXJxX2Rpc2FibGUoKSBhbmQgbW92ZWQgaXQgdG8NCj4gPj4gcnpnMmxfZ3Bpb19jaGls
ZF90b19wYXJlbnRfaHdpcnEoKS9yemcybF9ncGlvX2lycV9kb21haW5fZnJlZSgpIHRvIGZpeCBz
cHVyaW91cyBJUlFzLg0KPiA+Pg0KPiA+PiBUaGUgcmVzdW1lIGNvZGUgdXNlZCByemcybF9ncGlv
X2lycV9lbmFibGUoKSAoY2FsbGVkIGZyb20NCj4gPj4gcnpnMmxfZ3Bpb19pcnFfcmVzdG9yZSgp
KSB0byByZWNvbmZpZ3VyZSB0aGUgd2FrZXVwIGludGVycnVwdHMuIFNvbWUNCj4gPj4gZHJpdmVy
cyAoZS5nLiBFdGhlcm5ldCkgbWF5IGFsc28gcmVjb25maWd1cmUgaW50ZXJydXB0cyBpbiB0aGVp
ciBvd24NCj4gPj4gY29kZSwgZXZlbnR1YWxseSBjYWxsaW5nIHJ6ZzJsX2dwaW9faXJxX2VuYWJs
ZSgpLCB3aGVuIHRoZXNlIGFyZSBub3Qgd2FrZXVwIGludGVycnVwdHMuDQo+ID4+DQo+ID4+IEFm
dGVyIGNvbW1pdCAxZDJkYTc5NzA4Y2IgKCJwaW5jdHJsOiByZW5lc2FzOiByemcybDogQXZvaWQN
Cj4gPj4gY29uZmlndXJpbmcgSVNFTCBpbiBncGlvX2lycV97ZW4sZGlzfWFibGUqKCkiKSwgSVNF
TCB3YXMgbm8gbG9uZ2VyIGNvbmZpZ3VyZWQgcHJvcGVybHkgYWZ0ZXIgcmVzdW1lLg0KPiA+Pg0K
PiA+PiBGaXggdGhpcyBieSBhZGRpbmcgcnpnMmxfZ3Bpb19pcnFfZW5kaXNhYmxlKCkgYmFjayBp
bnRvDQo+ID4+IHJ6ZzJsX2dwaW9faXJxX2VuYWJsZSgpLCBhbmQgYnkgdXNpbmcgaXRzIHVubG9j
a2VkIHZhcmlhbnQgaW4NCj4gPj4gcnpnMmxfZ3Bpb19pcnFfcmVzdG9yZSgpLiBIYXZpbmcgSVJR
cyBlbmFibGUgaW4NCj4gPj4gcnpnMmxfZ3Bpb19pcnFfZW5hYmxlKCkgc2hvdWxkIGJlIHNhZmUg
d2l0aCByZXNwZWN0IHRvIHNwdXJpb3VzIElSUXMsDQo+ID4+IGFzIGluIHRoZSBwcm9iZSBjYXNl
IElSUXMgYXJlIGVuYWJsZWQgYW55d2F5IGluIHJ6ZzJsX2dwaW9fY2hpbGRfdG9fcGFyZW50X2h3
aXJxKCkuIE5vIHNwdXJpb3VzIElSUXMNCj4gd2VyZSBkZXRlY3RlZCBvbiBzdXNwZW5kL3Jlc3Vt
ZSB0ZXN0cyAoZXhlY3V0ZWQgb24gUlovRzNTKS4NCj4gPg0KPiA+IElJUkMsIEkgYmVsaWV2ZSB0
aGUgaXNzdWUgaXMgSVNFTCBpcyBub3QgcmVzdG9yZWQgZHVyaW5nIHJlc3VtZS4NCj4gDQo+IFll
cw0KPiANCj4gPiBDYW4gd2UgcmVzdG9yZSB0aGlzIHJlZ2lzdGVyIGp1c3QgbGlrZSBTY2htaXR0
IHJlZ2lzdGVyDQo+ID4gc3VzcGVuZC9yZXN0b3JlWzFdDQo+IA0KPiBUaGUgSUE1NSB3b3VsZCBo
YXZlIHRvIGJlIGNvbmZpZ3VyZWQgZm9yIGludGVycnVwdHMgYXMgd2VsbC4gRG9pbmcgaXQgaW4g
b3RoZXIgb3JkZXIgd2lsbCBsZWFkIHRvDQo+IHNwdXJpb3VzIGludGVycnVwdHMgd2hpbGUgcmVz
dW1pbmcuIFRoZSBjb21taXQgMjU0MjAzZjlhOTRjICgicGluY3RybDogcmVuZXNhczogcnpnMmw6
IEFkZA0KPiBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0IikgdGhhdCBpbnRyb2R1Y2VkIHRoaXMgYXBw
cm9hY2gsIG1lbnRpb25zIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAgICAgQmVjYXVzZSBpbnRlcnJ1
cHQgc2lnbmFscyBhcmUgcm91dGVkIHRvIElBNTUgaW50ZXJydXB0IGNvbnRyb2xsZXIgYW5kDQo+
ICAgICBJQTU1IGludGVycnVwdCBjb250cm9sbGVyIHJlc3VtZXMgYmVmb3JlIHBpbiBjb250cm9s
bGVyLCBwYXRjaCByZXN0b3Jlcw0KPiAgICAgYWxzbyB0aGUgY29uZmlndXJlZCBpbnRlcnJ1cHRz
IGp1c3QgYWZ0ZXIgcGluIHNldHRpbmdzIGFyZSByZXN0b3JlZCB0bw0KPiAgICAgYXZvaWQgaW52
YWxpZCBpbnRlcnJ1cHRzIHdoaWxlIHJlc3VtaW5nLg0KDQpPSy4gU28gZW5hYmxlL2Rpc2FibGUg
S2VlcCBJU0VMIGNvbmZpZ3VyYXRpb24gYXMgaXQgaXMsIHNvIHRoZSBwaW4gZ3BpbyBpbnQgYWx3
YXlzLg0KV2hpY2ggY29tbWl0IDFkMmRhNzk3MDhjYiAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJs
OiBBdm9pZGNvbmZpZ3VyaW5nIElTRUwgaW4gZ3Bpb19pcnFfe2VuLGRpc31hYmxlKigpIikNCmlz
IGRvaW5nLg0KDQpUaGUgbmV3IGFkZGl0aW9uIGlzIHN1c3BlbmQvcmVzdW1lIHJlc3RvcmVzIElT
RUwgYWxvbmcgd2l0aCByZWNvbmZpZ3VyaW5nIGludGVycnVwdHMuDQoNCklzIGl0IGNvcnJlY3Q/
DQoNCkNoZWVycywNCkJpanUNCg0KDQoNCg==

