Return-Path: <linux-gpio+bounces-7868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48D91EF9F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 08:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC741F237E4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 06:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4506612DDAF;
	Tue,  2 Jul 2024 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="gC6YhtU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126912F385
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903571; cv=fail; b=s18xtTe27orEQQ0aLnX42ItdhRhSwlbMASMx+OiN3SOqZ8PtQwUdnQlikftyBXIECvlITFUK0nZc0QrAU3ei3Kg6gZkkj1R9uS9WiBC5ZPvpl27jFNc2Bvu9B9/NTm7Uth6wJ/FM/RUXJiQlvqCuJWMz/gD/6Y9vlj5a9Y8ycis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903571; c=relaxed/simple;
	bh=ThDkPi/ob63DMqGC0C/wKr8NP0OHwPdX2js1GN2d1zY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eUx8GwNC+cZ3qZS6W9cAzi0SwbSq/2vUhx4r/Gl8VLmr8thtiu8qjjn5hhiLA56oZmXc1brMo1C+9+8cYltfafY+RN06spicF7QZaiPS4fv/XYjpRQtRWsWbGXqdhjSXJ//DAnxZSnNR9zHtub4ADLp1Oujw9hiSNXDPMhGScAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=gC6YhtU5; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHPuWr1Gv0edyBm8E/UdVGYedXM5qrnDFf17DZ3VVC4s4VdTyvghUcUsWjIgrpkootH/RLAmy8vBoj1u8YWSs0LGxLYIJ31nNJN+/N4GF67P8uOKTpudGyhEK1IJ181/HoBkYD187j6JQL0WM894507UnPJl71rDSlZKWzdLxVu/fDeZKRB09V2M145Es1iAa2H8PgV85mfHufXwaxqJlvqdS+WEhA+N3RDg/sBU8lmjCzYDBjOjvtDZU3KQDqHlE7T4gWP+Gsr5NSk6BXhi0uLS/lOgH4xBhFMyaUOEvkYEQXM9qHBOUEpH/9e4n7E2K8XDF7x0vwEPFB0wEYknCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThDkPi/ob63DMqGC0C/wKr8NP0OHwPdX2js1GN2d1zY=;
 b=QAYGC4eN0JrR9Evp1OJAyhLRhzoukF126M9BRMv4yDgcIDLENlgiDpbU8QdVjyPhPrr1G807I99M9HwueTgK5bDzR8OKLPefDC36DReE3Qlps8hXjQ/X6U8YxHiM4l2PZqJhltfsvsqYxTPnwGmsBFV2A2ZVruNMMNTa7G+rlx2Gxc9dnkqCyw9hjovbi+RzG6hqNmP+NMY7L1W3WyRlmWiVAD//mQJeBSjrPA3AME7SNjSmmZivBSRHDgcUn4qV33EXzjpJcgItX7liPVE/wyaKTn77fnHvF7ahZr9/dcUWjwzjJI/ERjE1YIe6x6l0XGkm/0JKRpDn1hgCEplUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThDkPi/ob63DMqGC0C/wKr8NP0OHwPdX2js1GN2d1zY=;
 b=gC6YhtU5HnhelBpw83DuH+cZHN4hFsGuUjKiM5AHCfJh0AisTnQCk5N0ELk+h4CDXfm8DweQ5DWFunlxTaY4LU6DXvbKzFQ1137TbWM8ZuF5xxai7nuk1Esa+LWPfc939vekFNbgPf7Mm0u7S8sQTykWORbLaxBMlAYs12tKczEgJ3nbZZEeB55PhSj0porcYgl6eK97s4Xvg94GU9Kiu5s2nxfEcuOfI7Ej0ZVvYRaV1u6mR9x9KAzEo1uBe9/q+Xq7A1tcfnmjaF7A1mJCk39iHCx/VYDGrnQg4mXSHK6GTxPfAaRnm1kkytPyNs1h4Hbgc2Dago42kpg6huN8SQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB6533.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:406::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 06:59:23 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 06:59:23 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"phil@gadgetoid.com" <phil@gadgetoid.com>, "warthog618@gmail.com"
	<warthog618@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"erik.schilling@linaro.org" <erik.schilling@linaro.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>
Subject: Re: [PATCH RESEND libgpiod v2 00/18] dbus: add GLib-based DBus daemon
 and command-line client
Thread-Topic: [PATCH RESEND libgpiod v2 00/18] dbus: add GLib-based DBus
 daemon and command-line client
Thread-Index: AQHazEtOcut5sR2dWEa+CyvNWntYwLHjAiUA
Date: Tue, 2 Jul 2024 06:59:23 +0000
Message-ID: <4598f0874412b2bfa20ce8457dc440d3da9a92b8.camel@siemens.com>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB6533:EE_
x-ms-office365-filtering-correlation-id: e001a6ca-abf3-4a7e-f214-08dc9a648139
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1dLN0YxWTkwWnB1WVZsMDJrSW1CbFdIVnhGNzk2aFR4VEkxdzlHMWpxdVl4?=
 =?utf-8?B?bnZLV2RPeE0vcm00dmM0YVVEclVoQXF6VVg1OStWVmNHcm9hZldmRStkRTlZ?=
 =?utf-8?B?alZCdGJ4R2wramFhVzB6VVp4K2ZPNEdJUmQxLzB0N0M0amIwdkZnSVFNL1ZS?=
 =?utf-8?B?em92NWRlTVJxQ0JwcEZQVElhOXhqNU5temdGM25mVVlSdmNkTVNqRDdkZTBU?=
 =?utf-8?B?bUk2RWlteXdQTExFR0RkVnRqZHJ3Um4ydUhuTTlaZDV3eXdHUWJxMko4ZzNR?=
 =?utf-8?B?ZllTT0VHT1MyZHJKeVU1SHBldGJnV1I1MmY4ZnVaR3NsQ1VSVmJRdUhXU0Rl?=
 =?utf-8?B?K2I4ZjQzMzJla0x4OS80ZVQydnIyakFCM3JMWXBtdUYycXN4QzdnaW4rQzRB?=
 =?utf-8?B?ZjNZT1FvTUtNZmlsYUhkbXVvS2FQa1JuQ0ovYjR0dk1RSWs3NTJMMS84WkRY?=
 =?utf-8?B?dzltZjZuQk1vN1BQWU5yUnBrWjdXYmVhS2pnUFZnbnBrSXlqd0ozYURvd1h1?=
 =?utf-8?B?VExvODUxZW1HeW1MdUpiTUxNb0tvSzBTM1JzMWt1dkk1ekVkRGxPU25BbWdO?=
 =?utf-8?B?eDE4RkxBQUJPNlQ5VGl4TTlrRUxzYWc5YmNkekxWWXQ3WG1lTXovdXRPd0RM?=
 =?utf-8?B?YllRU1lrUEFMN2p0TjBZNnJZTmFKNkxXd2pqY3E3QnhacWp1aklUbzkwZ21y?=
 =?utf-8?B?ZDhyWkc1SFhKd2VoaGtnaGlaVFdVWFZkZ1hnN3VkbWpDT2FRaFdBYWswamMv?=
 =?utf-8?B?cXNCb0JLalRwSlJSTXI1WElHc2VyVW1lQ3BjU0NmalVPSFZkYmNTdnYrYlcw?=
 =?utf-8?B?RmJ2cndMV3RDUUtFZWlvSTkvV1dTYWhoV2F4RG1WVHVCRFh0d28xL0hxc01i?=
 =?utf-8?B?MU0xTnRLaVNtTmpYR3VLY0FOQkg2dS9neVZrOGN1UXlzclRmbHk5Mis4VTJT?=
 =?utf-8?B?K0VPditPSXpLWDc2QXZhb3FxSDNwV1pCRHBwaTBpTjNwK3BqOEFzR1BTM0tu?=
 =?utf-8?B?VTg1Uk5DNUN2Z0lxT2owZTZUeXJ0dG9CaGZ5STFNYWxkdXVUS3hNZ3hCNjNy?=
 =?utf-8?B?QVgyY1FjTnYzdE5qb0NUTVptZlJrMkhFcGg4aDA5cWxYSkFzeWhxaHgwQ3l2?=
 =?utf-8?B?c2RuQ1hiVEFlNEQvb1BVNFBrbFpHUFAydkUwK21abUphRFNmNlBPclk5cnQ1?=
 =?utf-8?B?ek8vRmRBd0NWb1o3aWd3MmFkWm9tL3A1ZWhoMVVMZXJROFJzY3cxb3dmZ0Np?=
 =?utf-8?B?dzF0LzNKR1dveXMvMStkb0lzUXQvSndoVUR4MWNIWnFhYWxHSjRnQTJBODQr?=
 =?utf-8?B?RmUyMFg0R2pIWHlNU3ZTUmNJMVlkZVhSTW9ra1A5WGdWU0crZ2ZBOHgrdktZ?=
 =?utf-8?B?bjUrZjlWOU5hMVJuTWNrMXRPS1JNQ3NnN2JGY3FzUXdUZ0VPcjdGczRxblZK?=
 =?utf-8?B?aldSOFcvVmoxamdLWVRrZ2ZOUEdIaWZvY2JiN1FqWnh1ZW9KazJvTktVVTVx?=
 =?utf-8?B?RFF1SDAvWUhqMllsaDJYenptQUxPSmpwRWh2bytmeDU1cDlsME5HMFMxSVk1?=
 =?utf-8?B?WUNIM0JkRmhmLzQwSkxYQXF5WS9vbjJTT1llMmJicDdtQTYzdzNQZ1lyV1BV?=
 =?utf-8?B?VGlpN3ppaEo5c1piSGNlS0tCeUtaVnZ4NnVCVytkd1h5QkY3VitOWHg1eGlS?=
 =?utf-8?B?SU5FdW16VVBXWmlZd3FIRTQyK0Zyc2FnMzRGWE1ReGRHNmJpbUZ1MXdlc2FB?=
 =?utf-8?B?K3E5dlpCK0c1ZjFndVVQVE12REFlSmt2Q241a0dwVTI2aCtFVVJ5dmxUQktT?=
 =?utf-8?Q?+Q1O5V4tcwlCjRf5ec7V+aS7l8WvYmyTRpUbY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkE2UlhMUjlKOE0rbnVTUHd5TVRISi9nMXBkd2JZdDQ5SDE2TFJ0T054c0U0?=
 =?utf-8?B?aXhBYlgrSVRNZzV4b3hPTzRhNUJ2MnByV0JEMGY3SmNYVHFIOS9hT2taelBU?=
 =?utf-8?B?S1M2YkpleldQVStONzlSUWMxcTNWaXlwMDA0QVNsNVZSdHNvMFRMVjdFbFVh?=
 =?utf-8?B?RnBtUWEyd3NoQTF6Wng4TFZkY0dpcGtwN2VyZHcxWUFmOEpUVWhkL3dxMEJm?=
 =?utf-8?B?U1hzQ0tXVkdra2NJNkFQaGFWamtUV1VWQk5NLzFTQ0tnQVVuWk0vMVdMRmtP?=
 =?utf-8?B?RzdLOUVpQUtLVmR3QU1rY2g0UTVFbGdVNlBWRENRaEE3QUtBSzlGZ0ViUTNp?=
 =?utf-8?B?S3dabVpQZTdNV3JqMFl6Q1doRkIwQU5FemFyVnVSZEFpQTl3Z2xMOVFmb2ZU?=
 =?utf-8?B?TjFHTU9pbDRaOEs0RTRsUm41SmZSaE80VzRQQVdwd1lGRUdWSFFta1dTSURk?=
 =?utf-8?B?QitVNDlPNFBOTEtrOXJURHBzTzVadDJBMHozdW53NFl6eXRjcG5ZWFY1cUFy?=
 =?utf-8?B?NWxGM3lIeWJGTFljUzhXOVBNNmdUZ1ZjaDJTUlE4ZFBMMzBrNnEzUEZNdXF5?=
 =?utf-8?B?OTEvbndreUFCK1dqTEpmSm5WZWdhYUliSFRVL0FFeDZCeVoyTDE2TFpVSGJC?=
 =?utf-8?B?ZzZSOEEwWVNueUZNOWNjMVNYS1FhVGZjQmxpdnAxMndZU2pneXREVC9wK2ND?=
 =?utf-8?B?NGs5OUpIUDg3bVZzZ0hDTnZ4VU1jbndNWmpjT1BtNGxudjI0dklCT1VBM3k1?=
 =?utf-8?B?V1pBenVKNmoydGlFK3NSbWswNThiOW9wMjdqa2R4OGZGUUhJamN4VWd3SHlr?=
 =?utf-8?B?KzR1T0FESDlZUEZWOTNlMUJvd2I0YjNmTXRycEwxMVZjSnJ6TExqbmFFMFVO?=
 =?utf-8?B?SFFQQllxWm5WM0U3NW4rUXRpdEVGMjA1Nm5vSzIzcllZSEZ4Z1dZSDJSUzV0?=
 =?utf-8?B?UHEvMTFYVnBvZzhFM3dvWnVRY05GTlNYNmtsUGJJbTFLWGFUNWdScUVCMjc4?=
 =?utf-8?B?VzNNM0E3aFZTbnFhTmU3VnVFMU1nSW95UWtPNnZuQU05d3d3ZDIyZHc3MElr?=
 =?utf-8?B?YnAzNFhLaU1FTmRmVDhvYm9WL1hWVDlyRlBVZmhjUXliL3BjM0Z4SkRQdlBn?=
 =?utf-8?B?VCs1OHlqSVQramtsMXVYUTdOVDZ1YUVOcXBQRWMvbnorRFVHTC9la3dLRnlF?=
 =?utf-8?B?NFZDOFJNam91czNEYnhSekRkZkVEdDY2eWZsVHRocXowODRieXoyckV1Tkp5?=
 =?utf-8?B?MGJRZnJsUHhZYVhjZi9zS2kzdU1BSnlkSzZpUUd4WTJGL3lNWHdXbFJnRU8v?=
 =?utf-8?B?amlIcmpmZVZVeGJTTVgzQXVVR0JiZFFqY0VuTmFUOUlEeTVoVkdCWmNLRTBo?=
 =?utf-8?B?RUVVdzJ4a1pkVEtvN21YUjBRM29aODJmdVgrNDJ4TlR6SWcyTDhVUVdoSXVB?=
 =?utf-8?B?b1dDMXRXSnBPRFdMWjI3bHZLZFhqRVpMZm4vU2pDMFF2U25aZExPZVJvYThG?=
 =?utf-8?B?ZW5hakF3cldlUUMrUjVBRjB5OVNrQ1BnTHBsUkhvNWEwL2Yyd3RsZUJCMENP?=
 =?utf-8?B?OWJDdDFna0ZwWEZlM1g5b1hlTjY3L25lamZWZEpoTG5JVTZRbUs1ZHBVQU84?=
 =?utf-8?B?aW1SWGJ5RXFldDZiN3B3M2Y2K1JFeUJSOFpOeHcwOEw3dlFIOVdabnR3SzUz?=
 =?utf-8?B?REsrdXRhTGpJRHhoMzJTMndCeFZ2Vkc2ZWpyV3M0T0dMMFZzbUNRamZMdVVn?=
 =?utf-8?B?dW8xZ0JHUEVPNVJQUGZqTjRaZGtQdHVXNyt6WWJHaUpvRnBneUE0NERmLzBN?=
 =?utf-8?B?SjVCZGhQMkN0ampkZW9tak5Ka0JIK3NWQTdRdkQwRi84Tjl0MThQYUtaNzlu?=
 =?utf-8?B?RnJBZmRlOFlvOFhSUWs1ZmQ4YlBBcUE4bi9URE1XZkZJN3Boa1hLWmxTR09T?=
 =?utf-8?B?WXBMWlRjYm9nTzFZM1FaODllSzdQNWhzREtib1VSQ3lDbWVQTzJ6azk5MmQ4?=
 =?utf-8?B?ejg4dTRCakJVZjQ2enhSOTNkNktzeHJrOWJmNDlWSm52aXJsVnYxRnpzTSsv?=
 =?utf-8?B?OVUvN2VWekZxNWd6cGV1RW5xWDRDYlJEQWdJTUVVOVh5djdmZG9LcEQ4enk1?=
 =?utf-8?B?UXVMQlZnWmRMdzU4Y3lwWWoyYzA3Z1phY3Jtc3ZvVnNQRWJMMEdQeHJWTmJQ?=
 =?utf-8?Q?Lm4QseVZgSxQHH7OjTUkHX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22D46EECCAB77C4C8EFC70E0643F2067@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e001a6ca-abf3-4a7e-f214-08dc9a648139
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 06:59:23.4838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXoSTcN2ZNNA+f8CoZFrx20ceLPbndP0M0ThdZaXh8RBSVF5OuA6dCAj8NDDU4WLvUA+5iULvZ2hgVebgJ+pl0FGnVh4McZSOuqb3F0ekBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6533

SGkgQmFydG9zeiENCg0KT24gRnJpLCAyMDI0LTA2LTI4IGF0IDIwOjU4ICswMjAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBGaW5hbGx5IHdlIGFkZCB0aGUgREJ1cyBjb2RlIHRoYXQn
cyBzcGxpdCBpbnRvIHRoZSBkYWVtb24gYW5kIGNvbW1hbmQtbGluZQ0KPiBjbGllbnQuIEkgYWRk
ZWQgc29tZSBleGFtcGxlcyB0byB0aGUgUkVBRE1FIGFuZCBkb2N1bWVudGVkIHRoZSBiZWhhdmlv
ciBpbg0KPiB0aGUgaGVscCB0ZXh0IG9mIHRoZSBwcm9ncmFtcyBhcyB3ZWxsIGFzIGRvY3VtZW50
ZWQgdGhlIGludGVyZmFjZSBmaWxlIHdpdGgNCj4gWE1MIGNvbW1lbnRzIHRoYXQgZ2RidXMtY29k
ZWdlbiBjYW4gcGFyc2UgYW5kIHVzZSB0byBnZW5lcmF0ZSBkb2Nib29rIG91dHB1dC4NCj4gDQo+
IEZvciBEQnVzLCBtb3N0IG9mIHRoZSB0ZXN0aW5nIGhhcHBlbnMgaW4gdGhlIGNvbW1hbmQtbGlu
ZSBjbGllbnQgYmFzaCB0ZXN0cy4NCj4gSXQgaGFzIGEgdmVyeSBnb29kIGNvdmVyYWdlIG9mIHRo
ZSBkYWVtb24ncyBjb2RlIGFuZCBhbHNvIGFsbG93cyB0byBydW4gdGhlDQo+IGRhZW1vbiB0aHJv
dWdoIHZhbGdyaW5kIGFuZCB2ZXJpZnkgdGhlcmUgYXJlIG5vIG1lbW9yeSBsZWFrcyBhbmQgaW52
YWxpZA0KPiBhY2Nlc3Nlcy4gSSBzdGlsbCBpbnRlbmQgdG8gZXh0ZW5kIHRoZSBDIHRlc3Qtc3Vp
dGUgZm9yIERCdXMgd2l0aCBzb21lIGNvcm5lcg0KPiBjYXNlcyBidXQgZGlkbid0IG5vdCBoYXZl
IGVub3VnaCB0aW1lIGZvciBpdC4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gZml4ZWQgbW9z
dCBzZWdmYXVsdHMgSSBub3RpY2VkIChvciB3YXMgbWFkZSBhd2FyZSBvZiBieSBvdGhlcnMpIGlu
IFJGQw0KPiAtIGltcHJvdmUgdGhlIGNvZGUgaW4gR0xpYiBleGFtcGxlcw0KPiAtIG1ha2UgY29t
bWFuZC1saW5lIHRlc3RzIHBhc3Mgc2hlbGxja2Vjaw0KPiAtIGZpeCBidWlsZCBpc3N1ZSByZXN1
bHRpbmcgaW4gaW1wbGljaXQgcG9pbnRlci10by1pbnQgY2FzdGluZyBvbiBzb21lDQo+IMKgIHBs
YXRmb3Jtcw0KPiAtIG1hbnkgc21hbGwgdHdlYWtzLCBmaXhlcyBhbmQgaW1wcm92ZW1lbnRzIGFs
bCBvdmVyIHRoZSBwbGFjZSBidXQgd2l0aG91dA0KPiDCoCBjaGFuZ2luZyB0aGUgQVBJDQo+IC0g
Zml4IGEgYnVuY2ggb2YgbWVtb3J5IGxlYWtzIHJlcG9ydGVkIGJ5IHZhbGdyaW5kDQo+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZ3Bpby8yMDI0MDQxMjEyMjgw
NC4xMDkzMjMtMS1icmdsQGJnZGV2LnBsLw0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgZWZmb3J0
cyENCkkgZGlkbid0IHRyeSBlbWJlZGRlZCB0ZXN0cyB5ZXQsIGJ1dCBJJ3ZlIGNvbXBpbGVkIGdw
aW8tbWFuYWdlci9ncGlvY2xpIGFuZA0KZ2F2ZSB0aGVtIHNvbWUgYmFzaWMgdHJ5Og0KDQpUZXN0
ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29t
Pg0KDQpUbyBtZSBpdCBsb29rcyBsaWtlIGdvb2QgdG8gYmUgbWVyZ2VkIHRvIHN0YXJ0IHdpdGgg
WW9jdG8gcmVjaXBlcyBhbmQNCnRvIGVuYWJsZSB3aWRlciBhZG9wdGlvbiEgSSBkaWRuJ3QgbG9v
ayBpbnRvIERCVVMgYmluZGluZ3MgdGhvdWdoLCBJIGRvbid0DQpoYXZlIG11Y2ggZXhwZXJpZW5j
ZSB3aXRoIGl0Li4uDQoNCj4gLS0tDQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDE4KToNCj4gwqDC
oMKgwqDCoCB0ZXN0czogc3BsaXQgb3V0IHJldXNhYmxlIHRlc3QgY29kZSBpbnRvIGEgbG9jYWwg
c3RhdGljIGxpYnJhcnkNCj4gwqDCoMKgwqDCoCB0ZXN0czogc3BsaXQgb3V0IHRoZSBjb21tb24g
dGVzdCBjb2RlIGZvciBiYXNoIHNjcmlwdHMNCj4gwqDCoMKgwqDCoCBiaW5kaW5nczogZ2xpYjog
YWRkIGJ1aWxkIGZpbGVzDQo+IMKgwqDCoMKgwqAgYmluZGluZ3M6IGdsaWI6IGFkZCBwdWJsaWMg
aGVhZGVycw0KPiDCoMKgwqDCoMKgIGJpbmRpbmdzOiBnbGliOiBhZGQgY29yZSBjb2RlDQo+IMKg
wqDCoMKgwqAgYmluZGluZ3M6IGdsaWI6IGFkZCBleGFtcGxlcw0KPiDCoMKgwqDCoMKgIGJpbmRp
bmdzOiBnbGliOiBhZGQgdGVzdHMNCj4gwqDCoMKgwqDCoCBSRUFETUU6IGRvY3VtZW50IEdMaWIg
YmluZGluZ3MNCj4gwqDCoMKgwqDCoCBkYnVzOiBhZGQgYnVpbGQgZmlsZXMNCj4gwqDCoMKgwqDC
oCBkYnVzOiBhZGQgdGhlIEFQSSBkZWZpbml0aW9ucw0KPiDCoMKgwqDCoMKgIGRidXM6IGFkZCBh
IHdyYXBwZXIgYXJvdW5kIHRoZSBnZGJ1cy1jb2RlZ2VuIGdlbmVyYXRlZCBoZWFkZXINCj4gwqDC
oMKgwqDCoCBkYnVzOiBhZGQgZGF0YSBmaWxlcw0KPiDCoMKgwqDCoMKgIGRidXM6IGFkZCBncGlv
LW1hbmFnZXIgY29kZQ0KPiDCoMKgwqDCoMKgIGRidXM6IGFkZCB0ZXN0cw0KPiDCoMKgwqDCoMKg
IGRidXM6IGFkZCBhIGNvbW1hbmQtbGluZSBjbGllbnQNCj4gwqDCoMKgwqDCoCBkYnVzOiBjbGll
bnQ6IGFkZCB0ZXN0cw0KPiDCoMKgwqDCoMKgIFJFQURNRTogZG9jdW1lbnQgdGhlIERCdXMgQVBJ
DQo+IMKgwqDCoMKgwqAgVE9ETzogZHJvcCB0aGUgREJ1cyBkYWVtb24gZnJvbSB0aGUgbGlzdA0K
DQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

