Return-Path: <linux-gpio+bounces-12927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083C9C6C8A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4048C284998
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61071FBCAE;
	Wed, 13 Nov 2024 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XmAXm5FZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2051.outbound.protection.outlook.com [40.107.105.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748671FBC8B;
	Wed, 13 Nov 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492765; cv=fail; b=XqyKg0bt8u749FAsuaCTHG7MzVXZLkc6VtkRmaATW0CLNe9Tafv4QB+FH3ZlDDaEu7GrCcaxuRBjGbhNCeCn1fXK2IwnisABoUYmsKbJpWP03zej+Q+z0FEiUNFvgxKQ5e2YCvfRQTMQMeZZ9rjKtjeT70X2h0tLe57lAvn6bsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492765; c=relaxed/simple;
	bh=UBamIN52E4M9Fboe9FKaI0ot2Z0A6deyBH3QyaH1GAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IUyTR92euG+9XUgx+C9jPCkPozlmMCnXIde/jAbGJTm9MnMWrScbSelOtSodOAoH0+bCV/vUbSMky/DbqPunFJBYIf5Grx/+Ta5Uf8YUgu2rJa7BtX/226LS8K0yXhsO++Y0AMha+KGFIA8JTorlodbTy1I3I+vayU/lhcjrwes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XmAXm5FZ; arc=fail smtp.client-ip=40.107.105.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pzt2+mQQqvfSZaPg2URoY2ZZU0TD+SVLESgKAafre2VPeLmRW+6HbQ+WWO8/jL8wi7fMd/TDULjlWGs4PpJwWposEzY4zaBCe6bQl8uuTvQ7Kk+qIQbWZOvBZrBO67VPtqw8mNN4AgDsijih9ifvCk+OCdvwTw/XxfRdkHG0UuCi/cFTewSghOhBufGcvUT1zk2N0AS50SW7AqnPewKw6EkJGv2D4dUoYLvObSjfTPztJgTsjRiaAgKE0FDxeS+XrQJ6esPxIyrdPp/va9VHmhTbR69KySIMLi1EhXYJrI0Wxlv+5uslPqJQyAPyVvmulwrrneIJNEv+OyViJ6GNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Kzz7QtLVI+Cdc28fXOJnGYj1Ph+zENPv3rBRnyqP2Q=;
 b=dqxeil0j1hn3tCZKPajzENCbr3zUt2HK2LI9WTkoXNbI1dtCpspxqMyeqIHD0YNOCozxzA1BhpuXK3H1jCe/ueorYmt/zghwANqNv1Updm4Z4864LkihlLe44qfU4is4nKHcBWzyE45IYMeZSqP2Z0ChQYOiOVCzA2sxQMA2KiV7P49N8ZMbG5szC3uWhPniHJDUt5AmoJ9AMP1hgqJ6zuXLVkVGrlaTQmxIQ/+/o8DK+OpCR4hBI4dqOGer92cyCerHVFMLSf0mYZaivCmfMcO8fZfxZCxC01ZkkDVfncyWUZCfdZG7V6Bb00cvzZzLCd6kjwryphPkOcxp9RErNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Kzz7QtLVI+Cdc28fXOJnGYj1Ph+zENPv3rBRnyqP2Q=;
 b=XmAXm5FZHJCNcaJQDsBBvD+9k7dlE4XTMatjfxDGQ99QOvgyEnkUGrogaSnS+Hr1bxeJsSl6xRveQwrZ0iQK/fiTB7RwdnYOxtasVCzVw08dwz+uMwifVdtA+fREW3FIt2ZtOJqHIMf7XiPCcynYf8al2NFBimPZyWOJIIAVX2JcvLcqvpi0VpTnzsNtYAuVBHbHuj+l7hNmNtSKqFstNPffxyG1f4pY+2GoLxO0SCCXLUFlhxnngMtgbxYO7VqC1t5MLqmwY44QsXTT/QLuZQllnL+2JOOrQpUV06vlFRXy2fSk2n+de361BFRZnjNTYx2W34RaujAuLUM/Phi0iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 10:12:38 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:38 +0000
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
Subject: [PATCH v6 3/7] arm64: dts: s32g: make pinctrl part of mfd node
Date: Wed, 13 Nov 2024 12:10:55 +0200
Message-ID: <20241113101124.1279648-4-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f5ecfd34-d9d6-4de6-75b5-08dd03cbb358
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3EzMGJJbHcxK2RrcU9hTjZyaHJxM1l0WUJTRUhud3UwUkNNSG1LYjhiRCtF?=
 =?utf-8?B?cGs1TWkvQ1NtY2ZySU1YRTducTJxRXZmSHhwZmh2TVRCODBXMm1lT2l3WmlQ?=
 =?utf-8?B?L1hsckhTaTNFWmN4Sis5d3ZOcVhFTFVUc2RPZjF1dEZEZTFpb2h0UmpXbTRW?=
 =?utf-8?B?eHFZL09yRXlxUDdrVXFQRTFwOXY2Y3JSUnZ0L2Q0M0N2REZDR0RwTWlBY040?=
 =?utf-8?B?L3VxU3d5bmRORkN3RUlNUS9PMmJJbGVORHl4b1JDcVhMQ3VBclJXMk5GSGVy?=
 =?utf-8?B?S01OU2ZkdzB1d20xb0xhTDJzQWYzSFhmN0ZnTWd0azlGWVNzQmNhK3Vrdld0?=
 =?utf-8?B?NnUzZFlMR2p3cjVPbjdZRVBGVkxBcmo3WEZoZ25jSkZ4QXJSQ2w3dGRiMk5V?=
 =?utf-8?B?OVN2ZjZBYlAyNEl5KzNjalpoN0F4Q3hIcHNoc2JuSTNEa0E3ajhtMXl5b1JG?=
 =?utf-8?B?dmE3SnhFU3YrR2wwSTVNUHJPMmNRWnRrc05tYmZkWmo4OENIUkFjYTI1Y3Bu?=
 =?utf-8?B?b3pLZkRndkNQRDUwSUY0NmloVG52TlZOaEhHbTRXMmt2WVlQUW9wOU12Vjd6?=
 =?utf-8?B?YVVBaUZLa25kUXlCQXNxaVB2QkFOQjk5Y0JWUHhiR2NtV2orQTRPR3hSK2Zm?=
 =?utf-8?B?QWNPRzIwY1RrUk51QkRmQ05KdVBBcjB3MzJkSFNpUFZlVldqYWNVWFlWK28y?=
 =?utf-8?B?c0ttVmQ2SFJ4eEpTdjYzUnFOS0pwYzR3bXJicExmK01WRVVvcCtTbVdKSlgv?=
 =?utf-8?B?WmtMYnBDbGhPOUJYZmtwQUkrdjR0aTJNL2Y0dkpqY2MzY3JRR2VmaUtqMmtn?=
 =?utf-8?B?VFJnUk54UytvMjM1K29XRUg0TE1ZS29jTmVYSW5IZ3g5cml5REI0cjdmeUZw?=
 =?utf-8?B?cWdJWVZNN1V5bHBRK0dkTGZNQlJkWFBSWnZIRnU2MFNQbWgva2pDWmVOOWhr?=
 =?utf-8?B?NU4vd3ZPbDk0Zmk1UmRnSmRvanVaNVlTQXkvV1RGRWFjam1Ma3lkd2ZzQ0FC?=
 =?utf-8?B?N0hkdUFyTkZUSmRDckl5alMwSTlyN1FsV0Y5UnUwNjlJY3NxdlNabmFMOFEw?=
 =?utf-8?B?UXVOOU12RGxxS3diWTlPSFJ0MkNuQllITzRJb0hXbkZ5ZTlRZlR5Z1I4QW5m?=
 =?utf-8?B?SHBxSDJuTi9IVTlYajhjMkIrNnI5UHVLZlJEcEFkVjBCUVFLa2RhbEJZMWdi?=
 =?utf-8?B?eXJZU2dvVU5xMjJDVExid2p0OFBLSWxHYlk0SXBaVm00Qk5DZG1vbTNLWExR?=
 =?utf-8?B?bGFtVVZvbDBHSVlEQkNpbEhZYjNYYmwrVmlZRm5zNE4vQ01MN1ZyUmN4K01a?=
 =?utf-8?B?V3N0MXJTejhwM0pTQmdLaG5SZFpCb2hKY3l1SE9wbmo2ZjBRUDNrNlFzVEZv?=
 =?utf-8?B?bHllS0RLVGRyN0ppN1R3SXBkS2xBdHpVMHZRNXUxRFJQbHBvWXVOdHA4UGl5?=
 =?utf-8?B?RHVHd1JLSFYvTGlRRllxQ3R4djZHL0I1Tm1JOU1QMi9NYXRydC9FYjZ0QlZs?=
 =?utf-8?B?S3BlaWdJRFNHbXJwRUo2QnVZbCs3cVoxWmQwb0EyN0RsVVpkQTNhdzI1djBV?=
 =?utf-8?B?azNhZm5uWXcydzI0RVVXUnB4RjRFMitnbTRZQnl2QVhJcFFpQ3cvYllBck9i?=
 =?utf-8?B?YXlxdmtUWE1UdnU1MUVNeE14cFo0aFJURi94a2syekIxTHRibENuRk8yQmlU?=
 =?utf-8?B?aVBaSlRpQXE2eFhZTHVocFZ2YkY2TWdCQjhEeWVzOFdJeHlHSDBNeTA3cElj?=
 =?utf-8?B?QlFHYU5xdnFWV3VWbUE5VFNFYVA4N1poTmorcDl3TzlycFpnTUZSZVcxS0RC?=
 =?utf-8?B?RXRVTU1VdEtyR3NQaTZIRnJjWS9yYnJ0dTdFRTF6WEIzcmU4OWV0RVNMUFV2?=
 =?utf-8?B?bW9WZlArUUc4TTk3d3ozelVWTzcrSDEyeHhGeVdxcmdwMnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURsTzYzUjQ5bzRuL1hBRmRZai9ZMmJkdUp5ZDFyVXJuK3REZEt5MUQ5cWV5?=
 =?utf-8?B?YWFTRjk0T2R1RUVveERpbjlveFpvdC9kK3VtYVNaV2JaTmV6Q09SWnpWSVQx?=
 =?utf-8?B?c2lwNWZLS2tzNVNrdGdTL1JXeDBBM2hmTUppMjl5UmNHc0ZxSmlsblpiNHFx?=
 =?utf-8?B?QzVickMreFNvSUVnQ2xEejF6R2JSWTVlaFBvaDJVOUh0QUoyeHNNZENqMm5m?=
 =?utf-8?B?YWdUTmRDSGRheVQzd1RYd1pLZ1JDajh5MEFub3QrRlNiTWl1U1kzS2d5UUZ4?=
 =?utf-8?B?NEpERG9qcDFvUktjajFSdmNHclNBOGhnb2hxUmVQVEtwcVhrWWxnbExpcWkv?=
 =?utf-8?B?dDFuenMvZTVDOWhhTzJORTUva3grMGFHNG16ZzBieU5SdjdhUlpibnBoNE1h?=
 =?utf-8?B?OUxNWTcyL3lKNjNaRW5zUWtaZWVwVU1rMG5HZHBicXQ0RmhDV3QrbXhsbHRT?=
 =?utf-8?B?YnhZQU9KanZyY0t1ZEdFb3huU20rWUlJRnMrbkZxZ3ExMHFWNUFSaDNrcUQy?=
 =?utf-8?B?Z2pDRml0Ui90MGJKZUx1MnlCV3RVVDVQUWRCcnl2N1BwenVRUXpkYTVJTUJS?=
 =?utf-8?B?ZFNYY1prakF5SzVPZGczUGRrOHhOT3Myc2lsMWc0b2Q2cENKMnErdFcxTThM?=
 =?utf-8?B?cHpPUk5CdFVZUkNHT3dwV01WYi9zbVFCbWxaZzlsZ01UMWdmVWV1Mm5HNXVI?=
 =?utf-8?B?V2VXVmNQenVJNFVJUFFSWVBYK0Z0K1Ryb3VqbUF0T1IzYldrTWYrM3cwaFJD?=
 =?utf-8?B?MzBDbG40eC9FMExNTnR2VW5TSnVaaVZpVVdKeG90a0hkRis0OVcwek82Q1Js?=
 =?utf-8?B?VTZvb0ZCbXdvTXdvZkc1dEZLNFQrVVBGeXUzQ3NHM1R3UEZDb0VtNUdrSnFl?=
 =?utf-8?B?cW5qT21JaWVaalRkNUhZQWwzZWVFVlNmaXJxeGp1SGtkdTBsQWZtbVdhVVlp?=
 =?utf-8?B?OG8vbzIrdlE4a1BkZklJaUFVeHY4ck13SE81aTFYWXVINDkzTksxazZ2ME11?=
 =?utf-8?B?SFA1Ly9BWjhaZmw3TGNDZzgyK2NMbDc1NnQ0blBHdmtqQlpvQVpHeG80SXlD?=
 =?utf-8?B?VUM0STlUSHlQbGw4YURCZWRhOFVQMEYzL2JFckpCL1dBVDVoMm41S1gxOFB0?=
 =?utf-8?B?Z2ZjNnFrYzlrOEhnKzZXYk5IZHVKQktmRm5pRHB0aTVlUlloZDA4YmVvZTV4?=
 =?utf-8?B?SFVzeE9lRnJGRURuWmliZ2NXU29FV01IL1pablNIM1ZNcm4zRnBGRVh2dmR1?=
 =?utf-8?B?aVpUNG9CL1RPN3FVWjBuZU1ybVZqRHRVeEsvWVZZcU4zd2NWTGFjVWFwcWk3?=
 =?utf-8?B?RWovTVZ1YkVLVTcyRGxYNTZpZWhjNFZMTVhXaU1weUJkL0lENldkN0ZuVE83?=
 =?utf-8?B?UytiMW1aN1phRzhoV3pyUXp1UHZBczJWTjVDMXRkcE5MMWtlR2Z4dlBSVmVG?=
 =?utf-8?B?Y1hCU2FnYjFZS1didlJ4bkpmMFJmRUd5Nlg5eWRzZHhIOFd6elEyd0ZiK2M4?=
 =?utf-8?B?UStXbU5GZ3RQZm04U1MwVCs2SGMwSXhpZHRMOTRpOVZFY1ZPMVBGVDIyWHpP?=
 =?utf-8?B?SVpUTWhzVUpWbVJ5WGloVGVaM0lnUW1tRk82eVFwb0llZUhjalZZMDVpU05h?=
 =?utf-8?B?M0lWOWpNd2dSSlk5bDVLbXVCZEJMOHBSUkxoRWVxekt0Um9vNEZaNXNwbFRR?=
 =?utf-8?B?MWUyZG85Y244NTZyQkpSOGZ4M09LcDRwWGljRzZXUXQ1bWUvTHl0Rlc0M0lu?=
 =?utf-8?B?dVhZb3NPVUZpS1RIZXhvTEo5cHhrRnZlZGlqODZhNWkwQjZPaDBOTXNtRVU2?=
 =?utf-8?B?VGpEa1N4R29DYXo3dmJIcTNISHVQK3RKVFIvUHU4SVVLaVhBQnlFeTlUTjdz?=
 =?utf-8?B?SjhjRDIzNVRoWW9UeXJmdUgxOEd5UTZEOFQxU2hZWEpnRnJmUnpVbHRwNExI?=
 =?utf-8?B?WEkxY3lRdUVqWFVianYvbHNVSU9DWEduSlFCUDJGWkx2Ky9mWmdZWGs0d2N4?=
 =?utf-8?B?a0ZZU2tIakp1bjYwaFE5Y29wRVI4VHNUR0pzbGpGYWx1bDlETkJuZThmWjhq?=
 =?utf-8?B?bnRNMm01NllJK3FmYnQ3a0hUeU5uUmRsOVNOQnlsS3kvdjVQbVF1eDNZSVBC?=
 =?utf-8?B?ZHkwM2hEWEFOclZySVFrTFVrZFpxdHNONVA2STBLbDY0R0VxajVyVzVUY3pH?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ecfd34-d9d6-4de6-75b5-08dd03cbb358
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:38.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKcmuNPZdAr8O+nBHuc12A7VoNo1bsnzHX3JVBTvDu44eYA4d7W4YOFXIO2yN94n1AGtTClluaSPq04qjJYQhK/X52Zsdz51LeDLggUpwpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

SIUL2 is now represented as an mfd device. Therefore, the old
pinctrl node is deprecated. Move the pinctrl related properties
inside the new "nxp-siul2" node. The latter one is now used
to represent the mfd device.

This change came as a result of upstream review in the following series:
https://lore.kernel.org/linux-gpio/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com/

The SIUL2 module has multiple capabilities. It has support for reading
SoC information, pinctrl and GPIO. All of this functionality is part of
the same register space. The initial pinctrl driver treated the pinctrl
functionality as separate from the GPIO one. However, they do rely on
common registers and a long, detailed and specific register range list
would be required for pinctrl&GPIO (carving out the necessary memory
for each function). Moreover, in some cases this wouldn't be enough. For
example reading a GPIO's direction would require a read of the MSCR
register corresponding to that pin. This would not be possible in the
GPIO driver because all of the MSCR registers are referenced by the
pinctrl driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index fa054bfe7d5c..e14ce5503e1f 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -114,20 +114,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		siul2: siul2@4009c000 {
+			compatible = "nxp,s32g2-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..fa43d036686f 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -171,20 +171,18 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
-		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
-				/* MSCR0-MSCR101 registers on siul2_0 */
-			reg = <0x4009c240 0x198>,
-				/* MSCR112-MSCR122 registers on siul2_1 */
-			      <0x44010400 0x2c>,
-				/* MSCR144-MSCR190 registers on siul2_1 */
-			      <0x44010480 0xbc>,
-				/* IMCR0-IMCR83 registers on siul2_0 */
-			      <0x4009ca40 0x150>,
-				/* IMCR119-IMCR397 registers on siul2_1 */
-			      <0x44010c1c 0x45c>,
-				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+		siul2: siul2@4009c000 {
+			compatible = "nxp,s32g3-siul2";
+			reg = <0x4009c000 0x179c>,
+			      <0x44010000 0x17b0>;
+			reg-names = "siul20", "siul21";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+			gpio-reserved-ranges = <102 10>, <123 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.45.2


