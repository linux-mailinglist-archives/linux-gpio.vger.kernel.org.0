Return-Path: <linux-gpio+bounces-13337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7A9DBEB1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 03:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C34163108
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 02:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EBA14D6F6;
	Fri, 29 Nov 2024 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jkC6Ezmi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670642AA5;
	Fri, 29 Nov 2024 02:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732847179; cv=fail; b=I0G5PW+QBZeky7YleL+CjtIVMyta1p4Qh8g7IJ/qmd1+ae6RCw0/YpzP8xHNEDRd+B1nLz+Z7jGgB/ZEXR2wvziOJnWhlrJYIEBCGnTxUun4pnmnyULLOUs63eViozenIK3jeKlmXSh3bi0HFI4BLd23xKa8aLYlHKu9FCTtz5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732847179; c=relaxed/simple;
	bh=iYU3JhZjWUovb05dGA/Ngozo7WZbb/MjroMOovIyyTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VjRyjtNpHpWWOG0AgftbMp+CkL43DcKcX/+uxjxWX6hNjEQv3/SwAmx0rrU/B9dFaCJPM1Hp2PdMGxlpHrjXPYKSFfYgXq2EEVKBwVli7mRUIY7mj0X9RFFW/8MMwXXi9fW+8Qj5VxKOk3E94ErRrOlA7FILxOeT9mFoWOMotfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jkC6Ezmi; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVf6xznNGU9QOiHphsr+1UgcyBl/ZP+AMwLi9IsfB/wBaLA5ZgCxzp+tW9QLSbJtNGLBFfYOmugkePBC7p0bxdnNI20rPL5RTUP26nZA9/aRWauM4sUY9Uetif8pS2520cYY36O6Yb16J+lHmQ7TSS3JUZ4oroAGX4XTPLJuMnKXAGiyluFu94fwvKlqfD+AtGhY6RJzrCQL5B1r1i+O0R6ndZ5gqvH1xJLs5C7H7UckIcKV+ANQIS2EjQetYozsJq7HGd3KxOfQkl3kQq9YDWrA4XUgiFARarzbZyEOQNq3QENlvfZJfDRWB2ab4XzJR1TBKT2o7Oou5KHa2+f8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYU3JhZjWUovb05dGA/Ngozo7WZbb/MjroMOovIyyTk=;
 b=ohrxDjwsniV++R/65NR9oejI5Bo2ISeQxUAVw5MEJ4fy30kR/dKDWU2p6ZeKL6ky/hgo1hD8ylt4BMmuyQMxm8nSmOVaWJHacBVNt5bhS2lGaj2y3ZhaUkmLJ/n8W5z5rAIjD3uaUF4bcAlC2wgODAt6CZmcvCGsvAbYcWiUJ6UMTEoJfdwmkKRXOIxYIkt6MH/iV1y67o0d2m0ZD4eK3rLBzz8n7dJ27xRRqsWJ04aiOXLwruDE6JVeCB8gtThd+IKIDOmzbgs/8JuvOMqg9VmZZ7FTPTfBWsb2RpcIyq3Y5SPLHj7Ggwj3V0xWfhmNCpQTOCs61lc5509hk/7GxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYU3JhZjWUovb05dGA/Ngozo7WZbb/MjroMOovIyyTk=;
 b=jkC6Ezmi7xyyShGlPWBmtfeQBUGq0kEnBiynsKjKHf0UDYSHUclINsF20xoUYmsauH4EUlfy9NmbJC3336kEXCba2YVCcAUbtxBrsoFiq3CBAaDsFZ9qXDY5ZC5gpWqnbnJmvMpWx+e9xc/WdGQ7PqP9fJvr+bNhP3sRQvW0PfeC51x+qVSfEHajanWWjxrJdTo7HUtTn22kqBH4fGMxKfTuo2e7zoTbmPLlTmXPDg8y1I7VInF1qrleVmoDHrzzn/iWHBMc7mv562Hs0GgtqlwC0YOI/k6cT+VIBX9XfiTKecYZBlOiBo/KrPHo0o6xPHntHobl50MHA2lAhPrWlQ==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 02:26:13 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%5]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 02:26:13 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Mark Brown <broonie@kernel.org>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] gpio: pca953x: do not enable regmap cache when there
 is no regulator
Thread-Topic: [PATCH v2] gpio: pca953x: do not enable regmap cache when there
 is no regulator
Thread-Index: AQHbQTldnx3oWSGqB0WWsEVltN7DarLMn5YAgADgyEA=
Date: Fri, 29 Nov 2024 02:26:13 +0000
Message-ID:
 <DU0PR04MB9496A16FB98C8492C9F012CD902A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20241128020042.3124957-1-haibo.chen@nxp.com>
 <f71643eb-ee9c-4b39-af26-738ae82fd4bd@sirena.org.uk>
In-Reply-To: <f71643eb-ee9c-4b39-af26-738ae82fd4bd@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS8PR04MB7926:EE_
x-ms-office365-filtering-correlation-id: db9dc4e2-507c-4c41-32d3-08dd101d3202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?aGgwRjcxdzlNQVBIMWNXa1JxRFRlcXVHVStZNzhzd1RPTlJNbEg0MStMRDlo?=
 =?gb2312?B?TVBycWQ4dnlONnhnVmZkWTd0bThBRG8xRnVpQ2s0YnFFVkpZb2Uva1NpcG1i?=
 =?gb2312?B?UncyZUoyTmZuL3FjMXNkNlJFb1RrTjJEanFpOFFWd0RUU0RvSWpPOUpUVHI2?=
 =?gb2312?B?eHNUNERBUU9tdTYzdlV6Y1ZoQWIvSk40L2RIYzA0Kzc5T2VGOS9uOHR3MnRF?=
 =?gb2312?B?T0lpTWhBQzg0SlordUlQY1YwdnBrclVra09oNkFOcTAzSEY1NEhhU2R0cFhq?=
 =?gb2312?B?QVhZNkE4cG84WEczUDQwZnh3ODFwSkxCWkI0WUZkRkdwOHlIR2RwTWFCSmNx?=
 =?gb2312?B?bm5iazR1OWJzZy95TGY0dC9IdEo1NU0zTlZIUkRiMENXczBOZHpoVDR6bVpQ?=
 =?gb2312?B?YkdjUU11QUFwb2FWU05WcStweWdJcVdqMmswdCtJUFFEK1BaZ2pmM3hTYkNt?=
 =?gb2312?B?QzhsVUhMUnRlU0NMd2ZBUWV4dGhWV00rVllacWQ3R1prUVE5WFRTa291RGE4?=
 =?gb2312?B?MVFlOXB0TENEOHhvZVhESTRuZjlhRzdmMWtzYmZ1RVlEbllxU1V5YUx0NXBn?=
 =?gb2312?B?Q3I4Qnd5azhJYUczV2ExREpSWnFVcU92WmFoS1hNZGpnaWYwbU9WSlA0RG40?=
 =?gb2312?B?Z0ZtK0U1dHVFQU5FSHBGQjhsTXRsWFdmNFJBNTB2Mks1MDZKTWI3aC9kbzM0?=
 =?gb2312?B?bTVZYjdTZ3ljcGNsWTFmdXRFYXl4ek9xcHU3OHUrd2lsVTFvbFUrck9odE16?=
 =?gb2312?B?b0IxZjFoSW1hdWt2eFdaN1hud24yV1dOMXVOb0hlSVlMQXJUR1FiSTViNGl1?=
 =?gb2312?B?NlRnaXVKNzNyZUNFd1dDSnJlWnMvZEYxbDNsTlNHYVRSSG5idXRjcndrNnpC?=
 =?gb2312?B?VVBwQ09zZEpveU4vRnR1bFlrRXYrMHpoblJRNTRQQ0RZcFFOUzFhVmpsUFlu?=
 =?gb2312?B?L1Q3RHFXVzl5Z1ZXZlprWkh2enNnZ3RINEV3dHRCOHpFa3JBeTV1OTJpN3Zu?=
 =?gb2312?B?WTMyVGZHa2gyVCtGOWVvcHF5Uk9CQnB1b1dIZTVVbzJCY0lFdHJ4SWNnU25p?=
 =?gb2312?B?ZEZCemE0T1VOYW5Nd0dlRGJsU1hDaTRhS2ZXY3BuTEM1NU80K3JIdit3VmlE?=
 =?gb2312?B?dURKMmMrcGlHNGZsb3padVBqMERoSmRpTy9LVTYxVG1NdkVCeS9NZ1pFbEdJ?=
 =?gb2312?B?U2ZSL3k4UDZrNmtsajlnS0QwSzhIU2gxcWEwQk40bVBPNVVGdzdRNWc0RkRh?=
 =?gb2312?B?OFI0bEdYeTFXMWgvcWxsS0Y3dXd1YzdtK1htQzF0NVVtZ3FQZzFLeXZQS1Er?=
 =?gb2312?B?L1dadkY5RTlobTRNbWV1cEFVU1J6MFFTbG9ROFBuNlhJMDIzRFl2ZUJZemZ6?=
 =?gb2312?B?UTRlUWllK3FQaGRVM2Q2alhzTUNwaHpaSCtFMFR5VXRSZmV2aWg3a3lDNEg1?=
 =?gb2312?B?UFR1MWE1dGFmSDlsTS9mN0k1QUdoeWcxbDFaNSt2WFJKdGxOOU1sRG1kb0J3?=
 =?gb2312?B?RS92YndtUm82V0JHM1FmNFdJcU13Wm9hZzczbU56bmJGLzV4MVQydnBzdlNk?=
 =?gb2312?B?eE5EWnF1T3ErN01PZjQyZzQvNk5MZEcwWGQwYm1pQ2g3K0VrczQ3SW13YnZG?=
 =?gb2312?B?RWdGVDhXUk1ZVnhGMjY0TC9lYit5MHE1Ulp4eUVYd1JLZGJUVnIzVGxJYmVk?=
 =?gb2312?B?MHBvcnpNcm5UVzNIRzBHMkxJczVWNE1hQ0hoYUZnaHd2cGVDaEtkT0JUcnJM?=
 =?gb2312?B?cGN1aVIvUklkeFVPYTdOY3ZYUmR6QVk4VXFGY0FMejArWDFsYitDa21kclY1?=
 =?gb2312?B?KzZWTGFIa2dRWFB6RVUzOFhiSEJFZWlSSGV0Z05NMlJ0aGtGK0owMTJlMm1p?=
 =?gb2312?B?VTNqdHluWnBBNjh3TnBlT3NldEJ1dW5BclZJS0VyWUVETVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QWV4VGlma3FLeFJJZytzNFRmK01GQnAyeDRRWGMzNUg3RHB5a05nRlJUWGtX?=
 =?gb2312?B?Rkthd0xvTm5jTGFwRFBpbjlOVk1Bd2NRaFJLMU1BL2lrczkzcTVDZDRFV2Na?=
 =?gb2312?B?MHhKWWJpbXZpa2VZWVVqQkFCL0UwS3FtcVpYYTVMZUgvQ05oKzVqMmZQeUcx?=
 =?gb2312?B?VWhJMTVTWHRPYmpya0JxT1NjcDRlbkdYYWRpUWw5UDFNS3dMYXJJMElJdXVD?=
 =?gb2312?B?dUVOSkp2UlArZ2RkSEVSZHdKbXozNndyTWJjSktxR2RrdThRSkQra0dJRFgz?=
 =?gb2312?B?VU13V3hMcnBzdDJKTDlJcXRLNTJ1bjA3cklhRHFndWRrUi9vdkZmWUZMczhL?=
 =?gb2312?B?MC9DaUtjZVMweUZ6dE9XRVo4Y3FCS0VNKzhDOHFBMWRpNFNRVXZLWVdPa2VC?=
 =?gb2312?B?djRXRGRaWmxxbUtJNnFQUDJnUzJZeEY2aGZmZC92cXVMRnhqOGZSYm1WdDFW?=
 =?gb2312?B?MXM0K2IwQ205a1oxcThmYmJLekRRUVYxcGdpN0c4c3NpUW9jampDRGFCMUYv?=
 =?gb2312?B?emRNOFNMWUxiVlNPek16b0RMdDF2VnZ2Z2IyMEdzTmszSXJ6c0tNUElJNGFP?=
 =?gb2312?B?YUYxM2FGWEpiaGFqOU0xYTMyQ1cyTGc3SEJtbHhsTml3MGd3WHNnTlltTWJJ?=
 =?gb2312?B?ZDdBZFJiZDdGdVJtN29KOGx3Vjlmc0JxalI1aTdjbnVqRzhhR1AwMkdIWFhp?=
 =?gb2312?B?SUMyL2dMTDVQZVNxWTFjL3I2eUt3QVRncGpENko0UjRjeHpDcFRqZG50dFJw?=
 =?gb2312?B?eGlTVndZWUJ1Z2Jza1U4eWgwVnlOOWM4U2R6MkU2UEFhZUFxdEx1UUFzdVV5?=
 =?gb2312?B?WVBYZzlyNGlOc0h2Vm5FUU9vRHVobDF2eGQvNUhSRWgrWm9Ed3dxMU9LNXlo?=
 =?gb2312?B?aFRvc0Ryekcwcm9oUEN2eG1uem1wdXZrZWRMWXg4QUJYTlBGTkc1dzhhQUU5?=
 =?gb2312?B?d3NRYjVDNk1vNWdxSmx4WTF3QUxrTEwwRW03WVFkRmJoVjdrQ0RNUjFLUUJE?=
 =?gb2312?B?Ulk1Rnc5U2NaVVlpOWlpbEhZWmNoSlp1TlZhZUpFaGNjc1lYNm9JcE0vWWZ0?=
 =?gb2312?B?SkVXOXBrYTlQdk5aMFJmcjRLQXhWNlRYWEdmdDZMaGhPWjNqU0ZPd29iZ2Iw?=
 =?gb2312?B?Z0lWWSttRHpJTHdzckhsRFF2bmF0MndGcmFCb0Q4L3g3Z3YyUXkwWFJoNGVz?=
 =?gb2312?B?UkFPaE9kbHVuOWpSUWRNR0NVanh5VUJJanp1ME1vWm1KOGl2Qnh1T2RKUzRR?=
 =?gb2312?B?VjZDMHlYOWhZWGQ1YktKUnV6YjZvZEtPakI0NWxHdEx4S01RamdJdEJ5QWMr?=
 =?gb2312?B?V0xRT3ZYbjd6WmFia0M4R1VYOEg3YXRVdjBKVnlQZEJyR1VHOHI1RzE2SDBw?=
 =?gb2312?B?ZWIyMG05dDBaUUJvUHZGUWkyNmhMY3pkclZrNmJiQVhCbVJqMHJyZmRuMXlV?=
 =?gb2312?B?UXdpOEJZSFBvQTF2T1VoQisrL3Q1a1JFY0lWdHVwV3FRT0pNR2plTzJPMXRa?=
 =?gb2312?B?ODhTcGprSXh3eW1OQ3Nmd1BrRG5aRGhLRjZwL0tWdDBVVkxtUzhuZHA4bWR3?=
 =?gb2312?B?TVdFWEw1VnBvMXVyeW5DWUJZMSsrVGdPZVRZdEV0WStZRVFFVmMrUW5XNld2?=
 =?gb2312?B?TFMvMmxTeFp3eFA3anp6MmgyVlBpZFJiV0pyaXY5NEQ1ZzF6K0FZanJ0TzFm?=
 =?gb2312?B?SjR2WTdhL3lnR1RNaEkzcEFVSHVKdjYwdDZUTmNTOGdKdDcxcXZDcm5CaWR6?=
 =?gb2312?B?a0lrNTZ6R2JmK0FyVVkwcERVbEgvWERublRFLzNrSHpDd0l4akR1cDhrTmUz?=
 =?gb2312?B?VHFyZ0lGcWNabnpZZWR1L0tTOW9WSWpSSzhYeGkwckR6L3dnL0JQbW5ZWmNM?=
 =?gb2312?B?ZTFsdFFHNllHVWorZnJlK1hucm81RmdReFdOMSthRDV3QXRXTzBuMHVNNjVX?=
 =?gb2312?B?TnJYSFJiSVk5ekJvZGx3ZS9KeG1TV0huRXB4NmJHNzhIcFZmb21LS09BR1l4?=
 =?gb2312?B?MVJNaWEvamczTkFkbWZCNlRWWE9lZUtCQ2ZLai9qenhuNk5Qd3JnV09JUjhR?=
 =?gb2312?B?SUdBcFRVM0gyTExhL1JkSHp3NEw5VGxUN0prQ1UySkJFTFdVOUNSdWh4M2dJ?=
 =?gb2312?Q?ZbyA=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9dc4e2-507c-4c41-32d3-08dd101d3202
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 02:26:13.5008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imH19TjyqE45/RyoeQZh7wRYSp1zYwi7YqZUIiXNymqfq4MUeKkN8ez3qdsPAPmg2SbdOmn8JqsaMMPbz6+wbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjTE6jEx1MIyOMjVIDIwOjI4DQo+IFRvOiBCb3VnaCBD
aGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IENjOiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7
IGJyZ2xAYmdkZXYucGw7IGxnaXJkd29vZEBnbWFpbC5jb207DQo+IG1hcmVrLnZhc3V0QGdtYWls
LmNvbTsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0g
Z3BpbzogcGNhOTUzeDogZG8gbm90IGVuYWJsZSByZWdtYXAgY2FjaGUgd2hlbiB0aGVyZQ0KPiBp
cyBubyByZWd1bGF0b3INCj4gDQo+IE9uIFRodSwgTm92IDI4LCAyMDI0IGF0IDEwOjAwOjQyQU0g
KzA4MDAsIGhhaWJvLmNoZW5AbnhwLmNvbSB3cm90ZToNCj4gDQo+ID4gUmVnbWFwIGNhY2hlIG1l
Y2hhbmlzbSBpcyBlbmFibGVkIGluIGRlZmF1bHQuIFRodXMsIElPIGV4cGFuZGVyDQo+ID4gd291
bGRuJ3QgaGFuZGxlIEdQSU8gc2V0IHJlYWxseSBiZWZvcmUgcmVzdW1pbmcgYmFjay4NCj4gDQo+
ID4gQnV0IHRoZXJlIGFyZSBjYXNlcyBuZWVkIHRvIHRvZ2dsZSBncGlvIGluIE5PX0lSUSBzdGFn
ZS4NCj4gPiBlLmcuIFRvIGFsaWduIHdpdGggUENJZSBzcGVjaWZpY2F0aW9uLCBQRVJTVCMgc2ln
bmFsIGNvbm5lY3RlZCBvbiB0aGUNCj4gPiBJTyBleHBhbmRlciBtdXN0IGJlIHRvZ2dsZWQgZHVy
aW5nIFBDSWUgUkMncyBOT19JUlFfUkVTVU1FLg0KPiANCj4gPiBEbyBub3QgZW5hYmxlIHRoZSBy
ZWdtYXAgY2FjaGUgd2hlbiBJTyBleHBhbmRlciBkb2Vzbid0IGhhdmUgdGhlDQo+ID4gcmVndWxh
dG9yIGR1cmluZyBzeXN0ZW0gUE0uIFRoYXQgbWVhbnMgdGhlIHBvd2VyIG9mIElPIGV4cGFuZGVy
IHdvdWxkDQo+ID4gYmUga2VwdCBvbiwgYW5kIHRoZSBHUElPcyBvZiB0aGUgSU8gZXhwYW5kZXIg
Y2FuIGJlIHRvZ2dsZWQgcmVhbGx5IGR1cmluZw0KPiBzeXN0ZW0gUE0uDQo+IA0KPiBBc2lkZSBm
cm9tIHRoZSBmYWN0IHRoYXQgdGhlIGRldmljZSB3aWxsIGFsd2F5cyBoYXZlIGEgcmVndWxhdG9y
IChwb3dlciBpc24ndA0KPiBvcHRpb25hbCkgdGhpcyBpcyBvYnZpb3VzbHkgbm90IHJlbGF0ZWQg
dG8gYW55IHNlcXVlbmNpbmcgbmVlZHMgdGhhdCB5b3UgaGF2ZSBvbg0KPiByZXN1bWUuICBJdCBt
aWdodCBoYXBwZW4gdG8gd29yayBvbiB5b3VyIHN5c3RlbSwgYnV0IGl0IHdpbGwgcG90ZW50aWFs
bHkgYnJlYWsNCj4gb3RoZXIgc3lzdGVtcyB3aGljaCBkbyBhY3R1YWxseSBuZWVkIHRoZSByZWdp
c3RlcnMgcmVzdG9yaW5nIGJ1dCBkb24ndCBoYXZlIGENCj4gcmVndWxhdG9yIGV4cGxpY2l0bHkg
ZGVmaW5lZCBhbmQgd2lsbCBmYWlsIHRvIGRvIGFueXRoaW5nIG9uIGEgc3lzdGVtIHdpdGggb3Jk
ZXJpbmcNCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIGRpZCBub3QgdGFrZSB0aGlzIGNhc2UgaW50
byBjb25zaWRlcmF0aW9uLg0KDQo+IHJlcXVpcmVtZW50cyB0aGF0IGRvIGhhdmUgb25lIGRlZmlu
ZWQuICBUaGUgZml4IGZvciB0aGlzIGlzIHRvIG1ha2UgdGhpcyBkcml2ZXINCj4gcmVzdW1lIGVh
cmx5IGlmIGl0J3MgbmVlZGVkIGJ5IG90aGVyIHRoaW5ncyB0aGF0IHJ1biBpbiB0aGUgcmVzdW1l
IHNlcXVlbmNlLg0KDQpJIG9uY2UgdGhvdWdodCB0byBtb3ZlIGN1cnJlbnQgc3lzdGVtIFBNIHRv
IE5PSVJRIFBNLCBidXQgc2VlbXMgbm90IGFsbCBpMmMgYnVzIGNvbnRyb2xsZXIgc3VwcG9ydCBp
MmMgb3BlcmF0aW9uIGR1cmluZyBOT0lSUSBQTS4NCkxldCBtZSB0aGluayB3aGV0aGVyIHRoZXJl
IGlzIGEgYmV0dGVyIHNvbHV0aW9uLCBvciBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbj8NCiAN
Cj4gDQo+ID4gLQlyZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjIik7DQo+ID4gLQlp
ZiAoSVNfRVJSKHJlZykpDQo+ID4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJS
KHJlZyksICJyZWcgZ2V0IGVyclxuIik7DQo+ID4gKwlyZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXRf
b3B0aW9uYWwoZGV2LCAidmNjIik7DQo+ID4gKwlpZiAoSVNfRVJSKHJlZykpIHsNCj4gDQo+IFRo
aXMgaXMgb2J2aW91c2x5IGJ1Z2d5LCB0aGUgbWFpbiBzdXBwbHkgZm9yIHRoZSBkZXZpY2UgaXMg
bm90IGdvaW5nIHRvIGJlIG9wdGlvbmFsLg0KDQpBY2NvcmRpbmcgdG8gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby1wY2E5NXh4LnlhbWwsIHRoZSB2Y2MgcmVndWxh
dG9yIGlzIG9wdGlvbmFsLg0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQo=

