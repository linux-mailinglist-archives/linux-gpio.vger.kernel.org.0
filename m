Return-Path: <linux-gpio+bounces-19817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42409AB0964
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF49161791
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375002673AF;
	Fri,  9 May 2025 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UR95yJXa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2084.outbound.protection.outlook.com [40.107.103.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE211265613;
	Fri,  9 May 2025 04:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766065; cv=fail; b=dB71P/9hVgtz+gnGavFGr2Rf/NL4ox7GtbY+sSoscbvJZymDwCU60ZPgRTIt8u25DUT1WttrVu2snVJoBqRV8UPCFrTTXJgeTmB6cT+W1Pyv2XgLADJ+u3PamlwUwRv0J1Onm11IbG7EWMXkuhF4Cyin2jDclrlES4apcQcSUNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766065; c=relaxed/simple;
	bh=LvnI7122UpWn06ie26QqhPkq1Hcv2t4k6wVvVXEd1f4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aH1K6UIR4Fr34QUGnRzTXOmtmytNNXMHVywZT6KRy73qZCGBprjlQY23KQUVcXTcJ/1ATLJLnI8C9rAEGbRVUyHf3y70XaxA8D41Ysm0Tr9i5395S0+g4tr/mHuzw5qQdC2oHEpzMbXX3xydKj/Wkj7ncqPKJEol9kriJLDknUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UR95yJXa; arc=fail smtp.client-ip=40.107.103.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZiORLsGqFmTNLkP8i3IcypJRKAWj8xPyGQzP6UG6XhkJk+ZLFowedD7HYVc2SmSY1P4FbpqGrfTcWRKCV+EuBcWFnKbaZTL0o9E530JwGMjY6P2xAlQfePTb+8TDmGEtxxghBAZsDNISzfuJupcvTHSIpB6DGEXXQ3KQ9Oxk36WuuZsBAdbxKVzdmDDhfsa2cVhDlT+b5W7+VK4EoI2e8PLnmcLDFG23NZ0ocW5ykInyPc6p5Ftyb+HDdiPGonsa575uQGXw+DntjnDy4K4zc+1IcZ6oHmKjVjckyyZKrLwblr501Ka2fKEx/15+14qAtFeZW+KLNSzgFRlzakoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrqGOaq7nS84ubtipNA7Tq/bmEX7TxKRsTjfvZZgKm4=;
 b=e+ZSQ2Z05zeg/ahJI3fMVSjMrW7RAtsaD/X3lu+l0T90kPq0H93p6sLjOsU8oeQPTrU3tjbt0lD4I5c4E7gc8q25JyVnm0UROJMh4yTAoO38C682KBoLyc2nuLAFQgOhXlkSWXOWxRoreeg5lQuRq8AQlL9XTgV7MOD/9nCR4L31EsW9iPUxGTcZ1+U5dVC0Z065C7L5UrHsChRbtjpavuuR8rleLv37H62HXiAW8cMIMqpolKOBlXkxlM7FhlpLy1oDUPXwvWC4p15QjrYVWXPmWNtkwHbtWYQaAHZ+u3VKkR5Nph/Et2E/2N/0eo+topZGiDzZx7qxZKPDHHywSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrqGOaq7nS84ubtipNA7Tq/bmEX7TxKRsTjfvZZgKm4=;
 b=UR95yJXaQ1PIU8bQqyJdFuz8D7H1qlF7Ohy55XOAw3sosBT5wOKX8h24glFs4kLjvL4B8dnkxV6h1YXNPSwHRXkCGNK/Y4uh6HqkdPaK2DP096d7o+SDRBP0+15lbNtoP9jE7cY4nmtLspPgSC578y7DGj3b4Uh1RRyT/6+Lld9Ll/qsxn8QMJJ6p2BK/EKjdYbOeA65G37UyyG69w8FUK9NXs6Z1DqJ++zzhpnzJEf46BPug/Fkx2gSByd93l54tbTsyk7VVN+qMbRGRy55hnRs94/czmyZkoBUh2fmsF9sNbYGIYZXc/BWiN/OeXFzCRnjf9eLYKuE17ormtIbzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6842.eurprd04.prod.outlook.com (2603:10a6:10:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Fri, 9 May
 2025 04:47:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:40 +0800
Subject: [PATCH RFC 9/9] gpio: pxa: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-9-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1706;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Nx5M2HT08Yg9LXdEWgdgVIt2WTydUu/72IK9Wwc29PU=;
 b=iv/w8UAUfrxu6AdL3EwNTZMFquVPRI72l0IBch1/2jB1zUNFgVtz46vkt8fxA7w77JIEI57zY
 SaiH/daO/N8ACqpFZ2H/GBu7FZGmlx3hOu7HG6txDemQPu9I0dkHg4h
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5a03b2-43e9-4792-8e4a-08dd8eb49fbe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzBjV0FNS28rc0RicDAySzR6c1dvYUZDdG1DZnNwQUh5d21kNnBMVG95eUFE?=
 =?utf-8?B?TE1PYlo3SFV4ZnIxbjR2ZE1CYVZvNE1YSEswRnFMZHVBWkxOM2UzZ0d2QXNN?=
 =?utf-8?B?SVhITkRmZmtFZVVvMXY0eFZnbGZPS281T0VxREpiTWt2cGx5ZSttRko5b1Nn?=
 =?utf-8?B?YXJtVWVZM2FhUFVzRnNLZk5ndXg4YktmSGZUUGFJMkc2SHRlaXlnaWFCYnZF?=
 =?utf-8?B?MUhMajh5anRRWjF0K3JYRXlHR2FCTEtFNmZWcjhPMjYydFIzZ2lpc1FsZ2Ja?=
 =?utf-8?B?TjM1eVJSdi9FVUpNOGoxMzdYc2taUUdFVVBXcXlORm45ZGVsTUdub1dOQU44?=
 =?utf-8?B?SXJ4dUpiNmk1a0hHV0hiQ2RzSXV5bzNRWThBWmxIWUhLSU13RlpWRysyNTk3?=
 =?utf-8?B?azBldlM5S3RveEF3eHFnM3gxeUVPT2pPdm1tZ2J4UTlYU1hFUlg1ZTZPWGZI?=
 =?utf-8?B?VE16UkpzaWNqcFBvaVE0L1pndmRHVE1mcEM3UnRUOUk0dXIycWhuSTQ3WXVS?=
 =?utf-8?B?dnZCTk1QekhvN3VLRE82ekFNaTZIRm5JQW0rK1hNK1FsWWdEdU9IV2xTUjR5?=
 =?utf-8?B?TjRSaDM3akYvVnFOSXNPdjlCZW1FK2dJWXpZdm9scThwaHpTeU9xUWtFWjFn?=
 =?utf-8?B?Rm43QTNMNXhPbXd5alFsSmpOM3Jnbm5nUnFpSXlpWUx3Q01EVDlxTFo0K3E1?=
 =?utf-8?B?RUxsU2VVK3RRRExrZCt2U1UwNUtjT0ZFNGtoaGNYRFNkWjJZOFBwbXZ4OUFW?=
 =?utf-8?B?d1pjNUtNb3dYTkxVeHl2WXI4ckMxUUxLVGt1TjE2N2U3SGl3cUZTdFRrZ2pN?=
 =?utf-8?B?TTl6eTJyY3JyWnZjMTJLSm5oSTRIMDVESG9SRHFPV3NXVnYyTmhrcTFPU1JQ?=
 =?utf-8?B?c3d3NEN2bDNFcU5RbWp4SGhxOEo4VTB6bk92MVkwM3M3WGJ2a09BOWVvS0xM?=
 =?utf-8?B?SjB3bk42TUFtME1nVGlUbGRpUmFHeVRjSDNkMW9ZWDJWSlo5TnBoNEsrZGE1?=
 =?utf-8?B?M0JiS3B1bHFxSlFMckdLVWNyUm44NHhaREJxZ1BiRElXZUUveEFlbFdERW9W?=
 =?utf-8?B?N1NPV2RMbFF6cnBRYVl3UmwwOXBzcCtvb1RiWFlSK3UxK1E2VFZhM1ZDVlF1?=
 =?utf-8?B?YSt4TDljR3BRS1R4R3ZWNjVDM1RqQmlIU0xXcE0yM2NNR2kvSU5ramg1Ykd3?=
 =?utf-8?B?WHBySWtSNzZHZllBeG1RY0xSaEdGbWE1MDMrOXdkSFp1ang5S2dJTjEvdERE?=
 =?utf-8?B?a3N1VW1DWTR6NDhUZGhWcmE2RHZ0aGltaDByWFdNbklWT1BhUTRraFlWcXBQ?=
 =?utf-8?B?b0xyUWpxVFpWeVJWVDZwUG9nSFdZaWVvSWpCZ0l5VS9RM2VVNmp0YUwwZDhk?=
 =?utf-8?B?djBNYmJhUlVENDMycG5XTStXR3p5d0hKNmtMVVlPbU1HNnF0SGFjd0w4QmxZ?=
 =?utf-8?B?dTJITGNic3p2WTE0a2docXpWWjExMm5HT0R3NWNHUTk2dGY0Q3VzaEFnNEp5?=
 =?utf-8?B?VUt6bUFaRm5LK1JvRUp1UmdQalRFcGtlRXRUQjBoMWc2ZStSWnZ6ek02dkNL?=
 =?utf-8?B?cU9WeU9VVW85dm9TNW5Gcnlpc2tTbHpUdUpoeG1Rd2VwS1JSZ0RqSHVNSnJx?=
 =?utf-8?B?OEQ2cFFSKzNRei8xQklWa3QyM1ZtL3lGcVg4WUZNYkd0UHkyVDY2dmlqQUtF?=
 =?utf-8?B?N0p0b0VNeCt4V0xmOWpEMCsrY3BBRmRuVmlPdEpvanJtSTZrazNDQTAwUFRm?=
 =?utf-8?B?NEFkb1dhdFcwWVUzY01QUE5waWRROTE0R2o3WjMwcEtLTXlwUHEzYXRINEUw?=
 =?utf-8?B?bzlpZWNJNllZeWVxTWk2b1U4VUhXZDdRS0dsaUMwb1ozbXE4VjBSNUhsZXJh?=
 =?utf-8?B?SFZsTkpVL1p6dzlXQlFNcWVFbEgwdS9wZDdTRFJyMnlqNVg2K00xMjllam5u?=
 =?utf-8?B?SDFyYjRac3VmekJIYWRUVkhCcHllSysvZCtBOWV5MUtrLzBYWkxyWXA5dzJ4?=
 =?utf-8?B?bStDSTVuc29lQVBtb0wxSFhPZVVnWFpCWW9Zd3d5ajlveHlDVnVQaGF5SnIy?=
 =?utf-8?Q?nXws7n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVBpWDlKR3VoUUE0QUVjdExBbVdQUlg3ejJ3WE0wK2Q1OXhsL2ltMTBFVEgx?=
 =?utf-8?B?NEY4NnFGYk1yT25Hdzdzemhaenh0dTFoOE96SEVnb3BaMDFsaWxPYlluNTZx?=
 =?utf-8?B?TDNpbkdIMWRWUnJrTm9uUHhib0h5dVFqREZlV2NVcG1wdDdTWFhvNnBIV1Er?=
 =?utf-8?B?RFkwV250YThjckoycHV0MzlFMjBZOEhIUG9sUmYzRDNSUkZ3NkVpRHlGZzhW?=
 =?utf-8?B?ZkZ4bTdBY3lGeVFndjF0cUhuTHNxdW9iTjBoZWNnbXc1eDVlaHkzMVBtZ1Zy?=
 =?utf-8?B?V29CUkdKWStLZDJrcWQwalJ1WFI1YmZlMmRNNHljZWFVWEtBWUlhOENZcmxF?=
 =?utf-8?B?UGZTc0sxSWZsRjh1UGNFempBMVl2S2dHZlQ3ZjV3VXVmN3Z2d0hrRVFDZEM2?=
 =?utf-8?B?aklsUUhyKzU0QkRwWWx6dytSYmJDL3Nrc0FrVHVFbHhvbStnSkpCRmdnZlFs?=
 =?utf-8?B?dlA3Y01pYWl2UEhXR3VhNk12YlpHVjVyN3JFUW42K2JBUGdJQkFFeXVwZGdP?=
 =?utf-8?B?WHp3WjMvcURpdlZBTkVDcjFVRjNOSmg4T1AyTkRmdFpCcnZ1MlVlWW56WWlk?=
 =?utf-8?B?alY5U3RFblFrZ1N6aVRsU25YOUJ4K3VxVWJYZk1zaFlzNHZZbkZoWWtGa1g4?=
 =?utf-8?B?SWRibG5MV240Z1psRHh1cklRL0lVZFBsM1NKL2xlVFNjZ1BRUjY3UjlvVitr?=
 =?utf-8?B?M0lSNGFNSWFGclpxczNJSUIyTURGS3lVeWcwYlY2dUNhbVFmTUpYQmJKczZi?=
 =?utf-8?B?ZHNQN1pMTlEwQVY5T3FsMDdnaXlTL0Q4VjVHNGNTRzB1UXNTajJ4QzFETjB4?=
 =?utf-8?B?N0dQUU9lc0Z4L21nOWlicStiVWNEeDJGblNFb1RuVlM2K3paR3J3QWZLUEsy?=
 =?utf-8?B?NEF1V3E1a1hPRW9JVjBjR0NzeUpQTGNIdGlBY2w0Q2x5a2FERkpZK0FIVjE3?=
 =?utf-8?B?cE1IWi9OMkdqaFIyMWgxMk5La2l4b04zM0tJUStLNE9PRHpUREhFUE4zdmd2?=
 =?utf-8?B?a2U4QXBBRmdLOW1DZlZ3MDVybWZrVjBDZGhrczZNYzhWTjJ0b2lFOVVHN3Zq?=
 =?utf-8?B?anordmVHOWVSQkxmWW81QUgxRFNDOHAwaTlhVkNocVhTTzcrN3NkQmp0K3B3?=
 =?utf-8?B?OGhtVU5lVEgrSU1xT1ZyV2xJS0xXWWVCeWs1b1N4RHFWNW42S1VYSzlYejZh?=
 =?utf-8?B?WWNQQURrUXFLZUsvRnlFV0tXT0VYUUFkb0dsWDBOZjJuK0Fnb0N3eEl5OWp2?=
 =?utf-8?B?YVRhY0twRklIZm1GRFNnRy9DUFpKUFhXOEJ5em53SUZOcTgzK1NJaHdCdzhs?=
 =?utf-8?B?WGphVFphSjVxalYrZEVHeEFETUd5ajgxQXdWWmFURm9FYjBvaXdzSDUyOWFU?=
 =?utf-8?B?Q0FOUzRPalhUUnhydGI4ZGNFUWNyRFZISXJzWEsrMEplbkpWK3lFM3FjWi9Z?=
 =?utf-8?B?KytYeml0SlQ5Lzk1ZEt1UzZQN1F0a3pRT3FrRGQ0ZzE0RHJRRHZtUUREVDlJ?=
 =?utf-8?B?NThqYlBqMnl6eFV3SWFYZERjZmdJYTJnWjZCZGhZRGxHN0FiaER2bmR1cUE2?=
 =?utf-8?B?eWwvVzExMkhnNXNDcS93Y0lyMU5Hc1MxV2dqcEY4V0pKNWJSeDVqUDdSZDNO?=
 =?utf-8?B?bWxNVWhrSlN6U0UwWGsyVFRsOTVSaEdSNCt6c3RZT1VRTEpnSVVYd29HNEV1?=
 =?utf-8?B?OFNTei9tZ04zZjNvVkVJNFdLRE9xTmdua2pMYy9hY21OZzdYSytHelNSNkhu?=
 =?utf-8?B?VXpvVExkdGNHQlVlamh6cCszbWp4WXpaVGJpTHN1dlVqWXZBaUFjTS9YRSts?=
 =?utf-8?B?YS9oMXlkWTN2d0ZuL0o5QXIydEFoNmZVeWNoUC9qNTBNOHY2cVlJeXZzUFZ4?=
 =?utf-8?B?QlB5UTVKdUVUTnNEa3RHaVYrV1FhVWRpbzc0MWJibk9rUlNaNHVzTVpPbHgy?=
 =?utf-8?B?dC9RYlBNL0NRZnRvQS9yM1lUcVd4cTlaY2VYdUx3enhNUEhwRlVXaWJzdklo?=
 =?utf-8?B?clhqZVMvNFdQUW9PZmo3ZGJwNWJDN3hGVm5CSHZOM1JRb2txRFlYbGt3Qlpk?=
 =?utf-8?B?ZGlNcmxVamptUTAzeE1mTzkzUEdMLzFSRWRrdkFLOEYwU1hhUXZiOEVtVTBa?=
 =?utf-8?Q?sOWUMenW7fndWx2qM14Jsk8J0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5a03b2-43e9-4792-8e4a-08dd8eb49fbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:38.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RS0+l6ED2zMsFpFAUeFv3g+WcKFAdXYxfBgQbnYjDHWMVUxdp4msg/n/jhNqbSrfyoAGfeY2idpI6rTW+7EGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6842

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify pxa_muxed_gpio_chip, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-pxa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index c3dfaed45c4319a54b545bd89b834253b77d369d..aead35ea090e6c37e80ae3c29e12c44cc8e930c7 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -497,6 +497,8 @@ static void pxa_mask_muxed_gpio(struct irq_data *d)
 	gfer = readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
 	writel_relaxed(grer, base + GRER_OFFSET);
 	writel_relaxed(gfer, base + GFER_OFFSET);
+
+	gpiochip_disable_irq(&pchip->chip, gpio);
 }
 
 static int pxa_gpio_set_wake(struct irq_data *d, unsigned int on)
@@ -516,17 +518,21 @@ static void pxa_unmask_muxed_gpio(struct irq_data *d)
 	unsigned int gpio = irqd_to_hwirq(d);
 	struct pxa_gpio_bank *c = gpio_to_pxabank(&pchip->chip, gpio);
 
+	gpiochip_enable_irq(&pchip->chip, gpio);
+
 	c->irq_mask |= GPIO_bit(gpio);
 	update_edge_detect(c);
 }
 
-static struct irq_chip pxa_muxed_gpio_chip = {
+static const struct irq_chip pxa_muxed_gpio_chip = {
 	.name		= "GPIO",
 	.irq_ack	= pxa_ack_muxed_gpio,
 	.irq_mask	= pxa_mask_muxed_gpio,
 	.irq_unmask	= pxa_unmask_muxed_gpio,
 	.irq_set_type	= pxa_gpio_irq_type,
 	.irq_set_wake	= pxa_gpio_set_wake,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int pxa_gpio_nums(struct platform_device *pdev)

-- 
2.37.1


