Return-Path: <linux-gpio+bounces-38805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DWtZFbUdOWpRnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B879E6AF1E1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=jPMAFwkr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38805-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38805-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AF2C30558AB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C863A05FC;
	Mon, 22 Jun 2026 11:31:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020125.outbound.protection.outlook.com [52.101.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA992DF3EA;
	Mon, 22 Jun 2026 11:31:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127886; cv=fail; b=OdPIli1B4tUmbcXouE0xC7X1dG5K6BHSwBsYma2dEYvKwhqifHFtZ9CWcDJvFSdMM5Z/RH1e6C+SV9forta1OpAjj1yj5oCn2+4liNTBMXXetbws2OpmiH2H1AzuiYYWjN4FhY1LyOAad+ie+sMIA6ZJGuWEPSM8pd3STRk0Gzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127886; c=relaxed/simple;
	bh=vXJeVnqrc0HWWdP4JYjBweIi8GTqabu/d65Je05sRt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SxQte2bkarV08QJ0e9tMJD80iNdubnOJBtAo8MmRp7xlw6p86a/fqb2CYPOOsCRbmMkpnK/yUs71Vf2h1Fyzf5dooBwgWVunDK4Yb2D/zX2QwLz4yqokiuA1k45JsGBrzGfJIUjZYpSNSbvleXoI27TwHrWoLUsTwraMlnSPda0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=jPMAFwkr; arc=fail smtp.client-ip=52.101.84.125
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v16HjdmBnZhOYPgEXU2TOu+65/PIZKe/1/mMfPmTQtjL2v9p+MQtjzUao5F1rI8LwF2imgVRf09nRsNo5nl3eQvn0c8GFJ9D9CSmgyS2lSOg+nMtkH3lLPPMSxt/d6ugG1aENxpDw+5/udlBk9WK+U1jNl/3bW+pZ5KkkDYZiTJT3HgjB38W7xx+h9+1Scn+66gCrEqIfl5h6ah2VKMDCrWthJgGejtCbDnpPgnRCphuysnE4m1d7Ju2+V5+2kNKihzCRroU7QBlxpd4tRItaYpIovERFzmcK9s7FajErMfg6pCpljuV60/9MP/sdkiwXyRbjESvslCWvhsr5LqC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM6SBMzOslePW3a5VaxyZ4EpZwA7zguGyuRpsJ49W/A=;
 b=kmv4j3I7xJBaMR0ord70iOBgBZG8q3dGQEtKzUttiHfr9JencmLu2t6mjNuHq1LYKLdkOn+xwfQ6hTQ8+8mke4KICPMbjwgfe+eUjPANrTPUdZhxmNPf+jwAWj1U8o/KrxNTJyqeC1CqNn4s0IiEeFpGDrtKWbpiocbIPNpzcSXeOQEqowXgNIxNYYN5P+UJZueWnD6El3K5g8jfwh2TnxXSvnvLkEHG/enLNNbXY3s6EtqeQFrWL6TFSRQhOzKUERluTznywZrwlBbEC5hMEvIsx+KQl0CJIH2rzO44EsfSD6cKhryMo4shNhBi4QxalVvrrk7plnypc2KFiAuT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM6SBMzOslePW3a5VaxyZ4EpZwA7zguGyuRpsJ49W/A=;
 b=jPMAFwkr8xezavAMaskVtDvogEc2glBo/m5fDdJyDDhTAAtIpy146oBomYXVCZcnXMJYg09WUxpL56/FYq8Sse04yHruXHITdhWKSs+GQkq4Pn7sH00NAHQcDLBq+ko3goMguqne8/oL69OX8Q/v1LiphPNXpS9E6OZ0CRUKYVd4WaCVGx8cceFvFcXhfoxf9Jgp1gtHA4e9m7WMh4JLuIPx2hGd4vJrbqjsQdzgiryvWoiurxI/n/cuO4mLIS+uV+50Khtnz7AJ0vjFGa1sodFmWOffbx8Q0f2WQXENZmTgQPTi3AUbIACt/wHwW+22vwaZKIccLoEBE0OnPKVmAw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:05 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 08/16] pinctrl: airoha: an7581: remove en7581 prefix from variable names
Date: Mon, 22 Jun 2026 14:30:38 +0300
Message-ID: <20260622113046.3619139-9-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM0PR08MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: b11e1f41-b84c-45ac-c76a-08ded051bf78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	irxjMdVRNcotteOrLOGXJ9ej9oPbtOlrnrb1ncDNGxQL7cbc/ZSRaq7AQIs8x6ZmrUx7MLSJnqo9iPIo1Kc3ILYA8zLzgk9oYENVVhQmg3h+qOR7gTEkJfZvqFcxoP0ebgMBWL/a8fceeUV+J/PdOfg8hKdE+d7+HQ4rcEdi/+ACr3EtxPRT+IAHXSYtECBpj7c+7I3Q3TlYn9kwlN8/1CXMKUSG3N4vBuZf7zOTSF8J4Bs+mIpc9GPp/nYuyCnwYg+qb5zE2myWVAuYosEbUmmAadozT9m0yz9CLv2e6DvN55u3T59EzJqqPvmgPbZSMgUsl4m+XmXcMIomz11UOlRi1NPmLBPB92mHmiYMiClML6n6LykRZv7SAhN68XkCYW2TZohZvywDPWazXBY/HBe2y/6o49x6V065GjlVeTaVe0rcrj2gV6ZlyMIPoXyV3Jrv+Zrw1GbnVDyUc1PcrECUwumbasDjNkr4qEgg/5X82Z7jb7sCUvg6YVAR/tZAgqvuhrBB5DPPU7C+o6J0902CDp84ZDzfx91mOcRm021iA0P2N1H+eEs5ykcpDACCApVSyBnmd8bRL8OH7boWhk44e/ZmOWYvOuEaagHGPRPXBNLkjdUot1h0ae+fGEQFtvDN5cv88zhCE6HHoZ9j1IGhIb9DOhiKOH+6ZpQ8WK3j9+YVsFGqwk4QieUMG+H9mVg+Eoz/disf3OtvWWhYYF2fdGRSO9rR/CXsg8BZvTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPMxbRjsgCE/P7iSAhFoZnJAxkpZC5IJ503aoQUd8RU/lDeTRIuz7H2rno0u?=
 =?us-ascii?Q?JkRDDu+b3MyipEZRBFkmT8h7JpCm/6M/G/C08kPg/cefMpKM1HlVMXLP3K+5?=
 =?us-ascii?Q?8Um8n/fcJeGkGJg5HMHLfhrl/1F5KB0oUMfvch/dZ6nLKTS0nGgJI+QXovnO?=
 =?us-ascii?Q?8UuCSn4y+EFNfeQc2CjZpKpgOgZZrAWwb3mU5bpY7mh28Uuo3/mOsK1VaPZd?=
 =?us-ascii?Q?HNhZKRZNtVPjrU0doCUPlds9AmA2OCkgfXSP4qy7XKhRt1L5JRJR9NEhG8ed?=
 =?us-ascii?Q?WNfGu/8MkLj4MegFTNV287v6OqvNarInjaI+oFNei2NcpjWo90RPpqIBvlGR?=
 =?us-ascii?Q?EaTskLi8vCnHeafy5Uxme8xy9brHC2+rPZchLOtNyPV1FDx7jXyzCJ8TxAr7?=
 =?us-ascii?Q?GbLNW4KJEKaW+UGjLrr8q9mFHNIE2RAl8BzKZArCCg7SmMK87ffqND77eyth?=
 =?us-ascii?Q?LN3VfEnscbMvsGGGeZpUi1HFUT9bsQQBDUzK+PBZCwM0Mt2K8Q8DLUnCCIV9?=
 =?us-ascii?Q?H12lqgadpgJocQ1ntbbSLMNLyvsGPAy10cL2iVmTNWtxdk/cEv7rkklHjoFY?=
 =?us-ascii?Q?3qzHJblgRRJhw1tSrx/TEJJaOX9mYaFZCci88i9r06v1mIYN3SnK3zONuETC?=
 =?us-ascii?Q?0pomyV0CQFTgryvUW9bMqEf/Ah/+/r/+5yxRxma745X22ATwPc+gDmMCsKPF?=
 =?us-ascii?Q?ePrqIhlLrAFfRypYLQIvbZgvlIUY4s9hN3jLzbUS67b3LS0Jnb0mt4qfeKAC?=
 =?us-ascii?Q?OVO3TV+XjBO1v7H7nfw7/zf5WwVgrT77flu49RF1InTug3Y8IsGYv26ryTax?=
 =?us-ascii?Q?G52CojETREuOFq5KEYnGsvNR3ka0I+B6zN32iQt1k1RVNGuRViT6F2R/OczQ?=
 =?us-ascii?Q?CB7kJQ9WR+iESpyv+U7WJ95e1OzJzbGLpF0WJCChqckzC+EKODoMmQtVKX7C?=
 =?us-ascii?Q?ERTH3IEvtAX0KN1uwYbfdYbEmeoshLcolGvQFS3Q99IgMi0HUCSmBQTlXk3F?=
 =?us-ascii?Q?3Qv0Rs7+8ZeOTNer+PB3vrtV2LIgne2VS3hgfPzlWIDdcOJwjBd4BcTEU45M?=
 =?us-ascii?Q?hzSuudKQd68Xm0czzUFMzOA1eMrblg25/eZq94s1w774G0ZYILOmdziwLk1I?=
 =?us-ascii?Q?mDJ1tPJ38tlewLzxojceQr7xvbLOKiEx1CZ99N12NpFz4dIksDHla2Qk7gtF?=
 =?us-ascii?Q?HXpQpRHTWWOJ5d+vtKe7qXCzwN8WLQTGtgV5m2ExKhejO/vUzat7CylGdOR/?=
 =?us-ascii?Q?w4duRV1dR6Guhwahr2EUYV9pwwRPmCh3Y4s9FyMiuIW6fneONuShZz2jhGzL?=
 =?us-ascii?Q?zdjgLBd+qN1aKScOdOwrymmQ2d2LUhwBnaD2R33QR+6Ncg+1K3RcMejAkF0g?=
 =?us-ascii?Q?8YNZ6cY4c+TgUQs0L0Ya8ESzMuPa9NZ5A2pW2CnB/qhi/zA3d6MNqMb1bIVj?=
 =?us-ascii?Q?dFLfLuQJNtt/7h+Hz7fwxpeTcTKgsarQuCPJDjgvHCzKZCouLPrkSZyzFlQB?=
 =?us-ascii?Q?RT6u0ZUIZs70T0+83jipzrSPENhO27SwaPfwOEd/9gRfTz3CXx6oU1aCBLzn?=
 =?us-ascii?Q?2ArEZHJfmibfjcXU6mZQTSHvUpy07oBKgIjRILJCYRqkWqndv2br7Dsp8Nyc?=
 =?us-ascii?Q?IyIyPI8oj3IDvSWwiT0h86kujzUvfjWMF43BkidcRXN1S+SPE5dr7M7LKjbZ?=
 =?us-ascii?Q?u+th/HWsObk2Y44WRt1BGQBUBgNiZmqGQqFUOrNVYBurHo7c9njrJTM4BzNM?=
 =?us-ascii?Q?DmpxXAOEkstzq5um5ZJkNgrUWGhVqnQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b11e1f41-b84c-45ac-c76a-08ded051bf78
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:05.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSCpCwNRsb88SGESUv0aTkBC2z/xL7jI+ktpC9tFBpYYedgn6niggjDo4xmsUF29PNLZXez6BCnVUaCXrUhgZ1WlKPk+YYGU7X6DiPeQgu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11754
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38805-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B879E6AF1E1

We have only an7581 specific code in the pinctrl-an7581 kernel module,
so 'en7581_' prefix is not necessary anymore. Remove it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 398 ++++++++++++------------
 1 file changed, 199 insertions(+), 199 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 7db050535058..31bae9697826 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -316,7 +316,7 @@
 		.regmap_size = 2,					\
 	}
 
-static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
+static struct pinctrl_pin_desc pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
 	PINCTRL_PIN(2, "i2c_scl"),
@@ -377,184 +377,184 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
-static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
-static const int en7581_pon_tod_1pps_pins[] = { 46 };
-static const int en7581_gsw_tod_1pps_pins[] = { 46 };
-static const int en7581_sipo_pins[] = { 16, 17 };
-static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
-static const int en7581_mdio_pins[] = { 14, 15 };
-static const int en7581_uart2_pins[] = { 48, 55 };
-static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
-static const int en7581_hsuart_pins[] = { 28, 29 };
-static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
-static const int en7581_uart4_pins[] = { 38, 39 };
-static const int en7581_uart5_pins[] = { 18, 19 };
-static const int en7581_i2c0_pins[] = { 2, 3 };
-static const int en7581_i2c1_pins[] = { 14, 15 };
-static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
-static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
-static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
-static const int en7581_spi_quad_pins[] = { 32, 33 };
-static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
-static const int en7581_spi_cs1_pins[] = { 34 };
-static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
-static const int en7581_pcm_spi_int_pins[] = { 14 };
-static const int en7581_pcm_spi_rst_pins[] = { 15 };
-static const int en7581_pcm_spi_cs1_pins[] = { 43 };
-static const int en7581_pcm_spi_cs2_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
-static const int en7581_pcm_spi_cs3_pins[] = { 41 };
-static const int en7581_pcm_spi_cs4_pins[] = { 42 };
-static const int en7581_emmc_pins[] = {
+static const int pon_pins[] = { 49, 50, 51, 52, 53, 54 };
+static const int pon_tod_1pps_pins[] = { 46 };
+static const int gsw_tod_1pps_pins[] = { 46 };
+static const int sipo_pins[] = { 16, 17 };
+static const int sipo_rclk_pins[] = { 16, 17, 43 };
+static const int mdio_pins[] = { 14, 15 };
+static const int uart2_pins[] = { 48, 55 };
+static const int uart2_cts_rts_pins[] = { 46, 47 };
+static const int hsuart_pins[] = { 28, 29 };
+static const int hsuart_cts_rts_pins[] = { 26, 27 };
+static const int uart4_pins[] = { 38, 39 };
+static const int uart5_pins[] = { 18, 19 };
+static const int i2c0_pins[] = { 2, 3 };
+static const int i2c1_pins[] = { 14, 15 };
+static const int jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
+static const int jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
+static const int i2s_pins[] = { 26, 27, 28, 29 };
+static const int pcm1_pins[] = { 22, 23, 24, 25 };
+static const int pcm2_pins[] = { 18, 19, 20, 21 };
+static const int spi_quad_pins[] = { 32, 33 };
+static const int spi_pins[] = { 4, 5, 6, 7 };
+static const int spi_cs1_pins[] = { 34 };
+static const int pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
+static const int pcm_spi_int_pins[] = { 14 };
+static const int pcm_spi_rst_pins[] = { 15 };
+static const int pcm_spi_cs1_pins[] = { 43 };
+static const int pcm_spi_cs2_pins[] = { 40 };
+static const int pcm_spi_cs2_p128_pins[] = { 40 };
+static const int pcm_spi_cs2_p156_pins[] = { 40 };
+static const int pcm_spi_cs3_pins[] = { 41 };
+static const int pcm_spi_cs4_pins[] = { 42 };
+static const int emmc_pins[] = {
 	4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37
 };
-static const int en7581_pnand_pins[] = {
+static const int pnand_pins[] = {
 	4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42
 };
-static const int en7581_gpio0_pins[] = { 13 };
-static const int en7581_gpio1_pins[] = { 14 };
-static const int en7581_gpio2_pins[] = { 15 };
-static const int en7581_gpio3_pins[] = { 16 };
-static const int en7581_gpio4_pins[] = { 17 };
-static const int en7581_gpio5_pins[] = { 18 };
-static const int en7581_gpio6_pins[] = { 19 };
-static const int en7581_gpio7_pins[] = { 20 };
-static const int en7581_gpio8_pins[] = { 21 };
-static const int en7581_gpio9_pins[] = { 22 };
-static const int en7581_gpio10_pins[] = { 23 };
-static const int en7581_gpio11_pins[] = { 24 };
-static const int en7581_gpio12_pins[] = { 25 };
-static const int en7581_gpio13_pins[] = { 26 };
-static const int en7581_gpio14_pins[] = { 27 };
-static const int en7581_gpio15_pins[] = { 28 };
-static const int en7581_gpio16_pins[] = { 29 };
-static const int en7581_gpio17_pins[] = { 30 };
-static const int en7581_gpio18_pins[] = { 31 };
-static const int en7581_gpio19_pins[] = { 32 };
-static const int en7581_gpio20_pins[] = { 33 };
-static const int en7581_gpio21_pins[] = { 34 };
-static const int en7581_gpio22_pins[] = { 35 };
-static const int en7581_gpio23_pins[] = { 36 };
-static const int en7581_gpio24_pins[] = { 37 };
-static const int en7581_gpio25_pins[] = { 38 };
-static const int en7581_gpio26_pins[] = { 39 };
-static const int en7581_gpio27_pins[] = { 40 };
-static const int en7581_gpio28_pins[] = { 41 };
-static const int en7581_gpio29_pins[] = { 42 };
-static const int en7581_gpio30_pins[] = { 43 };
-static const int en7581_gpio31_pins[] = { 44 };
-static const int en7581_gpio32_pins[] = { 45 };
-static const int en7581_gpio33_pins[] = { 46 };
-static const int en7581_gpio34_pins[] = { 47 };
-static const int en7581_gpio35_pins[] = { 48 };
-static const int en7581_gpio36_pins[] = { 49 };
-static const int en7581_gpio37_pins[] = { 50 };
-static const int en7581_gpio38_pins[] = { 51 };
-static const int en7581_gpio39_pins[] = { 52 };
-static const int en7581_gpio40_pins[] = { 53 };
-static const int en7581_gpio41_pins[] = { 54 };
-static const int en7581_gpio42_pins[] = { 55 };
-static const int en7581_gpio43_pins[] = { 56 };
-static const int en7581_gpio44_pins[] = { 57 };
-static const int en7581_gpio45_pins[] = { 58 };
-static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_gpio47_pins[] = { 60 };
-static const int en7581_gpio48_pins[] = { 61 };
-static const int en7581_gpio49_pins[] = { 62 };
-static const int en7581_pcie_reset0_pins[] = { 60 };
-static const int en7581_pcie_reset1_pins[] = { 61 };
-static const int en7581_pcie_reset2_pins[] = { 62 };
-
-static const struct pingroup en7581_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", en7581_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
-	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
-	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
-	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
-	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
-	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
-	PINCTRL_PIN_GROUP("spi", en7581_spi),
-	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
-	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
-	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
-	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
-	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
-	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
-	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
-	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
-	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
-	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
-	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
+static const int gpio0_pins[] = { 13 };
+static const int gpio1_pins[] = { 14 };
+static const int gpio2_pins[] = { 15 };
+static const int gpio3_pins[] = { 16 };
+static const int gpio4_pins[] = { 17 };
+static const int gpio5_pins[] = { 18 };
+static const int gpio6_pins[] = { 19 };
+static const int gpio7_pins[] = { 20 };
+static const int gpio8_pins[] = { 21 };
+static const int gpio9_pins[] = { 22 };
+static const int gpio10_pins[] = { 23 };
+static const int gpio11_pins[] = { 24 };
+static const int gpio12_pins[] = { 25 };
+static const int gpio13_pins[] = { 26 };
+static const int gpio14_pins[] = { 27 };
+static const int gpio15_pins[] = { 28 };
+static const int gpio16_pins[] = { 29 };
+static const int gpio17_pins[] = { 30 };
+static const int gpio18_pins[] = { 31 };
+static const int gpio19_pins[] = { 32 };
+static const int gpio20_pins[] = { 33 };
+static const int gpio21_pins[] = { 34 };
+static const int gpio22_pins[] = { 35 };
+static const int gpio23_pins[] = { 36 };
+static const int gpio24_pins[] = { 37 };
+static const int gpio25_pins[] = { 38 };
+static const int gpio26_pins[] = { 39 };
+static const int gpio27_pins[] = { 40 };
+static const int gpio28_pins[] = { 41 };
+static const int gpio29_pins[] = { 42 };
+static const int gpio30_pins[] = { 43 };
+static const int gpio31_pins[] = { 44 };
+static const int gpio32_pins[] = { 45 };
+static const int gpio33_pins[] = { 46 };
+static const int gpio34_pins[] = { 47 };
+static const int gpio35_pins[] = { 48 };
+static const int gpio36_pins[] = { 49 };
+static const int gpio37_pins[] = { 50 };
+static const int gpio38_pins[] = { 51 };
+static const int gpio39_pins[] = { 52 };
+static const int gpio40_pins[] = { 53 };
+static const int gpio41_pins[] = { 54 };
+static const int gpio42_pins[] = { 55 };
+static const int gpio43_pins[] = { 56 };
+static const int gpio44_pins[] = { 57 };
+static const int gpio45_pins[] = { 58 };
+static const int gpio46_pins[] = { 59 };
+static const int gpio47_pins[] = { 60 };
+static const int gpio48_pins[] = { 61 };
+static const int gpio49_pins[] = { 62 };
+static const int pcie_reset0_pins[] = { 60 };
+static const int pcie_reset1_pins[] = { 61 };
+static const int pcie_reset2_pins[] = { 62 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("uart4", uart4),
+	PINCTRL_PIN_GROUP("uart5", uart5),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", i2s),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("emmc", emmc),
+	PINCTRL_PIN_GROUP("pnand", pnand),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("gpio28", gpio28),
+	PINCTRL_PIN_GROUP("gpio29", gpio29),
+	PINCTRL_PIN_GROUP("gpio30", gpio30),
+	PINCTRL_PIN_GROUP("gpio31", gpio31),
+	PINCTRL_PIN_GROUP("gpio32", gpio32),
+	PINCTRL_PIN_GROUP("gpio33", gpio33),
+	PINCTRL_PIN_GROUP("gpio34", gpio34),
+	PINCTRL_PIN_GROUP("gpio35", gpio35),
+	PINCTRL_PIN_GROUP("gpio36", gpio36),
+	PINCTRL_PIN_GROUP("gpio37", gpio37),
+	PINCTRL_PIN_GROUP("gpio38", gpio38),
+	PINCTRL_PIN_GROUP("gpio39", gpio39),
+	PINCTRL_PIN_GROUP("gpio40", gpio40),
+	PINCTRL_PIN_GROUP("gpio41", gpio41),
+	PINCTRL_PIN_GROUP("gpio42", gpio42),
+	PINCTRL_PIN_GROUP("gpio43", gpio43),
+	PINCTRL_PIN_GROUP("gpio44", gpio44),
+	PINCTRL_PIN_GROUP("gpio45", gpio45),
+	PINCTRL_PIN_GROUP("gpio46", gpio46),
+	PINCTRL_PIN_GROUP("gpio47", gpio47),
+	PINCTRL_PIN_GROUP("gpio48", gpio48),
+	PINCTRL_PIN_GROUP("gpio49", gpio49),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
+	PINCTRL_PIN_GROUP("pcie_reset2", pcie_reset2),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -1154,7 +1154,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
@@ -1181,7 +1181,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
@@ -1242,7 +1242,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
@@ -1303,7 +1303,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
@@ -1364,7 +1364,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
@@ -1425,45 +1425,45 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
-static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
-	.pins = en7581_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
-	.grps = en7581_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
-	.funcs = en7581_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = en7581_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = en7581_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = en7581_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = en7581_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = en7581_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
+			.confs = pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pcie_rst_od_conf),
 		},
 	},
 };
 
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
+	{ .compatible = "airoha,en7581-pinctrl", .data = &pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.53.0


