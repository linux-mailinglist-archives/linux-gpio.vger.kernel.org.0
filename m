Return-Path: <linux-gpio+bounces-18407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2392A7F264
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DAAC17C7CB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA08525F986;
	Tue,  8 Apr 2025 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R7Acujo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1025F966;
	Tue,  8 Apr 2025 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076520; cv=fail; b=WnExz/7hftfI28W4/4DBGqgC+VBExvnnxlI/cILTzwWRcx87ijExt1B4BDVxIwaw9YpHv3oQeCoT70byeAIncZI9DTp+xpyXJ6pM+F3rnFe9ie602KPBTMEVjyJtKJdWQOHZTCEkcR1NxJK12vbwNW3ysOZ3kjjRyC09jrik8gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076520; c=relaxed/simple;
	bh=5wzAfeB6rCYA6X0MA9cADWT513RygvXrFZzomPaLTTo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B4LzZtZglrzmmWDrm7fyCY1PNQw0mI4/IEW2xwR8n3Cue4yWtG2CHF+HpzMtShc6sz5JWQhin9OtbwnSb3dadYkNugk84mI1DgN7fotddfgnJfnXzBFISHq1qb+ZpBIqBF26r19kJjkaQrNMMItHT7fKRGUJSwZiT3ZBffJT2wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R7Acujo4; arc=fail smtp.client-ip=40.107.21.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPIMY9dadJRKEcm5XK1T/WZSEN2d6DLUNMYZ2t0ocy7vw2yJruZiQshK8FiqZxBHIXWG1FA367IZ6Ec64s7ftB38yEK9sPphUZuDSTsN/3MASG/UxAVELjUWhWHDlU9aNBBQEwccXz9t5iYkOpm7ylYUL+KxSaihLFd1JjeB+IED7zfIWpRcf7lIJ4sjvVpK4hSNtk5GzggZQWnYRbAgyq0ArFiMYOauaeb86xgES6YFit0MKPa3d/RFlfVr1wuNmKBk1rX6LhQRTcyrOBvnoXr3SlpSwLxxVLXbr10TaNhOiK5gqHLxxbS60UUfbR0Nox9maLLi+q+qSYf7Yw5Q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwJ7df0Rc/Kz+t8LlOfpZzI0CjHNaggCOfS+gLsROLk=;
 b=Je6lSsAI+yRuWVFhPTozFa/Sibb0LAOgX6wywqqLaCiH3t/0CRQu+bQJgb0i1X+tphQP3JxI4HNFZFmUByclFcBweMdY/MrHgDQ5i6D5a0GIa3zUOYSpnKXmGisa648xwWizx1lzkufjTZKKZRsQLfay684VBNd0/J0/p6h/XqJp+UoZQD3IjSuhwZl32XS213JpSHp700A89BPiliW77ZBmLhIu224n6v5a9kKs3SrUqlwCd+7Ns72dvJ/IgUIOhxfMwxzLrxoqZMM0j5SXEBKOr3sSC2hQSx2ZHqhfi7JCgcEG4Q/cIpXQoa9SFC+ywuKQa8kMLkLB0uPtDIxU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwJ7df0Rc/Kz+t8LlOfpZzI0CjHNaggCOfS+gLsROLk=;
 b=R7Acujo4yk29YvS9p3+k/zvol2dkRKhHNyM8scn0417cASVZa8IiI2Ro2SDIcRlsjNXlhSkUc3+8Mit5qn2rhW8Y99l+JHlg0JVyfGbpObxQAOLiCQAQo3cKc8y3jM+kVRlp6WJtwtjM83IZsJLmI5a38cW16VnSn0ftNaTZWhnvU/JvhiwAqhVaKKgoxnf/9t8HCAZoxNHDdq6y4B31Wj72bmcCx3kfag3htw/nngi/nutaLJvWRL6q4aG3xP8MyKGLGMusUHgwxidmbZLKzkZU03E4+tAMqZS3FLP8vDB731RonAvK1bApvDIIYcZs7lAAvihc8Ir2PE0y7zjSOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10199.eurprd04.prod.outlook.com (2603:10a6:150:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 01:41:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:40:03 +0800
Subject: [PATCH 7/7] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-7-c0db9d3fd6e9@nxp.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=6094;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=hz/nYShMk6rXfDuNSujlP+m7FWFh+wdaJRocKEMc47M=;
 b=OJhF61GU/rV2bym8lTjDr4//wFffmSA72oZvO4Irz63H3qeYTtjUWO3KZY75gLIEdW0ceU3Rs
 fmmqBIZDlEdBgFU4WLlATe4xnSS7iYtYrK4/Lp4ttHuzTLgrKXUkKr/
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c33e0f-b154-4831-20fb-08dd763e8a28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnEvNml1WVI4emQzd3lhR0JTSmdRbGV2ZDFwNEd4R04yT3VYZnpPckx2eHl2?=
 =?utf-8?B?UDV2Vk4zbEFKQW0vNk1EL0ZRNzA1Wnowc2J6MDAzQ3ZrQ3d2aCtteVZhcGhD?=
 =?utf-8?B?SVhiK0l1a2dTQUo0am5kajNYNU5QYTNXUElRZU1tL2tPdm12RzFuaDlCT0Nw?=
 =?utf-8?B?YjM5bFBuZ0ZldVRpYy9zQVA0M25rbGYvblk5bGZTVlcrSUNydkxRUU00K0M1?=
 =?utf-8?B?bTJHeGtqbGJyeHJFaUxhemJha1hLeUFnUmxTRHFhZDJRYk1Wdlh0c1RmNHd4?=
 =?utf-8?B?RnBXUFh2VWNLOHpJdmxDSGUyRjc0VGRTcXFjeDlFYTlrRTg3UCtLQlc2ZXRV?=
 =?utf-8?B?M1Q4Zm5ycUJmUFdYbldoY2xPK00zL1BiZFlNclpFMncrQjhrL0YxandvbkpK?=
 =?utf-8?B?VjByTHNZK0FwOFRWM0xJb2ZiQ0NpTFlmcDFJMGxJWkVzRWtjejF4cThnOStt?=
 =?utf-8?B?aEFTeVVUa1J6dGQ4SzVkQlRiRUg2Rmg4VktYUUN1SU5BQTV2RkNzeUVGTUZT?=
 =?utf-8?B?S1o4a3ZrbVpOc1ZlN2pBN2psQU1HQ1dzTzVZTzBjVE5kbDhHT3lPR1lwa0l0?=
 =?utf-8?B?K0Z5Zjd5cHBiZEcydmVsYVQxUTR3QktPYVhjYU9nUzZDNzVCQUlyOW40R1ZN?=
 =?utf-8?B?UG5yb3Y2cGluYnRYeEl0eThwOTdvUEJ5bFBoeUloaXo0dFc3K0VacG1LTStl?=
 =?utf-8?B?RG1DZ3dWR2d5MzFBM3crMCtVaTYwUmZaYThQV2wrNEtSVFZHWUFZTExFV2JL?=
 =?utf-8?B?Q2RIQVlLRzZUTzhSM1pVdE0xOVFnenhMeG8xRXFmWVU0Si9KbUxOb3BONXdn?=
 =?utf-8?B?V21vSXBjUGx5TlRmS25EbWxnMmppM0dEWDM2NHNQOFBZYUg0Qy9BNEJNWGpL?=
 =?utf-8?B?QjB3Y250M1IxaHJSS2ZNTjdseXA2WUUyelQrZ05kUVBjQXFYWlpZQ2lFMXJM?=
 =?utf-8?B?bHk2NWFMdTR2aWJDRFVwc1hLN0g4N1RlUENsK0xiejhWdmJRcWY0elpjMWpz?=
 =?utf-8?B?T3lKNlYzY2ZkbTRZcEZzUnU0QS9WRGpSQkYxQlhDOUZ2dnlJZkRBdDVhcVU0?=
 =?utf-8?B?bFViZGd3MEVyZ1NQcGVVZHExNTlqRGppSFpSYU5nMUxBdlNXZEpHSHFUR0xn?=
 =?utf-8?B?Q0I2KzF0cGc5Ykt4TGYxVzc2Y0ZuY3EvbjZXb29uelJNZUJnYUp0d1UvUEdO?=
 =?utf-8?B?N1BDeEs2ckJ6R0pMR0NMd2dFYjQzVVFnTnlMZjVLU1p2NFJ0RkorLzd3Q3pn?=
 =?utf-8?B?UUY3ekJFRThjMGVMUUVHTkl3eGYydWw0Q1Y4czZoVytHS3FnL2FabmdKQXFh?=
 =?utf-8?B?TzhvU1drOWhmWTgzL1JXazEydEgxMHkydTFHZm9tVVQ4YXJuOUhDSHdEcHMw?=
 =?utf-8?B?U1J0bS9GQ0JzeStYblBENWhCR1lSenNEdk1ST0F2Vm5uRjhHTFNJeEVLVUF0?=
 =?utf-8?B?OTYwOEIybFowcTJseDBudTlmR081Qm16RWsxUENVREw5UXBOMVo4Ymt2aGF0?=
 =?utf-8?B?dC9zTGZWTnlDNjRNS3ZTV2MxUU5GbmtadllERjZHakQ1WXE4MnFldUZPelpn?=
 =?utf-8?B?bENjYXlZZDduVk8wQWpzMHRmUEFLSGJIY3BqUDFjZ3AvUzJMd0I1Vm5HU1dS?=
 =?utf-8?B?SnBPaG1Ucm9qbmQxM2FvTlNEZmNnSXZ1QzVCMVh6UVBxd1JYb1ZsRWd6b0c2?=
 =?utf-8?B?SVl1WXRKV3FDRUtBKzJZWC9ROHVPWU9UNUNhK3lFQnJZbEtXQkw4bFp5bGFS?=
 =?utf-8?B?djN1cFhqMHhhSHZRK0lkcTNqZmVMbVA2UXo0VHVLSjRVNmhiMHlPUXAxUUU2?=
 =?utf-8?B?eEk0Q2tlakNJT0NUTlIrQnAxSU9SaDF0aEUzL2J5THhXK3NIZEtETk9GcVRG?=
 =?utf-8?B?bUpaWXczTGxMeVRIRDhTSGNSeVRWeVZFblRxYWhMZkpTR2pUOGx3Wjd0TUFS?=
 =?utf-8?B?ZHNycTZkTWpGT3d4djFEVktISndwcVRSU0NtbTB5bjloVEQ5cUdXUlpXVFZu?=
 =?utf-8?B?KzBUNC9VWmZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hhR054aE8valRna2dzMWhQQjJqbnM1QmtFZkZTQUlZSzFnSDNnTzljTHBx?=
 =?utf-8?B?NzhsV1Z0OE9tdVZVOUNGK0oycDVMcHZDM2Njd0g3bUJIWWdVczhQQUlabXBp?=
 =?utf-8?B?MVNwMTJRRmRINmpLVFcvRjJOKzZ1N2UvM2ZMaUJrV2t0WTUwMGp5UjR1VEZo?=
 =?utf-8?B?dmlHVWNTQlp5WjBpbGhmcld5VVhjd29JSGlYNnI2VUVEdTNyWjlQWWtkb2VZ?=
 =?utf-8?B?ekF2Z1ZObVhFdlhMUFU1K1duM2hhNTJ4VFVGeFlMNkJoQ1F5dDNRNDhZczI5?=
 =?utf-8?B?dktlTGhCeFNzdjVBRkZ6Z2RkUStDT3l3UW8xRldINURwUE4rK0NQMitvN3Zr?=
 =?utf-8?B?Vy8vYmlaeGg3emgyaHY4cUpGQ2ZuK2tjeHUyN01ibk9pQmw2RjVhamZXL2pt?=
 =?utf-8?B?NWoxbVQxaDBUVU1BcksyWERlZWt4NkJERG9yOWpxdXNDandHLzJsbVNuOXdv?=
 =?utf-8?B?Z2t6QTV3VFJMNGRuakM1UU0xNEpaNjdHcHBwZE5KZHFSaW9qT2h3VFozVTFP?=
 =?utf-8?B?M0tPSlNxbUVyZnF6YWpyQXpIVlpXL0s5T0RGRlh1ekQvYUdSUnF2NXIwZlUx?=
 =?utf-8?B?ck5RVHJPYmozVWwycVdjOUxJU0hIOWlYd1dMUyt3dElWVkl1aGJlUmRuWmhH?=
 =?utf-8?B?Um03OEd1ZFNiZmx1ZXcrVEZ0b0MzMW5Oall5THFhVWZIazFKKzBhRmVORVV1?=
 =?utf-8?B?VjhCZ3B3YVQ4ZWVZOG9vVStPY2V0Mi9JVHA2NjllekJERFJmUjJhb3VNTFJv?=
 =?utf-8?B?dkw0OFpjVEZwa1JSelVRbVdQdWNCZkVzVlFUSy92ZE1OYlpyemZIZFBxNEVU?=
 =?utf-8?B?T2huRlBTUXRUZjQxaXFvRmk3Sk0xS0x2N1pPR0NZcVhHVTdMSEYralpTTTBZ?=
 =?utf-8?B?SnhoM3A3NFdqdXdKeDF4UnhSdEorb3Vwc0VDckZra29wVzRhMHc2QXBTQlVo?=
 =?utf-8?B?ZHFIdFl2OGtaVGpUZEhidjJVZXNEK1BwYnlhMUNsQ0hzenVvYnZQdHRpL1lH?=
 =?utf-8?B?MkRGMzR2RlpYTHJZR2JJWmlNQTh1Z0xFVGhScUN3K05yTUNXNnUydjNUL0lB?=
 =?utf-8?B?T0d1VEErOHdjMUhRTUZFYi9KNDQ4S1ZkVU13SFp5ZkZNV3FTenR4SjVrWFJO?=
 =?utf-8?B?TEpLaXhXNDN5cHZDUHNrdU1xVDk1Rlg4TUEzckkybjMwVlZIOHJ4d2hXTHU4?=
 =?utf-8?B?blAwMmJJTk84YUU4NjV0NUEwNVJ4TVpzK3NNVlN4WVl1MFpQYW9wZkh0azF6?=
 =?utf-8?B?VmZuWjlWaTQwb0JzOHBRNnk3Vkx5bWExWXBxM2N6VUQ0TlJrV01UTjEwaVVC?=
 =?utf-8?B?VGVzaEZNdGQ3TFhPYTBBSWhPb0Q3SFNqN0VJMzdoT1hWRDBuQVNmTHpHaDlU?=
 =?utf-8?B?UCs1ZmU2NkJPbnJpc0xWc1VJU1JYbUcrNUFuSG44SFAvc2V6cndsMFhiRENP?=
 =?utf-8?B?MGlaNFhPQ3FSZXl5VDVxeFdQc0hVYnBOVXRwcGFJczJpak9ZZWM1ZW1vOXBv?=
 =?utf-8?B?Mk5BYlBhOWVDdDJuaWcrSUdHRklRYWN4ejdVNytuOHY0KzVNZDNabVBvQjlh?=
 =?utf-8?B?OVhxMXNyb1FTOTc4azlwZm5HdXhsR0pYeDFYUEV3RzBzVTRKMU4xU0hwYTlC?=
 =?utf-8?B?UTNXMGkvRUhUa2MwYXVrZERUeVdxUnNsRmo4eHhyVGRvYnEzSnQ2VkFYQlVi?=
 =?utf-8?B?bERiM0NGT1NJVWN0ZWtOTTQwb0hIbzFRcGFTM0hpTmh2SWhlTktmVnQvRWRo?=
 =?utf-8?B?YzUvVFVyTHBDOXVrR2M2K09pSXowSmlwdTc1VWVjY3BOVEZXbHFuaEc5L1c1?=
 =?utf-8?B?eHh1S1lLWCtjZkNLSXd4TFdHSHlBbWM1bUxzeGkzZ2pEV2NMUHBLYS9RV1g2?=
 =?utf-8?B?WDFkbnNRUmpNYUVNak1aVnltaDNKVzF6Vm1mNUw4bW85WXJ1ZWJWZXpRRDF3?=
 =?utf-8?B?SjBHSUZPclZmY0NLaEl0MEI5NHpYSWFlS0NRbmR5MlVRYmlMTm0ySmtaT0Jo?=
 =?utf-8?B?TmJ2VnpmeGtSVWFDWk9vcHhmdUJzdVNMWUhBdFl2NFRSdDJvWGI1U3Z2OGdI?=
 =?utf-8?B?TW1ZS3E0TWdCdkxlVWVHSTFpT3FUQWR4RGpTcU5ZVWpLaWhQQ2NwQTlld1J2?=
 =?utf-8?Q?512lTR4Q/Sshvs3vTYnEkM+tX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c33e0f-b154-4831-20fb-08dd763e8a28
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:53.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9KG3jXjeIsDXkTvY/djDweCBQLwmWkaLkWkM7+x9k/ayGxJOBriBNAmqGt0x/IYd3Sqmt3alrk7QjmUlQ6fbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10199

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value to configure output value.

While at here
 - reorder the included headers.
 - Drop sound/tpa6130a2-plat.h because no user is creating the device using
   platform data

Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
so all should work as expected with this patch.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |  1 -
 include/sound/tpa6130a2-plat.h | 17 -------------
 sound/soc/codecs/tpa6130a2.c   | 54 +++++++++++++-----------------------------
 3 files changed, 16 insertions(+), 56 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index de65f37966ef0accc3497e5f75eaf94399944a90..2a1a91e4707740edb59ce6712b66ed7196050720 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23881,7 +23881,6 @@ F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
-F:	include/sound/tpa6130a2-plat.h
 F:	sound/pci/hda/tas2781_hda_i2c.c
 F:	sound/soc/codecs/pcm1681.c
 F:	sound/soc/codecs/pcm1789*.*
diff --git a/include/sound/tpa6130a2-plat.h b/include/sound/tpa6130a2-plat.h
deleted file mode 100644
index a60930e36e93958c674e8e1f3ff0b39cd0be7677..0000000000000000000000000000000000000000
--- a/include/sound/tpa6130a2-plat.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TPA6130A2 driver platform header
- *
- * Copyright (C) Nokia Corporation
- *
- * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
- */
-
-#ifndef TPA6130A2_PLAT_H
-#define TPA6130A2_PLAT_H
-
-struct tpa6130a2_platform_data {
-	int power_gpio;
-};
-
-#endif
diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index b5472fa1bddab3d69b88c040ed561e8b5d9d1d0d..62c4cc7941114623fb33bd7d6727495b3d64a3ae 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -7,19 +7,17 @@
  * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
-#include <linux/module.h>
-#include <linux/errno.h>
 #include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <sound/tpa6130a2-plat.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/regmap.h>
 
 #include "tpa6130a2.h"
 
@@ -33,7 +31,7 @@ struct tpa6130a2_data {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *supply;
-	int power_gpio;
+	struct gpio_desc *power_gpio;
 	enum tpa_model id;
 };
 
@@ -49,8 +47,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			return ret;
 		}
 		/* Power on */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 1);
+		gpiod_set_value(data->power_gpio, 1);
 
 		/* Sync registers */
 		regcache_cache_only(data->regmap, false);
@@ -59,8 +56,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			dev_err(data->dev,
 				"Failed to sync registers: %d\n", ret);
 			regcache_cache_only(data->regmap, true);
-			if (data->power_gpio >= 0)
-				gpio_set_value(data->power_gpio, 0);
+			gpiod_set_value(data->power_gpio, 0);
 			ret2 = regulator_disable(data->supply);
 			if (ret2 != 0)
 				dev_err(data->dev,
@@ -76,8 +72,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 		regcache_cache_only(data->regmap, true);
 
 		/* Power off */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 0);
+		gpiod_set_value(data->power_gpio, 0);
 
 		ret = regulator_disable(data->supply);
 		if (ret != 0) {
@@ -209,18 +204,10 @@ static const struct regmap_config tpa6130a2_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static const struct i2c_device_id tpa6130a2_id[] = {
-	{ "tpa6130a2", TPA6130A2 },
-	{ "tpa6140a2", TPA6140A2 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tpa6130a2_id);
-
 static int tpa6130a2_probe(struct i2c_client *client)
 {
 	struct device *dev;
 	struct tpa6130a2_data *data;
-	struct tpa6130a2_platform_data *pdata = client->dev.platform_data;
 	struct device_node *np = client->dev.of_node;
 	const char *regulator;
 	unsigned int version;
@@ -238,10 +225,13 @@ static int tpa6130a2_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	if (pdata) {
-		data->power_gpio = pdata->power_gpio;
-	} else if (np) {
-		data->power_gpio = of_get_named_gpio(np, "power-gpio", 0);
+	if (np) {
+		data->power_gpio = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
+		if (IS_ERR(data->power_gpio)) {
+			return dev_err_probe(dev, PTR_ERR(data->power_gpio),
+					     "Failed to request power GPIO\n");
+		}
+		gpiod_set_consumer_name(data->power_gpio, "tpa6130a2 enable");
 	} else {
 		dev_err(dev, "Platform data not set\n");
 		dump_stack();
@@ -252,17 +242,6 @@ static int tpa6130a2_probe(struct i2c_client *client)
 
 	data->id = (uintptr_t)i2c_get_match_data(client);
 
-	if (data->power_gpio >= 0) {
-		ret = devm_gpio_request(dev, data->power_gpio,
-					"tpa6130a2 enable");
-		if (ret < 0) {
-			dev_err(dev, "Failed to request power GPIO (%d)\n",
-				data->power_gpio);
-			return ret;
-		}
-		gpio_direction_output(data->power_gpio, 0);
-	}
-
 	switch (data->id) {
 	default:
 		dev_warn(dev, "Unknown TPA model (%d). Assuming 6130A2\n",
@@ -318,7 +297,6 @@ static struct i2c_driver tpa6130a2_i2c_driver = {
 		.of_match_table = of_match_ptr(tpa6130a2_of_match),
 	},
 	.probe = tpa6130a2_probe,
-	.id_table = tpa6130a2_id,
 };
 
 module_i2c_driver(tpa6130a2_i2c_driver);

-- 
2.37.1


