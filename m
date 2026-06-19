Return-Path: <linux-gpio+bounces-38708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XH3ICUQXNWqJmwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 12:17:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 890BA6A5292
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 12:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=D5OoppST;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38708-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38708-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EA533017504
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA2A372B31;
	Fri, 19 Jun 2026 10:17:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011032.outbound.protection.outlook.com [52.101.57.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F531F990;
	Fri, 19 Jun 2026 10:17:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864253; cv=fail; b=EiXee7aKWz035GEmjUPwajIaLxi4SmQWPt3v3mXBD/gD4yx3MjvRn11T66nitzNRqhanE8qUySmG/zZxTpe+KWzDAkovqsEoysLvBjf0clgavP0y1cR5/sLqlaSw84AfPQJ6aSjN4NSSDJT2bGz1j8FOcd7KLonhBJvAPYRiXe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864253; c=relaxed/simple;
	bh=bfqLR1Hi7nAbAq/Pxcg34g751//IsfjrH6ROlVSeIns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T8Rwqs0dSdCA3Uq6fsmSjITpxom/VM+sJ1aPaMz+KfaFQRhkBzJ0Zpy2JkyvGW88/S7YdrkdksKmT9RuuHEJigPSTIxVUWjmTMMNlsBiGGIlyaFPRfYggAmDMRdUtxLMngXUlNwFEJ9ZSz0dI6has+TMAHB+sBbOVaIOyEUH7MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D5OoppST; arc=fail smtp.client-ip=52.101.57.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnSRAkhnR9yMpfPlDUIPAt79fSIzjrFaLUqkSUFHRAfpwD0mg6yL5nXNZcR9YfQaoAJkJ249qMRl4zAbOPy9EvyTIkZktVYinndU6yoDVRMK8t01ugYUErN640BVKmMvxraWhnIn39zPW5KUkasZdE6+luPLD27HbP7tEK/b8/QVQIDy+BuSLRA0C5YnNKaeQ1WGt8WTcsJ9qIRO24uriRr87IoMH5hWBCnYoIrPSfW2q97MSgp3C8QCzX3XpwFcaMxSKATQqYpKYD2fEiZkfB3AZyPTYueVNt+2saxGU9F/nsY6KgpyDNvHtdgkHU6VWKNejYIudQAupM7b34UIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E41Bc/u3BnW0JITPPfUJKDwbbVKDiw+6QraUig9GXkM=;
 b=gMD7LHOInIZ7du35qB1SoFzrOLak+38N24sn2mWOKt4nmX9mq6LJDs+C0VOKD0H/ukak7L1Tub6xgl2ny+wh+i09EqrRgX5FF5ZYV9Zs8yU9jl5X3N+nIbe9RWJwdHmf6bpsL/HfD4JxsasmSbbK8leFx1RPFekPo9jgkgvSMsu/qELpmPgk5In9cb2Cs9pwQANyYQx6Kts/OoZ/T9xXN3oyN5DIQftNbEn/xeZSaN7jm/qAhhaL+8ODazEiKXoAdx7Evx8wPXCeYsc8oZ+Zvz8SFKETPsYLRQZP4iTJBsZ/Tbd+hS+eSTNZL3wEfoHHrFnsS8J7kENFHRha7J4WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E41Bc/u3BnW0JITPPfUJKDwbbVKDiw+6QraUig9GXkM=;
 b=D5OoppSTXGNSaKKeBtyEAFXX+Xr84WTb3RevL77dyPfq1mLJ8pJ/LIzMyBkLTxJhfVW173R4+t997zy2bBJco24f4XLsnhVO1B+J927GcS+dhXfBHbeSmcxcvnzxg4RUhJK2m+yEWcJjtqvkyf9jZ7i2WRajdS8jm/A2MHjE3iw=
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 19 Jun
 2026 10:17:24 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:17:24 +0000
Message-ID: <9643455e-f4ce-4496-bcdf-1122420c18eb@amd.com>
Date: Fri, 19 Jun 2026 15:47:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
To: Marco Scardovi <scardracs@disroot.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: w_armin@gmx.de, brgl@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, westeri@kernel.org
References: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <AeA8zl9ySbqIYxvm7aBj4Q@disroot.org> <ajQyhOuvripaiXEq@ashevche-desk.local>
 <_tDfR2zvSRyshOH99j8NCA@disroot.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <_tDfR2zvSRyshOH99j8NCA@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0354.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::8) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9d4b17-dae5-43fc-2357-08decdebf48e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4133799003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1D34Kh48f78qJgrU/mcZlNoPOt6AB7JqnMi1+odiZ8NzF8Saji4fOZaJipkU5JmuUPS7yLhafiFKxXxYZmJzF9k4Z1VNJSu6Qfdmx5NlQroNGwQQiWbicJYfYyZWzIJIlW6zyhyvz8WzFCChfx0xNL1LCdv4dEkjGgIHe4PcSSJI57a5jvfxIZt45noK+fjGhlBBtJnNZM2BdXg+XkpmJ3X6taLuwx7+Zlq3qc0OA7gV3oN+lBfmT3vzpz6BDs1A2q6ONlqXMDT9J9FGpXpwzeu89VSRvmUmOLO96Aixz+rBtqnykXwHbmWhe0hdXOIR6K0Xh9IKJl8wRqlNoXy7jzXeYA6RihDI8h2uDtR+wdeaTI8Idaelgacl/LTnjsSAf7dz2U03VIp3jMUGblaHmv3XVaFjt8pRMJQb+95MCE5x21f9llBNzjQSil/1iSa7NoIMipo3BRGG+88LXRRmZ8pB1EN8WIyETlBzy4UDTC3+NRamuEq8B/T8dzklV2bQ2PwXuQp7dmDi7CjTwa+rXIFYJN6h+HNYEav6H4+VJrCZ+23P/h7oP+G+D67mi7k3uxYS1G9nBcM6brtmEZ683R97I54Fh1YCfIJEAOB3BRdQk51ib7vfUbs6/nxxumpx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4133799003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZDN1ZwVnFickJmRnNWRFBxMUhxN0ZXUlFObTgvTXBFYTZ3L2JJa0xlTVRW?=
 =?utf-8?B?bUVIV1FFTGJDK093eFBMczljL0Q5Syt6ZEhqU1RiR1crQUFmTnVJQkFKOTVF?=
 =?utf-8?B?eXRQYzBWN1c2ZVExOFBXdnZTOUpZT0p6aFYxWW1RZzZHUmc1SHJjaVJZRGMr?=
 =?utf-8?B?RXFPMEpjTCt1STZwSHdNVkVuM3hlV0lraWtLcmNKTzljM3VkT3NXcXltcFk5?=
 =?utf-8?B?dVhzSmxBWGlndnNkNWZWeXBIb1NabDlKeEgrMGYwdTZ4ZXdLTzNocDI5MWt3?=
 =?utf-8?B?MUtYV2ZsOGY0M3YzUWtaQjF6ZWZWaTBkbURKa1lmVjB1MEVRWFRYeGkwMEpS?=
 =?utf-8?B?U0ZxdFQ1KzV2R3IvaEFPODZObkhpR2FhaEg0T3lHS3pIVFoxd3pidCsxemxT?=
 =?utf-8?B?RThNcytpbVlNOU53bWljSktzVUpxL0ptTVZyY05wdm4yTlMvVFl0OWhGQUJ2?=
 =?utf-8?B?aFJYVWRKcE5wSE1QSVE3b1orbHVyeHdRdFVSMmNvbEYxM3h4MXBnMG85ck9n?=
 =?utf-8?B?UnZkNkZKV3Q3b2tBYWxOSndIdTU0bzFTZXFEdDVQOUsrcTE2ZUd5WUVrWFMv?=
 =?utf-8?B?K1B6QUpMcmxZb3l5T2tkeGxYdC9JNnFhUXNRcDFjNXdSTndqVmZ1OHZQcGpa?=
 =?utf-8?B?MVRzeEd4REtHbHFIZXUvSkJyeEJEUTBxVUVQRnpwTW8zSWZjNDhDRWFRSHZx?=
 =?utf-8?B?WXlaM0VSY1NTdlppOHNuU2lBYlRsLy95RU5kVGc1M1lFY0JiMis5b09WMzM5?=
 =?utf-8?B?LzhXRUliV0FRaWJ0Q3VVT0NqMG1lc29oWUo0NFRydHU3dUVNY3lZV2FkUXRD?=
 =?utf-8?B?TlF1aUkrcHVoblRkM2NUNFp5QzRnR1RnZ1dCaVV3YlJDMWNxWWlIYnpualBs?=
 =?utf-8?B?azNyMEhoTWw5RVgxUm1zcmphelVHU3NURmJVRGxSSlUyMHVNU1hlZWp3Z3V6?=
 =?utf-8?B?bS9STmRWY0xsMUlWWVlnTUU1M3BvYTM5MGo1clBtRDNZblZ5b2UwL1lseWVH?=
 =?utf-8?B?OVlvVjR5dktxVTMvZXpTdDZPSTluaWY0QlVLNkYxVUhzZVlFeVQ0S21mQTRL?=
 =?utf-8?B?dVNNNDFDelhTOXdBQVZtQU1lVEJ6M1A1TlQxRUtRd3VjamROUG9va3dMeG4z?=
 =?utf-8?B?OWE0K2o1UG51Mk5BL2VjNXh5RGFyWFh3Q3hYUUFLSkw4eUJVdWdCa05MN3NK?=
 =?utf-8?B?LzV0SXJLV3RIWmNManlOVWxuRXZDc090c1BEMStGcEZvMEZwcWdoV1pyVkRC?=
 =?utf-8?B?K0JhTGdjL0kyTERkK2ovQ29neU5RcXJrSnNlSzVyK3FKdm1URkgxTFJMbGpN?=
 =?utf-8?B?S2FUMXg5VDlCK2RkWUV3WTR5UWJ1R3hIeC9MUnQvaVFrTHBLbGk2aXdLMU5W?=
 =?utf-8?B?Y3c0VHZBQlZJK0JpeU5IUkR2QUMxL05tWTg1OWRwUDZES3dFZ0J2VVRuanNO?=
 =?utf-8?B?eHpWYy9lY1l1VnFHLytLZFlnMUpiYjJmMmhWYkptS0NHSmljMXhpMzdZZWFy?=
 =?utf-8?B?VW1uMVdmTVllV21vT1JSN0RsWnVaa1VGWUVFb21SNjFqd0pPSlRUZ1k4TjJl?=
 =?utf-8?B?T3VFNXppMmlkSDVncFN0UVQ3ZER1OW40VGJNeVBkcm9pSmFGREwzRjkya000?=
 =?utf-8?B?aTJObDlWQ1hZVncwZTMzaFE4NlQzbE5SNTlKT3UyWU9ya1JnWVNERjU2Z2N0?=
 =?utf-8?B?am41SjMzWVMxVmh4ZjI2MG1iZ3dUYk9JaG5IZGpIZFprNzJsOWlaUm9EUkxI?=
 =?utf-8?B?QUZTV0o1QlplS28xc0MxNFFFOGJRSDE1N1doYXUxb3dZcTIvdXd3bElzcS9w?=
 =?utf-8?B?bWN1cUFudEdJZTFkVzl2ODJYWDh5d0pwTFE0Y0svVVB3WGRISXlKQUNzK3hX?=
 =?utf-8?B?WWFwc0RKVVFrQ2tab0ZPNzVUS08yekQ5NG1EOU83aGZHRmxZbU5kNUJwVTMv?=
 =?utf-8?B?dzB0R2pZYlFPSmR3UDNha1YvcGRaRUpOZHRLTkViSlVSK1RlQVUwMGZXZzZl?=
 =?utf-8?B?K3BsZVg0d3ZLeG5qTUpreXYwRU1hWDhYMnhDK0VkVmdlemZURmhhMU05UFBF?=
 =?utf-8?B?dFNCQmRBTy9IU01JSE9YWkxmM3NFbkhCeXBXN2JWYUxXbkpNODlhdmFxWXg2?=
 =?utf-8?B?Vy9VWUZET1NEWmxDSE1kUFZGZFY3eEJFQ0tTWS92WTR3aVhIMkJnSHA1aHdG?=
 =?utf-8?B?R0RycVBYeWRqa3JnTm0vTERvbVpjSktIOGF3akYvQmlEMW5Ld1VOTmh2Qmc5?=
 =?utf-8?B?anh2dTJIdTRhQVdURWdLUnNVUmk4eWVxb1l4WERvRHcweWZtczJybExXOEt5?=
 =?utf-8?B?Zlg1S2ovMVFPM3V4SkREOThMd1N3RzBWSGxDbUhVWWRXcmhHNkFmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9d4b17-dae5-43fc-2357-08decdebf48e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:17:24.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvPMF47EudD5jrRz1qayCJs4tYEYP5O5UD7P65TwV6KON+altiN362VyqOgOty4slWoUVTQsy9su7mon6tnCWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,vger.kernel.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38708-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bnatikar@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:andriy.shevchenko@linux.intel.com,m:w_armin@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bnatikar@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 890BA6A5292


On 6/18/2026 11:37 PM, Marco Scardovi wrote:
> In data giovedì 18 giugno 2026 20:01:40 Ora legale dell’Europa centrale, Andy Shevchenko ha scritto:
>> On Thu, Jun 18, 2026 at 06:59:15PM +0200, Marco Scardovi wrote:
>>> On Thu, Jun 18, 2026 at 16:35:37 CEST, Andy Shevchenko wrote:
>>>> On Thu, Jun 18, 2026 at 06:46:28PM +0530, Basavaraj Natikar wrote:
>>>>> On 6/18/2026 4:44 AM, Marco Scardovi wrote:
>>>>>> On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:
>> ...
>>
>>>>>> I have extracted and decompiled the ACPI tables (DSDT and SSDTs) from
>>>>>> acpidump. You can find the raw acpidump.out and the decompiled ASL
>>>>>> tables in the following Google Drive folder:
>>>>>> https://drive.google.com/drive/folders/1aTqLAnUhrTsPdpA8tfOFyRopG3P3DGnc
>>>>>> ?usp=drive_link
>>>>>>
>>>>>> As far as I can see/understand there is no _DSM method defined under the
>>>>>> GPIO controller device (AMDI0030) or the \_SB.GPIO scope.
>>>>>>
>>>>>> Under the _AEI method (defined in SSDT9 line 188-193), pin 21 (0x15) and
>>>>>> pin 24 (0x18) are defined as:
>>>>>>
>>>>>> GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0x0000,
>>>>>>
>>>>>>       "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>>>>>>       )
>>>>>>       {
>>>>>>       
>>>>>>           0x0015 // Pin 21 (Touchpad attention line)
>>>>>>       
>>>>>>       }
>>>>>>
>>>>>> When triggered, they evaluate the _EVT method which calls:
>>>>>> Case (0x15)
>>>>>> {
>>>>>>
>>>>>>       \_SB.PCI0.SBRG.HNC0 (0x15, Zero)
>>>>>>
>>>>>> }
>>>>>>
>>>>>> Since Arg1 is Zero, HNC0 executes the Else branch, invoking M009 and
>>>>>> ATKM/ADTM, which stalls synchronously for ~36 seconds when executed
>>>>>> during the probe path at boot time.
>>>>> I traced the _EVT for pin 21 through the dumps:
>>>>>
>>>>> _EVT(0x15) → \_SB.PCI0.SBRG.HNC0(0x15, Zero). With Arg1==0 it takes the
>>>>> Else branch: M009(), then Notify(^^GPP0.PEGP, 0x81) "Information Change"
>>>>> to the dGPU, then ATKM(0xC0)/ADTM().
>>> It seems I have much more to study about ACPI Tables. Sorry for the confusion
>>> and thank you for checking it out.
>>>
>>>>> So this _AEI event is dGPU/graphics‑related (it notifies PEGP), not the
>>>>> touchpad — the earlier "touchpad" characterization is incorrect. The
>>>>> touchpad (TPD0, _HID "ASUE1416", _CID "PNP0C50") has its own GpioInt() in
>>>>> its _CRS on a different line (pin 0x08, Level/ActiveLow).
>>>>>
>>>>> The ~36 s stall is consistent with these synchronous MMIO reads + dGPU
>>>>> notify \running in the boot probe path while the GPU isn't ready
>>>>> (no explicit Sleep in the path; a trace_method_name on HNC0/M049 would
>>>>> confirm the exact blocking access).
>>>>> Either way, running this AML synchronously at boot is the firmware issue
>>>>> the no_edge_events_on_boot quirk works around.
>>>>>
>>>>> Could you update the commit message accordingly — in particular, drop the
>>>>> "touchpad" wording, since pin 21's _AEI event is the dGPU notify path, not
>>>>> the touchpad?
>>> I'll do it. Let also me know for @Andy request below.
>>>
>>>> Thanks for the details! The crucial and most important question here, is AMD
>>>> going to push OEM(s) to fix firmware accordingly?
>>> It seems ASUS released a new BIOS update 2 days ago specifically for my device.
>>> You can find the new acpidump here:
>>> https://drive.google.com/drive/folders/1PYmF1R9n-6vHJVSH8bzEPZhRgdmBBJlT?usp=sharing
>> Have you tried it already?
>>
>> At least the DSDT has neither _AEI, nor ActiveBoth for anything (except speaker
>> device). Looks promising to me as a fixed version.
>>
> Yes, it didn't solve the boot time problem
>
>
I also checked the BIOS 316 ACPI dump — the stalling path is byte‑for‑byte identical
to 315, so the AML is unchanged and it'll still stall if pin 21 boots low.

On the OEM side, I'm connecting internally with our AMD contact for ASUS to report
this behavior and follow up on a firmware fix.

Thanks,
--
Basavaraj

>


