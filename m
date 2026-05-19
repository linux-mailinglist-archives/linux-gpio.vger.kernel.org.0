Return-Path: <linux-gpio+bounces-37163-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KtwBB+jNDGqDmQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37163-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 22:54:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2260584E7A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 22:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A123304D34B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 20:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE77C39F162;
	Tue, 19 May 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cIgw+6hW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F6329E5A;
	Tue, 19 May 2026 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779224035; cv=fail; b=qc5kK8R9wKM7H2nPM8MdEv93u1sWJptjf5trx2/EF1HTz5F/SiXPnS+gHpAqVs72aLEdf8v40Tv5RnvSv8pqoVD1S30dEradYZtr5fP4jldGwjV5ki2igeV2euLflgvYW1oaaY3kk09bGUxXsjUp0NRrqb2NqL1QwxZ5JKMGgeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779224035; c=relaxed/simple;
	bh=pozeRctO0kYOrs5tuA91NPJ8PVxTxyhD8ID/3flmCtM=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=HohCntCV9aqrPu1lKVDfGLPPoi6OPCaVQZiN2fyusuBGyjQPLppE0JYhq+FeVrNbE2XRwG+iMS6Cu22Ice0kt0BZvNB2VrJLNQkVb9ow0rtQhz0ihUO9c6LZXMBpVVBn3ms9Hs1sGoFHd85T1B3R2PF5lB14zzeWURhmlslgiDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cIgw+6hW; arc=fail smtp.client-ip=52.101.62.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYxR4ABq2TvYBmCGl/pD13w0FLNhbNnhiKugFEtCG14HhQK8wmBnQ9c4cBFciHwB08mQAbk9EBJQUKYcbvWKnvPA3Wo6gocB88TCNNZSOilg9Dh2JzBGORlT27H7ab9sMoPxqKLw8iK5bjfUb1Ysck+zT7HIUj2CSYIaCJ1xqt0oeNFSDlTGeu37pDhb0CVXbnhO0W9oIag8eNgqporKgPt83ls2yeOAUb+5PyPxxo6JneGXZl3L5K91HXwuXdQG8AnS4lFcsFwe3YDgnKsAzEff4zkcYFGDQogEJkNo9GEyp9R1BjV/CuA0gOXY+DNAfmqG5YGr58M3Qgq4PnOU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynCU1zeHgja6vj2++6QYYrj4Po4OWKTJ1mz0ErZCoMw=;
 b=iMuBLUT3WbMDqx5RxpNfCDz7w2VyfJC4GdmrEQurwR+URkTPnKPHtEA/cMGFMicKiPSv5Yj0/KCYveE13nFvcZ10XKs6n+MHkpQz4QcJUlV6hnpJsFd6zO2jKDg1v6r0GXU0BkK9v1PXalxHbzpytTaLXmafVhnvPFG9OMwUK7tJK4O8b8/X0gpcPLnn653dfmQQBD68uCo6WU4Doy5ZtYkJx10YyQVBobDbBf/L2xkPGMDF86PZDEA/GSvXyVhNpx3Mw8v6mXLRaJudmklNKKe+PHIzZZqP3pEJhiY1V2wGbLsCr7zZvErHYaSZCkJbPPJrNwmw6dbp9olkbTZu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynCU1zeHgja6vj2++6QYYrj4Po4OWKTJ1mz0ErZCoMw=;
 b=cIgw+6hWC46TJvqkzTEj+ncabhAGDzZIqDwnm52F9rL2spHeOaq1zhcFHzzxQ7gbHQ94OsvuiolD2rb6o+dJDNv6v+o9XhgffnrB2B/LYNUrHLYEs8lv4XD8cmrsXHjpRMElPZx9h/KmCASKU5jPmU7ze1+MyxaAFDI6XocYCdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 20:53:50 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Tue, 19 May 2026
 20:53:49 +0000
Content-Type: multipart/mixed; boundary="------------zXZsetrd31X0IbGREd2YIidf"
Message-ID: <e31e28e7-62b0-44a3-b155-57504be09c69@amd.com>
Date: Tue, 19 May 2026 15:53:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, wsa@kernel.org, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
 <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
 <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local>
 <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
 <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
 <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com>
 <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
 <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com>
 <CANTFpSWB6Fb3mo9sUtxo2Aaa-Ryx-YqUw-tqT-y1RpurJfq57A@mail.gmail.com>
 <CANTFpSU+wTQeESDGqV=xizrJeQw_LA8y7stDYMm=H-UrbWXeYQ@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANTFpSU+wTQeESDGqV=xizrJeQw_LA8y7stDYMm=H-UrbWXeYQ@mail.gmail.com>
X-ClientProxiedBy: SA9PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:806:a7::26) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2959b4b4-630e-42b5-0592-08deb5e8ba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|6049299003|366016|376014|11063799006|5023799004|4053099003|18002099003|22082099003|56012099003|4143699003|4013099003;
X-Microsoft-Antispam-Message-Info:
	6CFxZSrKVAwa6iIkMIm5vvhG9/z1GmhywdMbsLwrb+9yS4Gf4+mcUWn4zBDcv8qd55yQwPgr/aHTvwxSOaS6wXu/24AvPnxI5ygaObrF05Diq4WAZr4DbpdpI1bYT2pIHXsLzSBm2dlyKS3SVl6LABsa+rgDSUIrkaKbOUlaPByRIh7AxB2616PmuL2hNtxAi3q0A3JuR3txM8wvSfx9oAY4LwCA+NeOM6VB5AR2DLN56WuMvM0TNZS0cvx+tnQNApvXbEViwuzCBFome5PwxZWEhvZaT8wWXuHIxKYItGDZSmYh4MrY4TnyVOvpprLZ6/xYhA1uJeGAhQPx5dcA8fZnBAN6JIqV8kQQDvmDqNyYNqW+NjHKk5Aj+tzsgUr1NOwtxTb6Y7cJn5BMAuuv/VbRBQKFgG56S1dErK0jVLsn13sCI/Pn4PF4NJAPfnhObkSlqJeDAtpoEyI4WAMHsPn2OlhnsoFy1dD8vzadDs6rhNoMKmaSHpBCYqbuDcCutAPhtMPDZlIQSceHdzhw5DB8XGvwiPgI5LqmQzXhOTzeLsNVL4Ga97oejbCsLgYYgh210tNlrOrRqwgEHI72dQQX1nAr/eeU0LFokKXYGrqgjhUYfRPcBNgA/0eDHH2anZLkj/+c0GRUBNvTJ+JNWjtoKN4LXY7MsV5gT1J+yTqwGkvOfcfeCPIkvGLyxYid
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(6049299003)(366016)(376014)(11063799006)(5023799004)(4053099003)(18002099003)(22082099003)(56012099003)(4143699003)(4013099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjlOay9RZGRhZFdtY1RhRzA3Q0VsUXREc01PZXh4dTNJS1laSTRWT2FQQStY?=
 =?utf-8?B?Nk14aU1MSFZmSWNCWlV2NWJsQzJRcW15Q1dIdjlzZnRLYmRrYTNrM29seEtD?=
 =?utf-8?B?ZW94amREVTJXeW1oZzNJWmRFMDNRTVhxMkxXSGt4U0hWekpsSlNpZXJRK1o4?=
 =?utf-8?B?VksrSWxJdVd0WGN2N1ViejlUL3hPWkNvSlJQQVhsRzUyWXl3MlRLSGN5aHZj?=
 =?utf-8?B?d29iWDloUWVFL1JRelRUV3dWR01vUlA0SC9waDhhQjZyQnlBeDNwdEJSOFNY?=
 =?utf-8?B?Sm5JcFNJcUQxbjZyYmZ6cWZUUVo2aXJVbTVjOWY5UEc1aklUNlA2Lzk0d1R4?=
 =?utf-8?B?Q3Q3TldXcENHZmk5WGNXdldDS2Nia2ViWjhOK3c2eFNkYnlJL0pOQkFjMkJl?=
 =?utf-8?B?WHZOMWlRa29zOFkrZzVOTldpZmdFdkxSRzF4TlAvRmdNU1YwYmE0UmNzNnh4?=
 =?utf-8?B?MVZNQzBDcS9UZDVjR1lSelQwSk4wSlBGM1Zuamg5cW1WanJsb2pzK1d2cEt1?=
 =?utf-8?B?U3djVGNxbnBSbHNMQmVVU3F1Q2FubW13RlNZcVpmdDdLTi9xSHd6UzVpZW1a?=
 =?utf-8?B?TzBRNStldVhHTkd2dVp5enFzZ2ZOVHFpc3U0bkw1Skdoa29RSE9NZGFDNXV1?=
 =?utf-8?B?NFJ2UWw2bVo0VXBVTUhrd01TNmpMTkRWZ1hQMU0vMUNrckVuSlJyc2ltWkJ0?=
 =?utf-8?B?TGFJaXdBYXdtK3VMaUVaTjBEZk1zVHRSelJLajRtWGNOSVlnbWJCV0tWTnVY?=
 =?utf-8?B?NkVpRTB2b3NRQ3JWUmJ5azBEcVBWTnFYSDRpVWlRVjQ5ZnYxS09SbkhwcGEw?=
 =?utf-8?B?N09xWDR4Y3NxUkFoTjFGQ2lOOGZhVzVMVmJ1anhxeGJXb08rQ3p4L2ZRYnlL?=
 =?utf-8?B?WXBwaExhbzVJQXdnVWtCNUZpQ01JeTNTTUdmUjg3YUxpN1pUWGRycDBNZmdG?=
 =?utf-8?B?OElFeXJwVFFuUXpCdzVBdzhhTGZzMWtIdStBMjEzNkY5WWNzb2J4YTYyVlph?=
 =?utf-8?B?OXcrK3hWQTRtR1R1Z2U3Yk5Ldjd1dGRPcGNxVUg0SU85TTcyN09kNUdnQmlL?=
 =?utf-8?B?b1FERi81OS9yVW1XTE43S1FHRlpGVHJ3V3VYOTh1N3pzd0ZPLzhjM08rRDAv?=
 =?utf-8?B?YzdzSElzTithQ3FmTE5MUjJhSGtQV25hMzhuRXlGOTFKdmNrVjdQOFN3aXZm?=
 =?utf-8?B?amhCdjNDSWpXUE1Eb1B1Ylp1TkRhait5NjRkei9UMWlSeGxGSjYva0xuVHp5?=
 =?utf-8?B?bm02K0V2QVRNZGtZY2hOQ1ZzMWZrMVBxeVBzaHJSYVd3QkZJRzJqNkg1Z3Bv?=
 =?utf-8?B?KzZUSElic0dmMzhJTkdoRGNnWVQ0MDk3OXRHYVR1TUQ0MHBydXZpVjMwclhL?=
 =?utf-8?B?ZEZqaUtTa25zYWtKeUZRYlQwbTQzdUdBWjJFOWRiVlJXdG55ZWRkb1BzL2t5?=
 =?utf-8?B?MGdYUHRJdG9UK0p0RVRuRUhLejM1b0Y2OEQxbnlVZksvNmIzRlFjOUFxR3Fz?=
 =?utf-8?B?d1MwZkZNWU55cU9qNTlXdjlmSjA5S01xUDNCT20vK3loSy9pekFIdzZyUWE0?=
 =?utf-8?B?ZDBMUDhTUmpydUEwOS9RS0hZVTdMUXZleFArclRKbzdEcEtha1dyQnRMY0Zt?=
 =?utf-8?B?QmYrdGQ2Wit5bkdJRkpyN2lSNFpRQjUvN0NaSWNUMm1Ya1Q3aGtGOXdpb2pZ?=
 =?utf-8?B?V1NTZnRqTFNNTWcrUlc4bU50T0RGUGhwdVA0MUdOR3c1VE1BMzdwcmNGaUs1?=
 =?utf-8?B?ZDI3eFo0ZXJsSVFYclo3YlFFOGZQTWxrUzZDUDIyS1VGZkdxWTJNK3ZMRGZ2?=
 =?utf-8?B?RTlmLzMzS2RDNTBFUzRYVXlGNkNhYWg3dmdUSmY1YStZb1RBc1JOTjJ4Z1p5?=
 =?utf-8?B?bU43blhzaHBDMW41NHp4Szh2SnBSMXBZZjlkZEZxU25qaGp0a0ZoY3JBSGlz?=
 =?utf-8?B?dXZ6RkRBOWxxWEdZVUpzWVlVNTM5K08zTkFKaWNId2FsbTA1ajJrWWE5eVB2?=
 =?utf-8?B?UWNDT2pCUUp5M05qN2dBWE12U0VpQ1hwNlRnODFVSEtpUklEaSs3MjVoNEV4?=
 =?utf-8?B?bWk1cm02VzdJa2FVV2pRSnlseDQrSHB0eVhYanc3ZUJEcWx0dXZwcUh6OWZR?=
 =?utf-8?B?azI1bTR2NC8rUnR4MVQ3RnJqaHp3alJwTnZvSmlxSjJ3VVdXck9aVWVtVHB3?=
 =?utf-8?B?T1ZKNFFpV0lqb0VKM01RaUJLM1kxYmpiamVsTGZEQ3JwNWZMVWFaUmJDSFhZ?=
 =?utf-8?B?Q1FRSkw2ZFVOdEVhRUNqK0ZpMFdKdFBoL0d4NEFXaEQ1OHhJWW1qeFd1WXdN?=
 =?utf-8?B?Q3Z4Z3J0Q0dmNUIzSEJKUTQwbUhYcWdFYnVGemRpL2o0cVZ6T1BuQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2959b4b4-630e-42b5-0592-08deb5e8ba48
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 20:53:49.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnfD/A+hnCHNVuWs3dVgivQ0/M4yn87tTlTTg4RPwibnXQm9hkHfujHicrwhRPikeMlHLtTkPNRuqL32/+CGAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37163-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B2260584E7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--------------zXZsetrd31X0IbGREd2YIidf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/19/26 14:49, Hardik Prakash wrote:
> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
>> I like this idea. I guess something like this:
>> [gpiolib-acpi-core.c patch]
> 
> Tested patch 1 + gpiolib-acpi deferral, without patch 2. Arbitration
> errors persist:
> 
>    patch 1 + gpiolib-acpi deferral:   arbitration errors, WACF2200 does not probe
>    patch 1 + patch 2 (v5):           clean boot, touchscreen fully functional
> 
> I think the reason is that i2c-designware does not call acpi_get_gpiod()
> during its probe. The GpioInt resource is on the WACF2200 touchscreen
> device (TPNL), not on the I2C controller itself. So the deferral in
> acpi_get_gpiod() never triggers for AMDI0010:02 -- nothing in that probe
> path requests a GPIO descriptor.
> 
> The race is between amd_gpio_probe() completing and dw_i2c_plat_probe()
> starting for AMDI0010:02. Without something that explicitly checks
> whether the GPIO controller is fully bound before the I2C controller
> probes, the race remains.
> 

In the same linke of thinking - how about something like this instead 
(AI generated and attached).

Basically walk through the resources at probe time and make sure they're 
all bound.

> Thanks,
> Hardik
> 
> On Wed, 20 May 2026 at 00:37, Hardik Prakash
> <hardikprakash.official@gmail.com> wrote:
>>
>> On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
>>> You add a debug statement to amd_gpio_irq_enable() too right? Can you
>>> please share your debugging messages patch and full log?
>>
>> I did not add debug to amd_gpio_irq_enable() - the statements were
>> only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one there
>> if useful, but given Bart's suggestion below I'll hold off unless
>> needed.
>>
>>> What is the boot time impact to adding device_is_bound() check?
>>
>> I haven't measured this explicitly. The deferral only fires on DMI-
>> matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_for_
>> amd_gpio() returns 0 immediately with no overhead.
>>
>> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
>>> I like this idea.
>>
>> I'll test this patch, and let you know how it goes.
>>
>> Thanks,
>> Hardik
>>
>> On Tue, 19 May 2026 at 20:18, Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>>
>>>
>>> On 5/19/26 09:39, Bartosz Golaszewski wrote:
>>>> On Tue, May 19, 2026 at 4:28 PM Mario Limonciello
>>>> <mario.limonciello@amd.com> wrote:
>>>>>
>>>>>>
>>>>>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
>>>>>> system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
>>>>>> at 0.301454 while amd_gpio_probe() is still completing. This is why
>>>>>> device_is_bound() works and initcall promotion does not -- it waits for
>>>>>> probe completion, not just gpiochip registration.
>>>>>
>>>>> What is the boot time impact to adding device_is_bound() check?
>>>>>
>>>>> Bartosz, thoughts?
>>>>>
>>>>
>>>> My thoughts are that ACPI could use some fw_devlink. :) It's not a new
>>>> problem, we've fixed it for OF systems.
>>>>
>>>> Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
>>>> device of the GPIO chip is not bound yet instead? When resolving the
>>>> reference to the remote GPIO controller we have an address of the
>>>> struct acpi_device. I suppose there's a platform device that is its
>>>> child and then the logical GPIO controller device, is that correct?
>>>> Can we check if the platform device in question is bound at the
>>>> subsystem level?
>>>>
>>>> Bart
>>>
>>> I like this idea.  I guess something like this:
>>>
>>> diff --git a/drivers/gpio/gpiolib-acpi-core.c
>>> b/drivers/gpio/gpiolib-acpi-core.c
>>> index eb8a40cfb7a98..e3511398b1f84 100644
>>> --- a/drivers/gpio/gpiolib-acpi-core.c
>>> +++ b/drivers/gpio/gpiolib-acpi-core.c
>>> @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *path,
>>> unsigned int pin)
>>>           if (!gdev)
>>>                   return ERR_PTR(-EPROBE_DEFER);
>>>
>>> +       if (gdev->dev.parent) {
>>> +               scoped_guard(device, gdev->dev.parent) {
>>> +                       if (!device_is_bound(gdev->dev.parent))
>>> +                               return ERR_PTR(-EPROBE_DEFER);
>>> +               }
>>> +       }
>>> +
>>>           /*
>>>            * FIXME: keep track of the reference to the GPIO device somehow
>>>            * instead of putting it here.
>>>

--------------zXZsetrd31X0IbGREd2YIidf
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-i2c-designware-Defer-probe-if-child-GpioInt-controll.patch"
Content-Disposition: attachment;
 filename*0="0001-i2c-designware-Defer-probe-if-child-GpioInt-controll.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA4Nzc3OGM4ZWQyOWYxY2RhYjUwNWQ2YTc0NTA1MjEzZTFlOGJlZjIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9A
YW1kLmNvbT4KRGF0ZTogVHVlLCAxOSBNYXkgMjAyNiAxNTowMDozMSAtMDUwMApTdWJqZWN0OiBb
VEVTVCBQQVRDSF0gaTJjOiBkZXNpZ253YXJlOiBEZWZlciBwcm9iZSBpZiBjaGlsZCBHcGlvSW50
IGNvbnRyb2xsZXJzIGFyZQogbm90IGJvdW5kCgpJMkMgY29udHJvbGxlcnMgbWF5IGhhdmUgY2hp
bGQgZGV2aWNlcyB3aXRoIEdwaW9JbnQgcmVzb3VyY2VzIHRoYXQKZGVwZW5kIG9uIEdQSU8gY29u
dHJvbGxlcnMgdG8gYmUgZnVsbHkgaW5pdGlhbGl6ZWQuIElmIHRoZSBJMkMKY29udHJvbGxlciBw
cm9iZXMgYW5kIGVudW1lcmF0ZXMgY2hpbGRyZW4gYmVmb3JlIHRoZSByZWZlcmVuY2VkIEdQSU8K
Y29udHJvbGxlciBoYXMgY29tcGxldGVkIHByb2JlLCBHUElPIGludGVycnVwdHMgbWF5IG5vdCBi
ZSBwcm9wZXJseQpjb25maWd1cmVkLCBsZWFkaW5nIHRvIGRldmljZSBmYWlsdXJlcy4KCk9uIExl
bm92byBZb2dhIDcgMTRBR1AxMSwgdGhlIFdBQ0YyMjAwIHRvdWNoc2NyZWVuIChjaGlsZCBvZgpB
TURJMDAxMDowMikgaGFzIGEgR3Bpb0ludCByZXNvdXJjZSBwb2ludGluZyB0byBHUElPIDE1NyBv
biB0aGUKcGluY3RybC1hbWQgY29udHJvbGxlciAoQU1ESTAwMzA6MDApLiBXaGVuIGkyYy1kZXNp
Z253YXJlIHByb2JlcwpBTURJMDAxMDowMiBiZWZvcmUgcGluY3RybC1hbWQgZmluaXNoZXMgaW5p
dGlhbGl6aW5nLCBJMkMgdHJhbnNhY3Rpb25zCm9jY3VyIGJlZm9yZSB0aGUgR1BJTyBJUlEgcXVp
cmsgaW4gYW1kX2dwaW9fcHJvYmUoKSBoYXMgcnVuLCBjYXVzaW5nOgoKICBpMmNfZGVzaWdud2Fy
ZSBBTURJMDAxMDowMjogaTJjX2R3X2hhbmRsZV90eF9hYm9ydDogbG9zdCBhcmJpdHJhdGlvbgoK
QWRkIGEgZ2VuZXJpYyBkZXBlbmRlbmN5IGNoZWNrIGluIGkyYy1kZXNpZ253YXJlIHRoYXQgd2Fs
a3MgQUNQSSBjaGlsZApkZXZpY2VzLCBpZGVudGlmaWVzIGFueSBHcGlvSW50IHJlc291cmNlcywg
cmVzb2x2ZXMgdGhlIHJlZmVyZW5jZWQgR1BJTwpjb250cm9sbGVycywgYW5kIGRlZmVycyBwcm9i
ZSBpZiB0aG9zZSBjb250cm9sbGVycyBhcmUgbm90IHlldCBib3VuZC4KClRoaXMgZW5zdXJlcyBH
UElPIGNvbnRyb2xsZXJzIGNvbXBsZXRlIGluaXRpYWxpemF0aW9uIChpbmNsdWRpbmcgSVJRCnNl
dHVwIGFuZCBxdWlya3MpIGJlZm9yZSBJMkMgY2hpbGQgZW51bWVyYXRpb24gYmVnaW5zLCBmaXhp
bmcgdGhlIHJhY2UKd2l0aG91dCBkZXZpY2Utc3BlY2lmaWMgcXVpcmtzIG9yIERNSSBtYXRjaGlu
Zy4KCkxpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjIx
NDk0Ck5vdC1TaWduZWQtb2ZmLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVs
bG9AYW1kLmNvbT4KQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTQtNgotLS0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMgfCAxNTMgKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtcGxhdGRydi5jCmluZGV4IDMzNTFjNGE5ZWYxMTgu
Ljg1NmJmNjc5NDA2YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdu
d2FyZS1wbGF0ZHJ2LmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXBs
YXRkcnYuYwpAQCAtOCw2ICs4LDcgQEAKICAqIENvcHlyaWdodCAoQykgMjAwNyBNb250YVZpc3Rh
IFNvZnR3YXJlIEluYy4KICAqIENvcHlyaWdodCAoQykgMjAwOSBQcm92aWdlbnQgTHRkLgogICov
CisjaW5jbHVkZSA8bGludXgvYWNwaS5oPgogI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5o
PgogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CkBAIC0x
MzAsNiArMTMxLDE1MCBAQCBzdGF0aWMgaW50IGkyY19kd19wcm9iZV9sb2NrX3N1cHBvcnQoc3Ry
dWN0IGR3X2kyY19kZXYgKmRldikKIAlyZXR1cm4gMDsKIH0KIAorI2lmZGVmIENPTkZJR19BQ1BJ
CitzdHJ1Y3QgZ3Bpb19kZXBfY3R4IHsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGdwaW9fY29udHJvbGxl
cnM7CisJaW50IHJldDsKK307CisKK3N0cnVjdCBncGlvX2NvbnRyb2xsZXJfcmVmIHsKKwlzdHJ1
Y3QgbGlzdF9oZWFkIG5vZGU7CisJY2hhciAqcGF0aDsKK307CisKK3N0YXRpYyBpbnQgY2hlY2tf
Z3Bpb2ludF9yZXNvdXJjZShzdHJ1Y3QgYWNwaV9yZXNvdXJjZSAqYXJlcywgdm9pZCAqZGF0YSkK
K3sKKwlzdHJ1Y3QgZ3Bpb19kZXBfY3R4ICpjdHggPSBkYXRhOworCXN0cnVjdCBhY3BpX3Jlc291
cmNlX2dwaW8gKmFncGlvOworCXN0cnVjdCBncGlvX2NvbnRyb2xsZXJfcmVmICpyZWYsICp0bXA7
CisJYm9vbCBmb3VuZCA9IGZhbHNlOworCisJaWYgKGFyZXMtPnR5cGUgIT0gQUNQSV9SRVNPVVJD
RV9UWVBFX0dQSU8pCisJCXJldHVybiAxOworCisJYWdwaW8gPSAmYXJlcy0+ZGF0YS5ncGlvOwor
CWlmIChhZ3Bpby0+Y29ubmVjdGlvbl90eXBlICE9IEFDUElfUkVTT1VSQ0VfR1BJT19UWVBFX0lO
VCkKKwkJcmV0dXJuIDE7CisKKwkvKiBDaGVjayBpZiB3ZSd2ZSBhbHJlYWR5IHRyYWNrZWQgdGhp
cyBHUElPIGNvbnRyb2xsZXIgKi8KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcCwgJmN0eC0+Z3Bp
b19jb250cm9sbGVycywgbm9kZSkgeworCQlpZiAoIXN0cmNtcCh0bXAtPnBhdGgsIGFncGlvLT5y
ZXNvdXJjZV9zb3VyY2Uuc3RyaW5nX3B0cikpIHsKKwkJCWZvdW5kID0gdHJ1ZTsKKwkJCWJyZWFr
OworCQl9CisJfQorCisJaWYgKCFmb3VuZCkgeworCQlyZWYgPSBremFsbG9jX29iaigqcmVmLCBH
RlBfS0VSTkVMKTsKKwkJaWYgKCFyZWYpIHsKKwkJCWN0eC0+cmV0ID0gLUVOT01FTTsKKwkJCXJl
dHVybiAwOworCQl9CisKKwkJcmVmLT5wYXRoID0ga3N0cmR1cChhZ3Bpby0+cmVzb3VyY2Vfc291
cmNlLnN0cmluZ19wdHIsIEdGUF9LRVJORUwpOworCQlpZiAoIXJlZi0+cGF0aCkgeworCQkJa2Zy
ZWUocmVmKTsKKwkJCWN0eC0+cmV0ID0gLUVOT01FTTsKKwkJCXJldHVybiAwOworCQl9CisKKwkJ
bGlzdF9hZGRfdGFpbCgmcmVmLT5ub2RlLCAmY3R4LT5ncGlvX2NvbnRyb2xsZXJzKTsKKwl9CisK
KwlyZXR1cm4gMTsKK30KKworc3RhdGljIGludCBjaGVja19jaGlsZF9ncGlvaW50KHN0cnVjdCBh
Y3BpX2RldmljZSAqYWRldiwgdm9pZCAqZGF0YSkKK3sKKwlzdHJ1Y3QgZ3Bpb19kZXBfY3R4ICpj
dHggPSBkYXRhOworCXN0cnVjdCBsaXN0X2hlYWQgcmVzX2xpc3Q7CisJaW50IHJldDsKKworCUlO
SVRfTElTVF9IRUFEKCZyZXNfbGlzdCk7CisKKwlyZXQgPSBhY3BpX2Rldl9nZXRfcmVzb3VyY2Vz
KGFkZXYsICZyZXNfbGlzdCwgY2hlY2tfZ3Bpb2ludF9yZXNvdXJjZSwgY3R4KTsKKwlhY3BpX2Rl
dl9mcmVlX3Jlc291cmNlX2xpc3QoJnJlc19saXN0KTsKKworCWlmIChjdHgtPnJldCA8IDApCisJ
CXJldHVybiBjdHgtPnJldDsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGkyY19kd19j
aGVja19ncGlvX2RlcGVuZGVuY2llcyhzdHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IGFj
cGlfZGV2aWNlICphZGV2ID0gQUNQSV9DT01QQU5JT04oZGV2KTsKKwlzdHJ1Y3QgZ3Bpb19kZXBf
Y3R4IGN0eCA9IHsgLnJldCA9IDAgfTsKKwlzdHJ1Y3QgZ3Bpb19jb250cm9sbGVyX3JlZiAqcmVm
LCAqdG1wOworCWludCByZXQgPSAwOworCisJaWYgKCFhZGV2KQorCQlyZXR1cm4gMDsKKworCUlO
SVRfTElTVF9IRUFEKCZjdHguZ3Bpb19jb250cm9sbGVycyk7CisKKwkvKiBXYWxrIGFsbCBjaGls
ZCBkZXZpY2VzIGFuZCBjb2xsZWN0IEdwaW9JbnQgY29udHJvbGxlciByZWZlcmVuY2VzICovCisJ
cmV0ID0gYWNwaV9kZXZfZm9yX2VhY2hfY2hpbGQoYWRldiwgY2hlY2tfY2hpbGRfZ3Bpb2ludCwg
JmN0eCk7CisJaWYgKHJldCA8IDAgfHwgY3R4LnJldCA8IDApIHsKKwkJcmV0ID0gY3R4LnJldCA/
OiByZXQ7CisJCWdvdG8gY2xlYW51cDsKKwl9CisKKwkvKiBGb3IgZWFjaCBHUElPIGNvbnRyb2xs
ZXIsIGNoZWNrIGlmIGl0cyBwYXJlbnQgZGV2aWNlIGlzIGJvdW5kICovCisJbGlzdF9mb3JfZWFj
aF9lbnRyeShyZWYsICZjdHguZ3Bpb19jb250cm9sbGVycywgbm9kZSkgeworCQlhY3BpX2hhbmRs
ZSBoYW5kbGU7CisJCWFjcGlfc3RhdHVzIHN0YXR1czsKKwkJc3RydWN0IGFjcGlfZGV2aWNlICpn
cGlvX2FkZXY7CisJCXN0cnVjdCBkZXZpY2UgKmdwaW9fZGV2OworCisJCXN0YXR1cyA9IGFjcGlf
Z2V0X2hhbmRsZShOVUxMLCByZWYtPnBhdGgsICZoYW5kbGUpOworCQlpZiAoQUNQSV9GQUlMVVJF
KHN0YXR1cykpCisJCQljb250aW51ZTsKKworCQlncGlvX2FkZXYgPSBhY3BpX2ZldGNoX2FjcGlf
ZGV2KGhhbmRsZSk7CisJCWlmICghZ3Bpb19hZGV2KQorCQkJY29udGludWU7CisKKwkJZ3Bpb19k
ZXYgPSBhY3BpX2dldF9maXJzdF9waHlzaWNhbF9ub2RlKGdwaW9fYWRldik7CisJCWFjcGlfZGV2
X3B1dChncGlvX2FkZXYpOworCisJCWlmICghZ3Bpb19kZXYpIHsKKwkJCXJldCA9IC1FUFJPQkVf
REVGRVI7CisJCQlnb3RvIGNsZWFudXA7CisJCX0KKworCQkvKgorCQkgKiBDaGVjayBpZiB0aGUg
R1BJTyBjb250cm9sbGVyJ3MgZGV2aWNlIGlzIGJvdW5kLiBJZiBub3QsCisJCSAqIGRlZmVyIHBy
b2JlIHRvIGVuc3VyZSBHUElPIGluaXRpYWxpemF0aW9uIChpbmNsdWRpbmcgSVJRCisJCSAqIHNl
dHVwIGFuZCBxdWlya3MpIGlzIGNvbXBsZXRlIGJlZm9yZSB3ZSBlbnVtZXJhdGUgSTJDCisJCSAq
IGNoaWxkIGRldmljZXMuCisJCSAqLworCQlzY29wZWRfZ3VhcmQoZGV2aWNlLCBncGlvX2Rldikg
eworCQkJaWYgKCFkZXZpY2VfaXNfYm91bmQoZ3Bpb19kZXYpKSB7CisJCQkJcmV0ID0gLUVQUk9C
RV9ERUZFUjsKKwkJCQlnb3RvIGNsZWFudXA7CisJCQl9CisJCX0KKworCQlwdXRfZGV2aWNlKGdw
aW9fZGV2KTsKKwl9CisKK2NsZWFudXA6CisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJlZiwg
dG1wLCAmY3R4LmdwaW9fY29udHJvbGxlcnMsIG5vZGUpIHsKKwkJbGlzdF9kZWwoJnJlZi0+bm9k
ZSk7CisJCWtmcmVlKHJlZi0+cGF0aCk7CisJCWtmcmVlKHJlZik7CisJfQorCisJcmV0dXJuIHJl
dDsKK30KKyNlbHNlCitzdGF0aWMgaW50IGkyY19kd19jaGVja19ncGlvX2RlcGVuZGVuY2llcyhz
dHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJcmV0dXJuIDA7Cit9CisjZW5kaWYgLyogQ09ORklHX0FD
UEkgKi8KKwogc3RhdGljIGludCBkd19pMmNfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewogCXUzMiBmbGFncyA9ICh1aW50cHRyX3QpZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwpAQCAtMTM4LDYgKzI4MywxNCBAQCBzdGF0aWMgaW50IGR3X2kyY19w
bGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGR3X2kyY19k
ZXYgKmRldjsKIAlpbnQgaXJxLCByZXQ7CiAKKwkvKgorCSAqIENoZWNrIGlmIGFueSBjaGlsZCBk
ZXZpY2VzIGhhdmUgR3Bpb0ludCByZXNvdXJjZXMsIGFuZCBpZiBzbywKKwkgKiBkZWZlciBwcm9i
ZSB1bnRpbCB0aG9zZSBHUElPIGNvbnRyb2xsZXJzIGFyZSBmdWxseSBib3VuZC4KKwkgKi8KKwly
ZXQgPSBpMmNfZHdfY2hlY2tfZ3Bpb19kZXBlbmRlbmNpZXMoZGV2aWNlKTsKKwlpZiAocmV0KQor
CQlyZXR1cm4gcmV0OworCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAw
KTsKIAlpZiAoaXJxID09IC1FTlhJTykKIAkJZmxhZ3MgfD0gQUNDRVNTX1BPTExJTkc7Ci0tIAoy
LjQzLjAKCg==

--------------zXZsetrd31X0IbGREd2YIidf--

