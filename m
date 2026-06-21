Return-Path: <linux-gpio+bounces-38751-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ABLJKK2ZN2rJPAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38751-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 09:58:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EB6AA606
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 09:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="v/XuKpCo";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38751-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38751-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4BC9300B77B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 07:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AE6271A94;
	Sun, 21 Jun 2026 07:58:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB09B640;
	Sun, 21 Jun 2026 07:58:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782028711; cv=fail; b=UxkOsc+vXg0qfeC6RWHsdjL+omDusEx6gFgxGCHbrYKWJgoR8HStt7bSbu22t4sIufHPX+KE7cJf9Nq23JRWt5kJ17zrzS4nfLk/dKFpN8/IC8Sn7Xot8LBDf8ny9ZLZO9d5zgNDYOnqp8sjmKu2JLATzSibp4iwk/Fw4c27YlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782028711; c=relaxed/simple;
	bh=dNDAPd54WfHx7xaYqqdrTghAGIQ7BF3jYMD0VijTCpE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CXUQSXh0AQ6HDlHPoPxAe8x8bHcvbZgKCMymaEYu/9EljjyH4v1uGI+iG+i9jE1Gx6duxnZO52pjcvDq1bYf3vq4m7DumQKH75Yc6zRrhYbDrbShxByL253yf6alWSidwOkIp3swoyRWnbV7oH/8gTdIytmXFuWlNWRMRm9PBBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v/XuKpCo; arc=fail smtp.client-ip=52.101.61.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSv2+W0a2tf1NPgMeE3nCf8TPYCQIevgCunDj9Mijbf95CmtkmKeP8dM0k3OqSMDJmwZbi8WX5CeOO9gjba/0ji8r1K84hXDfzqBsJMfjXxRFasFD2yQoNX90VYV4EhY9KDELBE/HXSh7f63mmDPEcaYxgJoVNeEQPsUiVRm2dUxZIxIrU6zEfAcjiPxeaCKeVaAUCYEsHfYagMR8vTzdDr0E1uiHMaUzOuwKbygb2PrsLsSZ5jRLwPBbQV/Ps3v/xpnKC37DgU8Ac8et7dZsRN+oD3RPzimTiHt4st37xeZTZBCT72ptcd+Iz+cP7kOZHeOZPja/pySkAMcmf3BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQJ05/6A62BMN6q9HXx94f8ohKOXtzeFvORZmG1C2pg=;
 b=R3ft1Wz0pcB7VGCkDA30FyEfZcrLOSsa6xCF22Asb08ifskN+ZQEm1xcMHngws03ZCEsiGPQwzTR2AfUWVosxIb1oDrvcwbFNe13ASx/hW9T3rYyzpJmrA8B7SwVNTWGKBIBRxZsHb8198KRLmqdHzqkWW2svpmPtZa98pZ72Pv6QlF43pJD/qtam6hyAyw3Owc3s7q95sArqRqhAmy4TQSmUz7dVzdfwu4R6ALoeHOhWGZ58zkf4bxbNpP7W7BXHET3clQ2W8GpZqUWxZlWOxfCmdUHq92TXMJi6r5mHTvTgfpf3xS5u9GUqDCjrxFxuIIY6lS20cp7dbAJr/w9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQJ05/6A62BMN6q9HXx94f8ohKOXtzeFvORZmG1C2pg=;
 b=v/XuKpColZLSAjFkONMP3JghjGYBgRLOs4oiXOMc0JWutm33IyECh6m2hEXZQr5eIXoOZyDW6VrA/WPJ4XfR/dVkBsvlFy4HGrQJClvSUH3t/aP1fPcBqPq7oNT6X+S8TcMUOwD62uA8Jh5Y/+iB6SG09z2FL4pqGKjA1i2RKbA=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Sun, 21 Jun
 2026 07:58:24 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0139.009; Sun, 21 Jun 2026
 07:58:24 +0000
Message-ID: <fc25f967-ab71-499c-8e50-ac74286bdf2d@amd.com>
Date: Sun, 21 Jun 2026 00:58:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
Content-Language: en-US
To: Marco Scardovi <scardracs@disroot.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Basavaraj Natikar <bnatikar@amd.com>, w_armin@gmx.de, brgl@kernel.org,
 linusw@kernel.org, linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, westeri@kernel.org
References: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
 <P9sY7IKaQumFwq7UGDqIPA@disroot.org> <ajY4q8o4wXvGMSZj@ashevche-desk.local>
 <JL9AWbK0SzeIHPRy6K6QhA@disroot.org>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <JL9AWbK0SzeIHPRy6K6QhA@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 809e68fa-e22d-4cae-d450-08decf6adeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	q2CaxE1XK8uuQBy/eJrKo9DVsAPL779SM991VL/CwJz132giaGhXNEvBnuqLFOtOcdm2hZmhGg1nSIs5YF34Qf4dKxgUboJE+u6s/CKvdt7CmFwbI9fqrzhdPPv0zpByvsGtssO+V4hUX3w1TXPKGw5s6c5HzaPPB9hQcM3RL5bKor95mVdCMOyRgiIBxaQ42A/M0ISKVftcthmjgoAU6onePUwbIDXruBnfdELEAXK/5G6weo6DljILPcnASyRFG4pFIsWMCTbQ91xK7mVK1ek40N2/rXsl5fKon01rL4NjKtQWd+r2lB+nHlwiA7wRvtfzRzlCgNa5wl6n3r2i4JSfSiZ+Q4Uw6dy8I2VMhOvqxuM8oeOaXW7nyAtnw7b32GzEdgK3KWKPCCJsT5V1jJTZL5hX+7EwHSwPKVZxW+BOOOw3TfD++Ym2MGW3qy/cO7Mu7+lg+FTb4Hvub0aP02yvMShzUmF++anafFZ+ufLYINhPLGFpnU3jOUtmeoEGTRJcH9KZFV29D+9tz86NZ81b2kT8XfjPA9NbCjrxhfjs06TN41q34oWu3obMx1+ihChkt4K5s7QVz1VAdMqjsPGTb6kdeiVDd8qbNOWetBxB/+tQXYRbvlhf1zy67+nQV7iM4Z1ug+pseMNTkOIEEc6Ub56ulo5fU9f2Mzgm+xU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktCSDB5czRBUDdEMXBHem11eWFrV2xhMDUwNHhmeXBZcDRsV05IcWNRVDNU?=
 =?utf-8?B?aFhjR1pyYzN6V1phd3EyaEQ4UFZrbDcvMERlU3VsVHk4NzY1aEVOelBVWWpx?=
 =?utf-8?B?bWZDTGhIMk9TaENDbmVzSFdxQ3dkWUJqajVONk1pTVJBZlhVTDJVVk4xajVw?=
 =?utf-8?B?cGZhYk9BMGxBdGk3WFg3dFY0ZUQ0S1hWQ0RYdktwdWNFc2NJT3ZaYU1kYmxP?=
 =?utf-8?B?R3d0dXBZQU04VCtlQTcrRDRBd0VaNDRaSXNWVFZBTzNOcEhnSnRZVk9xZStM?=
 =?utf-8?B?SHA3R3h2aENwY1ZaMHBqdVV0bjQ1Y21Eb0tPVzlTTGVBOWlqSEU4dFpYRFBD?=
 =?utf-8?B?YUYrc0pvWnVUQ09xL3F4blF4eHFEVzZDSU1SKzJ4TFNja1hrbWVFV3BPWFBa?=
 =?utf-8?B?V2I4VWVRVCtpRG1IMnIwaVFBdkZLNGc0d0k0UlRLemFCZXZMYUJ4dkVzNW8v?=
 =?utf-8?B?clUyM3M2a0ZNeFJxMWNyRDZBSTEraUV4NnFIOWYwLzhKNW1tTTYrbUUwcG1a?=
 =?utf-8?B?Uk1PWFE1TU5wSWZPVWUxZURZVXgwbUtuMVVlT1I5blhWdjBLU2lEa0RQeFZR?=
 =?utf-8?B?V2d3Sm9qNndHUmczU0VQMFlzOHBWSXQ5V0lPRWhRR1lsbEpKQXEwYmFDNHpm?=
 =?utf-8?B?czNXMWUwYURQbU9PS1pLL1ZjaWlhbzh6a0hFZXI1STZMS09JRFo4emY4YmpN?=
 =?utf-8?B?NjhVUHljNnpDT0xLcTBGTnluOGZYTXpmWnhyVmRXMjhUVjNoendLeGdiakFU?=
 =?utf-8?B?WHlMMjN3dnFWakRoOElnU0QyU3lhVkZFMmJWd1BjYUk5d0p2ZXlvRFNyZGE4?=
 =?utf-8?B?YkVEUGVkelVxb0s0UFJlNloyNFZyVjZHTHl6enEvQXl3aGlXeFI0MEUzaW5T?=
 =?utf-8?B?NlhNT21HeGJ1NlpiaUJPVXhjYXRWTnlnUXFiWTIzREdjSkJtSHdJd1ZDUXFz?=
 =?utf-8?B?cjlNdjNhZVBSR0tjSDI3VTRHM0NhRzFKUWNMVWEydEJndm5ERGlYN25XaVVl?=
 =?utf-8?B?M2VJSmsyYmgwUzlEdjNjYWVYRUdFcFFQMlB6dU9Oa3NkUTlVZjVwVEZlRENa?=
 =?utf-8?B?K2w4TDB6Z2JHa2wrbyt1bEtTOVNMVndQeDUvVEVxMDZ4bThHVGVLZ0RtTjB2?=
 =?utf-8?B?VU92ZEpnaVBKaGQ0TDBxcVpic3dlM1JkOCtPak5oNW9pV0p0ZDB1UjBqYnZ5?=
 =?utf-8?B?UlJNMEluRHhTLzN6b0gvRlFVVVJLaFFNQXo5QmRGWWtySEp4WHhyRFVDKzZp?=
 =?utf-8?B?b3QwR1J3T3BGaVljbmxSbGRDWW4zZ1drNEJzd3pCNmZPMkNwbVVBM0tYU0Jr?=
 =?utf-8?B?WXNRaTg1N0x1TVlBN2RzUm9qTFpCMDJTWlNJZ25Nd011d3V4T21pbnY1OHpL?=
 =?utf-8?B?ZHFrR3lvTzJyRkpkcVdJM2MwQlBNMGxNKzUxNWM0VHRNSXc1R1QwdzhTcVQ5?=
 =?utf-8?B?Z3JBQ2xFSHhRSytsSXY0b2swamFuWmhZdW9YbzFuenNJWEpubHdkaTVQdlUx?=
 =?utf-8?B?amRuS3VleHpmRWorc1VNbnRBcHZLWE92amN6N2pOZ0FROWVyT2xnaWpJbDhQ?=
 =?utf-8?B?elJ4eVQwVHRxWUYzam9hSUJxNDhFM0FoTFd5K1lua2VsSHBoS0U0MkV5dDhC?=
 =?utf-8?B?eDBnMDJ5T2ZHbVhwSGphcFUyOFAyVDFoeDgzdUtJa1VMRVRqU2p1MER0dFZ1?=
 =?utf-8?B?WEdQdSs3M1VKQ1BTZDliZkc5V2ZvaHlXVUhxZU9Na0d5S2hPN0xacVZtMUZl?=
 =?utf-8?B?Sk4weFg1eGZCRWxQVzhzbkgrMk4yOUxhWTJFZ2Rjc1UxYkN2bEpPSHhVa1lX?=
 =?utf-8?B?VWNRQW94UEZDR1hRMjdxWEh5R2xnaDhhZzQra0hLbXNIYlhIT2QrdDhQV3Q4?=
 =?utf-8?B?M2NLL1ZuU1BwTDFrT1E3WkNYcit3azVCS2RXemNBK081SFJCUGFrbUFqZFlo?=
 =?utf-8?B?b3Q4YkpqMm4yUXJBTnhWdGNyNlVqc1FXaHBpcGlLNU1ncFRpRWtxWlpKTnR5?=
 =?utf-8?B?NHJzT3hZbEgxNytZT2NMQjE0T3gvYWJSZTJJNGxwUU1BdnkvMzZtY0xZQ3p1?=
 =?utf-8?B?K3pFWlpoenUvMlZyMFlQYUhlSjlmSElEK3o2MSt0VTlxTUMrYXVteG01bnRn?=
 =?utf-8?B?SlZHSmRtMjBkclY5WkZzZHZTcHhaVkNlR2FkT09pSStDKzdpbXVGY2VKOWpB?=
 =?utf-8?B?aUtqSE5ldUtNMXU4c3VQODR6TGdMcFRlYW9UdGhpbmExUEdYRC8zeXE2S0Rv?=
 =?utf-8?B?QXpMWUM5dzhSeHJ0Z2tPeEJsTmdpbGc2RFdHTHkvMmhPcGFYaXdFMDltWUpV?=
 =?utf-8?Q?nX3SoHrRB8yYK14JQ1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809e68fa-e22d-4cae-d450-08decf6adeb4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 07:58:24.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ttZ/eiz1PrWmDdHoBpSuP8mrJkw3TH7PuIW6Ea3em42EUFEjdJ8jMum7E2tjbUKU777CLNWb2aPtHj1lgk2nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmx.de,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38751-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:andriy.shevchenko@linux.intel.com,m:bnatikar@amd.com,m:w_armin@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:westeri@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130EB6AA606



On 6/20/26 00:20, Marco Scardovi wrote:
> In data sabato 20 giugno 2026 08:52:27 Ora legale dell’Europa centrale, Andy Shevchenko ha scritto:
>> On Fri, Jun 19, 2026 at 12:28:49PM +0200, Marco Scardovi wrote:
>>> In data venerdì 19 giugno 2026 12:17:17 Ora legale dell’Europa centrale, Basavaraj Natikar ha scritto:
>>>> On 6/18/2026 11:37 PM, Marco Scardovi wrote:
>>>>> In data giovedì 18 giugno 2026 20:01:40 Ora legale dell’Europa centrale, Andy Shevchenko ha scritto:
>>>>>> On Thu, Jun 18, 2026 at 06:59:15PM +0200, Marco Scardovi wrote:
>>>>>>> On Thu, Jun 18, 2026 at 16:35:37 CEST, Andy Shevchenko wrote:
>>>>>>>> On Thu, Jun 18, 2026 at 06:46:28PM +0530, Basavaraj Natikar wrote:
>>>>>>>>> On 6/18/2026 4:44 AM, Marco Scardovi wrote:
>>>>>>>>>> On Wed, Jun 17, 2026 at 10:33 PM, Armin Wolf wrote:
>>
>> ...
>>
>>>> I also checked the BIOS 316 ACPI dump — the stalling path is byte‑for‑byte identical
>>>> to 315, so the AML is unchanged and it'll still stall if pin 21 boots low.
>>>>
>>>> On the OEM side, I'm connecting internally with our AMD contact for ASUS to report
>>>> this behavior and follow up on a firmware fix.
>>>
>>> Thank you. Does that mean that my patch will not be required anymore?
>>> If that's the case you can consider it as null. I don't mind having the boot
>>> flag added until it's completely fixed on ASUS' side. BTW I have the suspect
>>> that my model is not the only one with the long boot bug on ASUS [1] [2]
>>> but actually the only one who came up with an actual patch on the kernel.
>>
>> I believe your patch is still needed. Not every model might get a BIOS update,
>> and no guarantee that everybody who possesses the problematic platforms
>> actually *will* update the BIOS. But it's AMD's call. I will happily accept
>> the changes acknowledged by AMD.
>>
> Uhm, right. Not everyone are crazy over updating everything.
> 
> As soon as I have a complete response from AMD and Asus I'll proceed
> with a proper patch.
> 
> For now, thank you all for checking it out and giving your time for feedback.

Maybe it's clear to everyone else but me; but if this is ASL used for 
the dGPU shouldn't we get someone from NVIDIA to add their 2¢?

Maybe *they* had intended this to be both edge triggered and that's how 
it got here.

I can't imagine this is going to be the only case we see of this.  So 
before we go down that quirk path can we get them to weigh in?  Maybe 
send to dri-devel and CC the nvidia folks that work on the kernel.

