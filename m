Return-Path: <linux-gpio+bounces-38296-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b3G/GITXKWrdeAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38296-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:30:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C666D171
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:30:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=5Yx9+MV0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38296-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38296-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6179C303B1AA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC01331ECD;
	Wed, 10 Jun 2026 21:30:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4938E8DD;
	Wed, 10 Jun 2026 21:30:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127034; cv=fail; b=sTpq8qu1ZbaIQVktn229UnLU/FH2iVfbCA3yznsjL4Brapg0I9CJSnJV+29RY5ls6TEFL1laXIkgnZH2KGj4ClWTQ5+bNwFQjDUVjfWy9qVUErgztrDMLjgfBI2OEHOf915mGiDCIN6awkFkrQli1Y45p8gGGghn2DLcmlDvrUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127034; c=relaxed/simple;
	bh=RJ04+o+pns5Hhi0puXSLoAvl/A8fvsX2X89QwOU0VlU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ky9rBtuMWgVMTyudBOkEdF1d9vodPZPCjLaDY2uR5a6GM0KTz/1z7n/AN/82Erv787HJVQ0o/AZDQdbsSYPalqHMHTJhrHBPvM6+4TMUSGiReyr3YgFCSr8qAezSBhShf1jLVyQP48zYdBP1x06TI9q1aucjtGsx9Asgp03X38E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Yx9+MV0; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qezeLjStVElRgHwDgnEINrcpdG45BUbkrfDc5N/lodWCKWhRjb6EJNlFfaopT9M8nx/4SgsSKzlaxnrGZ9xpP9X3HvmCRqlYXupmEPxuvHRfwNBb7q7NnPl6FSz2ywcZlAC3S+BSeKr3tqCCfBy2eGpWyXPbgA2ZUMu7uy/7ukgDYTKCzFtb/Cxf40KYWJtY70dlRiB3FzB0HP7cx/n3N241F+7V6TvzuXHNDxw6iqyWVrtlBLwqA6h5/Ew2yQRLeMUFsmuIINPslVHvyZNdN8e9xj3j8S5+s7R2Qit68GEclEAIQRH37+C3pTSb+Wa/Ade4DSla8u3n64fe/8xzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx6sEimD/Urn5q7ospnUWpqeAvK1Rjot9Nh/lcoJN9M=;
 b=HTFCI2e+NTglT+r4TLJUbuCuup6lkVtN+RzUvrmF8PmaIW+2A3uF6BxnjWmy5VaLAYKntByHgAfvoKmHXmALazDo8J8xwOu8EVZ0AhH5Wr6UKDDvgeX0Oz1WqhtYD/t4t2RrHZrMSEpepWg8Tgy8bm/k0e9Nd/FwUvtSNYpOfI7fdVmnO5jMKJKj9byUCeaz3iBQOM+Cna8OPAYmzN/UZB0Dz8BcDlUbk6Ga+WbtZTeaeM/lvpJGS6YG7PrtVi3Y9YKJCmQ+kco62p3zEimNzojaFzZrXck/TbXMLOzAdISM8cclLtUtQ3T6v4uoTcJyR/our8+KGJOwifA3y6Tqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx6sEimD/Urn5q7ospnUWpqeAvK1Rjot9Nh/lcoJN9M=;
 b=5Yx9+MV0dluP3fcgxNbIlCuy/u9c/ErSiI5pRVIeCRzhhJX6av3J+nedUdRtHeo8p1/kQsaDw/xBUZO+uCk6U35j58BoYNn8n85c8uzE2Mi99Xtib3OGj08YqBQotEig8hMkk2OMXbzxllE+6HTx+2ZjMh0C2nFbv0f+lEa0zs0=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 21:30:28 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 21:30:27 +0000
Message-ID: <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com>
Date: Wed, 10 Jun 2026 16:30:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
Content-Language: en-US
To: Lenart Kos <koslenart@gmail.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
 <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
 <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::14) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cef7e3-10b6-4079-7b3a-08dec7377d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|3023799007|11063799006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dDK8ApNbMWkmstLa8lrbx/HdGeKtecdr2cvOkhG+4FAGP1CuWEyAVDQaBcNhGbmXvPW5V7o0iBjJZ5KENNsy7XAqxcgYPEfRVhl/J30MFHmzcLfX/XQtpykkDJpMsjzd8w7/cpF/VvBBgB2AEepmlz2K06KiVseocOWnnAkgI21MKp1oGBE0gd31lRHw2kR6mPBQujuUGZTXFv5mpKjvo5DMfxLrfIbmunEFsvlcujXIOLMuzvScj4rInuVbV8R1GLSKFyFNom6GCR8HlyIwiZkBIUg3sU6i8A5IvZvHEs1AKCf23pjM2B46OCwgMEGjp0PESNX21Mh6BHkXz/ZtsNBmtxSZ48qBCl2UXJz9LMxSP6EX2bEZOlZtUCSrY4KB03goCleSo7HcqxVVMuNdcm6yNeQbLW3UIqsEON/X9nkm+jmVP64urgMTz8H3AuCZdAM7665wVwZu3cRq+ThmKWIaLhmvp8occ93IOaj99ayEAxHv5vVVC5f5gKAGWZDLxpR6yoCdc9TQYZZL1LI4/a+i1yhr8eG+Virz4IrSWyeIVUYI++ErGRxlt3WSFQpgc5gDp0RA7+JIQ7nCpjDVCIjZqCP9MW/Tvh05sqo8mKTPbPELsH5t6RCJve5nvSYwCF6J9Te0f+nm0nZyWAv0s+/IOet9FIIhjVzV/y30O9iDjXuqbmHUxNKVhxqUW7mn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(3023799007)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWlhYTJkWVpDb2xlbzI0ZFd2Q1J3Wkd3RFRUNEo4OHNaWHV5K3R2OSt2Q3ps?=
 =?utf-8?B?eUEwc3diTGR1cXpGM2pZd2cvYm5nZXpGdERZMVphZHkyTnBBN3E2QTQyNXRl?=
 =?utf-8?B?aUgvemM2Z0NiTFZaMUNtKy9FTFJTUnU1ci84UXdZYmZSSDZlaXl1RDc2bWhH?=
 =?utf-8?B?SEk2OWVhSkt4cXVxYTRBNmVKa1kvaHVMNmQrVUMrR1diMmVHWW84aFBicy94?=
 =?utf-8?B?Y2Z3a3ZWY0prNGc1ZmdtTkRIMGpjOWMxbmI4ZnF4WGxTK1RQUlJSLy8rS25K?=
 =?utf-8?B?TEhwYjJoR251bGs2UFVkTjFTZ2tkb2duM1lCU0t4TzNDMnY3ZzZIQkIrcVdY?=
 =?utf-8?B?L3BRZDRhcE82V0FwaTVEWUNoTFFYYm1GZ3BGK29RT3ZuQkoxREFSSFVqblEx?=
 =?utf-8?B?NmhCR2IreVdpb080UHFyZDJoRWFlRlFVSVFxd0k0Njl2WkZEaWw2MWlnTW9v?=
 =?utf-8?B?S1B5ZHJBSUVFLy9HTUcvTUlhdExZMWF1VU1qZnVycW9CV0pRc3ZjNWFvYjVy?=
 =?utf-8?B?RVA2T3N5Rms2MjBTSENzTERibDdOYTJtUnVGWXZYd3VmSG5WdEhWa1ZmZHRx?=
 =?utf-8?B?SGJvTndlK0RUZkNTcHgzdUQxajhhRGd5VzAxdDMyQXFGQWVOT25HWXdUQnBp?=
 =?utf-8?B?bHp1NGgxNk90NHBJSnVPRnZmVG5ta1BxZEpFZElBanJDQTNaU25VeHdJL3ht?=
 =?utf-8?B?SUFCTFA3VE9GT1ZmakJLcDU2SFJZYUNJQ3NyNVRTYU90Yzh1UVVwNDRBczJY?=
 =?utf-8?B?aGYzc0FsMzd4RUZNeTBSQXJiT0VUdXNLZk5Nbk9HbFkzeU1nWi9pV3d5Wmll?=
 =?utf-8?B?K25QYTZ2dW1uYTNjdlpMMzZqMzBhaDl2bEgvMEdwSEV6K0U5RS85L0dzYStW?=
 =?utf-8?B?U3pmM25vNUQyUW5MTXBzUlVRMUpsN3dJbFYwVTBOWTFmSTF6YzRQN3pBazE4?=
 =?utf-8?B?YjVTTkZ2c09uSjk3SUdBNVNvR3U3TC9sTmVKQ3I2MXExRzVHZlBud0EzTm92?=
 =?utf-8?B?U1N6em5MTGg1Q3FjL0FVMjlpVTBsSklPMnpUQWFnVGhKUHpBOCs0Z004S1NI?=
 =?utf-8?B?bFlPZDJqRFdrQTNKRUswVW1JWTdHbWdqbnYweEZCNGxvdyszRUZHNnNNZjd3?=
 =?utf-8?B?a3d6QkduWlFYMjd4d3pNczAxN3QrUmUzZDV2OUZVWEpIRkZvS0E1d2pWSWhs?=
 =?utf-8?B?VjBuc3lUSStHcm9RUXp4blJRZ1orNDNteUFCTXo1VDh4bkJLQjZHWjVOOGNj?=
 =?utf-8?B?WklkbkVtV2xNeVJWbkVCTkZkSlY5ampRR2IwejRYb1RPT1BwOStIazNEZzgz?=
 =?utf-8?B?a3plbXptQ2RydE91RmpTV1dMbjhPSHJpei9iamJoRjVSWllEQmNtMWlmNmZt?=
 =?utf-8?B?dDI3WTVWQVNYOGpsSUJjVyt0N2pCNmpYVUViYXU0RVN1K2gvbk83ckZpd2Uz?=
 =?utf-8?B?QVlMSGFFQ0xGN2xQcXBZMWpoSDdEby9uVERsZkNtbHBKYk5kcEJCQVFvREpp?=
 =?utf-8?B?bkJHRHgvbFVIWXdhUTNCS3lEQlFMNkVrVFJOVVFGVnZ5Vmhmcm9ndmRaWDZ6?=
 =?utf-8?B?TThYSENlWmlkRDkrcEQ1bS9CWDJqY2tqdXZIN2dQODNIT1NHK2hSS0FVUDBR?=
 =?utf-8?B?RW90TE50ZUlHZXUxT0JoNllFejZiS1NBUjRRcng3ZmZiblBuVTAvYVBpUTVO?=
 =?utf-8?B?SXRKZytQeEFqUmtFc0xiWGszQjR1NHY0MStLQWpaQmtsTmgyeW9PTFQvU0wr?=
 =?utf-8?B?RW44SDhSMFZ6VTQ4alZ6c240cjh3eXJTc1p3YitLU3YxemxGd3RPYUFaeHgv?=
 =?utf-8?B?N2tnUUhqVk5XWkJyRURDeHB6MWpXYlVvZ2FSUSt5Nm9VT0R0OEo1RmdqeGRO?=
 =?utf-8?B?YkViTi9UQTlDbjNqYWV4bU9YQ2tZalkvdGltd1oxdXJURXI0Y2FxTTVuanBh?=
 =?utf-8?B?cmtCTnR2ZzFZY2lUdUtvUmVkdkNHUWNOM2dDWi9zSm05eGw5ZEFMUDNLeWlz?=
 =?utf-8?B?bUI0S09YTXlxZFB0TWdyQ2ZnajBrNzNPaVlLVm5CRDZHSDc5d3NHbTBJNTkz?=
 =?utf-8?B?UDhPV0o5MVAxZzZXOGpkdXVkWjZibHJKZDZKN1BtQ0NRT1lQeVNoK1N2cm1s?=
 =?utf-8?B?MmRSZDNNUk4vQzdxMkthUXVyUUNTYVYwSjRkYVZmditBSXFERnB3d2xrL05G?=
 =?utf-8?B?Q3pEZU5vWlptTFRLaGpSdVRKcncyV0pwNUxvSmNGZkI1dFVHVG8ycnRRTDF5?=
 =?utf-8?B?cXplWm9WeUwzV2JidXVaK3hnczV2VXJRL2QrWmxpNVZBSFQvSXc2c0J2RHY4?=
 =?utf-8?B?b092MkRvNVd0SHNXUnFSRUZObWUwN045MFIzMVlSYzdwUHp1R2xSQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cef7e3-10b6-4079-7b3a-08dec7377d6a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 21:30:27.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+8hGmZfl8/X5mJTutJGPfRMgOd3BrmfyKjfxJZo8WkZxa0HKTb1sBbNWaZU/u2V0IWuNQgJ8X6DA5FglVkdNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38296-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:koslenart@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fedoraproject.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF0C666D171

On 6/10/26 16:20, Lenart Kos wrote:
> I have checked all the bios settings and the closest to modifying
> sleep behaviour was a setting that enables opening the lid turning on
> the laptop which was already disabled, so no, there are no sleep
> settings.

OK - then the LLM statement that this is a modern standby system sounds 
categorically wrong.

It sounds like this is actually a system that only support S3.

> 
> Regarding the HDMI port, it is connected to the Nvidia card. Only the
> built-in screen is connected to the AMD card with eDP. I have not
> reported this anywhere else yet, only here and the before mentioned
> forum post. If this is an Nvidia issue I can report it to them as
> well.

As the behavior only happens with something connected to the HDMI port, 
I think you should discuss this with NVIDIA before we make any quirk 
decisions in the kernel.

This really sounds like a driver bug to me if it's tied to that behavior.

I personally would not be against more debugging infrastructure, but I 
would think that /dev/gpiochipX is enough for users to debug with.

You can work with an LLM to try to come up with a solution that uses 
/dev/gpiochipX.

I would certainly welcome a new section in 
https://docs.kernel.org/arch/x86/amd-debugging.html to explain how you 
used it if it's effective for debugging this problem.

> 
> The HPD theory is pure guesswork done by LLM. What I can be certain of
> is that disabling those specific pins
> (https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e81048273106c5526561764b/legion_nowake.c#L59-L62)
> did solve the problem, as to why and in what way, I would not bet on.
> So the statements about HPD and your questions about them are maybe in
> vain. What would be the best way to figure out if HPD is actually
> attached to those pins?

You can add some debugging statements specifically for when those GPIOs 
are firing interrupts.  Unplug/plug and see if/when those GPIOs change.

Maybe they're monitor presence lines?  Maybe NVIDIA can tell you.

> 
> FWIW I think that it is in fact not HPD as I have checked the GPIO
> states when the monitor cable is connected or not and it seems to be
> gpio #131 not #2 or #4. I have asked Claude to expand on what it knows
> and what it assumes, this may be of help to you:
> ---
> What I have measured (facts):
> * The resume is triggered by the AMD GPIO controller:
> /sys/power/pm_wakeup_irq = 7 (pinctrl_amd), and the post‑resume log
> shows GPIO 4 is active: 0x30057c00 with the wake‑status bit latched
> and the S3 wake‑enable bit (bit 14) set.
> * In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
> S0i3/S3 wake‑enable bits set and an interrupt enabled. (Pin #89 has an
> interrupt but no wake bits — not a wake source.)
> * These wake bits have no ACPI owner: decompiling the DSDT and all 16
> SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
> references these pins.

At least for AMD this is specifically more common in systems that 
support S3 (no _AEI resources).

> * Empirically: suspend instant‑wakes only when an external display is
> connected (reproduced over both HDMI and USB‑C/DP); with no display,
> suspend holds. In the HDMI case, pin #4 is the one that latches the
> wake.
> * Clearing the S‑state wake‑enable bits (13/14/15) on pins #2 and #4
> fixes it (verified across multiple suspends). Interrupt‑enable bits
> left intact; no other wake source touched.
> * GPIO #131 is the actual monitor‑presence line — its level cleanly
> tracks plug/unplug (active‑low: LOW when a monitor is attached, HIGH
> when not, confirmed across plug→unplug→replug). But #131 has no
> interrupt and no wake bits — it does not wake the system.
> * Pins #2 and #4 do not change level when the monitor is
> plugged/unplugged (both steady while awake).
> 
> What I am inferring (not proven):
> * Because #4's level is steady while awake yet the wake only occurs
> with a display connected, my working model is that #4 transitions
> during the dGPU's suspend power‑down sequence, and that transition
> only happens when the dGPU was actively driving an external display.
> This is a plausible explanation of the display correlation, not a
> verified one.
> * The precise electrical function of pins #2/#4 is unknown without
> schematics or a scope. They are not the monitor‑presence/HPD line
> (that is the unarmed #131). I previously guessed "HPD"; the #131 data
> contradicts that, so I'm withdrawing it.
> 
> Unknown: what #2/#4 physically are, and why the firmware arms them as
> sleep wake sources with no ACPI description.
> 
> Net: a bare, firmware‑armed pinctrl-amd wake pin with no ACPI
> description, which no existing in‑tree mechanism can disarm
> (gpiolib_acpi.ignore_wake= needs an ACPI event; power/wakeup needs a
> device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
> ---
> 
> I have not filed a bugzilla report yet.
> 
> I hope I addressed your questions.
> 
> On Wed, Jun 10, 2026 at 10:23 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 6/10/26 15:18, Lenart Kos wrote:
>>> Thanks for taking your time for this. To answer your questions:
>>>
>>> S3 path:
>>> AFAIK it was on [deep] since my system was installed and I strongly
>>> remember being it as so, although it is possible that I misremembered
>>> since I have been debugging this sleep issue since January. In any
>>> case I have also tried setting sleep to [s2idle] before and it did not
>>> fix the waking issue even if set in s2 sleep mode.
>>> The firmware is not modified, everything is installed from Fedora
>>> sources without modification.
>>
>> Can you please check in Lenovo's BIOS setup if there is a sleep mode for
>> this platform?  If there isn't that's fine, I want to confirm what
>> Lenovo actually presented before making further assumptions.
>>
>> If there is such a setting, what options does it offer?  If you change
>> it does the behavior change?
>>
>> Furthermore if this issue is only happening when connected to the HDMI
>> port, that's the one connected to NVIDIA, right?  Have you started a
>> conversation with them?  Assuming the HPD theory that has been presented
>> is correct their driver should be in control of HPD behavior.
>>
>>>
>>> Methodology:
>>> Yes you are correct about LLMs, I have thrown every bit of my
>>> knowledge and time that I have available for this without success and
>>> Claude has finally solved this after a few months being irritated by
>>> this. I had decided to forward most of the information I received from
>>> LLM in the hopes it was useful to an expert in the area, but in
>>> hindsight I can see this was a mistake without AI disclosure, I'm
>>> sorry. So for your other questions regarding why this assumption was
>>> made or why was something done a certain way - I don't know, but I am
>>> willing to assist with testing. Apologies for this mess, it's my first
>>> time filing a bug to the LKML.
>>
>> No worries; as long as I'm talking to a human about a problem not an
>> LLM, I'm fine to work with you to see what we can come up with for a
>> solution.
>>
>> I've got various inline comments/questions below.  Can you please
>> address them?
>>
>>>
>>> On Wed, Jun 10, 2026 at 9:59 PM Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>> First off -
>>>>
>>>> How did you get into an S3 path?  These systems that ship with only
>>>> Modern Standby / s2idle normally shouldn't be able to get into S3.
>>>>
>>>> ╰─❯ cat /sys/power/mem_sleep
>>>> [s2idle]
>>>>
>>>> Have you modified the firmware in some way to try to enable an
>>>> unvalidated path?
>>>>
>>>> I have some more questions about your methodology below because when
>>>> debugging a kernel issue an LLM can sometimes make WILD assumptions that
>>>> are totally a house of cards.
>>>>
>>>> On 6/10/26 14:32, Lenart Kos wrote:
>>>>> ## Summary
>>>>>
>>>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an external
>>>>> display connected resumes the machine after ~1 second. The wake is delivered by
>>>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
>>>>> (and pin #2 for
>>>>> the USB‑C/DP path), which the **BIOS has armed as an S0i3/S3 wake
>>>>> source directly
>>>>> in the FCH GPIO register**, with **no ACPI description**
>>>>> (`_AEI`/`GpioInt`/`_PRW`)
>>>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
>>>>> none of the
>>>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=`, device
>>>>> `power/wakeup`)
>>>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
>>>>> write. The pin
>>>>> is an external‑display HPD line, so the edge produced while the GPU
>>>>> powers down on
>>>>> the way into sleep immediately wakes the system.
>>>>>
>>>>> ## Affected system
>>>>>
>>>>> ```
>>>>> DMI sys_vendor LENOVO
>>>>> DMI product_name 82WM
>>>>> DMI product_version Legion Pro 5 16ARX8
>>>>> DMI board_name LNVNB161216
>>>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
>>>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
>>>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
>>>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
>>>>> ```
>>>>>
>>>>> ## Symptom / evidence
>>>>>
>>>>> Failed-suspend kernel log (verbose PM):
>>>>> ```
>>>>> PM: suspend entry (deep)
>>>>> ...
>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
>>>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
>>>>> not a wake src
>>>>> ACPI: PM: Preparing to enter system sleep state S3
>>>>> Timekeeping suspended for 1.384 seconds
>>>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 = pinctrl_amd
>>>>> ...
>>>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latched)
>>>>> ```
>>>>> `/sys/power/pm_wakeup_irq` = `7`.
>>>>>
>>>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i3+S3
>>>>> wake with their interrupt enabled, while #89 has no wake bits:
>>>>> ```
>>>>> #2 😛| ↓ | edge |⏰|⏰| | | ... 0x147ae0
>>>>> #4 😛| b | edge |⏰|⏰| | | ... 0x57ce0 <- both-edge HPD, S0i3+S3 wake set
>>>>
>>>> How did you determine this is an HPD line?  Is that a pure guess?  Or
>>>> did you look at a schematic/trace etc?
>>>>
>>>>> #89 😛| ↓ | level| | | | | ... 0x151b00 <- no wake bits (red herring)
>>>>> ```
>>>>>
>>>>> ## Root cause
>>>>>
>>>>> 1. The external‑display HPD lines are routed to SoC GPIO #2 (USB‑C/DP) and #4
>>>>> (HDMI/dGPU).
>>>>
>>>> How do you know?
>>>>
>>>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
>>>>> those pins in the
>>>>> FCH GPIO register block and **never describes them in ACPI** — decompiling the
>>>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
>>>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
>>>>> suspend, so the
>>>>> HPD edge generated during the suspend transition wakes the system immediately.
>>>>>
>>>>> This is effectively an unvalidated firmware S3 path (the platform ships as
>>>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, so
>>>>> s2idle is affected too.
>>>>
>>>> So how did you get into S3?
>>>>
>>>>>
>>>>> ## Why existing mechanisms don't help
>>>>>
>>>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` — wrong layer; this is
>>>>> not a PCIe PME.
>>>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
>>>>> - `gpiolib_acpi.ignore_wake=` / `ignore_interrupt=` — only match
>>>>> **ACPI-declared**
>>>>> GPIO events; this pin has no ACPI declaration, so they cannot target it.
>>>>> - `/dev/mem` register write — blocked by `CONFIG_IO_STRICT_DEVMEM=y`
>>>>> (the region is
>>>>> claimed by pinctrl_amd).
>>>>>
>>>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-armed
>>>>> pinctrl-amd wake pin.** That is the gap.
>>>>>
>>>>> ## Suggested fix (maintainers' choice)
>>>>>
>>>>> A working out-of-tree reference implementation (clears bits 13/14/15
>>>>> on pins #2/#4
>>>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
>>>>> **https://github.com/Lenart12/legion-nowake** — please feel free to reuse.
>>>>
>>>> Why not use /dev/gpiochipX devices to change GPIOs?
>>>>
>>>>>
>>>>> Possible in-tree directions:
>>>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
>>>>> wake-enable bits
>>>>> for the affected pins at probe (smallest change; precedent exists for AMD GPIO
>>>>> wake quirks).
>>>>> 2. **A generic override** for bare pins, e.g. a
>>>>> `pinctrl_amd.ignore_wake=<pin,...>`
>>>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=` but for
>>>>> hardware-armed
>>>>> pins without ACPI events. This would help the broader class of AMD laptops that
>>>>> hit firmware-armed spurious wakes.
>>>>>
>>>>> ## Reproduction
>>>>>
>>>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake.
>>>>> 2. Connect an external monitor, `systemctl suspend`.
>>>>> 3. Observe resume after ~1s; `pm_wakeup_irq` = the `pinctrl_amd` IRQ;
>>>>> the offending
>>>>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
>>>>
>>>> On the presumption that this is correct about being an HPD pin doesn't
>>>> this actually point at a GPU driver bug?
>>>>
>>>>>
>>>>> ## Public discussion / full diagnostics
>>>>>
>>>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table):
>>>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hdmi-is-connected-irq-7-pinctrl-amd
>>>>>
>>>>> ## Attachments to include when filing
>>>>>
>>>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
>>>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=1`).
>>>>> - `sudo cat /sys/kernel/debug/gpio`.
>>>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_name,bios_version}`.
>>>>
>>>> Where is the kernel bugzilla that you attached all these artifacts?
>>>>
>>>
>>>
>>
> 
> 


