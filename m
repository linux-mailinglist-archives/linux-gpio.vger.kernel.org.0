Return-Path: <linux-gpio+bounces-38036-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dKBzLAi5JGrY+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38036-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FE64E924
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=YJQcHQ9A;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38036-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38036-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D06D4302734E
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DC622126D;
	Sun,  7 Jun 2026 00:17:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4071F09AD;
	Sun,  7 Jun 2026 00:17:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791434; cv=fail; b=eN/QLug9wKrqMt9TUIPT/NJ8Gc7RGFAZf+yjxaqjf2mkx+92MKFk3j/N7OJLWCuO+YgozRImeoSozjEFf1a1CZHx8XsY1RTNwIdR4GpeZGXi61HsrnVbMdLKG4zauWqznCtHJtHO0DmUaDtDBTw9ibRFbfyiaw+64pjSP4P9ihg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791434; c=relaxed/simple;
	bh=6g20/l2byWsgYD4KZouRtWBX0DBg6rrkGWMtyvwfGyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jBnKLzzWMgS5Wf9t4TNNs/ysWRAFseMEi3TmJH1b5F51Akwln2AApGO/xz7v3jwkGLzh8xGok4XDdl70QwCAxNhVY8bYKZkPT0jY5ZAkjv4D2fxhRFleU2AAeIkB9ygDjrsckBVB+PLIwItYAl67Gfo0jD7EcrakrH0jZLUtk+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=YJQcHQ9A; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9Im7/H0r09HNdiY3Q26+VZzGEXZzj0OV5NmMbS3sYhi3IAo0KumueET28uzpzwxbuBI6sod7hOai1h3aWJr1gmNXJhtKDQOgVJP7O7PUzJmiXjrxslqMCFvYAzd5kbzLQNQ3Gk9b/597XAzw6S7lnmTrD0DOUsPzGlU2TW2Q8ITWlPyIRUwmnmVenlbUi6sy01F8O6Bc3yvQioYx9Zb5UvWinYxFOKxGiRJpHTxiYBNXFQALsOQQNpeokcJHH1sHKZRvOjtjqRdp/dpKYB69eT8AAgD72LAnp+lHBcL49uamQoV0XQ/CQvCHUy5QppL9WyWx5HjoO+zhYJOpcuP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gg1KuSgqdJrMOLyf842WvjL/3L5oNbqk/qu2CWJveA=;
 b=qIo0rv8caJMdxM8VbCR5mNwQvNg1dnb8RHdaibpJDZTU9emfaBRyRNGD1c37L9a6gwQh+4+H9uLVkSICZRaWbtZOdBXsWpnX8jw1AL8nvpPeHGfRgYAq2y2FieZsDG/hAggTzUJ8ej62S6/I0oRPgWpFqHsTF2yvr6PgIhzW52g6eufvvs67viZn/JfIX6VyRLzJOJWdWyrawjHl2ep3dKLpL+SsNK4E9Wt8rKgNUi6/Olt9YphWeYraqyz4YqQKUbH2Wp7cS79S66ugVn+ODQzUk5AuhHKp0onARnZwPbrJ1Gsx3pl7J27DghEvZzklMdIlKPbVl48+5NpftcV0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gg1KuSgqdJrMOLyf842WvjL/3L5oNbqk/qu2CWJveA=;
 b=YJQcHQ9ARJ/AqsDtoWuny7iD2A0osluXQjL9QmGVQRvA0ETsFkupHP70roGK6ijXRn2IX1kTR1LcPmovzrOevATfjmx5xOuDcR6YPyRW2lrWPW4heMoAB+43ia5GbwEuO/LWzNyerIrPiXdVNOidnxJRsDbG9EQK0Qs0fn652oJjieZ9GbwdjKcabwZqKhsf6uSXOH9XWGXhGopLJhJEpAIscqm7sRSTBwZ7gVyc2jSHc9zLp55YpzuswjNj59U7Z5MLdLlCGWxMsiyiShKGIvic8BHdL0LFG4mqfkLab0dpQCvaYiC2S1BZF2Le21dQKBhinKU1FxQxmogY8M9uRQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:06 +0000
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
Subject: [PATCH 03/18] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
Date: Sun,  7 Jun 2026 03:16:39 +0300
Message-ID: <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: c13b591c-8e86-46df-4496-08dec42a1bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	a5fSbMD88hT4pr3l1HKtXpP5sZ+YJTOIFilhDTI05iqsdEf9le0fTfnZnIR2G83Xwx1oFXmF63KahMA9l34KElHafQF9dJnWog0pusoPgkBCSdPNVC1ENlTwRs5LpF1J7LEruTqvstN43upG5XyackxGlDcbqWqKFqZ7LofM0f5tgCkha6xYH0yvza5DXdGzHG+tk78kupYMpiWaAHKL9DfkziUwfaTUFNuGeBzBtRdiyQJlecFGg8a+7CtKyEopSFX0FXyAx+Wvr3fyNmV3E/09EpZL9tnzA9FY88J5m/4ldayePLIQ1LLZ2TAkrRmlmpWaAv3woJ+kdQV10nQFg1F549e1gOuhISf5Wlbh1aBq7JMvWyJox897/w6ZOVjN6JhIbmD5MxGlrMXYD8OUdSndP7fRTbIyiSCRWtnY3aaxXbx9o0vYL/+aE8dPNx0Ftzd3PX38wbXYkxU2DERvSreMBd1Ck0FCgvmKGarwBZPitvMO0OX+vkRMguEjySxAxXSoMgY9PGWomxZ8PEiUYmB+sjLhp94GieZHymsHBcK9wZWKvenDzg7Aozfwj4OfVF3FTYAIuk+bCijhXyNdUtoIrRJ88GYTU9k+1Kv+UOcEVkQi9lFJT7Lgokx68J8KMjg1pfR1hDjfCq02BBbJ7T1OvPb3mIEUVTfSmyRydaRJ1fq4gFw3TpAiVLBUi4JCt+Upx7Lq621WcG36vVA0R7Csrv5ZVdodyqlfSWx4VQVo4QRtOoyHB09JP+pMDL+cUtnLf/rH+Ds9V/nUeAZ4Dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ryNHI/njheWyCpalZux+XxHAnFrrevdvDreE+bNuOduNpRm/FLFDiL0GqZX?=
 =?us-ascii?Q?QUnRUizT0sWmmLnC5aCpJglG02FNP5e6RKWHORfp9Bexc34QVwAm56LAW/vR?=
 =?us-ascii?Q?IJvHuOuT5hFlJ2wH/VGnMdjenx/fUuMokMAp/sEx6PQSUs2WSW8B3ZAqHHfe?=
 =?us-ascii?Q?qBJDwybPsyMr7Hj5SnONaABfHqMpAKer0if3tsMPjTCbFdTJ4g1f9lZgMsr2?=
 =?us-ascii?Q?62sOupusBhlcS0LtkSlWCfviM2d7YEdFqLxEPKYzDMXIyFhGbXqNvZ+bFgTY?=
 =?us-ascii?Q?7Dxrg8rl+tk39sTJBBGGdA7pQ6jPb6Vz9htzb1sdMaw7E0JIwlb4QRKWZKrH?=
 =?us-ascii?Q?j9cCMsu/n26vMN61iEseMLO40y2wvX8OE+oU3sw9vCQp/IOe58x3vJZ1zCzI?=
 =?us-ascii?Q?bjOvyTyW8T8EXebMTBuH937vzHCz0BEKhUpZE+1k/0mW0yXCC5FsyVeIIL9z?=
 =?us-ascii?Q?vVtXAdpGzLsB2G+R4OICLUm4Ak50mcOg29+uRbwt69r8CXCZ+rUpdyGYaHIm?=
 =?us-ascii?Q?5xSAm0575djUnqsJOVOq8ix2cTGC9QstpUhvmOIiqSo3gIgSJ0B29WUZb5ET?=
 =?us-ascii?Q?j8gET07JJYZobHFEVU4j+2v8q9zeHS7WXFp+F7a8gOuzpzQWxuUiwCadI/6A?=
 =?us-ascii?Q?+RINyuMZlqIXvv0UqpF0dfCEA2GfZCKHtAZ6L5RoxtRHCFFRasaPiUfGV+GE?=
 =?us-ascii?Q?16Ui+d/NMMJUneG2RH6j6qt7cOA2PmFXJiYPZjQJTVY67R5wwhYX7Fcd3wSY?=
 =?us-ascii?Q?9rT0irtsK0V0NCVuzCbONNaIsELmX19XWol9scPv/UQB+9gEATad3pLOoz5A?=
 =?us-ascii?Q?k2+gaum61+4/SvrGNI+kEKW7bfjU4tUqtWFcSz+HqrSaEPnNiP/63aQLxE/o?=
 =?us-ascii?Q?aR4bOrBxmW+kfv8TVdTAA8ZWkTM65PwtFY1JD/toU+nEXlZFPKKKrf1PRkBr?=
 =?us-ascii?Q?U3QQbmSLDlXo69g7b9Nsc4+Q8yKo3AL5AvM/Lp7NRCWA3Ps+GkYE3tG9h7eN?=
 =?us-ascii?Q?mYF1VxnOUhrUtcezLJt5aAyPXAZiREOglsIGZD54LnCpxkBRUG8y4nNdh9Sj?=
 =?us-ascii?Q?2YAc5MPTmXkK5PeCuh/L4DHGJQzhuJn+L30fR5HO6eUwne/etlP/ko+/J6JH?=
 =?us-ascii?Q?YQO0jstBk5+KcYRQh6g+OlH2MvXwHKktuDWmCq57fkxe4bCFLqYtEJOBJWtc?=
 =?us-ascii?Q?Uu8lj6KkCuaO/q0FdBHvF7J9svXCTNNWy8cjIkSLoB3HO+op7A5EhaApBBnn?=
 =?us-ascii?Q?Jx+5tkT6HyQFoW5yZuNIpF2ZBInm9YNygSlE19nCj9NLEVnbc5+J53EYe8Qx?=
 =?us-ascii?Q?XEv6+caAYPQoa5vphmM90UUva6XRT5T95pnSDPKgCD009QUKoPkWVHlaxyWV?=
 =?us-ascii?Q?UAXVfMP3tb/xZX1jHUCMFDS2XDUaWepHnBu9UeuQvjfotRZYVr9mDZpDzwbt?=
 =?us-ascii?Q?PioHFvf7M+ktHMU2CRYFghIKJOtr/FU7xxN9TOVG70NyB/k2Zxb6xHfcWaJ3?=
 =?us-ascii?Q?PM7n67JgHfn6fjRfX8uKkaNwQ6TFWjMHK/dlhgVY2jaYZnqft3R9AfurjR/5?=
 =?us-ascii?Q?OSXQEQT6xt0Ur3Zvuassv70UPzVJl3etSk8YZA50bnyfqUl621b6I3tsHl/K?=
 =?us-ascii?Q?OPin/u6vailFX5Z0c6HxUepEQJoynBHvWy6asJHAaDVhoJU4lsZRZ0mCsoT8?=
 =?us-ascii?Q?yTEX9x8dGTulMUlie+QdoHE6zuIVPWDrQa+ixZmtObQxo4qS1pMoRT/M9kd5?=
 =?us-ascii?Q?b5lN57+xpC4nJvbuwNfTb6Wub4efHfY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c13b591c-8e86-46df-4496-08dec42a1bcd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:06.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uigu8QuO4FuVdguV2FfPyE33j1amg/gzQezzLyM/T+ibC1t8cUD0iNtrjYYpOY5EAKOfOVJ+YopisBtUCza3FK1JpmZfldmF/LJ+f7pdm1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38036-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 255FE64E924

Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
a proper bit number in the configuration register.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index c0aed1b60792..14b235727736 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1798,7 +1798,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(22)),
@@ -1915,7 +1915,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(22)),
@@ -2032,7 +2032,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(22)),
@@ -2149,7 +2149,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(22)),
-- 
2.53.0


