Return-Path: <linux-gpio+bounces-12518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC99BB354
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6C5283B98
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5351B81C1;
	Mon,  4 Nov 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YN1BrmVi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB911B81DC;
	Mon,  4 Nov 2024 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719537; cv=fail; b=T99vFgfR9KqaqflV4icWo/3oj74tfPrgxPIZWS6om9OH5xbKh2SCrPLeI1nfbdpHzEp32nN5ryF3sizuKW+SI0fzO1IvONenBvZ0vKaZU3JpQ44lZfjuCsPFO9Q6RLCQ8yDsGZs/fPugb0PZljs/irRvFlLRYVrvwRjpFrRV4eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719537; c=relaxed/simple;
	bh=t3X+hmdyupChYgDUyxk39+kDxfQNr2RqKp4Kvjhhmus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ajuDfVMPa0SfQ1ykyNkme/6r6LdzGi51TTpilFJoYzbaHq/f9scLIqEUTDCebKxCoK41dqWs8FKQ0aLrl71eJErVfwHMGEmRT80/UUuXHSpXblMlof9uxaUJw4VNY1MBf+I6X+BA5WzhbFZzqfT7Bgr4Gyh8tIAp2agetaYkku4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YN1BrmVi; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq2vwaEeA67E6Imqya3y+txq5Xuux5vW/0l7DdiORR3npqw/FWNLzNk1Ddz6Y1sy8wHCJf+/8GklYRYiTEMNrzcReuKk/Q/3xk9piPIED/QuC4cYZ1eX+1JIYR+Rlei4Tu+RRHduw4Z7ZJexuM43XRh3EimP12jf6GuCRviIC0W6MfGrA2auJyoeb2yv1iB3152hsZBog0go9EalX7AbInxPQ0F5tJzdpaAV+3YZaRY909druDL5QOqcrr5HfsH00gKZ/bGBsTkclSv+GUHOy4ZBaVDV4PSNlknX8aAKsYohVcjNRtPjRHB0j94PPnGb6iFZxNWpR4c2ggRin3yv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PybNwq3iWjC/PQKolVokNx9cIz0mgafE/31W9xWpNJ8=;
 b=YoP9A2ztssp79LQCXruf9ifnru61e1kKfv/xVjdwZzYTDDUjU2p7v2ge4E2UiUnLSVzpEpg9dZpn5ZxbRKnXxXeTQESJRN9Kylx6GURRn5Why6HN2dXvwF+uf9CujW4b7x7OUYN1AVbHni+MdkOtXbIHeKmkE5Y6BuyoUvo6aoJeo/0B79qFOD3PRxUFD2qlCOt9Zf/HPKjU0XQWcAtHQ/osrBkFc+VODBgEV2y7Au88agQtPrAOQUymulOWfnfLEDMxBSkE+6iKfBNLUvESVSA0H/iN8KpbpxRBvJAyHgsRm/O8WrnfY3mCpJOGR2r7J1846kGx+EnYNW6EDiwiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PybNwq3iWjC/PQKolVokNx9cIz0mgafE/31W9xWpNJ8=;
 b=YN1BrmVivRBDsRVUo7AzCwGCeEm+60cZmWZXSVT6zKb9VAkfKdHSca5PiMt/aMxciBNn8nngNJe84wWQ/zgRBiePw1kFN5dx1wMXpt5M8qdoGWxMVf5nUT4pc5+6tC4lIAWprjFGSmVtegq6uGyq7/WNGJo1Ph5UBGTPEpj5qglaBljwauifx4kczs99VA9iaBmoAONMnM2Ho1hy19tGfyBM0h46Y/TeSW4XpDYZd9MUnJgSMEf/hoQiRe3TmuTKYe1K9ruDwaMDbIav0dwxX1i+Plj5RofvT3LY223wmBLuZH53YEjoa6/iJmfXxBDt39aSt3VI1x//y+u9fKeezQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10799.eurprd04.prod.outlook.com (2603:10a6:150:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:25:30 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:25:30 +0000
Message-ID: <08a0a250-b1fc-422c-aada-fe3ed74cc0b9@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:25:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <48498f47-1601-432b-bde5-f487668d1e85@stanley.mountain>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <48498f47-1601-432b-bde5-f487668d1e85@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1faa8b-6520-459a-d32c-08dcfcc363c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFZYcjNJaGkvQnptcWNyR1JtbWI3eGo2MnJHUDJ2UndUNFY5U3k5R0s4VUpQ?=
 =?utf-8?B?WjR1YXQrZ2VwOTRIMW1IVlE2YVZsSnBmSmlVQ3pkMENMMGRWQXg5eEI1Q0pI?=
 =?utf-8?B?Y0FQOVZEaUJVNktCdUVRMFpqWGtYVzZheE5uaWJ6a1IvZjBnWmF3ekxsK0t0?=
 =?utf-8?B?eU81TkwvcnZuQmVsOFc1cGM0YlFUU1pSZkh0bFFBenAyd0xldUlhWUlDZktJ?=
 =?utf-8?B?OFFSYWZ1OThDVjNRR2JvblhkWDlNTVFIMjBtNGs5aVVqSDNiU2ZWVWxzZ2Ex?=
 =?utf-8?B?SFZWVWpQN0lqZmtCeElWTWp5dzBsaWhYeTZCQmNtZ0FXZmVWMFFWcEo2MG0y?=
 =?utf-8?B?YWRSeDloOUV5VSsvM0kxYi9TWHNSMGpEMDRITDRIQ0ltdEpVamxlbVpzK3JC?=
 =?utf-8?B?R3VQUW5HbkhwL1hVZm01VEh2ZWZvMHdMMzhZWkdQZEpacWRQU1A5dCswTGEv?=
 =?utf-8?B?aTFNcitnUFBDM2R3bU5sdXh6OWJXcmVnNk9uTXg1N1c4L2RSK1p4VWxzVEV1?=
 =?utf-8?B?VUpEdU8ya2lWQXliaUhkQlYvTGdaSGxmYTZwSGlBcmh0Q3B5UnlLN1A3WXN1?=
 =?utf-8?B?eW0vaDFhY3FwVVpidjhCeXQ4ZWplSDhucElyTVlRM3laRmU2ZGdWQ1NsVEJa?=
 =?utf-8?B?V0p4cEJqb2kxUEZBNnRrblpKelVGbG1PUmc5VVQ5S3pDNHJkTU1nTHFFQnJ4?=
 =?utf-8?B?Mmh1cTRUcTlLMzJndDJ6N0YvQ05qNzY1V2JWRFVxeU1veFJSUjk4Smd1cXla?=
 =?utf-8?B?RTJrMUZnTElOYnJEUFUvb3JjZG1NU3Y3bktZWWVnakdZRW1ibjNCVlQ0YWVO?=
 =?utf-8?B?bW41VXorRWVMVElTY1VNaEZDR2VIWGRKSlBhblFiM0FSd3RuT0hYazdOYUNL?=
 =?utf-8?B?OVM1UTFoRTZmeU5XelRnRkNOOGJpdFlDZXhzK2RFcHVnNDlZUjRSR2kxYzB3?=
 =?utf-8?B?bjU5OEwrM0dRWm5nY0tpK2dPTXo5K1JiUUFnQnRGd3NzeVZRaE9uM3BPampn?=
 =?utf-8?B?MFZKYnk4cVMvUENMbDAvRHQyRm8xeXlEUDVRRUVPeDlPUjUxUmNKWVFoV1dF?=
 =?utf-8?B?NGNoNlJRcjhIVFY5RmF4Nkc2VG1KUTBYcnBZODhtYURxUGNUeDlzUWpGcThQ?=
 =?utf-8?B?SnZzV3JVM1NPUGdZRUgxeWlvY0lGR0hDQW9VdEltSHBsOUV2UXVsTjhZRWov?=
 =?utf-8?B?WGNWQ09Wd29EUGJBU2VUbGZNTFNYYnJQZnhuWFFwNGwvL1drYmc4VVdiTy82?=
 =?utf-8?B?bmdMcHZNRlh4d3VJTThCby9NZGYwQytXQmtuc3RaY0NFZWZnT0RXZmJWTGNX?=
 =?utf-8?B?ZlhrazFBR2lkS2UvS2RtWHEzY05pQ2FaQXZ6Ym81ZGZNQkR3bnNzT3VaZFpx?=
 =?utf-8?B?VFFsUDE4QmNsc0ZRZ0VocG1YcWg3K2xCdjhzb0d0RE94M0plN0NMNlkyYm84?=
 =?utf-8?B?Uzk4NmlZVFk4cXhrV0d3THAvTG1BbXJkcGFLS2lzTEllbWlDbDlLR1ZsRGMv?=
 =?utf-8?B?Qk4vSFZvMFhFb1grNEVZdVlPZ2o1dG51ZVNuZC9KSlVQWlovNytRWEU4Kzcy?=
 =?utf-8?B?RmdLVjZLakQ5WXltQ2JLekhUWHdnSDVKalRkQnYrOTJQaVRRelo0Y0xDcjVi?=
 =?utf-8?B?L3AycG16WVNGM0t3UXFXeVpxK1pKVTNRYU1wdy9INjhLR1FvdEp3Ui96RTNR?=
 =?utf-8?B?aUxwaDdDOTNhQk5BN2xmeXBMeSs4WEM3Ni8weEl2dGlqdm1iTTg5bE56Zmc0?=
 =?utf-8?B?ZERXcHlielRMZThPUlY0M3dGMEVTMzBJVDh1ZFJPN2J4K05ZeElhL0dLMFU3?=
 =?utf-8?Q?0AuH4mYlsBBC5jsFR7RcwbXGqP2Mr0Ni4GmvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmthVk5RbktRK3dSRU9WdFlld0RFYmxodTAxaHFSUVRLY0gxUy93REwwTUtw?=
 =?utf-8?B?VHZxcmJTaGxFaHZaWG1NcDlOQ2ViMUhjeDdEVW54eS9sWDFOeVJGbnpXVXFk?=
 =?utf-8?B?MGZGVGFBZDhLeU9nN1N1emppWkNrclVoMytzTDFLM242U0prSnFoTFdQR2pX?=
 =?utf-8?B?cnpTMmJlMVNhNzBvdXV2Z1RDMm00Y2lwYkZiMUMvbmpTajlyanFDd1NnRHAz?=
 =?utf-8?B?S3lhRXc5eDhVdE5ENjBNc0g4aXVOc2h3ZVoxY3ZGcEZteTRlY2pkWUhYTy85?=
 =?utf-8?B?SDBJQlZjR2Y2d0ZqWHhha1JIMDJUU1RLQzFrM0NJeVRRMzlNTzVOd3ZkQm85?=
 =?utf-8?B?cXd1N0laS3NVcVVsZjJ0WGNsRlF1dzR0RkVGNTFPN2h1Y0tiREZGRVlMeE5L?=
 =?utf-8?B?YzRWUVRGMVpFUzVOdG5uZGx0bE5DL2NsSURaWTJITzdqeTk5b3hwMTVQcko2?=
 =?utf-8?B?QVZSRjgxUTlXcm55bnd2VXBaditsN0UxYWNUN0JlajZlZ1lZOEEyY2RaakpF?=
 =?utf-8?B?RkRCdldpdCt1Wk1HeHVGc0FLWERwMFdmanZ6K0V0TEt4N05PTEh1T2FZUG1N?=
 =?utf-8?B?eGQveXQzWEdONEZkcjBJZ0VnMlFzV2xGSmxNZWZRTmZSS2R6aUVmcW1mTEZa?=
 =?utf-8?B?WUpJY2VLSGpjZU1wRjVmTkRXbW9wSkRaZHZOcmJhUWhrd01pYmJmeUc2NUNz?=
 =?utf-8?B?Mk9DRzhGbEUzZ0swazk1YXRjbHNkK2JkV0krR2krTVhzcjRkSXlSVmlRL0Nr?=
 =?utf-8?B?WjRHcFNnNGU1bXFPVWhrU3JRTUt6allNeEVYV0cwL1NuVzZxZzlBK3piRDk5?=
 =?utf-8?B?NFB3STlzWlNQd0lBZk1RNllkWmtNeU01TFkzL1lUMjM2QXZhQnc4OFZvcjNI?=
 =?utf-8?B?ZElmcXpCWUc2U2tmMzV2QU5EaUhMOTNKTjFxS3pYM2NNMlJCdk5SZ1BkTlBX?=
 =?utf-8?B?YWovQ09sOTh5bWpNRnFBd05LYy9GVmF4aGZQRGU1UC9ZZFJLWnN1YTVaL0lS?=
 =?utf-8?B?eXpOYUtadXJvbDVDSkVSVlh2c2V5alVxTkpwcHFSd1VTK2pkVjBTa0NIY3pS?=
 =?utf-8?B?NFJoZnVrU2ZucTE1VEFBWHVQOUhuUTU1VWROS09uRTMvUjk2WFRnamkzVW8z?=
 =?utf-8?B?KzVScE4weEZZbEcveURqaFZlVEdhM29CTEQyejJMUEVmcDZvaTVZOFFoSDg5?=
 =?utf-8?B?d05NN0R5UkcwenlPa1hBY0xtOHlyekVub3FqZmdUeUMxWjYxcXFUZ1VFOXhZ?=
 =?utf-8?B?ZXlPcmNLeW16NjBkbVVZWEoxTktSODQzcVJtb1l3bFAvbFdPelpxdXJkU1FW?=
 =?utf-8?B?bkoxY2xpMXhjN1BuYzRESVRqMjBUZ05ENElLZWQzeVFBcHI4Q1N0ZlhvOTFF?=
 =?utf-8?B?VThLbUZLWGk2eFN4bU5VaDNsTnc2Y1hDM1EwYld4UzlnUHF0azhnaGtNb0Va?=
 =?utf-8?B?ZHE4cldjN0tXclpjWkFnRTNTL09RUW53UTVVVlUrZUdjWnh6WHMzRW10c2E5?=
 =?utf-8?B?OTdDWS8vdXZaTXlKSitYOXMzcUxqVXdqeURqQk9XWlpoQnQyaFBDRkVJRitD?=
 =?utf-8?B?QlJBTVIvYUl2ZDdRRFB3MFpxVlN2Z2orYlBBbEFQR05TcFJyeUp0SlBFYk4z?=
 =?utf-8?B?YWFicmdvd1A0b2M1RWNQQnB2MjQzNGVKZ0lYQmdyaTY4ZURaUTVQMmt3K3FE?=
 =?utf-8?B?UVVkakhlcjQ1eFdzRmtuR1hWMXNUSkVLSk96dkFmR2MzVVludEs2MElWaXV2?=
 =?utf-8?B?MVNYRHR2VklNbmZOUHg4SDZrSzIyK2xuSDZKVTJHWGJTaFM0Zk8yUzdqOXpm?=
 =?utf-8?B?TEFkNHY4QXRzOHRRQmVxU2tpZ2VlWENRTldaYStJdUhDeSt2Y29CV3FqaG1x?=
 =?utf-8?B?U0dEbGxjaGVJRWdXREw5QjR4TUZOZ0R5R3ZINUZJUlFkaTZMYWlib2IveU03?=
 =?utf-8?B?Vyt2eDZCRHh5cFV4MUdOOGxiaU5KQWg5Y2l4YTVrT3cxQ3VmbENpbmIrWE1B?=
 =?utf-8?B?NUkrSkEzQkdjZE5MT2MvRDJTTEJBQUtWTGtnV1BRV3FJNVdpMDc5YmF1bXZl?=
 =?utf-8?B?VVJ3Tis3eTJDSDBmcnQ3azRWWUJkNUVYK24vSFczOHdhUW9OeThrTStENVpY?=
 =?utf-8?B?dDZoRUhqNHVyeS9TNEpGNU05MjdiY1ozcWd0dy9tSjd2TzYwWFNBU2hvVnJv?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1faa8b-6520-459a-d32c-08dcfcc363c2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:25:30.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll/UNKbOK/u55UVQiZVx+Ca9Oqm2L8tuCcaf/UyE3Jl6QD85hQW/WAKYCk+Jhnz5EM34tjK4o5ZXfQ0HRM5T0wWJ+NIrNwNMcjK+yYsYjf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10799

Hi Dan,

On 02/11/2024 10:37, Dan Carpenter wrote:
> Hi Andrei,
> 
> kernel test robot noticed the following build warnings:

Thank you very much! I will fix this and all of the other kernel
test robot errors in v6.

Best regards,
Andrei

