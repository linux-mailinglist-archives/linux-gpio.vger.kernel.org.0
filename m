Return-Path: <linux-gpio+bounces-8291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42450937213
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 03:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5A728254F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 01:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E4D23B0;
	Fri, 19 Jul 2024 01:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="M8iU5fGt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013023.outbound.protection.outlook.com [52.101.67.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB70A32;
	Fri, 19 Jul 2024 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721353602; cv=fail; b=vFrPrTElBgKe4ffUHkVDDTA6GUGV7cBBKAaV+nynH84RGTy0N3ELt2h0OSsurcVSQyGHX3M1qfsOHJKTz+gr1cT3jEFs2wC+SNrqnlE8HI09vf93HBSnuW00TZ7rIXoPaRHDJm5KfUhFkNckH58h4vK+4Bf5bpwZ/BGUxirHYZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721353602; c=relaxed/simple;
	bh=ij0x1T632oMT4r+l7rkhbk0x5TAY5tzXqy0mKAHZe7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BgY4qmxJ64YkG9HGSUS/4264f+KaFUTdmhHOwHNvX70bgzPx8oZiM66lurG878jhsmx2tKU0rQHKFJUV88rK1WNq/rmJUgBVsGgPay5U4KA5CTI8+0V/tdhzdfghgagBR4Up5sBYNKLA8Nf/tLQtrQ+dw93wNUCm8cu6MFUpNjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=M8iU5fGt; arc=fail smtp.client-ip=52.101.67.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T433svjORvhjfA7D3qxEoGfY3Ray2NbefSk77qtWLCsGyEAE7IwHOliWtaYOySSKNvCvjm2klpgcFEDYWqJMzniZMq2sDmwu7Sy850IVOeOL+S7HTxjY2s/6F4N1gd+sTxFmCG5saQN/RAR/UEO3hOE1bcDv4JkneZsqaAsFPvmRhev0wOY2BNhZdF9y8e2n7DPWv/2VnXqWbq16venvLU8Ko351kgq0WHTeGwdeSXXin2BC6TZFUmCVjrOrDX6kDwurJo0rcEha/21vYr5mHpokzpEq/4g6cP5/2qn6Ki/9PLQDgBSCIpCzcdrNONO4lL3OcNNZKSTPIkYn7SJvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij0x1T632oMT4r+l7rkhbk0x5TAY5tzXqy0mKAHZe7c=;
 b=g0vjsb1SuH5n5HriMB+QSy+wsWcaUoLDTM/YZcDLiPrsyIckrwV7Qfs1MQJ23RjhLSAIK+eZdgoIP+MxbSn19T+5E5Aar+pT+y5kGDwf4UeTYGZyDBd44XjKey3SJA1rKBiIezOfrRiCV5/B2uxzwH3gB8L576MH49Ef/f0eUXEpANDaMF2JDmKjR7SaoDTd1S4x7w50CcJMTTuOc+kJnLkAYsuu2J5hP2YoRA61O8fvMxxzGN2mzoE5vBd9PkU1Ph27NFzlJJGXjlqZNPANilLH2kA6UhSDWjEkZlSLyNSOyQs2c4/uUrXG7A0IJzSQaiCzTeQvNbOfxQctJmt8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij0x1T632oMT4r+l7rkhbk0x5TAY5tzXqy0mKAHZe7c=;
 b=M8iU5fGtE3vNjrHg+FnJlCGaGa2Ev+oci4D8JB/IhEjZcwu9OcBkZcFWyk9Cc/PuRqxoo2VaY6kCCmqmyqO1y9bFPErsHaQ7ndSWetfUh4rxe9VoR7BaH7jeju3jc2r5A1MPXTb/XFqhww+5nizKUbWwCkdn+TG0SdhysgIlFqY=
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 01:46:36 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 01:46:36 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
Thread-Topic: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
Thread-Index: AQHalSX3LJYhygbqkUe2wC+6G48jP7F1u+eAgIeEEgCAAI9BMA==
Date: Fri, 19 Jul 2024 01:46:36 +0000
Message-ID:
 <DU0PR04MB9496F701AE831C2DEDA6205390AD2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References:
 <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
 <09eb7049-269e-4616-a33d-5b304c7aabf0@gmx.net>
In-Reply-To: <09eb7049-269e-4616-a33d-5b304c7aabf0@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS8PR04MB8231:EE_
x-ms-office365-filtering-correlation-id: de4d261e-5e61-4579-cc21-08dca794a077
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHlmVFJzTTk0MTV4amcrZlNLTHA3QzVhSy90Y2NRcWJ0aS9LaFRBV1JHRm51?=
 =?utf-8?B?Z1ZBN3l2dmdJOXJES3UvYWZ6djV0cTRISlU0TGtrKy9neDJtVzVmM0Z0NVMz?=
 =?utf-8?B?QjJnNU9ERE1KV1pWa2Y2VDFjUDV5RjRNMjMrV2hTaGFtYVIrZHFENVVLQlNM?=
 =?utf-8?B?U2ovTWd0bzZkU2FBQ1lMcVBMU0Q2cVdSU3ZkbG4rYWM5Qk9pVzlMbnRCa2xm?=
 =?utf-8?B?bUg2aUJRZkV0U0FCVGRBN2dTbi9FOGNXZFdsaUpSd2VtbCt6QS9tRE93c1R6?=
 =?utf-8?B?Z1FGT2o4OGViOEpKaDRYU1JNd1lCV201Z2Q3VUJDZFljSyt3Z1VSME1sVGFG?=
 =?utf-8?B?Y1R0T3JtMWNTT3N5WHRuNzFmR3BrcVdkbGxiOWlKSkZkcEtKNVo5RFVkUGlt?=
 =?utf-8?B?a0tJSDRlTHdsWGtDaVdTdXdibDhRbUdLVUgzdG5ud2YvU05HVUQ1NFpoUlAx?=
 =?utf-8?B?L2VHb0l2SHMrblJpYUdhSjZYN3BEOW5RN1MveEhwNTZJWTJWVlp2UzBTV2d5?=
 =?utf-8?B?Zm9xdG1IS3lpcUNuV0p3UWN3ckRMajZoZDh1enNSbjh0UWdnOG1WWTh4YkJC?=
 =?utf-8?B?RnlNS3EyWnAzdWNBMjBMQi9JTk1wTTNsbmMxMklBYVI4d0ZWTlc0dHZMaVdN?=
 =?utf-8?B?M1hyNFJUek5aeVRvNnREY2NjTXZ6QUFZdVd3andGcEUyT2ZjbmNXbU4vd21m?=
 =?utf-8?B?QzA5R2k1YVJST3d3OS9BQTl5Zk9YMGQyUXhDMTROeno5a3R3NE1vVVNlMm1U?=
 =?utf-8?B?c0F4VXpueEtueUtHWVNUclExVUlPc0lRWEREYWMwVWQwSCs1Y1RvaTFzdFdn?=
 =?utf-8?B?UTJSdTFKOFVEbWE1N0FDeFl5emVkdzljblp4YndXVnBQOURTazJZSEdrdThR?=
 =?utf-8?B?bHcwRndEN1FXdStjMk4yd09iRWNWRStVck1mWGxpUnRyQUs4T1pka0tCaFl4?=
 =?utf-8?B?by9hNlZlVUp5anQyTXRncmwzOWUvQllDQUhsTnZaOTFaL3paZDNLYWlWNGt3?=
 =?utf-8?B?anJuV2ZYTVlQWWh3ZS9iTm1Oc0E1MDRsZEpFVDZxTSt4ckVHUW5jYmdwMmow?=
 =?utf-8?B?MktHV2RScnUydDlsRk80ajZPNGp1QWt0V2Z3cUhVR1NqUU1qd01iNm14S3Vs?=
 =?utf-8?B?L1F5azNvb252SzVxYzBqR1F0RFE0MlI1blFzQ1JKdWdyeC9rTjkrTnhrVEJo?=
 =?utf-8?B?b3hCaTBCTWY5bkFXdjBRUUNMd3hiVEZPMVQ1d2FEbHFFbmxGbnpLY3hzR1N4?=
 =?utf-8?B?d1ZEeGs3cStzWExYZVNrMWlFaFlFTmo3cU1QNk1WZDJQQ2hXL0VUZjkxRWJp?=
 =?utf-8?B?RTFWbjgzLys1WHFJRjIxMEc4Rk56UysrWTNxMzQ5Q1dFbFhMaExXcHlDbXVO?=
 =?utf-8?B?QlNUZ1RQRElWMURUVElFSjlPMk1KSWNZTS9INHpTNzIzZkNXKzdLcXZ4MlFn?=
 =?utf-8?B?a3pHcFZYbm5uUTk0NCtkM2l2cm4ySFJYTFVJdWtnV3FEQmI4RjM2U29zd2tz?=
 =?utf-8?B?OE1jSU5pTzduTnFlVXJpL0paKzNFUDJGSmFMT1RVVG9pT1BjQjYwSFBZVHVk?=
 =?utf-8?B?UkZSMnNOeENUYzhGSzI5WmtndElyYmxFVEV1NEFzbitZUFlHUDd6Zll4cEgy?=
 =?utf-8?B?T1o1dlVNM3QyWlVDUzdacEVCNllGQW1qdDhrQXdOVS9IYVRhZWhDQWNVeTVj?=
 =?utf-8?B?SVBkQW1weFV4TjFDVVN1UGQxRWkwYi9QUVM0SVBzREp4U00xQUdXcTBVNFgr?=
 =?utf-8?B?Vitqd1U0ZnBZa0N1K0lGUmE0VXdtNWZxaVBzTTFuUzh6UU5MdVF1ajZHR0wy?=
 =?utf-8?B?eWNSeEw3Q0RmMmJqRXJCNlBuSkFWWEdqV2RXcGVFTXUzQlltNmo1bG9tWGJH?=
 =?utf-8?B?Rm96cXlkK21Oamo2WGNTZXZwNGlnZDF5RFZDK1ZSRFk0RHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGJNV09GTERycmY3R0VocEVseTRjUzQyWHJ0aFptTUd4QTlvRnczeldqSU8v?=
 =?utf-8?B?MmN5VTdSb2FpWmpEVy9WWGpZWm9yeFBJZDRNa0NhQjRjMzN3UmsxRGZYaWtz?=
 =?utf-8?B?bks1VGFLUUFuckFjM3pTcFNSZlE1VjBwd20reTlwTXhPVHIwbk5JQ1ZHMGY0?=
 =?utf-8?B?elVsNGMvVWdmTStGWDhXOCs3a0JldHJDNkxRcC9EbGZvdTQrZzZJSVdxQkpo?=
 =?utf-8?B?M1NwZmwxWG5iQTNRczdOMzArMWIxZ3FPekp2d29YZFU5ZnV4NFM4a1NMcDUx?=
 =?utf-8?B?V0pFTk4zTm5KNkNzeUFGb3BJQzIyaFBXMGl1YjYzSTlBa3RmY1ZvNnVRc2Vt?=
 =?utf-8?B?Y3JOZGQzVkY3Sm5qUnI2K0I1clZrSDBRY05YZmtoOTRpbmpmRGJSdUFyc24w?=
 =?utf-8?B?cW9QNWhmczl6UlpTSWNLUm90M09NWnZtb204aU5RdFJlUGNQMWl2YWFtZllQ?=
 =?utf-8?B?bVFxYm5XTlhjcTRJTlJlK241UjlBU3VrZk9iRUsveTFTTGtTOTdKUVZEb29v?=
 =?utf-8?B?U3F5VjlzQzdLRTN1SWNibVdlZXl1d0RycVZidXJRQXRwNHRrVkg3YlBLL05q?=
 =?utf-8?B?U1BObVkvWVFoelFRSzlqMUtGdmFOVi9jMTlxbUNWQjhuTERBNDh4bUJudVJs?=
 =?utf-8?B?S3I3bVpaZU8xdnVjMWs2VlMvYWdCRGpRVUk4VkRnSFhHcVN3Sys4QndHU1ps?=
 =?utf-8?B?WnVLVDVraXpVQ0xVZGprdmlhMk5yQm43YWl5WFE0cERpbndhT1NaYW53TjJn?=
 =?utf-8?B?OURlb2lNckZWcnIydmRCalBhS2lTZVdGRlBLWWFoTGlGRHJZVW1wRE1xN2E0?=
 =?utf-8?B?ZVc4aFhYWDBwNTlwMzRkSDNsVEN6UmxqZm1admxCaFU0bk1zeGI4MDVPbHpR?=
 =?utf-8?B?NHdKWEFjbUpkTGthblNpU3lQbXZuS1JaRzJQZXQ2Mk02S0xRZVJLUTRGY0FR?=
 =?utf-8?B?QVB0MEozZDJMSEY4dlJNT3liWFVDbjBjTEFRRmc0Tm1lMnA5WVhET3dSaFdu?=
 =?utf-8?B?MW05eEVHOGRnTTl1ci9QTzBCRERhMXoydEk0TkxEeldDcCtSbmJlb05Bamhl?=
 =?utf-8?B?OVN5Y3MwMlRyaDJhRGpRV2dYSk9HdFcrUUtTR1RxSTA0bS9VVlRFMjR2ZXFp?=
 =?utf-8?B?U3JITWxQMUlHZ1l4RU9IZzA1R1AyeUVjZ0pqR0MxcGp5OWRJUTZXUEZPTHNi?=
 =?utf-8?B?WXNra1NRZlZ6WWpPMUIyN3ZuUUVhS05uelVFcVpRQ0paRnpsWlBQZEt5Vzlo?=
 =?utf-8?B?REUvM3lMOEJjdVZPWUpCZ3I0TEQ5N3RkZnBwT3RiOGJSYlpPaUZUMUJENWVn?=
 =?utf-8?B?aGRmcDg2TENaakFIbmRNMStsWFhYT1J1L0xJQ3NrazNBY294S0YwZGFhaGtY?=
 =?utf-8?B?WUpZZ2Q1bjBZTUhlZFhOMVlUaVZuQ3FGWmlpWVY0NkY4VEFGLzJLUk9Dampu?=
 =?utf-8?B?MDRMdUs0dHVtWjk3Sy80V3ordnJBMUJ0dVV2ZWIvaG04bW1FTVZ2YWFadnU0?=
 =?utf-8?B?RmsyRXhBVUd6OFB3dWJxbGNCOEJ3NlZlNmhCWEcvTTZMeHBkMlViUHU1bnVE?=
 =?utf-8?B?WXgzRkxwQWxqZ2lRc2haVlBoV3U0RHphQklYOXhlMC9lVm1kUU5XZTRPeGhQ?=
 =?utf-8?B?N1dyKzdXa1RqNGE3bGh6N2ZVNlRINlBFeUxIVURnN3ZzWUQrd29jNFZINjdE?=
 =?utf-8?B?eXJ1S1A5Y3cxQWJEZ0UweVRJeVJGL0l0WXdHWlo5T3ZreUt0WUZGbk1hc1VB?=
 =?utf-8?B?OTl1RG5lTzZ6UWRpL2pZV0FjNWRVS0ZEYXk5YTZFUkRiR2xmMHUzYTM3bjcz?=
 =?utf-8?B?Vi9sc1JQRnQwWkZvcXdsaWE2aWQ0QnRCSXNjWkc4a2FHbGFMQlltQk5PMzZi?=
 =?utf-8?B?Vk9CeUFiRUZaOCtoUkNnbkpBZVd6TjNubnpodGxXOGt1SGtlaG1xZkJYQXRk?=
 =?utf-8?B?QXhlTElaS0daYXZvemVwMFZKMER1SlF1ajB3Y0xqa2s5d28rVmNIRnJiNG00?=
 =?utf-8?B?YUNRNzlaK2w2ZUc3cjNrOWlSZXNmMVBxN2MwcGNGdkI5WjZzb0tnVWhMWmZq?=
 =?utf-8?B?ZjBCbk94bUNSMkRkd0k2dDNSc0hzbkxyUU4xUDFaUlNpOUZFbUtiUHh3YlVR?=
 =?utf-8?Q?CaQY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4d261e-5e61-4579-cc21-08dca794a077
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 01:46:36.8447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4qQ3RMKKfxaUNyqW3OfxVy8OJtDRkHWlnzYOLe6XUvP8k9XC1Tz39r/PmFPV4MQ/sqCTW6+xwAeNB/L87Tqfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gV2FocmVuIDx3YWhy
ZW5zdEBnbXgubmV0Pg0KPiBTZW50OiAyMDI05bm0N+aciDE55pelIDE6MDkNCj4gVG86IEJvdWdo
IENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0NCj4gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3Jn
PjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz47IGlteEBsaXN0cy5saW51eC5kZXYNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZ3Bpbzog
dmY2MTA6IGFsd2F5cyBzZXQgR1BJTyB0byBpbnB1dCBtb2RlIHdoZW4gdXNlZCBhcw0KPiBpbnRl
cnJ1cHQgc291cmNlDQo+IA0KPiBIaSwNCj4gDQo+IEkgZm91bmQgdGhpcyB0aHJlYWQgYWJvdXQg
dGhlIHZmNjEwIGRyaXZlciwgYmVjYXVzZSBJIG5vdGljZWQgdG9kYXkgdGhhdCB0aGUNCj4gaS5N
WDkzIGlzIG1pc3NpbmcgdGhlIEdQSU8gZ2V0X2RpcmVjdGlvbiBjYWxsYmFjay4NCg0KSSBmaW5k
IHRoZSBwYXRjaCB3YXMgd3JvbmcsIHdlIGNhbid0IGNhbGwgZ2MuZGlyZWN0aW9uX2lucHV0IGlu
IHZmNjEwX2dwaW9faXJxX3NldF90eXBlKCksIGJlY2F1c2UgZ2MuZGlyZWN0aW9uX2lucHV0IHdp
bGwgY2FsbCBwaW5jdHJsX2dwaW9fZGlyZWN0aW9uX2lucHV0KCksIHRoaXMgQVBJIGNhbid0IGJl
IHVzZWQgaW4gaXJxIGNvbnRleHQuIA0KDQpGb3IgZ2V0X2RpcmVjdGlvbiBjYWxsYmFjaywgeWVz
LCBJIHdpbGwgc2VuZCBhIHBhdGNoIHRoaXMgd2Vlay4NCg0KQmVzdCBSZWdhcmRzDQpIYWlibyBD
aGVuDQo+IA0KPiBBcmUgdGhlcmUgYW55IHBsYW5zIHRvIGltcGxlbWVudCB0aGlzPw0KPiANCj4g
QmVzdCByZWdhcmRzDQo=

