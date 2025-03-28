Return-Path: <linux-gpio+bounces-18074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC03A7420B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 02:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 542993B11C4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 01:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F80C1C5D63;
	Fri, 28 Mar 2025 01:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="LUK6k4ET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021083.outbound.protection.outlook.com [52.101.129.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB114831F;
	Fri, 28 Mar 2025 01:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125229; cv=fail; b=LnkcKW+ArbXzeu45w2elnFsDziTcFFTx0jlaCCRxsDtnAJ1AdQam7MH4DLvilsPgmLxktW5c9VCo5r1x4JdpJHQK0o0NW9kQnbmLoUjprMLxLhr9W9Y7oCqIQoMt50S4VbbF0XquxDqMfkV97VwBBbxFSgQvKlKwIwNIppDPZsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125229; c=relaxed/simple;
	bh=pofj8NBXmGNJx1nBKKPa7Ob0+S24TAUCmw4rNYfBuSE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uLrXCR0r3fvF2GSMcPWiznOKngOB97YVEEgSUdO5Y9/21g1pd1E3n5ITPZEXMDM40NmMOfoCZGuODXyon1GmPGx94Hz/ScdKc5kRjLh9pp3wJVeBNkiURxFC5HFMEGd3n22fLc7mZ766P/A8daV2usbZLZMmwhgCGcGHoHoofxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=LUK6k4ET; arc=fail smtp.client-ip=52.101.129.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqHnsz3uuJWBPa1hd7di+4N84hjWo/0jiU/Aa5h1Z7SQ5tB9dGYB3p5Wps4nW4mrgmeZpa2JmhLEUyLla4XtwMvzinVCN9qoYbAUalixJVSbT89h4txp7Va7glBEHH1MXSm3aKhGHXOk4u5bltJnvGU1vIty5FBAAPNAzQINQcCuYtKDr1IGa85UyvQZBcK4xnxCShLfLazd6nOnQZSHoz7YWZOttXhsiC7ikEhuzjtEvBFU/5+7q97l3F0L5rrkAE+1nyb9in7Hlv60YhhgslvKJiKkQqkcZpQXdfOqSY7nwlF5pvJqGpibJM1951dQ3fEgi2DBBRBWFwaZWToghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKNPxejicIFLbFNGWphsLAzy1AyCVC510QJy/+zFFJg=;
 b=bwX+QGO5NGNfedGGzzhmFhqIqGcPCBoJMIkH3g2p0S5IKJsnC7nz/R+5PVvh7dIlN/r63dmghVgEj3aU11T41vPYeJcR362PAor5wTPl4FM0ZxHoB3aGxG90/8AJCPSR5zUNLq40sfet2XbTQPWFfKLLuvM/rch4DcRA1ryBSdJfy5a4ppktGdPdJu7albFpbQ/A+ciKX4aE4jg6CJkfk0Ikiwir7mMndhquHwTvMWNXOFzN9PcrgYWITzfC5iK+7uuTX2FTU273ebZ49XSWH2lHKGrC21p1vEkFySD75/e7z9nNn+Ww/VnmYFMGJ4/tKbMn5YViNgBEmuVVDXd+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKNPxejicIFLbFNGWphsLAzy1AyCVC510QJy/+zFFJg=;
 b=LUK6k4ETQoabF8vnAZKJnajbIZI1GYLASHU+NFBMDPMeCgMnS8CYpktyDdmPb02p5cl7yJOLEzA7Wn8fkEQUdLQ9DKxb5q4bPNBfGIPavX5kZJEfJKsIJSp6FYO8+3UzLfuFluBkfnk74w6yHuHIks/yQ9yo7vxIoezEkBAg8vuKLOIU5Jgmq4wKtdU8qCucgCXG0/+Wn3/ke2Z7L/E6s8G6WDNwL/Pb1ef9a6xPm7QBLqtUOM7mcUfrEWG6TaSFOGlwAn1yszhj2DOwyv6AT6G7zNR7KKYOGpvfJAcD6Zl7QJxHULjptgUW+ocisJn0pgoSCrjDgG3us717+oizlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7412.apcprd03.prod.outlook.com (2603:1096:400:41b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.28; Fri, 28 Mar
 2025 01:27:03 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 01:27:02 +0000
Message-ID: <881700fa-ccd0-45ad-a4b6-56d5821b958b@amlogic.com>
Date: Fri, 28 Mar 2025 09:26:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
 <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
 <20250327-juicy-relieve-a9c5f89cb4e0@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250327-juicy-relieve-a9c5f89cb4e0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::30) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 9034d1c2-5e20-4c7d-9730-08dd6d97a44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1ozU0RJdFI4UDNadFFlLzk3ZmZXVUhjc0FTT1lJdHhRVVU4a0p1WVhjVG9p?=
 =?utf-8?B?WFkwRXg1dHBEL1Y2dHpKd0ZzNzhuS05QVlFVMDVkL2RDRTMrN2dIU1EzMlNB?=
 =?utf-8?B?VmNncm5HRG1jT2FjL2V5NGduMjVnUnJ6elNFYkJBZXFnNmluRjdWSitiQVlT?=
 =?utf-8?B?Y2d2SU9pTzRLQ0I2NTRGTmYrZmhpZ0ZObVpiZEpkZXdnc3YyTzdmMDhYQkw0?=
 =?utf-8?B?TkVibWVIU2RxNWZZV1VUTnBhQXlpMzRjRFh0L09FUkVKL0lleVBGYjFVcnhE?=
 =?utf-8?B?WSt2ZlB5eDRzNWdzeWVGUGFyM2J5ZzJXVDVvczAwc2lpVlZjcDVjb1FMMFZ0?=
 =?utf-8?B?c1B3Wk14YWxiTTZYOCtPTGVjajVsR3N3TmxnSmFORnpUOGdEOEVJUmppQkRF?=
 =?utf-8?B?aGFZMW1yVVdISnJSenF3QmoyZ2Z0eW9PZnZOcmZCWEErcVI4VUpaWVJKYW0x?=
 =?utf-8?B?QkpFRFhOVGcvWE9iZmJWQTRwSjNpNEQ0TlZUcG82L2dhRlpDMXB1bWdxTVVv?=
 =?utf-8?B?R2pxRTNOZXI0TDhrVzVUcnBRL0JuZ3hKRWREZzV4K0duZVVNSDdDSmJ4NUhJ?=
 =?utf-8?B?dXdyT2JJTWtBaDNGS2lwS3FjS08yYVcxYnY1QS81b3lqZXVJaFNsWGUzL2M3?=
 =?utf-8?B?RzFsU2RaSmZXaWZ3a1g4RkpLa242dHU5TFRxbWh0cFU2cld2T0hhWDJRc0Y1?=
 =?utf-8?B?N3IxZkNNSHZXVEMraXdVZnQzamttZDJtc2hmNHpoNWI5ZEFMdHY0VTJMVVpV?=
 =?utf-8?B?M0RFRXhyTjkxRWdpMUVrNk9JWlNhNGljRFBTT2E2ZFY3UktlVTF1TnlTZnhQ?=
 =?utf-8?B?dWQzVXNqZnJ0RGpLSnJqQUdzMXNLQml6NjJRZU1FNmdnSi95WnhUVjRxQUNl?=
 =?utf-8?B?UFhjL1hrdGk0K011d1kxNllMYStNblp5Um4xTEo4aVhLaHl2aTEwM1RwREZa?=
 =?utf-8?B?NGZLMHZJS0lpd28zejlEVWdTeGorQTRZbU9CR1NMMGg4c0Y3QjBUUlgxRWY2?=
 =?utf-8?B?aWVjVUsrVjIzVlpNQ05jaFRQalREbWw1TWxTamE4eW1aMWJkNFU1SEFvKzFs?=
 =?utf-8?B?cTNXYUJES1FHWHIyOHVPYVROYmFxbXdydWZJa0RMSFNmUzZTem5ZUCt2MzdT?=
 =?utf-8?B?QXc4RjdWT294VTVxV3c4d0oxUkRYT2JGUUZyMVlWMXo5VnZyemQ4bk1PZFVD?=
 =?utf-8?B?b1FNcDNBdXJJQlhhb0RvQ2ZUNTlMcHVENVMxTVJtMlJkVkcyTWhoaFFoSHBH?=
 =?utf-8?B?N1U3ck52MGJ0T2pZNFUrd1pqNVRxOEc3d2laR1krcGVBM1RpNXVGNzBHZE9r?=
 =?utf-8?B?SG9hQkNzbW9yQ0pHdjYrK3c2T1VYOVg5U3Z4M1lKR2h3NEZTNlFONCsyOGE0?=
 =?utf-8?B?VnkvWmlZeUVRNjV2TVF5a3FRSU9TV2ZIYjRKY2trbnJSMnRZaDVHdEtoRm9J?=
 =?utf-8?B?bmtwQlUrVncvYXhaTHpwSzZvOC9DSzU3VmI4TndKOWs2cGNEYldSWW56d3hh?=
 =?utf-8?B?L2lwVU1XSnZHZ0dJS01rd2tEeHlGNzZyRU9jOW9uYmlTcWlEMlNQRy8yZzdL?=
 =?utf-8?B?TTBlVVZPd1ZCRjd5c3U4dWlvbUVtUjQ4cEJBQ3ZnRWhYMkQzcnNmcjhXdzV5?=
 =?utf-8?B?em9LZ3ZaVURiNmppeHQwUmlFamVMSEM1T0pWRFU5VDlmQUNpbnhCaXZjSjQ1?=
 =?utf-8?B?OHRrSHNYcUN3T0ZHRWNrd1IzUTZBVmZISWJWU0hJSG50dkdYc1Fvb255ckQz?=
 =?utf-8?B?akFleGhtWm5ZdHl1Mm9rODY0RHQ0cnltSW9OVEllekgwRVJ1M3FOQnhlcksy?=
 =?utf-8?B?K0t6VHRSaW1ORk5LNTUvamQ1L0oxQUN3ZTlDSUJkd2NoSHVya3pEY29lSVhj?=
 =?utf-8?B?THdSbjBrK2M2cU1CbEhtN1U2U3FJU081M3FPZGtMdlg3RURwbVFnUmhrNEZ3?=
 =?utf-8?Q?Kp4K0q8TZVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXY5VC9JRDFTcGFNU3JBcXRqUFptcURLcTgzN1RYbml3UlgydTZxS0hNMTRE?=
 =?utf-8?B?eDZqM2Z4bUVUVmYyQWYveTJVNVpKRkRORGQ4RHFYbnFyRXJrMFg5VHZKckhS?=
 =?utf-8?B?K3NhdW1FOXdJcDBtMzRNSGhIQlNCZTZIOHNiQ0ttdFNDQUF2bkFXSitMNGUr?=
 =?utf-8?B?bHhzeE5PRXhFUzFIOVg4TFVKMTNMWk9KZUxYbXcrc2RoRU5ja3VPdE5zamFG?=
 =?utf-8?B?TnU4aVJqcFFOSjkxWGlYNzVwUlV1TnlFUHFPclRPMks2TGNwOExjMUNWZ3RW?=
 =?utf-8?B?T3o0YXVPK2Q1dXYyNjE2MVJxbktzNW03bG9PSW1GcVN5VXl3M0ZBVU1jenRH?=
 =?utf-8?B?UE12MUhTa0lVaUNtV3ZRa1Q4K0JMQmYvWlpTSVdTTGcxanQwVjh3S0VCMm1B?=
 =?utf-8?B?L0hWeHhpTFhwT2ptZ05rNE5aYVdpVTdhYUNDTktBcXVhZ043cG9OZ0Y0dnBz?=
 =?utf-8?B?SXE3MS9kSlZhZFFOQnhBSzl1MFdwMWpIZWYwMkFQeDF4bXdqUmhDa0oxQWZS?=
 =?utf-8?B?ck93WmdicXlmZTBMMFV5d1NPZ0k0djBSYzMzcUJWRHVxN2F3UjFnUUpxMzNP?=
 =?utf-8?B?anFRSVpzektGN0ZUUGd1Z0Q5QnozSFVqTDdHY2FlRTMwVXBvbzRKdTJQODAw?=
 =?utf-8?B?NmZCK3RKbFBESG5PdDFVT2NBY1d2SFZSSjJyWDRCQmlNL3BIR2xXRjh6RXh6?=
 =?utf-8?B?S0dUcHJHRTRRZWVnMHJpcUtKMURjaHdpZlZaQVNKWFFRUS9YVEYrcjIrdlUz?=
 =?utf-8?B?elJLT0wveVk3T0JJL2VIa3cya0RxZzRVSWZhaW9rdlkxY1dHT1lwdGErTWdi?=
 =?utf-8?B?VnVrdGxRczV3clRld0hiNURuYkxXd0h4b1VLSTYwOXZsb1VZOWExcDlQcjBW?=
 =?utf-8?B?UStyTVNFanJ2U1ZpeklkamhVQUlPOGhBOFFya204M3BNTVU2THUzdW9hdmQw?=
 =?utf-8?B?dWVaS3lSektDTVRtUkpkWnM5VlBWMmFRUkpmbUpkRUJvL3NZdVIxSWJ3MU1U?=
 =?utf-8?B?djZSSlFXbGhQZUhtWjVIazFHYVZETzl4WHVqc1hoVTlldjZUc2gwRExuODhx?=
 =?utf-8?B?NDNVM3Z5RFFLcjNlY1VtRExFcnpuNkJRcWlFSkhNaThxc1RrL3hVcDBGbHVw?=
 =?utf-8?B?L0ZZYzE2ZXZRckpHeStRWnovQnpsa3J1S1krWVBJbXc1US82U2FUWVVxWkg1?=
 =?utf-8?B?N0QxUkRtckdVR1pvL25mZkdJaThKSjFMbFNLelN5dUt0d0Y5dEUwTXRhOE9r?=
 =?utf-8?B?ZGxmOEw4VjJwVG1aV2t1L0Yrb1ZGVm4vTVdyRmt4ZHZFM1Q4N2RFOEVWQUUw?=
 =?utf-8?B?eU1nb09zNmlYdXpBc0xvNXpSc3RpVitaTzJLWlFmdWJkeWhpVGlpS0F5YWY2?=
 =?utf-8?B?ZXZoenRpZUNaU25DaFN4Tk01Y1ZZQTJ1dlJkRllyQldoZjBXd2VCT0hYS01O?=
 =?utf-8?B?L0hRbS9ETWkxeEJiTFUyUE96OEpUMXZuV013aFVtT1VnV3doZk0weDdIZ0FD?=
 =?utf-8?B?akFueWhrdm9vZ1FkK0tZTUk1NXRoeTJINVgyMkFJUGdKQUV0ekttc1JEalhR?=
 =?utf-8?B?WkV2Q3hiWGVNU205cGFkaG4zM3NCV2Q2RFhpczlUSUtvb2Eyc0pHeXFnNlpt?=
 =?utf-8?B?R2sxNHkxVmlwMVJmblFKcVhzSFdOYWYzSitoQ1FqT0hNMjdtdmdpMHFhd2Mv?=
 =?utf-8?B?SElsWmFWZlg4VUdwbGxrTlNoaEpZeTdFeVlscFB5M0FHUm5haHhFZXByQXB2?=
 =?utf-8?B?R0JhTmJiTENmYzFkZytId21HSmNCbU04OVd0Znk4dUpyc0RoY2FBYitPVE5l?=
 =?utf-8?B?aEtCeC80cTVXZExDVnRIZnZKNGxzemNPZFIwT0V6UnlPcnNrNlN3eUpYMzZ5?=
 =?utf-8?B?dlhEeEhTQ2lOdGZPblgyaGwrRzRZT2NXcXB3L3M4OHc1VDUrQ25pUzY0TmFZ?=
 =?utf-8?B?akVmTmhsZ0ErcW1qMzcyQ1FCZ0lFUTdzdzgrUUVZYVAySndwNC9ObS9xWmV1?=
 =?utf-8?B?TDBPMmVEOTFBb1hxeXVmY0Z2OXc3d3JXWGhzVzNSelZaMlFOUU9EbUJHeXE2?=
 =?utf-8?B?NFF0N1FkVXJXbWp6eVJ4UUo3MkFKZHY2ZzVrUkkzMURjcXdpU1YvRDFubUZT?=
 =?utf-8?B?S0Y2TU0ySXFPemtZSU40SVM2RCt2Ylc1STFGcGwyT0JGOXl6NE8yYi9EQUUv?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9034d1c2-5e20-4c7d-9730-08dd6d97a44e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 01:27:02.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2hY5SA8BWbbJmBXtxkaIsdGHlluj04HKu21XJ0C7l3VUiHen7C+TysC5v+o6jAKbjGHLsHRam+niFmuiifTMLCS3X928bE4RbDgqW8ufnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7412

Hi Conor,
    Thanks for your advice.

On 2025/3/28 00:37, Conor Dooley wrote:
> 
> ForwardedMessage.eml
> 
> Subject:
> Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible 
> string for A5
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2025/3/28 00:37
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
> <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin 
> Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
> linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
> linux-arm-kernel@lists.infradead.org
> 
> 
> On Thu, Mar 27, 2025 at 05:26:35PM +0800, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
>> no need for an extra compatible line in the driver, but add A5
>> compatible line for documentation.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>>   .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> index 8eb50cad61d5..a94f4dfb9a7f 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> @@ -14,8 +14,13 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    const: amlogic,pinctrl-a4
>> -
>> +    oneOf:
>> +      - enum:
>> +          - amlogic,pinctrl-a4
> This one here only has a single entry, so could just be
> - const: amlogic,pinctrl-a4.
>

Will do.

> With that,
> Acked-by: Conor Dooley<conor.dooley@microchip.com>
> 
>> +      - items:
>> +          - enum:
>> +              - amlogic,pinctrl-a5
>> +          - const: amlogic,pinctrl-a4
>>     "#address-cells":
>>       const: 2
>>   
>>
>> -- 
>> 2.37.1

