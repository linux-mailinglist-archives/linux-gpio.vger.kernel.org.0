Return-Path: <linux-gpio+bounces-31566-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCqUJGdni2kiUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31566-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:14:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321B11DB53
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A97B3094A24
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DBD3816FA;
	Tue, 10 Feb 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V2aSihEm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A5374180;
	Tue, 10 Feb 2026 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743329; cv=fail; b=b4YPFoIFuakDR2tlXEGPWdEh4m7iD3puyb2eRua1jMjOegDmeVvwhFRHDLpuOKUAX19Y9Af84qghGsJnYggAc5Is3a3NC9cASQvqDbKpg/96+oM6xAIcWNZpNQTi0O+WzX4Bmwse+Z5W4muefRGRCkhabqKur7FSLck+5Op8UYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743329; c=relaxed/simple;
	bh=N38VAq6Arjr2X538y88r8z8OjYp8hHe1fL026vSh6Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Brw7QLG5+TgUMMS5mvj3Xylckmj4nQf1+qXTGbbKLCAQYUKUEpIgMfAMoKoxScfw3ThH0EjkPzXijx5jMCU+mg5KJETMFIiPQSaeua7C0OMgqvnKrxylsqjd3g61tsvWU1zKSskQOvrLaJCqm0u48SX7UaRp8kVx136BUH1t1PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V2aSihEm; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKR8pk3GTrNMy5X+/uzlbfwBZ/xlW65O/vNaqmiAcQnZkHENjb/pcQpp3iQkAukTGByVIe62RYvzKYbysmK2824dnIn+V3KI3j6s95jhmtqrPoGWNwyHIqBd/yUs+q2KbmiherCdTSaaR6Th2BfA+tPGQSpq7APrfRkOBgK/xel4Wj3Hwt8zDuayAawk/QyAIiuldOfH7WL8ppZ2LgLhaDsjzhm+IlT0cjFIhnEddfC4EiWwCrzustKhQRwoYYSIyEMQG1JBuxT3S2YJL7mTXBSRGTf1jfQ3wbM3YEjt2SYD1ijo/9OWbsgBWki2wtFcjghrZlWl9lVzV+6ziXxeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTr8k7wuw+cdbwhFl/Ngv2Gor4tOSzMKlKWMPISzeYs=;
 b=WC4qmGilgnsx4zlOT6L2NXGijj1QtFzgDPM/KhTD0sqFo2odtdotTWEtJCXvIaaIvGCCaTdrNNrpWZQg54S1ywz6EvdXil31Kv+6H38LIpI5AYanVT6JxL5cTmCvotTuWa7BWb4w+ii+E+UCIsY2rVpNOkiugcxhmBVcMU1v3NCwPhqxxuHzWus3kBlJWPFiKupZqC9EDbbMSkCgrN2nywJAMg/3zEoUVOwkP49U54nppaIpeJDws9mFNUzstW5OV27I20SgCzFLPfCNnnE+mGsXmy3x4zab5ekFYk+HzndYsi6PWaIVFjP9X8TI2wjPVtSvVv5ke5R0FOQB7diOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTr8k7wuw+cdbwhFl/Ngv2Gor4tOSzMKlKWMPISzeYs=;
 b=V2aSihEmHUaGkpciOri1E7pt02OKw34jLMEzwia/aZ2rcIMcvg5ITMKmKUW0bRDYkZ14kJ5JvvgRcb/kA47MYX6zMZmzEUQDTTYh7k9GIJ4OnWDi8QaTdVFjDOXknYkmYY/l0x676eVkYQdewMNIcEcySfqCtGiT2m6XTQnfQ4R9wrU0xEws6ooS82aGKcE7ZVQdAlys+dfQO+mizEhZw3/OMCBkV/JIz+YekfHN9e730uSzqYRqzjrphywDDgygj12SlmUfnGpnuJUnoMW/7dLDNEneXWMlW1wpv21jVTZTmNy6aIVhOS0OVcT23JmuXb6pNJ7iuInSUFWnn/B+6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:08:45 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:08:45 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v7 2/4] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Tue, 10 Feb 2026 11:08:12 -0600
Message-ID: <20260210170814.406883-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170814.406883-1-shenwei.wang@nxp.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: df9b8049-9679-4f71-c042-08de68c70c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eIVOo8ORPy+0qp2DgJqS6UMMNfyXBPFlfaSKjUzrfIPL3jeqF4MUYtR6BfLn?=
 =?us-ascii?Q?WXQIRBiiwoTj9Gpf9j899TM8KOrktq+EmlCa/tJ+p5NYSKxJRp67ETWx8yAS?=
 =?us-ascii?Q?cJkeNlBllwY+s/t4FzkcGRcWv2qvtwrwbGlxnXafhz8dnyVh17tf3n8wXT3J?=
 =?us-ascii?Q?Ge8mxzya58a4B/HImIq1UEtFV5F4Zsx4kSg0TMh1v9nFIdx7FPHa8VJt7hwK?=
 =?us-ascii?Q?0/aznbmpJ5Kh2K4qYFkyRveXXkpKSzNmtsg8k5ZCWDWsarorqu2hS6Lju/Ra?=
 =?us-ascii?Q?Xaroobxfq45xyzF1+j2qdlbJgKIXLyC5T+ELs3Tc1H7TKSce7HSSfPbN/DBY?=
 =?us-ascii?Q?i+HZOLhs0egOreO3vLbrcQMb9pTC/4TVINIlnqPFHooP4XANBVnildzLIP1f?=
 =?us-ascii?Q?fbfvvRnWKizjRawt0t2XR/tGdHDgp7CAjUi8nRomVQTHPwy9ZvzMuvURz1Wk?=
 =?us-ascii?Q?ffWl6P19CdKbBwFslz6zhjqMQnQJui/ODF6/Ov0yGVWJbY7mn1QT8mjl7atS?=
 =?us-ascii?Q?bXk4siQK4CzkacGl5IMVQ21yg8oaA3YNgEzR2QSWiCatE5+O+kTA9pSsoltE?=
 =?us-ascii?Q?QjSQSqjyxjK+OnfRbKPGvCWS1GrKVifGPj4sDO3jlq5HITS3nFx27v8OB9OF?=
 =?us-ascii?Q?L9LloQEdIZBNi0bEdq3gBL8uCtNhSvaK7fR/LcC86n9uyLHpnwQATpplT4aU?=
 =?us-ascii?Q?VTYb3+RShw6DokPpUXfp491Hqfm98oNXLtiKoxUEBaVGgmCSe9DRzGnpTJhs?=
 =?us-ascii?Q?3q9y+rTjLCBuH0K+keM6sA1vN/MlzgDv3oDaoP04qfG2S5FG+AKmgJLlqOB3?=
 =?us-ascii?Q?1Do++hRsawKD+H75ei9WVauzxRfhfBYBI6i0fd3djEFxAvEoxuEJPJG15WJ9?=
 =?us-ascii?Q?fM1cfIKEY9nInPq/sHFh1lB1G0lSk9pWU3XC/YnahJG93Ym4iOuVKYDnxsAn?=
 =?us-ascii?Q?7IYBYyTub1jvBkdSRArYu0Mw41K+GX8Rw4gSNcS2n3n+0SvUbS+RK8sSxIO0?=
 =?us-ascii?Q?t9+hzMRDvKrx9t0xZN+BHkLfmeYf/8Yx1dR47ztSqW9hDXKkpI9petjbsv5e?=
 =?us-ascii?Q?gdBUDUR2YMNyOJrGEjzj12MTVm+dD+oZQ76ypX8P5IEXzzwsu0ejmojwxBQl?=
 =?us-ascii?Q?O7wICJP1tFxdpYU6IaJVsJBVTb7qA6zRJZbEr13Cav3M1Wrmne+lc89XdAG8?=
 =?us-ascii?Q?bGlGYFyxUfCJ2wMR16TH13aHl+tsUIkBanw0idsRDG8oVcimpF/aBJi2UlVf?=
 =?us-ascii?Q?SM22VaD4DIqqPw5LWrP7nom7Py6xLnt8Rd03nePruaFgkG9IhMgp8FF+pWhX?=
 =?us-ascii?Q?FFrQz0NWM91ziKASAw50F/Xf2rn5lI2uvSo/KVORiYn/EoF26hVfv0s8Yz5s?=
 =?us-ascii?Q?d3P1urQXU/pgfKy55bp2ShTsiVe6gH/eLf18YDMLJMd737YDYq8HrRQVrMM0?=
 =?us-ascii?Q?x2/6DFgDoxnuQj1zAKp9nwwBOVTffaCqYV7YnJKqeztE66uvjWazapKccApo?=
 =?us-ascii?Q?vpuNSlcx9bq0l832s6RnZdpXIaa2Tqgp4MAaYTgdZrZmV99D3Le8n0IXmZww?=
 =?us-ascii?Q?c9SDszGniBQ+IXQLsaAQ7IIDApFjTVVwr3g+pZetzGbvCMsu5CfrJZSjw92R?=
 =?us-ascii?Q?3v4vP0pGrMMCf0C49tuxKMLpaMPhTdZTA7EQms2bUoWi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U6xm5nE9e9hCd2PvGXEkAjPWY/LCHNaD2zFc9tMSvl+0YCBHIr1gHhD8O4Xd?=
 =?us-ascii?Q?oMQaMsVaCZWUN6YvS9cN2QkTTNgihlTWJrdB/nvEv/Kh0kcZdiAyKsj9A6Ns?=
 =?us-ascii?Q?Rbw9eeEHGLyIaehlxAsdnOfdkHScWYZldG0ZG6pI2Pk9bs+fFHhd6BhGRJko?=
 =?us-ascii?Q?M8wV+2eOWkB7mg8alAI0DE4vYjKREOQ/n+c8SRTpk+E6jo7i6ILvnRB8sYSS?=
 =?us-ascii?Q?A5bWjf0xpLnmDKBzQxeQFHKSfNIWnibSpdk9JC8Tz22e3ueuas0hF0aagJ3d?=
 =?us-ascii?Q?0jw/Pp41kioedaZ/U+w09Cu/eUHPwIvkq1S4B1dTKvbN8MLopzRy2NzjyG18?=
 =?us-ascii?Q?jdq7M8Wee12EHDn26nDXX0toTGWIyDmtCp2qlGe/j3pUjdDHYfAxORc9IcNE?=
 =?us-ascii?Q?+rMYnOS3FoJv4Ns3JfHmoJyDCTkuTJOTUPCULXExbCtWNqmeFpAPCbSbRj3w?=
 =?us-ascii?Q?ksU/+qR610fIhi9QcOU+qcboX4uBLHBm4k32WuxGcT7oG94Pj28Ct4em2hN3?=
 =?us-ascii?Q?kOQ5l9teEsQhExRX+mW4ZTp4SbLpp1jCFQ85Ig/eskOjGiTX8h679LDVM0gc?=
 =?us-ascii?Q?EwMo7JHcf92cU9kQTv3EI5FxzeA1uPqKkUojuQsUvCyF7YYoXySW7bAFndBg?=
 =?us-ascii?Q?8OdGply9QkurNv5xxvSBZ4KEeKFevi3BlDEQM8AlazYwgerO3hkw7brp3fao?=
 =?us-ascii?Q?IKB4fqsAZV/q+R82VRTBxWdjWRPXsafHDxFkMdenDCS5gJR4BdYOEG5x7Sdh?=
 =?us-ascii?Q?5K7lFaJyNIi/0dvlasKOY5/+qKDTOvscwV8uKQVhKIBFXCnj4Y2mANq11GyA?=
 =?us-ascii?Q?xirahs17OK8rOtN3pJR2k+cmtoauqVCAnwGD+t4iNQkjV63yb9JvM/uThmoL?=
 =?us-ascii?Q?gn3DiNWz9ltl4xgMsg4Q7byRO62cdDR346unnRFm5DN65DueharQVsgPQ1B+?=
 =?us-ascii?Q?MHHLikW5hhUZSdHYNbRg8CLiEUaakx6famW4144jxxQ7PLUrIe2wmpY7EX5X?=
 =?us-ascii?Q?wfpwLYLqHMtXPBN8mqXF5aBZ7+12ehMYlzQstbOWLkl2tUdlxoow0JbBb9VQ?=
 =?us-ascii?Q?NBerUV6JeIqlti9FUC3XVUaPKWUN9iP0lkupZ7SZqiNMnYbqfKXNOmYPQyEQ?=
 =?us-ascii?Q?qSSPs9Cnr24I/qVAUAl/s8KkVS34xvecmxlyAkjK2tXQwPnmMMNflgL2h5aY?=
 =?us-ascii?Q?iIm6Zgs1cB/y2qxoU/RK2aZMsyOxL4YyNCxy+hj2pGG8s0xfK/Hr9I/0clMR?=
 =?us-ascii?Q?zQfz0RdAEajLQLJpRiiYDiw7FoHRvnic718d/qUHmlj6ICHR4Q2il9C4I3+X?=
 =?us-ascii?Q?XSLQlaeV07arkl+ewLVdgaccz3iMkcoI5RF+3W+Y+CFd4hOcdexMWdi01qq4?=
 =?us-ascii?Q?dcmEHoFp7qc4x6/GLd9/nxOmCf8Oo/iuNkVws9fKll7jrh7xgCOKnGRAAl6S?=
 =?us-ascii?Q?7oVA67zkvju2ERAmJVR1aauuXbxVri4MloLoHlle/zUN3yECwQDZVOEb8FX0?=
 =?us-ascii?Q?ySINMIcRSVNu3MlG6a/PgQPTP1tsvcRxOYbYnw8pOW0yR1Qe96MFzSGu46Bd?=
 =?us-ascii?Q?5TID0aWYIi9mtn8KiaTbPNmFXAHR3vzwPysXE8kd5YpU9o5tOXis9n7sZbYH?=
 =?us-ascii?Q?+Ib7mGh3Un+7HYFXzVJNrmsSCqBVbB+lBdZePHkSN/4pBcKUL85CZCqNSoHT?=
 =?us-ascii?Q?9Vr2T4dXXchZrPJnwqkXEjoW0q7jEcts2q0qic5jYg1kHUiFfBP4BxAjvMNd?=
 =?us-ascii?Q?TNdpRUCiPg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9b8049-9679-4f71-c042-08de68c70c81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:08:45.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSSsaP3mYXLEF4aLDN+xoR1m6ulAUr9bMXw7qaDu1xcFaxiuMgrAppXBlyxNZJANRShia3+GFYpVyG2VpDOC1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31566-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3321B11DB53
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 236 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..6964de309471
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+
+- **ID (Message Identification Code)**: Must be 0x5. Indicates the GPIO message.
+
+- **Vendor**: Vendor ID number.
+  - 0: Reserved
+  - 1: NXP
+
+- **Version**: Vendor-specific version number (such as software release).
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes. Should always be 0.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **port**: The GPIO port(bank) index.
+
+- **data**: See details in the command description below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+The SETUP message is always sent from Linux to the remote firmware. Each
+SETUP corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+GPIO_RPMSG_NOTIFY_REPLY (Cmd=4)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 4   |  0        |line |port |level| 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SETUP and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port |type | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **type**: Optional pamameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0


