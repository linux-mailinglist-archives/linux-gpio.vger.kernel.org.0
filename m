Return-Path: <linux-gpio+bounces-28494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 007EAC5D73A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E8D473490A2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 13:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2AD31AF21;
	Fri, 14 Nov 2025 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="a9tv3l5h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89F31A7EA
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128251; cv=fail; b=U/+jkraC3Gpn8KfBZFEKhm0Gfh175SsyY2r7NXx1yImq7U8DvemZR4XeXhJ9Ac8lsUBMXKKKQFBxCU2gOfOj/2Psti/NVcSsr++TQy8ki0eFTuxJdRGlAjyGd5oUR//U60w5J0IBuQaftI8fBzf6Ms27CWYuO5ba6983TSjjCbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128251; c=relaxed/simple;
	bh=FwsDU9n4uT3zuoZvfkF69jpCYfYOrR3C3Mn13q/c0/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t3wuxzAGbih5sdEWI1JZRSFGgInPMY8FNooGtUhprs14FiV43TIpn2pabovbBnFfLYBBbbWlozJomWZriLbUus25GY9Bz8dOmhc4qbLJFdfwOZj7KiLbQ8wcvtULyIqss4FYdZg+fA9YtLKEgIdv+njtKkXZ6TXzAcfGzeUCJIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=a9tv3l5h; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duYr+YFyLZzVlfGoZ1KkQDzjV0te9wVlwW5aJf1AdAPsqNcff6dgt2T2Xuk3Yi6ZICCGUX2FBmV2uxjero8HDUt4mv5EtMCZkXKUwi2PXzDuztgzN1XWlY8iLe5IwSJBGPteECIUq4d0qzHZKYUYu6T9/zmDPwz4LB9kNPpVZqt7lbHLnbnYMgOLXLgdaF0ZHa/DkiIIXWVHbP+KvkHXxBeaDA4WkudxmyIqMBi5UYaj/vb3MH30b3mQDJNEOCpOU+gp0OxEXFuytd35aCvBVJD7ilT15tkfc7AY6Lz1a5z5s6b539GqCO1n55ams2X006j/q4qLrTaRJA2RND+1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwsDU9n4uT3zuoZvfkF69jpCYfYOrR3C3Mn13q/c0/4=;
 b=pX1epWINmvA2zJGfIWyvAANuftMveNinKC1CbsfFACOO2IamFK6mI8nKvYZUPwGPON7mve2rBGqNp37jYsfUEVIwrUF5YwTkb/SbIDb5/VQalzUAgkgMqdcyiQLP1IwiDHT2aTbpeuhmPtRoKAfBvXFtJcMvGnjrwsch7FJ+S7EO0gNyQxwlUuNoAP/ICusLys6hwi4N3O6Z0Z3dI/tZZJSp73BdLZ3rxP8ozLsyAcey6TrfrNwEVXalo274SehFPNl0i7Hg6+jlcdhE5laNoLmBq90iI+TvUOnRcH01HZFIJKx3WW9u75R1vcybLNi0x4Qc1enrn5W70FFieTffVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwsDU9n4uT3zuoZvfkF69jpCYfYOrR3C3Mn13q/c0/4=;
 b=a9tv3l5hev/fUfbXHhs2d4AoUaYHnruCbjOMLwSDe00VT9Cq6958Hv9CPJM4NmkzK5i2ka+3aXGrbUwiSlJ35DW3LRuKQpUV7XxkUGZe3aalV2MKya5Trtxbj/P8RU5sBvcj8cwSf0J4hbAbT54HmL31jnb2umBO9yRNeSiCOEvQsRdSHrEhLyvw9M11zCDD7Hipa0+giAFq2YXtv8hcl1Vf8TNhNWTx8oWOGQWzfFRqdOTAIGOdFyAkPAzmjZQgwHHa0DjAjD+rRcqgAwfHvvSFuKa8zDMvaVbIDeXE5WTRv2fWNRICoiviQIPN2QymYXq3h4mPoPivSEpUIJ/57g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB7875.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:629::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 13:50:46 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 13:50:46 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip
 twice
Thread-Topic: [PATCH libgpiod] dbus: manager: don't try to export the same
 chip twice
Thread-Index: AQHcVWrJiIxc8vuKkkSx3HGVJLRr8bTyMIIA
Date: Fri, 14 Nov 2025 13:50:45 +0000
Message-ID: <65bd94d8b78c6f9e387b4468ce600a5cfdfa7bfd.camel@siemens.com>
References: <20251114132957.33750-1-brgl@bgdev.pl>
In-Reply-To: <20251114132957.33750-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB7875:EE_
x-ms-office365-filtering-correlation-id: 575fc137-0239-45ac-4f66-08de2384cfce
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WVZVbEtWeDVPRjJzdFk3MWpaQ3hYTjl2aXBLZnZZeWFGYm9tRkRpVVI0ZjNP?=
 =?utf-8?B?ZzZiNGRMUUwrWi9zVk15RkNUdFlKaERJZDcvOE92cnRvSWhOdnR5QWtuUmhk?=
 =?utf-8?B?YnhhTG5hazBENzhXSWMramh2NUt2ZXJ3RjUxNzluZm1FUFFYVVBheWkzTHdm?=
 =?utf-8?B?LzBkK0Rvajk4YWJMVzVPSWk5dUZlUzJLdVdpZ0lLTzlmb1Zxci8vL0NGWER3?=
 =?utf-8?B?NlNzK25QVzZmOFFQQkFOM3BjSUxlQTdDUlRrWlNlL1ozU0wyZ0Z4cnRMWTJj?=
 =?utf-8?B?eXl6K1o4V1VkSXdRelM1TVV6YkxuSFR3bk5wNUp4aWo2YzAvOHhzQ2xYbDIz?=
 =?utf-8?B?RTV4V2JBbDJ2ZFh0NlRHMDZCdXU0ZEI1ZXd2K20waTF4cG5DRTVsaTV0SWpE?=
 =?utf-8?B?anZhSmJKOHJLa0dZODl3ZzBlVUg5S01NR2NhY2VrdXJidEdxSTVMa2pUdVZC?=
 =?utf-8?B?ZUk1UTdvTFYvNmpzdXFxMG9IdnlhWW9NMlhzOFNJa24zLzJ5b1h0L3AyMW83?=
 =?utf-8?B?MHZ0M21URHg1cHh5ek1xcSsyUHpRaDl2ZzFpRnVsQSt2dG9VNUswMlVFNmxZ?=
 =?utf-8?B?Z2l3QmtMT0ZXYUJ1Z3gweW5PaU0vQmlkTmdsd3J5aW1lYkVNdGhjcU5iLy9w?=
 =?utf-8?B?bUMyUGkvZmpDbGY4SUFDTjVQVTBzekNQblc3UmVoQ1B3b1JsT1M3dXlscGJu?=
 =?utf-8?B?SFJXK0hZNGlabFcwK2FPd1ZpY1JhcmF2a3pIYTZOdVUzQmJFMmhoMGlKNkx0?=
 =?utf-8?B?d3E4aEllQmZvUk9VcXZNSmV0L0IxODFseWg3ZDhZVnptOG5XYVNPc2VxWEI2?=
 =?utf-8?B?N2RwSDdhb2RkSHl6OUMyRkp3ckZQS25QVENMSzJFZVkzbkZwY25yLzBWYmdB?=
 =?utf-8?B?WCtXWU5EYmx3MEgrdDk0MWlneGpzWjZUck0rL3QwU0ltemxERlJiZmVnYTNJ?=
 =?utf-8?B?TlpjV09TUXpIeEJJUTYrenYzRnRXQkV2UHpBV01oUTJwa0lBOCtZYWw0QURJ?=
 =?utf-8?B?RkJMNjZSZm1mZCtpdVBOcDRBaUwyS1NuTldKTjdDS293c2UvUTBrZitLdGdE?=
 =?utf-8?B?ak9aYTJKQlBTSGxuL1dxWTNhb0N4L21JMFR4UnV0dlFORkZNSVAyZWh6bkVH?=
 =?utf-8?B?NHoyMmlvcG1ZaVVwVG02OXl0bVJnaXBUM2R3c0x5WVdPMWprTS9YRjNaVlFZ?=
 =?utf-8?B?bWRFeEZTMjArQWZGelArZG1VK2NGdjN4OU1rc0pXQkpQY0pTNGpzVG45Y3NS?=
 =?utf-8?B?WEpmY3p0dzB0RTJkcUNYSUNZN1ZUV2xGa09ITVRXUm1JSndKSnA0Qmh0Sjhv?=
 =?utf-8?B?Y1pZWEdiZm9tQVNMb0o3dTZMMGY1Tnl6QllJc09wKzZvTkNiUURabkJNejNv?=
 =?utf-8?B?OHdoejQ4R2t2R2N4N3g0QW9rdFBsdTY5YThYL1VvY29IcDQyZllyckJsVFRu?=
 =?utf-8?B?bU9pU1liNnVqcWF3c25KLzI3eGFxRFQzOHpBVzJZUEw3K0dzVTBaazZvL2tx?=
 =?utf-8?B?UnY5R1VISm1MenpUTkFyZlB4dElldmk0T2ZQN0Z5UzdYakhyRUhiZUMxd3dK?=
 =?utf-8?B?YzdyN1pwbWlDV2dWVXhicnl1SDhKRkozbVpkamdYK21WZTFmSGtPbEc3VUg3?=
 =?utf-8?B?V3M0andKUTNudWdsREFBWTVpMzAvUVRRMGE4dnpPKzQ1SG5McU5MaEpNRkVz?=
 =?utf-8?B?eWNpaUtQOWtENHBWUXFnNVo3T3NYREU4clhGNSt5Y3Y4U0xRcnNVaFh6TGF2?=
 =?utf-8?B?U2dOcURnOU15S0tKK2ovQ1JYNWxtQXAzMW5VTGVnbk9YaDBZVDFrdDhSSVpH?=
 =?utf-8?B?dEdJNHhSWGlUaTk1c0QwYktuanlmZ25MaWlHeTJlOER4VWZHS0tycVJIQkZp?=
 =?utf-8?B?RkNwZXp3elBZa0xzb29SYUpmclNtMkNKVDlGTmxtaHd2ZHB6N1VTcFF6dXBG?=
 =?utf-8?B?NmprWmE1d2JISGNDRFJjRXh2YTRrcmkzempGRVlVbEFDUHdMblA2aGlFY1pK?=
 =?utf-8?B?QXRJa3laNGdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFJXUGJHV0F0S24wNWpqbTJaTjk0UjZlak5sN29GR0d5R3FoWVJSUHhxWE03?=
 =?utf-8?B?azZwczc0NVo0dzJpSTVkQmFJUHVrSXFibVJJMGwvMjNwMXZoQmFEcjk5RU54?=
 =?utf-8?B?WTFUZjR3Ty9wcXdISkx0ZFVtWkF5NCtGR25kT0JYSXByMU5saGRZVjBiQzdE?=
 =?utf-8?B?QmlSWUgyNjluQUdRV0YyU244L0hodVRRNnNZZkYvaVpaV3Npb0xQRFFjV1JQ?=
 =?utf-8?B?RVdrSXQ5SDkvNldxdCtRSk9HZUdiRk9idUgvWk91YmNJaUw3N1J4dHQ0Zk1L?=
 =?utf-8?B?U051UUZGL0NJSEdTK0l5N2hPVklPbklFVXhWWGM4QVFOTFRDWUVDVHZ3U0Zy?=
 =?utf-8?B?ek9KR3g5WC9aZXBiK054Y3VRd2JaZzBmMjVPNDAycFpQdGdUR2FKZHRIUjJk?=
 =?utf-8?B?Y1ZrcVpIZlNDQkxlNDFsNlNuMnhpZUxET09oeHdZSHR4MkoxWUJJN0tadm5V?=
 =?utf-8?B?NGw2NGRWdkZ1TU9Kc09TVFRzVlphcXVqWDN6YndZdVRINlNMWkFVQmJoZjJR?=
 =?utf-8?B?dlZ3R3Q3ajVOUkYvd0pVTjU4UjBhNXpuWTJpZEtJWlh2QkN0L2Ftb2NGVEgv?=
 =?utf-8?B?dDNLaXJXUThwNlhCd2lGNkFBMVJTcVIvNElWS3VsOWptN0F2cERHaFloS0Za?=
 =?utf-8?B?a0Jza0Ftd0FCa3p3YnNGTWlSeTRsUXNDOEFJNjREQ29kUGVoeFA4Z3U1UFRJ?=
 =?utf-8?B?WWJsckQ0dFVTdzNsYWd6K3Rjc1NhUEYxV1o4SmNpOWRxTktrOFdmU2VzY2lY?=
 =?utf-8?B?S2Zva3pFZndEZzlIVTZZRDlEcTFjRDIwcGtwM0U4QjlHdFgvNlBPaGpUc1Zx?=
 =?utf-8?B?cFhFdDFCcERPQ3FNdi9tUzBjaWxVenNyU01WVjBhSXNUWkVNNk1ZNXdEbGRR?=
 =?utf-8?B?S0NSZG9XUFJWb29aalpoSmxoVlZtdDFINEFrL2wyM1lVTHRrWlBlYTFLZlYx?=
 =?utf-8?B?MzVGK1J4SUZyN2FaMkxxSUlOS1hSTWFiV203SUMzUFAwaDZ1djYvZkxMbS9i?=
 =?utf-8?B?OG1VOGZhdUlCU1BZNGN1YnFLWmU2Z2hpWFk0UzR6TTd6Qm1pOTduYVFLbi9n?=
 =?utf-8?B?WHlrYVJzSmRVd0xwYmpyLzRweHV4WXNUd0RISzJPZzYxQmNOdTdoUFQ5ZlhZ?=
 =?utf-8?B?d2I0YUZWTU10NGJ4T08yYVV6QkVZMit1UnJodE1BWDFWbjM1eFh5Q0NNemFp?=
 =?utf-8?B?YkdYWHVLTnAzZUZZS0plUkwxZWlsYXoySDBPVkttQk1hR1VsQnJOQUNVb2cx?=
 =?utf-8?B?dDE3VHJxMTFFRlZJcGtZZTJ4RklmUnJUWnRkbUZtS1o5WDNqWmpOSzY0UndP?=
 =?utf-8?B?TGptVTdqQVN6MnNDUnFKK0FoY3JLVjRsaFNML3ozZGtYUVoxazZjTENNMS9U?=
 =?utf-8?B?eks1amdCNFVTakJqWm5CVmlKeGhZOStlMXdjQ2dDa3dVN3JZWHVUNW0rdUdB?=
 =?utf-8?B?cHlhQm13R1FkZmtMSG00eW5YeWx3SEFvZXE0NmhEVjl2SFplYmJIR21LK1ZT?=
 =?utf-8?B?WUs1SXlpZHdydnFwa0FCSitiSlRyMm5DNFNxZmRZcERVanNpc0ZjZzB0YVll?=
 =?utf-8?B?Z1d6NzZhZk93d1JTOEgzWXplblFpYWc1QjR3M3ltN3UzYmh0ZlY0VEJaREsz?=
 =?utf-8?B?MmIzQ253SXNQdGZWVEdXc0VOUlhrd1NtYmkxbWp1cENhbWNEOXB2R3NjN3BI?=
 =?utf-8?B?RE1jTTdidkMzNjAxVlZHM3NnL0RHU1UyVVhieURUKzFHeEdEVG1jaXl3OU8y?=
 =?utf-8?B?M2ZRUWpFWDIrNTNGMExxU1JtOHQ3VjB3WmJYOEU4R0xDV09FVDlPR2pydVNh?=
 =?utf-8?B?VTNxbEk0QVBHRDJmdUhUTWhhZVM1NWNWVDVzY3FGWkJKRG41a0NLL1lPc3FD?=
 =?utf-8?B?MUd3MGVZMXFqMmRhcXNPYUpmZ1JjbWhSRHd0cExkZGJka1U3bU93QkVPejdt?=
 =?utf-8?B?UlpqMFgvVStiY3V4a2RNNTRNdWdUUTFSaUpGNG1xU0M5SmdLQUJta3htKzRX?=
 =?utf-8?B?MUhXcEZNVzBQRXYzRFp3dDkvL3AwaWEzWStmbEc1RDE4SkdYaWFUc3BYK2ZY?=
 =?utf-8?B?c3pObjlVQkxqYnliQkIzSXVsZnkxdXN1bUx6Z0pDbS96WENEUGR3Tk5KRXYx?=
 =?utf-8?B?dm9nbjhvYTJJaW9qcVdsWEp4M0F5VVJTOEV3SzRwQWpzL1YxZ3VkdmxkdUVU?=
 =?utf-8?Q?E9XeVlMnzq/64wmLTjIAYTM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54C82CD536DCA542AB0A1AFED697790E@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 575fc137-0239-45ac-4f66-08de2384cfce
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 13:50:45.3074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV56o6wTveSIgu3pWMrqOEilHaJfTec9YuIUnvDHD2079SPC16IQHUMJ9WBT4Uzdm1JzbPI7KAh37JrPCaUQvqTimlfKkCS/UeZz7AUFsJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7875

SGkgQmFydG9zeiwgdGhhbmtzIGZvciB0aGUgcGF0Y2ghDQoNCk9uIEZyaSwgMjAyNS0xMS0xNCBh
dCAxNDoyOSArMDEwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gRnJvbTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiANCj4gSXQn
cyBwb3NzaWJsZSB0byBnZXQgYSBzZWNvbmQgYmluZCBldmVudCBmcm9tIHVkZXZkIChmb3IgaW5z
dGFuY2U6DQo+IG1hbnVhbGx5IHRyaWdnZXJlZCB3aXRoIGB1ZGV2YWRtIHRyaWdnZXIgLWMgYmlu
ZGApIG9uIHRoZSBzYW1lIEdQSU8NCj4gY2hpcCBzbyBpdCBhbHJlYWR5IGV4aXN0aW5nIGluIHRo
ZSBoYXNobWFwIG1heSBhY3R1YWxseSBoYXBwZW4gdW5saWtlDQo+IHdoYXQgdGhlIGNvbW1lbnQg
aW4gZGFlbW9uLmMgc3RhdGVzLiBXZSBtdXN0IG5vdCB0cnkgdG8gZXhwb3J0IHRoZSBzYW1lDQo+
IGNoaXAgdHdpY2UgYXMgaXQgd2lsbCBjcmFzaCB0aGUgZ3Bpby1tYW5hZ2VyIG9uIHRoZSBzdWJz
ZXF1ZW50DQo+IGFzc2VydGlvbi4NCj4gDQo+IEZpeGVzOiBhNWFiNzZkYTFlMGEgKCJkYnVzOiBh
ZGQgdGhlIEQtQnVzIGRhZW1vbiwgY29tbWFuZC1saW5lIGNsaWVudCBhbmQgdGVzdHMiKQ0KPiBS
ZXBvcnRlZC1ieTogU3ZlcmRsaW4sIEFsZXhhbmRlciA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1l
bnMuY29tPg0KDQpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJk
bGluQHNpZW1lbnMuY29tPg0KDQo+IENsb3NlczogaHR0cHM6Ly9naXRodWIuY29tL2JyZ2wvbGli
Z3Bpb2QvaXNzdWVzLzE2MQ0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiDCoGRidXMvbWFuYWdlci9k
YWVtb24uYyB8IDcgKysrKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kYnVzL21hbmFnZXIvZGFlbW9uLmMg
Yi9kYnVzL21hbmFnZXIvZGFlbW9uLmMNCj4gaW5kZXggOGUxZGU4YS4uNDYyN2U4YyAxMDA2NDQN
Cj4gLS0tIGEvZGJ1cy9tYW5hZ2VyL2RhZW1vbi5jDQo+ICsrKyBiL2RidXMvbWFuYWdlci9kYWVt
b24uYw0KPiBAQCAtNjg4LDYgKzY4OCwxMiBAQCBzdGF0aWMgdm9pZCBncGlvZGJ1c19kYWVtb25f
ZXhwb3J0X2NoaXAoR3Bpb2RidXNEYWVtb24gKnNlbGYsIEdVZGV2RGV2aWNlICpkZXYpDQo+IMKg
CWdib29sZWFuIHJldDsNCj4gwqANCj4gwqAJZGV2bmFtZSA9IGdfdWRldl9kZXZpY2VfZ2V0X25h
bWUoZGV2KTsNCj4gKw0KPiArCWlmIChnX2hhc2hfdGFibGVfY29udGFpbnMoc2VsZi0+Y2hpcHMs
IGRldm5hbWUpKSB7DQo+ICsJCWdfZGVidWcoImNoaXAgJXMgaXMgYWxyZWFkeSBleHBvcnRlZCIs
IGRldm5hbWUpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+IMKgCWRldnBhdGggPSBnX3Vk
ZXZfZGV2aWNlX2dldF9kZXZpY2VfZmlsZShkZXYpOw0KPiDCoAlvYmpfcHJlZml4ID0gZ19kYnVz
X29iamVjdF9tYW5hZ2VyX2dldF9vYmplY3RfcGF0aCgNCj4gwqAJCQkJR19EQlVTX09CSkVDVF9N
QU5BR0VSKHNlbGYtPmNoaXBfbWFuYWdlcikpOw0KPiBAQCAtNzQwLDcgKzc0Niw2IEBAIHN0YXRp
YyB2b2lkIGdwaW9kYnVzX2RhZW1vbl9leHBvcnRfY2hpcChHcGlvZGJ1c0RhZW1vbiAqc2VsZiwg
R1VkZXZEZXZpY2UgKmRldikNCj4gwqANCj4gwqAJcmV0ID0gZ19oYXNoX3RhYmxlX2luc2VydChz
ZWxmLT5jaGlwcywgZ19zdHJkdXAoZGV2bmFtZSksDQo+IMKgCQkJCcKgIGdfc3RlYWxfcG9pbnRl
cigmY2hpcF9kYXRhKSk7DQo+IC0JLyogSXQncyBhIHByb2dyYW1taW5nIGJ1ZyBpZiB0aGUgY2hp
cCBpcyBhbHJlYWR5IGluIHRoZSBoYXNobWFwLiAqLw0KPiDCoAlnX2Fzc2VydChyZXQpOw0KPiDC
oH0NCj4gwqANCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVt
ZW5zLmNvbQ0K

