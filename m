Return-Path: <linux-gpio+bounces-14394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA09FF69E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB951882357
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4DF18FDC8;
	Thu,  2 Jan 2025 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K3/PQTSg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E41799F;
	Thu,  2 Jan 2025 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803495; cv=fail; b=JFGbWXHfYqWkLyF+ZKuSG9CUZjL4gsQ25bfdIXgRnN3CrY7FZTUUYRTnX5fIx11e70fCclmtEXlXmqq1XzT0XbX9++d5H/fXuWacMzDUFigDg4tHtL+N0zdrV6jghTzP1U7UILFX/pdSZNFHrKVeyQyNQUwHT+g6zo2uZJmGCEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803495; c=relaxed/simple;
	bh=BtKVThMEmBohBcZ+Hc1z6N60rIAHLB2SNxUGKE5aypQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c7ViRLU9nkBGhV3lCmGiNH6NkFFVRyydXplEtbeUieOTjn5yqAUh0iNjOPjo+oj3XnDtGvAeJ0jqbYV3DeodA5igs5AbjD9Nj/gyu09Kr6QYjKjR/oINeONHsv96Dtqy6YQRsSDpPM8VBDIHHQQvW2B4goxNJuqznoM1dQK9EOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K3/PQTSg; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYQiaa9aSEk2I6IPhkXS452r6iDi80B+g+CjfVnn+1uNhdRySQcejf1RfNXOmG0wnelscrm9Z9HaBZvYBz1mGDwxSdoj3W5rOPURDaf9uKqc+2Bke2nDqkTyz1PFNnV8T6PYvwmgmMJ2RhoGZ2oS4WUZu73qwwvFN1a9iohdYL5+MLFfD2zea7Iw6Oj8ZnscfFb1r3UNPn+1p+uTmjWxYw4IDdT+W4XN+FaGIkao+WmHFVp9Ki14GDeJQPGzhyTi4mbBhSM3DITlZbij/iSE4g1wTLGSExEm1007GvacVJC6MTbO8vQFnlVOMpWUcJKmv414/zsZDKsmNv5vxGsOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruWSvnGLJHANS7z/xpiu33pBrUibYtWEqoY+5aRndnM=;
 b=ZkkpoASXJxxrdWPTK2PKMzaiR7JnqZ4w1a7/wBBb/BxMX2e8TGaKyrIHXHVZd9g/2D0c1/q8jLI39BEZ9SjFezDKruIDf/GxLybFsGjMdfrmA+ZVPMwDvvJxYo05HNn0bvxkg9iJCyJ3hJgvq9vycDoD6g+Z9XNTxhlEUxJYMrHJz7xrjbMs4RrNODD7VF7YxFlOUEnOR5EL4fwE9UQQtRZSrXNpbRYePhlT/Zcrs5IthRpbpmH4MtYK2RzMSqkN7iD6StJ9JR1e4yJpBIKx9hFunT9yebipCcPSMYTtiB54UZ40iMk/WXe6GQas3Mp9A/3yh8EDPGkwSU6F0L7xfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruWSvnGLJHANS7z/xpiu33pBrUibYtWEqoY+5aRndnM=;
 b=K3/PQTSgrjD84HzaW3UmnpGlJgVU6HXz4JnUeGAF4clapgqREiharsMTuLeEinKmtQnB7uAsRWdnV21BJlwmcwEXlIOTT6/IZqIDtwgDuACxXePtJ/uK7K0e2QNp67MCwhU4gxdZmAWO2mGePZMADneSAHlDdC1kbc9aEQr1cBQr/qMKDs5ipUVTY6rYyOOxOCs6i8VP2h6zEu/zT+ySOZtBYym1I7m528HsKM8jWUmGm4eaBWVdtu3DH8hoaMMmKUxYLckbXRv04jEzqCsvLomRoLJe+gHdqMliAkOxPIDXriMjJMyTDkxC3AIlYViycYuPtAySj0OaSopIGP1osA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 07:38:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 07:38:06 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla
	<sudeep.holla@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, Linus
 Walleij <linus.walleij@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky
 Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Index: AQHbVqX7U3UKEfrBUUq6t/L7CeKKLbL6Nl0AgAZ6KYCAAnPHIA==
Date: Thu, 2 Jan 2025 07:38:06 +0000
Message-ID:
 <PAXPR04MB8459AB05EEC7107D500A826688142@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <20241227151306.jh2oabc64xd54dms@bogus> <Z3Qy-br-wVCLpo7Q@pluto>
In-Reply-To: <Z3Qy-br-wVCLpo7Q@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB7565:EE_
x-ms-office365-filtering-correlation-id: c6cee40e-cfb9-4dae-ed21-08dd2b00660b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PtXP2kovXGet88rmDgONt6b8l/GqpFX1cRqUD08Lh7j0EZYUu3IZcSaYPvp8?=
 =?us-ascii?Q?zGJqbluosFGv41HyYe2SfQgh9cjbR8Ql51OcSqCPRig426y2DUillD0kC5YI?=
 =?us-ascii?Q?Irz8Skm++vPpSG/366L0gMlX4EIulgLbzRwUOMbdvyQffliz+JBMe0/rhZkT?=
 =?us-ascii?Q?KRVewQ8WaNR37/PhvOXHBsDuOEMpLrj6mA9gkTt5T5ymRzOsVH2ajv5WJUVA?=
 =?us-ascii?Q?wr48VGIC3qZpYoAKxPAc7v5FMlu9E/SNobRgk/9bvR2xOHeQ+dqfXvrnjTUB?=
 =?us-ascii?Q?DVOSBRVafa7X7v6AqDWg5g0aZmDhcz7FI5pQougEcTCCPwSsB5eze5bD7pDG?=
 =?us-ascii?Q?QhuwYHcNfydreSBG3V0wp6wjoIjJBTt3N+ymO48bkRJ0bJ3MlzYn49ixwd3I?=
 =?us-ascii?Q?r09IizvYiKKaJ6FlCAjEQKFJk20MXuhRlSQqVOZdMPrje7+WlVa0HbWewKcF?=
 =?us-ascii?Q?yhQ7KLTyoCF3dXAy65BbYfy7hJOsmrvlbBGve1OhA+qKCbwrlZpuJifbs7Ct?=
 =?us-ascii?Q?Yca+WrIoqOUamUlTyTKmT4tYgLcVfFSOEXlY1FQFQBGwLDxpPE/PAVkO51+g?=
 =?us-ascii?Q?OFMSnDX8yjl6F/p0Q8GdCvtBi3NsphsVSNTRVDHA7Huh7PU0SE/lVshngCeu?=
 =?us-ascii?Q?l+cZ8m6KTq4Cz3uwzlo2/JqBEalO0LywCQqFSfnYErwX9+f0ZmHcWsgiydFw?=
 =?us-ascii?Q?v3MDrfY5LTrFMLqa1H2ypiuMg339xi4fYLcGFko7xVdHPZL3fS8OvcalWIRP?=
 =?us-ascii?Q?BB98hQlMQgIiLbnm3vnzyUs9ZVJ60orlBjQ9v7XFm2NQIne0IYJXVd3MQ+ho?=
 =?us-ascii?Q?9k272n/mnaKcQHLCGrfHT6GKLe/V9m4ZP8TiV3qUiRdAmHQKZrn2nmodzGMA?=
 =?us-ascii?Q?mRfI3cqBQcJlM5LHYQXK/lyOUcMipoKFY5X58KIGqhrIxdXrTyJUZrpWA5kN?=
 =?us-ascii?Q?EGCLEWRaihCrx2Rp37wfuzXNP/NOT1YpfXyFlYDJADqlJ4gC8+V+jBh0/zr1?=
 =?us-ascii?Q?DopX0PDn5F9TtjtXvNlnl+PbBMdVy+LrUWwr+TiFJLVk9q028DJIGTNLJ88h?=
 =?us-ascii?Q?/2olPfA8B+Uj7Gt6ZBZHWEgwQGsMcUnhyIztzaZ9uJr4J6U2bHVaVjfLuSHI?=
 =?us-ascii?Q?GxClj3Pcdq/2QqhKnnWa5fS2EawgQu+E43wI0H77yiux3lrnPQ4CLgqoBsqJ?=
 =?us-ascii?Q?FBvsG+Z9IkQuIf4XIBxECPc5WAuf6k/D26957X/N9CEl0W7gIoVMkINr9XlN?=
 =?us-ascii?Q?DbWnuGzptrm4nSDrkBVL8RsQVZrWaMUEGqvI7lIC9dBFiojaanF3BdvcpV2w?=
 =?us-ascii?Q?xBSE3wYS2mFOHTOdiASW/qSmovs5uLTgHO3ejSqmA9p0OO1v42Ij0wMfGHj6?=
 =?us-ascii?Q?mhTxJnVyaJDBQsZIGdRThTDahCuqRmvBX5mMgshIffWZZqEF7PW4T9N5bmM1?=
 =?us-ascii?Q?BdKpeprLa+uLQDBGQekzTfEir8tnDXqW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?udxJlmNGO2nkib9GqGWk85jQF6vIl53eaIj8U1RAhvPRCHRvluwvu+/28jbY?=
 =?us-ascii?Q?D+9esqVcHetRhzX2iliLCm9iJumXL8VoZTkhGSSp+b5QyFY3co4JDNIWiFCh?=
 =?us-ascii?Q?Qbc7WB7qKk5q4HFpIWsbAtbPlVdQIRjRHXGfXf90QMvFNP+yv4NU0RsUUaHY?=
 =?us-ascii?Q?NTaOTGdlIDeyKAAn7+ov4VMRvlKeBSm2MqTY1SYTu0aHoKTWmFGT9+SRwvTR?=
 =?us-ascii?Q?BM6Tpr4Euw7pJ9+GYcVCttcufv3AgfWNkzPb76ZjXbh+KmhVECvnMIpt081B?=
 =?us-ascii?Q?1wvazxrWwmA4eH/8vBEub3xOxWjD9EevDWRNqSh+MW189zgG7r01mdzSrd+H?=
 =?us-ascii?Q?ANf+Gv/kanaTrpqywQw74y0A8+idDi8wmtfPgI5WRcVZZVTmnLxN1GPjfdlu?=
 =?us-ascii?Q?K20KHdpBVg4ztS/DRVeh1N4tcfXuO9g6+wn2JwpdJFg1Z4uxom2RQjcbEbM2?=
 =?us-ascii?Q?JWM/mGI2kMsLJ4D8teLjYFiQptsTZ81Nb+goEX5fhSILazyIcvq54e3uYUI8?=
 =?us-ascii?Q?dHcVMXydb0wy2WwQRkZxI8cXVONpzeVYSyFvYPENQwn1JU1u12xmWKKHLOMg?=
 =?us-ascii?Q?mvNer2FURre2pUH7zZqNhPgfkqnRjgTVUixXYgUk9P3rbvTArLo8BN6XJ22q?=
 =?us-ascii?Q?mqS6y35I/xnnv6z3AiV4p/TCqL5YczL5RVwpo5xg9WpuJe5u8Mpt4hMwqq8A?=
 =?us-ascii?Q?SMHGpD6Icly+H1amvNbjpt1Q3a8xi11Oecm95nyyv+cPC0ShNIHBllE+OaJv?=
 =?us-ascii?Q?eCzsf8VZG2rkp0wXR7QXrylyoQPfqHBMKAFj+Rb9MNPxnFSG28ELd+2Sq2MC?=
 =?us-ascii?Q?x04Gml6StolmEQqhtdhGg/OcBogTYDNCRegY7MPqCi2USnTIOs0ulxGcckMB?=
 =?us-ascii?Q?8HzNKdXrAeEh+CQkZJdcX+B24/El3/3GnZOnWIFQj46FLzPSQn7KvsSWiD2S?=
 =?us-ascii?Q?jjBBsfvXc7v+6FrRskB6V8YR5CwoeGMa22OTjm/Bry64UBmMhyIjmXvVyDH9?=
 =?us-ascii?Q?22ujIrAficollWS5kcyjQwhDH0GfKfdbspHcUKEgl9J1cXz/koLIiZiDIcSa?=
 =?us-ascii?Q?z7Do/pgslxfk6i9FN9c3KFtPXvPQrYSAFo+1p673TRD5H0yS6t+my9IaMKdJ?=
 =?us-ascii?Q?uLZf/6fY2ps8tGLbuvc+orPKMqY3oje/zRYS68+BCmukA+rFgLd5+mGD0Oog?=
 =?us-ascii?Q?zVZdCX6BkuqLpe4lsmNDTfZff3cKMIwA4qwRMuDYb+fgL3R5wUGQRM2O783T?=
 =?us-ascii?Q?lD0qR+BhzQEn13qASGh6l1mXfU2cUuspdzXNKpzwNFUpHSFIUKCjJrz4i3Yb?=
 =?us-ascii?Q?kE5FHvvz7qxHdQMSy9Efj7Q2UkviTP1XIYFSQq6xnlUfcLW3hlk5SKbDJeiY?=
 =?us-ascii?Q?mUU/0c/Y0qRHusIKRBKDWpohtO/yqAjzRJO8GduGvJX65fyDiHnbfSkqDD3m?=
 =?us-ascii?Q?tlOMEnEpQEOK2KC+tbSjjzooNXhvp6/kEqkj3EzfIh+SAX3DdiSXbKa5pV8p?=
 =?us-ascii?Q?43Ngb8HJXktvmLsFOu/Bn+rBquYP+/74qFCJPV+sDo67EF5S11TNgXf9BLuE?=
 =?us-ascii?Q?UbMFYeWJxnWhJGDluyc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cee40e-cfb9-4dae-ed21-08dd2b00660b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 07:38:06.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgjerqPgZa7xYwR6XSZ2LKqT3rrHPo/cMic4zZrbgDIS3HeaRXB2k3WK2/VREzF6vr7+bC9CWznrljIUjtewzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565

> Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for scmi cpufreq
>=20
> On Fri, Dec 27, 2024 at 03:13:06PM +0000, Sudeep Holla wrote:
> > On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> > > SCMI_PROTCOL_PERF protocol, but with different name, so two
> scmi
> > > devices will be created. But the fwnode->dev could only point to
> one device.
> > >
> > > If scmi cpufreq device created earlier, the fwnode->dev will point
> > > to the scmi cpufreq device. Then the fw_devlink will link
> > > performance domain user device(consumer) to the scmi cpufreq
> device(supplier).
> > > But actually the performance domain user device, such as GPU,
> should
> > > use the scmi perf device as supplier. Also if 'cpufreq.off=3D1' in
> > > bootargs, the GPU driver will defer probe always, because of the
> > > scmi cpufreq device not ready.
> > >
> > > Because for cpufreq, no need use fw_devlink. So bypass setting
> > > fwnode for scmi cpufreq device.
> > >
>=20
> Hi,
>=20
> > > Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the
> > > scmi_device")
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/bus.c
> > > b/drivers/firmware/arm_scmi/bus.c index
> > >
> 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb654845
> 43044b442
> > > 4fbe3b67245466 100644
> > > --- a/drivers/firmware/arm_scmi/bus.c
> > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct
> scmi_device *scmi_dev)
> > >  	device_unregister(&scmi_dev->dev);
> > >  }
> > >
> > > +static int
> > > +__scmi_device_set_node(struct scmi_device *scmi_dev, struct
> device_node *np,
> > > +		       int protocol, const char *name) {
> > > +	/* cpufreq device does not need to be supplier from devlink
> perspective */
> > > +	if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,
> "cpufreq"))
> > > +		return 0;
> > >
> >
> > This is just a assumption based on current implementation. What
> > happens if this is needed. Infact, it is used in the current
> > implementation to create a dummy clock provider, so for sure with
> this
> > change that will break IMO.
>=20
> I agree with Sudeep on this: if you want to exclude some SCMI device
> from the fw_devlink handling to address the issues with multiple SCMI
> devices created on the same protocol nodes, cant we just flag this
> requirement here and avoid to call device_link_add in
> driver:scmi_set_handle(), instead of killing completely any possibility o=
f
> referencing phandles (and having device_link_add failing as a
> consequence of having a NULL supplier)
>=20
> i.e. something like:
>=20
> @bus.c
> ------
> static int
> __scmi_device_set_node(struct scmi_device *scmi_dev, struct
> device_node *np,
> 		       int protocol, const char *name) {
> 	if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,
> "cpufreq"))
> 		scmi_dev->avoid_devlink =3D true;
>=20
> 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> 	....
>=20
>=20
> and @driver.c
> -------------
>=20
> static void scmi_set_handle(struct scmi_device *scmi_dev) {
> 	scmi_dev->handle =3D scmi_handle_get(&scmi_dev->dev);
> 	if (scmi_dev->handle && !scmi_dev->avoid_devlink)
> 		scmi_device_link_add(&scmi_dev->dev, scmi_dev-
> >handle->dev); }
>=20
> .... so that you can avoid fw_devlink BUT keep the device_node NON-
> null for the device.
>=20
> This would mean also restoring the pre-existing explicit blacklisting in
> pinctrl-imx to avoid issues when pinctrl subsystem searches by
> device_node...
>=20
> ..or I am missing something ?

link_ret =3D device_links_check_suppliers(dev); to check fw_devlink
is before "ret =3D driver_sysfs_add(dev);" which
issue bus notify.

The link is fw_devlink, the devlink is created in 'device_add'
        if (dev->fwnode && !dev->fwnode->dev) {                            =
                        =20
                dev->fwnode->dev =3D dev;                                  =
                          =20
                fw_devlink_link_device(dev);                               =
                        =20
        }
The check condition is fwnode.

I think scmi_dev->avoid_devlink not help here.

Thanks,
Peng=20
>=20
> Thanks,
> Cristian

