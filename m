Return-Path: <linux-gpio+bounces-6108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E540A8BBF23
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 05:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0744B1C20C39
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 03:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF1F3FD4;
	Sun,  5 May 2024 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="juXZNnmB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456D5227;
	Sun,  5 May 2024 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714880376; cv=fail; b=k9EW6PfURQNbg9vE77O2iu05RtI9jv21CUSfnv0spA7/oijjEVnF/TnhiUZ9gn9A0GnhBYDb9RXE1GIhj2mFQQY+Qo7QQVb2ofFrSne6OKISzCbA/wRt4Q44Eu3DajOCnIcfEtBhIF9PHLJt8VTnko3T4QDOl/SZUTaPmXN7fik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714880376; c=relaxed/simple;
	bh=WTZ7YwNm/8WPxZlzkPznE0QEoAFR6b1n1hH0qOGF9Rg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GD2ffmjPfad6R20aZGraqfiDpuWwYTBGygnQKwUjnknsXgEfXf74uRC+I9vXKNUbHfK3hB4dsOmJi2VROrXJKy6mpHTR94TNfpJENoqs/PcfK6vkK1wfXcgavtLy7E7f1vwmcE4EM5ENKtWk+91s0s5/wWnGrgmr8gF5g6WPKgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=juXZNnmB; arc=fail smtp.client-ip=40.107.6.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZOFVrBaTFkJH8NbkT9LCu8zCzUWqq7GgqibgxjoaneOh5FhT+k6iUKd1ZPqt40Suc20Yg54Q4dCajBD6WMOX9gXpFFRV8VosOnagLTpMUsSJkO8yGo/ymt37V5Ipkdmt7QEb17m8joe3bYb9OORpMXPa7w5gMdZnDAXLhLksriEosTzp49Rl91ySd5pJX/vSGx4IQXOUDjOLJzkG/CkPe32GjioBNz3Zt4ZoWOjlvS9qBjofFFTaloUxk+B2TrR20Gbe52csWyZ45LcHFAZhrXn3jxdIBS/mXvcZWfCOlRPRE9Cas9x6gLJ3Ek/HK4+sjNYbBLNX24H6sRs6F+pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12DFYM63ULaEgVDZPXt8ffcWw3R7pE947r7KT9S2Pyk=;
 b=bWLNhJb/MpZKcgRAYdfwptF+eOtwEyjdG2OPJoJGjSKhhwrrE1UHpxRjNQTRDK07ZKNu9mgUE7Iag8BhCC8eDafwQvtfPuqi6Kiuh6uB6j6ULQfC3WfZBvXivsKw1ERcuE49HuuTPZCDqPxnK8tzoBpZ/8MVjiaRLHThLYkPBjauH7TSnJfcccZf+HUxDFPm/n9ZC7g90eNWG5ThI8s5fVDvd12k3hsDLUkA7pv9Ll07g0CP1dn6UFDg3Pdhl07Fihp9CJHLRR2Wirn14W8tUYKitiqmAppVg5aGMk8GaC6wxBK/6QeHDIE2eOdQhhFcZfzKLYRBVOic3oVgFUBq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12DFYM63ULaEgVDZPXt8ffcWw3R7pE947r7KT9S2Pyk=;
 b=juXZNnmBgqrL5j4tmdrJ/4AEUkVJ7YAi7AzGy6DnxyIVhGXq6CMjO+1+Tt5EhnvJsAYZWu8uqkyWnaoUAXfhHeRuFTVKH41CcxaHmd/Masfb7NFLXbf1ecvB8pJ/jppa+BOkMJ9AflAneRbcCogHah6vhnnHNfD2YyXzp5RKj8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 03:39:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 03:39:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 05 May 2024 11:47:17 +0800
Subject: [PATCH v4 1/3] dt-bindings: firmware: arm,scmi: Add properties for
 i.MX95 Pinctrl OEM extensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240505-pinctrl-scmi-oem-v3-v4-1-7c99f989e9ba@nxp.com>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714880847; l=2762;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=07Om+tiXUr57qz8djpSP7JUajKxdHALgoEKb63kMR5U=;
 b=4tiUBb7aTdODcvb4F7pK/qnoPD+xZud/vdVr6roRFf/Mln1WG4nZiAZ+tX9vjNQgozw/1vurR
 OpyO+hteN7SAVOsa0aQNbh4LBJ28y7Lzfe5s6mqhnBAYygbPWgjKPqR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f5e19b-8ccf-49d8-6a36-08dc6cb4f677
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|52116005|376005|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFZ2Z2lXYTJXOVBQMm9NcGZybmlzK0lxRG5ZMG8vdTJLTkFLUXVkSklFK2xw?=
 =?utf-8?B?K1hyREpwNFcxWTdHc3B5OFZheFp6Z0x5MFd0VUJ5eFpkN0tSbFpXNURMWktt?=
 =?utf-8?B?cU8wZ0tBLytpZWM2aUZrYllvc3hQeWtiVmo4R2hkdGw2Und6WVJ4QWlWQVhB?=
 =?utf-8?B?d2RNMTBGWlZqRVVXOFQrT05jUXBmaUJkSUlpUU5XWHdGMWRTck9zV1VjcElm?=
 =?utf-8?B?NWsrbm1UV3FRV2tmdnNqSW9TbTBURmFPQS9tdEVObWNTaWE1ODBjOTlsb3Uy?=
 =?utf-8?B?UWpsMzVrV2IxemJ1Z3FIYjBDVmViYWEzYk9PdXJRdkptNnBWQjVqTnZBNE40?=
 =?utf-8?B?N1R1aVA1dHE4cXRCempMRUh0S2VKbFRocVd6STlITWoyNkRQTWN6bWRCOFI5?=
 =?utf-8?B?czhGRE82RTRTZTJPczJjYVgrL2pqelhuaG9WWGxISnR6MG5IL0U3K1k4MjJW?=
 =?utf-8?B?TDN3QzZFMytSYUtYSUFQMEN1V2JxeVh0ODlNdlEyQkR3R2hoYWVMaWo4Rk1O?=
 =?utf-8?B?bHM0Y3d3OTZ3R1FtTTNkS2plVnhqU2s0QVUxVEVOQ3oxdUp4SmYxMEY5OThR?=
 =?utf-8?B?UjBHSnNBeEhxSmdPNzlJbVpQbWNqYkVyNmN4bW5tRFZCcWt2M1h3c0RQN0pl?=
 =?utf-8?B?K0tZTmpOSEpKNEcxWE9ldjVOWGp4Rk5GYWJpZFYwS0Nzd1BZRWRuZjBwR2FJ?=
 =?utf-8?B?TGFvSUYzOG9sUjQ1M0pEaXEzSXJpUExUbUNpdGloeFdjaWlqT3prd0thSmxu?=
 =?utf-8?B?TGtKbE1KcUNTdXRSSnBxclFMN3dGYnpyaVB0NloxNEdscnAvbmhYSjl5OS9Z?=
 =?utf-8?B?NTNudk5Ja0c0L2NldFdOUnkrYVI5eGFDVW96N3FaTVRra2RwTHgxMzl3TW5l?=
 =?utf-8?B?WWQ3QS9vTVYzam85bDZ3ZS85dDllbEpHQmZoQWNUREY1WXhlQlA0a3VTbkhC?=
 =?utf-8?B?WHY1SWl6M3lMaUJNWENrOXdTcktQdnFmeE9kTEduYjlxdWt6QThrL0ZBdWk3?=
 =?utf-8?B?QVVFUCs0UjlmMm5jRHR0Y0dHQnQ5OUF0ekpIYzJKLzNLaHgxSmU2bVV1clBQ?=
 =?utf-8?B?MWo4MGs5b055VWZ5aUYxaGtVQjhyb2NHSnU4TGQva2x0VkJsVnU3Zk1ZWWZo?=
 =?utf-8?B?SU8yU2UvVjF1aW5vRjQ2QTZpeFV2dEpaUkc0SFlSRUsvZnBGWlZ3SXFSN25H?=
 =?utf-8?B?SDJRb3E4dHoyWFZrZGRkV3F1aGp6YVlhbGlLbFlHbVdmWUhzdTlNamQ4SGJq?=
 =?utf-8?B?MzRzRjFpOHBoNStaenZhZTBqVHR6bUlEQmRzRWhuZjVYcWNMTGtIbU9OUWVF?=
 =?utf-8?B?RzVua3NVa0VIOTlZcldkcE8xVElkRWNaTERZY2pMN1luOURwYTgyRjk3Y0M3?=
 =?utf-8?B?U3Vwa3F6b0NFMXJNUFZaSzB5OVNaWnNyY1hNM1dtTE55aFU5SGdxbmxlSlNj?=
 =?utf-8?B?bllqejZlbW9WTTVTSjRROUFWaWlEVGdqOWlPYlBTYXdTaS9qaVc2TXAxanFp?=
 =?utf-8?B?aW5VdHFkUlE2alNqRkwwRUoxc0sxQ2VzQjZocU51YlI0SG1pZFluUTIxdFhV?=
 =?utf-8?B?c0YwUGl6OE9JMFBrYVRLUlY0ZVYzYmhicjlUVWFad1BLQm5Rb1NmeHNOYXhq?=
 =?utf-8?B?UzFwaWxLVnA0bEdkdWovTTJhbVBlR1VlaloxNkZDL25ncjB5N2lROGR5c0hz?=
 =?utf-8?B?MVhST1orMTFuU3pIb0dWT3pQUlVFbVlZSEM5dnExVnEyQ0lvNUJzWVF3WVpQ?=
 =?utf-8?Q?aZ0hYat1pFdMkObNaE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(52116005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXUvM3FkQzBDYi9SY1JlNGtSUEtyeHpoOGlRK0lnT0V4SUFtMXpkTXdPczhC?=
 =?utf-8?B?WW10aUlNOUkzVzdmVTFwUDRjU1RSZUdhd3d2Z0h0dWtJUno3UG1TMEJZMEx3?=
 =?utf-8?B?aEZkMHp0S0RMUnNSZDNYd1B1ZVNrWjV3c2xLQ1I0Sks4MUtxNnIza1p6QmZz?=
 =?utf-8?B?VjRoOWJlUFJrYmovK1k4WlFocTM0WUFLYXEvUERwT3J5Um1HTVBWeEMzWi9P?=
 =?utf-8?B?b01zSHFzK1N6NExhZUVWT1N6eTIycVVNQUhWbTdpbStxa2EzZUVOdUt0bHZk?=
 =?utf-8?B?amtEM1B2TjN3WTFiYUh6M1QzNFZ4TWFDVmFwb2laYzlmWnY0ZEErYVRsd2Nz?=
 =?utf-8?B?b2xiTXNGUy9VRXJOVDF1cXJSNndvV1VYb0lPcGdHdEQvN1VmdXRmL3pIcXZt?=
 =?utf-8?B?YzVtSHpDcXQvelNJc3BRdGI1TlBORHYrWWtWSzlqKzdHWTQyYjlqbU43K3Bm?=
 =?utf-8?B?eDdnWStWYm1OT2lPWkVLTG1vMzlYYmRrN0thNTFXMHlTVGtSaHZqUGVPb3J5?=
 =?utf-8?B?alBEemZhWEZZVS90V1hzOHNjMDUvcEVhNWZ0WlpDYXlWNzNFckFLM1hKc1lU?=
 =?utf-8?B?aUZJcWI0QzZNbTVENTJ2UjdmRGhsM0gwZ1Jwb0wvdEFNT1lEMnlGR0tEd1ZU?=
 =?utf-8?B?OEFuZnpUa0VxOVlNaXdVampPYVJXNlhHYnMxank5czkrV2NTandzS1lQRHBn?=
 =?utf-8?B?VUxXakxFb0wvTlpiWnZmVlMreTlicnN5T1pJZFNXQXhqRFJGVVJXUXByVHBo?=
 =?utf-8?B?L0M4SFdDanZwRm41RnhjR1ZrVmlQYW1GbEFFeVozenFiSmd0L3dpN0JsM294?=
 =?utf-8?B?OVE0aG5oUVpwNHRxZmpjNTMySlR0YmtjY1dCaXZWU1pBeXdZK3k3cWtLT242?=
 =?utf-8?B?dEhJbENKbDF6N0U1czd5ZXB0aFlXaXBTb1RTZGhaOE5SN0xjOVFmOWlZR2pJ?=
 =?utf-8?B?aFNLUnZXN0Jta3JXcVZ1YXBMYk9GK2lpZFpXNTEzZUI5ZW9WcWIrUVVPS1l6?=
 =?utf-8?B?dkVFVXRia2EzWFM3WHBxaXkwQXJrV0pKWThSOFUyZkE2YktEMW15NEhVQnZ4?=
 =?utf-8?B?ckRDYnJCSWRUbkY2S0VKMTFMUU9FNkpILzY5TXBzYVBLRCttY3h1aWV6dHkv?=
 =?utf-8?B?bVNrcitRNkVxVG8rd1lXSE9DVmYvM3NVSXViVkd0TnVvMUwxUHVqNWJvREk2?=
 =?utf-8?B?VFgrQy82cHVCS0t5c0g2NTV4dW9zZmJITVBMUDdWK1BYVjZSVloycnlQNWxW?=
 =?utf-8?B?dkpib2JPUTNkYUt1d05CWmVsN04rYzF0WVFRdWJPRUFXN3Q1UzVWZmFrNjVQ?=
 =?utf-8?B?M0dOOEVCZ3NvUUttSk11cGtPOGVqREQwVWk0WEZjUmgvZzJ4WTFUTHRiUDBJ?=
 =?utf-8?B?YnQvL1NNYU1QUXluQ1hPUHJ5TkFlU0ZFS3JFVTF5dHIva29uT1JrZVQ0UXI1?=
 =?utf-8?B?N3hNYWp5dGdWQjludSt5NmMwRDRvemdxNlVyLzU4WHF0UU5YSVBOWFdZeUtl?=
 =?utf-8?B?YzhOL2s0anlvS0laVG44UklYSHZHQjAwdVhndG05ajQwU0VoQUoxNGdZODhk?=
 =?utf-8?B?KzhsQWxRZytEc3l3YXByZjkxM2Fmc05ZV0RCYStNendwbTZ3QWVmY1d4bWtM?=
 =?utf-8?B?NHVENCsvOUQxci84aU1sT09tZ3g5dnBGSmtNR21LK0hta0R0NXVBQndDZUFr?=
 =?utf-8?B?V20wZTlZWTNiSklBZE9yYkREbHdJMEhoVEl1b0dod2RUS3M2dWV2VGhwaTdz?=
 =?utf-8?B?cXY3T3hTTS9oMkZmNmxiVXl0UXY2SHZQcWhzUzhYMnZPRHhJYW41K3ZrQkVK?=
 =?utf-8?B?cjFKYzNhWGZPSkIzUE1LMzNZVzh4YVU0SkROcHhGV1hlWmMvTEdGK3I0UktU?=
 =?utf-8?B?L1dPVldhTzZodDJXSURrNXpobTFCZ1l5aGl5RzhvSGtOY1B2SzFhVWJVelY1?=
 =?utf-8?B?NGtGaXVBVEtteEJXRUlPRjFHaStzVzZtMHdkbW52bnczcFV4ZE5QTzZqcDlt?=
 =?utf-8?B?dHUrUGlGbDZWbitFVVZLNjl4eWZrQVpnRU1GMHNPUEtselJtSjhrTTF4c29L?=
 =?utf-8?B?bzlLUGhyczBudmVSTkNGSGhNUkNWMEdOV2QyTVpLUDFSdDIvTHN3ZjVTbXBy?=
 =?utf-8?Q?P3SjIIVf2xPCCLZrqULabN6hL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f5e19b-8ccf-49d8-6a36-08dc6cb4f677
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 03:39:27.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyECtTvrM4PaGpuQwj9fNhqRtw7+dR19Yp2foJEOLVRnL41WG9/lPZvZJp1JYTfAkAFBtdht6pNi4RxytCzZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

From: Peng Fan <peng.fan@nxp.com>

i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
firmware using OEM extensions. No functions, no groups are provided by
the firmware. To reuse generic properties, add the binding to enable
pinmux, slew-rate, bias-pull-up and etc, under a subnode of '-pins'.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  9 ++++--
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 37 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 7de2c29606e5..bd4dfd7a85cd 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -262,9 +262,12 @@ properties:
     patternProperties:
       '-pins$':
         type: object
-        allOf:
-          - $ref: /schemas/pinctrl/pincfg-node.yaml#
-          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+        anyOf:
+          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
+          - allOf:
+              - $ref: /schemas/pinctrl/pincfg-node.yaml#
+              - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
         unevaluatedProperties: false
 
         description:
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
new file mode 100644
index 000000000000..1a694881f193
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX System Control and Management Interface (SCMI) Pinctrl Protocol
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+patternProperties:
+  'grp[0-9a-f]$':
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      pinmux:
+        description: |
+          An integer array for representing pinmux configurations of
+          a device. Each integer has the format, pinid[31:21], mux[20:16],
+          daisy_value[15:12], daisy_valid[11:11], daisy_id[10:0].
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      drive-strength:
+        enum: [ 0, 1, 3, 7, 15, 31, 63 ]
+
+      slew-rate:
+        enum: [2, 3]
+
+      input-schmitt-enable: true
+      drive-open-drain: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+additionalProperties: true

-- 
2.37.1


