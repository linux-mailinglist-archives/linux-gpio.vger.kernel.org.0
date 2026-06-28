Return-Path: <linux-gpio+bounces-39072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aVgQN3EyQWremAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:40:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F906D41FB
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:40:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="6DApkIt/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39072-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39072-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B45F63016C24
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7653AFD15;
	Sun, 28 Jun 2026 14:38:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2C3AFAF8;
	Sun, 28 Jun 2026 14:38:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657506; cv=fail; b=gLJ8ZTtbBtPiHdqwY4KeOObdu0mb6b9/kDoUH4lDM20F5VFwWf7vfyh6zLJ+J/vglOdKGs6nCVP7minKxU5Aw/hnBj/C318ZZRDmmxYRAnFDCoa8WUmquPuIxUtVFXWsClrtP30CZHa3v+h0f3gJej7Q6oXJ3aQhLywhhATLBeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657506; c=relaxed/simple;
	bh=d+ApsqJ1bVCkoLRuiQ/7rqFVhb1+VZloV+fWgo7OlSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dTgkt3TolrL9xYueJlvBUwhq3xgoyAVCkKxn327q19ejCzwNt6j7AM7/BqIaU1+AN4w3fldgvZyDqJ2ZdlZ7ltLSwkFAsYGZUcppzszFViNvzXUWUONZltA0H2dHtktyr9h9dQEeWgyWv81EYR9NkTthb+H6XcmCHw9oj5Od9Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=6DApkIt/; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMDcfFBLZilvIUw+y0VmdmwZ4HoWFgRtlwZmLlFyBpP8ZbA+Gau6SqS6CserIWoL/Jetg2Yqya5YPM+bTbL3tLECP74K2Cj6RP6cYXRXx8ep0ced9zK18UGqx46CC73M4f6SA+R//lLFFHgNw6kmZZtVksJBZkRTSxa4VHXQOr9X/TT+UhOhbx3cCttpZ3tzgOrU1u1i3p1fw/PViC0BI8D9h2Ik5zm406c+DLrhA/zFrcWB4Bs1StGbyIUz7pSTtbKq6mpdUM+Ag4dNsOSjx9xHB52n29pVgcr1YukwmozClPpZeopMuogdLkZ4NOqI9lzeMY/Zh1UTc+HnCBtM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh95Ptr9Jr5ibjmuUbB5ShElbSNjZSk7ZfXrP0Z5Gmg=;
 b=BqX0sYlaI/sx2xPX+/LbfG5e58q9TfJ9Nw3utrd1LhxECvYpZQtcSd2Pd6GT8o3MlEftnsTDkUAVRvMWkeR12AV+dObLE3w83dotarrAIYRKEYVXOq/jT1g1F4kaBg8uPlytZczKE/RXohBauniyGRudUh65r9CKlCyQQzB5cppLpcg7BbXbbW28gC6law1tafdjyMkJ0+Mht888Wz9dAPabY20ZIigAMOWKEzTUPWu7ku8frgnzvJqFCFo1PuhNKDwotXD+AXN8n1xqhVhctT+mYHIjIwuxmqQELnFRyfZ4yxd/aceNz2nuFFI2flfHXYQdDar9siK8yxyWDRm/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh95Ptr9Jr5ibjmuUbB5ShElbSNjZSk7ZfXrP0Z5Gmg=;
 b=6DApkIt/1p/lU081ADSIqrr/WdqnqYkTa1l5qyIDOX6wSolx+uhcH2RjDf19DnCv0gwQ4o9nmQRPoF0GNRqx7ovBi7vPXj21jaRBNV4hw3z70pjkQih8GU+BhEzHzdfDva/kaPhCD2kuDCL3tIiWzjmkTWoDDXDdm0NTLrHQ0j5tE47dVYTf22Mzhw5dZwajGHBGXKxyvv27zL/nu5dl0Opji8ZJOKO1E7l6mC+gA9BVI3ob+Gw1UHh8eu1g4B56m8Z8KPttrVqURHwsPKtHtn9gO1aFg8q1jNcZseS/2l30veII54fsbxdDWpBW+68LO0BeyEC97K32yzOJeM1s6A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:38:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:38:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 14/17] pinctrl: airoha: an7583: add support for olt pinmux
Date: Sun, 28 Jun 2026 17:37:30 +0300
Message-ID: <20260628143733.273651-15-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e15da-3deb-48ec-02a0-08ded522dc87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	EIYCfmBuPc0hHX5g/xF9lfzh1qPILx5+RfOdBF2KWeCDf0kPyu7ZxOVYsDvNTbZLzs8jUH13N7PKWIYA33L4TOH90yMkHT2qTNBUMmE/eDa4dR8zcuVTqGBDjFBRTPdkJw/K2XqnXOPxILctT26U9uCXF+VrM0VDkU3AUKSloSdlrp/3lEMqi3OQo4BfRa39XbzeOc5JwB8r0aMcajs4zr+6zgPHmwoluFBoJ31j16XF8tvQDHmnUiFmAEULaJOQEaM6Ea8+8IG1f1vjMD2raskdJ5CbkDDOKVnOG85VZ1N2Rbg2G9dOY55/9Km5k+zihwCIUq7aBW8Rchv7/Iq0A7yiEYBOUnGluEqIIWsugCIgSfYNvpp9WCLJ46uYWmHqIVFw9DmNNeB1SQky2+WvrXYxA4tX60LKTmqiersHzL9Zwh6ecFyYba3HMXUt1AefSucQJTatO+3WtQ2vZP8DkAKn1Gf7HDLu4/hTkQkmKBaM4Mt6D0lIV7z1UclmE9hQL6yw6B0J0amF848/8FjGqGDF5PRGXai/c98o+9RMcU77NqGUoSsx8xrzodbjSjRKsOl3+DMeYUKamSmOmOyRZbxoMiP2HGscffjMxIiRTimTaIlRXUNobhHjEtCLFmUWcOHQ2SY5uL10xBBmi1hUj5bho1eaQkcHNAdFF+8DR0u3DzF9pkDGpN2/XfP9z45WWRry04jZwpNPwnxR/nxJNJQBUZLReSej17V8E3CrnLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d17cOsev5VkNpMzQ8PipgeET8spYdlac9aJoG4Oly4/9o4cEmOpY0TXMmvns?=
 =?us-ascii?Q?KoEhDJkC8T9RviCER2cnjbyizYVG+B9XUpFEacD7WwMddyhSnSOinbFizmhM?=
 =?us-ascii?Q?hn6EU1NbSGGCfI+4boosz2CIbj8Uvlv+4taFYQiaFYUKE+64LHIco0AXaRaH?=
 =?us-ascii?Q?jBAlLn5r4kSW3407RbP/1teOs0bkSmCafM7hiJE9SJ+70aOZDRc1bYWjMME2?=
 =?us-ascii?Q?nNz4gvSif1uDu/peaZD8DTbjD+HDhYpNNqMJmj5MNt+Y3ZFiDSneKwiwb8AP?=
 =?us-ascii?Q?w/gfZNtxIH7qGkpnlkximMDBYQAixixcmzaJMXMvucYNPCmU/fOPOYK+iz2o?=
 =?us-ascii?Q?TpBFzLIP4d5cpzQqwYJ0h06OvTGyIte5FEziSUGLhUvEg6mbJo2Y27yHbOyD?=
 =?us-ascii?Q?54h3UNYwzpAD1SGNb1gIw59HlyWAHEhg6AGBSBn9x9tAMgNPLffu52BKlhzz?=
 =?us-ascii?Q?G8FmT67GxB4it9Gq6oZOJm9iRU0vecPy39FrQynaasIDJMfDkGUq2HuDzFnZ?=
 =?us-ascii?Q?HQRQvzpl8rZEEoCKWvIngQTdrHaqLpysTCDyisEf2JIlurcxLcEnZC8PZ79h?=
 =?us-ascii?Q?nlRfrfKgEVs7Zx1TAHM0fxN3O3GomKT2AJGgoau5+C+H7Yd3kN0yrHqy86NR?=
 =?us-ascii?Q?70hKx4AwibWJWmH57cdObchRUA3+uZA2CxiZpuT3yozC82osUeQeQEY4F+h7?=
 =?us-ascii?Q?FckvqprODFBoaF4PkGqz6TRoJz1fmOXebhNQJk65wiKly7XZtF/0wbI0LGOY?=
 =?us-ascii?Q?GAXKpzX5z49N5fEcy29lwnF7suIp5sQYDwDk3RmWyU0QGa25EdKi/psqXp0o?=
 =?us-ascii?Q?dJT+nL8865qyAFm9OSEHoZmYtt1oAIRZdQX/gN9wuiUxITQ8JRKa6rj4ElEC?=
 =?us-ascii?Q?SalqmdKTBv8c/8e5rWaOiTM/hdlSDbFEeOUCxO0AFVvHdu873gt/xi/KWRxn?=
 =?us-ascii?Q?oWVEWmSwP9qgTQIQ9lXlzsOIz7uDruUXFAVvSuyN+6hH8CyjV5EeslUC3tmn?=
 =?us-ascii?Q?YjWSed76D1eerLno/oC9x/GoeufajPN8kwU/bnnwOtnvrRBjdXV+yZy70zAT?=
 =?us-ascii?Q?87GBW23CgqAEg7em0dhDd4Z20/JOI7dqNSUgrBhYyyVt0O/PdowD+9GVVzDV?=
 =?us-ascii?Q?XNDMhnmE5g7p6LesWBQNe144JPKwJ/pH3zGmBYg4wQRxu9yvUpe3CQPotV78?=
 =?us-ascii?Q?eNmfxjCTg/nmd5QEHvAqpXn23vuDX9u0z9/CPC8dCCirAVrq2m58TODRBImd?=
 =?us-ascii?Q?EyR2qilxGA13K23CWqmKSCmT+bsPW5u0Gc/Q+9zh9QLU5AT/csOiLIoKejcA?=
 =?us-ascii?Q?O3Z9YtH33WfhSmB1IJnFIClDzA0kxcK15CkMwWyR8gTjA14u4oeaTGSmDtuF?=
 =?us-ascii?Q?y4Ugxby3Su1aUP0tnv3h/LmA4GZ4c4IA36XVTMOPiYJeLeCEwvgPdizIlQC4?=
 =?us-ascii?Q?cMD9v0zUleEqMaHX2NR6GjKZ+b5l0nq7929iu8FHKsRYjAjza8vuTdmMfuPA?=
 =?us-ascii?Q?TgD6jMEGDTHwB43Bt8eP2yUw0zlIFQWC4du74Xag1+i6O/k1REZFg2cwbjmh?=
 =?us-ascii?Q?eJ9huaSnMDir1+ngjV5Ocxhtke6IzSnxFg+llQNqoqxCieTsOZkgZOHP2fdv?=
 =?us-ascii?Q?+6wvs6danBaOKvbQGeTaqBTb56BXPpzKDCs9I5xRqLtf7MN6L9vet4iyN2Nt?=
 =?us-ascii?Q?3eA3H95oYExWi9U53V9YzeipD1u6twJqdp0Q4dRVHfWZnZADRI0dW86l5wVe?=
 =?us-ascii?Q?ioTjgLgqdxDXA8JOAYGyHjQQniUPN7A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e15da-3deb-48ec-02a0-08ded522dc87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:38:03.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04c8u5oASoWPkUbeGoL9tIlSqO439sBLoWqQj40xeCQah/mH4OH95PBIIrwqSO8D3xb3chtrlBl2Emylq3DW4HRitbO8hFSJt6MVwFmF4P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39072-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1F906D41FB

Add support for olt pin function for olt pin group.
Also update device tree binding schema.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml         | 10 +++++++++-
 drivers/pinctrl/airoha/pinctrl-an7583.c        | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 7deb48db52c3..f016e0da65a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -82,6 +82,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pon, pon_alt]
+          - if:
+              properties:
+                function:
+                  const: olt
+            then:
+              properties:
+                groups:
+                  enum: [olt]
           - if:
               properties:
                 function:
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 7e94dcb3b61a..74f93327d41a 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -53,6 +53,7 @@
 #define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_OLT_MODE_MASK			BIT(12)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
 #define GPIO_PCIE_RESET1_MASK			BIT(10)
 #define GPIO_PCIE_RESET0_MASK			BIT(9)
@@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
 static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
+static const int olt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -482,6 +484,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -566,6 +569,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -648,6 +652,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group olt_func_group[] = {
+	{
+		.name = "olt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_OLT_MODE_MASK,
+			GPIO_OLT_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 	{
 		.name = "pon_tod_1pps",
@@ -1171,6 +1188,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0


