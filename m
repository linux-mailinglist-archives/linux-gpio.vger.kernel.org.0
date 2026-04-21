Return-Path: <linux-gpio+bounces-35313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /455OXF/52ku9gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 15:45:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C443B788
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 15:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0191B3016531
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 13:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DF13D5660;
	Tue, 21 Apr 2026 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PhurUhXe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7743282F39;
	Tue, 21 Apr 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779103; cv=fail; b=clfR5BHk/ee+jOol4bCv7YRqdCqpwLd0Eqgbr6iqjnNWyGiQ/rpe8aDsOFsZWtjYfE3KZYrGTX3aDnN75KLUVaDAusIQa6XonFOuEeCgEC+LwJpcSgLkAMzhJERRWhYc5YLmQvBLbnXB77FX8VS/+SawbMpUkmTbHRVEfzSDsXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779103; c=relaxed/simple;
	bh=jNSmhmPjdVx5updZyKBn/rXrsY974QNoZ+CjFu6LCVU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bzqjvxAAx6MEoEjWIDqKapAy4uaxoiNIGc4+7JTPjKHsVyPpEPdxVDOZxQJow9HhZBE5b+MuUkBBWz7oL3dHFw/l6YJ8hXT6+aUm1+hANcmSF/mQb9elGEJd3ganyyzEY2h+26sLkHUyyZY5op2eA4m41UXHyMb2NYxR4qsokYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PhurUhXe; arc=fail smtp.client-ip=52.101.61.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoLIqBZGrXuhyWwfLIgprLKjMCF7vwMp+SNAz2uAZWHrfoy19vNPRT5cuRckd7Ky/3LtF4fslup08Mfhb/ro87vvoPIisLqfK7ddVftgapEvUVuB18539/U+fINLVfRZU4vuYshdQb/UacXPSXmp+TJGOHUoyRJbeTmX/71sObxh9IHJmgcCCibZBBVT3q5AOldsnjOEuBJocAeAE06rhIQNgVMP9hcUfymYhdMdDP/X0CVfFlYI45aoNnB1iHVG0kR4cnJp4vSBkh9iMiAEHSDitnSCLsme1h8RBLAmS5U6Fs10J7HiQbqxfrQRWemImlI96skYgzCEcTIvN7xkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khqRyDMEj4WNeQtQmju7NEvQAzVQaj83VJ8JBzbQnEc=;
 b=c0bPiC8KylFX38wRwtRqC3iOqlFngQAQSo9XMQLXEB/uEWlsiYN+6SsNT5KbI+SSbYJsJ3y2nQiD08vUJVY/GSBZPt/9b5IdmdeBRJGiVdLxo/rj9x7BdF8pev/2iNOO1/VInV3PfKcxnRJ9dAkyLhpcTNahNXKNNLLX9XA1D5qbDhH1dXVW/302TXsfACEKgxTqXQ9egEI13DSrZpHHm/fgnD1tFDL2+lyxFytHsAkKdtVyron0d+W+mO5X/VUtiy5qulpcbFAWZ+UDz4ltuWuyNIbQjyiw2rHOXSTfZgj/YEVCO1xkW26qrPjTnw0w37IGK8ZWohv2EKtXpw5Eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khqRyDMEj4WNeQtQmju7NEvQAzVQaj83VJ8JBzbQnEc=;
 b=PhurUhXeX9mOZMkZtCUXZEysUY1mKLtQZJO/NxCf1KKLRDuaUydvD1cCxNNb7n2Z8HoLUhe5CZRZ6Doel6jlExzVSAvpE5klmuXeLbY7ZJ9QMufX81NWIUC4PX7DQhEJXxwFbi4Nb/nevAXLdcmnGngSLUxW0l2V8RtSu8F7U7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.8; Tue, 21 Apr
 2026 13:44:56 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9846.011; Tue, 21 Apr 2026
 13:44:56 +0000
Message-ID: <86e5ceb2-351c-4bcb-a1f3-fd2f32bc17b0@amd.com>
Date: Tue, 21 Apr 2026 15:44:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: xilinx: drop bitmap_complement() where
 feasible
To: Yury Norov <ynorov@nvidia.com>, Linus Walleij <linusw@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Yury Norov <yury.norov@gmail.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260417175955.375275-1-ynorov@nvidia.com>
 <20260417175955.375275-3-ynorov@nvidia.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260417175955.375275-3-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF0000091F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::939) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SN7PR12MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: d37b4c9c-54d8-4224-69c8-08de9fac2c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IypMD9vfQNwctRGdM8QGNVuJm7TsU/wgLd29Phk/g4A+5Sc9SO+8DK1plYa07t2L1VBGC28Pft/tjjBhJ5DgVYGIlLe0ti3aiJYforoa/qjfC18Nd9hil+zIrxAndDQYOc2E5ZpyC/NtjqKcon7bqRFXkE7Ii2DVbni8kxsuerqdjoB3X+2X6GCulRZMBfFBlw1iA0nhlm7hr5EJ74O02SwXUBdkTz7+JLGlbid2FTLeptz36B/PoYvFFureZ/OjlaIB4jPq05glTbo7Kz6vqrx9GMkGBG1CN6aiq2M/lC3lgxH1+wTcC68gShjNbROfLjFynUKgqncTpo/TFCneAzSo88pBpjPUuX5sZ5K6APqZKQf1liUEPHHP8mjBl8XUsAe+Yh+FBdLp5qrcPfz6B+ZDDZYRsDHsHJV1dlv9Ja7CTZizM2NI/L7GjnokeIh/ArHhUY71g0I+MH2NC3xxltXduOA1MW+084QndDLBGoeDRrZrkhiEQ2GUfsBjQuL2naNL4dYVYi3AT6+Q0DoCc+quXnXaguyN5Fx8JfOf5N9QprpnEzOMQuDMlRtO2t8dl4Ki01pZ3hWA5FxnfDVYabe55wX8JQJNpfIsLCS0CGMyaJofUOTpc6lNa/g3x9hlSpsAhXFNamv0+kBW2mtWY0ySC0Nvby5pENtgby8gYa1b8O1YGrqd1pS4oufLeli4l+eZudFAEDv/V581MDSpkiJAaBzKIuFng2OVQ9CekkSHuW6pa9Sx0P5utLIWjexPqNJ+tjj6hbA5dOwriEKG9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnY2bW5HQ2VWa0JsQ0NGT1hyczZVN01BeVZKbjJaSWYyY0xVL3N5UnpIblBO?=
 =?utf-8?B?dXY4SWNWZEloZm04NXdxMGRsclJheDFKbHhWbS9FSGt2bnZ6a1JRVU9Gdytp?=
 =?utf-8?B?UmE3bU1XekFRMk1tbmtpR05aVFFhUWZHOWtZQmZ6bWsySDJIeUJKY2RVSDkz?=
 =?utf-8?B?QmlyaXAwVlJBZXVuenpCZnpNR0FyRlJEZ3YzS1JqSVp0NUJsTldoSThxTmJm?=
 =?utf-8?B?YnFHVW84cHV2YTRSb0RwWnVsajlSdlBzaDFLZ3BKY1BvZkVKMHBNRjlzQXpR?=
 =?utf-8?B?am02bXBQZEtySlVLWWN4WkI3Z2psQVpBckRrTURlNGJpM1phU1VTdXVWdGRG?=
 =?utf-8?B?R1hMbm5YaUpQOWp2Y1l4YkluK3pvN0xsWTZ5M0V6Nm40Tm1BTWRwOFVTT0th?=
 =?utf-8?B?WE1ZYjZES3YydEhDY1Q4cmxmQ1RTTk5xT3Aza1o0OUIrbEJCdFlGK3Nyem52?=
 =?utf-8?B?OTB2QTRZVmRQSVgzM2hIK1FtWTBKSHo0d1BWQTRxT0VFRjllOHpNQzI5ZmNX?=
 =?utf-8?B?WlNYV1dYYnhMMGpvUmx1eDB5NTJGWHFhSlpmTUhuV0xXT2Fxbk9sTkI4QjB0?=
 =?utf-8?B?N21uRTB0OHdmUTloYmJzUnQxMkRnY05CcGo3MDcwWkpqL3VIWkdyZ2Zmbklo?=
 =?utf-8?B?RHBNS1hobThkdnU3YUNKeVB1TW9jalNYaUgycWdlMTlFZmY5Rk9PTy9uQThv?=
 =?utf-8?B?RjQxRkx1SXNEZVVhMmYrRHpLU2NLVDFKbEp6eVJuRWJXVDZtNHFyZG4xd2pI?=
 =?utf-8?B?VUIrMWRLQ2NvTllXaXBtTXhaYmZhRWVpMUZNZm9ZOWF4Q2dPeEJKVE0rRUUz?=
 =?utf-8?B?OEVzR3pjYlkyU2lGdEVvcXkyYm8va0VOQm0zUHRTRTFmWklGUVB4Tk1CWVdO?=
 =?utf-8?B?eFVpMXRHM3dkMW9maGJSdHpJdnFkK3JrT3pjUXZBbDRmc053WXV6bnZYL1Az?=
 =?utf-8?B?Vit6RE9DY2NaL1hPY2V1alZNZWxnQUViY0FDd3h0YTZ1WW5ZK1Jidlo1L2Fo?=
 =?utf-8?B?K2RIZ1U4N2NvQ2s5bVlJNjEvTVJNMkNLam0vdktNeWxDeFlCaHBOU3RlaTA1?=
 =?utf-8?B?WSswSkVyMkt4aGZ1UUVaVHIyQk16TEVhMExHOGZOWWVQQ1dQQ2o1dVRPSkM4?=
 =?utf-8?B?MlpZU3JYbmoyZlBXd25sbGtrdkdqc0xNN3RqYXRVRnpoYmlsUkJPbmpNZHlS?=
 =?utf-8?B?anJpZXRINUNGTWhoNitQWmx3MFZQTEdQbkFWRTNEZDNHbG5wSVVVRjZMTnJH?=
 =?utf-8?B?aUtWRzU4NTArS0ZNajdrVGNtdkRYdnA4OEZSbmx0N2ZFZ2lnOFJORlhZdi9B?=
 =?utf-8?B?WE1BQ2tMZURrdHlLdW4wZFd3M1VRN285YjRBSU1KVEhJR1MvRGg1eHA4VDA4?=
 =?utf-8?B?OGQxNE13dUpsKys0Ty9UeWFkbjVTckpYNE9uTCtjRHp4TXM0bmZqVEhSdDJn?=
 =?utf-8?B?b0dVbGJSTzFsWmxqQjROK2F5ckptc3YvR0pvbUEyWTFFUEdUdldJZ01OeWdv?=
 =?utf-8?B?OU16RzZ6aVpIeW1sZVNFUGpIdXdGd21oNFIxdUNUekVYeSs4S3M0ajFxcXdj?=
 =?utf-8?B?K0tzdFpIL1l5VjF3azhuSkhKQWJ2MmRQTlh3dW9TTWlYeVNCeUVnNWVtN1JC?=
 =?utf-8?B?NmxReERmQUI2MkdxSmFyd3BRMDliZ0FBSmowdEhnZVoxc0dzbFJlSGRvRWF2?=
 =?utf-8?B?dXNpN29YM0xJU05PRHlyRTkxdFlMYkVTOWxqYWoraUZ2M2VjdjkyanBPMmRX?=
 =?utf-8?B?ak9UY3pBWDk2aEIzZ0F1RzFSczNwWFl5ZGVqRU5nRytWbTQ5UkVacVJ1WGZs?=
 =?utf-8?B?Tys4bHNhZ1ZuaXh5RHVVZWZ3VWJ3NTF4Y2pBbHJSWlVVbHl2dTlrN1FHK2hF?=
 =?utf-8?B?c3p3eTdzeWJ0WlE2MFp2disvZmgrOFl0TGpDclVEMnNGZHNmc0c1L1BTMWFL?=
 =?utf-8?B?SkRGQlFyNkQ5ZTJibzlSeHhIbEpJazJ0RUxER0hMV2lXeXhLeXI0a05YcTcv?=
 =?utf-8?B?RHpSR00wam1QSkdHMlFBY0JOTmJiaUdhSkJjQU5iU01mb21hTFRub0lQK1py?=
 =?utf-8?B?RE0vWWtrb1g2L1RQNGg3VTVhL1NoVGgycURaNXFOVVZaWUc5ZFE2MFA3SjFy?=
 =?utf-8?B?TFlBQzBPbjZrQ1pxT0NTaHVQSzJBcGJrLzlUaTI3OTBSOTBmWkZEejhKTjdj?=
 =?utf-8?B?ckhGdUN4RGdQS21LQ2JucUpYVnRJTGxLOEd6SS9TV0t4S3R3NEFxcWFia3Iw?=
 =?utf-8?B?TFlLOHppbGRpRm8rY1VMcnc2SGMrbCttbmJtMkdFOXNSTEoyME1tMU1GNDJQ?=
 =?utf-8?B?LytEZzRnUXV3WWhEMU9IODJHZHlwQWlNQW13UVB3S0Jzcmh6RS9Wdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37b4c9c-54d8-4224-69c8-08de9fac2c81
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 13:44:56.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx0M6Ewe99Rsh2RxPnZgdVvFuSTkcjBrqCDsXaX7DFXuuZjQnny/GHI+a1fGKjrj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35313-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,linux.intel.com,amd.com,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aka.ms:url]
X-Rspamd-Queue-Id: 1F6C443B788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 19:59, Yury Norov wrote:
> [Some people who received this message don't often get email from ynorov@nvidia.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The drivers reproduces the following pattern:

The driver reproduce

With that fix
  Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


