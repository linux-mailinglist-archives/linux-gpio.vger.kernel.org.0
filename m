Return-Path: <linux-gpio+bounces-21707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C2ADDD12
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C409B17FECD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4E42EFD8B;
	Tue, 17 Jun 2025 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="igvO9ziG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EA4A3E;
	Tue, 17 Jun 2025 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750191449; cv=fail; b=ulJGGpaPjcwGCtMaqTIyvtZL+GdsL3coCWW1Wzd9TOPE9XMxUegvMfQ9Yjxcguc42VI4RJNO+0ccFw2IMTCMViWY1km2YypL9GR+ZXl633/HowjtCPbFSIro20pv6eB9C3fZzR3pPNS/kdnnYl52OhDGJn5h4rhpVvLNDUsXOE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750191449; c=relaxed/simple;
	bh=GnoHm9TeLBBtD/6s5UGiiBboUxD4OBZQPyWrk8ZMgMA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xg5GL3m+v7HhIcy0KTsHRVhST8u1lTCgRcbabGL/rAHFM3oFw5kiZ4NTON8BTfeq16p//69fhEeW/GdFVlAhMWj8tKlYUcRTdGn6OviOvM+xrUFnsJNsfqlUhyS/Ol/8X83ZnPJVv7I1jKz7GUdlb7MggPE2SWKptluGazDM7n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=igvO9ziG; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH2oCSiYslpAH0Ux17efMAUsDQy2J7emNnurqW3uPPOR4PCf8cAO/9U4lTuvEjfuemvbcXQ/o/jUzV9QX+3BPd6oG3EwFXoG9abGB1jlaVAgDhrD/3wOWAOVWeoP0Y9hOUdx7zRTWCOmbw4tY6wXNtPvY0F2RBg1wXD9nc8T/dKzflqP8GAz+Ph1HsRAiLtCCFmvDTXzLkXVUH393dSnBjtAp5LAHjixZDsNHVIEdp16gtAwOb9Aqx/HDqibru1ZUCeXEEYSOPOiIlUpqxcaBbwDoWoH6h9PvUy7fqWVsx9MiiFQaRvzj4K3M4AyIr2ZvknSsA6ZX+NY+oGzSD1Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnoHm9TeLBBtD/6s5UGiiBboUxD4OBZQPyWrk8ZMgMA=;
 b=OY/lP6jsDu5kUCU8naktELCaiSrRLZlHjvKW11XBkN0HpW4+MI/01MSX2dVNtrLBaDXIGq1yzpooyIhyEtVSOp2WVOW97keHFPbg5udHA686ZqBcn7zAjm9D18kCRbY9E+uIaCUS0crk8fq4DtGdJagv0eDD2u4ZDv8/bGSgoXzTadNAIxESkS4uDiijyWf6z0pBO5njmHDbNUhiCXUiA6hoXmsUyGunHe8k8Sgh6pEHkXYzQ/CqNPFzZH/phPpNGUoNjP5AL9TaB29766oTLrB6Ashod7BpPmbN1ddH1DMV0TujMRJPabdGeWqO+tDVk4yT38TBbLdddAcTTagE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnoHm9TeLBBtD/6s5UGiiBboUxD4OBZQPyWrk8ZMgMA=;
 b=igvO9ziG7rsg/aksJQva9C1F0dHMQXTzVEMzvkAgw8wbS3K1V3p97KegRSK+QMsYHdt+tBhy1VEQzlus7WICoScIYmV/P5FlI3wvHpC5Ws9EWp7jtNhWJ1wa136qE9owX7eyGX3BBPEvW+tHhtoA64tj1C0V5a1T5FAhVHVja2eGeBlqk7w77YSKrkC4JgHfKZt4NBXhRrxQ7aDAIiPAEbsx5Zi3YlPVWBIFzFUUpWpv4gMgHNI+Tic448NnUkWRTkVUlKNVTbjd031lGiJ79WNO2J10V+SKSW5R+t70c81ZvKKnHkC6z7fzXca9PhLB89ed+qo3zi3uCRRbVWBeRg==
Received: from MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Tue, 17 Jun 2025 20:17:23 +0000
Received: from MN0PR12MB5907.namprd12.prod.outlook.com
 ([fe80::e53b:7416:2158:6950]) by MN0PR12MB5907.namprd12.prod.outlook.com
 ([fe80::e53b:7416:2158:6950%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:17:22 +0000
From: David Thompson <davthompson@nvidia.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shravan Ramani
	<shravankr@nvidia.com>
Subject: RE: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
Thread-Topic: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
Thread-Index: AQHb3IEckXgBGyKNJEivbcZGFRzq8rQFb/6AgAJgKTA=
Date: Tue, 17 Jun 2025 20:17:22 +0000
Message-ID:
 <MN0PR12MB59073B275C027AB217C172DAC773A@MN0PR12MB5907.namprd12.prod.outlook.com>
References: <20250613163443.1065217-1-davthompson@nvidia.com>
 <CAMRc=McQ-dAdt=eAkk+j+5qs7ZyVDuipE0ptQTrbmGHXf9jjKA@mail.gmail.com>
In-Reply-To:
 <CAMRc=McQ-dAdt=eAkk+j+5qs7ZyVDuipE0ptQTrbmGHXf9jjKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5907:EE_|DS0PR12MB8343:EE_
x-ms-office365-filtering-correlation-id: 59a2ce94-fc1f-463f-1d40-08ddaddbf82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVBPZXhXTzR5dEw0MGVxNy9ReVNOT3E2eTg0YlJGVHJ1anJ3UXpRMHVVdkVC?=
 =?utf-8?B?RDF1dXdON0NJd0wxQ2EyeHFqKzNIVWdmOElIMGNiMEI3bzFqcVM0S2lLTnFt?=
 =?utf-8?B?OWxRekQyUUQ3K3QwQXEyODhSWXdQUU1UYzJEUFBMWmNoQ29RWEcvRENyRjlP?=
 =?utf-8?B?dnFkcTcyN0hNaFFoeHBzZ3drVkM4dkNMbUZlZldnOUFaWDFseUtvaEsxMEVM?=
 =?utf-8?B?bkNKd000WUZzMGwrd1VmcUtYczlxZFpXcnFiT2cvTm01K1duZzQ0QmppRDdu?=
 =?utf-8?B?Y1ZsSklaZzZQbUhwdXRkOWRhZUVPOG9pNUtVZ21WV1J6SFdtYlZ4eFZ6dkh1?=
 =?utf-8?B?OVJvOG04WmRZRUYza2xaZFBjbjFRL3JNYjB0MVRTRUcrc3R0aDd2SGUrLzFz?=
 =?utf-8?B?M2l1WENQVjJ4MmpIMGZXTE9JeVdVSU1wUHM2bjRLSVZYUGcwVnQ4Z2VNR0RR?=
 =?utf-8?B?Ui9McEtObThjZ1lndW95UForWXBXekZvZVhnWXhLL3J6L05zQ28zUEVuU1g2?=
 =?utf-8?B?YmFIU3U1RldHcUFpbXlEOXhXN1ZneUpOVG4zM3NyUlJjSDJJNTc3ajVIc1Z6?=
 =?utf-8?B?L2NKTXVhK3o4Ky9aaEw0OGlTWjR0RlZzc2JPUU5QQTVKUHJ0UDZ0TWFENHhS?=
 =?utf-8?B?MENXb2JVb1ZhNTdORzg1bmlBWm9BeVhZcGVGZzMzYmg5c3dmdWZxOTJBYWJ0?=
 =?utf-8?B?UlRieGJaVHlkOTFnVFRVcEFOWHNjWjdLWkpWYWdTVk4yQmZSZG9Sd1ZrUlBE?=
 =?utf-8?B?M2Jxb3lRcWRmWk5LbklSajVxSEc3UWROeVM1VktWSWkyTU9HMXI3UnAxZTl4?=
 =?utf-8?B?RDBVbmkvWkQzWUpyRzd5QXlhbkNkS29MZlI4S2wyOS9UZFE3SlRPQkNRcGdU?=
 =?utf-8?B?Yys5eUorN3BGUzJWQWZqVWxYWmNyMHVqYUs0VWw2K2Y1SzBHbUJYSkltQ01M?=
 =?utf-8?B?NUJpRVVmYm5qSndxVkVmZHB6U0VibWJvVjVGTDlBNWJWOHV4eURLOXlZRE5m?=
 =?utf-8?B?aFhnTzZxVk1LQ2QrK3F3RnFweTdVL2JMczlpTWdaYWNZNjgvVE1xQWw5NmQ0?=
 =?utf-8?B?MEh4eUw5MGU1bENhQTY0VEoxK3FIcXp4RVR4T0ErNS9aOEhkRnhVV0dTU1pM?=
 =?utf-8?B?Y2lFYzJpOVdSZEJTNVYyWDFuc0Z3djFJdk5zbWtuSnpRVmtCZTNyZlVlOTU3?=
 =?utf-8?B?RjRPemRPSGdreGhRQjEwc0pXNFpNU0ZSTjNUUzFDUnRqcHN4Z0F3U0pzQ3NW?=
 =?utf-8?B?UlQ5bktmVEVSMWc0R2YvUGhTdThCcUJMdGVEN1ZQbUFubXIrcEdUeDNNemN2?=
 =?utf-8?B?NVNWdkVFZHh2WFpvVnV6YnpEcWtnMWJXaHI5cC9zbjVRRU1NbFZKQXBxc1cr?=
 =?utf-8?B?U0R5UE8xQUFobTJadFRhcEovb1o1Ui80Z0RpWGg4V2x4V0JiVGhnRzlLbHR5?=
 =?utf-8?B?eXV2OWszdTg0WlNKOE1oUk1OM3dOdERESUszY0w0eXdXUGxlTnJlZllFSWNZ?=
 =?utf-8?B?WDhVTkx5TytHNmhtMkJ0Y3dCWDdsU2VKNkt1Q1hUMDE3cGJHRHFMSnlXaHZK?=
 =?utf-8?B?amhrYlJkT2ZROVZmRnd5OWlWRWl6MGdaTWVTWlZaY2QxekhCRmpwNlZXZmd6?=
 =?utf-8?B?OTZEQms0RkFrckduemtVaGlCd3FVMDlYSW0xR1Uxc3BYb3ZrVS9ocWxiYUZI?=
 =?utf-8?B?TUlEU0hKNWxJa1JwS0VVcjZ2blhjS3hwUFFXZGoxOFNjSWk0dWZoRmJjamtV?=
 =?utf-8?B?SWVYY2FLeTNMUlR1MktKNjdxYi9TaEFKME9yVUdYS3JWdEZpTm5lZXJXMlNU?=
 =?utf-8?B?MllaQWVodWkyOFZTajNsRnlvSDJtekVOSjJJWS83UC9SbGRZRFhSdGFWL1BY?=
 =?utf-8?B?eFV2dXJtTzlRQzY3c3VKWUtNL2lmOWFENFdESlZ4bmM3dW82cjFodjd6UFZ6?=
 =?utf-8?B?YTZPUDlyRC8reUxpSE9GUFRMZmRybHoxR3V0SWlmT1ArNDhCSWNvYWhjdUR4?=
 =?utf-8?Q?vG29w8ktd8XFNNpZG4uiF4rdEP2UWg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5907.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnJ1MFprVjdXSk5LOWpTV2VSdFplaXdBNXRyWHM0dGdBKzRnS2lMNmpWQW51?=
 =?utf-8?B?amE2SUwwc01MU2lNRmQ3OFlqbXVoZ1Y4cTdzbTBlZmR3S09TNFRsNDFsc1hH?=
 =?utf-8?B?R2grMHFrblM4eTJTQTRYZTJHSXFWS2NCUGl0dFdLbnJya1M2c3hyUjVwTWhh?=
 =?utf-8?B?enlqMGhESFA2UU53TWFsek9va1YzSXd5MEZZWkNodlBERk9HWWVEMGFGRlhS?=
 =?utf-8?B?eStFR0VZanBCR05kdlRHNjNHWUg2ajJBdlppd1REMjFka1hhcENUdFJ1VmVM?=
 =?utf-8?B?N012SlFxQXhtNTRtb04xOWZoeFI2VStkY1hubXd1QnQrTXFuajFvek80NmlS?=
 =?utf-8?B?ZExBbWNVUzYyT2R6UEpHN3pFd0pyRysxVENjKzV3OGlrWU5CVjYweHlwZUlE?=
 =?utf-8?B?ZzA2ZW94Ym1xM09yQWtEVFF3Q3NpZFZ6ckt3YllMa01nSHhRbG45a25wN3Fr?=
 =?utf-8?B?NitxQ0R0TWI5UUdjaVNBMlJVb0VNL2NKZE5JVmkyTHREQWZMQ2czVVJKb2lZ?=
 =?utf-8?B?ZFpYYm90NEpmbzVxTjVoZmF4bWVGamUvd245OE5YbTUyOUovY1puWlRHeHlt?=
 =?utf-8?B?NkFMSmF3MzB1MlhvRk4wVnA0bEJlTmpZamF2M2I4cVBTS1lqdVlUWUNsQ2xH?=
 =?utf-8?B?TDdSdDFaOC9tSjRaL256S1Z2NU9MaXBtZk40M1o0RWY5MVRmUEwrTCtTOGxr?=
 =?utf-8?B?TkJiSGtDWHZuYXZqcHZUblZuWTJvTUxlRG9hMndudFc4M3hhazlRODNvNlRV?=
 =?utf-8?B?MS9NRkJqUnVNS0pwL3VOaXBzeEVHSXlvQ1BWOHBOL0E1LzlLQWpoN2lTbnR5?=
 =?utf-8?B?QWdaZHp2bXdSa2JNRzlmYmw2UllPbmZhNGJlTDFYQi9rVjBxd0d2dVl0RkpU?=
 =?utf-8?B?Q3JuQlV1U0FLSTRTR2dodU80blo2a1lBdmhSSDNNM1I4VUJWMWJJbjJCbWRB?=
 =?utf-8?B?MEtFdXBIaWZ6OW9pUDdCdTZNMDhOb0R3cVA1ZkRkWmxvRmhpd1MwenJpcWRj?=
 =?utf-8?B?WTFkQWxaVzlCNURaWTFIRXczWGFhUFQ5SFlESys5Rjl5eTUyUEhoSXRMNTdU?=
 =?utf-8?B?RE40dUc3dlR6WVMvanBzVkpxaitmQkJ1ZHFUM2ovemRSUDl0WmlTOXVLMnhJ?=
 =?utf-8?B?U3ZFaWdpZkgzalR2SHJzeUN3cFhtcnQ5UExZVGdtME1VenVBZk5LV3hrV0Qy?=
 =?utf-8?B?c2RXQU1Qa3kvSFhjR3NhcHJWbmJ1Z2JBTi9HSkpHYW5QbEs3WXpteitpMUVF?=
 =?utf-8?B?ZjdvNFpTRUZIR25JWHpCa2QxV3RSOHNNWmZvWVM4RzdWbURZYWZtZndGTlhS?=
 =?utf-8?B?L3ZweURFbmQ3YVVlV01udC9XU0lKYlZSZVFmcGlkS01NR3hmVmhhQ3RWK0E4?=
 =?utf-8?B?OFZFZGJPM1h5UjB3ekplR1pXVm0vUWtWU0JBTFNxMlJEMkJBLzJUTXBndmlM?=
 =?utf-8?B?c09SZ3MzRzN5aXZVWVJCR1YxTkJsdzVlRGYxb0NxYVdKRjc0dXhZc0xpcWdL?=
 =?utf-8?B?QmxMd2thOVFWMEo5WGd3ck5GZFVidzJzaSt2cFJPWGh3SXY3UGp2VFVKVmkz?=
 =?utf-8?B?bHdTMkUxemI2Q1V6UzBJVUVqOEtzZGxqTzZZVVJGZGFTVjF4Ry9MYlBvU1Z6?=
 =?utf-8?B?dG1IaEwyU2NEdU8xYWhyT1Jka3RDcGpmMGM1S3ZIcmlUVjUvUnVKaDR1OHZP?=
 =?utf-8?B?K0pnZUN1U2V3RDJHYmZwb3lUTE5tRUtuTGtDWVFLUEFIMmtaOSsyUkk2SFU1?=
 =?utf-8?B?SGgyR3V5aWtIcGNaaGt3ZlpOOUJBbFBxekliL0wxb215V2liYmJxNWhvcHBM?=
 =?utf-8?B?RjYwTEVaYS84eXZjVFNEeGtURzdxalk5eW9sa2NGMTZ0b2NJQlB6K1VUTjhC?=
 =?utf-8?B?MWxub3BRd01mSHVZZ2ZXMTdYc3lnRm15dXhKclAxZGo2KzJLbHhxSGZwTnBv?=
 =?utf-8?B?b0VlQ1BHUnVaOGtCaG83U3JkdTM4K2RSKzMvZ1o1RHpZVHIvMkViRTViUndo?=
 =?utf-8?B?VFBYVUUrcWd5NXNSOHplWGFsQXIzU0NCZ09xZzg1dUJKVzhJQ0x3UnNVU1VL?=
 =?utf-8?B?c3RVWDlkNE5CazFURkViQmtTTHRLK3ROQURrZ1FYQnN6aTRGMnZjQVBya1Qz?=
 =?utf-8?Q?xnKQV67nHbGEmeAlzDiKFOZe7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5907.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a2ce94-fc1f-463f-1d40-08ddaddbf82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 20:17:22.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLWW5PYXRmEg2p9mNkCgm85gnphMoQRc3Y97PPShzPwN96OIpRVSAHtxwzpioiPZWQDi8H4lIppA7bqrXX0kmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMTYsIDIwMjUgMzo1OSBBTQ0K
PiBUbzogRGF2aWQgVGhvbXBzb24gPGRhdnRob21wc29uQG52aWRpYS5jb20+DQo+IENjOiBsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2hyYXZhbiBSYW1hbmkgPHNocmF2YW5rckBudmlk
aWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxXSBncGlvOiBtbHhiZjM6IG9ubHkgZ2V0
IElSUSBmb3IgZGV2aWNlIGluc3RhbmNlIDANCj4gDQo+IE9uIEZyaSwgSnVuIDEzLCAyMDI1IGF0
IDY6MzXigK9QTSBEYXZpZCBUaG9tcHNvbiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiBUaGUgZ3Bpby1tbHhiZjMgZHJpdmVyIGludGVyZmFjZXMgd2l0aCB0d28g
R1BJTyBjb250cm9sbGVycywgZGV2aWNlDQo+ID4gaW5zdGFuY2UgMCBhbmQgMS4gVGhlcmUgaXMg
YSBzaW5nbGUgSVJRIHJlc291cmNlIHNoYXJlZCBiZXR3ZWVuIHRoZQ0KPiA+IHR3byBjb250cm9s
bGVycywgYW5kIGl0IGlzIGZvdW5kIGluIHRoZSBBQ1BJIHRhYmxlIGZvciBkZXZpY2UgaW5zdGFu
Y2UNCj4gPiAwLiAgVGhlIGRyaXZlciBzaG91bGQgbm90IGF0dGVtcHQgdG8gZ2V0IGFuIElSUSBy
ZXNvdXJjZSB3aGVuIHByb2JpbmcNCj4gPiBkZXZpY2UgaW5zdGFuY2UgMSwgb3RoZXJ3aXNlIHRo
ZSBmb2xsb3dpbmcgZXJyb3IgaXMgbG9nZ2VkOg0KPiA+ICAgbWx4YmYzX2dwaW8gTUxOWEJGMzM6
MDE6IGVycm9yIC1FTlhJTzogSVJRIGluZGV4IDAgbm90IGZvdW5kDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBUaG9tcHNvbiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogU2hyYXZhbiBLdW1hciBSYW1hbmkgPHNocmF2YW5rckBudmlkaWEuY29tPg0KPiA+
IC0tLQ0KPiANCj4gVGhpcyBsb29rcyBsaWtlIGEgZml4LCBkb2VzIGl0IG1pc3MgdGhlIEZpeGVz
OiBhbmQgQ2M6IHN0YWJsZSB0YWdzPw0KPiANCj4gQmFydG9zeg0KDQpIZWxsbyBCYXJ0b3N6LA0K
DQpZZXMsIGdvb2QgcG9pbnQuICBTaW5jZSB0aGlzIHBhdGNoIGlzIGEgZml4LCBpdCBzaG91bGQg
aGF2ZSB0aGUgZm9sbG93aW5nIHRhZzoNCglGaXhlczogY2QzM2YyMTZkMjQxICgiZ3BpbzogbWx4
YmYzOiBBZGQgZ3BpbyBkcml2ZXIgc3VwcG9ydCIpDQoNCkRvIHlvdSB3YW50IG1lIHRvIGNyZWF0
ZSBhIHYyIHdpdGggdGhlIGFib3ZlIEZpeGVzIHRhZyBhbmQgc2VuZCBvdXQsDQp0aGlzIHRpbWUg
aW5jbHVkaW5nIHRvIENDOnN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc/DQoNClJlZ2FyZHMsIERhdmUN
Cg==

