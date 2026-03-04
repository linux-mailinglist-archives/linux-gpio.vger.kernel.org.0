Return-Path: <linux-gpio+bounces-32512-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM+SGg6iqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32512-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:20:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C29207E3F
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233E83096B04
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8263E386444;
	Wed,  4 Mar 2026 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N3/PfxjO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B535F18E;
	Wed,  4 Mar 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659142; cv=fail; b=W38Mxpy/jo8UMmqS51kvmhrVOUz+ZkUZX7pp1F70Uooh0KS+Q1IWNV3pOaRnUUu4TWC/2+3iPtKrDbTjVrnzvXzXOPPHq70weOHWWKvZwzP8HbzAdNSXKHQlmcsltR4rbpSpRD+4oePAQ4SMHiv1s4zxfZFlh13sw9v9y3Fo7pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659142; c=relaxed/simple;
	bh=6SqKbix4u8uriJ/a6R0DzmkSlC3f9FELJK3PZKiIJaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcpQ2wGnBTSOEvwybJcy2vlFUvJ4gZe9k0imsD4Tok+nDgUBx2jvxhupt6UM9Y9fp6OvGcrW3LuzNFhveApoz1dvCQb11gitMJmKzm9ZdvCZmBOLrZ4yOu+MSBjTCYp3LnsGFWXhqaWUep4p/dnIgePAadVg+OZTUQabNjHJO7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N3/PfxjO; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaPazJ7aA6/VcN7b3TKRZQLLb62f8x/nH7QucfAKBLz8wC3pti/SE2PNY/j4362Lv3Ov6Awct7Kn6Wn3V4W21FNyCiiNoVoNHmlheSnViwUXAtqYNDiUrZIKmPX0h8rlFszgKdctfycDSBGXzvYszjgQj8AsaHCMtWV8zuohd2F7V/k6HZ3FZDB95o8nHRiEuuH2MDt+YlGn2rYFr5jhGkyHw+wXL+Pq/w3wMB6vDwdAHOS8eAK4nKw9ZTem9o83NmrLMK3aT/1pRNt622v1pbb7li+Upjr/cx5CC2USoNoD1QYGSY+FsQjm/Q2zf58fhuMAyUQfEIpP3n5XxaeU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=EMQzmvWnSvXwqNLVgj1TYr9XqfHVgUkbHMQmBL9WnHDONYQN0YjtQKemv9TbU5wKIhlsNkFK2PwOeN1bfhULI2bNEDxZosRLG44Mn+IuqqvJ+KBSPvOwEWxcs+/J9Sj3wMbgarfpsc1vW/ut77MYzyK2Whe7wSV+7uu88ngToQX8BNDcR03L6GoHYjZn5OROr9giwBeIlhUrhFQAUhPnteUochhv+XVidbbudcUZyXj96VUqyFU0hkZvLhD13Sx/BF3t0d2ZjujoA8PM1ZIweO0qgJ0sXrbfCIc8nMtem1A2glMcrq5TQ3Frg1JZa526PX36lrOwo7sDaR5OuSlYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=N3/PfxjOXYf6jalQ0prDNjrdNuu0Z23jmHTZv4LTncaGyMovKBGbgujMsQXZVV8YhMVKEmBB6EiEz0jWIa8SZlWsKEKdFxnzNC65G4eMsrAi5Rfdoo1jPUQL43lMHEDYTqiN6usaIGRflhrZeSE9iDs3hWHfU5174atLPsz1Yje+RcJPGC0GpbnzVu+9FmG4jwu2mLfvfL8GfbzwtUnT3EcdgSrUvc8rhatjQJ1wrgVwoaS0s1zMVRPV3A31DLHDqcbd9oJjMEchFYIbEG6SKTyYDNKzkW3dwUnnpSiNNvG8E8B2Kg1agBMsFqz3SV9ku/V0j4TpCOZRLcg75M8OTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:18:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:18:57 +0000
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
Subject: [PATCH v9 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Wed,  4 Mar 2026 15:18:05 -0600
Message-ID: <20260304211808.1437846-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0184.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::29) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cf0b73-3da6-4e08-168a-08de7a33a5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	QgjsNtXUqzhXEcyHN8X0p5e1YEfLc4Ov4rVMu92UODtB9KGyu8lB+WQd0ZL3KD3mTbYGzUfi7DaJDcY5mgpZGLs9/6RAj7+3iqVxf2spTik1OFKFahxntlS7HKOBA2xdkYaylS+PB8/W28qt/tpMesN/wweMHG34wU3JqH9FTK2l5S+PyKGYeQ8BHqi4p850M8+3VDAHnh8nDcnR83Kdvkg2FyxmL//hw06Jr41DzND0ZomS1upLoVgJJBjHQ0p2bk2I6JJoiVmV3d9dRVC4C6kvOmjJdeWsN1DULOHbUcED0h2DJCzugyHgzElZKYNwkF3OaTKt924jMv/ydl6TaINB1PkTMtY+A9brnK8v4lxZilAkgiI8+ascUIVcUfGAL+JILRsYlUEcSoI2t5piV47HSmC1MUE160lLUs+tVLa64kA5zOL/HTic2/XtuZaHW0BlzWje6HtgKOmNg2V/MaEbEtq9ZLg4aTOd0A66yWmnU6nRI/Qw1igA4524Uz8D7R8QZrdk3ueCxMYzbLe77cQi5mjIKvY4VuBwwGYvpcm5FPB+KbuGfgmTyB0CGiV6WUjCkvCcJiyWhsEFlZPLMDbK5S4YtFBRngvb0q/aMcGmUPo2hpjxU3+3a+x86qMtuLLBo/8LDLM7KMfeqX7vNVZOdXkz/ZnN2JhNLcgCmEem5gHIDroCFCC2a66rDHkQKWNq+wpLBfc+nkDvid2f/AAHflSFr+K7xkxad5PFPGQ5p/FG5xUV3eFh9lRGWYewue1WinTM/eUen8jdsVTLLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F02tSLCsHZKq6eru8fM9FqktBwtSuzQYODvDjwHRSKPZG2oPdt3aWxuRA4k3?=
 =?us-ascii?Q?Gbbx8RLtqgJFBRw5xbGqPlF3bhnO1N9VE9P5OdP4MZbrjr3aQdpHQSNukeVG?=
 =?us-ascii?Q?9KOj8wd4OXlYKjRCMnqsMkKX4pnbnjKWkTcefPnMO8zse/t2ki5zyYVBfNQT?=
 =?us-ascii?Q?t55IVk7NOoedS5/R7n/E430MSnxjF+696emCPvHrNdZ3eHQHPRmG89jDmSFp?=
 =?us-ascii?Q?ddDTmxuOL1PGsjK/fFlR37ddVCHsf9RwV6o9e23s7ReRk4pPrlgUW6DjfsiF?=
 =?us-ascii?Q?ZCZyP52LwpQl4wKwWE58ai/ewXptiWVdm7pjTILRm5YBQQgXrw0l2WSgcN9q?=
 =?us-ascii?Q?XIBnVoYoKJSuztsrhfOWixvjtstJIgECa47zGj7Jrr7Zx4bQvAS+aq+suclp?=
 =?us-ascii?Q?K/qkIT5dciSMCroudtyL8FpceB1bto02qsAiuled1bl17QYr2vLNKt0VKTIy?=
 =?us-ascii?Q?l/Yc/gK/+HVSJ8IE/qdffouxlv4sWMb3qX926pM0aoqS5aSs+jNHlBNVyf/7?=
 =?us-ascii?Q?SonXnadlda8gjEMKVHLA78NvtjGrTW44ZU0HAbqjMn3kA97yXIYe2bGJA4jI?=
 =?us-ascii?Q?PrrdP3jxjDj2UuXsPOkJcKe+JXoPN+qTe6G4b40vDVNyewpBJ9uIoaJxEW+C?=
 =?us-ascii?Q?haANVj0BC06SpJRY145/1+x944+O2o16Uf5rVIlQ9zcHHCVlun2bWasnLIy9?=
 =?us-ascii?Q?EvudF8R1zU13kTXhaN0gRSkcXCqJ78CveRb+kzTVpmdKM7HToEUFn2ZZZ6Of?=
 =?us-ascii?Q?78ZoYr+Yki1HVqgmOaYlK7OHrB4G0NxZH0O2hFhEPGZ5VG5XwGUUX4XUQnNl?=
 =?us-ascii?Q?B+yx6q161WOvdOhHHDH0j0mbvm7nouG0E1x3VNcMO361NqktefPnD4PozFGI?=
 =?us-ascii?Q?mW1QqEl+EmM91WFF2MdO0Jd8tCT4Y4SGKAXQsJsDWOnl+jfLI/Kscw9yViul?=
 =?us-ascii?Q?mB6gMOhgI9cJIXTbVo4+7dFfHI0cdgDWW/EwQbh/K77NOazUm/aDjm/CCJ8Q?=
 =?us-ascii?Q?ff+zhJdg3P5kK4Dz3Q0xq+5Negk3Lu3b8olTP1UgDF+MsHI6JzT68Yaa2X2F?=
 =?us-ascii?Q?g83Xqc+Dj9CBJjcmppFV/+6mswDTNBLDrNd8IY8N1rQd+BfI0UMZ9CvCDdwz?=
 =?us-ascii?Q?qySq8Kup6vKXD8nfqPEcjmec2vXWpdm/mXbLYjXBZESWNbLju7+NlVM2pd/D?=
 =?us-ascii?Q?I5knbvhNO+yAjPmanKXmZ4ceP1Knf52iHs18fuT/GQsmMJ3xzj48tkerek4E?=
 =?us-ascii?Q?/Ffu/EpKxP19vwX6Tnkk7X/ZeOnKaAHD1dobGvnTZFCcfhuimlSYUzErw1/8?=
 =?us-ascii?Q?seVTRv3YcTIJm5pmARAQcnvOB2G8ShfFnxVZu2BzYpB93Froj5chqJdU8Nod?=
 =?us-ascii?Q?ynC3OI5I4NrIJfw+HieXQWphq4nVaejLjDF2LytHy5j5/3Vnu+cvV8rCQdvt?=
 =?us-ascii?Q?AN5Pr2vrcyuH3cKV1TbepBlN9V5HtC3WQ0UagrwubL1z0R4o1fH/6K5bfL4r?=
 =?us-ascii?Q?PJNMw+SHaA9M76anHPm47GO3JEBIS3aLxARPss2vPsVDAI/2HjRqrqjVgADF?=
 =?us-ascii?Q?DxD+uSBpeJI1ly9c3k7ICi2z/bJ3hCWlSLr/+FQ5QRYGV6J5Qf8CfvTk/v0V?=
 =?us-ascii?Q?RjDA2PR+8faeYw6qDikQju3B6Mxb6ip2n2FStl3ZHev+3nbexSQDAfKkivrl?=
 =?us-ascii?Q?dPrhDZP8bbPxTCq0jMlCT+Kx98UQ+XdAMzo7Tz5RYKLR+LogNk7AuzlccUEy?=
 =?us-ascii?Q?mpv07uu5XA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cf0b73-3da6-4e08-168a-08de7a33a5b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:18:57.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLV+QU18qyVJ/F8UJhxwFai2vUqGZ1daLN4TRf2eOLvZiF5cakhlMGzYjb8nH+nZELq6cziRWElaM4OkIQr7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: 09C29207E3F
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
	TAGGED_FROM(0.00)[bounces-32512-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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


