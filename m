Return-Path: <linux-gpio+bounces-18107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD274A75E6D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 06:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B484D1889821
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 04:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3512157493;
	Mon, 31 Mar 2025 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RpeueVvr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC27E107;
	Mon, 31 Mar 2025 04:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743396958; cv=fail; b=Gjz1f77Y9R6erqmybCxKQk9mHH8FNgBxRZDv9AoMirGlLS9S3D3x45QAEgfANmnvhrto63GOZ2CMeUHBqJOOVrTEiIK2WClgF7htBrSO+OHJmzOnjA4TnJ1MqmOk/p8e/Bzsb7LBjIqrp4ErT3FYQkjZLzP6vnA1KuG7GlwQF6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743396958; c=relaxed/simple;
	bh=hTfmwdGQpDHykN8Je0KitbFe+1dkj/My/ewmR4NQmww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Thsz28kbWLcLfJu+mgDRKMErR10fX64vhIeZWGq7CetcX9YHfXzSQ2/aQPOTDtxOlweiE+VEd6OJVA4o6kLPc1/R/bhUjszuiOPowvcRD9N4NXXKNyhRT9htBWnVO4uyyjiEr72n1bX9FcaEGI+Rj7eQNdNcA8AizEZJ74ghQoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RpeueVvr; arc=fail smtp.client-ip=40.107.20.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHuDfs1Rll01gw02OgQM2taOjnzTftem0jaRYPQmqSmtrAgBG1HQU7EG0b7InQgT6yeok/bUhfKm8QHMFVnfJHrKN8o9ja8h5XqK5F+34Gk5H2q6WWezRgBxATDJsKjb1H4Hd8nUdZvtA1+kaAGABgFlJKMSHPnehBdooDUikTIKZTRXAccAG/1+LpJZu29+6AvWh7rKjdffSCnSjPAGW+EsEQJ2krp+aeL34i4yPxjMR1Yfd6I7Cs6jhjVEArFNWRpyCkBnS9gw3MHoiwjVMCk539FWE9OxpoOB6hGtdBFd841bROVOG8D/5s1pG2bJYOsM9Mup3jcmxxAsQfXOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57ENB+kdHyNvYIFOVv5sL1ZwdrdT2XpVAcnKrU22Xbg=;
 b=y5mytPdFvr4N5v4MafRJQp7YXFTWtL5PT3eQTTFLY1JPEoHvN6tCmv2UzKBJ6aN3BNPpgV07egbN78qYNgMs/gjLE/4sqNQJkfCo24ksnWpGttC/a62t4D/8nbgsUiMtYORJZJqanhUT1XvAcOWStwGgBGiM94Z5haPNYa/7sOfTdDG4RssNc1Sra8IRNWyvpZYmjliNdA7NyugGXZx50nHUv5BCxIqB/F9HrQMtoB9ubNv6HoZMmC9a3KgHK71DnkblIjl1VGhILuV/oWnHBnA577Out7hnD7fUtKPHFleeJnpPTvZZRXgKn2uOxRzdYKD9UYdPZ3xmlvKB+eTiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57ENB+kdHyNvYIFOVv5sL1ZwdrdT2XpVAcnKrU22Xbg=;
 b=RpeueVvrCc0dOQaKKw3bSZ0v5DlgctMmiDR4Ri70ys/iXhttGHMnSBBZqzIvNweGgyFZOKBGmXyjTd+ekkYCLEy23RKfne0GMqMl2KIY61fYL1nyjH4IpmRJN7lcLE+YoQDkkOJWWEDhJeL/573xPnVywhO7hLt2qZeE5Baf566M6bQFtG4xUsH6oCjbBG+bttxZYP7muLietmgLXo9FHsvoVxX8c+q5Lde1S5KRm11gQQqQ0pH9n0TTT3k/oXTZ/FghiS8U7R2UXc/19+w716Fxi/8/yJ9sdrDGS8aRUuki9updPvNRsJQU2WUHXrHbywY+yhe3AcHm3Auc2FeRew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10023.eurprd04.prod.outlook.com (2603:10a6:150:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Mon, 31 Mar
 2025 04:55:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 04:55:51 +0000
Date: Mon, 31 Mar 2025 14:03:59 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	krzk@kernel.org
Subject: Re: [PATCH]  ASoC: codec: ak5386: Convert to GPIO descriptors
Message-ID: <20250331060359.GA6762@nxa18884-linux>
References: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
 <Z-alF-gK5TpGliCj@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-alF-gK5TpGliCj@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: 114ddfe0-fc2b-4d5d-84cb-08dd70104f61
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0tNVW5KV3FtQlJ2NS9BL2J1aFBEVDBrcUk5aGZnTmJFVSs3cnBKVERwMlpX?=
 =?utf-8?B?cEpWR3d0dmllSlUyMHhQNjdJU2pzQ2V1VmM3RFRXQ1pTVWE1OHIvaGhvMzAy?=
 =?utf-8?B?ajVNKzlkcmpxQXU3YWZ0bVNVRTdSaWFtT21JY1RTM2h3NjFFRm43cFRyR1hQ?=
 =?utf-8?B?QS9SRlc4UTNQb3MrcEQrM3JCY3drVStIZGpnWGU3eDRKVHRtVzR0S2dmODBl?=
 =?utf-8?B?MzJYY0d4aXV2Z0l4SGNTMjhTSmROQisyODRIcDZJcUJycnlaZzZobzhwejVI?=
 =?utf-8?B?RDVXOW1BR1I5aGxrUEdiT1pZbE4zczR6ZVRtbGlqKzRFZDNIcW04MXYyR0JL?=
 =?utf-8?B?YVFHSG1Xcy9nV3lEcStLSnlSbHdHbndTbjdVY21XMzNjNzBZd09hQXFFWkhT?=
 =?utf-8?B?eUNWT29ZQllnNTE0VFltNDVUczNyUXVtMVlUTzgwUEJYMHZrSXcwbFFFZkE5?=
 =?utf-8?B?b3lHQXIrQUx1K1dKSHI3VmpRdVNRL2FJc295SW1WZmJmWlA0Qjl6MXBqaXBu?=
 =?utf-8?B?MmJxV21iZ0VMS1dBclczaDFLcVZNUHlsQnNSbkNBN0thS01GL3FaTllORFdO?=
 =?utf-8?B?WnVsRXVZNUlydXV1eXdLWFpUYVZiSG8reWd2OFJPZmJTMXp3L3g3SHhDS1M1?=
 =?utf-8?B?ZDFQMTNPcE5WSzFmbnBUM3RmbUtwOVRPc1lZMjVjcS9KWm5YZGtJKzdGUU8z?=
 =?utf-8?B?enVmVDlUU3lBYld6MTNqNlVSVk4wUE93bFJibnFxeVB4WEhZWXo0a002M1RH?=
 =?utf-8?B?d3dEWE9vQmhrZHZkejE3aWgxZUxCQVd3bzk3Mk41TktnaGNlWXFONHdJZ2tT?=
 =?utf-8?B?ckZkVFc2YVl5NTE5b2ZRbENyemRPeHlLdjc0WXVkYVZ1VXhzZjhkVC8rWWVR?=
 =?utf-8?B?OHVaQnNtQnB1dEdPckoxNlRnSVhIZkRmNXVOekRDK0NUZE1lUERQYk8yb3Fz?=
 =?utf-8?B?cGxlcUdUVnV5eVEwTlBpcnFra1haL3lCeDVTc1p4VjBiZzZOaWZ2ckhQdzRH?=
 =?utf-8?B?c2xVVjcrUFpOeHdZVUwxd0JlYXZCWVpWQ213cXUwWWIyaHlJakRZYW44SllK?=
 =?utf-8?B?VXZZZEtJMm52emxTTkx0VjZ3a3B3OTRjK2NhRFd6U3FLaTBNNlhvMXZRaWo1?=
 =?utf-8?B?cDJOZlk2bW9wZWhBN3cxR3ZvMEhtYkpIMmNtb3pHaXVWTm5MbDdZUk9CK2pF?=
 =?utf-8?B?Ny9jdXBrMUtFdWdOeGcrZTQweHAvbUYxQW9VRGhTSFhzczFIMUxHeUU0VUJU?=
 =?utf-8?B?TXp6a0dkWTVLKzlER01FSzFROS8wcTdHL1g5WFJOaVI0eURMVkluL0N1blJa?=
 =?utf-8?B?bGxxK2JzUlJ0bEZDUUlqb29McUNEcm56U1lnYWhnSDFMWTF1Q1U4WldWVTZY?=
 =?utf-8?B?NlJocE9JZXRZWjFCS0kxN3Q2d3RpVXF5eTBubEJYQW5vMEl5bjRKZlo1N1Za?=
 =?utf-8?B?bERDNzJBNEFLZnZoVjZWNkQ1QzlCS0ppZndHWXpxM0oxNWloUWdnRVZRdjNL?=
 =?utf-8?B?RDRGZ0IrZGhGeEtwWEhDSEZOWVdQVmYxam1zQmpYU1hHckptdHd2MjhKTW5h?=
 =?utf-8?B?TDJyMlgvcm8xT25GbHJmcFEzU2FGbjQ3b2h3bHZMQWlmSjRaWWxGTnJLZS9p?=
 =?utf-8?B?N2pNOHdQYW50WHR2YWdXRzlNMDdqNGxvTkwvRTFXdDg3M2gzdVNuWWoyZGEy?=
 =?utf-8?B?K2JEQ1ZKa3ZLSTJpeUZmY3ZIM2tlUWNSc1hyeGpCQmQ2aUpHa1cxNk13Q3or?=
 =?utf-8?B?RzdQaGMwQUREYUtiUTMvcitIbVoyZjZSWlhtMU1UQ2hnUkJQdXZsZTBlNTdw?=
 =?utf-8?B?YXJGcG9Ja0dJZjZqWDAzQkZFR1hZU1kxeURTbzM2aHRCcklMZm5wZzBVOEh2?=
 =?utf-8?B?ZjluMzNPQWpoNU5OT09jcG1iVSs0cUhDUnd2NXY3YzN0RG4yWjFDZ1VEM0pH?=
 =?utf-8?Q?R+i3KS5ZydVIkQ5AizImmZwlODzpoTl2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhBcXZTOHQ4L3Z5QUh3K1AzRGlweEMzQVpvNXI0YTIrS3RqejZ3MUZiU0Rt?=
 =?utf-8?B?bVRjZVlESmwreTdNVmNURGluMmhDWkNDMWs2emkvdGNGWnpvQkhzV0ZaSDlw?=
 =?utf-8?B?WHpFdEZDTjZaNHo2ZGg2U3AxUlJGYjlVV1crdE5pRENCSDV6MEVNN1IraENh?=
 =?utf-8?B?ZHVKR29WUUlRZDZTYUNWY2ZFdWVRbysrdnF6Snh5NFlnY2hsY0x4Y0tmRG5z?=
 =?utf-8?B?UDFBNWxlenpRNlYvUmlneXEwdkd1OVRJM3FRVFZhMThSdnI1WE1VQVJDWGU1?=
 =?utf-8?B?UURCM0RXN0lkWXhTYlhWVm1mNmZSMnhPNEc1OXROMkhOZTNZdjMwc0MyNisx?=
 =?utf-8?B?ZlR6ajcxSFE0b2YvUnY5cXNYcTMvNk5EbFpzcnhuQmhLdG5nZ211UzUxNmZF?=
 =?utf-8?B?UmV5R0ZzNzg0L2RON244WUZaeE1xVVdTVytjSWpTUGNMSUtZSHB4c0VORmlO?=
 =?utf-8?B?N2ZJanlwSGNJNmtaRnFtam5UZk5Md29lUFBLQmFsWW1ub0R2ZkU3Ly93aUNR?=
 =?utf-8?B?WXJsRDZZYWZSWjl0MGNvdXdBUFl6ekg0UnZiNU5RL08yOFpYd3RPWG95UjZN?=
 =?utf-8?B?S241c2MycmRVbzBQVnF6Y3pLV2VsNFlBdTBTaTdTa1ROLzRHbnQ1cGxrRE5F?=
 =?utf-8?B?R3ZvamhyNnhjeWJ3YlpoUm1WU0p1VjBVZ1FVTUNkMllQMDJmSktTWTlzSXFt?=
 =?utf-8?B?UVZFK1ZmZWVSSFRKQlNSOHhYVmlnS01SREtsSmRQeXExSXpzQWsxdkM5MXJ2?=
 =?utf-8?B?S3hqRnNlQktMMGNHaW0yMjhIZm1zcVUrU3VhUEpKbkdjQ2h4NnBvb0tGOC84?=
 =?utf-8?B?dkVLS21VbHhxRUYwU1B0cGtmakhjczJBaDFHNlF2Qys4MmYxbGdaOHo5RVpL?=
 =?utf-8?B?cjhyM0RCMEJhUWxYdHUyeHBZVnlid2JNWjhiOFAvK0dKQ2dnaXVweHJqU3ho?=
 =?utf-8?B?RHhwRGpXWHUzejdHL3RRNFlQWkp5NFVlNk05WmdUR1ZnS0FsMDdXdWxUemZ5?=
 =?utf-8?B?MG9WNDZBUXNIcGF1WWJ6V0hHbTdSN01kc00zZEtFa3JIWHgvSHE1K3lLYnUv?=
 =?utf-8?B?WWlQTUZwSUhzaXhBL2dSRTVTTUUrd0NkZW1ZVVlqKzVYMGNuSk1GUFhWL2U2?=
 =?utf-8?B?YlVJM1VnTjN0NjJ1R2NXNnN3OVBQZUw0OXErNEFiS3lPcmR1YkoxT0Fhd0NN?=
 =?utf-8?B?SkwrMUVhTllBMUN4REVXWUF4Q3NHWVhhclQwdy9BM3lFUE5BbTJ0QVd3Z3FK?=
 =?utf-8?B?Rjh0cjZXWGZRcS9HMHZJSVVHanh4R1p3VSsvMGMydXEwckFCdU45ZSsrZHpE?=
 =?utf-8?B?NmloSFlrM0t6L01IZFh0dGZSK2V5VDVzRENQTGdjeEl1SWZrT01hYmE3Ykhj?=
 =?utf-8?B?bGJvOHFDd1J5MWgrQ3EzcHNkUFBDQkZPaDRnK1VXUER4YXNrQk1OTjIvTDA5?=
 =?utf-8?B?OVpsQlAyYVVSM1FRZmZkRTVCNGswaVFlUzNkVjUxU3pjNkhaOEEzQ1pUbXc2?=
 =?utf-8?B?VlVaNnBTbldvNFZCaDJnWXprZTRyUXBsQW5nUGZhbkdSM01GUXE5UUJraEVk?=
 =?utf-8?B?aE9WemxpUjJqY0p0NUZzUVJrSmg4SXZVa0FDZUJlM2FiY2JMb0t6bUhhak1T?=
 =?utf-8?B?MWdRVEQ1YW1IWDl0UC9LV1pKdURIR2FwY2V2VE5EaUpDUnRQc29yREhMVWIx?=
 =?utf-8?B?R3pqTXRMajhpdElMb3lYcEkrTGt1L2d2cUp0eFRDYklONHBUeG1HOS9BWjdn?=
 =?utf-8?B?NXRjcitIQkJCRWRTL2pMajkwOXpiVEJTVjRUSXl1MTV0eXJTaW9YMzRTQXAz?=
 =?utf-8?B?cUtwNmtMS2txN1dzY2U0bkNaTWVRRkJWQXFtZ2Q2NFZLUXJPQVNXMXJQSUlj?=
 =?utf-8?B?TDJvakVSbjdqcmQ1YXhGM1pPTEtXTUcrQ1VidWJRRzlSSDEyM2hLUHZ1L1l3?=
 =?utf-8?B?MHhRYzJZYjdDTDdWVUdHMngrSGdTV0VaanZTRUhEc1FzU2lSSklZMmZ0c1JC?=
 =?utf-8?B?MVhKdUdtYVJTY0FRanNkV0d2WjdETFJ1dW1tVjRhRGxFdDU0M3RHWnNLWEJ3?=
 =?utf-8?B?b0hmVytzODUydDlVaTdvOEUySnJKc09ubUlKZFVIK0o5QzlIYmhwMUFuWm5j?=
 =?utf-8?Q?EFhIOlUqQ5O49MEqJzv3wUEML?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114ddfe0-fc2b-4d5d-84cb-08dd70104f61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 04:55:51.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VRQetL6cCsl0mdaWsy+3eGUhKFQ7Io5hYd3UWjd1rb4k533smgp+dAv5dBZWPGy458HaEnmEA3Ht1Z7UHMUkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10023

On Fri, Mar 28, 2025 at 03:33:11PM +0200, Andy Shevchenko wrote:
>On Fri, Mar 28, 2025 at 07:39:17PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>>  of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>>  - Use dev_gpiod_get_optional to get GPIO descriptor.
>
>devm
>
>>  - Use gpiod_set_value to configure output value.
>> 
>> With legacy of_gpio API, the driver set gpio value 1 to power up
>
>sets GPIO
>
>> AK5386, and set value 0 to power down.
>> Per datasheet for PDN(reset_gpio in the driver):
>>  Power Down & Reset Mode Pin
>>  “H”: Power up, “L”: Power down & Reset
>>  The AK5386 must be reset once upon power-up.
>> 
>> There is no in-tree DTS using this codec, and the dt-bindings not
>
>bindings does not
>
>> specify polarity. Per driver and datasheet, the gpio polarity should be
>
>GPIO
>
>> active-high which is to power up the codec. So using GPIOD_OUT_LOW
>> when get the GPIO descriptor matches GPIOF_OUT_INIT_LOW when using
>> of_gpio API.
>
>...
>
>>  The Documentation/devicetree/bindings/sound/ak5386.txt not specify
>>  polarity(this seems bug), so per code and datasheet, I think it
>>  should be active-high. I could add a quirk in gpiolib-of to force
>>  active-high or acitive-low if you think needed.
>
>I don't think we need a quirk as long as the default is the same,
>I mean if the DTS is written without setting polarity, would it be
>active-high or active-low?

Per current gpio driver, of_gpio_n_cells should at least be 2,
Not find any driver using 1 in current linux tree.

Without polarity, I think of_xlate will not work as expected.

Regards,
Peng

>
>...
>
>> +	if (priv->reset_gpio)
>
>Redundant as it duplicates the one in the below call.
>
>> +		gpiod_set_value(priv->reset_gpio, 1);
>
>...
>
>> +	if (priv->reset_gpio)
>
>Ditto.
>
>> +		gpiod_set_value(priv->reset_gpio, 0);
>
>...
>
>> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(priv->reset_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
>
>+ dev_printk.h // or even device.h, depending on the current code base
>+ err.h
>
>> +				     "Failed to get AK5386 reset GPIO\n");
>
>> +	gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>

