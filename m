Return-Path: <linux-gpio+bounces-20138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FABAB65C3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6760F7B7BC0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F39E1FF60E;
	Wed, 14 May 2025 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YJsQLfc8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70219924E;
	Wed, 14 May 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210703; cv=fail; b=P+zdTX1V47HfCnW4XKGbe5te7Rv8oezqTjBknDKsvr9w/cqRY5UM2tu1tOm4UrLAz75kmJV1EpOaf5FygjKtPkb2ap/fibFZ6dJ4Uilq8ZQLCqIe0u9JjeboROyrCEl+8KfUDEEWSkBJ4be5Gkv/NZ6Yc2DVFVC+wznLbLdJ0a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210703; c=relaxed/simple;
	bh=5Pcf22UUvTjiAbTm78rI+C5oem45gV4HoIjL+bHUbtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NuXVBLeOSm4tJibJGH62j2nAmC44+WRjK3bypyCK2ub5Fu7yAR2EIUAUjrjNnoh3Epo6LcX8nYVt9hCDkMeb2hDV5sIZiEl/ffJMR0LR+3RFabGsnK9WjzCelfZKLyagagXoXS7TxNXvN2cFcfUnXMrVFkIx7gZQn+1tJnOR8zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YJsQLfc8; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMXnzUE5zd/Tn7fRzi3cHljz7SWMYbz75bpt2+t//YXLdAahYmcdU6kXuKVk0hkGYUkj6YC7+GZq5+I+CYNvWlndGROK4GvXa6gKztrqip3iaZyRvR+Fhf1r7c0MH2r0rnOKUpwLmp+oWKihpy8KsiiAZNd8TrdgD/hjboNRAFcSbvaNADsILdW+XmzSFEsnuBZooNOAZZTUi+bkElNTREfnX/0Grg4Q9QKZruNlq4qOfWcWiD9rxCwQ4QI7Sn5kpp1Jkt3hT22OvapD45BZZU5AgmoJyKSm81t1b8Ab1UBlEwzKvRxnDTHLjxcYTyPPyCvB17VmZA96eAXCOeyK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Pcf22UUvTjiAbTm78rI+C5oem45gV4HoIjL+bHUbtM=;
 b=qB/il1Tvl+FQlPO7Fd0v9TSEW24r2bM1+aH+vkeWcrRvPiVIlpMjSprUONgTGGoy5xcW7SR9rF/A9C9hVxHdCqDHveKF9pInpjhpOPjiy3E6aORQWmtcsmmIksLXVjYwPFKoYP0BfPsuV6oGQXyyLyey3JpsQZ3ukh8WCN0EqfCqgBW/2aHVcCjzY3BeU7OGUIiJeOObmiZzmRHuxbg1IMmyrxNTY5fzfWa78lPnmUMdJv1lYVkpn3x6F1n8AO+3jgJu7IDjKiVoWqaCuDSd5ozXi9OhYAZzl28wTbOQxPYa42RtErYLXqwgb5ISpxBlRWnXtvhK8TphccT8scgQ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Pcf22UUvTjiAbTm78rI+C5oem45gV4HoIjL+bHUbtM=;
 b=YJsQLfc8nPtockrvJgSvR67Tj4ea7mD20W3ZDuQejnVKjYUSlcxEUYil95rWMI99TNlaElsrWr5aeDvehgNApRp+Hyv20NeCq4w984sffCe2kBNtVBfsrzKz3slOf9gGw3+U3wEF+Hwf7cdoqdXmL63L17SvtFeZjvQvrPTxaQs3tQoTl97FgZyK7W35XUPUP7k1h9KrSDZS6qs9g7t6DFAOS+WMyviHjN4cSDDgjtFVqq5KuLIOt9p0C3J28QzYR/X7fKd837WNrUWlCfjf/KXDLx/LP2gEunR177lfjvrV6bAch6O70g8NO7uiu0ymip9A2FZztDTgv87ztL5ZNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 08:18:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:18:15 +0000
Date: Wed, 14 May 2025 17:27:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
Message-ID: <20250514092711.GA22881@nxa18884-linux>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
 <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
 <20250512-mongoose-vacation-f81a56dd6c5d@spud>
 <20250513075532.GB14572@nxa18884-linux>
 <CACRpkdYmupji8a0np0xzogjcvJ8YFstAgg_XwdxNczhQjBZOPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYmupji8a0np0xzogjcvJ8YFstAgg_XwdxNczhQjBZOPg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b4ff24-cea0-4157-d371-08dd92bfe02f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnVRc29KSUVEWkYyU2JZWUo5UlgwMlYxbWdkY1R6RFJEb1R6M3F4YU8weGtF?=
 =?utf-8?B?bzhoWnJjeG05YW5EbWtFZHVPNWZGWSs3VklGdTJnS3lHQzZmQjF3UDBldWdp?=
 =?utf-8?B?MG53R3ltTW5EVWlnZ1JURzVNODZKb3VTVE1pS1Q5VHE5Z3JOTzZwUEU2M0pw?=
 =?utf-8?B?YXByL0trTWdjWE5BZTdkM1cwSzZpaWJQbkRqYjRBY1hwMm9QbDNJUUtveWlz?=
 =?utf-8?B?NjFPTDVvTkk5M05IdXpZVzBuYklBRisyWU1UUDJoUGxIWGMzVDVIUGt0VlRt?=
 =?utf-8?B?dklKeUFZb1ZNN1Boc3ZzZHpoaVVHeGVhbnI4enRvOGd5QVhTMnlyT2E4M2p3?=
 =?utf-8?B?STdvbHVxcjRmM0J1ZW8rb1c5cUs0a2FIL2s0YzQ1WEQvWWQ2UVN6SlZoamNE?=
 =?utf-8?B?ZFd6NWJKNFJkaTNEeEU3cjlHdExZclZpVldqNU9XY0U2QUJGMU95VGh5UFEw?=
 =?utf-8?B?bHFoM29OTTYwcXdMME9xdXdoWktpNG5Fdkh3NUNFQWRXR2lkbytVQVd0UGFS?=
 =?utf-8?B?Z3liYU1nNHN0QVU3NHRoTEZ0YUVOVEx0WHdYSXUvZmF4UTRuaFVENVR1RTFS?=
 =?utf-8?B?RWRKQ21HeHpIMi9CMXNaSWd0c2Yvc2JDRkE1NW9UUnNSZEd6Z2xRUXM0ZzQr?=
 =?utf-8?B?UWxZc3h2WVEvc3M4QWphdG90MUZ1bnlMeGRydEM2VDBEMGNWdDNrWGZXQnBN?=
 =?utf-8?B?Vlp0UlBsN1pBRmFsL3Q0T0lobGJSRit1NUF2M3BIL1NTbXFXUytqSkdWRlN6?=
 =?utf-8?B?RVVjMWJjRFlGTHM4MHI3OUVuYjBNam8vTjU5YWRza2pHS2FHNnBYSVExMDJS?=
 =?utf-8?B?UjdROWxsOGZNWGd5M2VKMVM0cEtTYlJQSHNtUXFhRnhlNSt4SllhUlNhWmg0?=
 =?utf-8?B?Y0YwTGxTZk1KRS9XTnhyZTBweU5zU25acHlEMWhXcGl0bUlmdGpwdHAyUHF3?=
 =?utf-8?B?ZkUzZnpCc3E4emFLbkxFU3dYWHIxd3Vqbnk3d2NKekd0MDJqU2s4US9mdlY4?=
 =?utf-8?B?NXo0NnRKYmszMzVBek9sVHVvRDdXNUpSdUFmMFRZZk1HMEM4SnlOY1BlQXEv?=
 =?utf-8?B?WENDaUV2aWFUMHR3YjVzWTZSb2FieFVmVGo4L3FWeHJuZ0M1RDdKd1grNld4?=
 =?utf-8?B?c3grTWxDUS94eTl2RXMySzNQd3JFWHFEYmxFZUFGRGx6OEt1SlZINEpIbkhZ?=
 =?utf-8?B?NjJUVC9pYkxVbkVCc0JJemxadEF0WHFFbW5ZVGphUXc1dWZQQnhtYVA2THRr?=
 =?utf-8?B?UjdGb2wyQ29RZ0FTYUVtTytRRjVOK0d1NjVXZEo0RGlqN2pHVGdVamR5a0JL?=
 =?utf-8?B?NVd5cVJKSmpQdC8zcGhNZVBydVhIZTVPKzl5Vk9qZVFPWlM1T3R1aHVBNG93?=
 =?utf-8?B?WjRZQUhwd0Fjb2VNR3F3U1o3YUtGYkZSWTczcGppMEpOaVBoODRUWGo3cGk4?=
 =?utf-8?B?K1g4RFZOdHJoQ1BYQUJLY0Ntb2NyTUJka1hMUmJjdG80c3djb25HL29DNGJR?=
 =?utf-8?B?MDNxWngycUR5SVdZQ0RtdTN1WnFwSnRLMlg0d2RyQ3BHRG50dG4rZllkMjV5?=
 =?utf-8?B?WmgyUTBuUTdqU0FIUnBxVFNES3NFZGNVcG9CUkwvNjZXZzhJUWhDY0gvUy9a?=
 =?utf-8?B?NmdTNEZ3L3h4ZkJ0OTRoc04vSUNhcFpaOUttRUM2UnJsRG1WQTVxUGI2cWRX?=
 =?utf-8?B?ZjZkeHFvNURzckY2eUNTTTJXV01KOTYvWkxnNDRYd3VFa2dOSU5URTJqYXpG?=
 =?utf-8?B?L3ZtRUV5UXY0QnlkMnZwOXZTNFFySVNlS2FQMlR6SGs1SnNubEZYVzExM282?=
 =?utf-8?B?b2UwYnAzemFyWkI1Y0doc1kvOXQ2WGEwbThiZXF5NUllQTZ0engvMWE2Q1c3?=
 =?utf-8?B?QVBvNVZaY0lOckNGN3ZraW15eWx6Y0J5bEE5dDFRdXRvc3k2b1pGN3ZGZG5F?=
 =?utf-8?B?bEprSlVIWnh6ZWlCQnBlRGdmR2crNFJVZmNxUGZwMU1ERnBJTXBlL040NVpa?=
 =?utf-8?B?Q3JoT0ttNmp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9oMjZDK2l5eUc1VnI5Z2JSZk8zTWtDUkttWDhOOWJBUjJaQVJEdGRMd1Jo?=
 =?utf-8?B?U2NnU040YTJPY2V3WmtxOUVDamVwMWhWNlFxWmVGbm9NMzJUWmVsaVVUU3dn?=
 =?utf-8?B?cy9WY2Jpc3VBTGs4M0R3bnBnZjQyLzI3V3R1RURHNHd6cit3S1lIeWg5VnFr?=
 =?utf-8?B?OU01eVVnUVB0bXpWWXJvalZBRS9DMkQ1L0M5TGUydGtrODI4VGRTTlVsSm55?=
 =?utf-8?B?NnZocTBES3o1MS9xeWxLWityUXlxSERVLzV4KzdSZkhHcUZYTmtpZWhTVUZt?=
 =?utf-8?B?dXhQTm9kWGk1WERUblJaNTFFZ0h6YS9GaWRCK0lPc0ZhOExPSnI5Y2lTb1FU?=
 =?utf-8?B?MDhNbVpFQ1JlZTg4K1J6QjNMY3RkVlcxMHpERGRWN1ZNS0ZsR3ljSkVTbFZK?=
 =?utf-8?B?YUNveERDaWpTY3pYajRZMUlhK0xJZ0NTbDVVcWhvWnptZ2tlY2Z6NXdSREJm?=
 =?utf-8?B?UzNsd1VxR2lOaTdpRFdCeUtjRmlQQzhKSkJQcjJmYURLVE9VYThFaTBlZ0JY?=
 =?utf-8?B?MGxZVHQzM3BFODNJZTRubU9zTHRHQk1uT3hTWDZJd3BudTRxblRjMnlKNlU2?=
 =?utf-8?B?aWVvYzlxb2UxQnVwTzZqc3dTdTB3WjA0eVAxa1BKYkU0WlBCKzk0MWkzZ2o2?=
 =?utf-8?B?K1p4bXFoMDNUdFUvVVZJZUZBWXNWRUMzY05IZmhiVVZpaXlaSWh4NDRTbXYv?=
 =?utf-8?B?eDk4NUlqZ0tZcW9DU3JhdXhvYnhub2NaM3JEdFB2MDZ5NmhKZi9UUUlWRjhj?=
 =?utf-8?B?Zk5aVDdaRlFOaUFBRHpYak1Tem01eUdYOUsvS0FadXNmcm9DVUdackxTc0lo?=
 =?utf-8?B?WWx2NFlGNGF1bno0N25qQmQ3ZFB6VmNzTUdwS3E3ei9WV3Y5VDRsdzFsOGhJ?=
 =?utf-8?B?Tk9mS2NHVmRrRytIcXFSc3pmMlJta3hXOXlNMnNiUmV3R1lGeUp5aEVha3U3?=
 =?utf-8?B?QUhtL1BLVGcrS0p2VVZ0bUtheHhkNUViQkZQRk5zVGJSWDV3UkdVZGFYTlIv?=
 =?utf-8?B?N3ozYUVCZHZkN04raEVZUHFRdFlMWlNrSFd0VkEycWlyRm1FZXljNXpQazRJ?=
 =?utf-8?B?eUhkMWY4bEJLUUd1enpZTHpGRVUrMVY0Nkc1cGdYZEJnaDduTDk3Qmc4RURi?=
 =?utf-8?B?VXJpNEpDT0lUWHc1ekVIQittL3BkVVk1dTh5emlSV25zZDZnak9XaVRBd0lQ?=
 =?utf-8?B?RHdrVEh5QVpIdDJmUUE1Y29TVElhdWdaSW5saGw2ZU5kbE5mdkFWZUVzWkVH?=
 =?utf-8?B?ZW8xeElCYUtsd0liTUhRZUJaM2dLbi9Na3dtVDBUNHBRRFBQREhaV1BuMGxl?=
 =?utf-8?B?a1ljTWhKWnZQMG56RUg2UGZNNFoxQXZQVWhQVVdBNzFJeWt5N2RmREo0dllr?=
 =?utf-8?B?VG01WHFTdHRQNHRiK2xXOCt1TDRtK2NqREdEaWJja0lsYlNRdENBYXNjeVBn?=
 =?utf-8?B?bHJXTXptK3RzVDQyRDBvNUtQZk4wenlUVndvWEFCS3ZuM0FOdEd1VFVHZWVF?=
 =?utf-8?B?eittN2hoZTBLZ3FUZTdNN0thc1Vna3BOZE5RVFNPUG14VjRaS1hlWUZCeU5K?=
 =?utf-8?B?TE9OUVFIT3gybFFDckdhaVh4dnJveXI5TlFSUGdpZGxseUZkNThEMVBWTTFh?=
 =?utf-8?B?c2lmWmtLMmN5UHluVGJVa1hycXFKVFFJazlBVFpaMHhUcEZMemZsQWZPQlBY?=
 =?utf-8?B?WXNtOHdBWERwbEtTN1RZOHhkVkZsODBpWVVSNVlKTHUwUXRJMWFEOERoNU1t?=
 =?utf-8?B?R3NISU9BUXdYUitJL2NhWUczZTU4ZURYNE12Wng5NXdpclNQKyszbkNyS20z?=
 =?utf-8?B?ODJ4VVRaWW1mOE9XaWN5WlVBbGE0OEN2V1FhYmJQZ1ZTSXNEUnlRdW1qSmQz?=
 =?utf-8?B?c0pMR1pkT3BINDhLZ1VNbmU4TkZzd3VPeTA3QURkMEJjNDZJQi9aVmFVUEls?=
 =?utf-8?B?elpMUGw3R1hsMFg4UzMxQU4zMC81RzlQM09oRzlSTFRyVzF2cVVpNFN0a1g3?=
 =?utf-8?B?Z0lNcUlYd0tIemV2NkVTeW05USt0aVBrVFZNeW9oVXljY0NLR3lBYlpWVElt?=
 =?utf-8?B?UVJTV1hKMXFiUTVLbFBZL3NtL1RKWkYwcWg3dnB0OGora0tPQUtnYlNzOVFQ?=
 =?utf-8?Q?37LXcySkhvcSA+xMMd48cfT2i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b4ff24-cea0-4157-d371-08dd92bfe02f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:18:15.8900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3U9H/YIpI8R7KCkRIBx8TohYP4BMRMVN3mtGuF4ahDHJqlFx4JgzzJHelvaG8ygo14pV+B2qsfs7z1Qc85D1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

On Tue, May 13, 2025 at 03:20:44PM +0200, Linus Walleij wrote:
>On Tue, May 13, 2025 at 8:46 AM Peng Fan <peng.fan@oss.nxp.com> wrote:
>
>> >Same comment here as was left on the driver.
>> >I also don't get why there's a property being introduced from something
>> >you can determine based on the soc.
>
>I agree with Conor's observation.
>
>> we are targeting a common pinctrl driver for i.MX SCMI based SoC.
>> So that means pinctrl-imx-scmi.c needs support i.MX95, i.MX94 and i.MX9[X].
>>
>> Each time we support a new SoC, we need to hardcode the register offset in
>> the driver. But if using DT here, no need to update the pinctrl driver anymore
>> when supporting a new i.MX SoC.
>
>I understand that it is convenient, but that doesn't mean it is the right
>thing to do.
>
>I would advice you to keep this in the driver and use the SoC compatible
>to determine the offset, just as is done today.
>
>If information can be deduced from what is already present in the
>device tree it is redundant to add stuff like this, and it inevitably
>will create copy-paste errors where the wrong offset is used
>with the wrong SoC.

Got it. Drop this patchset.

Thanks,
Peng

>
>Yours,
>Linus Walleij

