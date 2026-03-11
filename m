Return-Path: <linux-gpio+bounces-33170-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGXcBbS9sWmxEwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33170-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8626909F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00404304227E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8BE2FFDE1;
	Wed, 11 Mar 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eHRBZK5W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0DB3DBA0;
	Wed, 11 Mar 2026 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256110; cv=fail; b=Y3thhS8Usqu4cHKoctsa4KOAfX92MI6vPYnTGuTyA8kvYZMZCB/BSDjDTBcDDBuLS2r8+JwedTvBIem/bxE1fhtKPK/srt0jOKqVKlGP+arDBtpo0DkgpxoJ4DpY9dQ2DApi2G1u8fAYYmnaukI6NYxnPthFsRWrUvIiOxJdl80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256110; c=relaxed/simple;
	bh=DNDNXydLDck26MalMw3pVFLQSMrV83t5TSuneLzwwl0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TlAEzvFJN9HC8Pabbc06R3SLDkSAJya3rP1ksDeMJx8BRmGVlsfkCQF2ZvQywqHLlDc5mVnglsnwuNj9nT4fqZiKpZ0wWuGoXs8LXm4Zl194E3xqXWz9v9b30DqV/3DYIO7lQKLqAwJHJWdiv9rohswPELZ9L38sVcc3PTKbE1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eHRBZK5W; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjWB7cJA6K/1ZDGlTfgxZfTSHAGVu0l1FiyQTPrJ1jsDpJOim8QjUim0XqFzNKK478Rude9EIBiJxMbh/nXd5ABBUzd/v0SjGqtLbgg+Sh686ethVilf0E+186MBlsQCAnNBig4m7qdxS/2VQ7rN3nZwwE3jhHe1EsD64r2rNk6nd7L83L1RwU9aFVusSctzZABaCrGjBcgr6gBTPLLa7x2RW+KRx8zvc+wZSZW261Lm/V8WrNlvKsvouo447B9nViWwzU0uAZ3NnBzX94NTLvTTqEgiIhH2ISaIrn8ZWexM1Ysrhnekb7DP1o5Rthus8mEZI3sWk1rkzQRFMgtTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4zpzKU33pDixzTIO0Px7UjU6RxkOspLxGYHiyXofp8=;
 b=IOY5ew+ccCHVEdIZXBtuuDDpLpXEHpYWd9RRkx10wO+Yj9BU7jiN/hTfUon+p4uxpDiikDKsmp4DkgcRy8Rg+d1b4IwANZKkFCqOz3GJsNZB7HogbnsxwYCEqiWOoGKTTO3hdDKzB0NjhXj1qwyoCGngFF+FHVwrLMOc1MMSOPPwLiAboxa+rVAUJZCFkIwibWvS+lcQ+fI9KaXxRXp5VP2P4KzAMvMCNEEzFYxNZzdgqsx1I4nRrjA9ojE6LaTlwPaZ0SNJ/cge1B3Jn1leb4yrCZYBLS5OeGa/jO33Y5y7giADVffq8SA0juLCgdfNo1llz5qczfYtRgm5pKzMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4zpzKU33pDixzTIO0Px7UjU6RxkOspLxGYHiyXofp8=;
 b=eHRBZK5WYz8dsSZqjPz/3eyJdxsXy77LAd8dao8qXQolYSYUhmmnZlUUf8EVcuPSKMQcx7+qXYAX+Ihbp7nuODD3jQChaNGaBoi6FkZeGeYo3GsY0nWyWcdYWmByOe0wW4CRWal7pfEwLylqB3LiK5yELNVc2ZbsspOiOCGtAhHmrONcMduSYuvP8hDbqy41EPmZU3BQGTu6W6ltIbPDNNybiy5W1epdaoThgegTOrBqslJZVlp0MlvZxDvVrLGceNUEAREOUA17m6bHFNJhb209Pn8S61Uocd4m7tfSITLn38UJNfVtyfzQR9f4yZlWKTzMQm4tWw5ju1QA87z7hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by MRWPR04MB11493.eurprd04.prod.outlook.com (2603:10a6:501:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Date: Wed, 11 Mar 2026 15:08:09 -0400
Message-Id: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJm9sWkC/1XMSwqDMBSF4a1Ixk1Jbh4+Rt1H6cDGWC/UKIkNF
 nHvjUJpHZ4D/7eQYD3aQKpsId5GDDi4NMQpI6ar3cNSbNImwEAz4IKO6Mzkn7R/zbRpS6PuWnM
 lGUnF6G2L865db2l3GKbBv3c88u39OuXBiZwyqvOiAa5FnhfFxc3j2Qw92ZQIfyWoYwmp5FLoG
 lRbSyV/5bquH1lQ69veAAAA
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256100; l=4514;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DNDNXydLDck26MalMw3pVFLQSMrV83t5TSuneLzwwl0=;
 b=Sb1h/uqrELewMXYjMQHrklFm8t2Ioj9Et+/kx+XmU74Op4/IB1H1Y6UkMLe088S+Jj+49JeQ9
 dQ0KN8Br+WACmHvdfYbFS+SMoTbU8dg4/1BXtZyeAY8awy+zsBBk2lC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|MRWPR04MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: fe92f4c3-ff15-4721-92cb-08de7fa1913b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|19092799006|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X4b3GkgQOpKF6FQ43ppvMJfNiEVjPuDeel1x6oEuTJRnxgqBSpyN7Ab3t/Ll7XXMz0chj/deZEkWM2Q4JMb32x6ilHWYkRFepg0rsN2+uUoBB5dMwKk9aK0ErwRnI6yggBSNe6AKhGLQhG4ei6QR1u2sN17jUUVf4yVxD6mZ8UmyFEykeaY/8W0tv1TeIdBQYIDsbWPzf71X3/aNnMrcnvwMXEzJYZ9VHb+9TUh56zxdM2wLsDj/h6z9AlrAXzSS7C3cxpcFUWRLquATWQP9sGBfjSx0RD7LABlo9a1ZxxB+XbFzwVaFGMtITlSb8syeOgZfQ7nQ3OfeJAE0PaM76hgGkxOx/76Z4CdlOS1mqCEcxbSfLB9m2B2CSL7kxbl28+E3ahU9bDnDIuSlsfddT6taprfgeyx4xChKSKRthrJkF4eN9pUUj1+xJ9YcrMrGgW/5jCfE9vtCS/yqliA1u+iimpKnO/sxBygn6LWt0KVlpuqwW83GHDiXbFNj944fYmoAs4f5s4jRObIWLjqvi9D2zjPAbegzHSUYwNq6IObnAiljN0XQdhAKBjHuMhAJkTHVz07VxMDVXCxLoVj4ddGusaA1n8dnYuCir+n/0tj7s8SARsxglzNlSw/q6j8WQpeVipPIuhgw1uU/yGmyqKzzA3oK/J9OgM5bEGuEUscAIShcBCE6yWNuOeTMu58hVS/7mtsGP6CwjmVconR9JK404PSddHbyevhtW8SYKfTnb0MSIiabwrr7o4ikEoblpbReyxaMTrDRRhPgsJshqZnD1whM/sIJCl0tvRjDtT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(19092799006)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ni9FZ2NJekkxUzdWUUVuYUtobUtkaDRWS3RCRWhMeHRUc3VwczdNU2NjdHBo?=
 =?utf-8?B?TDFOZHlTOUpickpvM0JwV0QralRKR0tzSTl4aUNxSkZXUjdGUXBzNmV2eHFQ?=
 =?utf-8?B?Ym5vSlBLU3VkZ2N1WURFRTVoQllndlJldi9zckxHSnl4SFZ4VjY0elNJRDlz?=
 =?utf-8?B?MUlZTUI3OTU2N1ppWmNtMkN4YUdheTl3WTcwM29yYmd5QjJrNm85SDgrSDg0?=
 =?utf-8?B?N2VSMXBEVUdEWkFFM0lLaHpDT1FlNE15dkJiZVo5dENWMlVPSmVHU2luL2R5?=
 =?utf-8?B?ZUxkMGowa1htYjZjRWIvUmpVQis4Q1l2MHhrUElKZXRydXd0MFBhc3RiMjhO?=
 =?utf-8?B?cmlZc09vSitDUkpSYVI1dHVmS05xZGVVTVNlWHgzelcwSThCVkVRUUdCSkJS?=
 =?utf-8?B?RkdlcVQ3SFZVWlRvNnVJRjIrdEwxZm4wWjg2bHZlSVRPdmRQRUl2bkwzb2J4?=
 =?utf-8?B?eEZHdEFPbDI2TXpna0xvZTUwL0ViSDhVdDdJQWpQSW1FR21EN1BhVWVjVGpH?=
 =?utf-8?B?a3oxd2RRdU5lZzd2Q05UMlBKVFEwV1FPTE5RL2h3LytRQ1M2U0xoVXJwRkpR?=
 =?utf-8?B?UmJCVEhOM0owRDB4Z0ptMERJalZZUzdjamgxalcwdUtGQndWZm1yVkZ1aFpG?=
 =?utf-8?B?aVpZYU9DcWd2MkJKQVVRQXVIejdyWHNDcXpxUnJpRS9oUUZzbGdod2psYndP?=
 =?utf-8?B?c3Z0NlNBNFNXWS9vN0Q0dWk3dkJRTHVOYWNSa3IvTVczZVYwem5zbzh2ZEZ0?=
 =?utf-8?B?RUV1Wm5KcmpoTTNlSFhhNXVlSlhJRXVxRG13c3Y1ZklTSVlWUm42cmFmcVhv?=
 =?utf-8?B?b2FlZnp2anNwdEVBdWx6N2FEbjhoTklhTUEySHZxZlBLWjB4WWhhUW1tamQx?=
 =?utf-8?B?aDF3QVFpUkFyVmxnYWVZTlJZY1ZQelhPa0xuT3Bmc2FQV1pTVGlMWVBEREV5?=
 =?utf-8?B?QjJtSU1YRW1PVy85MXBqVW4xajJNV1hBbG4xSUI5ZTdlSEdGVGlDeGUrVG5M?=
 =?utf-8?B?TC9VQzU4c2VKS3VGOHVhUlUxSGVXSEZqMUNlaTU3NUFkbEFXaVVoaWZ6dkxp?=
 =?utf-8?B?Nm0rZXA1T3JHUW5sUnNNQVNlVThCS2J3bitWSGhyM3l6c21tZi9JdlZ4bEJP?=
 =?utf-8?B?a2Vxdy84SURnWVRmYVVSOWFPeUdpekE0eEJ3U25yNHlZTUJ4VFFQdjdIUU0w?=
 =?utf-8?B?TE5mOVhPVzNlZ0NVNEYvclRpTVArWEhvV2xjNkpkMWhKRlNVa0x1M2RKSkI4?=
 =?utf-8?B?dzF6dVoySzkwS2Qyc05PbTl1c2x1RFhpREorT0M1cER3TGh5OFowVUR1SjZI?=
 =?utf-8?B?QlJnekdqd0J5MmF3dlllUkk1TnIvY2lWNDZZOERtSVZCNEl0ZEFVaitIZXds?=
 =?utf-8?B?SFdhZjZKLzBmMm9TS3l4SENET1lXN0VxWDdxUjJqTDBSUWZIV3Jhc0NSaFo1?=
 =?utf-8?B?M2QvdEwzQURUUnJnVEduNWtpY2tNS3doSXlpUi90SDFRZWNtWDBKTDQ1bkNn?=
 =?utf-8?B?NmV5VUxacVYwZU5oTHpHcHNDNGZjemRvRlVKNGNDY3ZsSHlhRWFMeFdxMWNB?=
 =?utf-8?B?ek5rQk92dnk0dTFKTUthL1lUdlcvbXMxajVoM3FNbTMzWU9zZjFlTHJsS1JJ?=
 =?utf-8?B?YytML1pBYVNCdkd5MlNNUHVOQXZlaXUzdnhDNEx3c1JsU3h1czd4dlg0WGlx?=
 =?utf-8?B?MGhkTGM2TTFvWlpmUHI4Y3JNeGhaTHVlRXZRNU4rYUhKeml5SVFxb2dYU2hv?=
 =?utf-8?B?OWswREhOUGhsTFBjVnh0MzYrTkt0TnNxaVZnMUc1MmlQcHB4R2tLbUFJMDJy?=
 =?utf-8?B?dWtDelJyendCNEQwekp1UTh4ckExRXFneWlENFoxL2FaRUZvbk1ZcnpUTlJ5?=
 =?utf-8?B?UVlQT0N0UnpBRjNtQ1hpeFhqMUQ0OW5Ed3NiTUlKbXY0ejdOSjk5NU5LaXph?=
 =?utf-8?B?cW1kL0N6RTBlMGN5TUFxbC9KRzlJSTkxY2JrdzdlTlp4Z3hzbkhyTHllVmZ1?=
 =?utf-8?B?aDkybVVrd1lQaGJYQi9qOUUzZVRjOFRYSk1YOXJWekVnSXpJWEJ3dUJZdEh5?=
 =?utf-8?B?UUxOUWRGZHV5clBiN29OSlpVcmxEWHJvakltWlVWTVBBMjhGdEJWekpZRmFC?=
 =?utf-8?B?M1U2N0pzbnZSMUlMK2VYT3ZDWFUvYlI0dCszcmpoWjduTEFNYk9BZVZBdnBl?=
 =?utf-8?B?b3Rtem0zcXV0V29raU9ZMGhFdVZLZ3FCUDJLc3NIWlZSbXR5NHNNUGVMaFUw?=
 =?utf-8?B?OTQzcHE5TUFMZXVqdDdZTTRMb3AwZzhjVkJBb0k5R2lMZ1JYUmhZMjl3Um9O?=
 =?utf-8?B?bkhLbk1EYytzRitpVFJXNHAwUkltZHAvR2Vac0RIcTYyaXAwUWV1dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92f4c3-ff15-4721-92cb-08de7fa1913b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:23.8812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yL+Moho1Fa51JDjW99ixcfIZaGjgyuAjw2BBpYkohdjjp0ihj11zgaaKSvtpEzukyzw3mI7SoSf3XiE7810Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11493
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33170-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 6CA8626909F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
      mux: add devm_mux_control_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: pinctrl-generic: add __pinctrl_generic_pins_function_dt_node_to_map()
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  57 +++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 ++-
 drivers/mux/core.c                                 |  40 +++--
 drivers/pinctrl/Kconfig                            |   9 ++
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinconf.h                          |  21 ++-
 drivers/pinctrl/pinctrl-generic-mux.c              | 178 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-generic.c                  |  41 +++--
 drivers/pinctrl/pinmux.c                           |   5 +
 include/linux/mux/consumer.h                       |  16 +-
 include/linux/pinctrl/pinmux.h                     |   5 +
 14 files changed, 373 insertions(+), 44 deletions(-)
---
base-commit: ff76d257e86235eb07ef33db8644a517c48d1c3f
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


