Return-Path: <linux-gpio+bounces-38678-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UVXBBZXwM2rPJQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38678-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:20:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0B6A06D1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:20:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Cra2GhXN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38678-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38678-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 320CE3013726
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 13:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A287B28000F;
	Thu, 18 Jun 2026 13:16:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB6175A69;
	Thu, 18 Jun 2026 13:16:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788606; cv=fail; b=SS3k25YwCYCB0XhBzfQpPfelyyiP5AwXktMlsTTybflUemfBdQR/UfA4DZg+5EmpxauGyTGabWzIP8aQQpgHQ5JR1lA+l2h+ckIZKSWpsbwpaElEwAV2JD5wEajZtsJC+iA8fUjflrCCYcLhXcZ2PjOvCEtrhHArWY30R+NbyTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788606; c=relaxed/simple;
	bh=mQpfIQocXBQKipVorHnLvA89vOmtCIA63Z1oytTyjns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TQiWwAWtOwmNz+9dZvTbTk/fx4+Y23uO8Jv0BAvDHenT9dM0XSeLIWhhRxSU1Cw2UM9rZjvlrTCj8m+ltfjIJJ0ycVDd1Xck2m9KlRDjgd6RVNaui/0/yzS+q7CWrD90S/P0V6gSuTOnao4le8DCJolXrl2P99fgXB2IdwO4fnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cra2GhXN; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC2t+DrVlrymq3Cbc6XLu6IcKScun8XhejsOyCYYXNElfvwSvRg/vqbWrVCaTjUdkIPFL6oWhTjjoxJMEDQWQijsQyHlEZNPg+K0HsTyTQ8u8DZODUcpO990gzYGwwkghW90WW3XjIoSzDr7rS5GUKQzGYCTuH/O0EyHDkmQ9DrIw0BbItIpfawI88p1zkANG8EYWu20B/7xlJqczdr8DENmQg6tVG7wf7qkkvNIBDAYVmlN7Qyqn+8cB5e4+UHenR/Zgkffxez7vBb9DTnggPTsPtfMOZysEuhJyf6J8UzXN8xpNM+Cw7nvPDMbieAM+hW1pnq6cz6geJSWPAnibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0FMa9vDO5R4EwU0ZsyrgCtHICD5i+0Kn+F4T9p3ZHY=;
 b=msZR0WfTTlCxeaUnRAEtUyQFD6xur1dz7A4UiVf9YFmZm7PffWimhTF4aS8tDEov5yIw4irVRoN4PMu3zVvmWnNwQgz+bfCpUgc+hoWpGXjxfxGTrDm9gKcrEs9E4+1WcsuLk0F+IQxA+7639zPIsoCYN0kh9mg0PtzOXk1I2GnkyLUIfRfk5H1weNxPyWxzD9qifQ8+Ng2Yp00lQ8viIV9JIJ7y4l8gGzDY9S+NotRhrN5VAnMJuHYb8MP4S5QKvzt0oy4RFEFwZFFyc1AfLKrnrJeVTbq0sLmh6s9yBjXaau4rJO1XQufihDSJUzdh+cc6Qgai2bN8GiKcyGJpiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0FMa9vDO5R4EwU0ZsyrgCtHICD5i+0Kn+F4T9p3ZHY=;
 b=Cra2GhXNPYg0T6bnE6XUdInYrDEnVhRB3fm/MsAliPSe9sgnhU95hIhWZQ5AB3hi09lSBsW/Kkweo/8TLiBI+/+MU7L4ytQdgZYz5kSEwyxOHghrM2ABMwltGat9hi3kfcHl6umpjtJUSKle3EGJ2Pvu91P+a9v112PSIUI8GQ0=
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 13:16:40 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 13:16:40 +0000
Message-ID: <b259a3a3-0440-4da6-a3bb-d840f5242ce2@amd.com>
Date: Thu, 18 Jun 2026 18:46:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
To: Marco Scardovi <scardracs@disroot.org>, w_armin@gmx.de
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, westeri@kernel.org
References: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <20260617231428.96076-1-scardracs@disroot.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260617231428.96076-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: deb88c81-ff19-417a-4dd1-08decd3bd593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|4133799003|3023799007|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gFtsY4dSd28dq2LJCQmLeC0ZE5XTZ3rAiZco7DM+pmQjGtFfswRQ9EoG3odeo0xkFX23NJwPHmySqohET+Zvq39dWiJCnRCBX9EPWxoLiAXZ3rg+2FlH2SzmZ6qvPBxqyrWrHpItPswBDrWUuI3RY3D95RFn/Nxrq6uuLQbElL80uiBa0Ba9tHDiUzIlG3lGEpY6wUXlRz6GqDPcWh+s1ZVuYxwcyMmhRobvJbhsqVlrwqLpf5vppRs7CdAqship82XDwwpcH+Ypb4MC7UpN/8eL5VvJ+ShPl6m3Oycd8KlHO7zPpSzUSiLZDELItRH4IuagNiuChBvh3dQXfmcCzUnm9l2Bz8BFMXsmwXobU3wOHbD3PAjG8RM+l3KEco3LrrlbrxzrloeX0vRuB3KWnKvuppCS3N72hIqn7BYUX7IHv4sh+tdicSiuBWgTwgvxZcR7OTJZjlcuojeqTpEUpmGVKYmPolvF2/LThCJDibfgmvrXGFLqwvo4L8dw2XURnK9sQsoBNj5dXHiVPV/wV9ZU/ts1wyeZ51SOo/EDN5K1PwN20ITpQcTbTM6yz5URKp9NMTs7Glh/6V0JjoD6UbUBu+6YGI3TxEWqRsv8W2xab1w3/5+6x4mXMppLOyJG3dZnV3ZXjpr+P+yNcKbHwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(4133799003)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGxOL0FEYmRZVm10bHBBVm00OXY1K3U0UEIxQ2NpYmI4SlZ1eGJNbHlqWE1R?=
 =?utf-8?B?SG9JQnAwYVBGbUVSZHNXL09sNUIxTS8rOVFrd05NV3ExcjNraU94WHA4Y3BV?=
 =?utf-8?B?WFM2MElqOTB5TW5lY2xhK3ZSR1htYy8xYloyVmxtM3MranQzR0p1dGxLRkRC?=
 =?utf-8?B?S1FYOStsV0doMlpGSjRXYTZiTGNPQ0RyUmFic1ZrZWpvcVkrclFCWnVIS05M?=
 =?utf-8?B?b0ZseHp2S2NhN3pzaXQ1ckRiYnNObzVQd3Fqemh4WXl6ZDVtMGV0d0J1ckM1?=
 =?utf-8?B?Tlp3WXI2aGdlZWJnR1FMbFdBZGVOa3BIcUxsU1lKTVY5clB4MXFCQ2o4dGd2?=
 =?utf-8?B?Wkh5MXVpblBXS2JFaWR4N0dkWjdGZVlYTkVCSzY1bmRBcSt2T0lPOU9OcEhJ?=
 =?utf-8?B?RnQ5Qk1CVzdZWHpFOUhBQk5iUGZEOG1HNmZrTHJGcWE2YjdEdzhtbTllODVN?=
 =?utf-8?B?NFp6dXI5M3kzZk5MQ2VmNjhtV3BURmJBNFBWaWZVZ1ZMRkhjUXJ5aGRZbnNI?=
 =?utf-8?B?cEFaZXZkNjlSa1UvTUx1LzdQZm1XQ0huekNVaUh5OERBTXJMOWgxMitrN1R6?=
 =?utf-8?B?UW5tRzkyOHBMbDlUSWxTSG5MVWtadk5QTEdyOU1BQzJ5REhhMWx1MVlHcnRr?=
 =?utf-8?B?UkRWWWNybnhhNE41TStMKzFNRFZSQmVXWTNCenJYQVRzMS9MZksvYWZqOGZT?=
 =?utf-8?B?V0s3eWtjUkowbGpGMElHZ2ZQOUNDa0FRYW9jaCt5eVZXNi94eksyUW54TmZS?=
 =?utf-8?B?Z21mYzZUb0NQdWJVWXhpenFtUU5ZeXF6dGFjd3RjT2ZXTlZZMGh0REtldzhl?=
 =?utf-8?B?WkFkbytQSW5mWmRsYmcrWjBoc2d0N0pzckxoWHltWkFLc0VMaGxyRklkRGFB?=
 =?utf-8?B?NU1yVC9XOGU2S1lOQkttY3BNZWREM1ZiYXNDTXFIYysvaVpEaUZOZ0RmM2JE?=
 =?utf-8?B?cVZKMTdKa0pUcCtCVCs0QjVaUzQ5eTZ2MGFTelArWjNvbU1hZHc4UFRwVjht?=
 =?utf-8?B?ZHltaEphKzByQW0wK0FNcDhyWm5SUHZxZU56WGVENEJtbHEvaE55TFVyVVFy?=
 =?utf-8?B?WmRwcG92aHR1My94NlpYK3dDd0E2MFF3QlkyMXFvN3prVkxseWVoOUVNVTRs?=
 =?utf-8?B?Y1J5N2RCYmFBVFEzSTFOd1ZNbmF0KytLWjUxMHV3K1FudW1OOTBpYmNaMVQv?=
 =?utf-8?B?MC8rQW1oQTFJa3NpaXlQMWhFRWYxRFY4Y01QYlUzREl2YjRHa2xsb1IvNy9S?=
 =?utf-8?B?bWRpVE5mdlIvTmpGYkRtbCsrWVVUQkw1L0tzdDIrTG9SZlBKV2xjdVBGb0dY?=
 =?utf-8?B?dlE0VWdiMms2a2Q1UVpmTkcxblNINTMxM2RaT25qZWsvT1llOGhpYW84bUpz?=
 =?utf-8?B?eDZpdEJNS0hpRHovTkFyK1lJSmltelcrMXdOdkUwVkVZT1lEaTgySkZZVGVN?=
 =?utf-8?B?ZXJIUFFkaXNTTUs5cHJUVDE3MVZiNmpsdUhrWHk0TXhGdFBRZHZRN1FZV204?=
 =?utf-8?B?WVNEY1FKUnhscHRTVEJ0dHp5VmxNdnRwcldFVEFLZ1V1UlhqeWVZVEtyVWpR?=
 =?utf-8?B?eTdWZzNibXFkL0FmNURER3Q0TnVyTXdub1ZEREYxS1VZTVFzbE8weE95OGky?=
 =?utf-8?B?VVkzeVlOblE5ZmRPaG1FSGFRbDAvQm1VL21SVlBYTlJxR3ZtMjlRTG9NaHZV?=
 =?utf-8?B?VjU0dXd6bG1SUTVIYWlLVk1CYy9RU3ozMnVjaUxXMXlaTHlPT3J3dlorbXBk?=
 =?utf-8?B?T3pRR2MvKzNlakVSV1RZcjJhTmxleEVPTno1QWU4c01KZVh4Tm1aMmRmT3FH?=
 =?utf-8?B?ZGVQTU5RbkRCNDRkbmk2NmhQa2tHVDl1OU9NOGJHQUNCVjJmWDNETnlJQ0Mz?=
 =?utf-8?B?U3lxSlVZc2Q5ckhPeTQ0Z3N1YVJSQVRuTk9kZll6ZVRWTGR5YVZsaExEbXJW?=
 =?utf-8?B?RitaMlA4V3gyREMxeUYvN2xRc25Nay9STmdOYmZDMDdFdHhmdkNzOTdVSHhh?=
 =?utf-8?B?UW9kNFAydTZqVEd5ZGhNd2R6V3E3K0ZCOTB4Y2VjWFBERE5qMTltNkJYWW5p?=
 =?utf-8?B?c0F1RzJoUzcxZzA5ZnV6RUp2ZFhOTG4venU3YTJkV2haRERLZG12WFRiNXBn?=
 =?utf-8?B?OUNoSW0wNTZPUlJaNzNzZjdmd0lxa1l1NUowa3ZJdHlnRm5neW4wbHlpVjFV?=
 =?utf-8?B?SzZRcFYxV2FURWVIaXpuYS9kQTFOd0d4S3NRZ3E3d3Q2NjJEV3V6ZVo5MEFt?=
 =?utf-8?B?dC8yaC9uNVRvU2k0TCt2YTN0aVZxOCtaMTFnbGtwcWVJd1JlcXlNSW91Ni9O?=
 =?utf-8?B?anM3dDRrVmpReEhOZ0NVSnV1endmTDB3OXl1NFRKRWRCaGxvemNEQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb88c81-ff19-417a-4dd1-08decd3bd593
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 13:16:40.5319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2r/jgsl1hDpVbDYDtsq33/uhZ1QIX7XQK4LdQ4dj9E8b5xXRashvLZRvqmM7USVW0G7SXKqNvdmWoAmasE36g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38678-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:w_armin@gmx.de,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bnatikar@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[disroot.org,gmx.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,aka.ms:url,disroot.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FE0B6A06D1

hi


On 6/18/2026 4:44 AM, Marco Scardovi wrote:
> [You don't often get email from scardracs@disroot.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Armin,
>
> On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:
>> could you share the output of "acpidump" on your device? I suspect that Asus
>> uses a _DSM control method to tell Windows to invert the polarity inside the
>> ActiveBoth check.
>>
> I have extracted and decompiled the ACPI tables (DSDT and SSDTs) from acpidump.
> You can find the raw acpidump.out and the decompiled ASL tables in the
> following Google Drive folder:
> https://drive.google.com/drive/folders/1aTqLAnUhrTsPdpA8tfOFyRopG3P3DGnc?usp=drive_link
>
> As far as I can see/understand there is no _DSM method defined under the
> GPIO controller device (AMDI0030) or the \_SB.GPIO scope.
>
> Under the _AEI method (defined in SSDT9 line 188-193), pin 21 (0x15) and
> pin 24 (0x18) are defined as:
>
> GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0x0000,
>      "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>      )
>      {
>          0x0015 // Pin 21 (Touchpad attention line)
>      }
>
> When triggered, they evaluate the _EVT method which calls:
> Case (0x15)
> {
>      \_SB.PCI0.SBRG.HNC0 (0x15, Zero)
> }
>
> Since Arg1 is Zero, HNC0 executes the Else branch, invoking M009 and ATKM/ADTM,
> which stalls synchronously for ~36 seconds when executed during the probe path at
> boot time.

I traced the _EVT for pin 21 through the dumps:

_EVT(0x15) → \_SB.PCI0.SBRG.HNC0(0x15, Zero). With Arg1==0 it takes the Else branch:
M009(), then Notify(^^GPP0.PEGP, 0x81) "Information Change" to the dGPU, then
ATKM(0xC0)/ADTM().

So this _AEI event is dGPU/graphics‑related (it notifies PEGP), not the touchpad —
the earlier "touchpad" characterization is incorrect. The touchpad
(TPD0, _HID "ASUE1416", _CID "PNP0C50") has its own GpioInt() in its _CRS on a
different line (pin 0x08, Level/ActiveLow).

The ~36 s stall is consistent with these synchronous MMIO reads + dGPU notify
\running in the boot probe path while the GPU isn't ready
(no explicit Sleep in the path; a trace_method_name on HNC0/M049 would
confirm the exact blocking access).
Either way, running this AML synchronously at boot is the firmware issue
the no_edge_events_on_boot quirk works around.

Could you update the commit message accordingly — in particular, drop the
"touchpad" wording, since pin 21's _AEI event is the dGPU notify path, not the touchpad?

Thanks,
--
Basavaraj

> Thanks,
> Marco


