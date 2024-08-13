Return-Path: <linux-gpio+bounces-8730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436B9509B8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 18:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D3A1F26214
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 16:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1FD1A0B04;
	Tue, 13 Aug 2024 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AeA39Yk5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7041DDD1;
	Tue, 13 Aug 2024 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723564927; cv=fail; b=d/2V2ibh0nmd2fRdLNJgFFQ9bQEvYP8XYlaCk5pu0QwuWZDXiYOwTERN691TGch3XHMGL65iRzfZ+Kq+lNhrImEupYrMIFOCz7ZSgFMFqrURaq8w9k7ChqLAtC5BO6+kYe+CUb6MG7NqEoVH9oOq4OFwvgYw/tfPtvYJVKv8qYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723564927; c=relaxed/simple;
	bh=KXzv1qz8yKYTGa9y5cbkVERTG+jZPU/TnASwvD5hLkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kRMdTG4zYFuEqX61g7mDivgymj5dkfjclMHNq2+XSXXtIswGFZs5tcSGSa1jrFI4NFTUp/+G6FAVg2OnZNK2/AlXgFaXXuYzZYTcxLc+NOjDqu1pf2JyRocnipPDFZ/sOLRHb+OVkBZzZuBCdYcSq5lFx+wMve9afPNtRNlP8MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AeA39Yk5; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHCVaHZhIhZJyhxs1jGoAI4V2+6yzQezVMYAphW+M01CsGfkU9OoVIsTF8g2XCqXIcyg/BlkDAF9tutH3lAD3PcGvqp1zdSU99uLNx+/XphY0tsuOu2zPYZuC/VB3YsVit0ENBUlB5kBMBq3FDNb8OuLEJmqYvvvZoap8sNpi1PHo9sYPiMELoF/f/shCTBVOVabDh30mF7B9iDokChgWdAzqkX5dVIb0vUZkV2gr/j30Eo+R89VakGY1OBuJf+XoyC3AP6cV2xoLnKmD3MoQdqtl45jxPzOl5WqxNpRxy/rRuOaPl5aYh5MXu43v9ykZHLCsCXXK0ReBS4SDflo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXzv1qz8yKYTGa9y5cbkVERTG+jZPU/TnASwvD5hLkI=;
 b=L0KFpYPLDlpqCdYuSlflT7+Kn20grJ6cjJXgWIw0wAYpJ7Iq26SGZFD6J0pxS+WkAJOWA6bySPkhC06Wb6xGo2ZF3Ep2Dw0K1/MtLAQ9+Z1viM5vT6r55r8RlFZwnL5VPShZjA2b8rGnDd1RafLDt0TK6iy9iRLeZJqOU17Pim+KBLUUThswSYHfXDVh01oBs5+HdPdkTdrAMWr7Ww4Cn6xOm9PUlw2du6rGzo/lzyMBXMYVAmolGvS/XVH8+u8bQZaXsOwTSgJlJdEeucTcGaPM6173unpc4k4MFY1K4FFxWpWdpfNskOjVnh++F2WgIZiBV34ZCJk07WD4ztOLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXzv1qz8yKYTGa9y5cbkVERTG+jZPU/TnASwvD5hLkI=;
 b=AeA39Yk59PmTcaPdQkS4YwugktlhZRbv9UyZkQLqxE4Z0wc10CUOwzrJ2ZXf2dRGISWZ9MEH2gRoXfbQ787a3mHHvJfKZXdjYlUetF++XHaEU9iPlGQ6E4Ck9rnkxxIdZ2wuB86DqxEYJdqeG6d8Bcfre/ZZs1zsoVuMd0/f1mY=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 16:01:59 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%5]) with mapi id 15.20.7849.023; Tue, 13 Aug 2024
 16:01:59 +0000
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
Thread-Index:
 AQHa5Ap1S6h2PZuQS0qUfT0Rrn8w7LIYdoGAgARnERCAA66SAIAELpiQgABQZYCAAA0AEA==
Date: Tue, 13 Aug 2024 16:01:59 +0000
Message-ID:
 <BY5PR12MB4258C46B1314E46AC6808CB7DB862@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
 <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
 <BY5PR12MB42586B02EB54BA76704F1062DBB92@BY5PR12MB4258.namprd12.prod.outlook.com>
 <0bded05c-0fe6-4f35-b527-662b3356fb56@linaro.org>
 <BY5PR12MB4258AE889108439ECAA4B1C2DB862@BY5PR12MB4258.namprd12.prod.outlook.com>
 <a93b8d25-1bec-4a6f-9cb2-e8c59b923180@linaro.org>
In-Reply-To: <a93b8d25-1bec-4a6f-9cb2-e8c59b923180@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|DS7PR12MB8250:EE_
x-ms-office365-filtering-correlation-id: 9e0f6eca-837f-429b-3e3d-08dcbbb1436b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UXZjRzZQd3Zrb3QzNEhGVDljK09sNFFJUTJhOXlHNUU5clBlcTF5eWxURUJq?=
 =?utf-8?B?Vlk1MXE2bW5xMEFzRjcxaG5heXBodmpORUpoK1NYRHMxOUxOQkE4bGI0TzJn?=
 =?utf-8?B?dW1rMGs1cm5HMUxGUWJWdnBHVDE3OFdiMVFuRjRWWmp1V3lrRDlUUDRadVBD?=
 =?utf-8?B?Sm0rTFZlK3M4Z3g3L3dJNmRJVVAycmN3dDVxYi92eDA1V1lTSStGdS85a0RL?=
 =?utf-8?B?VUQ0RnArWUpyaGYyRUtuSnNWeE9VOUpCZllZNmhReUw0YmgzYVAzWHJyOFkz?=
 =?utf-8?B?TVhVQndwMk4yVzZSWTFoeTkyOGl2bGlsWWx3Y3F0S2dkai9lYTdqaC9ZRzN1?=
 =?utf-8?B?Q3krZStMNjBsakkwYWVlSWN2R21jRTU5Y1cvVWxNNGVRajRwcW5ocEtra1JT?=
 =?utf-8?B?cmFCNCtzYk53Mm5wMzJZSkpUVW1lVkJYamtJZ3ZXWVh6Sk9tZjMvaDJrU3VU?=
 =?utf-8?B?QnhQQzZrT0ZhOTRyYkhqVHZjN1BkaTgvRDJzT3BwejhtZnc4c0lsM0RJUi9a?=
 =?utf-8?B?K0FRZ1oxV1RWNkNnNEZkNmpLNG9YOStFWnJEbFBRd1FxdFZtRkdVbzBCTlpI?=
 =?utf-8?B?NHNqTE80L3p3YUFDY3F1R0l2Wlg2QXFXSEhUTVpTSTFsUHc2MVJTZTNyMlE5?=
 =?utf-8?B?S0hRbzA5WWlYNHVOblZESmJwRFpJTXorZ3ZJQjJZYnYzRkkvODRJSmtqdWdW?=
 =?utf-8?B?UzczbGZRZEpoYUNCaWVIZjRFbGNmbk43YktIK3RLNjlXeVlhNTU2emZ4OFJ2?=
 =?utf-8?B?OFVjKzRjcXZibUMzL2hrcDNpYVhhS3pxZXlsamRCd013eURWSVZGQXJ0TXlB?=
 =?utf-8?B?c3RmU2Z1QllPNVV2eDI0bDFNMC83dWJEMGJwbGtaZlMvWFFDWWtpZjNQOHRG?=
 =?utf-8?B?UGdjQnNJMWlaUExUekdKd1dCTDFBWlJFcWdxcU42VE1ra0N2YzhSMEQ3M1F1?=
 =?utf-8?B?MW5nd3owR0x5dFVJdmlQd0VBa1VXdUozWm9rRFZ3aFZoL3k1VXVuNTVPSzhx?=
 =?utf-8?B?c1lJVGp5VXdVOTd0L0VCbTRjYWNFb2l0VlAwT1RhTTlTRlZscVB4SUtRVlpR?=
 =?utf-8?B?d0hSS29KRWIxdldHVm9yL1FkOTdDdUJDNWxrOG9sNW5uWXExaWkrNEJpTkt2?=
 =?utf-8?B?VUYzbW1XY0U3bTkzZDdMeEI2S2NyRUJHUlFrbjZ2NnlwR1psbWdNS3E3Rk1B?=
 =?utf-8?B?SVZwSlkxeDErZEk0MzEvUmh3OWRFdWZVTEFpS2ZzVkFjOUxnRmhTTGxFS3cr?=
 =?utf-8?B?bkVDbSttRWhlak54QVlKU1A4SWdTaVpiM2RyU1RrVVF1U0MxUmJUU2hETlZL?=
 =?utf-8?B?MG82NmhVWFQ5aFZQWmJYcDV1aytPYUxmZUVRUktBRFBQT0o0NFVUWUQyV3hO?=
 =?utf-8?B?UDBCcmVOYXZJMjVic2ZOZit1dEQrYWRLZG1VY29RTHUwV09LZnpIbGVmSzZm?=
 =?utf-8?B?WVM2dS8zYXFzNnVVQmtJZnZkZ0swUktUY013OTNuMDlNOElQblVyNDJ2Ty91?=
 =?utf-8?B?TFhEK1JOMHkvTTc3SXQ1dFhZSFBLTUpHdGtiYzJqTHlGVkVDdkJ1WG0vbFIx?=
 =?utf-8?B?aWhHOVpxU25scmFaZ3B0eGFweDhCMWdCUitpRlRhdUY5MzYwVEVFSzk4U1k1?=
 =?utf-8?B?R3F3a094cWZGYS9iQUtiQWRZaS9HSTZIUUlMaVYvOGtqWFJ3YS8vZTJ5dWxC?=
 =?utf-8?B?eE04WVBGQ0F3V0I2akh3NUpRR0VoaG01ejJhZDhMbkxHNFNsRnFkaVpBNWRM?=
 =?utf-8?B?bU45OXRDUDBaNWhhOXoxZzBHcEJORm5teVcrUjBJUTJTaHgydDBTNGlEeWFF?=
 =?utf-8?B?Vm1UeENiaDR2elRIdTZ1TmgxL1JKT2lqWG5ON21OZjZMcWpwcGFBanlQNmFY?=
 =?utf-8?B?a1lhQnNTenE0dmN5dGpKTFVCUVhDZTBzWlFTODFYcVNJQ2I1OWg0MVp2MzU5?=
 =?utf-8?Q?8BpwIdwFAP8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1h6WlNZKzkvTkhZanAzbVFUb0JSZ25BbnZTMnJWMFlXNzAySWtrTXhtVWN6?=
 =?utf-8?B?OUpWRitSZHhZd1YzZ3QrcUo3aFlIdXp3Mk5KdFRqK25pR25VRGtnYTB2Tm1P?=
 =?utf-8?B?NGpGcmJoeFVsQ3AzU2pBL09KUEM4dXRqby9nNEhHTGxyWmlDaWw5bVB6MGEr?=
 =?utf-8?B?ZzNXME5Ja0hTbitFTDc0ZDZXa2VpZmFSaGlhamhZT3BaNFlaaXRIU1JWZmZr?=
 =?utf-8?B?SzhpYmRKQ3dUS3hjUlJSUllINXZ6ZHQyK0ZRcXk2WEM3S2x6Y01yS3NmZ0lP?=
 =?utf-8?B?ZzlpenVhMmpXbHc0WEpVdXJITFNQcGphd3NCUDdzNzdCRnRJSUJTYVlwWTNJ?=
 =?utf-8?B?S3RJMHVwM0ZUSzRpbWh0OEVPSHZVMVZ6RHZMT0NQSm1lUmM3OFkxTjVsV2dk?=
 =?utf-8?B?UlhQQk02YTZVaWJKQmpUcTY3VWJhVUZvOElkaFlGN2Q0SGlGamF1WjNZU21L?=
 =?utf-8?B?YmMrWm5rWDd6RmptU2hqenFkNmRJQnRHVWJYUlFLYnVOT1dWZkNOR0dSQjIw?=
 =?utf-8?B?MGRoRk1EMlpaL05lUHEycmFUMkdlRFQ5c0xJc1pSUTFGUVp6cjFZbGNtSnpG?=
 =?utf-8?B?K1VWcERQZWhDOEtaN1pZT1lRSlg2cy9MMVZFVFBBcFJ1bU5RRlNTVWtEVmpK?=
 =?utf-8?B?VzF3NWMwY0toK0dnSXFVWlNaVU5wUjNlSDVIOUtBdEI0SDJqb3JNWS9qZ01W?=
 =?utf-8?B?bGdDeGwrbFRReUt2TytGQ0xDcGlNM0lhbk9pVEZEbUxkeUkyTE1FeUgzcm1C?=
 =?utf-8?B?R2dTSE0yRTlENnR2N2VRa2xpWWFHb0xkeUNxTXVqaUZscTd2K05HY3ZuT1VE?=
 =?utf-8?B?ci9nOUxRWFc1bXBmVHF2TTZ3UHAzYnpTamJiUVc3WEpUdTZ5V0lPUEdBSUdN?=
 =?utf-8?B?RVdkTlI0NENmeGJvbUEzbUpLdk44anFnaGFqcUVxWU1kZjdGeDM1SUxqMFVR?=
 =?utf-8?B?SytzVE1ORGlJSU5ySi8yVk52d1BQc1dWK1NFQzFNbXhoSTNwUVJncmJuejRJ?=
 =?utf-8?B?SDg2dU9JTFdFcUxDK0RUbGNwS3RXSHJrNnNyenVQUmpxQWh3NVhpamFNaG5G?=
 =?utf-8?B?dUVPTnZYRThZbFVqc1dFSHdnL3VEZllxYVkxekl3cG9LNUp3ZXVLQjdVUmdN?=
 =?utf-8?B?OExweEZYbGpxRUtPQWFma3BoSW56SVRxR1dRRFpQSmxWR2hwd1dKZFVJSjJ2?=
 =?utf-8?B?aHloVUM0Y2dvOGxDSFZvaGYyTTRxOUR5aVR2Q3psbUJENmVnandtcjBrWXE2?=
 =?utf-8?B?ZTFTK0tlOC9jQkxGNDhWdFNwVkNZWHU2ZmNxdWJWQnFYOXZqcXlwSkoxWkVE?=
 =?utf-8?B?Z1cxcjZXNlhqTTYzeEhkUm1FQitISXNqTTNQQlpzekFLTng4VGlKVXZhWUJF?=
 =?utf-8?B?b0RxdVBXYlZ5aWs2NUE0RVVTSm93U29aNU1pRmVCYXc2M1JiWlVLUmc0eTFs?=
 =?utf-8?B?ZiszSXoyTVVoZUIvRmtrbVE4dDRlc3ZmU2hDazBjeExHYnJud09mQmg4SEFG?=
 =?utf-8?B?OGZZOFhrenFIOG1zS2dRcWFmZnViZW5CTzg2RnlWZ1dFZU1PSWIwVmV0UERK?=
 =?utf-8?B?ZnZxNWRZMXhaRk1VUkxyTmsxWkh3V0FCTEFCSGJZdFJKZmg2YUhmQmFseE1F?=
 =?utf-8?B?WktRTFMwRzF2QjhGdGRzdFE5Z292UmtFWEV5N1gvMFhTbXRBc2lCc0VibFZj?=
 =?utf-8?B?eGl0Q0JKUWs4SW1VN1B1YVpaOXBpZVVGZVU1WFFabWFnWVlYTFk0VkorSDBC?=
 =?utf-8?B?SkJ2WGdWVzZlbTFHdEMrakNjMW9XOWxPWmEvNjQvUnFnT0Y5SE4wallFUTM3?=
 =?utf-8?B?V282dlBBY3pSaWZrQ1AvMXh0TWpXdDd5K3dsS2taMUtNSlJwSlFUbFJSZmpj?=
 =?utf-8?B?S2ZJdlozaVh1S0Z2d0xzckovNmhveHl5VDB5YkVIa1Q3bEFiazJ6MzBhZnVT?=
 =?utf-8?B?UmRwUWFKM0ZEYnYvWUhCVEVKWjJxNmlMNkJDTHBXSWNUaTVLVzc5b2x0VzRM?=
 =?utf-8?B?V013dkNRM3BHbjJOeG55Mk4rWC80cktqZFoyRE1XRm1PTnA3YkcwMit0VlNU?=
 =?utf-8?B?VVZkL0RzeFdFL3NmSUkrdUNvcGIvblYyME14ck5kaTlTTGppczlOdExOM205?=
 =?utf-8?Q?YmvY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0f6eca-837f-429b-3e3d-08dcbbb1436b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 16:01:59.3861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5HXjDbw/xrHKngTaSPANYB9UMlkRFkbFEsd4ToX/oOLyGjs8QxrKyZRxiQ51fKoSa1Hjd70kqsNubwnn5yk9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDI0IDM6NDUgUE0NCj4gVG86IFBvdHRodXJpLCBTYWkg
S3Jpc2huYSA8c2FpLmtyaXNobmEucG90dGh1cmlAYW1kLmNvbT47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0Bh
bWQuY29tPjsgUm9iDQo+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBL
b3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47DQo+IEJ1ZGRoYWJoYXR0aSwgSmF5IDxqYXkuYnVk
ZGhhYmhhdHRpQGFtZC5jb20+OyBLdW5kYW5hbGEsIFByYXZlZW4gVGVqYQ0KPiA8cHJhdmVlbi50
ZWphLmt1bmRhbmFsYUBhbWQuY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBzYWlrcmlzaG5hMTI0NjhA
Z21haWwuY29tOyBnaXQgKEFNRC1YaWxpbngpIDxnaXRAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MyAxLzNdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBBZGQgc3VwcG9ydCBmb3IgWGls
aW54IFZlcnNhbA0KPiBwbGF0Zm9ybQ0KPiANCj4gT24gMTMvMDgvMjAyNCAwNzo0MCwgUG90dGh1
cmksIFNhaSBLcmlzaG5hIHdyb3RlOg0KPiA+PiBzZDFfd3BfMF9ncnAsIHNkMV93cF8xX2dycCwN
Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgb3NwaTBfMF9ncnAsIG9zcGkwX3NzXzBf
Z3JwLCBxc3BpMF8wX2dycCwNCj4gPj4gcXNwaTBfZmJjbGtfMF9ncnAsIHFzcGkwX3NzXzBfZ3Jw
LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB0ZXN0X2Nsa18wX2dycCwgdGVzdF9z
Y2FuXzBfZ3JwLCB0YW1wZXJfdHJpZ2dlcl8wX2dycF0NCj4gPj4+ICsgICAgICAgICAgICBtYXhJ
dGVtczogNzgNCj4gPj4NCj4gPj4gWW91IG1pc3MgbWluSXRlbXMuLi4gSSBoYXZlIGRvdWJ0cyB0
aGlzIHdhcyByZWFsbHkgdGVzdGVkLg0KPiA+IGdyb3Vwcy9waW5zIGFyZSBtZW50aW9uZWQgYXMg
cmVxdWlyZWQgcHJvcGVydHkuDQo+ID4gRG8gd2Ugc3RpbGwgbmVlZCB0byBkZWZpbmUgbWluSXRl
bXM/DQo+IA0KPiBUaGVzZSBhcmUgdHdvIHVucmVsYXRlZCBjb25jZXB0cy4gSG93IG1hbnkgaXRl
bXMgY2FuIGJlIGxpc3RlZCBhdCBvbmNlIGluDQo+IGVhY2ggcHJvcGVydHk/DQpJbiB0aGlzIGNh
c2UsIG1pbkl0ZW0gc2hvdWxkIGJlIDEsIG15IHVuZGVyc3RhbmRpbmcgaXMgc2luY2UgcHJvcGVy
dHkgaXMNCm1lbnRpb25lZCBhcyByZXF1aXJlZCwgbWluSXRlbTogMSBpcyBhbiBpbXBsaWNpdCBj
b25zaWRlcmF0aW9uLg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyB3
cm9uZy4NCg0KUmVnYXJkcw0KU2FpIEtyaXNobmENCg==

