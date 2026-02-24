Return-Path: <linux-gpio+bounces-32152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jvc3GAcLnmkBTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:33:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDC718C668
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76AD030635C9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506FD33A71B;
	Tue, 24 Feb 2026 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DipRylo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7826A0C7;
	Tue, 24 Feb 2026 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965186; cv=fail; b=krwPhwck/+Rh71QlSc8OCcUKaTkSSweQV+X+IC62cKfoJoeKtVDvBkyEHXp8XxvdV/7phqPy4UB9uPvJ3JwfAdaFyATL6ew0k15cPVwWW+fSd7BskgQ05cZ0HwmIQizussPhQBm4TfKNzAjXM9K8cFInsE0ExEdwAWHCkRQB6vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965186; c=relaxed/simple;
	bh=9fViJLhtOf4fMPYv1dIoNSEolMBJt1rhB6cwifvA1Ns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jPlEqC3e4RB05usTYIBgQjvf/K6lJIMeZcmqZC+CO7BANGsbr03bvBq6wrxn/dCi6zOLIiETRs8KUYCiHxb3HkhXWOM99JJ43SzoHUR19mUAaOiPpyuWkrOOgQYwytgtq9rAFp7CZSVJY53t1S34woPmh8MRjk0nOGIiJ08W5zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DipRylo4; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGEtsD9mrFFEhPS9kSIr3wLeDYanBEtAm+2E8zRaT3fiCJP8DUoR8TSZlfWxgWN/kVd4I8BmCfI5PQpMDN1jf2//n/aTm0NG7FpLuO857LzMWRlICabc+F9HWZ7f+vBth6+ogSwwPQ0+MPCfj7uxtKNiV6ozrbzL3ClqwOZ8vJPpbxFr2EmmtjJBIxmK0hAmid3yTNXfJJH3aW/r0ul8NjOK/IehaKl7v7LneQTXD55FXcKDgLQ5i6ZT+SpYXW8rFc73xfXqWx6WRa/ptOJG3tM8l/2upO3qLzGgwr1hTi6d/8FwfJFZ4p649XIFRS/uP3zJ3ZlPAO8PzbVUeuufew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fViJLhtOf4fMPYv1dIoNSEolMBJt1rhB6cwifvA1Ns=;
 b=htLdKUQs8H+e7pBrKtkubQiCuUYGQl+MijjFYGNKLa2vCHpcrzvKeak+sn/RoWlOLvWBlK+mvvKfNvPjGIbfstWplMEISHl4+qAPjqQOyOOHOrGmVnd7xrR9hfCp+9uA8606Awoi7+9wO3dXTvm9e5uZxDOd8fbMe3wfj7++ZI4lQR5TGOvAdHYL4GuFfZZV0+HfSxbY6YosX75n9rd4L6+P5jFAST+7Ba2B17at3HXGH1xQnyzq9ZK7nYkN3grySYsr7QZQboOoX4t+ELBXJZkm28F6gCR6f+erFlQ1s4acLP3vSPrL/TWbMh1+u4OHLiP18pjdaA0Y+9gtmm3TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fViJLhtOf4fMPYv1dIoNSEolMBJt1rhB6cwifvA1Ns=;
 b=DipRylo4UAP6HGCBJusWeP6qMuBt24uvgyW/uNVylfxxqAbL3AQ/xvjA0Uw9bWaHk6K0MPiny17IS55yNjmBxW4DJ8YkBJqOnlKuPhrx/tfBTjj42sCSgzFKyslPSaRED+vLmBK3ypQGebZQkscXpRaQGu5f21T7dutZBzeJXoqNEYDRbnWzY1y7TCEjCpbfQZf0gbdI22a9+ZEjYazmBP+Jxjs5GF71g1zDH5jxXiceG2JMW+4UPJ32BWItQOz359DqUkwk/vztarZEUPdCnbHM9HbC/1jXEkhFLPs2fAdg7Zt2rThleuv4NmHvznr39lLAZIZhS4Hgq0GxWUVukg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7370.eurprd04.prod.outlook.com (2603:10a6:102:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 20:33:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:33:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpczEPcFoGDXah0Ka07ViWzIjdA==
Date: Tue, 24 Feb 2026 20:33:00 +0000
Message-ID:
 <PAXPR04MB9185B69A128C4B8784D9F7658974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <063dc2bf-8b01-45b6-822a-524f4e7c504d@lunn.ch>
In-Reply-To: <063dc2bf-8b01-45b6-822a-524f4e7c504d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PR3PR04MB7370:EE_
x-ms-office365-filtering-correlation-id: 4b36ff1f-84aa-4f76-4037-08de73e3e6f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0NJV25GVjQvU0pnRm5yUHYxZ2hhU2lKakp4d3IzS0tQT3hJQVI4QTRBVENC?=
 =?utf-8?B?U2puQkYvUzJTUUF2Ym9pWnA0QnpEZkw3OXN0T3pPeWVrZFk1c3JWZUUrcThx?=
 =?utf-8?B?TVlIMHBaTmE0RkxMVzl6M0tuSGoyUVB3Nk9iMldaaFhpZWJ5YUxSZFdkb1Rz?=
 =?utf-8?B?c3NiemdOTWpGZndPekJhL0oxTlMxcTRNcjBhdlAzZGdvU3JtNnAreGZUWmxR?=
 =?utf-8?B?M0p4cmh2YUROa3R4UCtWR2RBQ1ZXaFhrTVBLRm4zOTZJaGMyUC9xNFlwS0NX?=
 =?utf-8?B?OHdFWVNwN1hnOE96bDJ2cnBRRVBzOFBuUzYxNkJEM1ZQanVJUUlLMitMWit4?=
 =?utf-8?B?NzFFVHRpcUxqREd4c2dlSGdnTnp5cUNUWW1JeDNNSUtCSmNvQXlORjlGWFpz?=
 =?utf-8?B?ZVlzR01sTk5HcFd4NXg2SjM1RkszUU4wQktSSGJyWHorNk5yRDJRcWVsNGV3?=
 =?utf-8?B?R2lQUjF1NUEwZVY2ajRUYUU1VzNuWVErRlRNanU3N1NLbTEzdVVGK3dudTM4?=
 =?utf-8?B?Z2V0UmNJU3hvc0lqVlIvZmJhelprV2hJOUU4NlBvaElTam1NT1hIb2VydWFS?=
 =?utf-8?B?THB0TzNCTUtpNG8yaURNTmFYYWxVZUVvU2s5VUlQRWI0bmRVZGhPWFVVZWg3?=
 =?utf-8?B?M1I3OXNwMFVKY2o4NjFPOWlMSkZJcnlKdTkzekJTWTJCRGcxYkMrSXNGQTNh?=
 =?utf-8?B?S2tJVllOZXFaM2pWN0N0dTdrVEtFOUhrWGsxbTVzV3BUUC9oUnE5YWZad0My?=
 =?utf-8?B?VjlFUldyRWx5OFZpMTR4OEh5YXJ3bGtxTTVLblNiemg3bCtRZ3BISDZPeFZO?=
 =?utf-8?B?WlU1cnhWV1kzVGltM0hJQ09WR3cxZ0ljWU5CSzF4ODZaK3dnK09lMXBtdWVo?=
 =?utf-8?B?eWFhamxZUHJrZTZVMEIybzlOSlVYeUN3akVWbytWa1RHUWIzT01Jc1Z0SVNz?=
 =?utf-8?B?czY1cCtMSjY2UDIwTjlrV013bmZHb2VGdHZDWVNuYkpISVJiVUl4M21QZ3g4?=
 =?utf-8?B?YUEyZFMxT2RuQlhtRFUrd2tNbGVqcjdoVXl0RVpYRGRDNEU4K1RtRUNKaGtp?=
 =?utf-8?B?WTdZd09sZzlrNlovNjhCc2g3OXBuN0dtaThtK3ZCcTNwMERHcUtsRjduOCtC?=
 =?utf-8?B?eGJnRHh0UFNXRmtvcWtlU2c5VkFBM3B5V1I0aEZyZnVibzdaZ1gvSHZ5Nll1?=
 =?utf-8?B?b0JkekY5aTRvdnRFckczT1ZCeG5CTFVXUUNBSG9YbnBqODZ6dDQ5aXEwUVkx?=
 =?utf-8?B?QjdnOFFFb2owdi91NXoyNXhqUU5zSHVSZ3dERHcvRHk1T0tuSmNWWDk2U2RV?=
 =?utf-8?B?MGlMTkFlMUhvc284MmhNNWFrVjhaT3oxVXJKd2Z0dWhDY1c2MjdFZUEzRmdS?=
 =?utf-8?B?cVZ4UjJWanJaMFhyYktneWN5RGl6cEErNFZDLzhjUHV2eCtnWnhLNXNWUnU5?=
 =?utf-8?B?a2Q0YTdWTlE4dlNkUnJGV3dDL0NVNkkwbWZVZFJrRWZPK3ZUZS92eHhCT0VH?=
 =?utf-8?B?Sk9Rc041d042T2FQdktkUUlRemppQkhWS0p4T095QThEbkxxc1lvMElxdlV0?=
 =?utf-8?B?R1lXZERZTmh2MVpXcUJlMVB5SU9rVG1oNWhJN01XaUxzUzh0a2hzcEk3Y3Ux?=
 =?utf-8?B?K2RsOExLWS9qZW51cTBPdkVmdXNvNGJtVGtESU0vMDdxV0U5YmRnTzNDU2pu?=
 =?utf-8?B?SkFWdi93NHY1ZVh1WkhoTm9xRzkySHVTSFh2aG0wS0JJbXRhYmh6cXhVdEZ1?=
 =?utf-8?B?RUhpalVQd05vUmpteDJLUWU2NXhwWDU1eHV6dm82a09RMEFhSDkwa213aitW?=
 =?utf-8?B?S043YzAxVDJ2ekluM0s5RldkMXJranE5ZHAxMjdodDlPcDNEdmZac2Z6b3Iw?=
 =?utf-8?B?V2EwSUtFT3JFVGsvZEc3aEYxMFVzc3JpQUozNEVGYWFXWTBPaTViSlBjM1Yv?=
 =?utf-8?B?R1l1d2F2b2tUV1lBMm1lTDJWTldPZHNSS2xscDBEc0xXYVJ5UndlVWlYUVpT?=
 =?utf-8?B?eFZHbjFQVzJkaFV4YTk5RW0zNU02ZW11QjVQeE9IcXAzRkhyeDZnREJ3S0th?=
 =?utf-8?B?L2FaK2U0TzBMdXJTUmRRLzJzb2dKWXpMemNGZjV6K1ovMEVDOEJwTlh4VlN3?=
 =?utf-8?Q?Vn04=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dU5manJhcTBlME5QSUtUSG5menV2ZUFEU3U2N2YzOGFaek0yU3dla1V4L3Jj?=
 =?utf-8?B?NUh1K1BhWHI4RHorMUFQYlh5S3V2a3JmcFJDbWpabzNhWWQ4STBHcUtkWmlU?=
 =?utf-8?B?d2c4Y1Z6UHVlNVVZU0JpQ2dHekRUNzBWS3pOUWVscEwyTWdYTWRoK2lLQnhC?=
 =?utf-8?B?RVVnMVRkUElqSkRNVUJrS1hEWXdPdGRkY1VQeFVqQ0o5dmtQM0QwTmpXbUx5?=
 =?utf-8?B?NXFDcmFST1E1TWQwVndsMzJ5WXhjcXJzRmxESzNHTWMvUWhqVTMwNFNiU2FI?=
 =?utf-8?B?SXZsR3JzR3ZxMEdWL1QvMXkrVHpIY0JFaHFQOWdzcmxUOUxsUlI2Rzc2ZEpH?=
 =?utf-8?B?K1VVZzB1eEl5dnhnZk9VMTNoTXJQWGxENW50cDY5RU93Wm1JYjBFMHU5US9t?=
 =?utf-8?B?M1V4ejlHRWlQbjFZTEkxMWsyS2Y2eTNwMFpoSXhtNUE5U0hsRk4xNHl3YmRr?=
 =?utf-8?B?NEZSb2xhSENMK2tZKzhCMHU5blhhL05UMmNwRHlkSUt0c1BSUEYxNHpiWjhY?=
 =?utf-8?B?SklLMkVGbzVWZ2pUY295c0NNandaK2xYM004MTZmVWNNNFMzRi84b0FvTTJU?=
 =?utf-8?B?NkZGQ0dDMGQxZktYNk1IMDZkaVl6OXF0cWhvMnN2SmhPV3pZMTJHSFpxZG44?=
 =?utf-8?B?OHoyNFl1NTljU0JrQnhDUzRyRWw5aGNJT3BuVTB2Mk12NUxQT016RThNRm1H?=
 =?utf-8?B?L1dTWFVUOVdsWm1pVUJSV3FtQVFKd3BuRitJbG0vdkt2ZE9Rdk51ZTRoNUp1?=
 =?utf-8?B?RS90c3pjeVZteTRCVDU5eVVZVkZzT09UdVM2RHE2OGVIa09mRU96c1ZDcE1p?=
 =?utf-8?B?bzIxcC93RUVUL2JSVmZBMTgwSWVMbE01WkhRYzFHNENCTWNnZ1ZQNzM2aFRT?=
 =?utf-8?B?bElJbW5NTzJObzJqekRpMWxpWHFFbnZuczRlOG1vdkdXWGZSMmMxZ09nMGht?=
 =?utf-8?B?aHlnOTBIcGdZb2xQZG9hTHRyTzhYOFNYcXgxMy9CS0hJcTc4clA1V2dqYjZh?=
 =?utf-8?B?ZmhZMi9XYzgzWUErd2lZMUc2UEJTRG01alNuWHE3REZzSHFGQkhKYWNnajNV?=
 =?utf-8?B?cUhpckxMZ3FrWEdzN0V4OGJkRGxSdER6UFQ0TUZxSFZjbGRBLy9qdURwMlcr?=
 =?utf-8?B?Q2piTzl4UHRMU2ZHdmJmaFgrLzNaVVg4YWxaMFZMRysvNTZBWjkwVEE3WkVB?=
 =?utf-8?B?STM4MGV2ZkVTcFlWTzkzL2J3UWhOQmtqeUdic2JMcml5dnBLQ2NEUFJ1SFZQ?=
 =?utf-8?B?YjVkSDZCMTVGczR3ZytNSENmK01HR0RFOTd2aVU0RlVJU2QwZ3dveFpGSTcv?=
 =?utf-8?B?UU9GR1h6Slhzck5vTnc0K1QyOXlyY0gzS25IQncrTG9XNEUxVDhRMFd4VjlI?=
 =?utf-8?B?UHlvSkVMM3FRa01WNmlsajZHREt6S1RGVWF0MXF3cWlxK2xRWHFhVmhWTHZh?=
 =?utf-8?B?emNZU3dZdHk5a1ZDTmVtbXpEMXZUeTQyQm16UmFZOGtlZ2Jvc3ZKUVdCMy9R?=
 =?utf-8?B?WW93Z0RleGJpcGFMYkswV3I5T0Vrdi90NVpwb1FuYmtReWtxbFg5azdPTjNJ?=
 =?utf-8?B?clVMQjVMT0pCUzBBQzVBdUlyUlVRNzdzVExCNGNhVXd0ZzFsU203LzdDMTli?=
 =?utf-8?B?Wm9rTVlFNmVJWkFLMUorMVp6S2d2elZDQ3FWM3QwSVRHUGpFUU00djRDMVZH?=
 =?utf-8?B?NEVDbGQyNUdLQ0RNaVBvdU0xK0dzZ0FNZmp4QTBSRFpHbVcrU05RTGFjbHBK?=
 =?utf-8?B?V1V3L20xV3dUQUQ4UnUrUGNSSSs4WVpXQlBDSXJKTjJQWm1JTEtBSEcraDV2?=
 =?utf-8?B?TnpUZzZnT0cyS3ZyTWMrTUh2bnFWNkZrRGhFRXhhZS9QQ01OVldDNVhRWnM5?=
 =?utf-8?B?b3ZwcC94YzJmQ1VzZVJKOXRCM1h0a0RnazBQRmRWYXV5RERETmpDS1d6Wmdy?=
 =?utf-8?B?Z281b3dRcHFSRGp1M1AvRGlOY1J4Q2FUdGhEVnhKT3dlRGFXWjhxdE1PSjBX?=
 =?utf-8?B?Z29BOFZJNzFQRXMwMHFQek5QNFowaGNVTFlYS2k1Znp3VmRxaEZIZmU0aW5H?=
 =?utf-8?B?VldibVpzYkQvdzVqMEZ1MTlZN1piWllKYVFJMmlLUnFhdHB0UndEUzM0bGdx?=
 =?utf-8?B?WVdXNlFHY3FMakFtNWpuMzZ1YVp5bmJmMXdCNE5LZVIrZ0ZxdXFRZXlMUktk?=
 =?utf-8?B?dGJBVk9aci9xbmE5eXRPZHVXQVZXaWJkV1Uxa3p6T0g0UXJLK2dGbHluWmVL?=
 =?utf-8?B?blp0SjB2ZVl3TlVrbzRSNnI2SkZoNTFEUGVtUXhwdVFGblZYR21BcnREL0FF?=
 =?utf-8?B?K1kxaCtONkhKN3NSY21ON0NESUI4QkFsVDVGdExrWFlucGR6SjhTdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b36ff1f-84aa-4f76-4037-08de73e3e6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 20:33:00.2556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xymwcCp8MUAVBBC7kN+UMzVA1OIo2j+3375eAcP6OINq67IMMN1Z5SdMMYq9oDUqEJ9wjdYu6LWNlaQ5JPk9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7370
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32152-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.982];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FDC718C668
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiAxMjoyNyBQ
TQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gQ2M6IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlq
DQo+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVs
Lm9yZz47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29u
DQo+IDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2ly
aWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNodWFoIEtoYW4NCj4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGRv
Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6DQo+
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+DQo+
IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hl
biBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nDQo+IGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0
LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gYnV0
dG9uDQo+DQo+DQo+ID4gUmVnYXJkaW5nIHR5cGUsIGl04oCZcyBuZWVkZWQsIGVzcGVjaWFsbHkg
Zm9yIHRoZSBpbiBwYWNrZXRzLiBUaGVyZSBhcmUNCj4gPiB0d28gZGlzdGluY3Qga2luZHMgb2Yg
aW5jb21pbmcNCj4gPiBwYWNrZXRzOiBub3RpZmljYXRpb27igJFpbiBhbmQgcmVwbHnigJFpbi4g
QmVjYXVzZSBvZiB0aGF0IGRpZmZlcmVuY2VzLA0KPiA+IENvbWJpbmluZyBjbWQgYW5kIHR5cGUg
d291bGQgYmx1ciB0aGF0IGRpc3RpbmN0aW9uIGFuZCBjb21wbGljYXRlIHRoZQ0KPiBpbXBsZW1l
bnRhdGlvbi4NCj4NCj4gW0dvZXMgYW5kIGxvb2tzIGF0IGdwaW8tdmlydGlvXQ0KPg0KDQpUaGV5
IGFyZW7igJl0IGNvbXBhcmFibGUuIGdwaW/igJF2aXJ0aW8gcmVwcmVzZW50cyBhIHNpbmdsZSB2
aXJ0aW8gZGV2aWNlKHRyYW5zcG9ydCkgbWFwcGVkIHRvIGEgc2luZ2xlDQpHUElPIGNvbnRyb2xs
ZXIg4oCUIGEgc3RyaWN0IDE6MSByZWxhdGlvbnNoaXAuDQoNClJQTVNHLCBvbiB0aGUgb3RoZXIg
aGFuZCwgaXMgYSBidXPigJFzdHlsZSB0cmFuc3BvcnQuIE11bHRpcGxlIEdQSU8gY29udHJvbGxl
cnMgY2FuIHJ1biBvdmVyDQp0aGUgc2FtZSBSUE1TRyBjaGFubmVsLg0KDQpUaGFua3MsDQpTaGVu
d2VpDQoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGwvDQo+IGluLmNvbSUyRmxpbnV4JTJGdjYuMTku
MyUyRnNvdXJjZSUyRmluY2x1ZGUlMkZ1YXBpJTJGbGludXglMkZ2aXJ0aW9fZ3Bpbw0KPiAuaCUy
M0wxMyZkYXRhPTA1JTdDMDIlN0NzaGVud2VpLndhbmclNDBueHAuY29tJTdDNTlkOTQzODUwMDU1
NGINCj4gOWQ2YTVlMDhkZTczZDI0NmNiJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2
MzUlN0MwJTdDMCU3Qw0KPiA2MzkwNzU1NDQxNTMzMTc3MjIlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKRmJYQjBlVTFoY0draU9uUnkNCj4gZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9p
SlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEDQo+ICUzRCU3QzAlN0MlN0Ml
N0Mmc2RhdGE9N2ZjeUdZNktWdVJxVElpdmhaYk00UEs4UE5UQUxJJTJCU2NPZnhNDQo+IHlhUFZo
OCUzRCZyZXNlcnZlZD0wDQo+DQo+IC8qIFZpcnRpbyBHUElPIHJlcXVlc3QgdHlwZXMgKi8NCj4g
I2RlZmluZSBWSVJUSU9fR1BJT19NU0dfR0VUX05BTUVTICAgICAgICAgICAgICAgMHgwMDAxDQo+
ICNkZWZpbmUgVklSVElPX0dQSU9fTVNHX0dFVF9ESVJFQ1RJT04gICAgICAgICAgIDB4MDAwMg0K
PiAjZGVmaW5lIFZJUlRJT19HUElPX01TR19TRVRfRElSRUNUSU9OICAgICAgICAgICAweDAwMDMN
Cj4gI2RlZmluZSBWSVJUSU9fR1BJT19NU0dfR0VUX1ZBTFVFICAgICAgICAgICAgICAgMHgwMDA0
DQo+ICNkZWZpbmUgVklSVElPX0dQSU9fTVNHX1NFVF9WQUxVRSAgICAgICAgICAgICAgIDB4MDAw
NQ0KPiAjZGVmaW5lIFZJUlRJT19HUElPX01TR19JUlFfVFlQRSAgICAgICAgICAgICAgICAweDAw
MDYNCj4NCj4gICAgICAgICBBbmRyZXcNCg0K

