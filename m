Return-Path: <linux-gpio+bounces-38285-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qrC1HhrCKWpmcwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38285-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:59:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682566CA66
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:59:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ZlQh9JjH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38285-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38285-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99B02300ACB8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F3D37C10D;
	Wed, 10 Jun 2026 19:59:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6F37C926;
	Wed, 10 Jun 2026 19:59:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121561; cv=fail; b=Hy3hzTy0POq+oPqpGWVpYFXFLzYQHBh6K7CFaWNIewYiSagcMw09vM5HIg/LbTzD+ej/HYUYZL82BAM5QLnqvoDmNjjOQIbnuGkTiR3o4I7xDBTOC4E3vYnwZTtcjk9f3/cjD3D1+n/oQb5g2fbaSWOpj+re+imlIIzlrC9Ka5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121561; c=relaxed/simple;
	bh=KslJ5Tphkjn/akn58csbX8JDDDJwZp3b66fc3x2Cw3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KLf/BQbN3n1wwENgv7mAYYEAXIHYHozqufjxY2jApDiCgTMmT8rbnDKbBkq9L6lPcDIm5hFV5apbGqLtu96vkLyagnLSOnReHunkzJubds2WMWu+dLRoeOt6kcOsbiobl1QOOsrcaIbQxv4itQUSjj0iCXlSnTuteEn8+hz4jEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZlQh9JjH; arc=fail smtp.client-ip=52.101.53.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfUsNc40lsGL22Rd8Z/v79PUgO9MJnUdQ3nZN/2Vk/lMAZ0co3ZR6PtjOeML0rZ8ZfbMXaZXvsOtlxPfvX+cnuDXTRjjrv745hh4XVwWN13w2oK1nSMklC2ydcnvZqwU+B3HnmKpvLV+uiZMpnNLJfqqqzeEAhN8oVeNEqADI1P2Dq77ORdV3rSphUAe1vQX9kbAIQ6yqS2Yu3cWNM1S9UWAfEuudRN8sq3xiHpE3VM9SHQHI3GQL4Qqar2fRgT0R8WfuF+VnSZgj26lzKVKgKOSlr7/kNRSbiS4frE5SgX+Nii3kG0JbhaaPcURYjmEpLwH5k1LzU7GkBwVdYHfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7fDSwN+F7B8VRh/jKJJc+mHTIhx0Dxx4Sep5hMTILw=;
 b=De+SERWyNYkt9VwkMesHurtDSiTDysdqgn6/NdDuzXoaHFTBxwyGCdsuaJpp7s9XuUAFwBFVvw1RGJH62vdLsx/yH3yWISxfYhTMaLfCn3r7vuj3hUvL80fsiw0wU8wKu1uWgXMIbWQwiIirFOXz2ovLwLFYd6kHZcTOfJ1Qwl6jbTQUdby4fcjnwjoYVTZqUdZmzLTy8KyIvAVtjJaiGhHScj55CHkK3CZniWTjKSXUF1YsuBWMy7qlfUQ/hW3M/VtWDGnmiNbEIgoKdeNT6zc1FCvHfNZa0B0+p+p3zW+dauRwrDG1HIzfq00SByy8h3TsiPlLQkpTF/xGbfoFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7fDSwN+F7B8VRh/jKJJc+mHTIhx0Dxx4Sep5hMTILw=;
 b=ZlQh9JjHcg0CTDPGs7vxTCtqZyncw1Pip4mBEv+PPe8HuqCXygHJSp4n35U7Pk5h+zSBIjDvy/vBBlxt0/Gf0Wz7BV8+XnEKbJGGnVf5h5kowJ/sNwtqgFiSGN38XqduMbAy9bIuW4BCCFhd5U7NGGmzyDoOi7geSqQINQALGyM=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 19:59:06 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 19:59:06 +0000
Message-ID: <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
Date: Wed, 10 Jun 2026 14:59:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
Content-Language: en-US
To: Lenart Kos <koslenart@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:806:6e::13) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a030d5-04c3-45a4-6a8f-08dec72aba32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Q2tizbnz4LlfmMfQo3deLBetSX3DsPuJTo5+hAipQH2fH3/KGlOQx2x8cQ8W3Au+pbXmEND1s6kWx5Rm2sF3sS/ahpU9J1bbRyxvud4Doh5MqGIuuMFo5jHOfZHPriVygzT1hOJn1K4C6cUMltgGNYRxOr3xx6Tb54ruByKR8blkbzkvSCU2Du1FLI7HYfs+pBRqrLbFl0h/8j9Lf3vk3XRnpmVYt5PmVEkz7LY/gKbLk/hbrVIrJFZdLiur4+ATeHXb70F4MXABTWl4dQZkrdNWf62rm8QpLTOGXL3eh9DYT/oOUXy8/JbvJ7ddkrw1WSV9i5Vq2gte7v4lYWNNgiLWXSlDdP6cj/uI3OmU4nuGE2v6HDc3bolWRHde6e/be5qUS6GCFQjHBpv7CFM/DuEvvf8eePKHlnBTncv/Mxft8SpTYexvVCVTRd4drOuiGbUHM1zCbiLBEk5ZuAIw8jA0ykfffkSLlI0FClvU+aImJby/6CvL7CMYI4dKYgFjOVyqxYHNzfqVO5k7QEXvSUph3r7s0vVEocgz8iJdtoNxSMNStfzj/Ao0yPpWeY1R/kt2MmBpZqRDxIBm5pYfCJWyrywATJgBtUz1OBH9LJ4Pl0D2svZgH1VwBojdy0ImGVE/Xkq6RuMu1b12g49I0uSkUH+zix7ee2kjoonbYmMdDaLsf8jOsjuSK4hjeSFl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG0vSTQ3OWs3ZXZOQVpwRXFKelRkRDZ0R0Y0R0lHamRwcStVWjlDd04zQlRI?=
 =?utf-8?B?L1YwbUxlWC9FanhFL3l1T2YwNFY5OXdSaXRxVFhiTSt6MFRzS3pwZWkvWlRa?=
 =?utf-8?B?djZNL1pEL3VFR3pWYXU5clVFY1loNDA1bnF0dWlsU3NDa3R4NzhUYUtLK2Vu?=
 =?utf-8?B?OGxNV3lTQXkzQmlqa0pLaGRKcTRMcEllZThidm40MUNiR3JyNWxRY1BOQUhH?=
 =?utf-8?B?dlJDbTZjd1B0ZzFjczNxNDdTbG44em8zVTFqb01McWtKc04zY016U2JVZzRm?=
 =?utf-8?B?dVhNNmtORU50MVlDelN0V1E2UklhR05rWE1zdG9zZWtrUDE1SU9UWXZGZyth?=
 =?utf-8?B?RWhTSE1PZUxqNU9wa1gwQ0UxMmEyVlIrdUhxc0tVNGZPK0I2ZUhkVjBxdGhx?=
 =?utf-8?B?YTUrOWwvb2hNVldhSzV0a2lPdVhNS0NrRjcwOC9RdHhOeU9xV0I1YnRUUmd3?=
 =?utf-8?B?NTduck5hcVFxUVh2Qm5EdzZXVzd4anhlc28wS2R3RkxML1R1S0J2L3E2QURP?=
 =?utf-8?B?UnVCZU9Cc0c4Z2JLOVI1dzB1QzljZ2hPdzRCVDNveDFpdDRXZTVPTitqYlhG?=
 =?utf-8?B?WE5GY0VTM0VWV2I3ZFE1Z1VHeGdyYldCOHkwOEw4d0RGTyt2VUMvWkRISUt1?=
 =?utf-8?B?Y3N5TzJjVVVhNWF5OUtGQys2bGxGV2xCdHYwYWtDU01SeDd1akduTjhxZ3Bl?=
 =?utf-8?B?bVF1bU80L1dmcUxhbkFaVk5hRVB4NVdGZkN3bVFSUTBIZy85MmdYczc3b0pL?=
 =?utf-8?B?SkUxTG44ODNBZ1l2bExsSjdVdU9VOUd2VFdwMlFEZVV2d2lUeUttdHdsTVB1?=
 =?utf-8?B?TEd1aVo2MWYvWGdxWU5mNGtGd1FGUWxHSGNmRmllcEwzaWF5TEN2VmhqblhB?=
 =?utf-8?B?bjZFSmkzTTQ4RjJ4R1YxUkl1TFNzY3VYSXZSQTFMdVduYnpXYSthVlVIczB0?=
 =?utf-8?B?TExrMG5pVjVFKzB4R1dRYXphUXgvY21Ka0UvM2ZWMFdmZm5RbXJ4MTh6cWtO?=
 =?utf-8?B?RHBVaWcxQWVteFprU1pmSFFBUnVkekdVRU1sbjJXOW9NMURsMEh2eEFvYTBp?=
 =?utf-8?B?Qk1sUklhUFdGUUtTdkV1dzRNYXF6RDk0OFdKY1g1UWsxb01mVENXd3dLZWc4?=
 =?utf-8?B?cjRkYkgvczkxbE5WakV4ZldKaGZ0K1laUHRiL2JMM1p6QnZ1bzRaN3ZwN1JI?=
 =?utf-8?B?NC9SVVlEd1YwV3VpNURvQXRHVUZyTzFXMlJVWTEvVE9nbXkxRE1FNXpZS3lZ?=
 =?utf-8?B?N3ZLdERZelM1dDBqVE5yZVBlZ1B5WUFWRE1RZ3NQR1c5cVZEUnVXNnpFVFNs?=
 =?utf-8?B?N1VtMGsveWJ5ZFNPY0ZITUN2UENSZFhQNnlxR1V5emdhd3RudGlTZFlFbnU4?=
 =?utf-8?B?ODNHODJDWGhhbUtCL2VaTytNM2hiZ0lMQmd6cjk0cVVzOUdKMTlENjc1YmhO?=
 =?utf-8?B?ZHhla2I4Kzk2T0s5VnQwNE85VXZnVW1PZkpvUG1tSUJZWWZ4NXlCNHV0ZVE1?=
 =?utf-8?B?V1lib2JVQ2owR1ZHeXdhTFdUNHEvMS8xMVpoVHZqelJPNzFLVGFQZktWazhk?=
 =?utf-8?B?VFRkam05blRobWtBd0EvV0ZqbmRrU1hUODJEK0k4ZkMwNXkwemhNc0FDNzJy?=
 =?utf-8?B?cFMveDRZa0FRQStBdDlJeGhaZDJoc1RjNEtSL2U3dmk2TTB1eDdJVjJPNTdD?=
 =?utf-8?B?SUpVNlhqeS9UdE9CRGtEL3V5WE1PY1N2bkdlTjNxVjlhUHhkV3JwVm1ZWmRt?=
 =?utf-8?B?L2k4aG9uUmN1MmFhOTUzSzk4WkVBZlNnMU8vUlBUTTQ0elRQQ2hRczBVMDJ1?=
 =?utf-8?B?K2ludHFrQkFjVXlmaGpiRzlNek1sYmFCSVEwQmRBcDVTWVVZOGdDdTlQNDd4?=
 =?utf-8?B?WVRFRHRIalExOE5lZ21UVjFrd25BL05zNXNxL293NE1ONUtUUWNHWHFxa0VN?=
 =?utf-8?B?SHJmSGZZbjRySTUvODdhL3J4cUZpYzhodVdZMlVvVkVDZEFMY2hpYWZHVU9j?=
 =?utf-8?B?d0FwY2RnUjJjSDd0WmlxOW1rQitjRVg4RVkzUVpLaG9IbGpMOGpBUTJUY0lS?=
 =?utf-8?B?QldUNTBUWnpJUnBuWm0yWlFtTG1WQW9Wbmg4MnRubnVrbFJkUXdoS2FGWlNm?=
 =?utf-8?B?SDFkYnJobC85RkZrQkYwaEpLaFVRelYwRXhHT2YvVW5Pbkt6eHFWenkyUGJy?=
 =?utf-8?B?WmIyeHVIenZ3dkhLaHA4Q1VnUVhIR0tkMWlKUERQdjhPNGJyKzYwaFk3bDU5?=
 =?utf-8?B?YmNTU256dFJWUFQ1RTk1SjQreDNnTHBmTDdmdTRadDFzcUY3Ykp0V2pkUG5i?=
 =?utf-8?B?ektCaWdqdXdlNzVjUzA2bzRxYVhlUmRSWkhsZjl2U2paSzZySUF2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a030d5-04c3-45a4-6a8f-08dec72aba32
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:59:06.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0KFps7gOAZLqtQUXfKr6VIGddfgK1BSMhBAkf2RmPqOKiGxSp4u2FqNDNDIzYcitvCrUvmHvNYCVWWeJYWrYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38285-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:koslenart@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime,fedoraproject.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2682566CA66

First off -

How did you get into an S3 path?  These systems that ship with only 
Modern Standby / s2idle normally shouldn't be able to get into S3.

╰─❯ cat /sys/power/mem_sleep
[s2idle]

Have you modified the firmware in some way to try to enable an 
unvalidated path?

I have some more questions about your methodology below because when 
debugging a kernel issue an LLM can sometimes make WILD assumptions that 
are totally a house of cards.

On 6/10/26 14:32, Lenart Kos wrote:
> ## Summary
> 
> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an external
> display connected resumes the machine after ~1 second. The wake is delivered by
> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
> (and pin #2 for
> the USB‑C/DP path), which the **BIOS has armed as an S0i3/S3 wake
> source directly
> in the FCH GPIO register**, with **no ACPI description**
> (`_AEI`/`GpioInt`/`_PRW`)
> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
> none of the
> existing override mechanisms (`gpiolib_acpi.ignore_wake=`, device
> `power/wakeup`)
> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
> write. The pin
> is an external‑display HPD line, so the edge produced while the GPU
> powers down on
> the way into sleep immediately wakes the system.
> 
> ## Affected system
> 
> ```
> DMI sys_vendor LENOVO
> DMI product_name 82WM
> DMI product_version Legion Pro 5 16ARX8
> DMI board_name LNVNB161216
> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
> ```
> 
> ## Symptom / evidence
> 
> Failed-suspend kernel log (verbose PM):
> ```
> PM: suspend entry (deep)
> ...
> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
> not a wake src
> ACPI: PM: Preparing to enter system sleep state S3
> Timekeeping suspended for 1.384 seconds
> PM: Triggering wakeup from IRQ 7 # IRQ 7 = pinctrl_amd
> ...
> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latched)
> ```
> `/sys/power/pm_wakeup_irq` = `7`.
> 
> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i3+S3
> wake with their interrupt enabled, while #89 has no wake bits:
> ```
> #2 😛| ↓ | edge |⏰|⏰| | | ... 0x147ae0
> #4 😛| b | edge |⏰|⏰| | | ... 0x57ce0 <- both-edge HPD, S0i3+S3 wake set

How did you determine this is an HPD line?  Is that a pure guess?  Or 
did you look at a schematic/trace etc?

> #89 😛| ↓ | level| | | | | ... 0x151b00 <- no wake bits (red herring)
> ```
> 
> ## Root cause
> 
> 1. The external‑display HPD lines are routed to SoC GPIO #2 (USB‑C/DP) and #4
> (HDMI/dGPU).

How do you know?

> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
> those pins in the
> FCH GPIO register block and **never describes them in ACPI** — decompiling the
> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
> suspend, so the
> HPD edge generated during the suspend transition wakes the system immediately.
> 
> This is effectively an unvalidated firmware S3 path (the platform ships as
> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, so
> s2idle is affected too.

So how did you get into S3?

> 
> ## Why existing mechanisms don't help
> 
> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` — wrong layer; this is
> not a PCIe PME.
> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
> - `gpiolib_acpi.ignore_wake=` / `ignore_interrupt=` — only match
> **ACPI-declared**
> GPIO events; this pin has no ACPI declaration, so they cannot target it.
> - `/dev/mem` register write — blocked by `CONFIG_IO_STRICT_DEVMEM=y`
> (the region is
> claimed by pinctrl_amd).
> 
> There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-armed
> pinctrl-amd wake pin.** That is the gap.
> 
> ## Suggested fix (maintainers' choice)
> 
> A working out-of-tree reference implementation (clears bits 13/14/15
> on pins #2/#4
> at probe and on `PM_SUSPEND_PREPARE`) is here:
> **https://github.com/Lenart12/legion-nowake** — please feel free to reuse.

Why not use /dev/gpiochipX devices to change GPIOs?

> 
> Possible in-tree directions:
> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
> wake-enable bits
> for the affected pins at probe (smallest change; precedent exists for AMD GPIO
> wake quirks).
> 2. **A generic override** for bare pins, e.g. a
> `pinctrl_amd.ignore_wake=<pin,...>`
> module parameter, analogous to `gpiolib_acpi.ignore_wake=` but for
> hardware-armed
> pins without ACPI events. This would help the broader class of AMD laptops that
> hit firmware-armed spurious wakes.
> 
> ## Reproduction
> 
> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake.
> 2. Connect an external monitor, `systemctl suspend`.
> 3. Observe resume after ~1s; `pm_wakeup_irq` = the `pinctrl_amd` IRQ;
> the offending
> pin shows `wake latched` in the post-resume `GPIO N is active` log.

On the presumption that this is correct about being an HPD pin doesn't 
this actually point at a GPU driver bug?

> 
> ## Public discussion / full diagnostics
> 
> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table):
> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hdmi-is-connected-irq-7-pinctrl-amd
> 
> ## Attachments to include when filing
> 
> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=1`).
> - `sudo cat /sys/kernel/debug/gpio`.
> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_name,bios_version}`.

Where is the kernel bugzilla that you attached all these artifacts?


