Return-Path: <linux-gpio+bounces-19121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47174A96005
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 09:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA763A8CA8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 07:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4711EE7DD;
	Tue, 22 Apr 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P7Tfmcn7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8CBF510;
	Tue, 22 Apr 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308388; cv=fail; b=IsgGWo1uSG21Lyjljs7r5haafi5dUkk5n3ClX/O5gCJqZSt+PcN3SHTJNvvVN47bSdanDD/RhX3ek0iIpbcPCckXr9j+BHapLzhhLCuMkC8HOcLAvwJf0/QVJm5qhwLfMV9/JvNmPp/iVg2rEMWcs1z85IpMeni09dHcZu4qKiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308388; c=relaxed/simple;
	bh=jvwrlAYARYew8DPm2j3V3zEZ/64Vh/Hapn0uXR2bnN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SYRrHE/Ijwp35TMNPcqCtPu3HgOYpvjM7sRTpk30HlTOtjJYW8oMw7uUnUyFAPoqjOUp0ATv40PQm7VM0SHkVHuYz5EV4FYEy2sM3PcpXRUCWsDKfzpxgu545uA0kwBLtT7W2rqVh9c2hvVyxR3No2AgnyXGZqD+pK6UyBiNm7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P7Tfmcn7; arc=fail smtp.client-ip=40.107.22.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PorweNiyAuh0aJkEHUDu5HV9xkQkeADjeqtpTw6tKRm+soAMoYilsBE4UbRGNUMUTf6oiySplMuDbC4UAPRIDN/W6tsu7G6+FHsXRMsVxW4r1tgsALUZmj+lqKcgGJC2WZFom5cY+bCP0P0PujUJe9h0lG9EFk+HxA/TB8UXAGK5Kl9qksnvmk9daveNL0IbmdCWB/ce7OSTFcJ7x+tJ2w6j79bH3cLADnpxptSGjS+dzx12tn5e5mUq/n3fd2VRvPj7Q3EbAIQdBbpRhTyqo1B+7RVG4dGPVvWpQRLhK9k9sbz21Taf6iChXXnBVbqM8/H17p2QYudein8ZmWN03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZnFva8xggsu0J2Pk1NHFCAtwth/3FdPQsHsX0YAvl8=;
 b=A0o+nvCdElkjaup4aNmfbkLA0yuWRuor3+/qcGvjz151aHrbCbX05m3EirnC9twT+frtz7Z43nyeoRzbxIt5Ohh/qEXlZ173m0K0fSpBeZIAUM99K7CGG1lmot1rihH3RAZFy3FK2oTD/0xpdj50c1WPXg+FVVaSK7ilbg/m4rWg5E+4SEmV6jeafr6k2HxVPfG29rR/540Hf8DFNinIAfACvEpi8PUAkzU7i4ESw0ElP40dZt2DO9H7kqL1785+Dfr1QF3GyjyFvRX7VPBTjwxivG9174e3MyZrvg6QCAK0hCpaZuvByhIH2TwUy/vtIjWmDDoISGCRTWbOmMkJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZnFva8xggsu0J2Pk1NHFCAtwth/3FdPQsHsX0YAvl8=;
 b=P7Tfmcn7Nf2kAJlBGyGx/wIynBe62bjyhT6Hyx9uOmk6J8Sr0jub2UIuE+XDyl5r5doIbfg9PK4zasrRvpy9gzhamw1fWOVxuRAzoWdH+gUOuzBZylujKLRgkpINUNZ4y4kAGr/C0tNiUg1895YYBkIpHD6Qa6wYioqxhEmt/3BOYRohpM14BB1c8RWLkQA2/oVyKJQlEOAcGzO8A6gCrLIOIIpu+Lt7qTgtK7Ut++GL1CZnRXBgk3R1rjnwEiojf6O+XK8QGNJVvBX8OVl7nBZIabpTiMW8TYyPJ5eyAw+68f2HbRbtyb6tfajGrf72Wdb6Ddz9yNzLICr8zFUEPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:53:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 07:53:02 +0000
Date: Tue, 22 Apr 2025 17:01:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, linus.walleij@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, cristian.marussi@arm.com,
	aisheng.dong@nxp.com, festevam@gmail.com, kernel@pengutronix.de,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Message-ID: <20250422090150.GB10830@nxa18884-linux>
References: <20250401072725.1141083-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401072725.1141083-1-ping.bai@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a740c0-c0b4-406e-d93c-08dd8172b4b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TlKeiMf9ulW3/kV/wio3luyd0LGOHWBWs4mM4ADw/HizwNM/aw2eeOh/DbeV?=
 =?us-ascii?Q?w6T2ez5NNg9haBJSLXd9ME+ms4Ux9Wa57YTewaVNMEdHb8uS3XtMohfzcOtE?=
 =?us-ascii?Q?zqNXcreV4QK/cgoUMSVnuHJSzY3zzuYI7JXQEl99/rX0GrDCQEFeiN8T4XTJ?=
 =?us-ascii?Q?VKo+9/ndUycecQ5xM729rhbyHh7FLOSOXvjRY5tL19+D4BbDLfwKzX6HJsRC?=
 =?us-ascii?Q?fkaRWZupXBNFKhm7V+bbxTQa87MBy/fj8K+FDt/HL9TyLj0wpQgzkaqEWHPa?=
 =?us-ascii?Q?gnbA/8DJ239vEK9ZtSDmvrChor+4J/e7dKa0cn7f5TZb0fDCzKPWR60N9gMR?=
 =?us-ascii?Q?HwGYKknbW5FknN1ClULk1aDOc9uJ/bgSPfKTyEmXKQUUtGecUw8F1z0P325V?=
 =?us-ascii?Q?+GZgo6+JA2SePfwV5uIK+1T6ZKUbxx1sP1FdDtS9um8QKQ/A/lqrAnZCUgpk?=
 =?us-ascii?Q?OPvHTQoxWA8qY7F2Q4C0rvu4kZ+0EgAF9609Ou9CYqaEcYlLIlWrFvRmuWgr?=
 =?us-ascii?Q?MQI1BJLDUdxY7ZUN5Tre9NOmcUKqy67j8p+tZfyw9A4vMLHAv8DDGEGxq29U?=
 =?us-ascii?Q?3w+2V8YifdBnpHzGzxEvjp4vRtxHWJ2Pfxq3SXIhc7srs0xhXwIbYRTMQ0aR?=
 =?us-ascii?Q?siySfHi1UEuMwTVQh/xvSgNTo/F9jPgIHmlkV8Se9F0XfxLRd9P0US7ZjOb3?=
 =?us-ascii?Q?ZIkw7Zy+kWNAP00COWnSvUPXE3nsJETXCQ4d97hpaPOafXii+HMtYTxisrUJ?=
 =?us-ascii?Q?ly96fWMnWduc8sNa4cxZKCV2k3z/kMwNn04+0ozK3htb84PkvLJFnkm2GXwe?=
 =?us-ascii?Q?2O58Bwb3wwAVPamzhFrauiQ/kP/x/Slp7g/OoIcmJ1b0f2xweU5HhQVfKNuJ?=
 =?us-ascii?Q?7pF9C1d3NyVdh4WSJ8otNpTfDuEOS2LRNpBbbsdyxB5g3S6sUF4r9oQpFyud?=
 =?us-ascii?Q?v6jyvQfvxfeSHmFABwXPJ6V/mAZK0yIng28DDZvwKFvHO+xU2bhfZ9Pk0dK7?=
 =?us-ascii?Q?fZ298Z4HOsGxX4X4YFVd+XG4UBdKv6qZ2/DKchsrUYpe7eryFLjnjyOQoDXr?=
 =?us-ascii?Q?xBjkI6AXTf56RzUPh0/vy1+3JkI6oDZw9WR8SHLDpVMF0BrriThChSUycS+8?=
 =?us-ascii?Q?R8pBLeIsjsVBqeCe5zvnSXv4HpAH/i2D+efEbLVQvLvoCA0jS6A52hHOCAe1?=
 =?us-ascii?Q?F3mnRy2n3uFmOIlub9VUosQk3OfM6eDAwXzVGZW0YXcqaMtzGJBzE6RDraNG?=
 =?us-ascii?Q?rr2pkwNZnS8uhx4Uuy8xu80XvyAhfns4j51GOfT6LXXqoBjgpusf6SRazbSX?=
 =?us-ascii?Q?SM5c3FJy8AcZaYYUCdetIwla8TUUx/q3ptDXN2XI0yFicA9MUPju2Uf80kT3?=
 =?us-ascii?Q?ucGYZsS7XbliDDDVllglawNyB7GkDquJhkUjngoWhcaC8eskyADpGia9fuLk?=
 =?us-ascii?Q?cEHAa1qt43vV/LrNUi0JfulHtZBhnZzAgWU//C4gwkkadFXBLu1CvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIJSI9E7UXtR2bYmE6fM63WR5EyiEdHdnkIbEWMO8yAaDUb24tqK49rG5wre?=
 =?us-ascii?Q?Wg3JqbeqRbtIVJS88aShHG/zON2XzBASnqZUBpl/jEZrqHC5wPm4ZWToutKP?=
 =?us-ascii?Q?RBd4wXkyCDCISXe1UR1qa15D3eOM1ohzRESzNJ8E3t5nCviKwQVb8mvbCJuj?=
 =?us-ascii?Q?1k8WM4Sy2Gi2gEDygnvEyy7aGj7u1IWe8qNp6gL1htCYJVQxTS7WI2xVnFwL?=
 =?us-ascii?Q?UNm3Fl5aFx59SL0XXJWxZE6Chef8YSM/ClkwFgbTFS7KHGsIEp6Qis1322Q8?=
 =?us-ascii?Q?nBZHKVYPD9yqph3gjUEkgVWSHTDzbs0pXbu/jRaa/U/STY0xSxDOlZwRaiiZ?=
 =?us-ascii?Q?YCQPtHwErjivqiqvCUdfBXu5ta77mbSyjFeHGSV8h4324cjHSRZ4Ovm2hBex?=
 =?us-ascii?Q?T/qc/vpiAR7pVBpW1y8SVN6A69CsqFIi9+WHaMuNi08IsLspjXV37YeWQ7uY?=
 =?us-ascii?Q?28NEpx/MEO8d8PguN6uRAkrliBieXOvvSUXJZ5NxA71YvSzqdKIio92n84gZ?=
 =?us-ascii?Q?XnPNJ6WKGlQoURF2i2I8cBRp7OFuNQykvZFUpV/ROxUHJ/Q8UEb+l0OLAuBx?=
 =?us-ascii?Q?LGQD112rjqeguGEDDUpFEWwUmeYkh3362B54gttwkia3keeTRM1tEFWmrSO3?=
 =?us-ascii?Q?1e/JQwIsRWf6Z0wh0RMdNAlaKFEXf6t1FtLUlg5YztxP8Vt/njYlva60WExS?=
 =?us-ascii?Q?wO8A5zxQeNzmpZtipeJbU1RpRYcylNgqc7dlxMCmM2Xnf/ZayMtQjJUiRh5N?=
 =?us-ascii?Q?l+VdFWgwx9lSSFc4EJ8yA0o3YU4Bg+cSJQUxApx+hzI29Po1FWZUY0fJ8Bpq?=
 =?us-ascii?Q?m3rqfkAM738NJdezNIAV26PpITSr1f79rqYivxoulmrqO+vMbGywVT484PC5?=
 =?us-ascii?Q?9aXzZSqpmyqB/PgB+dgTbqCNrRg5EH1RC8THqdlsXHr2pnkl1kaOACDykwBD?=
 =?us-ascii?Q?1VZd/tzQUBCMqW9yQQWTWg3w0lbYqfkWAwPU3jSYolbjVCcB7mAgVJgxXcHY?=
 =?us-ascii?Q?r/FdXg59enosSlkgW4yVClm6JVIas96tqULbi89WsUpruya+Kt34ITQGsLd+?=
 =?us-ascii?Q?HrjC8Zu3GaH79hNfi92MlhDUygAe9jX61d4YgJ5zY6OOVvv/mMDZ3W0f/pnf?=
 =?us-ascii?Q?2bFBbbQHW6muB0KcTOgI7Sr8zV0G9TzdQ1gkh8M1EZ5NZDKwV9XWkrxI4sVS?=
 =?us-ascii?Q?3l6GzkhC+0e9V7mFQFPxN1sMS35FbiZf3//pr/9zXOXduD2InUJR6jlY2YyJ?=
 =?us-ascii?Q?Jd3i4PhY461+AY3nfVcr0GOdO1LWQAuXc94xjiWmxmKSjXI5l6cftV1PTPsk?=
 =?us-ascii?Q?FFAw23CkqFtfDB4qTYmOYZP8sJBfHN+YmTOeTsn8InPgBnfsSiR/MsYjBaAJ?=
 =?us-ascii?Q?09RCPYhhTiEUFNqX1tEfAglyerrUC+W3vdYq/4rc0PxJPxN4lMxgDO0AB/Np?=
 =?us-ascii?Q?sf3slf+q4cAIuCXMW69snbHQmXUJFG2bUxyo0Zd52+EdnuFaCkX2d7d0KYGZ?=
 =?us-ascii?Q?6ZBL2rs1eEXfjkYrRsJ9jJmJanJeZGAtmVic1eiF/P2UamPczFRycb1Gop1G?=
 =?us-ascii?Q?ySUQUHvD3dVZIPAyf+o1I9i9QGGFl12CRkkoDqo4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a740c0-c0b4-406e-d93c-08dd8172b4b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:53:02.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxCC/swQcaY6QmpSOSjqNNm013xil04AuRLs3wfUHNwF+xbyhPG+hCJoPIgtUfFCC6n/iStJZOQ8LoTOl6/BEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882

On Tue, Apr 01, 2025 at 03:27:25PM +0800, Jacky Bai wrote:
>Add support for i.MX943 pinctrl.

Let's expand the commit log a bit:

"
i.MX943 System Manager(SM) firmware supports System Control Management
Interface(SCMI) pinctrl protocol as i.MX95 SM. But i.MX943 IOMUXC
Daisy input register base is at a different address compared with i.MX95. So,
update pinctrl-imx-scmi to allow i.MX943 and add daisy off register, and
update pinctrl-scmi to block i.MX943
"

Then, Reviewed-by: Peng Fan <peng.fan@nxp.com> 

In future, we may no need to expand the array list in both drivers,
as of now, we are still exploring how. So the patch is ok for now.

Thanks,
Peng.

