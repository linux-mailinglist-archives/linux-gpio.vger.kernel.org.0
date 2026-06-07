Return-Path: <linux-gpio+bounces-38044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w1ssMry5JGrx+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:22:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B464E965
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=CYlkXWsd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38044-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38044-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37DBA306EA64
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C4F226CFE;
	Sun,  7 Jun 2026 00:17:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D82C08D0;
	Sun,  7 Jun 2026 00:17:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791447; cv=fail; b=Jv1LxMwKlu4mO+oWb52L6Gzw4Vk/2ipMCOnGkp+c8KAkl0euyQ3TFetE7wod3oWkdEmaZ9gOFJ53TWaC67g/LnqLwpM8FiGFQXwVjbTZMTi01e2FSi8b7eOgcqVYar3GgfDEHUndb97nJ9FqCCi8eTitihqFXnhdJuU3T2a/6Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791447; c=relaxed/simple;
	bh=ffayBpK4PgFhI9+n94UE81x891nbw42GnkwmiPMETKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hF6IRL4kb3NTqIpBM3HSbmvbdHWzXd9LPkZukDUzrsi9fIR/0Fdm6MAUWw3kpR+aMsKOaPevv8WPpdnNaThXric7Ht9DiorNNhuUFcPYdl0hqAmulR3u7/JBL5+n0iEKaXVcVFkR4jhPmlEtSVEh2fYV7ZydC/INNOzLqigDK80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=CYlkXWsd; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdY1FyiEyXTh+3Y+I/F4b8uzNuzTNIFGZtnpANwWYPJf/GPMdUFza8ZsX1OtcInIVhCEnBC8E0etTfqdLr2rxD3OsAcIiatm+aRIUfZGNSzZ0DdVwGIQbL85Hvav9UFD50TkGpPA+u/cfJGbgdm79WYlPxNP0ERjaTOjurCYXUIn4PT2ly3GVT6W+jLfpjPZ08YQaKFHZbIFI4BzapkK1cfMxLB/QKDjvhVo9EGrfhYn7fFzQ37+rs9xh9yfq+UeqpJZouSUeqZ3H9ENTJt5y22kQ0z88sPRWeb6UMvj914TFwXxSjh0ML5JC/QjMypVqti2BiYpTIu3X/PhSiMZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=MjofqG5FAaUwko21N+Pxx69B7z85ltQM/qbvNOEqryv4sINm2yTI99BPKq/pJJAzkNbg2PNtMOt3QGoBmOkJl1OcMkErXJnhpGqbfmtdb4X2OXOH1zp8VN/mGY1TS12U8F3H2fhOPmOh84ASvULTgnMy9kOKmEStc3FIikehRsHvxNeFb5ZkeawpQN67XLR2u8PEt2ppJ6Nz3QEjp4OfscVLbukGImn6RIwSoGQRgvmtflzNploK/2Z+VQ5FSmMefdjS2Ge/7QfeUhM8bsLgrUnJM0bK7uDQX2cDZ59Xokd3O4LWCNf9BFHRkHbu0ZkapBg9Eo99NEZiduZzAxxSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=CYlkXWsdQoFHFPwQhKcilpa4HQmCsjI/k65EtEgCIj31J8PTVQOihL/OApfKj4CXKwN1ol+OMYgpzmTi5gK12j1WA4EDHUEGzBtIGXL+h66q9/yzjZokEQwCKfUNl0QHt7oyE/7uQHOPmdJ0pPOxRUg6BzLjbiCllsiHRf6+sQsqixdRTwT7pz4lSBD0+rAhBhqFedIO9gLrNnbaOJzViXeeL/O/6BOLcPAYfun2vc1zuayLSyvvh5mVFz0rhBP54t7b7dNi7G6TzzDPxVojdS+H/TVp0G0ADJ3mjalYlokekpjoLfTzwqfG1/QBFGBO3E4aSVeTRkhq82WoOPuXvA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:18 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:18 +0000
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
Subject: [PATCH 11/18] pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin function
Date: Sun,  7 Jun 2026 03:16:47 +0300
Message-ID: <20260607001654.1439480-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 64571567-5d22-4ae1-7f0a-08dec42a22c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D2y279NfEDaMfPTBpV1yz9b9Rr3GHDcsRY+7DdUr2PGqW1xBLsTbMsj8IbXQsQCRL7PSfNVswBZjAF20MKmZ8gZW1KjpycjVugcj/ksu46wSQ/OZS8pjl3pqdbAR3vyw2WR27Mdo0bVmfH3DzZvFBxgOSHZkr+/cXK6l+IXObZqh4/Z1/qakdTJbNhY7/n7L9gkhtT7fAPbMLfyyaGDmIKEuc08bKKPYVk9T2rnezmzDzJ1Esc/OlP9g24jhuK0KC2K5/jztlaemI7A56yrfC6x4FoU3vXK8a/oE5i/moiL3LoYgtALJwQzkBi8sB4pQCnL/tO7HSq4Eb1HUtnb1rZTlbU62RP/KiJjsIaINxsFugHKzt5xHntcg6fn0pWWieMOr9Sm03clcl6zG5RXgQl6Z8udK4F34/qZerKrnyl4RkxyAm+7CrhRBlQNNCpMxamk89BAOSHHJ8Ru41ZGLWZBCQMbaU/xF7/NlmOYJdNkY52rY++3Y5mZKNFySH7XWlTCbe5WsjFWWcQvtxE7MCkV7eFlw7QjyAxYOinsrOBHSb9WTfJaQH28ovEwfJJC4uEdRzMesBqlhNbU7hVoFqwQh4gBql+V7X9s4PMl2EegjxODZPN7bZn/Q5HkxE/3bdgAW9HEMZCp6wvdz0+ntAgEtrueTF3u8LNRehZXLKQ2O6UhhdKM5TrwYXZY70uiZARtMaQLrSSRuh8EfhT80eH37P5vm4uRTN60DiW5LoJ/2jDPJIWwz3lZnF5vRocABUddB62KBk8j+2cXpPxmGhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iny+COuz6PVQ5soV6r6pi2qyoXiZ+4Z2xbGndjhE+GOp233S0eiDXZcb4Yr8?=
 =?us-ascii?Q?Dth/iHNJdYWwDv4shM85PeLhWUOhqjx3Y1DFdWRyjBV0Gzw2Z8CaGftubFk9?=
 =?us-ascii?Q?2QsTP9vYyeC3TrUrTHUOZAgckVeLKidpjiAhDkIOronsnPCXsi/hCNLhuNjv?=
 =?us-ascii?Q?68LKJ8ibOi3IP3czL1E6Tw1ReC+sVII8nicatQAnMu23oE2NjKJajTIgqeVr?=
 =?us-ascii?Q?z1pUkM3ajhXWm22l4EavZioJClLMZH75OFXOpOR9d30YhbgHfgWQlndi5hr3?=
 =?us-ascii?Q?SyI7jD3ufnkzdMfIzX1zyA6rTUsyKcT7+SlywGeYpXUqxyDS+wxWF9QGo18C?=
 =?us-ascii?Q?BPcc8gsMi/FOuDJyRmvPc1wFRysy8SWypMPzF5TlLIbK5vzbwpXPzguo/2HZ?=
 =?us-ascii?Q?61SeXoPhi/6zjyyBEiE9AQ1mtHNm4LJLRF4RXk/vUdryOkKXO0U91t6slIbD?=
 =?us-ascii?Q?5S5n/sZMT88bECttxBoFLnkzsHEfp0o0aUeRREpQJOg8FTxzaBbCj6MP7aAI?=
 =?us-ascii?Q?zCixynSB/tGS5To4jwWDhL5NkokcPN7/37xOFsI19EuknJ3BiHVuAI5LSzWX?=
 =?us-ascii?Q?TrF9Zw3Mwv+LqCWU/T3FfDHIX/ZvC27azrWdCQuD0FxOobfqkB4NYv4+wkBo?=
 =?us-ascii?Q?XgZoNsmkO30Xtd18jLtKs8oCC2YEc+Jc9FF+n9hO5uPGPNsPsDX+ev2W9Pbe?=
 =?us-ascii?Q?yr8NCDLfAEvZqDishr5RW9iPgK5k1ZrzHAUp1XiC6t4QdCYKfkvvMEuTmFIO?=
 =?us-ascii?Q?anvvfiluVY6Bz1hwM5vxlPiC64dbWiipu2K0SaVnmRKgxD4ojNlcYYzlnaYC?=
 =?us-ascii?Q?SGoG658v3AFDtnH1sySvUIfR9I0cI3/lX/5hFIqI03+eyq5kxbT7Gs2hfiEe?=
 =?us-ascii?Q?edphHZG+yGfyp9/DaUDbQB7l3WL+npjVUitpq0ObK6422tcSOsxrzojRiJDU?=
 =?us-ascii?Q?6oTjbN6JK1PTM+oxnYihVVO4HYO7AlE9GEwzrhg9N2gp8NjCebTvBUwx9nDs?=
 =?us-ascii?Q?pySy8xrBnNrr7Edlw2AylzR8yqTsZc3pRc/s3hdn6wKJShKTpriMY4EUFV9p?=
 =?us-ascii?Q?0tOHRA70bkccUqL8/jzdC0n5YAywrfgHVFnKSYuNY7fBIFVRpz+yKqpTc1Vm?=
 =?us-ascii?Q?T6az/eiFqghif0cN3wbsjPHQwMeI0mZ61+sw/f0vCFIZ4fg1gelaVK05XPa5?=
 =?us-ascii?Q?k/ltZeTFAzw7Tf+kipmktNiZe68Iyq8JU0lXgvxGadD+eTtesZaU+kWifugm?=
 =?us-ascii?Q?x4BVELNZ8GO1FCXNMA+TWoy2B8ea6FrOqEepiNoPvH7UgJHCeCTymmSgrkYT?=
 =?us-ascii?Q?wjhrzZjpPUAeYnEvYPZJLSus5j+i/geB1fMMe3ivm977DXWEzWOY8mgXu+UW?=
 =?us-ascii?Q?y7QpyHPVY33kPbJiAqK9duA18T4TKSNj2cKYKRVkFt9NjtGlntIu6QOvPkFh?=
 =?us-ascii?Q?i/qoqoy/dcTIxDQ0tsaHp1Ree0DYVvjTa6ua4VvCjbNwnaYi5Ga4dnX3J17T?=
 =?us-ascii?Q?K1O9ls759seOhF4zyDiL0dLsHbWMxx24vtsVxbf52KKUG17aqoLkhda0JG5u?=
 =?us-ascii?Q?rAdq7geAoo9ika2erC2+kM46AxoSdaTSpwpdtCv8N3Ymgq1FkB5/zlQyfNja?=
 =?us-ascii?Q?QV9VRZvC9ItHQILZov1G74nMwo1MmsLw6o3xLWKvjADrCHIbudHwAqWoeJ4+?=
 =?us-ascii?Q?G95KQzdLDfkKkRfVXvUyAo0fBaH7ghl/BR35M7C/31TTP3bUgYVSJ8dT82iy?=
 =?us-ascii?Q?Vyn5MOsz5G/fszu4oS0+GR8OFzbVvLA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 64571567-5d22-4ae1-7f0a-08dec42a22c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:18.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqF2Dqqzq6bOM9TXnPzTQihblTzvXI/q4jsa4kSOtDX0yd1LKmWgNeGYUicTXx/h6LohdmL82w6oXspF49meusFVOePD8v6hbSIY9/efLBY=
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
	TAGGED_FROM(0.00)[bounces-38044-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 402B464E965

pcm_spi_int, pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4 pin groups are not
defined, so pcm_spi function can't be applied to these groups.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b73ab60d0065..bf5ebb31e635 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -877,10 +877,8 @@ static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
 					      "pcm_spi_cs2_p156",
 					      "pcm_spi_cs2_p128",
 					      "pcm_spi_cs3", "pcm_spi_cs4" };
-static const char *const an7583_pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
-						     "pcm_spi_rst", "pcm_spi_cs1",
-						     "pcm_spi_cs2", "pcm_spi_cs3",
-						     "pcm_spi_cs4" };
+static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
+						     "pcm_spi_rst", "pcm_spi_cs1" };
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
-- 
2.53.0


