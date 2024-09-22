Return-Path: <linux-gpio+bounces-10352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A597E3BE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 23:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63FB1C20E48
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 21:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E3B58AD0;
	Sun, 22 Sep 2024 21:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="AHtZadOc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CFFEEC5;
	Sun, 22 Sep 2024 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727041667; cv=fail; b=Dc5K9dREAZt+ZHTZKouD6dQO+LHH/m+KOMDFPyrCSMzktC8/EMwjAuO4B0U6XasbB//ZYWk7oPcPy2pwsX0AquKnk6EbX57ctkjBhQf6oPX7HpgKucpFAzyFmfLSdDhPPEzykkrHpPaotjx3AEh+CvuXPDdmcDYa2+cCdwhYtyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727041667; c=relaxed/simple;
	bh=I5ZwmUNwYbdI2joLgg9tGT2xDqlW8mi1g3cvN1n1I50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e1Hef8S6+2lSsH4ANOLRj488FPWHXCvTy2LXrDGvhZ0C7f7irtEuhpk0pGWYs7zPxs5eEePNhi8n/iQskpf2igHu+x1+21RU6dZAgGb549iXZ5xZz3BV1Rahg113dptMnSSEr/bn3CFW0Hsh5wMjSl62hq/ROSX/mYjQZ1RqjJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=AHtZadOc; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48MLMEeA028304;
	Sun, 22 Sep 2024 14:47:17 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 41swnjmr4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Sep 2024 14:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh2yKz8C46HoQeatjXr1bZWUMukw45VPnhDBl/8zNzkvW/HdyNhzWj3EzzgwzabFDKZYAVu7dE78HMR66BrhTHtzF6J03grhkRJ06czrH91s+iUYeHgZbhyDAH4IjszaDJYz4I8WsoNpj26YEufE+mqIiVv40R5/pnQX1aPpihoFRTu6PUvj1pjL0CLpY6qoHzrAIl0Sl7VV/imefotBoAvaJTDAEICpX2G+73I3em2LciGEsdtPLvzcvi+m/v3YfdoqtV7k8/c3E4S6hos1+p6m+q/KdwP55TfY730mLYFshqdRCZJNhGNS3sCdVoJpnOEzBUzttCq+mXqFBFPeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zklAbvuSAc0qMhShDSmIq9UXKVRbSs5Yz22Orv/nzY=;
 b=x2YYptgG+TKiTCSQIIefUbTI3wxaZ8hK3AifHqeptIjGMxu0QuRGxqq/CFZvurhH//U89s0XWcDWVLwDSoi2IWnPD9TwtHEKEKih3/Jm7QyYcC1KAw6+ur48kjq/emQkyUK0dR0X13+3MA50STFM++wqzZTANkzrILskRFk37wty9PaMBTtOp3h5St2fUE2tZ5GwVIL18xbAhFP6Sn9rs1yafgSzO9tMZClCYbeJjQB+8EazSFF54/WHVBM36etevUGEBB73hjBPAVYVkpRy834TRRVUlcIGpU+LuzKRUBGwUywhbjNGoqWiUyvsccEC9tivCgd8lHowk00COdYfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zklAbvuSAc0qMhShDSmIq9UXKVRbSs5Yz22Orv/nzY=;
 b=AHtZadOc/ii0cr21ZBttun8Fjyk7K2jnmno0N66W/1malK11xMgRiJmHW+KCO2p+obfkoWjgYoHqHtV2qeEkQeXJH6VOoreMkgUsQwtd2QYvV52AdLbTuC1H5GazadRkJbYz3Ova1FYLSZVeEQhfRYnawLrHjt92IJ5aGowTdMU=
Received: from MW4PR18MB5084.namprd18.prod.outlook.com (2603:10b6:303:1a7::8)
 by CO6PR18MB3988.namprd18.prod.outlook.com (2603:10b6:5:341::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 21:47:14 +0000
Received: from MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905]) by MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905%5]) with mapi id 15.20.7982.022; Sun, 22 Sep 2024
 21:47:13 +0000
Message-ID: <690a7534-9f15-4220-9edf-ca56203c7fa0@marvell.com>
Date: Mon, 23 Sep 2024 03:17:18 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>
Content-Language: en-US
From: Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To MW4PR18MB5084.namprd18.prod.outlook.com
 (2603:10b6:303:1a7::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR18MB5084:EE_|CO6PR18MB3988:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a4eccb-0797-4e45-db6b-08dcdb501e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnpXUWhqSWFVVDg5d0Zucnc2Vmd1anpSVDU1WmxhQ3BPZ2lMQU0vaWRGMFNh?=
 =?utf-8?B?Nk1FUGVLdVZERVlOZ1BhSlBaVnN3RmtVNUdiK09yKy9jcnUrby80MHFJMjBF?=
 =?utf-8?B?TDM5VUs3TzBmbXdzWGE3Y3VneFY2ZTM2SlRXbTBEd0VUdVhDa3BVSGVvSlc5?=
 =?utf-8?B?UmhpNEQyQ0hzVjNkNFA2ZzlVanRCczFXS2kyQzg3eHpBUlFVcDkxREw1ei9h?=
 =?utf-8?B?SzVSYWVCVDJxbng2SkR4UVR3cVpLMWcyTG5mNFowekFIdnRqVUx2Q2JVWXYx?=
 =?utf-8?B?Ynl2K3duMEdZREozb1F5bk8raWJ2bzFrS3g5SW16RzUwT25LRVR0V1M4TDRV?=
 =?utf-8?B?NFBOcjlSV1dOR2NxcGZLQXljaDltQ1hIa3A2clQ5RGRZcEkvbnRmRzJ6UG1h?=
 =?utf-8?B?M3dsdFYxUHp6SmM0SnVDRE80cnRuakZwMm9JZWNodjkzRDgzbkhxY21LMFI4?=
 =?utf-8?B?USt0MHBtNk5lRU96ZUVPWURJYmFqTU1Zb01PemZudzBQWGlJT0Q5NHhUOUMx?=
 =?utf-8?B?bzI0R214TDQweUlMR1UwUkM0RGdzS3U0SkJ5U2x4YndJSGxqVlZkMVkyZ1ky?=
 =?utf-8?B?UU4vTDB0MHBMbHRuYSs0cmhFbkxnQnRCMXZnbTJvYzJWZVpaOEs4TXlieDlY?=
 =?utf-8?B?eC9Rb2JoMWtlTXNFOTZCemZsRXBHZnRORFplVWNYS0RScHpHZ2VrYU5SZ3gz?=
 =?utf-8?B?b1F6d0QzSHBNUlRoME1pN2lweGthaFl5UjNVSGR0dVBQYnpYV2xvd0YxbWo1?=
 =?utf-8?B?dzFHOEhvdmphU004TFI1alEwdlNhTHU5enVIQk9jQlFpQzJqenluUk5uSU9E?=
 =?utf-8?B?aEQzR1V2MUg0ZjFla3NTRkRZVTZwTm0vUzZCU3M4RkkvVlZEK0hTTWw1N1VB?=
 =?utf-8?B?M0lTNGpWY2JzYVNJZTU5L21MWHBuTmQwQklTRXk0SUtENXpXK3NnMWlzUGwy?=
 =?utf-8?B?dkd2aTF5a3JmVUhJNmdDZmxZOHJoV2lia3U3UTFzUktnZEtNdFd1ajM3ckg4?=
 =?utf-8?B?a0JlRFBUam5qSWR1RHFJcktCek5ONW53Qmk5a2ZyNTlETlk4SHlWR0hGcHRP?=
 =?utf-8?B?RjZDcTh4TkR2azlUQi9vVmdUZkRKSVJha21lNkp0MDB5Z09KS1oycWNLREVI?=
 =?utf-8?B?a0dqQUhncmdkNTRLVTJ0R1VTRGFqT1JwQUtQakxtQjFEN3ZyY2x2UTVxYU1M?=
 =?utf-8?B?ZU1TNkg3SFNrQU1iOVkzSE0rV1Z4TnZqSk1ueEY0blIrYVdQVVBrZlE1b1NE?=
 =?utf-8?B?aDN5WDhIeTJlQ2FKQTQ3RmFBNVdibUIzdWROTTUwU2ZPWEVMV0daYkJLYjla?=
 =?utf-8?B?R0tSWTRPZm1WVUIzRHVZZFpiNTVTL0RZVkdpbzRzdXVyUElOZTVIcEREQzQ5?=
 =?utf-8?B?aGZZNU9LdUxiK3ZIUnJZejhlZms1QUZoRGt4STFhOXlLUWlXVFBuNEFoOVdz?=
 =?utf-8?B?V083bTg0Q2Q3OGkwbDRMaEhLempDS0NUVTVBOGRxajBnTWpQSGVwaTVBbWgv?=
 =?utf-8?B?b1Fndk5aS3Y5RTZzR1pkSENrZ3I0Y2FQS2FDRms2bEtZMmE2aHdIc24wSEI4?=
 =?utf-8?B?UTVwRFYzUXgwblNTckhUYm1ibzVLdHZ5bFZYQ0VlL2I3UGc2amF0d3N2ejNU?=
 =?utf-8?B?OGtVNW50dllXTVFNRVNqRG1GaEEzbjEyZ3J3OWViSFJva0VUbVVjY3lLRUVK?=
 =?utf-8?B?cjJWcGFtd3RIbUFPbkh4cDMveXN0RXh6RGZITjF2VnVQWU4zYTAxdElIUDNX?=
 =?utf-8?B?YnpPMzF0VUNuVGcxYVJKWklhRVdLd0JnbXZqRm8zVHNJWTJxQ0hGQmpwR2JM?=
 =?utf-8?B?WFlZdVRPd3FCOHZ2MVNjd1lsM3h6ZTBjYW8ybzhaTDFqd0pja3NWR0QzNVRM?=
 =?utf-8?Q?HHURhnyL6IToR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5084.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmhRL1F6VkE4bGFwcVd1MGdCS0pwL0kzOVcxZTN1QVg5bWp0aDI1N0lwaStw?=
 =?utf-8?B?UnV1eEQxZ0VhWFhhMnlqMnNTSE00SVljSUlIMnRKQ0NrRFk2MUtHQld6Z3ZS?=
 =?utf-8?B?ZVZCUVVnSHVXbEhIdHE1VXdKS3ZHdG5IbkxVcWY1eW1uSHcwUUY1ZDZNZzBF?=
 =?utf-8?B?a2RDejdMVkp6U21Xcm85a253akVpMlo0bXNOcGpLNHFqVjNjYU5CRXFLRGhX?=
 =?utf-8?B?a0ZYUUVnQUd4NXVpaXo2WFZLS0taR0MxK2s5LzVha0swTWhidjZRa3NPc0lo?=
 =?utf-8?B?bi9OeVdrTlFLbGFiOXY4eUhkMmpuUHpOUklINisrNjMvV3ZkNGpWNDJGSE9k?=
 =?utf-8?B?cE83N0dVUWxBb3BCZnRhUW8xcDM3WkJqNy92NXhHakpwRGtTVVZ5RmluZnZv?=
 =?utf-8?B?UHMyR1kzU1J6Q3c0MitNWU45R0I5YlIxbUM3VmRuV1RlVk9jSWQzNGxlN3Bo?=
 =?utf-8?B?KzdTTm1ZRnRNWXhrc1RzWmNyQm52RDhDYTl6K2o1Ym5tYzRra3MwOHBDSWtX?=
 =?utf-8?B?U1pxazZpUjFWb0FTYTJBN2hMQzlTc21YTUpXdGdyMHNSR2gyME50NW1jYk9a?=
 =?utf-8?B?MmpBMi96b0Z5RlExRkFrckNiSkFyUTI1enFxTzlaVHVtbGZsQllHVTdOUzA1?=
 =?utf-8?B?MEZoa1p0SFFSeDM5WTdWWjdib0RVNW9sNy96YzBlSFVNL2NCNlpSZnlQYWcv?=
 =?utf-8?B?cXNkNVhETnFOTkg5cWlaVjI1Ums1dllaN3kxYzlDcDBCRjVjcjFKVGpaWVdz?=
 =?utf-8?B?UWNoc25GNkRGS2VHc1dEcEo1bnVnTytyV1NwNGR6NjFrNzM0a1Rxb3YxZUpW?=
 =?utf-8?B?UWk2RzUvaUNDZnVqb3dVK1VjUXZ5VnlkdDZCNHROa2NqUDJJSHVuWEZmMzdQ?=
 =?utf-8?B?OFZaRys5UXFPZGpra0lMb2ZHTVZNd2lxdkR2V1pUdjRqVmpuKzVWTzE5TFF6?=
 =?utf-8?B?WFdoL21uMjFycVdiM1ZkVHlVUHRSaWVEYis4cm9IakN6TU9VM09mK0EyQ3Ri?=
 =?utf-8?B?K1VOcmtZNkJwTC9KdGhsbUtCSGJ0bndKcGJ3dit5c1U0RjhmRVBlNjlvTDBp?=
 =?utf-8?B?QkUrTG1Ca1paY2Y5RXY3ZTEvWTRwZVkyOEx0WjV6K1p5R0VoQjZMOWJxYW4w?=
 =?utf-8?B?V014elo5TUpCd2ExNGNHMkZiekhKekV4Wkx2dVJjZFhieTljVi9BVkd3MW1y?=
 =?utf-8?B?ZkdyZlFvWVFna1hVTHBnOEI3Z05JcTZ3T1lvR3NJNlZocDVWVTVabG1qWFh1?=
 =?utf-8?B?MlFCd01VTWxpZ0Q4TVNNTGRqSFpNL2dvOGtwSFF1Z0ROMXlZdERKcFlnZ0ZR?=
 =?utf-8?B?ZXlqRTlXV1RSbjVGVld3N3J2UTJpZ0Foa1U2RDBDNWdYK0ZGbXJ1UmdqSlAw?=
 =?utf-8?B?dm9HYzJhZGFkR3FXSkkyZ3pVNlIrKzlacFl1UHVGZi9PL21mRytpY2lWLzF5?=
 =?utf-8?B?ODJENkdpK3JXRis0M3d0OHpJNnUwS0Zya1ZPTUtXeStjaElQVUtZWlE0a1ow?=
 =?utf-8?B?R29hVDd5bHgzbHlUeTRRLzIwUmtuek1GUTZpYlkyR1NrZDRIQXFHeTZkSVRv?=
 =?utf-8?B?RUduTW1pTEQwQkxUYWRBTEMyN1ZUQ0lBUlhacnA5blhLeGdCb014WnYvamVB?=
 =?utf-8?B?WnU1aW43aitFOGRoQjRKcFpoR3ZWVWE2a285TmpSbTRWRG1DanU5STY4cmFQ?=
 =?utf-8?B?VlQwNi9KNFhxbFFIM2FnbnRsemxVUEVuOVhGWCtaZ2gzVUYzbTJiWTFSekht?=
 =?utf-8?B?VXBWcmZuUi9lZkJRSlh0Z3pVMFcwV1dXM09lTjd2MzlEQVZEdEZVNi8raGZu?=
 =?utf-8?B?eVRiaG1adE10TGlxV1RZTGh5ZDVuRGhlWmhuclFpYlU0bSttakYvNWp4MlVs?=
 =?utf-8?B?MGMrcWQwcDBVNG1HRGpQYVhhTkZsTjVmb0pXUXpKZ2ZtK3Rud1JOOExQU0d6?=
 =?utf-8?B?MGRRN3VFUmtYaVo2VWI5MTAxaXFxWm1halJ4SksvZzdzQjdXTGJGa1VraVVs?=
 =?utf-8?B?QWw2YWVvTGNiMm03aUxhbXdnUFBYejBRdldQS1lOc1ZiRjhBdE9keTJGMC9q?=
 =?utf-8?B?L0orR04wTzdtZ1NRd3lNdFNWRHdHcStyVzNHM1l1QkdFTUttQlVLcFc5VGIx?=
 =?utf-8?Q?mlIWgofzC4G56ykwncvlmCd0I?=
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a4eccb-0797-4e45-db6b-08dcdb501e86
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5084.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 21:47:13.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MamxDT+evN5QxVb13KFWMCDs4oFj7WFP6sV218blRtjKFwHIQ3JE7mIRuDigqd5aTVK3HsVQ7Q9P3qJL/vO+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3988
X-Proofpoint-GUID: 00jvguTVZTy55uDKUcTmJp6EcSfrYZv5
X-Proofpoint-ORIG-GUID: 00jvguTVZTy55uDKUcTmJp6EcSfrYZv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi,

> 
> Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
> (System Integration Unit Lite2) hardware module. There are two
> SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
> SIUL2_1 for the rest.
> 
> The GPIOs are not fully contiguous, there are some gaps:
> - GPIO102 up to GPIO111(inclusive) are invalid
> - GPIO123 up to GPIO143(inclusive) are invalid
> 
> Some GPIOs are input only(i.e. GPI182) though this restriction
> is not yet enforced in code.
> 
> This patch adds basic GPIO functionality(no interrupts, no
> suspend/resume functions).
> 
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>    drivers/gpio/Kconfig            |  10 +
>    drivers/gpio/Makefile           |   1 +
>    drivers/gpio/gpio-siul2-s32g2.c | 576 ++++++++++++++++++++++++++++++++
>    3 files changed, 587 insertions(+)
>    create mode 100644 drivers/gpio/gpio-siul2-s32g2.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 58f43bcced7c..75a6ca60ebc7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -643,6 +643,16 @@ config GPIO_SIOX
>    	  Say yes here to support SIOX I/O devices. These are units connected
>    	  via a SIOX bus and have a number of fixed-direction I/O lines.
>    
> +config GPIO_SIUL2_S32G2
> +        tristate "GPIO driver for S32G2/S32G3"
> +        depends on ARCH_S32 || COMPILE_TEST
> +        depends on OF_GPIO
> +        select REGMAP_MMIO
> +        help
> +          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
> +          chips. Say yes here to enable the SIUL2 to be used as an GPIO
> +          controller for S32G2/S32G3 platforms.
> +
>    config GPIO_SNPS_CREG
>    	bool "Synopsys GPIO via CREG (Control REGisters) driver"
>    	depends on ARC || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 64dd6d9d730d..fb6e770a64b9 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -149,6 +149,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
>    obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
>    obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
>    obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
> +obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
>    obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>    obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>    obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
> new file mode 100644
> index 000000000000..a69cbb3bcfaf
> --- /dev/null
> +++ b/drivers/gpio/gpio-siul2-s32g2.c
> @@ -0,0 +1,576 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIUL2 GPIO support.
> + *
> + * Copyright (c) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2018-2024 NXP
> +  */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* PGPDOs are 16bit registers that come in big endian
> + * order if they are grouped in pairs of two.
> + *
> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
> + */
> +#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
> +#define S32G2_SIUL2_NUM		2
> +#define S32G2_PADS_DTS_TAG_LEN	(7)
nit: Parentheses are not required here, please remove it.
> +
> +#define SIUL2_GPIO_16_PAD_SIZE	16
> +
> +/**
> + * struct siul2_device_data  - platform data attached to the compatible.
> + * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
> + * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
> + */
> +struct siul2_device_data {
> +	const struct regmap_access_table **pad_access;
> +	const bool reset_cnt;
> +};
> +
> +/**
> + * struct siul2_desc - describes a SIUL2 hw module.
> + * @pad_access: array of valid I/O pads.
> + * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
> + * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
> + * @gpio_base: the first GPIO pin.
> + * @gpio_num: the number of GPIO pins.
> + */
> +struct siul2_desc {
> +	const struct regmap_access_table *pad_access;
> +	struct regmap *opadmap;
> +	struct regmap *ipadmap;
> +	u32 gpio_base;
> +	u32 gpio_num;
> +};
> +
> +/**
> + * struct siul2_gpio_dev - describes a group of GPIO pins.
> + * @platdata: the platform data.
> + * @siul2: SIUL2_0 and SIUL2_1 modules information.
> + * @pin_dir_bitmap: the bitmap with pin directions.
> + * @gc: the GPIO chip.
> + * @lock: mutual access to bitmaps.
> + */
> +struct siul2_gpio_dev {
> +	const struct siul2_device_data *platdata;
> +	struct siul2_desc siul2[S32G2_SIUL2_NUM];
> +	unsigned long *pin_dir_bitmap;
> +	struct gpio_chip gc;
> +	raw_spinlock_t lock;
> +};
> +
> +static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
> +	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
> +	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
> +	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
> +	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
> +	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
> +	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
> +	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
> +};
> +
> +static const struct regmap_access_table s32g2_siul20_pad_access_table = {
> +	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
> +	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
> +	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
> +	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
> +	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
> +	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
> +};
> +
> +static const struct regmap_access_table s32g2_siul21_pad_access_table = {
> +	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
> +	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
> +};
> +
> +static const struct regmap_access_table *s32g2_pad_access_table[] = {
> +	&s32g2_siul20_pad_access_table,
> +	&s32g2_siul21_pad_access_table
> +};
> +
> +static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
> +
> +static const struct siul2_device_data s32g2_device_data = {
> +	.pad_access	= s32g2_pad_access_table,
> +	.reset_cnt	= true,
> +};
> +
> +static int siul2_get_gpio_pinspec(struct platform_device *pdev,
> +				  struct of_phandle_args *pinspec,
> +				  unsigned int range_index)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						range_index, pinspec);
> +}
> +
> +static struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
> +					     unsigned int offset,
> +					     bool input)
> +{
> +	struct siul2_desc *siul2;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
> +		siul2 = &dev->siul2[i];
> +		if (offset >= siul2->gpio_base &&
> +		    offset - siul2->gpio_base < siul2->gpio_num)
> +			return input ? siul2->ipadmap : siul2->opadmap;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
> +				     unsigned int gpio, int dir)
> +{
> +	guard(raw_spinlock_irqsave)(&dev->lock);
> +
> +	if (dir == GPIO_LINE_DIRECTION_IN)
> +		__clear_bit(gpio, dev->pin_dir_bitmap);
> +	else
> +		__set_bit(gpio, dev->pin_dir_bitmap);
> +}
> +
> +static int siul2_get_direction(struct siul2_gpio_dev *dev,
> +			       unsigned int gpio)
> +{
> +	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
> +						     GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
> +{
> +	return container_of(chip, struct siul2_gpio_dev, gc);
> +}
> +
> +static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	struct siul2_gpio_dev *gpio_dev;
> +	int ret = 0;
> +
> +	ret = pinctrl_gpio_direction_input(chip, gpio);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dev = to_siul2_gpio_dev(chip);
> +	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
> +}
> +
> +static unsigned int siul2_pin2pad(unsigned int pin)
> +{
> +	return pin / SIUL2_GPIO_16_PAD_SIZE;
> +}
> +
> +static u16 siul2_pin2mask(unsigned int pin)
> +{
> +	/**
> +	 * From Reference manual :
> +	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
> +	 */
> +	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
> +}
> +
> +static void siul2_gpio_set_val(struct gpio_chip *chip, unsigned int offset,
> +			       int value)
> +{
> +	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
> +	unsigned int pad, reg_offset;
> +	struct regmap *regmap;
> +	u16 mask;
> +
> +	mask = siul2_pin2mask(offset);
> +	pad = siul2_pin2pad(offset);
> +
> +	reg_offset = SIUL2_PGPDO(pad);
> +	regmap = siul2_offset_to_regmap(gpio_dev, offset, false);
> +	if (!regmap)
> +		return;
> +
> +	value = value ? mask : 0;
> +
> +	regmap_update_bits(regmap, reg_offset, mask, value);
> +}
> +
> +static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
> +			      int val)
> +{
> +	struct siul2_gpio_dev *gpio_dev;
> +	int ret = 0;
> +
> +	gpio_dev = to_siul2_gpio_dev(chip);
> +	siul2_gpio_set_val(chip, gpio, val);
> +
> +	ret = pinctrl_gpio_direction_output(chip, gpio);
> +	if (ret)
> +		return ret;
> +
> +	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_OUT);
> +
> +	return 0;
> +}
> +
> +static void siul2_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
> +{
> +	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
> +
> +	if (!gpio_dev)
> +		return;
> +
> +	if (siul2_get_direction(gpio_dev, offset) == GPIO_LINE_DIRECTION_IN)
> +		return;
> +
> +	siul2_gpio_set_val(chip, offset, value);
> +}
> +
> +static int siul2_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
> +	unsigned int mask, pad, reg_offset, data = 0;
> +	struct regmap *regmap;
> +
> +	mask = siul2_pin2mask(offset);
> +	pad = siul2_pin2pad(offset);
> +
> +	reg_offset = SIUL2_PGPDO(pad);
> +	regmap = siul2_offset_to_regmap(gpio_dev, offset, true);
> +	if (!regmap)
> +		return -EINVAL;
> +
> +	regmap_read(regmap, reg_offset, &data);
> +
> +	return !!(data & mask);
> +}
> +
> +static const struct regmap_config siul2_regmap_conf = {
> +	.val_bits = 32,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static struct regmap *common_regmap_init(struct platform_device *pdev,
> +					 struct regmap_config *conf,
> +					 const char *name)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	resource_size_t size;
> +	void __iomem *base;
> +
> +	base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
> +	if (IS_ERR(base)) {
> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	size = resource_size(res);
> +	conf->val_bits = conf->reg_stride * 8;
> +	conf->max_register = size - conf->reg_stride;
> +	conf->name = name;
> +	conf->use_raw_spinlock = true;
> +
> +	if (conf->cache_type != REGCACHE_NONE)
> +		conf->num_reg_defaults_raw = size / conf->reg_stride;
> +
> +	return devm_regmap_init_mmio(dev, base, conf);
> +}
> +
> +static bool not_writable(__always_unused struct device *dev,
> +			 __always_unused unsigned int reg)
> +{
> +	return false;
> +}
> +
> +static struct regmap *init_padregmap(struct platform_device *pdev,
> +				     struct siul2_gpio_dev *gpio_dev,
> +				     int selector, bool input)
> +{
> +	const struct siul2_device_data *platdata = gpio_dev->platdata;
> +	struct regmap_config regmap_conf = siul2_regmap_conf;
> +	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
> +	int err;
> +
> +	regmap_conf.reg_stride = 2;
> +
> +	if (selector != 0 && selector != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	regmap_conf.rd_table = platdata->pad_access[selector];
> +
> +	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
> +		       input ? 'i' : 'o', selector);
> +	if (err < 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (input) {
> +		regmap_conf.writeable_reg = not_writable;
> +		regmap_conf.cache_type = REGCACHE_NONE;
> +	} else {
> +		regmap_conf.wr_table = platdata->pad_access[selector];
> +	}
> +
> +	return common_regmap_init(pdev, &regmap_conf, dts_tag);
> +}
> +
> +static int siul2_gpio_pads_init(struct platform_device *pdev,
> +				struct siul2_gpio_dev *gpio_dev)
> +{
> +	struct device *dev = &pdev->dev;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
> +		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
> +							    false);
> +		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
> +			dev_err(dev,
> +				"Failed to initialize opad2%zu regmap config\n",
> +				i);
> +			return PTR_ERR(gpio_dev->siul2[i].opadmap);
> +		}
> +
> +		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
> +							    true);
> +		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
> +			dev_err(dev,
> +				"Failed to initialize ipad2%zu regmap config\n",
> +				i);
> +			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
> +			   char *ch_index, unsigned int *num_index)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < cnt; i++) {
> +		if (i != 0 && !(*num_index % 16))
> +			(*ch_index)++;
> +
> +		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
> +					  *ch_index, 0xFU & (*num_index)++);
> +		if (!names[i])
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_remove_reserved_names(struct device *dev,
> +					    struct siul2_gpio_dev *gpio_dev,
> +					    char **names)
> +{
> +	struct device_node *np = dev->of_node;
> +	int num_ranges, i, j, ret;
> +	u32 base_gpio, num_gpio;
> +
> +	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
> +
> +	num_ranges = of_property_count_u32_elems(dev->of_node,
> +						 "gpio-reserved-ranges");
> +
> +	/* The "gpio-reserved-ranges" is optional. */
> +	if (num_ranges < 0)
> +		return 0;
> +	num_ranges /= 2;
> +
> +	for (i = 0; i < num_ranges; i++) {
> +		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
> +						 i * 2, &base_gpio);
> +		if (ret) {
> +			dev_err(dev, "Could not parse the start GPIO: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
> +						 i * 2 + 1, &num_gpio);
> +		if (ret) {
> +			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
> +			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
> +			return -EINVAL;
> +		}
> +
> +		/* Remove names set for reserved GPIOs. */
> +		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
> +			devm_kfree(dev, names[j]);
> +			names[j] = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_populate_names(struct device *dev,
> +				     struct siul2_gpio_dev *gpio_dev)
> +{
> +	unsigned int num_index = 0;
> +	char ch_index = 'A';
> +	char **names;
> +	int i, ret;
> +
> +	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
> +			     GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
> +		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
> +				      names + gpio_dev->siul2[i].gpio_base,
> +				      &ch_index, &num_index);
> +		if (ret) {
> +			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
> +				i);
> +			return ret;
> +		}
> +
> +		if (gpio_dev->platdata->reset_cnt)
> +			num_index = 0;
> +
> +		ch_index++;
> +	}
> +
> +	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dev->gc.names = (const char *const *)names;
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_probe(struct platform_device *pdev)
> +{
> +	struct siul2_gpio_dev *gpio_dev;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args pinspec;
> +	size_t i, bitmap_size;
> +	struct gpio_chip *gc;
> +	int ret = 0;
> +
> +	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
> +	if (!gpio_dev)
> +		return -ENOMEM;
> +
> +	gpio_dev->platdata = &s32g2_device_data;
> +
> +	for (i = 0; i < S32G2_SIUL2_NUM; i++)
> +		gpio_dev->siul2[i].pad_access =
> +			gpio_dev->platdata->pad_access[i];
> +
> +	ret = siul2_gpio_pads_init(pdev, gpio_dev);
> +	if (ret)
> +		return ret;
> +
> +	gc = &gpio_dev->gc;
> +
> +	platform_set_drvdata(pdev, gpio_dev);
> +
> +	raw_spin_lock_init(&gpio_dev->lock);
> +
> +	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
> +		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
> +		if (ret) {
> +			dev_err(dev,
> +				"unable to get pinspec %zu from device tree\n",
> +				i);
> +			return -EINVAL;
> +		}
> +
> +		of_node_put(pinspec.np);
> +
> +		if (pinspec.args_count != 3) {
> +			dev_err(dev, "Invalid pinspec count: %d\n",
> +				pinspec.args_count);
> +			return -EINVAL;
> +		}
> +
> +		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
> +		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
> +	}
> +
> +	gc->base = -1;
> +
> +	/* In some cases, there is a gap between the SIUL GPIOs. */
> +	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
> +		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
> +
> +	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
> +	if (ret)
> +		return ret;
> +
> +	bitmap_size = BITS_TO_LONGS(gc->ngpio) *
> +		      sizeof(*gpio_dev->pin_dir_bitmap);
> +	gpio_dev->pin_dir_bitmap = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> +	if (!gpio_dev->pin_dir_bitmap)
> +		return -ENOMEM;
> +
> +	gc->parent = dev;
> +	gc->label = dev_name(dev);
> +
> +	gc->set = siul2_gpio_set;
> +	gc->get = siul2_gpio_get;
> +	gc->set_config = gpiochip_generic_config;
> +	gc->request = gpiochip_generic_request;
> +	gc->free = gpiochip_generic_free;
> +	gc->direction_output = siul2_gpio_dir_out;
> +	gc->direction_input = siul2_gpio_dir_in;
> +	gc->get_direction = siul2_gpio_get_dir;
> +	gc->owner = THIS_MODULE;
> +
> +	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id siul2_gpio_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2-gpio" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
> +
> +static struct platform_driver siul2_gpio_driver = {
> +	.driver			= {
> +		.name		= "s32g2-siul2-gpio",
> +		.of_match_table = siul2_gpio_dt_ids,
> +	},
> +	.probe			= siul2_gpio_probe,
> +};
> +
> +module_platform_driver(siul2_gpio_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP SIUL2 GPIO");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.2
> 
> 


