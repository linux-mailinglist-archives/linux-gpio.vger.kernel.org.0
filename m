Return-Path: <linux-gpio+bounces-31572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHxhOHuSi2kmWQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 21:18:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BD11EFC5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 21:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CCD5304A9F1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 20:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EA52FE07D;
	Tue, 10 Feb 2026 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lx/4sedU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029572C0F72;
	Tue, 10 Feb 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754676; cv=fail; b=fMWgDmPieGCH0Z75QhPR6NtoveTFg1i8wqcQV9P6gZvOeSAwCVxkY3y/vEyd7IzsNfT8sTwyGXz77jztoDH5M5g+p61/DHw8vIXAqlm1s0q/2rl3nohyhQubRRzMS4O8hlsRCQNCjBl5d9xowyNxpE5NabiXPmhcDA1KkHMXygw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754676; c=relaxed/simple;
	bh=kwWDwRfbL2jo7ACYI9ActKjwnK9eGQRwUDQDU/arFlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SpT3azSxKAtL0FW2t6L58xbeuXfaOsqgtE5NgVD1+WpIOO8g1TkHpzOV6Qfpbdip9kih7Jn+NoDS2T1EQBzUpS8QCVFWlp1Mt+U+pxByLAWsLUu6atmp5PaxVC5eaDs0Sq5aIhNHGEjs/mt/cHCubYy6pHTrk8KJ7Eu6v4W8+v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lx/4sedU; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwXi6DWEG6D5ItkmkQH1BSemwrWHcXaOYoLz/TMxs9t52blr7q0GH5vQl6UPabb4Is+M+k2muEstY1jNuYh2c60+lMZSlAUt9qpEij+b1hoT02PiyIJIZ32GIqzcjikgX1gbEXPsC7SCBZEjYQtDzLcyTqp/2jdHfZF43vMNcmPuXkXcu8LORTF2nDVSMs1xm/JtN66wiP5B3BejFAz5Pj/ZbSnH+GZYbI8qckRdueK5bZdv0A/0NUL2sozhKCr1eGai8dO1f6JbjMav2Gzrkc4bjBcHmryUXG/VvT1q00fj/XBmDsQ81Nt36OzOInSsBd+n6WorMVPcLdYyio2VPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4wZR5ehDqUjWprz79x5djxNKWFhB8fUQTzXKzdEOas=;
 b=iAiJldXKwOcNXym1xHDA4MUzwu888/AhIQvJUwlym85JIm1WlaCvWlYKxmCPnr/R3kdYOHPWXqTZWIgigrS+DkEbwduWRLtvGg8teHSPPb1ed9utXVVQocRrJXQHJljb2WkUHXbcSQ1Gv6a4ZZ8mN91ggLNcXtuV/PEyXlgmRrjyefBemtoUJo+WqK/AiIXPEPygFjyqF60k81TlI+1Ea/9E12IohfbsFKplUDR7mu5/W1uShi2m5NH9q3eftvkCRLfHn+s83iL9WvlGRJ8Gxvv+2ar0Hw9x9WyxOwaDirAsDYcIQS5sJ7JueywNj2ZuA0ND14HWcudDDjAuBL34sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4wZR5ehDqUjWprz79x5djxNKWFhB8fUQTzXKzdEOas=;
 b=Lx/4sedUQMby4Z1Czk+1JZ9eAUtLPswhdZGwBOJSJdHGhMqLvGHGbOdI51YdEBkpHhqweWpPufms6pTzNpTZO3NPBKkoAXVQfp3abjHkxj1Nm5gW3/Y/Q57xRcPhUo0ASB1b0LrCjGuamWLhN98yyeuw4HwO+VUaaTV95sCOu2wOH7/HcmgttXknDGuBGVwGolytVWlEYuAvKnMtCDR0v0PIXYDOLDEtlkHcn8pvkAAehyZdre/1S92vNJw3CjRi5HWBBjG199yIkPCy30R3RJM98s7rWXcv4Zkth/h96bKM7yt+345tQ7e1/KhC4WzdPUSChJBIJLKgvTkJGpK8eQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV4PR04MB11731.eurprd04.prod.outlook.com (2603:10a6:150:2db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 20:17:49 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 20:17:48 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcmspTAlo/LgruDEqVcAP1TVDC8w==
Date: Tue, 10 Feb 2026 20:17:48 +0000
Message-ID:
 <PAXPR04MB9185297C477DCD1929A78E4F8962A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-4-shenwei.wang@nxp.com>
 <5158fda4-6bf6-45b8-bbe0-8b469066d0ef@lunn.ch>
In-Reply-To: <5158fda4-6bf6-45b8-bbe0-8b469066d0ef@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV4PR04MB11731:EE_
x-ms-office365-filtering-correlation-id: a2228597-eafa-445c-b231-08de68e175e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?skqeKjo9Rb82xIPw2cQoK5vzhBR2hGUPtE4LFZSMy9Tj+3CjGWJ4QsAAyWWA?=
 =?us-ascii?Q?GC8xTjzhucldlWbYFk9q43RiGUi0H7XIEeqgDZJQYtyB4w7IPerh3ZKWMFML?=
 =?us-ascii?Q?/8pTBk5dZhBqb3Xs1gUhQkbIDuusZj/TX5p55+ECJf3qnmEYy02FI1d8yCMh?=
 =?us-ascii?Q?Z+YSU6Bq+6muPj1jjmLnzpK+GJGQhlhfs6nEYSU9KW8FwmpCtL9mKl5l+YEf?=
 =?us-ascii?Q?yRyvGuHdKbq8ksDwDFA/U4K01HFenc1+s7WNH4MEqngzREs/zLySrPvbd5NQ?=
 =?us-ascii?Q?lBadkMupGBc/SkjVoyJ8jlVh/xxNcOPLM46gdHwzImwa9UkBUlr0heE9H5rw?=
 =?us-ascii?Q?NYUx/kp+mG3iz+1FthQQG8uw0wVrjDXq2y6LyRXJopwL2ueRbMZU9iE2QeOA?=
 =?us-ascii?Q?ddAgoYfuwbRBXCYUVmz9lV47mIAFuwAvgy6PeWuqa2wFFaLPvKMvH4092VhR?=
 =?us-ascii?Q?W5xbXv9N8O3FyEbggdWYbTvq+Np8KwlIrfm4kJ4USSveJqs5uc0Rff+9KaW3?=
 =?us-ascii?Q?YIRLG2QW/QchjzNRRzsL/qpiXm2JR5cVlD8csFleI49Ggpdx6u8A0IfYkKVc?=
 =?us-ascii?Q?KCA0mSWeJ2mpuqPG/H0+I/31tQUM2B3BgDBXOiq4CjvXHc3RbNHEXYcLGciZ?=
 =?us-ascii?Q?O/kJCXIJO3HusvivgAZ72eYz45Gte/4wVS20M7ZB2B+N+TUf2vGVxRvRNIMv?=
 =?us-ascii?Q?q+nd4WI+WO/v4ey3UfpTwdyDVgdLwVr+Cfm5ITmjjj0Cc9g7t4Bzqvyx3aXb?=
 =?us-ascii?Q?QxOSPT2FBYeiSIM7yr6rFZdOzcFKEDHCM6Xw29GieHq5BAVaoWOPALNwCPTt?=
 =?us-ascii?Q?oFtRQrgsVeVBeVkI53Bat8EdI/yw+TNlC+yJXhZZM3VXRTRgqJqetCrhAtXM?=
 =?us-ascii?Q?dgtrx7Z3pRnnN3kIC/oWh8UNc9dnbE8Bss8wbW66ZkaRPVVszRT3gRLyRt2J?=
 =?us-ascii?Q?VmsiI1K7i7r0kL8+gAxEQoGVpgb/OmiND15fpcBNOYQcuUGwC1NTMzUFrKNW?=
 =?us-ascii?Q?FKZrC4ySt1qRDG6WEhF40dQbPpthUCjgUwkDaHP7IUgBGclhtb5l+cJijEA0?=
 =?us-ascii?Q?1RFaXVa9w/ihxTZj6Hxto0IBWZgLZSt2VKn2512KVvxR/l0xRXX/nG/nOf4F?=
 =?us-ascii?Q?6sg4LF9V1Fe00tZVmkU+6heZAN9xQR3whMI5NIkbRxvp1Gf8XqJxcNcsju7F?=
 =?us-ascii?Q?1/eLktxnL/6XmK+pBDGgJR+FgS/W+Sl1YiKMlmu7PIApFXQ1FLUbh13YXj81?=
 =?us-ascii?Q?CK1TFZkIActkxXbdmOndhP8dhgcSMAbYCjdDcNEAy1gUlaYlYDz28A1wenv/?=
 =?us-ascii?Q?Al3PssGbDCJzoDqGuaBH2FDU27hZUd4y0Mvfl9q35lZJA92/2wNAWx66FD2+?=
 =?us-ascii?Q?3XmrF+fyZj5wqSBPoSxrP3tQ78DtZr1ElFBONDdxp1Ezb3VlXGbRPbRBhV2T?=
 =?us-ascii?Q?V8X+NPxnrBCxx1+FntXabvWqzTuwXlHhI/51zDhiFBJN9c/zpX7jlgGUktAs?=
 =?us-ascii?Q?OrDY7ZtI5C9j7hd139MAm93ULVyqplbZ2ms77OXAWpfoRR0bl3Fkf+5tDHqe?=
 =?us-ascii?Q?x0DXNqRaP9uv+t5aov21719Acea/j1uwAi0JEoOTyr+LOALlTThhxUZbJ+1i?=
 =?us-ascii?Q?5JgYswsG8ML4WYRxxzr1jlo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TxB8vHDgDC3LtSvrakmfPC1LJl7uP1kNyVQVivl8hK8xTOzAEGzHQR2/U/ds?=
 =?us-ascii?Q?lrF4ZymDIJJ/fcNQusLqqBU/v3ycnr/clPMC8ncthAVEZhyJGadp4mPPo9Gm?=
 =?us-ascii?Q?B4eywReFj9Y5af+R/dt42pv4uRNWPJAVNhB81o4VtW3KC5z5GkhTXTkTXfVf?=
 =?us-ascii?Q?sCx4XVgltgRitKRKCpLtVX/Gtukel8pbv0vdhsCHuLB4XsOeeG/tlSYXMPfl?=
 =?us-ascii?Q?1lf1jCPo0tIAsYIbCFRPRtNavRegzs9h9dOaR+O3ZtDwoEpefPExoNRT5wDs?=
 =?us-ascii?Q?1hvITRuMdJ/R9GbKQY79mg09cbneGI16x1Vj1bYhFXmHN5MEEGqvAGJXXjmL?=
 =?us-ascii?Q?BNWusPCcV+mPa4UeUbHtUxLEDurWB+kSF0p5c9EaYqSkuDomzFG1Ts6+luTw?=
 =?us-ascii?Q?EKfSBJwTKE1Ib6kqguIbde1AsVjOHq5FiJluufTjmbIWV6ppgbLIwmZpBwFT?=
 =?us-ascii?Q?p6bY75fno2v4Kfz7jpI9wcv83AfXoEMlmy90xtOr8ULL9fiqpsvAIuH4+jwb?=
 =?us-ascii?Q?5C8f+oR6X1D5VEY2j6P02IIA5/OT/fBGdrp0YFfoBjDxR1njmlaZpVIqUCDK?=
 =?us-ascii?Q?45mdgTd5cPCvKF5XqQianp/iW46FwQCBQ7uKe04l+5a/sgkjFD7zeQckKgBA?=
 =?us-ascii?Q?Ws7a1bAGQBNaYNnNMJ5k1pQlwSJByfaGU28+y9qtwoQPA7bDg/LLyVEDpUot?=
 =?us-ascii?Q?SQKW/nUVT4DyZEkOQMyc6bmX1NW9DaA19z7bdZ4r5nnmtVhAYOtSFvIlndsL?=
 =?us-ascii?Q?A1FpA2iVlM0M4osQJwJe2o1ZdqsdykBfeHVcVI2MfN8reZe/bf/3DjncKO0B?=
 =?us-ascii?Q?8Nyclr42N5J+HyZJBZneYP1kgahhV5BV6UYGBHDN+ysSXETMneP1/xcfOgW0?=
 =?us-ascii?Q?c88LlesfkyTI7RcVYWBSvh1oXzsew0h4OGLXkjttY1tZx3dQEhhMGETWc421?=
 =?us-ascii?Q?vinxmXcBWHYIqmMlIYDrLD83e3H1yXIs5sLt+NMOthDF2PMya50AhsIWCJMN?=
 =?us-ascii?Q?pUG4PTUuQtWFQ71+Bdx7grTe5ilZkblws9XG/nKCymjNTsuMv0/3HbZFbdeE?=
 =?us-ascii?Q?A/kgf9DmewGlg2DtVmC4EBg2fWCoXBlR2kgRydJ1oY9eOmGfG1QTJCBRDhfw?=
 =?us-ascii?Q?gKYBjd4+RSAQwZovX07HB6CuoNszv2vNelI/rnN0hPcV+Uft62R1jhdrb/tW?=
 =?us-ascii?Q?fHDy0a+hs69KckjVdrkKWeACsf/OjTi1EcI+vvbOGpbI6Laf8/jZANvRZeD2?=
 =?us-ascii?Q?X9UE04xdRDp5EXuOljJEI10Su/wD3YEYZJs6dvpe6RT9XB7bMlbp2FoTaigm?=
 =?us-ascii?Q?UcGg5jCB2eUfD6mGErQWgbRhfTaZ6cgChx7GD8P8jGv8i5I7h0QtP0pOb0vb?=
 =?us-ascii?Q?49/91jIqYqYU7O6L8Pcv4m7jtAOh9OaSbWsDdD1pPPNOWReFnGT279hUEy5G?=
 =?us-ascii?Q?Q4guzB5/FABjlTjXF81HgKkhpIrPkGux8QdgfdRz3mSChAA3kE45xA7QSoZ8?=
 =?us-ascii?Q?U5DpAHsuCUszC2ZeeqA9blXMSJEOba2Kem9hY9bxDpHqgeKoBwRv+tE1aKnv?=
 =?us-ascii?Q?Dy4QlOsh/425dYgh0TppJ10K3Tuc8Pfuzu6sfq870yLo5aCMnepDJuPl9KF2?=
 =?us-ascii?Q?oQmrFJsF5mC/slKoMfJ6NGe47AqZTMIZR/sComQFCGI1tK1DCwy9MWbBrfSe?=
 =?us-ascii?Q?qVYu+ovppa89OpkGKWLHwSr2rTNPtHtDuQoGy32pToNpyNDl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2228597-eafa-445c-b231-08de68e175e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 20:17:48.7464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bL/If7ZcbEOli0zetzfSEsJCuHWz5vySvjPJmslKeJwwVLQu5xPPZ2a51vLUPo0nIjRi6JrfADKklW2Osk1V4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11731
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-31572-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,lwn.net,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A31BD11EFC5
X-Rspamd-Action: no action



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, February 10, 2026 11:48 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Sha=
wn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-gpio@vger.kernel.org; devicetree@vger.kernel.or=
g;
> linux-kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> arnaud.pouliquen@foss.st.com; Bartosz Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO dri=
ver
> > +#define GPIOS_PER_PORT               32
>=20
> Maybe this should be from DT, using "ngpios". The Documentation says:
>=20
>   Optionally, a GPIO controller may have a "ngpios" property. This
>   property indicates the number of in-use slots of available slots for
>   GPIOs. The typical example is something like this: the hardware
>   register is 32 bits wide, but only 18 of the bits have a physical
>   counterpart. The driver is generally written so that all 32 bits can
>   be used, but the IP block is reused in a lot of designs, some using
>   all 32 bits, some using 18 and some using 12. In this case, setting
>   "ngpios =3D <18>;" informs the driver that only the first 18 GPIOs, at
>   local offset 0 .. 17, are in use.
>=20
> Just because your hardware has 32 does not mean every vendor does.
>=20

32 just represents the maximum number of GPIO lines that the driver can=20
support, so there's no need to declare all of them as in use.=20
Adding support for the ngpios property is a good suggestion, and I'll inclu=
de=20
this property in the next version.

> > +struct gpio_rpmsg_head {
> > +     u8 id;          /* Message ID Code */
> > +     u8 vendor;      /* Vendor ID number */
> > +     u8 version;     /* Vendor-specific version number */
> > +     u8 type;        /* Message type */
> > +     u8 cmd;         /* Command code */
> > +     u8 reserved[5];
> > +} __packed;
>=20
> I still think this should be a clean design from scratch, and you modify =
your
> firmware.
>=20

I do need to take the existing constraints into account. It's always ideal =
to start with=20
a clean design, but I also have to maintain compatibility with the current =
products in=20
the field. The approach should break what already exists.

However, as the companion firmware is updated over time, the driver can be =
refined=20
accordingly.

> This data structure is 10 bytes. Are these all needed for a generic GPIO
> controller? version, type, command and one reserved byte seems like enoug=
h,
> and it is then 4 bytes, so there is no need for __packed.
>=20
> > +struct gpio_rpmsg_packet {
> > +     struct gpio_rpmsg_head header;
> > +     u8 pin_idx;
> > +     u8 port_idx;
> > +     union {
> > +             u8 event;
> > +             u8 retcode;
> > +             u8 value;
> > +     } out;
> > +     union {
> > +             u8 wakeup;
> > +             u8 value;
> > +     } in;
> > +} __packed __aligned(8);
>=20
> This then becomes 8 bytes, so there is no need for __packed or __aligned(=
8).
>=20

Even though the struct currently evaluates to 8 bytes, that doesn't make __=
packed or __aligned(8)=20
unnecessary. Because struct layout and default alignment vary between compi=
lers and architectures,=20
these attributes still serve specific purposes-__packed ensures there's no =
internal padding,=20
and __aligned(8) enforces the external alignment. Without them, the layout =
may not be consistent=20
across toolchains or build configurations.

> I don't want to force this, it is something i think which should be discu=
ssed. Do we
> adopt your design, which is not so nice, but at least has one working
> implementation, or do we do a clean design?
>=20

I'd lean toward getting a working solution in place first and then improvin=
g the design=20
over time. This approach lets us ensure functionality for current users whi=
le still giving=20
us room to evolve toward a cleaner, more consistent design as the code and =
firmware mature.

> > +static int gpio_send_message(struct rpmsg_gpio_port *port,
> > +                          struct gpio_rpmsg_packet *msg,
> > +                          bool sync)
> > +{
> > +     struct gpio_rpmsg_info *info =3D &port->info;
> > +     int err;
> > +
> > +     reinit_completion(&info->cmd_complete);
> > +     err =3D rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpms=
g_packet));
> > +     if (err) {
> > +             dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err=
);
> > +             return err;
> > +     }
> > +
> > +     if (sync) {
> > +             err =3D wait_for_completion_timeout(&info->cmd_complete,
> > +                                               msecs_to_jiffies(RPMSG_=
TIMEOUT));
> > +             if (!err) {
> > +                     dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n=
");
> > +                     return -ETIMEDOUT;
> > +             }
>=20
> I _think_ you need to handle negative values of err. It looks like
> do_wait_for_common() can return -ERESTARTSYS;
>=20
> > +static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct
> rpmsg_gpio_port *port,
> > +                                                    unsigned int offse=
t,
> > +                                                    u8 cmd) {
> > +     struct gpio_rpmsg_packet *msg =3D &port->gpio_pins[offset].msg;
> > +
> > +     memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
> > +     msg->header.id =3D RPMSG_GPIO_ID;
> > +     msg->header.vendor =3D RPMSG_VENDOR;
> > +     msg->header.version =3D RPMSG_VERSION;
> > +     msg->header.type =3D GPIO_RPMSG_SETUP;
> > +     msg->header.cmd =3D cmd;
> > +     msg->pin_idx =3D offset;
> > +     msg->port_idx =3D port->idx;
>=20
> Why is a function called gpio_setup_msg_header() setting things outside o=
f the
> header?
>=20

How about change to gpio_setup_msg_common()?

Thanks,
Shenwei

> > +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio) {
> > +     struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_packet *msg;
> > +     int ret;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> > +
> > +     ret =3D gpio_send_message(port, msg, true);
>=20
> If gpio_setup_msg_header() does what it sounds like it should do, what is=
 setting
> up the message body before you send the message?
>=20
>         Andrew

