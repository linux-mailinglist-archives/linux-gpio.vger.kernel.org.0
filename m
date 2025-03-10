Return-Path: <linux-gpio+bounces-17392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F02EFA59B21
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 17:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8A13A768B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 16:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030C2230275;
	Mon, 10 Mar 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yPxx9U2z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6022DF9C;
	Mon, 10 Mar 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741624527; cv=fail; b=Tbdox8PG4gtNlE1lEVFUabAV+uzuerceX1WHx8fkE5g9N2Ou6pD4Xpyqv2gbX4jZ8WItKYR6skzxHo4UYlm6qPQP+Kn60+8mkaINN8kOO3rQyKxAq3BRSwa9v9LfQgyBsVvjYvGpSseo6utpjMDqshBEF5TGWfGShMz/aM0WR9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741624527; c=relaxed/simple;
	bh=cGATtkWbrLVZQAwwo40Z6vaqKI8TXn6IsmJiJUSz7/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tpHbgyBuHJ76ZCbU7L62za02BfGQlXG83oTzPVmPHvLbYPJBJ/EDXeALoKmcuyz9AuCB9QzdP+IVDu9njsP/2/L8IpfROdsiHYwLt3npEdyUTTL7F9L1tkfUsbRxcRm+eKBFRRVTUm397+fCtJKXdmrjd0PWkMs8SDvnt2naa3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yPxx9U2z; arc=fail smtp.client-ip=40.107.220.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvYz5x5F6sN6qWQpZl41/V3NCD0O1vo7ZsH2QROyBjx04QhwcowEiZMAsTIVSNFfHkq4X/SGf/EJ6FP9GyItgUghqy1QKfaCrjmFNTSXJ4hNJsqeTuPiy1gwhqYfO0BpfLq2r3IETa3vjFxrcuD7dlB7q20h1KMRXa6PxYiqPdEry6WTd8WBjfTfZYoh5gt0KyVU9fS7zYtEHi3ndlqcXgCNpVHg6QdQBbxQt8oxBbkBjtk83Ie5GlAV8kdkhycyRBsn95TItLTJEg0qb4t3AKNqG0ziyz46JgKVqiqGIcv6bjPG+Tfh7mUR2FbTSBudYBT8mzzLmYraEtTDYJa8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5QeMKhn9JiDx/RbfBPQja/HzWgV0OHiXww9C52sPsU=;
 b=jXZHLC0xpq0uY6VDHwYThnN7boeULukH7Jp2DRo9Nsqfp/5BF6Nbn5t/sizCbk6tXhDpzBhsvokzUGFsufRJEp+clj4Z2KRcT93RcuUy50XT4vkTkabc6bCcoR1OqAWNDBHqrzxFJSsm7SvdnsXwsyPS4JkQ56DxyGfDw+X65obIVmhq1MxdkNo2c2kzw47DEo5UlvIM5ZbPqFvlsZmdp9iuKWrmghnsWDfzbnCRkI6d/o5j1GoeLIjlsPNCylvEX+oUrkTAAuHgenE7M0ATMR5cLAbF9tJfhB5uokWgJSiMhasuLudNdqcWLR7VntUJGlRRL0u8Dh0nxmMsNWDuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5QeMKhn9JiDx/RbfBPQja/HzWgV0OHiXww9C52sPsU=;
 b=yPxx9U2zU5vb7R+i5IjInbAJSQW0EZuGOcFraozNQ70uletBh/wLI7iY9MLFhjVA2xHeGLfRTocGL1Ig1nc/jA+8JZC/hP2JJG5MQszgQLSo2Cx5VbjH++mlFg/PhEk2mRtQ5ATJtuSR++zBlZTwYFWdogXoUejI320SyEZi3Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 16:35:24 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 16:35:23 +0000
Message-ID: <0724fac1-2dbb-480d-bd30-65755f86e148@amd.com>
Date: Mon, 10 Mar 2025 12:35:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in
 probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 dominic.antony@amd.com
References: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0263.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::17) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 1594b549-1ad6-4360-e4ca-08dd5ff18e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2J0UEE3NDRQbjNHWC9JSXE3YW1DR2lWOXJ2bENjTVl1VTQ4K0tOdkpmNUJY?=
 =?utf-8?B?citROTkwL1NJQVNBaW5wcVpxL1J3YU9RVElkZXlPb3pxeUdhWW1BbkcyanJx?=
 =?utf-8?B?M2ZtaVU5VE1uQ0FDeW1sa0Q5NzhMWGxsdkdVVUxBVnVhNG9JaFZpWkdxd1VZ?=
 =?utf-8?B?dzZ0ekJ1c0xzclpwd3RFaXNmOE5ReXN2Tm8yYW9HdlRGTHJKdjNZZ1dNN1VO?=
 =?utf-8?B?UnBtR3gyK0x4STN2UFRTRCtJSGNBUVZDdDlpYjk0NElneXhWV1FpSHk0YnFC?=
 =?utf-8?B?TFpMQzRZVnRSc285UWhUY1M5WkdweTVHeGxVSUZ5VmNVWmFLdG5pODVhYVcv?=
 =?utf-8?B?dlJzRkxlN0FmL3g3dExid3ZKbkxHMGZKYS9RU2xoM0Z5NEYvYm50eWpFQWtZ?=
 =?utf-8?B?K3RPQXFCRVU0U0tWM1JQY2FrV0JaWE1LeHE3RWFseHJVSUE4RE5qdGdZNjFp?=
 =?utf-8?B?ZWpNSlZsZU5nZWJDUnhzanNRN2JLSDFWQUJ0T05pMmVIM0ZqVGlUVGk5WW91?=
 =?utf-8?B?L1hVb253T3l2L2JIREUxOE12V2liUTZvNTdUMXAwMGRsMHE4VGxsZUhyemFE?=
 =?utf-8?B?cVE1QnhNa2MrNGx0N3FQemlwSnZOWmZkT2g4cW1wNHJZbng3UHhvK2R1ZGFH?=
 =?utf-8?B?WWwvKyt3eHF1NEpkTFMweTBpRTZ4YzhXQWZBWWczdkJJRnp3bXNOa0hMME1h?=
 =?utf-8?B?SGpTdldDYkFabisralZVSmhvUjIxbEIzQnNFU1I1NW8yaVIrL2UrMU8wbUZQ?=
 =?utf-8?B?VzRseUpjS3NIWnZCS1JSMHRGYkdJY3dubCtqaVJaT2crWHNsMHd4UEEwbElC?=
 =?utf-8?B?VTVYRmZsUmhVdDJaSzQ0Y1gvOGZpVkRHQ0FXMkcxMVA2ZkkzQTlNVlJJRlF1?=
 =?utf-8?B?TzR6OUQxR0hHMXVVVWo5TlkyNEhjMzdmdEwyMktidm1reDhpS3d1VFVsTWYr?=
 =?utf-8?B?SWF5UElsbEF0K2g2QWZFaG5TQVgxREFDdXcrMFNkdjRvY2l4V1RYdWlsTVVq?=
 =?utf-8?B?T1RRNjJaU1RQbUIvcGVMbGU3enRSMmFjRHRwU3F1ZjZJUEFvMEF2SFZyQ2Vw?=
 =?utf-8?B?VFc5V1E4dFVDVzNycVJ4eHAzQ0tkS3NaYXlxalQxeGRrbFp5a2RSR3pDd280?=
 =?utf-8?B?cmpVMXZrUS9ZYXp5ZDY3alZlNlVxdE9Lekk0cHVaeTc0Z1lUMjVQSEMxRmpV?=
 =?utf-8?B?cE9ZS3REOU5uRCtScXIzY0Vacmx5aWtGS0phOWh2MlhydThRYVhUbXpVYUl1?=
 =?utf-8?B?MjBmNjArL2l3ZC9ScXc3MlFKa21yTHB0TG5ZZ0haNlhSd3FCSFJUSDQwSm0r?=
 =?utf-8?B?NEM5emtRRkFUa1NmbTFRQ3lyd3JIS1lJSE1OZFpBTzlneTlmN3BsUzBiTWcw?=
 =?utf-8?B?TmV4NmpNb2E3OXk1Z1VYaDdqaTRocmJSeDU2Tk4xQzVSL0llTEhRd0tVSUdQ?=
 =?utf-8?B?alBpaHJpL01KM3dhekRuV2FNVnhLanQ0VFh6K2o1Z2hDaGdlMDBVNitDM0Z4?=
 =?utf-8?B?THdwV3VDMVBqUlREa2I2UmZHeFBmUjZYcURsQlA3cTVQWitGQ2N2Z0R5NHpq?=
 =?utf-8?B?RXcyb2JrYzU4WkFBYUpuWHJjNzRqSUVyaUNtL0hxRmZaVys3c2tyaUtXa1di?=
 =?utf-8?B?UWI4bE50T0JIU2JRRjRwcXNwZ0h6Yzc2bzg4VHh3SjUyNEd2VlFsblJrTitw?=
 =?utf-8?B?cWdjU2xLR2JLL29IaUVDaC9MQzZjRTYrTVc2azhDTVRMcEVwNEx6TWlkZ1ZB?=
 =?utf-8?B?eVg3ZGJxamc4ZTY5SDlMdWpqU01zSlkwZjJpT04wb3BaWEdzcEJLOXBNMjZt?=
 =?utf-8?B?cEVqNDlLcjZoOGk1WkN2Tk9VcG9OVVhVQ1hQZ1E0bXJUbDh3SHZPUlVYWGJz?=
 =?utf-8?Q?760BS5IJee3CD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0VxMWFHTTR5WnIrMUVhRVFhV1k2dW1OOUNCYjE4cVNqMkRrSEc1OU53SnZh?=
 =?utf-8?B?ME5CVHp5MDV2Z2ZBaTRkMWVxOURFN0pDeEI4VGc1a2d4elE2bWZqOUUrRFBr?=
 =?utf-8?B?WjhneWJMSzZMMGJ4d2sydmhCeDlRSjZWS3g0WlZJNUVmQlBUdCsrQzJOdkNN?=
 =?utf-8?B?blBQVHpiWi9ubEZUYzYwcy85eDVRN2htdFo0NjVMa05POGpESVVBYStta1V4?=
 =?utf-8?B?K2U0bHVWWkNVNWVQSi9EY3RUcFlkR0JtWE1pZHNybWpKYVFPei8zUkxYcDRq?=
 =?utf-8?B?ZVBDTHFKd1IyMXRRZ0NFWVJTTEhOUXRubnpKUXZmS0ZBbyt1RzNOVGVRa1lE?=
 =?utf-8?B?TzlnUjZYTENTUGl2TkJpcS8vNklNT2thcU9uVS9MSkRoOFpSaWd2Q0VtYzBO?=
 =?utf-8?B?YjFuN3FJQjRZbmVob0RxWUk4WkRQNkdHWlRBMlZ0elBBY1JkcjF3QlpscmJw?=
 =?utf-8?B?K3NuOXd1MDZWK0xDUFN2Y2dhUmNFdzBQMTBNSUVkOHF1T3EwYm9STWZOZFZa?=
 =?utf-8?B?eWpQU2VIUmlqcERtS3pqbElPWStCRjBoVC9ZRVQxZnZCT1Fta2ZVNElLc0Zi?=
 =?utf-8?B?N0swazA4SGpEV29qdnRsaW1DTUdLKzlDTU1oVGtCNzJGMDZOMFhmQmxEeXpv?=
 =?utf-8?B?L3JscmRvbkpvYit2N2hFVUdacmdRS2lTd1dYZW5wK1lvZExLRGlXd3JmNlg2?=
 =?utf-8?B?d3BvcTU3NFZHOTlLS2ErUFNvckNZTEtNT3ZZY0pYd3NIYTV6NVRGUUJpc1Ix?=
 =?utf-8?B?RHhZaWwxSHFzSE5GbDRCSmYwaysxQ3J1VUN6MUkxMEM5NnNEbTEyYWZzYmU3?=
 =?utf-8?B?cHM2TWc5ZW9iQytmOFlKYkpXZnl6VGdzTUthUGFFc1ZrRTRWZ1lxYU5mSW52?=
 =?utf-8?B?cU1kZkRidWRHeDcrQzJLK1F4WVBoVmJBaWxIZW8zaDkyVXVjQTAyZy9SYVU0?=
 =?utf-8?B?eWM2NkZ6SDFoS1JJUUd3ak9iSnY3S0M4bjVlYmVSaVpuSDlBa3JTYjVMbUNm?=
 =?utf-8?B?b3diL3ZkclFhdmtuWXpteFkvVGRGVkJYb1RIdFFyNlM3MXAvZGs2V0tRc2hN?=
 =?utf-8?B?c2tnTGYxMkpYSzdKWWdud25VWEFoaWRGS3lNdkc5ODR0dHgrT09JMmZCem9M?=
 =?utf-8?B?RlBPSGw2NG41T3hiSTM2M0wxaitFS0lUenVSMWhIMXNtbXdaUnNDeC9HWlA3?=
 =?utf-8?B?SXJWd3lxQ25VVDEvNGhSVUpHUmlrUzFhcnIwb1BUUVVuQTlqMmlRaHhJaitu?=
 =?utf-8?B?ejlNUER1ajU3a2NTamFxZ2U1eDVQQmVneStTQkRwT3crWmg2dGY0S1RjNUFI?=
 =?utf-8?B?OXZuUTUvbXU2ZjhtQ1ZPZ1ZWc2VTL0krTmVIOWNQNGprSUdtZ29rT1FsUUo1?=
 =?utf-8?B?RDlUaTlvdEtpbER0VHBDV0Z3NmVyKzdnNWxNOTBZVE4vejQrSVVvZHlMTWNH?=
 =?utf-8?B?Y1BaWUR6MDZtMnZkS2FjSytwb0dYaHgrOWFRcWVySHJ3aXNRcGNRTlEydWZp?=
 =?utf-8?B?UVdJRmFwN0loOXVXL1pTelVCK2JUUGg2R002SnNUaU91OFhWWStwSWlPOFor?=
 =?utf-8?B?anBZVmZIQkF6Z0ErMHFzNFZReXloTXJnLzdGblIxTjRyU0ZEbEZXQXRiNEt1?=
 =?utf-8?B?WEhuTU5lUmdHSVBvZ21ENGVGblpudzBaV0wzY1hLN1hwM0RXZXZVMTdid203?=
 =?utf-8?B?T2duaWdBUWp2YldLeCtxVlZhS3NLVFBGY3JxdU8wSituMEgrM3M1aDhhNlhv?=
 =?utf-8?B?VGhzaTFsVFFscmhzQ3F0RVA0OWRic3BWU3Q3MGlMK1JZTDB6K01XUVdHZm1D?=
 =?utf-8?B?YVhjRkdFbHYxa2JCTTVJNkJUdkZVWUtBUGs1amVZeVgzckVWL2FkRzdHaXlL?=
 =?utf-8?B?YjM5cjkwLzlEMFZIMmgyNFJ5enhsNG9CMnN3OVJTU3EvQmJmN25XMzBQS1lH?=
 =?utf-8?B?SEdyVTN6MU1XNzQ5UnBiMnMrNjJFeXU3NUxScDF0OHdtemNDSHVsdC8vcDNh?=
 =?utf-8?B?b09pUVV4bHh3dTlaVEJFU3Fwa0ttM285TU5aL0VEVkovcmFPajRkNnhTbTUv?=
 =?utf-8?B?akJXUVc3TW53a2ZjSzkxcWlxMWk3VDNXUU5zT3FBOGJZRGJySlVNSnFQWmZP?=
 =?utf-8?Q?1TeLpPzz51M1vpMDSz6geWOoJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1594b549-1ad6-4360-e4ca-08dd5ff18e55
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 16:35:23.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6q2XTbSXng6mPTJ/6XLJUTraEkpY48ZQQelVDFLEw2FsKrry3JerboDy7sI1nnOIQ22XJ5/ct37kWP/4QvCzlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

Hi Dan,

Thanks for the fix. I have missed earlier that PTR_ERR() casts NULL to 
0, which kernel treats it as success and not valid in this case.

Thanks,
Pratap


On 3/10/2025 6:52 AM, Dan Carpenter wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> The platform_get_resource() returns NULL on error.  It doesn't
> return error pointers.  Fix the error checking to match.
> 
> Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-amdisp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
> index ce21ed84b929..9256ed67bb20 100644
> --- a/drivers/pinctrl/pinctrl-amdisp.c
> +++ b/drivers/pinctrl/pinctrl-amdisp.c
> @@ -183,8 +183,8 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
>          pdev->dev.init_name = DRV_NAME;
> 
>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (IS_ERR(res))
> -               return PTR_ERR(res);
> +       if (!res)
> +               return -EINVAL;
> 
>          pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
>          if (IS_ERR(pctrl->gpiobase))
> --
> 2.47.2
> 


