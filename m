Return-Path: <linux-gpio+bounces-13311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A574D9DA48F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 10:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A15B165DBC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 09:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAB61922C0;
	Wed, 27 Nov 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="BHqAPc3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433A188A0D;
	Wed, 27 Nov 2024 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698839; cv=fail; b=AezqLTkl+NKrcvEo3KNrIoxRkpvcJQ7Oh3QCzLIfCMTbyh4jsD5y2ZECHx/jRlKdeih2Ro9kY09aOxmjFsbtO2+HnIVtu3o4nI2TR1Uje2nsZhnD2puiDlgo+rBvpDZ0jr76oksGhRjkEsbFs/HpsxLkWbADMEkwuixX0QSXEio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698839; c=relaxed/simple;
	bh=62nW26H23QzoQMqKaSPkHIhTR1h4Xn0TcwVX63Fq++s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=pqdFezrhyAvdx/0jKM8F97aR0WGTQcszpsCCpX5hXSeckDRj0fd7jogI6eSS4Flw67O4ND/Ij8xn74eWTZbkC4FtYAb1zZ64mAavSSxBU26vRpMrjSgHYLc6NfX7U0E19h1/CMo3EIurpKbl5TFi62vFVxKiDVMmTKYDAKr0R3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=BHqAPc3F; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izsyBHy298r7YTJAOmmrTv5VGou5xMiwRDj7vITEgxTRwvtxCx8WM1Q99CTcOUZ35O1/R6mAThbpSpvOEtS2jXu04z1PIr2He33pAJCGzuUv+20AQX6edTl41VBPrbaKoIQzK/XJQSm4m+RO0CGmGWlbnNyJXCkoSX7t+y0o7nnXsDXLw/60FNuv/sd8HKv+bSP1MoHFynosE7LQXhkB4sScchncrm8wRBhrGrG7gCp107I5TzXQHZdLFVDFWYNavPYMqODf/T4paZZZe/nBXAFJfecfJMP9t6rqN51EV/kyqWIm6Iu/zvUw0H6ZPY5JfSnodY2IoY4B3BLFpnkZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m+x5pYWNUjNFv+tONxWQhfJukL0w1G5wcR4Rv/5vz0=;
 b=MeH3GBB+ARRQ8PrGw3dSdXatK+6kfVc0nzB/aD4sZCGnf52Nz5m6Lxh72XKnRTilMMPVv/Azagw+bTTfFHM/6s+7H0h/1TLIBavGmosRQKB1a2D5REs4nZekzvFv6ccBAimrz8tgOWi+RXBA9vlAQSA+XMNdCuRPJ3AB6X+gqHNyVoPORstCBjfPAWG5dVTCUPEv1UtCyaCNwyF/OX/IEu8MTGUksf1zJ5u48NIEDVRWbGVkSfyPUWDW9DGCHhKcB7jDjuI6J5oFR9Y2rIfOfGj9nObekeDdWYJLk2EGxUVZzhab6p6D8tCsNfQrcmbhZXYg7UaXe4EPqh4OVeoLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9m+x5pYWNUjNFv+tONxWQhfJukL0w1G5wcR4Rv/5vz0=;
 b=BHqAPc3Fs0ClqX9yucKZgpZrZlXIS11mGL9d5kwnpXulMsMuR/d7Cu1PJpIPjj62YGdLpw/sDtinGcAiziNAtjJXQ2bFBbi3D2lOlnzlqOReqx10mgxBDe9QklWuG370YI1MUbMnqY6pyjcGUFs/F93uGLPtz72Qle0YFwsoyo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by VI0PR10MB9155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 09:13:51 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 09:13:51 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Fabio Estevam <festevam@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,  Linus Walleij
 <linus.walleij@linaro.org>,  Esben Haabendal <esben@geanix.com>,  Russell
 King <linux@armlinux.org.uk>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Dong Aisheng <aisheng.dong@nxp.com>,  Jacky Bai
 <ping.bai@nxp.com>,  Arnd Bergmann <arnd@arndb.de>,
  linux-arm-kernel@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Fabio Estevam
 <festevam@denx.de>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
In-Reply-To: <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
	(Fabio Estevam's message of "Tue, 26 Nov 2024 21:12:58 -0300")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
	<49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
	<CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
	<1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
	<CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Date: Wed, 27 Nov 2024 10:13:49 +0100
Message-ID: <87ttbthwdu.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::19) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|VI0PR10MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e80139-1a18-4e36-17d4-08dd0ec3cf15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGhjWWNDNGxxTmNiYTNOTXNhaTY4SFl6Nk8xYXZsYTVTRFIzYmxxczVvSUxC?=
 =?utf-8?B?Zmc3Y3pZaUgyd1dyVnVucStiQ2tXSXNOTkZzRmdraEoyanBBTDRGVG9rNGxE?=
 =?utf-8?B?R2FQTEhTOGtEN3p2U1pYamxiaC94RmJodEcybTh0aFpTR0FIMnU5UGpYLzhC?=
 =?utf-8?B?MHBYZFg1cVFFMHFsbmJpc0ZhMkRCWDBxR3RvNFRVMVJ1VDhFREV1TURRWFFN?=
 =?utf-8?B?bjNrSHBXSGFIV09DcGQrVWhXTWtTczBadjFuL0JLTi9CWk94UU41QmNVd3VP?=
 =?utf-8?B?NGoyaWxtckF3Y0lTSGt3eXN2eXBwY2RZTnI3T2c3TnkrUFppNVh0TFcvQ2E3?=
 =?utf-8?B?K21wS2UyQXY2ZHlpMlE0dytkV0x6UGdXcml3ZVFnL0sxSHlBMnluWlRhUGlH?=
 =?utf-8?B?R3BlRDdIQVQxTzhIcE1IT2tKYUt6SlVYenN6NXB5RlYxS3pkUmJvUElqVnY1?=
 =?utf-8?B?NXFUd1I5VnpUcUxOQUhrV0kwQ2VMMGMrNDJwOThUU05URnNDM2tQVHE2S2Uy?=
 =?utf-8?B?VlJLRHU0QWhDOVJwUlpCYnF6TDdHaVJ0R2RXcFc4L1owTDFPN3pRbWk5NFNE?=
 =?utf-8?B?WDV2VENXQmpzWS9XZm1Qa2xmcFNUcUtZSXRxQkhzRGhlSTNxUG4wTXM1OEMr?=
 =?utf-8?B?RTZ4ZDNhT05yWG91ejByZ1JEU3B1TmRmTzRqUHBHMkdPVHA2Vk8yZjgxbmFo?=
 =?utf-8?B?OWQ1cnB6TlhHSmdZT3p5dmF5NmdIdHJlTTBTV1RqYzZPdTBIbzZiaDFQaE1a?=
 =?utf-8?B?bzBTN3lLUDFzdFNxV3I4akY1cG9scENURzYvZkhkN3ZTeFlScnRSbHFWWUdq?=
 =?utf-8?B?NEpoaGhCRjA5NVp1TUJLYkUrWFpRRXZHTzFDcmhBQ0o3d0ZTbjl1b0lmOVRq?=
 =?utf-8?B?Q1hhRTZpdHRwa252c3Era2IwWXFmYThWdExNK09wNWdkbWtLRXBIM0RiRVgy?=
 =?utf-8?B?cUxjWUFYZkQrNW9YNTZicG9BYUd2S3VtTWNDQkNlZCtxN2taSXc4TzV3dUFk?=
 =?utf-8?B?OXVDTTdSU0NrN0NlRGw3MFpvR1JnUjVxWnpqS1VHM3BZT0NySFBsNXhXTGhq?=
 =?utf-8?B?OE0zN3V5anh6ZE9vNUNzU1E3WHY0aU16c0dIV0p5MTllNDRPblkvWUZMdG45?=
 =?utf-8?B?dXNGbU9GOXNKSjJ0UUx1L1ZiZzFjYlFSdHlYajJZcTRSeGlJUWhZRjFxb2M1?=
 =?utf-8?B?RmdKMHhQOUh5OGUvaktDWlp5MkNlQ0JYVjM4blpMU3dyWFJNUHJBSzVwZlRM?=
 =?utf-8?B?Y29aeXJLQ0JhZmtoNGRaMDlQUjNjWEFIc2VaeDdaZVNuTDJKRW1aSWFIMUVE?=
 =?utf-8?B?dDd6VlVndnJyckJHZUxPek5yVGcrbEtOZVRqNCt5alAyQnBFSTVyT1ppVmxy?=
 =?utf-8?B?SlpjT1RhK3NZNzRwK0hRcG5WS1RxVFMvSytJYkNFVHJXTEMvS0F5TXo0M2d3?=
 =?utf-8?B?UzVRTW9zcENoOVBHRnpmZGVpR016Mnk3dnM3T1hCSzQwNGk5OGE3cFZhS213?=
 =?utf-8?B?bVBadUMvR1BoZDNkK1Q2Rks3bnd0M1pJdWM1anFHTmVJT3czSmE1MnB2K2Fp?=
 =?utf-8?B?bEoxUHNPUEFORjlac245d2l6eXI5dlc0dW5qV0x3K1Z3cWJtN1FBUWJreDk0?=
 =?utf-8?B?VVYzOVFHV1U3T01pSFdSazFjWjd5THhTdEQwVTA1T0ZCSHFORWd0QUVFTDVW?=
 =?utf-8?B?WnFGZHJESmMrQmlsdXBPUUFKZWtlanJzVlZ4ZGFTNU9abVo1b2dEUUhYU2wx?=
 =?utf-8?B?MUtwNmhPQUphb3NtcC9McTRJN3JKZFA2alo2c3hGam51WUxZelJjaFloNC9y?=
 =?utf-8?B?a2UrRTFaa1cxSzdnZDJ1MFlCV25QQUlFOVZBSTdORW9Zd3VqZjNKT3J5K09w?=
 =?utf-8?B?NTRNbnRTY2ZiK1lxdXR0KzJSblZtZ3lETWs2R3R3ZHFzUXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdaTW0yWGNKZVQzYTVVSkp6ZEV2OFBXWVdHRVQ0bklVWUs4bnoyT2ozWHBP?=
 =?utf-8?B?K2c0c2k0L3N5d1dNRFhSVDg4WmQ1cDA5dkFzRlU2eUJJN0Y1NnFyNWpLR1N6?=
 =?utf-8?B?V3VEZVBncFlhV3ZCK0YyTHZ0Z0VwUytVMG4zTGxGdzBHRGYxdk1jYXV5K0Zi?=
 =?utf-8?B?M2t6cFIrS1crc1RZQmh6dHpheWFtdTFuaTVoaGFsRFlHbUtjWmFJaHJjbUxm?=
 =?utf-8?B?UFlVekUvTndzV0VjN2VHYkFCeDB0VnowOW1jTFVwRkhuMEswS082eDNCV1R4?=
 =?utf-8?B?dnExS25SVnBManFUZjVwMysyUmZ6bTRJRjhNUzRHd3o0SjBzRzNYdVBHc0VP?=
 =?utf-8?B?US9VT0VpQ0k2bDNUc21nczhmc1Rtcjd3TkczelFUM3VxeFA5WG5QYTVjcGd4?=
 =?utf-8?B?b3ZTcEJvZURGbG9jRDgvZjdOQzFEQ2xqTFpwWGZwUmhGZm50d3lyQ2VlUFNU?=
 =?utf-8?B?Vksyc3czTHQ3YWZsSmdDUUlqQW1kcEVrRXh5RzhQQ3k5akx5VnRYM0VoSjVP?=
 =?utf-8?B?NXU5ME9wWnhjaEx6RnQxNW9XVktDbUZteDBKWE1xMVF2NVY1L0J3cDV4TDZr?=
 =?utf-8?B?N1l3VDRkZ0Z2bndhN1hGMW04M2Z4MnYzWkUxbkRQcExKMVRxbmlFRVRUWUQ1?=
 =?utf-8?B?SWM1WWVCa3JPTHN5MS9QSEcxTkMwUUU0eU5sQ2dHVERtQi9pMGxKK1FQdFI1?=
 =?utf-8?B?a3BTdUZGdkhWVGlxZXFkdTA3TG9JUVdLbjFhS2dWS3YxZmxMQnJISFlQS3py?=
 =?utf-8?B?YzRSVk9hSmtNRlBMSW0xeE9vQVovVDB4RzBhNkxYZ0Mzb2lRWXd5SzhwU1FK?=
 =?utf-8?B?VzhQeFFiN0QyQUlsZzI3Mmt4aERhdWo2N1o1MUs3L3AvNEh2M3RHbVRQV29v?=
 =?utf-8?B?Vm5CWG1sTlRwbE9lTzh3RExsNmVPS2c1dlg2bzB0SUtvNVJCaFVKbDlBaitU?=
 =?utf-8?B?NERmb0psbTNXT0JCV283bm9zNGU2Rk9hNTNKY0EwSXE2ZnJFNnZkbGxwazZ2?=
 =?utf-8?B?S2dQYlArUnBwMUJvYzNKY2lqRzd1Z0pLcTk3NkNvekM5ajl6NHhVZ2FUTGtu?=
 =?utf-8?B?aHluV09wbXdobk9rM29TYXNnUzV5Sm11SzEwSFhEWVhqM1V2cm52UVRLMVRZ?=
 =?utf-8?B?OTdERk03MlZUdXZLLzM4cDhpSm1SOHlVSVRYM0tkTDZ3N3hPQzU1NHk2UXJz?=
 =?utf-8?B?Mnl2SjhvTXdKT0VhMVlXSkhiS25DYXF1cHNjZGhjWExWZVF1ZUh2cHNnY3pV?=
 =?utf-8?B?TTRBZ20zNlk5dnZjM0RXZTRSS3RIL01wUENkUzNXQ0NjdER5OTFhOE5KSXg2?=
 =?utf-8?B?SEpEWm45NnozRmZUdkIwZ1NkNXNpWGNIRHZ3VHNnTGQvS0VxeHFJbjNmWE5R?=
 =?utf-8?B?SXR2Nkp4dTN3MFdhMmtJVjFMOG9abmZ4QVVBeU9QRVFHeFhIWkdMeG9MUzkr?=
 =?utf-8?B?RitQa2ZKTTUrL0ErYmdYQzlkdjRWV296czA3djRMU0IrZ1NCbUJ0NFVsQ2J5?=
 =?utf-8?B?NnRBZGZCL3ZxY1h1VUxjM3FKKzdTY3lEZFhoekpqN2xUZHF4aDdCc2pIZkZR?=
 =?utf-8?B?UWFhcXVQTHppZEhSbnJtN0NveEhjWWpiVlFqZnl5Mzc5WXBLbndnTEpXV0s0?=
 =?utf-8?B?WUxsYldXbFVSUkVza3Fkbm4rdWRrMmtCdGkvMDduQnprVWVxNnV3YzNCMzQy?=
 =?utf-8?B?YnROL0hweFhCT1BkMEdpMmIzYW5jYjJpMlZ0SWRHaVR2dGRCWncwL0t1amky?=
 =?utf-8?B?RENPMmNHQm5pc1UzRU1OOGFwTC9TY3FBeWlaRDRURzdlVm8xUTBvcStGZlJB?=
 =?utf-8?B?Y2hpY3NPUklwaUFHcWlNUXhyQzdjcitjc3REMnNFanNEKzdGNTdMQzdqTXhX?=
 =?utf-8?B?Qmh5ZGsyTG4zbmgrRWIvdlZTL1BiVWFBZjhIK2NwZDZjUC9oZm1OUmYwbGY2?=
 =?utf-8?B?eWJsS1ZXYzg0RlJVc1liak9CSVYydjluR3RMU0Y1NFpVaWx2NUVEUlFXbEFH?=
 =?utf-8?B?MjBRaEpLVGlHdXJHUnB4QjdLdmxvR0FoZ3d6bG9ydlFVQkhYdmJjMVhpdW9i?=
 =?utf-8?B?VEZTRWVmZU5Vc0ZpcEg3Zmk0dnhMRGlYR2MwekhlQVFOWWl6NE5VSFRCMito?=
 =?utf-8?B?c2N0Yi8vS01IY09oVEdYNTEzajRXaDBkTURUR1hPdzNkaERoWlZialQ4YXBl?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e80139-1a18-4e36-17d4-08dd0ec3cf15
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 09:13:51.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxxwc10qJz2NrDIIK3qI7KKJRZFpCkc2wBGlVOt5u0bt0BWYRNfe95AeD2PtyE1aGtCA4IKpRgqRB+KymqfzAqgvHmmbrjXKhn7s7xN5Lj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9155

On Tue, Nov 26 2024, Fabio Estevam <festevam@gmail.com> wrote:

> On Tue, Nov 26, 2024 at 8:53=E2=80=AFPM Guenter Roeck <linux@roeck-us.net=
> wrote:
>
>> My understanding (which may be wrong) is that being able to disable
>> PINCTRL was the whole point of the patch.
>
> Exactly.
>
> Adding back the "select PINCTRL" line defeats the purpose of the patch
> in Subject.
>

Yup.

>> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
>> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
>> problem for good - I see CONFIG_ARCH_MXC in other configurations as
>> well.
>
> Good point. I can send a v2 adding CONFIG_PINCTRL=3Dy to the other defcon=
figs.
>

Instead of doing that, isn't this exactly what the 'imply' keyword is
for?

- weak reverse dependencies: "imply" <symbol> ["if" <expr>]

  This is similar to "select" as it enforces a lower limit on another
  symbol except that the "implied" symbol's value may still be set to n
  from a direct dependency or with a visible prompt.


So how about adding 'imply PINCTRL' in lieu of the previous 'select
PINCTRL'? And that would also better match the intention of the patch in
question (namely that the user needs to take explicit action to disable
PINCTRL).

Rasmus

