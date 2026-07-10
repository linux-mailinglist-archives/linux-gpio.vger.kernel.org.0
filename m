Return-Path: <linux-gpio+bounces-39789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aycCNwSLUGpU1AIAu9opvQ
	(envelope-from <linux-gpio+bounces-39789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:02:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3347377E2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="DW/3j27O";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39789-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39789-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11B4B301A394
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 06:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF083ACA40;
	Fri, 10 Jul 2026 06:02:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1902727F3;
	Fri, 10 Jul 2026 06:02:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663346; cv=fail; b=oGeT3LMbKJlbID+fsPgHCIR5s/i82+l8ZF29i0UkIbEZ411QxZR3lSh0Au/H6c8zMdtySGPf9AsDRU7LaP2jO/K+BIjnmo0W6jDK8uysJtvzo4jf7NAesjdRfUZ+pT8Ed7nmTcFsIouY1idofGavuHviUrx5coAnybuu80ih7fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663346; c=relaxed/simple;
	bh=igPS/VkMozz+R5y7RpWnhs4kSrdKMkPRqIWVphoHPwI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FtTVXGIEDKtLb7DGy81MdWQwGO1Jyhcwwa+s5pKhwb7uL7UhZ05tqAjxVvRAADhjnOd81A6oyIo+3e2YKG2ZOCxGWNRO2Ehi3kZMV2AtMEUok4RJGrDC63tMf/KUEuS3wRLZpQi/kUdnwVIn7hxGlSikMJC1HL1WzYZV24ZWqZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DW/3j27O; arc=fail smtp.client-ip=40.93.196.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqxTtjpSe3a+Uak15pIPXmT6ynpYVYVwLxRtr/iv+UsvY+8MeEZd4UQ18YMAbGKTS5x4uEl42IMHpVQCNaUqnQZKzOAiMUrwUmdCVx/Rr93Nla+YULPeSy+eK+ha6Hlt2+IL3ZsrFFCeajg4rEVixhKppEXjlMa47M/S5Lser2xusOhYMvvXdNZjctWOMLfDOKGH5/seZk2gBhM4+ZoW62uyb0AbU0o418jil2PxMt69uOdqEwYpu0QTFH3Ok+FKYvF0Wez+yFUTaja5g8/M1HlkM/Cc0Vr29q7y5cEnZeHy/r76cxSty1BOJqaoaqga95uo9qe7/1F+WfMP/a/xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZRSrgy2U3e2BtO9OnEsB0U+yACKuWX0UJT31KF/Mro=;
 b=KHwprCIt9PTjn9mf+STLH5AmQxgpA57O5Ak+dVz41vgz4kIJMwUOfSTK2X2yARTEHVGKht65OHT5+BZNdyt+qxk9/jjvc6lq4aHyrzG52bVpAfFU3g1uEUX1XLtJ5/bCtVDFynhf8WLv0cxJNr9H1cviTPC71Ymg1+QIJR/2k2JtAzGx8vRW6c29Dr4z3ORYgybGILcNmt2UElMBDCFybUl8vW1GZ1vxJeQsjnIsaDi/Sv8ipYM8vTHtWhRqfFZfPCGUr5cgIIHihxwowtHnaEkcmFjnG3gZiw1nkSXpXb1HgdR/cZOLxg1aaNZ/IJtsJAAMwaTYvT8M+nz5qAKO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZRSrgy2U3e2BtO9OnEsB0U+yACKuWX0UJT31KF/Mro=;
 b=DW/3j27OebktdJpg2S5NmAIdTCWQwzeDbWPtrBbi8LW74EpHujqJPtn1cvSsNv26LGunolBwRmFAOdP68pTWG4v99R1IIfFB6OU7kCUNGYms4em+WtHqz/jACCGWUZ9k4L8AZm1NeqE983ho5vK3VMsJF2YNS4r4uWJY7d2VxO8=
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 06:02:11 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 06:02:11 +0000
Message-ID: <233a5acc-89e7-4ff0-a8c7-867dc1c176ff@amd.com>
Date: Fri, 10 Jul 2026 08:01:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
 Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <dlechner@baylibre.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>,
 arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <6cc90547-a3d6-40b4-8914-a1ff60944cdf@roeck-us.net>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <6cc90547-a3d6-40b4-8914-a1ff60944cdf@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: c640b4f2-9a5a-47b9-533f-08dede48c7f2
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uZ+OG5xEiz/H7na2lUd6Kip0kUm1x0E64QeUbqJ7jN4dgvEeXH73wIu3suO6KiF407ifcKKbn5FzyecWyccjerDtz4w0xtF8/ghBisvgpd8nMQgZ3R00vq9VpPmilYTm3t+D1ndX0OacNLvOE7f6U5Sb1xjhjMDvV2+0WfEE5AQIP/PpnPFAuxmvvl/BW+vkpPxtS0bxG38/3fVrkg045KA7EboIMlbqUH41DFUBDJQx2rn1JmZzEAhlQrs3SpAnyL4fT7MTlXPb5IcFrhBZZtfbeXRR+8+xM3x2ZdLxi2dco1kJNJDeMJcPVsr5gmgSuy0LaNZhoS+utl1XD6eOWB6IWR+cC3wtq0OYNJLUnnZDNJjafgyzu4kVb/rqgGRrViZ8q6ZPTmnjtCuBwAKdt5LSQ0/3SLCezpDWTbSPt35My2DfqFL+hPDl9YPA6KDxFPIKqoKSSog1J/+WEEKF6dIpM7Rjh+FlDQUHRkA2BcnMyg25TYYxjiJJCJmug+878eP+gdByLUowRJqSk5TxhPZluhbVx7wDXsn4+7YeeKplwjub+HEK4jLIfnKPd3O6liz8Fe2X+9kk3o7+ru+ReDYef1OQ+xyTL2CbwXjn0XKv999rPk/C8Th8cI454ixqbWVIpnb3KwiIH+nraQ7h6cdV/6e1wsixRxzdB8oZq1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wkg4VDFnWVBpbEdhTVIrdUFpMkVJMThNT1NsamJLcHRXaDFSOW5NSHhHSmZV?=
 =?utf-8?B?Sy9oWlRSckUrdUsvSFplRHJkVGo5cXQ1WklMMitQVUdIWmd6ZnFIUFJhVUFQ?=
 =?utf-8?B?SHlvMVh4ZkpvZVJtWFdLRzU3djhDT2NGbkx1SWNpU1BHeDRyUTlXenNIajVz?=
 =?utf-8?B?bnk4SDAxd0I3cjNhTTBCUS9MM3Uvd1VGcmpBdzJVWFowOEVrWmljSlRIM1My?=
 =?utf-8?B?T3VGbHJtaFFZdXdVb2tXRGFYaURzTWRNTFVCdW55ZERUUjJydUxMcXlWUldZ?=
 =?utf-8?B?TGZwVlo1Z2Y1bzQyOGRUQ2FNUUtPaXFsaktFL0hWaUxYOEVJU0tvRVgxNnZU?=
 =?utf-8?B?d2JacUs1NFlUb3EwdUpSVld4ZGtlQlNoMnZlVHhqeEZIZ3ExeUMrVzlheGZp?=
 =?utf-8?B?REhoQ05HNUJWc1hmQWJXTkpXUXVGTnJKOEhuVmlWbWNvNEtKa091UHpYME1p?=
 =?utf-8?B?aERMeUdXVWdFSEhNVnBVQmUxTGFvMDlJQWJZbSsxSUZUdEtBWXQ2OU0xMWxB?=
 =?utf-8?B?ZS9DdEtBSDdpeXhMa2xBUmgySUdTQmE2bkp5b1NRNTVJZk9Ic1pJUmJvdTVk?=
 =?utf-8?B?S0xSTUozNFA0a21YcGpoOE5tRFMwbEZqWjcxOEljMmc4RlRPRkcwNkNzRXlF?=
 =?utf-8?B?a0JDOGtsY3liQUZlZy9TVHN5dU44TmFjUCtoSGkzOUJOWjFUQy92TU9weExs?=
 =?utf-8?B?cnh4eWFjakl1WWxjWld5TmZhL2pHRjNsRDJTYlJNcHBjYlRXc0MrY0ljY2hH?=
 =?utf-8?B?Ry8wRkxqVGJUaXlPWG9GVGJMU29HUHVJOHRFTnk0ZEd0WTJpZExJRmYzVGFS?=
 =?utf-8?B?eVFGWjNIVlRqU2xqbFpTTDY2YUdUS0JpZURyWmhReFpwRHJEMVk1N0cwc1l0?=
 =?utf-8?B?N3I1Y2xaSE1NbElUM3U4eFkvTmFlSDN5SEV6dHNodG1YcUlITnJSWk9NUDRD?=
 =?utf-8?B?MWFxRkhUZVVPMTM3YmlsUlNUNnVydnYzVVZhZ1JNRk1IMXBDNmJPanVzRnMy?=
 =?utf-8?B?VXRueVZsMjB1QnVOY1JLNm1SbHFxQnNXSlFzem9sdGRjVkNSeE1mV3R6cGVp?=
 =?utf-8?B?cm1IVkgzcEhSbGNlUGVuOTIxb2hKL2NGNUhKeVJiOGVyb0NEQit5LzhTRDRH?=
 =?utf-8?B?UEwrUE1vOGxaRkJuWG9GSVpyQ1RINnI1NkZ2WjVETVpaRzBiSVhERFFhTmpV?=
 =?utf-8?B?WWV0VmFrRUVKdG1wRTNablFlSURwdU0rejgwY3FDb2NvMG9sVXlNbU9TVTIr?=
 =?utf-8?B?VFAyeTUrcTl4RmhoUERhYmVIbTdMVmhOM0YxUWJ1eVNBQW84Tkw2OWdVZ0Nh?=
 =?utf-8?B?RjRSR0VnVURnYlBINVpYV3Jkazd6NW5meTlsWmJxQkZuSU00aGpXc2cvTkRK?=
 =?utf-8?B?UW5KS1Y0aHVnMjh4WXplWjRUYUZsTW0vTnl2dWI1NGtjRWtaZXBIYXVrMlVS?=
 =?utf-8?B?Nk5YM0habnE3Z054VEU3WUQ0U3g5WWlncmhna1IycG1WUlNLMXJHbjBpRjlU?=
 =?utf-8?B?TGRWeUxSWWJad25JWGNObHVNTnNSSkZpS3MxUFFkd09QNk1JM0hQWGN5ZmxL?=
 =?utf-8?B?QVlIUHRXeGhveU1uZllQYXBUb0g4aElLYXlBb3lFKzJaTkpIb0lETm5lWnRH?=
 =?utf-8?B?dnJTNm5UUUtaaEFwU0pTWmVsbEpmUUNIK0ZyRFNla0dPcjVSeWZEZFNvMi8y?=
 =?utf-8?B?K0NzU200V0trd1dFQTJTWmxPNTd6NGNpalJVOFFCOEc3VTI3WmxRNmFwYTl5?=
 =?utf-8?B?UzJqYmdTNXExTnlHRVJmTytHMFZSRmltd0wxTUc5cmQwbjhtMEVEclRqV0c4?=
 =?utf-8?B?YVYyWEZkUEhVRUE3djM1UHNWblRBTkdBbUpnR05yaFc0N1hnYWw1Rlc4dFBq?=
 =?utf-8?B?dk1oaDBWdURZeGhMUm0xS0E2Z1JDaXQzWlhKOTIwcmUzR3BYNkpXQk5Db3lF?=
 =?utf-8?B?ZTlGU0xVQ0s5MVRsZVF2TkxZVUpPV3RkSlJ2K0NRRWExK3puOFJFVGdVUm12?=
 =?utf-8?B?citnS0p4S1dObUpWN2dwRDI2ZWFUR3NTaTlxaDltL0xuRU90WXAxaHg5eTlE?=
 =?utf-8?B?VFBtNnJKeVh0bnB1aXJsTkk0ZjE1Um1GYUtEcEQwU0FhdjJBS0lhbVpXMldE?=
 =?utf-8?B?TDc0bC9lQkJCZUIyY0VqUEU0eXViUkhwTG0zVStQbFFWbENhTXdWakw3QXBv?=
 =?utf-8?B?T2dFblJQSm51V29BOXVIVG9YK2RQYzhZTFhkRk0xQzU5T0xRZFdtWmVuYkhP?=
 =?utf-8?B?T1NKRUM1cXVaODNrTHNFdjVlcitDMzhESmlHS0ljckRLWk1hUkRqZnJ0c0Yw?=
 =?utf-8?B?UVdqVE9xU1BJSW9VU3BxMmtYcjBmZkc1bUR3clNTUU55NFFhWmlsZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c640b4f2-9a5a-47b9-533f-08dede48c7f2
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:02:10.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0diETeLxWBzBXTpv9bccJCiNY8w7P3IId2uoHYh55HcE3seKbMYEZ/moe+RxyZPs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39789-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:cristian.marussi@arm.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:sudeep.holla@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmo
 n@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,monstr.eu,amd.com,linaro.org,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B3347377E2



On 7/9/26 18:07, Guenter Roeck wrote:
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>> SCMI server from different architectures than ARM that's why remove
>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>> rename folder to reflect it.
>>  From specification perspective only ARM specific transport layers should be
>> available on ARM/ARM64 architectures.
>>
>> That's why get rid of ARM prefix and description from documentation, file
>> names, folder names, MODULE description, module names, Kconfig and
>> comments.
>> But keep origin Kconfig symbols not to break existing users.
>>
>> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
>> already miss arm prefix that's why synchronize all of them to be without
>> arm prefix.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Likely I missed other locations but I wanted to send this RFC to have a
>> discussion about it.
>> ---
> ...
>>   drivers/hwmon/Kconfig                                 |  2 +-
> ...
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 2bfbcc033d59..cda0aedb36ca 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
>>   	  will be called arctic_fan_controller.
>>   
>>   config SENSORS_ARM_SCMI
>> -	tristate "ARM SCMI Sensors"
>> +	tristate "SCMI Sensors"
>>   	depends on ARM_SCMI_PROTOCOL
>>   	depends on THERMAL || !THERMAL_OF
>>   	help
> 
> I agree in principle, but I don't see why this would have to be done
> in a single patch. Also, both the Kconfig file (SENSORS_ARM_SCMI,
> ARM_SCMI_PROTOCOL) and the driver itself (""ARM SCMI HWMON interface
> driver") still reference ARM.

It should be split for sure. Just wanted to get initial feedback about this 
change to show that it targets multiple locations.

Thanks,
Michal

