Return-Path: <linux-gpio+bounces-35078-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K8qHna83GliVwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35078-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:50:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B263EA0AD
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52D33300C337
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 09:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96733B6C0A;
	Mon, 13 Apr 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fH9kgHaa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAB3B47C7;
	Mon, 13 Apr 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073801; cv=fail; b=oSZqUUkyq2/GpJmjN5Y4mxUwW7LGrPR9isfGGvzvSmZhO+QMo5VLi9ImIN5qhou58OcGgpbNqBMNVSf93LFVdOV6A2iZKlw3fU3xEXClIUg+MhqtIyNTBcgg/OnaOXyBtZPdzMJeHOPriOv5siJA5hkSLgliMAe1UFhOWuXDGHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073801; c=relaxed/simple;
	bh=igmQrlavB6JUW9xEJx8amUyY2HIwfb+m0WNzOS4l/lk=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l3lIUFbB67WYxSmiV35g76eXQJVRH0BwVCwrws/uyFPnIbMbxR2jPXuZT/5YeCmwdvBN6YHCWEKvfWBmcs3oU5q2AYKZ9aKG8F36ccX55KMH+nQZHID69IdH14SmHBjELVksbZ5powEMaQQR3pdjzVetLP3wqgvvL109Pai3itg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fH9kgHaa; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSEeNXe0tQ/BSBRc8Mw/dnK92cyW8zQGmArB6o9kwW1joTCVjJYWVftGgupPZ9FbE3da4ik78iDUhgPfLowgyinhmk6SBBYoSJIkkKCCOmNIrzU4xnjLiUMMQ6SaFSwTOMRiijkvMB60yZdYA0TnYIC/jYlog7YmtzZlNi36jUtyn21SVfosWMjlIUfUVwwCOvfGixNDcChqK6Q49xDhA6LlG0GEgnPEWrakWWhkH/JiZ7XV9XeyGrF8HUs6ko4edV9KLTNBKPplcZg7NoGET//PNXWryLCPIKe0tYDKIDPLk7Bt1Q5YEmR0Y5+xTOkUfF1WidT6iUZUeX7118EdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89rKApablbImSYOTduYme/Cl3KpRE95ag6QvNaa+hnE=;
 b=qBkZ4jXQyU8Ix6G17k73XA5RmkplINhPgozX7rKZ19Sr3gY0d7AjC6fb8lKGtx1nXYMJs6bd3kq6mUMww3EwW12oZb0vAVw7sXHyz6HWtQfgALItVWWP188EYECLcR2YCJCMEVOQp2UcgGBVZtI4niJfjN6OO66rBItzjmHx0xgNsSWESbXlE15KB+E8qyil4dYZyS5Jz6pHCCT5lJ9RRojYGyHrYKynv2G21PoY6MRLc1ZQYAqw40JsiV0FlnpNX5wgMg2HOjLtbkL3+YoLpcAjL2hlcJgJPTTpTDgYRysJLPCiuvt4rvSH7FSu1IS0vYVHOnN3E0AQCXdE+SBQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89rKApablbImSYOTduYme/Cl3KpRE95ag6QvNaa+hnE=;
 b=fH9kgHaajUP5lTRrm4l4e6JmkH4nd7qTgU/hjQe3D+rU8qQAzh8IUimQhIFhfp3VKnbA7fXNjp+Fy/Wp47uMWsC0f43/FO0CBuU3DhTB7p3XaTuKW97aGsHIulGgliWPhxJcyb0ppXjnGh4eVjZJM7xIweS3xKp8oD1ul2wx+6Gjod/YdMytGOfiKYOl4D2COINFs/8bY8NWzAsXkeJugp9KiQ6pmsZuP7D42M4IXsqQRJIM3LrN9gmdDDqCcwkpRqEEQ+8X3X7K8Sj5ZH+IkAZPum0QtS3ufVtv4rutkxDOQ3ZTNBk0UGQwAMOovZ1CfCdYOtP7MZzysIcKm3tM4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB7640.namprd12.prod.outlook.com (2603:10b6:208:424::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 09:49:56 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:49:55 +0000
Message-ID: <19f390ab-ffa9-4237-9f24-ead07b627a89@nvidia.com>
Date: Mon, 13 Apr 2026 10:49:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, pshete@nvidia.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
 geert@linux-m68k.org, krzk+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
 linusw@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, rosenp@gmail.com,
 sven@kernel.org, thierry.reding@kernel.org, webgeek1234@gmail.com
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-7-pshete@nvidia.com>
 <9408f231-7a12-425c-b8de-2990d3162bb3@kernel.org>
 <097f71e0-cbc8-44e3-ba60-8bac79cf5217@nvidia.com>
Content-Language: en-US
In-Reply-To: <097f71e0-cbc8-44e3-ba60-8bac79cf5217@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0614.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 573f1d5e-81f6-4a07-4d36-08de99420492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bIEq4eGTMTi9hLsA/WxEUmacH7RTw3QEqWbjUJmqvXPvJsmezuJXYVgjOaohfyLFr7T6GgVRB/b4E88rihStwsNjEs7gtefq3WX58ZZSqcsXuX1oUR4YNho1khC8mMkPbuk5lmrG9HavGgZsjh9152kKSIgfT+dpqPBaBxeSYtV3VuxbDSploKfQzwYAsDRzVgjwNHj9p9lwPHlUpIGhFcniHcRmmtaAasypaMYnQhHX/+Xt3uEaLsO+bTBkx5kCI8c+wCFJQ43swCA0godatEm3Rj4fPF+MvxT6wr5zXM1ULUYAbEt1J8dXlCkpj+KqpCJIRgs1VWEBeKgrHWceoJweWC2vdykMLNNKnX5CWbAzavT5i0sRh99uBWLobjCbyVqwN19Yr1aSXpBj55QHwlq6pa/aV1YSwZeE9LMzTHoBJ1jw5H9agUB0CIyPSMccZYRK+oDV0d1HvCeWejDTbgR/usnyFcPovKeoAMHnSHVd3dhIxCo4Y2Wwg9zJ552tuCk4SJoa59vaR3wPqwMcCtTOObSPe69sa4yyPixclv1jqFtIYyvvwX/zfOReoWlypwVfduXgfh50K2US2MreiYH0+0MACPmpNNroyIrZ1MhMu2bfP9yNZPeUXLqQN8GCwSDPoGoP8umm4siA0dv841f+wd9U6dhgxfbdmMGjWuoqaqabvMoMndoHsLBvha/vrbKwBD1vk7dVo/GMgSJSVkIGDvx8FHMCfbba2eDk0CBLXY36JWGi+81uyjZPls1ywMDo1rKovO5BZqbRImoaVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3RMaFlQK0pkeWk1bWlUWjVXbU85aWNGaVNwZU1TbmIyTTdYZGdmMzF1clNa?=
 =?utf-8?B?SVc5ZXBJT3FhYUViWDg2YW01d0hZd013TElTZGYvdWpTU1YvQmlXRHlJYUEy?=
 =?utf-8?B?KzN2M045b1ArbndLeEFzQ2JUMmp3SnM4aGVQbXRiNGYyVGRNV25TbkhabU4z?=
 =?utf-8?B?bVZWa01CRkpUTjJvQklvWDZPNWQ2NnJtdWMyVWtnOWExaTN3UnVkSTRLd3Fh?=
 =?utf-8?B?T3BrdDkyUXF3OUptMXM2bkl3cVZwK2J4VndlNEpOVGF0emJCZCsvRSt4Y3dD?=
 =?utf-8?B?Ulp5Q3I5TXdTV0lqWUVLdWVSaTZDczZuY3FWelNObGFlSVNWaFovUzhIcVhS?=
 =?utf-8?B?K2M2R29mbXhTSm9KbEtLUzJPY20rTUN0dUorc0Q1RjlpTjNuOCs3UFd2ZUpM?=
 =?utf-8?B?Vkhnd2lnWGtNY3hwMGhrclpEZ3FzcURpOHUvSjRPQjhySG42NUFrMXRnS3dQ?=
 =?utf-8?B?TFM1Skl5MlNma1BpcTJrNUZZcHhqdDhka1ZnUDQrN1lxN3FZM2pqRHF2MDdQ?=
 =?utf-8?B?YWNZRGJWTXVHVHVoeUVIZ2V1d2wyOGVqM2FRVjE2dEx1d3NPUHIyb0dObEYy?=
 =?utf-8?B?OW5JN3BQTVZ1cXNOc3hFWVdPU1VzVjkyemYrUHBPc21RdHFGQmJUalEzTmhX?=
 =?utf-8?B?ZCt3YmFNbExBYmoyTnQ3UytCWUVNYXlDTFZzTUZWTTRzUjUwY0VQaUtMaHNi?=
 =?utf-8?B?MXlSWGtOck5mUCswV0ttTE1CL0ZKU1hlUkJyT2hvR0EzSmdvcXV1c213U3k0?=
 =?utf-8?B?cGp5eUkxNmxEZ2pKYmFBKzNTa3p4L2VCOVNzQmdBZjRvZGtCOEI3dFpSUDRO?=
 =?utf-8?B?Z2orL1NuTXVPdzZhbkVMNFllcEF4MnJjUGFwbDhwaHpyM0JnbXYxYS9Qd2ps?=
 =?utf-8?B?VGNja2FpZU01QlpmSk1MWVJQb01iQ3pvRzMyY0doY2pydjJwWmNPQk5XckRq?=
 =?utf-8?B?STkrRk4vQVF6TXVvNm1qdER0UURwY081WFI3amVRT3Y2Ris3WUdLelRTZzMv?=
 =?utf-8?B?WXJxQlNjMG45NXhDNGdLUExuMGYrcnlaQ09CSnJMNGY1TFk3eXQwcFV4VDFH?=
 =?utf-8?B?MTZCZ0g1OVduVytuZGxKMnV5RUw0VkF4VnFET2RMeGJ4OW1jdW1KaGcyV1Qx?=
 =?utf-8?B?UW9uTjViOVhrTEFUNFRlT3oxUkNTQmVvNnQwZ25vWXc5dTRZYzhSUjk2YU8z?=
 =?utf-8?B?Sy9iaDRKUTcrdTVHazVISW9jRmV2eHp0cEF5RnQweHpNQzgydGg3TWpBdjVn?=
 =?utf-8?B?cVZHd1NWajE0SXp4WGVwYmFTcnFmdFVSMnJEWHJRTnRUWmtCR0loczRWZ0I3?=
 =?utf-8?B?aXJHV0N0N2lZbyt4WVdTYWZQQzBIaTJCSVVpVUp1MytMWXFxYVdqR0k0VUNL?=
 =?utf-8?B?OXU2eGpOaFVsOXpJbHhBNnRqMkJOMUFnY0VKUWEwRG9tbEY4b2UyenM1VUN4?=
 =?utf-8?B?WVUySWFuQ3lRclR3RTF5QWRyeW5RUnh4MzJYbFhNa0U5YjlLQ2JjNXRzc045?=
 =?utf-8?B?MVJQRVJpeE5XQXN2dldURlhua29QTER3d1hCYWNSVjRoNDNjcjdjL2x0aVlQ?=
 =?utf-8?B?Q0h3ZnhYcXlaMEx3Um10ZGFRUzVFL1pxcGRTUXFtSUkvbFQ0TWI3RTdqd1cx?=
 =?utf-8?B?ZzNVQkJ2b0xsQU5SczdQNHhvaWhIa20xMkk4R0VnWTMzMGlIcCs5TXNoWkF2?=
 =?utf-8?B?eUp0SW1zcytqdTRSdlZXU1FBNEVhQmhuS01kbG13QmV6a1o5K3JWZXltUmxo?=
 =?utf-8?B?cW9yVzVrNSt3VUhPSEJSbkVCMGRoT0NTNy9pRmNVOVd3M3Q0Wm43dnNxN3pW?=
 =?utf-8?B?SkdDcFJFRExiTDJ1YzhWNUFadkFTREhhVlNOejRVWFFzR2hnUmltMFZtejVz?=
 =?utf-8?B?UU1Tc2JCc2xOWWtldWhPbjJJc25ZUG42NGZCakR1ckFxSEJDNk5ObEUvYkdz?=
 =?utf-8?B?SWdRVldPL0VrZ3JCbnlVeDAyNHZ3NWdEOE8vckVSaldSZjEwOWZCeVpsLzlM?=
 =?utf-8?B?S25ZNXhDM09PWXVLbFVqTE8vYUtteW1HN0tGREJQcDZ6YnovSmV3YWp4YXBI?=
 =?utf-8?B?Q05ZV2RsOFczUklqcHFHK0lUeWp3d0dtVDUyWHRKckx4cGZMQUFlMjZIZEU2?=
 =?utf-8?B?TzdMa2RKWVlBZEhEc2pTTGpmV2NwbCtDMjhNZk5nWERtVFI2QUZzdXNaZ2th?=
 =?utf-8?B?VXk2cGtEZURlZWlTak9VU3hWMHd1VlFhaEJ4ZlRKNnNIS0ZWMjVsVExtSlJq?=
 =?utf-8?B?Qno5aDY4WDJ4SjdXenRTMlI2eit2MWM4Ny9TOU1tdFZ0SzRPeWdsUHgzU3A2?=
 =?utf-8?B?WlhzVzBVb2k4OGVvQjZYaEk5Tk1ha09Qd2VMeGNOYlVHM1Y1UG9CTnEwdlZK?=
 =?utf-8?Q?0hid1YPBKK78NfmqiJByhovt8AGS6K/KN8vLnVXeUzSmj?=
X-MS-Exchange-AntiSpam-MessageData-1: iYFSQu2BBsc/dw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573f1d5e-81f6-4a07-4d36-08de99420492
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:49:55.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPBy4/beCU2Vro6u6pNh9N6xB0GBKGQrXABieHbn/jQ0WaE3Ku5/hjrnXTy/24ph2soJLtVRdHiHdnmIdVFYSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7640
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35078-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,vger.kernel.org,arndb.de,oss.qualcomm.com,linux-m68k.org,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19B263EA0AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 10/04/2026 09:25, Jon Hunter wrote:
> 
> 
> On 10/04/2026 07:37, Krzysztof Kozlowski wrote:
>> On 09/04/2026 15:13, pshete@nvidia.com wrote:
>>> From: Prathamesh Shete <pshete@nvidia.com>
>>>
>>> Building the Pinctrl driver into the kernel image increases its size.
>>
>> That's obvious.
>>
>>> These drivers are not required during early boot, build them as a 
>>> loadable
>>> module instead to reduce the kernel image size.
>>
>> So you replace built-in into module?
>>>
>>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index dd1ac01ee29b..f525670d3b84 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -711,6 +711,8 @@ CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
>>>   CONFIG_PINCTRL_SM8550_LPASS_LPI=m
>>>   CONFIG_PINCTRL_SM8650_LPASS_LPI=m
>>>   CONFIG_PINCTRL_SOPHGO_SG2000=y
>>> +CONFIG_PINCTRL_TEGRA238=m
>>> +CONFIG_PINCTRL_TEGRA264=m
>>
>> No, you just added as module. Why do we want them in upstream defconfig?
>>
>> Standard question, already asked Nvidia more than once.
> 
> Yes :-)
> 
> Prathamesh, what we need to do is ...
> 
> 1. Add a patch to populate the pinctrl DT nodes for Tegra264 device.
> 2. In this patch, only enable pinctrl for Tegra264 because we are
>     lacking an upstream board for Tegra238 for that moment. In the commit
>     message we should add a comment to indicate with Tegra264 platform is
>     using this.

Thinking about this some more, I think I would prefer that we skip the 
defconfig patch and just add ...

  default m if ARCH_TEGRA_238_SOC

  default m if ARCH_TEGRA_264_SOC

... in the respective Kconfig files for the drivers.

Jon

-- 
nvpublic


