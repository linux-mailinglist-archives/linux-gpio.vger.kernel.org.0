Return-Path: <linux-gpio+bounces-11123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44354997814
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 00:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E10E2B22308
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 22:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3E21C9B99;
	Wed,  9 Oct 2024 22:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NfhivNrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F42AE8C;
	Wed,  9 Oct 2024 22:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728511268; cv=fail; b=UuCwc1w0XygTNx+TxveeTxWumaop+fUXFL1HjdFIyl5QzCIGiXxTvS8SusHsp420WXZ2CgHJGmwk+o03K3pS58XmtdtjxpxlWPTRjkdilRWwfapy9ctb6Peu+AnK26sWqZwz3MVttJpg4/M2ud33PwyfsWik/9Oo8g7g/1pKWaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728511268; c=relaxed/simple;
	bh=dGTMnwBIXA2HXF/GCq6CzyvHBdok4nZ+YbeHbqfToKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OZMCboqVa07O8cYAE2eQmcSTMJMFI68qmBm4Tl7l6zpk08yP6V5zA5gdraFYBBv+y3BRqjHz/t96hPKX7Yr/2wNHKRZYSQDIEHyNVvoZFsLDGPD/+TWDyvvbw+OhWXtufiphdrtjHSxnpYIM9alf5UgkkZ3mJhcrpUAYvZJIn2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NfhivNrD; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcdweg6SdJgu+2+CfuOQPioQOJTAD1MoDiS3YP4nSQcg3G1z5rfDVTCXiC/Qcr/4a6GEffO0JlRLjb/TJl0AA1Iu4Ylop0vqVv5AMi5gfZbYyJlS+IwDo95JtQlMfNuSIdpuWAwoHHhFQsCKTguiuzLHWptB1cQ5hrrx3pkzgrog8XusFsGKusPBb3HPwbLolP4BXJQD7kpPyU5GzLw8bw+95YBxS0/v+Nf8Vsgh6bqOjAMXKzMWVoirh29quDpde1aiJIiwS7HSyiQ3SMsUD7TyEHd7uwuzumP/GDZEXGI4j1A94hU2paNi7rCivLfNfmrKauVlwg2ieppTKxcheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGTMnwBIXA2HXF/GCq6CzyvHBdok4nZ+YbeHbqfToKI=;
 b=dMUNdpobU03Nalg/G/shoFbnJammWNTo8+Aa8GB2eY78RSWL3dIhGG8LmKIXfFtfe88iT0NVUy6jJc9fTqqcqUK5SSFBMOyQzB/LcxwngUNkdGxy9qKFwQIm5WyCHLFBIV+P7dak5YskwZiZ4zibwY793db2w6yIRqazcGk3DImko6dr0kXK0xUsTMcJI03O5pdavDpoN+UO2HG44nohxJ6rO9KKPpdPdNjjFX+Wo/lo4Vcbgj2EOENEyIvKfoO8t9rO+iO4iMbTCdQ/pe/3VWnOARW2nSJWsPO6mWD3+MdqzUo2WF2FpagtAoma7K65tw8irgiRkl6ytrHqpTfa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGTMnwBIXA2HXF/GCq6CzyvHBdok4nZ+YbeHbqfToKI=;
 b=NfhivNrDqMd84Ot4GhIEWSjmbqI+GlMsqzK3eUEl3cuh+QZyST3jXrDcc+tpDIsNQ0WFe4pdxr0549P0+3VobVTPvNL+6stYHimsURKfauy4Bkdm9/jxABvttREnFla5NVx5Rs+5vr1WEBEVaOJ79XZ33mMiPcSF1aXjkczn0KU=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY3PR01MB11160.jpnprd01.prod.outlook.com (2603:1096:400:3d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 9 Oct
 2024 22:00:59 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 22:00:59 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>
CC: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Remove
 RZG2L_TINT_IRQ_START_INDEX
Thread-Topic: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Remove
 RZG2L_TINT_IRQ_START_INDEX
Thread-Index: AQHbE0h6ezGR3UqK/UyeVU3B6gF2eLJ+HCIAgAAnnYCAAMLdIA==
Date: Wed, 9 Oct 2024 22:00:59 +0000
Message-ID:
 <TY3PR01MB12089E2CF62FE0F2B96449A01C27F2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
 <20240930145244.356565-2-fabrizio.castro.jz@renesas.com>
 <1c3c8c5c-8f84-47c7-a9d0-963f95cba147@tuxon.dev>
 <CAMuHMdXuOm8xwYOMsJthcR+WaFjQPM--0A--f=FtXS9k5MZnjg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXuOm8xwYOMsJthcR+WaFjQPM--0A--f=FtXS9k5MZnjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY3PR01MB11160:EE_
x-ms-office365-filtering-correlation-id: 38a2c2e1-b37b-4866-7f8d-08dce8addb9c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emZQeDdsZ054QVBZL25ncUc2UDRNaGdwcVloMWtSUnM5UjFuTU11VWxJQ1Er?=
 =?utf-8?B?Ymk3cG9SUDJwcmNENlY5bDVYUDJ5azRTUnJLQjFhdUpGVlR1THdLa0RkdmNj?=
 =?utf-8?B?K1VQUFNHTmlERmxUM1ozMms0TWZiam9JcHVUTDVxdXlITkJQUmRTRnRkWmFC?=
 =?utf-8?B?VE5uZjVVbmhvYUlZaVlpWndGYndNWGZiT1B6RitmdUFuWUJGeHUycmVXT1hz?=
 =?utf-8?B?UG8yM1U3K2xGa3ZiLzhRYVZQcGRuODhDdkdweGZCYmZVOHdPRzJRT3NOSjds?=
 =?utf-8?B?ajR6UTlnQ3Uya3U2anRjS0VnV3Jod1l0YjNWNW0vN3F2RlVkMWo2dkVyWFU4?=
 =?utf-8?B?L09FMzl2M01SNGFkWUhnMzZZVEMyU1lneXk1b0EzcFBKRkQxUTVxa3JOenVo?=
 =?utf-8?B?KytremxEQXllaC9PUmp5NTVlYmQ3YTlFdHI5SDh0bGVuS1cvOVFMQlJMMkxj?=
 =?utf-8?B?ejIxSU9PZTNtbTd4NGthcDltb2RIeFZsNE5CczJXc3hWZSs0RDZMeithbVZm?=
 =?utf-8?B?TXFkK3NadUk5a0VVWFZHYXByWXpyM3U3a3E4UEZNRGV5R1dWd0FzNnlEdG93?=
 =?utf-8?B?aUZhOXMvVlpaWWxpL3JzTGFsZ21YclJIaEtFejVYNzJIMGZGL2c1amhGdnVD?=
 =?utf-8?B?VzRUTFBPeExDTUlBMW9FSGhDaDdqNWFmNnMrRHdEL1BsQzdTTFpzdloyMmIv?=
 =?utf-8?B?dU44L1ZIWmhkQ3JpOEpKS2FBM0dJRFpyY0d0QWJvZERWYWJwUzdheVN0Tjgx?=
 =?utf-8?B?Wk5hcFdQWHN2TlhFRENRR2RWL2pxejZmdVgwaTFIOEF5MHlRYkxGTVV2MWp6?=
 =?utf-8?B?TTJITllPOUU5UmsvZXZjSHhTSXJXL21YY2hQaXU4MHJ6WU10bS9meDhqTmVu?=
 =?utf-8?B?Ym1WSnBDcU1FbDBsM2xMK2x0cmNwV01TdkJYcktCTW9pKzBDbm1PaTJlYUEr?=
 =?utf-8?B?L2EwMWpQNW1scFVpVHhIcHZCQWVjbFpDc0tvVmljTmVXcytmQVN5WHphbWI4?=
 =?utf-8?B?T2tqbnlrQjFzM1Jzd0w2blE4bzRVbVJraHZ4d280UDNza3JWRk1vQ2l0Rllk?=
 =?utf-8?B?eGRrbmlWOVhmamIzcGVLaFBvWTNoN2F2cGx2WEFIRU8wb1QvU3djckkvTnUz?=
 =?utf-8?B?cTNnbE1rSXVHZzB6MlB1ZXRhZE5uRmIrRlhuR3Vwc2txd1hEaUhOdTVaZ1lx?=
 =?utf-8?B?S01nUFBscHlBZVpNWUJTNDk4MXU1WTZ6NnA0clByMXpsUzBIKzNpNHJWaU55?=
 =?utf-8?B?NWRVK2pSZkwyay9WcHlBYWFKdDBIMUlJWkRySGZhWFJTNGRJU0pIUGdKN1BE?=
 =?utf-8?B?TkQzMjR5U085ekZTbTkwNWxiNVEzSFo2Y2dITEJOWFhPblpRblp6MWZXcGo3?=
 =?utf-8?B?NVVmQXZHZ095WDFUS0RoSDBaOXpsVjJGZTF1aC9nbDc3UVhlamloQXdJYWdm?=
 =?utf-8?B?azhnSmMwamZMQUFUdzZHT3lFSlVVa3VveE9XemRJdmtJbit4Wmd1TlhRRlk2?=
 =?utf-8?B?aTlNSE1RSXJWMnR2VUdFT3JQdkVxTUFpNGcrSHMydUhaQ2x3djZGMnhhRyta?=
 =?utf-8?B?KzQweUNXc05WVUVXOWF5MGZHc21Gd0NtOTJnanVSZGx5bmZyMzFrUlcxMXow?=
 =?utf-8?B?ZkNvaThpQ1crRDVILzVkb3pkNzNOVDZsOUx1b2wzN2RpVksyQVoyd2NEY3J5?=
 =?utf-8?B?NVNVM2NLejU1VDFDeFh0d3hCbHZLTW94bVFGNzFia1ZTT2loWEw1ZSs0NW9k?=
 =?utf-8?B?QksrUnRUUlhVcFhIREgvVWdSQzIwSmRPMCs1cElzeFV5VTNPN2dRNnhNdFlo?=
 =?utf-8?B?ZUxOOFF5b25vdzlodytZUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ykc4ckFRU0V6UkZaNXVuTlhoZUVGTDNQZEgrdU94S3R4YmpwU3QrQmJqYW9Y?=
 =?utf-8?B?NTNrYU5INTlkaHVTT0xTOVVjaWRiLzFCUUJJODY5YllsNWZncnZDQXlwQUNq?=
 =?utf-8?B?UWhxSHZ3TUM5QXF0a0J2VzhsdEg4UjlUa0x3ZXJqVEMwQ1A0NDdGeXkrb0cx?=
 =?utf-8?B?R1pDRkZJT2tVMVBaS1pPODZyZ1pab2ZFRVlybGFEbzgyaXRIUzNHNVBBSW52?=
 =?utf-8?B?T1YyUVlQT0JwZ2JFdFF4M2VHQi95dFA1WWphMUVVRjJjeDFaNjBPVWFLZ3k5?=
 =?utf-8?B?YzFxa2tiZHNPdHBBVW5QUnFtNmFsUjMxdy9jazcwaWRoSnNmRG83Nko5NEo1?=
 =?utf-8?B?RlRpb3hqelFRRGdpMlZTRUpWU2JKRHArSzdXV2txOUxyZVdyOHpTRnIwZmIz?=
 =?utf-8?B?OWQ5cGxVYVRQVERiYTZXYVdLcUtQZnV5TndTRDNFZTJMUnZWYzNrT3o2TTBX?=
 =?utf-8?B?aVJWNldLN2txUlAwZjlGZVNPbGtEZ3pqSWpKa3FuWmZPeEd6cktHaGxLcnhJ?=
 =?utf-8?B?V3JlTVplVk56ZmNqNDdiUmdvbTdSdEFWWE4wYUN4UmJhWUtQNmVaVVIvdWtP?=
 =?utf-8?B?cnJiOFBQODFsd1RuWkdiUU81STdBaThvcHpIZFdmYXNVdjJOQW5vKzlYTjIv?=
 =?utf-8?B?QTdGU3hiUi9TYkVJNm9pWGRYV0lNNlkzVGhpWEg5UHZqbDYvVXhIY1FsaGoz?=
 =?utf-8?B?STNKeklGUjY5VmRFd1NCQVFpanp4Ni9EK0cxR2JxeXA2Y2xCSlN0bnQ1TktW?=
 =?utf-8?B?RmpobThWc2RhQ0FLUVJzWmo3V240NmFXclcrbGRITTBtSkNveWh2bkZlTjVl?=
 =?utf-8?B?NDlmRTI2cWpTYTk3ekNoeVZyMERhUC9ZekNmc05Jb09jeFh1MDFZd2k5RVJn?=
 =?utf-8?B?QnViVnVmT1BhaUsvQTEzTytFWEU0QXg5MzRDaWRoQktTVmRQOWdXTzZUeDN4?=
 =?utf-8?B?dWdLRFQ5MjVNUmJkQW5SM3JNWnYyUGp6UVBEQmtrT0dqbmM0eXFUbkdCbEJ0?=
 =?utf-8?B?NFdHNGdmM2VvWDJ3akhaK2lCVGx4RVJzeEdmbkRHZTZnQmphWXlRVzY2QmdQ?=
 =?utf-8?B?ZUNLWmd0cDFiQ0YzcENZMVNDUFMyejZjc3NTS1FjV2RpTnZxL0hWZDI4UmZG?=
 =?utf-8?B?VVZ1Z2FFMlpGTzJDRGpjUWJiR3dpYnVaZ21ycjQ4S214cHJEbHE3eUVnTzFT?=
 =?utf-8?B?bnZubjRuL0FlbnJDMW00L3daaEZMamxWZ1VHa2wxMTRPQWpONk95OUh2WUFq?=
 =?utf-8?B?K29CL0xMcXFBSEQyOGxGUUpOenUvNlg4MzN3Y3RUTWhDRDVDbUduTUZrOHFj?=
 =?utf-8?B?QTV5eDhOd1FDb0lmL0ZWRDY1dnhvNjQzTlFCMGVpelcxVEpNR2Z6dVFNVmx5?=
 =?utf-8?B?STdmTzNmY1Z4QUd2VHMzdkpRVENBWE81K0dpUWpZUGNJZzBGVWVFbzZxUlRD?=
 =?utf-8?B?enNLVzVIOFhvV1hkcmNtSEVZRVFsRFlySzdKQWdtUFJKcFRCY291eDRSVzRQ?=
 =?utf-8?B?ckxxbnFEbW1RKzVwMjZsRTBkQzVCVFJqUy9rbkp2Y3NHSU9WR2xYRW1SWmZ6?=
 =?utf-8?B?QTVmK0VqdnA2bTVJcEJYR0dkbTR6YzNuTVVpWkZvUTkvN1NZaDBrckI4RmJP?=
 =?utf-8?B?OGdyc0Z5RTVqT0V1YXdMM2l0c3ZMY1Blb2tRTDVDSjBSaEFXcFZYY3V2ZUpI?=
 =?utf-8?B?RDd2aTJKeGhNZTIwK3VTaytiRGd2cXR2VFRPS2tJVGwwTTk0YWcvRFY5ZDRm?=
 =?utf-8?B?ajlqbFF4VlprdzBBcEpmTDJxc3pXMnFQdHhBblBJY0pFZnJHQVF1NU1qM3VP?=
 =?utf-8?B?bjZWY1hLK3FmRmx1RWZYTlJBUWJRWWpmL1JHY2NpZXcwdmEwSWxoUVUrKzNQ?=
 =?utf-8?B?bENXaHU4cEljcXRhQklCdTlmOFR6U1JlU0xQbFBSeFZJU3lEN21GM2FjVDU0?=
 =?utf-8?B?R2hPZmhqUkRBZzlEdGNsZC9kNFUvMUZBYjBYS3BkZ1Q5bzVFVnU2ekxtYVJn?=
 =?utf-8?B?SGQvdTNmSnBFd1loakg0UWJpN1dia0Rha1g3cWloVkxUTlVBZ2Q3UVoxOFJH?=
 =?utf-8?B?LzY0VWc3WjRlVXY4YWkzalJaU012WUtFQytJaHJpY2F4RzhKcFA3QzdrNFdY?=
 =?utf-8?B?NytucnRsMnh6b3VJa0xrd2EwdkdWZ3FjMkRYY2F1Wkl5OExXNHVMbE9PMnc1?=
 =?utf-8?B?Rmc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a2c2e1-b37b-4866-7f8d-08dce8addb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 22:00:59.0702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWFKg0ux/Qvc1aD842BiBGeq+lLqaZD8uOKZJNsi2KF1J8PbKqBuS2Y+FdIBXQOFw7f50INFIvrbDmfQE5aqyrqq2m+Sr33HexB8SqdASeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11160

SGkgR2VlcnQsIGhpIENsYXVkaXUsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBG
cm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE9jdG9iZXIgOSwgMjAyNCAxMToyMyBBTQ0KPiBUbzogQ2xhdWRpdS5CZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gQ2M6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPjsgR2VlcnQNCj4gVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IENocmlzIFBhdGVyc29u
IDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzVdIHBp
bmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBSZW1vdmUgUlpHMkxfVElOVF9JUlFfU1RBUlRfSU5ERVgN
Cj4gDQo+IEhpIENsYXVkaXUsDQo+IA0KPiBPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDEwOjAw4oCv
QU0gY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6DQo+ID4g
T24gMzAuMDkuMjAyNCAxNzo1MiwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+ID4gVGhlIFJa
L1YySChQKSBoYXMgMTYgSVJRIGludGVycnVwdHMsIHdoaWxlIGV2ZXJ5IG90aGVyIHBsYXRmb3Jt
cw0KPiA+ID4gaGFzIDgsIGFuZCB0aGlzIGFmZmVjdHMgdGhlIHN0YXJ0IGluZGV4IG9mIFRJTlQg
aW50ZXJydXB0cw0KPiA+ID4gKDEgKyAxNiA9IDE3LCByYXRoZXIgdGhhbiAxICsgOCA9IDkpLg0K
PiA+ID4gTWFjcm8gUlpHMkxfVElOVF9JUlFfU1RBUlRfSU5ERVggY2Fubm90IHdvcmsgYW55bW9y
ZSwgcmVwbGFjZQ0KPiA+ID4gaXQgd2l0aCBhIG5ldyBtZW1iZXIgd2l0aGluIHN0cnVjdCByemcy
bF9od2NmZy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRlc3RlZC1ieTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtz
IQ0KPiANCj4gPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Yw0KPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+
IA0KPiA+ID4gQEAgLTI1MSw2ICsyNTAsNyBAQCBlbnVtIHJ6ZzJsX2lvbGhfaW5kZXggew0KPiA+
ID4gICAqIEBmdW5jX2Jhc2U6IGJhc2UgbnVtYmVyIGZvciBwb3J0IGZ1bmN0aW9uIChzZWUgcmVn
aXN0ZXIgUEZDKQ0KPiA+ID4gICAqIEBvZW5fbWF4X3BpbjogdGhlIG1heGltdW0gcGluIG51bWJl
ciBzdXBwb3J0aW5nIG91dHB1dCBlbmFibGUNCj4gPiA+ICAgKiBAb2VuX21heF9wb3J0OiB0aGUg
bWF4aW11bSBwb3J0IG51bWJlciBzdXBwb3J0aW5nIG91dHB1dCBlbmFibGUNCj4gPiA+ICsgKiBA
dGludF9zdGFydF9pbmRleDogdGhlIHN0YXJ0IGluZGV4IGZvciB0aGUgVElOVCBpbnRlcnJ1cHRz
DQo+ID4gPiAgICovDQo+ID4gPiAgc3RydWN0IHJ6ZzJsX2h3Y2ZnIHsNCj4gPiA+ICAgICAgIGNv
bnN0IHN0cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRzIHJlZ3M7DQo+ID4gPiBAQCAtMjYyLDYg
KzI2Miw3IEBAIHN0cnVjdCByemcybF9od2NmZyB7DQo+ID4gPiAgICAgICB1OCBmdW5jX2Jhc2U7
DQo+ID4gPiAgICAgICB1OCBvZW5fbWF4X3BpbjsNCj4gPiA+ICAgICAgIHU4IG9lbl9tYXhfcG9y
dDsNCj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCB0aW50X3N0YXJ0X2luZGV4Ow0KPiA+DQo+ID4g
TWF5YmUgeW91IGNhbiB1c2UgdTE2IChldmVuIHU4IGlzIGVub3VnaCBhdCB0aGUgbW9tZW50KSBh
bmQgYWRkIGl0IGEgYml0DQo+ID4gYWJvdmUgKGlmIHUxNiBvciBldmVuIGlmIHVuc2lnbmVkIGlu
dCkgdG8gYXZvaWQgYW55IHBhZGRpbmcsIGlmIGFueS4NCj4gDQo+IEdvb2QgY2F0Y2gsIEkgaGFk
IG1pc3NlZCB0aGF0IHN0cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRzIGlzIDE2LWJpdA0KPiBh
bGlnbmVkIDstKQ0KPiANCj4gSSB3aWxsIGNoYW5nZSBpdCB0byB1MTYgYW5kIG1vdmUgaXQgdXAg
d2hpbGUgYXBwbHlpbmcuDQoNClRoYW5rIHlvdSBib3RoLg0KDQpLaW5kIHJlZ2FyZHMsDQpGYWIN
Cg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

