Return-Path: <linux-gpio+bounces-33291-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM7gDlwUs2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33291-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:30:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16D277F4B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB6B03046D99
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CD23AB29A;
	Thu, 12 Mar 2026 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dlIPYi8M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1D38B7A5;
	Thu, 12 Mar 2026 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343829; cv=fail; b=ItKuT5++zA4nqFKcymowewdj58lqm68A7n04bXFjMsBfQcCy5dR0dbbwaZxNs6LgM8spNXhrPxKKsFnFp0mgPpmkJ+Rh9mCdLWrU0+mN2Smzl3HlFSy3wIN96OwfceHJ4HRGARVlLiHdSdnFxGlq1f7IK6LpSbSaq4G+F9AmKA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343829; c=relaxed/simple;
	bh=cjqBbWcdCMuhUuVqiwOpSUhXMq2WzDp/CE/JpGxcnN8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gsJB5/IrPtbmhqMEQxP31QNZXADBpuSX4WGeraOri2xh/rCsCmcryQSN+juoNcay4xTvEf3kNh3tTGQNr2kFjzq/E28bpNDohBvMjOan/GQ6fiFpk/Ve5/a7+TTKYcmRMH+nFpjLTRNIsgJI6WwY33l5xSaN0wY3DQZJtydocyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dlIPYi8M; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym1M8GMGSvIvyizOgDBiIvALxge9DtwA7WDWWj4Wd9C6r1O3JwatXc6323Zru2P9Y6Rb9XrpZLzRK1JK5+UPTd1CGZ+ulbSFBGHQrQU0UilTKc7L5vMsPfhF0BwrGzdFCucXHKqQAOAdzVETy6fa0EHdBt9qTmX6EDF8Xl/eWuhi9Eoc6jJPBntOLQE+244hfbGaDk8n+EzlAmTawfcecqvCdRGUX3+HVicUT38afoqbmLX8HUdMPqMvoF63j4cAtZfK4mOxSioCPxr/Tpdt1HInku1lW6sqvceMhdG93niztcxLcuCMFrcvmDFDMawqam9/8ptxZaHGmGiumMLE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPlZrz9Dy904P9cBe9G3YYavqJB7sgrkzDcRXC7e01k=;
 b=c2EHblUBdZF/qHVpqytcFALH1Yc/EEFqD6C2CbVMdYvMUG2iGUzJOfLyab4dkNd021tKbatV+SxDATHEe6adpaPgg6GyoSVTe6mZXbvvwtHt+uJA/gL3g8LfiY4sB6iTiE5u+sIedg7p/sIbPLjZvCb5ufQjdEku0QPv/oa93ZTHPS1hCddw62VzvIAEHskoTJ+4Lq68R3UG6NOpSLC0XXJADay0GshxEUAYpo/VXLeU6b9vUeXD1T4MoIK3T4Rq6L6NUSWMXZE+W+KL3/wVQ3TeY2+4BJfDoZYi+RMWhRd4a0WZBnwiMC6QU5LPKmKamfrJRxC/3awIvaxP89jhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPlZrz9Dy904P9cBe9G3YYavqJB7sgrkzDcRXC7e01k=;
 b=dlIPYi8Mmr07w1w8rRslDYfEEpF30eUJ9JHVlhM7Bwquqv26Jie8R2/E9UjlzdlWNlGtFDOat8EZ8q9AouiaOWotHw86mewtY/7qj8wAV+SpjWlbcOQi46R8kJWLPWCcqd6sXPnR/WIou35BajVMGmCQQYimMAxiLxPKw6/7Zw9ebvX/DQS8k61UxROMSK4JWs+CGgrSHPOSyuNTEHIccXBJKFmdAyb5TLFuQHWEibuiaYVGphA6hxa9lfltnXPo0xftDVjsnzzGNqSgLCMgK7BF7x+2FJjuI8t4z5JheiGePK0fnjqRzhzhOArsNGHTUXlMl9KMKEaXfrNcepdy9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:19 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:22 +0000
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
Subject: [PATCH v11 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Thu, 12 Mar 2026 14:29:52 -0500
Message-ID: <20260312192957.1978329-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:805:ca::31) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8e6862-92ef-40dd-93fc-08de806dcdc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oqen2ZjfL4XjHPbgELsGWh5ayRD5iTuOCYWFD3sOF1pvFURC1yD6T9jCPWHcdu9xMBLROZlR1v0aZyjvvo7xX8lgQc2RGxH/sNJ+0CyTU6RlB4gorbsGbB3qYdOSePL7+CGHFYhhUb0xR3rYK2Ai3AcYEe9RyFjl8KX3glcwK7GWhqrrlpy1navG91ntHwPSQCiyy6rlb4PNCjuTUYuEYCddhhvEHrQ/DQLix2V1so1XhHMyzJK7JtaMN4mNIoE1LHY9YZewWPXsEtQxKhBre+unqHnD4tKSKAo3+Ns2bauwDR06ZeDbN/4IPT6E+lIbBAaq+CgUfl5nqOuGdiKSo7xAOU31BLt2L/NkQ4b/CSiYO0ks57VJi9eiIjyImjPDxekG1+e/1JbG2Y0c879lAhQ56kR60G8sWg+F8aJVigwz7hies9NlRdSkIkp6f21qjCqd79LjZhhTjjcMF4R2vdqPpocUaNbz+TveNHobYpRrdghreHveZUPCiPvib4+MpiKvdAmVELJ7oURL41JSgqoJ7mTopqUX8S7e4Ap+vLjLih0NSJucYycO7lhDIl2DbxNTCcAN+8eZDH0PT2MrgR2zXd1bEXI34YR5s75PTi0/waHQpa2g3b6CKVV8ulFV/zyiUiJWtUNPQDCRocnoEcBtkE5I9mmgcfBWx9tPDFNd0iJUJs5eZNcW56Z6005aamCj4Z3CRQOlOVehZyNB44I94VPiMLixX7oYGPjtqa9M/1EOgX1GpQcnOXLKFZH4C28WZlKIShR+ej7d7Ui6ORlBhdwp5qTXXIB6mtWGsbe6oyNbWh0p94tejDweUWTH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hWutPH13jbd+leiDQAqWcetrYkGyJcMkyCvwjfzVWY1TxI7H7BpgmoOLtJ92?=
 =?us-ascii?Q?sWu/4K/HxJ+x5RoTb/xR/hjO1ZSRDcrvFAtpm4MEpansJ2EPXUMRtUIdart8?=
 =?us-ascii?Q?FlYYZ8YVgcd89xYKTEpXK2GS8wkWTwaVY7m+GlJssx66k2VO6KdJ1lNNEl5L?=
 =?us-ascii?Q?uirU125RZwOt+b4IF8G3xfuXaB/umgKE1pDJkqpeqJO8cvGPtGDV5i9oWxyj?=
 =?us-ascii?Q?3pDzyIKVqS7omTb+f/8qq7rB/7AZjH5h6WRmN278C8AFyvcDc5sZFVb1Zv1i?=
 =?us-ascii?Q?kQNdAu+37UkeXpP08Z96FZDj6srxborgZsOwHzMB0VnlCew8S6Dk3NrLqS91?=
 =?us-ascii?Q?R/mrIVir366qpZDuxCcBU1fhTEB/gM0Nt3PS36XbEHyNdIapuHfloVhC9+Gc?=
 =?us-ascii?Q?n7GYZXxU7AKo2Bl3VcsxGW5R2beOC456XYFb/nRSazsCZMZptxIkQP96LjqN?=
 =?us-ascii?Q?h+DmEhmmaabyOkZCF0Fr2zTebq+vu5e5HWVgk2OaYB8uNsvD8HBpCsGKJ10N?=
 =?us-ascii?Q?8EB+dJyO9ucs0djbn5piWZxNhBAT6qZ1THCJPnW0gKvYVkxY8ivKnC129I16?=
 =?us-ascii?Q?NmtyJkmmruysB2NvjH9zHA2MHNnALtucJ2fjDk+8DaT6WJ3xJi1zUVy/X+nd?=
 =?us-ascii?Q?mnUYH+z9SaZSKb3mkf76yeFEMqQ4J70h224CI6Xj/FWvj/jiMMEQdpcV4ZvI?=
 =?us-ascii?Q?0vZB5xhVIemb9/XPHwiPl901XebKnMvc7iC/1gGKaRw28W3hZOx2PNQ/IM+V?=
 =?us-ascii?Q?ijtRs8dthPShCvSSUnA97fyq9z9v8xyI6CiPaHa9X2wSBg/2bRJtjEK4kWGO?=
 =?us-ascii?Q?8ZHAfbp8rVc31uYCtdbsVmHfPOXBv4GT1v31WmHkY2hZrYLdNL1gwUghqYCG?=
 =?us-ascii?Q?z8LzYJFkp8vndEJ7BT+VJrrbem6iuKM6bFPgFXZXkvehV6eJJrMrtOPMh9Z9?=
 =?us-ascii?Q?PsN+9wamVN9YAMCFFkz2Uj0BPIw3jXuXc3aNOPXX+3/CAViu5dB+oLmOQUEz?=
 =?us-ascii?Q?dZZ94ksyrvTAPSyw/ml8xDIgu+yKVjHel2UPWe1hL0L9bxD53cxZ7W6UsYi4?=
 =?us-ascii?Q?VU+WavTql9IWKHjelOQ5ZFNPxdnnponB9amQYke2K05fVMk3yNDoNQj4GnOz?=
 =?us-ascii?Q?2k+jMnD8Hacjr3skDQjhD/9L1wToxQ22Lmn4zmFMT7V1E6laGb94jW9Tm4W9?=
 =?us-ascii?Q?nP/WjI8d4kb6NQPfQgBmzLW8WrpHbQZsRA0BWRMPVuNUEElDUnqXqZVyBxDd?=
 =?us-ascii?Q?tUoMN2RwxLkBKZgw0+lCNDcsEvjgmumVD6ofzy66818EdbECSisDAEmcdgKG?=
 =?us-ascii?Q?NSr/LDvrl6nL/XlzCxovvYgI+zPDXGQ4G7F+HhpfwhG9SU6ptLs69jWgjmGS?=
 =?us-ascii?Q?3iYh22Am2MjnJAqAwX/vbyExWh9yQQtUJ2xTtymxhJ3JZkUktFdhZLrExae1?=
 =?us-ascii?Q?9vrvauGLP8/G86Q08P3+T9qREjC88y3VXKI2poD6fc6ZqR6FSPZp9MLAKLZu?=
 =?us-ascii?Q?TluD+GPZoLHqbu6EjTSzFS0bQgi1WAz5IHEG2p7lIhOfIB/idHbtmRpjbZft?=
 =?us-ascii?Q?62tfP51RZ3SuomtUpwO9K4Yn3rb7CbL+sONoOvTNgNIT6YjFR/1hQCl3Ix85?=
 =?us-ascii?Q?qyz5vKNxlSjtgraRGSgfFMMXBI+3Qp42p21URCEOPST4sfDa+tNc9dR7KB5M?=
 =?us-ascii?Q?dMW8THD6n7ehDiMfj7HYn9W3p2r8u1CY+zG71ypa9IWsurWBKpHmlohSfQCd?=
 =?us-ascii?Q?jE/t0XyjSA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8e6862-92ef-40dd-93fc-08de806dcdc4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:22.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Udz/nEMZqSvJKrBAJDC/r/Zf9idkTGXSN+/XSxO2LMOMHdBG6qJksse9E99RADj6Op12OpRT+kzm9FXqN91DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33291-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: EE16D277F4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v11:
 - Expand RPMSG for the first time per Shuah's review comment.

Changes in v10:
 - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
 - Add a kernel CONFIG for fixed up handlers and only enable it on
   i.MX products.
 - Fixed bugs reported by kernel test robot.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  gpio: rpmsg: add support for NXP legacy firmware protocol
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 +++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  32 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 743 ++++++++++++++++++
 8 files changed, 1176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


