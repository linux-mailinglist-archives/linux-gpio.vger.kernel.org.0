Return-Path: <linux-gpio+bounces-16286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D89A3D99E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1EA17DF27
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9631F4E27;
	Thu, 20 Feb 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="mMp5eG7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84981F5829;
	Thu, 20 Feb 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053594; cv=fail; b=l6celBsSY+CvjVPRBHx/jcQe1G+1IzfcWJJ58UVoQrTDNUrFUa5WtOWevqzIT3wA6N4ve1S5SyD/x7t5iT2MgQTGgvzD4eou8fkoIqe9P0EQic4flvhz7k5U96VQECOgTNXI0GVT7tJcDdhc5VrDJVREuohVENitkJV0VJ9qFPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053594; c=relaxed/simple;
	bh=h9EGekCqomAqJInfaTUpy+5gIXmjgayu4FSSK4Mywso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MXMc0K7nC8py3/mC0mU0iV3DnIoxsLLWSYqbNzEodgttzr5oJTGs03+YQFYaqXI9UeTWZN5wRPWWn4ABXfAOVm9uVyrN0x205oJhUcgVuBxO3A8iNUkwZiIKd9zdPqCv2QSxfIk6YoiCLobiInviJJ1ZH0B9roDgDZ+n4qUpYys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=mMp5eG7K; arc=fail smtp.client-ip=40.107.22.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwVoU8QgY750DnZlyUgyb+tBwP+TuwTQqdd1DZkFtRjjB8pW8vGwWbdjo9cDLZkqBfH+33Gc9SikFy23KgxIfP1P2il8+5/ginxkFQ1guTUjgcokQeqYXjunu3m0AlY4k26wO2WuxK4t4bqrbt7Cp2CiKh5o58moG27mNGzUk0d5wXjugGddmZVlKRnejZqvXr98ul9yshAEwDIZZG1JjpjUPxjYbVtmXQ+OLLHBzbUitgrqwRhcVG1aCwk9n/vtMPhkahUckhc+oH4kYv60h3p528yVz7O5Kmb1UhdVhEue1k0YqNBFYqP5v7cSmeC9SbN+0gjfEwal2tSp6G/RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RywQ1CnjvUdO7YPaTt5sOtTQN8D1ikJVO1MgPfF9RPE=;
 b=OkdTX0J+nrLnSV7NcDA2Hk+1O9Iw8Yzc+G7lI0KszXw2ai+1cG/cWrOsJ7FbGfDXU3L/cJbHjUfSIsqqBsZez8bI02Gzs17jL82nZc1W64F+a7Wv451wsOM5VAv319XobWhxMs8sl2W5l92xOSCfJ/8MXmxqbmZUWvv8TFKgd64AuCSJMwKV7TotV9UaoKYi2fyjCF961kNaFDlq/WTLp5BoY4Tm3UFx5I4sGkdgPhNn1Q9uVL26GrbrVjp7GLSC+I++Eh0vnWUAvMHcO9dz1/YZ9XP5HroZbmfMA5eswnAC1JOvH+X/6Wm8l/DwJ9EFCp+nTtZSTMlsAaVOAiUQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RywQ1CnjvUdO7YPaTt5sOtTQN8D1ikJVO1MgPfF9RPE=;
 b=mMp5eG7KF5u+a+GJ//Efsr3qK/+A7eA9OE5fakbEZyBLqt9p9vW9MoqQaiBcLKSjZWQSIe2q5Eym9FMbneamg3N/Xw1fjuSRYzP5ec8+i1O1SxZx9mLx/mb3QLpgpCIH57cBXq8A/G3j0uXDEoMDM67TDei4VZYGB/HYJWUm3XU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9876.eurprd04.prod.outlook.com (2603:10a6:20b:678::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 12:13:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 12:13:08 +0000
Message-ID: <5bebdc73-b2e0-483b-8c8e-3737cda34811@cherry.de>
Date: Thu, 20 Feb 2025 13:13:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most)
 PCA967x
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
 <6110750.alqRGMn8q6@diego>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6110750.alqRGMn8q6@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d6ca2a-445b-4b31-09b5-08dd51a7efa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmdNYlBuR2w1T0hQaHR6djZ0NTdSSU1qMEY5TFQxSFgwT1dFVjlqOVVIaFk1?=
 =?utf-8?B?VGc1L1BCMWpuSjZCREEvTWZLamhyY3lWdndUUGovaE5CYUQ3ZHhrRk9vUFZQ?=
 =?utf-8?B?TXBNaVg1UG1LNmplL2h0eDZkRkJZcUwvcGdZWExhZnVsYlhVdTR3cENKOTYv?=
 =?utf-8?B?RDdwcU4zc29kaG5YTnJ2cjFkSWM2RnpvRVQrY01Sd2F6T1l3STN3M2F4cHgz?=
 =?utf-8?B?QS81RllqSTV1NUJoNnA3WEE3NzNvMjBLVDZXWXZweFVIN3NVZ0N3UUxzSlNJ?=
 =?utf-8?B?L1pBVGI5UElOZkFnRTRiTkJaWjdESlFxUDk2RXQxNXA2RmpzYkFyUnk1Zy8v?=
 =?utf-8?B?RExYM25jNGV1bE5McEJ1bkRzaERZRjUzaXI2ZENjVFZjVzdDd0wyYzRXcE1Z?=
 =?utf-8?B?cXVVNEhjSDNTbStyUnYrVlVzZlVTNEFDUmhJcDJTM05nOUVVV0U0REdndU0r?=
 =?utf-8?B?NWtud0NMZVpkUE1oVUdDaEdNRDBPaFA3YlJELzBOUXV3T2tLYkgwSVFqSXBH?=
 =?utf-8?B?a1hmN016c0Q3Y05DVXVFQ0g5bUg2dUVGQnk4V3U1LzhIeXJrVUY5VGE3cHB6?=
 =?utf-8?B?aWlZZ3FPZ3M2QktnWUJnSzBiYlVKSFRycS8zQlBRZjM4MFFKN1pHa1NLc2E4?=
 =?utf-8?B?aC9ONURkaWt4TWN2dzk2cWR3dS8vVFgwRGJFbzNTK2QrQjBVQ0NtbzBsUmQ0?=
 =?utf-8?B?L1VKdGZLcVpQNnJPaTZXR0tjb3NtRlRaQU50RFVjOHdWSnBtSkZpL0ZRZjQv?=
 =?utf-8?B?bzNvNU55VjBNM1J1TmllZWRoS3ZIaEFpT2EyNFdDZFlLQnZNdDlMcmgxNzZq?=
 =?utf-8?B?MlZkMUxBcGYxVDhRczNCNWc1aWZ5OXRVeHZmZWtnOXJlQ2tRMjRpS1hkUkRN?=
 =?utf-8?B?VkVJNlZJbW00SlkxY3VlK1BWaUVWR3ZoOVFvR2VnQ0laZFRWNkdIK2dubmxt?=
 =?utf-8?B?UzUrR1JQb29hSEQ2RTlTSzVPTXYwcGZHY0F3SGdXY0Rja0h2SUo3bGVmcDJM?=
 =?utf-8?B?ZHRFNEJaSDRPMnUyUjRpWVRrWGxuOXdESGpjcGVTRlVEYUFIcy9JOVlZZzFU?=
 =?utf-8?B?NFN3cnlvbkRQSXhqb2RqY3FNd2lHL3doTFJuMmtsUEdZZ25wMDJQQWJFMnQ5?=
 =?utf-8?B?QmhwelZzRHdlTWdHRElDKzRjczVWSHV4Qmh3c094QVRHL0ppVUo3TWlaVlZ6?=
 =?utf-8?B?WjRRaUFiNzAzTjZ1OXRzeEZwc05VL0ZOZ050WWtudFFRNVZ1ZDY0dnc1N05L?=
 =?utf-8?B?R3FZdkI2OEQ0UVl2ODdLV1lPcFV1OUtPQUpESXFYSklBeU9kaUhPQUVZZjJ1?=
 =?utf-8?B?M0l4K3Y2cWhxYk1oY0FEVmJhSUM2Tm03WEtmakRzVG9OWTRPMGtFb1lSUFFO?=
 =?utf-8?B?Mk9VL2dmME5FWklkZUErMjZ5bUpaWm9hSzA4OUpYVFJrV0sxc3o1VXdNUmtM?=
 =?utf-8?B?ejdCSDJYZHF0OGVvMjFtdzRDQ3B6Qlpnc29hMVdPRldwdG9pdXBwZHFHbUpL?=
 =?utf-8?B?N0kyUGtXTFIrbThOZlJuNDFOYlE2SU5ld0N6U0N0U2l1UmFzNzd2S2hleWpC?=
 =?utf-8?B?YW5heHdoMkNrdlhzeFh4MEk3eFN0cEtZd0JUY3dSQ1dZR012L29hWGg1NEVR?=
 =?utf-8?B?T0xGZ1p2VXdCQkNKU1orVzJjbnpYWnFtUzdLUXNRazhsOFZNd0ptQ203dGhM?=
 =?utf-8?B?dHJRNTVvWEEyVC9PWExQZ0cvdUFIOVJSMHdCVW4zVTF1ZFBWYzZaWFFidXBz?=
 =?utf-8?B?cnhmUjJjZmZvUmZ0VHNlYURJTmtlVmxHU0xXUlU2a0g2V1YydlFkU0hvQ21L?=
 =?utf-8?B?WHVsc05ncW94QllsUi9nZmlweXBJMDNPQVl4TmlKcm9NeWRzQ05BMUNRdVFt?=
 =?utf-8?Q?sZEjmXSKzKIdn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enNXZjNMK1BtNzRRQXcvdFlZODB1YTBaUDM0R1hsbHdPeEdVOUNkTEM0eCt1?=
 =?utf-8?B?UDFHdEwrdjg0MlpLZjMrT2c2TEhSRDR1V3hjMG5VK0NaV3pMcjVtNUNrY09F?=
 =?utf-8?B?aE0xTHFBZTVHVmY3cXRmUXZVRnY2aXBtZWRzd2FrMitvUXBYTVFRcVNxS0hW?=
 =?utf-8?B?NnRrNmI1LzM2UW9CV2hSWnVBa29lUndWRmplVnNaend0VHNrcG95UFBuZWNq?=
 =?utf-8?B?Z2hLSm9hZmx5MEp1L3VFc2pOV1JlUWs0WTAxalVoR0cvSkZqRGJpei8wZEF6?=
 =?utf-8?B?K3FQTHlRRXpNdDcwaytac2VWRXJUOUFEVXFsTDJNLy9admFQSWM2SDBkRjNk?=
 =?utf-8?B?cG5SYkd6LzlVVEl0Z0Q2YUdRSWwwRGM4K1NLWUhHU2dPR201eFlJWk01Y3BR?=
 =?utf-8?B?eUNGeWNCams5OWdCVkpIWkNZbHJRTTdHbGpRVUk3UURGM29TREFHd0IrV0Vy?=
 =?utf-8?B?bzhWWUR3QkUweER0K0tFQktIdTg0S2pleXNielY0aWFmb3VERUY1b2p5OFUz?=
 =?utf-8?B?YUhzNk5MUHBGKzZjcEJjSWlxZkRqVkRjd0dyK2tsT2J0WTZzTGJHU0R5SUMv?=
 =?utf-8?B?VkVnbjRCVnFkemdkclRxQ3lkRlZIWkg5bFFwc0ExeE5OS2VZdXNsS29uUjZO?=
 =?utf-8?B?ZWFQZStSQ0FTMzRYSk1vSDliYVpQMlI4ZURxYmpwUjVPTVpBc2hjRVBqR0ZL?=
 =?utf-8?B?cDJ5VFpROXRFeXN0cU50L05kLzB2Y01YcmZUTE5jWXpaYXA5ZzBSNUQyRjc2?=
 =?utf-8?B?NzVHaEdQTDREL0FpRytlendSNHFmMllyWXpGWGRydG1sQXBMbU5kckZwbzdB?=
 =?utf-8?B?T2ZvQ0N1WG5Iemh6R2Y4R3BwUGcwZFJ2QytZWGJka2NHd1lGZ09tM0UwcUty?=
 =?utf-8?B?Y3JxNG5sanp0bXlzNmp5dWY1YUFITHE5VVRYRjNtaUxsNzQ4Sjg0bjk5cWFl?=
 =?utf-8?B?Tk1mc2J5cG1YNUxKYXdYUTVDcnlLV0F2Wldkc1RsY2RtSGZqMEZJR3UzK0xC?=
 =?utf-8?B?WldtTEMxcEUyYWYyL1FtMTVKMDhJVGJCakNCR2hYekNtQ2FMaS9xUVhuZ3I4?=
 =?utf-8?B?bXhGMkJuUExoTnFKay9sY0ZOTjd2ZXNxcHFSVThDTW5xa2dXK2J1T21VL0M3?=
 =?utf-8?B?bGljOGY4VkdHMDJWUVpWUXpmK0IxR2JDd0pibGo3YTNFWm5OTEVRUnM4WkRB?=
 =?utf-8?B?TlV0RktLektPcmI4dVlhVGhJdWJ0SVJoYXRycWxyKzkvdEhSaURobXRhL1lK?=
 =?utf-8?B?aG5nWFJxQlFMSkx6V2VXcTRCK1JSQlZIYjQzNFgrTGM2a0NuNlZXb242dlpM?=
 =?utf-8?B?V2NTaFA0ZjB3dCtUWXFFT0huaGlrWmFYdVU5Qk1oSXZ2YXV0WlduOUdPU0ZT?=
 =?utf-8?B?Z3prMmpETFppV3I1cGdzM3BqZzdrblRzcVQ3VWlPMU14cEVNOTk4K2NtWW9q?=
 =?utf-8?B?TittbHhoMFg0eHJFeWgwU2k0Z0NIUG0yL2x1S1h4cGFkUTJQZHR1dGRvNmZD?=
 =?utf-8?B?VWZ3QlBsKzlta3NKYldGVWdmMkpoYVdSb1pYT1dsczN2VFdGMjNLSG05Mysr?=
 =?utf-8?B?WXc0UmhhQkcvT0dVTk9kclh5YU9BLzg5QThhUzkxQWNzWDhmUTRJSHZMSFlk?=
 =?utf-8?B?OUpsVk1NdVlUMHY5UHhOZmxkNkZBeEF6SC9DUTFhcUdWUzZhbWI0MlUxeDRD?=
 =?utf-8?B?OXZXMENwYWZWNDIybFhmcFRqT01GTUl6WFQ4NEl0eUc4NHgvMzlvQlkzcDRE?=
 =?utf-8?B?QTQxcTB6bng4d0V2Q1JPQXp1SThGMlcvVDY4R0VTUEVQaEhRR0FTRDBDZUsr?=
 =?utf-8?B?bEpjc1Y1NGx5QmVDSmxCU0NEVHFzeWlKTzh6VVlhSjcwdE1sS2VvdTdDbGJz?=
 =?utf-8?B?K05oNkVCWkFMZExuRFNiK05xaW8wR0l3eWVPaGZIZENtN3JUVWlpZDFwRFJz?=
 =?utf-8?B?eFRISm5ZU1ZORzEzY1dsRFlkYk10cG1pRnRNMmQydHh4Rlc1QWlGem50V3dh?=
 =?utf-8?B?WkZyWnVhT0pUeFgvQkM0NGtvc3EwSlhtVXMveWFXZU5pSE1Cd1d4aVhmMER1?=
 =?utf-8?B?dEhMTTdrYkEyazBTbUQzWXlsRzJuT3Y0OVJuamE0TnFUUFNiQUYxbmVjbWVw?=
 =?utf-8?B?bWxtNlFTcW5jQWtuS2drdlYzWkhZVnRUelp1bWFScUJwOXVLMHQ1eFBOV09s?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d6ca2a-445b-4b31-09b5-08dd51a7efa5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 12:13:08.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0UzADWO0iTmbE5IB/uaM2gXZWCZlllFeV2HpTW18R6Ken6nBtZ651X7BsXziXwWhJ50NbVfotkWL5iDebkj6aYHGDuO5bkL1Rjq20CDGjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9876

Hi Heiko,

On 2/20/25 11:52 AM, Heiko Stübner wrote:
> Am Donnerstag, 20. Februar 2025, 10:56:52 MEZ schrieb Quentin Schulz:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
>> that is used to reset the I2C GPIO expander.
>>
>> One needs to hold this pin low for at least 4us and the reset should be
>> finished after about 100us according to the datasheet[1]. Once the reset
>> is done, the "registers and I2C-bus state machine will be held in their
>> default state until the RESET input is once again HIGH.".
>>
>> Because the logic is reset, the latch values eventually provided in the
>> Device Tree via lines-initial-states property are inapplicable so they
>> are simply ignored if a reset GPIO is provided.
>>
>> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++++++++++++++---
>>   1 file changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
>> index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..94077208e24ae99a1e8762e783f0eabc580fa520 100644
>> --- a/drivers/gpio/gpio-pcf857x.c
>> +++ b/drivers/gpio/gpio-pcf857x.c
>> @@ -5,6 +5,7 @@
>>    * Copyright (C) 2007 David Brownell
>>    */
>>   
>> +#include <linux/delay.h>
>>   #include <linux/gpio/driver.h>
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
> 
> this is missing
> #include <linux/gpio/consumer.h>
> 
> because otherwise you end up with
> ../drivers/gpio/gpio-pcf857x.c: In function ‘pcf857x_probe’:
> ../drivers/gpio/gpio-pcf857x.c:300:21: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_regulator_get_optional’? [-Wimplicit-function-declaration]
>    300 |         rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~
>        |                     devm_regulator_get_optional
> ../drivers/gpio/gpio-pcf857x.c:300:68: error: ‘GPIOD_OUT_HIGH’ undeclared (first use in this function)
>    300 |         rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>        |                                                                    ^~~~~~~~~~~~~~
> ../drivers/gpio/gpio-pcf857x.c:300:68: note: each undeclared identifier is reported only once for each function it appears in
> ../drivers/gpio/gpio-pcf857x.c:309:17: error: implicit declaration of function ‘gpiod_set_value’ [-Wimplicit-function-declaration]
>    309 |                 gpiod_set_value(rstn_gpio, 0);
>        |                 ^~~~~~~~~~~~~~~
> 

It compiles just fine on my end, this is all very suspicious.

GPIO_PCF857X symbol depends on GPIOLIB which builds this function.

Now, I have no clue how it finds the declaration for me without this 
include. Any clue?

> 
> 
>> @@ -272,12 +273,11 @@ static const struct irq_chip pcf857x_irq_chip = {
>>   
>>   static int pcf857x_probe(struct i2c_client *client)
>>   {
>> +	struct gpio_desc *rstn_gpio;
>>   	struct pcf857x *gpio;
>> -	unsigned int n_latch = 0;
>> +	unsigned int n_latch;
>>   	int status;
>>   
>> -	device_property_read_u32(&client->dev, "lines-initial-states", &n_latch);
>> -
>>   	/* Allocate, initialize, and register this gpio_chip. */
>>   	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
>>   	if (!gpio)
>> @@ -297,6 +297,29 @@ static int pcf857x_probe(struct i2c_client *client)
>>   	gpio->chip.direction_output	= pcf857x_output;
>>   	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
>>   
>> +	rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(rstn_gpio)) {
>> +		return dev_err_probe(&client->dev, PTR_ERR(rstn_gpio),
>> +				     "failed to get reset GPIO\n");
>> +	}
>> +
>> +	if (rstn_gpio) {
>> +		/* Reset already held with devm_gpiod_get_optional with GPIOD_OUT_HIGH */
>> +		usleep_range(4, 8); /* tw(rst) > 4us */
>> +		gpiod_set_value(rstn_gpio, 0);
>> +		usleep_range(100, 200); /* trst > 100uS */
>> +
>> +		/*
>> +		 * Reset "will initialize to their default states of all I/Os to
>> +		 * inputs with weak current source to VDD", which is the same as
>> +		 * writing 1 for all I/Os which is 0 in n_latch.
>> +		 */
>> +		n_latch = 0;
>> +	} else {
>> +		device_property_read_u32(&client->dev, "lines-initial-states",
>> +					 &n_latch);
> 
> device_property_read_u32 will not fill n_latch if the property is missing.
> Before n_latch was always set to 0 at the declaration point above.
> I guess that should be kept, because we want 0, except if
> device_property_read_u32 provides a different value.
> 

Yes, this was an oversight from me, will restore n_latch = 0 at the top 
of the function. Thanks for catching that.

Cheers,
Quentin

