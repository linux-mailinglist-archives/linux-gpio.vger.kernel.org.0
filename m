Return-Path: <linux-gpio+bounces-35209-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN5NKYnt4Wkk0AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35209-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 10:21:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648241892B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 10:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 288853096132
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DCB39D6D3;
	Fri, 17 Apr 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nlW3UgJ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3039EF05;
	Fri, 17 Apr 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413711; cv=fail; b=M/v11ebUeB2T6n5as6wxAmDJ87tYIlzMomcxsQugdMu/OvJOvSo2v8gpnwvZMiet/jt2vauxDy8aGgmuf//pImW1p4oG3UmbMVYZLWlFoeShRtABhy65fX4z65ZSSPiSBi0T3RD1dCdFS0lgx98zpxU410bgLHXSr/KysJnNFE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413711; c=relaxed/simple;
	bh=B7COcZvVHs6sldhRuJ7nC1OoVyu/edorC8/m1kFVQPM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=feuUrZnQvXelFRAnTWq1gU5tNNL6iVnOCBRFreYwdhjqkK/HoWXC/2OZ6ORJGP7kvUfGOsGABIFiVWlYG2vfEWTka+4ecfJ1tEo5LCyfDT46YFMj7oRuaVbB+GT1UXSDwaJ1qFUWbnbvD2Cu5R1YmxfsFGyNMmxWvNPtAIuk8eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nlW3UgJ1; arc=fail smtp.client-ip=40.107.209.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5o0ixoZmNS2HDUNduM80Mj2e1aj2w7r2B4UwxtMqYbObamuuPRgXB9FpKLQa0/XXBp77AshiHd2KeBxrVle0vV6K5/52uRbW9j79lAmFuFI1b/jlVzYBGAJElMkoK1gxd7C+DCYv9uztFmhsxJDitlFR10t51Y96mQ6ATl6fLBhBL1GzwBBQuAuZZGj1fazQ6QCvDkZvqz6Th0N1W2mMVAPIzIRBLv3wB6qxLUlS5ZqQaiSZtexQC+Y7vsQbUIvKvNlcdKGTt9K6veLORM7SInYeWe4u8MFN//wEzLKpKrNxIh7CA4Kpts+MR2BM5QYcl+FTuT9TTEV6fMbnjyQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb9+2MpNJD3XSN0v/vR6Eg53X4On1A3iyb1x0sZLinE=;
 b=czhbDtq3ZmAsWCjEn6Et62b8VX/05w6j4x7TFzmuEmM9qShSWjq4yrQTbSv/l2STRSa75k0B+8L3pfeC8x140xflvJ39tRa6JW7rINJXmRJ5joTN5mZwjwk+GysVZRE08GaEdNYGzlPvfn0Ew10xIZ7O+rTY6dH0nGUen0ywp/I6aPJ3oeTCDImtfO3oPFv9Ov6Tvn3iw3pARzKmtrHNrbBYfNjEz4VEMY26OL62Arwlu/+PXGH3WBjc/X28TdAVOtfzic1AhSljwe3WBGfGWfbbYAWuKD87pKFBPOOah06MKcTvxEEaKAVKk6t7g5rr7fjALKmozkqME6jxPQRUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb9+2MpNJD3XSN0v/vR6Eg53X4On1A3iyb1x0sZLinE=;
 b=nlW3UgJ1Kq0q5n1V8DWEMMiDKWIUef4rpMixg9cHq8DZfKU8MvaSzlt7qsHaAQgRY0V55cozQDB+V6pZHTv5FeoRQTDqQ2qVYZd+5xSIsnUk0yF6iQVsIg9t8VBP8AqVcEQ5xotDuHARy8LmWpFqb67H9yFhoMBFS7qQ9Vo0Q9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 08:14:56 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:14:56 +0000
Message-ID: <061ec440-df74-4b5b-8ee7-276dda6b8127@amd.com>
Date: Fri, 17 Apr 2026 10:14:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: drop bitmap_complement() where feasible
To: Yury Norov <ynorov@nvidia.com>, Linus Walleij <linusw@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260417033439.318930-1-ynorov@nvidia.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260417033439.318930-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF000001FD.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::910) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: a471d0ab-6455-4d58-adaf-08de9c59690e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0xVjVgXdr+T2tUKO/acJp0EblgBnrPtYYebIxfVMWjb1bTX+j+bsASt/FxLgcrostLCkFzss6gb0g7jmrTGnarSw88Aup8lbwbsyqryy92kmO3b5Pt1wUuuLNz+EMbFp6MNQTyvtX5n+URHVgAG6gs3LaeRbZPOYf81cLgSvxx7X0V3iBZfXie+lZ6ZgkK/ZcZRykZxIRn6rN2E06Ir2GRuCoG2Zfi4tZ6UqZoHviLwxJLZtS/7aliuO7IjSG3hMe6DorfRP4eyzYOpBFql/mUNknr2MVEiDIBBeKBxUukSVVgjsU8Ek3yCyKwN0Vbjsdj8z/wLipdGa6kd+W5iT5h64UOeIAnQaJ25sRhl26dqSc/wq05N8BFUsR9R6ZE6bvn0gA+Qx/szPZgiFvP0GvSZMhSxPwXpLXkVlEOvEwqtKcpl7pUD6tbcFWfIoUrP3qpj/n7jP/bld0W1LVrx4n+G6K/mLEDDDIjdgwy8hu0oJ7NNaUlyv8lFdjaMCsuvgpJZSABeapVa5sst4sDOMVN2aX0I9qcFM5N+EkbEWmwpznVSdUd2Mh8lD5eDkEKe0cmqn8B/1a02QtHc2OIsiJhlDjZZ3DswVGiZwioMjDlTsOCjhYwFeXvuHWaH+eAzG5N2u5fEGFe544HLxQWyf0o9Pea9yHxg1HlxKgozjTwskR04GqHGas2joJaxaBMJa4yt7Z9pLETqnUMoFBMoKkLOa9l6CLXH2tLdi70zsR9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SStnTE53WHl2L0t2WTF0RWhkczB1d3RoSlQ0RGlHakxwcVdoU0ttYnozL2NP?=
 =?utf-8?B?bTl4ZUY3N3FONVRWWndPYjhhbFFBRFdJdGtuN2tRZzhSOThCamtyR0lqTHZS?=
 =?utf-8?B?SzQ5QyszTnFYQXkrQUNrWmJpSTl6aFJaL1lTZGcvUjJndFdkQlFjZ2xrd0tZ?=
 =?utf-8?B?OWgrWlFFS3M4Rk1nNUJQWDZYeXc3U1g3QmVWcGViNHFNSkk3Mmtua1crQnhy?=
 =?utf-8?B?YU44REwxTW5iQ0VqMmtJaGkxbERNRy9yM2JHb2IrZWw5WTNLeEtObS9Hb3pH?=
 =?utf-8?B?Rk9XeHdESHlyU2tYUU4wM0tMQlFndVJoK0gySnBTUEtacElkdnJwM3czL3R0?=
 =?utf-8?B?RlAxbVN5SjlYVHRZV0laK2NPN2NSR1d6M1dWSHd6VWR0WVFnZXZIT1VRb2RZ?=
 =?utf-8?B?RVdJbDQzRURvRTQ5YU1TL3dBNERDNzNuSTk1MGZNNE5kZ2Vvd0xWTHlmQS84?=
 =?utf-8?B?LzYvWE5LTURTdldTeWUydlRqTnNPTW56Y0d0OFpFREQ0aWQ4N0t4M1JnbmxN?=
 =?utf-8?B?QmN4SXpsMEgvNkw2NzAxU3ErV3kzdFVEZTk2UDA4SVR3OTRINXc1djEyRzVX?=
 =?utf-8?B?L3VlZDlURDhOMGJzLzI3VGNCSkpIVkJGU04xMnQ4cGpCRXFROFltbzNUNXRF?=
 =?utf-8?B?cXBPTUhPemFXRkNKNDg4S3VueFBNbXl2Q2hNZlM3YUUrYjVoU0ZtTHF5cERP?=
 =?utf-8?B?MVV1SWw3OTZqRmdCbGw5MWMzMHE5RHhlbWlNYlBwdXoxRGJ6OGs4aVRiREd1?=
 =?utf-8?B?Y3NPQ0dKR01wQU1QWkgyWkRoSWxYYTZIWTlabEU5enMxcythbExWbjlZeUti?=
 =?utf-8?B?ME5ydStxREErV3drdEhXNzFONFNkTU9NV0dVbkRlY3BYRGhNTVZvU08xcWN5?=
 =?utf-8?B?cXRTZEg2ZDhYYXNTSlU0VGUyY2VTVGx2Kzd3bWRSZzhSM05McDllcEMvSzFs?=
 =?utf-8?B?dlVsck1CbDBlbnVIdnpOa2xvQVhTR1JhVWFmUCtmeWYrbVo1Y1l6Q0RpL212?=
 =?utf-8?B?WnUvZjVKY0RFaUlSdWs5b3BCQXcvYzF5dWc5YUwzOUxyMGpGenA4NmhrU1ZU?=
 =?utf-8?B?dGZyNi9UdEpEbkh3YTIrTGVHV2RuS0Vaa2pwZXhvNDJnQVdaZEtDZEViRjQ3?=
 =?utf-8?B?TGVMSVZXR09lZ3oyNWVsVjQwcVVBU0xZOUtpejVXS0E2Nk5YaUtocUliajBX?=
 =?utf-8?B?TEwwMytqRkZXZFhyTGZzN1dwYWJyL0hIS0IvWlYyTXhNUDA2SjFsSVdXZE81?=
 =?utf-8?B?K0Yza3VMblBVbWkzNjg2QU5jT1B3cENuTUNyazdUZms3RFVJV2Z2ZTc4WDVE?=
 =?utf-8?B?Tktkck1jS0xvRkE5MUdpT2M3NHhQSk56Zm9tempZNm1ZM2pWV3NjWEVIYThO?=
 =?utf-8?B?dlQzYytxckdhSVhrSFpiZ1pQcWtvRTZtQUNSSmt1dkZ3R3pUaDFZamo5NVBP?=
 =?utf-8?B?NHJLWEVzUmhMR0dTMTZ1TitlclM1WFpHMll3b0RLZ2hVcW9qQVRMaHFKN2hD?=
 =?utf-8?B?WWppR1BPcGJHNnpvTUpPVTBNYU8vdUtoL0lxbkthQ3g4YzluOEJzQTY2Vmhy?=
 =?utf-8?B?NXBCL05zc01LUCtqdGZBeEFFTnNGWFYzZTI4cSsvaUw1R1Q2em1xZTZXdE1o?=
 =?utf-8?B?aytCSlVLTldCNnkvQkFjcDNLMGc5dVZJYVhrM3JDYnI1SmpGTFlDVitoTDE2?=
 =?utf-8?B?UjEzWWNvQ0tBVW4wQ2VPWU9ubmtCeUNUNFJ3OENUZWI4ejhpblBsTmVsMDgv?=
 =?utf-8?B?Smx0czZyUHpINU5BWGFuK1o0Z3lxVW1ZQlVyOEU2MWF6aGVEZTBBU1NmSXEw?=
 =?utf-8?B?NVlvRXVHb3BENkp0YUlLTjRvVU9OcUw1T2U5NEg2ZUgxZmJsaEg3ckpWTGJx?=
 =?utf-8?B?ems2RjY1d2lRQzY0bnBNNkJhUTdQRHlpWGJXcG9BbGZYWFdLNzQrWGFQbXZT?=
 =?utf-8?B?eDlFWHhRNWQwd1dpUXRtTHYreDVjYWxQOWpoMWI3SmJCdnZxMGxhSnVVRmY1?=
 =?utf-8?B?OHA0dzdCUzEyRGVRWEkxNjBEYnk2dmxnWVRQOEV3NVo3NStEUFRiazFrNlJn?=
 =?utf-8?B?WW94WVF6NTNxKzVMRGN5a1FoSGNHNzhETCtOaVVHK2F3VVcxTnoveWxDSlV6?=
 =?utf-8?B?Y1hBL1hpQ0dEUnVjeGdJV2pnWTdmYkJQbllYVTRNTzVzWXRSR1NUWk1tbGUz?=
 =?utf-8?B?N2MwdUN6ZDJPN2xJbklKdCtmTlZ2N0JwRlAzS0V5U2VUMUx4RGpldkliZTN2?=
 =?utf-8?B?eGZFNm40VnJoTlNYWkREWDdFQ2FrYStFSXVKdkN5a0pJOWhnbyt5NUMvZkZH?=
 =?utf-8?B?ZjROMHUzRnJoTUplVEdqNmxxbE1TQ1BIRFBwaXZ5YnVZaGwyVlFBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a471d0ab-6455-4d58-adaf-08de9c59690e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:14:56.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VR/9FxqR3RNzDWK6s0IDd01+69RyaDRhfOm04tjXerar4izjorJKTLlzEXi55wG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35209-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 3648241892B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 05:34, Yury Norov wrote:
> [Some people who received this message don't often get email from ynorov@nvidia.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The gpio drivers reproduce the following pattern:
> 
>          bitmap_complement(tmp, data1, nbits);
>          bitmap_and(dst, data2, tmp, nbits);
> 
> This can be done in a single pass:
> 
>          bitmap_andnot(dst, data2, data1t, nbits);
> 

s/data1t/data1/


Thanks,
Michal

