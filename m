Return-Path: <linux-gpio+bounces-12925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E749C6CB0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57B84B2D4E3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDC61FBC86;
	Wed, 13 Nov 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OHXGO76f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2051.outbound.protection.outlook.com [40.107.105.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503551FB8B5;
	Wed, 13 Nov 2024 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492760; cv=fail; b=MiKAH/Afvr4NxvgLqXGQFwm8Uo205wmCdijaq/iUo0W8YVqehc1FYYRJJvA61/37QcRVb/lEGLe6YRofIDVhlYrYhmwhCAzbKfrZa3F0MOpjw233uyDco4m4BOvCsyMoNGm9u5V9xyWRcZVMizUs4LfiiTMfCmTG2j5DNtecu9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492760; c=relaxed/simple;
	bh=FRPrjdr+xuu/myXoZJW8WBf0xGo4kJxUmsFFubcL25E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QVYrEj7m+6JWEJ8yYlKh7giFJqsMyReg6Ap5pUvnYjvfcl1s8SoACVN2nxdguunL48yQMhtfoRJQS5H+etGIYN+wLaHnYMyoTomVS5jb90sJebHo2XMyMD+30GYIlIBw0WHfm8wOahDrK4nSV/mktChcjCgKLrV4i+V8/hDjF/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OHXGO76f; arc=fail smtp.client-ip=40.107.105.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSTHBWv12uvx2jtK377mVuhBSpBontOdL6GZiDYjXOk5Ggr2AddJrugK3ujOYgp/mX7gGvHyG3yQY9U+Z2EoTNQunijm+Xm+fR+A7SO6RBgkCHDSeot00MQgLUReI6MoRbKuJegbq2P5Xkj+yR+OWHIkCbHR/ElmTcgJB4EVgOFobjUaJhQGbwCOxeftmBhZ1HnaGEJHtumaSG+Ku692vD9qhTqpVi8MtoygHA+K5TMGbEkyzV+CggpCB6iPbjBLfwAOKBxF6FyoS2l9kM8TtoNyDR2cLj04Axs/mc8KED5r5SGM79Yv/lc/CypWG9TlabP1PWrlKU6Jy3MeNxvcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JMsIrNOcncD1mnEjvXrGMCWkZcNE+wVT8B+C65EkpU=;
 b=p/u6ONMpUxVTqOlPD3XIA0ga7bGeHdpcCFu+pgFplyDPTckkJccpCFg9E8Cd59jiObitml5ABb6v3pln34Sg3vTh7na59XcfZglqJ2gzn9yNWRjKcharGX+DH/81kOcjJPfH0b8hUVbBYgMICsbm4us2fRCTycMnhdL5/dc4wNRL94+epfoyxvRGJ2miE5YIFdGBOx1pipsOyBx23basDJ0oyGtLv3oLwXP4THsb9Nwk274sLzgMdQEDeTYI7uXUVxgksEIFfR5pAjB2qwGmvTqtiuQN7YtN6GAlcg+J020HHF5m+bMEOItuTYzVnbblal8qEuGxuBVPjD45bzgkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JMsIrNOcncD1mnEjvXrGMCWkZcNE+wVT8B+C65EkpU=;
 b=OHXGO76f1ots/rmt2qUrocFxFhqD/Uou703B5EPbFYc1H1g/z7biUqu1ZTEBAfiSVXDo/XKcfPGAGAWftNIpE8ZTBWUy6f6jWJuQyTn+Lt5crVzEu1a2nGcyhex9StVK7g9nBSWWqdThvdmQLXFIbQ+XVsvKlehIvtPeQTxyLdBwFu2RfZ0t+FdegCav1EVNfU+jgIrRAjWDhSyYo+lcVQkEErLj67yp+875nI0dx1ZyoGm9t8SmOejA4NVMTzPAO+Gq09gKY//GQ3F9Hgzzf/rp8EgHBDyISSqUeEVmudwoQ9522nBfK+1TPhKkGSL0oIvCfbPbEd9gnxsDnKg0UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 10:12:34 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:34 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2 module
Date: Wed, 13 Nov 2024 12:10:53 +0200
Message-ID: <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: d88f97dc-57ef-432d-2b5e-08dd03cbb0d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlRuV1hwb24rQSs3Z1BtaU52VkJnazF6VWo1NHZaT3l0WS91UUt5bVl4a2ts?=
 =?utf-8?B?RzAvSWhTWTJhMmYydDBQL3BmVU80VDg2ejdTZXdMcjd0bzkzMFNJZ3JVdllr?=
 =?utf-8?B?eVJrcUpKVDR4SU9aOStUSForaGxzYmU4RGp4MWJYRG1nYWl5a2NkL1hIaHlD?=
 =?utf-8?B?eFQ5RlMwYWFYdlVjQ2ZMMUtZMFJGSm9DUklnNGh3eVRzWGpqQ2RXSHpNRlBY?=
 =?utf-8?B?V3djSDZ2dEx3cE53NjV0cWU2RHRqcXVQclh5alZ2YTFZcWR6ck11Wmt4eG9h?=
 =?utf-8?B?eC9yOHhnZVdtMU4wejNDcHBxL2hoTmNlVlFGcEtld3IzaVpyZ2dvTTh6T0lu?=
 =?utf-8?B?QW1EL2hsUTJ4ZnFTUUUxRklDZmpYbm9xK3RXdzA0OWoxQnFQVEJBVUFQNTIv?=
 =?utf-8?B?bkVpb3ZsN2dtNXkraklralJZdlZpb2g1NElFRjJWTnNNMUV1Mk5CUFM4VHF2?=
 =?utf-8?B?SGlkQzd5cm5UQnBOVjFKY0Y1T2pMY0g1UCs3ZGlpeE5QMFJtOWhDVVdTNERP?=
 =?utf-8?B?RmwzWW04R0lVWm0zNWxhSDR3K3VlZVF2QzBSUnQyTjUzYit2a3FBZm1kQUR6?=
 =?utf-8?B?WUphMWZJYWtveHFVMjRRY1hYSW9YeStEaWlaSjNqOW5jRXhhZVJYQms0ZlZo?=
 =?utf-8?B?bW5CcEEvSlFqRVh1MlNyWkRSc0dTUnhRc1Q4WjBUOFVtU2owamkxYzNCbjVD?=
 =?utf-8?B?ZlBHV2l2T2EwemhERHRGU2YvSDF1a3BuM1BCRjh6SERiSGtRdHBUWjdqMWRN?=
 =?utf-8?B?SVlNNlFnSkFyMXlMYnZBOGZwdWtXODhVV3dOMW1KRWZlMDBwcklUZ3dJbVZs?=
 =?utf-8?B?S04vUzQ4UDB5UVNhWmpxUlViUFE0Y09ualdiL2U2NHhwSWZXeHJia3FGVkxw?=
 =?utf-8?B?N1BISUdDSm9qazN5d3VRSmNyWmgyc0p2RmRIb1BYRVdsVmY5M2kvTXhRdndD?=
 =?utf-8?B?VU4rZ2kySEdlMFRSUW1TTlVEdHlsS3h3VUg2V1NoaUt3WXhFdGxGUElrZFNO?=
 =?utf-8?B?azRGTjIranJvSFJkdERiNXFiaktDam85SUhKRmRwV1pxZC9OZ0FGR2txb1Q4?=
 =?utf-8?B?SEpzUkJENWYwaU1sVzJldXZKRTE1TndkMUVidHNYSDMvckhwQ0lVYzA3RVh4?=
 =?utf-8?B?T2ROdG1DZ1I0ZmVIOEN1eVJiZEwzUmZ6eEZMU3ZYWlBra28zaHg3eTVES1Nx?=
 =?utf-8?B?anRVemFCYndCNzBNaVR1R3pNRlBrbWxTMWx3SGdud2R3bjdlUENZUWtpbFox?=
 =?utf-8?B?TVp1SmZNOWZ5N2tPcDRaSGdkWkI2dHBPMi9TV09EWENVR0s3YStGYTk3eHBJ?=
 =?utf-8?B?emVscnkrSXF2eGRSREx5UVBuSzhxc0JpNldrdDdWSk9FZXlPUE9Bbkp0Nkdm?=
 =?utf-8?B?am5FWmVkK2ZueTl5UUtxcTFyOEl5eHdteXhDSURpVHRMck9zQlRLbGtuZFJO?=
 =?utf-8?B?UVphQXk4SW43Z2xHMThTU2UrMWd0cElSUGdiR1Y4ZXJGTG95U0NGdElLbHh3?=
 =?utf-8?B?RE1wWlQ3QjB4MjhaVnBRU1NrMFNqcnRhS2hWWXBpV0xUOE5adXM0Lzh6dkZ6?=
 =?utf-8?B?dnVpSUFRenpybld3dTdTZHRIaStBR3oxRFNLZFptcVdzMXJMVTZhZTJQZjZD?=
 =?utf-8?B?TVR3TGNITnFvMlVaaXEva0RCMlllaGQ5Nk9rRVZWU0d6QUVwbkZLZDhBRUxu?=
 =?utf-8?B?by93d1JnWXJRTEZjUVdySnZ5S2ZvYVZCYUt1WGVwQnhFRzdCMm9Na3JZQVlK?=
 =?utf-8?B?alo2c21MVGR6dGF4Z09tNytNMlhJY1J2U1Q0NkhoSm9CV2RWQVYvMmkzdCtO?=
 =?utf-8?B?eWJNaFJMczhkVlBBR1ROdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek5mcmNDcTVZSDFJTlV4L3MxZWtoRTUveDkyMTJ2M1c5dXNPUmtMRnY3dVpq?=
 =?utf-8?B?Lzdkd1R3UmVmK1dvZ1QvemtLV2VvM3NsN0VZTGlxejNyeG1OVGx1OXhpMWtX?=
 =?utf-8?B?cmh5K1FNVk9EYTZ6Q1JWU2g3OFVqVFIzN0h0Wm9pQ096Q2k1bHd4L1lHV0Vo?=
 =?utf-8?B?bnQza29vUzZXalpyaG9JdmZDbmNEMnFMOE9jdUFTYU15ZnhUaW1VTTVRQkha?=
 =?utf-8?B?RGNrd05PV25zYU5xZHpNbjFjSE1FYU5RZlhVUWcyUWNmUDY2b0tNWGZYbnlS?=
 =?utf-8?B?RTRBSTRHa3lXMkpHeFZ4ZWI4bmVmak1ncjQvNUREdzVUeGZKcTVuc0FLQXNs?=
 =?utf-8?B?SzFIeFZPNlhld0hIRThPME9xdW10c2l0dm5iWHkyUklwWmFPdzBmUncraUtZ?=
 =?utf-8?B?cHpUZWs1WHE3NDVNZG9yMk1lT0U1N29Pa2Y5aTZuSklja2J2M2JsMkZ1eXZa?=
 =?utf-8?B?S2t5aDdvUDlYNnhueFJlcnIrRHhIUFd2L1NVRnN3VkdyTC9GUlhCNU83N0Vt?=
 =?utf-8?B?ZmJ1ek83WCt6RjEwWldMMFVKdVJ0Uk5jNW1DTmc2amp3L1ZDekk3NE1Da3BW?=
 =?utf-8?B?dVhTYU9lc3E4UXlXTVdnV1V1RWluSmo1VlpCd1JCUmliRXZ1Qy91RHUyQmJ2?=
 =?utf-8?B?TU1hdE9GNGlHR1JINFhnb2luSDlDQlZIVzVSRktOR0VTdjJ5RzYreCtCU1ph?=
 =?utf-8?B?Ly85Tm5pUVBmUUV4am5LSktnZXg4eVBUelQ4V1R3MTgzSU5HRldDc0VBNnZV?=
 =?utf-8?B?Sy9KVm02RkFmcVMraUxQZ0o1c2QvMmY2YlUxbE4vWkt0TUZWMXhSMnBUT01X?=
 =?utf-8?B?Y0JTc29QUlJybHJyc0cxdDB2ejJ2Kzh0NnA1NDFUMUl3blhnVVlwbi9lbDlq?=
 =?utf-8?B?TWNILzg0L2hBdVk2b29EcTU0VU5mWXFnZ1FnSmg5M3BwTWZvalBzUGg0MVJD?=
 =?utf-8?B?RVJ5RzBqNmdkb1EyZXp6QlVieUJ3bU02MXpsRzM0a0x0Z3N1UVZOWUtJWHhR?=
 =?utf-8?B?NjU5WFlMaTlBVk9NRG9EWE5DRDJQKzRxUGxkK01pVTlqM01FWlFob2drUnlC?=
 =?utf-8?B?c0lDdHZJZXBiS0h6MU1oWUtMSWROUDhncTIveGxIVUxpNlFTWWRYSVRRZXRN?=
 =?utf-8?B?ZWM2aU1NWlNVems0R3BoS1VhVS9QRVJkZC9wZnpDR0FrNVFWZ042MTZTS3Q3?=
 =?utf-8?B?QmErdVZpRkt1cTF0V1lrd3dKa1V2YTFqMmliMnl6ckJtOW15aFF4dExWMmJr?=
 =?utf-8?B?UXBjTURvOUlFa25rVElZdzEwVk0wOXMzZm5XREdteUIydmNzbW5ycE44ajJw?=
 =?utf-8?B?RUZMdWRaS1NjUVhsSmkvUDBRV0Z4QnRwdFJVR0xlcWRuci9zR2Z1UFhKZEpQ?=
 =?utf-8?B?RWllZDNUaUlpYlNvck55ZGFEbUh5QWhxa0k1OG4wWVVLUytSV1JtMTFmTE1Y?=
 =?utf-8?B?OUdUZEcwMGNTanQzV3lkclRYeXhDT3plOUl6TnY0cDh3V0dSQStwR0tJcjMr?=
 =?utf-8?B?N2hucEx3N0IyNnF5Y2JjMVVYNXVMNDN1NWJyUXdqYVpMQ2dYMEZOWCtzanQx?=
 =?utf-8?B?Skg3ckppZEVGY2g2OXpPdGlkRWZOQVYvdTZRSEZaakZKQlFwK21sZFZDWXZZ?=
 =?utf-8?B?aW1DanBVci8rd29FR1NBc3FyZXZ4TnlkbmV6V1Fuc1BmekRKOGpCUTl5aWxl?=
 =?utf-8?B?RWIyZzNNeFBjN1FnYWp5WFUwalpNM2FYZVRzWjJPbktqd0lUWVI2bFhjN1Zq?=
 =?utf-8?B?WlJmeWZQNEJvWmZLaDI0dDhvTGVOY1BtOVBGVll5OG8rLzFteHVRc0RvZDNG?=
 =?utf-8?B?cDZsVk1WZEp0ZzZZRjA4T2xvZXRvbEdaenFOMXBGVXU2RG8vYjRSMUxNblZT?=
 =?utf-8?B?RVl4SDFWVnMrTlI2TVBDY2luU0ZYMEsvanh6ZTFPNDFhNzFaSzNYTlRnMHZH?=
 =?utf-8?B?ZTlTTThJZDlLdzgzbnRHa2lWUmd6cUhDdTc1b3BoaFlpMGxrbXlVeDUyMXBE?=
 =?utf-8?B?UEppVGpkNjR4STVIYjFHL2JZS2J4T0trbUVyOWtmUG9zVzNheDVsQ28vM1h5?=
 =?utf-8?B?L2k2WmFSN1VUblhjZXhJZXU3MndqMUt4WWl5NThmVDZLOHZQVUdJKzV5dGxM?=
 =?utf-8?B?dXlSZ3NCKzdwYWpHVkpuUzZHdjZyTTZ4ZWUzcVV3dU9lRUJmbm44Nisxb01w?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88f97dc-57ef-432d-2b5e-08dd03cbb0d9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:34.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfbJhVdVpySr2Bb8JPaJpnpLiHT6ihksQpO8ziY5yAZb8OW/JsEtKN7hCbicmJ5/XYYna7tSEdVhVePEnFhLggid1mx/HJLzVZIywNWWeWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

Add the dt-bindings for the NXP SIUL2 module which is a multi
function device. It can export information about the SoC, configure
the pinmux&pinconf for pins and it is also a GPIO controller with
interrupt capability.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
new file mode 100644
index 000000000000..a8edbea75bb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32 System Integration Unit Lite2 (SIUL2)
+
+maintainers:
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description: |
+  SIUL2 is a hardware block which implements pinmuxing,
+  pinconf, GPIOs (some with interrupt capability) and
+  registers which contain information about the SoC.
+  There are generally two SIUL2 modules whose functionality
+  is grouped together. For example interrupt configuration
+  registers are part of SIUL2_1 even though interrupts are
+  also available for SIUL2_0 pins.
+
+  The following register types are exported by SIUL2:
+    - MIDR (MCU ID Register) - information related to the SoC
+    - interrupt configuration registers
+    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
+    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
+    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
+    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
+
+  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
+  16bit wide.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g2-siul2
+      - nxp,s32g3-siul2
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: siul20
+      - const: siul21
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    maxItems: 2
+
+  gpio-reserved-ranges:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+    description:
+      This container may reference an NVMEM layout parser.
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    required:
+      - gpio-hog
+
+  "-pins$":
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "-grp[0-9]$":
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        description:
+          Pinctrl node's client devices specify pin muxes using subnodes,
+          which in turn use the standard properties below.
+
+        properties:
+          bias-disable: true
+          bias-high-impedance: true
+          bias-pull-up: true
+          bias-pull-down: true
+          drive-open-drain: true
+          input-enable: true
+          output-enable: true
+
+          pinmux:
+            description: |
+              An integer array for representing pinmux configurations of
+              a device. Each integer consists of a PIN_ID and a 4-bit
+              selected signal source(SSS) as IOMUX setting, which is
+              calculated as: pinmux = (PIN_ID << 4 | SSS)
+
+          slew-rate:
+            description: Supported slew rate based on Fmax values (MHz)
+            enum: [83, 133, 150, 166, 208]
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-reserved-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    siul2@4009c000 {
+      compatible = "nxp,s32g2-siul2";
+      reg = <0x4009c000 0x179c>,
+            <0x44010000 0x17b0>;
+      reg-names = "siul20", "siul21";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+      gpio-reserved-ranges = <102 10>, <123 21>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+
+      jtag_pins: jtag-pins {
+        jtag-grp0 {
+          pinmux = <0x0>;
+          input-enable;
+          bias-pull-up;
+          slew-rate = <166>;
+        };
+      };
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        soc-major@0 {
+          reg = <0 0x4>;
+        };
+      };
+    };
+...
-- 
2.45.2


