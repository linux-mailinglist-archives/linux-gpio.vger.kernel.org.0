Return-Path: <linux-gpio+bounces-12520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED079BB387
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9248D1C223DC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF9A1B78E7;
	Mon,  4 Nov 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kWesCMhb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2057.outbound.protection.outlook.com [40.107.105.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B317BEA4;
	Mon,  4 Nov 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730720025; cv=fail; b=FWDQNuzNKuZmg6+1Yv5P/bbBaECe235ziJCJfFeA7cf196jhsB90qySeoyBIxfNjjsK7wo3o+zRQqgZKjog7pLqQEXIxcJVcHCHmVxGoW4yKQSUlWDvMl1HMT/85q+scAJxJMI0ai1NTw4OhQ2JWuqTB2v4UGIhpykukcmCl4Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730720025; c=relaxed/simple;
	bh=YuUBHiuXDhah3eaSLMVMMxyySeaqpBKnk7EHs4E3Nx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t9abxoqUWlAMjR+qNX1zwk3sSB60La+9CBqdNZj/8/LuhVDl75ryoejD9FrpF0/7j3zDxLI7/bvI7We3BSU2sCfJ01WpXknVQHyIpyrRqWjxeYx+c1sLA2v3wqadAxEaelvxqc1HdFHEem2+tbHdCNa7vl3971txB+Qh4xLiBLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kWesCMhb; arc=fail smtp.client-ip=40.107.105.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmVh8Wcdp38rXgxCpvdSN1hlp4QKWb1hqx5sbdEy6zR1+vcFhqGPkhP1Ll/MDZO7XkVmsjNfcC0OEl7yukMGXAcjFChhgm144sAHLIlsPI3nKxkf+rMsFE0aiSOXC2BxDXCqtcKe1ApAJl6jV7FUzUObwR/bOSt0WqfT6YY8rpAI3ZieG9N58q0ERECIGmPnFaXCnhQsd6f3T18BSJo90Gfn5EJl5DMQF1P8saOPaYXGR/FIpsYcDdF06PEjVw61zviJkr/4nysGKTtWuIc+9k/nC10+YWM54G7S6zsdcni6Zc/2U1CgDPh2IcWViwaugAaD9PTJkzatxJaE+jVRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dLgVTGw7k4nkv29hw13e1hTe1QdpXjjYd+ALrDR58s=;
 b=sHVNrSrM4443pbJORf9GxIp49bV4e6u8rPZYs3NMmHrL1nSnQQSdgA3XftIzbhzndxPM93x8KEhgjNA6PW7K3FN+IHeW6CsbEqrDM/qGO4pcBQdjQ65EJ5mWlrxe6V0/sVGCFNfvRLE+Y4Bk/XK+VFPoQjlS3dvrNZ6vlj4MhArkhyHhtt5gADPBtdNapubDcMVMQMqLdX4CvK/L7jLVjx+XVQ13J81Try5WgGsvf9XuvdMNfxh4Dk5PLwbPGzteQJrD9cMYZ1CuxpxYjYtqrGLkc81XnbigAWm9x2juM3HNP5Bw5dbjNeWHgxEGKq04uklcVc1I9oLi2gfVgE+Y8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dLgVTGw7k4nkv29hw13e1hTe1QdpXjjYd+ALrDR58s=;
 b=kWesCMhbKm6hv/5/ELyT445Stnrf6uk5H06bSlwS/0VPdL6vVbN2BiwlhrMkvcLV256ZvwVJwPqFd3+vAWyeVjEEnvDt021bH4/HY/w9Rf5KorVC9vgSOWpuExUY6cixo08Ef/cVPit5cNXgxbX1sXZDNZDIHOhoSsyvvhd+slnK4rV2/L+DFCzaOF5Ci9Y/3xGjoAgoUWCB1KTJa8Pmx7Zufq2WLzdS3VcBKZxqB3C+EQcR3RJQOjTXoMkZbp8uc71enUJWQ4I6xRDvkq/ZN4LSbaDKh6jY1mdrT7zGCj8frSqT5sHSn4NyV0aJpfNjbjL7p90wg4jAkZRqON7GWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB10034.eurprd04.prod.outlook.com (2603:10a6:10:4c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:33:40 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:33:40 +0000
Message-ID: <88fd2cba-081d-48e9-8733-4cb6eecaac9f@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:33:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] arm64: dts: s32g: make pinctrl part of mfd node
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
 <ZyUcc5s6u9OzOoyq@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <ZyUcc5s6u9OzOoyq@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::17) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: 57243fe6-6677-4d02-0955-08dcfcc487ac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alNoeG05Q1dnNjl3eTFQbWNwNXhUV0VWUEEvVXB4ODZFcFgyZ3N0eXhvQ215?=
 =?utf-8?B?SnRhNEtta2xnZW1FK3Q4d1V6VEgzU3ZWallNLzdWY3l3bDlMMFh5T2F0MnN0?=
 =?utf-8?B?eWhQTTBBdklIK1ZUVGtJcjRtK0taL0RWRXNWZjl0VEFHUTVDM2FGcUcrREZ4?=
 =?utf-8?B?SUVwWDdLWXIvZWErU1pBS0lsMGdDeUtIMmJyajFhRExXMWwyd2oyT1Mxb3Jx?=
 =?utf-8?B?K2ZCUDVtNjBtdkFJeXZKbE5pQ241czk4M2xYaFM5dHpzL1pZREwwY2tOaHAw?=
 =?utf-8?B?UU9XVldZYWR4Z3ZLaXozMnNVNDVTNC9ycmxOQnhRb1pIekxvMDlubkdiZVkw?=
 =?utf-8?B?Ri9pT1V3RzVCaGVpdDY4TkpoOVlWdUt1ajNoRm1FeXgvMHRSWWlmUC93ZlQv?=
 =?utf-8?B?WTBXVmkzSUliODdRUHR0TzJTc3ZqZkkxVmtQZ2ZpOVhUNkNod1dvaDFOd2VC?=
 =?utf-8?B?THU0R3hQVHppRUg3YjNzUitIUG5aYkkwZHh0R2xDQUFoRmdJb3ZiR3V5VnVZ?=
 =?utf-8?B?ZU9RTURaVzNYVEhCMEZYTDBHZjBVMFZiNU5qY2Y1bzhXL1U3Qm0zVXJSSkIy?=
 =?utf-8?B?OENoVW4yRU5OV3lXcEsyV0Z5cHRGTUR3QWJCSEVhL09STm5ZSlFWQWRuTTdy?=
 =?utf-8?B?b2ZNemhGTXpHWEpPWWU3b3ZaQ0VyNy9keFAxdTdEQlRQVHEwUkJJU1A1eXFV?=
 =?utf-8?B?ZWs1QUMyVTcwVG5TdXFKbTVpZjJIa1JxYWhpait1QW1WSW9RWHZzNk0rZTNN?=
 =?utf-8?B?UlNkL2N6ZFkvTXFNZno1RGU3NW1yZC8xYjRJSkVra29XSG1RRzZxVEU4dWMx?=
 =?utf-8?B?ZjBmU1UwNWxXSURueVFZMzNraVpnc2Y1bFpEdjF5Z0NDWFh5ME1FUGtrYnA4?=
 =?utf-8?B?Mi9MekRtR2t0a3E4UWxLZDlUVmNwQkwxZk5CWU12WkNDdXdiU1pFVkhvaFRD?=
 =?utf-8?B?OEliRUNXY2lUOTVzMWJxYzhhR3JWdDZkckttRC9oeUUwMUdlb3U0bWNHdGhz?=
 =?utf-8?B?M0ZLcndCb3lhY1BRdGt2K0c3SlhBK09jbVYrbnRGcS9iTmIveXp1T3RpRm9D?=
 =?utf-8?B?YkNpVSttTEJrN2k1RlFWRC9iSUhrdkJTa05kbHg2dWNiWWxVZm4zQ1JnVkZO?=
 =?utf-8?B?MUxHbVJJc2NwWkxZdHJ6R3Z3M3VBWm8wcHdjOUplN2JpcnZnMUo3ajdReFJm?=
 =?utf-8?B?RkV1OHFKSTJyZnhkRmNIajNtaGx2WHBMdDhNM2IwVGhJZDI0UEVxNnVuWTYx?=
 =?utf-8?B?ZGM5eklsT1ZXOGgwdk1HYlV5TTE5bWRKbVErdzYxUDJJd0VIWDNReFJxWEJR?=
 =?utf-8?B?UElsdTVsNGd1SjlRY28rNXh6dFE4a2VxSjdjUzVaWjNaYVk4LzN5a0ZuRys0?=
 =?utf-8?B?a3c0ZzJCSGhTM3kzOXpvdzE1Z1dSb0trUHdDK3ZkdWdkOUlsbW9rVE9GVW9t?=
 =?utf-8?B?bUwvVzd1cTB3b0Y4VDhXZWlXZGZFRnhSQ1dxYW9ON0hJR2VncHZIMmkrVXlT?=
 =?utf-8?B?clQyLzc5KytFTTJPRWVUNGROdCtDbi9naGVTcDFSMUY4LzlJZ09TNjdidVFG?=
 =?utf-8?B?UlpVYTc2Y3Z4WFBQZWFKMEVRUW9tRlhmL2pzTmUxMy96MmNjaHVEZTArdi96?=
 =?utf-8?B?eU1DMDRad2pUL0pSWmVoUnhGemhOT21RNUhDeXd4bkhUb3JPdDRKeVNxc29G?=
 =?utf-8?B?OUdVYTJ3c2tHTnV2TDB0azRrYjJmK1Nxb2R1MFZtNGU5WmpMWWxwemw4Qk52?=
 =?utf-8?Q?Yg0fpeBAPRLda2glc5V9wFe8EDDvncUvOFaJUtM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b05YeEF0Y2I3K1EzRlVUSHBnc1JDMVhzWmdqdm8rNzVtdWQ5THU4c1RpNTUv?=
 =?utf-8?B?YzVueWVBZVZNMEFoVE5JZnFRVnNybFRXSWlXTWh1VnM1OE80eHBjbWJFZHl6?=
 =?utf-8?B?RkZlT2szbUZQY0o3NktJZ3pzbk5wZnlQMjl3OWIxaUVLOWRtL2lmRWxHODZk?=
 =?utf-8?B?TlA1UC9ZbjEvSTFXRDZLSmQ1bmRZb2daSUFlM3ZmbmVZemozR3ZTNUF5bDZV?=
 =?utf-8?B?WnpDNG1XUHFKY1ZlRmhoWkVLSm9seW8vQTg5OUpJYVFCYzNhZWFCUUo3bmhR?=
 =?utf-8?B?dFk4NVBrcGtRdlN3eWxNYkIvbldqeU1rQndxMjhFbnBrTGYwTHhqRHFyRmhF?=
 =?utf-8?B?ZFNHL2ZIQWN3dlkwSEpFK29lMzZMWXM3NFFYNlVDNUtxTjBLK29IK21MNWRx?=
 =?utf-8?B?QU5mMmpZLy9XQ3NnY0wwbVlCQ01Eb3grRWVyTkdOTk1oQzRXWDZvbWZMZWwx?=
 =?utf-8?B?NzY4UGVFck1Ic3VOU0V1alQ5Qy9IdHQxS3FMQk01VXFwV1JPYWlFWno3UzYw?=
 =?utf-8?B?eVJkc1NPYkRhQlZNM3lDM3krOUNIQkxWL0tvTld5WHFxNU5hYXR0eVBsSm41?=
 =?utf-8?B?amkwcGUvN1FIN2laWjF2bER3VDYyMlFwQ2FmY1VXeFBzZDRHTnQzWU9RaWVO?=
 =?utf-8?B?VTFiZzZGU0g5WXU1VjdVNDFyTXVUM1NJTW1aRC9NQWRWRHFMUE9rU3Rtdlhw?=
 =?utf-8?B?RnVKcFFrRnNPOW5zUUVBN1NxU21GYmJpT09mMTVJKzY0elo1VS96Z0w4ZkZI?=
 =?utf-8?B?WnhZMFU2aU9yNlE2RFMya0NwYlYzLzk5bDV1bC9YZFp3ME14eWR2blM3cnJ6?=
 =?utf-8?B?UlBSVEp6eXBBZjJyM1FsZ2FKUW5JMVdGYkNhcm5xSmt5SXZGdHZJVjdEZ0Fp?=
 =?utf-8?B?YW56SlN2VnF4b1FiT2FPYW5seGFNVUE0K0F1Z3ZUYkRGaENES1Q4SVR5eTJO?=
 =?utf-8?B?UGkrS1kzaEduWVNwM2R2TzYzTmQ4aTkzR3ZMT21KenJlV1lPRzJaa1pEbGRk?=
 =?utf-8?B?eTBpS01ZMCtZM1BtaE9udVFZYWRmL0paNzkxT2JtZStHSy83ejJWRWlHUWtZ?=
 =?utf-8?B?MHdpUGZpRU00QUhpdXE3aFROVjJVUFBYYjU3blNZaFE3SGJNdUVjUThmSDlJ?=
 =?utf-8?B?cFVsajU1UnJ1TTNFMTlTd0ZMZ3hLQ2VNeDhUM3l1ZmdBczRZNkxibW5nQUdl?=
 =?utf-8?B?Y2pWaW5ZcnhxdWhWWThoa3hpNHZabThQOVFvVEcwQkRkek1ZMUkrdmowbXV5?=
 =?utf-8?B?cG96QUhiTHNNSWlKNy9UaFZ3emNuR1Vjakx6UFIrNEw1bTErKy84QlZuUWRz?=
 =?utf-8?B?YVVITXVQN21xQmVLU0xHNG5LdVB1cHprTXFrTy80bW83bDdCQ0tyVFI2eFJP?=
 =?utf-8?B?R3VNUEdoeUtxbmRRdGJWVTY3c2JnRkJsQXVXUThNQVdMNXRrWWpOVlhZYjgr?=
 =?utf-8?B?TGc3NFFmbHNoRkhXTHl0cmNyK0tFdjFTMXF4d0Z6NmhEU2piVDRCdWZsZlQ3?=
 =?utf-8?B?M2N1MWkxb0ZuRDUyRTRBQ0ZaQ0VoVHdtYllBT2FKNldyMnNCNDAvNFplYTZJ?=
 =?utf-8?B?OXBkUDZ6TVlCUVlTQWUxeEFHekUyR3lPM2R2L2duY3Y0UDJHZWhkRlo2cTZs?=
 =?utf-8?B?TlRnbnBPTFBSZGNpaHowT1BZNVZSczVxR0xlcUUzWERzNWZ6alBJT08rQkdX?=
 =?utf-8?B?TlZLRnAwQUw4cjVHUEJ2b1NzSjdDOVVyNThoZFRJUHp6WUNMMGVNUzJpcWFZ?=
 =?utf-8?B?SmZpVzJVd2N5VU53aWJWOHF2RTZ3ZGFKS3gveDlpY3Yxc1hyZmFFZmp3ZVpQ?=
 =?utf-8?B?OUlFN3ptRUNtNXJSUGNFdDJmNXl3bUJETitsVkEvemRwM0NWLy9yMmVkN1Uy?=
 =?utf-8?B?Y1UxanNpVmxGckpZTEZQM3l2bElzZlZzZHM1YXJmbUhzOGd5QjRvdCtyZUw0?=
 =?utf-8?B?d3NobDRLMzhOdys3S2wyb2o4YVViWEE0RjdsR1dsTlYwcDV2enZ1aW5DOHBW?=
 =?utf-8?B?SzRCcmc4MkZ6bXB0RGw3VmFaQjQ0bE4rRnZrMmtycHo5eDNYdGpyZGV3dGE0?=
 =?utf-8?B?U3dKd054WC8rdllUUVpQMlhjcmdCd0MwQlB1YXA5QjVUUVJSNWpoQm4vaDV4?=
 =?utf-8?B?dlBTQTh6ODZjekxZb2M0T0RocjBPQWZZcEFsOXMyc0JhTFpVYk5Wa21VNVBq?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57243fe6-6677-4d02-0955-08dcfcc487ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:33:40.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSVkPB3JeqkwPxQ9tHFCVMxhM0IVDFRBOS2myoO43MP/mdt356+Of6A1sVluzczPUEujyY0sAZKoNlJpB0WVIA/WFoKn5EZQyY3v3yGzrGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10034

Hi Frank,

On 01/11/2024 20:22, Frank Li wrote:
> On Fri, Nov 01, 2024 at 10:06:09AM +0200, Andrei Stefanescu wrote:
>> SIUL2 is now represented as an mfd device. Therefore, the old
>> pinctrl node is deprecated. Move the pinctrl related properties
>> inside the new "nxp-siul2" node. The latter one is now used
>> to represent the mfd device.
> 
> Generally, dt team want you to keep both for sometime to keep
> back compatiblity.

Just to make sure I understand correctly, I will keep the previous pinctrl
node and have both the new siul2 node and the old pinctrl one, right?

Best regards,
Andrei

> 
> Frank
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
>>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
>>  2 files changed, 24 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index fa054bfe7d5c..e14ce5503e1f 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -114,20 +114,18 @@ soc@0 {
>>  		#size-cells = <1>;
>>  		ranges = <0 0 0 0x80000000>;
>>
>> -		pinctrl: pinctrl@4009c240 {
>> -			compatible = "nxp,s32g2-siul2-pinctrl";
>> -				/* MSCR0-MSCR101 registers on siul2_0 */
>> -			reg = <0x4009c240 0x198>,
>> -				/* MSCR112-MSCR122 registers on siul2_1 */
>> -			      <0x44010400 0x2c>,
>> -				/* MSCR144-MSCR190 registers on siul2_1 */
>> -			      <0x44010480 0xbc>,
>> -				/* IMCR0-IMCR83 registers on siul2_0 */
>> -			      <0x4009ca40 0x150>,
>> -				/* IMCR119-IMCR397 registers on siul2_1 */
>> -			      <0x44010c1c 0x45c>,
>> -				/* IMCR430-IMCR495 registers on siul2_1 */
>> -			      <0x440110f8 0x108>;
>> +		siul2: siul2@4009c000 {
>> +			compatible = "nxp,s32g2-siul2";
>> +			reg = <0x4009c000 0x179c>,
>> +			      <0x44010000 0x17b0>;
>> +			reg-names = "siul20", "siul21";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
>> +			gpio-reserved-ranges = <102 10>, <123 21>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>>
>>  			jtag_pins: jtag-pins {
>>  				jtag-grp0 {
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> index b4226a9143c8..fa43d036686f 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -171,20 +171,18 @@ soc@0 {
>>  		#size-cells = <1>;
>>  		ranges = <0 0 0 0x80000000>;
>>
>> -		pinctrl: pinctrl@4009c240 {
>> -			compatible = "nxp,s32g2-siul2-pinctrl";
>> -				/* MSCR0-MSCR101 registers on siul2_0 */
>> -			reg = <0x4009c240 0x198>,
>> -				/* MSCR112-MSCR122 registers on siul2_1 */
>> -			      <0x44010400 0x2c>,
>> -				/* MSCR144-MSCR190 registers on siul2_1 */
>> -			      <0x44010480 0xbc>,
>> -				/* IMCR0-IMCR83 registers on siul2_0 */
>> -			      <0x4009ca40 0x150>,
>> -				/* IMCR119-IMCR397 registers on siul2_1 */
>> -			      <0x44010c1c 0x45c>,
>> -				/* IMCR430-IMCR495 registers on siul2_1 */
>> -			      <0x440110f8 0x108>;
>> +		siul2: siul2@4009c000 {
>> +			compatible = "nxp,s32g3-siul2";
>> +			reg = <0x4009c000 0x179c>,
>> +			      <0x44010000 0x17b0>;
>> +			reg-names = "siul20", "siul21";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
>> +			gpio-reserved-ranges = <102 10>, <123 21>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>>
>>  			jtag_pins: jtag-pins {
>>  				jtag-grp0 {
>> --
>> 2.45.2
>>


