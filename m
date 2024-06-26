Return-Path: <linux-gpio+bounces-7736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7F91850F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 17:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A032E1C22D42
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 15:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73262186E2C;
	Wed, 26 Jun 2024 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aPqahRBT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DC186285;
	Wed, 26 Jun 2024 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414003; cv=fail; b=KcdwC5kdaQTKZLnQ7S8bFwUH9+2LjnshWqn1Um+t5L5RYhYZQXLHC1GxnssvpICN9Q/ELVICB23ouAG/MXBQq/sJVcMj9TIQXKIJaFXZoDSz+mQZj/FfYeLLttZgcfiv9qL+Cst5FTFdbthATSL6KiEADLStGvvX6gwvIojMGnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414003; c=relaxed/simple;
	bh=K+fp53vJm4RPi6h5O+C2yKxqTaUNwGk6X8JXiQnwb04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SUkKO3FCMaEmkaM66gitQyJqtliXPTci/lpN6Y8C6sX+8CpwY8bi4eTxU7FQyZgmos5lA0e49JruzfvAcbNfHXRJyqKFAHjWr+NAZmrQi3Gx6HJjT8VCQKbD7vWIefeDiool4xAaSwmgPHBLJ6OcD2D3nvZwVniEYrCLTrPpAnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aPqahRBT; arc=fail smtp.client-ip=40.107.243.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkP0Yn9LjMZ8Yi0RTGI+mJfNgu9i3M/B9S4ZyyFtAw3tMbyZQBQDSXb7euRc505IgrevPcyetDaEhs7U5wxAZ5zq/PIY0KND0O7wD3aH3iP0eut2Er1+s7xFIkBi/lacIw0vo6XvjBxco7wtdaWRQB5WP1sY5DKaxPNJKrjEHgk2hKugFSypGpjr6yy9RSJNxLhZEiZ7kxAV/bV0eqRBtpnmD5x7SwpoXPTW1AkNeY88cmoFI0oXXusPBwhlI5+kWqiX7Fr2A4yjhZVvYBrSfK8KwzAl/3ruG94aasCkt0vGAQPOVfDlMO9Z0KnAcC+73JYq4StvHQXm/KB2iWM0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+fp53vJm4RPi6h5O+C2yKxqTaUNwGk6X8JXiQnwb04=;
 b=lhMbf9HCOHbS8Wsx1+tUzoL7tbtm13S2uR2wpCeZhXiwmydFpsMmeXlJxgsLE8oK9NmCMiyLwdQlznYzKciPvFdteyLIP7kv3EofK0oCtbmR/KRSG3Uy8Ri7BBm5M+L7VUt7DIYbsILVmZqZFttngmA9G53MXodNbY/fiPuhZcDJ/4xQYNAOr+gUPInP/0pET3CTgaPp7AUlxjS6PRdmNVdNlTMDnTRcHxjlI0k5OQlBIfWNdWMzlFTN/Nhz/JTaAasP3i5dT8rpgqEW83zohS0bLEjhn8519zg1E6Q/VB6pc1WSynpp1d2tOYsdrqTd7cacrNmI2OYYv7ksa+Jhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+fp53vJm4RPi6h5O+C2yKxqTaUNwGk6X8JXiQnwb04=;
 b=aPqahRBTdgHfJIxJDotderjNWhOauHEHwLMbXsKb5ZHMCr1gbJOBIa5y9Li15t3NuLX4+jgqgJjItSeser+llwjVMsEh3BGHs4cCu/iWY+rJ2CQtuv8bvxjWXSk452I6QYz5rRGXxepgzsQWoDxtwVfXUwrzTHrSLLEXRcGxMEZjDRnBMojueCDvtVXbKnon580ud6XvFzesJL3rbItyXd6sDVrryvLoTDi9Se2MxR+ySmL1Ispka5iOMaFAY8Q3cAxfdDHl1Tsl3dlJOJe29G+q+QwKOnLS/IiGUmbo4hEnvQVRsM4tAitRNLaex900pFdGHWInJzUr/zRhGyaJ5g==
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 14:59:55 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 14:59:55 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Shiji Yang <yangshiji66@outlook.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Mentovai
	<mark@mentovai.com>, Jonas Gorski <jonas.gorski@gmail.com>,
	=?utf-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Subject: RE: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Topic: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Index: AQHaxp4vrmshrWYuwESVGOzheqoT1bHaJKDg
Date: Wed, 26 Jun 2024 14:59:55 +0000
Message-ID:
 <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
References:
 <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To:
 <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7282:EE_|DS0PR12MB6462:EE_
x-ms-office365-filtering-correlation-id: ef52d3a5-d96b-4a3e-dccc-08dc95f0a3c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info:
 =?utf-8?B?UndrWVJtdlAxWi83VEFTUkV4M2NNQXdzbm5QNVlqcjU0OFFnNHd5VVM5cnRW?=
 =?utf-8?B?aXZ1MGVzS3l0V0ZLVjljSUZ3ZlZScHNabHE5ejc0U3lUT0NvaUlmQyt1ZDZP?=
 =?utf-8?B?MWpWVTYremZhMi9BR0RhK0w0TjBSa3VEMHNMMHZQaDBGMU9SZ3dSLy9OeHpy?=
 =?utf-8?B?RFdaS3F4cFlQcnlOWlNTdk1pN0RIL0R1ZFZLZTlPYzl4ZWNnYk1UR25XSlps?=
 =?utf-8?B?ZlB6Z3ZPNVh4QnQ5ZHJGV1FrOU5lOWxsV1A0Ui9lYzFvSmVMcjFPdkVwZGxS?=
 =?utf-8?B?cEJLN0M0MVNTa0tXQ0FQSWI3QXhZRVNpUmt4UllldUd6SU1ZanBYTTcyOXhh?=
 =?utf-8?B?aHZML3k4Wjg1T0lBbnpRbGlKMmI0U0JZelVvNHRRb2UvdWRCZFpQWDlEMHdL?=
 =?utf-8?B?dnJtUU1USTVET21XRlB0UUR4WjBMZ1JVdVlwdkhNRDNmZXlyMHpnSjY5c05r?=
 =?utf-8?B?aWYrZ09aMmltL2dGcEgwNjVCWVI4UzQ0WjJBOTU0Y0EwbUxzdEJiU01jTUFh?=
 =?utf-8?B?dDg3aEV3RUVJU0k2aHBRZDJ1dS9EdFc5b29XQVlQbHNaeVY3ZnhiUmZuMmNH?=
 =?utf-8?B?eGF4SFdVUGZXYTFnUlNUcUVGZGxLakZub2ZoWktYYzZreXBsVmhlVUY1THE0?=
 =?utf-8?B?QkxIVEtTMGIwTEZONXlJVnhiQVhpV2pwZmJoeU9tUlNLcUt0VUZOSVBGem1n?=
 =?utf-8?B?NFNTcDNwYmlJRVJ5cllqaDdvVDFSbXkyYWJiTlNENHZEZWV4a0EwWnBGUndv?=
 =?utf-8?B?ekp5L29UZjd3R29jTmZ3b3NWSnROTXFOUCt6MGhlTVozREFuRThOMXVwcDBE?=
 =?utf-8?B?S29USUtXZ1k3OWE3MlJ5VmpnRDdrY3lURHpyQ0ZKQXA4NFp6QXVzYndualFk?=
 =?utf-8?B?aCswTUZ3Zm44eWJJdU1kVEtJTlZlK2dqeUw5OG44SXlBam9vek9ZM29TVmNo?=
 =?utf-8?B?RG4vWDdvMkdGY3dxQUtuOUtmTHR0SGU1cFRwL3NnRVFWNzJoajB6a2wrYzEw?=
 =?utf-8?B?dVFWS0tBRHlVczRiWHJxbWRsQUxyc0doVjFwUHpRUlMrV0tTZnR4YVZLdWNB?=
 =?utf-8?B?dXQ0UDFuaGdIdjVvUHo1U3g4UjZjU0xlV2ZMZDBuNUV0WFJJcFZwNjZad0pJ?=
 =?utf-8?B?c0tkOGVoK1IrNjdhNENYaXlOTEhsYkFsVkJvcVh3ejFSakJQTlI5bFZLblEv?=
 =?utf-8?B?NGU0cDJFbDZBbUdYS0o3Vi9IVEFCcElXK3FnMlZXZnpIMVhhRmk4SFN1OFpJ?=
 =?utf-8?B?d1RFbTVvTkVaaHduZWdCYjVSRzZMeXlMZ2ZPL1pzVmhmWkJGcjQ2TDdMVENH?=
 =?utf-8?B?YjNueW9JYXBGeUVsZGhta0k4NFVVVUpEd09ZVlBkdUVJcFg0UkRIVlM1RGxL?=
 =?utf-8?B?WGJNRW5kc1E1ckRRSWRhby9sSmI2U3p3SjN4RTdRSE1jekl1L2c5dWhuU1pK?=
 =?utf-8?B?Szk1eEdlNUsvejgrVnY5UUJ4aWdHTFdLeFpZR0lHeWhkNU81RkxvZEl0S251?=
 =?utf-8?B?Y2YzZ1V1aGdXSXJxUFZXSi94U3BYd3VwRng1UzliOVJsWmxZOUx2ZkRJWEYx?=
 =?utf-8?B?OUdNbzNvb0tLMUhMd04ySTNXenl4cmF4ZkpWeUZxTjd3clVNWlFIenVZSklX?=
 =?utf-8?B?c1BxVDhJZjNpQThuclo3K2FUMWlZdGhNOXlXWlJqd0RpcHM1VEF4WEoxTkZB?=
 =?utf-8?B?eHdOSHNkaHhFS09FV0xtN0I4UTZ3S0dmdDVWMUNwR1JmeWlicSs4QUpCVDBk?=
 =?utf-8?B?WXh4cDE5LzZEanFIOHlFR2hPa0pwUTlhMFU4ZnFlYlNnSXFLdFk1Wm1rYTBk?=
 =?utf-8?Q?L0qZOgKYgEGHsyImZebMQf1U1OfXm2coWVS2E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0doQ2ZIcTBINnRCcGdYREs3TmwyOGNUdXI4TmpUKzZpVEd4MnErRjkrRDNV?=
 =?utf-8?B?UTRiR0NMemFVWDRSQURreTZuVnIrSldZZFVESjFYYUlGZEJKS2RiRjl2N3JK?=
 =?utf-8?B?bE1oYjUrSjVEeDBVZ3J5cXRIbFpKb3hMQnAyWEdrdWVhK0lodGRIcjNRK1Az?=
 =?utf-8?B?ZTl2cFdOWkdZaFFZSExvQk1WaGtoYUtDRm0zemNheWNvcDhvLzgrK1F0ZEk5?=
 =?utf-8?B?TjYyeUk4WDQ3cENNVDRUK3V5WnYxT2p5MXdWUmY3M0FKWFdGQ1dtcWY2ZWtv?=
 =?utf-8?B?VXcwdXEyUXB1VlBnRy95OUNqTlB6VXhza1VxTGZYVkcrM3REUklxTW5FdzNO?=
 =?utf-8?B?cW5Xdkt0LytER2p4VFZ3WkdiSVJHM2hBb0NDMVgxOHhkejdqOVU5MHl1dWZN?=
 =?utf-8?B?WENXQnB4YS9hLytveDFnUU0zN2daNGNBNXZFK2sxR3h0SG1aVjJoUnI1VEZm?=
 =?utf-8?B?d24za1V0R1ZxSVE5VFFkUm1UcDNJTlE1aXMweENoSXpwcEYwcHRKVXl2UXds?=
 =?utf-8?B?OEtpUURUQVFtSGZ5U1F1ZjhDOERNdklMbnVFU1RieTFOUkhWRUhaaGxEOThX?=
 =?utf-8?B?eStlTG0vVnVlYlprKy9ZVlNpbXJiOWNqcjB4enFySGJYOTRvSm9Bb2MrL1E5?=
 =?utf-8?B?Vi93OGJCMDA4Tis3WmEyYUthNS91d2MzMmkwc3ZzYU0zLzgwS2I5VXFSOEZq?=
 =?utf-8?B?ZjlqeU8yKzA4cU5iTzZRQzZtak1LVmxRdml4VzU4YmZYS0NXdkExV1liYitq?=
 =?utf-8?B?dVBVZEhUVS9tL2c4T0VvLzBOeFFMcVU5UEd4TVBjTWt1YSswRC9xODJjZFY0?=
 =?utf-8?B?Q09mdEhwTzIyMGV6RkxOZ3NFaFcwem1RWFZjUGNkVUdWVnA1WDU1Vmk5VzNZ?=
 =?utf-8?B?UVlncmllREtQeUZvaUtFWjYraUFHU1QzVTRROUNFS0FHblQ3SVZoeXhQSWh3?=
 =?utf-8?B?d2IyWXlEb1hGTTdBM0x3Nk9HUXNCUkF2dGdCL3EyVW5pZUJQdmZ5cFR2REVi?=
 =?utf-8?B?M3hUN0pnVTU4Z0RHYWFscjFrZW5ZdnVqdVVkZTN2c1dVampBWHl1UW5kdFMy?=
 =?utf-8?B?K0VFcTYrdU5oQzA3UHhZZjRSTHFWYVhGOVlJTmJ6aW9wSktNV05RZWlpS2hM?=
 =?utf-8?B?NERxK0h5ZlN5Yk9oSG00Lzh0T0ZZQ0JKZWJ5WUNPZXI3aHZSTVBWNkVyb0pa?=
 =?utf-8?B?Uk9xWGdRaXNPRXdtNlBxYkVSSmxUSlZBWWM5eHFEOHkzMWc0Nnd4bU9sbHFM?=
 =?utf-8?B?RjFzUk5xUXBUWWNTVzhMUVE2M2pINnM0cExSbUNLZHhjdnpIZnhjMUVuUVFN?=
 =?utf-8?B?dWdnSnVyZUVhblJGTzY1RE1KY05DekhtL3RtS1pxN21wUEJzNmg1eHBsV2lZ?=
 =?utf-8?B?MExSU1FwSTAzTE1qbG00aGxJTzBMRmJpdlM4MlVGNzNVQlNsSnVTTnlaVkFo?=
 =?utf-8?B?Q2djNXN5cTRQWGt3NnlJbVRuWGtHZWVtWC91Z2wxNmVsUGRVWTNjSDlhME12?=
 =?utf-8?B?Tmx6aGNCQTBiSWZ2bmZoeHB2cUNERzdkVWhDRkhvdnJlSzRhNU1UTEtrTHl3?=
 =?utf-8?B?ZmJOTVhhMTN5M3duMmhudzA5U1IvUVZiU0VSWHM2S2VPNHlTSGU1OUkwUUZl?=
 =?utf-8?B?VE5qb0hPNVJiS2gyUGVzMDV5QkovbkdMY2dvQU9mVVVCZnJXamNVVUZ3aE1L?=
 =?utf-8?B?clo4S1dDUHZFakVmd0xvb1RFY0Y1dHBmbXM0UXk5dlhPSE9PWlM5L2tsaTVo?=
 =?utf-8?B?TDNaVEpFOSsvVVFsdG12ekVIT3hucFQybTV5eTEycWIvcE1qc1hCM2gxblB3?=
 =?utf-8?B?VjBkOURsbDE2YlZiSDJ1bC82YWNsUXJtTi84cGdWQlFJc2Q3dWhyRlJXRVRS?=
 =?utf-8?B?eWlrVDJ2N2lGaVZnZ2RSSUcxMTUyN05hbDYzY1NUSENPVkNMejhLVXVEb2NV?=
 =?utf-8?B?NjFXWExtYnBPZjNTNTRSYmxncXFDL3pPR2RSSmYvT3R0S3pLQ25ITEorTTkr?=
 =?utf-8?B?RzhuNEd0MVptM1ordjZ6VXI5enpRSExKa2tsYlNPTGlDN0ptR0duNWdKcnNr?=
 =?utf-8?B?OG5yMHRFZG81emN1NWpvVmR2NWg5MFlacUU3TWpXbXVJTUlxRHRQWStHaFdY?=
 =?utf-8?Q?1jsY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef52d3a5-d96b-4a3e-dccc-08dc95f0a3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 14:59:55.1813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwx1NYIG+xtSw2D0ugd0/OfpGGk/+GzMmhcSLHiSGdSPf+mX5T6jti/H3u0fimcSuYOOMoN+I9VjsR+4PINxKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

SSBhbSBub3Qgc3VyZSB0aGlzIGNoYW5nZSBpcyBuZWVkZWQ/DQpXaGVuIEkgaW5pdGlhbGx5IHN1
Ym1pdHRlZCAiIGdwaW86IG1taW86IGhhbmRsZSAibmdwaW9zIiBwcm9wZXJseSBpbiBiZ3Bpb19p
bml0KCkgIiwgSXQgd2FzIHNwZWNpZmljYWxseSBiZWNhdXNlIEkgaGF2ZSBhIDMyYml0IHJlZyBh
Y2Nlc3MgYnV0IG9ubHkgMTYgZ3Bpb3MuIEluaXRpYWxseSwgSSBkaWQgbm90IGFkZCB0aGUgZWxz
ZSBhbmQgc28gQW5keSBzdWdnZXN0ZWQgdG8gYWRkIGl0IHdpdGggdGhlIHJvdW5kdXBfcG93X29m
X3R3byB0byBzdGF5IGJhY2t3YXJkIGNvbXBhdGlibGUuIElmIHlvdXIgc3lzdGVtIGlzIGEgMzIg
Yml0IGFyY2ggYW5kIHlvdSBvbmx5IHVzZSAxNiBHcGlvIGJpdHMsIHdoeSBkb24ndCB5b3UgY29u
ZmlndXJlIHRoYXQgaW4geW91ciBEVFM/DQoNClRoYW5rcy4NCkFzbWFhDQoNCj4gIGRyaXZlcnMv
Z3Bpby9ncGlvLW1taW8uYyB8IDIgLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW1taW8uYyBiL2RyaXZlcnMv
Z3Bpby9ncGlvLW1taW8uYyBpbmRleA0KPiA3MWUxYWY3YzIxODQuLmQ4OWU3OGYwZWFkMyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3Bp
by9ncGlvLW1taW8uYw0KPiBAQCAtNjE5LDggKzYxOSw2IEBAIGludCBiZ3Bpb19pbml0KHN0cnVj
dCBncGlvX2NoaXAgKmdjLCBzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAJcmV0ID0gZ3Bpb2NoaXBf
Z2V0X25ncGlvcyhnYywgZGV2KTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlnYy0+bmdwaW8gPSBnYy0+
YmdwaW9fYml0czsNCj4gLQllbHNlDQo+IC0JCWdjLT5iZ3Bpb19iaXRzID0gcm91bmR1cF9wb3df
b2ZfdHdvKHJvdW5kX3VwKGdjLT5uZ3BpbywNCj4gOCkpOw0KPiANCj4gIAlyZXQgPSBiZ3Bpb19z
ZXR1cF9pbyhnYywgZGF0LCBzZXQsIGNsciwgZmxhZ3MpOw0KPiAgCWlmIChyZXQpDQo+IC0tDQo+
IDIuNDUuMQ0KDQo=

