Return-Path: <linux-gpio+bounces-33677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMUkD/fZuWlHOgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 23:47:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B82002B32EF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 23:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A60308AC36
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 22:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE9A3A6EE0;
	Tue, 17 Mar 2026 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S+yOcfAU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E33A542B;
	Tue, 17 Mar 2026 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787624; cv=fail; b=OP5yCK5ErWGHqnHdQ2+UYYy9S2iMy87FWScrqOKQv0/BYBKv3dznT4YWlKHEtkhuXb2OTQgWMpGc3SzQT9nNK5n2oM7n4aTdg9Q0zJMQh/Mj8AkFnxAWjY7+IXSUh3vSFVTOBsEM55reazitb9p8mTHKOVWoJfBa8hcZS2dvUzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787624; c=relaxed/simple;
	bh=sSyyjgR6nuGyfPOj2+yxDMEb03GJuR54SrmqEPFUZcM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=On/hw7VM/FlBmS/XMOd7q4uwmwAxa62e8Qd69d78Jopa6ts9epqa9qD2bXALR8s0f1gwGkQmjlCTfQLWwbW1dq6KGth0XYYs0SGbWUNZG56j+ipLRuLJZYm3kCgrxpcuqM1Cw2o9uTkEEywHOKTGshQnzvl9MBBNQbwJr2ha6hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S+yOcfAU; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIHp0k8I39uJoVI5kBI8x0l8lhSC3xh1zjx/S1LbecZJHbfaz2IkkW9FRQRfY39IKSEPdVpv1AjK257OANUFcfS2cHk0JTRfsLGzVf1aHpRwxq7ybR7lD8s70k7sgwV0b+iacf8eJh4ClNEi3dnMNxaAY7xoJy+XEduPFvnUPoYPgGKaMzfVAbayipltrJMXqGICtVOxKsqpmCYyXsD6FivQzVnmXfbAebqaCKHOT0uWtAwYwCNwzAtrwO5diROMZqywWkzemWNOHuhPtA5E6uKXTWlOmEBxhjkdyQAhjFiuwM4/B/PBE23o3Mqe93p9dVXEuxI6zMupy4z4vocw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoF0q9aBQ6qYovS3Pf0xXFdOit512l15H8CVB8KvZqg=;
 b=Ca/U4auoq294r8QzcaUY9VrejSaQxdhpEqTb5OM5/RI/9RUIOxQlSktrvOY6Ne37vC6mODuH+X2eWXsbDiz3AU6JewAB/bcFU4xllbUoBqNFowsh/qD0ou15j8zzh5drZR4EjAw6M2wgP6aaFHUS7JQunKCdnxj+rkiLePJxGsC98ycGKZiBJev+gNWpOyUqCK2uiwDBuyhGUlv1smLqi42uqqp1bjCF2tTHP80yrR1qkrS5dzPsSE5avrP18Xj8uqMPDPqnV9vNVcmloar8kfwggG7biCpr1Ra1CgXtDNXwNL70bOhYC7JdXrWhL/FLiNSJ0bHQkstdHU/TLWlsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoF0q9aBQ6qYovS3Pf0xXFdOit512l15H8CVB8KvZqg=;
 b=S+yOcfAUmny3OVarz7pTy2HtBDt6ggcP2TQunAAGP+HNqpLKK83X/0OFPJCflI5nkFcSSFlfxpPOKo+xJXwZGPy9qZKlaVKdM1ObJttuVtJMwIz2G0DyZ7o0Eih6YWNxeofurpm6QX63cXQ55vDwaUXP9tdtpr7Kj8+WeJmEqnxDzzdSvw361elkOLmbm4PKSbyVtbxY+lgMmQBqyB6Povqe2OIsYnfqTy39787DvY3vl4WAQSR7C2XLAUaOePTFsz/oJizt/KnOfCMLF5AM8XkwOZtDHJNLp/byN9g4xTSCt9qB7bkyVXLN0vn+UBwpYm3l2mIp9iRrx3IkpysOhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:46:59 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:46:59 +0000
Message-ID: <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
Date: Tue, 17 Mar 2026 22:46:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
 <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
 <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
 <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb6d3e6-826a-42cc-fae0-08de84771935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	16FtsgNaisNE9MICeJLf3TsEvYzv1weHot+ImkprZRVH9ed7xVj1JK5oNPDrr306DL5NSGNt3ifIf1YGvaYZHrUHevEKb3S1b799v5vpFy8Or2dzNyqUnZWWDGWHIq3WTMMnlSrKf01jqF4GN5QYgANvzzaG4DmIXPmC7/ecY7oG64afy3GO4PvFCeOV2vRDP5wgPGNuhA77i3H5Ykd7s694dfCHVeAZQ6+vXLh9UGxHM45/ia56x4gbazFmHgLaa9+u2XWCO+RlXZIcCY/iRcfSSY5LWH+TyZPcBOJux385pe1hN7RYiykNUqzyxjH6QLX7csJ6DEIFyGGRu2RP5jNx+tGtEISFShJ+UTvTMF96jwhGW/vVIS8r7pw+GAbYP2o8rxM/HhKKa1UEMU/zWD1b4M9zm7D4khKWIrkxASF5J6WCemNtuHV1DZ92CJ33noXoPXEJ60s94kEg8JfEzW1mhjxQIxZdhD19koymyqWdjfh9CUt4gIzmjOfIVAlU6iyVKnqKcMB4YJgLjCrlbpZx3zYn53oPmsTI5yuSf3XChStktzyMwFrlP8PrBpJJe74aR3KNDcJROe4axg39I09Ab8HwUo3Rn5zyZd7iEXVzpR7fAAIoHB8lAwalZgj/hVpgWLNepbLAitDmHKncIu4mZDVoRWcVnIb31VA08isr01l7urlU6mDzwcWb9NbjnRlXrrkQEgh36z2mRssqqnhi9+ihXdSpFz+V3BxqwT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzhsL2dUWDlNeGR1RTE0WXE5M0IwMlJrTEV4K1ljSjZTVjJCV2pZemgxcXpw?=
 =?utf-8?B?QnVSb0xhK21PckJqOXZ0OHFDTGlza0dOZkFLZ3J5eHRtdzFDR052dGFNZ1F2?=
 =?utf-8?B?TDBCWll5dEd0NHdtalZtKzBBajFvNUFoMDFzNFE1OFJlSHVCK3BIU2lqcTlh?=
 =?utf-8?B?cEx3c1NMaTUyOU84MktVUVpYeVFCN2xwNnZDT2JpdW1OTW96TjJDbU0xMEV1?=
 =?utf-8?B?MjZVVG43aCtHbHVNTjVOWGlUclBRUUJZWm1uOEdJWFpLUVlsTW5NK2RaNlc2?=
 =?utf-8?B?Z2dweUpIajE1ZHg3NWplUWdZblJSTFNhM3NHc3Z4ck44SXJ5SzFSZmFwUDRJ?=
 =?utf-8?B?V1RjejR4UWhlT3piaU5kRGlWaHJYOWNrNU15aWxkdndHVnJBQjdUWWEyQzN5?=
 =?utf-8?B?cml5NkovUE1vL3F6ZU5BMVNUb3g4blBGdXBCQXA5OFdMNFdSa0ZNQ1g3eEVK?=
 =?utf-8?B?bXZlSjdSN0RTbWM5VHJFV216S0Iyd2hTR2VSVGxwcUk0eUFFSitjZnViVkl0?=
 =?utf-8?B?Q1EwL3BSa1VDREk0MU9talBkT1hNNkZkN3Z2bndQQW1MNkc0akFpdkY5Tmho?=
 =?utf-8?B?Z1JpL08rTnFhOVUybGRHNkRkeEV5eWVLM2J2ci9wa0RrUE53NjFHZkpkTGxx?=
 =?utf-8?B?TXhqMVFTckViQUJFMGNBTzdwV0JMREg2MWp4ek1pQ2ZjT0RUR1FlclBHYXZh?=
 =?utf-8?B?STNSTkRFSEdZU1Nlb3p6bGlmTkN1NzkxRWczM0l5d0M2WnNYVE1LeTVUeFhP?=
 =?utf-8?B?UFZ4SnNGVjVudXEzTFZMMnMwL1JVeGwxQ0RSVU8wYTlzTys2L1hBUi92UVVt?=
 =?utf-8?B?dzVaam84YmtvaWxUa0swbHFReUJoNDNCOVRJTEpDUk9KMjZMcjVEQ1JXbG1N?=
 =?utf-8?B?ZkFOWGhTcXRlbm5aSlRGUnp0YUJNWUZUWVlKTGxhajNZSXhDRkVZNmtBSExk?=
 =?utf-8?B?R3NnME42TGFVZTRKOVA1QzkrVURpVTlpT1FFK1lhcjRtVzhBYkdSYy91N1RS?=
 =?utf-8?B?OXhSL3RPYzVGektrMzdKQ1J5TW5BQ2F5cThsS2xqL1VkNnFIRXVuWUxJOFJW?=
 =?utf-8?B?cmFGS3FxcGJ2RU9ZRUkwZHJmOEFQVmQ2bWtXOE91eTFmNHJLNjA0WENUcmgy?=
 =?utf-8?B?cGdJNmVxZjY1UVMvVlBycTF3Rng2aS8xWXREWGxleDRNTUJLbjdSd3lBa1hB?=
 =?utf-8?B?byt5U0NDMUxzS3g0YktkS3N4T2VVOGRkd2l4M0lZUnNhZmwxSGtra0QzRnJQ?=
 =?utf-8?B?UXcwOUFOQjBpb1I4VzFDWTdJc0JQTmRnSDlzN2cwb3p1RGdrUFU1bCtFRDNo?=
 =?utf-8?B?U3lPZE5qT3RkQ2c3eE5KWVBrdXFNSmxJRms2NVYwTjk4a2lNcW1zeXRpR24z?=
 =?utf-8?B?UCtCWW9YOFgwbUljbjk0S0RzbnNoVmExMzliQ3pzU0thUDc1YlJSWU4yanVs?=
 =?utf-8?B?NEFGa2Q1Q3Z6VHh3NlVSWnNCcVV6cSswTytZbm5pNmRDZjQvMm9RRkVNU3pL?=
 =?utf-8?B?dGJFbDRkNmx6dVQzVmZmVEpZbTZncFprS1l6M3R5TWl2NjIyZVNyd205enIw?=
 =?utf-8?B?eTVJV0VrSUN2OEw3Vnl0NTl3WXM5MlpRTnZaZ3lMWGxzWFZKTDk0cFdXL3dk?=
 =?utf-8?B?cmpEK2Fudm9JWWk2R1Nmdk9SRDJYR0dHcVRqYkJtT09NY3ZKQUNMQnJSUWlq?=
 =?utf-8?B?NDRuMTlnQis5dU00NmZZZHBUVHk4WG9ScXNzN3czcDVqOVQ1NlFNOExIem5j?=
 =?utf-8?B?bEFnOTJxM09JUUtkZ2wvdzlvcGE5Tk5yaEFrZ2Z3RDFvN2dacFFVRTlIUGYy?=
 =?utf-8?B?MU9abDdhNFJKM1hzRFFocUFVQ1VhVk1PZ1J4RmwvTk5mR3JxN2p1VVNmYUk5?=
 =?utf-8?B?Z1VUdE85K3JtODUwZHFPZTMxSkdmak4wRm5sOEFFVW9SYzVqUU9yenRLbVRr?=
 =?utf-8?B?NE9BemUyVFlCYm9kdTBaVzRmNERZNkVEZ3NMNllibit4c2V6Z3NQSXVOWkIz?=
 =?utf-8?B?dGJpallhOHQ2ekIycHc2cmYwbGZGc3ZiSWtmaDBCcDJJS1J0UzJmck4zTFFh?=
 =?utf-8?B?RnlrdzdxOFNGeXU0L2VXYkU0V0V4bE43Um9yVHZxeHdLZVhyd0NQUWxNejNJ?=
 =?utf-8?B?VFNVVHBOWnJEM0EwOUUwNUVLOUVjZmNFOEcxaFlSVS9DUUp5K0NjalAweThT?=
 =?utf-8?B?VXkwTVdvNW02bGhiendhNkpjYkh4Y2lCYUczblVWckhPYjd4aEI3V3FFQUNI?=
 =?utf-8?B?TkdaRTJaOGt3Rnhud3V5OWE3Y2FEOWw4VXplakVkMEZzTFMwOEUyZEdKblFI?=
 =?utf-8?B?TUpoa2hjRW02bVEweVlPaCtENEZrV3BvQ1RpWlMyZS85ZFhlMGZaK0VYdSto?=
 =?utf-8?Q?ZypLlCZ6SjSCSQygDgCJztrMFMvL3n7v0cGqsGInCvvYq?=
X-MS-Exchange-AntiSpam-MessageData-1: t1cvJsirBwApyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb6d3e6-826a-42cc-fae0-08de84771935
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:46:59.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rxYG8rePWeqhraTEqXUlTgcLhOHspoJe4XelRZPiMlLFnHVhUjNAYGwrDgBTnn7QWxNwXru/q9dsmP5oy+FLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33677-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: B82002B32EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 17/03/2026 15:19, Bartosz Golaszewski wrote:
> On Tue, Mar 17, 2026 at 3:05 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
>>
>> On Tue, Mar 17, 2026 at 2:47 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>
>>>
>>>>> I am not sure if this is because these are child nodes of gpio-keys?
>>>>> Obviously this is not a proper example, but something quick and dirty
>>>>> for local testing :-)
>>>>>
>>>>
>>>> Let me create a setup with GPIO keys then.
>>>
>>> Thanks!
>>> Jon
>>>
>>
>> I can reproduce this with a gpio-keys setup. I think you hit an
>> interesting corner-case where the consumer device is the same for two
>> shared pins assigned to its child fwnodes. The setup doesn't make
>> sense really but I guess this shouldn't just fail like that.
>>
> 
> So the problem goes like this: we're using lookup tables for shared
> GPIOs but they are not capable of dealing with two fwnodes that are
> children of the same device that share the same pin but are themselves
> not attached to a device bound to a driver. While we could extend
> lookup tables to take that into account, I think that the setup here
> is so hypothetical, it doesn't really make sense to spend time on it.

Makes sense.

> Does this patch fix the real problem on the tegra board that you
> reported initially? I doubt two separate GPIO keys, share the same pin
> in real life.

Yes it fixes the initial issue. However, now I am seeing a different
error on the actual platform that is having the issue to begin with ...

  ------------[ cut here ]------------
  WARNING: kernel/rcu/srcutree.c:757 at cleanup_srcu_struct+0xc0/0x1e0, CPU#2: kworker/u49:1/114
  Modules linked in:
  CPU: 2 UID: 0 PID: 114 Comm: kworker/u49:1 Not tainted 6.19.0-tegra #1 PREEMPT
  Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-44496888 03/15/2026
  Workqueue: events_unbound deferred_probe_work_func
  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : cleanup_srcu_struct+0xc0/0x1e0
  lr : cleanup_srcu_struct+0xb4/0x1e0
  sp : ffff800081cbb930
  x29: ffff800081cbb930 x28: ffffd79ff96d0c40 x27: ffff000086059000
  x26: 00000000fffffff0 x25: ffff000086571200 x24: ffffd79ff94adb10
  x23: ffffd79ff86400c0 x22: ffff000086059390 x21: ffffd79ff94aa040
  x20: 0000000000000000 x19: fffffdffbf669d40 x18: 00000000ffffffff
  x17: 0000000000000000 x16: ffffd79ff62dc8a0 x15: 0081cf5fe0409838
  x14: 0000000000000000 x13: 0000000000000272 x12: 0000000000000000
  x11: 00000000000000c0 x10: f7c5d06d757a4b3a x9 : 15ccf89dfeffb5e1
  x8 : ffff800081cbb8c8 x7 : 0000000000000000 x6 : 000000000151e960
  x5 : 0800000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000004
  Call trace:
   cleanup_srcu_struct+0xc0/0x1e0 (P)
   gpiochip_add_data_with_key+0x3dc/0xf68
   devm_gpiochip_add_data_with_key+0x30/0x84
   tegra186_gpio_probe+0x5e4/0x808
   platform_probe+0x5c/0xb0
   really_probe+0xbc/0x2b4
   __driver_probe_device+0x78/0x134
   driver_probe_device+0x3c/0x164
   __device_attach_driver+0xc8/0x15c
   bus_for_each_drv+0x88/0x100
   __device_attach+0xa0/0x198
   device_initial_probe+0x58/0x5c
   bus_probe_device+0x38/0xbc
   deferred_probe_work_func+0x88/0xc8
   process_one_work+0x16c/0x3fc
   worker_thread+0x2d8/0x3ec
   kthread+0x144/0x22c
   ret_from_fork+0x10/0x20
  ---[ end trace 0000000000000000 ]---
  gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to register, -16
  tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with error -16

Note this is on top of a Linux v6.19 kernel I was using to track down the
original problem.

Looking at the above there appears to be two other issues; one the warning from
SRCU and the other an -EBUSY failure when registering the GPIO controller. I am
guessing the warning is triggered when gpiochip_add_data_with_key fails. I need
to look at this closer.

Jon

-- 
nvpublic


