Return-Path: <linux-gpio+bounces-31508-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHQJGcmph2mqbQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31508-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:08:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201D107222
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFBD33018755
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 21:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6420354ACB;
	Sat,  7 Feb 2026 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aQdAqOXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B38D2E5B09;
	Sat,  7 Feb 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498495; cv=fail; b=f8bscPR8I0NxsW+Qtco2l0lco+RMMUZtoRInW5kqfY6U49a/V8OIFOGyP2S6cyHEYuk4PARmv48XkNbe/N59N424GU0+r9eLkB1Qt4fe1uZK2DJSLlBaUps7AjPTKUJR6JKLyrs903bOxFE4btx5u9AHsXlFFqYOqs8cQ9p4aGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498495; c=relaxed/simple;
	bh=M+rgzgYKMyXbqWsFvI5bRu6Kn+5EpGy38Ie+2MXnpH0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ksmj40Ulx9802AwszXVQQz5+HcSnVA05s50c++VP9fbURSBgqFb8XLuv9B7QLRidBXzO/yB7maXddRRdXGYpPP1zlvlDSjRa1x3DikpsqN68U1xWa8SPiLMCoPc6clXGeo5bMDM5yZ+acSxbNlR+yCVETTCJsKGTocqFFF+mqdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aQdAqOXj; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOZMJSlBS6+k228gwFf2K35hQoWIRqLVzzjaU0LCnROxFCOEIKqgcLP+r0zhnJVk+whXZxu2CZgYtH3vAJ0Bfhu2FSfibR9gj7oCUolkWJ5PEk/U+RyQiHx0VMCb4fbtybj9/kWB1MAVbJYrQM4sWeastbyDtSJjn0y6XOLKuhlgOVSEGNn0jc2UE4s4W4aU1uJdMi6/91Q7zyNEYQjwZE8sW+8htbv/WoWypdTdcdORxFm4GltJnAYsZJtdceDwXh5uIR/ycF3watYr9DyMIO+6QHAOPdTFZcqlc6V/d2PIy3aO9k9q78BlQlqstNEfn+nz5F0cqb50wiNSE1dlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+rgzgYKMyXbqWsFvI5bRu6Kn+5EpGy38Ie+2MXnpH0=;
 b=VK5ztSJGO33zL9iNleQq6N7i+QqreqgNt3TvLHEdk/gGWV2IRGH1LEo1rh+83soO3WWN5XF1qgnudeaK88Kj+KBbE1FKrm2l7EmbfLgShvOyPwTWfsILFMTpQiyM0oz9YJhtWl+vwwOg73LGLPFqmefHuTP/I/rDE1Mq/gw9wkTbjWjv1FFqLCRPDFAPvz6z+ZaHDKztxSKwcUM5RAd/KbiKQsd7ns++V6euGvFoK6oCxUaPTjw1WFAsV/pjJSuEtUdzAfAVyDnKzkADyAw6CD35kdpGzZQ3AsJKGG3LrPr5Qcpmz9Grsbp1w+h5o3zFKdCMGSvTX7w+aaVQyhVJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+rgzgYKMyXbqWsFvI5bRu6Kn+5EpGy38Ie+2MXnpH0=;
 b=aQdAqOXjc0YCXV6ARZTCpui/6ec33EwHu+HK1bI6QHEDGGaZflYypKtny22AF8oOtVXFW3pGQ+UsBS69ExIjpjEqCDiUfu0f9o3XuIHESWIwY35pbZDmwOZ3YRiViHBjJa+PzGov6+juu7hwQl2JnJW71x5furFr6lZ8HczQIiaoRb5eL8boFGkE76cxLzVZQ3VtiIOskktJNUVYZyvAiTXJFvNuYE9lijWlT7plBVtaIFUkaBqfuUw5VinZRdor7OU4W1i4kmfvL/ATAgamp9zB4G/jnszVDjyL+7HmL2UGoj0oolbrgJwN2Q2ni0kTs0UAuKzG31nGlow6b3FRKQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8148.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sat, 7 Feb
 2026 21:08:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9587.016; Sat, 7 Feb 2026
 21:08:10 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcmHXdzVcfSRGX5UqeUsHO0rIryw==
Date: Sat, 7 Feb 2026 21:08:10 +0000
Message-ID:
 <PAXPR04MB91858C93A81064C54C74D5928967A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <aWfNsrpC5Rgiwwp3@p14s>
In-Reply-To: <aWfNsrpC5Rgiwwp3@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8148:EE_
x-ms-office365-filtering-correlation-id: f106bc13-986d-49b7-fbeb-08de668cfffa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1NxcFBZMEM2YU9za0xBVUt4UGhSVTYvcWJoQmhKUzZQZjFGWStmaWhhMDhF?=
 =?utf-8?B?NWtVVE5kQmhKdmlEeU9vUzNudmQraGhTZzVqVjhkMEc4YzA0VHdZSTFkcDhO?=
 =?utf-8?B?K2hCb3F0bU93TjZvblhBSzZmZWYxUVdyV0dTQzVHRW5mRE1lcXhhZityS09K?=
 =?utf-8?B?VEFKWDNhRGZXaUt3aTBpTmUvVCtKUmxMS3NVdTZ3WGdtUDlXZE9PVEd0QzEx?=
 =?utf-8?B?QUdvSDJVM29zKzV1QUQwaER6ajh4ajVPbFM3bDJxZUZFZjJNNkl1d00vUjlD?=
 =?utf-8?B?TktjZG5ZcHBZN2IzMkdHQVBsTktQaUIvQzFIMHdvRVJkUmRBc1pnbkY2NFY3?=
 =?utf-8?B?T2x1U29ZR1lETWZ2UWZ0OVVoMTNvSTZ1aWJDc1hqWWZWMWZIT3RLdDJ0VjZ5?=
 =?utf-8?B?ZjQ0N3lBZHBPN1RCZUJoY0h1R09SNXhYeFF2Tnl3SW5IWjBWV0JnNk03L0JK?=
 =?utf-8?B?dHlwS2lZSjc3ZGoydUJBd2hiZDZVL2w5VlZDbFFmUmx5bW1sblYrNzFINWl3?=
 =?utf-8?B?enRTTkk4SWVnZmtmajRpRElEcnNrdnBZb1V4SWgyWFFLaWhxeGRHT1BNbVBX?=
 =?utf-8?B?aHp3Y2ZFeHZMVDdJQXNpT1kzaU1qT2ZZbmU0VjVFa3lMSTRhRkhhWHJhcC9r?=
 =?utf-8?B?L2kxaUN1OExyeWhpNjc0OGpLakZvUzUzQmhQang5VXdpelJkQm9QYUJDTEpB?=
 =?utf-8?B?djRLUFRUajdNMjRjbzFFYVl6YmlLWUVybWZoeFNoVWliQkZCMXNJak1vWXFk?=
 =?utf-8?B?V2wxS1FUN3oyUTMwOG9qdndCVit4V2NmUk1KTkFpai9zZFJ3MVBvencvejR1?=
 =?utf-8?B?SmJUZXdJSjRZS05DS0orWit6SFl2SUNvQk8wL3JCaGJ2UFJYQ1RXNUxibFo3?=
 =?utf-8?B?bzhlams5V09DcWdxcjJhdXB5ZlB3Mm9VMHNqbjJBTE80cE1jM0tLYTRPdTJF?=
 =?utf-8?B?ZmVnN2ZpZy9aOWlGNVFuL09ONXpwYW5sRFJQZGRIUkRySmNZWmY2YjdwYWZP?=
 =?utf-8?B?M3hZMTRhalhOakJaZ2JCdTZScVY2Zmh1UzIvTFJuYUlscnhCYmM5UWVjbWYz?=
 =?utf-8?B?SnBoV21RT21ZeDB5Tzl0TTNFZ243dElOTjRGNktVU1JRQWFoVTNib0h6K3Rp?=
 =?utf-8?B?V3Zvb1FkV0F6K3I1bGdsRndHOHdtWU9nWmZneUtRZXZvRjcwY3VXcXppU3RX?=
 =?utf-8?B?QXd2N1lBOWd1WFcrbi9YNG50TTNpQjNTUytCTm1HSzRpWVhlNUx5amxJTXcx?=
 =?utf-8?B?ZnpxbURiY0JvSVg0SnMvSzJKb242empFVkpHTXEybE9JOG1GVnJ1WVF3eW9J?=
 =?utf-8?B?aVNGSzBydEhVUDdkNS91VDhwa3pKdis0cGhEbGpuYW9SV1JrSStnTXRkR0JZ?=
 =?utf-8?B?aXdyeUM1RmlnU25XR09YWnhZNW5qZkpLcXlhNHFEL3NsTXA2cEVqeG5HVndM?=
 =?utf-8?B?MnpkdmFrRmRWZ2xsVDdmWEZPWExYL29wMnUwVURzZzVtcHBPZExhVlRJU3p5?=
 =?utf-8?B?MEVKandOdXhUcjQ5L0dKU2kydzBwYW9OMzNiRVBOMGlnOW5QNUg4a21QSVRN?=
 =?utf-8?B?U0VCc1dGTUN4SCtrRkxhWnpyem9Sd25ia2VNZ294QnlFOENLMVZRQ2c2Nm5x?=
 =?utf-8?B?bmZVTGhBbTBZekJOTkxiMEx2NGNCZXM3V1J5YllNdkJueXpVdHZnVzRyZDlE?=
 =?utf-8?B?WWFIZzd6V0lnZ0pHOE5vMFhQVzB1NjIzVGdnRnlubEJhdy83a0M1SHh2TEtM?=
 =?utf-8?B?dlcyUXlBb0NFUW9DMmhqUUo5RFFGN3JHT0RHVm8rSW5aWW44THBnbnN2NzU3?=
 =?utf-8?B?UlJlN2tDekovMTA5L0RWc0JFR1o2VjdaY0E0S1RvMzIycktvRHpRRzhOTDE4?=
 =?utf-8?B?LzRld2kvU2llZzRGQS9QQU5iaW5VdS9nbFc5dHhTT0tnbVcwOVR5QTNqSDBr?=
 =?utf-8?B?djdENSs1aVZhNXFMaFZnMSsxc1BiNDNPUmRLVk9mMnVVbVZ0T3ozVDIvRGJo?=
 =?utf-8?B?cytHR0JjMmYyTkZaSG0yT1Y5NDk0TjZGTVJRQnlEeE1RM09kdFIrOVRGTmpB?=
 =?utf-8?B?VWlZL0NEWjFZZGxCWG83Zk5ETHNKQXlPUnZvQjhad0xPZ09naC94ZFBjTWZN?=
 =?utf-8?B?ZGFiT1pNNE00bkFYMmFwUkVWV0phRnF2NkpJMkJRUlRWVUJaZlc1ZEpCUmNB?=
 =?utf-8?Q?zSbognGznV4tcRxS799ZnJA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXdmVTRDYVNNTy82dWNaNXFSWG1JdmVtc3F0eXoyYkVwRVdxTVpsTHR0Uzlm?=
 =?utf-8?B?ZXhtOW5KcTdWS0xxeC9hYUJBVlpyekp0YVZ6T2ZwcE9sZVd0a0xjS2R2OWcy?=
 =?utf-8?B?YTUyeW56U1ZYS0gwM2svUGlBWHpwQlNXWTRLb3dVWjdISlZhUkxoVStMSXov?=
 =?utf-8?B?NFBHbnovZGFOaWNPUUlGSldwZk55YzJDVkxpNWozWFh3cFd5RGZpOUY3UzlM?=
 =?utf-8?B?Sm5rTFZpT3hqWjBhNkVVYVdDNWtvbzJvMjl6aVNKZmo1eUt6SW5SUFZpK2JR?=
 =?utf-8?B?MlZ4NzVEWUNlUWllcW5EMVdseVhxQlpzS3BzZFpTQWZpRHNnSDdoNCs0QWE1?=
 =?utf-8?B?NU9EdmM0NWNSd25XSVVHejA1UUNpVjB2MUtCSGUycDE0UkFUQmN3WUNGUjJh?=
 =?utf-8?B?VlE0QWFhWXdvY2tnSGVCTUZiNVE2cmVTYnpKYkIwYjJaWnZoVGhrT01QeGxZ?=
 =?utf-8?B?REg0ZjFBak1LbWVlS2QreE54cGU4R0NIVVZDdk01YnJORUM3TjlHcjlpNzIw?=
 =?utf-8?B?b0Z2bmtuby9qVEZmdHRmaXNKRDk4M0xkTExaS05RdnVZRmJvSlU0Ym9LZ0I0?=
 =?utf-8?B?UkVTZTVFdE9rYnFBR2UwK0VJRk83MWt4MjJtSVZpejJ1TXFqUklPUXRnRC9C?=
 =?utf-8?B?N05ibXkyUm9LR3VZR0dNSzE5WVEyTStmRWxTWmlSWG1LckRpVm80TEh6VXVj?=
 =?utf-8?B?NUhpNkNNR3BoY1hDSGx0ejZZZkw3R0xNT2owd1BUNUY1NUVFOUR6VGQxanVu?=
 =?utf-8?B?RWJyVGxPYnV1c3E2YnNBWHdSQUpPVmpuV3FuT3djOEF3T2tQZHQ0WG44Yzhx?=
 =?utf-8?B?WmFHdWhFbFluZUNlZUNzTE5CbjZiaFFPK1VlZzZiZ1gyVURiaEdDY3pxY0or?=
 =?utf-8?B?TmdtTkxIblZLYUF5VnBQcTVPS25uZDR2SG1ob24ycDJUZFp1TjJjVXlWZWJu?=
 =?utf-8?B?R2Z6MjJpMVpkUkFIOXpVbm5EeElwMnkrRVVCSWY1c0pJbHkwdWxOeFFLS1Q4?=
 =?utf-8?B?SWg5NGNjSzd4NDRtZkZ4ZnNHU1E5VmJvWW1QNGZPaXM5QzlERlRwc2RXWFkv?=
 =?utf-8?B?NEkvMlRMWnJKOXdab1prRWxrN3BXWWRCbGd2bjMraTAwNkVIYUlJU1ZtMnho?=
 =?utf-8?B?dVNJcWN2eUJsY0F3V3Q2V2VBUzhHQVpZZ2UzYUFCVllZZ0dadktOM2x3ZnRm?=
 =?utf-8?B?Q1RlY2JSYXlYVzJMMzV3RVkrUGtXZ3pZYkxLYm0yYzVqWk5FR1VZaktXR2g2?=
 =?utf-8?B?Qkt3Y1ZsOHhGNXdidVdtamRCeDFwM2d3TXZMMnYwSnpvejAxS1VaYXlrVDlW?=
 =?utf-8?B?Uk90SkdZVUhnd1R5MmpZSWZmRUJVZzlwRHdvRWdLS0tkRUY5d1JlcmxMRXc2?=
 =?utf-8?B?VkdoQktPdUw1ekQ5aVZWdTNGdEZvRE05dmlkMTMxVHMrZVA1ZnpobUVnRURQ?=
 =?utf-8?B?bjBZU3Z3eW5vQ2dUdjZENHpVYjUvakhBbHhOL0hkYWZ0ZnlvNHdiSS9YTFJq?=
 =?utf-8?B?c1JvdHRXZjhtRUUyOTBBV1UwY2h0NzF0eTVkelY4Z0pqaWo5RS9oRDlITHUr?=
 =?utf-8?B?MW01VUx2Zkpxend4Sm15QytzeG9BaHJubklCV00xSFI0dFl5YytCOGpGTHR6?=
 =?utf-8?B?OEVzVm1VSGZXU2NPajBPMm9Bbm1TR2J6R1h6VzNTQUtjVXU2QUhuNE9ZWVhF?=
 =?utf-8?B?aFEyTHh2U2RtMHI4THdtM0RwR25CSW9ldDBWWSs4Qlh1UDhJb1kxR21Iek10?=
 =?utf-8?B?MTB3elU1ZlE1N0NUclRaMDlWeFV0cm9HOUxIRHovVGNZNUJic1FYa0J1WU5E?=
 =?utf-8?B?Nkk1QnlTMU5QN3hrK2ZDYTFwd2E2V3hSS2xQQXhpU2s3emRCODJMNHZYbmhp?=
 =?utf-8?B?aWM4dm1SOGVVMmJoejFBQ1RRdWV2NmRXM0dZcHhiSmNZbXlYaTV0R1lqY1Iv?=
 =?utf-8?B?SDkyTGVJRXJmeUZDczdYTzJEY1N1UWpSSWVFdFp4YThBenJGV2x0aURaU3JQ?=
 =?utf-8?B?WWREREhXUCs0UDBQRVEwMHI2WkU1cUJDc2xQRXJDaHNLU1ZoSHdDdkJNZjc2?=
 =?utf-8?B?OHEwTFQrUVNCNnBwdXlNYis2Y0R0UFJ0dDI5N0xFR0hTN2NXODVRWTFkamI1?=
 =?utf-8?B?RWxYVldsVnlDQjg4d2pVR3ZNSVR2SmdrT1FSdTVpdFV2eklBUGxlTnUzMXRR?=
 =?utf-8?B?Zys4NlJaRDdIQU45UGRHdnU5L1o5L3R5Q1NEdytRTWY4SUZNUi9UUjVYLzNq?=
 =?utf-8?B?MkxiTHV5RWQvQkRHWjJ3N2tMd2lsdHBidVJBREM5RnJoQlJPbzg5T3F1TmN0?=
 =?utf-8?Q?ouWr+BlQJo4qtro7KO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f106bc13-986d-49b7-fbeb-08de668cfffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2026 21:08:10.8835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzpSXw5Zo6+7dhGoEiF0SVlwGIoTovXgv6fvIuBPC/K0MNge+1zzONtejf9ae8V1+jJblZoBF0LjPTyEFel5YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31508-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,lwn.net,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 0201D107222
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5
IDE0LCAyMDI2IDExOjA5IEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAu
Y29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+Ow0KPiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsNCj4gQ29ub3Ig
RG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29uDQo+IE9uIEZyaSwg
RGVjIDEyLCAyMDI1IGF0IDAxOjQzOjM2UE0gLTA2MDAsIFNoZW53ZWkgV2FuZyB3cm90ZToNCj4g
PiBTdXBwb3J0IHRoZSByZW1vdGUgZGV2aWNlcyBvbiB0aGUgcmVtb3RlIHByb2Nlc3NvciB2aWEg
dGhlIFJQTVNHIGJ1cw0KPiA+IG9uIGkuTVggcGxhdGZvcm0uDQo+ID4NCj4gPiBDaGFuZ2VzIGlu
IHY2Og0KPiA+ICAtIG1ha2UgdGhlIGRyaXZlciBtb3JlIGdlbmVyaWMgd2l0aCB0aGUgYWN0aW9u
cyBiZWxvdzoNCj4gPiAgICAgIHJlbmFtZSB0aGUgZHJpdmVyIGZpbGUgdG8gZ3Bpby1ycG1zZy5j
DQo+ID4gICAgICByZW1vdmUgdGhlIGlteCByZWxhdGVkIGluZm8gaW4gdGhlIGZ1bmN0aW9uIGFu
ZCB2YXJpYWJsZSBuYW1lcw0KPiA+ICAgICAgcmVuYW1lIHRoZSBpbXhfcnBtc2cuaCB0byBycGRl
dl9pbmZvLmgNCj4gPiAgICAgIGNyZWF0ZSBhIGdwaW8tcnBtc2cueWFtbCBhbmQgcmVmZXIgaXQg
aW4gaW14X3Jwcm9jLnlhbWwNCj4gPiAgLSB1cGRhdGUgdGhlIGdwaW8tcnBtc2cucnN0IGFjY29y
ZGluZyB0byB0aGUgZmVlZGJhY2sgZnJvbSBBbmRyZXcgYW5kDQo+ID4gICAgbW92ZSB0aGUgc291
cmNlIGZpbGUgdG8gZHJpdmVyLWFwaS9ncGlvDQo+ID4gIC0gZml4IHRoZSBidWcgcmVwb3J0ZWQg
YnkgWmhvbmdxaXUgSGFuDQo+ID4gIC0gcmVtb3ZlIHRoZSBJMkMgcmVsYXRlZCBpbmZvDQo+ID4N
Cj4gDQo+IE5BSyAtIEkgYXNrZWQgdG8gdXNlIHRoZSB2aXJ0aW8gaW50ZXJmYWNlIChpbiB0aGlz
IGNhc2UgdmlydGlvLWdwaW8pLCBzb21ldGhpbmcgSSBkbw0KPiBub3Qgc2VlIGluIHRoZSBhYm92
ZSBzdW1tYXJ5IGFuZCB0aGUgZmlyc3QgMiBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLiAgVGhpcyB3
b3JrIHdpbGwNCj4gbm90IG1vdmUgZm9yd2FyZCB1bnRpbCB0aGF0IGhhcHBlbnMuDQoNCk5ldmVy
IG1pbmQuIEJhc2VkIG9uIEJqb3Ju4oCZcyByZXZpZXcgY29tbWVudHMsIEkgYW0gcmVzdHJ1Y3R1
cmluZyB0aGUgY29kZSB0byB1c2UgdGhlIHJwbXNnX2RyaXZlciANCm1vZGVsIGluc3RlYWQgb2Yg
dGhlIHBsYXRmb3JtX2RyaXZlciBtb2RlbC4gDQoNClRoZSB2aXJ0aW/igJFncGlvIHVzZSBjYXNl
IGlzIG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2ggc2V0LCBzaW5jZSB0aG9zZSBkZXZp
Y2VzIGFyZSBleHBvc2VkIG92ZXINCnRoZSBycG1zZyBidXMuDQoNClJlZ2FyZHMsDQpTaGVud2Vp
DQoNCj4gDQo+ID4gQ2hhbmdlcyBpbiB2NToNCj4gPiAgLSBtb3ZlIHRoZSBncGlvLXJwbXNnLnJz
dCBmcm9tIGFkbWluLWd1aWRlIHRvIHN0YWdpbmcgZGlyZWN0b3J5IGFmdGVyDQo+ID4gICAgZGlz
Y3Vzc2lvbiB3aXRoIFJhbmR5IER1bmxhcC4NCj4gPiAgLSBhZGQgaW5jbHVkZSBmaWxlcyB3aXRo
IHNvbWUgY29kZSBpbXByb3ZlbWVudHMgcGVyIEJhcnRvc3oncyBjb21tZW50cy4NCj4gPg0KPiA+
IENoYW5nZXMgaW4gdjQ6DQo+ID4gIC0gYWRkIGEgZG9jdW1lbnRhdGlvbiB0byBkZXNjcmliZSB0
aGUgdHJhbnNwb3J0IHByb3RvY29sIHBlciBBbmRyZXcncw0KPiA+ICAgIGNvbW1lbnRzLg0KPiA+
ICAtIGFkZCBhIG5ldyBoYW5kbGVyIHRvIGdldCB0aGUgZ3BpbyBkaXJlY3Rpb24uDQo+ID4NCj4g
PiBDaGFuZ2VzIGluIHYzOg0KPiA+ICAtIGZpeCB2YXJpb3VzIGZvcm1hdCBpc3N1ZSBhbmQgcmV0
dXJuIHZhbHVlIGNoZWNrIHBlciBQZW5nICdzIHJldmlldw0KPiA+ICAgIGNvbW1lbnRzLg0KPiA+
ICAtIGFkZCB0aGUgbG9naWMgdG8gYWxzbyBwb3B1bGF0ZSB0aGUgc3Vibm9kZXMgd2hpY2ggYXJl
IG5vdCBpbiB0aGUNCj4gPiAgICBkZXZpY2UgbWFwIHBlciBBcm5hdWQncyByZXF1ZXN0LiAoaW4g
aW14X3Jwcm9jLmMpDQo+ID4gIC0gdXBkYXRlIHRoZSB5YW1sIHBlciBGcmFuaydzIHJldmlldyBj
b21tZW50cy4NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gIC0gcmUtaW1wbGVtZW50ZWQg
dGhlIGdwaW8gZHJpdmVyIHBlciBMaW51cyBXYWxsZWlqJ3MgZmVlZGJhY2sgYnkgdXNpbmcNCj4g
PiAgICBHUElPTElCX0lSUUNISVAgaGVscGVyIGxpYnJhcnkuDQo+ID4gIC0gZml4IHZhcmlvdXMg
Zm9ybWF0IGlzc3VlIHBlciBNYXRoaWV1L1BlbmcgJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPiA+ICAt
IHVwZGF0ZSB0aGUgeWFtbCBkb2MgcGVyIFJvYidzIGZlZWRiYWNrDQo+ID4NCj4gPiBTaGVud2Vp
IFdhbmcgKDUpOg0KPiA+ICAgZHQtYmluZGluZ3M6IHJlbW90ZXByb2M6IGlteF9ycHJvYzogQWRk
ICJycG1zZyIgc3Vibm9kZSBzdXBwb3J0DQo+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IFBv
cHVsYXRlIGRldmljZXMgdW5kZXIgInJwbXNnIiBzdWJub2RlDQo+ID4gICBkb2NzOiBkcml2ZXIt
YXBpOiBncGlvOiBnZW5lcmljIGdwaW8gZHJpdmVyIG92ZXIgcnBtc2cgYnVzDQo+ID4gICBncGlv
OiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiAgIGFybTY0OiBkdHM6
IGlteDh1bHA6IEFkZCBycG1zZyBub2RlIHVuZGVyIGlteF9ycHJvYw0KPiA+DQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby1ycG1zZy55YW1sICB8ICA0OSArKw0KPiA+ICAu
Li4vYmluZGluZ3MvcmVtb3RlcHJvYy9mc2wsaW14LXJwcm9jLnlhbWwgICAgfCAgNTQgKysNCj4g
PiAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dwaW8vZ3Bpby1ycG1zZy5yc3QgIHwgMjMyICsr
KysrKysrKw0KPiA+ICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZ3Bpby9pbmRleC5yc3QgICAg
ICAgfCAgIDEgKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4dWxwLmR0
c2kgICAgfCAgMjcgKw0KPiA+ICBkcml2ZXJzL2dwaW8vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTYgKw0KPiA+ICBkcml2ZXJzL2dwaW8vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1ycG1zZy5jICAgICAg
ICAgICAgICAgICAgICAgfCA0OTAgKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvcmVt
b3RlcHJvYy9pbXhfcnByb2MuYyAgICAgICAgICAgICAgICB8IDE0MyArKysrKw0KPiA+ICBpbmNs
dWRlL2xpbnV4L3JwbXNnL3JwZGV2X2luZm8uaCAgICAgICAgICAgICAgfCAgMzMgKysNCj4gPiAg
MTAgZmlsZXMgY2hhbmdlZCwgMTA0NiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tcnBt
c2cueWFtbA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L2dwaW8vZ3Bpby1ycG1zZy5yc3QNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Bp
by9ncGlvLXJwbXNnLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGluY2x1ZGUvbGludXgvcnBt
c2cvcnBkZXZfaW5mby5oDQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=

