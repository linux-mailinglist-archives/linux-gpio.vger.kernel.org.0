Return-Path: <linux-gpio+bounces-40078-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FoZOEOmIVmr18QAAu9opvQ
	(envelope-from <linux-gpio+bounces-40078-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:07:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55175819F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:07:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=VzuQ3YrS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40078-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40078-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D97631510FB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 19:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57C44C6F04;
	Tue, 14 Jul 2026 19:04:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF7445AFC;
	Tue, 14 Jul 2026 19:04:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055863; cv=fail; b=TZRpprJCfieZm/kmRdE+UGhlBaYRP5qiozRpC4SZ6jzN2nwqVLHKTziVj8W/v80zvTnBKJggcvRO3/MxENDj8Cr3oY9ou+u/mlamc53WyHagRGwD2uQI6yfnifxFCI6weXAtNO0vviHp5BgPLV1YOvqeo9iKYQ6phzZdSTu6Qx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055863; c=relaxed/simple;
	bh=d2q+awOc96mR/+WZiGLFt8owLdiHE3pVyFNFajLWHmg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aBXTvtBZwMf+QqmignF+/UqtImR8Lwb05zsiGWZvxHS5jGRWFWyPoBJA99zYYRv7h2b8UXeMMjoVW9ODapQQw73DEnjUk94KALpiUvvk8sqtbVO5f47MNRGIcRlvb3zRVA0zyp2O8IwLRIYe8TRwT5T1t8lNwHEPiuvCIODY57Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VzuQ3YrS; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsZ/yWDRb3bNf2JZvDRcNraztLZRvthx8Gf/qlobCrAkgSou0Qs8JFV8zWCAa3/ibd8dZgShUOjsx9VsPozHT/TdjnUZjo+gHgGObXhXylC5UPncPYJz8Ednj5Rf6U8CoseredPXiYFsRJCOy96/94bbnFkFoIBHeS5Lj6dmlo0zbvCfl+/adFEv37wTNytocvkfGUruxTFSVJG1h1XXizXakW1Lg2yPuMDZXdt9fv2xqOgJpHPA8dxOyCdz0V7HQbCSEzdku3aSvALfM2H9uCYorCSV35OOSseYElZqjiChRs0kuFVRI9fEOGf+WBqXbBf54zwmtIB7IKTdF1gjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWc34plD7LITbpAEnDxcw/AuXqrg6UcPptcYyu0lPAc=;
 b=nC2BJqlN0qKYh9afH5P97OIPKI0omuvDzHgcqrEd1pWEtMNaFtzITlxnTflkQKIQLmdLjssZ3KKPq4OmMU8Iw99cvyQFD4SeZdmxEIkW5sF+HIW6cozq3IGgY8d4wAvIWx1owSLlFwwdeFGZFGJAcHn6n2H6RwcwIPYPyNZG4/ErK7OXWQ+pSUhCZgZsP03ujAVszVOhd+i34wHld9L8CBc4/Y8dSFdwM8bPfYrazCXgAVDuTKICAz0gU6ZJhckWboGOZZ8XzyWWmQlAkgKkj6pjUmrdeAy70ENts/g7q76SVuyRqHK69a5HQOhOpd6rIzhO95EwkShasfC9r7qzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWc34plD7LITbpAEnDxcw/AuXqrg6UcPptcYyu0lPAc=;
 b=VzuQ3YrSI2w6MUSCu9r8XPLjrL5Bz0OTrbc7/62Nv3Vx8nl38TXKTPhT6p3QB0X2ZmPN9Ri7NI+EDi/myd38dm4nmgKK/5nZFzdyfcb9NUv1BrtvxEtcqYE06FaIlY1Pgj8TAK9ShXEV3FmXRDFgti0cy7TTvxJB2CpKCrBhtnETMVLpJIuvzvmnWSmU5sfGF/iCsVI5/eZhN4MSnh+cwdqVXSjPX66RgMxCufA3mF/Q1KpVl3EdU1ZVK44C1xE4MaSEiDtezQbF5gyGlSEUln4BtFAEuzQdewO5Ev+t25Dv78y2yUH7Wd9+HIfaeO9SsiI/Gn/FbhJHoxpC4sr3Dw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 19:04:09 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Tue, 14 Jul 2026
 19:04:09 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdE8OM5Pma2BJDKkCxecbC057kzQ==
Date: Tue, 14 Jul 2026 19:04:08 +0000
Message-ID:
 <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
In-Reply-To: <alUdg9iTysXCFUa5@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8619:EE_
x-ms-office365-filtering-correlation-id: 81f697b2-6ebf-47ed-4b0b-08dee1daaf12
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|38070700021|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|3023799007;
x-microsoft-antispam-message-info:
 q2fOOLnnfCik6wDK8HNfIOvYT8Kg/7Wipaz5GoqOiBNjsrZ78jGhel32YmyCIoH1Z6tGjSnMdH8cX4eNabA/WiKQ4caaeWGRLXRe3euMmKRYVKpNJTHhPvjfWcRa3Iu4TWmHF9u4N7w1SL6WRYSqcGZPZc/thMhfksYpOzuNESToM8UBaruBBlY7CIiFZq9o3G4pJaLRZwSd8EgsxNJfIL28kc40hhripNQhg/IZh6mjtidmVvZEGqUWHKOV5ifKZvcfSvshE3x1kSWk2mvdrAEs3Qfdes3V+dJJXlgXac60vd+8GfYe8Ww1prfiQusIpegptB7qwzhwbm9ICMdYEjLfpStutOD91LzxMhl+Qwh+y2emYT9jwDGe0MHXfPrw4D3kOvliJHqF0HoKRxm/OjiWcXWgfB4QkO9PelMRAwhWt+Clknc087UQdOrfTg+Q/TDOli8G/nUfejknbB3Zpsp4jE/4zFamvgJJR230q6h54GAdljcv2kmGs+Q6ggTTgGC1FRdO9lsj9bgUvIgFHz3aPOtlCtiWHs7RSKWND8yV2P6xtHhSzN5zLznOPkxcW8+nWV/LSLlOqnPtDlCPqxQsUpwLXqMdPFw01apKJfsymN6dtlORHrSSUOE1bg3AfKXfNFLDv5gHZJhdjT5MlNG1enDlah42MnvUQOPJ29pIvxoLKqlrgwTzRaSxNzzWPCF3vhPz5tg3+R+9ZPKsVuLbfVr0yrcSbPqBarLcxBo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1N9FwYfVJRePMqYbI8cUdofuFpOQJNiIGoa9Vv91nP6X+b86UyXdEqkKMvGk?=
 =?us-ascii?Q?wY2ikyuWHydUJAZ6TzTHSU/m+GJ9UlcWaM+3su2DX6DoTBYdiZMZTNqWsuLe?=
 =?us-ascii?Q?gBdn90c5QOEsWFyDUBjijsqsA02TUrXX0pEUouhYqGmxd+vd1UyIEbBIdRa6?=
 =?us-ascii?Q?fpfwL+PkH8tqhNUqoQJGBEBkZ8wQun2me2exc77r5iSAPhMO1j0kNl0eD48Z?=
 =?us-ascii?Q?UP7Vm07woULaLoxQ57xzZcL4XJoDIy0NMxioQgi59VXBUsQ47o2kRpveaMJj?=
 =?us-ascii?Q?s196PCti4Mk/kTcGk7p8oyxOaiB6AN5Ajc7FXLgR3Sv4fV+HyNn9/5hd7UbS?=
 =?us-ascii?Q?Er3jN1YAnW6hGaiicCIiUiUCTGYZVVPcu5Pa+SpUTXWwRMvtozOGGJKBunbG?=
 =?us-ascii?Q?v8K2VwpNIzR2XSTtKA9fo0mAxQk5oGCWodjBCLJq9ZYgQYZp8j0l7uKd+dw2?=
 =?us-ascii?Q?K51Ru3dc+5sWmBj6CgZRA/Qpc44uAl0jb3LO+9ey6CIuSFW2GRDrmPcG1hW4?=
 =?us-ascii?Q?XL4RBJzNQEIfMstOIvNqvVEu1zvUs2HHP4vT/W3m/86RsAUi6UMqT6n0pkHA?=
 =?us-ascii?Q?3osmtRlX8dqOpqKQagH9b4E7LFAiyPD6j3HAiXHsinUsQ/v859PDPrlub+CT?=
 =?us-ascii?Q?o1WvHArXzyoT5/MSen15kPDLoR2BJDoaoav7pGmr1+Ocy9U/m4n1MFdC9xjw?=
 =?us-ascii?Q?reZpDqw6UHvAf18OQhJtvX8tRvvjxIi1UOGzFWR76f/DuYzow2eiVLyxzhsc?=
 =?us-ascii?Q?1DPadaMmgLr+tilgHHHFr3wx7jPkWzIrEExN07x2Utq4OGK7amyNmz4uwaPW?=
 =?us-ascii?Q?AzNv0bjOqupsS0uvFxF2FjDPUvJa/4BMu+1o4ZW0WxyaAp4GqGviRSrHAwFP?=
 =?us-ascii?Q?TWDhqOs0NIIVhzCmuhI3IPZJAgqMHkQD/p1/pNx+peZZNcK6KrC4w7ekHmJp?=
 =?us-ascii?Q?lBPAc9gfw3QgVZG4BioHuJXIGwrTJx8Dq1lPqL8ypf3vIyGS82o7sn8Eug8n?=
 =?us-ascii?Q?qyT+yA9BT77ngskru5a6On/IExNFJ07MAXTCqO0iIDmc0wMaWRlTPK66KQgp?=
 =?us-ascii?Q?jJ+AtNJucR/UON9dWk7r3ndgD/Uq5mcTcoXShJMmpkhKt3XHZY1T4hYEjPNV?=
 =?us-ascii?Q?to6tp8NNVlvadjJyb9v2MN7lDEKY4oLhtnh4Iq8ugPL18sOVv8/zSJoxS9m9?=
 =?us-ascii?Q?9ryqJIi2mQKqdBpH0EUdl+VEUR7+GyldHnol/S6mgPDCPGQG/w32Iv1tO8FZ?=
 =?us-ascii?Q?IlYkreT4ywoPQLkHdzCUCmqKWpULAqklQMgdW1ojahDwOhLRsoG/uk/odzoD?=
 =?us-ascii?Q?0UGA1CxbKQ3R5jJLGjvHUVcszMp10vMDgLpjTlLV9jyuRvMtJbRI7a7vJ6ow?=
 =?us-ascii?Q?+e0qCVszp3DOVVqpK2zUsC7mY0Tfiyf/RwSImD7DLgVslJOF+WLDnmuCD3dn?=
 =?us-ascii?Q?ndcKxcpFGwFbuxLAtqVA8Qy0+nmbe8nZBrF6Flm0XXW0jW8iwYviPsKWO589?=
 =?us-ascii?Q?c9agzM411vMkrgqPCMIQBPQwklzdrZ1Y5ms3S1Qt78nF/QuI3swPP2ZOyvzR?=
 =?us-ascii?Q?U9xdS3xXAE0z/8z9vdgQDOs1z206Y5OqCDcbPDOTPgurRn6KeuNqMWGYaBTQ?=
 =?us-ascii?Q?ywg+ZigE7XfaCxOC3YMsbNKGSa5w2GFXZTHlkJpvZm6NayaEpv2a0grrCzQA?=
 =?us-ascii?Q?sDqPkY9KF8j/3VK8NCjPBhTu20JTo9C2nb+vtyg02qoN57X2qK4p2FKfxP5T?=
 =?us-ascii?Q?YCKgyICY9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f697b2-6ebf-47ed-4b0b-08dee1daaf12
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 19:04:08.9275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcHfkZAHCi4UMv+H3KhovtF8UQtlpG7qHUmpXt0swtXDOiXeO2KHc/uFC42y0ZKxYcdUycU1o6HJC6wlUtakzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40078-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD55175819F



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Monday, July 13, 2026 12:17 PM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hau=
er
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> <andrew@lunn.ch>
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> > +
> > +The RPMSG message consists of a 8-byte packet with the following layou=
t:
> > +
> > +.. code-block:: none
> > +.. code-block:: none
> > +
> > +   +------+------+--------+
> > +   | 0x00 | 0x01 |  0x02  |
> > +   |   2  | line | trigger|
> > +   +------+------+--------+
>=20
> 2 things here:
>=20
> 1) You did not include messages that mask and unmask interrupts at the dr=
iver
> side.
>=20
> 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this=
 whole
> protocol should be about thar:
>=20
> +------+------+--------+--------
> | 0x00 |       payload         |
> |  Q   |                       |
> +------+------+--------+--------
>=20
> Q =3D 0 requestq
> Q =3D 1 eventq
>=20
> The "payload" part is simply the format of the messages as found in the v=
irtio-
> gpio specification.  From there, the only thing left to mention is which =
messages
> are not supported, i.e get line names.
>=20
> > +
> > +- **line**: The GPIO line (pin) index of the port.
> > +
> > +- **trigger**: Optional parameter to indicate the trigger event type.
>=20
> Not part of the spec - remove.
>=20

The two fields above are required for rpmsg-gpio, but not for virtio-gpio.

In the rpmsg-gpio case, interrupt detection and handling occur on the remot=
e processor. The=20
interrupt information (such as the GPIO line and trigger type) must therefo=
re be sent to Linux=20
through this notification message.

In contrast, for virtio-gpio, interrupt handling is performed on the local =
processor. Since Linux already=20
has all the necessary interrupt context, the information is not needed.

Shenwei

> Given the refactoring work that is still needed, I will not look at the
> implementation.
>=20
> Thanks,
> Mathieu
>=20
> > +
> > diff --git a/Documentation/driver-api/gpio/index.rst
> > b/Documentation/driver-api/gpio/index.rst
> > index bee58f709b9a..e5eb1f82f01f 100644
> > --- a/Documentation/driver-api/gpio/index.rst
> > +++ b/Documentation/driver-api/gpio/index.rst
> > @@ -16,6 +16,7 @@ Contents:
> >     drivers-on-gpio
> >     bt8xxgpio
> >     pca953x
> > +   gpio-rpmsg
> >
> >  Core
> >  =3D=3D=3D=3D
> > --
> > 2.43.0
> >

