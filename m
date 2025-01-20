Return-Path: <linux-gpio+bounces-14934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB5A16727
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 08:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3324162065
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D5618EFED;
	Mon, 20 Jan 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LqXuNFYT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98413D51E;
	Mon, 20 Jan 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357274; cv=fail; b=lD45tbfmdD/b9kAPotst2744EgRvosCqgGFvaUCuzeWYuz5TecDmfkVKXsMdMhFouVY+lXrSnNnWqjUPhCGbl0oWFzdOSya+5h83x9zrlC6fnhVY8+YMlleVpx2d3e4Tteqk9n7oUwyoTP6ySN9CsPnPFnq/t5lWStoeOdc7KKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357274; c=relaxed/simple;
	bh=F4M42WMbh39i84M01vdmMHQ6OXgp0yVAUFLDe40K1ZY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=G8KCZQKjYjlm7WlAxGZIJq4hndSkSR8a2JrJeO4OuWLaOiCMZi9h3/9V2sWgEeRTAEHd11gzbpy9/ERblPYOy7pSwivxfD+S7IRGtLYgeczH/Ra7r/9XA5Yp+05xZONlF3HiJwAddPH0aAgMzv5He5b1BW9L8PHFJ3iOtkCXa8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LqXuNFYT; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXLUvlCvG7KfxElDIdCCZM2OMSY7qs853mVuYu6ITVnGbnuCZ0EML46EkrG/FuZgevI3fkPM5ssAuDA2Qq1zkPSywjvKEpPnOBMYUT6s5fEZKWKxdbX+jUBYm4nXIs8gr59M0FSqbF8i7H7HtAIoqPMDFD5cfrR6IQBY1Q8oSAYJpdyaoASyCdP5BX5qhuc8RMhhGFSrRrLFTaDqj1ZsZRoI1fceT0+yV8bVNT1nb5FQ5awbDy3Xyqz8ToDH0ZbdwGSsdGoi8Bo2RGZ6x2fapfdxZGzQ+EohSsIegMqglnRPZ7OeHCV3KDQc3jp3s3lfrm/4sAqBEtSJuHRPkKNeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgS21H3Egr8ic3h4bMPj+WHsijaMNd9IItNr8DHZxX4=;
 b=wrEED7sz2/KY+sVbArSQElXhpk3qaS63abRtzHXGPVL7vKmbpe88LHi5wSTGAbt6SDqqULUOEGQfqncwRnrxsmhkaGwzefBKkoJ3sitLdpFoleeICfytcwaIv7M3j9bDosWgHGTjCUw4MvL9Ema3BRhaXkc+/Gv5VWAcI3pT8PnHn0inV4ILNBND82AAQicW9yhC34t0e0aJXKQ0EwIcYLutQLTLxWttiYF9wU1mWNPRbKbxjYjD1kDGSyKH5yHierEUu/+gSENKyCFkY5+N1Ruf5VFusCQMrE0kDFenXmYXqXZagChJPsFRdFGJ9lCdxrItaTX2Yxu66rTfzZYIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgS21H3Egr8ic3h4bMPj+WHsijaMNd9IItNr8DHZxX4=;
 b=LqXuNFYTbYf8xtLDNJzDPATlI8ShLMCFe/YWvz/9RQm9j8f9BMYj7+qfohiRGccbrwlLGhs41eBItql2lWZtUDdwhc/sDcoVHWpbID/GBPFMSDfykNbgN5PekbpHWu6t5uro8MFWAaPSyk6etM+kdcq5R5+LY/Vq6QAhg7nODvVSjXGsQKAmSCyuQsUaWOAj2WN55nTrOStMO9pDsfJIHYc6b4g8cex1CNnItkeR84qOr7bcT7ia0KFmFEZuSYO08OOtrAci1uVCKWYZbmQ+jsx0TvZpJUtvwVHTciQw0949/UVeQnEJRBA06GbOrXR30aBHW3XK1vENuJAm9kPCGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 07:14:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
Date: Mon, 20 Jan 2025 15:13:28 +0800
Message-Id: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJj3jWcC/3XMQQ7CIBCF4as0sxbTgWJSV97DdIF0sBMtNGCwp
 uHuYvcu/5e8b4NEkSnBudkgUubEwdeQhwbsZPydBI+1QbayQym1SHZm4d4j5Sf7hzDuplGhw54
 M1NMSyfG6g9eh9sTpFeJn9zP+1r9URtEK6o0yWnWoTvLi1+VowwxDKeULkQVgiaoAAAA=
X-Change-ID: 20241225-scmi-fwdevlink-afb5131f19ea
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=2024;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=F4M42WMbh39i84M01vdmMHQ6OXgp0yVAUFLDe40K1ZY=;
 b=40mZsqC4X2XhdBkDZQQKM4ys2pQ+GCDj9IYT2BaeizyKEHWPNFKdv3yC5GCTkxgcg95RRu3lQ
 dXxGX2DBFTTDf6h9Tta+0lrfqoHiW138pqswFcY8FcG3FOOMDSk9NYt
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 19726693-7467-4d08-20c2-08dd39221210
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlY5Y0RWUDFhRTlTVE5mS2FqSkFNUXdpTmtvOFBqeU1GYm5WUzNBR0Zkdmlx?=
 =?utf-8?B?aFBQRnlFVzVQd2wwSkxBNUlMcmFwdGpCSDRJK1hHc2lUejJHUlBnbWR0dEtH?=
 =?utf-8?B?MTVXZGRGcjJOcnpIYVNEME9tODh4dXhleWZreXozZFdDSHJrTi9SU2JaK3lm?=
 =?utf-8?B?MGZ1aENXVktSVWtRZEptckRaUGNtb28xVXNEWTloNW9kaVN1L0xTYWJPQlRy?=
 =?utf-8?B?OWNyTVdSbUJBOTRUWDJtMk9abFZnMHNra1dFUFpIemVIZFF6OS9MSisvU29m?=
 =?utf-8?B?RHc3aWczd01BalJYRkF6VHlGOWFKNXk3RWVJZmdFZUJJM0xYZDFEb3U4VTRY?=
 =?utf-8?B?M1dIQUpWUTZjRzJETER2ZDByODlFRHlEdHBRQVlaa2R0RldzT1AzcElYTTBQ?=
 =?utf-8?B?QzArNGlLRWozcFkwV1Jod25ERENobVRCVVdrN1U2QWhWeDZCTUZ4YWtPM05P?=
 =?utf-8?B?bjQ3Q0FXSEdmMnB4T3BzNjd5ODRuUkJDdkNDL0RvaVdkdXV6bldnTEN0aHY4?=
 =?utf-8?B?UWwvdlByY1B3aHRZRmZZMHZlUXcyR0xqODZUQmZpQXIveGwyemF2VnB0dzM1?=
 =?utf-8?B?djBwUlV5TFF0QWFQRloralZGQlkzdkZTMVFneTZ4VDBlclBrRm4vbEhLUmNv?=
 =?utf-8?B?VjhiZSs5OWJvam90WW01M3MvNWxqSkwvTDlXbWQvQ0t0RnNvS3JXVHZVbjlr?=
 =?utf-8?B?NVRBZjJqQ3kzcmFwNU5odUR1ekFML2V6Z3VYR3ZDZ1g0U2FzYno1R1FkMXI3?=
 =?utf-8?B?YXdsVlkxL2FPQlM2VFljZ3JIRFJ2dXZXdm9EeWJYTUZZeGNhdjhzd0E5S2Z0?=
 =?utf-8?B?UDBreEoxMkVSaW5XK3VKRmF2bkFyUWVwWGtDL2Y3ZDJieVN3T2txMmNwZDVF?=
 =?utf-8?B?d0VIaHdzSDM3VE1rUGhHZm8yUWs1VkdBRTlHdHdKRC8vOTFKa3hhVU5JUnpZ?=
 =?utf-8?B?M05adGUvWExlOFZycHZtYzNSVUMvSUEyanJtUjBRNnpHOTRwTWJOVEYwUHNR?=
 =?utf-8?B?cjJQYmU2YUgvcGZNUXBZdnhOcHp5NXFjYTZqZStUaEpRVEZkOGdqWWVqVExY?=
 =?utf-8?B?Ump4d0E0eXR2UkFnMy9vWHo4aUx2cXkyaDQ1MkdQREFxTC9xVTVKVDJEWjRp?=
 =?utf-8?B?aytGRVA5ODIzNFNpV2tHRUU5U09qQTVYZ1kzc1R5UHRSUE5MNEFRT1BjZXJE?=
 =?utf-8?B?cFp0WUdIYTNGdW94cEpvR0p0OVFkVEpiT0dDdmpUdERaTGwrcEFUc3BVZ1Aw?=
 =?utf-8?B?aUZjb2wxZWttYzdhVTgxbGZ3aWpDb2tydHpMWHB4QWtraVI3MG9VMzJrNXo4?=
 =?utf-8?B?ZVhHZ2Z6UVY2RWhKelRtZ1dJRGE2bVZuMzZUQnBGRDY5YUs4cjd5ZGg5c0FO?=
 =?utf-8?B?MXlDcnVVbm1ycTVRd29GaXptZmluTXJhOUJlZkkzVFJwdytRUXpDeXNQNmg0?=
 =?utf-8?B?N09uVXN2eUJ1aXhzWFdMMGtOcUlzcXNFVWsxM3YwTjg1TkpOblJCRFc3MDhN?=
 =?utf-8?B?dzRrMVhNOHZYeDA5SThFcFZsWi80Q3BITHFROFR1L2RsUXJSc05Bc1BKU1Vo?=
 =?utf-8?B?V0JJR2tqRHBqZGIwZUlmdEd0QTJQZXdUSElNV0g3dENKcDI3eXZMbGZmaDEz?=
 =?utf-8?B?UVl3ak9USHQ2N0YxKzJZYzI1TmVXTWFXbDV0dStLWlR6c1UrK1ArOHRxQmxx?=
 =?utf-8?B?cDVwYjN4SGFMRHMxTkdtWnpxZmk0UUxxcDlvUzlWcE8rM203R3FQa2F0ZTFP?=
 =?utf-8?B?U3c5SHEzQ3ZHc1YyN0FNY0lqRkxudy9kT2RQWmMrZXloWlVmWDArb3FmVm5V?=
 =?utf-8?B?cE1COFd6SG5ZYVpvaFJYalJ3TTBqUzVuMlJ1NUJjdTZnMm9JOWtQdkltQjNs?=
 =?utf-8?B?MGtPQzEvOXNORFRHdG5IQ08wWDVlWVN3R1lwWXlrTk40U1hrb29nNnA4YmE4?=
 =?utf-8?Q?I2PiYZq1aAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlQTWxrWWcvNTZwNEx0Zm5ZS0l2eFh2OEtKcFJGNVBKclBJdkxGYlpLSjE1?=
 =?utf-8?B?M0pGVDUxUENSQWc4cXpUa0FLUXJXWmZEM21JYzgzdnVKN3VTWURrSjYvNXNZ?=
 =?utf-8?B?emFWbmxwWnFYTnpRN2FzMHR1bFZCY1QwWlNZN3hnL0Z2MXBTZ1JzaTVjL0FB?=
 =?utf-8?B?bnYvLzRpak53VmZZc20ydkppSjhtK3p5dzdHNjBabDQrREJHdG5nVzBEUzJC?=
 =?utf-8?B?dDZla0dyVHZ1dXZ3QTRBbFNvdlg2MUNjUDcwTzE1b1ZvNGlNY29WTCs5MDl2?=
 =?utf-8?B?MGp1bzA5eGxhMm9tVFhyNEpTR3drMWdIRitzeEx5WTE4NnlNUnFOb1lqWGVv?=
 =?utf-8?B?MEo0UFpUV1ZxUm1RaXdsKzUwK08yN20ySDFHUTU4SkdwcE5md2d0RXdXNjV0?=
 =?utf-8?B?UVM5MytvSmdMR0JLck1tdmNzMU45anFnMVU3Q1dJQmtZTitHOFZ5NVk3M2la?=
 =?utf-8?B?dU9TeVhoRXBzTDNYNXRlQWpNN1psV0Q2SWFpUTh5bkZJMWRONVp1Vkh5aktG?=
 =?utf-8?B?WTIrV2FOdmx0b2hmdTI1cGFnYnUwVWRvdjViM2JUWFJWOEVaTE5kWml3cUhV?=
 =?utf-8?B?VU9wUGc1bzZIcjk2VWJJZkxSY0FseXg2MUpncm9FZ1pjbk9uMVdVekxYdmlT?=
 =?utf-8?B?WW15TW52UDFNblEzNlU0bFBHOWdid3ZOQ3dFUFY1T2s2dFkzaTdSaXpNbHhV?=
 =?utf-8?B?dUJCT2pXcUw2RjBNWjVCYUN2enY0OEVJYXQ0UEpoSE9hS3RSUWJkcWt3dVRY?=
 =?utf-8?B?RWhrWWF1YWJrbGFVNDRzK1ZjZ0pHK1hDN1VOUmM0RnA5MFVYb2p6TVMrcFpx?=
 =?utf-8?B?UVl2L3kxeEIwMlFMTXVTY1ZDNnRRMEZWK3pRSENkZEdyZldOVjJLNW0za2hY?=
 =?utf-8?B?MGtqeENpWEZMdWNTVm13cm9ZekFuTnRsSVIwQzBUT0I4ekk4bjNqd2hGSG1W?=
 =?utf-8?B?TmlUM3NsRjlrQk9iREp0Q3ZDUGkyVHVYQ0F1cE9kbG1jTVdQNmdySE04c1BS?=
 =?utf-8?B?RWZCQ3RmYnhvcDdabXNISWlOM2YwSlFDbjhMSUNWZjVKSUQrQ0FMc0hMbGJO?=
 =?utf-8?B?RGYwdFAvdDh0aWxSLzlWTHc4ZHhDTkpWanl0RDVDUnZzUlpodkt5UVZlU2pF?=
 =?utf-8?B?eitNVFUvNERLaEVaWlNOcVU0SEppSXM1clBMYUswYVBzY09TN1IvR1ZKRlA2?=
 =?utf-8?B?ay9JSEJTd0xTR0pEUjBMTStCWWNZUThnb3NoMkQvSHBvZEo2THFxOTVkOW1z?=
 =?utf-8?B?anp0dTVtbHRNNkFxWGFLMndFMGdpWGs4a2dOWkhSaWFMM2xacytkcW9nZXhY?=
 =?utf-8?B?NFRxMHQ5TWpPTnRRd1lOdTA5dTBMODJkVFBZZG1WUWo1bmY2Z2pLUnNPWFBz?=
 =?utf-8?B?dTNvcWp1Qmlxc3AxQmM3UG1IbUR3OTEyT2JkWUdmZ3RVVEJLL0ZOMGJYeVJN?=
 =?utf-8?B?UUNpUFpkMGxzNFhwQ1NWVFplQ0hIVUhlRnpCbW55U1phQTVZcDBBcGhEVUUx?=
 =?utf-8?B?U01ETXVxREFCcXlFSFByM3BwRmxscmQ2S2s3bWFzU2ZHR05DN0drRTQ5cmo5?=
 =?utf-8?B?V2FEL0RZRUFrZTVyRW9LSWJpb0gzdVBpU1VzaWs4N2E5VU9KcjlOY2pSWGR4?=
 =?utf-8?B?Vk5NZTJhRmUrY1IyOERrNENVbk9DMUdJZllaNVdwK3gvQXVDOXlNcUh1NnRF?=
 =?utf-8?B?UG1wV3Z6dVhxTlhqcUFQMFhMZWw0ZkJlbjBuTEk2WHhjMW1xdFFJamJPYmdL?=
 =?utf-8?B?TkVCWVlqWFVtVGNNdmJRL0J5VkN1WFg4YS9Lb0d0YWRRY0RkUitzU2ZOMElC?=
 =?utf-8?B?Ny9XK0pySVg1c3E1Vnh4bmJSRjRqa1lOSVVMd0RqWkR5RXc3bytQVG5Xb2N6?=
 =?utf-8?B?TDlFWlZzT09uL25sdmtqaktPL3dncXg1djlocnBVQUZwYkZVTE1jeFhSMHR5?=
 =?utf-8?B?L3J2UkZZOWN2ZkFJeWl2UVEzck1HZHlJazNIYTlsbFVoNVhLTTdSblVjWU9i?=
 =?utf-8?B?UStUVWdHUlRkcHlhc3RoL1o0dXBqaWxsdm9BdHE1TkR1YzQvdjBTejc2Sm1N?=
 =?utf-8?B?dWZ6MXhZc2Jwc2tCeDRoWWt3bnJGbks5WjhORGFka1J0OExHMy9FZ1hMem9w?=
 =?utf-8?Q?9Ozfz+HZblJKdAjqqfTWg+gPO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19726693-7467-4d08-20c2-08dd39221210
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:25.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLTguQMmmJ08rH1spKA0SFjAMCtjE2Xy5UcSB6JnphFS2Jl1loJr4agTXIC8yPNcGQfifWVybH0vpOANft5ZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

Current scmi drivers not work well with devlink. This patchset is a
retry to address the issue in [1] which was a few months ago.

Current scmi devices are not created from device tree, they are created
from a scmi_device_id entry of each driver with the protocol matches
with the fwnode reg value, this means there could be multiple devices created
for one fwnode, but the fwnode only has one device pointer.

This patchset is to do more checking before setting the device fwnode.
And Introduce machine_allowlist and machine_blocklist.

The reason to introduce machine_blocklist is for case that
if pinctrl-scmi.c probes before pinctrl-imx-scmi.c probes on i.MX platform.
Need to block pinctrl-scmi.c on i.MX platform.

This may looks like hack, but seems no better way to make scmi works
well with devlink.

[1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=CfZWQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Introduce machine_allowlist and machine_blocklist
- Keep of_node for cpufreq device per Cristian
- Patch 2 is an optimization patch when fixing the devlink issue
- Link to v1: https://lore.kernel.org/r/20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com

---
Peng Fan (4):
      firmware: arm_scmi: Bypass setting fwnode for scmi cpufreq
      firmware: arm_scmi: Add machine_allowlist and machine_blocklist
      pinctrl: freescale: scmi: Switch to use machine_allowlist
      pinctrl: scmi: Switch to use machine_blocklist

 drivers/firmware/arm_scmi/bus.c              | 31 +++++++++++++++++++++++++++-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 15 ++++++--------
 drivers/pinctrl/pinctrl-scmi.c               | 15 ++++++--------
 include/linux/scmi_protocol.h                |  3 +++
 4 files changed, 45 insertions(+), 19 deletions(-)
---
base-commit: 9dff7bbdd359c73f1b44ab592bbb17e1c174fe43
change-id: 20241225-scmi-fwdevlink-afb5131f19ea

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


