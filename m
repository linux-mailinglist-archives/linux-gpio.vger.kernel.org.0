Return-Path: <linux-gpio+bounces-9877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBCB96EE6F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 10:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1D9284DFC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 08:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E98E157493;
	Fri,  6 Sep 2024 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xqrMcDz3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C49B15278E;
	Fri,  6 Sep 2024 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612222; cv=fail; b=Y08PyPTAalH/i8GaWbL1Les3EK8o7eAiJQkMmJA4/sfwG8EsEdoykyzZrL0dsax+HKbifrHrJxjenBOX++8XGYgine88NTLWWNBChg/0YA0C5DcEbg5t8eEEA2NYdU6g3xMlXSqJCE53Q0Ax/MgGmOo6vsKH4OJwGrmRJCtk2aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612222; c=relaxed/simple;
	bh=RiphTgB2WC8vZFqCVK59qtMHqskV0Mm+ZKwTMsnG3Ro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OZSac9KhxcW3wZNsIW19Ac9htqtrT52WMNDH1k3nO3XIE0+UyUVC5UFKrQSev2hLBdPTxCCwLvdkqK0N8LjiZzWSlUNASjr1GTlkgfWn9IT1KVxE1ftWWsRPWkB6xU2JTzsTkNKQv9a+HYGs8VUY1OP2DEzEHTN9xWlYnwS3axg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xqrMcDz3; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4pne4D+zcabt3KiuIoRuCK2SRL7hRPg3UuJLuQogPUgFCm/yHhA6OqmEFx2xuHAVg/ZtsygoWgEeC3DEtpnu7mBByeND1qTBB4Jr2ybQgPyXiv4JmgN4gCUFAv7J7hW3YYpTi+vlfKR5UJ7Z8tTA6ZHsv9ihUL4JENQ9wUnWIWzYDbI50lW+BCFFimbBNDUzWAh64VczU+SQ2Czvp6kg3hfrU84QKG65bDFrXWmDgOBfpE8SuNiG3jfuF0y+6dXSKy9reO5qBnM88Brmjolo7fPX0Go1tX07QUMEbRQL7tt/3SL8iAlPYtIsOjobi9jb1VL8qgz0sM5GRERFjTURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHSOZZsRnukhXeJ3/+NUi67cXyy1hzWhr7B1ffx5N3Q=;
 b=oxxcHQX4OhVk41hVCt5EB6E9QE1YvQKlA+NKjl9AZF36Ug+FGeUI/b9/Ff/+OwjyBDbMVnH0dXGy2wc8oab5kkwSoUvsZD8ys7iH5lcyanmE7cxU/O0NKNeVTPqtlDt0xyyLz3uKM5e1TpgStc+w1sgkoT/BRVXMXyY44ATkt6PWtgonWbdbbUbhf1fzWM7zal1eTcepAvlRjGZxNZo9MJKD4uTadSe7FA2OCdNkkt2ubp2JglE97fPrr+NIzyz5YpaweU44T59Wnbf9mlk0QDf/VxdjVDTLFtU6nG4aTCHf1rCQHQ4nvYmiCHP+6bKSuJRQnpgG9+KZgirYqgAvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHSOZZsRnukhXeJ3/+NUi67cXyy1hzWhr7B1ffx5N3Q=;
 b=xqrMcDz351zSYXcKbLnq/AVbZvd3IOGti5vRrF7BAhclb/iMlORbyZEhTMNjGrymHph0VgwPpE4j3myNG9B4txX5FpdMZxdU3rIPCjGuu56HuD807XOyr6JEBnqFQKrf+OWIgBp3rzuhMlBmBxnGKPSjvT0SrbeEFVE42PW4b4dC4q/C2fwnzKdzrD0wPRlN50hc7LfCBKwdlFWnDWSxbqfuCWmCTe3JzOts3pRspQfBRKbHViRb+al7g+x/9U9m1xu6VtQy+kdVUqXckE7mSRgRMUNw498Kskbc5tDyqNWSmqjk8RmGiTRKGc6N1MUq8HzOlnTiJKe7AqMSQ2WFrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 08:43:35 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:43:35 +0000
Message-ID: <6a65f608-7ca4-44f1-865c-6a1b9891b275@oss.nxp.com>
Date: Fri, 6 Sep 2024 11:43:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::9) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 837194e0-8cb7-4234-f072-08dcce4ffe85
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG55dzJIU0tyamRlTlowU2wzNVMrS1VMZFk4ckgyZE5BTE5LYzRDTFFKL0g0?=
 =?utf-8?B?N2VDWlJqUTdMVzlTdkduYS8vckJWeEcxNmtxdmF0Vlpaa2pSMldSZm1XRHNm?=
 =?utf-8?B?TE1heUlRVEg3VWJKbG1MaUp1OEduSEJUbGJiRjZaZll3TVhNaCtHdjdFZnhw?=
 =?utf-8?B?aG9XTEkyUytyaTlpZ3VsV0R3ZDlsT3BKbHNQVVBZOW9SOFU1ZTRPNTNBUHFJ?=
 =?utf-8?B?MVdHYmNFUTI0MlhRU2tXanFzM2RWQVJ1QmQycG0xNzZSL2VNSmN4bDZJdi82?=
 =?utf-8?B?dUpZK0Y5dUVDSWFqQlAwdWx1T1BScFlTTW85VHNBbGV3QnFYR3E5RE8wZ0x1?=
 =?utf-8?B?cVE2MU5iN3crNkk2V2p4aHg0Y2Qya0xaemlBbllYNVVkaFMxYUxRSmpPcmdX?=
 =?utf-8?B?cmlrOGl4WmY0a2dsUjZYSDRWQUJ5czF4cUNrbFNZeldVeEd1a2ZDRFNiSDVr?=
 =?utf-8?B?WEJwL0xnS0VBU0hnUVFKeVJrQzg4WnlsM0JCTG4vUXRNVE4zdG83UEZ1L0RB?=
 =?utf-8?B?bWJ0M0dGc0tjQzVVQ2QrVUpJNytyVE9UanN5YTFkdVhINFJTN1FWY1d5RTJU?=
 =?utf-8?B?VzdvcCtRL3pnYjE4U0V6bldBVStuWEFHY1A4Vk1qK29hYXI3STlqWHBXNldO?=
 =?utf-8?B?VmVMcG4rdGtBUVp2TDJNeEZYTHI5NmVsU2pEYy9ZSU9leHFLQnZ2eUZldkUr?=
 =?utf-8?B?bzdsdkMyVmV1S0JPa2YzS0ZVWXd2cmx1ZUVsd2N4MmZSTmIySk9yWlU3dDRW?=
 =?utf-8?B?NVI3aE9HTjlabG9ZUmp1TlA3RUk3ZGpJZEF1SWtLbm1HdDk1aW53U01pNGlT?=
 =?utf-8?B?WkNKREtGSjVtakE1WWJZVWVsQWVyek5HSlVlaUJLQTUwR0RtUmRoMFlUS0Jw?=
 =?utf-8?B?S2ljS29pY252UUw2OGtNOTN1c3VnczIrUENUMVBUSU1HTnA3T0dwR005NGJY?=
 =?utf-8?B?dFNxdHVaa01yYzR6SVBTSDVrckswN3JreGZUQ1RJRER5TzFPNllzS3dIUS9V?=
 =?utf-8?B?MjN4TmNyVFZKLzlMTVlHMFRiN3hwUVdiTE1WWXRJL3k3b0R1S01kblpmZzBT?=
 =?utf-8?B?bk9PelA1RVVRVGJqZi9RRUpONjJEamo4YnBiSEMrTG1WbVhQMHBYM3kyU0Jz?=
 =?utf-8?B?aDZzQjhoNlhOcFdSTkxLQkNPeHhxalVuUHk3TXVESnl2WkozSytVTkRpY2l6?=
 =?utf-8?B?WGxvdjZmYnV3dVk1ZGdhQ1NHdmx6OTlyN2ZDamNoUmhkeUNmMTNsMXR3NFJa?=
 =?utf-8?B?MStEZXZTTm94UDFhWWJOeElEc2twUkJYNTEwSDhkNk5kdkFJaGNwRU54ZWUx?=
 =?utf-8?B?MG8vSURtSlZmSmJFVjg3OU9QekJkZ2ZJeXVTK2NsRkdlc0t1UDEvODlVejFG?=
 =?utf-8?B?WElxL1lMZUhYSXhOWE0zYkx1RnhZS2dKbkdvc0RISWV6UzZyMUE2MVRlbVNj?=
 =?utf-8?B?NkhJRVFyaDdrOEVmcFdKb1VKSVA2VVNXUW1UL2dEWFhEU0Z6T1JUd2JMc0Mv?=
 =?utf-8?B?eXQ3czVRQmRlYnZvdGNsMXlBMFQvWDY4Y20wUEJCL3BXKzJmcU1OOUxGclli?=
 =?utf-8?B?YURXTTZKZlFpOWZ6NEtvZ3c0bGd6U2ZidDdkMWMvREozeXVNTDVRYjFUbW9V?=
 =?utf-8?B?bmoyTHZvNUU4UXFOTXEyZmtoOU5OanR0ZU1KMGYxUEhaSGYwT2x2Qk5lZThl?=
 =?utf-8?B?Ni9ydDRxQXA4NlRsWW5HbHhvT3F4VjdRT1FuRStkWXp0Z2d2SW1KZ2EvTU56?=
 =?utf-8?B?cGwyS1IwNFBPaFMrQjhJaTFsY1pFUlRpb0VWWk1kM1k0OGdmNVpDUk85T2VH?=
 =?utf-8?B?amZTeWQ0NWNSWWNJQkloUlJoMFJ3aXQ1U1dWbVpNKys0L0lVRHF5aEtsUDND?=
 =?utf-8?Q?s8jlxhBjhpZ7K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHlFMG9mazhEVlhUT0lDM0QzeFhFZU1XS1dKUzBlYll6dUp6UGFsNDBucTFE?=
 =?utf-8?B?NVNzSGQwMXhrOUNXdVZHWnphQ3p6U1BncFkzU1ZtSjFKNldTMENMQjFiVlRQ?=
 =?utf-8?B?U2dtQ3RLL3FNbEpTd0hNQzZFdjhIazZkMC9QQVJ3Q21Ldi9aTWhETEpRSWFJ?=
 =?utf-8?B?RWdnME5mdHdqNHRuTXJsZVFqb0NSeXYveUdGZDV3UlVaazRRRmt5d1U4eXJD?=
 =?utf-8?B?SHIvU0F6Sm9DZEtUSEd4SDdOc2o0OVE4MnViVEpXU3JlUjliNjZra21ZN0RL?=
 =?utf-8?B?NjVWVVV4ZVZpdlhFZXhXNG83TENFdEVEUXQxNS85Z1ByZlI0c2ZvdEdkaWtK?=
 =?utf-8?B?SmQxZFZZdEZ2Mkd3UUt6UFFXUnhkWWpLWUZDU1JocWFOb0IwTmNnMVIvUm5T?=
 =?utf-8?B?QmgwWCs0NmxvMjNFdDR3ai9HRld3c3R5V0I4RkZ1QVFJaWRQaHd4K1VJMjgx?=
 =?utf-8?B?NzA0TktkT2xwZWFJZEh1N0RJa0hLZ3l0V0cwNk1TbmhsQ0p5Z1pGUWVvbzNH?=
 =?utf-8?B?ZzRmcWg0aGsxbHJzcDhBV1NOSFJGYVV4V2N5TDlJQnQ5RlJxcm1TZndoRDg2?=
 =?utf-8?B?d3RyakxtaTAxUXFZLzV3YnFSL29IRHJrWHV4eVhQK3B4NXR4RHBaT0l5bWJo?=
 =?utf-8?B?M0xhVHBzWW9pQnZ3cUFUU0tvbkpHR1RkcWp5d1ZDM29VRXBCQVJ3Ymh2REd5?=
 =?utf-8?B?amNTbFNCWWN5UmJRV2kzQU1UUHhMNEVnbmVrMjZZTjliYWdERlMrSklUTm9u?=
 =?utf-8?B?M0h4c1F5RlBaRG45WWJud01sbjBXN3VPYjJNVmxiYVYwWUg3UHJ4NjMzeDFC?=
 =?utf-8?B?NXJpMFVXVmxQSm85bGZ5SmNaT3VoSGZLSUxvcTFML3laVERkclowUjZ3VGZ6?=
 =?utf-8?B?Nm1jZ1pSTjFsUzFibzZ5RkNKTVJhT0xvdFRCVm45eis3bE1EaVpwVGl2cVdB?=
 =?utf-8?B?S0U1RzZSU1NnOUYyNHZlWGIwb09HeTNwOU5ybkF3d2RwSWlnZ0lURE1tYWJV?=
 =?utf-8?B?NXlpU1JIZzRqL3dkWVpaa2ZWem4xb2xjV3R2Y1pIM2lDYmRINEVuTVQraEdV?=
 =?utf-8?B?aDRBazVyUWFmT2t1VlBRSmNFQUJsbWRXVVN0NzdaRmV2VVdJZWVmNzRKV2tl?=
 =?utf-8?B?c2pEbHlUbEVTUXR6TStDa3ZsZk9zemNFYm5MOTVKbXJhS1lpd1lLNFBxRzZX?=
 =?utf-8?B?M0dBbkhyWUlXaEpGYkpFWWJ0dGxPekdDSzVLRWNVT2ozb0ZWY1h3NVJlbGdC?=
 =?utf-8?B?LzhBc21XVXB1QkZncmRpOG00TEpCcE44NmV2VFlNRWxBajBGVHBHa09aNWZs?=
 =?utf-8?B?ZDdyZGdBcWM1aWZ5aEY3TVBCZXJLT3NIcFZpS0xQalJSdTNwZk85ejdaWG9U?=
 =?utf-8?B?b0dDeldMUFUrd1gyZTlFYWp3bGI3d0NHaXQvUDduSjBFUlpkc2VodXNGemVu?=
 =?utf-8?B?Znl1WnNBb1V0TWtFSjRpNnlzK2UxZzI2SDVNOU0vWEJnR0FoU2FsbExHNFNh?=
 =?utf-8?B?cDFpRWpMem1ETW5EcitPUkpnY1Y3dkRybG1wY1FzYWdXMDNsRjQ4a240WEVy?=
 =?utf-8?B?U1RUMjhRRzBOK0Z6dkgxSVArS1pjL3dnUlFrdm5DQk9OQVpVUTk4TlhFRVlH?=
 =?utf-8?B?N3ZlWWRZTDRyRkpwb1VHZzRYSWVRVGNEK3ZzOGFtRjRsVS9weU1tRlBCZWph?=
 =?utf-8?B?a3ViOUFOOEszMHZQUyszSUl2cHFHb0luZzJOaUVOT0hYRDA2eEZZRjRFcndM?=
 =?utf-8?B?dGhEMkJianc5TUZJS0l1eW15WHVlaVU4YnJZQTVxY2FYS0lnWnpwYzlXNHVV?=
 =?utf-8?B?a0JPWUkvcWZGc3pYaFBqRUo4NllXS3lDN0lPQlhjNm9OcWZlbktLOUxSR2Rx?=
 =?utf-8?B?WVZBM001T1YwaFlPMTFOV0hkeW5EbjVTMXMreVJTTFZJUlQ0YlovNmV1aXZn?=
 =?utf-8?B?V29RUkZmWi9IbXZLQW5nYmU4dzBjcUx3V2pzS3l3dGJqVWFNUnlsWEFucFF6?=
 =?utf-8?B?UTNSWGdEcjRVdEhlKzI5M2l6YXpuVHNWazFnUUNDbzNaQnk1UUlhNjRzVEgy?=
 =?utf-8?B?WUxQSVQ3YXBnK1dzcXdxYkY4QTZLWDM3RlFhbnV0UzVjNVRZa2FrUFZkVElX?=
 =?utf-8?B?VWZHTm16blRFbHdPM1ZGWklBNXVoS0JNR2UvM1ljUlkzdndsaTBUR2Q5ZFhl?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837194e0-8cb7-4234-f072-08dcce4ffe85
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:43:35.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ue2TCPEzKjyOFAsScBnLmg/jZO8abWlI1OnoNRqiwC3EJ7tWMUaZ1utBgMgDNsJieUUbE0xetuQS/oQqyuAyLCrUByY0dYxPVPNhdkhOjOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

Hi Krzysztof,


>> +static struct regmap *common_regmap_init(struct platform_device *pdev,
>> +					 struct regmap_config *conf,
>> +					 const char *name)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	resource_size_t size;
>> +	void __iomem *base;
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	base = devm_ioremap_resource(dev, res);
> 
> There is a wrapper for both calls above, so use it.

I am not sure I can change this because I also use the `resource_size`
call below in order to initialize the regmap_config. 
Unfortunately, `devm_platform_ioremap_resource_byname` doesn't also retrieve
the resource via a pointer.

I saw the `devm_platform_get_and_ioremap_resource` function but that one
retrieves the resource based on the index. I would like to keep identifying
the resource by its name instead of its index.

Would you agree to keep the existing implementation in this case?

> 
>> +	if (IS_ERR(base))
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	size = resource_size(res);
>> +	conf->val_bits = conf->reg_stride * 8;
>> +	conf->max_register = size - conf->reg_stride;
>> +	conf->name = name;
>> +	conf->use_raw_spinlock = true;
>> +
>> +	if (conf->cache_type != REGCACHE_NONE)
>> +		conf->num_reg_defaults_raw = size / conf->reg_stride;
>> +
>> +	return devm_regmap_init_mmio(dev, base, conf);

Best regards,
Andrei

