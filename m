Return-Path: <linux-gpio+bounces-30896-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF4CH5kjcmnhdgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30896-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:18:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27585672A3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 14:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A491780057
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 12:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2538D2C235D;
	Thu, 22 Jan 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C4TYusI8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2272C0278;
	Thu, 22 Jan 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085952; cv=fail; b=H29mfVf+JELBOeLx2nU+vp4TZR8B1Q/kHs6SqUiSKq3aOIE1ynp8pirUZYrAHrpfjV8xkNYTork8IRhe1QpEEt6WziLCwmI67e9qJZCDPaklh6L6usbk227j0qpQbYb6kyXDtzRCuth+sfHNmohF/axCduHX+J5U5pv9iuK0iM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085952; c=relaxed/simple;
	bh=RC9GJGcgvo3675ocb1b4OF+UPdiRXkclGcwklx5Fljk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KkWxOjKpi0tN4FFZq3ujLzWgf6UlaPVqZ3Wu6rK/Sr7mTQp8Bh+rTgbofbeUxoNwHkgpXu/0rXHuKXZiMxkWkYdrse0AGOlP7NB+dVp4BVuazYsM3dDRPNyfAF27YGAx8u3dgigvPDwkzXpKtX0pT1WhOlTZCRPdn11MbzzcEAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C4TYusI8; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJSP9xzNWllkYjK2Jf7Pq7vmkpKn+4ZZOkb2VdXVSFmFmWrhewmahbsjXTXECEcCrK9gEEQKhTWwIANANcpYD0wvFpqTl+55Njiq7w2Pd+BgymP8pgrIUaSY+3w9jjuJTnqkiuyLE7H84CRRFzLYUSsEMzwJt7VpWkGaE9xAiub06/ZvQ0mXvln8T8v29siiTmDrUFB+aDcU+qYKkrWf6gBNT6dAxJ75OI97lhM/DKhLHlS/Lf1yQlaN8zCkIGyX4Hls1mcmY4iYCZSxb7hSdiV3zddar024XnSHm0jcAbAKhpR6UY1e/N4sJ7KO0Z9aoQdq2a4R9J5lTEFLvZCrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRsvm1/cmkGtxBcC+WsFWHOfxz8uliGY5KJS9b8OJ1I=;
 b=e+9bxCFuppR/2ZYmHP6oP52BhDlS4qaDUpzt4dpDPwrrO1t0tu/sBL+5iNhOQUvTg58NbfV3GhJAfgDIOXcR0o4DwrdVAn1THjk5m/vA5oqZk8dcFNGgWjxys0ruI5Xa+7u2VrPXa8bydOnL9O6EHa0yMnwJhN6OLZX1EBkJ6Pk0HBgzG2UvtmZipaWd2yqjdYwoTgOCPuGoNe7XTm9Qa7JHMjqI6ciYUb56ma814XvFFjLplVtjFxfx9jFwHi+C2h9rHq1E8pCnEAdOHq5uEwlh5I84Ja8H1BYMPXTfdiQNMgciMlFXSn10+NWv4vDbLRkYMo/IoNVwK/+zqwaNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRsvm1/cmkGtxBcC+WsFWHOfxz8uliGY5KJS9b8OJ1I=;
 b=C4TYusI85xMUJ00TT97rR3QFoRKa2o2Kd30lN8Q+c/qHaeYBMkVk4M+LLUFPlT8dfYq2wA+m50zVFqQDf1antMpBUsNhMzXLwNhq739v/t9PHIh/0kOcWAaxoxaUjTikanvl2cQ5I64Q8ssU6oEAqMeK7RgDzc1weim/Wg1Bw7DX1IPebj96MpT87cKS6HvpoquRZwed7apLqUYi9L+vU87q7pvqUGnhPbViLD2gXgq5VsZ603iJ7RzX1ZYgUdPecOsedrJwFszS6c5tbZhoA55aWkW7mw1k84TkeVgPomhfyYLXUh6Ob4Lxp4qwvuGwQarPq6S+I0jgES2t8+ejlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:45:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:45:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Jan 2026 20:44:59 +0800
Subject: [PATCH 3/4] ASoC: pxa2xx-ac97: Remove platform_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
In-Reply-To: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f17043a-1b5e-4c81-08fa-08de59b428c8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEdwdVpocWF1YnhFRFdHQkcwQUZLS1FxK3pIY0x5TW1JM1lxZytUWXNtL3dq?=
 =?utf-8?B?T2ZuMkNGTnZCRTM4UkNKakhzbWJud3hDcytURWVFQ2toSFJHelVXV0ZBek5J?=
 =?utf-8?B?c3kwMEZNMzJ2Yk94cHovYnBMSXRpSUhRcU1XNklqeGN4YXVkS2JKMjc3RDFQ?=
 =?utf-8?B?Nkw3U2xDdmVkanc3RlQ3Q3VzTHFteVptaW4vMEVGeEF4NUlRMk1qNjNBWHBQ?=
 =?utf-8?B?ZXJGN3NhVStRdE11TURKTnkyRDVEdC8zSkFnellZcFh1UFI5VmNlSnhmYkY3?=
 =?utf-8?B?Si9uYzRrS3lBZTJ2MGRvWWl2Ly8zT2FZR3FNQm5iR0tFeEhxQ1BYOVhhQzhN?=
 =?utf-8?B?SElYWTVad3Y0blZjWkFUNUJ1UmlIWHRwVlplcE9xNzJDZ2xKK3dLbFhTNTlv?=
 =?utf-8?B?cEFjL0lWQ01IQlEzYTBEUVhuelVzU0RSZFdneUVMSmFHbk9IaTJBWUFsNStO?=
 =?utf-8?B?ZmtwaWF5MER4R2VvMVFhaFhGejdUOHlrM3pIRWVXRm8vWC9ObExGV1UvOTBv?=
 =?utf-8?B?K29XdStkTDM0QWc2SmF0QVhDek4rNlFTSzFXWHozTnZZU29Qbms1RHN0OGJ6?=
 =?utf-8?B?SnBNcWlxV1RrQkIySyt5anlXblZwTHExYUxYaHQzTlB2THN4anF4Qm9kM1Y2?=
 =?utf-8?B?YXdONmgwZVhTMlFzNG10THRKUUJNdGx4NTNyMVpHdlBoS2swdDFDNTJ3bWpk?=
 =?utf-8?B?dm5BeEN4Qmk1bEdKL1I1RVZTL0M1dHJ4MUtRTHpic0VNSUJkRStxc3EzeFlw?=
 =?utf-8?B?UEt3QWQ4bzQ0akExZzd4bkFKTUN3cTJkaWd4Zk1NZEQwUDF3ODJpNk9qTXBX?=
 =?utf-8?B?ZGRYMXVwSGxNakN4alNhZkFlRlFXalpEU0hJWEc3YzhvS0NlWU1JU1lGUkd4?=
 =?utf-8?B?VC9GcTkrRUVZblk2VEcvWVZ4Ti85QjNvU1FBNlVQRUdFVmxObDRWK21QN2Z6?=
 =?utf-8?B?bEVnMjJURzlKNGtjUm9YNE53VU5CdnBISTI0NHpqSTRaUXV5dmlidWlPOS90?=
 =?utf-8?B?aHpVS3d2MDQ3ZzA4ODhxa3hsWW9yWTFkOHRBK284bGN0aUgzM1p2TkRHZEE2?=
 =?utf-8?B?MGR0TWttcXBBMDZlaXpZUmN6S2RKcXViRWxBOUFMQnorMGIwb0M2SzJBRmpO?=
 =?utf-8?B?Qm1EZ3B0ck5hYVVoMURhdGJTOGtYUjhJM3NqYjc5TG9qeElIWTA0S1A4VWV4?=
 =?utf-8?B?ZE1FOEJLOEs2U1RYWGk1THRsRG82RzJhVE1lb1RxVEx6U0o3enM1MkxVU0g3?=
 =?utf-8?B?ZGxFc0pJbWo3cmpLRWxCaWQ1TGFHMlpaTUM4WTV5V1NiYlUyU3hiYU1QMm9Z?=
 =?utf-8?B?aGN3NU9xVGpJcy96THo4czVxc2E0aXhKc0VhTnlsM0Z2MW9HWTJ6TEVVNUlR?=
 =?utf-8?B?VTNKSVp5YWhPT1BYK2lhQXBaNTZ2SVBxRXozUm9PWngyWHFHWWxqUWNJSS9J?=
 =?utf-8?B?bnVJYzdWL09tdXg5NjlKVGs5RGE4TGdDb3ZEbmtoSXdFVlllNVplU0NPNWFk?=
 =?utf-8?B?WVlFamhOYis0UmtOUkpwcTlIc0UwNy80K1lqUDFxM3l2MmwzVmxYdHJmcVZX?=
 =?utf-8?B?b0FaVDYweHFTL3JLbEtTQzBvR2NXazNUTlZTNUwraU4zM3Z4UysxRStmMmh3?=
 =?utf-8?B?bFI4Rmp2UXh5TEpDTEFHY3p3VHlhb2o5QlJQQW1LMnRwdUJoQ3dSWFp1c2xF?=
 =?utf-8?B?K1Fmek8zNjVPby90OVZITVVoSlBIZUdLdVBzVnIrKzVoUjB0TkI3dzdTcDQ3?=
 =?utf-8?B?VXQ1WXUrTWQyc0VSKzNJSVRVVWRDV25VMnRQWTE5bFZYbXV3Z0FHaE1wRXBY?=
 =?utf-8?B?THBaUCtpUHdLMUw1UDAzYk1zT0Zack91NUI3aDBzVHp5Skk5TUgwc2NITnFO?=
 =?utf-8?B?VzBTWjhudXR4bG1OeGNGQmxxZGNxT2RGREpSdmlBVVdIc2tHU3pIU0g5c1gx?=
 =?utf-8?B?WU9KYThHa2R6ek5CMy9NaGtJSHNJN1BWajllRDZJRkNjRHRlUjNBbG5GelF0?=
 =?utf-8?B?MWxldE0vdzlYMGppaUE2a2Z5RVU3RERPMno2aFNSMU1KT2ErdXdkSVZvSVBt?=
 =?utf-8?B?RjM5SnhsZjBqUlY0d1FQbk1BS0dReXc1ZWUvZUNuOW5hWTZ1SmhQQzVpZE13?=
 =?utf-8?B?NHRsTEtZRU4vUkhueHdWSFhWOG1WR2hoNzZPVkdxS0NSVHRsZG04ZkJTMEpk?=
 =?utf-8?B?VVRUNklTaEdDOGgyMXlYUjBQd29VQkxhZ0daUWEzNFUvN1JDUTE1Sit5eXFT?=
 =?utf-8?B?S2Z2Z0pnTGJHTUNTdmVYVjh0aUlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDBlbVlHT3pDdkxBeW9FTGs3RXpvdDJmaVhPSExFUHI5Z3VsdWhNNXovbU0y?=
 =?utf-8?B?STE5d3lzdnJ2aWJDKzU4czRTNU5YUEtUQVF2REMxNGgrUGtWSDA5b0pURTV1?=
 =?utf-8?B?Q09RNE9Va0RwaFB6c3VqR0R0WXVuUjg1Qko5c014TldNMWZvSVJVSWxnbXp4?=
 =?utf-8?B?NGN3UDhobG9la0VTajNKVjRGbmp6N3gvTlJIaDBielg1RkNNa2xLclhabzhu?=
 =?utf-8?B?SkFidi9OUzZKT0k4VklySGQyQ3dBRExMY2NwdCtsNlI1RHltRjVTM2xkYWZC?=
 =?utf-8?B?cThidng0ejBTUUwzNjdvMk5kVkwwWUJ5R3VKc2Q1V0VWZ1VuNUFPcEVpNGp3?=
 =?utf-8?B?Yy9WZWdZQW5IZGNNUGV2LzRnVmZWR20xSnZteWRYUzFBZHJySEVJNktTV2dY?=
 =?utf-8?B?a0cvbFlTOUZhMDcvN1AxSlZHeUU4bnRQWFVWUEd2ZjI0RlBUZ2I1KzlCSlgx?=
 =?utf-8?B?QU1OTVU1Rk9EWE5jTnVkcEk2NUxnM1NJcXZ0Tkg1WUdIUVI5Q2x5aERQaEov?=
 =?utf-8?B?T3I0RnNJWE03V0dOWUs3dXorWkhnaE9UcHcxK21FZ2ZRbkVkL1FMNitiUGMx?=
 =?utf-8?B?OHVwak5wVW9zVW5ndTN6Um5HUnpaR0U4STBDTld5VHBzUmhFK1liR3hVWFZv?=
 =?utf-8?B?VlRVQUc0YnFOWWtHZXhod1ZQeU1HSHh5aG1MOS9ya3djWEFVeUFocnd1ZnVm?=
 =?utf-8?B?MXpleGEyc3pjTytJemNNZ0tRelBlY3hOd2V6RE11bGl3VjJiMTNDUTJoMGxq?=
 =?utf-8?B?NnU3U0VaTEV0VS9oME5jekkyZFpPeVBMKzg4NkV6TUdlbnBrVTAwNE82REJE?=
 =?utf-8?B?TnV5NU1lZTBtdzRvTW1hb1pKTEJSdHhJTkFMR0ZTUUt1NGhueG5kWWRYR0d2?=
 =?utf-8?B?bEY1aE9kRmtKTUFyak52WE9zVjk4UTVsM2ZsY1lFZ29teTRpeXZtNEJpTC80?=
 =?utf-8?B?VnVVV1NzOEFodG5GRjlObkRyblRoY2tYNWRTbC83UHM2Z1hVV24rUHFFeC9r?=
 =?utf-8?B?VEdqQXpRTXJzK2F4TFhOaFBoT1g4eXRvNTRScDdtUklyMzFMVFpyN3lUejR6?=
 =?utf-8?B?aXhzeXJiYUd5TmYxRmdwbnBjdlN6cE9sdnFHSkhIeE9abVYxOTRkcXVHdVd5?=
 =?utf-8?B?Z1lQOVFCM3ljVXFvcE13ZGF2Y2hYMGNFWExDaUlJSUI3R2VoWkJTN1RiMEFO?=
 =?utf-8?B?ZnlhN2x0Tjd3a1NVVVlwZDJWN2o4eEkvUXZwWGRRRXQzMWNtVVo0K0tTZVpR?=
 =?utf-8?B?K3JodGJJN2hNV0o1ZllxVmhiQzJmNXg3dXBZUTlkTWUwU3NzVjdsdGNsSVA2?=
 =?utf-8?B?RTQycGYwUytSZm1hQnZtZHdxU0FZOHhuamQ1ZHpUQU1NZklhN1QvS0hUQUkx?=
 =?utf-8?B?amU5UlhPQkZtWmtkQ3NjdmJjMEpjS2dHVXRnY3NMRzlaektKbTNwdUFrZjRW?=
 =?utf-8?B?N1pFQ0F4U3RENmIzVHNsZFNwTkdYcDlKYTZIaSt0ZTJwVzZxUW5nZStOSng1?=
 =?utf-8?B?RVl6akFPa242SUNYak5tN28raW4wc0JIWG9JdDhRKzFwQ2lYbmRqNER3UEN3?=
 =?utf-8?B?S1NDR29qQUZEQWJPcFUzWGM5R0xRdk96Ty9rb1NpNkpweUJqWEoweUthSnFZ?=
 =?utf-8?B?MFpHQ1hVNVZta1FOc0s1Rno5c0pBbEVabjBrbGw4NUpLTXJ6Mk5GdVM0RkQr?=
 =?utf-8?B?QUt2RjVZMjljOGV3QkI4ODgvZXAzay91SWduUjVQNWhhdWE5VlYvSmt4MGN2?=
 =?utf-8?B?NENHU1ZBQ20zeW1OWHVRNWh3UE9NTm5Qd2lpVTNaZE5udVZMNXlxWFIxeGlX?=
 =?utf-8?B?SW00QUZMNklFakVKYnZxajdxSEN3MnFLZkNTeUxwWkF4ZEgvNVVjenUzdmZ2?=
 =?utf-8?B?Y2NrUnhWSWRkQXpteXduaDdsTGcvQWpQM3dhdlUvOElSY1pPV1pTVk5ja0gv?=
 =?utf-8?B?blpOdTZXYys4YSszeDVyRUFQbGh0eEppSXVVRDdSTHFhRUg2TjZHcDZLU0VM?=
 =?utf-8?B?M2Jyd2lWbndDL1Fpbk9HR3RmQ2V3UkRkcktvSFB2ZVYycU02TG5CU2RDbE5Z?=
 =?utf-8?B?YVoyazQ0V3lNaUptallqR2g4K25mU0JNY1lHSEVmMkZNaWdiTkZzTC9KYjkv?=
 =?utf-8?B?d2FCSVRTV2Njd1BCa1F3ZWwyWnh5dmdUeVFUTTZPZ3lOUHZ3YnI1cXVGbG9q?=
 =?utf-8?B?SXZxay9mc1dCbDRrZjk5Z1o2VnRQKzdWbnBCNlNSdHpDWWt0VExPN0h6M0d2?=
 =?utf-8?B?aTcwRDRudWhjamx3dFU4b3RBNFdUbXJkL3BjVGdXMkdEZVhsSEpSdFlZMENC?=
 =?utf-8?B?TUswOEorZDZSRHB1TzFTbnVucmVvclZ3a3dnaElYZzNFeTRlY2F6dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f17043a-1b5e-4c81-08fa-08de59b428c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:45:45.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR1l1qcejWD8tHejXk35YFSg/uC+H4/1oQwfmTHxluNv71ofXDi8dz5HAfqGOyXdzSro1bC7nQNxB9wN9Px9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30896-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 27585672A3
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
has been no in-tree user to create the device with platform data. So remove
them.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/arm/pxa2xx-ac97-lib.c | 33 ++++++---------------------------
 sound/soc/pxa/pxa2xx-ac97.c |  5 +----
 2 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 64510318091f4a6700dfab67479cc1465c545294..0a28e44118c5253054370b6d8117d8b61fa257fd 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -321,7 +321,6 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 {
 	int ret;
 	int irq;
-	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
 
 	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(ac97_reg_base)) {
@@ -329,32 +328,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		return PTR_ERR(ac97_reg_base);
 	}
 
-	if (pdata) {
-		switch (pdata->reset_gpio) {
-		case 95:
-		case 113:
-			reset_gpio = pdata->reset_gpio;
-			break;
-		case 0:
-			reset_gpio = 113;
-			break;
-		case -1:
-			break;
-		default:
-			dev_err(&dev->dev, "Invalid reset GPIO %d\n",
-				pdata->reset_gpio);
-		}
-	} else if (!pdata && dev->dev.of_node) {
-		pdata = devm_kzalloc(&dev->dev, sizeof(*pdata), GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-		pdata->reset_gpio = of_get_named_gpio(dev->dev.of_node,
-						      "reset-gpios", 0);
-		if (pdata->reset_gpio == -ENOENT)
-			pdata->reset_gpio = -1;
-		else if (pdata->reset_gpio < 0)
-			return pdata->reset_gpio;
-		reset_gpio = pdata->reset_gpio;
+	if (dev->dev.of_node) {
+		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
+		if (reset_gpio == -ENOENT)
+			reset_gpio = -1;
+		else if (reset_gpio < 0)
+			return reset_gpio;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 78f50032afc5d93acf8945793cd589bc5bf2f862..109a4958d9c04c6b027d89524ee3493d98330c1a 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -222,9 +222,7 @@ static int pxa2xx_ac97_dev_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct ac97_controller *ctrl;
-	pxa2xx_audio_ops_t *pdata = pdev->dev.platform_data;
 	struct resource *regs;
-	void **codecs_pdata;
 
 	if (pdev->id != -1) {
 		dev_err(&pdev->dev, "PXA2xx has only one AC97 port.\n");
@@ -247,10 +245,9 @@ static int pxa2xx_ac97_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	codecs_pdata = pdata ? pdata->codec_pdata : NULL;
 	ctrl = snd_ac97_controller_register(&pxa2xx_ac97_ops, &pdev->dev,
 					    AC97_SLOTS_AVAILABLE_ALL,
-					    codecs_pdata);
+					    NULL);
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 

-- 
2.37.1


