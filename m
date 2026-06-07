Return-Path: <linux-gpio+bounces-38040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNqNOfS4JGrT+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDCA64E916
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=PlmOl2po;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38040-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38040-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D5503016B29
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A4D2701B8;
	Sun,  7 Jun 2026 00:17:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679E1F09AD;
	Sun,  7 Jun 2026 00:17:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791441; cv=fail; b=EB8GOYXnPtRJUlVA1cQwiRBYY5rwqRHT3mdGsRFSoIzpF9aTBTjybcp/CFfoG6rVTytNI8RGkBTS4mvjyQHgQXl8ZHjkuNs8gWa1Zjb7SSmEtom7UcWEEobjnIlOvCdaa8KGHgpGNmS4l78mdTJ1kkbT4CCEupoGKUdYCVlrLTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791441; c=relaxed/simple;
	bh=2ZCEFQn5vaI6e72r+w18X4kHVmEm5cr8VYVluMymmGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fmy1hA9Iy0atZipVbOUf0RsKAUen+aciyEnpeIbXJj5dWSqOBYgHsSPgrdwVg1MCYHWHsuSA1sspeHY5vtKan6dkTDi1zKMQO6uh7SV1C1Y0bEoJDJxMD68M8p2Pio94KJ92hQVeLkBF812/ymji4jaXgVyCbTD84pay06BnGpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=PlmOl2po; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBz0etwigVsfvBLff8tJqi6BBao+a/Xc/WqeknIIw6RTb2ggHVxLAprjpxIvgUaw+NgQT+EfOnbRJeCYzsZfShCs4ZWHAdJNhbPJrck+jeITIvNvXcU31fRYCqvtzdEF2sOql/4yimiFFsOe2nNCOhgaZE7hIQYPWCY7oGvoZwWbAMVnfgR+x14a+YtlMJ4PFeWrtljKHHadJ3U7snqBnOEL6e2xLeSZ0OH+xeRH5aVhIAwXkaOrFl0dzpkVVRPP41EJnctJ8wmJ7VV4zlEoFvu/QUeuhkIn10Unv88hHDTmiv0UGz3x4f/HbjMqGtplXmzslIv3ntDfRNPYeTF0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=GJYSZ/X2q+lu4BVPN2o1gwU6/aRk+EBnjBoIILqHgjJHVd01b3GS6FjFsPvs99POLi5DFNGT/E3Ub2pK4TLRS7R0GHU/sqntF1jae5YbfVhlRd3l6fK7eMmuEJCn9L/jx4yxv4OXF6NxoNuIcOFhfN0KwSeuTkX0Oxy5Hcc5Era6+a017bFlQKpoGK9yhPyQ+So/WLhdJTzL3fxLeG8IzL+kIhVaxcwoR9p2xChuEWVvNhr/At9otbx4UyetHCk+3eCgigyxVmPSCfHIonYcz9kZ1sA02ZiZp7YsQ78AdLKNjQmHCZxQ4vkb3M3TQZnQ0aIb8Y+Qg4vJHOHCt+DzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=PlmOl2poO2a0UB7hCvy4UQXWrRIIHV7cKVctoikmCzXj0Mwh44xhhYzSF6//DPKt35TGZL00DzJOB3YbVnTKQgkpU0M3NsUvjTJKJmK8welm5cQ2Vp5JaJCJv0xfXNmOT1BcTE+9CBxZjkgZgkEY+e9uZcZY13275g2oWiA/fXwbAXJyqmIRPQsIrBp5ZWpJZuqWzLtKN7g2yntaYcO4ulNUjcRbHzwOMl/dVHPkPG8ON5JmRKtzMQvCQQhdC2S6tIxUjGL2Voz3JwLGRuWyVPfjJ4XmyoscSZRbBBxjCFvN1nXTMGIifsvKWjZljGbJRyz97Qwp8xwpHXYdl8hBgA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:12 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 07/18] pinctrl: airoha: fix pwm pin function for an7581 and an7583
Date: Sun,  7 Jun 2026 03:16:43 +0300
Message-ID: <20260607001654.1439480-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: b1849d81-4116-408a-73a3-08dec42a1f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	s/zFzETWLoh7UxRx46UQlBXgWk1q/XaswhTtBTajuixAEivi0WGa2TmShAGnZOKaL2GYtYgkmpwUC4+7cOlYugb79Rn4iyzB0ek3MS7Ypp/800p+82ikbe15/rJ8BxCadIDxkhymas9yNyd8b9O0PUB5C5Ck91jT7EsW1jlspeNOCt7ahUzxaJ+s2sn83Wk6NpORoTFu/HxN23Q0p4D4XX1BebXhg7Hhjg4rmFV8a68Ka5EBptpyUkgw6tes4D9oIJAYRcGGt5S/bsmzHXtCQRx+wRrufrs08oVOZDOjyq9pkX7oojw2n6oXDFevcxX9OPUZfhISa8qeyqSDWgqat+rAGsE2rX88WymCdaWS4kJKQPr9GKOkszaKJM+esmRkiGUgO2fiQQfUz9UdVQlacs9hgk3S2WtNVOGQCVZP6DcJ4B5PdMUFAkAWOWhFHmk7BeXS2jojV8yYLrgpy+B2yt9K5dlMmcq9/rNcOuIvmIXzpKVN34kNHDSClScN5xpX7X37hJDJkacx824jeoDnLsxqF9B1wMH0Nop32qrp4xa7eJjHSmlR7zdRvAebuhYve6YqzNrizxfeJ1ONpbE6Ydo85PosILargiw6pkbwDCqh4KYH2pRDPQSpr7eRqTeoAwilRtQiT4JCVdMIwm2YOuUyDtngnhcZyQCy00Cjt4z6SdzRGgqPNa94kzsGbT/fOwa8Ph4nLFmjRw01N3yK54J7VKNLq26nIQrQATXkBgZL2ZFQioVCmYiTE7m0Q0Ybq41Bw8kTizlbEKJ6oHslgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YMFY+IZafEfjenRTvCUF7us2yqqiqf7uwUQlxzTDjwKyCOWtsOHipf8wqErg?=
 =?us-ascii?Q?E/wVtUB72p5gez6OHjk6sCaiPLP6KpcEcRRSHgOHtBovpPLv6p9yFom1KbZD?=
 =?us-ascii?Q?d/lugxbJ/ZtIaxs50t6Qj61YcFLALEskN+vdCb6aIcHRSK+v5SopShRylND+?=
 =?us-ascii?Q?XTgwNGd8rKaLD2xH0VBiOIO/M6vlvp6ZNBWcKgiyFA29TABcwZ+yGglHNeeG?=
 =?us-ascii?Q?OTmws5LpseiB+U653LYqzY8KcT6nak0rCXniz/1pRG2fzBSKIllKF2kue6rf?=
 =?us-ascii?Q?HNq+kXB2UVwxY1bPU4dasrE1QkN48gBAGM3QQbUbi9lgu8hzB3f9Zu/C2Dna?=
 =?us-ascii?Q?7JjYtFB4IWDqEq0cUa7riPmNiZCW57/HU5zY5O59auBgx6xUOjJ/3/iTqGRX?=
 =?us-ascii?Q?0w8tyUzZ2aI6VHlev2Aq2viuxKAO9ZKzMEVAQM/8EdFNrwv7WPS8W5V9NJ/2?=
 =?us-ascii?Q?TYsPqpOwCJb3mQtnDc++Cu3T/VL8j5NkOfn0PdmktRbsHfaT1FoaJbpZQIQq?=
 =?us-ascii?Q?6rnPXzxgDVtJreSfyCZi40iwX92NmPrEB6Vq4YaYyfOmAcIcpM/Y4Eu2k+gL?=
 =?us-ascii?Q?XAvBdJ8Mu/DHYmBDCQKwoAHeu8fl/27tYq+uEmDR+dA25j0BqKMacZb2WWYk?=
 =?us-ascii?Q?GJRfQ5cvv3k/w8wM81vP08qj9A1hR2Q1Y56d6jvM7fAx0ZAc9UYu422+oXkH?=
 =?us-ascii?Q?tc5XA5WjV06t8dQkGzkT12o+WzqHXLpPV8ZUOVHgfhDAsbC3DGgFKtyKNQsa?=
 =?us-ascii?Q?EeU7cRkBbm0SKUIgPgZyxjWNQWvk+PWUUKxeZe/W//Zfwq41Y96VLIWzT8DY?=
 =?us-ascii?Q?RaZZzUfB+QtJu3v6KR/bYcMFThRkFCgddr+BW4IKTdvzmWQweQ/SN2K20sI0?=
 =?us-ascii?Q?e/b3c4Ko6uJxy/IUXyTdj5tg9wQxn/iS8c9fJYnHv9ueBNg8n6g1t+Nrmbo+?=
 =?us-ascii?Q?hnXG+wOGrM8bF/w9++v9exsE80jV7G5tt+FFXdKn7cAPK2pkdQVTl3xqqGP6?=
 =?us-ascii?Q?JaW0rIqbojs48sRfXKBcZkdZ5K8FQ1ldVuGPfSIKTMmujr8flmJfCkW1g5zt?=
 =?us-ascii?Q?ajl9/CViIN5sDK/GN/yMjbS2GUI/sJDFze9VFL7cmXDQnZWl1Xso1iQW1Kil?=
 =?us-ascii?Q?EyqspRxzmXAur7EwfeD6igdOk6uFmCgkohZv1mwaUxO0TNxds0f4Rbj2ePgu?=
 =?us-ascii?Q?haD62ehooMwTDT4aXmiIHv5dqSS6azyPmYuDq7hnlTnCmYKceVuV6VyrIwQP?=
 =?us-ascii?Q?AjW800BzoGrGVHFc06r1r1nnI/lOVa6wzuZKHkO8Ck15iWruAbcBZTPNAnIX?=
 =?us-ascii?Q?AfV7ggkrKnwdp7js5qvdtoII6bMkPsukntBv5R+NbkUTflikt3yFw2689FTk?=
 =?us-ascii?Q?Ijx+J7GlEKg+XJbPEzOTTfUKt0TlFjHmmhtvkElIfXY9dqMLqbtbLO4CO0VO?=
 =?us-ascii?Q?JjR+wJTKWYZuQB85PCpwICFPyV7LQe5RUw02W1bCq1NQ07WT13/ubcMbSNV+?=
 =?us-ascii?Q?po3d7TiseR5oh/LpFXh26c7tEeWALGaUz6hZB3a4cpaHpWa2UDjDwisf/t9q?=
 =?us-ascii?Q?3FtCfKnPnrtbeZGLGYZrvwlmy43QvzAaAyoJWvd1EqHkmz3YQRU2oEkrv6WD?=
 =?us-ascii?Q?LPN/SRD9V0IRiu0S5cHD+BGZ8VJq/bw3HMkGlNhxWhEzpdQhoeybuuAu+7jf?=
 =?us-ascii?Q?KuDyseSk2/eeuHEQyjzSUAQDEZHxQ7DV2XCFs1aYGJqdcUxdAz14dXVtqq2x?=
 =?us-ascii?Q?PuE9tH3I5vRE1RHys+zQ5gkxnRuLWTA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b1849d81-4116-408a-73a3-08dec42a1f3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:12.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMOPNkXULcwP5HnOBMYBfYwDPcWcw4gjNaughF4N0kPfN+czD0Wd6YT+MjkDJXDC9hNw6YhTne4TIQ+69B50wfJuHVHCPZos7MyhawKRYVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38040-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CDCA64E916

AN7581 have 47 valid GPIOs only (gpio0-gpio46), so gpio47 is a fiction.
AN7583 have 49 valid GPIOs (gpio0-gpio48), so gpio48 is missed

To fix an issue
 * create AN7583 specific pwm pin function,
 * remove gpio47 from AN7581 pwm pin function.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 74 ++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9be759f08b18..15a541724349 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -906,7 +906,30 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46", "gpio47" };
+					  "gpio46" };
+static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
+						 "gpio2", "gpio3",
+						 "gpio4", "gpio5",
+						 "gpio6", "gpio7",
+						 "gpio8", "gpio9",
+						 "gpio10", "gpio11",
+						 "gpio12", "gpio13",
+						 "gpio14", "gpio15",
+						 "gpio16", "gpio17",
+						 "gpio18", "gpio19",
+						 "gpio20", "gpio21",
+						 "gpio22", "gpio23",
+						 "gpio24", "gpio25",
+						 "gpio26", "gpio27",
+						 "gpio28", "gpio29",
+						 "gpio30", "gpio31",
+						 "gpio36", "gpio37",
+						 "gpio38", "gpio39",
+						 "gpio40", "gpio41",
+						 "gpio42", "gpio43",
+						 "gpio44", "gpio45",
+						 "gpio46", "gpio47",
+						 "gpio48" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1504,7 +1527,54 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+};
+
+static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1759,7 +1829,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
 	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
 	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-- 
2.53.0


