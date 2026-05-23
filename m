Return-Path: <linux-gpio+bounces-37407-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIHtBO+gEWpvoQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37407-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 14:43:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25A5BEF04
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 14:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B23723013262
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 12:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1AB38945C;
	Sat, 23 May 2026 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KAsckSbR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D016387578;
	Sat, 23 May 2026 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779540202; cv=fail; b=sHjKwgAg2ayTRiwti7bv7iKzFNTcmIkEbFcN+Les/hv9zCB+CGSm9BK3ZRv3sp8IPkAkJ2EVYx+Qg9hPXG4Srk6CZHBWYwOQGPXQ5erF+oqEKJYYM9vVOR2b1LZXHPpakUuxQUgbv6AWQeXsamLKTlnhtKCVJSg/rSCi4DRBlEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779540202; c=relaxed/simple;
	bh=UDxw7irPovsyUYijLfkbU+cGiXw/2qjKb15yYLB8Pek=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qjuq2H3foKFPDouu2LCrlG1BD59hkSo/wXRkeMHyKVVH0SzQCE/Hp+AbTlclw5aqkHMbEGJL2N9NQ9EZ8SFVs96G4tMaBrF7qiqkt+2AoU/vY8VPb5bPZjqFf040cUCfXu5NfDcVR6SyAoxssJbMPIwwEytehliMxQ84aA/gaPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KAsckSbR; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqL4cLX8UK/xIlHHC9HwPm15tXCIPlLUhu4r0ZFmWEQ8VPsVEoZTP9rowUnh4AKcX1Kc3wF7CwkNgqaGdefL6PnO8fq4R3raUxPlOlsHb8I46T+JMMkOOWsLZrDMm22xjijmHfW5agsA16XJGs81wRw2hcBe2qRtoxOXvI4nl0xLXszEhW3ohnTg1dZb+LIRaNaoUx2v+leRnsStb/upOh+cd6oRl2YN2c1CrIBTnGixTR4J9mNBsZsNLbNw/k14qzHM2Y05G7tq9NPKkuRnj3f5ulFSLoy9UcIXPmO49m4qatpN0kAxT8rQjKiRy1qEPpzOm6jw6mZbiRyKk5oDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rbnlfmuSFOGr8OGnZm7NgJ60pxBMXDuXT71znzPI6g=;
 b=ZOJICib5c8EhkKIhddyG1P83o7ZbBu52q1muWWB4YhzuyxAAniqaiK7uwFHkmzrDHRDT64G4s4KVnYY9J6dEHJ779yQsKCroalXK4cv87DfxeMgvNLlueISjqnli0F2yP+Pc+1S94HPygGAwpulJ7jHD+Wz/JDvkeuu4hm73zPC7IUC/W/5x8dDB4d8Fxy9NfmIfsmVbxp8H+l71wmrP1BCMyTnww+x0T4QYgjh6REw3qHVvvontr9YRssD2nRw4qFvWtuGdHMdthAuw7/rUS5/KA9YUKU87ud6EjaeOfe/6/l6yhMODZyqSA1+ii9pL909X3g33zQIMh7GiFifK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rbnlfmuSFOGr8OGnZm7NgJ60pxBMXDuXT71znzPI6g=;
 b=KAsckSbRgFVntwbXPtTGiyPspgU9dy4b8G/YL4jB7mNvx5pnXxRhn8gwYqO0oBdPdlc8OksEC30YAgDVUAAWObJrX+VKLw6Agme4SBwKM5g3MIhcG18L2W/2RZ/3xE5z26YJTjITKl0GFTiqXcIXc+FU8GVfVvQV1xdAmW63+O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BL4PR12MB9534.namprd12.prod.outlook.com (2603:10b6:208:58f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sat, 23 May
 2026 12:43:16 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 12:43:16 +0000
Message-ID: <1fe21869-35ac-4363-99bc-7e39451c48b4@amd.com>
Date: Sat, 23 May 2026 07:43:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, wsa@kernel.org, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
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
 <e31e28e7-62b0-44a3-b155-57504be09c69@amd.com>
 <CANTFpSVnhst-25KPa-m2e14rR_dqJNq_s6k_ZO-MFazqLa=AEQ@mail.gmail.com>
 <CANTFpSWLUfNZyjJXApgf60MyJ9imWYVKLy9vj=Lin3Lh=qoAMw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANTFpSWLUfNZyjJXApgf60MyJ9imWYVKLy9vj=Lin3Lh=qoAMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0072.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::28) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BL4PR12MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd86942-5238-499a-f345-08deb8c8dc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|4143699003|6133799003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	27qhq8Jl0Lzu6KyRQ1m+hc0rhd7r5rex8zyK5IbOXBuk6U0Gwj2DzCEzWbztG4NLmQMOnRl/6UWOYzdKPJnoMZ8ERaFx0YMIXfWmzwY4T9L+XpUbeh/MtMuW9UcRcSaa9gFPHEcQWN2jQyoUG/XWN9roYQty4aogAmsCoaDB1G+a4AqjuWMMsq0AtIjWCMKCdFQ8TEGZC6X2ELj7FRqtwPuuw2fBz/TIec+3WWunbKiuKaQs6MvuQ7MLq4FjKWQ7eGp9t27ap5/V6nUe0erO4CO+CBaMSL90tUIwx6iesVLebnrN2Hpqmm/M90L4myLzQ5Itn4rxxd637PJK4Aab0QGefjLlCv/hkWagF7mvEMbYdt2/Gcz1WY60o0fbe0ix6SBMlO4JiM95PY/Mh4ZDwgt+Qrxa6SpBIjPIf4GOPRKhaWbZGofWhbSJYSYGq2jK8Qjmx06ux+ZiYCXHjoK5HlJF6ZxDr/pvOAYi2WTlA5WN6DD6AuoeRIxuF5HQ5qVNYMEEX27fdGidMVOWLP7/sf4Jg1CpLtg/AdVG/gRWIqHwJk4xxQyaUQ8DpC/dkR3Q+E8+UY13zzGShXvNzSi7vLyPx4krw4qKwft7Drgx9XkNqxUMxZOJFHxYBi5QX3vTwPNFG+e8x1GC7yWOWPEb3jIyfui9DQ82LB3W4vUx1n30eQN2PdakKKw50LrHS6GR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(6133799003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdkajhrWWxreEVuVGgwOGIzdUtyMDBFcnd4Z3FDNDhYN3dOVVNLZy9aR3hi?=
 =?utf-8?B?NVJKVTVaVjVvMEptYXo1ckFzdFFSZHB5bTZUcEpaWTBybEZHcUpJOWFabHdZ?=
 =?utf-8?B?RnJON3lHcXJnQUg2MzFKMllmWWt5aDFkV0lJK2N0UGwvdmJyVW5EZlR3ZzNW?=
 =?utf-8?B?cm9LWDBuUTZFN0VhWEphZlh6aWxMZnFLNVNkWGV1RDQ1L1FtRzl1NkU3WURS?=
 =?utf-8?B?cWluRWVrN0Jkblh1dlhkdkV1cTVnZTYyMXo0V2cvaHFRajhhUWZRMHAyTWRJ?=
 =?utf-8?B?Wm1lenZtcGEydHZNaUdyK2VuaUJ0bHEySnNGc29Hb3hjUXJncWpzL2tpS2Qv?=
 =?utf-8?B?RHNncUlTaTBaOXhZMnZaVXVYeXgwZndRUnhYWnlEN0dGa3g2UE15SGd1UWNY?=
 =?utf-8?B?N3krWDZ1ck01U2xVUUMwTkxueVdESHc0VWpCWWFkU0lna0dUYzNnZXIxS2xE?=
 =?utf-8?B?cGlFWEo4NUJrRStoVStOK0lvM2ZFaDlqNWY3ZS9BOEYrc2ppajlGdm1UVHds?=
 =?utf-8?B?TExTYTZYbTlHVnlsbjl1WnRVd1ZacUJVbU5FeU9QNzNnWmlONlFoRUhiTitz?=
 =?utf-8?B?Tmd6a2k5QkxwV1Y5d1I1Uk8vdEZUaUxneEJhUjhUQ3hqY1JlT1QzMGVWdlNW?=
 =?utf-8?B?Z1dJVDY0aURCbjJaa2gwcW5peDNSdmtpL201ckVpbW1HOFdGZmg0UStGM1Ri?=
 =?utf-8?B?WDl4a2ZrbWZEVkZVaFljL3RUdVBMeC8yWSt2NWpUWDl1ZGtydHpPd0VNNis2?=
 =?utf-8?B?dVg5b0Q0QTVBcGRyN2cyRm1YL2VvRjRIdGwrRTlGamg3NHVMa2Z4ZzkzWkdl?=
 =?utf-8?B?VkkxaHRtNllLYmFWM1ZWbnd1ZGFXZ0Y1TGJLQkNCUlVkRG15cTE0cXFWSTU3?=
 =?utf-8?B?SFhhZnFkZW9Gcjh5QmkvZU9Tc2Nsc2RuVERvTlBVQ0hwYVNUbWo1TWt3SStR?=
 =?utf-8?B?c05QZGRvQ1BhN1NYbTByL0tEb3RheVhYS2I5dWxqcms1aUYvTXg4dDhCMVc5?=
 =?utf-8?B?ODgwVm11ZCtXenRqSnd2d0RucE4wZGg5NmtaLzh4Sk9lU2o2WkRrTUl5MmpJ?=
 =?utf-8?B?OGVhS1FoeW0xVS9xbEkxcFNuWERIeUJXQkdUN3FybHM3NDVzc0RVa1BKUm5F?=
 =?utf-8?B?dWo5ci9BbmxkZVNZakNkYy9TdkZKSFZOTjBvQ09TR0xoVWp2SlJydEF1NURK?=
 =?utf-8?B?YnVhVi9Rd2p2WjltVkV6MGJ0WGlVQ1EwMm1Na2NLdGoxN0NuTUd0OFVoaFZh?=
 =?utf-8?B?aDl3OVBMT0NRWlJ6R2pxL1ZhcWFrY05jd0FlU2loeVJBWU1CQmV1Nk12MlVr?=
 =?utf-8?B?VGVQMDFKemxvbmxBRkp2OEc4cmgyMENaVUwyaGMzWVRjNTdtQTNXZHA5K1Zv?=
 =?utf-8?B?TXZCalBXTFpQeXM5by92YWpick4rRnZYa0hLSjUzWTVSeDl2TlRjeXZSMDVi?=
 =?utf-8?B?b0ZGdnNYMytVRGhtb3pIbHg2bnFNaDAxWmRPeDkwYXJxalh3cnR4UlpKT1ZF?=
 =?utf-8?B?U1U0NUROU3d1M1k4VXpGN0p6aVVac2RMMFlqUHJmVVBQYkZoYk84ZmI3L0ZN?=
 =?utf-8?B?QkVySVR1eklJOWNmTUFtNnpWRFROSW50Uy9NZHdxQjkvTmVIcmV5NHl0alhI?=
 =?utf-8?B?Z1h6dklWclo2VXk5NnBaanduRXVwYVlROXVjQzdBWWtNNWxjTnF1Q3N6QUx5?=
 =?utf-8?B?VThmTWRxL2ZCUHVodzFNRUpPclZucDlLOElmYzYrZjZNZjhHeWJWSUIzM1h0?=
 =?utf-8?B?K1J6eTlNYW5rbm5jWGNidWRXQ0pzd1cxS2dPK21jWkNTa3VLeUdIaE9HbFBR?=
 =?utf-8?B?bEttYkhnMXE1bDZZVDRZWUJ2S1ZOOU1pTi95Q1VncDMzNzAwWTY3V1lMY2pw?=
 =?utf-8?B?M0pScmprOHdXZFhGL0xWbHllZFpJYW5CWUZ4ajVQdmZPbzNXV1Y4MElVbTB6?=
 =?utf-8?B?VUllalgvSzh1enZ6SUpacm1Sc0ZBVU1DRDRiWXcrVFkvOXMveElEVlJWWTVN?=
 =?utf-8?B?R0NBakhFTXNFZWtadGhaR1NRM1JlaU9tMGZ2OTRRRUZTTm8xQmw0VDdIKzRv?=
 =?utf-8?B?U3hDdGM0TVphd0FEcHFSVHdrOElBRjlLYXVUQ0RmS0dYKzJUSTlGY1g2dVg0?=
 =?utf-8?B?VTByVnB5SGpmQWpXUzhPMnVldlNwbmdZWW5HOTNpVnJ4RHFjYjFvMTJYejlC?=
 =?utf-8?B?azIxQzdLcE9lZjhXUmRYelBubWNndGk0M2pJVTRkS2hyWlBYZG9xZUxiWG4r?=
 =?utf-8?B?REpra0pRaW9xdkxpaDYyeTNISGNYTTdXN2plUHFhbVFhZnNPSWcva2JQVW8r?=
 =?utf-8?Q?uvlQ+9fN7MhbwNTBtO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd86942-5238-499a-f345-08deb8c8dc66
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 12:43:16.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A++u6xtUP02MG96Cx7cctVy+bI8XSrBcLHOLma4d6cNgwibuF0Sm296KATXWxHJb0SqI/NzA3i30/gCM1TD5RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9534
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37407-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6B25A5BEF04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/23/26 02:51, Hardik Prakash wrote:
> On Tue, May 19, 2026 at 02:23, Mario Limonciello wrote:
>> In the same line of thinking - how about something like this instead
>> (AI generated and attached).
> 
> I've cleaned up your patch (fixed kzalloc_obj, moved goto outside
> scoped_guard, wrote a proper commit message) and am planning to submit
> it as v6 with Co-developed-by and Signed-off-by carrying your name.
> 
> Please let me know if you're happy with that, or if you'd prefer to
> submit it yourself.

It was 100% written by the robot, just shared by me for a reference.
I don't think it needs a S-o-b, you can leave a Suggested by for me at most.

Go ahead and drive it forward for discussion.

> 
> Thanks,
> Hardik
> 
> On Wed, 20 May 2026 at 10:32, Hardik Prakash
> <hardikprakash.official@gmail.com> wrote:
>>
>> On Tue, May 19, 2026 at 02:23, Mario Limonciello wrote:
>>> In the same line of thinking - how about something like this instead
>>> (AI generated and attached).
>>>
>>> Basically walk through the resources at probe time and make sure they're
>>> all bound.
>>
>> Tested. Works perfectly — clean boot, no arbitration errors, touchscreen
>> and stylus fully functional:
>>
>>    patch 1 + generic GPIO dependency check:   clean boot, touchscreen works
>>
>> The generic approach is better. With this patch, patch 2 (the
>> DMI-specific i2c-designware deferral) is no longer needed.
>>
>> Note: I applied kzalloc(sizeof(*ref), GFP_KERNEL) in place of
>> kzalloc_obj(*ref, GFP_KERNEL), and moved the goto outside the
>> scoped_guard using a local bool. Happy to share the exact diff I tested
>> if useful.
>>
>> Thanks,
>> Hardik
>>
>> On Wed, 20 May 2026 at 02:23, Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>>
>>>
>>> On 5/19/26 14:49, Hardik Prakash wrote:
>>>> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
>>>>> I like this idea. I guess something like this:
>>>>> [gpiolib-acpi-core.c patch]
>>>>
>>>> Tested patch 1 + gpiolib-acpi deferral, without patch 2. Arbitration
>>>> errors persist:
>>>>
>>>>     patch 1 + gpiolib-acpi deferral:   arbitration errors, WACF2200 does not probe
>>>>     patch 1 + patch 2 (v5):           clean boot, touchscreen fully functional
>>>>
>>>> I think the reason is that i2c-designware does not call acpi_get_gpiod()
>>>> during its probe. The GpioInt resource is on the WACF2200 touchscreen
>>>> device (TPNL), not on the I2C controller itself. So the deferral in
>>>> acpi_get_gpiod() never triggers for AMDI0010:02 -- nothing in that probe
>>>> path requests a GPIO descriptor.
>>>>
>>>> The race is between amd_gpio_probe() completing and dw_i2c_plat_probe()
>>>> starting for AMDI0010:02. Without something that explicitly checks
>>>> whether the GPIO controller is fully bound before the I2C controller
>>>> probes, the race remains.
>>>>
>>>
>>> In the same linke of thinking - how about something like this instead
>>> (AI generated and attached).
>>>
>>> Basically walk through the resources at probe time and make sure they're
>>> all bound.
>>>
>>>> Thanks,
>>>> Hardik
>>>>
>>>> On Wed, 20 May 2026 at 00:37, Hardik Prakash
>>>> <hardikprakash.official@gmail.com> wrote:
>>>>>
>>>>> On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
>>>>>> You add a debug statement to amd_gpio_irq_enable() too right? Can you
>>>>>> please share your debugging messages patch and full log?
>>>>>
>>>>> I did not add debug to amd_gpio_irq_enable() - the statements were
>>>>> only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one there
>>>>> if useful, but given Bart's suggestion below I'll hold off unless
>>>>> needed.
>>>>>
>>>>>> What is the boot time impact to adding device_is_bound() check?
>>>>>
>>>>> I haven't measured this explicitly. The deferral only fires on DMI-
>>>>> matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_for_
>>>>> amd_gpio() returns 0 immediately with no overhead.
>>>>>
>>>>> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
>>>>>> I like this idea.
>>>>>
>>>>> I'll test this patch, and let you know how it goes.
>>>>>
>>>>> Thanks,
>>>>> Hardik
>>>>>
>>>>> On Tue, 19 May 2026 at 20:18, Mario Limonciello
>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/19/26 09:39, Bartosz Golaszewski wrote:
>>>>>>> On Tue, May 19, 2026 at 4:28 PM Mario Limonciello
>>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
>>>>>>>>> system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
>>>>>>>>> at 0.301454 while amd_gpio_probe() is still completing. This is why
>>>>>>>>> device_is_bound() works and initcall promotion does not -- it waits for
>>>>>>>>> probe completion, not just gpiochip registration.
>>>>>>>>
>>>>>>>> What is the boot time impact to adding device_is_bound() check?
>>>>>>>>
>>>>>>>> Bartosz, thoughts?
>>>>>>>>
>>>>>>>
>>>>>>> My thoughts are that ACPI could use some fw_devlink. :) It's not a new
>>>>>>> problem, we've fixed it for OF systems.
>>>>>>>
>>>>>>> Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
>>>>>>> device of the GPIO chip is not bound yet instead? When resolving the
>>>>>>> reference to the remote GPIO controller we have an address of the
>>>>>>> struct acpi_device. I suppose there's a platform device that is its
>>>>>>> child and then the logical GPIO controller device, is that correct?
>>>>>>> Can we check if the platform device in question is bound at the
>>>>>>> subsystem level?
>>>>>>>
>>>>>>> Bart
>>>>>>
>>>>>> I like this idea.  I guess something like this:
>>>>>>
>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-core.c
>>>>>> b/drivers/gpio/gpiolib-acpi-core.c
>>>>>> index eb8a40cfb7a98..e3511398b1f84 100644
>>>>>> --- a/drivers/gpio/gpiolib-acpi-core.c
>>>>>> +++ b/drivers/gpio/gpiolib-acpi-core.c
>>>>>> @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *path,
>>>>>> unsigned int pin)
>>>>>>            if (!gdev)
>>>>>>                    return ERR_PTR(-EPROBE_DEFER);
>>>>>>
>>>>>> +       if (gdev->dev.parent) {
>>>>>> +               scoped_guard(device, gdev->dev.parent) {
>>>>>> +                       if (!device_is_bound(gdev->dev.parent))
>>>>>> +                               return ERR_PTR(-EPROBE_DEFER);
>>>>>> +               }
>>>>>> +       }
>>>>>> +
>>>>>>            /*
>>>>>>             * FIXME: keep track of the reference to the GPIO device somehow
>>>>>>             * instead of putting it here.
>>>>>>


