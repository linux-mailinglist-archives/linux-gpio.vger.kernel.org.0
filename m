Return-Path: <linux-gpio+bounces-36438-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBZ9AYmX/WnBgAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36438-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:58:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8754F3693
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E4EE30104B1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 07:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC213376490;
	Fri,  8 May 2026 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="aq4YcE2/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020103.outbound.protection.outlook.com [52.101.46.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B0A3815E1;
	Fri,  8 May 2026 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227074; cv=fail; b=g8XGSgyRQx6yv//H360DnLdBXnNAuxpLFfCAeOBBEumlkuz/AnSHVj2hWnrf3VjmjIvcYFQU/9f+GlslG8ak6XjhtnFhUEDji31P96lhM6Dv/mk/YvIxNTgPwMJtk4BCnS3zcYKJsFeCNlzyfydj06s47+pEzLm0QVXtsqxuPhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227074; c=relaxed/simple;
	bh=7JXjCUHr3bZW2XCWFI1nq08x/u78dzkW2IE/+diA5zg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nUGS4hJqEM/cQWTcgy8sy/Y+ZRbcjNhwIl0o2XUPfH82MtCKChLLNtAhgHcEu4lJjCVecyg2A8U6gFzy8gBKc7xcMLq+CwGJeRgva85MgKKNLmj/jRCG01vWis7uTYMI2SY8GxkSRWchQ/7IR21+2MX1g317HfSalZOQfc/0F5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=aq4YcE2/; arc=fail smtp.client-ip=52.101.46.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TErgyUTQZonhThWeFTUr9qs3WfOy6J6jfYyZdti+klIteMcBrcxe8pgap315mwYWQn/CF2xuzAeRwy1XacxlbNUgfCNnzBYahU1imb52W4Bti6q+/TyTtvCruqh1olTxkM+lxLBQ7ssBW5McDf0UWmIa7Pd65ka34v2ZGbpP7UUrJgpk8Bow5DLICaNRbYCsoJh/hBbDCjxzqkYCY0mroT7OF3fwCFqX+9RQ+v/j4K8vlzVQzpYCJwHsj2mm4jCbaiOaiukVpyiJb3pUaCQqfBxk7Vi+IcvK4Ba457KA3zcxvMvL/ge57mMZkfXo9LvsoV7y8hWRAJuPWCNmly5CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQyPmDMam7UHZoT0de7LtgeG+B6kk2T77DSa3D9Lh6M=;
 b=i+BT3VGyY+O8s7hO+yKiMMl9lhZQMZTS3UYZcnP7XqvyDJ4XpzK3wfmFCcmkGpoV8vw++n5a4/6eijgmMwnp4e4ahYARxtCROiJfyc304uZQMH2xanDcN+SdAgSCzgndsTsOy3PDA3hc5FwOSprtiNtIcmknoP46yXeHZVB/Wa0PupzJZ4QXzlE1KTfonA3DGGjpVB4SCMX+lIo0wm43LbwTn7xwC4nIBAjbmJTwi5+T4Q2hhPUrlhuWeKG3qkAOlcGEToeJvGh/KBGuCDvprbck4nDd07Bq/X5LbuxuRbCI3AGZyS16mb/EX8Xh99lQMzNbuZxTJUgKQ+wShjUUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQyPmDMam7UHZoT0de7LtgeG+B6kk2T77DSa3D9Lh6M=;
 b=aq4YcE2/iESFrn5/HmOheGJP+bOdGWORWil1UxBFJvrHVmXhuizXdsh2OkHCKsrpWFUsJ7a0g0Ux5Ly9oOYVAKnq05WqSwKIhP9l9oTQKESZebB/HzFQQIXoATtBkERsNTfNqvbjeCnfemlrwgXN64DVZZL1OBDPJKqu/4YKjNRUc3CNccVtNgdg6BcHBfuO4U6ZI+lw2wS8sr59Z2BxSvgufi0jXacNfjPv8mxeBmZRKvg3oMV4pHf7NRJ5yDE6oXKvsMhV4uRawhbG2AUn/0LGyqpO4ttmEb2nci6u7zZWM9H+8YpqA3Lu9VUWMOPsevZgJPdW9D68UL7rkRbong==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 DM8PR18MB4440.namprd18.prod.outlook.com (2603:10b6:8:32::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.16; Fri, 8 May 2026 07:57:49 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 07:57:49 +0000
Message-ID: <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
Date: Fri, 8 May 2026 09:57:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
Content-Language: en-GB
To: Linus Walleij <linusw@kernel.org>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
 <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|DM8PR18MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: 450edb3e-7db7-4fff-f256-08deacd77f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b+p/3DuNq1k3qUswH78gmGLRe/SjI0l0smfxgCv9FhNOA+a2g/GqDhRI2vuiSRpPJO6ZX4cn1C6g8M7OKjUyj7nIj5gnxUoIQTGleEE/Gf11s88rtO/SGLzG/e/dLtu2cjXJJh7VFogdePyfKbdrnNvz5DXDUckYTtj3m9b5LCLhU14kgBoKGhY7+e/8VniE08H4mH3iAxFExQJ8EN2ReqKw4/KmnQ91BFwcQ1gngA5FbUEppm/9mH0s8k4uLCqqmZIz39xRC88k86gTHg0twoG7AUXM9tEa7ahCLsw0Y/BUfsgTJF8eHzCaEu7HamKP6uOiMpte4UK4cQtQ6EIn5rbihyMqRggzjJzUUVZ/K2af7QiXs49cDqxQXE9hH9XdiHBGTyuLJt06sPfD+gpaGsWJq5p7/M2ylE1m/gRl3frTq2xcLvK2dndVorRqp5KHESfqm3xl1wamjUke6tzmHAStPTSjyaDQl8mfCrDirQae/6hff3J4GS6yjGWVvmdddd0upMB9rkGNnAsoNYXfITERUhDSo9DkCt90c8BXwvf5HeCOJ7FT5sqGK33WFV+QKs3AoaE6Tbv7iwQXC9No3E0Papjxgs+bScOdm+5jmznAn2oLvrJuxkrfuySP/Cx/D9ArlczsGdHOGZ2VNDr3GcB8GXSlsyVpIHLwS7ezabzyOLMXTSTZrAb/Cvvx72Dl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGVXdkNaVWx0ejBWNC8xclE4dE5RRVBpSEVhS2QyQ3RLaDcxWWNpREcyRVFy?=
 =?utf-8?B?UE04RUhndDNRZEhsNlR3SEc0TFo4b1FhYjd5Ni9ZSGR2V2p5M0dWQW9wWGdz?=
 =?utf-8?B?R2NQRkp5Q2c2M1IyZ2VRa1pvSHRQYVhQSlR5RSs0RkxJeXFtTlorU3Q1eFdj?=
 =?utf-8?B?Y0MyRURkdmgxSFM0UWQ0eWtaMU51VzlhUzBUUEl0TTVaekIwWHdVSXJCSjJz?=
 =?utf-8?B?SUtCRlZFUlBpaUV6OUVyR2JFTWp0dXBaM016SWI1U2tQYXNxWTdCU0o2eWgy?=
 =?utf-8?B?OGZSWFhXMFhjR3B5SlRnS3RHb2s3dmVmeWhVQ0xRN1BuWEJIZ0JDaTZnRitO?=
 =?utf-8?B?UW52RDJOV1gvck5LeWVnQmZrbDF0SlFWY21jU3RTSUpCWlVhMHRoeHFPRWgv?=
 =?utf-8?B?WDRQd0xvN0RPSUw5YWpWRWN0WHdNYlBhYjE2TUE5bHlEL0dJeENpcFdVU2dX?=
 =?utf-8?B?VHZBZyt4WldNNHpCSHkxZ2V2TzA1c1pEN2NsU1hRZXc2WVRvOFNvSmo2SGta?=
 =?utf-8?B?bnB4RnJYeW1ITnI5SFJHaXNhUmxEUVh4eGJGNG5WbnVHRUVzNWh0elVBc3gr?=
 =?utf-8?B?VEd2Rld5dEhnN2VBbzl5VmFNNHpkenExLzllYU9JL0lqNm1aUmJhL3ZiOTFF?=
 =?utf-8?B?eDdZR09HZ3dvUS9pNVIxTzFnT2hmK1ZrOXJLRXZCcXllZFRwcGU1K1c2ZzRB?=
 =?utf-8?B?K2pyT1FCMXdsRlNuSzhuKzd6Si9sbVVwYkFaRnV4cWNmZFJlSHZQbVl4OWVv?=
 =?utf-8?B?R3ZYM1RPcDNPUEI2dHhUMzQ3Vi8rdlVqUllUaHdPTnFrQkdVOVd6MlEvS3Rq?=
 =?utf-8?B?U3RLWStuVDZnQ3BwQjVvUERwMDlMVlQzRmtBSzNnbW1TMFdBbnVtcHBsZWli?=
 =?utf-8?B?ZENLRnhMWGJ2cU5QTU1Ram9ObmQ1ZzJvaXcxazQ1QzZmWTJ4eHZrZHdnNG5O?=
 =?utf-8?B?ajlmdmd5WFBJdTFzbktPK05GR1BTUVFtUHRnUWRKUk5JY1R1S09SNE5pWWwy?=
 =?utf-8?B?TkNYNEVwaVBYM3JOeTgwdlh1bGJvMFRySUw4OGpFdENZVmc4OEhQVTFPaXRI?=
 =?utf-8?B?SjNodDB0bWpVWCsxS2FBb1F2NG9SNVlvR0RHT0p4bjJ6RHhKZXhvMjNzN0hD?=
 =?utf-8?B?U3liNk5sVGN5bUlFazVDcWYzMkc5akppWmprQlllc0xFbDZDU2Q3ZjhXTG5u?=
 =?utf-8?B?Wm9SUnBEbDYwWFpzNmsxT3lXSE9qUXRlOXBZajFoWkM4V09aZEpLeHdqeG40?=
 =?utf-8?B?Y213TXZvLzRPaXVrUWVXWlh1RXM0cHJwT0tMRXBiSWpnbHV3ZTh1ZExVUzFr?=
 =?utf-8?B?UExiS3V1SXlwU0RpbnZUUWFZYUVoMmhEUmsyc1hBK0ExRnRyUGhkNm52QzZm?=
 =?utf-8?B?Q1ZyU0tlK2xrYkpMRGcvdXdRb01pOUpTdFREa05Hbk41d3hOaHdxTUFBOHZw?=
 =?utf-8?B?TnQxMWExVjR0YU4vRGFleFEyeVRYcE02T3RqNFZNcWxzSm54RFZJT1crbWVz?=
 =?utf-8?B?NFJmTzlPZGZhK1BKeW9Rc0x0UTc2UnRDeUlKTjBXcC84SWVzQ1I2VVJ2c0Nx?=
 =?utf-8?B?Z0RudHpZN1NBZm1OT1BXWFRWeVpCT1A1d0JJQ0p1TzRRM3hqQ3drMk96MU9s?=
 =?utf-8?B?SWMzSS9sc01oLzNWSVEzNGFURnVJRTY5K1g4b254cHV4ODRGUlhkakcwdkls?=
 =?utf-8?B?K2ZKOUxNYXI5V01EL0g1UTV3clVqSFg3VmhOUC9hbGtRaDBLTUZjU2RYQU8z?=
 =?utf-8?B?UUZwbFJNT0NVZktCK1FyUDRrb3h4M3Q2SmlxZ3pLcW5VWExDQUo2dXlRQTlE?=
 =?utf-8?B?QW5NYUF0NXdVSlJQSzFTWVZXMUxRbmpNM0VLN1lTYTFvVzVBVS8xR3lFcDVt?=
 =?utf-8?B?MVM3cHEwSTJMVzF2bFkrU1pHcmE2YXhRRDdIdzZKREVlWEFNeFU5Rng3WktZ?=
 =?utf-8?B?aFBBV0pZNkVnQ0RGSDJpYktnK1B6SzBRR2pkOSthNS80SStMdkxqOFZlVmVL?=
 =?utf-8?B?WlBuaWkzdStuYk1hLzhhZlBDTXJLSUVGUStrYWxtY1FqSTExdno1eGlubW5w?=
 =?utf-8?B?NTl3NGIrdFY0dGx4TGkwU3J1RkY3bmJsZWpjVHlQblNBSHRubGdIU2o3VjJl?=
 =?utf-8?B?NnZQSWY4dUprMmhEWUVyME1UVGdERVdUN0NwNmVOWDJaZm16bkJmeXFtQUtW?=
 =?utf-8?B?RDhFMjZSSUZjTUk2V1B3WDMvM3RFMGFpNXpXL0JUc1FLOGdBanVGQXJjL3g2?=
 =?utf-8?B?MWV1UkRER2xCekdJVkdWYXp4WWEwUEFHTytCcTRodFcyRVhjTVVnNzRwdDM5?=
 =?utf-8?B?UXhDSWpBcjJHY2VGMllEU3JyektZcnJvdUFGaU9UL2traVp5eDhSQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450edb3e-7db7-4fff-f256-08deacd77f45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 07:57:48.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFOdgle4yPuCY9Trokz3MrK0QbpEeEAK7BkRFca1KdZJLnunFiWEuAZArrfP14V1cJe1boIjAGbJFQYlVF+OdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR18MB4440
X-Rspamd-Queue-Id: 6C8754F3693
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36438-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axiado.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,axiado.com:email,axiado.com:mid,axiado.com:dkim]
X-Rspamd-Action: no action

Hi Linus,
Thanks for the feedback.

On 5/7/2026 11:44 AM, Linus Walleij wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hi Petar,
>
> On Thu, May 7, 2026 at 10:06 AM Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
>>>> +  '#gpio-cells':
>>>> +    const: 2
>>> Are you sure you don't want to use 3 here instead and split the 128
>>> GPIOs into 4 "banks" second cell being the bank number?
>>> <&gpio 2 4>; ?
>>>
>>> Maybe this also solves the 512 GPIO by grouping the GPIOs into
>>> 8 banks...?
>> Thank you for the suggestion. We would prefer to keep #gpio-cells = <2>
>> to stay aligned with existing SGPIO drivers and current DTS usage.
>> A single linear offset is sufficient to identify each GPIO, so introducing a
>> bank cell would add additional complexity without a clear benefit.
>> Any internal bank handling can remain within the driver if needed.
> If each bank also has its own associated IRQ line, for instance, then
> this also reflects the hardware in a better way. But it seems this
> controller has just one single IRQ line for all GPIOs, so maybe
> this is better.
>
>>>> +  ngpios:
>>>> +    description: The number of gpios this controller has.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> Same here, certainly the 128 variant has 128 gpios and
>>> the 512 has 512 GPIOs? Just use the compatible string
>>> to infer this.
>> This seems to be platform-specific rather than strictly hardware-dependent.
>> We were considering keeping it as a separate property (possibly renamed to |axiado,sgpio-ngpios|).
>> Would you prefer that, or deriving it from the compatible string?
> In this case it is fine to use ngpios.
>
> ngpios is used when the hardware can actually do more
> GPIO lines, but they are not routed out on the package of
> the silicon, for example.
>
>>>> +  dout-init:
>>>> +    description: Initial values for the dout registers.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 4
>>>> +    maxItems: 4
>>> In:
>>> Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
>>>
>>> you find:
>>>
>>>   lines-initial-states:
>>>     $ref: /schemas/types.yaml#/definitions/uint32
>>>     description:
>>>       Bitmask that specifies the initial state of each line.
>>>       When a bit is set to zero, the corresponding line will be initialized to
>>>       the input (pulled-up) state.
>>>       When the  bit is set to one, the line will be initialized to the
>>>       low-level output state.
>>>       If the property is not specified all lines will be initialized to the
>>>       input state.
>>>
>>> If this is what you want, use this standard binding instead.
>> In our case, the hardware provides dedicated DOUT registers where
>> each bit directly controls the output level (0 = low, 1 = high).
>>
>> The lines-initial-states property also encodes input state semantics,
>> so it does not map directly to this hardware.
>>
>> Would you prefer adapting to lines-initial-states despite this,
>> or using a separate property for output initialization?
> Please use lines-initial-states, support also input mode setting
> and write more than one register if necessary.
>
> Setting up the dout-states for lines which are supposed to be used
> as inputs just doesn't make sense does it?
>
> It is better if the device tree has this deeper semantic which
> provides useful information for the developer and makes the
> author of the device tree be more careful and detail-oriented
> around the actual usecase.

For example, when SGPIO is configured for 128 lines, the hardware provides
128 input bits (DIN) and 128 output bits (DOUT). If modeled directly, this
corresponds to 256 GPIOs in Linux, since the input and output signals are
independent and are not bidirectional.

Similar to the gpio-aspeed-sgpio.c driver, the input and output paths are
fixed by hardware and cannot be configured dynamically per line. These are
not interchangeable directions of the same GPIO line; they are separate input
and output signals. Because of that, combining them into a single logical GPIO
abstraction would not accurately represent the hardware model.

Because the direction is fixed by hardware, the standard
lines-initial-states property, which encodes both direction and initial state,
does not map cleanly to this design.

For the output lines (DOUT), should their initial values be described in the
device tree, or should they be configured by userspace, with the driver only
providing default initialization?

>
> Yours,
> Linus Walleij

Thanks again for the guidance.

Best regards,
Petar Stepanovic


