Return-Path: <linux-gpio+bounces-31874-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAAMHok9l2lBwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31874-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:42:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B884160C36
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82948301A929
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4CF34CFD7;
	Thu, 19 Feb 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ENlzxWhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619C14A4F9;
	Thu, 19 Feb 2026 16:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519352; cv=fail; b=AZMlw9mGUSwj4xI5y26VZ7HL93Iq5gI/KKkPTxJ9aVA0V8LfAlPJtooSigUjPBZp4qMjmRZxsgHm9XnzvXcJdI1z3dQiOg6266IwBXQT+CfmRKlJZXWYxx8y2qZk/uzn3XkuOVuY6H4ZZo3sgb6dgFtaxpybjnbBKi+hwY6rl8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519352; c=relaxed/simple;
	bh=YC5zDwkoFXuBoZnBTyJeFpgYU1aFV0WLFqnH8oJwjBQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hv5YbZsuMx5zYZCO+d+8uDlxZTvWFiAdhynBRoDjXMe4bvoM4ust0FDZXaZxd8j58oSJEaamPVEN+Xz/1KfG5gII9/zKLVM87GipaBDjqDUdiBDzlATh2JYVx1nAv5e1wy1eYsKgvNju4B5EioZvFIJVWPF3J4HHqCsFelGZA+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ENlzxWhw; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYKI5Nb3wOUyUZlUb1rU3NAoH1+vvAf0c+XR7MQC7pI9XCX46bWaDhK81CVLwDMpEOGgMLoEMUvSMhFI5Gm0cftD/ViLzNBE5Muq9ZNIiTVB344grxTcj6m/IoQ8xeBQelx36o8JuRoFjrVTukNmwK79XGm3D5FXD6QxSF1I35rM0cIf6iuP8UYBQA6L5kPB2aUbniVBIsEfr1vpnVRRvFMYEjNx5DKEm9HQmRBU4J1v83CJwjR33IEpw4l5+Cw2xPF8wDtcbxsM4tGm4nf9RWInecpLL5Ppwg0Ke99V/VTG3dWjp+hIJhYZ2hN7LlFYBOBxULzluxbyLbL1vLLdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKW0VqsH2wm0dcny9PHVG1LSeilTMtjn972X3rDVgUw=;
 b=RTPFxdis98zkhOqYG9KT6mhxCFTUoh+n+VQ9efaf4d/uOnrQc/NIzF6wmzn6cc3CZ3TQ3SfL763xtZCta6qtzI389V2Hv6+DX+6sn0V3vy/f3XbZRC1JL1RHbBHdL48vZRgd/qH9LE4pVfMgi7jEplZDmbW15yQu0S4YTdD8cZVSpYxn4zt2DBSM1ydJon3X3ZeC6qqOfcWpUFymY8tuVYrBcKcFottWsCG2/t+eMsfjdIynYHN5/2mm33NFdlfLUUoudyrEwwPYkFSPHU+3baXAGq/KYaX9cHpG8SYcknlSf3+p1MhdaUrORwjXCM5ThLMleCtSS95entK+6+NK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKW0VqsH2wm0dcny9PHVG1LSeilTMtjn972X3rDVgUw=;
 b=ENlzxWhw6QQXGH/Qryb4omksYdt27n/FuHRHOc5FPcvyk/Zo9FvdBJ6JeSvj7vz3EsHHJXUrvFhle4FNtuMhH4E5egA7knHF2FbJxGcireYUlQ50ltUxu0NgVMeyjXGgTNFdof+3VEt/was+VvnzVxemn7cZKyXBlIe5rXNnOuBK5fz5D05+mXeXr+hhOPr5R1BXzbf1BUj+TfTiizuNCHSl4qFWWMhw9U0NpMHMSDDYIe/iv82yqFd8nzh2Fm2YHRhYDMoHRpnZB7e2Qr3GtNeVt4/ceXH7OwA1KEBmxmqLy0rOWrwxDe7qF6IUxCHUp9lMFgRlqTeMDGsXu1YF1w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Thu, 19 Feb
 2026 16:42:26 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:42:25 +0000
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
Thread-Index: AQHcob66sNtOQFpEMUGdW+FM+DdI+A==
Date: Thu, 19 Feb 2026 16:42:25 +0000
Message-ID:
 <PAXPR04MB91857DDADAC9D5864DC11FFB896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
 <PAXPR04MB9185EFFB8C73462E215EF486896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <5e227857-7e33-43ad-8330-5304fa3616d5@lunn.ch>
In-Reply-To: <5e227857-7e33-43ad-8330-5304fa3616d5@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VE1PR04MB7454:EE_
x-ms-office365-filtering-correlation-id: a2a52dff-c3b8-4e54-257e-08de6fd5dcad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CiVRUhU5Q5nOJ6H3mTfXFt6K7SrX+Y/qofnkta2w87KB80+rzCGgTO8AQzM8?=
 =?us-ascii?Q?H2A4IsTmQMSljQEtsFc4+4NCfanQBTig02Rl4nQLXyiSrf4XK12udL5nZBaB?=
 =?us-ascii?Q?nP969tcn7vFgRptNVjZHVI7vLUrh0uj7tJxR6tdb2qUFKo1jZcnJoOpItvaL?=
 =?us-ascii?Q?oduPQiPJjl/scePvIueGlzx6stk+ogMs1gvq0dBUNTG7/uUCY2+kB+NFxsw6?=
 =?us-ascii?Q?kPo8NxaHT5OTQuOQ0jC7HjwLNXT5H1g6QCyLs3lXJ/cJzVU86VCc5Goi5FDW?=
 =?us-ascii?Q?89tBTJgmvIiJBUtdOwRSY02kMh3fvVdIMNFEnn2P3rgvWkfMS7WBA2tGOG38?=
 =?us-ascii?Q?d5s5S+4ocWpbD2gsFYkyhQ9v3mJIW2a7yQzuBCPEAXZIF5h2punEnyIgNZLL?=
 =?us-ascii?Q?AXVRIHz8J3xFi/djqqCwoKITtIdLh3AU4vHHRMum+I3wh79M/22CZnmc5WuK?=
 =?us-ascii?Q?gYwrnRDRPv+r1WWf8fEZCYjKtXkVwmNiG3iR4DrS3EQ1Xb3ykbUzJq3R47Nh?=
 =?us-ascii?Q?EMoEKmKeKwS2i5C+kE/p8yddbIZmWmYa3m8Z/lRfS2YB8FtnzQeonziVEEEy?=
 =?us-ascii?Q?oSEVtRrDfHFAljadnaSarjBT5IvN95nb+Ryi8RblUF2oWAeElwQLQkgpp4qk?=
 =?us-ascii?Q?1y50l27Egg/ZiwEztNZyEs/rUYhrK5/GsICpx/d5Qvm7okEmkeRuaphz8Yy4?=
 =?us-ascii?Q?tCfwbgQGo91Z/ovpf1vxZhi0tqTMyTayj9gsqyb47MRU842Kgw3mWadMkSn1?=
 =?us-ascii?Q?KQx//5VrLwZK2fecAu9DTMtbFubRLRCzz4eh371Qil87civ85ujd/xsaAkVd?=
 =?us-ascii?Q?APbCOz6wRfeUO5tTYOihFjwd+J1uCNlADKAMhV8XIiCabHGZRw1Pz0WS/G7g?=
 =?us-ascii?Q?jibqMHd9uh10dpvdD2+7XpYspyebvVW/KQC9N31+4VGsNsMxWrZb7/O4X1lo?=
 =?us-ascii?Q?FKF94wlUazmyHNlw1WbA9H2zn3uJRswK4486GlLsW3e3UPUGzCuZXTYqpld8?=
 =?us-ascii?Q?s5nQbSCZaXe0N5QZm08Crp45jZ6Clb1vGrta1MQafyS18hqdeIJdwE80AEQc?=
 =?us-ascii?Q?AItFsvB5OFebnhaXcwYnlPqFpBVMHh6sHsMnPIvKGt/GMYtBOEl8FHVAyBnR?=
 =?us-ascii?Q?aQ/ECjsAkM7k1eT08b6AQ5EIQ1TW7+dd+AhiJCtYctKBLbMLWoXA3+1wXmzm?=
 =?us-ascii?Q?esYFXrA0IiqyBtWWNm0D08pZiAZSUd47CR6pKNFvZDXiyaa+eo1Xxdwo8fZh?=
 =?us-ascii?Q?9XrYNe2KiVYm+h5M7upyQ7/o9a3RQ6gSbnZb/a6GCdeWyi7lDTkybQ2qMJ2v?=
 =?us-ascii?Q?WX/CGT1SlPMOGv9iiSCucihBG3zE/yznBOx/3MFZoYxuVwA/3P6zHquBsyND?=
 =?us-ascii?Q?fseuk8/nZs9Ji+/3VHbhHstFed/YQpR8+kcEPzlCW3KToSndkcyc7TVNY3xb?=
 =?us-ascii?Q?q1ebMwfE4bYE+SPMX4XPdrnZVv961aW0tm/Y1VD6UXWvnJFpTa93TFlF7CKk?=
 =?us-ascii?Q?EcwctY1X346G67Y8d9zWM5GUj7mjLE5NF/jRxzKqgEb7vrYUSn6ZRO2/GFIE?=
 =?us-ascii?Q?7rjJJ7hLuOZXUtcgu4bXmderZApX+3U4M1IFAv8pfQ4f4vUJP67Wq6FGbesA?=
 =?us-ascii?Q?IRI0tziTv4v8L4S0RIpbe4c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EBygjEBYI5kXROSwJu15F5eSJJk6Z8uSKKr0C1NnYIUlMCFXlN2rsi91/AGA?=
 =?us-ascii?Q?Nqxanr/30fEDHKO6IMo5NCpld748mqbrIxywhkbCkLOU2uy0Hu3tfpVL9sLv?=
 =?us-ascii?Q?IgVJz9mg24JM0GkiaNq7YCeSrgvbEuM3rEfSamLDL8CKDWBbVi40N4ST/Trg?=
 =?us-ascii?Q?cYUCeDNfJXCakg91b8hniHsahGxSJVsFFQb88nrFTwjQsl3S4jsXn7U6aFSp?=
 =?us-ascii?Q?O+dMWCd1N/Me8tisBwQabwzR/m7qTsmchBCYhsKqAorFz7pzlDX+MMeenIJI?=
 =?us-ascii?Q?EQ6ThLtXGe6B8w8o4k4TeHWboKgP4Nd1hZbN8h2vlpGSTWTLDNZA4APmFMAc?=
 =?us-ascii?Q?2xD6WiUPEV0rmBC+xOPp0e7UzmquTkM2vZUUe9GXHUMF7zwlKArK5R0HLYwC?=
 =?us-ascii?Q?974Ow+V77SrdOTmi61gfqmwaC1a3B3ROONX3sroEFKe9np0us5HfdxJZdTeJ?=
 =?us-ascii?Q?tUcXQBu4fVXTx5WNwYFHl8CcJf6mjgFb498dEOofXQHSAPsv6vs951rExlWz?=
 =?us-ascii?Q?RfhyFtIf65YDcp9+snnJSbQeSdTzMoBN1qlLRRtmoj2A2t71zSt99byNGMvq?=
 =?us-ascii?Q?xsoZ4svun5KNqX6AyPdEMELcUkNCO9I+Z4zEoLK/F7CmTVVqC0slGYRk8Zt1?=
 =?us-ascii?Q?co2TIW1nsvBUnYXhvU6s4yB38Fjw6Oll1zkxWAay24dPkso3IoCeflarUsq9?=
 =?us-ascii?Q?IkZmPk08+XzDX5iVPCOpkSevNhGcDrUU+lJMI1ycQBYNcKX3+t0vpgTzG3G+?=
 =?us-ascii?Q?QXGNzRATUnPu57bMELaLranhkynoyw4MOLidhHeZ8Dt6P7WuNzXaKjJFGmGI?=
 =?us-ascii?Q?S5lbHGjxE/LsNSn0TSQdBN2tphfpWZZ2NiYFxos7bn4xlQr3+1YLQJm2w+QW?=
 =?us-ascii?Q?ekkM0VZ5gPr5hL17mDGEXBsRtnEK4/wcyBbLJVbBglK5tUdlYYYlwh0uPoHG?=
 =?us-ascii?Q?GQU5lCImCWVbLdFGVWf80I02FP45jmWnFvLiqlGZMsGVrGYo7MhBGPPCbACT?=
 =?us-ascii?Q?JatsHOFYNToq/ywNY1ccLmGHaflJFTz25QXNiHJAEEaKjBBmnO7epBuoynl0?=
 =?us-ascii?Q?zfqJrchmg8WRFzWPXTcY0pTRLOYGCCUZhP7eG/OQDwkqwBlek4yRXfer/ug3?=
 =?us-ascii?Q?p+X39cTXv+G0/HdUqJ0tFoRd8OpHU/jWtpyv7+b1T+2/2jAbkIpayy2+uvm8?=
 =?us-ascii?Q?mFeoxphWy9r2UGYXt9Dz79VZhwnvGFDeNFnVFHvIcHtlprUZh+gx4TGhASaT?=
 =?us-ascii?Q?3HbBnh4Vg9F3ErCyxAmYWVGrSt7C6lQH2qZ+wsBtLU8K/gPnjvWmXHN/9Cnk?=
 =?us-ascii?Q?W6geUSut+pkld12udHpqn5i8xCKFPpkchadAcxc1mi9eWvpkh1JAiNJnVKle?=
 =?us-ascii?Q?va7G3zPr3sSHmoc2pzDt+WcqSlRUraq9GR1XPM77ekRcoFs1A2jcMEqSgpGT?=
 =?us-ascii?Q?zhwlf/Esyuqu1mGjylWQN5QRlBM3MxseTCDbqM1HjqRZ2rCcffztb3x+nIVX?=
 =?us-ascii?Q?dcMHRvbahQ4xfs1OA+SKveX0gGmBfg5Hg1NVdRIsVKgFdhA3Iem39QRnhrC0?=
 =?us-ascii?Q?OllTYcc1efm44C/oNwmeMo3woQ3lDLWuLFxvaaqTvfgZzJvBgHudHwARYhF3?=
 =?us-ascii?Q?KiMPTKspG9InbBylb2xEtkhxE41Pkk2rzsGCATLVIHA/Q8Df/FMw7H0M0qn0?=
 =?us-ascii?Q?MyQFa+TkD9a8bN0kmjC4FAKZFhwZjy6x7W0aGTzwM+1Riv1+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a52dff-c3b8-4e54-257e-08de6fd5dcad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 16:42:25.3680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nm1cREPn8VSBvMpEMGGWNChTCZzzombxDIp1EsRhrHBzEzNnHE6f7QgYOamR6QcLmLmeX0afpBq3x9JEQxoDnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7454
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31874-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B884160C36
X-Rspamd-Action: no action



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, February 19, 2026 9:25 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO dri=
ver
> On Thu, Feb 19, 2026 at 02:17:26PM +0000, Shenwei Wang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Andrew Lunn <andrew@lunn.ch>
> > > Sent: Thursday, February 19, 2026 7:27 AM
> > > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > > Cc: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > <brgl@bgdev.pl>
> > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > GPIO driver
> > >
> > > > > +   if (sync) {
> > > > > +           err =3D wait_for_completion_timeout(&info->cmd_comple=
te,
> > > > > +                                             msecs_to_jiffies(RP=
MSG_TIMEOUT));
> > > > > +           if (err =3D=3D 0) {
> > > > > +                   dev_err(&info->rpdev->dev, "rpmsg_send timeou=
t!\n");
> > > > > +                   return -ETIMEDOUT;
> > > >
> > > > strange condition you return an error if err =3D=3D 0, for redabili=
ty use 'ret'
> > > > variable or simply:
> > > >
> > > >               if(!wait_for_completion_timeout(&info->cmd_complete,
> > > >                                 msecs_to_jiffies(RPMSG_TIMEOUT)) {
> > > >                       dev_err(&info->rpdev->dev, "rpmsg_send timeou=
t!\n");
> > > >                       return -ETIMEDOUT;
> > > >               }
> > >
> > > This will be from a comment i made. It appears that
> > > do_wait_for_common() can return -ERESTARTSYS. I assume that should
> > > be returned to user space?
> > >
> >
> > It looks like there might be a bit of confusion around what
> > wait_for_completion_timeout() actually returns. That function never
> > returns -ERESTARTSYS. Instead, its behavior is pretty
> > simple:
> >
> > - 0 means the wait timed out
> > - A positive value means the completion happened (the value is just
> > the remaining jiffies)
> >
> > So the driver returns the timeout error, and the upper application can
> > decide how it wants to handle that situation, for example restart or ig=
nore.
>=20
> wait_for_completion_timeout():
>         return wait_for_common(x, timeout, TASK_UNINTERRUPTIBLE);
>=20
> wait_for_common():
>         return __wait_for_common(x, io_schedule_timeout, timeout, state);
>=20
> __wait_for_common():
>         timeout =3D do_wait_for_common(x, action, timeout, state);
>         ...
>         return timeout;
>=20
> do_wait_for_common():
>=20
>                 do {
>                         if (signal_pending_state(state, current)) {
>                                 timeout =3D -ERESTARTSYS;

Once wait_for_common() is called with state =3D TASK_UNINTERRUPTIBLE, signa=
l_pending_state() will=20
always return false. As a result, -ERESTARTSYS is not a possible return val=
ue in this scenario.

Thanks,
Shenwei=20

>                                 break;
>                         }
> ...
>                 } while (!x->done && timeout); ...
>                 if (!x->done)
>                         return timeout;
> ...
>         return timeout ?: 1;
>         Andrew

