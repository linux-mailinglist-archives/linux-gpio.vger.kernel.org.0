Return-Path: <linux-gpio+bounces-20272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65469ABB4B0
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 08:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17F8173B2C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 06:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91C920B1F4;
	Mon, 19 May 2025 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a3xsF+8K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084B1FDE19;
	Mon, 19 May 2025 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634520; cv=fail; b=u9s0kIMR9Z3JzEEce1QyGUlYvfb8qarPy35tkzNdgWOLDfjj8ScQA5GBmqYNlUh7l/miWjau327khBVg0wQlwJL0w9cYRBVx6ODShcm/BSbC+LMwT6uZGcLZWghsrneHtpLpGgXpf+bCl/DLxJDTQIW0e8vs3GO4RAR12B+e0yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634520; c=relaxed/simple;
	bh=f9ddV+LGlqMFsnt83XCK+xAhPEr2t8O3Nca44KuGcsM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=seKTgTE4tXymdU3CQk//CWI80YNzPuyKajKF98RnKQRw1GYXZ4vkFX54OfFxSdt9ljEru5RpU3Wt+LUH+rACP37+578pJBxLJNO02tcHtyJ+Hgb9D4okB3RKSP9BL6vcCkJUyGW3JMP+aK6jDzKeKNnjMVQ0S+1r2gmb1AubHoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a3xsF+8K; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on6PMKcw1gtqKFpXWMm4V+qerPkbIdgH2di3tUiC+bVYsaf6JO4bIyF81yTK0k+g9o7UKe9kR7b6178a5mM8jKmp4Mm06BCIuxtR2xYAZ4WbTURRCTCtlqucNCYfV+HByfaBwv+SUZB2CTdUIOdHTuID+OgiDkhWTSo/+VrGPL/AmmAqKs33oEyHO4oS/oQbQx9afwnoCdxowvZXUERQ1h5TOJjILjr4cvEdQ+F4ior5nHnZSm9iNM3XTdeyBytk1MnWaJSt3SoX9G0ksDXj0kbwr4haBh7ory5vkJ1sDtyZQ83Ni1RrcYo8McbGtQMSNGaxo0ft9El1fA9Nb8YbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS4rAwjfZiMw3wO77Am60D17bu7Vc3JQY77cwckhaQA=;
 b=KE1pWoGE6pwvqoZ7mRzP5tolBIlKXEVm25JisUnf4UcfDQahaX40Xy99E20xzfUJnVEQlK1kvu/rFV2ryGRQ5Bjp44YtTk1HEkCV2J2DB1Go24K6nqob851O1GFo3nb20/EvlHQnYdNib1H+nwZWXkKXg7NcTqqwcN+b/k54zW4L+KTm9Db/zXx7oOQGfBxBeOU7SqBmfa1jvxy0v1bG7bXYkve5Bl2uiFTJpKunvjA2nqu/brnt0MbrkdtQMdfYlTKnB+mQBuOzKy2Q3Mdsf3JQy+m/dE1jjVlyQOfLkhwmFTSXRhqSPYj4VPHSkfX5B+Ym7rat2z68/dC7vydcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS4rAwjfZiMw3wO77Am60D17bu7Vc3JQY77cwckhaQA=;
 b=a3xsF+8KJzo3wP2v1J0G4NhhwNZGUE3g7SOppcblt1WuZQAQMAVB01a/9ekIn6zmmf8tbgVdbSFZC6xwIbU0HZhIKxtvSIztfVdzgKG8KI6yuMiAVV6AlcYJySBGkPRqFcq0NmTqNZcMsA5yur6hH9MqeCzjx8YhsojavOYZmQhReVmkqBKgHfM8h4SQPw9hZe9qlqkOmXfMKmIKQBUqsCsyq0jGVaMzYzmoqTl+560HjanEAf8c/cFX8nODGNvcFujub1r/0gv1cvRQZ9Pr97ukT3vZRR+Ytp0QdxX4yk3yxWOKlwSNljLAqi0I7kE0CrVrnEEpk3uschWWSPb9pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:01:56 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 06:01:56 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Mon, 19 May 2025 14:03:42 +0800
Subject: [PATCH v2 1/2] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-dts-v2-1-b9e77173e9c5@nxp.com>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747634649; l=8515;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=f9ddV+LGlqMFsnt83XCK+xAhPEr2t8O3Nca44KuGcsM=;
 b=HCXmF6GRT9/ZpBXWfkiQf6WPW69NpkTrj9qi6LmJVxcUytO2DYEwoxlCr/aYJpFB/tr9ONFxJ
 8NmUY/DIlwRCFBh7uj3aNWalg13jOJbNCCoeUgyV2/Cecck33j9X66H
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cd35c0-94fe-4a11-829f-08dd969aa91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFhIZlZvS3Q2b0JLWTdpQThLZFBWRzFHckFqTzZNOTFLR3V5c1hIeHFvclFv?=
 =?utf-8?B?bVpxQS9nUFA2QnFvbWRmVG0ySzJPUHVIbWlta2huNmlTa2NjaG1ZVXloai9O?=
 =?utf-8?B?VWxsZVNrbGp5bDVkQk5CUEN3QzE2VWJ5N1ZGVHJlOFgrS00zMHc4Yzk5NGNq?=
 =?utf-8?B?MTlkOWtlVndaR08rNGZxVFdtMzNkWGxqc2x0YVdtR0FLR20xN1RJczV1WGV1?=
 =?utf-8?B?L1k4bnpjUnBNay9XN2p2ZVppdTBUdUEyUEU0bmx2cWRGY2hMd1RJR3F3SXM5?=
 =?utf-8?B?NldPK1ZIZ0V0VFBUWmhaTWp0RDJ5bUdJbVNkNUR6aGd0WjlKSFJKd1FHMVU2?=
 =?utf-8?B?ZVgyVktoWUhRRWpzcnJ5bWJDRGwxbFVjOXNSclczRzA2bHZLZXBTK3lxSy80?=
 =?utf-8?B?SFF3Y0pQMmtCWWplNFZPbjN5SW1JYS9ocXJWYWRLSjlDbzNUcFBDbUtYdkcx?=
 =?utf-8?B?WXl4UTY2QUx5QjFJN055L0xGdmhFcElETVVtb0RreWptSEVLRm95ZGU4T0xT?=
 =?utf-8?B?Z1pscXFiMjN0b0FWSXMxWkdoT3pZN2JJT2RuL29ZcHdqZkRRVEkwQ1Q0WERO?=
 =?utf-8?B?SzcwM0RKWXNyY0pubCtodXdtM2pFaUJIT0xRSmQxc3NtZG1uTlpwK2dBUHZo?=
 =?utf-8?B?dG5IRE44OU54MVRBUmtlUzZsVGkvN2JxV1h3SFBOa0dvMGI4QU9NbUtUNzQ1?=
 =?utf-8?B?c2NFTFVidElCRkFkTVIzRUEwa3NZdWpqV3RYR2txWTdBdEJpN1QyZC95NlVu?=
 =?utf-8?B?SUZESm9BSGFMU0FYamo3VTV0TFRHUUNnNWEvUVhTOXVRSDVTcHFPQ2xtaGFn?=
 =?utf-8?B?ZDZTeGxzemN3RjhSV0lMOVE5QVlXcWpiM09Ib2xJcVdJd0ptSmFDWUt2UGhr?=
 =?utf-8?B?ZnJYcEJ6M2VERW5NWE9OL1hZVmlOWjJMaVlHS1cwVmdpSC95cFk2Z1ZJcEtP?=
 =?utf-8?B?YkEzVmw1ajUrSXh6dnJkdHJOa3RPMmFIeVQxanZXV3FmMDZmSlVQc2tHYXdL?=
 =?utf-8?B?NTlzeS81QW5EUEozVEZtSndlZW11MjUrN0hoSTQ4elpuTVhxaU5ZN0Rlc0Y4?=
 =?utf-8?B?SDFCSmgweEJPK2h6eWU4aWRGWkF5bEhya1lTbC9pc3Fid1JBZU9rU2VseWll?=
 =?utf-8?B?MmRNQjlqQ2hkN2hlSWRmKzhZQUd0elc2U1lJTHFyZVBwMWhuUlZ1cmNTaGVY?=
 =?utf-8?B?TjFWc05jRCthOEo0ZUw4ZTNkSG1WbWxXdy9TMEpNWFNkZnJQRFlhNzRmS1ph?=
 =?utf-8?B?Vmg4VjFBWkJ3SzdOU0hQSHJIUFdvbTFrUS8xdUZnT3ZhWDI0OW5jRGlBVjZr?=
 =?utf-8?B?Q1htWXFFQzBDdWpCU1ZqcW44Mzl0REdZaTMxbVQvVGlOTk04azd3djhCRHNx?=
 =?utf-8?B?REFEc1Bpam93WGZacFVSVWM2T3M4Ykg5Z2ovb2h4T1Y4b2lQTUlsMVBwOHZE?=
 =?utf-8?B?MUJsREkzNk9raURRbFlBV1A3Ry9uSHlVQW5zL2JRZ1NPYkU5WmN6cnlsV3hn?=
 =?utf-8?B?REdNVWVSZ3Y0QVFBVXpWdUdiUDFlTFpNTld2U01nbndYd3JQekFnNUV4Tm4x?=
 =?utf-8?B?MkY3OFRlRGMzbHhxYmlSOWFxYVlGa0IyTTJGS0NkMG5ncmJFMzVyNkdzbW9H?=
 =?utf-8?B?VCs3Q0FhNTBqY0tjRjJtejhzQW5OQ1N3aFM3NzlTM0VqTC9CcFpXbk5YT2Y0?=
 =?utf-8?B?d3N2Wmlnb0xXOURpSjYvVEl3TDkyalZhYVBTcFNRSThCMzBia0NpeHpqQnFV?=
 =?utf-8?B?cEFnYisxM2txN2FJbEM4R1pUY1hrcUhnUjNOczdqbnFGV2pOMkxZeFF1dUpa?=
 =?utf-8?B?R1IrZ2dKNWViNmE5cjRwYlFNU21ycGFZbEZnZ0tMR3Jrb2ZneEh4UHFmdVEw?=
 =?utf-8?B?aVAvWCt1MkVPd3hiZVVKU2FManphS1hSY2hQeDVyQzlhTkd4dkdmc04rZDFs?=
 =?utf-8?B?ckkzRkNRd1p1dFNkMkhFTzZLYit4aGNzWXBuNGlDMjE1ckdTUnZtMVJFT3Y1?=
 =?utf-8?Q?Wbiz0IjkhvgEcIZl5KnVAr+RrM/D8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENjNnFGbVNMMWRjMndBTlNVZ1MzcGxoSDEwTlJRSjg1dklRMjlwUWorWVF1?=
 =?utf-8?B?WGpxakpRTnpOYlBIdUFTZU03YzlSS1JNNGpPNnBQclNRUk4rQjU1NFQ4KzJl?=
 =?utf-8?B?c01aWkZMdFZwQkZrZ2w5NlZSN3dmcllIVExtSGpVM0tnTmJCcXp5VGRKWmNx?=
 =?utf-8?B?NnZtUnp5alc0MVhBRFc0MUN1QU5VMER5K1BWaHhRb09heXo2WkpNazI0U3No?=
 =?utf-8?B?Lysza2pHQzZVWkwzck40ek1MajVzWE5VZC9EZUxseTkyb2F3R21KTUczR0gz?=
 =?utf-8?B?UzcyWHhiVUxxOGh5RWoyVmxvY2tEcHBBVXVSMk82VG94Y3FJSmRUSURuQ3NY?=
 =?utf-8?B?dWd4bERqNXZDVEhxU1g0cGp2L3FsVFRid3dBN1E5YlpNSVRQbitkTnMxV1ZE?=
 =?utf-8?B?cDE2Qjc1bzdtTlgweGtJdTcrMk9vQW5mOEpiREkrMGRGcUNLU0VtZXk5MXoz?=
 =?utf-8?B?cFFDdlhpeEpMd1RGMU1RS3M4MFRVY0hDMmtsTGMvVnR2UXhSZ1N2TlM2Wmhm?=
 =?utf-8?B?WWg5dDBiOEN6N1p4OTl5blZqblZzL3NrT01wcjNhd0duZ3N2bi9kQkl2NDNa?=
 =?utf-8?B?QURqcUNEdXZLY3pwM3RKd1QzemI2a21JaXBRK1hBTlNpeTFHZFlUY3NVZmxR?=
 =?utf-8?B?RUloZXhIUGV1VHd5VEUrNkMybTBsWVI5NzVqUzNIYmxzSU44a1dyS0ViUHhm?=
 =?utf-8?B?NHBKT1h3QUZHUHdYSEFyQXdzb1BKSHdwK2VyLzFpcm02cmdwYUtrbC9LcWUr?=
 =?utf-8?B?M0g3QlZNdXlXa3V1ZCtURUdLek9oOXZRYzhyNTlGZGZvQXBOVVZhYkxMaEJ5?=
 =?utf-8?B?NVlnaXdMZXNvSWVCZ1dsdjg4djJzeVFrK2U5QlM4NklTejF1OFJLTE04d2Y3?=
 =?utf-8?B?ZHZ1RXRUZ2xTS3EvYkozd2NxZ1ZrZ1NtN1ZnaysxUEVNYlcwMzBHakR6SjJE?=
 =?utf-8?B?aXZkQ1BaUEptSHZGNUxwdE9Dc0pxOVRlTFBkMy85YW92SUZieGpIN0xrL0Zi?=
 =?utf-8?B?ZGNFTDVpTkxFWjFxQW5mMEdZNmgyNktxMFMyYXNJcmsydi8zbkF4Y2dJeWk1?=
 =?utf-8?B?MmFqdmd1ZXluNTNmeitIWEtNRUcyQWlONXNSZklmRjFRcEM2bVRoWWE0NkxM?=
 =?utf-8?B?cXgxczhnbVk4bXVVSHFyR1Z2bVFLSHpnbHYxMXlpaTRrcWVsZDRPazRqSm4y?=
 =?utf-8?B?c25NOC8vMFR4NUtpNjM5ZGhQYy9lTytwVEVVZGZ2VUxmWjhRNkJaTC8rSm1a?=
 =?utf-8?B?NVcwL3JWMTRmVFJtY05WYUZic0xwMW9YUFRzQXFzcCtTbW1wdEFQUkxUVjJ4?=
 =?utf-8?B?WmRjSVBpNlZ1WEJUY3QrMnBIWXlFRkZ5bzQ4MTluWXcxRGFIbUdFMGFVOTc4?=
 =?utf-8?B?RDZyMGo1Yno1eEZ2V0sxcXAwM1ZiZlJTa0t1SXRnQlVad3JNVEs2VkFZOG85?=
 =?utf-8?B?R3B6bTRhL1c2eklDemdEYnA5RnBVanNZWUVGT0NYK0MyL093Z3gyOUNBanhu?=
 =?utf-8?B?Y0w5eDAyVFRWZEdTeHlXUUtUbUJ1YUdTQmY3NjNJU2NBK0p6Z0RrRkVMWVNn?=
 =?utf-8?B?dVpLeURrVGZsYUN1Wk9RR0lWc29lZ1VpTDZCKysvWGNBTE92Mi9VVjRCY0ZK?=
 =?utf-8?B?ajZNM2Erb1FQdjc5dTlwQlNDRmdnaFd6WmlhRHdHelV2Si9wTlRMRWt2V0Rm?=
 =?utf-8?B?c04vYmZJaksrQWc5UDRmQ3lpVzlZZ3drVnAvVHlBNVlkR0JJVHlDNFdlaVR3?=
 =?utf-8?B?ZklmQUJYd3NZYU5vdWFkc2p1K0craTA4VUF5bE1tWElxSWJNR0lkM3FaVGJ3?=
 =?utf-8?B?a3U5U1RJd0FLQnVwRTMxaG4ydUJaQ2tNT3YzdnRqNys4bHB2WHJwQm5YQ0VB?=
 =?utf-8?B?UjNtTVppRnR1Ym1WRzZFdXRrWXRsbDdzckl5WDNrZDcrVTRLblBidWtZQ0lD?=
 =?utf-8?B?TThEQi9peDk2d3ZNMkJwa1lyaW8wRlhONUlTMzNnYXpvWm1wQ2hKQitIRTd1?=
 =?utf-8?B?bEZEbFhOSlp2dmZkSFdoeExsR2J4R2pnWk8zampiOXJ6K2RlRFhWUTJkMFJ0?=
 =?utf-8?B?aDErcVlyb2FsWWtmWi85ZHJVSTRDWFpwd1pVZGhUR0pOS3BRWmxxdWdtVXo3?=
 =?utf-8?Q?HjJsBvytOfNu1vZg5rf+Ef8Sp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cd35c0-94fe-4a11-829f-08dd969aa91d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:01:56.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0kKo0CQo5JAwlYk0Agay+HB6johjakwEcUIyggpnWb0TA/FoQt7dsuDQ2vGSw2+qp2wBfG5sU1rgwTrFil/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
gpio driver no more use the static number 32 for gc->ngpio, user has a
chance to config it through device tree for each port.

And some gpio controllers did have less pads. So add 'ngpios' here,
this can save some memory when request bitmap, and also show user
more accurate information when use gpio tools.

Besides, some gpio controllers have hole in the gpio ranges, so use
'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
correct result.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi     | 4 ++++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi        | 5 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
 arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
 6 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 3c6ef7bfba60986b797bb01b843830d364c96d45..880b9a4f32b0846a773dbf9ad30715c84ac2fda6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -399,6 +399,7 @@ gpio_ptc: gpio@40ae0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLC>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 20>;
+			ngpios = <20>;
 		};
 
 		gpio_ptd: gpio@40af0000 {
@@ -413,6 +414,7 @@ gpio_ptd: gpio@40af0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 32 12>;
+			ngpios = <12>;
 		};
 
 		gpio_pte: gpio@40b00000 {
@@ -427,6 +429,7 @@ gpio_pte: gpio@40b00000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 64 16>;
+			ngpios = <16>;
 		};
 
 		gpio_ptf: gpio@40b10000 {
@@ -441,6 +444,7 @@ gpio_ptf: gpio@40b10000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLF>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 96 20>;
+			ngpios = <20>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 597f20be82f1ee044e14bfaf3bd05cff37a8ad39..a275821c35d41e97eb2139a081ef5765d07672aa 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -318,6 +318,7 @@ gpio0: gpio@40049000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 0 32>;
+				ngpios = <32>;
 			};
 
 			gpio1: gpio@4004a000 {
@@ -329,6 +330,7 @@ gpio1: gpio@4004a000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 32 32>;
+				ngpios = <32>;
 			};
 
 			gpio2: gpio@4004b000 {
@@ -340,6 +342,7 @@ gpio2: gpio@4004b000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 64 32>;
+				ngpios = <32>;
 			};
 
 			gpio3: gpio@4004c000 {
@@ -351,6 +354,7 @@ gpio3: gpio@4004c000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 96 32>;
+				ngpios = <32>;
 			};
 
 			gpio4: gpio@4004d000 {
@@ -362,6 +366,7 @@ gpio4: gpio@4004d000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 128 7>;
+				ngpios = <7>;
 			};
 
 			anatop: anatop@40050000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c208869d11d7fb970ac84638f45088..13b01f3aa2a4950c37e72e04f6bfb5995dc19178 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -686,6 +686,7 @@ gpioe: gpio@2d000000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLE>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 32 24>;
+				ngpios = <24>;
 		};
 
 		gpiof: gpio@2d010000 {
@@ -701,6 +702,7 @@ gpiof: gpio@2d010000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLF>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 64 32>;
+				ngpios = <32>;
 		};
 
 		per_bridge5: bus@2d800000 {
@@ -855,6 +857,7 @@ gpiod: gpio@2e200000 {
 				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 24>;
+			ngpios = <24>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d38219fee312baadd4665674a141e..52be83a168d9ee6452a63039c89169d49b63eb60 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1197,6 +1197,7 @@ gpio2: gpio@43810000 {
 				 <&clk IMX93_CLK_GPIO2_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 4 30>;
+			ngpios = <30>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1213,6 +1214,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43830000 {
@@ -1228,6 +1230,7 @@ gpio4: gpio@43830000 {
 				 <&clk IMX93_CLK_GPIO4_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
+			ngpios = <30>;
 		};
 
 		gpio1: gpio@47400000 {
@@ -1243,6 +1246,7 @@ gpio1: gpio@47400000 {
 				 <&clk IMX93_CLK_GPIO1_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 92 16>;
+			ngpios = <16>;
 		};
 
 		ocotp: efuse@47510000 {
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3661ea48d7d2994df7b02084e9681beb303aa133..b8ffc428e95be1938bf5e73316b4163acaa04701 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -785,6 +785,7 @@ gpio2: gpio@43810000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -797,6 +798,7 @@ gpio3: gpio@43820000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
+			ngpios = <26>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -810,6 +812,7 @@ gpio4: gpio@43840000 {
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
 				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
+			ngpios = <32>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -822,6 +825,7 @@ gpio5: gpio@43850000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
+			ngpios = <32>;
 		};
 
 		gpio6: gpio@43860000 {
@@ -834,6 +838,7 @@ gpio6: gpio@43860000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
+			ngpios = <32>;
 		};
 
 		gpio7: gpio@43870000 {
@@ -846,6 +851,8 @@ gpio7: gpio@43870000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
+			gpio-reserved-ranges = <10 6>;
+			ngpios = <28>;
 		};
 
 		aips1: bus@44000000 {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a2911224cadc16a943cdb467e091e43384..a2f4fcffcde59849bafcedced3ff317ca6c7cf78 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1152,6 +1152,7 @@ gpio2: gpio@43810000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1168,6 +1169,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -1183,6 +1185,7 @@ gpio4: gpio@43840000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
+			ngpios = <30>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -1198,6 +1201,7 @@ gpio5: gpio@43850000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
+			ngpios = <18>;
 		};
 
 		aips1: bus@44000000 {
@@ -1508,6 +1512,7 @@ gpio1: gpio@47400000 {
 				 <&scmi_clk IMX95_CLK_M33>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
+			ngpios = <16>;
 			status = "disabled";
 		};
 

-- 
2.34.1


