Return-Path: <linux-gpio+bounces-31644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFXYFKBIjmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:39:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F231B131545
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 259BB316D1F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BABB35C1A1;
	Thu, 12 Feb 2026 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q/JypJ2w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF128BAB9;
	Thu, 12 Feb 2026 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932292; cv=fail; b=hyx7jT/sEn93hZ7OLi3y4MSszGAhDtceNH9VF6We1BSOcOPeevyLLKGgTO9Pj++YM33YPLbvJ2Z2YWpjx2o86+ClpQ4A1FINdqz4B+OogWXbkxcumcg2iuqEePXI9nOSC63JiZA3y1XQKOZ6kxvv3effJFgIAgWJ9bukVB5UdmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932292; c=relaxed/simple;
	bh=6GPsFy9zCNA4aOGX5lsr4ft8T8IqZh9Ce5RCYwC8o6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/2NE1zbCfoRQ7ZKflfWTWbdny68tRDuN5aeDhzqslh0OROfIwBn1iZQ0MMM6slLCI76L9b48WpxFOU4idUNHOvxLkXMKL9i8oOHTQeKe/D0EVjbXIbuCS135FkX+rVgHK8IszjT6eUYVjhREB4IufB8ABZTS9/Ylb7PWCb14Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q/JypJ2w; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFsIJ7Uw4IBBw6uF4FR3UbWPUzs+oGX0KchLM8AR1gRf7VJvyWlZmLV4pLhh/yoefmWyXvKvhhpJurZlEgDzqzCYUz8V+dcE3TB74rVkWtS7wc64+VEB+r3UU1/jZfQdDqrAFmp9n1Antc+bxPgcAKWBBzOtfpOq4rqtQ/VZjIMo8ULi53M+6nrUND7BneBfB+ZC1LVxS35P0dyHbVJLXmrwpxPA9zAkWvL5vJVpQHsijuXxqp9h08ZrMPQqHMJTjRvC+1wttX7Y/QWYwPDNe3LbQ4CDLyaIHcCQExS+1eU8ak9hCRjNTrpVHiy8JF65icBVe9m0ZoseHgMCTT5OXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=V4FfbD9hWv1/zT3F8toEYUiejrj/4GGwQD37BRaOxhSJBRKNRxh7XMkQGWxtgDQ35xXVF/X6TGzQH7qs8c1BhTGSGWmn+5cadoazz7g9BPAuW5QOuefdyn9FIzphGPOK/cP2Y4tMBlnZFEvrLQ9fXDIEzDv2vfs3TXUooYwaS+euDQXDUqHEY93uCHYGVhnhfrdj2U/QskrRH/cdKR0rsW+MgM32NvmPq0hQRGpuVB2ap0IjhgD4w2dAWNrhXgLsYim5tdsfH4z69RtZprBIp7QRR5GqY2KjFmcjiq7zZ+w2Az6NPdJo5kVStuQCJ3LwNAt7z5a3wYNZwEQSmJzoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=Q/JypJ2wUDWwuZydUG0cP/HuKovgD7m2rmZerTEvWfTv67p15leGZ0lHrhTR5DnAexaE3dtL11uP06LadJJ6pPcHbu27A9+ZZaqXRrmOVXemMq3r3bIfLoDnUV9zsn+NaOEZxMf8xqDu8lbvULtCEW+zKdUo2KqZCyX6w+LDx3+Sk8KDnGM2h7+D1UlXNdfRfiXVKZ9NP3jp9voXFaYZ57pfChKtDcDnSPK4VMXBPxa6K6MXOykgvhCcxxB+SWvFGS1mQXgSzYb9hA6j/AJbHg3rzEeMVeVQabMbttHl2n8jVQT4A0ZzBMoI56uxOHCWrWorupi+lBXBp49AZD3EZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:38:08 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:38:08 +0000
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
	Sascha Hauer <s.hauer@pengutronix.de>
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
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v8 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Thu, 12 Feb 2026 15:36:56 -0600
Message-ID: <20260212213656.662437-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212213656.662437-1-shenwei.wang@nxp.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:510:33d::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 97543249-0aa8-404d-86b5-08de6a7f0355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7uZJ24UuqTZ+MdYoBcCZzQaKqCVmt50JU8ELyaMAzJnKZH4iA1PmLTTJv2iz?=
 =?us-ascii?Q?zqSGV/fGAO0Xlj30yI0rBELoJOiALJpvrJjOQmsV+OAqA73wUDB5XKVtUZaS?=
 =?us-ascii?Q?OtSxyrbPREbG79X8jTa2BEljz2zXQuvRumJJLcnMfBP9Vs1rGcWbTVTYvxU+?=
 =?us-ascii?Q?2WEfIvZAFpPjUAr4WKloX8GFFxixVCcJR7DFsyfAErkhByzUC/fE/+q7Q2ur?=
 =?us-ascii?Q?17GhwCY4QnQAVEw7uon6G3I2z6vnP5GQaqlyJ1rMEoY0RiFgz6Yt8o93QOFI?=
 =?us-ascii?Q?Hh0o95gJPCul6a8kOyxDZ5QVGeJrRma3zv+zw4F5YTSrfAMEFJK3xoW+WeN+?=
 =?us-ascii?Q?LZIrLyxsovdZ18L29XVmJ374SM5m8OsuHGcXFInzKDn0k34z5moRdS6rUROr?=
 =?us-ascii?Q?ZROdvDNAfeVF4fF4TYSxb4cviUreMoGUItEvsBKkEkWitBwsV11r9TJ37ySW?=
 =?us-ascii?Q?zGnY7Hn5jsEXS1yamL9OtAGZU3biu0qYBm2JEkbKvtjx6F5sU4MaBDa2HqKZ?=
 =?us-ascii?Q?6EwL2j0qZdvIu14xWhLRT74UUP26eU3V0a18KmmAjCFdFZ1zy2olMr/MDhSF?=
 =?us-ascii?Q?VWjPX0rFJXESngnVPi2zybHAz0k2pbyF3C0rlfP8MeLb+9aM9dzarLewj/X2?=
 =?us-ascii?Q?GLoKVLzpn3Lm612AnUdpebRcSDDsHGBJZuZ7TtMtk/eW2yEbPMrTDJtwlRwn?=
 =?us-ascii?Q?BceMRYNyNUcrJp/c1D3Lq1VaLxkGsse0SCI7A+9+S96xgRKSFjALBzMqzcST?=
 =?us-ascii?Q?WCk6GdhYQvukpHAMjYOdjX9WVe8XqQIAQKyOLPzDBdDwhae3bhglU7Ww3jtQ?=
 =?us-ascii?Q?MIFgKmjjPxvUhOU3wxo0RRTuMqkyvaOcwyBre2gRTmF23D4A0vpQcqt1wG8I?=
 =?us-ascii?Q?JAsi0VsONhwf32sDdOkHZ0giqo7SGGSN64bn3m4pjX4msj/2rfr6GM0peqeZ?=
 =?us-ascii?Q?YX5nQaWe1CBqv67A1IisZ8XzRgBEpwHga9e2qrBbkN+iroulouKLYiJZOPBS?=
 =?us-ascii?Q?Ol+I+9uS+J77rYd7V6Laj27EHqCdXgG2+cBIeoNt5DQnD3RDGgNvkwwdwI89?=
 =?us-ascii?Q?HBWmwzi8AkMz1r53xO+zP4Pjp8YswSeriTc0gvW4suiR8zBj3POoQoMMyCrg?=
 =?us-ascii?Q?6ohNRe41a1x8ytZstolR+LVg01QlvVhkEmTFa3yBqIGTWsid5v4xC4CZRhbl?=
 =?us-ascii?Q?qOS6XK0zJzue9sdPB0DExLP5Iu/i218W+mFbjnD3VbN9wxx3qEG3mL9894pB?=
 =?us-ascii?Q?1Mqb/mMY02vDnaulXKoamn01vqLx17AJTu81nar66pFwtTy5iFnp5QUJJCUV?=
 =?us-ascii?Q?Mp4FXMiPFLmBvWWyfqSGVx5TdAbtTwNGjrTYcv+OPwRXtoubAEqVe2awprr/?=
 =?us-ascii?Q?AlyhNlhZAR1QyEJ91Ktf+7DlKUpMO4bcuQGagWrVYe7IQg+wzBV/dx3YPRAw?=
 =?us-ascii?Q?Y8Bbo7NxhkNxYrosGCIpsJh7uOTWgkQpJ74xkdHrMBZTGS/3jm/TKKurefmz?=
 =?us-ascii?Q?5ylelsd0OlPPCc0wlWue+omjML9X0mDsSvlfR9UasKDqixOW5tbZcx+kBaap?=
 =?us-ascii?Q?ftJwMJDf6iPSFq2GmLlEK79hsJQj2m0L/qmhE4cd4lAR1O7FevkL4zkU+80k?=
 =?us-ascii?Q?mfeeTqf7+pbjv7cfsmvuB34mj5Xvxz4uUhJUbyo40lND?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZapOCSv1mZlou5NAGFvS8iw5j84Y0MZYE/A1owGa0VEmDiu7t5n7QDLmzvUB?=
 =?us-ascii?Q?ZsduzT/i6SlEhVulluQ/PWv7t6M5YYYh81xUrMug6G6FQOAqfNpoOYxHu5Zh?=
 =?us-ascii?Q?PTOFkoOrC889HuIByrjbjE+ywoQz01CWqG1svO7+gsrzbw0KSmMQHMTRq6fm?=
 =?us-ascii?Q?fgTw3oLH1FTJvyxNgLMLw/niZwsXMIh2o9bQyJWEpLMVlweRSI7mbND9iPZq?=
 =?us-ascii?Q?HnspCk+GToUeBZ1lqJKS2DU1ZHhxSuO3qinpomf06hrAJ+qp5W4PBXGBKJxj?=
 =?us-ascii?Q?uLRD8P321EP17i8rqwmTOUqPZH5/nYl0uV/sBCEShKPdhu27qPeykhpzSEHv?=
 =?us-ascii?Q?jJ90OpSHaaGYNzDDc1xZFGJdYYayvQTwzoq6YqHx1cAAkyAXXxPWuvE6ZIIP?=
 =?us-ascii?Q?CnKAza1j0EPnA1Z/IxbjcjVcLXlixpeIb9IMXTDZjx2tC7o1zslX+bfa0hJx?=
 =?us-ascii?Q?ZTleJzc0gDFaxYwliH0566VZUxGsy9xc0OeeoO0Rmyd0KP30rdNlJB4EkGsh?=
 =?us-ascii?Q?7mktHui17Cyt2WY3k8f6lSBpWIZYSTHlQuXjXJBVAokOWk3ZO51Wav3w6d4f?=
 =?us-ascii?Q?+Ss6BcXNX7d/C9TJHQA4hERmTiJJz8GDRXMg5HsaZVl6uuxaP5ZW0MBpEZeH?=
 =?us-ascii?Q?hg+UG1m7D2TPUCydR5llwvogtP2TN1qzype57gmZ3hN22UWw2KsChBCM+uyH?=
 =?us-ascii?Q?YFcZVMmGkI7W70U74nsS0e7QTUXbrkHun9BV/82jsxRZKLl73BmSQMCoDEzv?=
 =?us-ascii?Q?jXDQNYZ2NcEFy2dUGYfbcCePNdMTb+9+eiDyMRUFyoI1mM9wO17PsQ120oqX?=
 =?us-ascii?Q?eLqXYvGBFgbq7Xprll0C1mZsla2feO63Ev1KeK8YyZSaVb8Gu6Yc+x9DjQNA?=
 =?us-ascii?Q?XXbWYNBexhRfaFUTy4CjN1592fnB2as8LfMpeavrRoUA58VWECA2TGoANth1?=
 =?us-ascii?Q?s178JxbY4xZKqhSaPilJwxaxB3thPWt8f2870NHQCy0UFKBPh35+B0Zy61jO?=
 =?us-ascii?Q?2I+8g353G9LSC5SGHJk5Nq7yh3zEbavKmcIn9WOhu3eH1alb8Ra3mlu5pbxb?=
 =?us-ascii?Q?C4LwQYvYBLHrf9Job2OPM+hGO4+IUDzQb+YyxewA4EMTacIKTNhTSx7/9B/8?=
 =?us-ascii?Q?iZEPYfHyWiRFCOES2yKZqpQDpQl2MpaUqm0HYU3iOQIVhCE/HQNUNxo7LLze?=
 =?us-ascii?Q?DIjs8FT53mf0fIQTRBhm/MeF02wkL3tlKLppCF/iINs5IZjy380gHFhfq9H9?=
 =?us-ascii?Q?SI0QeA2lYPC1MRzV0WaQQBRURCmUDh5lNMZ09CcqI4iQ36eIV1kos1FIGZcO?=
 =?us-ascii?Q?P+rWjIGxYskAFu+IllJqYOlQtnIQ3ALCH8XGeOFe0GOzO7Ana0nYJ4UseZHI?=
 =?us-ascii?Q?DuCkyvUPYxASA+nlEbdjjSk2fbEdStpbU1qDgUxxP+MlQHKB9swSohcArF/k?=
 =?us-ascii?Q?HEQeoU/g3EnCqffL7W8GpRpH5Ub7SfJfzX9fx1WXumRB/cGVDY09M8IVhW7L?=
 =?us-ascii?Q?kvReKkKDnNTLdjhLyNVyam55BtnMx7Jy1xqe0pYyybFCN21E7JhMwAeHJIkT?=
 =?us-ascii?Q?6cl9NPT5p9RrrdrN054IK2huINFOifwdofWiFhicuGt0xzycoj949pOfh4O5?=
 =?us-ascii?Q?K5QBaK3wHhkDbtJFSLwHldW8PGiCYwXo34p9yLjsKrBDQVT+VyVkEiWbTBJB?=
 =?us-ascii?Q?phebMrL5B5XSFwXYObAPSEOcoyNM0KimWtCgbqbjsZ2HZqaR7ENJUsBim+X+?=
 =?us-ascii?Q?Hfy3wDijsA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97543249-0aa8-404d-86b5-08de6a7f0355
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:38:08.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhbCWBcUOHWew1BRnwv4LFQNiZOmZb9vs9EFZBQ4+a7G+6JUNxUhVHi6hsmzsVSaJQr+Y0esenwRn9CS5S6uyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
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
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31644-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_PROHIBIT(0.00)[0.0.0.15:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url,0.0.0.0:email]
X-Rspamd-Queue-Id: F231B131545
X-Rspamd-Action: no action

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


