Return-Path: <linux-gpio+bounces-9425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA7965821
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96842B21932
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6541537B1;
	Fri, 30 Aug 2024 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="OtNvT1T8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2067.outbound.protection.outlook.com [40.107.117.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0C1531F2;
	Fri, 30 Aug 2024 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002093; cv=fail; b=pprorYn0yaqGBTK1XDJFtukgSWgGgvWnnSsE28sV/aswrGBVi/RHX6IKlYQXOzQIlOIce9P+E8Ek9/v+quhUs8vLJl2qA9kdVJMnlGpOTZIVISEKdSVChuUhv9p60wUKzxG6mQ6Hpft+QbpupdgoUh1NOFzBrmc77ybHQCJxgT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002093; c=relaxed/simple;
	bh=zAs1HEDB8PxIClP0M6Qaj2RjTa518I3VVOSgNupIh68=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GyY5YlExneNBBCGbaklZVJGBMUvM0fB8yIPTrt0g5+lywLyOzaXPJakALYb7skwlzTrimr4unx5QqDnJ8LlPYjaauNMGht0aVWyc4sa1JsLeVO8ByG1W17jySMQ+0nCT6e+DW7I+E49w/GhUBDkKhcaVO63PwVKsEjAfH4nqlIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=OtNvT1T8; arc=fail smtp.client-ip=40.107.117.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHHAZphZeyNPrZgeQArFKnh12P0IoxwqwCNZ9/BRpIh9I8A+R5WCSjXuDahgfi7ZLb94c7uo0PZ37MEDHuEbnkAy7/gZEqXrVAPr5xJyv7rNI900Usq+/e2IaDlXXNEwFhnpVdtli0OmYJhDGVtc7X8SUptrJxNbYJU5ficeAFnr5FiRZNa+0T9yfTS02NJ7HRk0SYOfQC/cttzESx1VuoYD6/+VeHcH6S8OdXYQDgrrUmzf3TecQVpeU/yaF6+pSmF+3hZedltLDfzCas0YAgtdqdiYaWYZQUnDe2mTxtL1Jw4Zj7+dzALHkLZOvXmg6qf9edZYplMn/M1yOnoQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAs1HEDB8PxIClP0M6Qaj2RjTa518I3VVOSgNupIh68=;
 b=baPBhO4pQBL3WN4cKpdR/6a/hdCEeVWJN1kdFER2PrOwy6pb4JNGBGDm7RNh8ElLYHxmqeE3syY2puFe0SkQKHAoDfeEXRQnPEZGrPUtpyygGM+yk/Jqujg/5qR1uu32Ke23xkAglNPEDsNh9VO3brGHXtGxhrkdJjM+v5CXF21mx2cqHte568pZVXpnmovD9V/dB2V3CnI3sEDidHUF03l3sqrnre1AP49bplWWlKqcumAsKW2ngaS4L8lN+6P98rfLW7kBOPYWJefNgj9CJ1aVQLEXcXunm20qYEb1zCfeRuI5nYGlkx0ugUJEauXvaEEliwbAlHj83IjVLOUrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAs1HEDB8PxIClP0M6Qaj2RjTa518I3VVOSgNupIh68=;
 b=OtNvT1T87YNi/qKlHDEZqsgKDtgYM5WcgZRRWYrmsVNOFEtWJiKsNKwkX9fHFk32K4XHPNjiMpb9szT7bwInYqj+Eayg7Chz9pGbPNtcRXOAu7URrxGWPkhEWdFoZHyQphfmNnLhVycVnZeMK+YqUAhzwuxqGL9g59R5XPW18cGO3FjoJx+RWhQvp6obfJ9M67PRCnTE5uZ66rBDSd6tjHgvWSOBLniRSBt3hMkeYeWEQJ5zOjnbFuo7VCI1ni/8gaZYQXl+MUsp2JbY2rY5oCN5O1Q+DpIxxhEcBrArrIlQ4zVwBH9lBjac7Zjh7Z78Iu8UMD45hzZ1NxDGHp7r4A==
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by PUZPR06MB6186.apcprd06.prod.outlook.com
 (2603:1096:301:11e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 07:14:48 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 07:14:47 +0000
From: =?gb2312?B?zfW9qNX+?= <wangjianzheng@vivo.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
	<linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject: Re: [PATCH 3/5] pinctrl: mvebu: Use devm_clk_get_enabled() helpers
Thread-Topic: [PATCH 3/5] pinctrl: mvebu: Use devm_clk_get_enabled() helpers
Thread-Index: Adr6hMCaO2gDuzHOQ9GHjRaVO2KL7A==
Date: Fri, 30 Aug 2024 07:14:46 +0000
Message-ID:
 <KL1PR0601MB4211C193CD204C565F834BB9DE972@KL1PR0601MB4211.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4211:EE_|PUZPR06MB6186:EE_
x-ms-office365-filtering-correlation-id: c3668488-e178-4c4a-dcde-08dcc8c36e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?RjYyZEM2M1N4U1VkdHBuMWk3TEFNTjM2anhrcWRmcEdzNkVwZ285MnUwenpB?=
 =?gb2312?B?d2IyQUp6Q1FEQmlOUW03UDZJSVBrR2RyemFRQTN6aWJxamRwQjVENDk2YThM?=
 =?gb2312?B?MmpYVHVjVDNTdmcra1Bndkd2SGN0eU5YdlNXUmQ1MS82b1dhbDkvNGloTGxK?=
 =?gb2312?B?blpkeFlUY21WTlNzaXY2aTVvNW15eEU1SnlrdUcxSWw5c2NkOGZCdnJqRGVI?=
 =?gb2312?B?eVNsWEtDVmlnVFVHOEFNZXgzRXRpU2tSc0xkTXJ0eVNhalUvVjM4OW9Ib1Rv?=
 =?gb2312?B?R3ViMDdzYTA2bFR6MGFCdEtjbk43RWY4ZXN5aG1tdndyQk1GbmVBNEVpMk5Y?=
 =?gb2312?B?eHd0b3ZOSEtheTN2L0ZPajRvaE1HYWpJMU5pa0RMOXRzcStlSDNaQnVxQjJt?=
 =?gb2312?B?Wm9WNEhkSElaaHZlK0RWb0dKaHdEODRtODBmRDZRajVLblhFTmdHckFkS2ZH?=
 =?gb2312?B?UFZWd3doSDc0OElQamM4VXluVDJnTGFJUWtuemFHL0FhSW5hemJoVVplMXFY?=
 =?gb2312?B?MEtQZXZFSG1Rcjc1Z2JYb0ZaSjBSQksvSDJjT1NTaGs2WE94SFI4ZFBVT2pk?=
 =?gb2312?B?MHltblJEVStGemcvanM1YmdIcXpvSlEyZVNEZVpsc0FGdG5rOWU5WkJqT2dM?=
 =?gb2312?B?K2FrcGJ0MFBaL2R4SHRhQlpLdmlHZ0ZLZWxxdVpGcW40ODhIeVptVnVHK2hD?=
 =?gb2312?B?SWFuSTJSVzQreXVFdHp5SklPc2dtSHpNNXB0QzZJeUJVOTM5Zk9zWVBWYXpF?=
 =?gb2312?B?bGNMbm40a1BSekF3WEc1d1NwczVmTGdDQmlLaEp6RjBIekhmWmJkR0NlcUw1?=
 =?gb2312?B?ZUVPT2NraGc0azBIQmpGYUFUVXJjVHRaeWpsbDgvVHRtZ3JuaHVqNkdMMzBG?=
 =?gb2312?B?aUtDVllLVVZ0QjlJcnNaQnErUFlUbTRCQWpFQ2V0cmpDeE1QYVVnTFgxSFRt?=
 =?gb2312?B?eWF0bm9OcEpZSlBYTzhXMEpkdGptbFdwVFpVMlhLV0h1ZnNDQzJzeTlzaUZM?=
 =?gb2312?B?YWRwMkJ3MVpiN0VodkpVUXl0TDh0OWxBaFZxSVVuclNhYlRZTmdINmFTbmtU?=
 =?gb2312?B?b214a1BucUtQdHVNWHY3c2M0eXk1enloekQwSFc3SDd6Wnh6MXI4ZVEzV3hS?=
 =?gb2312?B?NjR2YnhSUzFPalBwdXE1UHdNVUpZSEl6SVMzbzRLek8vTElwUWlpdmMvOVFM?=
 =?gb2312?B?TUtwSTF1T1huQllJclIxeE1zbHhhUVZGbFM1TzdvZ3A1WGZpeTM0QlNWZ0U1?=
 =?gb2312?B?aXpqMHVxb3ZFelpNNTgwb0xMcGhQUmdpVVNid0c0c1k4WmZrVWdzaTdWSDFn?=
 =?gb2312?B?a1o0OGI1dDFkelQrbTFpMzRUUENPWVpzQ3RsQU5vWWc3MU9VOHpKR1RhTGE5?=
 =?gb2312?B?Q2luOENiR1hiOGxOSFFKSU9scXJ6TnVxT1ppSGY4QkxBa1RaOUVLRzRxQzFn?=
 =?gb2312?B?akF4dm1OZTlmbVVQQ1lHQmVaT1ZxRUZoZCtvZ2lDVDVGSDdlMTJYL0tXakw3?=
 =?gb2312?B?Z3lTLzBiNTQrOXU2NkV4OEduMGovcjlpelRjRlJvVEF1Z3l3UEs5d1NxMnhB?=
 =?gb2312?B?NThYTzJVd1UvL1BacmRjbDlueVRCVHYzQ0NVRDFZa0p6cVQwMy8vVEhRdERi?=
 =?gb2312?B?alVhMitMQ1BjSnRGK1BFTkhrVkFNZVJFSkp4Y1U3SnpPZEhIT2twYXZHS3JO?=
 =?gb2312?B?bGJwcVBlSmprSzBXalM4RWgvQytKVFJBdDJ5WEJMNmszSjlrdWxnYjRaYldn?=
 =?gb2312?B?ZXJPNW51bk5YYStwdkk4WGpsQ0FoWVV2YnhSVlpjN3ZRTzJ5cDhsY3FqeGRE?=
 =?gb2312?B?UzM4RzZEclVSTUhNK3MzMVIyQXZlK21pTk02cXRYVDZNU2p4OFA2K0JOcmtU?=
 =?gb2312?B?N2dmY0FoNUZSMjg1S09mdXdXV3M2WUFPWStVSW9SajB2UGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MUtVQVVlZk1MQlF0MnBIMFpsVTc0V3VLSWwxeVE5bGNZMlZlVHFuMWUzaGxU?=
 =?gb2312?B?Tk43NGEvcmFkSkVmMnZaQVBwNngyeFo5L1pKc3NJbWhqa2k4SEtlRTFWNS9q?=
 =?gb2312?B?UmxCajhHR3N0VzhhTVc1T0hmOGlSUHplRzRsSU9HREFBVGxQQ1I0VHIwUVR5?=
 =?gb2312?B?UGZUWjg0aWQ0VTB1dUhVeGcxU1QvQ1lDYmxhZXg4a2ZDa1d3L09Td1V1TDBH?=
 =?gb2312?B?TE1yTzVNdnpHbUc4R0xUaDRzejJWNnRBTWNHVU5nK056WTluaXo1TXdhRUUz?=
 =?gb2312?B?eitSVER3Y2IrTEI2SlpZWDZYNG94QzF4Q3pYN0pIWHNvODlPLzd1SUxxMjMy?=
 =?gb2312?B?bEpUQWZqaWVpRnowdUZrVDQ0M1JtVmhQblFaRVpaNUpTWGd0WGFGUXJVWngw?=
 =?gb2312?B?ZVZqUWJNOFlkME5qOWZqeEN4UWh3UnVpZWlZWDljVnIvNnNsN3BrWlkwckZ5?=
 =?gb2312?B?WFg1KzJVMXU4Rk5PVFQ5UEdhR2M4NlFVeUZnMmt4RVF0WGRoZVZJUm5sZ1Y3?=
 =?gb2312?B?UkJjdVF5QU5ubnBlR0p6WUtwMGRJN04wRWhMSDYwN0NYM3JHMytGVFJJTjVn?=
 =?gb2312?B?M2UxbHhkdVZHMmhKSTRXZkpQdjNSK083Q3RoU0poK2ZDNTB2aTBsNmd4TlZk?=
 =?gb2312?B?V0NESGRwN2tiblkxcVZUZEtsakZYd0dyempTNitQWTUraDBJODZjbEYzNG5h?=
 =?gb2312?B?SDU2UFVvNWplaVNtemxTSEdZVng0bmlFd3diNGQ2QWRqcFJUQk9BL25keEFJ?=
 =?gb2312?B?NXIvKzI4Smc0SHFGSWp1NnhVS3pBdTdZZEQ2UG5pNzNUUDZvb1h1U2NDSUJF?=
 =?gb2312?B?VXZOK3FXTEdKUEx3cHpnckVLSk1kTmNoTlRRenVTRE5uaFo3ai9BbWVPMitt?=
 =?gb2312?B?UHhETXhWblpkTjB2dlY1Y1JnZGpXSW1XNUdJSHB3bStrbVhYSUdFc1NLRXox?=
 =?gb2312?B?NHo2cVg4bU1FVWc1Rk5DL3pWWisrYk1NNldYQXJETVZmT2ZJWWFZell2UC9Y?=
 =?gb2312?B?YWsvemF2K3g0b0NQaGR1cUxJRE1FWjljbWVZYnRPNUY5S2E3YVloanNlNFhO?=
 =?gb2312?B?UkU1RHUrMjk3VVFHSDQ4ek9jR2JTSVZBRzA0NzgrVGFuYUxpM3o5aUJHcW92?=
 =?gb2312?B?dXBvbm0vRmJnNlFlLzlPNVpuRFJGT0ZWVVp5dDJrYVJQVlU0QVgyTEtsRzFS?=
 =?gb2312?B?NzBQVlByWmdOY1FCOEdIS3dZSnZNRGtwaVlOblZQTFhtQmtobSs5cHRpeE1z?=
 =?gb2312?B?OHFCRHNoaHdIR1F4cDlBZzd2TDgrSnJlSFdlMm9DRkd1ZVF1cHc3RDlTZFhD?=
 =?gb2312?B?TkJTQ2ZLSXpiQkJwU3B0MUZoT2xuOFRZcVoxT0czNG5lQWdVR215VzJsK3dP?=
 =?gb2312?B?ZHd0MFpJaDZrZWNic3NuKzNiNTB1Z3c4akxpNDFFODNuS2RRaU1TSGdhYVdV?=
 =?gb2312?B?bmlsRVZnMC9JVzZUOTF4SzJjZndTS3Q3ckRXZ1dYVkgrdzdLMWczaG1aNXEr?=
 =?gb2312?B?bkdLdHdKYkdON1gvS2ZjR1V1cjN4eVVmeVQ4YjVRT0NiTDdPTExIRGVoamJH?=
 =?gb2312?B?T1IxcnZTS1BVY2UxRXhUOFpZMVcwM3dTTnVRalVWbDVNNVF1WXVSN0xEeEdi?=
 =?gb2312?B?cUpSZTB2LzZxVDVwTXVTb3lhRlFIZUFnSFk4RzZXNFU1YzBXT2JtblR5VG9X?=
 =?gb2312?B?WmpjMWpxM3YrRS9HYmNIbFBTdDRaZDI5K3psZkJocUh5K2R2TjZiLy9BbUdp?=
 =?gb2312?B?a1dOYksrdHNDZmZGVGFxWFNDTUgrRGdWNlBMT3V2Z25ya0d0d3VGK2FHeWFE?=
 =?gb2312?B?b0FUQzRjbXlyeVZ3YnpCWFY4ajBDWXFZanU1MjF6aWxoY3lGS1NkSHVjS2FW?=
 =?gb2312?B?UmFIUm9RMnc0cWtOakdKNkN2U3d5cFNhMHlkMlpuNnYyQTg2VFp1MkNhdExI?=
 =?gb2312?B?YldPNjc3ZlM3ckltaXR0YnNCLy9LekU4R1FCSGVLSkZ1a08wUTRCM3pUcmRT?=
 =?gb2312?B?RDBRSTg2eDJiUEpFdHdkOEphbHlodVJ6MzcxRi9UY3huSVVUaHhzK3ZtcUJX?=
 =?gb2312?B?cDhvVjY1Mkc4Rk1FNUJrMnRVOWFiZHJIQzAyT3RrN0IwYVkreU55Sys3aits?=
 =?gb2312?Q?kg1M=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3668488-e178-4c4a-dcde-08dcc8c36e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 07:14:46.9262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N2o2D6pX2C0WX9bNeAixtdfA0+Zjkk4FBPQbD6BXRVmVpwi063sUaofJufO8kjlPoL2p7VRf+SErffCXhMkb7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6186

T24gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToNCj5PbiBUaHUsIEF1ZyAyOSwg
MjAyNCBhdCAwMjo0ODo1OVBNICswODAwLCBXYW5nIEppYW56aGVuZyB3cm90ZToNCj4+IFRoZSBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGhlbHBlcnM6DQo+PiAgICAgLSBjYWxsIGRldm1fY2xrX2dl
dCgpDQo+PiAgICAgLSBjYWxsIGNsa19wcmVwYXJlX2VuYWJsZSgpIGFuZCByZWdpc3RlciB3aGF0
IGlzIG5lZWRlZCBpbiBvcmRlciB0bw0KPj4gICAgICBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFy
ZSgpIHdoZW4gbmVlZGVkLCBhcyBhIG1hbmFnZWQgcmVzb3VyY2UuDQo+Pg0KPj4gVGhpcyBzaW1w
bGlmaWVzIHRoZSBjb2RlIGFuZCBhdm9pZHMgdGhlIGNhbGxzIHRvIGNsa19kaXNhYmxlX3VucHJl
cGFyZSgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSmlhbnpoZW5nIDx3YW5namlhbnpo
ZW5nQHZpdm8uY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9waW5jdHJsL212ZWJ1L3BpbmN0cmwt
ZG92ZS5jIHwgNDUgDQo+PiArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbXZlYnUvcGluY3RybC1kb3ZlLmMgDQo+PiBiL2RyaXZl
cnMvcGluY3RybC9tdmVidS9waW5jdHJsLWRvdmUuYw0KPj4gaW5kZXggZGNlNjAxZDk5MzcyLi4x
YzJhMjkyZWJiZDkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbXZlYnUvcGluY3Ry
bC1kb3ZlLmMNCj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tdmVidS9waW5jdHJsLWRvdmUuYw0K
Pj4gQEAgLTc2Nyw3ICs3NjcsNyBAQCBzdGF0aWMgaW50IGRvdmVfcGluY3RybF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAgICAgc3RydWN0IHJlc291cmNlIGZiX3Jl
czsNCj4+ICAgICAgIHN0cnVjdCBtdmVidV9tcHBfY3RybF9kYXRhICptcHBfZGF0YTsNCj4+ICAg
ICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4+IC0gICAgIGludCBpLCByZXQ7DQo+PiArICAgICBp
bnQgaTsNCj4+DQo+PiAgICAgICBwZGV2LT5kZXYucGxhdGZvcm1fZGF0YSA9ICh2b2lkIA0KPj4g
KilkZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7DQo+Pg0KPj4gQEAgLTc3NSwyNSAr
Nzc1LDIwIEBAIHN0YXRpYyBpbnQgZG92ZV9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+PiAgICAgICAgKiBHZW5lcmFsIE1QUCBDb25maWd1cmF0aW9uIFJlZ2lz
dGVyIGlzIHBhcnQgb2YgcGRtYSByZWdpc3RlcnMuDQo+PiAgICAgICAgKiBncmFiIGNsayB0byBt
YWtlIHN1cmUgaXQgaXMgdGlja2luZy4NCj4+ICAgICAgICAqLw0KPj4gLSAgICAgY2xrID0gZGV2
bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOw0KPj4gKyAgICAgY2xrID0gZGV2bV9jbGtfZ2V0
X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7DQo+PiAgICAgICBpZiAoSVNfRVJSKGNsaykpIHsN
Cj4+ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIGdldCBwZG1h
IGNsb2NrIik7DQo+PiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNsayk7DQo+PiAgICAg
ICB9DQo+PiAtICAgICBjbGtfcHJlcGFyZV9lbmFibGUoY2xrKTsNCj4+DQo+PiAgICAgICBiYXNl
ID0gZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCwgJm1wcF9y
ZXMpOw0KPj4gLSAgICAgaWYgKElTX0VSUihiYXNlKSkgew0KPj4gLSAgICAgICAgICAgICByZXQg
PSBQVFJfRVJSKGJhc2UpOw0KPj4gLSAgICAgICAgICAgICBnb3RvIGVycl9wcm9iZTsNCj4+IC0g
ICAgIH0NCj4+ICsgICAgIGlmIChJU19FUlIoYmFzZSkpDQo+PiArICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKGJhc2UpOyANCj4NCj5JdCBhcHBlYXJzIHRoYXQgaW4gcGF0Y2ggMyB5b3UgYWRk
IGFsbCB0aGVzZSBnb3RvIGVycl9wcm9iZSwgYW5kIG5vdyB5b3UgZGVsZXRlIHRoZW0/DQo+DQo+
UGxlYXNlIHJldmVyc2UgdGhlIG9yZGVyIG9mIHRoZXNlIHR3byBwYXRjaGVzIQ0KPg0KPiAgICBB
bmRyZXcNCg0KQWN0dWFsbHksIEkgYWRkICJnb3RvIGVycl9wcm9iZSIgaW4gcGF0Y2gyLzUgZm9y
IGZpeCB0aGUgY2xvY2sgZGlzYWJsZSBlcnJvci4gQmFzZWQgb24gdGhhdCwNCkkgZGVsZXRlIHRo
ZW0gaW4gcGF0Y2gzLzUuIEJlY2F1c2UgSSB3YW50IHRvIHVzZSBkZXZtX2Nsa19nZXRfZW5hYmxl
ZCgpIGluc3RlYWQgb2Ygb3JpZ2luYWwNCiBkZXZtX2Nsa19nZXQoKSwgYW5kIG5lZWQgdG8gcmVt
b3ZlIHRoZSBkaXNhYmxlIGNsb2NrIG9wZXJhdGlvbi4gDQoNCkl0IHNlZW1zIHRoYXQgaXQgaXMg
dW5hYmxlIHRvIHJldmVyc2UgdGhlIG9yZGVyIG9mIHRoZXMgdHdvIHBhdGNoZXMuIEhvdyBhYm91
dCBjb21iaW5pbmcgDQpUaGVzZSB0d28gcGF0Y2hlcyBpbnRvIG9uZT8gDQoNCglXYW5nIEppYW56
aGVuZw0K

