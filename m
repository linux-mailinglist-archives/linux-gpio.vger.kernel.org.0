Return-Path: <linux-gpio+bounces-29255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6861CA44CD
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 16:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E38B301B49D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 15:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523762DEA79;
	Thu,  4 Dec 2025 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nABl5PTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8E2DCBEB;
	Thu,  4 Dec 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764862606; cv=fail; b=JRPpLBiQ8QicIInks1ypfMoDmtGJP9mfBOAaNHhfvJc6t/qaaOjJ/ODQWmiV2kLWZXvyCtd2E6g25ibjVA77x3RQBao7uuAGMC6kVxO0oqq27idf3pQFK2nL5s1ESBdjtThSu4AX13AzhWoTNrHc5gxuyVOOog7yODrOwaTiNdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764862606; c=relaxed/simple;
	bh=pXRDZM2Z/HVLKtVeZ58VERQeT2WYxQGgZFQ5Swk7XeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R/X5mbvEk2iCaRW5MNyGM7YhXc0REuw672OrY1cAWhu13lgoYrK6M0j48B7IHlTXNoNHVqRCWykVLhZNZ9siHGyONexguHzqKJbPPItkUyQUEpej0GYC7omnbTYSSyTDPrd2MD4xYqNOfPdNEHwDGtkXkbCsNPVz9cjzEEiOals=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nABl5PTS; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRKojVh1Kmkr7KtpqlnYlT2G9rhJ0GpWLFpz9qaTaIdSXHVyAS5lQQebTfetjZX3z77DH1VJ3U65PhJtxTjEcoM+EjSBEnxqPf0ssk29cClK4mNK3cNaAVmHbEackt5jHcwgZmwEHGI/NFlKIXizrZ9b5Z9zjdgFz5gXWarInl1CaLTSGHtXKyfRIMKwwnhh9M1DHL+ptHcEegZrmwuPLYT69dzsjz+dF06mHVQS3zzW2R5s7EuhWN86rqexDEDhFsjbRPiGL/W0vM/RLeFY5ysBRp8cFuJEl/Wu8txOOq1m04X65AsAWLS//1IZeBHvawc3WNcpHnZPcQ16L2EvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXRDZM2Z/HVLKtVeZ58VERQeT2WYxQGgZFQ5Swk7XeU=;
 b=xVWlJKrmd10k6hFjG+U3HgJMrBE6it1cwnSIcpjnNfNf1snOCNPLTWzbA2Ui//Vr4+25gbooEqQ8g53sljnQcY54Kaw5/CYMRVIwK4gbrFDj16gQjKUWQBYnqJdaHZn6eGHio4KSOMQOybePXXJsRBq2M0HhaHZPP4R0MedEqCwGxqTudbUtz2nmJROyF4PF50xKsrGtvAMLJUEnyG8BW7zDxcFPe/WksLjLcgRMKuLoiFRxwPfytqhK4Uiyo1w/0EIY2d6iVlbcz3KWWIi/bGoiU87wNWwDuTLIALc5eiICTZdSTzP5Q4cm6xDdlCafH5Tlsak6LxNBhoruHmGCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXRDZM2Z/HVLKtVeZ58VERQeT2WYxQGgZFQ5Swk7XeU=;
 b=nABl5PTSlWMPzn2bcdQLYXkFVDrodic038u2LEl/WzTK1IygS3b1mAo8qdIEATscTvUbBlqwe95XzZ+SK7tDUoe/gRfAmRKJUf1n9/SRMcMi1xGIonC6K9HXIQiYMV5j2Km48dc0AmIpQA/1wj3mGxbSSNukvPmQJ6IOI6et15g=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by TYYPR01MB15690.jpnprd01.prod.outlook.com (2603:1096:405:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:36:39 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:36:39 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Linus Walleij <linusw@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle
 interrupts
Thread-Topic: [PATCH 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle
 interrupts
Thread-Index: AQHcWtnY/LCDFXL3kU20MPBqX5nubLUQpOgAgAD/RnA=
Date: Thu, 4 Dec 2025 15:36:39 +0000
Message-ID:
 <TYYPR01MB1395557CE23154BC30C454C8585A6A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121112626.1395565-5-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAD++jLk9Ft3oRGUTyqgbs55Vii0HVVnO7mnaHfCJivwT1Yv=4g@mail.gmail.com>
In-Reply-To:
 <CAD++jLk9Ft3oRGUTyqgbs55Vii0HVVnO7mnaHfCJivwT1Yv=4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|TYYPR01MB15690:EE_
x-ms-office365-filtering-correlation-id: 0e62ac76-d9f3-4da3-ffa0-08de334aeabc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0hYUzVLcVE0a1h5TldOdjVsU2k3Qm1QajBsSC9OOGxuSmFqcHAxcVIwbnlm?=
 =?utf-8?B?VmpCOEx1bEwvOVhDcUpvTzRrNURycllJMDVuelM1VU5zSTNLTWVsdk9HRkda?=
 =?utf-8?B?S3dQeENFQkFadjkvelpTU3dNUjJaR2ZLZFR5MkFwNE1NdXhXT2NMeFYyejV5?=
 =?utf-8?B?QTc4WmRWV3FHM3hZanYrYzV3ZVR5SXRRbDFHaFA5YmI3ZFI0OGdFSzFpR0ZE?=
 =?utf-8?B?NmNyaGVLMTZwbUUvRkZPNTJkYWx2OGoyaWxmTmhpMVNLQWNaLzJDazJEWXFQ?=
 =?utf-8?B?MzJ4bjQrREM2TkVXckdJcHZlTWp3WmhFYWVqcUJUU2R1dXBOQzJqdjNlNlRX?=
 =?utf-8?B?L2RTZlBmaHhBQlFFbW1lVHYvZWE5cnMrOFBLdlRqMm5DV3lwM29UMWdUN0V3?=
 =?utf-8?B?V2duSjNZUG56U1B2cXJMOTZLVDBNMERzNzlVUTQ3eG1ENlpsUzRaOXE3M2hn?=
 =?utf-8?B?TllkUWlqMzFwZm5uL1YxVDJ6QnJTUFZJUllSYnhSVTZaWmNBSHVxQms1MEhn?=
 =?utf-8?B?V09lZGRsRk9OWWp4TUFSMStBUjFjQjZ5K3hhTDV2N3A2Q3VkNVp3czlFOEky?=
 =?utf-8?B?ZG5ab3ZYdXo0aVZlSGVVYmY0bzZyWXJoSU54dzRBdU90K3pub3lPbzNQRnZH?=
 =?utf-8?B?VC91NVFPWHZkMEROUkpHZDhGL1h5L2g4TXRzMU5WQkZETEtxaHBsS3NieXdu?=
 =?utf-8?B?eE5aU04zSzZBdHFkRXd4UWZmU01mQm4wekk5Y3FWdzFqdjcvSWVRbnI5M0lO?=
 =?utf-8?B?QVBXM0ZuYXdDT1JYMVY1bVpEeXQya2RzRFUzZjdDWEppcVZIOHFVL0N4WmZj?=
 =?utf-8?B?azVDMWx3cE5ocnVreFZMa1ArdUgvd0Vla3NrRmtmUHpDd3hKamJFZy9jWEFi?=
 =?utf-8?B?cVc4WVdnSy9OTitvdndkZlM1Q3lkU05TelVyd3RyWFJXYzNGOGVLK0lSN2s2?=
 =?utf-8?B?bWl5QVN5dmRSRThtd2xvayt0QllVeDc0c3pTY3M2RHlxck4rdFZuL0l3dkRv?=
 =?utf-8?B?UDBTN012UHU4aGR5WjZwQkxOZzFGVExqcnRoMFBFajNNR0x5RXdkUTlVVnp5?=
 =?utf-8?B?UlVBL1dKR3VzcGlEa1JNZ0hlT3BYM3EzeVVmVG9HckVqWWd6eDhENkhtTC9j?=
 =?utf-8?B?S2xSMWdEeWdRRjNmSVFrNEY2Sm5wTFgxUkVxQU5SeE1VLzlkbS9sQ2k3dkVK?=
 =?utf-8?B?Y2ltRlBWWVZSU0svUjlDeDQyUW5sbmNlYXFtSVFsbEdzb2xTS2lDZUY2Z2ph?=
 =?utf-8?B?aHBCT1B5TTBHa280U0xuNHh6Zk5McFMwOUJKZzlBM25yN09vZDk2K1JCVFho?=
 =?utf-8?B?OUFyL0ZXMWNaalJDMzZoMHlDZDZ5UUxoUjFSdFhScTZUZWQyT25xNHZDdWVD?=
 =?utf-8?B?WGVLR2M4N2d5Z1AyeGM1SWp2Z2dvdUxjOEpFV0NPZXJtRFY1bVNSMTc2OXhv?=
 =?utf-8?B?V1duenE0cW5FcXNRU1JaNmhKTmxaTjNBSmt4eXZrSFh2ZEYxMEdtYnIraVk5?=
 =?utf-8?B?U3J0ak9KcmRjTW5ManA2VWliTStwUnVLMGp3b3lmR1dBVHFtMGVWWEdaeVdV?=
 =?utf-8?B?Rm9VWkZpNVdYQ3dUWVhkdGUwMWN0ZTA1dUdQTnVOTi91Mkg5QmpIcVJyQVFJ?=
 =?utf-8?B?U3JzblpVZEF6NklmK0QvNkVOanpZa3ZwdjBZZEhuUEptazVOdUpNc3NZUFNQ?=
 =?utf-8?B?c3ZVK1llK0U0TlA5dGVrYU9hcEpYNjRpN0crZWdwNnVPZ21RMUdVMjdmQTdn?=
 =?utf-8?B?SCsrNDl0MEhLSkwvOHpWNjEycm5nSXhZUFJMMGs1bk1qZnlGVkNlN1YyOTM3?=
 =?utf-8?B?TW14QWplbWZMQ3EvK1lGZjJNMUdiVkFjSjRaNFNmU0U4OVV0YVlVbGdhQmdm?=
 =?utf-8?B?Y2hoU3hXYTNOQkdkOXdjUEo3NnZLL2lIdHNRcGN4STZtMHR3S1JKMXM1Y2hT?=
 =?utf-8?B?T1RUYW13Q1dpcU1pY1B0aWNCWXJ4MTZvVmpsQm9ONCtmQWhkRXdLN3pEQ3BZ?=
 =?utf-8?B?bmR5dnkvQnJVSlpIb1dHZWVHQlUweWJtZk1IeG5PUHI1TDJRUXJBUkpBdEM3?=
 =?utf-8?Q?P66g7q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0JJTC9xd0JYUlVkcDY4Mm9OUjdrUHIwU2FiWG1ha3RuV25ZdnVDenZOeEFO?=
 =?utf-8?B?aTZkL0NQYnozVnJrVHFLc012eE1xajdBWCtPTEh3em94VHhHSjZWNXIrRUdo?=
 =?utf-8?B?ejdqa2taTkt4bHVRV3ZaT2FtT2RtbXphY2RmK3JiL1QyZ3hyR3E1OVpGTldS?=
 =?utf-8?B?MlpqK3NOQ2NkWjQzL3oyejBhL1NQU3l0a1Q5QW8rM3daRTU4M2JwR0ROSmh6?=
 =?utf-8?B?NlplSGl3WmNObkE5ZmF0MGVrbWU3VG9MMnp6dVZ3QTYvSkNTcndRUjZWMDZt?=
 =?utf-8?B?R0o0a05RazhGSGNDVHVXdVJyam5BZGtFaVk2bEljTGhha0daelF0SzNldzJM?=
 =?utf-8?B?OCtmVDlHeFdxb2NaZUNzNzBjQjYxWjE2c3BxNFFpTFBPcVRjWlc0ak1rZitw?=
 =?utf-8?B?S0pOckk2bUsvdkRlUDd5UDBHRkViQ2l2OGliY1pxMllTOUw1OHZ1UHdid2FE?=
 =?utf-8?B?SkMwYnJPd2kzUTBZQTNHQzM3eDkxcUhTZ1NoRlJLOEVsbnM3QWhaejlYbGVK?=
 =?utf-8?B?QTZVcjFGbm5Fekk3R1RCeFJWSmxzWEdLblR3MEhJOFZTd2h3Z0hMTE1NditD?=
 =?utf-8?B?L3dKSlBWME8reTJtYjlyYmdyVFFiWHJDdnFBbXQyOHhLbXVldkdvbHRNTkRB?=
 =?utf-8?B?ZUJRNHBsV1VRNjlQeVpBQXU4Zm1PV2lid1ZRR0UzWTcwWTRvSnVKVDBXWlho?=
 =?utf-8?B?UDJiUEVXZFE1WnB3RlJQOFFQQ2NNdjRxdFJabW9HYzI1NWRMZ1Y2bGxVdm9Y?=
 =?utf-8?B?Yk5wdGlnS1hJWWE0Zk9pclFycUFEVjZVUENZOWl3d2JuNy9vbkR2SCtVREFy?=
 =?utf-8?B?M3hvNWdMeVpHcG9iQkYvM3RvcVRUWXZaNUdHSi9DS0dVb2NVTnVEUzl3Q1Rm?=
 =?utf-8?B?K20xVGF3Vm5aMVE2NkprS1R4YUUzclNFSDZoTEsrYWNYc1FiQXlmWDZYN0V2?=
 =?utf-8?B?WFdxeTN2bkNqaUNYdDFialFHcGEyVmhvTHNGbWNMdW9hb0x0K0RyeVk5cmM1?=
 =?utf-8?B?dG1BS2ltWEp0R1R6ZXpzSi9lZEFSc3BsQnd1cEZqeHNROTNZMzY2WWUvZWxk?=
 =?utf-8?B?YkJrRTRuK3kwbElFdEpOTEpiSk5HVmZCV0tKUkRrWWorbXFoOCt0Rm9CR2xu?=
 =?utf-8?B?TTVSeDg2UjA5MFgwNWhGRzcxTFhJM1ovU0tScG9oazRRcGVkY0dVSmNPTnpO?=
 =?utf-8?B?dzVCQVFSSHdVNDZ6M3dDTjc5TlRDRlFVN295bzBOS2dtWVhLVmxVWnJaMmVy?=
 =?utf-8?B?d1Z3LzRmdnFVMDcyaTJkdmRmTlNRYTRDekxRdHdxNUNVK2NIeHAyNTQwR0Zv?=
 =?utf-8?B?bm9xa0FDSjFlazV0NFlQeTVHN2oxSStUNytUd1VldkRpdTJxVGhFbWJUWXdV?=
 =?utf-8?B?a0pOczAzOFpxZ1YyTjR1a1BWYTdTbi9qdmJWeDc0VVpiRzFybWxYbG1EQTZ2?=
 =?utf-8?B?TjhUY2Z0TkZQbVNQSVNkVnk0amkrNm5ObTdPT0Y4Qm50S0xqYVZsZ01rQXRU?=
 =?utf-8?B?NGRvWDRVdlYrSXRXUkFIYkhxRVF4OTM2eDFPS2FkbTcweUpvZHQyOG9FMk81?=
 =?utf-8?B?NFdqRWFSSk5jQ09OdFE5b2FXTnU0SStXM0x0Y2oyNUFaeVVNTzNOWm50L083?=
 =?utf-8?B?LzU3VENPZldXRmVTM3RWQVBSTzYwWlczdkVaQVNDMHk0ZGJ4K28vUXFabXFO?=
 =?utf-8?B?R1BFVFoxdW9FN1VpRWsvZjlBVlZSMlRvSGpBTmFWbmdBRE5UZUh0Y3BzVndW?=
 =?utf-8?B?WGE5WVpmR2dVSTI4ZENKY3MzWTNJQmU1am43UEppdFlSUUJTaEttU2dIcVhG?=
 =?utf-8?B?cGQ4YU1PZEhWTzF2TVJNN3JmdGczd1ZBZlVJa0c1N0VzY2JJUlgxQjZwa21i?=
 =?utf-8?B?Wm9mY3VLd0V3Q0VCVVo5Z0JXWFpOeHJLS3VxNmE3bHN2algyTmQ1RWZqMEdW?=
 =?utf-8?B?OFlXaXI0bTJnUGY4OStCalp1OCs0Wi9tdm9Sd3Njemxia1ZuRnIvODdIYTZk?=
 =?utf-8?B?cldOL2N5Z1pQamZaOTBpZTlDZUFoTDF6NzZ4M3BBSXgwMDlsSURWeGk4ZFBD?=
 =?utf-8?B?ZkZ3dzd3SnRGUS80UHMxdGowM0VYcitTNDgxMlZmV3VzQVpqM3dIWm5OV0lj?=
 =?utf-8?B?dkh0cFRTOHhwelpiazNqbjRzMytub1B0UEd4djBOYlBCMlVuU0N6d2xiNzgv?=
 =?utf-8?Q?K7ZjCQSnz6KfbSYXAF/LISY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e62ac76-d9f3-4da3-ffa0-08de334aeabc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 15:36:39.1654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I8pi0G6w6nc12PL758XcJD5Q0/PzgKDO7SP28SNnXtVfAlaPF0ewYpLdYESK71FP41OykRDiCz2Th3Pcr3+HfLdBNxTI6GCqGuHHTcmiA4FPNCw+aKJbEZ5XssOpaL9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15690

PiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNk
YXksIERlY2VtYmVyIDQsIDIwMjUgMTozNCBBTQ0KPiANCj4gSGkgQ29zbWluLA0KPiANCj4gdGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCg0KSGkgTGludXMsIHRoYW5rIHlvdSBmb3IgeW91ciBm
ZWVkYmFjay4NCg0KPiBPbiBGcmksIE5vdiAyMSwgMjAyNSBhdCAxMjoyN+KAr1BNIENvc21pbiBU
YW5pc2xhdg0KPiA8Y29zbWluLWdhYnJpZWwudGFuaXNsYXYueGFAcmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiANCj4gPiBUaGUgUmVuZXNhcyBSWi9UMkggKFI5QTA5RzA3NykgYW5kIFJlbmVzYXMgUlov
TjJIIChSOUEwOUcwODcpIFNvQ3MgaGF2ZQ0KPiA+IElSUS1jYXBhYmxlIHBpbnMgaGFuZGxlZCBi
eSB0aGUgSUNVLCB3aGljaCBmb3J3YXJkcyB0aGVtIHRvIHRoZSBHSUMuDQo+ID4NCj4gPiBUaGUg
SUNVIHN1cHBvcnRzIDE2IElSUSBsaW5lcywgdGhlIHBpbnMgbWFwIHRvIHRoZXNlIGxpbmVzIGFy
Yml0cmFyaWx5LA0KPiA+IGFuZCB0aGUgbWFwcGluZyBpcyBub3QgY29uZmlndXJhYmxlLg0KPiA+
DQo+ID4gQWRkIGEgR1BJTyBJUlEgY2hpcCB0aGF0IGNhbiBiZSB1c2VkIHRvIGNvbmZpZ3VyZSB0
aGVzZSBwaW5zIGFzIElSUQ0KPiA+IGxpbmVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ29z
bWluIFRhbmlzbGF2IDxjb3NtaW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4NCj4g
DQo+IE1lbnRpb24gaW4gdGhlIGNvbW1pdCB0aGF0IHRoaXMgaXMgYWNoaWV2ZWQgd2l0aCBhDQo+
IGhpZXJhcmNoaWNhbCBJUlEgZG9tYWluIHBsZWFzZS4gKEkgcmVhbGx5IGxpa2UgaG93IHRoaXMN
Cj4gd2FzIGRvbmUhKSBBbHNvIG1lbnRpb24gdGhhdCB3YWtldXAgY2FwYWJpbGl0eSBpcw0KPiBh
bHNvIGltcGxlbWVudGVkIGFzIHBhcnQgb2YgdGhlIHBhdGNoLg0KPiANCg0KQWNrLCBJIHdpbGwg
cmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgaW5jbHVkZSB5b3VyIHN1Z2dlc3Rpb25zLg0K
DQo+IFlvdSBwcm9iYWJseSBuZWVkIGE6DQo+IA0KPiBzZWxlY3QgSVJRX0RPTUFJTl9ISUVSQVJD
SFkNCj4gDQo+IEluIHRoZSByenQyaCBLY29uZmlnIGVudHJ5Pw0KPiANCg0KWWVzLCBhbG9uZyB3
aXRoIGEgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUC4NCg0KSSB3aWxsIGFkZCBib3RoIGluIHRoZSBu
ZXh0IHZlcnNpb24uDQoNCj4gPiArc3RhdGljIGludCByenQyaF9ncGlvX2lycV9zZXRfd2FrZShz
dHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCBvbikNCj4gPiArew0KPiA+ICsgICAgICAg
c3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsNCj4g
PiArICAgICAgIHN0cnVjdCByenQyaF9waW5jdHJsICpwY3RybCA9IGNvbnRhaW5lcl9vZihnYywg
c3RydWN0IHJ6dDJoX3BpbmN0cmwsIGdwaW9fY2hpcCk7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0K
PiA+ICsNCj4gPiArICAgICAgIHJldCA9IGlycV9jaGlwX3NldF93YWtlX3BhcmVudChkLCBvbik7
DQo+ID4gKyAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiA+ICsNCj4gDQo+IEFkZCBhIGNvbW1lbnQgaGVyZToNCj4gDQo+IC8qDQo+ICAqIElmIGFueSBv
ZiB0aGUgSVJRcyBhcmUgaW4gdXNlLCB0aGVuIHB1dCB0aGUgZW50aXJlIHBpbiBjb250cm9sbGVy
DQo+ICAqIG9uIHRoZSBkZXZpY2Ugd2FrZXVwIHBhdGguDQo+ICAqLw0KPiANCg0KQWNrLg0KDQo+
ID4gKyAgICAgICBpZiAob24pDQo+ID4gKyAgICAgICAgICAgICAgIGF0b21pY19pbmMoJnBjdHJs
LT53YWtldXBfcGF0aCk7DQo+ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgIGF0
b21pY19kZWMoJnBjdHJsLT53YWtldXBfcGF0aCk7DQo+IA0KPiBCVFcgdGhpcyBpcyBhbiBlbGVn
YW50IHBpZWNlIG9mIGNvZGUgSSB0aGluayBhIGxvdCBvZiBvdGhlciBkcml2ZXJzDQo+IG5lZWQu
Li4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgcnp0MmhfZ3Bpb19jaGlsZF90b19wYXJlbnRfaHdpcnEo
c3RydWN0IGdwaW9fY2hpcCAqZ2MsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY2hpbGQsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY2hpbGRfdHlwZSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAq
cGFyZW50LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50ICpwYXJlbnRfdHlwZSkNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IHJ6
dDJoX3BpbmN0cmwgKnBjdHJsID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiA+ICsgICAgICAg
dTggcG9ydCA9IFJaVDJIX1BJTl9JRF9UT19QT1JUKGNoaWxkKTsNCj4gPiArICAgICAgIHU4IHBp
biA9IFJaVDJIX1BJTl9JRF9UT19QSU4oY2hpbGQpOw0KPiA+ICsgICAgICAgdTggcGFyZW50X2ly
cTsNCj4gPiArDQo+ID4gKyAgICAgICBwYXJlbnRfaXJxID0gcnp0MmhfZ3Bpb19pcnFfbWFwW2No
aWxkXTsNCj4gPiArICAgICAgIGlmIChwYXJlbnRfaXJxIDwgUlpUMkhfSU5URVJSVVBUU19TVEFS
VCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAg
ICAgaWYgKHRlc3RfYW5kX3NldF9iaXQocGFyZW50X2lycSAtIFJaVDJIX0lOVEVSUlVQVFNfU1RB
UlQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY3RybC0+dXNlZF9pcnFzKSkN
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsNCj4gPiArDQo+ID4gKyAgICAgICBy
enQyaF9waW5jdHJsX3NldF9wZmNfbW9kZShwY3RybCwgcG9ydCwgcGluLCBQRkNfRlVOQ19JTlRF
UlJVUFQpOw0KPiA+ICsNCj4gPiArICAgICAgICpwYXJlbnQgPSBwYXJlbnRfaXJxOw0KPiA+ICsg
ICAgICAgKnBhcmVudF90eXBlID0gY2hpbGRfdHlwZTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1
cm4gMDsNCj4gPiArfQ0KPiANCj4gQ29tcGxleCwgYnV0IGVhc3kgdG8gZm9sbG93LCB1bmRlcnN0
YW5kIGFuZCBkZWJ1Zy4NCj4gR29vZCBqb2IgaGVyZSENCj4gDQoNClRoYW5rIHlvdSENCg0KPiBZ
b3VycywNCj4gTGludXMgV2FsbGVpag0K

