Return-Path: <linux-gpio+bounces-21163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FEAD3448
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AC191890270
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9C328DB5F;
	Tue, 10 Jun 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bH0lZjOk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82C28C03B;
	Tue, 10 Jun 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553306; cv=fail; b=Fl8Wiyb6UBED6zK6JUPzMM3GCCaFoeDBdf+U+7VDhKiVQHMo/3mw/APqIQdjL+neVm6/M/xg4wrmr2I2Ll7LTCimNfQUlNpbP5rPT+TGN8lusgedIUgZR3WLVcyPmHINCsWT6CZPr5ay7jNTOvjxXie0+x9yKfvsoCXVWqxbYeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553306; c=relaxed/simple;
	bh=L17GLM5jnYq7GuylR4otbZFJbNK9vWC3KdDgUwcwdjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jtv7CHxadRHVAdgnGKTgxjOrEZUeEP+D1kY71XfbedAQG2jfaxUmW0zVrvG0NwuZhLNG89HCc3cjcNkeVXl5RKtT8Z7nOgbOllLTzQ88Cx59GuR4XaGqlqTVjwz1H5slMGyoHXdlfgOJ22ObQW5Dejr1qSV3qXCw5Rf3m8ZPcs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bH0lZjOk; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9pVW9026277;
	Tue, 10 Jun 2025 07:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=L17GL
	M5jnYq7GuylR4otbZFJbNK9vWC3KdDgUwcwdjk=; b=bH0lZjOk6jE4DT7yyw2jj
	acA5XxCA4XAMOo/cBOKqFDtPo4yrwzkP+EHOXOcuv7BKa/rQeZZkTA+o+6ApUbJt
	ttMScL/CH4Jffvy9aFqplHJw9pcMYsMZM/E0/YLb2IuQDjdw744gAJnf3I19L3M1
	2WF4OnvEPjVGthEBB1vBZW++g3XmL/OdDi4FTJx6mShfp2dO/PDisLkNfYr+/haS
	K3Iin5Maom8uamPaQKuOHY6xcD5t0hCaHZ1nYUNDGxSsGc3lYXOZS21B/dobDgCY
	HqpufvAnb3/ZHWj/oP/AmyqI347S+9XI39t5zxxRf76kQicFCkuCWYYP056OlT3a
	A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 476jeqgcd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:01:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4EAAIuoQTsZiY9tiRQoTFYEhyrjSngtf9Myj12m/WodFtPreVwIxTnDyikejgaeHr4Ulg4WV7R9wpB5qL/7ioDUE5040zUV8oskiHaPcdcMlr9GZescO5TWwFlBpBSVU/08++Om7K9TFPh4RkhI8QD1fy9qtVWTI6vaSQQIORBW+zDSCLpHKN2hQqWQ4GHS6CelhuXCmOqQj7KQTGl5RyuG88Yl8Gtw1hQjcOUUc3fDLUoJ/mAX8hZisKo4Yustv1B0w4dFDXX1K45WUsYUShR5mjt+0wZYERf0A77WWVKxqo3LrjNBJ5NfNEzlZZlqAIO5YR+EWMc3uDA+kyOFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L17GLM5jnYq7GuylR4otbZFJbNK9vWC3KdDgUwcwdjk=;
 b=oSGQYSCTeEPxlAi6Dl/7eFjmQ3j2ItWAdhbyKRb9sAs4YKFBaf18MJn50kbANG+NuX7cPgqgIl+KVcoNPCPqA3UgHOqrggvDDXFYJHG+6WoxMoiXhLdCFu96gomYiLOo/wohG+hj5a3amgNnz7qsBB+xFkJqPjx881oDfvN7/KCLd53bJtVnKwTM8LYB1GoTMrqlO4URWonaKD9+wiew4ehG69cUArgGFskgTlddD0/iOpvGtmeYYxSTEkSe3pu4bFmgcTaTuirL1FQfsFCe4XhWl5A41WuKAbEaBmFPqaarXc9eQuqO3iMJVW/YwmP0pxIrN8PzUPr5mh2zGI9fNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by SJ0PR03MB7125.namprd03.prod.outlook.com (2603:10b6:a03:4e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 11:01:37 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%4]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 11:01:36 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH RESEND 2/3] Input: adp5588 - use new GPIO line value
 setter callbacks
Thread-Topic: [PATCH RESEND 2/3] Input: adp5588 - use new GPIO line value
 setter callbacks
Thread-Index: AQHb2ev7zZAkvwSQYUOzWAukJ6NwG7P8Oimw
Date: Tue, 10 Jun 2025 11:01:36 +0000
Message-ID:
 <PH0PR03MB651200B6A6495ABC520B46688E6AA@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|SJ0PR03MB7125:EE_
x-ms-office365-filtering-correlation-id: c3fad564-f3e1-4a52-291f-08dda80e2b83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkxGWTYzN01kM0s3SXFyd2NqeTQ1dUdZN1UzT1RCQXRiY2xUa2NaVW53a21m?=
 =?utf-8?B?ckdMa1pDd2dtR0EyYmFrRHpQMm45YlZYTEhGS2t2ZlRDSFJreHVvN1BSbEsx?=
 =?utf-8?B?RXMwSUFLZTA1enFsUXo2S3JEZVIxeVpuWXc0ME9JSmU0eGFraVNHWVJ4djY1?=
 =?utf-8?B?UUMvUmsvaXlZVjJsY0ZoblNmbGVhbUVYeE04YU1wZi9uKzFSZk5ROTVzQitU?=
 =?utf-8?B?d2tGb1Azb2RXNFBmR1VlZmtaalFKbDUyUGJKb211L1VvRU4xaHlqNmhZVVdH?=
 =?utf-8?B?ZGZLempwNm1sRHQzbGpaMHpQVkZrSmpoTlh1RElyODBFbmNlV252Q25KVndV?=
 =?utf-8?B?TG9VZjRoWlRTMVJsOHcxMUZHc2VKaXAzWk5RMmxzeWdwdGdBNitrQmJydnBF?=
 =?utf-8?B?aTlBRlk3aTNHVlhCZkNJaUVya1NwTE1pZnNkeVJSUXFEWkwrQnU2Y0JlWllh?=
 =?utf-8?B?ejlBRnFJR2hoT1RXcDBFR205SVdtTmdQMDJPNFJreDlmYnhqN1B2RWpTMlNR?=
 =?utf-8?B?dUdLa0lUUmt2aE1Rc1dQK01hQmRhY2RMcmhBclZZVGdOd1Uxd0JBOVZhcmpT?=
 =?utf-8?B?bU9vMFdqS3I4SVkrUHJjVVg4MlpRYjV1SENPOS9YUWNUVk0zUC9mcXptZG4v?=
 =?utf-8?B?Q3lsQ0FJdDlsT0ErUmN6N0NJWkR1RVUybjYyVkU3UWdZU3ZlOVc4SjYxN0hU?=
 =?utf-8?B?RVN1UHB1NjNUcXZkcWJraTlHTzZPRUs4dVpCOWVaaDZDamNxYnRIZnJOK3lY?=
 =?utf-8?B?aWpaYkd5YjNoVTMwQld3OFgyZ1J6d2ZlQlJMZDQvcHVUWGVvblZWa3ZuU0VQ?=
 =?utf-8?B?T3gyUWFWUmc3cGlmWXBNcTRaSm1DTUxTTGtyY011SkpqdVFTekNxMytRb1JV?=
 =?utf-8?B?WXdKME5ROHBCOXFNZitFT0IvRmwwSDJETWtobmhvV3BnSlh4MUVtak1FWHZT?=
 =?utf-8?B?VjBBaFZRZ3RYUVVJeGZKUXdwYjFJTTNkb1hGWFRObjQxU1JQLzg3RVNCL3BW?=
 =?utf-8?B?V1VqR0ZhTzhZL2pFMnZhMDJxK3JoUldSVnhUZkNyVW9iVTNTZjYwbnVqWmNu?=
 =?utf-8?B?NXlIVWVhdlRIZ1dsbWJkWEY0UEtId2JodHZXOWdUV1F4d2RsVWZ5ZDY5cndT?=
 =?utf-8?B?ZXVkaUV4TFUwek5QYkdhaXd6UEVnZVgzTHdObTFPQmZycThndjVCWGJxdVZJ?=
 =?utf-8?B?d1FscGZtSVI0bGN2UkdVdUNGaWg5aHpURjNQNVdMSlJhVkdYNmUvTXI2Y1NH?=
 =?utf-8?B?WmJraHhkRG9mWEpHRHdTajJGTWk2UldhYWdxeDNjL3dQb3FsQWFtREV6d2dI?=
 =?utf-8?B?M0R1VjBlS0hrMGVUT24zNWlCZko5a0dzaFpOM0RVY1lHZWFueC80SkZzWHJI?=
 =?utf-8?B?ditCdlI4bG9ndnU1cTNNa3Z2ajFYWWNBVEJzdHBHNVB1UVRQR2YzNG9HNzkv?=
 =?utf-8?B?bVdmRXpVYnUvWWwrR2pKcWcyK25CeU1qbHpNOWRVYXVGNk9VUTFVbzhMLzVw?=
 =?utf-8?B?UFJTRnRBcVhaRWt1aXN3U3hpNElhZ2VNLzlYc0puUCs4UERML1B4YlZsRTBt?=
 =?utf-8?B?VHp1RDNjQ1JOcXZvdHpvbENEQ2o2UGdKYVJvWFp2d0hHLzdyU1F6UTZXS1U3?=
 =?utf-8?B?WVNkN0dKa3BFMEM2QndWRkZpL2MyS2xYeW9INFBIRXNONEZKeU5XSTRKWUNw?=
 =?utf-8?B?clB0WDgvb0NtdUlDWGgyUFNrQWxpSnNyZUF3MllwemJPRFlUazdZTnRxQysz?=
 =?utf-8?B?bUorNWduRUNmVWhvZ2M2VlVtTjNmVnI2NmxuVC9xM2V5NFV1YkFNV3VuUWZj?=
 =?utf-8?B?dkFXUmFQY3pvbklDS1dKMEk0NTB5N1cvYzkrSWpWd3oxZVNNUTFuQUFjQ2J6?=
 =?utf-8?B?eVlVS2lCV1oxd3BhRVlFdDZTYmtUVEc3dGJvRzhQR1RJZFJiei9YekdvWHlY?=
 =?utf-8?B?VGFHZTV4OUZqQmZqN2tlMWxoaDNpWEpRTm5jRXVLaFAvcEpYaFUrSDJvZnVx?=
 =?utf-8?B?c0RKOFZWWTJnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVhiSkZkREQvSlVjNGJIQXU5NnMxQ29EVTYycExyZnIyUXBhSXp0QXZMaURJ?=
 =?utf-8?B?ajU2S2JsZ29sem5mN1g1V0dhbTBrc1ZTRy9saG4zK1FVcFNGL1MramxrSzRN?=
 =?utf-8?B?MlVpeUtuREltdlVwUjNYb2F2a1ZoY0NUZGdjNGZaSjVoT3FXYSswNEtNanBM?=
 =?utf-8?B?S1J2cXMzNnJZUHJBMXVWOWxZclJvNkdrYU5nbEZRSEVLSy9uQ2tiQmNhb1hw?=
 =?utf-8?B?M3FGUHRUd1JkVlR4cGFPWmN3eWFUc1lNQTFEeFlQbWY5ZU4yeGhack5KbUFM?=
 =?utf-8?B?b3FnY2RGNEJqZ2lMNWNMNDBQREVQa0hKYmtreUdzU0lyLzBYZjZUMWNYN3By?=
 =?utf-8?B?bm0wVCs5KzdVck9KYU92SSs3M1hIbVpWNkFOdXYvendwRzE5bC91YW15eTJR?=
 =?utf-8?B?bHd0TjZsQ0gxQXVHb2txSndHTmVVSmo0ZFhKMzh3eUw5WHozb2VNTzgrODho?=
 =?utf-8?B?UE0veERNbE9zTTlFdWZZSG9icGRsRzJiNzJnQnFKQ3J3b3JsL1FIbDl4R1ph?=
 =?utf-8?B?Wkc0aC9YOWdqZTNvWWhhNTlWOHhLekk4a2FPd1dFM2tmTXd4UXZNeXBWcmIy?=
 =?utf-8?B?L1BpeXZjbXlvVUdXb016dWRMRmF2SVgrUlZ1QksyNDJGTitmYXA5c1hwUy9V?=
 =?utf-8?B?TEl4bWZqdEVLYXJZd0JQTGNQOG02MlFMV0JDaldGd1BOMmk3aCtlbUNRZlQ2?=
 =?utf-8?B?TjNYZVhRVGRrVlltU0cvNGY5ZW12cFFZSmZoVjZON2ZRR0t4eXpYWWVJcVBy?=
 =?utf-8?B?eGJlVHlLMk1uVVpwamZHcnVkekZCN2dRNkNPdmdOamRHQlFQclJ0Nks3Ukla?=
 =?utf-8?B?ZEp0VnRHODQrRG5aVkRqdXNRSHlVZFB0VWhKeUZkNXdUV05MS1NLV25idW1a?=
 =?utf-8?B?b21PWTlNZWgralpiUUNWU24xVVRKbVV3MFdCSXQwZ3QxRTJmdDZZZHhKNU5k?=
 =?utf-8?B?cC82RlJreFZ3Y3cyV3VYRC9RV21vUHhxaGY1VFpNaUZOR2h4UVVVaXFwcFJ2?=
 =?utf-8?B?S243QmpjdVcvd2dFVWpQZHdkL2JtRGdjby9YNTdRblpjdFhRUGVRaVlNZFZS?=
 =?utf-8?B?dnlXM0REOHUxVlY1TGdTQVlIbDB6SGJZcjFzd1pKOGNNMVJoWjJpWTlrVWho?=
 =?utf-8?B?TG9nZ244MTUyS0swWFp3c3Z0Wk04T3V5aHR1QnB6NGpsdER3bG5OTTNhOEZw?=
 =?utf-8?B?UFhLVWR1L1N4aGtPekFCTE5TbndJZ3NaTXRXeDNVUElleGVFbmV5eXBidGRT?=
 =?utf-8?B?eW43QWZYZHhmaW14VTlyaDNqYXNCWVVKODlhcGM2OUlNUnVzZ0JpZmRjMDZ0?=
 =?utf-8?B?UFE5ZjBxUlRKSkJDY3EvUnpZQWtjYjduMDl4L3BoQ2I5ckJScTdmRkJza1h6?=
 =?utf-8?B?UjF1UEg4YXpRTldxYnY4TDMycFJWRGJSY2N5MWQxUWwvYnZseFUzU1hUeUdo?=
 =?utf-8?B?L000dGJsb1M3c1MvU3FsUjVkcDAvMmxBZHp6V0xOYkIzR20vQUVLZjR5dnpl?=
 =?utf-8?B?OVJQZmM2Snp6RDM3VG5IbDZUcTdlN2R5UjhHQVhiZ0dvQ1laZUp6dTkrUDk2?=
 =?utf-8?B?QjNjalVqUG91YXBXSWVwOWJyU3g2YklrTHJWVU9BN3h1QU52K2gyOTZyYWJC?=
 =?utf-8?B?VkxyNTJsclhhYkY2eE5MOWxDZWZ4Z0QyZk5LYTBnejhFOHJYN3JvTXE4eEZN?=
 =?utf-8?B?TWJZalpVWnFWOElzUVJKT3puVkJhZmNYeTBMZTEzQ2ZOTWdoQlMxVGlyb0cz?=
 =?utf-8?B?aFNuSnZIL1E3K2xHZTVsSmlxWm5MSFgyUSs5VDN0d2p5SlNFZE4zYUtCYVpv?=
 =?utf-8?B?cjNkQkRtV1lMMTg5VDNTSm5vK1lGaWJWSGhNY1RsblpOWkJSRmdONEhpMGYy?=
 =?utf-8?B?NFVZa3dHNWl0WFZTVjFqNFhGeUZPNXJiMVAvMUhHYTFBY01uSEh1TEpCZHM1?=
 =?utf-8?B?S3hpYWQ1RGM2aHg4c2VxaFRFQ2MrV0pFRXB5M0lZR1dEc1FoOFloYmhHRmk0?=
 =?utf-8?B?UU1iZVY1YVBubEs2L0dhSkRyNGgycXZ0VUxzdmM5MWhiWk9NU2ZlUG5oZ2Y1?=
 =?utf-8?B?bmdQbEtxZ2lWcU1VbnYwOHZOZC9GSDJWYmcvZWI0OW9pS2tleDFGbmFldjBG?=
 =?utf-8?B?a2RhamtGQ2hzUllOYVFad3hXdXpFQ2pJSzJPVTlpVkdtWHNzalAwS1FHMzlZ?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fad564-f3e1-4a52-291f-08dda80e2b83
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 11:01:36.8889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hsZfe3Se5E6C9BwFX/ofFe4qxX6MKsuHactDcuPMB4LByG0WVj2EGAKdYBHTmhXwAsG/FtNwZLoAeOsR1W4840jFKxp5Q2uHVgk10IXxs2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NSBTYWx0ZWRfX59AZrMM7anIa
 HICkeH0qE3rAMUJNdqw00Q2WUhKGVLPKBdMm+B5KsNKi0IEvW5SH/E3Z2VEQGe3qK3v2D5uasjt
 Jl/6wghPzL0ZIYl+/kfO36qEo/4kkU4yWhpXbN7hxj+w++7X5no5OIwWWdytnZAshDq90Ij9AhG
 m8JgkswuOfB7qBV4L/QF2flkrAUFIYmWPsyxibH2mLjwoJg8FtL6y/GJOg30fpy3kFOT3odwCgX
 /uG4j+B52IcjYygC4+n8Lwvn6Gj5QLfxzj0VCPJBvqUB3gt7/B+aY3cr3PikGY5EbweIC6RB4ap
 BVziKX/ctvxu82YhRz/KJ0tBoo6b0Pxe8laMuPiIRS2Bw1FIWen9iRNzrYFA001SO9JakrKsH7+
 Gz4TkNke8Hz9T7jp5WyuAjo4eaSN3p1qOWqstGSi+YUEAcRYgpmaRiu4B21jkQob4OY1PvYr
X-Authority-Analysis: v=2.4 cv=d6P1yQjE c=1 sm=1 tr=0 ts=68481094 cx=c_pps
 a=qrXqrasEdc/lfzlssxSwCw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=cdgfygPOYCZXOI56R1gA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iU5C7wWXd302DHuBhhaZfF6XluWfdZBr
X-Proofpoint-ORIG-GUID: iU5C7wWXd302DHuBhhaZfF6XluWfdZBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100085

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxMCwgMjAyNSAxMTo0
MCBBTQ0KPiBUbzogSGVubmVyaWNoLCBNaWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cu
Y29tPjsgRG1pdHJ5IFRvcm9raG92DQo+IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsgTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsNCj4gQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwu
b3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
DQo+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgMi8zXSBJbnB1dDogYWRwNTU4OCAtIHVzZSBuZXcg
R1BJTyBsaW5lIHZhbHVlIHNldHRlcg0KPiBjYWxsYmFja3MNCj4gDQo+IA0KPiBGcm9tOiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBz
dHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2FsbGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVz
IHRoYXQgcmV0dXJuIGFuIGludGVnZXIsDQo+IGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVz
LiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNpbmcgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCg0K
QWNrZWQtYnk6IE1pY2hhZWwgSGVubmVyaWNoIDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29t
Pg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4LWtleXMuYyB8IDkg
KysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1r
ZXlzLmMNCj4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+IGluZGV4
DQo+IGRjNzM0OTc0Y2UwNjg3YTZlODUwMjQyYjUzMTk3OWJlODM5NWIzOTQuLjJiMmFjYTA4NDIz
YTRlZTY1OGQNCj4gYjU2Zjc3YmFlMjVlZjVhMThlN2E2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvYWRwNTU4OC1rZXlzLmMNCj4gQEAgLTIzMiw4ICsyMzIsOCBAQCBzdGF0aWMgaW50IGFk
cDU1ODhfZ3Bpb19nZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcA0KPiAqY2hpcCwgdW5zaWduZWQg
aW50IG9mZikNCj4gIAlyZXR1cm4gISEodmFsICYgYml0KTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMg
dm9pZCBhZHA1NTg4X2dwaW9fc2V0X3ZhbHVlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsDQo+IC0J
CQkJICAgdW5zaWduZWQgaW50IG9mZiwgaW50IHZhbCkNCj4gK3N0YXRpYyBpbnQgYWRwNTU4OF9n
cGlvX3NldF92YWx1ZShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2ZmLA0K
PiArCQkJCSAgaW50IHZhbCkNCj4gIHsNCj4gIAlzdHJ1Y3QgYWRwNTU4OF9rcGFkICprcGFkID0g
Z3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQo+ICAJdW5zaWduZWQgaW50IGJhbmsgPSBBRFA1NTg4
X0JBTksoa3BhZC0+Z3Bpb21hcFtvZmZdKTsgQEAgLQ0KPiAyNDYsNyArMjQ2LDggQEAgc3RhdGlj
IHZvaWQgYWRwNTU4OF9ncGlvX3NldF92YWx1ZShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLA0KPiAg
CWVsc2UNCj4gIAkJa3BhZC0+ZGF0X291dFtiYW5rXSAmPSB+Yml0Ow0KPiANCj4gLQlhZHA1NTg4
X3dyaXRlKGtwYWQtPmNsaWVudCwgR1BJT19EQVRfT1VUMSArIGJhbmssIGtwYWQtDQo+ID5kYXRf
b3V0W2JhbmtdKTsNCj4gKwlyZXR1cm4gYWRwNTU4OF93cml0ZShrcGFkLT5jbGllbnQsIEdQSU9f
REFUX09VVDEgKyBiYW5rLA0KPiArCQkJICAgICBrcGFkLT5kYXRfb3V0W2JhbmtdKTsNCj4gIH0N
Cj4gDQo+ICBzdGF0aWMgaW50IGFkcDU1ODhfZ3Bpb19zZXRfY29uZmlnKHN0cnVjdCBncGlvX2No
aXAgKmNoaXAsICB1bnNpZ25lZCBpbnQgb2ZmLA0KPiBAQCAtNDI0LDcgKzQyNSw3IEBAIHN0YXRp
YyBpbnQgYWRwNTU4OF9ncGlvX2FkZChzdHJ1Y3QgYWRwNTU4OF9rcGFkDQo+ICprcGFkKQ0KPiAg
CWtwYWQtPmdjLmRpcmVjdGlvbl9pbnB1dCA9IGFkcDU1ODhfZ3Bpb19kaXJlY3Rpb25faW5wdXQ7
DQo+ICAJa3BhZC0+Z2MuZGlyZWN0aW9uX291dHB1dCA9IGFkcDU1ODhfZ3Bpb19kaXJlY3Rpb25f
b3V0cHV0Ow0KPiAgCWtwYWQtPmdjLmdldCA9IGFkcDU1ODhfZ3Bpb19nZXRfdmFsdWU7DQo+IC0J
a3BhZC0+Z2Muc2V0ID0gYWRwNTU4OF9ncGlvX3NldF92YWx1ZTsNCj4gKwlrcGFkLT5nYy5zZXRf
cnYgPSBhZHA1NTg4X2dwaW9fc2V0X3ZhbHVlOw0KPiAgCWtwYWQtPmdjLnNldF9jb25maWcgPSBh
ZHA1NTg4X2dwaW9fc2V0X2NvbmZpZzsNCj4gIAlrcGFkLT5nYy5jYW5fc2xlZXAgPSAxOw0KPiAN
Cj4gDQo+IC0tDQo+IDIuNDguMQ0KDQo=

