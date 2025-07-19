Return-Path: <linux-gpio+bounces-23504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A4B0AD29
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 03:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F043C17C86E
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 01:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2666613D2B2;
	Sat, 19 Jul 2025 01:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="uucYd04w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D90433C4;
	Sat, 19 Jul 2025 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752887379; cv=fail; b=TRhozx1OVKL+YBLPC2dNJ1v7TbFfFri8ZTDhAhrZuXwN/C10trZgFWV4eN74GnnqXg53/pHFiczECMkWTOk7/t5yrsnaDQnhsqsj8nXSLIAstOR6x8HPk4+iH9hOZASVbsTLz+oh52FEm/OL333GfllQFPaRSbIp2dB7kL0vKUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752887379; c=relaxed/simple;
	bh=2I3sRDIucHXyv2SaoIsCqmShiYk+zEXLxR4d6dra/7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J89NtpcvlFZ5ae3K4GTYhQyWn4xveFZFk/S7ejCUF0FIbbf/NISyxVTpgRXNF9feE2WNnb8zrukIXeNITUZJz84rvQ3o1+NbovIPJppv8xW/0EOkx74Z4b4IYsnFy4fPg2ZmzHi8gGNvZZIEjnjCg9Pfn3GtWIpkf5C0vBtMUzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=uucYd04w; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzKk8uqtofR1pEW95qEUxcwK+x8WFcz3nhe4anfvF57zDo1ZOkeBCmarZ2cAx/XfN603M64+EcCw59Kh4DvS6VrS8/B81rmtY7wraI9KQBYIcDjv6w2FV4I/6w37T8VSJdhQYu5RGaeGhVe01k7CmvOSBZM3FSuyeTObMqlnCBaKayj3gWAbyFZ9ziyjBSR73PNuEjTw0ApCXvDZhhf+vvH7ImKEfUJb4R3OU8XRYt71a95czi8mfSsAl+ZvQt4wsI7yw1cLq1JdJGEUfFBedyW61TffRo7x1qEfPd+M2f/SMX1uQZlxCTipLnh1nwn9lGuAgyNZJ3DYqXq61QpFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2I3sRDIucHXyv2SaoIsCqmShiYk+zEXLxR4d6dra/7s=;
 b=SZT/kdhcpCje7HUm168xu2DmaeQ/dJ/dQGxBRZ1rGwGtwTThbOcZ4pMXgBhQKOsvxoj1T+4nSzN7/gm+Oc5WkdSGkwd2qtq6bJzH+xhiRBTCWdLidql1+jh9xp6FFGnI1nlNF3yLxi20HJZYrEO4q42Gy82uqdE0W1ter2HAN46fBEYRnz4T4pHlkfh5xJZ90pMtKhn7yOs0LEgHqAX+GTSHrHaLIKjvf9b6HKKShMx+Bky0KmDuJSADgjumOHMJmRBdQmLZ/ZWf2XoNEez2x2lXyJCNdaYwz45EFeD/2pkdGuHIckL+D4sKqk9wNbzudUhG2VhpkoH3d5DyDxmopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2I3sRDIucHXyv2SaoIsCqmShiYk+zEXLxR4d6dra/7s=;
 b=uucYd04wNkhhmPIVBeYmE+Nu/1pZxgl01o9XWWVpqyVIgrUZjkKU8kstNBi97mc6L9rabN8CIFKFNr27CMvGH/RCrXLC8V/uYJtK9NVuxrXSumNjW0aHIxTSAFe0feFtHLPzYIxS8yaBt68tDkAuoYCqdaXeUfs67LnM0IHX0BooRnu9Vnn3BT8aQXgeWME7Ovx5JPxcZkUFnwKY8DbPrj9ytLsJjnsJxvjJwGCHjwcUz4qPqiPFAWs0eg3GOqVMYSX/iVa9bG79W70NkQXBO5dzBM/Z5dJ52OT5Me9rJdlDNPV0IajsAd6UfgyiE0aEecuBwLyVzPibTqapjACmug==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by CH3PR18MB5859.namprd18.prod.outlook.com
 (2603:10b6:610:1d8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 19 Jul
 2025 01:09:32 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8922.037; Sat, 19 Jul 2025
 01:09:32 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri
 Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Boris Brezillon
	<bbrezillon@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Topic: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Index: AQHb7Ec2EpmYZb1fLEiBSh0CfO/MD7Q3Ee0AgABr+YCAAT0bgA==
Date: Sat, 19 Jul 2025 01:09:32 +0000
Message-ID: <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
References:
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
In-Reply-To: <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|CH3PR18MB5859:EE_
x-ms-office365-filtering-correlation-id: 86caa818-044d-409f-cb63-08ddc660eb4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0piSkpFNldDU3JKWEM0WkZ4Mi9lT1dNMjlGMFBOSFR2R3V0Ky9PMG9EbDV5?=
 =?utf-8?B?cm1LL2ttaHZvQlhJbUJzTDREZVp2QTN1NE5HWmNYWHNLemk2WGlRWElvem8v?=
 =?utf-8?B?VWpQYTZhc2dOWW16ZTdWdkNwTTNQei9LNXRTajRScXd4SXNPeWVEUG8reXRH?=
 =?utf-8?B?MEUxVUFKOU9RZUxaOUVYcTJWNGUvbFVhOXc2MzBKRU1uNy9IazF2RTNFcUNP?=
 =?utf-8?B?N3lBVGxZVHo5YjRhdnZrYWk2aGlReGJETjdzTXJnQU9ibmt4eXVqMzBVL3dU?=
 =?utf-8?B?ZDZGNjhVWW9YT1YvNGtlOUNiM1ZSbndkbUxvcjdJa3ZCUXorUDZ4dFVhYlJm?=
 =?utf-8?B?bjM0cFBzdnBxVjYvVHduakdaS2RtdyszWUdpdS9oQjkrSEZzTS9kbkRBWExY?=
 =?utf-8?B?Zmh1UEQ1eW1QeUdZWUFVTTE0U2ZoTGZ6Vnc1eGxuUjZyaFdaUzI2dDRRR2NX?=
 =?utf-8?B?TWZyUkFLNXVYbDJMMStOQ2FNUE9UUEo3MGQ3ZEJOZlFTZTdLdzZyQjFkVVZ1?=
 =?utf-8?B?cm5aU2NVb3p0d1FjQ2tGRGFkRHg5K2tVNHpSS3NtaS9jN3VRdWxXcDNSVmVr?=
 =?utf-8?B?ZDhIcStuVS8rdFVRK0U1aVhhK1BmUEphR1dXY1lzakZYdUdCOStBQ2Ryc0px?=
 =?utf-8?B?MFNPb3I3RExaWlZDNmpudXVUblBhdkRKZ2psL2Zxc25RNmpCeFRJamRsREc0?=
 =?utf-8?B?a2ZxcVNuM2g3WERhNXNTcm9PVFZRQlVjRFFncFlHOXMyNnc5T3krYXNSNVdq?=
 =?utf-8?B?UTc2b0VEL1h6MlJObWlzYlZYeS9FYWRZYlZEZG1jUGNRcUp0S1l2ODU2QlJP?=
 =?utf-8?B?SXIwTWpXWkk0Wlh2OE9pNk5QWWhNUVh2OWY5ODVGaXZ0Q1ZYOGNTQ29ySWJ0?=
 =?utf-8?B?NloyaW9iNHJWZmhqcjQvTjl4clNPZldmbVpuYzFBWnpoNzl1T2t3T2NYLzk4?=
 =?utf-8?B?eVZYQkNPVk1hRE9XRFF1TjlkVVpvcFE4eENLaFZicGtZK2dkV1hYVFFudkhm?=
 =?utf-8?B?bWx3SHlFeEdMZWxkK2cwRklNd05Qd25PSUNuc0lrMkZuTnNBVm11cE9hUkFa?=
 =?utf-8?B?UjNWbU5zWHljYWMzaEdlSm8wMFFDOUt5Umh5Z3AyOEVCa3doZnk1Rmk5V0FE?=
 =?utf-8?B?RWp5aTh5VHNRbWFEdHNpT0ZmTjNGMnhsRDVLenRWcEIzT3ArNUtNaDNtaTZi?=
 =?utf-8?B?WG1mM3NMbnNkTGd5azB5MWFQdWF0L2Qwd2crNDVNMXZ1cDljdWdRSWF3ZnFs?=
 =?utf-8?B?MnluV0VCcUROS09SYnowUmQ2cWVKTFQxT0xYVnZ1bUdwT2RVNUlxMXZybnJ3?=
 =?utf-8?B?L2ZBVUtXa1IxaExOR3dmZExzdkVGazdBYmxncEcxcmV0WkppdGlVdnNyaCtp?=
 =?utf-8?B?YWZzaWZuYkovVC9XcDhwZGNGS04yMmJqdWJJZlBGNVhaMjQyTDlMSVU0MFZ4?=
 =?utf-8?B?QzZIMlVYOVcwNXo4WXRocldJRDZwMkhGTFJ4U29BMkRjV1VkNCtUMUdiRWZ0?=
 =?utf-8?B?UlI3a0NNbC9QTTd4VXpjZWVFQWNPbG45a1QvTnZ2eUNzakQzN0MvU2NRaVE3?=
 =?utf-8?B?UGFkY3grby9jdm9LcUx4cHJiVXcvSWJ2Q0J2OGo5RVZpZnh0R0dsR1ZLcklW?=
 =?utf-8?B?a1JodGtONTJtTWplNWxUMkxkcXY1ZlI3aUlsWFRyK1dkYWRpclMyZkc3Y0V6?=
 =?utf-8?B?VFRueGlQU0c3UElBa3piOTcrang2NmRqd1Q5ejliWDBTaFlWRlFsSVAvVXBQ?=
 =?utf-8?B?bW5lb0ZBbkFhekZTc1g1SnJIcWFNSmdiTjhSRUFOZEFUazA3ZFpiMWtqZE5F?=
 =?utf-8?B?eW5Cd1hzdElBRWFRWWFTOERCTlNYOWVoNXpKVXBlSy9CbjNhNlhjc21ocGVy?=
 =?utf-8?B?elBINnlCOG5QMWZ3QTVYdTFiZDNTaU1SRkY4TXI3bFh6WUhQTHQzUncwM1JR?=
 =?utf-8?B?RHlvNTJ1ZW5lYlp2d0RyeENMMEI2QS8ySXZ3RFJRU0ZGWEVsZU1FaXJpUDNO?=
 =?utf-8?B?OUxGaElTU2loS0FPS2NYNnpLM2pyMHluTjhRKy9ZVGx4Q3JqU1dMMkNWcyt0?=
 =?utf-8?Q?Cj9bxM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHFOVWlLNHZpVjVOamVqekk0aGVzYVhWeHMxRFVuUm9uWnEzYW9SWmovYlF5?=
 =?utf-8?B?RW1YdlYxbEZHTlNKdy9kdk5VaUxnS2VvMlNkREVnNUpkQ0YvUGtGU1o5UTZv?=
 =?utf-8?B?RmswWXdZdzUycGhUa2JVUUlyNnJyS2JBSWJpbkRsUGdLbW9RT24yL2ZrbWov?=
 =?utf-8?B?MlBXQ2hlNFozdUtrcEJKU09hOFJ5NG9QQmpKNUxTcUJRSnprSE1NdktjU0xp?=
 =?utf-8?B?ZU1KdVh0MGYzSXdidFhtQUg4bDM2bWVaeVozQ3NyNTBBV1NLSGxqL3NvNmE5?=
 =?utf-8?B?dlBPTVJpYXhkM3BEYVNhZzMwUll4dVZjbFlaL2hDdStQZGY0TGZjcFFzSzNR?=
 =?utf-8?B?Zm0wYnFKME9ZVGxJZkx6bHY0ZDNmVzA0aUNta1ROVmRDbjg5M1NBZjZLNzNQ?=
 =?utf-8?B?N0pzN0djdlpQMkZoK2FiRmRFNTh4SmVFcGIxMndwRzNNVnNBcVdhZytQVVIw?=
 =?utf-8?B?NXdnajBHL1huNTQ0R0d6bDF1YTVSRWFSdVlVWGw4dUdLb052K2lyMGdlRzFM?=
 =?utf-8?B?ZElra2dSZjVrQ1JvT3YveVZnZXZKZHdIdU9mUDlVcFhiZzJ6MlpLUklpK1dq?=
 =?utf-8?B?RFVCZ3Vvc2JhQWh4NGVoTXYrWXNrUldFYWtnRGpTeDZWWTMwRVFuWXFYYzkx?=
 =?utf-8?B?UWF6UWhKbDdoMElMaGs0NFZUbGViZm5vRjVVUEZiMGVUN1YxVnJNSmdFQXVV?=
 =?utf-8?B?ZUJhUFhDREh6K1UxTFh4amlQY01jczdOL0hIbnZGdklKL0l1T0hhV3F4WHJw?=
 =?utf-8?B?OEgvSmF6VjBDQ2ZmRERrQ1E5RlhBNnRFb3pRaXNaYU4veHdhdmlPTEFQTk40?=
 =?utf-8?B?ZHdMUmlKL1lkbUlLN1FxVGd4OVBaa0k2M1VQZ3MzTHU4NC8zVU1hb215WXBQ?=
 =?utf-8?B?bjAxQ3lCcHdzejlKWVIvWGh1RFVGRktpSEhwTDFuM01Ca3B3dHRKTkdIZHds?=
 =?utf-8?B?WlgrTEpPT0x0dFEwS0F6ak1DQTJDUEJ0SysvVVozRHY0UHdyc2FMcG9TTHJl?=
 =?utf-8?B?dnpmbnRxK2szbTFBbnJWdjJOazYvZ2tCWFdtSkpvYlc1S09OUHZQWEFhbVR3?=
 =?utf-8?B?RXFCa0hWTmRzNDU1ZjVIWVMxNkdyVEdZdEtCT3YzaHdRR2ROYlI1ZHZBOFJR?=
 =?utf-8?B?WFNmRGhaKzduVUlXVnd3enB4Qy9IVFJSQXF6SjBvZHRPL21WTnFKaHN2VXpu?=
 =?utf-8?B?R1FuUmVkaDJPM3lGMmt2MDA5cUdWdmFiR0NNUlpHYm5VRGQ3dE1BRmdCYWtw?=
 =?utf-8?B?b1JrSTVFY3dFeDVFZDBVQ0ZVeGlpYmRQbEtrelFDdmlUOHY4TFBZUDNQSEhV?=
 =?utf-8?B?dko0cS9LY3FwazlZREYvSiszMlNDcDErZmp2bXVTZ2pkV1h3ejh3ZUF6aHhF?=
 =?utf-8?B?djVsZVNCckZhbkZ2bUtGbTN0dkRFcFFaRmVzc3ROSzhuczZIQytLZ3hWS2tn?=
 =?utf-8?B?cHhhWkdSUGJ0ZW9hSlp3VzF1bGF1ejVYR3dRVU9kaWxyYWZIbk9KTWlRajR6?=
 =?utf-8?B?RlpkczNqdkJpY3FuMzZqTnpWeWdBaHVlV2tyQlZIVEZFVE5va0cvYWdBcGxD?=
 =?utf-8?B?RW0zMFpLYi9BazRPZWtpbExCdmttcE42TTVuVmcyOW9ORGRNV1lHNjFaekQv?=
 =?utf-8?B?ZUdRa0RRT2V0T1RVYzlRK09QZFNVSFBzOWtGaGZKdjdMVmJWZHJId0phcE5U?=
 =?utf-8?B?ZUdKajNxS2luL3dndGxrQmNDT1FWeENHZjQ4ckNqNFhhOTZid25LR29SQ0Rl?=
 =?utf-8?B?amFkVXU5elQwcDU5YzJLcXM4YTh2QzBoUmZBbWxURHZkTlM0ZGVWaDhWTmZR?=
 =?utf-8?B?UWpKeHdhYWVlRUZkR3ltRFdJOGJ0TlBqMDJMVXcwN1NOeWo2MUJVTmhpTEt6?=
 =?utf-8?B?aXdhZDJQcHhGQVV5Y2xFWUlsZGp0azhkZ1VVUE8vbDFTWHptaUNaT0l1WTU1?=
 =?utf-8?B?RWRyekdNaUt5ZXYwd2FsMmpLWjNmZWxDQ1F6MjVRWGE1a1ZNT0tZU1diVHJW?=
 =?utf-8?B?YUxYNUNtZElQSm5nb3BGWS8xSlhRc1FGSCtaSzlkZ3pxelRPeDEvT04vd0ZM?=
 =?utf-8?B?TDdySHJLa1cvMytCYmcwZXFlZFRPWlFBSFVQSGc2TEQrSFJ3SWlkUGtMSEhq?=
 =?utf-8?Q?H4ik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D88173927764F41839FD378225038A1@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86caa818-044d-409f-cb63-08ddc660eb4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2025 01:09:32.2900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhZYgn7446TEByb4Nmzq1a0EA7ixQyDuf5uGubS1NpxXvH3k76lNfJv1IvTr8kfk79FckL/qNOlD9tLMw3qRUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5859

T24gNy8xNy8yMDI1IDExOjE0IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4gSGkg
YWxsLA0KPj4NCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIHdhcyByZXZpZXdlZCBieSBLcnp5c3p0b2Ys
IGFuZCBJIGFtIHdvbmRlcmluZyBpZiBpdOKAmXMNCj4+IHF1ZXVlZCBmb3IgdGhlIG5leHQgbWVy
Z2Ugd2luZG93LiBUaGFua3MgaW4gYWR2YW5jZSENCj4gSXQncyBub3QsIHVubGVzcyB5b3UgcmVj
ZWl2ZWQgY2xlYXIgbm90aWNlIGFib3V0IGl0LiBQbGVhc2UgcmVhZA0KPiBtYWludGFpbmVyIHNv
YyBwcm9maWxlIGhvdyB0byBzZW5kIHBhdGNoZXMgZm9yIG1lcmdpbmcuDQoNClRoYW5rIHlvdSBL
cnp5c3p0b2YgZm9yIHRoZSByZWZlcmVuY2UuDQoNCldlIHdlbnQgdGhyb3VnaCBtYWludGFpbmVy
LXNvYy5yc3QgDQooaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50YWlu
ZXItc29jLnJzdD9oPXY2LjE2LXJjMSNuNzMpIA0KDQoNCkl0IG1lbnRpb25zIGFib3V0IHRoZSBz
cGVjaWFsIGNhc2Ugd2hlcmUgIkludHJvZHVjaW5nIGEgY29tcGxldGVseSBuZXcgDQpTb0MgcGxh
dGZvcm0uIiB3ZSBjYW4gc3VibWl0IHBhdGNoZXMgdG/CoHNvY0BrZXJuZWwub3JnIGRpcmVjdGx5
Lg0KDQpIb3dldmVyIEkgc2VlIHR3byBkaWZmZXJlbnQgcG9pbnRzIGluIHRoZSBkb2MuDQoNCjEu
IFN1Ym1pdHRpbmcgcGF0Y2hlcyBkaXJlY3RseSB0byBzb2NAa2VybmVsLm9yZyB3aXRoIGVtYWls
DQoNCjIuIFRoZXJlIGlzIGFsc28gbWVudGlvbiBhYm91dCB0aGUgIkJyYW5jaGVzIGFuZCBQdWxs
IHJlcXVlc3RzIg0KDQooaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50
YWluZXItc29jLnJzdD9oPXY2LjE2LXJjMSNuMTg2KS4gDQoNCg0KSSB0aGluayBpZiB3ZSBuZWVk
IHRvIHVzZSB0aGlzIGFwcHJvYWNoIHRoZW4gd2UgbmVlZCB0byBjcmVhdGUgYSBuZXcgDQpicmFu
Y2ggb24gc29jIGFuZCBjcmVhdGUgYSBwdWxsIHJlcXVlc3QgYmFzZWQgb24gdGhlIHNhbWUuICh3
aXRoIHRoZSBzb2MgDQp0cmVlWzFdKQ0KDQoNCldlIGFyZSBub3Qgc3VyZSBpZiB3ZSBzaG91bGQg
Zm9sbG93IHdoaWNoIG1ldGhvZCBmb3IgdGhpcyBwdXJwb3NlLiBDYW4gDQp5b3UgcGxlYXNlIGhl
bHAgb24gdGhlIHNhbWU/IEFwb2xvZ2llcyBmb3IgdG9vIGxvbmcgcXVlc3Rpb25zLg0KDQoNClsx
XSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zb2Mvc29j
LmdpdC8NCg0KUmVnYXJkcywNCg0KSGFyc2hpdC4NCg0K

