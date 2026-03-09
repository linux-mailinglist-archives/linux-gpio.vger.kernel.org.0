Return-Path: <linux-gpio+bounces-32855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOSyBS40r2kPQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:57:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EFB241387
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4466B30C8171
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 20:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B2B40F8DA;
	Mon,  9 Mar 2026 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P82OZ5z7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342934014AB;
	Mon,  9 Mar 2026 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089780; cv=fail; b=KEfRioZbu6bvu7H7jRxI6RAOIA4F1RRdjhAKbGV+ILS1qAbulOwL9ulEmiEnAEDzGM3LcqTQn7HWFvbGlJnRhmVa1175Lfm0RsNcFayy7cWWHIgKYr7h+WbnTEzGij+ioRYp5BW4cN46OOjI0cQHeakKFi/WzDnxvp02Y10DnL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089780; c=relaxed/simple;
	bh=6SqKbix4u8uriJ/a6R0DzmkSlC3f9FELJK3PZKiIJaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UaV7W9+vAXeKNOoJufCQaUOWWvQ8qG/qRXO8rOW46ENzv0WNvlWSF6ZfRPNOzLEzGn/c8CaOO9yoZtY07otsdaXRYjOzosEyNOsulmJG/m6ejxh4C5XeHW7HDCJPvKZsf5Ewh5lwMOoTEqbE1XexBzxYX/A7p8qNA5wOO7Hv8pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P82OZ5z7; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR7St+IC++mnaSzujw4SyVQGdrUE+6G6JPJfkv3m/kzN1iobXlGTczW7Q44d6Ugv4UnBNFCya0pndvfta/vxbQkaFLdEr8qXmVy+5+POC26eBsJC4ZlBZq4ZgvsLRnjsowE0RxGqqfnA3TinQvJUPHRAWpmm7FCNzMvlSpgttlf7fwISfVbAjW/ddsoEWBUEmg0QIxDplGs8XGoRwonnojmWmo9Zhjya3RKHwew2gi5rZPLIRIiyX6YcXTSuy1WBEI3ZPdbvc3WZCvMJToMVXVM9lMXZp17QlG1lkTh4TCkHExa+l+5CeTgFIiQ4NOGkBa6sGOH++Tajg7zj42tr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=XEnDeuwbyjn8xYV+fT0nIbZGeHiEUp6xaYXePi0kNIN9hILJL7ZqCCOCG8zSdGZQABPYiFvtcCQSUBjAIiYe1UdrJBxP9WooPJI99yRhXtwqzJhPc7ZPmyKMzEZrgHzrn+E1XlTTMw0IOlAwUWOTCCGESWUNaRc/aqAh8bwxLyb4EZjtcRz++4V9YyF1fNyni9liPsHqs9Fhbw45hxwjJTDRVldCz0C9w3JKeXbJO7y6dEq7lnre+XFXH/QngkrIjMjWQ4HpUB2NoxHjsT3571yVpeLPn8wvrUc+IEpAfzmPJbk4lN9cB7QS7mE9lNH47qDV2b9CcxwC48sU05Jbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=P82OZ5z7iKs9XIPw8KBs2dhA999UVNOlhM7XuLHnm9CClB9EbC9DPsm4XQKI1q2X9kMO6fj5uZgPaBrQbxwnkOVtB3I2yyaUqDit6/MUC1JNcljnhz6uhsl7oH7XCOR1swEL8VW7AtwTdNPuNoKf53XJt07/wu3m3XC5/qOP9Gh8scDRbw0aqXzyWvJFp3QIZYI8e4HNOaSDLHSX6klM4xxmClbjSgKVUxSaPRnvmofCwZSr/C1Fg5Tect2MZ098p6Odf5l1qJoA/A+4A337rqvufGjADLtZv8g1/xkr7kcHL15/ic6IMK2hc+zIucVUVrbp1NwzL4JQX8zMZ0+yZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 20:56:12 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 20:56:12 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v10 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Mon,  9 Mar 2026 15:55:29 -0500
Message-ID: <20260309205532.1794202-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309205532.1794202-1-shenwei.wang@nxp.com>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0063.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6fe4e0-7f59-4f75-d7b6-08de7e1e4c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	4wdH53UpzYjhakvldALToN3CQirTwcOSf2bCQEqbNjulaCVajpF2XmRivr0jLeU3hL7V2vHarlOZKaAJMkmquE4z8ET6RThRCO9LTB6g03/Hs+Pi1Y4wLVjujv79u8SkpQ47vNvW1dRat4Qak8vnjG9LQIOa5aFzy39gu/qwehQEdDeStLwBVso4pA1dDKUvQtfDYzj7RBiC3h7cXIz4LehYtDmatEp9O02qBEDcN3qkjPODmm0zXpthwLauvRH7S4ZyND5bYDNebV3egCkrVUZB2A994Fm43AWhUIxOnKxbgkwHHQg9LOgrWP+RUy7edCEo0YwJKE3tF0554bCdzq6dv7Yjgx+Z9+GtM8iOx25ZatXVsoEylgX01ia25YI5uI8jAN4LTJY9qQ42LSFrilGRYOzmKKgrX00Uix/XscYhjV6F32Y1XJvxjoag0goBEmH8LxI4ott0f2e8zy0Aq6oOT1PZIEpTFgX7LZVFdLkvzmCT2lDFfAu0C95EBCmOOyp9Ow5YtYZeJT7RBEKCHjt4WiF6RyPfkVl0xIko3Rh2zxIk3FLCDx7EYCYqTGc/h43nXb300/jfO5BSbH9q7iWbgwld5NEhdwbq915a1sX9FVdMJIywPEuFvw6cg/pS4EU+LaUqL18en9LpGtKEcKsJKyzpDvwi1kv2EwGMrWlFfG5e/Vuis3/+++UFURvLxHUCo1yE2iWO+eBSN434NjXc/rNglsedTckX+SGEK7MW8ms5mhNR/asLGIC2ZRWaUhnQ6ymZX7qKYq4tHRu53Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nKISeeD29EQfrOVZK5IFziqnnoaJhPJ/1bHDkXTIqx77mlV2TuiAIqd1Lpqk?=
 =?us-ascii?Q?/RjEHraAcvhsNIfluP84qMCrD17C+tNEX0NL25ZVZ3t1/4GrYvxfL3ayTPOT?=
 =?us-ascii?Q?Qo82ec+dLkTFKauSUJ2zh2FcQrHmmB7YHwPvMgjeu5MPm5MCDVAiSlLu4VEm?=
 =?us-ascii?Q?O9l8QUwNj4IK4JkkyqUJ+xmmkoFxWV//D8EjWEIXzG+fTOgWndoXNjolkPLm?=
 =?us-ascii?Q?M6m3yEqx5sBRNT63PTd8vnWHpaHqMdG4Z5XAxkEzeWikcy1j2dx902ns2mz6?=
 =?us-ascii?Q?jE1uJ3elaVpY1f3FU6bMtLlrm3tHI9eSrJO+JUg6JZngJmfvDytJu+w+aUvA?=
 =?us-ascii?Q?xwKRlrjRAUwCymoa+m/vjd7Ub2Apkybx0tnC5kcE18t7GTunvi/jfD8PyH+I?=
 =?us-ascii?Q?e/BQxNpigqyz2gEQOCg79L6AvJAvYFpGmM3VyK+7V3fOAUXOPQFS2lfLnEBu?=
 =?us-ascii?Q?u+zMniG6h8EOXrrvVzvzQQ0rb/qQCrEvszQ3sGEYAaEwRH8FMUHIYWNooXkv?=
 =?us-ascii?Q?2FNZMYoVkBY0y7NPUrnCe+akGloYXKA7eW/K5N0LEhMbpUnMt/g0CiJllQuP?=
 =?us-ascii?Q?/u24kw0lr7TqqYWLqCjNZzn77nq9XLfzmKzbfODdBEXlQEphPupui4u+Lx5h?=
 =?us-ascii?Q?pQ3G4v+bzGgowC2ROHbOE2sl9VrJXGEmwCH7o4drR0xoRYLj8WKA8IdWmJRw?=
 =?us-ascii?Q?eMOvTYpdP+n3AKNqq/4jOU7KL3L5lBk5H5QEbnH8+YI9owkph/MpDtTd9t14?=
 =?us-ascii?Q?120AmrFVn+ZRidwNriQgk4sYJ8qtxnfEFaUTx3LtMAw6rvEEGWegqOOvkD5B?=
 =?us-ascii?Q?DXHJgK+t8Agbu57zAB1WzPnZOSOOQjsV3MCuk5uhL7tjHOUnZgA6MQfc+U64?=
 =?us-ascii?Q?V/A8hGIhRf5StGvudsZdnaimAU6rznTlFhSEgiOThQmIOGgM3W27WZOXJAsI?=
 =?us-ascii?Q?eEzrOQzn6PeyAVqvBRY1fr5rfvk91wHb9QkFM4PPezyiPcpwuo60Z0CiB6PQ?=
 =?us-ascii?Q?BeotnRBWnGz00xsr08UJEepw4jSMeFueQBKkh9sbfw7Jhqf1mQFTyTBjkPWq?=
 =?us-ascii?Q?ZILITWWlQlNhFAjiO8peNg0HPI1oSB5UBDRJo6bcKnRA+vsE9pOZC5bB4yts?=
 =?us-ascii?Q?zdLeoHVloEjDNwCX+Qz2Yg75zqRH1p0c3btV2sUZjlyjCJ9XvW18kdlpW5jB?=
 =?us-ascii?Q?DXfaHrALOP1GfP+17ues8EBqxf9s6ic+2FsguX70H7IEmCn5A9XDseVYYaRZ?=
 =?us-ascii?Q?gc/L1EsalkRitbBBBu5wlePqvoFkJ55H19uPsF3nmKtitaMFr8+vSJqK/U2o?=
 =?us-ascii?Q?W3hSawobXUJ+NuSu0e0dofKuMtMbzPzLXVWP4jDaY89/aG+LusV5bAbS9lfG?=
 =?us-ascii?Q?CA3HfLqTOVbBNR4225AbfmKVk0hl0wD/1yW5GxOlqo3YuJb9x2g4SPfhqi0L?=
 =?us-ascii?Q?DV0qYf2WCcuf6BYlv9Q6oxdY0GKk4LKczegGSykL5905UXR1/UtHsO63qS4+?=
 =?us-ascii?Q?7pLTZbJuxO7iS+uPfKQgCxLSMftBTef7MC6vQVvPzNoPoPrrnmft2YD4q3B4?=
 =?us-ascii?Q?dx20qzIVwRBMH58yB5rcqN+y0cB+WiL9AzOPXkwICRtnX467hSduYT37FTad?=
 =?us-ascii?Q?qHj8A4NPsI9eQkwM0FGTMmOeK0AasBHaopfc3NycSOtALgBlPj5lC2DomJBB?=
 =?us-ascii?Q?C2nw25XxN7vOBkG70Nk0eWQbykHt74+dOGovXX8aVCSkJIjcUhWVnGx/lLpx?=
 =?us-ascii?Q?hZwJpOrJEA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6fe4e0-7f59-4f75-d7b6-08de7e1e4c47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:56:12.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qjGpjwfPNSonDjRkRP+LkztGn3Yng05PFHcEGYGie4ODcI7dNgzX70EAqiK6YBqsVf4UIYUQNzGAlFz6RyBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335
X-Rspamd-Queue-Id: A9EFB241387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32855-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Action: no action

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..88281ffc18ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


