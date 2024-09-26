Return-Path: <linux-gpio+bounces-10459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13569875A7
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E952B1C254D9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C27D13BAFA;
	Thu, 26 Sep 2024 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JRC5ROS7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2082.outbound.protection.outlook.com [40.107.249.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0A7BB15;
	Thu, 26 Sep 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361118; cv=fail; b=ixvctvm26dAAHsh8CWug5HOG8+7Vj3u7Qd209prEM9l0BoA3XqZYf2tikio+AyH9djWTx7/Xia+cW6hhKy4ceZrezfCC27zJKKbetXrngXEGJKdn5I5qemibzG38uQZ5pa/vhNppA9HIUuPgKswCdncbGR29BpKhou34SqJoncM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361118; c=relaxed/simple;
	bh=WK4Owj4Y4Cm9P4MpXmjHW4vYZ5KrqTdjByDfuUp5bwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=So+cnFELSk/q7cTs/pVHiWcqTlgdN1XSgfrhpeWzHOlp3J+5gSNiXuJlfTtmqGsUVBgyA61BUSVNdFrwqu3RH+EOZSgCEutSrWl/9HqJy359Z3INNIV+q/4ZhfSb2vR7lw1dkd8AMp5HcAlCjf9DGIEKN+zvugrrvG8ZUN6NspE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JRC5ROS7; arc=fail smtp.client-ip=40.107.249.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE7p91owIunjYham61i3wuc8vLQkJ06ENzIwjCdD33i3X5/rI1g6Wd7RbecOFy80KxxDj1ehELI+8qM4TcdG0EwB4rDWXcXpCYPtaylzBLQMqt7XQoLxFLurRJuCMeoMo6z30U9ahhCWSpwLMCN5qnUu9IE2C4sNtsQznGjUpaXwypjxor67aQsN0Zn9Mb4wPvdcMUdZxtjSPqnAFP3a7awIB/FXid3uilteGUa2fE0U/SwWejQ55Q9ZwcyT4BQ6WtobBDLjZDG5enMNjQRw2irhXHWl/pclFsBHOBT78JojvCf5NDVAWj91e9TFi4Hr6BI26q4EiOta1EQlesXB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEHYVemPzQDfpMdhfbuzyQ4zV5E9zOILEQA8q0JwEiU=;
 b=b/KSQwKbycKb8HI8OSkpvNTv6PgipAqoVxUPG+i8Al7AriwjDWdpOI37ZEoZfZ4iokIdK1wKSfey2tYaig/639fyMHYkqzMcAHg98T/Jna9cpdQEaMN8JgqPbzzGIglQvI+0ZIN/9uq81yr7PEI/2CbSF14E7t2/lonjZHcPIyuMgDrZIwfbv1CnR5YlBr5YBk+4wRAQBhde2ua0vq9f+V1qXkPPPtIj+FFqpePQK5PR6e3ykdGreuJ5HnwfsyZDxp+uTLUraIvLYkvXvjTW8OXQOTbQw7Kj1eu+x/bS7f2Mj+NYCMOxOu1wEAqGcI9bs1GYQsmYsxSNqljoj1nrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEHYVemPzQDfpMdhfbuzyQ4zV5E9zOILEQA8q0JwEiU=;
 b=JRC5ROS7l8dw/uBRp8lwMgaoZZ13ZLmkTikgpHQXwEod/eKLJNw0clX9m5V8ZPrc72/GrGt2qzJFQe0yoQ0EoJLmmlQR3XpEB2QLrd9uCQSK7V1Hu0zT+I+KyEnQ1fAhFQwO/LUEUR55u1FVPiRFa1T/yEHpgcnYQ41kS38EchyWjcK00XrP4elCDDl2BkdZCJ/+iICFNoZbMwW6rNOxG8i0Q4p9WvjSQOh0oL7xbw63eZzj8Cg6rVxsYZND4MRlR463cRwes5sIBP/L8BeWFtXxxXDpln/D/A2QLPd1ef7d0UQxXvyKf9ovYfY3wkpjnNDhurs0NRSTLdY+9dJgTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10485.eurprd04.prod.outlook.com (2603:10a6:150:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:31:49 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 14:31:49 +0000
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
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 1/4] drivers: provide devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 26 Sep 2024 17:31:18 +0300
Message-ID: <20240926143122.1385658-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0101.eurprd02.prod.outlook.com
 (2603:10a6:208:154::42) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10485:EE_
X-MS-Office365-Filtering-Correlation-Id: b47601cf-143f-4d45-3fa9-08dcde37f4e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wng2WmZlWDBIQXY0Rllva2taeitJb1Fhc2tFUlhTOFJ5TkdoVTVFT01pUUcw?=
 =?utf-8?B?Qk5ZcUF3clZ3ZnAvY1VjUlpEWk5KaklMREVlelRLaU1lZjdDVG9uUU9oa283?=
 =?utf-8?B?cE5NR3BXYmtvalhGRlRkaXFGNmw2ejE2THZ2TkhINFBqck5ZVE1WYjZtSTNW?=
 =?utf-8?B?ajR4djR4MzBqM2VRNjZhNzE0VXZIREM0STFNS2ZkT1RSa3FjTkhHWW5ZUzBY?=
 =?utf-8?B?TmZObjloMWlydzZvOXhqZVNKTEp1SEtXRGRwRUhEMWZ0clhycmpTYXNOd3dV?=
 =?utf-8?B?aEJzOUdsekVBdUljQ25WUnEvanI0RlVwU1NlZ09ZbytnUzlFcy9tMXRYemZJ?=
 =?utf-8?B?Q1JlazVWRCs2TStaNitXcHhPamFjTy8zNlZaOUlDRHR5VkN5UWR4cS8xOTFH?=
 =?utf-8?B?cW5OU3JwazBHYWtVOXZtS2RFUFh5NFdjYnlRclloUWtWbTJCcHJSSVJRU0Rq?=
 =?utf-8?B?VzRNNkJYUzhEK2F2OFR6Q2JXaUxZKzNuREtlY2pHenI2VVdrRVQwU1JQOVdr?=
 =?utf-8?B?UStBMEkzR2NvNmQzcTYrVnZUSEJGWEtFNFpwMU1kQmNzTGI5UUUrR0JKWWtZ?=
 =?utf-8?B?VkFUQWJqZWpRMTh1aCtWcWxzMmJ1ZnJQbGpGU2ljWC8yR0pJek5HckJKTEdo?=
 =?utf-8?B?dHZsb3oyZEExTVpKM29tR3MvaTVtd0l2RTl2VFRvMFRaNkdxeHFQakJTT1BG?=
 =?utf-8?B?clhvbHNxZ0VFa2l5S29WTG9WcEMySWwxMW95VVZDTDQzRkZldU1iK0xsNkxj?=
 =?utf-8?B?ZExrcktEYTIrOUdWWUxzaVg0OXJ0djVacXVNSENzdFZGMFQ5c0dwS25YSTVm?=
 =?utf-8?B?VnBrU0Qzekg4ckZpRU15OUxtMWhvYzRoNGpLNVpwaVgrcDdzeHZmNnpPR0hB?=
 =?utf-8?B?NVBZcVMvL0lld1VsT0wyR0dxRzdKRG1IaWthNG16V3FDMGM0dk9Idlowakpp?=
 =?utf-8?B?SVY1dDhqQ3FuaXpDWTZWV0tWTVhJUlo0VFh6MUVWV3ZlTmFORjNoVjJvbVNO?=
 =?utf-8?B?aTVYMkNRMTl0NkxwMmFIWk9OcmtHQ0dJbDNyU3dYMEFVemZFdnpwR1JrSjlI?=
 =?utf-8?B?TXM5bmNWai9ZamxuQ3FiOHBvQ2pXdDhQeG96M3FCNWdTWHpzUHVHZ3JIUjJk?=
 =?utf-8?B?elRkU21LaERlaEdKUmxaSHRtY3dNWTFXN1JtaTFEcEVscnhQTHd5OWNzMm1Y?=
 =?utf-8?B?UkVyb1ZsbHB6NWVPUitTVDlDbk0vNzJCSEJRMkNiZitJRjFqSmxIdDMyVThu?=
 =?utf-8?B?SXdRUlg3c1g0UlNXVUhHMG9JSDRhOWRUTjNLYlM5OE9wdHM3bG91c042dVpP?=
 =?utf-8?B?MUJXWEFyVW5JQ1pxUnVFUFZVUkdydm84RDNNN1lsR1JUcmM4b2Z1RmFPdjEw?=
 =?utf-8?B?ZXdsVGtlSWpENTVZT2lWb2Y1V3QyV0ZUaW0rZmRNcGFmUkZXRzlmMTRaNnRE?=
 =?utf-8?B?WUcyMG1lN0F3amxpakkrbHBqMk1kSFdQaTR0Mm9Ia3ZxZWpyazd1NDU1YVdY?=
 =?utf-8?B?OXJCZ0ZKcHhPTUpGT21YMnVIUVoyMUpUcEd2TmtuOXIxVUxET04xM2didVRC?=
 =?utf-8?B?R0U0OFV2R1FDbVVYZERabmhLSEw3NWNXekdXVlNGclNxZDdUSTc3NCtJMHlP?=
 =?utf-8?B?c1dqVzltNVB3ZG5MNVdiOHlDdmF5ZWhEZnQ2NlQ3WXBPZXlicGpsZEJwckNt?=
 =?utf-8?B?NkFkRWphQnRTdm9xanBoWFg4eThMcUk0bzJJVWZpK1IxeGVwMkJSL21ZZ3RN?=
 =?utf-8?B?c2l2QVd1ZytkcWtQQVh6L1g4c2pEQWNXLzUyVFpQMHRiU1VlaldQSlJyaGZO?=
 =?utf-8?B?dHgzeVhzL0dXRlUzNVQrdkViekIvWGtNYnd4RHI2aHZkMjFUUnJMYWNoUVdn?=
 =?utf-8?B?K0lTTXdCRUFWUWM2TCtHVGtvZUxnbDZZVmRzbUVhcnFTMlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWgyMzBRaGJTalk5c2V5YzhrTTdkZWluSUVHSXhTL2RDc3RXc1hEUmhGU3p5?=
 =?utf-8?B?Q2tZbFVXZjRGaXNSbnFSeFozZDFZVVhiNHZwT200R0N1dTBDMjVya0xkWDRZ?=
 =?utf-8?B?NjFrRHV6SlVyYU9uOUNsWnZQcU5nT2N3ZzhmeDB3S0g4cXgwSXRRdjhCYVhs?=
 =?utf-8?B?Uis0UERuUTNWTDBXbmhPS2FqSXFSdU5CV2RXTGR6REtHcGZVZVVVTGR6MlpS?=
 =?utf-8?B?SjNmbFViZVFRL3lvY3BWNndTWXppN3JSRnhpSzlEd1pVVlZ4MHVsR0pkRHBm?=
 =?utf-8?B?VUsza0dBQVBXdXB1d2YvdUZtWDlCTi9nTTRHNFBlU1JLNGM4NzAvb0Z5VFl5?=
 =?utf-8?B?c0JTUGlNUldmWHkvdEt4U053Z2prUDliN3lzUW10anlxMWIrYXZYcThmczhT?=
 =?utf-8?B?eUJiZDF2aXduN2NnY1hJVkVGOENYdk5SaGZKV0FNWWNPck5iTmQvU2RrMXNo?=
 =?utf-8?B?TGZDREhSM1NuMmFhVHhJc2FsNm0rRnVXR2lvd3B5bmNhTDlNTkhlbmlENk9x?=
 =?utf-8?B?UzBhQnhWNWRwMWw2azc3MXMvczFCSmR1cWttd0VnbmNCSjhIVWQ5Mmg1S2V4?=
 =?utf-8?B?TWx3dTNHVzBSOHMvcjJyWG5Xc0NuMkRoU3VOOUUwYXRKekdkc21vdnM0dU9v?=
 =?utf-8?B?aTRVWVR1dndHRXhCMlFNVTkyOGtXbkVkVlZTWDJZbjgyWFpJTGw3ZjMwaU1l?=
 =?utf-8?B?MGlvSisyREpKUENCSktpUmN5clVJZGxmSURYaktEMEVKK2pDUDhvOURrQXJk?=
 =?utf-8?B?bnZGQjFXMHh4TzdXa05zaDVWMmhObU5oZHFCMUpKZjZrUUJkOGpyOXNGSUVq?=
 =?utf-8?B?c1lOSmwxU3FNbG00VEw1VVRSaHdGKzFPQzg1QkpuLzRPVGZ6TWVBYTJqSmhP?=
 =?utf-8?B?YkJ4NVBxNjQzeEdSYVBqd09sc2VVUi83TitrYXJ4R1RaMTRnZ1NjOFg3ano2?=
 =?utf-8?B?U0M0a1NVeXhqWEdLdmFKQzhSdWJoYzNpWUg5a0pLZkE5eDRMT2RucFFid2I4?=
 =?utf-8?B?aUJuVXBFcE5iNzYzVmNPVC96UkF3Y1M4dURsVDZNayswcFRmQmR2T2FDU2Iz?=
 =?utf-8?B?cGFoSmR5TklHMEEyclFpNy8wdEEwVXUxZ1Q3WEU3OFJqMFUzRjBCOVRUcUNn?=
 =?utf-8?B?SWEreitmVlZTdTFSWGhnbzVZaklocnkrQVo3T1I3VGRkVXZ3Si9OTUhCSjNW?=
 =?utf-8?B?YWMyTi9DWUI0L09weThrV1RKVkRIMDhCZ0wyb2NPSTd1RHMyaFRNUjREWlN2?=
 =?utf-8?B?cEZTQnlYNU5DVG9ZQXNZaGVVcEVPakhGTDFOV0FDbXZjQUh6bU5UU1hxTWFi?=
 =?utf-8?B?NURGZUFQeGNxZnlvd1hhNkpQcE1OaU9rTHl5QnV2UFc5VG1iZ2dBTmdMeWxT?=
 =?utf-8?B?YWIvWDBJbXJvL2hJc2RGMXFMZW5ESmxPTStRM1lVQWxDV1pCdjdCSUN2L1ND?=
 =?utf-8?B?SjNFdmtySnlGREJicWhDNW1TelU2UHFnSWttQzNVWTl1Z1d2Z2p2dE9jbVRQ?=
 =?utf-8?B?K0MzZHJPYzl6NjJoT0dEV2RKTERyVmY5c0kxVlpoMGlmaEJqWTJISGltR3h2?=
 =?utf-8?B?ejh4bGlIVVdxTEFHYkwxZklSeUpTWUdoYXRwd01jeGpjKzBlVzZLbXdCMnNk?=
 =?utf-8?B?V0FsWndOWGMwVzBaYWxKWFJJRWpNRS9Ja0w0emhadWJqdEF2S0k2bUp1Unla?=
 =?utf-8?B?dmsvUEQvTVpiNXptaWVtN3ZFR0s3SEIzaDlYOUppMEs2KzFCVXRrQTRkYzZR?=
 =?utf-8?B?UWthdzAvMmQ0cDlKSEN1QzZ3Sjd4ZEdscWsvbjErZWhVS0E2by96SDJHeGV1?=
 =?utf-8?B?MWxxeFJJOXJnUTg4d25rc3RBNitzSXorVXFSc0dSK3Y4TzhMTUgvbXBKNW43?=
 =?utf-8?B?YTE2SmtlbVd5SE1HdHh4ZUIxamFyRnAvTTRsSHhtMFNLQWVzeG44Ymc0d2ZD?=
 =?utf-8?B?V0JwNEFUWS85azIxRWZuVVJZOVhwa0xFT2pNOTVaN1hlZ1Npbk56cUtRc1Bx?=
 =?utf-8?B?OUZXZE42YldkdXJjSGVPc0lCNnNVcm9IYklKK2NwYXV6aGdiL0N2MFhwSjZX?=
 =?utf-8?B?ZlhRWm9RVTRWN3RjNEFWK3RRMFQ5Sk9oVVZta21XK2hnODFDQlNkYW1NOXVE?=
 =?utf-8?B?SERsaW5JRVNuaWJDcStuNiszU1IzN2JEYWpWK1RiUU5pN2ZobUszUS9wd0k3?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47601cf-143f-4d45-3fa9-08dcde37f4e7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:31:49.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6dh7ApVk6bfBmGDmHtAMwk8x3rRxVQF1grl/stalq3eiNF0ugYzF132S8l0HrqTXuN2MYqF/P0q2UyXpw651TxAI5S2AI+zuKiOf7vXoLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10485

Similar to commit 890cc39a879906b63912482dfc41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()")
add a wrapper for "platform_get_resource_byname" and
"devm_ioremap_resource". This new wrapper also returns the resource, if
any, via a pointer.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/base/platform.c         | 27 +++++++++++++++++++++++++++
 include/linux/platform_device.h | 13 +++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4c3ee6521ba5..da6827f9462a 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -108,6 +108,33 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource);
 
+/**
+ * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource()
+ *					    for a platform device and get
+ *					    a resource by its name
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @name: resource name
+ * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	struct resource *r;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (res)
+		*res = r;
+	return devm_ioremap_resource(&pdev->dev, r);
+}
+EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource_byname);
+
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index d422db6eec63..ab7f33f3c426 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -68,6 +68,12 @@ platform_find_device_by_driver(struct device *start,
 extern void __iomem *
 devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 				unsigned int index, struct resource **res);
+
+extern void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res);
+
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
@@ -83,6 +89,13 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	return ERR_PTR(-EINVAL);
+}
 
 static inline void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
-- 
2.45.2


