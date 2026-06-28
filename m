Return-Path: <linux-gpio+bounces-39073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uuQRD18zQWoomQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:44:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9013A6D4284
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:44:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=q1yc0aVX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39073-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39073-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91343021728
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA673ACEF0;
	Sun, 28 Jun 2026 14:38:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447723B14C0;
	Sun, 28 Jun 2026 14:38:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657508; cv=fail; b=Dvxm260kShJm8OgfrfzMhv8hdAQjURuwx7os8DWvNKS5dMh0zY+8/F0tnE3zyedkP60+ixSiYqLeN/IHkDEQByn2Pv9J1KQViJEanCQYZhA7cOCOK5m6JVwcngtoTJsg1zkQvtUo2lC/w0uSIjK8Rhe376qDHSVA/ZGfWu56sFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657508; c=relaxed/simple;
	bh=UaOIBrj3RGxAw9h0ZeeuMyfZ+yEw/BWmDdwqliUxSHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYPToASU+mXBANrnqC5jxAg2jGEQa6evL3DU27S+UVap0qJRw1jlolid+85FY2RssTk7g3Vk3n7SNJzy4GQBR7EzOHkKUgkW9NQclKdkb5oJ2yG9k/Cf+3MroLhhONVl9GM8XwnERB9Um31we/TahmUAqQDbbIx9NTGu2PPpiNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=q1yc0aVX; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKo9i8yJezmP0v3pJB9rnHeaEGiBzRuAr3KUSf4cSO7Vw7e4rUXp+aDz0YoGe0ljsVKpZghW4UV5W3bKekUc6JX4+wmTGFb+NyIrvuY/scwIeoI0BWy/XKIUQhEzAakbEqPdXh6H9xnveWyFqGaiq87Jp/tP9M/RGh/K5jaquFCJURRBN1YFkn5EpkQ7DBks91A3nonfBTXgtKJFqWo4J/5GZwXorSAQIwfKj0Dmy3TLx94eDuweXqmA69rIT/pnjB5Ij8ii0icDxij9CAK2TidsoujrbHJahBQKAJcTH2jcHA8/W+vPEUI2hj/UT6xSoEPzzmRSVFkj9Twn/2HQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsbE91cAq6VmbXvFyTPcYhP9m4ltSG/pWbAP01pCG5E=;
 b=rVfXYk2ndPX1d99IeeY7xW+53Dxycc/oc79eH3pMLLD2VwStyKn+QXGrEhUZGAYJIACMgFKhVPBetbD2u+zsdQ86RQCJbQWbQQ9pxQhm5UMtH4Uw5n/ok1pNybfwig6+BGI1MAaQ/Cb6GjCXsIq99Ln3+KxcvLHv/ffzyo9IBlUsXGp1zSGA9UKycXNR82iM3qz+12QSVElXeo5GRBQBfKpkBLN9ghnmxIvgGa4yZFKrBDwFZu3ts16jDbuky3AoBU7C2pPlRpxj4QvSZQWQjn+uTAilkNHdZgFsY7gJFe7Ts2R5/LPtWrGLDngnxyEHmVQWFzAiDlRUCxNEZGNK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsbE91cAq6VmbXvFyTPcYhP9m4ltSG/pWbAP01pCG5E=;
 b=q1yc0aVXzui11z5ofAWu5dgMUBqV39MP8bWzuGYchBordy4hjYcEDFR8Dam38kG3CAjU4EFiZvIZOIff3LCnordnAMxi52wa0s8OnfCqa+VGi5IZd8c29kPhZSjMkENWhG/QWZp2Ad+Uz02lE8SvS5nEcAUn0novw8tzBw1wrdOb+3yELSfG5MMDV9a1s2bb+JPYghn0oteQnAREOgXqdVN9nTBnQx8emrrxwX+W/xXDcJ/V2rdKmnVCDn2A9ceAlJheckYIF6H3omaOXYn1AlhkJuOHI8Dom32LY8fbFJN9PKIhBIC8TcL5KwH6HETM5K5z4IzioFZxDhNERRHlWg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:38:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:38:06 +0000
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
Subject: [PATCH v6 16/17] pinctrl: airoha: try to find chip scu node by phandle first
Date: Sun, 28 Jun 2026 17:37:32 +0300
Message-ID: <20260628143733.273651-17-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 8322add4-85f6-41df-66fe-08ded522dded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	RT++8XBzqUbXIPH0Of/wdNQvzgryEKIZhAWylJ7tvO9npEnApLp5yUO0iw5p/54zrjjCF4dRR8pIx9iYLr8dAnbwvhY6aRFQaw+Q3VvSwqw1bCsCUpgmKVPDldmM79ZdKdPkI7y049Lqa19lUpoEjX39XVwCtvcnwyYYzpwQxs4zC3TTli8aP40+RpD03c9F/G3nnpxX23eBj9dVPDSJIA39lFE/fVzPwGisGgOz75Bteb91fxdDL+y9deR4pxcaXTub7EvKjMRUMbvXu7nVtYOY8HWW68GSsF/IoaQ27NXOfFrkYz/mgqtO81ZikglqybTbE+7njyKrQgyXBmNrrZq1Fd/RY6wByYFGJwaEM+pI/rha9+gikEbkDChTZZT/HqtrLTTMn0njIuGAL6DZBbfh+Dj9Kczvj12X6zG6Tkfl+MHjc06sMR4TL2iVlaPGo0uEcGphrRMxGtqvdLPBNlgymFtjOe7NEv9P9QPrbgNJA4kTsYXp6mLldYG37cSqQ6qrjNZPNAGhCYSVTlG0GaMBEA1faYSaO+aG7tDylv4DU4eGe1Ek+NHpA6A9rQgUejV218cOUZemxW48cOmb8Qtax7WWkVLDS4CUZEfN516dT9sFCVxxADd9+5hmCo0QyuCenm8tBgegIwLayUsUAU58AWRDnItAhyKlrUO4kZi5HWkj9mYNl6ovNA+BmZwpfJunEwaAGXQpbr7M3iQgF/rr3kMSnFZD/lF1uXDjNCRz/p93zXh4Faorv0zRB27c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WeuIpQ+AtkZYKvcT8/wtEIkfy2wyxz1gi2DMaxuR/M0L1WcbvnQowkrUc9aa?=
 =?us-ascii?Q?goIOKvmGMhLNuVLLlAJoKWZjyG3e0+IPjnzYs61qTpRjpohbSVC3rW6Phjwn?=
 =?us-ascii?Q?RM6xBBvLysWoS59t3cVD9kTEOrd4UDmLCjjhhRXOu5FilkOk1nleYGp+SOeB?=
 =?us-ascii?Q?cYe7yxt1hoOritKhBd0jr8CjgUG+z5ACmewf2E1tv++JbnBCqV7ZJ5FoXzga?=
 =?us-ascii?Q?7F1IqmPirru9zK5VIf50Zb2Mek0p6TXLZDczkkNVfSPpMrcrcIq2ZNKNrKf1?=
 =?us-ascii?Q?Y3bpsxbW1lkm129HHnH6M+taW8EFCyQJECKixtuTFWNMW9TkSv5+1O9kMqZf?=
 =?us-ascii?Q?u33ou3Whj36VpCZO4DUU5Ny2iH+ea8JdgBCBntsPHQpC5VML6jGV6uibr8Ef?=
 =?us-ascii?Q?19CA2g04WJKVdPpDQ0CFMyQK2lLq6OkJDXCNmEmflsL0p1742675ULHHwo7R?=
 =?us-ascii?Q?7lk7XRuDa7/Y37QfFOHeHEQwordFzNwkH/CzDqUKgKN06KTr465gKK1lLegY?=
 =?us-ascii?Q?m4OmpLwGTutZWW+yldER20I+XjUfIsuoT8Nq44Hmeh81f+7Ra5IXli97uSyQ?=
 =?us-ascii?Q?IAT2NYjggCA5iTVk4R6yM2O0xhIkvPOXO431RXHVP/Ojm4PB40iY/kYWDhIx?=
 =?us-ascii?Q?m5o10XuwshhzAM9MX4h/kG94bVa653i8BEJtxUVWQoHVVU44eN3dFJ3xrZIS?=
 =?us-ascii?Q?Q8YkMIi3I7Ua1xF2JRgCoPZSBPXgEmCBQYLyu5p7/7BPH27CjzEYsJqIXRt2?=
 =?us-ascii?Q?XCU1ZOeYSL0iAh01E4RgTXP9JMAnkiZtPEvv3I219V1ez5TNn0ZdfJFDBdvm?=
 =?us-ascii?Q?b0+KjUIVWksQpsvGZyIIXWcW5CDY1jqJMlPNrbD4SaHZi9m9SZnR9QQBOMQ1?=
 =?us-ascii?Q?eH8JpZ9YyiGxop8JgI21ZWhUXMKQJsSMxabxbhnUWaJKsrqAdobK+rJIEUVX?=
 =?us-ascii?Q?3urSJDbAngLyLd04orYdtzXx86Jbw+7vAOFYr8AhIXRO0N/Y7lbdGfIk+czd?=
 =?us-ascii?Q?MPGMhNxZvvIE6/fMSyNTczqZmVpcJ/i8cdOtWvOt0quxYZAJDpwpmi1bg6dm?=
 =?us-ascii?Q?CVo9WuWXVn/0VVZ5Rnq7tgOS9IL0NC5cYiXj0+eOQW+PcBpWqylvmqYBCjZZ?=
 =?us-ascii?Q?2DvcOZ5XT0C9eWfwA6nQzhLgkEa7h/Wa1D5+ZcoOZv5uwdS/9aQJPyhEw+ep?=
 =?us-ascii?Q?APhFOD/vUsM3Ko6vpvWdLpA4s9iry6iV12iNa75ODDtcLy8sulppqH93fhWt?=
 =?us-ascii?Q?pbWy7Rr+WidMBwk9OlG7qv+H9+5mbv3WVzDaweWyK4NuHG01p6+u+Th+eFet?=
 =?us-ascii?Q?ietiRXPlBc8c3L3ROH06AoBDndUCOVFuTsvH9VTjkT4aMw39mw9ecOVhJQ2U?=
 =?us-ascii?Q?W+2Ky+8gHRZj2/xJJ7eXv/i4kBqW7QMaX4ZYPmH4+hj9PZn6Q6rb0im4JCyo?=
 =?us-ascii?Q?vcWP84NFPEkF2cUn8Gi1VsNtTxY8JAhRIXlgclgG7e8qfg9u8Q3vr0Qm5tkj?=
 =?us-ascii?Q?vVqpWSg7exfWkypHeX0XHk2P9fPLY6yL5tgP+pLYyxk/E/QlnAxpm78NfY/G?=
 =?us-ascii?Q?yG13HGFZ0p7CIL9Ps0BOZBO025otFvCV34t5sM+KEmmD10RM4KjODLNkMGA9?=
 =?us-ascii?Q?mk7hcYkwH5X8J/pXAYNYbLFa67m27xqwBFXHXrh3x9P6o01f2IK8UYVEFX2Z?=
 =?us-ascii?Q?QhO7cSGzGAH7d1HZjks8yHYHFl0LUOwA+jjrmyTlnrs2kanJlmdNIga4mEB7?=
 =?us-ascii?Q?OG0eRM0wbuOvtnhhXqY5amaiDKFh9Lc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322add4-85f6-41df-66fe-08ded522dded
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:38:06.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iu3o6LpRZKtSp0F9DRbgr1RRjFd9I6arBPsR2WF/5DoOSxE20b69+IQTDvB+oMPBKJyHejri78dmkDfMk47F9ZuiBlBe33Rr6h6s+oNxLmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39073-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9013A6D4284

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 9a202d5bb4b1..47900be19c2b 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -154,6 +154,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 543475d23fde..e24e03b39d3d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -683,9 +683,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 6e53143e91d7..6d6c5f1ee5d2 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 74f93327d41a..6d3ef32acf62 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1442,6 +1442,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 7f434c9bce92..a6202f6313d5 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1072,6 +1072,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
-- 
2.53.0


