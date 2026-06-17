Return-Path: <linux-gpio+bounces-38611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H6s6N40kMmpMvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FE696703
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=sbocSVsJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38611-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38611-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4DE0300B1FD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336F631AF3B;
	Wed, 17 Jun 2026 04:37:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020139.outbound.protection.outlook.com [52.101.84.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7C31A7E4;
	Wed, 17 Jun 2026 04:37:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671051; cv=fail; b=ghqf/4mQQDz88H2DIyTHITSPJequUIaiNzguSU9yP8dzqv/kB14EG8CWbAEDT3liabQuDGI1w6KNuZ9PcGKFQ8NA0TCZUGWgV/gbyLgddEzHfOT8s786xxfTBTZFoJvTZCEUB/HxUnzJBT1lIhuT7cqpRV4hYy9rH0U3LhF8M98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671051; c=relaxed/simple;
	bh=SWJTkV+3qvT0Phb3rDVa+8SE0z0Q8cKmYVn9chzzM6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UGDy0C6u0H7dgkbsdHaNsL+mrOQ46NghZjVwYgHndfRHdIFjkvCE6qboFRx3xf5Q1eRkOmSRF+Dd6ZMGpGUw+Rz8EyxMk0DNwZyw/9JwGUWXfxlOaPJvtb4LUw4VW8K3Dhe8XE8fHS0SgXS8HuOceEm4/igVYcjxy3vpYuOADWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=sbocSVsJ; arc=fail smtp.client-ip=52.101.84.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjp3/D1XhxHsr4yEuAEeOI5HidfW74l3mnHwOCA4DIC98SWYerX1kr268nRUDdhQMv8rqWe/QCxwjIhmVzgn/yk8Z4/6CT8PN3miYpvgArEk7VA0RPV1V3gOL1b7jpHDELnO5jzWPCryByfaXNaHTbIzE/JkmuckVJ5QfDhw3xUn2SaAq8Sv6VIZ7AF6H/DKejsM71essFcR/GoznnI6tAmZq5dpEE0CR1ewjCpSS4ZgMwr2KRtAWwONmwUD9qpAYE80eFb39A4Uq7FLJ6AaU6GTU0oIemVSaqqePehPSHCyCX/XbC7RMWj4TsLWFYG2Fui9W3WHeaIfm7I+MLqEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDL4nMF5AL2R2MB/2AgdWaZ8FFmrSwe0j34hymPNVg=;
 b=qaqz37DsAYIZ+rwMSBVXv3wprlSIFOVkqy6zxbaiuYX8ZIG9GhSRFdvmhvsEOQ1Ju5stIu+RJbQJKD34gRuBxisVbvw3Oc1pZ/wREa9XVyrCIrCbN8j3RYK2vLTyCP2yAyKC9WajbuHlusGHo5Y0E5Wrv8v48iw3SYD7xfbnAWDtik68vy/L4wRpjKRSw3YX9HhMOCaDr2VqWf/VGvu0MKRnk8xd280BvIr3+Zu0eMJsBKWTQpaxD1cHu+1ZZxtA6cRqMDvhCwnfzFmBpzD9NLpmeKGmMZcVhNy+XBoFCTSrC9g5d4tCAh27/HMdMi1rkDB8ePRVLjm35deT3sWZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDL4nMF5AL2R2MB/2AgdWaZ8FFmrSwe0j34hymPNVg=;
 b=sbocSVsJ8DinqmchsiKgq6XuHMBzdgrZkortNQ2ItZGJqAX/r2oCeSTdn5hj95b6wphvD9ZqXgTl9gyLAbQqwVtF+kAtVjQrCpOqpLm2L3f4zooGNvJUHCI6lz/JpKjZ6lTw9FQW/spd8c2aQzicVz/RbcS8tvUuukjh513dkAHlnbwLKe2S5SgWpQ+520BfPd3QKxutC6UUfD0JhigqCHfQKIvVv2BRPu1evbSYzgpQSaM3gtwhbc5zfse4Xm5cVHP0FoPoSBr1GC8FyvJK3NoYtCLiTiVpeOzGTag16PnTZX3GigwkeVYdniQ654brO/PJLrJmCCj7hHNC9e54KQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6224.eurprd08.prod.outlook.com (2603:10a6:102:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:20 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:20 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 14/14] pinctrl: airoha: try to find chip scu node by phandle first
Date: Wed, 17 Jun 2026 07:36:54 +0300
Message-ID: <20260617043654.2790253-15-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: b21e6d1e-a2b0-48c0-3b35-08decc2a1e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|38350700014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	87EGataUe+QWqFEPo3U/ElZSjyqDVd8UhqPsjb6hxk/4D6Xp0sOkZ61HxOwxksCYPc1zA0AAZz96h5W+b5MC08Tbp0GApsya6UWV4pM/EyV3Jbqmzs/RiiouZgaRWVczOOzBITAx659mdZSc/nhE/gbxg/N+0kTJRWwr2CwwYeQkwgTZrJKjdu4paAVNXlK0YvfCcWxQGfxdKwai3BEza6Yb8ho1EcwLRaDGrhG7aCMkqOZYIHqsCCusJ0ahH2nN5xu1IEg1q6cc3Qhxdvto8J3IHcEf+f1Au15eerukRNHat4k5Ul9jJ4aVu6j9P3JXgYQ7R7JKLGsh+mxkrTIYE6PJqWEI3A8yiLd0W+ZTc5nmiJh0eoEbG57dyQg4/9zQ6UlQ6rCgHM4WVO1qvW7JHfrIZRDc6YjyJo/93sWjWWvRDIRk8xOWx2yxRVh7e0Kvlk4Ml0miuHh6TxCXAXhqB63UjaUxLGv8QUtxSIae4KYjQhNKCNkw6mZ4AH6EWmbPrRcZJD10YEo6G6HEKS0kAlKJB7ILCvdG+dgK5LfWUXkQWdMNK4nSieW5cMfjrhTS/90zHOP3Eqe/9/rGvrDlzLUuKv31HxVEZASDwGX4GkZ5Ltlh3b1uUgij4wOIFePELQ1Xf/1ZTxS69CcQpznoAeUCq+KRK1Eh5UNZ51fzc2AWMdlahP+cxz+D9hfSHuF4yotvaSarZhlBvoQyhRNspUwVFIr8Y6sTGpvOqTxq+8mHZSVvAkOGFzi1mAYQ1v7YDYXtIDkZo1hPlY20CiRn4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(38350700014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4bZ7iGDMPKcQ5V7kwlrSE9GFamGyxFLCZeqzVhhAD0pFhvi/5QeKqKdfPlzx?=
 =?us-ascii?Q?Le3Ik+cUzPtLelYLTWB4HpSJoThm+jeKyH3Aa26niywQjWHwEhLb9FGoioTs?=
 =?us-ascii?Q?dnm/RCESbwGOVe4BhBxC95ayLC9uByjNmfdbW4/To4qyVMwrUCRIvOnUBXIZ?=
 =?us-ascii?Q?HA0Y75beefmkVBtIt4+drAiCS6Z2tiz9jOO9vOX7OA5VeBJDQVod9lclXVEt?=
 =?us-ascii?Q?aXwZBaLjjP3VONhp/jDZzhnhLPV6t546unYcHdIkd2RHgJ+RDrEjM65UJ+qe?=
 =?us-ascii?Q?SQIY0Pkl4sDlWxdA4b3SDgYOqSP8fiC6wPS8+RKHUG7uqgMnOna0ox9kV408?=
 =?us-ascii?Q?Trn0S7UOFipSg5RefCmZre99/VRS5VMtIPZ1QclOGvtsewcOYUK4RKfE9Z6y?=
 =?us-ascii?Q?5zES2hSjILjUDArzVsBEcKXLFazg90d0yobSYgsBgQQingHTL5IJIvDXlCHF?=
 =?us-ascii?Q?8NffcygVgFUhsM6sPo2hDSjX/UJmXrHHasVaX9vFjvB+dJIchgpMhOn2aANu?=
 =?us-ascii?Q?xfJKn8z1Y++YGVVJ0w6Q8lRwuRe9E6fuG7pH4RqAEGYBfpRddS5F6sfKuzj6?=
 =?us-ascii?Q?8etQVv6ZshfdmpNO1XhKka3blHro2f4G1WqIlnwg+2aCvsDOKxViDE0IrxTC?=
 =?us-ascii?Q?T652Qy5yePps8Zhf9Knu9/SzEllNpcSJuykR/izoPp9SoiUX3TnUjKHHRIpM?=
 =?us-ascii?Q?SwpnZ+nMkB22rtAFUfqi7nW5ORbk89nPsLPKqYJR9CSumQQBev8t9SkT/48Z?=
 =?us-ascii?Q?h36ZIxA/MnzsAC8KgIEUOYOrOFMsvvGQjEhpvTX79q/P8BNwKCPZh8vWbucI?=
 =?us-ascii?Q?tLV5Em9ZtaW7wEIGxfJjUeV3dIjsq03R6vo44hLVqIxuLWTZwPQtpfMkiT78?=
 =?us-ascii?Q?NXACQH/kkqGTWZGgpSf7PVN1sjiMfK7is2H3638SBCFXgmWqRB8aWO1Xx/jT?=
 =?us-ascii?Q?bpGj8KFvqr/5+ryJQquC3DqZZjtGDjYb5YHgaxYUc7EU/iomuE6IGHV+a0km?=
 =?us-ascii?Q?jo+lZ1nLw9QdcKVW9nA6+4xQVLzER1TkPQ16U6sqQ94pZ6QP0IkJSM73C0tn?=
 =?us-ascii?Q?jZNcymvEa6gWVtxe/pS/+4CEFJU2lGtrJRU8arnRFpIMpFM9z3abHcbmExjO?=
 =?us-ascii?Q?3o5KEAP+wIV24dihc0b1Qaeh2Wbunv0qXDzDGAqTnOAtlqSfWrRerBDVwWFX?=
 =?us-ascii?Q?BqrdS5JMAfLxxkgVBx1YoB0SCzgdYvwgfD+0VbB0CW1ap/y/11ZItVyZPQUa?=
 =?us-ascii?Q?0ite31vLXKCm9aKAVHFs2we6fsw5HfigrDTwj+41BIr3BsMBXP9L46qrmj9R?=
 =?us-ascii?Q?GgKhGKA+0rRJYdB0afR99D4d/A10J7Dtsg1NmQJ+fI2vSbP/ELk79nooKorS?=
 =?us-ascii?Q?9QlkxjThaROnESqsnfRnB1Z2sz3tgpt2Hqnxp6CACHhorDMyklTsLV7++VPu?=
 =?us-ascii?Q?3AlsfTO+4jQRnVLnlZoFfi5ZeHoV5PiJ87zFvNRTFXD20YOOMOaAYk/BdO2f?=
 =?us-ascii?Q?uJM9A5xxPIttkhfZDjBkryIYbgcu8C1uAqVR2Yhd0IHS+IwazE0AB1baqEVb?=
 =?us-ascii?Q?1MFftvaZ3ybaUZcZBbCt6AO+0GdnDYVXi18RHzePCGBWuAJhQ16j0hU37dj3?=
 =?us-ascii?Q?5/HZcXdLrduyB8MTNVlEKsFTGASryVRCggNSHx98ffLe6PNXw+1FYglUCxd2?=
 =?us-ascii?Q?dUATvGsbsQqKVQSRgvqZ+Oql604sZuR4zfJwUDDn7pU9PxyUh8NZmFsSgM6/?=
 =?us-ascii?Q?yIVK0F3MiRlj2uF7weZ+0WFBYLSgw80=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b21e6d1e-a2b0-48c0-3b35-08decc2a1e8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:20.8085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uo6gc7WZK8UyZiSojrgzMqUvXtU+hCyot3/6M3xEMh36gm7flxejCNn+3IUPyFOu8OQ5d7lS6LK/uAgzvEyCp4eoER3gZadSQfyrqoGNJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6224
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38611-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 771FE696703

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
index abd4d2fcd227..79ece49b0c48 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -189,6 +189,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const struct pinctrl_pin_desc *pins;
 	const unsigned int num_pins;
 	const struct pingroup *grps;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 6f7e65b7792b..2513fe210e03 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -651,9 +651,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
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
index 31bae9697826..280c1c44fd7b 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 369f23cac5f3..bc9bc6bd530b 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1442,6 +1442,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index d23aa8f826d6..9ef93d87d444 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1072,6 +1072,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
-- 
2.53.0


