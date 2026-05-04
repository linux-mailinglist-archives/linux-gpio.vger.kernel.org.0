Return-Path: <linux-gpio+bounces-36099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NlJKv4x+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:55:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD134C502C
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D687130252A0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF0838CFEF;
	Mon,  4 May 2026 23:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PInHopCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0C3E639C;
	Mon,  4 May 2026 23:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938901; cv=fail; b=MGkckaNwOkh5weiexna5KsRefV3zc7m387Dl6+FBA54Q+5/y9rcJpVCwcCvsil9VfRbKWKYxWIFwzbCP53Ft0KkE0nzV+caZ+ODMsiUEudtApxONh6cnl3Wsg+YHtVB55avUB/+oN0Do0OZP7HB9+qs+6ulGmmZPGElVKTF79vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938901; c=relaxed/simple;
	bh=p7r1V3wgxD/DnTIXBKxNfmc6AeqlUF4o1h7egbPtDXY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=WnsZpmEE00TBAb8aj4gocX/8Qutx5rg+areT3u2StkCV3AYpwMf3kPd5ZgU8rZfXFaoU7+hfOT8pucdpO9hHC+xiKqV4cLi7Tx1MvMDewRgpWelKklCC7WqeCium1tBH1UvbpMxc/JeC0AkilWaWhkvotWXHVLoQnoswvZjeFPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PInHopCx; arc=fail smtp.client-ip=52.101.83.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laaz0DGcanJY63O01dwwh7ZEk8HyHjhYNmEJptdRjWdV/lyiwUtdRM/XM5Ki6sTNmMivgSCfa4pYuxZX0qZfEkm/74Pv0+lk5IO3Lh5dooEKB6Cn0niYMT/XXhJ0FknK7XLzTkd6p9OFsbO0DyyGhPHSyFjp5TlJrswqG8Tg6ir9qyBLAvk0EZryedKRRrroBBUqFElWfXRuRz7dLg8YIn7ysnwJ1/Uf25BExRigZvIuroLezj2zVs2gcuDc8hRW5vB8N+nm+2nKvvtczJtEFLzZ3pItFF7qT3gXYqBDppC8X3fRL+vB1C3zUx3eirxkETuozYyv8liZC1/AawWehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYRKKAcDB4bHmGOsWliKbhpzSyIucQS7Dg57O4Qfv0E=;
 b=e6/SDbmY4BB9NoyvuSDfIxa1WUr2AgMfHlLxa6+HWosDbuym94oGLP9exzr2D36F3nbUB/38GZd5sK87glzwAaSAYPyMs9pe7Q6lhaaRiJUej401PLq3NNVhiUiVljUUjOkNuASOZM8ccmDV/QprGPDCfss2n5e0iKQP5ELVt5TwW6FiLnFb+tJARcGlS5eH12uweFtNDdYcQC7a7ZBkrulNyiBKyE1QoiWbbLI1B0gWqtMlsAxI67kSLQGb70HCRBZHn9jJjr82IWTQAtdqJVCkHT9bMfjg3AaYCOruRhUleo+bOAtyJg6RjXG5je4wqyx4rLfLMVWhT+t3x8SvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYRKKAcDB4bHmGOsWliKbhpzSyIucQS7Dg57O4Qfv0E=;
 b=PInHopCx2IxkVKG7KwvORuUtJr/l2fVtFiuCuiy2hUFr98IlilFt+8hRpHWqAAUDW1pEwYpxA848VwFJaI3KsS+iWZWI91cVUSt1O00HSamgK8rKalKdl+Sc75HtqI8yuzGV2DRHjvsEIv1XAQEKltNBQ7vvEaQ9Z2aCaaMLhwIUcirmQS9eJ6DNa4RdViXSwiNs4hLJB6qrqAvAjnXvkjuxnN+7HHsiYdjaaKWOG2JYz3xIbGCYuLCpKPAueL0q6Wc4KKVep0PKxGeHziJKhw2R6Y3XC3QrTyurVUw5BSVD9iCl25li/pzRE1CfHZbVZktI54Fq6nsrc/z3azIlrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:54:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:54:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Date: Mon, 04 May 2026 19:54:34 -0400
Message-Id: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALox+WkC/13NwYrCMBDG8VeRnDeSmSST1pPvIR7aSboG1rakW
 rpI332jIDZ7/AZ+/3mIKaQYJnHYPUQKc5zi0OdBXzvBl6b/DjL6vAUqJIWg5Rh7vqUfeb0v0nc
 125YIrFEiizGFLi6v2umc9yVOtyH9vuIzPK/vTl10ZpBKkqs8AmnnqurYL+Oeh6t4VmbcSLSlx
 CzBaGrQdo2xppT6IzVAKXWWqKkFBtd2dVtKs5H/f5osldGMXGEg1KW0W+lKabP0pglce0Im/Mh
 1Xf8AZ+sHHIwBAAA=
X-Change-ID: 20260213-pinctrl-mux-df9c5b661540
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
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=5216;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p7r1V3wgxD/DnTIXBKxNfmc6AeqlUF4o1h7egbPtDXY=;
 b=h76Nk4rcwCTHYqX8Y8EvZhAWl53rPBHnGQ3x6TPHlR0pQSIkBGEz6XA25ZV1cKsesrnGzjSk+
 nOpcG/yPA4sBcGHSbC7KcMxkdYTPNNmt6WPmptji0xDYAWBtroAFMTX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d18b42b-fbc2-46e9-bb58-08deaa388a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	1Wkx3fhb4zV2JhQHIpBqp6Ei6AWALluWPY3fo2ly763cJFjORRJz39O6P78jTO5JZJtNy7duJSn67tFSn1O0014LCzk1+zVC1ygVfYGnY8Xl6L7qOXUDeG1uENwd0YgMHT9+sRynQxliuJuvSFF5b4LIaTJ2NyZz8C90ANY/abQcNUD8BBh0jS0VyPgLs5MmmzxTS6oPZkN0XUXSd71MVF0/o86CrMEIEaUaI1oZIWO3pY9uuSHpy41vVTr2nbTqKU0BStWO3rwehpp3Tklm2rVWVjiYj6UO7su+39DaD8U8s7dfNMuXexgoKnLabLRajoJFxe453FLzsVBm+TvJZ3+PmHhKqkdugsBBeYw7riPx99cTQk3UWTIPs3eRvxA5bksSox3RZX/pTfm19x+2PtTCq7PFF67/NS5xb0XXeAn5vBzLNdYYubD/68up72NlNjq9Mm8XXBTjeF1s0XtxGemrmRjopR2dWwJyKWx+Oc43da33oB2Ev/U+GwximkpvkFQsbWzqcFvnNA1ZPxOcpCfFpEwRoM9C4MVZGT4mR7u4RS0/gUs+Y7+GLB0fsS2/FEoKtp/SSoN3n1qHgQ3uJZnuj14bfbChET1bd/dcLIffS/unVmCPAxcRGElAKjJqCVOIpl8zF4+3caQpte+XZG05tY6yRrVdFg6SQn4OVJNejGXkDYqNxaTl/H+C6QXV0ikIouhuwNwHS0wu8usjZjZ3g3rM+XdumdV9PxLq1hRGBZYNrXGvx/6/VoLh4tK9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnU1dUl4SDJjTEl2NUhZNDhlaUdqWnMxWkJUaGdJaUp6Ny9oSWFocWdWRTgx?=
 =?utf-8?B?YkNjeDFwRG9kMUg0bGpxKzVzTW9HRTBjcG00d01DN2xIWnpmTFF3c1dZelhK?=
 =?utf-8?B?RHNuQ3hTWGw4R3FOWnkvVHkraDhXYVUrK0JwL2hXZ3hOa1NCWTJrN3VsM21G?=
 =?utf-8?B?c2NreUd4WHVDb3FPTDkyU042UzJvU28yN000bjFSSGtmUEc4c25hS1hnMndJ?=
 =?utf-8?B?R2RWV1NXSk9ZVkN3ZW9hdmVvQ1dTRTZZb25LR2dtc1FEZEROUGZJamdaNS9n?=
 =?utf-8?B?SmJESGpXUEREcUpKVWl3dVAwR0pWMWhLNDZibkxvRUZ0WWlPSDEzZGN0RXRB?=
 =?utf-8?B?SWZ2UTUxdkJvYXYwZzVQaklWWEhkM2hMUXlmQVdQWmEycTZoQWR6dGNZYm43?=
 =?utf-8?B?bXorOXlTZzJ6Nk83NHhXMVBzZEFCK1dFeFN0Zzc2MFB1aVZabkFQdkc4RW1z?=
 =?utf-8?B?VDF0b0FzeWNzeFdiSlcxZDdTSjI4MTJPVWtqdjBKcThaQ2ZSajQ0czBWZ292?=
 =?utf-8?B?SDY2TXR6Uy9SRTdsTWJrbU0yajUzWFZLN1ZWdlZGSGtmWml5c1JpT2JXT3hV?=
 =?utf-8?B?YUUrUTVEVTVQOW40VEViM2k0R1RMU3Byd2pBRyszZkVYK3czSzlWMGxPdmlH?=
 =?utf-8?B?a0xudS8wSnI2b1ZyK2U3M0NZRldzRkVlSEJRNWlXUDI1TGpQZnd6V3VMUzFC?=
 =?utf-8?B?WjBpT1g0UUgxam5kRHdkaWVkQzN1OEZ4dDRkWnFDa2V3MXJiRnRxZXNJM1Nx?=
 =?utf-8?B?WDVWRzRUdW5iS29MS1NnMWd2SWg5MURpNjdoUFJ0b1A2SkVHRUYwbmNKM0pM?=
 =?utf-8?B?YVlYT09XME15VThyQ2QyZGN5cFBib25DMGRLMFQyNGpEWFFmVWtVN0NjS2p5?=
 =?utf-8?B?MTA0bytUTXJJVDBselVXckNYNTNKUFgranVBbVNOdUxxTGVXcVRMVzVEN1Jx?=
 =?utf-8?B?ZmJvSUh3YzBKdXdmbnBUN01abTdhMlZBSGxnZTdkbXByOXJoNGkzRjFudXNz?=
 =?utf-8?B?TlliYXpRQk4zNkVLdUE5LzdJRS9KZDdrbjVyelJiMWVxOW9pSFd1MVdwN0dm?=
 =?utf-8?B?RHJodVJqNHJORWZYa0VaWWN5MGg4ZjlTd3JUTnJRMGttZkRLcW44QkF0UzRp?=
 =?utf-8?B?N3ZkZDhBTmhFNXNUVEJEUEZ6eDBYdTV2K3JMb2JXVHN2M2hwRDcxMGZzcmZm?=
 =?utf-8?B?WGhVVWJHTURCZGIxbFAwbUhRbzJ0TnNGNkdGbWl3UktNbmhiSGVuQm5HZ0E1?=
 =?utf-8?B?djU0QnpGL2hMeGR2dEU4OWIxVTh0U05DSTVnSUpjNUZ3QUdOTEtWMDB1bk5W?=
 =?utf-8?B?UC96M3pTazYwT09xeFNxQnYvcmpGeWF4a29JdzdQWmlLNVZVeE9NTFRnTlFo?=
 =?utf-8?B?cTlnOXBOWmNrTkVLN1M2ZnF5ajAxRk1KVHNzM2wzZDZveHVxL3RJVHJxcERY?=
 =?utf-8?B?SHI4WVBQQVhmdjFQM0ZVQlo5Rm9YMEdqOGNrMlZoZE4wN2ZTeWVhVkJ0STQy?=
 =?utf-8?B?Q0RIbmErSVdjeHZGSjlraExPbWlzbU5VYURvUSt3d0doa1pTVFNkWnAyNjcw?=
 =?utf-8?B?bWtTcEdOYTgxWWxhQnNwN2FZMnhodlZFVEFwdTF0bEdrNllsWHlyNFFRcGhR?=
 =?utf-8?B?SzhZVDJBUXFQRWxJOVFFaGJsaXFRR2VzYm5NTVhuNFBzV0doQzhEeW5LTGcr?=
 =?utf-8?B?eWczZVdaQlpYYVkxYkt3dG1kVGlZeHBWVHY0UENhK2ZwREdQVXExV01RMC84?=
 =?utf-8?B?ZzNEcUY5Q3k2Qmp1VjJMcEdPajJlTjVhRkVhSGF4UDh5OTZaRnRSSVR2Z2Rq?=
 =?utf-8?B?VGx0eGlITjF0bHJEd3ZndFZHZUtxOVJSbjViVXlnZEhYVnhDb3VIckFPTXhJ?=
 =?utf-8?B?N1pPbUt6SzRGREpCQnAwTythalBvaUp5cGsvZnZKNWtDcEdrYXJENUFIS1BE?=
 =?utf-8?B?V3hvVnRHMXptajJFMURHMUFPR3p6V1RNc0k2bWN1a2xEN2tNbURYc2prNENp?=
 =?utf-8?B?am1CQk9Nb3lrRWFZNE9TOEdRd2FtZ3pwQlB5cWhYY3QvYmdVOVN3S1U1Y0hF?=
 =?utf-8?B?bjl4MzU1Mi8xTXBkM1M3cjFvK3ZxSnZZY2hzOWpGcldmNWFYMExjR005aGE5?=
 =?utf-8?B?UWM0MWEwLzNUTytDRWdIOHFNWTBGYU5VOGEvZXhEKzZrZjNzc2ZSdExhckRR?=
 =?utf-8?B?UFdFYkNPSmV2dkhDUkVMU2hYdllaVnd3UzZ2OXhENHIyRFptUDZXQkFQVUoy?=
 =?utf-8?B?cUkwbVF5NEZWYUNPU000YU5DbURGQmlsTDdYUzlVeG04OFk4V2hKZjVkQ3FY?=
 =?utf-8?Q?hdrrUqH0De/d1+Hinw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d18b42b-fbc2-46e9-bb58-08deaa388a64
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:54:55.1624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSz8PuyNUZXOTDFjmk1tMZedKu0RNW979CsmhHXWG7q3nYQu6rD5TKe5RWmX/L+Pc6EwEqgpnckAO+Ebjvipag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: 0DD134C502C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36099-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

        ┌──────┐      ┌─────┐
        │ SOC  │      │     │    ┌───────┐
        │      │      │     │───►│ MMC   │
        │      │      │ MUX │    └───────┘
        │      ├─────►│     │    ┌───────┐
        │      │      │     │───►│ UART  │
        │      │      └─────┘    └───────┘
        │      │         ▲
        │      │    ┌────┴──────────────┐
        │ I2C  ├───►│ GPIO Expander     │
        └──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v6:
- rebase to v7.1-rc2
- remove devm_mux_control_get() change because it is not used yet.
- fixes a AI review bugs about cur_select.
- fixes missed EXPORT_SYMBOL_GPL(pinctrl_generic_to_map)
- Link to v5: https://lore.kernel.org/r/20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com

Changes in v5:
- add npins to pinctrl_generic_to_map()
- remove pins = kmalloc() in pinctrl_generic_to_map().
- Link to v4: https://lore.kernel.org/r/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com

Changes in v4:
- use Conor Dooley suggest to extract funciton pinctrl_generic_pins_to_map()
- Link to v3: https://lore.kernel.org/r/20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com

Changes in v3:
- collect rob's review tag for binding
- extend and use pinctrl_generic_pins_function_dt_node_to_map()
- add judgement about
commit 2243a87d90b42eb38bc281957df3e57c712b5e56
"pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"

which call pinmux_disable_setting() before pinmux_enable_setting() when
switch state. It is actually what wanted. Previous remove .disable() to
avoid hardware glitch when switch state.

New .release_mux() call intent just release software resource, like lock,
don't touch hardware register. No glitch involve. Comments already added

Linus Walleij:
  I hope this answer all of your questions. If I missed, let me know

- Link to v2: https://lore.kernel.org/r/20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com

Changes in v2:
- Add release_mux callback,
  test insmod/rmmod, mux_state_(de)select() called.
- Link to v1: https://lore.kernel.org/r/20260219-pinctrl-mux-v1-0-678d21637788@nxp.com

---
Frank Li (7):
      mux: add devm_mux_state_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  57 +++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 ++-
 drivers/mux/core.c                                 |  42 +++--
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinconf.h                          |  18 ++
 drivers/pinctrl/pinctrl-generic-mux.c              | 185 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-generic.c                  |  95 ++++++-----
 drivers/pinctrl/pinmux.c                           |   5 +
 include/linux/mux/consumer.h                       |   8 +-
 include/linux/pinctrl/pinmux.h                     |   5 +
 14 files changed, 410 insertions(+), 59 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


