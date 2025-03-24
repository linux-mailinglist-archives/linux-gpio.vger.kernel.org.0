Return-Path: <linux-gpio+bounces-17914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028DA6D999
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 12:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6214C1889ADC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 11:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5DF25F798;
	Mon, 24 Mar 2025 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IFNzURFH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2058.outbound.protection.outlook.com [40.107.103.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9D25EFA2;
	Mon, 24 Mar 2025 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817169; cv=fail; b=sz55Nb+RPmnL09DjdR59r7YOBsl5hTzWzMeRQD+33SxddUUcPydiaB34sbSGLPwCxqzSPsdDdqT7SKyu6XbXKwtAA9i5aECL9A1WlY7cfIe7gMpxV+FxnwzHQw6jzAd8pO3BakTIRxbxOXHHWA2qxaZMnq8CT67S5DFC6W1kBG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817169; c=relaxed/simple;
	bh=8lqloYOCi2lS15i/mVpCiuhpzEslgQDTnHHBRmj9IGU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KPzIXxB1nRTrV/jyGU3eCaTmDWdMt8eUjImGPRkuNrsxR0AvNUKklmnNLYaiO9upvLJOqxch3cmzeWC1IyENSAijVnCEjblbdFZF123eUUPupMS6lNhT/TqXASLB4407u4Sq6MQ+nvhwKyVc8jK6k07SEarDdpB12wPulIO6ABA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IFNzURFH; arc=fail smtp.client-ip=40.107.103.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq5dIgb1B2tOS5ylAfB9dGV4rLDtsaVzljrCwDe32voKRhqkj5AimGpR8Q2X60n6h7sCnrPicRoGePHZQP6JBsa8cfz4kzGKTpPpwcR40c7gUM3+AVz1wTsfGirvcZz8YsIgk0FQSKj+M1idfmtY6Gbx212HeCyeFGX5NY/JYAeqcEAcgHzwrKuBh4+nsSpRV03RGVPLVXgqNWM1PUuqv54VWTJRuKLBNUdMmJl8V9/bMLFsJ/f4vZ7AzYQM2ZWb+ctal7HwZOEvVxZkQ3ULYTSRrXaHGt35+Gmd7ho2G+cOCg3ti4Od/Aqe/4FFMoHmTMyHxbaiQpcmbp9N/kulPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS+KFdX/62KQA61insdOu5dnTsYuS2Hy6x2nmZkHz+s=;
 b=QDkC9xx6DhULmC+F3nJhU8NQ/OH8DYXe+M+mNscm1EHIZe4RU5YBRw/fyXzLl1Uqb2Xv+rAcWeWvF7ZJMaAa3GU0JY7ZpCMNsWWYPba7+w3GmCg/PdfnVsG8XVFKGpB8wUaX5SfHAba+hzF6VWXHoAzxmuk3N+HDpg7Q/1tW+b3Y79zk/z8LnPza5WcAStDwU3n627f7JVoCjfeR8GhHcttrqT9/jOo4wnzShLpNZINMQEmizEilNUH50QfIHN6Fs6et7NY85rB47dvk3kO25L22Ux5b8UjPufSZJ2ekdgmOy0oHYV22MnCq5QxHyVn2u0DytarIdb/Cj82V/nYGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS+KFdX/62KQA61insdOu5dnTsYuS2Hy6x2nmZkHz+s=;
 b=IFNzURFHO9lPiMNT73bXuYzoqVeiBXGx9ItIbVM8Y4t5BVn2KWkzk2CmBNru8x8Q6Gl3EU3yTxa3Wmn3AUygCrJVG+4wJZGc2qpQo2o00mXgeZtBSyeKXhwZAccZZyGGw+yqpMLEXiypWNHYcdRyKRE0QF2k9h5DkXEfcfzxES0kOYMvmCyqMabgrcOyatRdzbU16RW2H++XK5qRK3dyb1JWH7LKa4buhtjdTa6WW7SjdzI9297Xg0wp/AZIaIlA4ENGFLtVdVw28N2Hn8OeRVBHZLTx2oSnFmIRDtKVXVOXhjn2XpeNj84DlSOk367hJbWBQBE0tb4q59n0XKyNOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:52:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:52:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 19:51:29 +0800
Subject: [PATCH v2 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v2-3-773f67ce3b56@nxp.com>
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, Johan Hovold <johan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742817094; l=2514;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4mUyoIQOgr7LboU+OHDfVwrt16rnj5LwQLXfpKlgYHY=;
 b=zY9CbRM1ubURRwHAnynCEUrP6uTcXu1lbsA7IlzHvLVI4Zy0njFoGFWYPK48dARNcwCrWGlK0
 qzQ0pBFKYFuDZ0j5uw+GTbH+5ovc+oXvvdQF6qfCpQiYeYBXGXir/4c
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: f62432f0-2ab2-4f7a-e28a-08dd6aca63ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTQrZThiWE81aXFDeG5CNFBOSnJ1VGNmMS9PNk9ZNTNTV000N1hhcmhyZGNj?=
 =?utf-8?B?bWdJV3NIeFl4c1JNQ2Yyd2lodEFlQXZCWXZKTGtkRjd3YnFEWWtJKzRRdjNr?=
 =?utf-8?B?KzgrSXI4TElNcW9mbnFyU01ocUlISzF0emxsZG1TRWRYTVNrYjZkbkFocURS?=
 =?utf-8?B?RnhENVczdjIwU2FyVzdaUlJ2MDZSTUlSWm9BNnBBb1FDVTk4NXdVYUJlWktK?=
 =?utf-8?B?dXBwYXFHeDNhTld1NDNLNldPYmh6MzhOYm1xYUI5elA1ODNRZHJjS3BFVml1?=
 =?utf-8?B?OGhJYWpmZ1lQenVUQVh5WFZvUWlkSjR1MndsWXhleExvdXpGZ0lqM3R2b0hn?=
 =?utf-8?B?RTdBNnRUMW1lYjZ5ck8ydlpyNVRJWmZHVFI3Ym1UWEhETStWbEMvUVhvVTJy?=
 =?utf-8?B?OWxBVko3eE9Jd1FveStqSnpSbUdyVko2emRkQUxtRjlOWnFJaStsWHFVUlU1?=
 =?utf-8?B?am9HbS9BS0hlK3ZYM2o2WXB5c3hkTVRObGN3bFZWQnpUNWM2M3JSc0d3RG1F?=
 =?utf-8?B?Q2d6cUFsTXMxVWxXdDJBclNXTzBlLzlTMHpaLzlPcDBuNERnT3ZjWWJQL1Bp?=
 =?utf-8?B?WDhELzFuTTBUNE1oc0tLWmRxemJSd1dobmlEaDMrVlg3ZVRnbnhwMThtd3Qr?=
 =?utf-8?B?alhKNGNlRStaVDJ1Qis0QzZhRzJCMWV2a0RsaUJiSitrMVVQaGpLbGZVRDJl?=
 =?utf-8?B?OC81Q1cvZVpKaUpiRTVzQlFUb1U5N2NKV3lQNEl0bHFZRWpyZktOY1VxaXFz?=
 =?utf-8?B?Q1VJMS95RnNZRG5RaU4xYThqY0p2VmdRdHVNbGhIZE1RbmZuVVRNTFpIWmZD?=
 =?utf-8?B?MkIwSkR1MmEzNFNnU2xEdW9mNXdLS0tsNk1VYThKZGpzOHQ1T2x5SXo2bkpM?=
 =?utf-8?B?RUxZRm02L1RHc3ZvQ1MyQW40VzJnbk1wRGw1bzcrbVNMS2g3bXk5eitNalB6?=
 =?utf-8?B?dkYyVVh3NnFlV3dFVi8yQ0VuZG9HcU42WE01WHBzZnlhR2ZNeStBcVZlYy9R?=
 =?utf-8?B?ejdBTmRQdmFlRXRMMmVTdmkvSzdEZ1A4V3pBSDRiMWtDenNZOFpzN2M4UjZP?=
 =?utf-8?B?Z2o0WE1LaUZocktUKzR3eFFzVEQ5bGVsVUlKRkZ0RTUwUjdPZUdIOVJRMVdw?=
 =?utf-8?B?SDlaVTcwREF2N1JTWGxLZ1VnMGsyZXdhd3BOemx3TXY2QjMzNDlMWDRKY21S?=
 =?utf-8?B?TnlvV25KNm0vcUVEbVJ4M05RVHgrREd5d21DNDdlK0U5VWx3VEhOV1NiUGg3?=
 =?utf-8?B?LzhRRzJNdDFaNURyVDZYU1k3ZkVsUkEzL3JCOXJlbGk3QURkUENYeTZWMUtD?=
 =?utf-8?B?eGRDQjRTOEl2YjlDcjhFMTBTTkpUMS8rU2RaL1hzbHFFYWc2NGZpTnJ1UUk3?=
 =?utf-8?B?eDZpL0dsU0NDam1EeVFBL3QxMzlQTUxieWYrMEI5WTZkSGNhQStJNmRDbUxW?=
 =?utf-8?B?VjF3ZVNWNDRjanRyYm9TR1RtcU1oOVkxUml1Wm1TcmpMcWUxd1BHcTZUZ2lD?=
 =?utf-8?B?RGFVM3dQTjBYVUpMN1VXK2tiSkozQWhyWFZvK3MreGRyNzFiakZnMTd4ZXpP?=
 =?utf-8?B?Ykh6c3BTNENLNFo2c2FEUUNqV3h0NEllbUhNU0VKd3Z1aTlCN0cvbWZ1RW1l?=
 =?utf-8?B?NkNvc2RhVnpCajFiWnlTalVUMmVMcC9mT3pyd0lSYzZUYVpHWkFLMW1BZWpH?=
 =?utf-8?B?WEdZbld1eVZoY3d0OFRQSythbGVYWkZjMkNFNE4vY3R6cFpoOW9abFBaNHVJ?=
 =?utf-8?B?U2pidjJPdURzMHgwSjNhR1ZhMWxTZ1UwbzRqanhyU1JUUzlRRlRVQ2NRMjBY?=
 =?utf-8?B?Smh2OWtXSkFHSE9TVVpIMWhIK0xmSHM2WGxFS1JIZkNIdE12K3ZaS0lpOHRE?=
 =?utf-8?B?REFsdzRsY3M2NWtpKzIyR202cWFMelI0UFpCMndQUUptZ042OUo5bnJIbVRk?=
 =?utf-8?Q?pblKFyUdjqp+3UqOdYOEp6/oONJZGPAM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My9QTGF6dGtzdThESkYzcTIwdVNibkZlamRlTy9qdHRlOGR0NU5XbC8zZVRG?=
 =?utf-8?B?R1R0S3BUNU5oc2hFRHBVc1ZFTHdzaHRURStRdXE2RVlTbmoveU5mSDdGNllj?=
 =?utf-8?B?S0dqdERKM1dTeTBjN2xBdGwvOTV6M1J4UUxjK0wrbHQ4YktmeklhaXVSYnpX?=
 =?utf-8?B?bG11RGpsa2w2QTFibTlkakRHdG5WcVZweEljWXA0MDZKdTQrOVFCbGRSWHJv?=
 =?utf-8?B?TG1oSnRGZm51cWFPaDFGTlNFZmFIblJxMjlWZ0dKRkloUXFWazZsVk1TeVhM?=
 =?utf-8?B?WTNJaFdXdE1VN3VFM3BGQ0xJd3gxaG5PZm9JZDhZM0lnNCtNaGhGblFMTm4y?=
 =?utf-8?B?OHV2SDhkTmtHTjY2NXVobG9ucjVJRFh3eFRSckRGakhhZVh5dVZQbXZIT3VG?=
 =?utf-8?B?clc2QWtER1FOaGhGeFRYZ3FuVHZLMDE4eXhhWEtLcnNHQmlJaWhWQUd5dzdY?=
 =?utf-8?B?TW1BczVERUg4cDI0WG05anlOMnl0eEhkOVV0Y0thbldqSkZaZWx5MjRwRVc0?=
 =?utf-8?B?eXZDQXZMUElQMWZvaGVoYTRCVHc0REo0MFp0MkpsOGg2Y2IzS3Q2WGlZUGIz?=
 =?utf-8?B?UFBObHU4SFRzbjhpZ0d3TUpyQk9aVE1mQmNUbXZ1VjhqUTlMaldVcmV4VGxE?=
 =?utf-8?B?Nm41RVhjWTFtQndCb21DUkpISnExRlFPN3ZVdEFsczBsaVdrcFIra1pLemJr?=
 =?utf-8?B?a2h3MVR0clBCNWIzTUdiRWpjd1o0TnN1bHNwQjFCL0t5UjZ1YW5EajhwQklG?=
 =?utf-8?B?VlJ4czJSU3k4eDIrVTBteDJWS2YrNFpqb0pxWFlIZ0ZEajhqMGhMVWZLR3RW?=
 =?utf-8?B?Yk14MFM5VVFxdDJVSnNpczdMcmVDNlFyb0Rtb2tqYnducmtBR28vaTBJMEYw?=
 =?utf-8?B?YmxyQ1I2bldheEhFU2UzVFFnd0RTT2dBbG1jemFJNUNxN1BISGVveW9hYmpl?=
 =?utf-8?B?d1NMQnZGSlRQODZiMzVoZWt2T1RiUkpSODZmWmFrbmR5ejJiNGs1Zmhjc1oy?=
 =?utf-8?B?OHdBYlk3bkZqbDVYM0VvNWNyZGlkdzYwQ1UxY0JIdWpHVmFxZHVpY1lPVGh2?=
 =?utf-8?B?cWpuR3J4aUVqb1A2YkF1VkYyK3R6S1FhYXdZSnhVUlVhd0NOQVRIL3RzMDlK?=
 =?utf-8?B?QXpaN2svYlUwRzZCWHY1S3dFWi9ZTzlLQm0zVW53K3Y5R21aOGdDQXM1Q1hj?=
 =?utf-8?B?QUdFenhIZE1yZGNHUmFUUHJQM1Y2YkJqaTNaT1JFdDRSbjVieFhoVTJWQ29I?=
 =?utf-8?B?Qy9GY3J0T1RtZVR5bm8xemE2TXZMSDZ5RVNVY1E3cEU0UUdCMVpnT2RrWWJ6?=
 =?utf-8?B?NDZnUTVmeDRPaHVTcFFqcFBwVG81ck5Ta0lsRC9FVVB4QzFVN1p4Vmh3ZFhK?=
 =?utf-8?B?cDIxa3orSUpNeHZoRXlIVHBqeGNVdnBwb3dvdVpCSGJvUU4xQ2NRRWd0cW9h?=
 =?utf-8?B?dmJUN0EvOGlTVmNOdUJWNjdqemRjSTFLUmJnU3pneEVZclRaU3pCNFJIb285?=
 =?utf-8?B?TWsrVlpvL0xMd1l2N1lXQzFXTEVUNG80UkdTZ3RkTmpkOW4zTVA1TnR6aE9l?=
 =?utf-8?B?by9ReE5YTVVyV1pkNjFzVFU0b3BQU1NMajh2SXRicm9zb0c2VzhtR3RJRGdw?=
 =?utf-8?B?N0d5R2J2VmdMWWszTEVYNExxNCs0ZlNQYVJyeENxYytKUnpKRlMybW5KcGcr?=
 =?utf-8?B?WC9MRGlzejJKRGtNNTB3ZDFQQm43YWZnSlk3WFg0YWlzOVBMNmIwd3JSQTlD?=
 =?utf-8?B?eGJZSm1zRXNSOUtzdVRiUnU2SjQ5SnVZNkNaQ3IwZGIzcStKaVZyY21Mcnp4?=
 =?utf-8?B?NVBiUUVpdTlUVEFWQWlGTFhlS1YrRzA4NlRGcll5eGVNdUVqYUcxUEdsRFo4?=
 =?utf-8?B?a0hOK0U1S0FBNWhCTDJRam96b2VEalBlWW43TWJBWXlTSFJvUVRVUkVTVFNS?=
 =?utf-8?B?SXQvUnZOQWVQUENYcUNBRG5CdXRPWHdxbzY0TGhvV2JYRDA3UlBpWCs5eHBv?=
 =?utf-8?B?N3JsNVd6eXgrMksvcWZyd0tVaVBIZXd1bjRPREJ4ZVRERzBMRXN5ZEVGQVFl?=
 =?utf-8?B?TUIyTThKeTNmRU5DWGFSNHFXZ0ludUM2RlpRYWkvZ3RpVHM0Y05zY2dQSzY3?=
 =?utf-8?Q?NhjbvEp1jAIghzmJGscXlH4d/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62432f0-2ab2-4f7a-e28a-08dd6aca63ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:52:44.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSChFngBnEma947wTlhZRLQaOihsUiYIHIzmTVOfFFd/tuToE7AcqSA6cW4AuNtudfoTqSAvIMJwjE7uXHuQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
- Use dev_gpiod_get to get GPIO descriptor.
- Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

The in-tree DTS files have the right polarity set up already so we can
expect this to "just work"

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd9335.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 7cef43bb2a8800971604b0e1ac55aac26c5919bd..8ee4360aff9293178e338e3ef300c37f6f2ac809 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -17,7 +17,7 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <sound/tlv.h>
@@ -331,7 +331,7 @@ struct wcd9335_codec {
 	int comp_enabled[COMPANDER_MAX];
 
 	int intr1;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
 
 	unsigned int rx_port_value[WCD9335_RX_MAX];
@@ -4975,12 +4975,11 @@ static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
 {
 	struct device *dev = wcd->dev;
-	struct device_node *np = dev->of_node;
 	int ret;
 
-	wcd->reset_gpio = of_get_named_gpio(np,	"reset-gpios", 0);
-	if (wcd->reset_gpio < 0)
-		return dev_err_probe(dev, wcd->reset_gpio, "Reset GPIO missing from DT\n");
+	wcd->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd->reset_gpio), "Reset GPIO missing from DT\n");
 
 	wcd->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(wcd->mclk))
@@ -5023,9 +5022,9 @@ static int wcd9335_power_on_reset(struct wcd9335_codec *wcd)
 	 */
 	usleep_range(600, 650);
 
-	gpio_direction_output(wcd->reset_gpio, 0);
+	gpiod_set_value(wcd->reset_gpio, 1);
 	msleep(20);
-	gpio_set_value(wcd->reset_gpio, 1);
+	gpiod_set_value(wcd->reset_gpio, 0);
 	msleep(20);
 
 	return 0;

-- 
2.37.1


