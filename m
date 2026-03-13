Return-Path: <linux-gpio+bounces-33400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMq2MSdttGmWnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:01:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AA2898AD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A273932985A9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 19:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BC03E2741;
	Fri, 13 Mar 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OdJKMYAP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705353E0C67;
	Fri, 13 Mar 2026 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431944; cv=fail; b=rxdUjKkCXeBGuh3AoWs+K6cm+cB4EUcMH0bJP7Oj/gJHnS4fBWVDj5h/15wp15QchUoVyJ7vehQv4kM+cFm/SnjoRgkEnePbFvi7Jzq7KYY3hduAYlQ64/aUaDiPgdCNHN4c0swnmOcseWtmQQsHiCo4OeaGO9SBKjuDHntycLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431944; c=relaxed/simple;
	bh=6GPsFy9zCNA4aOGX5lsr4ft8T8IqZh9Ce5RCYwC8o6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LxxTiqzRan3DuMMsXL5q5NxuIA2I394dgjOvquFJ2ZsqxIiepIRXLB/cVJAxsqYZInbLDDbnL5zzeOLnn2MNchZjYrUZhmVyd2wZdPHc0zcgpzmQzSs24w4/YM6XX6v8GBFjVQ1T6HSh3GgZ2rzaPhm5IjdL3XJWteGycmMRQeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OdJKMYAP; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdWMiR0Ko1t4+ng4G37/mEVv4R30VAFkZMmd0TSxd7bQ2Q7kPMY1Dir9T3JeO0Ws4DGAbK8CbT8gRE0EH9hRfQ/3CNn+rmpmudJLr2PHxIycgXMtmmNYKiz+xHgmpSSc5GD58AmdycmOZ9sQTkLtjOp7mMTHB4RYqhZdZiryrnryrw7wC9+g/oWkEwHrKcfPvg+MnfewoTQ579OVvhVRfW3UGnzH7paq/JjuQvnLRpt6LghcapWdBShY2OznMAJrIpU7c2n0aaRrCwUrs5MKU4rVXyp1ETiKf0gxTb2bL9hGLqvrSNHT4p7PR2mbpQBrBWzZqIhTTZoMhcRFwp/5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=I8ZtHH8Xfu2DQF8axccCG0IS18Mkaz4Gxgi3+jQbo7z2aynhuPEMVikH4tf/svw7+bujhN3GOqr6+0eUd0GOPcNeNPlJ+L6xK0F0Ud0hxtAObkQzSSN8Ie76CJTxO76t6WeoebLZu0TCJKlCf24GS/8R9Mvb9lU06rlt+5PlyPtOjImMdQ7m8TAfr9iudtdconAIjTDwtd17aItRLSM1BqeMvktPjj4ylYkmRpcN/YE9oUQzIKxkP5op3d4AMnXwD+nD5CAxWocdDT/EpqLzzeJIJjE79z4NTwA2ol/GbRxKQG0Op3q4ITB6VQjHqd+S4F9fzwisIcgdT2l5+frh6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=OdJKMYAP5LtMO5/1Y/fd2xyLUlx01+oTRlURW8y40dB8fSs8DnVv3cqsQRXOLe/LBDjSYrJq6iduBvd25bo2n5d7jtw4kwsXvCAj/EMsnomMouzBJt+oObMWI4rAy8rxnaPPmucMLr+LT/pARKXVlkI4rUE3MiV2Jcf5eqZd/Wwhy9bw67s/+X3riKjj2CyrI9RWLXMZjWQ762gPHGSWK7fx6KhWLdytqC9c6iC1nMq63pmn3eTCta40asQgBWy/iHzq3xuT1w0Axnlf/9kUOaMWriRQg7cAeOHJTJ7qs6ym9mjAEMUAqHVPhdFtVsZ2DjTeGnunJCO0xiEXbbRpqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:58 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:56 +0000
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
Subject: [PATCH v12 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Fri, 13 Mar 2026 14:58:01 -0500
Message-ID: <20260313195801.2043306-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: a6474da7-7045-48c4-7425-08de813af5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Dv0NpwUn09ERFWgU741nGTUXmJl7LPw3du2kyozO3gOQMfzEXMXtFEf3lhkqc3+e2W3kWFvVIpkukZNg/mG5LGniCNuZp2bamJG0cNaLDDhvQ93qH9kR4DUhxYXgIrp6ahXl9ax1pwgvXEeqm08RXFC12rm2nM9KyqxRQ2jymAU0Edc1EgICryicWa5qpo+oR8kl2cWmuehxQ20NqIBSgkKRWeYmkkEwih1YTdBUSqx/SV+o+Gl8E9lRY4bwUEsyT2HYf78EHvMqnj7ki1hXpw5vAjKxE/4la27vW4DueqN8UATe8kLFTdvTsLWGOMtaEVdg53f5gjuVyqDUBYOV48g/jVgpzzM1/f00B23P75HQuV/ExTBHlgIw5lQaKOStB/g6kWZ+gtKTSnd3I1pPNXqkBAOrmYeLqDexbrYByzUrO8bB31qrXcU8p8O73Xvz/tbHP0NV+VAjaxm/FseqmQRIonT5TKp1F/L5MNESiPe3ZQAFk2p7S16R4ujFeGJK0X9EV6eOxodUioCCEAkayGN5C6+5cwdDpuL74XkbfBFaBdpNuSxIExr8BFLs1JrtCuOPI3XoM6GRGhvD6LR9decV00viUTnSIIsttgdK3EfKYiJIfTbanNweWIcNn0hrsoukUdoYsG7LzFrF/uUPoO/PPSl+2H4okdWZefrI6yYkMq43UV2atJ5hIPeZ7djyfCjy+95SEYSsAHeb7QEJTyZdDMV1wh+skTq7WjY7DY3PsuRt/Vm7JSxENki0plW+GcXvg5aQH1r+aXwTSxwSN0Y8SwQ1VryteV2YnQOt/e/X1Dl05u1RKgToh+6hygTR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iVmmH8/WXLT+IDBinZCWtyRzQUY7bnz8Ng1RcsoK0Mv1PcEMtuFkFYnpVPkJ?=
 =?us-ascii?Q?H5eQxMWIVnJ0Wxr4Z6UARzELmfcfaKjmaw5EEJYZfvZ9qclr45557trfSgs1?=
 =?us-ascii?Q?K+EcToQnRHsCbqydJafdJo3Y3ZfXuSepP/7VsNjIwZiJJ/gVgtFfps/n1fUp?=
 =?us-ascii?Q?yy9L36VnCBv/A0EIswGkN0k+13xdrBOdRoIlaiAX4k5OuFz5uZHEZuNExuFK?=
 =?us-ascii?Q?wsJaGIwiH9Z8xdbXV84J7OSFAjoCG7sODTDujXUpHpU+KDTsDzh6AirsmA4b?=
 =?us-ascii?Q?3yQUQ5kKPkyCWYC8esYrZ3d5J8KUr4bNZo94eOrdtk8qxgjTGzR9SOLJlHaW?=
 =?us-ascii?Q?cXsGNvAa8wTd3gkCJPKaK45Decp4i/KMJ6Z4GQoH0XElXb7V410JXi9JMdNp?=
 =?us-ascii?Q?uiV39aKja7XKabDCyb74IJbD/Eq84D5tkoumI6zWPx+Htr+l2zdbdubYlTZD?=
 =?us-ascii?Q?5/IHfiH4ixIMqyMl3BNqZXO0ZSjKhbPvHCLJv6OKOHHBEkao0N7roMEZBSiz?=
 =?us-ascii?Q?9wYE4lMSUsym0KON7m863JpsjPprmJI+Mfvl5nkuy7gKfnKJbJIMD6ilEhXi?=
 =?us-ascii?Q?HXYKo68iJ5Qirutr8fgkkz+at22Ik0iBvT02gZZC2J0VRb9VOM8Cp72RXWjp?=
 =?us-ascii?Q?2L1wK5odkEoaOd8f9aBChHMY2AW99QkIfSX9AaunDQsmyYAun1xOPft2ycOH?=
 =?us-ascii?Q?5vyVGZdcgRHfH+VN3FuA9rn5YvKXPkAvOqT2DP9PSpFlEjxH8wPmsbzbKNQF?=
 =?us-ascii?Q?RShlngZlL7Ncqc29gGB1aP5fP3d2baSsBfHFoPoU31J9HkmgH3ahgbVSAv6m?=
 =?us-ascii?Q?p8RE8TsEp9zs6OjucON6/V/n3qLEabiB/uUzBUxyfz3TsP3zc5u73Bm1g/2c?=
 =?us-ascii?Q?J/qlJ7rJF8fk/0+XfU03BVePfWkDTuJmiAY7wHG432sYJkredMy4CRxGtV2o?=
 =?us-ascii?Q?DWbiruLWrUQaRIqiyxqL/Da3OFEvMtCsntQuQzKQNU4kQNbi1pvMjByTpL0/?=
 =?us-ascii?Q?8yEPseZ/CVzasw3biqRQnw4yf+C7YAVRIkT/u2cKZjY/iRyNrjqG9ip/pran?=
 =?us-ascii?Q?WwKCiwVb3gm25J0GPaEyuvu18C9YBkg/FHpbLAx47GbzMCCIw9XthCx4dnOj?=
 =?us-ascii?Q?L0NeBWv3KUZ8J+oExGJWNhpfGt8K/EMDZRYePmk1z6WseJRZe1wgvPl2LEt9?=
 =?us-ascii?Q?LQvOnC+zuymFv5FoQNmEcYRRqjq/xGIatQlFNeYQc0697csX1Aww3tCEFtES?=
 =?us-ascii?Q?o4f/dkOnM6HSIcW1pSQVxox0qzRAsk80Kzf0d7NTDL2VremPN+T7LkHncFDb?=
 =?us-ascii?Q?KCqnV+NIYyIWCvjGwfVScZbSSqIsaYv/dnRxTSvR9kWmcyGcKmgXEMBpI1ti?=
 =?us-ascii?Q?NHVS1LpvbwFVZHhmofzvjas+CCzoxdhpFiPFJ2LIQAW0Jx7nAVkEWmjG93iL?=
 =?us-ascii?Q?Cx+Q89iN4XtqHd94GIvfg/sjFC1SamYHiWlMsWYD+ZWO2xg674GJOAysZ0zt?=
 =?us-ascii?Q?x64MZ/B+hDrLxJdEC0q6jRCDRK1LZiqC65TCPoPZpdcTUdJZ1TymoOBEZ63N?=
 =?us-ascii?Q?Io4LQgFpi66fTr3piF2KQcSfJ/yAp7FJIh+hAZhu3r8tSFk1Pc1/hY06kSnP?=
 =?us-ascii?Q?AotAoa+G/cNOy17OBEGjpNiMJ9+NfYkXsHRqWJ+ZYUaDa/SpozD3/ikURxb0?=
 =?us-ascii?Q?OrSjgBe2GYEgaPXluRRUjKruOBrfElPiZb8EifrP0E6YTrvXvMiMQ52WoS4W?=
 =?us-ascii?Q?F+IV4zOyJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6474da7-7045-48c4-7425-08de813af5d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:56.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OExjhnHPT/HiugAUPoH1ZMMKr5kZqqqbPwIUQUjzJ3fPMJkiRBgsSpUH03P1HKy2pEofL1Hrr6SYKkYRoPZjxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33400-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.15:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,i.mx:url,nxp.com:dkim,nxp.com:email,nxp.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 723AA2898AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..ad1ef00a1e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


