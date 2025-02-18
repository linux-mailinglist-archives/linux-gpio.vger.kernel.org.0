Return-Path: <linux-gpio+bounces-16171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5CA38FD6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 01:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37B737A3512
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 00:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647F6A48;
	Tue, 18 Feb 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ph7RLlg2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B793D6A;
	Tue, 18 Feb 2025 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739836973; cv=fail; b=ebXF7wgvLDPRsXZs2o0N9Yaw8OGlXZOvNtnlcRsc/BX+qfqLyIG1PdH4/6uByDnt1cWmWGKux/vWr4Hhz69ISlTEjCIr3tsLE/B7zbXf//IhfoNxNuTUmogo4PTb1eYeKrrP790y7yX9ZO/UxfPIrKH8V4ixQgC6RcHAD0KlNNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739836973; c=relaxed/simple;
	bh=KDd5KjxewiLBq65RR7PUteltSCNcemyQ6XgftpApX4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mP1RtHILp5b8eEMQQ196MWcyTRrNsWd4DGdX8VqpJCDHfRc+w8zNqxu57/ESg9BL8BLzb4oCraUkI/trBgRIX5Hare4OW6KkPSXVhFDZqj2jSSsFoEWObMR2Aj1Mkf3SqGdKN7zGg1KdWROqnNcvQyKMHfz8rycduRav6AM2Zts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ph7RLlg2; arc=fail smtp.client-ip=40.107.105.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8vsEtlMg+e0HfhVic3yRIU0au/A5vxBNLa4z/nY/tp355syZogQHRF08eLRyYufshD0DyOjtNSzp3KyYYFZl45bj9GLJ4ixoeEHqOsFmGdHdw8OKZ8NSMtVv9EQpSA4S22VWrJeVO0vF569+c0QSV8b5+WTYo280IRtWnHHEiyctWdKokMWL0Df2yhQvBR6K9QkYNnmKUCSBZKVWIKvx19UtZl05MPkEN4usQiXcWVrXW/GVQ7mdKHskMLaqlfVvsPFWfX+4mV4ylgnUZyenakuHC3L9KLKCH1RZwtxMKyH6HKvi7bXE37ZFC9KJX/yjUaFf0/XAF+gqAE2mt42ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kq4WhBQq1YwSuUCqT1S65fJpW2UlmPYc0xbsOlQ9cc=;
 b=ccX1vsZwyfCGa+h+93gCIiR9nt56t4dYbuU/3hWYU14Jwn197P2qJg31in3vuLD8c02pbcMdbhNzJKRLwJ0a/DYAaOy/iW7qc2mGgP63+GJns29wMkjahvD0eEr4oavrIj4QOQwVo6cYHulZ9xHAnLbHVcGHtG+zEtRpBKcg3GI8AJiSm4BYlzRx9OTJJYMZxNlwyluAwnwNyOedH6RhlJg7ABxycf3IC+avLp2t75VI4LaMdYSLMdhejCOahrxKtO+Xoj8fkV34wPrTPvA2tl7dfnCQDTxq83I/tb3HtYGTdDJ1XH06NfZ/sPNWNkcoqINuP+86VnTNADW0Y+lMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kq4WhBQq1YwSuUCqT1S65fJpW2UlmPYc0xbsOlQ9cc=;
 b=ph7RLlg2OMhyQBCkGZjBTOxTN/WpgV/kCPtWChg00Ap4zgsmJWIgfGSxCYLPscDpR2XdgdpYecW9Xp64vDRd3R4PBmkoG2VXxNvjQXe+xx0yMloYnzanbKQsFTb2bCkk/1YJTGoHRnKkR69EF6P3GFGWbUlcTPd3ghXFpdksgx3DVemmUIuE1nrzhxoVsNEGUjPx05axq0CXFgGGMToSdsbWvGH6Pu3g6On8ir4doMX4nsfmB01/3VC+i/aplDzV44Wv8LS04Ue9h3TPVnO+zahCs+WM/yG8eACCYADhXm4TKKihen781q7nFrS39CQ1GpgGAoe6bIvCCcEqswwFqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 00:02:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 00:02:47 +0000
Date: Tue, 18 Feb 2025 09:09:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250218010949.GB22580@nxa18884-linux>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z65U2SMwSiOFYC0v@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 283389b9-ccce-47df-c2b6-08dd4faf9379
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTdBTWhGbWNsMzJlbzlFcmFiTkhUNFc2WTlUUFh4SG4ydkFJd0R4RDg3R1dp?=
 =?utf-8?B?dndpbFdaL2pOenRFZVN0S0orNXRKYTRPc04ybFFuOFpsY2JtVWNEUndUS1pX?=
 =?utf-8?B?aE5UZm96eTVuTmN0UWFJcDlSMVIwZzU0SUZ3QnpLanl4QnQyeWc5OWt1d2NY?=
 =?utf-8?B?SXkxOFh6S0xEN3d3dmh4SkxDd1YvM25IcHFkMFF5bWhnSHZCS2h1MmNiMUdE?=
 =?utf-8?B?d0tETEdCOWtSdGJsdi9tbGdxNEszMmZEU1dKazhicFM4ODlOR1BwcVh3YmdT?=
 =?utf-8?B?VEdQS3haU3dwU2F1VUFSMmhFclp4MEEzeElDNXVDUXJzSzgrOWR1YXhCeGlP?=
 =?utf-8?B?cVlmTmZ3RVJKQ3JoaXZ1N0hRcEZ1andTMDlvaTluWng4ZFd0TTAwaHkzQXhY?=
 =?utf-8?B?UVg3ejBEbko2NXA0UFA0blpRc2IybUdmQWdFS0hyWkxycXhUNW5ma2tZMVlK?=
 =?utf-8?B?TTYrdTAvaDVDd0lEMm55RFFEdEY3dkpSYkRlNThWZllMQVNnbDRuTW9nZWhm?=
 =?utf-8?B?NlJxQkcyZFJNd0hKUUIyT1dEc2x0aExHL0dBUXVnWCs1WDdRSWNSaWhuNXNl?=
 =?utf-8?B?V3FhMElKak9UeTlxb01xQzhuVVpoVnJRN2JYMXozeGdJUHM0a29QSVlxZlAx?=
 =?utf-8?B?SGRqWVowNjdYakdSUjFKeU9YNlcya1lVMjV4RjYvZEhtOWhvbzc0VjNKS0pm?=
 =?utf-8?B?dXZHbDhqQlo5dGxHN2tabmtGSTZka2toRzRqTjhJU2VHMzg3QUZrZklOdmFH?=
 =?utf-8?B?QWVSck5tL1kyazNDV2tSNUpPN0liWitxR0RleFFYbzdmOGZKNVBzelZuZVJq?=
 =?utf-8?B?K2l5SG9HRi94ZmowbkNvRnBCYnk1Q3VzRUFUYktCT2owenZtZXRuZ1l5eU5O?=
 =?utf-8?B?OSsvMkRVcm41bEJHeGtyeUdSaXBDYk5rNzJrT0xxdi84V0NnQUd1L2JqODR4?=
 =?utf-8?B?dmYxYnovY05CeDYrTHZjMEhkMWNrczJxbTBSZHVBa2RURVJmejVNRVcxSU9w?=
 =?utf-8?B?ODh5d1htQlJYOXRRbkFsRHpzaUZqcDUrQ0p1K2JwTjJpSGR4bU5NMFNqVHdq?=
 =?utf-8?B?NjZ6dG92bzc3bThzWnRtZVk2ejRlL0pkVE41cFFmQXNqMml5elJxcVR5NVU4?=
 =?utf-8?B?OFR4NDM3SE9MdG5CeTJOczJuc2RBNFJHQVNWNFNWRGhkcUNpWnFHUTRzMmFN?=
 =?utf-8?B?NHFDSjRka1BSUWxjZkFVT1VNYU16bjlPZHl5bE5GNHV0aU9qclhpbG9ZaDlN?=
 =?utf-8?B?eDhWUllrOUpGK25aTk5ibFJ6ZnVJc1B2aWE5dUxYd2d5b3ZINE8zMUdZSjNk?=
 =?utf-8?B?cE15Q0VrSUFpaHlMcEdMQnJFUEErYnF0QUJXWUZvNGdlZ3ErbldGSmxTVHlY?=
 =?utf-8?B?bElqYXVnc1cwUGdLVFZRSWFmK2hPWmd3bWJodHB5U0Q3UHdFSThuTW1tYkQz?=
 =?utf-8?B?d2cyYitGa200d01LL0psKzJEWlVkOWF0N0d6ZzU2NXJQUFhKK2Y1N01MUGky?=
 =?utf-8?B?UHhtTXY5Z1NacEtpYm9WcjZ0SEtodEtJVTdUWkRHcjRDWUJ4T2szOG5ZRGZs?=
 =?utf-8?B?RDdJa0VUcGtVVnpoZXg5cGZRUlhxSFc1dzFIRWFVb0RjTXBCMFRySkkwSDY0?=
 =?utf-8?B?aDBZRDVLalNxWE9VUndVZjVIcmhzRW54cllkMEVoaE1WOFN5Zy9KV05CbUlw?=
 =?utf-8?B?dDBjaGl1VlpKLzFlK1pvakEwblp3bGtDSDFCeE11aUl0dnI0UEhGZ0RZWVFh?=
 =?utf-8?B?a0hwaXNUVFVNemNNVkJjZzFEMXljMXJzdUdzZlQ1OXlIenUvdlc5a2lDT1Rz?=
 =?utf-8?B?MCtEcXZvc21JelpCbVNkaXRSV3dac1IwcUFQTWNXRU5Kc05KZUx6d3BBdS9n?=
 =?utf-8?B?bUZxdGVzUG00U2gyTDFqUUs2WTJBVHYrTjRTd2c4L29uNjI5cnNGMUhYclg5?=
 =?utf-8?B?YldMSXliK1NJdGRYS3RkcWZxUmtJRmZXWUVNN3dyUXp5dDBHWnVlK1RmV0NU?=
 =?utf-8?B?dXc2Z1lkTlhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T29hV0hlR21oZHR5VWg3V0JFUWFxQ2FISFdpVHRhRHpreEJpNE1TQTgrOUth?=
 =?utf-8?B?WlM2aVFYUCtKQ0s3eThVR2dVS0haYVRjTG5KQ2haVDNNSTJrOGtsZGRiT1lH?=
 =?utf-8?B?Y3dSVlFRWENhK3ZIQmZnY3R1bVFNVzNobHdrWEM0UWJCY3VmRGRWc01PMTdK?=
 =?utf-8?B?czdQQy9meDlLMWp0YnVzV25UdU5zcFFOWXI1TWg1eGxmYk1LU2tEVlE1ZzU3?=
 =?utf-8?B?S1BoODRLUHU4TDR4bW5udURLV01GSDFEQjJNeFFBTTdPWEtHaTB4dXZ4cWJa?=
 =?utf-8?B?K3NxbWhDcFZMWnJ6dzVkT0RENnhMMVNJT0svUzRnY292bHdWc3N5WEcrS3lm?=
 =?utf-8?B?b3l4YTh1bWJxMzBIc3FtOElQMXNHNThNZWMwWVkva2VmTE5Bc3ZmYXZTUVRn?=
 =?utf-8?B?SFFMMzBhMElHNVAydG5ZRlNET2RUR1VvbUIyYjFKN1RMV2xhb2pYYWRPZG9N?=
 =?utf-8?B?bjlHWlAzdGsyZUt0ekF1TmwxajdleEwrTXIreUgyTndQN0hMQmd4OWZTQ1My?=
 =?utf-8?B?QzZoNjZzalF6a0owalhiUUFDQ3RsS0FaeUg5MzNuL1hGaE52Qk5DRjczMVJK?=
 =?utf-8?B?NG1TU3hYbTA0N2k1ZzlucnZ0cXI1cUxQRGowWTZCL3N6SUJjck1WTlRPbUh4?=
 =?utf-8?B?a1ltbVZBYUFNMG9jeUpSeEJXUE5BUU5jVFhiMzgxNGFTYk9uNURTb3lRTlVl?=
 =?utf-8?B?ZDNPbFhZb05jTFI5MTJwUG9OUElvVVlkc1RDRldaUWVZdHVCalZzL1cvVExq?=
 =?utf-8?B?UzUwazc5cytDSm5BZnRvVXRxaWVON3lCVTArUVZiTllvK1MrWERMRGZYTERt?=
 =?utf-8?B?ZHdQRFlKai9CaEpyK1lqNS91emVLWnYxS25GRFBlTFhTVVRyUG5GRXVoYVRo?=
 =?utf-8?B?YVJJMjA5VnRGSENnNk9SZW02M0haSkhCMVdDYmo5dnUwQndwcWdrTFZSR05R?=
 =?utf-8?B?ZndOa3UyRDRKZTAvczI5Rm5VMEFaU2dPemlleHY5S0krZkN1SGx0VW83UUJN?=
 =?utf-8?B?dTVmcFFXZWE5T2NrTnNVeFZLZEZud3Q5OWRjMHBSVE9vNS9JTy9ITUFvNXlO?=
 =?utf-8?B?ZUQvWk51UUJiL1hQdEZOMHh1WXBuYXlGekEyUC9ZMW9lK3l1c1ptN3dSemZu?=
 =?utf-8?B?L2ZBUDMzcUFaY0xpRUY5cnNCTnU4a2x4VXpFbWRwckFVUVVVczBPazFyc2ZL?=
 =?utf-8?B?SHVWek44cUEwUCszMCtaSmNRekd6Zmp2a1VTTmNuMnNZekQxanBYMTcyZWNh?=
 =?utf-8?B?V0lYMFVOUEUxRFRzNkpXUkRMUENENm0vMldsaE1hWTdscnZyYWtzWlRXSElB?=
 =?utf-8?B?ZStsV1lLdzZiQXBnejZuQlJlWGcyb28rLzRLSktOMkhxdjBzblFvUHJXN1BG?=
 =?utf-8?B?azJ1N081eitOeDZhdjl5NFczRkJlb0RnZVpPTzhYYXlIeVU1SFlEZ2NaN3B1?=
 =?utf-8?B?ZTF0eHNVbHpHUkIrcS84bXZnYUh6cHRmajdhaVlGTjczMVpNK3l1VHBUcmNv?=
 =?utf-8?B?T1VCQTZCa0wrR1JTWFRiWjkydVk4a1Z2c0ZEeTJ0Q0IzZFV1ejg5YUZkdTlZ?=
 =?utf-8?B?L1FJMHBOb084dVhqNmk5SmlrK1BZWWhuMk9RMDZRK2FVNDJvWSszNVlqR0R2?=
 =?utf-8?B?QXpMMTVlZnl6ZnR0aTh4QlR6ZnNjbHV4R1hCVVJyclBBOEUyVlpnK2U2ZHBH?=
 =?utf-8?B?ZGNDY1NYN0dYejVvcW1OS0I1OXB5djVLOTNaUzJjSVlEcldNSkRVSHh3M3Z3?=
 =?utf-8?B?WDhqWXhCamdSWkJ1Q1pMUjBFSGx6blhCYm5oQjRQdzQvUlhweUVCUUc5RlB2?=
 =?utf-8?B?SzJ3a1JsRHFnVnJYOWpoM1N4M3RDa0xIYVVzRGVHOS9sbE9aRDlhb0NvcVVU?=
 =?utf-8?B?MWpSWmwyUm1Oa3dOV0E2QzN5YlVLY3p5YVpEUGl2VENsRjdWcFM5SGsybFdt?=
 =?utf-8?B?KzEvejhCR0Y4V0pUWFBidEd6Vm5udVp4a1Y1bGc5aXF3WUpIWGhRblRVVklT?=
 =?utf-8?B?dkRlZWJxK1hpR2lYOGdYZWNYZkVja2lGVENjbEdNMisrL3pzY2R3SHZuaVpw?=
 =?utf-8?B?ZXMzMUxBRm9NVzNHNUNSRFRnUEFrM1A3WDE0SkNDQVVEWnBwcmRIcVkybERh?=
 =?utf-8?Q?9rjwa54fLXx50NEY0gYI9f0Us?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283389b9-ccce-47df-c2b6-08dd4faf9379
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 00:02:47.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yLIlgNyNq91fLOzM+FhWZuaF+iqSlhKM/zbnHQi0k8wg24nViqjTkxzDN6JWgBJ1j3S0w5Yb2wWCYc0Ux8iLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On Thu, Feb 13, 2025 at 08:23:53PM +0000, Cristian Marussi wrote:
>On Thu, Feb 13, 2025 at 12:03:15AM -0800, Saravana Kannan wrote:
>> On Wed, Feb 12, 2025 at 2:48 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>> >
>
>Hi Saravana,
>
>> > On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
>> > > On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
>> > > >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
>> > > >> From: Peng Fan <peng.fan@nxp.com>
>> > > >>
>
>[snip]
>
>> 
>> Cristian,
>> 
>> Thanks for taking the time to give a detailed description here[1]. I
>> seem to have missed that email.
>> [1] - https://lore.kernel.org/arm-scmi/ZryUgTOVr_haiHuh@pluto/
>> 
>> Peng/Cristian,
>> 
>> Yes, we can have the driver core ignore this device for fw_devlink by
>> looking at some flag on the device (and not on the fwnode). But that
>> is just kicking the can down the road. We could easily end up with two
>
>Oh yes this is definitely some sort of hack/workaround that just kicks
>the can down the road, I agree...just I cannot see any better solution
>from what Peng propose (beside maybe we can discuss his implementation
>details as we are doing...)
>
>> SCMI devices needing a separate set of consumers. For example,
>> something like below can have two SCMI devices A and B created where
>> only A needs the mboxes and only B needs shmem and power-domains. This
>
>..not really...it is even worse :P ... the mbox/shmem props down below are
>really definition of a mailbox transport SCMI channel: some transports
>allow multiple channels to be defined and in such case you can dedicate
>one channel to a specific protocol...
>
>...so, in this case, you will see there will be something similar defined
>in terms of mboxes/shmem at the top SCMI DT node to represent an SCMI channel
>used for all the protocols WHILE this additional definition inside the
>protocol node defines a dedicated channel...IOW these props mboxes/shmem
>are really parsed/consumed upfront by the core SCMI stack at probe to
>configure and allocare basic comms channel BEFORE any SCMI device is created
>...then the protocol DT node is no more used by the core and is instead 'lent'
>to create SCMI devices for the drivers needing them...(possibly lending it to
>multiple users...that is the issue) 
>
>> will get messy even for drivers if the driver for A optionally needs
>> power-domains on some machines, but not this one.
>> 
>>         firmware {
>>                 scmi {
>>                         compatible = "arm,scmi";
>>                         scmi_dvfs: protocol@13 {
>>                                 reg = <0x13>;
>>                                 #clock-cells = <1>;
>>                                 mbox-names = "tx", "rx";
>>                                 mboxes = <&mailbox 1 0 &mailbox 1 1>;
>>                                 shmem = <&cpu_scp_hpri0 &cpu_scp_hpri1>;
>>                                 power-domains = <&blah>;
>>                         };
>> 
>> Wait a sec, looking around at the SCMI code, I just realized that you
>> don't even really care about the node name to get the protocol number
>> and you just look at "reg" for protocol number. Why not just have
>> peng's device have two protocol@13 DT nodes?
>> 
>> cpufreq@13 {
>>     reg = <0x13>;
>> }
>> whateverelse@13 {
>>     reg = <0x13>;
>> }
>> 
>> You can also probably throw in a compatible field if you need to help
>> the drivers pick the right node (where they currently pick the same
>> node). Or you can do whatever else would help make sure the cpufreq
>> device is attached to the cpufreq node and the whateverelse device is
>> attached to the whateverelse node.
>
>..well...my longer-than-ever explanation of the innner-workings was
>meant to explain where the problem comes from, and how would be difficult
>to address it WITHOUT changing the DT bindings, BECAUE I pretty much doubt
>that throwing into the mix also multiple nodes definitions and compatibles
>could fly with the DT maintainers, AND certainly it will go against the basic
>rules for 'reg-indexed' properties ...you cannot have 2 prop indexed with the
>same reg-value AFAIK...and the reg-value, here, is indeed the spec protocol
>number so you cannot change that either within the set of nodes sharing
>the same prop....
>
>...moreover the above additional construct of having possibly per-protocol
>channels would create even more a mess in this scenario of explicitly
>declared duplicated protocol-nodes:
> 
>- should we duplicate the optional mbox/shmem too ? not possible...DT sanity
>  would fail immediately also in this (I suppose due to duplicated entries)
>
>...BUT
>
>- at the same time we should assume that ALL the duplicated protocols inherits
>the optional per-protocol dedicated channel that is defined in one of
>them...seems very dirty to me...
>
>...moreover...explicitly allowing for such duplicate DT protocol definitions
>would open the door to create even more SCMI drivers like pinctrl-imx that
>uses the same PINCTRL protocol as the generic-pinctrl BUT really implements
>the SAME functionalities as the generic one (just slightly differently
>and using a complete distinct set of NXP pinctrl bindings for historical
>reasons AFAIU)....BUT pinctrl-imx is an *unfortunate* exception that we had
>to support for the historical reason I mentioned BUT should NOT be the rule
>NOR the advised way...
>
>....while other drivers exists that share the usage of the same protocol
>(HWMON/IIO GENPD/CPUFREQ), they use the same protocol to achieve different
>things in different subsytems...and they are anyway impacted (even to a less
>degree) by this fw_devlink issue AFAIU so the problem indeed exist also
>out of pinctrl-imx
>
>> 
>> Looks like that'll first help clean up the "two devices for one node"
>> issue. And then the rest should just work? Cristian, am I missing
>> anything?
>
>Yes that is the main issue...but still dont see how to solve it in a
>clean way...

A potential solution is not using reg in the protocol nodes. Define nodes
as below:
devperf {
	compatible ="arm,scmi-devperf";
}

cpuperf {
	compatible ="arm,scmi-cpuperf";
}

pinctrl {
	compatible ="arm,scmi-pinctrl";
}

The reg is coded in driver.

But the upper requires restruction of scmi framework.

Put the above away, could we first purse a simple way first to address
the current bug in kernel? Just as I prototyped here:
https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2

Thanks,
Peng.

>
>Thanks,
>Cristian

