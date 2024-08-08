Return-Path: <linux-gpio+bounces-8669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB294B65B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 07:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19031F23098
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 05:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4091183CDF;
	Thu,  8 Aug 2024 05:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TtgV5050"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8F183CCD;
	Thu,  8 Aug 2024 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723096427; cv=fail; b=l36ypAcY1E5FXuxbCfQzUnAv5JhzXpGH8xehmDKZ1z5sQUL6rADyjd5CeO4wWnb3Thi9kUk697vFfsC5weu/lHQ6F12HfhL+XRcTmcPuXAxilOEkZO7VODBrZdqzHQJSkiQxpjmuqGQpJyjK3jKEtmHqn3CZR52ik59ppptMJqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723096427; c=relaxed/simple;
	bh=Ns9G2gImvU1LwHvSluJ8z6QY1siEr19LvkNwWGzmDOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RFQ9lRcdJVzk+cLUIAX4z8+gJGZIYySE7/QNqRUL0myZYw0L8U1zYN601pWQzJG7nh0SZT5sJg2zimSDvRuF9MHxpcQc+VTOa7e3AZOkye53z8GQcpnjCIsEFiCcmNOuh5o35QwIcpGlv6MNJfo1ZbDVf5vuO/ZLG1uKHrBWIAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TtgV5050; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y13fO0JRBxTY687MskWHUd4KAnMJJboNUtzNDVW5TBVU8diURt/FXWJJmFPaRinsyTcfvZbSlbqCzxN09uXElaFACooArLr5ZT7VEKqFiUpnntOzHN0pC7TyN6pho2Ob3g9GPqAKZI6YwNgIHERhFXDIX7jTOMHkXMr1QwpSwkjeG9/ySjdVOgJKWxQsBO+7xG7h+7L85XJ57NSVwCAto+urTIftVJ0AJ8ZygVOkuvORRJeh5urQtBpke945Clhl6Nk+SbdkzGnmuBwmslGZyC+lKzQ4ybS5CX+iJdgfJGfnvoahGYxGYlJCviAaDCqGL3yn8ps1OvxJ5sHH3MCaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ns9G2gImvU1LwHvSluJ8z6QY1siEr19LvkNwWGzmDOE=;
 b=cExm40fZYHmDzCaJ0DFwBMVMXJGPfsWFT7bWHQi+EW1Cq1DewxzKLRse3wWEcL8Jb88LoLMFC8gafckLGxbi8+7SwuYilElU8sLo25c5n3QzWC2CVioG+GtZmW5i390WVqXIrDDlxiwCcd8Yf3qlwUR6UVK5lAFGry8b29C8TQxHlijrzQAw8C4/chm9Jb+BSDVMppasRhfyh7Ady8EoEMf1otU+oO/OJt9cMksP4fWJrH9Yz4StTu+1URX94ppFdo/iZc7Srj3IGwqxtlEdLVjwck7IgQBTtNe9JXRbZQdcNxobC0ZTCFCUZPGmZEWSnw4qtM9rN/N0O4+8Z3SPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns9G2gImvU1LwHvSluJ8z6QY1siEr19LvkNwWGzmDOE=;
 b=TtgV5050xtP5Gm+m5lC00JUswRDpzwou+WeSXfE6fYJDVMC/GyRPGA2SpiGfRcDqg/ginAgt75whBoGySMz6b0kL65hjR9zcr2XMJrADBn5d8Br38I4sjEcRAIF72PjXGi+lYNoBvUlHMpmuLuqRUUWBj91y5VnSjtoga+X3lrM=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 05:53:42 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 05:53:42 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Topic: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Index: AQHa5Ap1S6h2PZuQS0qUfT0Rrn8w7LIYdoGAgARnERA=
Date: Thu, 8 Aug 2024 05:53:42 +0000
Message-ID:
 <BY5PR12MB42586B02EB54BA76704F1062DBB92@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
 <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
In-Reply-To: <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|DS0PR12MB7745:EE_
x-ms-office365-filtering-correlation-id: 0e902652-3a5f-4100-9a35-08dcb76e7563
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUFXd0ZuUnVrY0dnWlVORS84TU9sZTZWQ2dCdWcrdUovSCtNTEo5RUxoNElZ?=
 =?utf-8?B?M05QWmVVWVRXYkJnNHNQR1FHcS9NWFhuN2VIRWZhdHZPZlVyUWFQdEJ3Tm01?=
 =?utf-8?B?OUV4bTBPaVBoYWxuclFOVlE0WjF5c2hTZTNkSmo4ZldickM5QTd3MUpUWWRn?=
 =?utf-8?B?T1ZIaTZrZ1huMG5wYkdEaXE3RThIbXhHaWhDZkdycTc5cWxWK1pmZEorbmR4?=
 =?utf-8?B?dndqbEk4RFJxTk1BT0wxOGx2Y0gxVW1sVU5Uc3JtLzFVQWdNK2FVeko5eEpZ?=
 =?utf-8?B?ZlhLeU93UjAxdHhQOW5yWnJORTN2WXJObW11Mnl0RkJlK3hwckxDUDBuQXBH?=
 =?utf-8?B?VWNPVmp6SkJZTzJwUDBnZElmb3IrSVBrWExyM0dPWFdFcDlvdWxVS2dkV1FI?=
 =?utf-8?B?eWdBWEp3MUxZRmJsTGxGbUhjQTVIVzBXalNIZjI3QnJGZVIzQmQ3R2wzZEt5?=
 =?utf-8?B?SWcxakxXNGxxQ3o3YUJyR0gzUjhsTWNwM3RudG1OcE5QNVdWQzc3MHhWekVC?=
 =?utf-8?B?eGJXZnBvTTVaNllicS9mOG5LOUVSZGJrVkJsNk9qbGxiNGRxOVphbkZkYU5P?=
 =?utf-8?B?MTV4bjZDa002OFFuYUttN2NOWmxtcVhkOFBnZ2c5NFUrRFc0eExvbFNXdktC?=
 =?utf-8?B?WnNQaWtMNHRpQzRpQmVoYitRSTg5bStQYU5XVGI4dUtzdG5LRkVYUEt6cmF5?=
 =?utf-8?B?RktwUm9HVDAvTURCUEs3bndWbUJkL1VaNkpEOG9yR2FCcjM2TyswQVltVXc1?=
 =?utf-8?B?dlNyZmpLVlhqYXk0ZXZPUHRscVB3VktBdzgyS3JoU2NrRkJIZ1lNUmRHTHVL?=
 =?utf-8?B?bFNDYnZ5bER5ZmJyWGZ2OHZ3Rm9qS1lCQUZPamdZNWh0OHZtWmtNTi9YNzJX?=
 =?utf-8?B?M3VFL1VJREpUZ29sbkkveXQ5SUNUQWdZQjFqcWp4T2FsWmJWOGVBc1pZOUNq?=
 =?utf-8?B?bGRPOEdPS2w4MnFxRkF0MkZ4MC9VNmhrWGJqbitQSExXQmVzOUJmQ0RmcnR5?=
 =?utf-8?B?M3JnWlNSRHJJYU5EUTJldVA4clZWMk9rY3hDUWpzWEIzUHNrOWRVUG1XMmFT?=
 =?utf-8?B?eSsxM0tqR0M2SjlqTDlmVXhpSDI0UzBQRVFCYnVlMmp0b0hWdE9XbTRRNFZQ?=
 =?utf-8?B?RFhFaWY4NmgwMitvMmZrT05MVEZYVjFnMmFyYnY3NHg1dlE1Y1BnZytXdzBY?=
 =?utf-8?B?NWllNE9DanFCbHRnVTQwcWNWdHF4TktWc2xXMitrQ2I2aDF4R0Y0dmp4MlZo?=
 =?utf-8?B?VGxtZVhIeFFTTGdteXFjc3RYNXpiU1FMY3hXSFBtRVdJajZqVEdKUVVsaXQx?=
 =?utf-8?B?dUlybTFyS25BMERPUk1lcTVaandPbW5qbTJMbDBKaGpIWk01Nml6bURpR2hm?=
 =?utf-8?B?eE1xNVNnYy9ld3U5SWwvUUFYS0lIK0xocGhwelV3SFFtU1cya1JZaGFscGpj?=
 =?utf-8?B?c1JmdDlqUThPbHRqSEVSc1Q5d1lmV2JIbU0xMnFjSXF3dHFUSTE1c0IyTTNl?=
 =?utf-8?B?eTdpQnNpOVUzMW82cWpBQnVMbWxsa1hLS3NyVERUZk5zNHBxeWhySjNsbEgy?=
 =?utf-8?B?OTY1OUhGSUFJMDYvVnNBTTFuWWpvYU8xYjBLK0xzdFI5Tlc2bVdiN0RoYyt2?=
 =?utf-8?B?Y1l1L3JWYmhBWTIyalVQcmVia1huWTdqOUc0TkIyRTNTN3JVUTJyWVU5Z2lm?=
 =?utf-8?B?NVB1L2VUZUJjK1JtTXhtTDJIQUhjRUdzbW1oOUgxNFVFT3dCY1BCOGZXNnhN?=
 =?utf-8?B?cE1kcmh4M3ltKytFSGRtclpyZ0xOSC9QS2E2dnNvMGFSQXh0SlZLdmZla29x?=
 =?utf-8?B?cUszMnhXRGdSTGlYZjZlS1pGK2psYVUvMEJCeFlMSGhNUDRQWE1ZSEMrLy9P?=
 =?utf-8?B?d3ZTM050dDQ1T25lVS8xdGxOYnNONXVUV0oxdFJRVkRUc1VSNE41Z1VyZmhi?=
 =?utf-8?Q?BCt5ITn1tQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXc3cm9tdEw4NTdnNWhYRnJpUjdFempobHZGRGlXOU4rVDhYSWZlNE5wTWpX?=
 =?utf-8?B?a3BGdlVtWXVmK3JkNEtQS1F2b3ZyalRNb1UzTHc2dm5Cc3E4MHlETXNQZjVP?=
 =?utf-8?B?U3ZSalBhK084ZW9weEYzSFhhdnk0UjNJaW1IOE1iWkJxS0VBUTNoTHI0UzFl?=
 =?utf-8?B?TG9NazBlTTBLbjVSVUdIbGgvc3pVRDVzN2o2N2xDTC9Kc3JhRjFtdTBmS1BY?=
 =?utf-8?B?dHJhNmh1eHY3YUdWbGhwYWxEekRLQ3YyOGc0RlhRTWhCTW5aUEVidVo3cWM4?=
 =?utf-8?B?ZmUwYVlUMEo0Umd2RzhNanVwdjV1akFjWTFKQ2JzWFRONWRkbHpTZWc3ZGM3?=
 =?utf-8?B?OGd6dzBMQnFXZEFzeGp1OGZSbU1KYjZScDlkbGlYTzF6akJJVG55VWhTeEZy?=
 =?utf-8?B?UlBmYzc3ZzFsMHh2dVl2SWVPVnRqWk5mV2NXd3ZCSkpYU3E1SGMyUCtSVFBH?=
 =?utf-8?B?OU9XTGpsZTZwajNxakJpdnY5VmJMeG85VDU4cVFia3owRTJ6RU1weDByZlpG?=
 =?utf-8?B?VmxyM2diOVVSNU4yRkwyTTNobzdxM2wzekxUNEFpcEVpN29tUmIrTnFSUDU0?=
 =?utf-8?B?emUzV3p1KzFwc093SDJINUhXRE1qekVZZy9jMHJ0dU5FNnUyYitiODl2Sk9z?=
 =?utf-8?B?bWtoeXdpOUtxcGNxYmxUMzFwYVA3NGRDZjRNaWt0SFgrdmR2KzgwT3hDeUps?=
 =?utf-8?B?d2duTVpGdVJLZUxpeUFvL1U5V0R2RFpMRW1jUTFEZWZmVGU3aDM4M0FjWTBp?=
 =?utf-8?B?eTMxTEZ6SkxHM3VEcWpSR0JwOGpCRTBHVjNoOG1CZ0c3a21CeGFtL2tSOVFP?=
 =?utf-8?B?OUEwS2VxRElFU3ZBdmt2SW5pRDlLTWtUUFd4ZmVpR05yYmtrMGxyTGZXUlo0?=
 =?utf-8?B?OGNmb3loTkhablh3MnEwWEVocDZrUkZjd2RPODF2K1ZEWVZya3hkOUhnTGJ5?=
 =?utf-8?B?YkJHQ2pvYjFma2FBMFBUUU5ZenFSa3ZxWDllWGRSMHROaVdKRUp3VFZJd0tL?=
 =?utf-8?B?QitrdlA1OGwzclozTU9lSkhFVUpxWkdabk1QR2JlMjFXUm85VUthMEIrNWpM?=
 =?utf-8?B?QTk2R0VaSVl2dWh3NTdjcUFPSFRlK212S1dkZndPSC9MZWhjdC9KbkV4RmJW?=
 =?utf-8?B?UjlsVWFYMDJaa0JoK1BDM1BYc1lWMmJyTUFvMzFXNVdJZFlJcHJkem5zQmR1?=
 =?utf-8?B?M2R6bFlpeWwrUGp4Q2ZqTTJNWVduWkprSG9lVHlmeUV4UWJjRURVUEZrU3Jn?=
 =?utf-8?B?L3RSWDQ4bFdHMCtHK0t5UFBQMkZ5aXZtVXJpSFlLeXUySGRlaUJsYUROanRE?=
 =?utf-8?B?dUhsZTd6Y2liSFRoSmtSVzltdTNjUStkYlF6OU1sZ3lwT3JlVW9lQXQzbU5L?=
 =?utf-8?B?emlUc3B5cnVlRUN6S25tQTFLYlNFVUFMR0RVdlliQTBialMwV2pKbHBaV1VI?=
 =?utf-8?B?VzlxNEwxaFNSZ1JkZitpdzhpSnZMSGpqRlpmWjRjbFdzQlJqaGZPNTVRVm9E?=
 =?utf-8?B?Sk1CN2hmYjhiYW5naXdaSy9obWJDUm1rUElxbmlKenc4T3hmTDFkakozVWJv?=
 =?utf-8?B?TmRDM3ZLWi85QjJSUXM4OTRCVEtRUVhma3ZSbnRJU0lVcW1Ha3FuVExmcUFN?=
 =?utf-8?B?MzE3cWdjbmdQYzAya21RRGp2QVYzMFVkOElBMjFKdWtYWjEvVjVET2xqeWdn?=
 =?utf-8?B?T1VJWDByWGM3cDVxTS9IWE1BR1Uzdi9sTlp1d2ZFWHIwRFJLa0V4WkhSZ1py?=
 =?utf-8?B?dWF2Unc3UVFCNFJWUit3T0dEOGZ1ZHQ2alZMYVArN0ZHNkRHcmVyb2REdmdB?=
 =?utf-8?B?M2tJaWZxUndieTlHS2FiVlFjczBqeDN0ZllEQkNRb01oZWFXWTZMaWN4VGls?=
 =?utf-8?B?aDBvTURxU2s4cE9JQkxtVXl4elRrMWErSUN2S1c5a2RDbml1YW5VL1pGN0pt?=
 =?utf-8?B?ZmRXQ1BNTW1udWRPaXZ2L1FDMDFoVGRYQ0ZQS3NJWmdDbURWQTZXSDdPUXd4?=
 =?utf-8?B?TFdqTHZzUy9TOW5YQlpNSS90SlJ5N3lvZmdTZjRCaUhkWjZ2cDlFYngwUFBW?=
 =?utf-8?B?c2ZHWWtHZ29uOW9vR3E2ZUVzYllSTHhsZ1R5d2dMUGo3V2RUU25IOGh3VjhG?=
 =?utf-8?Q?XtwQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e902652-3a5f-4100-9a35-08dcb76e7563
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 05:53:42.3040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9atO3p9dZ7q1iD7mg/pjNzohPKwZeDwO1dvjE0MnISm5W98MnCwBds9XNpDtyoOuqhvAXtsb6d8khwPlDzHTfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogTW9uZGF5LCBBdWd1c3QgNSwgMjAyNCAzOjM4IFBNDQo+IFRvOiBQb3R0aHVyaSwgU2FpIEty
aXNobmEgPHNhaS5rcmlzaG5hLnBvdHRodXJpQGFtZC5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1k
LmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25vciBEb29s
ZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBCdWRkaGFiaGF0dGksIEpheSA8amF5LmJ1ZGRo
YWJoYXR0aUBhbWQuY29tPjsgS3VuZGFuYWxhLCBQcmF2ZWVuIFRlamENCj4gPHByYXZlZW4udGVq
YS5rdW5kYW5hbGFAYW1kLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gc2Fpa3Jpc2huYTEyNDY4QGdt
YWlsLmNvbTsgZ2l0IChBTUQtWGlsaW54KSA8Z2l0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRkIHN1cHBvcnQgZm9yIFhpbGlu
eCBWZXJzYWwNCj4gcGxhdGZvcm0NCj4gDQo+IE9uIDAxLzA4LzIwMjQgMTQ6MDAsIFNhaSBLcmlz
aG5hIFBvdHRodXJpIHdyb3RlOg0KPiA+IEFkZCBYaWxpbnggVmVyc2FsIGNvbXBhdGlibGUgc3Ry
aW5nIGFuZCBjb3JyZXNwb25kaW5nIGdyb3VwcywgZnVuY3Rpb24NCj4gPiBhbmQgcGlucyBwcm9w
ZXJ0aWVzIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xsZXIgZmVhdHVyZXMgb24gVmVyc2FsIHBsYXRm
b3JtLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FpIEtyaXNobmEgUG90dGh1cmkgPHNhaS5r
cmlzaG5hLnBvdHRodXJpQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waW5j
dHJsL3hsbngsdmVyc2FsLXBpbmN0cmwueWFtbCB8IDM5OA0KPiA+ICsrKysrKysrKysrKysrKysr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzk4IGluc2VydGlvbnMoKykNCg0KPiA+ICsgICAgICBi
aWFzLXB1bGwtdXA6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgIGJpYXMtcHVsbC1kb3duOiB0cnVl
DQo+ID4gKw0KPiA+ICsgICAgICBiaWFzLWRpc2FibGU6IHRydWUNCj4gPiArDQo+ID4gKyAgICAg
IGlucHV0LXNjaG1pdHQtZW5hYmxlOiB0cnVlDQo+ID4gKw0KPiA+ICsgICAgICBpbnB1dC1zY2ht
aXR0LWRpc2FibGU6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgIGJpYXMtaGlnaC1pbXBlZGFuY2U6
IHRydWUNCj4gPiArDQo+ID4gKyAgICAgIGxvdy1wb3dlci1lbmFibGU6IHRydWUNCj4gPiArDQo+
ID4gKyAgICAgIGxvdy1wb3dlci1kaXNhYmxlOiB0cnVlDQo+IA0KPiBXaHkgZG8geW91IG5lZWQg
dG8gY29weSBhbGwgb2YgdGhlc2U/IEp1c3Qgc3dpdGNoIHRvIHVuZXZhbHVhdGVkUHJvcGVydGll
cy4NCkkgdHJpZWQgd2l0aCAidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSIsIGl0IHdvcmtl
ZCBidXQgYnkgYWRkaW5nIHRoaXMgYWxsIHRoZQ0KcHJvcGVydGllcyBpbiB0aGUgcGluY2ZnLW5v
ZGUueWFtbCBiZWNvbWUgdmFsaWQgZm9yIHRoaXMgcGxhdGZvcm0gd2hpY2ggaXMgbm90DQp0cnVl
LiBOb3QgYWxsIHRoZSBwcm9wZXJ0aWVzIGluIHRoZSBwaW5jZmctbm9kZS55YW1sIGFyZSBzdXBw
b3J0ZWQgaW4gdGhpcyBwbGF0Zm9ybS4NClNvLCBpcyB0aGVyZSBhbnkgb3RoZXIgd2F5IG9mIHJl
cHJlc2VudGluZyB0aGlzPw0KDQpSZWdhcmRzDQpTYWkgS3Jpc2huYQ0K

