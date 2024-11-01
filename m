Return-Path: <linux-gpio+bounces-12431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0189B8C94
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CD4D1C20C97
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FCA15852F;
	Fri,  1 Nov 2024 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HS1ipa1T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5EF157E6B;
	Fri,  1 Nov 2024 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448415; cv=fail; b=HtNi5+jnYH21b05UqTD472YFYQ1NJ3ROJb/yn/kuF9tBH0DuAhEAnihsk0p13VBe/WzjytyJ61H/xCaS/tZ/8kjrVUugKlM7f9alp23LIfG0H7+qV/PqtOYCT4+wNt2ePvv+JWk+jIg1+2/9211AN47h71rH4EQusLqXE6W+K6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448415; c=relaxed/simple;
	bh=JGk4JoPMNB3lNrzPC4j5q4MFl6lPFrbGdewh6IfAzNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AH/aCgrcY48douYd7DGifiZB4bFtHY1aiDngLFxe2+wFB+11P4JMT7jDQSHMejGmpXwR07n9Tmv8S80DwQqu6k6+JUThJiqZ14O3Yq+rJM0NU8kUeAfHO3kutR0binXpMrHHJBzS9PqVI8hmD7bD1IHLZP1kFpFEPudjKtF1yTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HS1ipa1T; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXVWYevZHiOp/jnrP8UIh1VIM4tgB4DohAeib1MQi/7Dit9b0F7TNb9mMzJonw0McT1KMc5ta1Gdkf7Fc/INxa387HFBs7eRRdO+URBRW7Pu5wZGaCq9ESLJsDAcCpQQKxsMEg2ob/zCjEVi+62vHE4A2VPY5CrMhBbtrpEqva7BOXvzQYO0uodDM64cI5QIiAYHzQrDTk2oBYiKAQ2pla9WlFyBgeb5W32o17jM6aogNltnEOJWUkJFy4/OWfNmYRBHvVSeD1SzkfIxqAgFTbOpimE5RO9MNCgeLea3185R/LlCdrdK45MR9h/hXfPqZos7gGUcVUnxun3emozwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNZvUuGOtpc048I2G5b6vIW80F+kyfPM/s/b6wr6lE8=;
 b=CMZnnTSyCtIzyBiKcFhM9IupDbDpzy8TdMiR+xiGRI6fk+KtYMscydjSrzgqYe320oEsJHrmyLpsJfq8Xh/BKiXGyVb0y/lUL/vWHZHmo0XppTo1YMZRDSE2ZsXKN4DHDgTVzV3oQrIyoavW8YsELL/I+OY00Sh4M49K8OAgGbJR8b56uTTAtdnc/vzTyu2AB6YxBedyDSYWqgk2PXFV9PALCIiDSdxjxENWCc9VC7I/H4mAqDstDG0MUZ9Iet48Ahvz4PBfeTBAuo+pqzUj6x9T+8FO+HEa1tvdFRq0dSnLUp6OJJvG6h2KbUScsl6ndYFINUSY9zLn50L8Ukq7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNZvUuGOtpc048I2G5b6vIW80F+kyfPM/s/b6wr6lE8=;
 b=HS1ipa1TXO7nGIVS85Ja8wyi6cHLJsXXnpUiZh6lhHCHwyx5cZ0trbQOiBHTgi7kYoWYpI3q2vM+rQiqRRpIfjesTfHhKLP08CC62dhR6pSlrBsCyfv7Syz+n0C1stvgzT7zkMhqgpoMMS0uXgb8Su7aG9T60ts6/TWd0Ppg+vFSgNzca9JqvVXrMSArXvLDrpyHhXTnDLIdXAy11qcP1z+fWjSGEj0+9XAIQ2uR8Slnhxa9AkSTj0NPaBDiKKO4C9Khvo2pJK/EwDplNMviLgptAmOY8GuCHPOKjmlHzhSwr7CrDoap6L4yMythZvPKF3xgU2ApeNZ07VcVCj8Grg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 08:06:47 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:47 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 3/7] arm64: dts: s32g: make pinctrl part of mfd node
Date: Fri,  1 Nov 2024 10:06:09 +0200
Message-ID: <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: e964c3be-bdf6-4a4a-6764-08dcfa4c21f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak05aUx5TVlESHZpRzZ1Z1JDaXZHNHhDcm0yeDdzSm55emU1Y1hhMDlaVlRX?=
 =?utf-8?B?YU85OG00V2lRcEN0UW9od1IwWW13SE5BK0V4bkt2SHhvUCtOQ1FEUnBjckwy?=
 =?utf-8?B?d1EweXhJVWxldFVmM0xaOVdMTEx0QWNCWTIrZ1BoWThlL2JMNUFQYnFTSUlL?=
 =?utf-8?B?cWpGU1NkdTJKYWlLelBqa2FsQ2x2My93Z0xDWk81TUsyWEVaTG9HMXlyRVV2?=
 =?utf-8?B?Yzd1MDZmNHFEajllVmJuRjF6a3ZrU3UrTEtDV1VacXhzb215R1o0bnZ4aEVl?=
 =?utf-8?B?dlFxeDhSbmVtQkRpZXh0WHFMM3R3Vi9PTlpqN000cXJ5d2kvb294ODh5eHU2?=
 =?utf-8?B?OWoyeGVDZFp3dDkzOGgzeXdTUHJLazVVOFo4VkJzQVRJVEVheElkMmUwdVRv?=
 =?utf-8?B?ZmpVaC9aaU83cU1mUVY1NFF3WmNTNFUwbE9ER2o0WGh6TEx5SjFMM25zd0xW?=
 =?utf-8?B?dldiVWR3OGxZUHVTWExXb3FIcjIvV0JVa013ZEc0d0ZnU04zSVFCS2tpY2Vs?=
 =?utf-8?B?OHRhNVVoWXhTcjFFZ1JFWnorQVhDcXBqa3kyZExsOG1uK1BhWi9rM21pUXF5?=
 =?utf-8?B?YXFOMDJKbHNJTDNhN1JpdnZ2OVg3QmZjZlZ6d3hPcEhKQUFLaVhHc1EwYzVi?=
 =?utf-8?B?WlZ2U1lIK3pNR1NCdlRBNkVwdkxWWEE4cDFqMWltQlh0Z1BqSDBFMDVlY2N2?=
 =?utf-8?B?L1Z3UzlxVHBCck9GaW9UMkcxNVUxWlgxdWNCMVBXZHB6TmJVVnB6QVNQUE5W?=
 =?utf-8?B?Wk9rZWdObnlySlJPNlRIWWVoQitqeUN1bEgvYmVPWXJ6WEEyUUdKY1U0cHFO?=
 =?utf-8?B?R0xTZllqdlNZS25WV01vL0FUanNKUWVOeUZPSlFLSzdUdHBldGk1RCsrZUpZ?=
 =?utf-8?B?RnVyTlk0WmRINy83R1BiWGU3Q3ZKZ3R6VlFtTms2ZXQ0Y0krVXZGbnJSWG00?=
 =?utf-8?B?dm1scS9pVzFKVjNXVHZJNTBMQkl1Vm5VMmFCUXdkcFZnaUZVVU9yZkdXUUNL?=
 =?utf-8?B?QjFWL3B1cjNzdW1oNHJXd0NpbXU5NmNKcVNDR2NIWGk1V2ttWVNGREZHYkRB?=
 =?utf-8?B?dXZNT09VcitNNUd3VDFMYnlFTTVienpNOFdOcWVaRkttOVdlNk1IaUUwbVEv?=
 =?utf-8?B?eTBZUXF3N1QrN1JuUmdtNFkyNlJ3WkZqcmJsRDM3YW4rWE80TDRGQ05aQnQy?=
 =?utf-8?B?SUVoYVphMFFnWC9CNnNWZEhhc1VCb2hyQ1BmMWJBQktFNVdVRnliK0hFRmdM?=
 =?utf-8?B?blJIaFlsSit6eTRkbSs3VW5rV0FIQ3pBUXFEd0J4TERoTlVXWHkzTEc1bHdk?=
 =?utf-8?B?RGJVenlZU2FFNUtLSWQ4SHZ3THcvTzNUVXg1NEIzSHJHU2hkc1lleG9uTHRt?=
 =?utf-8?B?THVyRm1QTGdFOE1reHpmbkovcDloSWU4eTZ3a3VEUVlKTkRiaEFtWUtZU0k1?=
 =?utf-8?B?SS9SYXBFeUczMld3SGR3U3hOV0JsVTRVUVlxSFQ4KzltMkwwN1NBYzg1eVBB?=
 =?utf-8?B?V2VJOTZqbmdRZ004dEg3dTJKVU12VjN6UzZXdkM3elo5cVEyTi8xTHEyM2N6?=
 =?utf-8?B?Y1JKS1E5M1JKVFVZdmtTYUd0WUg3WENQYlV0QlVIc2cxQXBMRkNBa1gvdWZY?=
 =?utf-8?B?enVCNGJMY3ArTW5UL3E0Vzh2eStWZW5jd25kMU9ONE93WVRqN2R3cTBGcFlh?=
 =?utf-8?B?L1o3RmtpMHAwSkM5emFZT3pYZDd2NnRQRHlvV3VYTGFPVXRKaVh1VVhOaFJu?=
 =?utf-8?B?dC9ML0lkMnUzTHljV3UyNXZmS3k3TkZDM2ZWT0ZtR21XWmhXUjhyQWlUNHZ4?=
 =?utf-8?B?K3hqL3lpTFJZZGl5dWdCQWg1eDhTL0pWYUtBeHNXeUZtSThEa3d6dHhpZXN2?=
 =?utf-8?Q?NsrQIXD9NuAti?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRVdmJBR0VIQk9YNUx5cGNzM3hWalJMbGNqMXFOQ1FYMHB3SjZCNVU0RTRP?=
 =?utf-8?B?SmJheWZId3l2VFNpQlBPbXg1cEVUd2hIakxheHNINGYxbGNIMkM3WWt1dGFk?=
 =?utf-8?B?cVVZZ3pqTFVLMTJmSE9lcHYyQmFiWUhYZk1IemkyTkVmT3NVanpaWlJONzNa?=
 =?utf-8?B?MjFmV2ptL1VhMkRlREVJSC8xSXhoQTQ4SDF6TGozRUFadFYvUWhWaThpa1Fs?=
 =?utf-8?B?V2MyTWtrRGMwV0V2aUtRQmJzY20xNS9vMkc2a3NIVjdRdDlzbmZBVEN6Si9K?=
 =?utf-8?B?U0ErYWxIbytkNVhIY210MlFROWtMTmNxL1MxQTdQaGQrd1dvSk9QZE1sWC9W?=
 =?utf-8?B?dnpmVFdDWjQ1L01ldERjRkVpUGZpb3d2a3Bjd2RybTZnS1BndDFDRitMTmRL?=
 =?utf-8?B?N20wNGFiWUVyNzBoLzBYbzh1T0p3clhFbHdYajFKMEw3eTZucHBQQnQ1aFNr?=
 =?utf-8?B?TFNlN3dPSkUvVGxxOHhTUEFmZEZyd2dOWjY5ZWRneE5YemdtMGQrSnJiaWs1?=
 =?utf-8?B?bUdHalloRXo4clJ2c3ZaOXArZldOd2p0T1k0MUNJdkdxdGJHbkxFMTlyU0VU?=
 =?utf-8?B?REJOL3VyZ2ZINW1CNll0MDVncVAzcjNWUmtuY3MxNFZNVGFFblFpay9SOE9T?=
 =?utf-8?B?MkMrc0taY3prOHVUTjVYeG94UjVUK1FUSE5pMjB2aE1GbE5TQVFZTVJCcWFZ?=
 =?utf-8?B?Rlc1aUFKTUlFU0pxQTQ3UWtPVFd1djRlZUFnS3NtaWh3MDdwQ1NCVnNqUkhs?=
 =?utf-8?B?V0RDY3J6amRIZ01lOG1YanVaWm5WTndCNWY1YkJpTFp1OTdQeitKSU9RWUJo?=
 =?utf-8?B?cUE5ODRRdTVQS2xqRDVqQTBHTlAzSmhHSnRQbmJUNWdSb2krdFFqZzZONXFQ?=
 =?utf-8?B?dGNCK0wramV6bnNNTEdwdmlmU0lkUXRzRnJqNURlYzM5dUF5aTBJdCtnR0Zz?=
 =?utf-8?B?aHRXTXpvZmZ4L3Erd0NEYXNjeUpESkxGbnRHMEJuQ2JrelZLdDU3Mm4xLzN5?=
 =?utf-8?B?UTQzUGU1dVZzS2ZsWkxuYzcvRklBUzAxMmp5VEZ0SndQTm1IaUVBNHg1RDly?=
 =?utf-8?B?ZkNxeit6NURiRFlCcllSdmhzVkZFUkpOM2ZXZy9ERUV1M0NmQUxuSFF5NkdT?=
 =?utf-8?B?OVoyRGQyczZhZlhzbFFpVkNHN1U2d1lNRUFXOWJaV1BHM0dPcEpDdU85aTVy?=
 =?utf-8?B?OXpjWWhzeENGQVpYM2lGNU9TV1hXY2JOYURGUCtwRnZPMTlCN1VpU3Q4dHJt?=
 =?utf-8?B?ZFlzSEQzNEE3TS9uOWtVcXFBakJvajB6WkoxWTU0aDQ3Wi96eE9oaEY2RHQw?=
 =?utf-8?B?VHU0ekVrckx3VEtIOEJWMng4NWcrSHRCOXkzdGMza2pIZ3kycFU4dHRhdWh4?=
 =?utf-8?B?OXVtRVpsbklVcW0zdXkrMXVuOU9XUTk0OG8rMFZwMVRKY3BUTFpXNHcwa2xp?=
 =?utf-8?B?RDRDWG5TbzdDdW5OWi9GOTdFQmhWUTNGM1VTNFVWeDNFQzJkcjVUN0pUMHh3?=
 =?utf-8?B?M016eUg0S3N2ZVZkRnRkSlhKTEZjR1oxNVY1WjRqU2RYbkc3bnJZVFM2b3hQ?=
 =?utf-8?B?bkFZSXVrTFY0dkNkbFNDZS9tUVRBN2NJZ3VvWk55VFNPODl5U29haTQxN2ZE?=
 =?utf-8?B?ZDAxd2tEMTJlby9GblpVcDR0OFMxTHdjVlEwbXhhZE9tcW9mTDZyR3hJeUZH?=
 =?utf-8?B?aUlLYWVnYVg4QlYxaXVjcEFaMzRMYTVDdEU3aytBQWREVlB3Q2RiV0FpZ1N2?=
 =?utf-8?B?Y3dZOGptSFJNQ3pMZlY2aklwektlWnY0cG1idW9yNkpJaGJUaHVMaXZoTExT?=
 =?utf-8?B?NXJPbnJGVkxJbHd3cXEwQThaMVc0NDlpb3NOMU9OVEhTeXJ2b05Nc2svblYv?=
 =?utf-8?B?TWtVeHkzV285RHJiekJVMHc0aTNXM3JLMTgwU3VmYkZ5eVh5L2lVRVlkWXhE?=
 =?utf-8?B?R2N0eFA1Q2tDbnJROEhMMTJXbVozOFZVWU1TYjI2by9Oclk0SEVTdzU1dThH?=
 =?utf-8?B?Y3I3eVo4NUl5TFc3aHdOcUp6cnVacEpRdWRteUdIZ3B2dmZUWVovdFZpREp0?=
 =?utf-8?B?NTVEcEJVczBIZXBrZERRSW5Jb0tFdVJiT2RBZzdGLzdpL0xuSTQwOE1KQ2w1?=
 =?utf-8?B?dUN3N1FCblNmUmhPR1R3ZUdJcWhBdDJOVXRaMVU3K3l5T05PQUFleVJzYzR0?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e964c3be-bdf6-4a4a-6764-08dcfa4c21f6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:47.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcP7JoNGLp3hSAV96vV8EomuAxObvJrLh8z3O2uYnU3q06AnhoFH7hRoWbzWz06k0TveCVZa08lFYMnRVtpPSISmlopRGWVp46QtzpIAk14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

SIUL2 is now represented as an mfd device. Therefore, the old
pinctrl node is deprecated. Move the pinctrl related properties
inside the new "nxp-siul2" node. The latter one is now used
to represent the mfd device.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index fa054bfe7d5c..e14ce5503e1f 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -114,20 +114,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		siul2: siul2@4009c000 {
+			compatible = "nxp,s32g2-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..fa43d036686f 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -171,20 +171,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		siul2: siul2@4009c000 {
+			compatible = "nxp,s32g3-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.45.2


