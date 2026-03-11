Return-Path: <linux-gpio+bounces-33172-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILZxDb29sWmxEwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33172-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A89492690B5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46F3A3046D80
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4090336EC5;
	Wed, 11 Mar 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="akJAXFFe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3D34D902;
	Wed, 11 Mar 2026 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256114; cv=fail; b=rdyOwR6VWe8/jeZpAJDMi35rFGZ5t22ziCi6bvJBTo+eE79NzvIpddS9WCuklInLR+prKDfW8pWjlw1UvtNvbBF8w1JiogMOJ8BaqF9O81lW4G915QV5gzC+MUYyhxiODnipMOtUyU0LRbt9s1Fs7JAZ7+05CDDHT9unIu/Ho/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256114; c=relaxed/simple;
	bh=2uAnqhb2KXlq6WaSjwHOhwpzhVy1hHRfBulJQVbCOZ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CLVQHuek+FAANQkZwJ13dt55q8/fpcAOnL49I1vmxCr78X2q1+On3mDiHmTnk5yqfH2fjLkm4mvA/OMhP0uhpur1ffWeflPpzOEdzbeuX05i5F+3NkixFSZePlASCVwAEVJhnHaFiYaYqa0MGmTYSxKgVqAiSqAXMgWazGZYrvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=akJAXFFe; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHYEQL7JyEsIvqCmrM4u6ByAboBmQZFaLWwLOt/H73laG+WMADzP9TuvX4htJGZnFRpjN7iilQIzm28RaewXeu7iRL/kGsIIrhY/hovgUIPKgc8saEpBHONy4x14bKIuFgNWvB2pZLOfbhXip0GzmmXAFfNKeCfx+hTF0lBAswazEeOlOcagMrePTCHODMvlaRRJTWK56tIG9wQgUerOHhwndZDHmTQOPY5U20mtxpkukh4T5t5jVqIIqJ1QRfniIm9Zy90Y98E77bocYNCOJgKwsKUU9Gxo9on4DhCb/Rz4DFdEPL1m6Mqea/d2NbCjatAOsTWhC0F3u366SXKWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEEsCH20P1JwsO3MwOhDgBWjtVxn8MFMUAxAFnfs6u0=;
 b=v9SDv6cR5kDPHmr7iDg8Q8w77IsmRR0/ugi+kPEhpxXdg/ftFpNe/Ib6unvXFI/YnivhLSeiyRFkbkKamX2nUvLqS30y/5NNwOzFDoPckUf8QF5WLY7mXp5+PDz0WcLuoll5riBA09D+xLEVPUJLo+hQdgthmDkikX3xom1sXgvdUISCxSiUTpXYpO73gyTQ3mof0T2PLitoS9v7zOTxTLITaO+KwAK4L4P1zbv5maJYXtk8pKf/ZVMVIU/lkXSKo3JcMsRSBQA+T/Agd2DOuzWWKV2jFdCbgVsbDjY4PSK8vIdig33yhjeG/ZUHZyLGqa512aMHGNCmjpgVSxmqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEEsCH20P1JwsO3MwOhDgBWjtVxn8MFMUAxAFnfs6u0=;
 b=akJAXFFeyEd9g6GKJA63AJ7GGtRH57byy/HYGurMtJg26PGQkBHd9pgfZyVUvZUIwclzUMe1m0TdmdfwrqbDRBF0xDi3C09BFxV2wOQawymAkMwYyQWfyGiKovc0cLR6yfrMenProw+1vb9YdAr4k9oYZCBCE3Agd1+drZQa6CGqMq8r0vCRnk/cDi3UhkgDXZBaFbgul92UaQ4E9mN8CAhZBLEfNd1j9kM2xcM7KsdVbF9C3AnCN1ya3xSbGLrbJCEdE8uc0BBhREfanbVWWDTTz2OwXwapJR/A1KFh/uMzaGt+9HKH6bd+FK30iUCIIJ5mlFziv8eyKxPGwUZ2fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:11 -0400
Subject: [PATCH v3 2/7] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-pinctrl-mux-v3-2-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=4561;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2uAnqhb2KXlq6WaSjwHOhwpzhVy1hHRfBulJQVbCOZ0=;
 b=20PTuOuYwR/p/CNVkqHW6LgSzCifO+0eJqq9rETRDWUyVlLv166lxEgGB0vtgZOF+JL+1YIVf
 egr4OSmUX+wBzH/kTALV/O4/Zd1hjCvw+x34yv+ZP5zUC/X66y2Nare
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ede7d0-e4ff-477f-9b92-08de7fa194c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tSR+zCVx8wKHjR07JBYr8mGeLZxN++grhzr6oltn90qBHTkFcxNWNMEInzwdmOxOSmvy+QJifBMFhtu7ur5kO0zJE/1kz7I3tpzWGZ4hKAjmpagrMsTkt2UXKjEPRj7YVVQE8Z0fzOqxROpWgaPnm1qzYjn9M82N9NUwhpA5OV0Uu6h80ufkb2S1OBPvqh44rssxH8EDLxP1TDAVPkz/t/RMy/A/4vRS2l5SlyI+drT/iUE/AKfFHI/RofgrD+TM/POjDollDs1SgdrNB03aSDc80cjMIEyBuAZQdNnvXAwtD1XdYCCUfqeiD4jBXBUgmO3xGQuIE6V/Bkce5ne1PpZvVkPMGMquw+aIYLSJjRAJlwQMteJBaIj+ieAoYF3jB0jI73+vnWtHrHibpo+9uoU0W5UXkTk/CyIk1QQ2zrHhFFE5EO7bqk2n1q077j37DY4/n0ME9e6qWJvLsUrHlD6qkMnsRSxymhbfvnkgI+7zbS1Y5pntF5S6t05pBZOYMBUOr/jGL1gqpPoIdfoLS9hzIZHQuRxanG8Iu2arqVPE1s01uJVFAq35lmLZbHNgmtUNr3IKurBuHOvLjM04tItQLgTqJWVM+AP1y6AQ5uTS5mhqMlk6JhSsAIOTd4joDJIcpft0taGAKVTmwgNgD/E0opXvxkRi0opT21muTSCQOe2Vi3jN1MglBwhfY94LA+T1mm64Ubms93cFii/sAqAOwzkAKK5tml4WHo9DDuKPmdgt71YUJ2Cmliz9mDz4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVNLejFXeFpNYUpWR1FxTDljdm9oNmYvSjRucGZ1Ri9rTTFrQ2JXTExCWlIw?=
 =?utf-8?B?TEFxdGVqZkZ0VEErcUJCdFp0MjJyeVZ1OE16Rk93ZWxOYVhYY1BHNStmRG1y?=
 =?utf-8?B?a0c5Um9oblVBWHZ0OUtKeEZNU01JWjdaUDd0bm9xQ0JjUUdJajlWOFk2Wjlx?=
 =?utf-8?B?alVkYTZQNjlQOTdteWNVTlk0V3hudmMxVWR2akJXNVZPRm5XTnhtYXNvT1Ft?=
 =?utf-8?B?VnhwTytEZ1oveEtwZGJSMHdBSFIrdVJsYm9RUWFzdmJjblROQ21lQ0VyRmVp?=
 =?utf-8?B?SzdVMFQ3aHdrYmxWSGxRL0ZtazVDMENDYm1HMHJyRFFBVDRDNmQxQzZleFc3?=
 =?utf-8?B?SGxzTi9mVzBsRjFUZmlOSk9kZEdtVXZwQndqRVpJdFBsbnBiUlJvdVRHYkdo?=
 =?utf-8?B?eW12RXdYNDlIVzl5V291OVZiSy8xYXJDTGY0YzgxRW1OTUl5d3JyT2hWa1pk?=
 =?utf-8?B?TklQZGQwV1lxT3NvZnVmREU2eVdXazJpcldJSDJYMHQzeU9TQy9OdGQ1ODRw?=
 =?utf-8?B?Z1dkZWJMVVVwdmZhNm8wUmp2NGZCcXVHTzhYa1BCcTdWMTc5Ni9mOEg0S2Mw?=
 =?utf-8?B?WE1YUVJtd0RyWFNwVWt4U2I4STQyTTlmR084Ym9TVDlvSUtwbnVUQmRkd1Rm?=
 =?utf-8?B?ejF0NDlWQ0VkWFRUMy9NeGdJT2FLMnBZNVZpakxJbnZncko1SWlWTUlmbFIz?=
 =?utf-8?B?am9WU0ZlSXUvZ1dpbzh4bC92dVQzaXZqUHJLTG1Ib3FhWHJFNU8wRjVLVU0w?=
 =?utf-8?B?MGNsR2NScHBMYnBNaVJxREpzMFV3Y1FzWTdyZWFtQ1VLdW0yZ0p6dkJQU0Zx?=
 =?utf-8?B?VUwyYkZJMlZjR0NKWlNyaFN5VDQ0WkczWmhOZXRycVkzMnpWWWZqbWtucXdi?=
 =?utf-8?B?clFpdmdMM1ZwUjBqanZTV010R05XRHh3UmJzaWtDTDVodi9lUDJTbkx2S3k2?=
 =?utf-8?B?T2lZSmFqd24zTnZWL3FlaDNXUU1tbjdGR1JhZGFIZE5tTURrdlg0WHVPZDV0?=
 =?utf-8?B?MzdMeUF4YXdvLzkvbDVGRzdnZVVKWmtkejRYaWxxZkNBaHJlTm1uWmZSNnpG?=
 =?utf-8?B?VkdDbjVrdHNQeUlYUmJJTFM3Um8vYTdKVFV0R0NlY3g1THl1RGhYakltb0Ez?=
 =?utf-8?B?bjhvQ1pWQXVuRUdGeTlKa0locUp6NExidFMwd2N5cVNiWTI4V2tKQmZSeFc2?=
 =?utf-8?B?RTJMSkp1VjZnRVZsb0pRRjV4MlV6QTd1cWwzRUR5TjdCNU9FZnJaZXQ2V2k5?=
 =?utf-8?B?UGtXeURsb3hRMzRRRC9JNHV2SXdqOEF5YllFQW9Fa01EZkt6NzY1WFhLaitX?=
 =?utf-8?B?WWVNeUZ2QzU3WTRNeHFTbDFBMVYwV0M4QzdVM1Z2dlluclhkR0p5aVpuWWZT?=
 =?utf-8?B?ZTNWdGhmU3g4UlNLZExSUjdnV1ZxQXJDK3JOUS9hcC9VL01Uc2VSNTN2OTlO?=
 =?utf-8?B?YUpidk9QUXdEM1NmVlpUSHVKQWZTZk4waVZTdi9JdmZNZ3VGeGpJak1VdVBC?=
 =?utf-8?B?Mkhad0JOVWFqS0ViMGVlaWhRYnFkR3hnT1EyQjdvTlAyMm44SG43QXdpdDN2?=
 =?utf-8?B?VExvQzVvWkJMa2pzQUVPRzdyNE5oVjhsUnRhQWluemllQ0wxdC9kRm80WGNu?=
 =?utf-8?B?clgydTF2RmRWb09KaWY1NWFmbmtHU1kyd2tWeWNtTzhFc3YwVUNDVHpmRVBC?=
 =?utf-8?B?OERzVmhoYm9RbjVzWXY5SHlvUS9FSlpodEtvRVJaUWRac2Naa0p0WGZOSzJs?=
 =?utf-8?B?VmVPTzF3NFFxQThWbEU0ZnVLQzdiS01JQXJHUmhqbktZbUdCK0d6bGlsY2Vh?=
 =?utf-8?B?a0gzUUhhZ2VETVFnSFBaWU80eFZZRHhnVmJEdDhtSG1ud0JnQ3FCa05IZXhR?=
 =?utf-8?B?YXN5OGN4VlRlSVlGTkhVVFl5MmNIMlB2NkxLUFBJSkRMMGhoNGlZWGVwY2Fl?=
 =?utf-8?B?QzJsTTVPazFpdVR1WVYxTVcxUEpQK210cjRhTWpmaXNBbGtMOURBS2JXQkM1?=
 =?utf-8?B?THNXVmNWUnBkUGVId1NGTzdjSTdIdlFQeFRHSy9oZnBYc2YyZ1lhSExCZ2FN?=
 =?utf-8?B?akdHZ0wvbFJWVFVQd25rVEtpaFA4Zllkbm9uck83eGRvYUJReWlMRnlDdFU1?=
 =?utf-8?B?MDRYdmNJa0c2K0Jjd2owZEZ5M3V4V05JUVhjRHNvUElCbkRHWFhhRkl5cVBG?=
 =?utf-8?B?cUtKOGJZQ3hLOTA4RWsxQ2JqM05RUDRpK1NTQTFPbXdSZmhzb3JmOURtSFVh?=
 =?utf-8?B?SEtYSDJjRSsxSWJuRXBCOWhrZ0dabGNrL0lBejF4azV2bGdpTGhZRCtpdjBH?=
 =?utf-8?B?NmJlVitDUGZSWkZKdXJMTGZVdFRmUFpBbVRRVmtzSGVVajRaVlJTZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ede7d0-e4ff-477f-9b92-08de7fa194c9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:29.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUGBpqaP5W0G7F6GiCW+DtLdf+wwVakDiR7dul4cUan9wDCGVvKUbqfsmuG9Yp3oqLpC3X7MQ69+WL3jporIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33172-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: A89492690B5
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
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3:
- collect rob's reviewed-by tag.

change in v2:
 - change descriptions for device, not for driver
 - add missed additionalProperties: false
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2b0385ed879b70b24ca9c39b098c3840d08d7482
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pinctrl device for on-board MUX Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Generic pinctrl device for on-board MUX Chips, which switch SoC signals
+  between different peripherals (e.g. MMC and UART).
+
+  The MUX select lines are often driven by a I2C GPIO expander.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


