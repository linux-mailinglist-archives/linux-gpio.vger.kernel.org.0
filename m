Return-Path: <linux-gpio+bounces-18402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F90A7F25F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E98C1898FE1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA35253342;
	Tue,  8 Apr 2025 01:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eeCmXalR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6558F24A07F;
	Tue,  8 Apr 2025 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076508; cv=fail; b=MIAGdyPnLeVajCx7xFlpSS6jLIp9LlRCT/R1u+ex7dg545ujh+pxS3c6Bs8am9xJw3AyFckXHUmEG0hMjcqOkYkVlCvZs+EbL9ntPRsp4tBh2QTiET2Ie5CXeWqZcQ6CBla6EyvBj4Yvg4F4OhRt1Jx066gshD+PlUPCFHPc5r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076508; c=relaxed/simple;
	bh=4x4YdZCbb/qJPGqFZHcdPb08+dWXpHLGJ9bi2lQ4UGc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LsiuxV0v1Regl7TDlmtbAdmQ19dKvrKDHI7NE8+WOeVr1dCJLTpxOJM8/4dACHabyI96frxZB0U/EvAO3qHWP1ByambIDKqy4bj+OgkLJ1/WBHjCYcZWtkFgWdRIhuHFVOL58dBKAS14BW4tynx5DnJzDXij32qTKd0yAXLqhVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eeCmXalR; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5YQZotut/jbEGU8CVSxbnVN+E7vLj8LxuNOymQ4F9rJTXc7daVy/Gypl2DQ7XUnjfkKw0QZccrwpxny+ssU4yhtRXGRNV2/pWeOiQXfoZUwrEXfQFP+qRPcgd8SJkiyXrtbkADBGqRUYcWIeZZcbgaardx3QgvlZgFsfCqn+Iy2O8z8c3R3Brfd5DeBWFvRXiBhQLhj2/KN64HQA0spZwrOxXF9kgPd+n8tOxdtcyGZ8lpp6EO3A1VNUzINMQTvb5BY99c9sXMLkLmIwMZsy43SUFwFm47Kyx1zhGiNM620UhPL/IyN0hRauRE9+1BEUg3sO/vgY2sCTUlMjXPB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrW2gRkHRJiVcqGsBCTuZH1FeU4rHYJnvxGE/vqilAM=;
 b=FQr0GWwnDryY762xN/wYavxMNGlaBsOCkULo92mZDEzNKFtJauUW0qk1LluGD0bwNVqfPhhicHngZYgJG69TJzxf5sSWlP5V40WH9YlyAMxysbxfkNTbNtTPwDwnOoxOrKeyL0QRp6oWJeYbIQjAZ6EvTXBCItyZvrunSvkUlal9oE82CuU4uaOgxExXcETS4BJTItWIwFC8W0sy8TsmF0fuwt7zQPooSowPgl3oGjHIOT0pTZWe4le23FHXk7wE45M4zt1a+2iIiJNhZHmdhGwSiWF0djkdm43N75FJQjms92g4T85IxjR1iBDQeogd8Ue9mvKK/YbVZJVB5bXVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrW2gRkHRJiVcqGsBCTuZH1FeU4rHYJnvxGE/vqilAM=;
 b=eeCmXalR9Mox4bNjA1UYWS8Dc/pqv8EUKGNuKgR/4E2JvGTSfPe5DeQPtSB4o32czq+IuLkottfVbXDN+8DtK8/+eAfMr9mdzuw7gmK4+f5YWLDh1daKddQHCzA906s7jD7MdbIBsF4s5yY750gZWOoh8hyvb5wq+8HRI+B69Pc62pMrb/xlnCsOXnzvjioGbhwToT3yhTurIq2DAE7E5DwbdyuBiuzncx5gJnBB33R66epGMVfZnHPSwIJhOlhxY5Z/+6fP2VVrxENet1yHYdQcs5JADtcB+WHLOZfbznS9PGCpjpZYE4M9F/28yB0g1Bfw0hMk8qjzrs/vzrtJTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 01:41:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:39:57 +0800
Subject: [PATCH 1/7] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-1-c0db9d3fd6e9@nxp.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=1913;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1erBgDO9YQTsUPReW5GRSBqXlHOpBFfWmMmesMgsHeY=;
 b=JEJWae/S0djp2AhfmPAdWsKHp/d7xWZKSLAVQ0wiUAoaRjlrsp8b+idpKbQ9am1E3RjYX43eU
 fzEw3btspoMBW1PEwNvQki0Di24cBeQsETleL8FKe+wKv3YWQRS0Kiq
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: e88b083f-a642-4d80-dc48-08dd763e7890
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azV0elBBS1RsU2tOcForQ2svUDJGV1ErV0Ezd01Mcno1N0wvQzIxQ3FwUHZM?=
 =?utf-8?B?K2hpWjFHWktDMEd6dlZaWmpWOGFnTm5aN25La2dqTG50eE1Pd055NFFySjhK?=
 =?utf-8?B?QnFHVGEvdytqbmJJUzREeS8zWU13cDA2eitMeGEzYUthUUF6VDJEYmU3ZnIx?=
 =?utf-8?B?V25TRzNnVFpVTzM0VGo1a3k3RnpURU5QOEZqL2UyTVJzU1ZPUUlzSUIzNG5Q?=
 =?utf-8?B?YkIxTW9ZNmtKbG1HVTVtdXc3NGxUblJEV3J3QXlzbk9ndTRxcHFFY0Q4RmQ0?=
 =?utf-8?B?ZWlEdmtOUzNwSUk4VFdhTUxKUDVHVk0rUmpmaHRRTjU3ZzlaZk9qNkZUcVpY?=
 =?utf-8?B?UEFwYkZPTWpybVozSVEwT0tpMUtaWVZhMk5GSGF3NUxhSjl1WnBiUVBYRjNS?=
 =?utf-8?B?TnZiT29OeWFnZEZ6UnBIczVKSk5zempQYUVZK0kwS08ybU5PWTVKRWpGNFNr?=
 =?utf-8?B?enF3OHBLLzZoZDYyYnZhclh3QTc5QlBOUkRjVjlrcWdSVmtpMDZWRlZNNDdH?=
 =?utf-8?B?Umk3MldjZWJQSW4yTW03ZXFHaHBKVXpqYWo4dTU1N3hZd2pkWXltcXFIQUx2?=
 =?utf-8?B?MHNxK2R0NXNTQ3VuRWlJRnJucUNkdGdhUEFWMmd4MzlJeGhyNU9paW5PZmxP?=
 =?utf-8?B?QktvdVhtVzV2YW9ic1IrZGMzS05GektLVmloalQyaFZGMWlRSWlYcENVZTRP?=
 =?utf-8?B?K29obmZNS29wc0R2cC9TTC9ZeDdic3FyQW50dmpDc1h4RmdsR1hoSjAwM1d0?=
 =?utf-8?B?VUR2N2UvSEpVem5XVFN3UTkzQllrTHd2dnM4WEE0MFNaQlhkWFJ4ZHFFSVNJ?=
 =?utf-8?B?RjZBUURwY0RsbkdaUTZpL0ZrQWxuV0p0Uis3ajBUaGhnVHJJQnVqdWhybDJn?=
 =?utf-8?B?KzlIdXVHRm1nMjV5TnduNDI0NlZBNyt2c2Jva2JmQWNReGllSXg0cDc4SkdS?=
 =?utf-8?B?enFISmk2VEZOemR2R21vK0I3c0VJKzFIYnZ1bjBoRjdOWDNJUDgxS0RiL1py?=
 =?utf-8?B?dlVDQTk5VHg3M2tlVThWdG1hVE5QUng1Y0pNTlVBbU5IT2hpYWFlQllQcTY2?=
 =?utf-8?B?aERnazdYdExIbWFOZ1ZVWWhQenlJSWd3RGRUbENhd0dwUSs3ZjNyVlRqaGhV?=
 =?utf-8?B?RFNzTWNoOGlVcEtBSlhLMFNKUVJJMHVFTndwMHovVThiR2VHLzNKVkRoaENR?=
 =?utf-8?B?UzZpdWpvdUNhUXFkQis4T3pvMlorN3p2SmZIRWRYdzM3djBtTXYycjR2QjIw?=
 =?utf-8?B?NnJ4dFZqSldSYlZjYWhNczZHTVNuMHZuOGJiV2RRTUoyQ01QT2k1OUllMlRV?=
 =?utf-8?B?S2U5NnNXUDVkRVZ2blhGWFAxb0N6OWVyVFJvM25rMk1FM1JnM08yc1owY0E5?=
 =?utf-8?B?NEVLdlZ5YlpDMHZpbVdWM05oZURWcGhRT0RaQXdJTkFkWnowYmFGditmWFg4?=
 =?utf-8?B?OHEybWNzZ3BHMUY0TFJsQlF3Tk40TXlmQm9WNk1MSnFUWDJac3YveXRXTEJo?=
 =?utf-8?B?Qk5EdlFtV0pvTkVOZzk5WjRXZ2IxcS9KcXNHNGdGRkZDRFJ0TkdITFZScVIv?=
 =?utf-8?B?aG1BTlNSZEZHZXNFTGdEVkp2cldlcFdCSmVCRWpIMXlBZDgzUFpVWTBHL1ox?=
 =?utf-8?B?WmJPYUluVzQ5V3Y4SnJuNUYrcmwwank3REdBVjlGejF1NjRxdENPZWNGZ0I1?=
 =?utf-8?B?RXJWY0V3MnVIaVA2T2tPTUtIMmZCaUV2ckJSTzdBY3ZSZm5VeWF3clcrelgr?=
 =?utf-8?B?NER0OVlMQnVVQnNMTThYVzQ4TGRCRVFqa2U4OG82WFl0S001YUxsNGRwNG9F?=
 =?utf-8?B?bHRFaXNndFVWelAzamdzbnRDWUVPWlJFQjhDRHlqbDhyRDVuenRPNzk5aWsx?=
 =?utf-8?B?bytnZmptLzlWbTJsMU5ML09FcTVNekVNYks5L0xiUkI5TVVBcERtd3F2Z3ha?=
 =?utf-8?B?anFRSXFXK3N5eGhYM1l0MHR3bmRvNm5sbWovNGIvMU9BQVBqSW5vQkxnMTJh?=
 =?utf-8?B?VlJ2MTdhc1BBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHV1RWxaVHdkWDlrSVB4S0h3dGg3UktaemcxZkxta3RIcXRaNVFRd2svdGwz?=
 =?utf-8?B?QkpSVW5CV1lNaU5sQ2diTUFPQW5ZRHFxdmZwNWsvRDdLNnQ0ZXRPb0I4eVNX?=
 =?utf-8?B?cmpHRkNrWTlzNWR3dFpNYUVGckx6d21Ub1Mxakc1cW9RRHM2dEtHeGpNeGNk?=
 =?utf-8?B?eWV5NHpqa3NuUXJ0cENKUVFpUTlOKzhWN3FsM0JLaGtjVnBlcC9iYkxibHZU?=
 =?utf-8?B?bmVaVTJjSFErR0x3bEltZ012N04wTkMyc2Z2TE1ZMzc4SmFUMENXSmh4eTli?=
 =?utf-8?B?SnNDRnpRb3d6OWdIZXpvd3lRMEcvRVY3YWJqOURJZ21LeG5iUFVzMUpqVlJa?=
 =?utf-8?B?eHVzN1NMWHpXOEJ2OThvNktXeUExT1I0N0VkU0tXZzY4Rk94VmxYdVJ1TTdj?=
 =?utf-8?B?ck5LR0lrQkIxMnNGR0Rlc1lZamtRTkIrQVV4NVZpdGJZaENZOCtKQWNySVlm?=
 =?utf-8?B?T3krVUpqTUY5cHN0TW9CTXYwZTJTd29hbUNUeUM1WWd1anpnbWZGTXpTS2J4?=
 =?utf-8?B?M0l6MWF2MEVYTDN3c3V6S2FXaEFRbU1mSzUzK1ZCUkJ2TytuMHJnRWZrbmM2?=
 =?utf-8?B?ZXpMUUlEMnBvY0Z2K003TlcwT25OTng2WHREbFF3VHpwZDhPelBCZjRwOUIw?=
 =?utf-8?B?RGNIVEdyaFI5NEFreklydVJWaTYybUZYYTdaL2xMdENFa25IMm0vUGtaUm5r?=
 =?utf-8?B?QTE1YWpaRWhXa25pdHNobUR4MWtGT1NVMVJMbVNqbEE3Y08wK1dSL0x3eUs3?=
 =?utf-8?B?WUczc1h2Zk1JSHJTRGVTOHRaSW1jV3BDdEVWRXpEMDk0RW41MTRnMkEyNUJ2?=
 =?utf-8?B?N1Q2aTNZVTlmeTJxbVRYbk1qNy9LTkxORzQ4aWQ1VGx1TEVHb3FJaFNUdVhj?=
 =?utf-8?B?WUZnb3ZpQ3lkdlFWeXAwNjM3SVlKSi9uM1NDaFhnYmphUCtaZkFtMy82Z1l6?=
 =?utf-8?B?L2NUem5hYTNnaC9JUUZsbzVjbkNiYkszcC9zTGdRaThiM3VqUlZxNmlaYW1Y?=
 =?utf-8?B?Vm1jeTUvVUZyRmRUNU5zMHQyKzRMdW9udWUwWXRVWUFsZTh0c0NsM0tyY1kx?=
 =?utf-8?B?Q2NueFlGUVVva0V4TncveFNWWWlNL2p0T2Y2YkpvVDFhN3FtQ3ZaV1JzYUdB?=
 =?utf-8?B?K2JQdEdsdDRsaGxKK096T3d3U2d6Z2hCc0V4YTNYci9aa0pYL3dZY0srM1Jx?=
 =?utf-8?B?bGFYZXVOb3pvaGlCT0VqWVFrbk1HUFpmeWdnYkpxZzRGQW5lYmxaanl4a29X?=
 =?utf-8?B?VTl2SmN4a0Q4dzY2WmpacGZINjd6aTg5dGY0dnRkOWozNGpWWDBoNmJMeTVF?=
 =?utf-8?B?VnhmcEhWWVhVYzNlV05JTy91Tm1DOFY1WmNWdDY2ayttTnM3Tnh1S25QMkhN?=
 =?utf-8?B?SVE0Mkt4NUpnM1VFYjJZWDAvTXVMdDlHRGxMMzVweVl2eEYvdzRzcHZOUjBu?=
 =?utf-8?B?RTZpZzBCWmM5d1pTbXlrazhhMjM1QThXM3REaUZnT1RGUHlGRlJXeXdTNTFl?=
 =?utf-8?B?N3hLc0ZhN1JWMWdNRHI3anNlSkwwaFpvRXpqclAzL29uS2ZFaFVOK1o5YW9H?=
 =?utf-8?B?NG9XUGk5QVhYQlJYZmxMUi84TDY3anI3TGRQQVB2RG0rNnVzWjJ3bC8wbVJT?=
 =?utf-8?B?VlBpUVhiNmRyMVhITjlDNVRFek1CanJPb2d1T09vNVY3Slpmc1R5WnIvNjhO?=
 =?utf-8?B?TWt3NjB3NVo3MXY1WWNtTWczTVRiVVNhY1RES1BsQS8yQ2txbm5WREE2bkJx?=
 =?utf-8?B?azZTRW9zSkt1WUVHczQyTWx6akg2MkZKblVnTERJMEtHbitKdkNnQk80WGlD?=
 =?utf-8?B?YjlzSFpsaTJJS0l0NTdheEswczdpOE55MmdOS1kyNVZOL3U5SXhOcnRMakdQ?=
 =?utf-8?B?a3J1YmpjQnFEU0hSWUV4dllDeHdEbUdxNHNvM3o1S0dBR25HeFZSRWJxaENr?=
 =?utf-8?B?amx1U3M2QVp1VllicmlBd2c0WCtIaUV1R1BPOWZZOXA3SHVhYnRCMEk3QU9u?=
 =?utf-8?B?U3dOVGhJVzU5QkR2QTNXdlVITkpnN3Z3WjRRMjJsQmVpbHZhWXhWczBNVVZF?=
 =?utf-8?B?NHA3U2orRHBuSUI2Y0FVWXJQWDJ5c2pvVlpnUUpndzhob1hydlFiOVhkb3Ur?=
 =?utf-8?Q?khaVwKWPYU83Pv64yLgWhpWdg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88b083f-a642-4d80-dc48-08dd763e7890
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:24.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBAzGAM3cV3Hzw46OT09snR1bFKcfiKAyD2rvSR3Lw8TFcF/SGxJNPEb2SAxorjjtoUu14nnFOuyteHc2NroTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583

From: Peng Fan <peng.fan@nxp.com>

There is no machine is using aic32x4_pdata as platform_data, so
remove the dead code.

Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/tlv320aic32x4.h    | 9 ---------
 sound/soc/codecs/tlv320aic32x4.c | 9 +--------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/sound/tlv320aic32x4.h b/include/sound/tlv320aic32x4.h
index 0abf74d7edbd69484c45ad6a1c39b3f67d61bd63..b779d671a99576deadc6e647edff9b1b3a5d33c2 100644
--- a/include/sound/tlv320aic32x4.h
+++ b/include/sound/tlv320aic32x4.h
@@ -40,13 +40,4 @@
 struct aic32x4_setup_data {
 	unsigned int gpio_func[5];
 };
-
-struct aic32x4_pdata {
-	struct aic32x4_setup_data *setup;
-	u32 power_cfg;
-	u32 micpga_routing;
-	bool swapdacs;
-	int rstn_gpio;
-};
-
 #endif
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 54ea4bc58c276d9ab39a15d312287dfb300dbab9..7dbcf7f7130b04a27f58f20beb83eb3676c79c3d 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1346,7 +1346,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		  enum aic32x4_type type)
 {
 	struct aic32x4_priv *aic32x4;
-	struct aic32x4_pdata *pdata = dev->platform_data;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -1363,13 +1362,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, aic32x4);
 
-	if (pdata) {
-		aic32x4->power_cfg = pdata->power_cfg;
-		aic32x4->swapdacs = pdata->swapdacs;
-		aic32x4->micpga_routing = pdata->micpga_routing;
-		aic32x4->rstn_gpio = pdata->rstn_gpio;
-		aic32x4->mclk_name = "mclk";
-	} else if (np) {
+	if (np) {
 		ret = aic32x4_parse_dt(aic32x4, np);
 		if (ret) {
 			dev_err(dev, "Failed to parse DT node\n");

-- 
2.37.1


