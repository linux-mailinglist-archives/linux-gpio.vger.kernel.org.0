Return-Path: <linux-gpio+bounces-6325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 819688C3DE1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35AF32817F0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 09:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19087149C5C;
	Mon, 13 May 2024 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C51z2VbW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2040.outbound.protection.outlook.com [40.107.14.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61A1494A6;
	Mon, 13 May 2024 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591589; cv=fail; b=kOFdhkVRym7lJi9rBNE5Nl5xph+bdZYUV9ecWIn6sJBFL8NNWg80k3FtXcCGiWuyPpZWN/wHlxrxW0pz8+/I/EM4c369jYUSmVtuSxYpzMvHGp1LXb1RyMZAD+fv+r9qrmg+inWbysZKPi3TbfMOlWwpP58KpQszLX5E2D1Rtk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591589; c=relaxed/simple;
	bh=Zh7YpwMv/nCIJz7Ve4uLw/xUE9R6TpwKE9s52I2y9Uo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=okPKPb7+l234BnSdxN6j7mDgroi9ukJVtlcekwrUKFjFPeQLobNVF6N032DpUbCV1SyK940Cr9GK3dhnMh59zPTvcO9GHMm5sZclu8+WbXdZbVu6S8DjN7/Rc129zSuSXCY4KDOtRMJopVsqKIa/UdQBI7Cm7wFqsG0FSd8lG28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C51z2VbW; arc=fail smtp.client-ip=40.107.14.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLUFl8QgQtKgVXtZk+XWjwi7OKSIo+BaCmG4yLPY03Br73aoOkxiSRQmCGQ5ptPnritlBjnZBx4h1rioQ6fwKhIemNDQqZ5TGQ7LurYna0s+hsTRVjM0Xv8ailQY+wyZbu+skqjawifxtL+5me8UKiAiEDokVAMZZ8gfuPApeyGvqxHaww4LGo1ccNWhITkqym6Cqi34TzL94gPoGr6ACtb2JHoixEPRe5VwzmXijK5X08XwY1j7Lj2nGY4OhStoPZ34QMm9JmIWyosYWcmw1JbeNsGHdC8we3Zxr/dNW0XMMYZOJiKJBWShMjI0eKwWrye/JvvL6kA2n+dJg7k0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU7izlKho4VwHmq9uf1XihUx42ovfQ1s1kVAXmpkjRc=;
 b=cloQx8gYzS1/M7jVtJ3EZ6N8XPf2tXRn9ZHxjYApP5y0leZdU9TEcl0BFqp0L+XG7FX6F/9OLvScI4mRUztuB1brR9cVvjBedSQqOCa0szLZtYpxsJr6qkTPjTDKkCxMaBhxHJ//CKeQbXg392IFuD9XqKTB9rTEpdHK/819f6ZTXZvcum1SQ0GWIxTkBxkGGushUmVptQbv0Lpc1O4ZvD+h7t2xaD30+v4FJiQH5TD2SeXr9RPwhhJDGieamA/dg2wWW2oIxdaVLLth0s1b+iixjL0/MAIR5vrr1fQMPaukY0ZZchQnYRV9uY3XouchwDlZYu+xz4gKoiIPuhopXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU7izlKho4VwHmq9uf1XihUx42ovfQ1s1kVAXmpkjRc=;
 b=C51z2VbWAAFlAaZHUrgxzRgTNd85S0bQ3K+rBqsmKZdZ4ar7wdGjtEAMjrdQ6+cBM1mwk5NWlD6xiRr2MOhmtiCCxiMxwKHqxhC11HFhLcr4KIOeoN7WaaZjPMNcomMNvBdeoqZezMagky3p25AUQxCCsMTs6+w3Q0nPsnEQ3bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8910.eurprd04.prod.outlook.com (2603:10a6:102:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:13:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:13:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 May 2024 17:20:47 +0800
Subject: [PATCH 2/2] pinctrl: imx: Add pinctrl driver support for i.MX91
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-imx91-pinctrl-v1-2-c99a23c6843a@nxp.com>
References: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
In-Reply-To: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715592058; l=10779;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gdaFJK07OmCQ2qJlNS1p4HLYwSgg8vqhFud9IOcFEdk=;
 b=D8v0T8MBJmB4riOd93Ja2/mA0r67zfJy5GuHCGXz3xd9rHoaZYQXWsFvLVRSnWVLCUUEqc+da
 TQqC/f/SLaECVehilMBsaMfho1W7Y2UhlyhqWXU3r9woCGJnEM+Lzon
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PAXPR04MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: a7be6c6e-f9c0-4259-f69d-08dc732ce540
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjE0QTN1NWlFcGg0SUhURFlvc2sxR3JYN3I1WDNUSjR4SGo4TkY0ZFNjOGJP?=
 =?utf-8?B?UGoxRVNsQTgzc0Z3VE9laWxJK3RsL1NUeC93T21oUkZMcE55Mkt1b3dJQWQr?=
 =?utf-8?B?c3lQc0ZFRzAybTNuRkp0eVNNcHR1bWJKL1p3NlcxZU1jRW0rMWY3dFlPRzlH?=
 =?utf-8?B?UTFxdWlUV2w4dEZMc3c4aFRrNWxHNFVYQkM2ejdkZXovOUZMUXlzK0RuL3po?=
 =?utf-8?B?eXZPUFA4VFZjMGZwaFdLakIrSHE2My84LzhGYzdVMENtS1RtR3Brc2xEeXNB?=
 =?utf-8?B?RzBVR0R3eE1tOFdSYW5EdHU2NC81b3o5Z0p4WExabHpZRWZDdWJBTWdSSmwr?=
 =?utf-8?B?Vm9wdVU2cStXZjNwNGVqTlcwS0FxbHVYQktTWnNlMm9mZXlXOU1FNkJkSFFR?=
 =?utf-8?B?Tm5DVk9hYXQ0TmY0ZU0zWkNjTnVjR3ZsSmVvTjREY0d6aDZFQXRoWEMrU21x?=
 =?utf-8?B?a1ppNXd4Y0U3eUZQOUgyT2NuUmFXR2VuRURrSHlaQmw1b0ZuWTZKbVI0bkJv?=
 =?utf-8?B?L1huK3hyeWd0MGxSM2NLV0JtZ096ZlA5YzdmQUxxeXNrQlAzMGhWTEV3OW92?=
 =?utf-8?B?ckhWVXhydGZ2M2VlZldMMkxTVDVlakY1c1RyRzR5QzFEWXVsS3B3VHorRzhk?=
 =?utf-8?B?d09QYnpKZGxtUzExK1FWTnlMcXBteU13NnhBU1BJazgyeUlBK1d2aU13bzJm?=
 =?utf-8?B?cFJEN2tQYVdiTUwzNytuYXFGT3Q1TmlJclhCMmhpclprUk9USFFLN25LUWVX?=
 =?utf-8?B?V1RNaVprRmRQa3k0ckI0UlRmT1RkaExNUWR3R1ZYSTB4K0l1SVpvQzJTSThx?=
 =?utf-8?B?WTlGNUpDby9hV2gra3pjMU9ZM3N3MlRvOFdVKytkYmM2alQvREM4dEpWb2Q5?=
 =?utf-8?B?S25TckVzY2pITTVteVQvb3JOSFAwaU9aWDNhNmtEWHBHQ3ZtMjVlcEpHTXFp?=
 =?utf-8?B?T0YyYkRYYU8zMnNCU210emk2M0w5VXFPaUo0ejJNSFF4NzF3K1JJZTZNYVhl?=
 =?utf-8?B?QS9ua3RBTWt5cGZJNXJnbTNxdklKQkI0c3pZTkY5NXZoZVFya29GOTIyZ2or?=
 =?utf-8?B?K0RpdVRvT1pIT04ra1lhK1U1R0svMW9hQmZFUEhpMm45dnVJd1MvRElSelp5?=
 =?utf-8?B?TUtmNmNSZWI5WUJkSmdxSExNSVQrbGZRaTdMLzZNRVVtbElvSStuWFkvQzFq?=
 =?utf-8?B?QVI3blc0cDhXZFRaOGVXR0dWNExlNmxmMDkyYzAydzNPbnhDYnA4MXJYMUNR?=
 =?utf-8?B?U2dlK1JhblZoOFBDR2FFRnA0NGZuQzUyRHlISWVsTVJ1cFpQbnQrVkpHQnF0?=
 =?utf-8?B?UWxpMkYwaXVnZ1ZUVXlWMTU4WDljTkNGdzhaRTVON1RVUjc3Z2lIMzhyZnNI?=
 =?utf-8?B?RXpJY3Y1MXVGOS8vdUhOYXNPSDNEQzZzVkEvaUhBcEVLTWlVYUVQYVZEekM5?=
 =?utf-8?B?bzJpSk52elR4YTZGSXdaaEpkT2I3YTdGOTdyTzFNTnpDR0RyWFZ5ZkJLdTQ1?=
 =?utf-8?B?Mi9vSUxlaGNLenhLOXYyQXBidHJTNEJPZFl2QXl1WENpSmZGaG5OcUZpYjNw?=
 =?utf-8?B?NWV5cFNVaEM2ckVWRWpaZktVd1JGYUhaNlVPMityak50SVV1QTFiRCtTcFh3?=
 =?utf-8?B?Y2xDVXBYdFlOVUdTMnZLUEVBM3EycW9NN1h3VmJ6Y0xtamRFMENraUZ6UzZv?=
 =?utf-8?B?T2xpUU0zTUtCZWVDNTV3RzEvTHpKMnRoWmQ1RzYwMXpPMGVFZmpxOUJodjZy?=
 =?utf-8?B?UVdDdEtrYTcrd0xXMU14U0cvUUpmN1VqMTQyeWdmTWlzdWYxOS9DZUFMTG5J?=
 =?utf-8?Q?ooPsOtuk557OyGLnwSns2/KvrmePaOJ8QgGmI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVFXUFdsZVd4Tmc3MmZySXFZcHJiQnBiZGN6T3NJYWI2MU5MYkN3M0hETDZo?=
 =?utf-8?B?Wkxtc3lsMXViTXJzdDJWM0NaUWQvUW0ydzBxdjNVSldRdEk3ckRkNTdBSHZi?=
 =?utf-8?B?SUhwYVIyRUlsekE5YjRQdnhJZTNnODNhcE9lSXZhNi8zd1BOZE1MT1ZDWXlD?=
 =?utf-8?B?TFJSTXpJUVhBN0dCYkZPSHpBV2liY1ZNSHhWMkl6VkpWb01xMHNjdTk4TXJ0?=
 =?utf-8?B?Zk5TUEdFdXZ1bU9mMmxnL1FUTCtScGwreU93MUhRL1Bzb2hGb3V5My9yZzVD?=
 =?utf-8?B?K000T04xZldxL1ZzdS8xcno0T1VTOGI1Wmc3MHRlemdlazluVi90b0k3elFW?=
 =?utf-8?B?NHJQcklVT1hDcEZJaG1kT2pMTEFVbWxaQVFXV3A1VE9lM0pQS0hHVUZOeGVs?=
 =?utf-8?B?NHRuNnhHbXk1eTZNbzB3bGYrSGZDMjBqTWk3RkkzcW05aUxUa09lNkhlME5E?=
 =?utf-8?B?Mi9nc29QZHA0QVNYclg1SjBFdVVNWnRZQzd2bSs4NHh2dnkzVkFyRjl1YXBt?=
 =?utf-8?B?cEpWbG9hc3BMRWdVMmxQRGVjbjRGMlFCalNMaC9Yb3VUeUk4UHFJOFlLMUtV?=
 =?utf-8?B?dm11c1J1NGhSV0lIQXRYZUQ2dkVXRG9TZS8wekJxbGFNcGprV1IyMUNyNWlJ?=
 =?utf-8?B?WGtjcU5qNlRZS2Mzc1JDWktnbzd2NUdZdGxZU2Ztc09BQVdXYzQxWTZHT3VQ?=
 =?utf-8?B?YWlaTG1GR09XK2piWmZTMCtRWjdOdU1JSGQ5dUFMaFZReFh4ZnV2aFh3NDg1?=
 =?utf-8?B?Vkx5OGU3eUpDNUljeWZvd094U21CRWg0RmFWNE1HR2NYeFR0Tjg4TGYxRUdx?=
 =?utf-8?B?Y1NMbjA3ZTVpcDNBRTZ3cUZTbHlCMXJ1UmduRENTdGxDbHArVlhGbTE2eEJX?=
 =?utf-8?B?YTN1cGF6dXprRE5IbHFjd2RsZFlZVWVwV2NQMERhV2g5clBZa1dleHRRbVNJ?=
 =?utf-8?B?bGtsMEVhdkt6S3FJbnlyNEUwTm5aOWxhY2RGVXMxWkZ5NWJXaGNpZ0xxbVJ4?=
 =?utf-8?B?dXZuVk9YNjFqMU9yaXRKOTJ5c2gxaVQyb3pzTkhEckhhTVdRNFhVb0h2KytT?=
 =?utf-8?B?UEpOdDMyeWsyOFN2SnlsblRyV0tnVUtsTDB6WllUTlAwRXpydW9BeE11a09w?=
 =?utf-8?B?dEt4TmFoaVp0VUxIbW96bHg4RHlQU0hUaUVFZUJMOVpZQ1E4VktkTUMwRFBh?=
 =?utf-8?B?K3FrcS9MSXRGUmRVbWJwZnpJSlNZYWRvTWNKbHRYRm4zUDVid0lKeTNBekdH?=
 =?utf-8?B?KzNnQmM1bUNhWEt4UTlOVnlYeVdLbi9OcnpFK3EvRWxTMW9wSGtiWEVlQnQr?=
 =?utf-8?B?Mm1JMURJNFNncS8rc2pMMFd2alYxWGU1QlBKNW5EZm1QZERwdFg1aDIyNUp5?=
 =?utf-8?B?MEJDMVZSTEM1RFdLZDM3ZU9xSjVLY0NWa2ltNXRwT2FZY00rdGd2SUxJYXRa?=
 =?utf-8?B?SVBrTlVNQ1NMQUxGSVUyRlhXZ0QrZnhIQ0wzM1ZrdkdJQmxObm9nU2ZwRDBp?=
 =?utf-8?B?Y0Z5QkNEVE55NjVqRCtvaWp0ekpQTlhsWmRyYTNPOXJHbjRRajlRd3Fwc1M4?=
 =?utf-8?B?bWlpOHpScTJJVU1LRDZnc3FKbWNwSkhvclR3YWdyOU9PeUtKNWI3NFpnejlt?=
 =?utf-8?B?T0RMeGJqa3k0MTJiVVRqOVVRMmJoblp6V3c5K0NsVEdsNGE5RFhNS2FYWmdU?=
 =?utf-8?B?NExRV3RaaSt2QUdzVlNiN29xMk1KY1J0ODZBV3c1SnFLMFRaQjIvRnRxYWNE?=
 =?utf-8?B?elBQRmZpakdtaXBtR1NEa3RqVEl2eTJ2SWRkaEZEZXZNVzhiMk5Wb1JFYTVM?=
 =?utf-8?B?LzE0bjgvUEtjandzYTdTMHIwVjNVTTFXbm9zOGhVa1pWOFA3QTRnMjdkTlJX?=
 =?utf-8?B?bTVuQW8zZzcxMG1TK0ovYTVHbk5aVytlZzBJQ0NjU0RhcTVrYW54anlOWE5J?=
 =?utf-8?B?OGRZclZpU0szZlNucHpjTU5XaDZ6Vy8wZkI2bGhuVkdXYytBQzlGcGhkTm5J?=
 =?utf-8?B?VC9IdWlaSkZvb3JrN1FOSFQ0Wml4djdYMitnVWFoRVFKQTVjdjV6dlJ5WlN5?=
 =?utf-8?B?Q1N6K3J4K0NqMCtNcmJ6eU9lMDZwT3pPTy9wV3BHYWIyVXhFTHVOR1l4dXM3?=
 =?utf-8?Q?lDHOviYfpED9pnwbiWaV8cneT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7be6c6e-f9c0-4259-f69d-08dc732ce540
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 09:13:04.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsBo9oQ2h3Eki/RFOGERb+SPzu1pduuuwAWCbMYD85ss4/5RwGfhw8HjfRyVrXOfs+6w/j0XQdeCABoesYC3ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8910

From: Peng Fan <peng.fan@nxp.com>

Add NXP i.MX91 pinctrl driver

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig         |   7 +
 drivers/pinctrl/freescale/Makefile        |   1 +
 drivers/pinctrl/freescale/pinctrl-imx91.c | 271 ++++++++++++++++++++++++++++++
 3 files changed, 279 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7..011dbc9b9680 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -184,6 +184,13 @@ config PINCTRL_IMXRT1050
 	help
 	  Say Y here to enable the imxrt1050 pinctrl driver
 
+config PINCTRL_IMX91
+	tristate "IMX91 pinctrl driver"
+	depends on ARCH_MXC
+	select PINCTRL_IMX
+	help
+	  Say Y here to enable the imx91 pinctrl driver
+
 config PINCTRL_IMX93
 	tristate "IMX93 pinctrl driver"
 	depends on ARCH_MXC
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index 647dff060477..70747bdf8fc2 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_PINCTRL_IMX8QM)	+= pinctrl-imx8qm.o
 obj-$(CONFIG_PINCTRL_IMX8QXP)	+= pinctrl-imx8qxp.o
 obj-$(CONFIG_PINCTRL_IMX8DXL)	+= pinctrl-imx8dxl.o
 obj-$(CONFIG_PINCTRL_IMX8ULP)	+= pinctrl-imx8ulp.o
+obj-$(CONFIG_PINCTRL_IMX91)	+= pinctrl-imx91.o
 obj-$(CONFIG_PINCTRL_IMX93)	+= pinctrl-imx93.o
 obj-$(CONFIG_PINCTRL_VF610)	+= pinctrl-vf610.o
 obj-$(CONFIG_PINCTRL_MXS)	+= pinctrl-mxs.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imx91.c b/drivers/pinctrl/freescale/pinctrl-imx91.c
new file mode 100644
index 000000000000..5421141c586a
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx91.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-imx.h"
+
+enum imx91_pads {
+	IMX91_PAD_DAP_TDI = 0,
+	IMX91_PAD_DAP_TMS_SWDIO = 1,
+	IMX91_PAD_DAP_TCLK_SWCLK = 2,
+	IMX91_PAD_DAP_TDO_TRACESWO = 3,
+	IMX91_PAD_GPIO_IO00 = 4,
+	IMX91_PAD_GPIO_IO01 = 5,
+	IMX91_PAD_GPIO_IO02 = 6,
+	IMX91_PAD_GPIO_IO03 = 7,
+	IMX91_PAD_GPIO_IO04 = 8,
+	IMX91_PAD_GPIO_IO05 = 9,
+	IMX91_PAD_GPIO_IO06 = 10,
+	IMX91_PAD_GPIO_IO07 = 11,
+	IMX91_PAD_GPIO_IO08 = 12,
+	IMX91_PAD_GPIO_IO09 = 13,
+	IMX91_PAD_GPIO_IO10 = 14,
+	IMX91_PAD_GPIO_IO11 = 15,
+	IMX91_PAD_GPIO_IO12 = 16,
+	IMX91_PAD_GPIO_IO13 = 17,
+	IMX91_PAD_GPIO_IO14 = 18,
+	IMX91_PAD_GPIO_IO15 = 19,
+	IMX91_PAD_GPIO_IO16 = 20,
+	IMX91_PAD_GPIO_IO17 = 21,
+	IMX91_PAD_GPIO_IO18 = 22,
+	IMX91_PAD_GPIO_IO19 = 23,
+	IMX91_PAD_GPIO_IO20 = 24,
+	IMX91_PAD_GPIO_IO21 = 25,
+	IMX91_PAD_GPIO_IO22 = 26,
+	IMX91_PAD_GPIO_IO23 = 27,
+	IMX91_PAD_GPIO_IO24 = 28,
+	IMX91_PAD_GPIO_IO25 = 29,
+	IMX91_PAD_GPIO_IO26 = 30,
+	IMX91_PAD_GPIO_IO27 = 31,
+	IMX91_PAD_GPIO_IO28 = 32,
+	IMX91_PAD_GPIO_IO29 = 33,
+	IMX91_PAD_CCM_CLKO1 = 34,
+	IMX91_PAD_CCM_CLKO2 = 35,
+	IMX91_PAD_CCM_CLKO3 = 36,
+	IMX91_PAD_CCM_CLKO4 = 37,
+	IMX91_PAD_ENET1_MDC = 38,
+	IMX91_PAD_ENET1_MDIO = 39,
+	IMX91_PAD_ENET1_TD3 = 40,
+	IMX91_PAD_ENET1_TD2 = 41,
+	IMX91_PAD_ENET1_TD1 = 42,
+	IMX91_PAD_ENET1_TD0 = 43,
+	IMX91_PAD_ENET1_TX_CTL = 44,
+	IMX91_PAD_ENET1_TXC = 45,
+	IMX91_PAD_ENET1_RX_CTL = 46,
+	IMX91_PAD_ENET1_RXC = 47,
+	IMX91_PAD_ENET1_RD0 = 48,
+	IMX91_PAD_ENET1_RD1 = 49,
+	IMX91_PAD_ENET1_RD2 = 50,
+	IMX91_PAD_ENET1_RD3 = 51,
+	IMX91_PAD_ENET2_MDC = 52,
+	IMX91_PAD_ENET2_MDIO = 53,
+	IMX91_PAD_ENET2_TD3 = 54,
+	IMX91_PAD_ENET2_TD2 = 55,
+	IMX91_PAD_ENET2_TD1 = 56,
+	IMX91_PAD_ENET2_TD0 = 57,
+	IMX91_PAD_ENET2_TX_CTL = 58,
+	IMX91_PAD_ENET2_TXC = 59,
+	IMX91_PAD_ENET2_RX_CTL = 60,
+	IMX91_PAD_ENET2_RXC = 61,
+	IMX91_PAD_ENET2_RD0 = 62,
+	IMX91_PAD_ENET2_RD1 = 63,
+	IMX91_PAD_ENET2_RD2 = 64,
+	IMX91_PAD_ENET2_RD3 = 65,
+	IMX91_PAD_SD1_CLK = 66,
+	IMX91_PAD_SD1_CMD = 67,
+	IMX91_PAD_SD1_DATA0 = 68,
+	IMX91_PAD_SD1_DATA1 = 69,
+	IMX91_PAD_SD1_DATA2 = 70,
+	IMX91_PAD_SD1_DATA3 = 71,
+	IMX91_PAD_SD1_DATA4 = 72,
+	IMX91_PAD_SD1_DATA5 = 73,
+	IMX91_PAD_SD1_DATA6 = 74,
+	IMX91_PAD_SD1_DATA7 = 75,
+	IMX91_PAD_SD1_STROBE = 76,
+	IMX91_PAD_SD2_VSELECT = 77,
+	IMX91_PAD_SD3_CLK = 78,
+	IMX91_PAD_SD3_CMD = 79,
+	IMX91_PAD_SD3_DATA0 = 80,
+	IMX91_PAD_SD3_DATA1 = 81,
+	IMX91_PAD_SD3_DATA2 = 82,
+	IMX91_PAD_SD3_DATA3 = 83,
+	IMX91_PAD_SD2_CD_B = 84,
+	IMX91_PAD_SD2_CLK = 85,
+	IMX91_PAD_SD2_CMD = 86,
+	IMX91_PAD_SD2_DATA0 = 87,
+	IMX91_PAD_SD2_DATA1 = 88,
+	IMX91_PAD_SD2_DATA2 = 89,
+	IMX91_PAD_SD2_DATA3 = 90,
+	IMX91_PAD_SD2_RESET_B = 91,
+	IMX91_PAD_I2C1_SCL = 92,
+	IMX91_PAD_I2C1_SDA = 93,
+	IMX91_PAD_I2C2_SCL = 94,
+	IMX91_PAD_I2C2_SDA = 95,
+	IMX91_PAD_UART1_RXD = 96,
+	IMX91_PAD_UART1_TXD = 97,
+	IMX91_PAD_UART2_RXD = 98,
+	IMX91_PAD_UART2_TXD = 99,
+	IMX91_PAD_PDM_CLK = 100,
+	IMX91_PAD_PDM_BIT_STREAM0 = 101,
+	IMX91_PAD_PDM_BIT_STREAM1 = 102,
+	IMX91_PAD_SAI1_TXFS = 103,
+	IMX91_PAD_SAI1_TXC = 104,
+	IMX91_PAD_SAI1_TXD0 = 105,
+	IMX91_PAD_SAI1_RXD0 = 106,
+	IMX91_PAD_WDOG_ANY = 107,
+};
+
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc imx91_pinctrl_pads[] = {
+	IMX_PINCTRL_PIN(IMX91_PAD_DAP_TDI),
+	IMX_PINCTRL_PIN(IMX91_PAD_DAP_TMS_SWDIO),
+	IMX_PINCTRL_PIN(IMX91_PAD_DAP_TCLK_SWCLK),
+	IMX_PINCTRL_PIN(IMX91_PAD_DAP_TDO_TRACESWO),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO00),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO01),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO02),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO03),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO04),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO05),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO06),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO07),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO08),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO09),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO10),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO11),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO12),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO13),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO14),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO15),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO16),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO17),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO18),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO19),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO20),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO21),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO22),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO23),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO24),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO25),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO26),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO27),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO28),
+	IMX_PINCTRL_PIN(IMX91_PAD_GPIO_IO29),
+	IMX_PINCTRL_PIN(IMX91_PAD_CCM_CLKO1),
+	IMX_PINCTRL_PIN(IMX91_PAD_CCM_CLKO2),
+	IMX_PINCTRL_PIN(IMX91_PAD_CCM_CLKO3),
+	IMX_PINCTRL_PIN(IMX91_PAD_CCM_CLKO4),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_MDC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_MDIO),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TD3),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TD2),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TD1),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TX_CTL),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_TXC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RX_CTL),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RXC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RD1),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RD2),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET1_RD3),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_MDC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_MDIO),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TD3),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TD2),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TD1),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TX_CTL),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_TXC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RX_CTL),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RXC),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RD1),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RD2),
+	IMX_PINCTRL_PIN(IMX91_PAD_ENET2_RD3),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_CLK),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_CMD),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA0),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA1),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA2),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA3),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA4),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA5),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA6),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_DATA7),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD1_STROBE),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_VSELECT),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_CLK),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_CMD),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_DATA0),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_DATA1),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_DATA2),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD3_DATA3),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_CD_B),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_CLK),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_CMD),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_DATA0),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_DATA1),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_DATA2),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_DATA3),
+	IMX_PINCTRL_PIN(IMX91_PAD_SD2_RESET_B),
+	IMX_PINCTRL_PIN(IMX91_PAD_I2C1_SCL),
+	IMX_PINCTRL_PIN(IMX91_PAD_I2C1_SDA),
+	IMX_PINCTRL_PIN(IMX91_PAD_I2C2_SCL),
+	IMX_PINCTRL_PIN(IMX91_PAD_I2C2_SDA),
+	IMX_PINCTRL_PIN(IMX91_PAD_UART1_RXD),
+	IMX_PINCTRL_PIN(IMX91_PAD_UART1_TXD),
+	IMX_PINCTRL_PIN(IMX91_PAD_UART2_RXD),
+	IMX_PINCTRL_PIN(IMX91_PAD_UART2_TXD),
+	IMX_PINCTRL_PIN(IMX91_PAD_PDM_CLK),
+	IMX_PINCTRL_PIN(IMX91_PAD_PDM_BIT_STREAM0),
+	IMX_PINCTRL_PIN(IMX91_PAD_PDM_BIT_STREAM1),
+	IMX_PINCTRL_PIN(IMX91_PAD_SAI1_TXFS),
+	IMX_PINCTRL_PIN(IMX91_PAD_SAI1_TXC),
+	IMX_PINCTRL_PIN(IMX91_PAD_SAI1_TXD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_SAI1_RXD0),
+	IMX_PINCTRL_PIN(IMX91_PAD_WDOG_ANY),
+};
+
+static const struct imx_pinctrl_soc_info imx91_pinctrl_info = {
+	.pins = imx91_pinctrl_pads,
+	.npins = ARRAY_SIZE(imx91_pinctrl_pads),
+	.flags = ZERO_OFFSET_VALID,
+};
+
+static int imx91_pinctrl_probe(struct platform_device *pdev)
+{
+	return imx_pinctrl_probe(pdev, &imx91_pinctrl_info);
+}
+
+static const struct of_device_id imx91_pinctrl_of_match[] = {
+	{ .compatible = "fsl,imx91-iomuxc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx91_pinctrl_of_match);
+
+static struct platform_driver imx91_pinctrl_driver = {
+	.driver = {
+		.name = "imx91-pinctrl",
+		.of_match_table = imx91_pinctrl_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = imx91_pinctrl_probe,
+};
+
+static int __init imx91_pinctrl_init(void)
+{
+	return platform_driver_register(&imx91_pinctrl_driver);
+}
+arch_initcall(imx91_pinctrl_init);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX91 pinctrl driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


