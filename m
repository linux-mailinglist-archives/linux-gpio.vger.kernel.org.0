Return-Path: <linux-gpio+bounces-37064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD6aFYgdC2o2DgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:09:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E356B56E60B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F19213025F4F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354381C5D59;
	Mon, 18 May 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xE39+DM0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7E36D51E;
	Mon, 18 May 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113317; cv=fail; b=g7+RaYrkXHeYeFHmIRFanD6IJWiyfY7zbzdEUl0RPyWtXAuyhE5d4cgSu8FqA74BL1UBdnasPNCxf8itY9fmPdMt19arK4y28YrlDTjezThHyj/E7eWD3tYxXHtA052gEgCBH7eXLkkIoPTdl952NZUhFx0g++nUSSdH0MruPoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113317; c=relaxed/simple;
	bh=Tiw66ytYJKsuX4mMxsy/AJgEKTD6eCQCHb762c4gQRU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JWAXMx5PAjm7iirOPGH+InzRZGCEd1MLtVASrm2HbntI5ne0H92VbZsHRyWND+9QqdS1u9SZaiH66RM9QEplZeivIy7itCRrOK+KLBVfEe8FEboZ3TATnHkY7Y15qrS+km/SiTyW/3ZWnjuTFVjSFTGWEab4WD8GAPvZpuJyadk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xE39+DM0; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTHhd3YfdkioggwSOIq+2jqYywckXc6Bj1KE4htkP3bnqYqeeHZj6dH/N/OC8ZIH+3ck1pli7Li2lmOmgocxj883YbKSOm5UdHBewEaufxOayGeNTBCqUtF/qx2IZMxpyUglG+bckO2iBlYdIZNEy0djZe46A0YLJ7iJUExIWmntSPhRsnad/sHqUd7gePAKsRmBEPXpqa5KeMk3pG7UlSJuEigQpA6sPpQjxfVwZFpB81HwxTx0dkenbvRPlyYO9ER1g7FDCFXw8CYcBI6ECwTtCKTJ+tS37bliQhO1sgKt968bYZ1ef3RRXgiM3ZL8gW+8TAXl7hZ9ueSrVzhYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxDnfh2D0YIc8BqagSjuhydQ/U5uh9Su8hYR2WV6E4Y=;
 b=TKmio7ccoKpzVzUJDBF17V5Yu/ATiVUuxy7lg6vKU9LB/Ovyan7+uts9IUglCgcbegfgd0LnAo8cTBIVOKTEmmYU4pTT6RKIHXA5PHo5c/k4dD8RqCDYIsasm+x03OO9C8RxF97aW4NigiWh6Y+UOiLuHgXBb8lKt9Mnra/gvi6MPV7/v5w4qqZrL+eVPrrtbsstwLlH5m3vhUaSI6XMhws7CYxPF/miisYik+0qw59GD/FU2ClV13EcFlAY3YgEWDaq9eTXJn0QU3FZiIcZMjpYFhnnmjmk5lOrCI3wYHZbOpK0McWqKFSLDYfIT8Tdy3SRloNjawKTwNA2O5i9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxDnfh2D0YIc8BqagSjuhydQ/U5uh9Su8hYR2WV6E4Y=;
 b=xE39+DM07HxK9KlqAgnsAAU2lI40XacKlF1hh0YarSidNlCWe9yEmSbvQqQrOhQY6uuPQ2X7HH+i695nuPPCNEmtMfk/r47mo8QKVt3A+OaCf6gsbbVb+ufEB1wM1NMsMJGCsT7U9lCya4crCpU0/aB2g2RKVMVAp9MvxTbkCGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by DS7PR12MB8324.namprd12.prod.outlook.com (2603:10b6:8:ec::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Mon, 18 May 2026 14:08:32 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 14:08:32 +0000
Message-ID: <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
Date: Mon, 18 May 2026 09:08:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@intel.com, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
 <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:408:e7::12) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|DS7PR12MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc7a903-c4d2-4f05-99e0-08deb4e6f18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eC6JTZt5qHSU3b/wkzSUrnP2bi7fTrar54EJjNodF7YNt07tfB26b5b/isdmv84XzCiH4o13DR9rM0C/Q3V8Z4I0syUSVLPgbdJXMKR2H8nZ1R/KwO502qtTpvyzgzN717sEs1mFrTTZ5+VOpwHtCisUvxPTckHML+kNCJfiNmF809Pe5c2UofArqaiY0TTQDihz3fMSw7y329OP1I7wbRaCvthA80s1KSNBMy7Z/C9bDBMGtNjkHcIxoRuN8nAthZA46zQHSKMnkxJ6UC85MZSi6lQdirMvL3zI0rud0tw4D4GrJEgKWiacCtCf7AF6SGHberkynxY41bJxwBjorq1ZHE6d95NEOqHOSRHmlH40bP+x2xb1M98y7QEo6rm9eJ5HowZrgiYePE2JzVhc5XTPeZG+49O8eTVzhgKepz8www5FJFYJFk5aNH/W95QHF8RUAASh5Jvg82Ehb9lO400kiQrEG/mNgA7OP1EOPrWE2AQ+sr+8AyRJPy8DvUnQdJFc8EhVNIPTBVsXcJAFwZ4M41A38MSB4lSWlEmYJoKeOL5MFNMw24opWCPhYz58d0gg6ml3zFul+anGPAZPJC9/fajFtwWWwbbRanaJNCIUhct+vv2xzFYjTrGUURVY/+bGGt91aEPhuA4tBeKC9w+uNidJ3pAgOfiXsoZe/yDrUNqqZglLdEIerZXkEdQM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THJEdjlGVjFvS05JV3pmOUpFSG8zNFllUUpRU3YrZUFqaE81OTEwSXd2UHE0?=
 =?utf-8?B?OHprR3o2YnVybVhxdlJDSXVHVG1zOGY1cVNOSEpCRW44cTN4N0wwbXUrSkVn?=
 =?utf-8?B?WDh0OHBvcEZLQW1xSVlIM3BPOHdRVU1xallzdTVjd1JGK05DZ1BsQ3NGbHhK?=
 =?utf-8?B?dUt1L29MZUpuZW5TeHZOYkZWcGJTYWoxaW5jUk5BbHFKaEg2WFZIWU1ZRlFv?=
 =?utf-8?B?VG52N2xjOVJhcUtKb0dlTVdVNk9ubWZEZzZyOEVCanhLTUtuRFNGa2hhWWJh?=
 =?utf-8?B?T09xMjdWNnNJa1VKMHV1U0xvbnRpRzl6bGVaSlpFVUlFZk1PVkpSbXpGd2h6?=
 =?utf-8?B?VGFuaHNHa0pYcmZXdVJIOUFLaDM3bzNpTlRUUVI4dXNEU0RWdndoRU5WTDIx?=
 =?utf-8?B?MDk2UkNYanpxS0tUYzcyb3B5WUVZR1VPbi83NTVZaUlibWlTa3FqOTF0aE1I?=
 =?utf-8?B?Y0V5QWJld0pCVUVxQmh6OVAxcXFpLy9NZi9USldSYS96NlBaKzhKdnRXT3JJ?=
 =?utf-8?B?UFNBWnU5NGVRbHlRVmw2WUVGb3FqYVV6aGlYRVIrb2NTQTY3MkxoL2wybm5a?=
 =?utf-8?B?MVppYVZneUZWcDZUNnRjemtJZmw1aldoMGIzV05yNzg0cGgxWGMvZ2YrbitK?=
 =?utf-8?B?LzRYY2o2Rjd3anl1bWloV2JzcnBEelZCYlRuTnpkL3IzV3dNZmF1cmhqaUtq?=
 =?utf-8?B?amozOEJrRGVGa0I3eWNQUmxQQ056UnRTUXE4OWFvbVVtanVtaG5kZXlFS0ZF?=
 =?utf-8?B?L3o4Q1hFWjhlbUpCQmVLOERUR3piYzE3cXM2cmJoZWk3L3FyU3pHVWZVUUZC?=
 =?utf-8?B?K1I0N3lhaTMxWWlTL1NFMWgyaWFObTZPM2ZBUGZ0Q0FWNkYyWE1UQ0FSL1BG?=
 =?utf-8?B?MnNFZ1BLME5iMG9jeG1sb3lwcTZVb2Q0NUlBcEoxWUxCWkZLK2NXWGN1Qytn?=
 =?utf-8?B?cVNBUE5qQlZIdkQvTjdhcnhDVFVtbXpLcVJROWFaMjRjNVBabHdXaEFhbEJk?=
 =?utf-8?B?bkVBd280OFYwbkZFTHBQWSt2Z01TdERva201QWMvZTVYS0R2dVRQNmFCWWhY?=
 =?utf-8?B?c0trOGNZaUVqRWdkS0VNalE4c2pvOEUwTi9xNEVCR25DNmN1Y3h1NTE5dW84?=
 =?utf-8?B?YjJVL1JaYnY3OHRiTDh0Sk5aRjdxZ3BKTWc0V3JFNVdDMUwzSGNSZDFrclFU?=
 =?utf-8?B?WEdwRy8xZ3FaM1orcTl4L1BpTFdtd1NLVUdRQjU2ZXBFMysrMnA5K1hkckx5?=
 =?utf-8?B?SzVpdFljRVJFaENBMTB3Nm9yZjFBcUY3bHluSjlkMXJDLzdKWUgwWHlRYy9S?=
 =?utf-8?B?U25jc0dyeXFMd28xazVDZGRsSkMrMUJtanlHWXMwTG1kMGY5VEdsUTRzdloz?=
 =?utf-8?B?bHhnbnhiZnNMRWdjZGtrZFByWkRoMjNSRTVNdHFrZkYvM2VTRUt0cDZoRmhl?=
 =?utf-8?B?MlRaak5aY2VIZHZiUFQxWExxZjV3N0ZuN05EVU54ZzYzOGpWU0JLbFRZQjZQ?=
 =?utf-8?B?Ty9xQlZDYWpaSE91dVEzWTRSM0JzMW1EQStZUnpUWUpvbGJoWnlYYTBOcmd2?=
 =?utf-8?B?SkJDUjN2YnJXK0FINDIxVmFsaXd3ekxwL1ZnN1dlMmljR3A4M3luSlRsSmxt?=
 =?utf-8?B?NWx5OHRUc1ZMejJrTnJzdlhOU3FNKzhzR0wzaXN0YmdOM283QzZ2bGhISjlp?=
 =?utf-8?B?d3dqa2huZ1p3VnVsYngwdXpiamRSdDFTUWEwOEROSnNrYUxiT2thclFHRlFj?=
 =?utf-8?B?eXB2UjBjc0ZNTnZTUklMdFcvNVVoUFRqOThnRG4rV2ZDOUNqQm5LaklCN28w?=
 =?utf-8?B?K1pKZlhYOWVUYy9WUHBDY3g2TzA4aDdIVEFZUzFRN0RqeDN5SGRKNXZFNFc3?=
 =?utf-8?B?NmdvcjFPTHZFUU9leVAzQ3lxOXZxS3djNGFncHZTWG8wYjh2U3hlWVNvMVB3?=
 =?utf-8?B?ZnZ4QitGOVNITWVmQ2Zjbmtsc2hJL2lUeURTTHdaTGpwR0FXaEVqNEJXR0xv?=
 =?utf-8?B?cVdLUVlnRlBrRGV2aUw4aTNiN1ROZXNNV0tUUmFyeDJOcmpsZ3JISFU5TXZU?=
 =?utf-8?B?cVJXbW5QYnJxeDZYSzZxY2Via3QxbGgxWkxjcUVuUlpyd2plY3NYQ0o3WnUv?=
 =?utf-8?B?WHVXaE9XVTVSQlRtMWJRZHdZazV4RUV5R0xsUGU0VkdGZHZ2OUIra0V5a0tX?=
 =?utf-8?B?ZXI4eFhOM3htMXRSN0NLOWZNUDd2c0NoQkltZE8wQmdzQ3RMV2tHVUlEanBM?=
 =?utf-8?B?RUthRG1LT2NGRCsyejY5aVQvSnRoZVhUVW9ObHhkYjlLSkYxa3hTSE1CM3Vq?=
 =?utf-8?Q?M7X1GCrG7zajIWatQC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc7a903-c4d2-4f05-99e0-08deb4e6f18b
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:08:32.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh/x9wGagYOZAxAxyETGSn9ga5UnSDIBAZGhzhWLHwQ4ldvlCyIJcK3Etp0Bu7u+7zNPW9nfzaDkV+HGhBoiAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8324
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37064-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E356B56E60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 09:05, Bartosz Golaszewski wrote:
> On Mon, May 18, 2026 at 3:46 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 5/18/26 08:40, Hardik Prakash wrote:
>>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
>>>> I'd still like to avoid a quirk if we can.
>>>>
>>>> I know my proposed patch to try to probe at an earlier stage didn't
>>>> work, but could you perhaps try pulling pinctrl-amd even earlier?
>>>>
>>>> Maybe fs_initcall()?
>>>
>>> Tested. fs_initcall + patch 1 still produces the same arbitration
>>> errors:
>>>
>>>     subsys_initcall + patch 1:   arbitration errors persist
>>>     fs_initcall + patch 1:       arbitration errors persist
>>>     patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional
>>>
>>> The initcall level does not appear to be the determining factor on
>>> this hardware. i2c_designware is still probing AMDI0010:02 before
>>> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
>>> The explicit device_is_bound() deferral in patch 2 is the only
>>> approach that has worked.
>>
>> Please try arch_initcall instead.
>>
> 
> What is blocking the pinctrl driver from probing? Does it return
> -EPROBE_DEFER for some reason? Pin control core is ready at
> core_initcall() so it should work in theory.
> 
> Bart

Currently it's module_platform_driver() IE device_initcall().

That's why I think we "should" be able to move it a lot earlier.

