Return-Path: <linux-gpio+bounces-10273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC897CA76
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6B81C22640
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220A219CD17;
	Thu, 19 Sep 2024 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rXUvkjc2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FF19F49C;
	Thu, 19 Sep 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753750; cv=fail; b=cccZ7p89luLkLc3Bp6WJ9EMmdXnJePQRXaB/noXKs7BlQjD+5lllLg8pzsDjF28GfVyDlJHQkL/6DC/UyVjT74wUXu3Tsm9AKWEcQapRXAvP5hTFstu1zBV42Hr/dfTj5W32KHK1wVtijPHwzrXhPMHZN5iyoWyC45iZCleyvdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753750; c=relaxed/simple;
	bh=hQAolRTSKZ+/lytUBtWWg07LCKf0VBU5y75qgQzBsJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DnAZXgRPq2+lCakw0j9rq3F9xtiVqvBGdj8Mx7aRUjiDywASR9XUWWmZLZbsqldGky5uRwgNLbqjWV9X/nJel51xXkZfm1bpFcJyyIE8cvysJTCZhmkfin1ijRjEigIH63wlRbAoua1yXaekj1XIpVJNhdmlWlsjkxTGPXxkTao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rXUvkjc2; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwm/jql5QADeHVEBipTQzh1cVg1waQS9ZnvlczvAgJhP8XV05zl3/EX7JMz4fwmitfPMiYtW/aLbJWVTbAYfmuxq8FE5JdZ7bDGBfOE177uMkM35L4zGdZ4mVasDAC0Ollawn3iOtWegnrdelFIFEVF1DB5LaGue5boFqWcGVXxce3vSSoBe4a4hZ7eB37Q89E4/qaKpG50E5ewgyYUaevGPa2sRtuinR1LInSdG9qd8aj3QkPWugzaoWpfn2jwvCmbJuh8Bhddvm3gAQl0SUz0oMIyBMj3rcYScukvE8FPC/6PgMyE9Q5yz2p7Tr/Eo/vCMJq+5svh4bDDfR9FOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQi7i+4aEouje7mWUyll8Elatm3DJMHU6rtOOmUPpnU=;
 b=u4zT7az/mJk/Axp8/+NQrlCsDq4Zaoh/WMl8feS0uuJ5kudSch56LbV56jZyNaxhZE+CvyAt7NeqMNxsCz59dJDMhc/lREDRG6lMbkdsbMztGXWvstxW/YV4XgdEfKBWLmgir4MnstSw4mgx926PORBGknaYBhg3qpBJf6IiY0id7ziN/taQQyfzmgqqpHTchaA0J/wQgJOP7aLhptE7YRbgTn3VF51qQ2ElMoq2x1N8tG8kHU/rko9aAyCmsUBrusnwThA/oMemVeiYizlnJE9Z/MdFyrUikQfx0LeESXQlssa0vf9Z24O39LSbUy6vQBX5VeI63+jjGPIaLVhknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQi7i+4aEouje7mWUyll8Elatm3DJMHU6rtOOmUPpnU=;
 b=rXUvkjc2aL/jvx8Mlk769IjpwW0KGd+ay65JMpBkJG5HFrUF5/llMPt5eYxusivzpIq1XiNKdL4zhDnzQCE/C8HwiZ4YbQS/s1fb5bo64UJH4JaqKOLKdjDwgPC1gmy9o6Ra4Dx2p+/6Zoit7besN7RUeccUAaN1IEQ39EFXelGG0GuIY/nvgsu3HQkTH9TEoWjuN9enDNbN7X+KXzYmhnOT8erAU709/YhsZrncKrs4Daah7XHqCZPVtiuPsNNaS+YqKSGjB6L+iMTRiiHTMQgIcEmpmUccT1YwaGF63ko5hoqF3ETzNB/XCMAATvXUjP65ofaRALFwWGeQhSQO6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI2PR04MB10267.eurprd04.prod.outlook.com (2603:10a6:800:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 13:48:54 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:48:54 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v3 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
Date: Thu, 19 Sep 2024 16:47:23 +0300
Message-ID: <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI2PR04MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: d49c1b87-c674-419b-183e-08dcd8b1cd21
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0NXZTBrUFBYL2puSmlmTUY2SGVuTXczQWY2VHVzZDBIb3hpcDZsQWpJZzZr?=
 =?utf-8?B?VVpWdHZTSXBkTG1INXJqMjlheUMxaFU2RzFzc2dJdS9aczdYRkRwTmVHSzJR?=
 =?utf-8?B?dG9CS1h3Y2ZJMlcwR0RHL0J1RXNramZ3UkZibGRqTnpwQmVwZnV6NUZhbGFB?=
 =?utf-8?B?bUVWeEJBQmZVa1dac05WMndqYWNjbVZ6cEs3UmdEY0VPTjNvTmNNWkdXQmxC?=
 =?utf-8?B?Ynd4cnllSlFqNTlVVUxnSHNwQWxIZldFdThENHNQM01Ramg0NlRCeWJYQzZh?=
 =?utf-8?B?VGFCWWdxVlVwcGl6bXJHdmc2UHRZa3FuNjF3N29BSjh2L09Kc0pLdCtHb0ta?=
 =?utf-8?B?S1hKakwzOGRYSk5lUEZYTHp6Lzd1TjZ0VEpNNEhacjFPekIxTC9YdjJ0TW5p?=
 =?utf-8?B?bkh2aEM4a0NiMStnOWFPcFI5RUZOYzREdzdhWjIwbTVlYWMySkowdnFWSnV5?=
 =?utf-8?B?OHQ0eU9QNVlkMDJYblQ1ZHpmdnNMcUNocG9OS1Q3WGpVKzdmazh6dVowM29s?=
 =?utf-8?B?Z1h0MEFubDlBakxIbWt4SkFTS21TQktibXRVcE12UFcxRW5tNUFwZi94QUti?=
 =?utf-8?B?YnVyWmlxT1paMWJKaDQrdmZBaEhwR3dJc0prekdCYVZqQmpnRTVwL2pub2xo?=
 =?utf-8?B?MTVmYWtwbHhFQ3pEY0dvSlMwQjkzMXRwUWVMS0E2MW1yYXRvcVg1UFo3SUUx?=
 =?utf-8?B?c0FFYTRvOGo4THlibVprRzhWY0FyWi9MRUpuc05ZaHE0OVkxQzk0ckNPTGJ5?=
 =?utf-8?B?ZGFBbWJrZ2RvQmdQVU90c2xqRGMvV2QrV1NGZ2xUTjRpa0NJakVoSkxVL0x5?=
 =?utf-8?B?SjRDQlFwazRYMjBZMWIzWExsWFZ3cGNrd1RNQlpaWWREZ1dUT0xwTXkwYzRK?=
 =?utf-8?B?cndzYTJ0WFl2cUIydGkwNEdGM3E2TGdMcDBQdUt6TjFKMUlLbWlOWmYwdGlG?=
 =?utf-8?B?V21EN3ZOTjB6MjRmd0JRb1hwbXBrRDB0U0RLV1l0Vm4vSW5RL2xqWUxDR0Rs?=
 =?utf-8?B?cEoxaVd3ejJKS09Wc2tpRExieUZkUUYwb3JhZUxlZmpZL1loM2xEVlR4ZE1x?=
 =?utf-8?B?SVA4TlQ5RzNSUFc4ek5zTDQ1eHB2Y1NNM2RJcWJicFY4NXU2THRGWW5GZmQx?=
 =?utf-8?B?VVd6SHBqd095NjU0ZlQ5TUJ3U1BzMGxlNURMcWhCU3F3cks1L2RPOXd4VzFL?=
 =?utf-8?B?SUNWbkk3bDVCRS9qVTA5MXE4aVhBb05hRUJsOHdmN2NOQlR5aUpZd3c3TjZo?=
 =?utf-8?B?RlRqVklkUTI4bk4yc0JpbTdQWHhKZ2F4RDZBcnRJT0xoMTR3dHVNc21XZjJh?=
 =?utf-8?B?WWlOVnU0b205SFVaeFlCaXF2SjllRklqUTdvTFMrZzZnOHAybk84TTUySGMx?=
 =?utf-8?B?ZEhQY1cwbnpqeWdXR2pDMXBqakNYZCtGcE5QT3VkOVVpQXpnT3Z6K2V1cnds?=
 =?utf-8?B?d3lnWlY2YnY1b0JOQXQxcmt2aGRvckxVUzVxdmlINjVxT3JqZXgrcDNTVUw5?=
 =?utf-8?B?TjBxUUhpNFEyYlN6dzFQWXhoSXJyYkRXMTh4WWhQVjlELzBQYm9waFVVOEU5?=
 =?utf-8?B?SFgzdk9oTjhFaFMxUThzTUgxNUo5enRrRVJ4L2QzaDN0ZGhYSFRZU1MxclFQ?=
 =?utf-8?B?ditNTHJoSkc3VlZVMzZoWGQvTVhUSmwzbXE5N1o2UkIwUzdYMlNpQUdBL1pz?=
 =?utf-8?B?aUk3dExOY3hJYURKQnYwZmw3d3VnZm9HNmVCdUJCNGl1TnpUVnFzRE1SdkRJ?=
 =?utf-8?B?QnFtR0Vzajc0VkJYdUFHWDdwVEtzSzhrNEM1MmZRK2xUQmtsSHhqeXJIMG0v?=
 =?utf-8?B?SXUyTGczaDFaUmZKdXNBN2YrY1M5S0EyMnRheVEyNExOVXBtYjBrZTRURXNj?=
 =?utf-8?B?cFhUZ0tkdFdDOEs1TmNPZlBmUXFvMktDYjRtbkwrVVE0RFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cThuMjRkUzhsTHVWSUtLeTQ2RHhadUZCOUllL1VKVExENk1Zc0tFSzVXajRJ?=
 =?utf-8?B?aE00eml2U050Vmxhb0syQUVhZFhFaExqcjRPUUFIQzJNSWg3UFFzRmgzS0Zx?=
 =?utf-8?B?elhnZFJ2dTJMZ0ZJS0hqSFBEQldyNk1aSWhLS1hENjc4K3N0M0ZocUxBQk5l?=
 =?utf-8?B?dnFKWklFM3lNTFNCMGpuVjlqbjV3cTdtUDRoMnJQUXhFRlkzSC9MYXJ4K3h5?=
 =?utf-8?B?aEo3TzN6ZmQ2RTFwckx1SXUwaW9weG1tRTJHb3FrWXQvYk14ZFZSaFZjL0ZD?=
 =?utf-8?B?Sk03OS9ySzEwbklsaG9SWGRFYjVRcmR3K3haM0RWck5zMnNWVmtwU2ZhdUJS?=
 =?utf-8?B?RUZPazR6TkdSSVl1NnpKalJTQW81WUoxSnpzbnEwV3pZWGpCcUtKWm1mbTR3?=
 =?utf-8?B?VVRpYzdrS1RFeUlwSFBzU3pRb0xQcGV5TFZzOFRlcXRucXFWUmJHYnFtMS8y?=
 =?utf-8?B?TGtqN3BRQStzMFJHWmVibnlOL0FlbG5tUnFwWi9sN2l4M0wvSTYrZWM5YWRn?=
 =?utf-8?B?M2U5YWFwOU5id1NMY1ZsRGhBbzBweHNrdnd2aVVtTHNuNWk4R29lSjNQbHd4?=
 =?utf-8?B?eHNHK015RTRpaVYxbGx5V3dKR3pqb29IQ0RLR2JBVmxOUUVEQnNrT25qVVBX?=
 =?utf-8?B?aUlVbzVuUG1YR0hxT2hQN3Z1emd5bFJmVExBUFk4RFNMajliR0s0ZkQ0SGRL?=
 =?utf-8?B?Z0dvbFVlYXBWVkF0UnV2RmZJSlg4RDFOaHdpTmlWcVVBR0VaWEtjaHdKZ2FF?=
 =?utf-8?B?LzRKZWh4djgyT0hldzJaa0w2ekJ3NnBLa1dwZS8rdjg4YUp2TFVOUUxhdEhV?=
 =?utf-8?B?MjVzVG9uL2lLQnZnVG81cGRSS1VxNU9yRmloY2RnWEZXczhQZTRXSlJhaVla?=
 =?utf-8?B?b0V1Z1pERm81b0REc0YrWEtiM3pCcCtBakw3MnhwendsLytpNEtsNHFLYnlp?=
 =?utf-8?B?YjNtWG1NSVpVajFraCtvdzhKOXR4ay9rTmpxRWVoS2NBMUtvNTJPdnZWdEdk?=
 =?utf-8?B?SDlMWWhHMzRCK284ZmdQQldBdVM4RlhVRFY3Y2hhaWxBUVVsOWVuT3hZVDZT?=
 =?utf-8?B?S1ZJRnFmWm5LRVZJMFBwVnQyaWp5dGZqd1BDRThMNmRERFpzWi9lS25hUFFF?=
 =?utf-8?B?bDR6aENFczRvZElKMlJMc0cvQkZOTFYzeFl2OWpVelVaSDN0R3pZeHk3ZVMv?=
 =?utf-8?B?TlZpcFBPcTB1MXZ3SFlXY0J5RmkzczIrTkRsQ1FBRUd4VlpSTEV1K3lac0xO?=
 =?utf-8?B?Y0pVaVFLYWFUaWljeDFUWGcrcGpYbmhhcXN1OGpZU3k4UnRyandiVkpJaGVw?=
 =?utf-8?B?UE40d1BLUzB0N0ZZUDJJQzJuck5QWVJMWW1hY2dmNmc1T3BKbFU1ZzNiMVNM?=
 =?utf-8?B?TjJPV25YWnVTMHVhVTJSM0xMeUtrT1RsaWg2YkM5L05Ncy9zVDFtckRBeEZm?=
 =?utf-8?B?NHlBMVhWRUUwSnc5L2h1Sis4RkxFYmtZd2xiQ2VFaE9VeVdRbW5wVThtRmhN?=
 =?utf-8?B?QUdBN2hlUlhJdUFoR1N0a1AzdlNWRTEwQVlMQjdEMTJmZkRXNmR6Qk14d1Qz?=
 =?utf-8?B?Q0M3dVcxOG5GK05MRVYzTlJhRWhOczlhelV1aE1pMnprQlIxWGpmanZQSWlt?=
 =?utf-8?B?QWZNUlRCc3YyWnFLR1l2NElSQmJ1YzRDSGovc0cwK3Zkcm9XSDRBdkJ2SHE1?=
 =?utf-8?B?Q0VtZnQzM1dJVFNqbzFwUlZkZkNYTWYrTjVLdlBXaWhQdzlPZFl0WnY2ZXJi?=
 =?utf-8?B?NlFvdHN3MFMwWVU0M0JLbjYxNXN2bEVhMUZSdnZFWk1aRDhkS01SREtwQmZr?=
 =?utf-8?B?V2xPdDBrVDI0SmNncWRhTHEzZm85M2NhNDkraXVDeU0vbFRMcmpIMmNSVXJJ?=
 =?utf-8?B?Q3RkeUlLSDh4WDdrRGVQTndnTXJvL3VQQTd0cWRHOENtMEJVSFBTTEUxdUlO?=
 =?utf-8?B?SHpPc2ZKM2hPWlEyOUJySjU4S3RDODgrWThzWlJBWmVjRGdRUXA1VTA3aFo1?=
 =?utf-8?B?TGxOQlVCeElTa0NyL0t4Q2hjZmMrMGVocS9QM2FDcUtxOXBPaFZOMUlyblk5?=
 =?utf-8?B?YmV3bmx2cDNMSERLaTFRUnFRUitYME0zcGdRaUw4ajRnTTQyQ2VhMnBnVUxr?=
 =?utf-8?B?MUNydU5ITVVDd3U1UWRMK3I2MXAvRjFJb0hJRklzYXhhNFBwZTBnNUhEbGU0?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49c1b87-c674-419b-183e-08dcd8b1cd21
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:48:54.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxIzTghbWeyFM9cQPchyU66HWdhqCOuUOlBIYwXP1WoLs9MV9t5laZ9cp+DK+NtZvs469alT8pEy2RmB3j7Hgbzio/jcdnEsQ8ruIZiTPs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10267

Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
(System Integration Unit Lite2) hardware module. There are two
SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
SIUL2_1 for the rest.

The GPIOs are not fully contiguous, there are some gaps:
- GPIO102 up to GPIO111(inclusive) are invalid
- GPIO123 up to GPIO143(inclusive) are invalid

Some GPIOs are input only(i.e. GPI182) though this restriction
is not yet enforced in code.

This patch adds basic GPIO functionality(no interrupts, no
suspend/resume functions).

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/gpio/Kconfig            |  10 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-siul2-s32g2.c | 576 ++++++++++++++++++++++++++++++++
 3 files changed, 587 insertions(+)
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..75a6ca60ebc7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -643,6 +643,16 @@ config GPIO_SIOX
 	  Say yes here to support SIOX I/O devices. These are units connected
 	  via a SIOX bus and have a number of fixed-direction I/O lines.
 
+config GPIO_SIUL2_S32G2
+        tristate "GPIO driver for S32G2/S32G3"
+        depends on ARCH_S32 || COMPILE_TEST
+        depends on OF_GPIO
+        select REGMAP_MMIO
+        help
+          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
+          chips. Say yes here to enable the SIUL2 to be used as an GPIO
+          controller for S32G2/S32G3 platforms.
+
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..fb6e770a64b9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
new file mode 100644
index 000000000000..a69cbb3bcfaf
--- /dev/null
+++ b/drivers/gpio/gpio-siul2-s32g2.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2 GPIO support.
+ *
+ * Copyright (c) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018-2024 NXP
+  */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
+#define S32G2_SIUL2_NUM		2
+#define S32G2_PADS_DTS_TAG_LEN	(7)
+
+#define SIUL2_GPIO_16_PAD_SIZE	16
+
+/**
+ * struct siul2_device_data  - platform data attached to the compatible.
+ * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
+ * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
+ */
+struct siul2_device_data {
+	const struct regmap_access_table **pad_access;
+	const bool reset_cnt;
+};
+
+/**
+ * struct siul2_desc - describes a SIUL2 hw module.
+ * @pad_access: array of valid I/O pads.
+ * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
+ * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
+ * @gpio_base: the first GPIO pin.
+ * @gpio_num: the number of GPIO pins.
+ */
+struct siul2_desc {
+	const struct regmap_access_table *pad_access;
+	struct regmap *opadmap;
+	struct regmap *ipadmap;
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct siul2_gpio_dev - describes a group of GPIO pins.
+ * @platdata: the platform data.
+ * @siul2: SIUL2_0 and SIUL2_1 modules information.
+ * @pin_dir_bitmap: the bitmap with pin directions.
+ * @gc: the GPIO chip.
+ * @lock: mutual access to bitmaps.
+ */
+struct siul2_gpio_dev {
+	const struct siul2_device_data *platdata;
+	struct siul2_desc siul2[S32G2_SIUL2_NUM];
+	unsigned long *pin_dir_bitmap;
+	struct gpio_chip gc;
+	raw_spinlock_t lock;
+};
+
+static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
+	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
+	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
+	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
+	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
+	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
+	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
+};
+
+static const struct regmap_access_table s32g2_siul20_pad_access_table = {
+	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
+};
+
+static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
+	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
+	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
+	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
+};
+
+static const struct regmap_access_table s32g2_siul21_pad_access_table = {
+	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
+};
+
+static const struct regmap_access_table *s32g2_pad_access_table[] = {
+	&s32g2_siul20_pad_access_table,
+	&s32g2_siul21_pad_access_table
+};
+
+static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
+
+static const struct siul2_device_data s32g2_device_data = {
+	.pad_access	= s32g2_pad_access_table,
+	.reset_cnt	= true,
+};
+
+static int siul2_get_gpio_pinspec(struct platform_device *pdev,
+				  struct of_phandle_args *pinspec,
+				  unsigned int range_index)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						range_index, pinspec);
+}
+
+static struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
+					     unsigned int offset,
+					     bool input)
+{
+	struct siul2_desc *siul2;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
+		siul2 = &dev->siul2[i];
+		if (offset >= siul2->gpio_base &&
+		    offset - siul2->gpio_base < siul2->gpio_num)
+			return input ? siul2->ipadmap : siul2->opadmap;
+	}
+
+	return NULL;
+}
+
+static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
+				     unsigned int gpio, int dir)
+{
+	guard(raw_spinlock_irqsave)(&dev->lock);
+
+	if (dir == GPIO_LINE_DIRECTION_IN)
+		__clear_bit(gpio, dev->pin_dir_bitmap);
+	else
+		__set_bit(gpio, dev->pin_dir_bitmap);
+}
+
+static int siul2_get_direction(struct siul2_gpio_dev *dev,
+			       unsigned int gpio)
+{
+	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
+						     GPIO_LINE_DIRECTION_IN;
+}
+
+static struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
+{
+	return container_of(chip, struct siul2_gpio_dev, gc);
+}
+
+static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	ret = pinctrl_gpio_direction_input(chip, gpio);
+	if (ret)
+		return ret;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
+
+	return 0;
+}
+
+static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
+}
+
+static unsigned int siul2_pin2pad(unsigned int pin)
+{
+	return pin / SIUL2_GPIO_16_PAD_SIZE;
+}
+
+static u16 siul2_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
+}
+
+static void siul2_gpio_set_val(struct gpio_chip *chip, unsigned int offset,
+			       int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int pad, reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, false);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			      int val)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_val(chip, gpio, val);
+
+	ret = pinctrl_gpio_direction_output(chip, gpio);
+	if (ret)
+		return ret;
+
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_OUT);
+
+	return 0;
+}
+
+static void siul2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+
+	if (!gpio_dev)
+		return;
+
+	if (siul2_get_direction(gpio_dev, offset) == GPIO_LINE_DIRECTION_IN)
+		return;
+
+	siul2_gpio_set_val(chip, offset, value);
+}
+
+static int siul2_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int mask, pad, reg_offset, data = 0;
+	struct regmap *regmap;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, true);
+	if (!regmap)
+		return -EINVAL;
+
+	regmap_read(regmap, reg_offset, &data);
+
+	return !!(data & mask);
+}
+
+static const struct regmap_config siul2_regmap_conf = {
+	.val_bits = 32,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap *common_regmap_init(struct platform_device *pdev,
+					 struct regmap_config *conf,
+					 const char *name)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	resource_size_t size;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	size = resource_size(res);
+	conf->val_bits = conf->reg_stride * 8;
+	conf->max_register = size - conf->reg_stride;
+	conf->name = name;
+	conf->use_raw_spinlock = true;
+
+	if (conf->cache_type != REGCACHE_NONE)
+		conf->num_reg_defaults_raw = size / conf->reg_stride;
+
+	return devm_regmap_init_mmio(dev, base, conf);
+}
+
+static bool not_writable(__always_unused struct device *dev,
+			 __always_unused unsigned int reg)
+{
+	return false;
+}
+
+static struct regmap *init_padregmap(struct platform_device *pdev,
+				     struct siul2_gpio_dev *gpio_dev,
+				     int selector, bool input)
+{
+	const struct siul2_device_data *platdata = gpio_dev->platdata;
+	struct regmap_config regmap_conf = siul2_regmap_conf;
+	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
+	int err;
+
+	regmap_conf.reg_stride = 2;
+
+	if (selector != 0 && selector != 1)
+		return ERR_PTR(-EINVAL);
+
+	regmap_conf.rd_table = platdata->pad_access[selector];
+
+	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
+		       input ? 'i' : 'o', selector);
+	if (err < 0)
+		return ERR_PTR(-EINVAL);
+
+	if (input) {
+		regmap_conf.writeable_reg = not_writable;
+		regmap_conf.cache_type = REGCACHE_NONE;
+	} else {
+		regmap_conf.wr_table = platdata->pad_access[selector];
+	}
+
+	return common_regmap_init(pdev, &regmap_conf, dts_tag);
+}
+
+static int siul2_gpio_pads_init(struct platform_device *pdev,
+				struct siul2_gpio_dev *gpio_dev)
+{
+	struct device *dev = &pdev->dev;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
+							    false);
+		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
+			dev_err(dev,
+				"Failed to initialize opad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].opadmap);
+		}
+
+		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
+							    true);
+		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
+			dev_err(dev,
+				"Failed to initialize ipad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
+			   char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_remove_reserved_names(struct device *dev,
+					    struct siul2_gpio_dev *gpio_dev,
+					    char **names)
+{
+	struct device_node *np = dev->of_node;
+	int num_ranges, i, j, ret;
+	u32 base_gpio, num_gpio;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse the start GPIO: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
+			return ret;
+		}
+
+		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
+			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
+			return -EINVAL;
+		}
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_populate_names(struct device *dev,
+				     struct siul2_gpio_dev *gpio_dev)
+{
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
+		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
+				      names + gpio_dev->siul2[i].gpio_base,
+				      &ch_index, &num_index);
+		if (ret) {
+			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
+				i);
+			return ret;
+		}
+
+		if (gpio_dev->platdata->reset_cnt)
+			num_index = 0;
+
+		ch_index++;
+	}
+
+	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
+	if (ret)
+		return ret;
+
+	gpio_dev->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
+static int siul2_gpio_probe(struct platform_device *pdev)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args pinspec;
+	size_t i, bitmap_size;
+	struct gpio_chip *gc;
+	int ret = 0;
+
+	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
+	if (!gpio_dev)
+		return -ENOMEM;
+
+	gpio_dev->platdata = &s32g2_device_data;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++)
+		gpio_dev->siul2[i].pad_access =
+			gpio_dev->platdata->pad_access[i];
+
+	ret = siul2_gpio_pads_init(pdev, gpio_dev);
+	if (ret)
+		return ret;
+
+	gc = &gpio_dev->gc;
+
+	platform_set_drvdata(pdev, gpio_dev);
+
+	raw_spin_lock_init(&gpio_dev->lock);
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
+		if (ret) {
+			dev_err(dev,
+				"unable to get pinspec %zu from device tree\n",
+				i);
+			return -EINVAL;
+		}
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3) {
+			dev_err(dev, "Invalid pinspec count: %d\n",
+				pinspec.args_count);
+			return -EINVAL;
+		}
+
+		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
+		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	gc->base = -1;
+
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
+		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
+
+	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
+	if (ret)
+		return ret;
+
+	bitmap_size = BITS_TO_LONGS(gc->ngpio) *
+		      sizeof(*gpio_dev->pin_dir_bitmap);
+	gpio_dev->pin_dir_bitmap = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
+	if (!gpio_dev->pin_dir_bitmap)
+		return -ENOMEM;
+
+	gc->parent = dev;
+	gc->label = dev_name(dev);
+
+	gc->set = siul2_gpio_set;
+	gc->get = siul2_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	gc->direction_output = siul2_gpio_dir_out;
+	gc->direction_input = siul2_gpio_dir_in;
+	gc->get_direction = siul2_gpio_get_dir;
+	gc->owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct of_device_id siul2_gpio_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
+
+static struct platform_driver siul2_gpio_driver = {
+	.driver			= {
+		.name		= "s32g2-siul2-gpio",
+		.of_match_table = siul2_gpio_dt_ids,
+	},
+	.probe			= siul2_gpio_probe,
+};
+
+module_platform_driver(siul2_gpio_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP SIUL2 GPIO");
+MODULE_LICENSE("GPL");
-- 
2.45.2


