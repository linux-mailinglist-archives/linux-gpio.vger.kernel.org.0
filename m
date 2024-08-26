Return-Path: <linux-gpio+bounces-9154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505795EC3F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96411C205E1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBFC13DBBF;
	Mon, 26 Aug 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AachgdLl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C013B59E;
	Mon, 26 Aug 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661783; cv=fail; b=A38vRI4X+sWq7PoqocmA5j2E65S7tqhpTnTJaafU+mYrbjyvcasJsXfButQDJYNOdR6hmx3TMoJsS8cYgkYow8ymNwrIN2TeEg3Tu7n4xASlVKPNbKo8nLk9mSCzCD8AamjaI/AjhbKXsKrLBpsbv3YFkc7opMrtbfwTfZ8uaBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661783; c=relaxed/simple;
	bh=py9UcvlANlcZm9sz+alTdkwJB17wkajPWo7D37zLCF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pYj0fOKZDenfbu93XMzYKXuDVAzok2iLIT7m14SPX2x3ku5lzFv+cBOPPhPk7L/DHavwpcUQo76kQ3S8UflZNwqwY2GmcNPmgzCTYBhemd88LftqZwPuw8Lp8rK2LxDj9/sjLsX8H6gChR/OTEzRFhPw6qcnuaun9cnnoU23C7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AachgdLl; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvnboI1OZMoGbpNP8npAi69iCRjdVet0NbF0DFVqd7Ycz7mVLqp/LqjuoaoOLTr5ulr3iDarAfFyKClMCA6CkeZ4p1X2DFNcTi6YHKYdVe3s8yaUC5suLB+glC/gmXIN+9TCquWDbWyGntVYTqf4Rbx7vriJIr2AEcIQZem1jd+Kvdd7Yr4iUkdTp4e3XZGVOczYeL8ipXNGBrBg0Ax2iJRaIttGArOFcwuYpabTUDzc64HMC6b9L1itijH+zMWtTnq5egiYYDp/JQ0PDABDQT1GqMkdTkVyXXh3ATeqfcLRyGjaoEaOEJ4nN8FpiqA9voBytreHgcuVyoCq1wQUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8j2gltZLRThG6UogAJFhaJyejbj4lbQT3rvYw543/E=;
 b=QhXIRq2mUA95OOsuQDKR2YEWlfBrtcYQIuqDoq4nzvcaXQ5ZHon5hn8hOlMINfrrFE7JKSEbCb1HZeKqlaU8Mrush58VggDjuqopjP/7AokphZ+e/KKB/GyP9k0mGOfoHecPRSzXPy78ny6Zo6q/kYmwlec9347wRm9uFzXDUa4tS+DNAobc5GwmB2A1ZS66JbL5oD2iXd08fJuZyTnMzuCyZ2zHvrR++3/OMH+cDofbtZbfyC0E9wFKp9k4IwkKMl4ePbIBTv9z3pNyps43xJQOMdB2UMhVAjxSaVogNnQcIBQlD8mTNj2D1zGMOsl+mUo3bpS9tO0ITCWmD7edUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8j2gltZLRThG6UogAJFhaJyejbj4lbQT3rvYw543/E=;
 b=AachgdLl2bvvFs9jk2yFH1Y/VfGUIS1I/nqmta4YW/yqZzqzDpKMQ17Sf+81ULk9l4zXHNkohyemNvpIjKCfYgYQJyr0VlpQth4CwSiQ/uNlK9BbEouPHLelL/6o5+4qxD00UTrwYQ2rPU1AvwS8Re44Otznjr2Y+c74/tapANZJxpeV4SOixVHX0F/ME2GeTEIRBnbAx4YjBe+erW/OucgUUhgmHc+LfC9A4Dce62JUIrgiDWSOL32pIvGpRqq3+mddcohM7jO3pS81uyQ9vmWTrcLjLXi/RdUxYt97JBNlHVicqSjNuB8VJ+Dim41RzouD64XjzYcpZQtsvXqshQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PAXPR04MB9680.eurprd04.prod.outlook.com (2603:10a6:102:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 08:42:57 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:42:57 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
Date: Mon, 26 Aug 2024 11:42:09 +0300
Message-ID: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PAXPR04MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a6ac94-dfae-4005-5045-08dcc5ab157a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFpCdldhNGdhWmhFaDNnaU9obHBTL0IzYTJUMUdGTDFNTDlMTDRaeko4VERk?=
 =?utf-8?B?MEFwa2MrSUI4T3I5a2ozRmY3M3VLclhySCs2UmlPMXBmbEIwWjA1ZXJyd3Nz?=
 =?utf-8?B?YmdmQzRVV3dVZHdQUU9YZmtKRW1KaXF6K0xSVFdzbG16YzdoNmhWZkFLdk44?=
 =?utf-8?B?SWZTNTBhTHpTNmQ1MFVzWFlBMHhOdjlHM0JhUHA0TjRyTHc0Z2NkdVFVcFdw?=
 =?utf-8?B?dFR1c1krWERraXk3dDU4U1JGdUtFcUw5bXcwc24rNndkMDZKR08ra2lDaDIr?=
 =?utf-8?B?WVNBekd0RXM2MmY5bWRTdzRrdmJrT2N5Wk40V0RoZEwyQm9sVGZyMmlOL1Z1?=
 =?utf-8?B?cCtiVzJVUVNpL1dJTzJwNUkxaUNvNWhDZUpKcFRpZ0xBV2ZrQ2syM29oMTRT?=
 =?utf-8?B?ZXd4R3R0OFdqMmtGMGRCMWlZSURtRDAydktvc2lSYXVpRG8yZ040bll3RCta?=
 =?utf-8?B?ZFZ0OTZDaXg0ZVY4SEM5Q2NlSU5VaFl4ZDFod0RxUXdxZGJPUmpPUEwyWnQy?=
 =?utf-8?B?MFlGSDVCd3o4SURvd3Roa2RjK0xVSWphOWN1c1l5ajBDY3E3aGNTZVZmM3B3?=
 =?utf-8?B?MEJad1oyY0Fla25IRnBtdmkzRW1OS1FwMjExZktJZVdlT3plSUNwQ0h6WWt4?=
 =?utf-8?B?TTk3UDNmZnJ0Y2orZ0VrOWR6djZyR0Iyc3NPRUZzR3pla054STJNSXZrdTUw?=
 =?utf-8?B?b2phWUovNXdjVmthN2dyUit0ODFXL0lSUjVxeFJjRXFKejJCMXV0UGNLSHRT?=
 =?utf-8?B?TGxKSko1MHBxeEJqNkQwQTd6ZlNEbU1tTWYra0REVm1NRmF2eGNyejFzeGkx?=
 =?utf-8?B?MVRiUDJLeE9tTnlyNUpIaDBtSzRnc3Zxdlp3QjdrWnRrTTZ5S2hBMnRsU1JB?=
 =?utf-8?B?Y0FvL3JXVjE4ZkZvNUt5Zi9BSzlYckNvUTdOYm0wLzcrMVBJSC93SDhTaGN3?=
 =?utf-8?B?VDd4Tk9mUWF1ZUN0dXhvOU1KVXFJb2hOamFZQjBlWm9CbkU1UklsWHZMdWRI?=
 =?utf-8?B?ZytNUHJobWVlWDQzbzdjT1VRa0d4bU81TDV4VTNuVk53ZjEvWjFKYnR2dEZJ?=
 =?utf-8?B?bE1UU1JOMmFSb2lML2U1MlEvU2NNQzRLKzMzQlFQYUd2QjZ3YnBkZEh2V1pO?=
 =?utf-8?B?Nm4rdjBPemZQN0lRK1hNdnNweFJ2TXA0MXYvMTBuMkY0eU80a2UzbkswUFhm?=
 =?utf-8?B?OE5FSlRxZ2xZRitMTmE1V0NUTFIwZ0szSGJOZEZwU2JzZFU4RUVSRjhIVG5x?=
 =?utf-8?B?UktQQUFreTQ5OXpYcWNKTUFGTXplRjVjNThLaGo3M2hlclpXZWZKQ0pORWln?=
 =?utf-8?B?M0tLZlM2YS8wT1E3Mk92NFJnQjg2N05UUUZLQmhrTzFhS0FMWXl0aktSVis5?=
 =?utf-8?B?REk1R20xeXVzSWw5QXVGdVBad0FkYnNRc0RPRDUwRnNEakdxTGd3REJiUTNl?=
 =?utf-8?B?dmdZZmVZQ2JUWDF0R0xZYnIxZWlyeVZUQnZxS2k0MFphditkN1UwR1NWRDlH?=
 =?utf-8?B?K0FTSTNiOFpnMCtPMTg1RzFHUlp3SktvWURXS0RxOVVQZUV2ZjEybnQxVUF5?=
 =?utf-8?B?dDhlYTFUb0cxYURsYmFYZkVmZWUzYktQTm0za2s3L0kxQlgvcnowaFNsNm9N?=
 =?utf-8?B?TE5VYnlhMTJzcnQzMWkvY3c3dDJiZlZuT2t6WjNsQXp5WllZWmIvNklvWXFS?=
 =?utf-8?B?ajJrVmYrdU1paVNZVjVSSjVOci9UMnFYbGRiNjhQRDk1UmY3djdKcHNxbi9M?=
 =?utf-8?B?YldCZnpueUVvenpOaDBVM2pnSEZKUEE3VzNjUTd0bW4rUUlNOEg3VWM2QUFS?=
 =?utf-8?B?WnA0L01hbXVtQW14NEhrdm55eVpRaVA1UTFEdG45WWNQU2I4Sy9IaGVUOFA5?=
 =?utf-8?B?WlZtM01POGROYUxJaEZ3UHFtd0JKdFFKeXV0VGRiUDBrZFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xHSnRyRWRreTB5NmtMOUhDWmo2QXM0WHFobWUrejZWQnc1V0VXZ0NSWjRa?=
 =?utf-8?B?R2p6QlVkOTBsb095dXRWQ1FUeDhFdHViWDZKelJZTGx2ZzVlbTREd0g2YnVV?=
 =?utf-8?B?czExU1BISmxtSUlDWVlCbEs4T2hRY1JwTUFDN0FITDU0S2tWM0lqNitrNWFM?=
 =?utf-8?B?dytEdVI2RmtNWTZGWXZURXZ1MzVoVGR2SlROWXZ1RTd2ZFlMUDJCV3M1OUlB?=
 =?utf-8?B?aUJlS21Dc3cyeWJZMk5VTmVYZUp3V0dQcmJ5aURkQTdQYzQ0dm1QWDA4ODN3?=
 =?utf-8?B?ZUYyRUhRTUhMaWJoV0pBZVdCMHJYTlFlU2E4Z3hjM0YzR0pmdGZ5TkRwY1RP?=
 =?utf-8?B?Vkd5OXNDR3VILzRPOURSL0NhdUV0R0R4VEpMNGl6TXI0T3FaUGsvYjQ2TVFr?=
 =?utf-8?B?M2QxSHNNMktKdUE1R1FiWDZVOU4wRGc1ay8vTUw3ODR0R1lLLzRpZ2QrbzhC?=
 =?utf-8?B?OVZuS1pVOXNBRnlxL20yWDFvTUNpdHdGd2NqREtlR2dkd01RbVRabWdzVmZB?=
 =?utf-8?B?UWJxSzlsUU1UQmNlNFp0SGU5Q2Q4TzdwQXpTV0dIT29PMnNFRng5Q3VjYUJQ?=
 =?utf-8?B?aFZSZWNMVkFLRnFPQmJZUmtvcDFQWVBTZE5xaEl5Q05kSmRJYW5YTFFiWTV0?=
 =?utf-8?B?M1J5cVBYYWJndWVUZUJOY0tUN3dtUkhpQmtnT2lHbVRjejBFMncvWGliWDVH?=
 =?utf-8?B?U2FMNFpsODBFZlRJeXJmc3oxenBlQ3c3Y3A1eEFvU2U3a0taZ1dyWTl2NmtG?=
 =?utf-8?B?L3orZ3V5a0U5WkNNVnNWNXR5QTJHTkpPSkR4bnJCZU8zdURqeXJMMkc5Tzdp?=
 =?utf-8?B?MjZlY1U4aWNEaCt4S0pTZ1IvRDZWaDNYWVJFU2FaRHVORC9BZHBNa2FwY1Qz?=
 =?utf-8?B?L3B5T1ltRGxvR25OTCtHTFVucjZ6Ty9vWTBHeXdGeUN2aktET2hOZlc0NHhq?=
 =?utf-8?B?dmF5d1cwYjNIREtCWjlESW9wZlpMcjM3NXpWb0hWci8xQkhoUExEWHltVnpo?=
 =?utf-8?B?MlptZjgyV1B3ZjFZMUc2ZWxLQVc2TWxKU3Jxc3hmTXVsTUJCaENFVGZmL1Zo?=
 =?utf-8?B?YUZtRlFEKy91bklYM0lGS0phbjFxQlg5dk81VlpnNGhLdFZXUCtYM3dQUnFU?=
 =?utf-8?B?dW1ZYzV5a09va1Jlc200QnRaYmZYTHB3YU95bXlQR1E5VzdWMGxOV1gwbUQ2?=
 =?utf-8?B?TUZHbEpnbklnektWUEhpUXRKYWRPbis0a1IyNUJaRG00M1pmYmhXaTZIRk4v?=
 =?utf-8?B?R1k1VStzQllmSDF1VCtndFZUWEk2UElKSzd3bmRLRncrelluNFp6ZDFDa0pu?=
 =?utf-8?B?TDBMWnI1WStJc2JvUTBUU013WFNkN0hoaXJjWjF4U0ZBT3ArK3ZtakVpUGFJ?=
 =?utf-8?B?dGZITEZkQzVjNWRyNHlLY2xaNVYzSjVGdXVNZFhYNS9lTHhKZ1JWZVhMS1lS?=
 =?utf-8?B?L1Z6R0czK1VaN3BHcnlZMjhwRUFYOEFkREkzR1dicmwzOXBHSU1vbytMZmNQ?=
 =?utf-8?B?RzR6SDRRUkw4aW5rSEpJVVVZalZ3WEd1em53N3htMnk3YkZMaEJFQzhEQXVQ?=
 =?utf-8?B?SGxCNnFybXE5M1JkQ1VOZ3FSNEVjd2hoVHZqczQ5ZXE3aHlTL3VrMnRjT1dm?=
 =?utf-8?B?TjV3RFI0NGdDYXBmNmhVbGlHQWt2NFpRcUtKUkQzQ2lBZDUvcC9aRFJkQ0o3?=
 =?utf-8?B?SXBmMlJTNHduM1lqWlhBTGd0SE5hUWwzKzRGalIyMGZDbUJHK0I0YjFBbThF?=
 =?utf-8?B?ZkJ6bm11U3RVOGJWVlQ5YjM5ZEplVFBVemh5TTdhYWdLdncwZFMwZS84eHBD?=
 =?utf-8?B?Z3Q1V0JLSmxlKzVoWnNUSVV0QW9oYUpIcUpCeG92R0dreWNJYWE3WVpna3pB?=
 =?utf-8?B?UHEwTmlISTY1bTBNalRyUm80ZUNsL2Vmb0xESVdVNHcrWkdwcW1WOVZjUTZ5?=
 =?utf-8?B?R2g3VHVka2hVZnBxNmpPVW9YaU9nTG9UM01xR01zZThTL092a2hseHM1dTlq?=
 =?utf-8?B?RzRzdVRJdHpzQk1PNlZyYUJ6WUlkRjlKRjFSNGlZdzNCMkQvaGtiZk1MN0My?=
 =?utf-8?B?Y0Nmd3BVWCs2UVg4RGdsc2tTMlRERFNZc3J4cmJJYWxZRVFlbUhUckJXSVdj?=
 =?utf-8?B?UFlnQjZhME5wcDNMbVVEQ2Z5bkd3Z1drbHlQUDFIZkRrTndWTHpINm5TS0FQ?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a6ac94-dfae-4005-5045-08dcc5ab157a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:42:57.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a0aSxULSgAOcqWxZt8I2HE5uSc4vC3wlGEDDs1nphXXC8z/Elw6gVXkggZFvMcZCIdiNcGeZaxp9eHX51A6+WICCTdr3xw18X23HHyXDNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9680

Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
(System Integration Unit Lite2) hardware module. There are two
SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
SIUL2_1 for the rest.

The GPIOs are not fully contiguous, there are some gaps:
- GPIO102 up to GPIO111(inclusive) are invalid
- GPIO123 up to GPIO143(inclusive) are invalid

Some GPIOs are input only(i.e. GPI182) though this restriction
is not yet enforced in code.

This patch adds basic GPIO functionality(no interrupts, no
suspend/resume functions).

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-siul2-s32g2.c | 607 ++++++++++++++++++++++++++++++++
 3 files changed, 616 insertions(+)
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..0c3c94daab0f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -643,6 +643,14 @@ config GPIO_SIOX
 	  Say yes here to support SIOX I/O devices. These are units connected
 	  via a SIOX bus and have a number of fixed-direction I/O lines.
 
+config GPIO_SIUL2_S32G2
+        tristate "GPIO driver for S32G2/S32G3"
+        depends on OF_GPIO
+        help
+          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
+          chips. Say yes here to enable the SIUL2 to be used as an GPIO
+          controller for S32G2/S32G3 platforms.
+
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..fb6e770a64b9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
new file mode 100644
index 000000000000..07df16299237
--- /dev/null
+++ b/drivers/gpio/gpio-siul2-s32g2.c
@@ -0,0 +1,607 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2 GPIO support.
+ *
+ * Copyright (c) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018-2024 NXP
+  */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/bitmap.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
+#define S32G2_SIUL2_NUM		2
+#define S32G2_PADS_DTS_TAG_LEN	(7)
+
+#define SIUL2_GPIO_16_PAD_SIZE		16
+
+/**
+ * struct siul2_device_data  - platform data attached to the compatible.
+ * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
+ * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
+ */
+struct siul2_device_data {
+	const struct regmap_access_table **pad_access;
+	const bool reset_cnt;
+};
+
+/**
+ * struct siul2_desc - describes a SIUL2 hw module.
+ * @pad_access: array of valid I/O pads.
+ * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
+ * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
+ * @gpio_base: the first GPIO pin.
+ * @gpio_num: the number of GPIO pins.
+ */
+struct siul2_desc {
+	const struct regmap_access_table *pad_access;
+	struct regmap *opadmap;
+	struct regmap *ipadmap;
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct siul2_gpio_dev - describes a group of GPIO pins.
+ * @platdata: the platform data.
+ * @siul2: SIUL2_0 and SIUL2_1 modules information.
+ * @pin_dir_bitmap: the bitmap with pin directions.
+ * @gc: the GPIO chip.
+ * @lock: mutual access to bitmaps.
+ */
+struct siul2_gpio_dev {
+	const struct siul2_device_data *platdata;
+	struct siul2_desc siul2[S32G2_SIUL2_NUM];
+	unsigned long *pin_dir_bitmap;
+	struct gpio_chip gc;
+	raw_spinlock_t lock;
+};
+
+static inline int siul2_get_gpio_pinspec(struct platform_device *pdev,
+					 struct of_phandle_args *pinspec,
+					 unsigned int range_index)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						range_index, pinspec);
+}
+
+static inline struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
+						    unsigned int offset,
+						    bool input)
+{
+	struct siul2_desc *siul2;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
+		siul2 = &dev->siul2[i];
+		if (offset >= siul2->gpio_base &&
+		    offset - siul2->gpio_base < siul2->gpio_num)
+			return input ? siul2->ipadmap : siul2->opadmap;
+	}
+
+	return NULL;
+}
+
+static inline void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
+					    unsigned int gpio, int dir)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dev->lock, flags);
+
+	if (dir == GPIO_LINE_DIRECTION_IN)
+		bitmap_clear(dev->pin_dir_bitmap, gpio, 1);
+	else
+		bitmap_set(dev->pin_dir_bitmap, gpio, 1);
+
+	raw_spin_unlock_irqrestore(&dev->lock, flags);
+}
+
+static inline int siul2_get_direction(struct siul2_gpio_dev *dev,
+				      unsigned int gpio)
+{
+	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
+						     GPIO_LINE_DIRECTION_IN;
+}
+
+static inline struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
+{
+	return container_of(chip, struct siul2_gpio_dev, gc);
+}
+
+static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	ret = pinctrl_gpio_direction_input(chip, gpio);
+	if (ret)
+		return ret;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
+
+	return 0;
+}
+
+static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
+}
+
+static unsigned int siul2_pin2pad(unsigned int pin)
+{
+	return pin / SIUL2_GPIO_16_PAD_SIZE;
+}
+
+static u16 siul2_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
+}
+
+static inline u32 siul2_get_pad_offset(unsigned int pad)
+{
+	return SIUL2_PGPDO(pad);
+}
+
+static void siul2_gpio_set_val(struct gpio_chip *chip, unsigned int offset,
+			       int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int pad, reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = siul2_get_pad_offset(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, false);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			      int val)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_val(chip, gpio, val);
+
+	ret = pinctrl_gpio_direction_output(chip, gpio);
+	if (ret)
+		return ret;
+
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_OUT);
+
+	return 0;
+}
+
+static int siul2_set_config(struct gpio_chip *chip, unsigned int offset,
+			    unsigned long config)
+{
+	return pinctrl_gpio_set_config(chip, offset, config);
+}
+
+static int siul2_gpio_request(struct gpio_chip *chip, unsigned int gpio)
+{
+	return pinctrl_gpio_request(chip, gpio);
+}
+
+static void siul2_gpio_free(struct gpio_chip *chip, unsigned int gpio)
+{
+	pinctrl_gpio_free(chip, gpio);
+}
+
+static void siul2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+
+	if (!gpio_dev)
+		return;
+
+	if (siul2_get_direction(gpio_dev, offset) == GPIO_LINE_DIRECTION_IN)
+		return;
+
+	siul2_gpio_set_val(chip, offset, value);
+}
+
+static int siul2_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int mask, pad, reg_offset, data = 0;
+	struct regmap *regmap;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = siul2_get_pad_offset(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, true);
+	if (!regmap)
+		return -EINVAL;
+
+	regmap_read(regmap, reg_offset, &data);
+
+	return !!(data & mask);
+}
+
+static const struct regmap_config siul2_regmap_conf = {
+	.val_bits = 32,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap *common_regmap_init(struct platform_device *pdev,
+					 struct regmap_config *conf,
+					 const char *name)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	resource_size_t size;
+	void __iomem *base;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return ERR_PTR(-ENOMEM);
+
+	size = resource_size(res);
+	conf->val_bits = conf->reg_stride * 8;
+	conf->max_register = size - conf->reg_stride;
+	conf->name = name;
+	conf->use_raw_spinlock = true;
+
+	if (conf->cache_type != REGCACHE_NONE)
+		conf->num_reg_defaults_raw = size / conf->reg_stride;
+
+	return devm_regmap_init_mmio(dev, base, conf);
+}
+
+static bool not_writable(__always_unused struct device *dev,
+			 __always_unused unsigned int reg)
+{
+	return false;
+}
+
+static struct regmap *init_padregmap(struct platform_device *pdev,
+				     struct siul2_gpio_dev *gpio_dev,
+				     int selector, bool input)
+{
+	const struct siul2_device_data *platdata = gpio_dev->platdata;
+	struct regmap_config regmap_conf = siul2_regmap_conf;
+	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
+	int err;
+
+	regmap_conf.reg_stride = 2;
+
+	if (selector != 0 && selector != 1)
+		return ERR_PTR(-EINVAL);
+
+	regmap_conf.rd_table = platdata->pad_access[selector];
+
+	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
+		       input ? 'i' : 'o', selector);
+	if (err < 0)
+		return ERR_PTR(-EINVAL);
+
+	if (input) {
+		regmap_conf.writeable_reg = not_writable;
+		regmap_conf.cache_type = REGCACHE_NONE;
+	} else {
+		regmap_conf.wr_table = platdata->pad_access[selector];
+	}
+
+	return common_regmap_init(pdev, &regmap_conf, dts_tag);
+}
+
+static int siul2_gpio_pads_init(struct platform_device *pdev,
+				struct siul2_gpio_dev *gpio_dev)
+{
+	struct device *dev = &pdev->dev;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
+							    false);
+		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
+			dev_err(dev,
+				"Failed to initialize opad2%lu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].opadmap);
+		}
+
+		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
+							    true);
+		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
+			dev_err(dev,
+				"Failed to initialize ipad2%lu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
+			   char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_remove_reserved_names(struct device *dev,
+					    struct siul2_gpio_dev *gpio_dev,
+					    char **names)
+{
+	struct device_node *np = dev->of_node;
+	int num_ranges, i, j, ret;
+	u32 base_gpio, num_gpio;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse the start GPIO: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
+			return ret;
+		}
+
+		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
+			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
+			return -EINVAL;
+		}
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_populate_names(struct device *dev,
+				     struct siul2_gpio_dev *gpio_dev)
+{
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
+		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
+				      names + gpio_dev->siul2[i].gpio_base,
+				      &ch_index, &num_index);
+		if (ret) {
+			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
+				i);
+			return ret;
+		}
+
+		if (gpio_dev->platdata->reset_cnt)
+			num_index = 0;
+
+		ch_index++;
+	}
+
+	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
+	if (ret)
+		return ret;
+
+	gpio_dev->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
+static int siul2_gpio_probe(struct platform_device *pdev)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args pinspec;
+	struct gpio_chip *gc;
+	size_t bitmap_size;
+	int ret = 0;
+	size_t i;
+
+	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
+	if (!gpio_dev)
+		return -ENOMEM;
+
+	gpio_dev->platdata = of_device_get_match_data(dev);
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++)
+		gpio_dev->siul2[i].pad_access =
+			gpio_dev->platdata->pad_access[i];
+
+	ret = siul2_gpio_pads_init(pdev, gpio_dev);
+	if (ret)
+		return ret;
+
+	gc = &gpio_dev->gc;
+
+	platform_set_drvdata(pdev, gpio_dev);
+
+	raw_spin_lock_init(&gpio_dev->lock);
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
+		if (ret) {
+			dev_err(dev,
+				"unable to get pinspec %lu from device tree\n",
+				i);
+			return -EINVAL;
+		}
+
+		if (pinspec.args_count != 3) {
+			dev_err(dev, "Invalid pinspec count: %d\n",
+				pinspec.args_count);
+			return -EINVAL;
+		}
+
+		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
+		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	gc->base = -1;
+
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
+		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
+
+	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
+	if (ret)
+		return ret;
+
+	bitmap_size = gc->ngpio * sizeof(*gpio_dev->pin_dir_bitmap);
+	gpio_dev->pin_dir_bitmap = devm_bitmap_zalloc(dev, bitmap_size,
+						      GFP_KERNEL);
+	if (!gpio_dev->pin_dir_bitmap)
+		return -ENOMEM;
+
+	gc->parent = dev;
+	gc->label = dev_name(dev);
+
+	gc->set = siul2_gpio_set;
+	gc->get = siul2_gpio_get;
+	gc->set_config = siul2_set_config;
+	gc->request = siul2_gpio_request;
+	gc->free = siul2_gpio_free;
+	gc->direction_output = siul2_gpio_dir_out;
+	gc->direction_input = siul2_gpio_dir_in;
+	gc->get_direction = siul2_gpio_get_dir;
+	gc->owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
+	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
+	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
+	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
+	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
+	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
+	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
+};
+
+static const struct regmap_access_table s32g2_siul20_pad_access_table = {
+	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
+};
+
+static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
+	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
+	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
+	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
+};
+
+static const struct regmap_access_table s32g2_siul21_pad_access_table = {
+	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
+};
+
+static const struct regmap_access_table *s32g2_pad_access_table[] = {
+	&s32g2_siul20_pad_access_table,
+	&s32g2_siul21_pad_access_table
+};
+
+static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
+
+static const struct siul2_device_data s32g2_device_data = {
+	.pad_access	= s32g2_pad_access_table,
+	.reset_cnt	= true,
+};
+
+static const struct of_device_id siul2_gpio_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2-gpio", .data = &s32g2_device_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
+
+static struct platform_driver siul2_gpio_driver = {
+	.driver			= {
+		.name		= "s32g2-siul2-gpio",
+		.owner		= THIS_MODULE,
+		.of_match_table = siul2_gpio_dt_ids,
+	},
+	.probe			= siul2_gpio_probe,
+};
+
+module_platform_driver(siul2_gpio_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP SIUL2 GPIO");
+MODULE_LICENSE("GPL");
-- 
2.45.2


