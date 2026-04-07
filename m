Return-Path: <linux-gpio+bounces-34769-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM56Fs7Z1GlxyAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34769-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:17:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEA3ACAA8
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A928A3010711
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42623A75AA;
	Tue,  7 Apr 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="Wy1U6Yaj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023100.outbound.protection.outlook.com [40.107.159.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAA3A7F70;
	Tue,  7 Apr 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557060; cv=fail; b=ng8GOUGug8tzp+sy/9XeqBVT6Jh0Ny/0NYUjTq3Qc/iUnMBdDkStfR8XvTpP6B+bBLQeJ19iri9IB4/fWBxScFXuBle5ZJWouUatspvTDmkOvpHNBYdC5nbzKHtQGRzd9k0VcpVJA52AMslVWAg7KVn7RK0xuv9xvjzmCQO2h68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557060; c=relaxed/simple;
	bh=VGYo2WzxgGKJNF3PY6UDU4bJkDUIqA5EQMjDfLYOHOA=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uckQXKDhHGfkHALsQw4PW64uq/Vm3jihkxKeajHwt+W1xUIVU37jrbXlA/Ie+KcOSF3dbQ7/E0bZYdBeO7aJwbs+v4dRWTSAMzdtDE9c3SjxIhySLs7266FvG+shwAatXKnIuEtMUW/iQQGb/y8k544jEX/ww7dbugSDt0/rt+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=Wy1U6Yaj; arc=fail smtp.client-ip=40.107.159.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR3jYCQJbgxW5jbIyfMAxsaHuv5a72aOiIfRjEcRF0oCncEDsg4iNqPA5WBxWoB00DiK266vobanL3VyD3o3Dbo3C8pt9hIOTBNAqK/6vBRWwUoJkMW0fhhuEReoqEsmjIu7aKYDbeJ0Yk3eofN6gI17pVH/9SEvOFpX+JQr4ljj1qDS1MZvSJM2Sq/Eb34x4DnMhIrHUHKPaP8DIfDkEZ+LTnWMAGt9kNNV2ZmkbZsyQWY9SeT9J8uHHmaj8JQtjKDGJ9paPKL767LVHO7N0OFonsWVRPFFHIEw0xvsiP3SW8uNJf/4QjpuJi9kyaSbaO5SylEY/Y9tKVzrSM6+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yg+ASer5SjKC1Yb10yRZqtL/v55S0OH3wM0UrzpK4g=;
 b=Sn8BEA8Uv2NbPniohUM2py33qeFeMGiGnFYrpMuEe3NB9xzWAfusLgZOuKq4L4kvq3ld4Debagct4vNF/a3OYNtgy7dLeIJOoWpvbEkkoHRAJIouJZkDiDm2TA8UgmW1BLHDN9VqT0+NrSJFi7dAnVWyW1JdxOH9Je4JKiopCsuMGX0PI2vHtkQsjPF9ZBl7J6bK6bkoxhdFMGArlgfFR8JdLry/fbEh3PD/4qXmHu5Elg7PNS9iBBCNh3UjAI77tQ7U6j0Srslsqizs0dw61PTeeEPPd5W3IHYz/UyG5umcPLJhPxUjh0gzpDHNkohzu6aw8YyRs0ITdfO/ZFavyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yg+ASer5SjKC1Yb10yRZqtL/v55S0OH3wM0UrzpK4g=;
 b=Wy1U6YajGsOaSXDk80QjptdGJQSwB4NCxptjx9B38FbyWztOkeIaeFptQmBR3k+kcfjHfiFnaxJxNEgeZhsuALhjldED7j8q6HmN4QhiOeW7+iuiEjTv5XgERJrttYG7d7PHBN4KM6vElR0jnDBwFbtO0MgeeIk7RX124sS5ONWazl6LhwCsaxJ64xYvDKlgDeX51CcmiQpU6AWIhjORnsccVEst4VzOoHG1dsL8bPbr5UKOOc8y47S7AgxKg8oT8uHDHxAFvRh1ke2aHMP0zourPDO/EXnzjNL2WcdIN/a5tgqsHCQklIxa7g0mfc2PHymO4Foeu6dTlzWNyAVNQg==
Received: from DU6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::7) by
 VI0PR04MB10139.eurprd04.prod.outlook.com (2603:10a6:800:245::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:17:28 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::59) by DU6P191CA0010.outlook.office365.com
 (2603:10a6:10:540::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 10:17:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 10:17:27 +0000
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.71) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 07 Apr 2026 10:17:26 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:17:23 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 10:17:23 +0000
Message-ID: <e6909c2b-d41a-47ce-8f82-2bee3801fa50@topic.nl>
Date: Tue, 7 Apr 2026 12:17:21 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
To: Linus Walleij <linusw@kernel.org>, Francesco Lavra <flavra@baylibre.com>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Mastykin <mastichi@gmail.com>,
 Evgenii Shatokhin <e.shatokhin@yadro.com>,
 Arturas Moskvinas <arturas.moskvinas@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andreas Kaessens <akaessens@gmail.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Thomas Preston <thomas.preston@codethink.co.uk>
CC: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260330161914.1071118-1-flavra@baylibre.com>
 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::18) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR04MB12030:EE_|GV2PR04MB12318:EE_|DB5PEPF00014B9C:EE_|VI0PR04MB10139:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b4e685-226a-4ca0-f187-08de948edef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 whwpCLDfhgdWwD45BOH4QDjaM9hDmh2ILnA1koVCR62kX6z2nOAYzKoCPN3P2tSJZqYkJecHV8256OlPJfeL9j6lT/xmQiR1FSudiX1GFsFCqlYXYvkrNhPMNtQF4mu44bOXSKS6741jtbztjiAQktHbIZTmjnjgsQdWD7Y1anIvTpuXg0Gsc7opMg4UmkQPMJLU8R2rtvInQy7x0UkEkvQnK3bdYfWjLJysdOqt2WHrytffpzlLUArhYR6YMiaDg3Ob0Z6+3z743oAXiwWsfevz/4XRUlZX2AwvTJYhcvptIqeoMm9PmjPFe4KP+clrvW8lrl06cPWQFdsmN4mCX5ZboAjEVRQkPVAj3SLZY/yD0J93RLjlfTMKY0kcU5YDE1O3Qk6fu5QJ8sh3z2iPK07ohfmCKUFuAIf1ZuNPkQPgzX3l4DpxRy1lsezBnT8Of9b9myVkLiCaB/LrP29b2rQ1j9ZoeK7a63E8gb8vyDhk6KUaY5oQoojK4PA5BwdArNa8qoLomunJpVZTuQnhRYfpaUq7fHUfekgVPGTqsZiQ13d+DqbGsFdcqpQb2wnBaGkemTC31KVYyHOUFNo1UMhxzS/5+nmspeXO3xLeIVG+q7+gEtV966g+7TCPtK9H43SsuvKojqeEXg3y96Qpc25voUMcP2ndENTOTlr1Qy1cKp6IqfFTMj8ArWAMe/FY9YGOIehx+rZGXzi86iiatk+3QlKvTNza440qX54v1T1RZ+kqujm+YoX3ekcRWOB8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: SFkjoMdTiLCv0hwQdsR8l6cIVwwLhyRvwDRh56Zlm4sY/6Xubn3Lz1orPG/lwtJ3UBq1J5FLUttgWiUgd4Yttfb79hzwO+QcaNSNK6DQkHHERSfBpp9SdR0CHdSA3a42jDrtMmuisIJsFshlpS/legiV8bb8/X7U06K6VQ1tacmyaOet/j40MpEsknfm5MbOBMqyI2v7EtBIAGKQEZnn12XbvL63rUKfc+rW/Jrrc+8CLYGA24Je8bDUPTk1P6RYnH3geE5OzFEdFTlH/08VU8wNfQHMsxC2t8gk9OtwNVhsBZTF2LxmGAXqegFfmn1b9quXUJyy6OkYrrkbT32V5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12318
X-CodeTwo-MessageID: 0228e241-29fd-4667-9f42-c7550637880e.20260407101726@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d087c5c-4316-4614-e614-08de948edc13
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|7416014|82310400026|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6ngk1RfDUArYqeBIyX1SwFgTIwSPaOoWHjMOtqMM/ZYX00W3RB/wjDPWOKp3+ErUp0Q+2HXtFM9h/PXqwWXHCAc2S+ft7xW5eYYzl74ZEiAJIngA5RMreS6NgP8sw5pzwNTylBwFO2Km5AFsXwbkAQcyyFBEVbojt4yfC0QpiYlWwZs5X3hjV2PSnU/5v0WAiBeFN42UR3g+7HXeTkhlDFP2xi0FVV/UmC99bO5eatYRwLHUIBw3hl6hhRdX9PJ12Et0IV5d2RQIu+zI291hdWkzowTMCkaSW/1AcHwGy0Sg0ZZgyZH5iJnrYFjBZOSJ5OxHo6KJ6TDa0orrh1skYIp2y6w4X0RzQR62fhSENiAjv7WAJkv6jzWdT8t1JB2OGYDaS9FyOZMQ8hJHagkgkhtq9Y7O4XePCA7pipGiKp4HewCD0L/6muquchRnXI04q8VaaIaZKwhpprJ3SC8FOXhMWnoFmZVSF3E/QKyj3E9oehqt/oIbIl83ytGSYa/lmUEXr7VuIpp7ZzRikzw0z6vE784wzxFzUIqsd1aCDyte2bJMZd/OPi5H6YRjM+8mnkTYaRElxY1gsE2KfU3eADfrcTkmrSQKiXv3zd4hDmMb7J5x1RDP1SYMTvmP/5nYC75P12i8Eb/CUDmULOyD7hG/uEH+h8lCMkDLNEEwdxOjjrKAxgsu7/WFayRz5JBlZtAbBbg/ag5uETk/KnSQd87NWk5vDfkvNmVSNWVKY0iTyiLNznzyh4exiDhiOL3H
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(7416014)(82310400026)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bUHDj62eq2ta9qNltmB/yDL4lLHvxubvGZRTR0qSgrz3I98Rm+H0SwjwtkZjd32BZG6i6IejGX25ZQMHSv4E2xWkon8JDT3xiwpntybaCaWIY+HkYYtTyDx3suhZKPwbY8z2tH5Ss0+XOrexNXKek9kWGIVXitm47v3Nc2he8pd+cLhcebvrR5ZLZphK5xIMCPcYZEpumVZLY1oO0Lbv+X/ggdqAtPellFOE3c9ESzS+8D+2QCThNFuCuT2+yM1tvhqgE4b7Xw+GOcy3qrhO5hpsthr4qRFlCxq50uCX6T9kFSPKhgoW0OD+j1kWWd2bDhelHzPBP/MTjeJC4PmPaNFovCf8OMoj8llZznoODcBS2iWefjeeDQDWWNi8p3LKLc6OiCzBY1XJasQLzOmNkX0KZ/gBvDHDcmJyFy1lGaZz6mg598yIdkH3LcyxByu5
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:17:27.6777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b4e685-226a-4ca0-f187-08de948edef1
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10139
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[topic.nl,quarantine];
	R_DKIM_ALLOW(-0.20)[topic.nl:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-34769-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,svanheule.net,linux.intel.com,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.looijmans@topic.nl,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[topic.nl:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4FEEA3ACAA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07-04-2026 08:58, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibre.=
com> wrote:
>
>> A chip being probed may have the interrupt-on-change feature enabled on
>> some of its pins, for example after a reboot. This can cause the chip to
>> generate interrupts for pins that don't have a registered nested handler=
,
>> which leads to a kernel crash such as below:
>>
>> [    7.928897] Unable to handle kernel read from unreadable memory at vi=
rtual address 00000000000000ac
>> [    7.932314] Mem abort info:
>> [    7.935081]   ESR =3D 0x0000000096000004
>> [    7.938808]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>> [    7.944094]   SET =3D 0, FnV =3D 0
>> [    7.947127]   EA =3D 0, S1PTW =3D 0
>> [    7.950247]   FSC =3D 0x04: level 0 translation fault
>> [    7.955101] Data abort info:
>> [    7.957961]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
>> [    7.963421]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>> [    7.968447]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>> [    7.973734] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000000089b70=
00
>> [    7.980148] [00000000000000ac] pgd=3D0000000000000000, p4d=3D00000000=
00000000
>> [    7.986913] Internal error: Oops: 0000000096000004 [#1]  SMP
>> [    7.992545] Modules linked in:
>> [    8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-0025 Not tainted 7.0=
.0-rc6-gd2b5a1f931c8-dirty #199
>> [    8.073689] Hardware name: Khadas VIM3 (DT)
>> [    8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [    8.094639] pc : _raw_spin_lock_irq+0x40/0x80
>> [    8.098970] lr : handle_nested_irq+0x2c/0x168
>> [    8.098979] sp : ffff800082b2bd20
>> [    8.106599] x29: ffff800082b2bd20 x28: ffff800080107920 x27: ffff8000=
80104d88
>> [    8.106611] x26: ffff000003298080 x25: 0000000000000001 x24: 00000000=
0000ff00
>> [    8.113707] x23: 0000000000000001 x22: 0000000000000000 x21: 00000000=
0000000e
>> [    8.120850] x20: 0000000000000000 x19: 00000000000000ac x18: 00000000=
00000000
>> [    8.135046] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000=
00000000
>> [    8.135062] x14: ffff800081567ea8 x13: ffffffffffffffff x12: 00000000=
00000000
>> [    8.135070] x11: 00000000000000c0 x10: 0000000000000b60 x9 : ffff8000=
80109e0c
>> [    8.135078] x8 : 1fffe0000069dbc1 x7 : 0000000000000001 x6 : ffff0000=
034ede00
>> [    8.135086] x5 : 0000000000000000 x4 : ffff0000034ede08 x3 : 00000000=
00000001
>> [    8.163460] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000=
000000ac
>> [    8.170560] Call trace:
>> [    8.180094]  _raw_spin_lock_irq+0x40/0x80 (P)
>> [    8.184443]  mcp23s08_irq+0x248/0x358
>> [    8.184462]  irq_thread_fn+0x34/0xb8
>> [    8.184470]  irq_thread+0x1a4/0x310
>> [    8.195093]  kthread+0x13c/0x150
>> [    8.198309]  ret_from_fork+0x10/0x20
>> [    8.201850] Code: d65f03c0 d2800002 52800023 f9800011 (885ffc01)
>> [    8.207931] ---[ end trace 0000000000000000 ]---
>>
>> This issue has always been present, but has been latent until commit
>> "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe a=
nd
>> switch cache type"), which correctly removed reg_defaults from the regma=
p
>> and as a side effect changed the behavior of the interrupt handler so th=
at
>> the real value of the MCP_GPINTEN register is now being read from the ch=
ip
>> instead of using a bogus 0 default value; a non-zero value for this
>> register can trigger the invocation of a nested handler which may not ex=
ist
>> (yet).
>> Fix this issue by disabling all pin interrupts during initialization.
>>
>> Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at =
probe and switch cache type")
>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> Patch applied for fixes since it's pretty urgent, and it also looks
> right to me.
>
> However added some people using this to the CC so they
> get a chance to react before it goes upstream.
Looks okay to me too.

Maybe it'd be better to unconditionally write "0" to this register? No=20
need to exercise the interrupt logic and pins when no-one is listening...

I was going to say "if the device doesn't have a reset GPIO", but=20
looking at the code, the reset GPIO is never asserted by this driver.


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




