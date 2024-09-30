Return-Path: <linux-gpio+bounces-10570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56098A4C5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999F4284595
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAA118E360;
	Mon, 30 Sep 2024 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JJh5GpuP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EA18FC89;
	Mon, 30 Sep 2024 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702677; cv=fail; b=A3rEStdP8njI8sRai+NHEy+QuXO6EJzFhBIA7X85iNWouiDupbHDNR57belkFsVuS0sfE1/3JQbefTPQuA9mYTg3k2uGYEYIgWNg0wWekIL3CKO7r8ydY2LfGl7/seSCGf9/tJa8kNUXoqPM3HYkUV0R0tZOkHJoJW0e/xp/dKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702677; c=relaxed/simple;
	bh=sqhYvabIA46GaInXj4MwSkllkrE+3+C9w3v5S1i+qAY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BD58wObaqS8nYVaxa4PROpOKd7K93vyD3lbHoueHFYO5Gs1iEH2ylSUU06ItPmB9qOegddf/OaJirAUSsyIbFh/MwAxxC+wMflw1P47DsnsLHN8kt7omBlId9C/Uj6nhFL5+0rQJkd/ll2tXBYhRBSoBFiRRxCIS2SQimK6Z+WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JJh5GpuP; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq0BZWKSxVpAZKfPkE3CkQ21Vk6KWUqfXLEdB3hpLR8N0oRNfR0SnZB3Eg1FrpF97h5Tz2Hz9Gw5qXu9gXun3el/QsvwT+bVu6QGLu/vLwzTgBfSRv2n6oPTOcGLK0Oylp8zZUzJWHWnM8QjK5BgvihTyMzclYjxqVUgHxnwjPPTvP7KhocvfpTeWPm/d8QE5KfxxaXm75hzhYOq5LhuyZZUxDGJYh6kymH1Q+b+ebYcWmdIhynNq/S3R0jTq//7QxkqzKG/69OIMEuxbl02ytR/J6kzaMLoJMhNVgCIJvqL7HtntTU7pNngjTbw5YKkpHIPFS/zNLSyXWg7De2YGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHxsDeBqFFJNUYgtSBJCRNCwXJy3zU/2cFEG3X69fw=;
 b=rmRduAc24T5wGXif3NQGt+3w4JkhqkZcE91Gno1K/t4qmGoFg4nHfiHPhMl6shH3n82MOnptYyu5zG1Z6Lt+ZlahE0it+WGmqFOlkJNMpZU2VqklaQPs0x3/bKvrBL5mWe8U2Zr1FhklUvKgZGcmou33d4k9wfxw+9z0P0/IkiPIFaeHcyFJKMCsxxoC5k0byDdlJBi25I4ttqyaeWbcVW4gB2E7OqlnUqgcRR2nxBYe246UCEr/O4mboTvTHDDtwgPVuI39AQDCm5/fHI4dSNXEQ3ib91ncteD11DLoFHG7W0d2CUcwNx6riFwwVJmP8E0nKmwteYnAd1nE/IKkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fHxsDeBqFFJNUYgtSBJCRNCwXJy3zU/2cFEG3X69fw=;
 b=JJh5GpuPel/PTFUcGeqVWefsSHY0LP4eQGJzggm6hQWLe39E+j1pFKMmEuTEKxeQHiYkTPjdDify5eDvNK1NRZXYNTRxMPRl97IRlmv4EwEHTatkzGN691T3iWy31JWyaDLBX1mr5QiOxdCMe+AKVU7jWnKhM+lXldRRkL3IPSSZohA87DmIas7LgCBaG6flbqX94iMY3MsY/H3ENT9nQgYIkTVI+mgVUKsBJzVxcYYFENIz1WOUYKvIGVo2hn4Qxlw8waq+XHgUmrjhs/UekshTiPRzZTrL+edck4xPpZndcENorJ1/z31xvI1F1125I4k2OM7ZN6xg50j2A9RZug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS5PR04MB9942.eurprd04.prod.outlook.com (2603:10a6:20b:67e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:24:31 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 30 Sep 2024
 13:24:31 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 0/3] pinctrl: s32: add missing pins and an S32G3 compatible
Date: Mon, 30 Sep 2024 16:23:41 +0300
Message-ID: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0116.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::13) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS5PR04MB9942:EE_
X-MS-Office365-Filtering-Correlation-Id: ede13067-af14-4460-674c-08dce153377d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDVnOWNzZmp0ZWY3N2Nxck1mSmxvVzVHNG9JRUtJMERJc1BWUmNMclZnclZa?=
 =?utf-8?B?TGdrWGgydGtrMVgzdWJldUUxS2dlZ2RrL0lLOWhENnptb0s1RjlIMGp6aWgy?=
 =?utf-8?B?djl3QmRGVy9MZndzSUdyL0N1U2t2eHFmSko2dzBERHZnWC9wS1dQWUh1bXFU?=
 =?utf-8?B?YzlRYlQvUjdxOTBvUEwwQ1RVakVDemhXenNJZk4xMTBpMjNDT080VzQ4ZUg0?=
 =?utf-8?B?Kzd6TktzMllUSGViTGEreHlqUWN2UVJjVDF0TVRKT1JGeFJsdFlhaE5NdjZ6?=
 =?utf-8?B?ZGlaTnlkQzBEa1cxTGN2d0NYL0Y2Wk8wemIvMng4SHgvdTNucDUra1pWNzlB?=
 =?utf-8?B?NXcxaUFHeEl3TXhFbXhYUVc1N0lxalhlUFNqakpWKy9NK2MrRGovWXduTWRy?=
 =?utf-8?B?dFYwK0Riemhjb2pYTTJwM2ltZWhpTDFrV0pJVk1GdmR3Qm9oWkxUQXdEU29L?=
 =?utf-8?B?NUtKTVl5RDhKZklPVDFRYjVHeTBONWhUMzBWR3lZWjhHQmZCdGI1bjJkRC9t?=
 =?utf-8?B?MmNKWEhMcFF2SVg3V3ZqMVdvdVVnYnNtbENUNGkwTXBVUVVJWFpHSzZwSVAz?=
 =?utf-8?B?eDhrL01EemR2Wnc0blZscnFBbXFBczRETVJYU3VpZUlGRzdBM3VnK0RyUmwr?=
 =?utf-8?B?RUxMUnJhaVNaYUtmNjkxeTNoM2tNU2FZbzBDdy9WcTRjcXYrdm1kbmliOFFW?=
 =?utf-8?B?cHFRTlFsYU5ZWlpEWUYxc3lNTjJReS8wUjF4UE9sc1hDUktROWV3MXNoanRw?=
 =?utf-8?B?N05BY2d6MnFyTThwdjdWc2tFdndDZ3MyQUo5ZGdtUkNBZWRyVVZ6aUVxTks3?=
 =?utf-8?B?Wm1hazhIRUd2ZmdPVndCSW1jOERUdDQzdlhNR1FZc1VEV2xrcHJkMGtKOVZK?=
 =?utf-8?B?d09UMTR2cytDc1d3TmR4VFhVbUJmM0lOWGJsRkxXNGU2MTkyczRYN1o4Skxv?=
 =?utf-8?B?blREc1FES0FXWnRCWVd0NGl3N3NvVUN1MGh2NUtoNGFnWXphQzBCV2RtbndD?=
 =?utf-8?B?QlZQME4zdzhaVU1xNmYzYjlWL1JKVFVXbytzMHFQWWc4RkdaYU53b0pIVlBW?=
 =?utf-8?B?RjJuUFVSVW51MmZ5aWZWNC85VS92OU9KRlB0OFQyOGZGVVBIdEFOYnJ2K1g1?=
 =?utf-8?B?Wkd3LytaN2syeVlteEtUWEN4dUlEWjVxQ254S3hEWWwvS2ZvOXM4d0JyVlhV?=
 =?utf-8?B?L0c4SnJ4K1VQTGFLZzAwYUtyclJSaGZlemFQOE9CWUNMUWF5Y0RoZ2VHbk9i?=
 =?utf-8?B?WUIra2hURWxTZHZ3WVNhbHdYQStkZFkrdGo4eldCaUw2Sm0yZks4MUNsRUNr?=
 =?utf-8?B?QllMODU0anUya1prTE5rVTMxQ1NTbi9QeHQrUnhKbXFLS1lWcnFtNWh5STlt?=
 =?utf-8?B?WElvbmIxVkRhM3JNTSt6dlVYU1U4T0ZnWE16cUpjQlgxcEVURjB3ZjBkQjJL?=
 =?utf-8?B?NDJZcktGTmhxMEJ1YVJ0NEFkOFp5QUNCTjBQVUI1bmJtaVdNbms1cXM0MUkr?=
 =?utf-8?B?SlJCWlA4S2k5NlpzZUk4V3lxZXRmMUZTYm42ekg2L2htajlxdjdMa05MdzdN?=
 =?utf-8?B?TEg0RDNTdzVPaDd3YTVnclRWSENhZnovNHZvRE1Kbktyc3BDeU5mcUd2Nnl3?=
 =?utf-8?B?T0poZ3FQd0hWOEVGOWN0NDJEZjlnWVFXM0pQZkdIZjNQeXUrZC81RVdrQVBj?=
 =?utf-8?B?SW5QbzNjeDgwZzFhdFlOL1o3U1BZTUtrbkVoa0hYRkN4dVdFeTQyZTVyYzRq?=
 =?utf-8?B?ZUY3aHdPOUlQbmEvRGt4c0xYY0FBNzU5UjY5M1kxaEVlUVMweDBLbEtnc25M?=
 =?utf-8?Q?NvRx8ZIXU32W/SpRV57XgrFtJqQ12xcuevQyA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW56VFZsVFpBdDMwa3BlOEQ2Z0JpcDQyMHM5Zlh4VlBHeEtVUnpLZmwvY05n?=
 =?utf-8?B?ZmU4MmZGeUN0WE15K1NtNXlpVlRKZFVESThXVmkzSGdnTnh3dWZSWUt6NXhX?=
 =?utf-8?B?MUx0aDhsRWoxcEJiYnY4WFh3Wjl5TmVuOHYxRGl2VE5sekRHY3QvdkRHSldU?=
 =?utf-8?B?TnJVZkxxQ1N1VHpxZkZsNlBXWHNaR1Z4UHIvMlozMWlwRHBGY2ZuNURUa3ph?=
 =?utf-8?B?Um1KSGFXNE1rOHZBd0V0akpOS0UrMGF0WllLUTc4Y2t5R2NTQ2UwREw1RHQz?=
 =?utf-8?B?cVdjV0xGRmlOL2hPMHdJTnpMeDBFb3djOG44bXVuTkhhbnZ5N0plYVN1YitQ?=
 =?utf-8?B?c2pxQzhyOWR5dU5aTG1obHJ4T0xlRTdPcEhZOFdzT0JwYlVid0cyOVlNK21G?=
 =?utf-8?B?OWZIRUVnZEhTRHZ2aGQyVXVjS1Y4N3dHZGcyUXNxUSt4NS8rRFlvSVlmaGgv?=
 =?utf-8?B?UjFuaVB0TTk5emw0NXg0MUFWQjVPK2NacExTZDIvdkQ1MlE3Q0trZ0h1VlVo?=
 =?utf-8?B?dG1meDhzVjhobm1MSEpYQ3JVQXpJODlhbnVsbDZXUjB5K3k2cXZsblllajdj?=
 =?utf-8?B?NFlENzd5ZUxpL3ByWDJmcHJBSzdkMzZVQTlMbS9lb2c4YnB1MG9vWG1JTWtt?=
 =?utf-8?B?akppN3YwYkRkaHBLUEtrMERYdDRHUWoxTFh1a2FwejA3bm8rS2dVQmdBQXhk?=
 =?utf-8?B?cDdMNGVadk0wNEZ1SGlUWUVmenh1ZStvN2l6TU9FR2d2SDB3d3Frc1c0UWU0?=
 =?utf-8?B?TjZXN0lSREdOT3djdjkvSncxcEMzMlF4YkZDYWkydnpyTkZuaDgycDRZL0Rv?=
 =?utf-8?B?eE9ITWpZT3pVU1RsY0NFNTJ0SUo3TVpsN3pXQUJDcVM2WmxFRi9FTDRtZ3l5?=
 =?utf-8?B?TTdnMngyR29FMFlad2ZJaHJQSVNFRkp4VlNyYVV5QytJYmhVOWNYL1ZkWG5T?=
 =?utf-8?B?SW0vSGMzNzBLQ0N1REljT3c2TmVEd2VuRUZwQ1VQclNQSGRKYjdVblNTTGtK?=
 =?utf-8?B?dFZnN3hYRldSblBmbVJlNUFKZk1iOFF6NWRqNDh5d3RVbXV6SFNTeG4va3Jt?=
 =?utf-8?B?Tmt5NWxTUm9KVHhjcmdPcmxWaFQyQTlVQzVMM1Q4bXgwV2l1ajBXSklTNnkw?=
 =?utf-8?B?d3BNWVJkQ053RUsxOUdZbjh0WjMxN2ZRajExUFQyK1VwN3pnbWI1K2c4U0Fu?=
 =?utf-8?B?ejZuSEFoSWZxemJaZkh0MENNSm9JSERMa2JvTlZoK0VsQUN1WllQK2NUUXM2?=
 =?utf-8?B?NmVuSVpuSnRKTW1FUE0zY3VpTEJucmo0Y256Y1FDSjJvbnJCZUh5M01KTnZ5?=
 =?utf-8?B?ci9KMVFycW52eFZhOVpCbUFrRjRMbmdTVE5iWEU3UlIzQlVvcnorbEhMZnVo?=
 =?utf-8?B?eWN3TmQwSVg0bEhHa1I1Q2JZSHdEWGM2YnVKVWJzRGlybEZLTFBlWUMyRzNF?=
 =?utf-8?B?YWI4bVpjTGozUHBoQjN0bm8vTlZWZHZlSUkwZld0MFROTEpKU0liQUx4SU1I?=
 =?utf-8?B?dTN1c01ZT3lXRUF4NGMxNkhLc2pNclZaWU9jN0w0bkp6N2FWNzFzRGloLzBr?=
 =?utf-8?B?dXhVNDREU0Raa0RwUk5VdUNmOWxqNDZPc1ZtdnQwRE1jN1I4ZkcxMlhBb2JO?=
 =?utf-8?B?NXpRMzBieHFYa0hIbS91QkZ3NGUramdFdFhpVXUzeURJUG9BR0UrKzZZYkUw?=
 =?utf-8?B?cm1Td1RsdlBVUExTZy8rM1FKZDN6ank2emFlU1crQ3ZXaGtmMVJwcXhDNVhz?=
 =?utf-8?B?M2dLdGtLRWxBWC9idjdGbEtXR21zcVY0akcrd2tJZjBsblcvZ0ZuQU1LRHB3?=
 =?utf-8?B?dzZNdlo5WlF5aERqWnkxRVFRTmkxelFxVkN2aXVvaHp1WHpCdFlsUkduNjMz?=
 =?utf-8?B?V3YyN1J1Nkp2UWR6Qk13V1lLTjlUYllFbnYyYXZTWTViczdjSjllTWRUaWFY?=
 =?utf-8?B?WGM4d3hmVG9iMXhxMkthMlNIa1ZSYkNEbDVCdm5lQml4dVI2OGJsWjBGaU1I?=
 =?utf-8?B?eHJMTERDZVV3WlljVU1ETWlCTDI0RXNGRWlEd2lOUWxubldLT1Q4d3ZVWGx3?=
 =?utf-8?B?R3ZaOXlNcDQ3d0hzTnRkSncySndjc0VqQkJwV2ptQmpuSk9UankwQ2MzVk5C?=
 =?utf-8?B?N2xTQXVZemZubWx1YU1SMEhrQ3ZxRTRKdGs2SzZmZnNhS25wMU9CVzJhWWVN?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede13067-af14-4460-674c-08dce153377d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:24:31.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn9iNAlf/FB/MHgt7OvI8egj3/7kC+OE6m0mJNN+Zq50fxB68wJKWw5vooXJVBzNLGEeO+HtHKU5sFb8NQWeF7btmKJR/X9HKKAfAwtC/vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9942

This patch series adds some small fixes to the SIUL2 pinctrl driver:
- Add some missing pin definitions.
- Add another S32G3 compatible and use it in the s32g3.dtsi file.
  It will fall back to the S32G2 compatible.

Andrei Stefanescu (3):
  pinctrl: s32: add missing pins definitions
  dt-bindings: pinctrl: add S32G3 compatible for the SIUL2 driver
  arm64: dts: S32G3: add S32G3 compatible for the pinctrl node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 10 +++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  3 +-
 drivers/pinctrl/nxp/pinctrl-s32g2.c           | 52 +++++++++++++++++++
 3 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.45.2


