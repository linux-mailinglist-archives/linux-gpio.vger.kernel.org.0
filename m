Return-Path: <linux-gpio+bounces-10745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1798E171
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 19:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96E621F235FD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76ED1D1514;
	Wed,  2 Oct 2024 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="guXNTftJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021143.outbound.protection.outlook.com [52.101.129.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773551D12E5;
	Wed,  2 Oct 2024 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727888563; cv=fail; b=E1MkwCPWwE8k2Y7p2lhaUkdwPLQPFlPx2w6t96Ii7qPCZsgBrJGqpUr3GwFwwn2LGBgKFUe1RCoIs+OAKI3FjCjVImpxPYhnjlPk6ULymr/jo5lTxsYsbCwsmImUZZzy4iuwjjMRIq65RTKs8F6Xl0t3ISGYfblud16u5kGFmTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727888563; c=relaxed/simple;
	bh=aXBlbIy/Wg56nEAX3A8EOiS9tfhCX2GT6xFGN4ZylwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pOkJzeZIqN6zas+MnAY9MIuUqvS5DkcTtadFDnJocPFhj4UwhSR3DHN9Dphl+k/S78vEwDH5kEi0denjntbACsZQB715oic5H0CJinfR4pn3wiYUirG+qQnAA9p4CsslmhqcBT0yuAbSC64odaHeZiMvLDfiNAZHoAft8lzgnRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=guXNTftJ; arc=fail smtp.client-ip=52.101.129.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcglNlY0zN5tjgihmG3mqlv0t+/goaYzavnSuDrhNOcVhiU1Tix9IJ1shPr3D384i4hiNYpxm1b7l3sYppkdQVd+UbHL771849Ba8//L65Th+r3xB/U8OSed06m5nxRK6H0sJHVX5tguKoD1o8heQxK29bJwB9/woYT0V71BSeFs+SbTY/M3dH65aCNAOs2Jyb4s/LfmGGxwrdwXdKk97nnAOnaU7uB7lEA5chfJ3ptCV6HbYUu6UAp2nAN1ZDfs0CTOUcf8dVhmVf9seyqW4pVdWK1HsXcbLlnY9UAXQPNAKg64SFo3XQPxIQK3mHGy7eZNzxNKENj9zCKqXmq12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXBlbIy/Wg56nEAX3A8EOiS9tfhCX2GT6xFGN4ZylwI=;
 b=vM4lzvGMQOehWl1HJ9qoXb7FUWjjoCHl8yXv6LULH83TeZfvvWHrpgqSZyssZJLb4/gsSr1O5OePzepawyKHLKfWxJtOxNZW0rRMhVI9CFFS2ECqxY8kyoTtXPsPDBTlFxCONldVw32OWG6/l4Ny43xXsqWjP32IXDGNjEYNiEqk8c6OcSpFCReSuQdX6t8AaGkVL5ybumgm4fW8aWpbCmE5vum4nxNRCsYLPMLX1LKBktZTpnXN1HUvPSASZ7lvpbZwoVWxC9fC5/bNppwD0O6HOXco+/i3jcacX2CgYye4P1t+LaWZLrznWz0Mx1BgxBR3tiFJGXSBEbgO0r1p/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXBlbIy/Wg56nEAX3A8EOiS9tfhCX2GT6xFGN4ZylwI=;
 b=guXNTftJADrt2A6AzLhSw1tavubnzy0CKGRoFOE+k8l9zMt8cx9xiukOLZMhiYFb62KV3ZEn/adf+feZiDb4epnP026yfyHILWPuB0utbVPfFFhmqAGmwEaP60h4W29Rxzv8JmY317SmpBHuCWe5YS99oEEreY1t0EfgBdQa+BZ24uG+WlIM80S8cphf6pguwDUaZLw61FaApeyfReJv/RXTfwuJbB2R+341eC9ygDQoFAQd+uBJ04jy28RhTeziBpSYKfgv1rZtOkrTzXdoAAQ92r3k+8P3iMrjH60/izZVosHi0JMjTHiGwGTLK+d5tyrpD734gSmASc1T1+2xpQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB6295.apcprd06.prod.outlook.com (2603:1096:990:d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Wed, 2 Oct
 2024 17:02:35 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 17:02:34 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
	<Jay_Zhang@wiwynn.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Topic: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Index: AQHbCnhxj9zpVgrVIEm0MBTx4OQN67JyBIQAgAFR3ICAAEyvu4AADP0AgAAUDM0=
Date: Wed, 2 Oct 2024 17:02:34 +0000
Message-ID:
 <OSQPR06MB7252FD4C5AC99A9714DA46E48B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com>
 <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
 <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAMRc=MdXeRCj9ExsKH31isE9qdbNyC7=nWL=GgORknSZjf7oVg@mail.gmail.com>
In-Reply-To:
 <CAMRc=MdXeRCj9ExsKH31isE9qdbNyC7=nWL=GgORknSZjf7oVg@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB6295:EE_
x-ms-office365-filtering-correlation-id: 1b7d5ad6-dc66-4287-bb59-08dce30402da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGVJenBkTjIySER6SFgraER4dnB2eWsvM2JjRGZFaCszSktrTTVGaGRORnAw?=
 =?utf-8?B?aHlJdHNkVjhzZzY3eEx1VWJXb0ZnRlVYb1pSWGd1cDVRcEN4V3NKVzJSQlcr?=
 =?utf-8?B?WjBKT0hnRWJkWXdBWklvOVlQdjRUaFA2VG9ORVI5VXo0eGNkK1gwU2dlZXda?=
 =?utf-8?B?SFZhVXFKejdqUTdLWVdDa2ljNUgyYURJdUV2OWxPbFpZQWNqeHU4amNzb29w?=
 =?utf-8?B?cm4vYXNnd1VhNnJuSUNoYmFrbzNRbXhHdXNaMzU1VGFlYzNxdG11MVRlUUha?=
 =?utf-8?B?VjR2Uk5VblE5d3J5TUlZZzZMNUJBOFRVc3VTNno1SndFalo5OTM2WlQzWVE3?=
 =?utf-8?B?MkpaQkppcnRpbTFTcWtkWGlIdjI1a2Y2U3lLQXRzNFlsVkVDb3o4RVlMQ2Jx?=
 =?utf-8?B?UGtsRkNMS3hHQlZ1YStidTNpMnBIYkMxRWJOUUVuakM4KzBTckRkZzdVY2dn?=
 =?utf-8?B?QUduRjBnTldHYlhvN09uT2d1NTdSamFVTDVSME03aW1OSXlqM2R4Mmcxb1ZL?=
 =?utf-8?B?YkpxOUkvd0pNQ2hDWUdldHpJOFcxREwwUkEwSkVWVDZxVFRwYmtZQ1ZuWEVv?=
 =?utf-8?B?WFRVSHpZYU01M29VdXNZdU54bGhHM21xOWU0c0VtV3lLZG9aMHJrQUJRLzNs?=
 =?utf-8?B?aEU0OG9nRTF4MWpFL3ZvY3BUVHd3cnluMG5WWk1FZWpMNE5WTXFMZ09xb3Ri?=
 =?utf-8?B?UWNMVkZKdW1xSndnVFdYOS9LYnZveFo1Z2dlL29BclRLNVNYNFFnL2pVcTM0?=
 =?utf-8?B?VW0vWjduOXdCeGVUa25BeVBZaXZ4ZjNLTk5Rd0Mxc1JFa0NYY2x5RExOZE1O?=
 =?utf-8?B?dTcwOFlSZkYvVGRYZ2txYUFjSytWNlpsaFZzV0NPMm1QT2VXc3hKWDA3eWt1?=
 =?utf-8?B?dUNjNFpOZXFTb1k3TjV5aWRuUnlLTFVJNTBSUUZ1VTlLYWc2RGtET2FXM1Mr?=
 =?utf-8?B?V0d6cFUxM1BVWjNEWDZzV2s5S1NSR1ZrdDJuN0pwVkJHVndLbmtpQjBZUUEr?=
 =?utf-8?B?dktlOVlsOFk1bCs2blV3ZUF6WXE2bGpmRlFVQks1N3VBS295VDYwdjNFL3Yv?=
 =?utf-8?B?RlZvN0RUZG9nNjBjbTdOZ08xZlJxeEc4OUUwenBUZGFMUDNKYkQ2NUxZOEVi?=
 =?utf-8?B?M3IvRGFyRW5rNUpHa3N4c2hNQ25NdW5vMXAxdWhLMlpEd2MxTGN3a2w0U2k0?=
 =?utf-8?B?SUpwaVFrd2VOT1Y1a2NxVk5pMGZFNTBFTzZ0M2FGSlRNU1F6L3FXNjBNOERP?=
 =?utf-8?B?N1ZOaW5RZnlaM0x5SlZIN1BaT0ZtNk1OSTVFUHpzZmJyN3JoS2xOZXY4a3Bh?=
 =?utf-8?B?WTJtVHk0Slp6bHdmdy9vaXBVZkFuU25IWU1rZnV6VmZWbCtWV2FNb1h1Z3NZ?=
 =?utf-8?B?SHMyaUhXVlh6RUxRd1ZnNzZUcFVZVXBqdWxYYVVzWWFkVEtoK25iMU1ZbmI2?=
 =?utf-8?B?cDFjV2JPWWpkY0ZhOHRGLzdQWUFTdXk4bGp2eTNNVGVQTC9ReU0xeG1GMUFs?=
 =?utf-8?B?R0JHK0xodUl6am1ONUlXdm5pTWpqRjBCKzNXRXdhY0JyOVhOU05veFZSOE9T?=
 =?utf-8?B?cE9VOGY2VDhGOGJ3UDZmditLWDNpT0ZSV3V4VkJqTDJYMTBDVWhwc3BGTi9n?=
 =?utf-8?B?R1hPbS9nTi84Mnp1VHFMNXQxdlQycnVMbVZNOTVqRHljUjkwR1orVFdEZjF6?=
 =?utf-8?B?dHNnRkF6b0g4anVTenpPZmRQVDBwS25qZ0dkaXJWdUxDa3loMVR4L0g2ZW9P?=
 =?utf-8?B?TkZXRFJsSkQ0VTVJeTk3ZndldGxDTGdhMnV5M2FvTnZvelVZZ2tZOVNqTENY?=
 =?utf-8?B?dzRiYnNEK0Y2WTBNWkxUZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEh1K1BDdUNpR2xGWVZxemVmTEtPVDdBdTRwd2hiNTlwdW9UWVlWdWVuKzNU?=
 =?utf-8?B?c0FIUXVja2JXR2d4L3FmdW5aWmV3dHVtUFVmNWRDUDlrZ3ltYVJoSmZiUUx3?=
 =?utf-8?B?MGlSVkJjYWtxem9mcXoreHhGd0tTemczSU5FYm9aYVNSckpWdWN5bWlkOS9J?=
 =?utf-8?B?eEV0bGVPL1FrU0FPZW9SSTJkTGx2QXV3NHJKRGZ6RkhGeVNqeFVoMXB1b2Fn?=
 =?utf-8?B?bU1BMmx2YlhEbnpqWkQrOUU2MEJTL1poUTVOdld1QXMzdm9SVGJZbzgyclFs?=
 =?utf-8?B?bFd6aVl5VlFHQmhRTFBOajRnNUZDTGhPbmdTNkR6Vmd0SWVhaFlDSUFaYnIy?=
 =?utf-8?B?NUlBTDBuRkw1Q2lUVWFpQ2srUHJUOGJYUUNiUkpLUDU3ejFhd3ZsRVgrcXQz?=
 =?utf-8?B?bElYUytENWc3cnhLeldIb2tNQUg1NVhCaWlvNEJXcHUzeUNqaDJRbVJ1ckgz?=
 =?utf-8?B?cW9rTHJVcmJzTHBtdVhWL1F0eEpEbi9uUVpURTNIV0IzaVg3TFlPdWFEU1pI?=
 =?utf-8?B?ZU02UTgyVEh4cVdBK3h2anB2YnJFZzh3d0dYUDFXRVBMSnJhNjZocCt2OENs?=
 =?utf-8?B?RnQwNHMrT1BoRUN1c0ovZUlHNXA1eTlVZTlWaTc1UGt5bGZwZjI1Q25lbU1o?=
 =?utf-8?B?VE9jcjh6ZHZOZytOa3IwYm43Z3pDQ2Z2UzlSZzQ5RmdsZ1Uydlc3Wnp1YUQz?=
 =?utf-8?B?azJpR3lCbzh1Y0pKQ2tZT0REKzAyRk5pbWR2UUZ5bnNNNUNoWDlTSlhvTmZV?=
 =?utf-8?B?SDRDMVFubEdtenUvRVJJZzVqd2NXOU5UZnZieGFZRUxOYmFwbWRQSWlJalp5?=
 =?utf-8?B?eUxxdk5teXJjR2hHbWp4RmVwaGlYWkppb1dENG1pV2dublN4dElHV29oWktY?=
 =?utf-8?B?N2k2Q1FPbHlGNXVCdUs4MVNDMzVjOVZtdDR0L0srNVZIYXA0VW1LOUN2QzhD?=
 =?utf-8?B?S3hJVjlBeXREN0Vxdmw4cUZiVlhvWUt0dlRqUnNtbFE1aFJnMjBtTzRGYzZv?=
 =?utf-8?B?QnFBSjJVR2dpcUhMYTFyUk1hK0VJZFBsQUoyVDlmRzJOSzhzOWVGSjNuYllm?=
 =?utf-8?B?a2Z6bHRqdE9qN29DYzVnM0swY1hpdDJVZlhYaW4zbFh6WHl1UHBLMHE4NmU3?=
 =?utf-8?B?aXQreGtkNDd3TlQ4d2V5c01HMzNqNGdkS2ZRSVV3NWxlNlhKWmVXbC9DNWNC?=
 =?utf-8?B?Qks3TFY3SFNYTUxRNldJSFNzNC9RQWp6QkZLcThza1N2N2RLaitFSWVSaU1Z?=
 =?utf-8?B?Rlc3U0lVdXNJYUJJOVhRb1FqLytETm1DdDBEWlF3ZlZFNEI0TGhQeHNpVVhN?=
 =?utf-8?B?K3pvQ3U1UDhWdDdsUjhYcDlIU2Z2M2ZzcGJVLzlDckpoWjZ3OHlzUGR6QWJX?=
 =?utf-8?B?cFJTTCsxTmpldXVxQ1BUOFJ1RXVHa29PUU8xUU0xcHhCa0IzYTg2OFBMcU5P?=
 =?utf-8?B?aFNNb1NvSDBhcDR0SkN2TDFLNmJ0bG1ZMVhLTWdMVVJnWGQzRWVLWnJscmpN?=
 =?utf-8?B?ekdWd3JPaWJkdU05a1ZTaHlRN29HSkdCQ3pwcTVBTjJVUnRNL3JaUDJCZlI5?=
 =?utf-8?B?cXM4cWIyZTRzMnNjOHlsbTVlcjFHVG14UUhRNzdlODY4VWpvSHlxcjZuNWhw?=
 =?utf-8?B?Zms4WFIyRzFyeGRQdktWZll5NzM4aUpPSlFjVXZaZXUrVkxFUDdJRWY4ckQr?=
 =?utf-8?B?OHZnc2xDNG5Zcm9OSnAva0pKekhVb2pkRzM1cVhqTFhCZTZuazVwZDI0T2FD?=
 =?utf-8?B?OEo3dTRZZTl1dU1RMW0vY1NNNHF6aTZMc1RZT2ZTU3N4aDFoQy9uQmhMK1FD?=
 =?utf-8?B?eGxzeVhpczg1MGlObEd1eDQzb0lCZ2VieFFnelM4U0FOR0VFUk9yMnY4MFhV?=
 =?utf-8?B?NTZGc1c2eW1hbjJhTnA0aERSc2pqUmdnMDV2Zjhzb0xoeFRYRkYyTXFiajhs?=
 =?utf-8?B?NXUvZ0xHdnBselFlUHhBVkFiTU5rNlpuWWYrWVBTdCtCSWxNVjVYa3RmTFB3?=
 =?utf-8?B?cCtKMFpRMGNQaVVoSTZRZFhzYlNuWW1uL1FabzJWUGo1MDJOcWZ0aGw0dlpS?=
 =?utf-8?B?T2NXd3NEQllpNE5qL0RtMytxalhoUEJ6SGlOSnl5YU1aUzE2a2tpWXNiNXUw?=
 =?utf-8?Q?IpEuziqtwE2xN2noc8DGQ1GI7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7d5ad6-dc66-4287-bb59-08dce30402da
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 17:02:34.6729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gb1kyiJU5gndR5kf7vHqOVXeHPp9MSoV1ZWAiKrBgEOYUzVRcaJsIWDbtfl3AYU35nXuHAGslEjZhxp39r7rM8YFQELL1p+b8zJuw1eLYoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6295

PiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgU2VwIDE5LCAyMDI0IGF0IDExOjQz4oCvQU0gQmlsbHkg
VHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+
IFBlcmZvcm1pbmcgYSBkdW1teSByZWFkIGVuc3VyZXMgdGhhdCB0aGUgcmVnaXN0ZXIgd3JpdGUg
b3BlcmF0aW9uIGlzIGZ1bGx5Cj4gPiA+ID4gPiBjb21wbGV0ZWQsIG1pdGlnYXRpbmcgYW55IHBv
dGVudGlhbCBidXMgZGVsYXlzIHRoYXQgY291bGQgb3RoZXJ3aXNlIGltcGFjdAo+ID4gPiA+ID4g
dGhlIGZyZXF1ZW5jeSBvZiBiaXRiYW5nIHVzYWdlLiBFLmcuLCBpZiB0aGUgSlRBRyBhcHBsaWNh
dGlvbiB1c2VzIEdQSU8gdG8KPiA+ID4gPiA+IGNvbnRyb2wgdGhlIEpUQUcgcGlucyAoVENLLCBU
TVMsIFRESSwgVERPLCBhbmQgVFJTVCksIGFuZCB0aGUgYXBwbGljYXRpb24KPiA+ID4gPiA+IHNl
dHMgdGhlIFRDSyBjbG9jayB0byAxIE1IeiwgdGhlIEdQSU/igJlzIGhpZ2gvbG93IHRyYW5zaXRp
b25zIHdpbGwgcmVseSBvbgo+ID4gPiA+ID4gYSBkZWxheSBmdW5jdGlvbiB0byBlbnN1cmUgdGhl
IGNsb2NrIGZyZXF1ZW5jeSBkb2VzIG5vdCBleGNlZWQgMSBNSHouCj4gPiA+ID4gPiBIb3dldmVy
LCB0aGlzIGNhbiBsZWFkIHRvIHJhcGlkIHRvZ2dsaW5nIG9mIHRoZSBHUElPIGJlY2F1c2UgdGhl
IHdyaXRlCj4gPiA+ID4gPiBvcGVyYXRpb24gaXMgUE9TVGVkIGFuZCBkb2VzIG5vdCB3YWl0IGZv
ciBhIGJ1cyBhY2tub3dsZWRnbWVudC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWxseSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPgo+ID4gPiA+Cj4gPiA+ID4g
SWYgdGhpcyBhcHBsaWVzIGNsZWFubHkgb24gbWFpbmxpbmUgSSB0aGluayBpdCBzaG91bGQgZ28g
aW50byBmaXhlcyBhcy1pcy4KPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBZb3VycywKPiA+
ID4gPiBMaW51cyBXYWxsZWlqCj4gPgo+ID4gPiBJIGFncmVlIGJ1dCBpdCBkb2Vzbid0LiA6KAo+
ID4KPiA+ID4gQmlsbHk6IHBsZWFzZSBzZW5kIGl0IHNlcGFyYXRlbHkgYW5kIC0gd2hpbGUgYXQg
aXQgLSB1c2UgYSBDLXN0eWxlIGNvbW1lbnQuCj4gPgo+ID4gPiBCYXJ0Cj4gPgo+ID4gSGkgTGlu
dXMgV2FsbGVpaiBhbmQgQmFydCwKPiA+Cj4gPiBTb3JyeSwgSSBkb27igJl0IHF1aXRlIHVuZGVy
c3RhbmQgdGhlIG1lYW5pbmcgb2Yg4oCcc2VuZCBpdCBzZXBhcmF0ZWx5LuKAnQo+ID4gRG9lcyB0
aGlzIG1lYW4gSSBuZWVkIHRvIHNlbmQgdGhpcyBwYXRjaCBpbmRpdmlkdWFsbHkgYWZ0ZXIgdGhl
IEdQSU8gcGF0Y2ggc2VyaWVzIGhhcyBiZWVuIGFjY2VwdGVkPwo+ID4KCj4gVGhpcyBpcyBhIGZp
eCwgbWVhbmluZzogaXQgc2hvdWxkIGdvIHVwc3RyZWFtIG5vdyBhbmQgZ2V0IGJhY2twb3J0ZWQK
PiB0byBzdGFibGUgYnJhbmNoZXMuIFRoZSBvdGhlciBwYXRjaGVzIGZyb20gdGhpcyBzZXJpZXMg
d2lsbCBnbyBpbiB0aGUKPiBuZXh0IG1lcmdlIHdpbmRvdyBpbiB0d28gbW9udGhzIG9yIHNvLiBT
byBzZW5kIHRoaXMgYXMgdGhlIGZpcnN0IHBhdGNoCj4gaW4gdGhlIHNlcmllcyB3aXRoIGFuIGFw
cHJvcHJpYXRlIEZpeGVzOiB0YWcgb3IgZXZlbiBzZW5kIGl0IGVudGlyZWx5Cj4gaW5kZXBlbmRl
bnRseSBmcm9tIHRoZSByZXN0LgoKPiBCYXJ0CgpHb3QgaXQuIFRoYW5rcyBmb3IgeW91ciBwcm9t
cHQgcmVzcG9uc2UuCkkgd2lsbCBpbmNsdWRlIHRoaXMgYXMgdGhlIGZpcnN0IHBhdGNoIGluIHRo
ZSBuZXh0IHZlcnNpb24uCgpCaWxseSBUc2Fp

