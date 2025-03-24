Return-Path: <linux-gpio+bounces-17905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BE1A6D639
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B979E3AFB4B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341CE25D213;
	Mon, 24 Mar 2025 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OOFNCDDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39752D7BF;
	Mon, 24 Mar 2025 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805302; cv=fail; b=XbKXnkYbBOtrFOO6Sz1GdvxRhROR3wlbjCAI7kygTV08WEnIxpROd8pFkYPlbGxa3W85XpKK3kiqQ64nhnQZOJQybLMhuEjym2034L8s4HfdnpIWEetdPigzkYnBajrvx6VWCvuXAxIGQfAH7fRVVOYnRgC7ZeH0ptVAAt1031Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805302; c=relaxed/simple;
	bh=7+S3mCdOYlMcH91BknfqJJ5cGj0pOIu0xMgLMoZqgME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GZARiP7FAWtowhp7Ot6KCE58WxFVw+fRAPDo1DM0dDZVzZUK7Y4mCd1XJU/GqTkSNTnCGrrG3uU7nB7uigvilbZ01feRCrlZa3/x5+aQ0ytMoZ1cTQFg/BGteEWnziZGStVzHLzHzil/gSlaeMF9OkAotU82fIJbxjRNY1ilkpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OOFNCDDJ; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2QNv0tbU0aIl8yysM/M3/ICLjTYyGkQmSXslOQ7WHWOs3dg/f2cCaf7+WuDCTlwcAnWhQKwICTqA5MJ5UOt/V4a2B2ssDYWVQPBLT+kieT+mFfbwz5CurEQeDvJRe9whFscVyh5h0ZjFibXsPMVuajDYK30gEvpMiTDRcssNwLjhq6OfCE25zkDXDot5OSkeDh9G5hqPbOz27JZiPMp0owJJ6toMGZDxCPCZv9v4BKQKLTrYFm6ZLRb4JdP/IfM5AjJ7hB9si7V/mZJjFOZlW/W+LAfvOxZOaTRrfCOZU80tYfJXBPnjyH+fFD/QQhA8LZPkY1U1AUf2wQclcR6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+S3mCdOYlMcH91BknfqJJ5cGj0pOIu0xMgLMoZqgME=;
 b=C7u8CrY6MBi1aiSsfP1pWCvsPSIfMGr77pPE6WGc+5GHV7mxspvk6jSeIdDtMDD1OqJkLyKHFVVjk8eDkpJ2qk+DZ3//uDi6u9jF7XoJHKANNeR/RAfo0nkR1PbrflJ1Hu7iOXBL19kvKXcF5YPHAujoQm6cxl1UZss8PUpRopIcpljdpVBOL2VlLR04Z3n6NX9HkjYA/nJXp9ZvWfQxoqzCZvhsgJt1S7WodBcb3NRd4dXo0jBEA/EdYDhKen+3DCO/gzqKXT7STQZAa383IFaNxI+fTCgyDndc/lZtHwP9efAfdg+/kknZvreyV/uBx5BCCCOVS/T/RDoygpYSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+S3mCdOYlMcH91BknfqJJ5cGj0pOIu0xMgLMoZqgME=;
 b=OOFNCDDJ/mFrX7wAs1Dt0U8+jlI574SuoY0B962tT/lpXQWQpN66SmRl7d7b3JsPWtINN0BxZqPI+6OOmzNkQAkrxRfsjQpNKEVFMY2/1eX7aRJIOeZpmuRBhkjQz0Ld0cbdXVgY5fMnmrCNBlbHLpCNRXAu8KUWXDdzsL5wXjwafN/jlbUDWhtxVCFFiv3fbEV1GULNXtJ1YM0jc9bzMeXdjftwXIyIBBfVBcYGptxjsAAU9JnOIg0UYEIR2OzypTEWIIYjn+ivY8TGhVG3MzMuD7n8Rx8/IXWXMP6ifR79u6J+wADBDyBm1AWkZEFlV2HR2kne10JFACXpHoaFFQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB11014.eurprd04.prod.outlook.com (2603:10a6:150:208::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 08:34:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 08:34:57 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Topic: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Index:
 AQHbnGRhRMwe0OLhtkis9ybXJA3l0bOBpEqAgAA//SCAAASKgIAABPeAgAAAzgCAAAS4gIAAAT8g
Date: Mon, 24 Mar 2025 08:34:57 +0000
Message-ID:
 <PAXPR04MB8459F7BE5AD43E0685C74A6C88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
 <Z-ER6elHDYtIY0ap@hovoldconsulting.com>
 <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdagFrz=5fRUfVuaZJRsBao4UrObNa7VknS_hmOAsWFO+Q@mail.gmail.com>
In-Reply-To:
 <CACRpkdagFrz=5fRUfVuaZJRsBao4UrObNa7VknS_hmOAsWFO+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB11014:EE_
x-ms-office365-filtering-correlation-id: 6da3edbb-602b-43d8-e4ad-08dd6aaec27d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3BaU05TdWpCV3RsTWVoNFUwQnF1S0ZGNXFud1lxRVVLbnJSSmx3bGpqU0Ez?=
 =?utf-8?B?eVlEeFJrV1UzY3JqbUNJR1dRM21kSkhMeFE3dHU3K3Yzdkh5WXpXMmhEbWJ2?=
 =?utf-8?B?Vnd1ejMxSGk0NnBpd09zRkFFMGw5V1JreVdFeTQzK3FEVG1GRWZYVGp6SU1W?=
 =?utf-8?B?ZmlJQTVCSm9ubDQ2NjdhcDZUYlBxMDF1K0l3NUNNVUtBc3pxT084QnJodVZi?=
 =?utf-8?B?V0ZqdVNtNUJBT3FSd2NxOVVodHhzajhoYXFqRnhqRnpNRndhd2U4eEN5UDMz?=
 =?utf-8?B?N3AxNGlKTTFJWWtUTzFNSEJ3QnB5K3JLcFRFZlFlblN5aWQwS0ZWU2EycFcz?=
 =?utf-8?B?TFRSQ1NFWjRYNlVHQ0t0RjhsQUlwL0lhVkc4MytLeWwwdlBJNzZ1N0Rub214?=
 =?utf-8?B?MUwwUkk2cGg1TGs2RDlDK0tZRVExQ3VMdHZUT0RLUm5FMkNta3pxZXRUTWp2?=
 =?utf-8?B?UXVjQTh4cjVXQUtWSjErREZoN0lFS21ZaEFwZHBiWFRDRytVbU94TzNaekRS?=
 =?utf-8?B?Um1VRnhMRWRPMVJ6elpzVDY0bGhBMk1wdEZ6VzhmS2drZUN4UEZsd2Y5cjZC?=
 =?utf-8?B?bnMyeGlVVGlNWGcwZnJFSmNScDZnbWtGS2VjY1dXVnIyYU1uem9uYWNPWXNs?=
 =?utf-8?B?VWpWMGFPeHN4cTdvSXVyajRUVlBlc2dHYVRUSEJNMU1IbHVmaXRtK0hiYlp4?=
 =?utf-8?B?WXFhZzlvcm43d1haVDNlRmxha2xPcFVFU3NWb1hPY0ZHZkl1ZXJkcEdlUWwz?=
 =?utf-8?B?dGVCSlR0cnlxbFFHRTRMVjUyMVdyM0pMeFkvQ3RIQVJBeG95bnNtNWcvbUlP?=
 =?utf-8?B?MVdWRzlBam9sR2FQam5XbllxSFJaR0RPdlBTYU1Ma2NJeGZqN2hGOExzQ3gx?=
 =?utf-8?B?Tnp4T3dKb3QrTUpZSnZMVlFJUStDMDlCazh6VmZORjg0RVlzWGoyTDZzbGlR?=
 =?utf-8?B?Y0JqbXFVQUlidmQ3Uk1qcnZEQ2hoWUVzNHpKSlhrTzlCbGg3WkltSTNNY2pF?=
 =?utf-8?B?UmgwOWc2U21Yb01IM2l3NUwxR3RSZjlvMm14eFh6THcrc21ibXM4T2sreG9X?=
 =?utf-8?B?VWRySy9nMzZ0RFowellEa3Yzd3RHUzJGdnhiMWE1ZG5NeFIwcU9vdDJqSExU?=
 =?utf-8?B?NHB2cjY5bnNBdkx0aG5OQnJVSUxRTW03b05GWmpzSzlRMzBUS0czMDI4ZFpG?=
 =?utf-8?B?dmlHemVNc08yWVFVb1ZnR3RuYVpoa1ZtZjNPWHZvRVl1Zml2TDdsakhOUUxG?=
 =?utf-8?B?emtJbHBPY2U1MlN5T1JCZ0svM2ZxV29UYTZKVHYvcU95aVNXbFlaSHBOSFRB?=
 =?utf-8?B?SUtiWmw3eFErbURQR2oxYjJDbWVMUmpRRVR4M3d6dE10ZUJ3Yk16VzVoanQ5?=
 =?utf-8?B?SDBhR1FSTWFBU3JFMjZMR1lla3dEUFZBQWpCRkp2Ui9pb3JIdnlUMEx5VzBy?=
 =?utf-8?B?SkxrOWlXNkJBL1RDdWpvQklKWDFFQzJyUVB3Q0pCTTMvWmtXb1h2M1Y0R2pp?=
 =?utf-8?B?VSs2WWVOMlZzU243clkzaDY4YlJHY01Cam1nN2poN1YzU1lCM3BRSVRQUlNH?=
 =?utf-8?B?c2VHSWJNV2xXaDBQdzFLY0h1ZGxuVGk3VnI0SG1pOVpzK2NSM2xqYXdrblZ6?=
 =?utf-8?B?eTNZeEpnNzhNblpNbGNETDVjakNES3pOa2ZvYWM2L0FDcVhkalZrL2pCZTRj?=
 =?utf-8?B?UUxORTJPK1BtRVVCRytpbnZqcDhvMkNZSk1menNtSnlKZnVwSmlTVSt4eWw4?=
 =?utf-8?B?WklYb3ZDa3Zrb01BamNWaU5hNjdCamJabFVlMmdheDBWK01qNGMzOU5ZQVRQ?=
 =?utf-8?B?dFlzYU9ZclZBMncvMGxGU1dKaG94TjJNdHlKcWhLVXFZdFZ3ZXp0VllnR25p?=
 =?utf-8?B?eHZVSUUrd3VRd3N5QTk1MllwOXRFTXVlSCtwMjU1MHR3V2pQUEkyODlsZE1D?=
 =?utf-8?Q?84IUqNiT1JSKRoL0I6QVJxVBuzAUn08M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0Q2cEUwUTJQZlJtallGZTRFY3l3KzNvY0dGa1JaaEN1ZnFEOHJnWlh5NTBS?=
 =?utf-8?B?S0tQM2hub0hDNU9vQUZ3Y2hiTlFEOUVUUC9CQzFIV3NEdGVpcEcyOWxzS29I?=
 =?utf-8?B?UzQ5SDB2MzdzRG5nNlA1cHZ0RDN6ekZSSFZmR3hOa3BHaGdNbExYQldqVS9v?=
 =?utf-8?B?WlBXZVdtYVhyOWZnZ1g2clE1ZWJkUG41dDJGSDBId0t0Tlk4T2IyeUVrMkhr?=
 =?utf-8?B?SEk3Yk9LOXZRQ3lNQkVMVHNnaHNNN1VvZU5tQS9CWGJmSXMvN3VMTm9MdHUr?=
 =?utf-8?B?TThLVUI3Q016M2FXamxrY1NuMGR3aUdYT0ZsY3g2dEF0UVUzd0V4UUN0ZTJY?=
 =?utf-8?B?cC96MGNNU2UwRHgwVWY2Y0REd0RXa1FtQTVXUVRPVjVUUmRzZGo3dEJkYndz?=
 =?utf-8?B?Q3hXT1NrMFhsN05jcnJqcFZqYlIrZm01WHFSNTY3UDJhWXd0ZGo4bk1CV1J4?=
 =?utf-8?B?MmlNR2hBdk5IelZ2SFZpTzdUV0xxM29lUFRxWVdzQkZpcW5ReDBQdzRBblRG?=
 =?utf-8?B?ME9EbXBySXBhMTFBNzVJRXFMUEQ3RFV3dHlocU9Pd1duRTc0N21xaCs4eENr?=
 =?utf-8?B?eGFCMVVtSVR2T1dkMmg5QmVWK3EwcC95amVLTU03cmNmYU5rdkxQc2V1ajFr?=
 =?utf-8?B?K3gyMlRLVHBkQ2VFNFQ2eC9aOUtjYnNmeVpTd1BPMEpLcyttQjJyK1lwdXFG?=
 =?utf-8?B?Y2xtOVhrKzN0T3F0YW5MNmRjWUZWOTBWYyt5anJ4bG1kUUlnaUxlVmd3UUpJ?=
 =?utf-8?B?ZFFIU3l4Mm9KSG8wNGljSnhPZUxXbG9mRnMzRjgzRDNxbFdPWFdOSUdrR0VY?=
 =?utf-8?B?YUJLYmY1WWVsM0F1VkYwRjV0M2tqeWJvdDVFSjl0Qm5IU1J3VnFhUTZ5QWVs?=
 =?utf-8?B?T2h0NVJ0Q0RtWTRwRnoyRXg3T2JnUVNxdlRCNG9UR29TQ2tBb0tMcm54c2px?=
 =?utf-8?B?UVZvb3o5enpUdTVQYVFOdWY2U1pFOGdncDhRTVFzZzhsY3NYRDFYc2tycHJN?=
 =?utf-8?B?SVd0S0NoQXVzZDR5c1FYWVJpMEF6dzlqZzU4TTlzc2JuMjRDYTh6SzU4TTF4?=
 =?utf-8?B?ejljQ3BMQUpndXRFazdqWWZEb0Q2aG9aYy9FUWovcHRvMXJIS1FQY1dmT3JI?=
 =?utf-8?B?N0EyeFBsbm9PaVpuK0JOVXdoSlFWK1k5U0RRejc2RWVlemVqbERnQlFkUUNs?=
 =?utf-8?B?L1ZibUNiS1llVnZINDhlRmgvMVRrOFUyS1IzN3JxNWFWTlJLaTFUWVZqM21w?=
 =?utf-8?B?QkZ5WjBuVkd1Ris3ME9TYzJkVmtEOG9TallHQW1oVnhtL3IzbzdhdFBaZElO?=
 =?utf-8?B?bFhzNFhmVllWUWt0RHo2WGVxNGcrQmg1b0l2WHB3Yit1OGdRallldTNTcTE3?=
 =?utf-8?B?WFNaTG9MbzNPMjNRbEdtV2JmWktIQms2LzREWnFjckJEVXIzQ2hEbkRjU3ZD?=
 =?utf-8?B?aVhNdUpkQTVQZkx4bDkxeUxzNjVkTWxvOWFWaUZkQnVJSTJHWUFab0FNRFds?=
 =?utf-8?B?WG05NDY5cUFVSmlXN3VkVHF1NEYzSDc5VmsyeG9CNkdaLzZ2UGw2a1J3RG5s?=
 =?utf-8?B?bExPSjdtUXM0dkpFbk9XVnRnaFA1VHFBRlk0ZElpejBsQ3RrbGZGczdyODdJ?=
 =?utf-8?B?R0Urc1l1bzJNejdxZHlYVk51djZRdTFNdHJpQm9EV0Y3czY3bFV0QnpWL29L?=
 =?utf-8?B?NHdMN2s0cTRZaTdPK1h4MUhPa09jUEQ4T0dCWisyOXptWHFaT2w0NVpWUmdh?=
 =?utf-8?B?b2ZQUFZ4aHZzZ1lrRmJLTGV5Yi9zNmJyWE90K1BkNUN6bk5NbEZSTjdNMk1S?=
 =?utf-8?B?SXZodnh5bVVzR21CU1BhQTlaYVVTM1JpaDhha2dGbTlHQm9RMWxjYWwrS3ls?=
 =?utf-8?B?UE5UYTQyT2RIV1Yya1BqbUV3UWQ1RVY5VHNqdjFSd0RGczQ4eVFtYVlMUlBj?=
 =?utf-8?B?UVVHK2JqMU5PbkR3YlNnclg2Q3dmQzg3bkYvS1FkMEVaWG1MbGFNdzFSdlpR?=
 =?utf-8?B?MXJybmtKSFp4YUZSZFNnUkFYOVBNa0RCQkRCQThnakhWeEhjRGxQOWxKczBR?=
 =?utf-8?B?RStDcXlBUFVqSmUrY2NaNUR1Z21sQWZWakpLR05pQlF6bStEYkt6bzFYQjVl?=
 =?utf-8?Q?p1Vc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da3edbb-602b-43d8-e4ad-08dd6aaec27d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 08:34:57.5901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lTUDcHvn/114nGUahGWcvEM8SiAtn+bLvhVVx7BULk+o8Zes626PRfpp4X7WSix0JzeYlmN83+Tk6//iWb9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11014

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gQVNvQzogY29kZWM6IHdjZDkzOHg6IENvbnZlcnQg
dG8gR1BJTw0KPiBkZXNjcmlwdG9ycw0KPiANCj4gT24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgOTow
OeKAr0FNIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gb2ss
IHRoZW4gdGhlIG9ubHkgc3VzcGVjdGluZyBwb2ludCBpcw0KPiA+IHdjZDkzOHgtPnJlc2V0X2dw
aW8gPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX0FTSVMpOw0KPiA+DQo+ID4g
SSBtYXkgbmVlZCB0byB1c2UgR1BJT0RfT1VUX0xPVyB0byBjb25maWd1cmUgaXQgdG8gb3V0cHV0
IGFzIHNldA0KPiByYXcNCj4gPiBzZXQgdmFsdWUgYXMgMS4NCj4gDQo+IEkgdGhpbmsgdGhlcmUg
bWF5IGJlIGEgYnVnIGluIGdwaW9kX2NvbmZpZ3VyZV9mbGFncygpIGluIGdwaW9saWIuYzoNCj4g
DQo+ICAgICAgICAgLyogUHJvY2VzcyBmbGFncyAqLw0KPiAgICAgICAgIGlmIChkZmxhZ3MgJiBH
UElPRF9GTEFHU19CSVRfRElSX09VVCkNCj4gICAgICAgICAgICAgICAgIHJldCA9IGdwaW9kX2Rp
cmVjdGlvbl9vdXRwdXRfbm9ub3RpZnkoZGVzYywNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAhIShkZmxhZ3MgJiBHUElPRF9GTEFHU19CSVRfRElSX1ZBTCkpOw0KPiAgICAgICAg
IGVsc2UNCj4gICAgICAgICAgICAgICAgIHJldCA9IGdwaW9kX2RpcmVjdGlvbl9pbnB1dF9ub25v
dGlmeShkZXNjKTsNCj4gDQo+IFNob3VsZG4ndCB0aGlzIGJlOg0KPiANCj4gICAgICAgICBpZiAo
ZGZsYWdzICYgR1BJT0RfRkxBR1NfQklUX0RJUl9PVVQpDQo+ICAgICAgICAgICAgICAgICByZXQg
PSBncGlvZF9kaXJlY3Rpb25fb3V0cHV0X25vbm90aWZ5KGRlc2MsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgISEoZGZsYWdzICYgR1BJT0RfRkxBR1NfQklUX0RJUl9WQUwpKTsN
Cj4gICAgICAgICBlbHNlIGlmIChkZmxhZ3MgJiBHUElPRF9GTEFHU19CSVRfRElSX1NFVCkNCj4g
ICAgICAgICAgICAgICAgIHJldCA9IGdwaW9kX2RpcmVjdGlvbl9pbnB1dF9ub25vdGlmeShkZXNj
KTsNCg0KVXNpbmcgR1BJT19BU0lTIHNob3VsZCBub3QgY2hhbmdlIGRpcmVjdGlvbi4NClRoaXMg
Y2hhbmdlIG1ha2VzIHNlbnNlLg0KDQo+IA0KPiA/DQo+IA0KPiBBcyBpdCBsb29rcywgdGhlIGxp
bmUgd2lsbCBiZSBzZXQgaW50byBpbnB1dCBtb2RlIHVubGVzcyBleHBsaWNpdGx5DQo+IHJlcXVl
c3RlZCBhcyBvdXRwdXQuLi4NCj4gDQo+IEhvd2V2ZXIgdGhpcyBtZWFucyB0aGUgcGF0Y2ggYWxz
byBoYXMgYW5vdGhlciBidWc6IHlvdSBuZWVkIHRvIGVpdGhlcjoNCj4gDQo+IDEuIFNwZWNpZnkg
R1BJT19PVVRfTE9XIHdoZW4gcmVxdWVzdGluZyBpdCBvciAyLiBFeHBsaWNpdGx5IGNhbGwNCj4g
Z3Bpb2RfZGlyZWN0aW9uX291dCgpIGJlZm9yZSBzZXR0aW5nIHRoZSB2YWx1ZS4NCg0KMSBpcyBi
ZXR0ZXIgYmVmb3JlIHRoZSBncGlvbGliIGJ1ZyBnb3QgZml4ZWQuIFRoZW4gbm8gbmVlZCBjaGFu
Z2UNCmRpcmVjdGlvbiB0d2ljZS4NCjIgaXMgYmV0dGVyIGFsaWduZWQgd2l0aCBjdXJyZW50IGRy
aXZlci4NCg0KVGhlcmUgaXMgbm8gcnVzaCwgc28gSSBjb3VsZCB1c2UgMiBpZiB5b3UnZCBmaXgg
dGhlIGdwaW9saWIuDQoNCkJUVywgY291bGQgSSBzdGlsbCBrZWVwIHlvdXIgUi1iIGluIG15IFYy
Pw0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

