Return-Path: <linux-gpio+bounces-16008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830D8A35C99
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 12:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385E9165B71
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5A4262D11;
	Fri, 14 Feb 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FGOLQSIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2043.outbound.protection.outlook.com [40.107.241.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB1B221541
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532839; cv=fail; b=t7Ui0YAi5LvXmDb2cxOJBKNCil8Z+29EOO1mxJX5UlRl8FfBazwCPjpL8jZkOUbdMJgeft8PLrJanUIKv3oxslOlD9DP3Ttfs1j7kwvPj4+UXWkvcUhgKP0s+/+KYejd7BWroK8dTebrPdlfZsZ/dO/6XG0y3+12XS7f0ihLLXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532839; c=relaxed/simple;
	bh=bY+qOdY2RhwYUpn7vB7OFtL+MHTscA3QkFcxsLTFbr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HyS5j0hFtzJimmkhI3mgtM48Fmbe09cXGF+9AJ4FLEvU8xdrPxpAsX8AHDJ74QTgcWa61tGg/UD5zdPoll2WvKAKwd7kvm6juCS4AFZdzjDds2ROhwM/V8BbyeN4vGk9nKkwhBftesSePHzQ5mBirJcZXSGm9GEN740tIHix4So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FGOLQSIl; arc=fail smtp.client-ip=40.107.241.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4Kfll21bhwNHmru9l0YDMGSpxITqXHMVNq9Y3G3p4c0ox525XZhRh7yPyF+KrL3ljowKZ44Kk0tUeW1BI2zxqWiMRcCiKxpj+pI2t+Nl6BqoEjgRKjFgr3rJ7Y/nOo+8/mGH8hszsNOYLqeteck8Li4bslgM5reFhpCymc7gtDcuoo+OtSLaDBUnbHtVyiJJr8T9sbwiW8bXp+QrXttpoz6WsPj8Be3qqBdNhqXoi+gaRL1gkvmk2OzlyKghc8LorwOUEUGqqKOkh+L0GZb6Ty2fY+Iq+glHPKtBKouYnHdokirVC+UZ9L8dxSUDgD/osTXz+khJTWDtx/mlE11+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY+qOdY2RhwYUpn7vB7OFtL+MHTscA3QkFcxsLTFbr4=;
 b=C/SkDYBZCpqm0OnHiM/o4rslTVMxwtzd3+AcnWWy97mGMqa9+Ubtu9e9cCbbmzNgCjFDPRCxE2/NBnQc2fZZLV6J9au93pICQeSEqlKhYqmKYxbmKfOs2DIrgfE/h8oLfiTYHTg87T7oV2GV0mzOTHlWf4BjJicAln2ST/OwYPVA0b3L9MEb/TXu8UO2cYOosTqSeEhAbnMkA+yJt9w/TQwssB1I4UwvnqxeXMSCV0LYryfg6Zh2N12AlqgVzdUW6B4nLPbDPAZq/2ayuGrdrQnf/hAJuyeGRkb1hjDFClMv17Fa8AR34ccv71LzwJ8ZniosMsqhlj4OpNUYnNdbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY+qOdY2RhwYUpn7vB7OFtL+MHTscA3QkFcxsLTFbr4=;
 b=FGOLQSIl3ZPME/gJ3DqbakjZVQQzhE6VRdQaJBjccLm77qghruVh9ArRBiPHmkxgn1XmRrqVp8Sce2QiRFLjWfDARYGB72tG1ihYXIjoy+OLO9DmL2o3rvDKONOc4CZ3lAF3wrf/5D6MfJorF1FBLR/Kp6zxCPKX417rZwtDAAzJkfL6YO0p3FO09n2cfCZNV6jroUlazbdLtRItMBI+VihDAGOdXMz0kQyYTX+A2zdBL48wwt4s7bjrKc0fdm6MpC/loWoyJe+/mqZjvHvnoXUJLtO3X1EK6dgfYJiVqCMZPTVp45WNOqjQ/FElg8IxkK7hvIEKduPAgqY17Hrw/g==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VI2PR04MB10834.eurprd04.prod.outlook.com (2603:10a6:800:275::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.22; Fri, 14 Feb
 2025 11:33:53 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 11:33:52 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes
	<johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
Thread-Topic: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
Thread-Index: AQHbfmxEu6yEUXH7FUmZu2oDrYxS67NGodwQgAAJBuA=
Date: Fri, 14 Feb 2025 11:33:52 +0000
Message-ID:
 <DU0PR04MB949614F90422D0884E00B7C890FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
 <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org>
 <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To:
 <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|VI2PR04MB10834:EE_
x-ms-office365-filtering-correlation-id: d23c9d6e-96c3-4217-cfa9-08dd4ceb7581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MzkzSWhBdFg5YjhWTEJYd2ZTa1cwOEE5VnVpWmF1VU1kNWVydExUVkF3eWtV?=
 =?utf-8?B?RnhldC9NU0p4YUhSZjFuUmZER202cXpPdHplM2JnTDBBNVQ2MUtpcS9mS1I2?=
 =?utf-8?B?SUd5UysxM0Q1ZGNtbzIwM1lqczlxaHpFYVBSSExuTm9PTmxxazhvWVJMNXlx?=
 =?utf-8?B?WWJkMWtYQUI4VjJlVkxOT3ZFSWY5aTJYZzQ4c2hNd1dNbmhhOTZjcTV0d1ps?=
 =?utf-8?B?LzVzL1NLRnl5Yk8zbmlqY01iRUFyMmNENjVoVUtpWm10NVFEKzdtN1VjQjFJ?=
 =?utf-8?B?UHhPcHhHZDR6ek9PdE8xNDQ1SEpVeU5HU3ZpWmMySGt5dXpaRmswSXIwYTBU?=
 =?utf-8?B?YUtyZXRsNnRXS05HcEFBK09reGlTbjliWXp3MGNOdFFPeFBLak42NVN3aDBu?=
 =?utf-8?B?V296QUZjMldaREQxVFQ3YjliVGEvUzRSRS9yZitCdXFoUENOS2JXTnpDMXlh?=
 =?utf-8?B?bWtEeUdET2xzN2k4eTNQV3QrcFNSU2JzRjZSZkZjcWF0ZjJKV0c4cUNQQ2VL?=
 =?utf-8?B?RXdHUXI3T2lSN09qbnZEc09kN2c0enVXZFVCeTZFUTVsSWY3SHJ0N1p2eFlR?=
 =?utf-8?B?WUVkSjJWRWIzMGRzSG5WY1JPVVl1RWprU0c4ZWZhbE9wcEs5eFY4L1AvMy91?=
 =?utf-8?B?ZGI1elY4RzB1ejh1WkJzNE9MTmdGTGlGM1JMU0pWeDZlbERLZTdrL0kwb2lQ?=
 =?utf-8?B?Rlg1V3A5Zllvdmo3cUhEY090b3h5L1daS1VDN0FtZzVWQTRFQ3V0VXgrbVRV?=
 =?utf-8?B?OTNwNTB4My9FMkF3QVQzWWxVcHkyQktkcDcvdTJsZG5wN3N3MkZZbURxTlM4?=
 =?utf-8?B?T1JwRXhIaUw1YjFreUN3dVJpa3ZGSnhJRmZGM1lFWVZSV3F6TVJsUGJtYlZs?=
 =?utf-8?B?NDhpOHB4Q0t5bWdtT09KWElmNWJUdFBnSHVKelVzenhDV1QyWU1FY0UyNUEw?=
 =?utf-8?B?RUx5M2hhcUVBbGlCT1hKcGsxZ0F5UUFjLzQ1dkVXWW01VVdmcm1STEFSTEJZ?=
 =?utf-8?B?MlZaTjhRaDk1WmpZRWZIcTZ6MlJyYkwrOGxyYU9tNWZhbkdvTnpFV3BDVnlN?=
 =?utf-8?B?eEk2SnhlU1FzQ2N0czJySU8rU1dYcm9oRVNhLzQ0UG9pOTB1bkpLSUFBd3BD?=
 =?utf-8?B?V2IxdTlPamRtNHFEMkN5ZVcwV1kxdU54Y1A5K1ZwZ1lKSmVIa2tJTEJZUGdv?=
 =?utf-8?B?c1ZReVhwbVBlQkdxZjFwTDcvUnBMMUF5V0xyWCtvYnJEMlNTd1dSeTJlejB6?=
 =?utf-8?B?cXlaRVdYOXJUVzdiTW85dUMzcEliMmdhbSt5QUJ1aTNFdlIyS1BPVUdNV1B1?=
 =?utf-8?B?ZWs2YitReFhtb1l4b0xIZU1yVzlyeW54RkZvWUNudU9tVit1L3luMGQrUlBk?=
 =?utf-8?B?VlI0emQrall6ZEFmYk5PZWpxWlpQemlLUHl0T0JtV2dZbDEvcUFIMU4rcEgx?=
 =?utf-8?B?Vkg5NGErNmNpUGZvZTV1cysxS2V2Rmp0d0xBRlZJSzA4aUlmRkZtSWtXYmxj?=
 =?utf-8?B?Mm5XMkdHR0hCNUNlSitlSElDdUwrZU1DZzhYeTR0NUNQeWU1WFZ5c0JSRHJa?=
 =?utf-8?B?RlR0VGdTV1NLSTlDTVdYcFhzalMxSk1rOTVRS3lBZHlFMXo5dXZiUnEvVi9y?=
 =?utf-8?B?L0lmVUNLSm5Tdm13V1FoMnIzWlFOMkhPWUwweTc2VVlVZnNpRHRTUHF3bGJR?=
 =?utf-8?B?c3B0ekRpaU1uYTRybDdNTndWZ1AvaTBYRXJTQ0xQRUROWDNkSW5sKzJYc0M4?=
 =?utf-8?B?TUxIdDNacHRLck9SNXB4aGQ3WkhvdCs5ajR0WmNTWEZXak1URlcySzJjeUpW?=
 =?utf-8?B?M3pnck43eGJQQS9DWThKZzFoKzVnSElRRmdtNTdvTTBReXhnUDlIZnp2WFV2?=
 =?utf-8?B?clBsMWd0REJkWnhjOVczK3JDUENES0lsbXUyblQ0ZkFuTVR6eTVKVHFrTTVu?=
 =?utf-8?Q?4dJQTL7QC0oEYWmEGZft53sPLEnp2awM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MndzMDErM2RFbDliMU1qbmRYR0Z3dUNjQ3F6a2lyazc5aUtnaFdLbkdmUTBo?=
 =?utf-8?B?bFNBdHl0VXZpVmdzS0czanRaeGd2dkN6aXpHbUxsdmtZMko2SmNYV1gwVm42?=
 =?utf-8?B?dXVIbmdaVXZKcVBaWk10aFdBcC9iSTNqQ1VOcnlwRFJwZHJ1ZWVJM1FmSGNl?=
 =?utf-8?B?TUQwRWNrdEdQVENEMWdURFRNTnlUTGo1Zy90Q0didmtzRjJzZDY2VXFpSEhP?=
 =?utf-8?B?QUNaRm0wbTBJN3laMVh4MWRoS1pJeVFYTHoraXZ6blk0cElUREdkQjBOVHg1?=
 =?utf-8?B?YlZTeFJlNm9lM0xHNG05MFFjZm4wQk9MZVc3U1pXWVZyeDFueTBPVE9oMnZE?=
 =?utf-8?B?ZlpOMEtpeklGT3RIaGpTNDJsV1JCU2RTTEdGbXdVZnZGNVUwcDNrcGJzcEVY?=
 =?utf-8?B?WTVCRTErbmoyQ3BHTGo1NENraXA5T01zMG9oVWh5SmxSNlZSKzQ4eXBEMjU3?=
 =?utf-8?B?RnVOZXptb2FDNzM1c29XY2FoSEZseVdsdHpOSHFGNE5URjQwc21qSlZTdDcw?=
 =?utf-8?B?TjEva1VidkgyVURUZWpCcWE1STNsUU1jQ1h4TzVneUViSkZNdGhVd3dSRkFy?=
 =?utf-8?B?cGU1ZlZkZDh4d0xPSGFJZi9QcTVicUY0SW10ZkJIY1UvM0VLYWE5OUFRT0pP?=
 =?utf-8?B?QzRCM2svV2NiRWJIOUVsKzlOT2dBeXczNE1Fbm9ZTGxLRDJtNVZXYWI2bDFI?=
 =?utf-8?B?Nk1xSGF5dlprSndGY3RqQlBKdWgxejlKWHBBU05qS2ZMcnk2ZlZDa3M0SU1F?=
 =?utf-8?B?dDArVktyYXhpbHZ6eDdyV0tjN3dDU0xGcGhsYVQ3Qko5VVdWWWp0NnJhZFB2?=
 =?utf-8?B?TVBiT3pFOGgwOWlEMWZBNzZ3L2JuMkMxQ01ISkx1ckNPWDVHakV3UHRwSjhB?=
 =?utf-8?B?TTJETys4M0Q2QllsQWNTaUhPbDYxR0Zkc0dvVEwrRVpGbWxnbTh3aFV6ekNx?=
 =?utf-8?B?SytzNnVubEpOSksweEhyb0lqS0g4UWNaYmJjS2xwZHdVMklvWXdLcXJqWEVx?=
 =?utf-8?B?S0FOK2dSYXJlZzNXK2VST3JjVnlzVEloSVl2MGZsZHdnTUxuTGVXZ2R1RXlu?=
 =?utf-8?B?NXlHV1VZUGlTYnUrMGRsVUJ0eG5rZC9KUVBKbm9FdEcvdnFXK2lJTzVhR1dQ?=
 =?utf-8?B?bzlISVBHRmN3UUhrNEk1OUdxS2M5SHJrRy9tTURCVkNoeUVWcTExRW5GNk9r?=
 =?utf-8?B?cFFuUFVQNGZGeWJsaGNnVG5uOTlwYkhCQlBYb2F6NHg1VXVQMXlleG1hZy9F?=
 =?utf-8?B?ejUrcmFYSWJiZ2dBQUliTGE4RWlRamUrZzRQVTlGSThwYzE0WmphNTN2dWo3?=
 =?utf-8?B?S3Z3RTZ4Z3BhQi9NWnMzZUgyNkNPeUFlN0NvUElKUGZaSkhiM1RhalQ2QlFY?=
 =?utf-8?B?Sm1sdWZCZExRQlpTTUVYZW0zakdickc2SGFPRS9KNldMRStFcEc5NDZnNkZx?=
 =?utf-8?B?cTM4UG9qNFRLbktHZ0xlRTVQSkk1OUgrdDJYVHcxNThZOWNJdzl5dWg3R2Jo?=
 =?utf-8?B?MGM1VXNoVkQ4UldXRzFpNHdmY2JqQ0YyT2xEVVg1aVI5ZzhaMnhQeCtEbG50?=
 =?utf-8?B?TldENG1ka00yV3JQaXg5cTFMd2h0dXNxTWxNTGx4VkRTV245enNDc3M4Tk14?=
 =?utf-8?B?OHQxZG83emIzd0lFMUxDS3l5UVp4TmZEMEZnQnl5SU4rQ2JDbDU3VXlUV0ty?=
 =?utf-8?B?R3VJcDRyVlNXMy90Uzc3R0hLVXZRRFFtVnBsOTJEc1ZvdWdiYzBsL3YxYmwy?=
 =?utf-8?B?UWFhZkJJZ3pDVC9wQVllN0dKR0xQV0lGc0U1dWVjZ3huazBwcHpKS3VqNWk0?=
 =?utf-8?B?NWNOL3c2RXZQd1ZXV1d3bFBlOVdsL0JJck4xYnB2Sm1xSFFuVTRreHcwUW9B?=
 =?utf-8?B?a1VSa01TWnJ5OVAzRFJMQ2puUGtQdWpoMWtDVCtWZ09VZm1HVzd5aDczdUVW?=
 =?utf-8?B?V1hnc0s4VzFqc3QrNmRGZk9zSnNtUllqd09VVVVHR3lzRHAyTTRraUZ2dmVm?=
 =?utf-8?B?TitwZWhUclBFVU5hSm9BLzJQelBmczNlZHZGZnpGWUZDWHhBVENSQkVrWW9I?=
 =?utf-8?B?cmZBUDZyYmkrSGJKbElRbXBLU2xDQ050YUo1UFVTQTNMaFNEUlZrM1E3QUo5?=
 =?utf-8?Q?NhMXwcgqJgwJdiamdzEIgt6hR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d23c9d6e-96c3-4217-cfa9-08dd4ceb7581
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 11:33:52.8875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frbqwHWjeUDFQ9qvdhT/VduI1T5CLBIvRUEW71zrFECWLlZZuqWsE1NrsIzOnhNW/L3hUotjENKpbrlolvGZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10834

KyBpbXggZ2xvYmFsIHJldmlldyBsaXN0LiBNYXliZSBzb21lb25lIG1heSBoYXZlIGNvbW1lbnRz
Lg0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQm91Z2ggQ2hlbg0KPiBTZW50OiAyMDI15bm0MuaciDE05pelIDE5OjI4DQo+IFRv
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBKb2hhbiBLb3JzbmVz
DQo+IDxqb2hhbi5rb3JzbmVzQHJlbWFya2FibGUubm8+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPg0KPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUkU6IFtQQVRDSCAyLzJdIGdwaW86IHZnNjEwOiBTd2l0Y2ggdG8gZ3Bpby1tbWlvDQo+IA0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiA+IFNlbnQ6IDIwMjXlubQy5pyIMTTml6UgNzow
OQ0KPiA+IFRvOiBKb2hhbiBLb3JzbmVzIDxqb2hhbi5rb3JzbmVzQHJlbWFya2FibGUubm8+OyBC
b3VnaCBDaGVuDQo+ID4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJyZ2xAYmdkZXYucGw+DQo+ID4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBMaW51
cyBXYWxsZWlqDQo+ID4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gPiBTdWJqZWN0OiBb
UEFUQ0ggMi8yXSBncGlvOiB2ZzYxMDogU3dpdGNoIHRvIGdwaW8tbW1pbw0KPiA+DQo+ID4gQWZ0
ZXIgYWRkaW5nIGEgcGluY3RybCBmbGFnIHRvIGdwaW8tbW1pbyB3ZSBjYW4gdXNlIGl0IGZvciBk
cml2aW5nIGdwaW8tdmY2MTAuDQo+ID4NCj4gPiBUaGUgZXhpc3RpbmcgY29kZSBoYXMgdGhlIHNh
bWUgc2VtYW50aWNzIGFuZCB0aGUgZ2VuZXJpYyBncGlvLW1taW8sDQo+ID4gaW5jbHVkaW5nIHJl
YWRpbmcgZnJvbSB0aGUgZGF0YSBvdXQgcmVnaXN0ZXIgd2hlbiB0aGUgZGlyZWN0aW9uIGlzIHNl
dA0KPiA+IHRvIGlucHV0LCBhbmQgaXQgY2FuIGFsc28gaGFuZGxlIHRoZSBhYnNlbmNlIG9mIHRo
ZSBkaXJlY3Rpb24gcmVnaXN0ZXIgYmV0dGVyDQo+IHRoYW4gdGhlIGN1cnJlbnQgZHJpdmVyOg0K
PiA+IHdlIGdldCB0aGUgZGlyZWN0aW9uIGZyb20gdGhlIHNoYWRvdyBkaXJlY3Rpb24gcmVnaXN0
ZXJzIGluIGdwaW8tbW1pbw0KPiBpbnN0ZWFkLg0KPiA+DQo+IA0KPiBIaSBMaW51cywNCj4gDQo+
IEkgZGlkIGEgcXVpY2sgdGVzdCBmb3IgdGhlc2UgdHdvIHBhdGNoZXMsIG1lZXQgc29tZSBpc3N1
ZS4NCj4gDQo+IE9uZSBwaW4gb24gYm9hcmQgaXMgdXNlZCBhcyBTRCBjYXJkIGRldGVjdCwgbm8g
bWF0dGVyIEkgaW5zZXJ0IHRoZSBjYXJkIG9yIG5vdCwNCj4gZ3Bpb2dldCB0b29sIGFsd2F5cyBn
ZXQgaW5hY3RpdmUgc3RhdGUsIHRoaXMgd3JvbmcuIFNlZW1zIGRyaXZlciBjYW4ndCBnZXQNCj4g
Y29ycmVjdCBpbnB1dCBkYXRhLg0KPiANCj4gSSBjaGVjayB0aGUgY29kZSwgc2VlbXMgdmY2MTAg
aGFzIGFub3RoZXIgbGltaXRhdGlvbiwgcmVmZXIgdG8gdGhlIG9yaWdpbmFsIGNvZGUNCj4gbG9n
aWMgaW4gdmY2MTBfZ3Bpb19nZXQoKToNCj4gSWYgdGhlIGdwaW8gaXMgY29uZmlnIGFzIGlucHV0
LCBuZWVkIHRvIHJlYWQgR1BJT19QRElSIHRvIGdldCB0aGUgaW5wdXQgZGF0YSwgaWYNCj4gZ3Bp
byBpcyBjb25maWcgYXQgb3V0cHV0LCBuZWVkIHRvIHJlYWQgR1BJT19QRE9SLg0KPiANCj4gQnV0
IGZvciBiZ3Bpb19pbml0LCB3ZSBmaXggR1BJT19QRE9SIHRvIHZvaWQgX19pb21lbSAqZGF0DQo+
IA0KPiBSZWdhcmRzDQo+IEhhaWJvIENoZW4NCj4gDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9ncGlvL0tjb25maWcgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvLXZm
NjEwLmMgfCAxMDANCj4gPiArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOTEgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9kcml2
ZXJzL2dwaW8vS2NvbmZpZyBpbmRleA0KPiA+DQo+IGFkZDVhZDI5YTY3M2MwOTA4MmE5MTNjYjI0
MDQwNzNiMjAzNGFmNDguLmFiMTA0Y2U4NWVlNmNlZjE1NDlkMzENCj4gNzQNCj4gPiA0NjI1YmNj
NjI1ZDc1MTc5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnDQo+ID4gKysr
IGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gPiBAQCAtNzU2LDYgKzc1Niw3IEBAIGNvbmZpZyBH
UElPX1ZGNjEwDQo+ID4gIAlkZWZhdWx0IHkgaWYgU09DX1ZGNjEwDQo+ID4gIAlkZXBlbmRzIG9u
IEFSQ0hfTVhDIHx8IENPTVBJTEVfVEVTVA0KPiA+ICAJc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUA0K
PiA+ICsJc2VsZWN0IEdQSU9fR0VORVJJQw0KPiA+ICAJaGVscA0KPiA+ICAJICBTYXkgeWVzIGhl
cmUgdG8gc3VwcG9ydCBpLk1YIG9yIFZ5YnJpZCB2ZjYxMCBHUElPcy4NCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIGIvZHJpdmVycy9ncGlvL2dwaW8tdmY2
MTAuYw0KPiA+IGluZGV4DQo+ID4NCj4gMzUyNzQ4N2Q0MmM4YWMzZWYzOWMzYmU0NjhkZDUxNzdj
ODVmNmI0NC4uODU4Y2VkMTdhZTVlNWYyNzI2Y2NiODUNCj4gMjINCj4gPiBjZDNlNGI2YTUwNDFk
OTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMNCj4gPiBAQCAtOTQsODIgKzk0LDYgQEAgc3RhdGlj
IGlubGluZSB1MzIgdmY2MTBfZ3Bpb19yZWFkbCh2b2lkIF9faW9tZW0NCj4gKnJlZykNCj4gPiAg
CXJldHVybiByZWFkbF9yZWxheGVkKHJlZyk7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgaW50
IHZmNjEwX2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3Bpbykg
LXsNCj4gPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBncGlvY2hpcF9nZXRfZGF0
YShnYyk7DQo+ID4gLQl1MzIgbWFzayA9IEJJVChncGlvKTsNCj4gPiAtCXVuc2lnbmVkIGxvbmcg
b2Zmc2V0ID0gR1BJT19QRElSOw0KPiA+IC0NCj4gPiAtCWlmIChwb3J0LT5zZGF0YS0+aGF2ZV9w
YWRkcikgew0KPiA+IC0JCW1hc2sgJj0gdmY2MTBfZ3Bpb19yZWFkbChwb3J0LT5ncGlvX2Jhc2Ug
KyBHUElPX1BERFIpOw0KPiA+IC0JCWlmIChtYXNrKQ0KPiA+IC0JCQlvZmZzZXQgPSBHUElPX1BE
T1I7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0dXJuICEhKHZmNjEwX2dwaW9fcmVhZGwocG9y
dC0+Z3Bpb19iYXNlICsgb2Zmc2V0KSAmIEJJVChncGlvKSk7DQo+ID4gLX0NCj4gPiAtDQo+ID4g
LXN0YXRpYyB2b2lkIHZmNjEwX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25l
ZCBpbnQgZ3BpbywgaW50IHZhbCkgLXsNCj4gPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBv
cnQgPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ID4gLQl1MzIgbWFzayA9IEJJVChncGlvKTsN
Cj4gPiAtCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gdmFsID8gR1BJT19QU09SIDogR1BJT19QQ09S
Ow0KPiA+IC0NCj4gPiAtCXZmNjEwX2dwaW9fd3JpdGVsKG1hc2ssIHBvcnQtPmdwaW9fYmFzZSAr
IG9mZnNldCk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19kaXJl
Y3Rpb25faW5wdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwNCj4gPiB1bnNpZ25lZCBpbnQgZ3Bp
bykgLXsNCj4gPiAtCXN0cnVjdCB2ZjYxMF9ncGlvX3BvcnQgKnBvcnQgPSBncGlvY2hpcF9nZXRf
ZGF0YShjaGlwKTsNCj4gPiAtCXUzMiBtYXNrID0gQklUKGdwaW8pOw0KPiA+IC0JdW5zaWduZWQg
bG9uZyBmbGFnczsNCj4gPiAtCXUzMiB2YWw7DQo+ID4gLQ0KPiA+IC0JaWYgKHBvcnQtPnNkYXRh
LT5oYXZlX3BhZGRyKSB7DQo+ID4gLQkJc3Bpbl9sb2NrX2lycXNhdmUoJnBvcnQtPmxvY2ssIGZs
YWdzKTsNCj4gPiAtCQl2YWwgPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSArIEdQ
SU9fUEREUik7DQo+ID4gLQkJdmFsICY9IH5tYXNrOw0KPiA+IC0JCXZmNjEwX2dwaW9fd3JpdGVs
KHZhbCwgcG9ydC0+Z3Bpb19iYXNlICsgR1BJT19QRERSKTsNCj4gPiAtCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZwb3J0LT5sb2NrLCBmbGFncyk7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0
dXJuIHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25faW5wdXQoY2hpcCwgZ3Bpbyk7DQo+ID4gLX0NCj4g
PiAtDQo+ID4gLXN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHN0cnVjdCBn
cGlvX2NoaXAgKmNoaXAsDQo+ID4gdW5zaWduZWQgaW50IGdwaW8sDQo+ID4gLQkJCQkgICAgICAg
aW50IHZhbHVlKQ0KPiA+IC17DQo+ID4gLQlzdHJ1Y3QgdmY2MTBfZ3Bpb19wb3J0ICpwb3J0ID0g
Z3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQo+ID4gLQl1MzIgbWFzayA9IEJJVChncGlvKTsNCj4g
PiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gLQl1MzIgdmFsOw0KPiA+IC0NCj4gPiAtCXZm
NjEwX2dwaW9fc2V0KGNoaXAsIGdwaW8sIHZhbHVlKTsNCj4gPiAtDQo+ID4gLQlpZiAocG9ydC0+
c2RhdGEtPmhhdmVfcGFkZHIpIHsNCj4gPiAtCQlzcGluX2xvY2tfaXJxc2F2ZSgmcG9ydC0+bG9j
aywgZmxhZ3MpOw0KPiA+IC0JCXZhbCA9IHZmNjEwX2dwaW9fcmVhZGwocG9ydC0+Z3Bpb19iYXNl
ICsgR1BJT19QRERSKTsNCj4gPiAtCQl2YWwgfD0gbWFzazsNCj4gPiAtCQl2ZjYxMF9ncGlvX3dy
aXRlbCh2YWwsIHBvcnQtPmdwaW9fYmFzZSArIEdQSU9fUEREUik7DQo+ID4gLQkJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmcG9ydC0+bG9jaywgZmxhZ3MpOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAt
CXJldHVybiBwaW5jdHJsX2dwaW9fZGlyZWN0aW9uX291dHB1dChjaGlwLCBncGlvKTsNCj4gPiAt
fQ0KPiA+IC0NCj4gPiAtc3RhdGljIGludCB2ZjYxMF9ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0
IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvKQ0KPiAtew0KPiA+IC0Jc3RydWN0IHZm
NjEwX2dwaW9fcG9ydCAqcG9ydCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiAtCXUzMiBt
YXNrID0gQklUKGdwaW8pOw0KPiA+IC0NCj4gPiAtCW1hc2sgJj0gdmY2MTBfZ3Bpb19yZWFkbChw
b3J0LT5ncGlvX2Jhc2UgKyBHUElPX1BERFIpOw0KPiA+IC0NCj4gPiAtCWlmIChtYXNrKQ0KPiA+
IC0JCXJldHVybiBHUElPX0xJTkVfRElSRUNUSU9OX09VVDsNCj4gPiAtDQo+ID4gLQlyZXR1cm4g
R1BJT19MSU5FX0RJUkVDVElPTl9JTjsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgc3RhdGljIHZvaWQg
dmY2MTBfZ3Bpb19pcnFfaGFuZGxlcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpICB7DQo+ID4gIAlz
dHJ1Y3QgdmY2MTBfZ3Bpb19wb3J0ICpwb3J0ID0NCj4gPiBAQCAtMzcxLDI0ICsyOTUsMTggQEAg
c3RhdGljIGludCB2ZjYxMF9ncGlvX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZQ0K
PiA+ICpwZGV2KQ0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlnYyA9ICZwb3J0LT5nYzsNCj4gPiAtCWdj
LT5wYXJlbnQgPSBkZXY7DQo+ID4gKwlyZXQgPSBiZ3Bpb19pbml0KGdjLCBkZXYsIDQsDQo+ID4g
KwkJCSBwb3J0LT5iYXNlICsgR1BJT19QRE9SLA0KPiA+ICsJCQkgcG9ydC0+YmFzZSArIEdQSU9f
UENPUiwNCj4gPiArCQkJIE5VTEwsDQo+ID4gKwkJCSBwb3J0LT5zZGF0YS0+aGF2ZV9wYWRkciA/
IHBvcnQtPmJhc2UgKyBHUElPX1BERFIgOiBOVUxMLA0KPiA+ICsJCQkgTlVMTCwNCj4gPiArCQkJ
IEJHUElPRl9QSU5DVFJMX0JBQ0tFTkQpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgInVuYWJsZSB0byBpbml0IGdlbmVyaWMgR1BJT1xuIik7
DQo+ID4gIAlnYy0+bGFiZWwgPSBkZXZfbmFtZShkZXYpOw0KPiA+IC0JZ2MtPm5ncGlvID0gVkY2
MTBfR1BJT19QRVJfUE9SVDsNCj4gPiAgCWdjLT5iYXNlID0gLTE7DQo+ID4NCj4gPiAtCWdjLT5y
ZXF1ZXN0ID0gZ3Bpb2NoaXBfZ2VuZXJpY19yZXF1ZXN0Ow0KPiA+IC0JZ2MtPmZyZWUgPSBncGlv
Y2hpcF9nZW5lcmljX2ZyZWU7DQo+ID4gLQlnYy0+ZGlyZWN0aW9uX2lucHV0ID0gdmY2MTBfZ3Bp
b19kaXJlY3Rpb25faW5wdXQ7DQo+ID4gLQlnYy0+Z2V0ID0gdmY2MTBfZ3Bpb19nZXQ7DQo+ID4g
LQlnYy0+ZGlyZWN0aW9uX291dHB1dCA9IHZmNjEwX2dwaW9fZGlyZWN0aW9uX291dHB1dDsNCj4g
PiAtCWdjLT5zZXQgPSB2ZjYxMF9ncGlvX3NldDsNCj4gPiAtCS8qDQo+ID4gLQkgKiBvbmx5IElQ
IGhhcyBQb3J0IERhdGEgRGlyZWN0aW9uIFJlZ2lzdGVyKFBERFIpIGNhbg0KPiA+IC0JICogc3Vw
cG9ydCBnZXQgZGlyZWN0aW9uDQo+ID4gLQkgKi8NCj4gPiAtCWlmIChwb3J0LT5zZGF0YS0+aGF2
ZV9wYWRkcikNCj4gPiAtCQlnYy0+Z2V0X2RpcmVjdGlvbiA9IHZmNjEwX2dwaW9fZ2V0X2RpcmVj
dGlvbjsNCj4gPiAtDQo+ID4gIAkvKiBNYXNrIGFsbCBHUElPIGludGVycnVwdHMgKi8NCj4gPiAg
CWZvciAoaSA9IDA7IGkgPCBnYy0+bmdwaW87IGkrKykNCj4gPiAgCQl2ZjYxMF9ncGlvX3dyaXRl
bCgwLCBwb3J0LT5iYXNlICsgUE9SVF9QQ1IoaSkpOw0KPiA+DQo+ID4gLS0NCj4gPiAyLjQ4LjEN
Cg0K

