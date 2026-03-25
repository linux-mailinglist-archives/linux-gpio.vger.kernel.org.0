Return-Path: <linux-gpio+bounces-34182-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGuYEyZqxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34182-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:05:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC332D3AB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79926301B4F4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D51539B95B;
	Wed, 25 Mar 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CTMv3rx1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA8397E9F;
	Wed, 25 Mar 2026 23:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479900; cv=fail; b=M/JSCPrKIMPIbfes27mwFNFGjDdLusbvDX94fMQcLLxoMQcir3l7NpF7Uk8ZoMoAOUxJHpwB0h3S0J9SgqJxgo+KEVcana0H991PtUnyWNNIvUBZEUFJl84hjn8AO2LCO1I7NloHCf0IFZqHphtfuG9gr2YAihAlaSmo2RD9NeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479900; c=relaxed/simple;
	bh=YjekS0zr/swbFjaUMALudPHZ5yVmBdXkiTRaBeNarUI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=APIzpwKn0o9wUKUBEq6KKbIWl39p5YyeDlOhpFLk/23TXOd8wRsWY4KD8zlBeStl3BZv0g3rH3k4LJwphNK2NrV0QHx+ZJFb/22IwliSuG6J2UPWAtYBDkf9MT/OHsphILjjUgT6ZvtkK4ibtaVc4UP2oe+JR9VbNNW8Z0q6Lr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CTMv3rx1; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPdXue4PXpFSnVG2wcmmuPkp5gJhxkMFlpHADmHu1RcwYJnruH7dRna0ey0tgrs+SC1KfmaENdFmkjjkYyMzDyTbA4nSM41QdtzIsCZznR/ZPVtN0qBjd7h6vZUsaqSaYtXnX4cb2u4SeOiedgds7wr5u8lWCZlkkxImOogPTBj9Axl+dEd8iBPen0Wt7aTnTW8bj7za/mfI7jUm3cb7aT7sn5gKtt6G6ZKiHlrZpDLfDN+FGk5CUvAYSaKDgkwEgxPdgv4MP0mviJ+fDdRBAcc45t388Z0eQJpFVhxB7gSnRI4JuTTLTxFCFLEoQQZ/Dnz/h6448e9Cw9Gd0EGcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrnfVBmH7lq0Sg1oOGIcvjqEwdPNcCOfRCUWaxpAoIE=;
 b=TXkKPkl3mnVaNn4kOmq3E3BNBHKH2MHRXKvkJe2br2TwbUgI9IVbEIm3Atz01BIxaN4jlfQgseuphax/QEEnGXN7KjtvGeSj3KmFX3D1062cJdXE05ymlnsvfalEMmXl2sKu874JsJ2E1iVUNbxeCwesmoiJWpIeb6RkUWxAk6icsMhdvzBw4am6YwzdZKlPb3EE1FvDdTcgGyDsFVsE5cu2v09rp/gJE7b8qVVh4Dv+OtwMFGD4F3ZHcibDHieRnDllWPFeWjQHdib7XyBm2bgGP4y0R8+BWMFiqKhYd5+6V7vNj94vWQP5EyHH+crQN+PGNzgxN3Vyx/EJqibT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrnfVBmH7lq0Sg1oOGIcvjqEwdPNcCOfRCUWaxpAoIE=;
 b=CTMv3rx15o9pHvH9yeGNzKFXDCmaGE3Ti6vGkdObZuapos8XXCRTu1+9q05wd9HgUs5r9ehlcRhgmlb/FgcHXlimnfheJ2GmtimkNS7DSKOzVVwqHQw+TCnb5uqyxQcrBQtXXoAxpHNo9siHHyAHNkQ3Mhabuni8zPP6tg/S5KtdQnhTXTX5TTbYGrA3yzLY6trj1Gxlf2e7jGwjqPK4cmMqzS2zOE3zRwQMXZfOUdYHYz1/GrY/i61ZYKjPy9dgVYPX6FDFhSwd350pgQo3HYrEqo3r74UGJSHMoWS4FclS65P+nIct7220uYWoer0WXC72Cb1SxQlqW9gW3yul/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:16 -0400
Subject: [PATCH v4 7/7] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-7-043c2c82e623@nxp.com>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
In-Reply-To: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=1718;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YjekS0zr/swbFjaUMALudPHZ5yVmBdXkiTRaBeNarUI=;
 b=SY9zXi/wmM5r5toeB3fZAh5lxwEbDKg0iZe/jIJ0iVT2Y/4GDfjyienwSv25gCHlF4vUXCFao
 wyU3hOmRrEMB6qaCFNmRJBbzD+/ImtxU9i7iq/d51zt6kYXFB+RTDRK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e20e5d-8186-4ff7-2cef-08de8ac2edca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|19092799006|376014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	i+JxUwmQGBH80enW5ydBplscE06ms37aqo6x32Z4/59KKnkyzuEVpIjpEangjQfvhRvD4ooklNPFAJ+T5/tsI0buGEscosRpSX5OkWEEPwIKw+38MhYR52xe3rS3nhiyR+s6MwUoPGR+TAHCakpyC6Ng4l40lzsKMNj/zaRh3ZbZMtcDz9OyTAfV6z0xjE7sN4KHAs5FYTPmYPWVesAkNHRS2imjtzAab3AfGZWovfY38jWBK6vDapZoaQCGyl+iXrF21ZlESARu54z8JuWtJH833iKi9GZanq/a7peV7yzQjdHihJoTrheqZnyppDYU5xRmevq78ruWz6MGpZIlvKvfbJQ2KHke6QAww+Qm/qUu2V5A9geuBZ3YO+MwgfCU9rRVk+Zulkjs/DS4/VNYqYrCWVZeiGzZLVy9nyjLwuA9fmAaRAsVS7qz1TzDETUHv/MhF2/TzY+rX1G9N/HyFKLTfOgCSIUeUR6JIZPF6HwWOW4pwIBp2aSUWKb1nwUnxHJDoVZ20Q0qI+BM+dVzvMLvOMj/+s7gLQxvxD7PH1FquR/tjSoYchr9f4XgTFni06WYZv50yRR+eXO2JTiWVLiOKj+B2oSMTtaXfZVaJ1apjN50hrFpPIDpUJm7TnJQmSk0vBX8nGqqjSRj/mPGXVKvj2Rs09nNN4mUfBTvjRkjuWD+B9avwhSLoDSjM1ewsW/M2NcgEdtV6n2nzgnyk7n6qzFihv/8Cl7Uy8dsChlsDmH306tZqJ5sdMIkq8MB8wDV6aScslq5CnXtleQhZ7qq3h72avlPicPbzd5YuO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(19092799006)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJkem5MMjRHSFBQdDN2WHNKZ3Z6dmRLeVRjV2pFR2MzMTB3Q1o1V2NXS0I4?=
 =?utf-8?B?N3NhQ2NkRWQ2djFKRDNKdHczaGIzSHdvZlhmSytwK2llSklabFJGV3lERzFG?=
 =?utf-8?B?dTRXYThEbWN4ZTY1dklOZEJGVjVUZHF4SWlNa01GNXJ4NFRhTU9NaDB4K29w?=
 =?utf-8?B?RDdCTHdMc1oxQTh5VTNyWTkrZmpwczFqaTVLUml3Y1RVU29pRTlQL3BZUUUy?=
 =?utf-8?B?ZGZhbyttUTZDK2R5Si85SFVJd0NKdUVSdEJCRDc4MGhGQytIZURxTkVQNHNB?=
 =?utf-8?B?b0ZVR01xY0d1a1pLQmRrMWFKUjNkcUJHU1RNZ1N2cTZRQTNsMzVrVmp2djZY?=
 =?utf-8?B?emliQkxSaEYyWE5vcmR4U293eGlkbXlSNlJBQUhiK1pWZ0ZrakVXR29RWGtR?=
 =?utf-8?B?eEFaL1hMR0RxQllVN0dESVF6V29iL01NVVJJUFd3dkhKajJTU3NIUkJDTTlC?=
 =?utf-8?B?eTg5NlFUMmVWcWdYaVpaSkkyN1ZZMkZpZm5rRUgrcCtHVFd5MUFXNGQ2WTI1?=
 =?utf-8?B?dDNsQk1lV0hCb0JUcG1ZT2hNMUdmU1FSQWNXN25rQWZ2T2hjakFaS3czUFlY?=
 =?utf-8?B?b2tLeVFOblZsYitkVzNIT093OEFjemY5SVlYRkRCQ0o2aWdXN3oyTEtHeVR2?=
 =?utf-8?B?S0w5MWFpOEt2QXRTV1lRYm9LNURoSlNzcHF0aTlkM05uQWJ5Vi94UGFyWFAy?=
 =?utf-8?B?MXdFSkRiWkIvWXFya2tKcFZ5YThXMUJvaUlwVk9WU3FoaklrWVg5QVZkZi8v?=
 =?utf-8?B?RTNyKzNiQllUWHZEN2FqbEdJcGJ4QkdLUWNOdVErZnVGb3ZyYmtBNytoUHgr?=
 =?utf-8?B?UFRUcnNOLzZTVUFjT29Od3EvRnhNamZ6NVlQMDJpcXNnZzdkWDhRTno2cUJP?=
 =?utf-8?B?QTU0cU1MUWhrWDY1UmpMTXRhT3l0YVB6RDliSjFuUHpTNEZkeVdEYUNGZTds?=
 =?utf-8?B?YXZaWS9qdlNNcHdRYzhQQ3dISEhBQXBFbC9VcmRVZDNsMmV5bW5kVXNTOFlt?=
 =?utf-8?B?K0JlTFVlSmkrcnV3MnFqdFEvWjYxZUFlalE3MmtlNFVDdTNCOGFqcVFaZ3dX?=
 =?utf-8?B?N25HaU1KOERuVUNGWW9seGlYWm9tanpKcDBkLy9LMW8rTk5MUElUTXpyVE9n?=
 =?utf-8?B?V042eDErRDJtck5UN1NjTkN4OXNSRXB0Y1pucm9iQlZkaGpvZFRrSjB0M1Vq?=
 =?utf-8?B?aWExbkxJYWs2QjREc05QZUVLWERPSzA4N2xaZnVaNlp5aDdRRGJZazl1bHVP?=
 =?utf-8?B?UFVzclpyakdNNDlqMDNnZnRYSjJLK1ZyR3hCZmQ5clJPSkswNDdJdkFXa3E2?=
 =?utf-8?B?U3BLZU9GMEZmREpXZXVlbTNqRnMwZEtOYkd3YkR4SFpiRjZsRm9TTkN4SGpa?=
 =?utf-8?B?L3ZQd296SkdyYnJLU3h4dUJ1STg5QXhIQTB2blBYY2wzVXVJZHJXcDlBK2hH?=
 =?utf-8?B?anZ5YmtMOFB6RVViYXhVb3VqQlk2ditKalQvdHF4bE1DanhVQ3J3dEVzQ1NC?=
 =?utf-8?B?MW5iK3hURCtDZXRrWXpQa2x0b2dYYkpSdWJpcHlUbmV2Ti9BSHZzUXdYQitQ?=
 =?utf-8?B?UHpDNDBkbi96K0pCVGFMQjVmMjlXanZMOHNzdFhqSlk1aHh5VCthRTFHTndF?=
 =?utf-8?B?M25TSWREZHJsRjZoNlF4ZWpMRG5qamFrZlhqOCtVSjM1OUhuNXdldFFoMHh1?=
 =?utf-8?B?Ym9mZHRleVNoSWI2ZWVMbUFuMFFnZ3UyYlAzZTVoYjFaM1plK2E5NzJDZ2U0?=
 =?utf-8?B?clNhaWJIQXBpUkxEWUpEbnc3VlNuUWtJOWEwMEdDRDBOcktibnh3a2tpbkdv?=
 =?utf-8?B?ZDJucVBjcnZ2bTJUcTRvS3Z4QzlydTRGU0RZdEtqUlRtRXlPWnBGMjhFZklh?=
 =?utf-8?B?aS9xUkEyZnBxUWdqcmVTWUZXeW90V1JPekJCcXdTaGRLVjhBQXIzOFBhWmZm?=
 =?utf-8?B?Y2psSGMzMExuQ2pLQXFPTzA3TkhNSS9ZNk9Od3JuR3FSOHY3SjRzYXkrNjNB?=
 =?utf-8?B?Y01udG1LNEVPZUZ1QXNHcDl6N2FmOWpKWVBtSTZUT3BFSVhTOFJ6aGNDaXN2?=
 =?utf-8?B?UkUyMGpzVjAyZytwU3NlVTg5MkxjNE0ySzNESytBL2swOWxIWFByc0ZtNFFG?=
 =?utf-8?B?cDNxd0g2ZDJHZStwdDkzQW5EdU1oVXY0VzlEcUVFa0ZEQk9oRWx0ZWl3b2tW?=
 =?utf-8?B?aGVqOTN2MzVOQmlLbXB2UXg5Qkc4cGZvYVpLOGM1dDV4NzBuYUxHL1VxM0ww?=
 =?utf-8?B?K0dhTXRHNDMrL0g2aEJ1bEo5amdQYXR1MG5jeVNRd3ViTXFJZnJMQk5JdERs?=
 =?utf-8?Q?r44BIjqmt2Rsf8Ydzs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e20e5d-8186-4ff7-2cef-08de8ac2edca
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:55.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfsddiykwhSWh81goiu91AVz9EDnERUNORzGTMkuH8a+6FkJLh1furzLEnTTd2iGQWVm8Ew10TkRupIjmGJ0Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34182-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0ECC332D3AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3-v4
- none
---
 arch/arm64/boot/dts/freescale/Makefile                 |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e6001fe6cf460fcb09cfe57acc77e36..bd377191a68a6167d5f9a65184d19c789a4223ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -233,6 +233,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+
+imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f7d2674c45f72353a20300300e98c8a1eba4a2a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&flexcan2 {
+        status = "okay"; /* can2 pin conflict with pdm */
+};
+
+&micfil {
+        status = "disabled";
+};

-- 
2.43.0


