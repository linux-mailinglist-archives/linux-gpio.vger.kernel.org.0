Return-Path: <linux-gpio+bounces-34329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eON+NGP4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:36:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77734BC16
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 542E53041795
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBE039DBFA;
	Fri, 27 Mar 2026 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="il1yS/pj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1639BFF4;
	Fri, 27 Mar 2026 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647265; cv=fail; b=INcUbrri9CqGtcU2UMYE0EtV0D9eecwGn/XogtBXZYSLC6FupU+ySEZAZYzYniPcNAPwYZ44RBgMg2jeDBO0SDGb6k/WUJ2P591UeO4+5XMPWZy5DXQIkRaF8c3icz/PjgVZuW82Ikfa9pkABkA5lw/8LnICBJIKOlz0pdjlvvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647265; c=relaxed/simple;
	bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n08yrD4ykvEp+TI4yXvGwTgxxthMX8CJRA8gBbIliNgDhA2Hv8s9YjGteFFfQlxNV08EJDqkkvnWz7tY1mt89FLtbwFpK6l815Iv2UpzhzgK3gMTsvUxp00t7tdlOWnxxGauRu5dOxmjL4vLiq6tKXXJk3aloWwQ3bRr1FGBX18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=il1yS/pj; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAneCRbeM2Tp8LjCatpypdL3m1fHUvUt+PvvVWqpJoULP8/dpEYHeVs+PccVO3Sa3cOqkpT/P8T1ThV8jGBBBUL9vtfE97Ks92aogXoqK9/gX8tQlvTVwv2O2NH2T7goV/hEuZeohsHaxKywTyhvNC06uyUPNoOO4fTiWkkkeqHl6cv0eNAbwWRtjMQx1/wQuyoSIChb7EGYXkyiPtxrIcPp9gkxQQxB0kiRZDQNI04cLiMt6u8a6fzKa06MEuZoYYiFLtsMGx8dvLlUlsueE3av7ojo+H0SX99k4sld31k7f4th1nEZ5YBhjk3ntwizr85KKXf+H4yFbAERylclRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=tfaFuFkpdjjHAFLDoBze8CW7v8F1/AdH1IC/ylyqHDfEUDS3AuaxxjFfmUDFKho9zh/IcBao+rgbcHJrCvw3J5VPlF9uO6YPl/aNLPiCaaiXTIBraMmnZQfkpQnCFwvaaW7G/uMrHVoZ+rV1YKt9g9kYHKuz9WOWLczm2TNKe1A8yNk9uJaKF3OtqFViCfSil+h6OVqDupllk+hoxoVR1RlC3jWDHZkpOTJTJRvMUK27x0IGpKR9ee1rh+RD5gXOToBdqBGjBsQJl6azLPZTFXFUS50dCK0oeCuloKds+IUx8LzhWSe5yeb3YJd+nHt4wVvumdCc1jdADbLgF4B1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=il1yS/pjyd9gbz8tW3TslWxBL7/tij1wiZjjGRpqH4axkHC1SPd5BYfU+yQlMr9a4RbqxvnOWzhXbDSbEOKOql2+/P8bvXqTmFcuE3HdvIdeCVF2U/eByXRL+HTnyU+qv1iA3pIFz9sOE4CvIPRFGmEgB857HhhTXxy/8Gbesmab6ErBTr5j1wo7/HsDnL9QjozxE1mKYO+spRj2xVLFGgyk6GI88TM5OKtoA/WM8HNWY83LKj7AjN9pSwGS06dEE09t8MLhzbOJIu1l2CMycVS5zyLoeR9mS0kM8F0nv6WXUX82ADIIuSUP6H6vGgWvooBoeBytVu8PuCswZ2mDMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:33:59 -0400
Subject: [PATCH v5 2/7] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-pinctrl-mux-v5-2-d4aec9d62c62@nxp.com>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=4615;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
 b=BZ57rGybueAIzI1MjxeVz0vqpz8Qtmvk0n8z0hlcMceBTPO356XkBmgW9ysUHtt0GRF8Tvhsu
 23Mer9VMcGLCcAHm0PD3kOqrPEmMvuoi42RctluCuAFyajtwlEZyhOC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 811921bd-71bc-467d-a57d-08de8c489c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9adoSWP4VpmPhJCaK399/cd978NdKUAhL5zYN+bkXK1ipiknFdkUph1V2+e4L9/4HAnKs1avQC4hv52OQ0qxChi0ko4LhYQ+PCm0EgLyPCh6R/qmDZVu3AqQOy6bV0Z4/U8HFSkgMPceTGacLZyfFI3MsN9dUCwyXcq4ip8OhTFkyFmUyY2WcWu3T4yZpREYsXZLAcA9LC2h6qdExeg+8d/q7Sfs1cnYCV5FaJ3OaQkRjNKPSDLtjs7SmGHo4vDnVn0kMC4TirVXvGHw5++kYmw863x3UrGg/ofuxjUvYIpWbO8BcPRZIEHqV7nLPjKY3KnSJebaZYiTU94OnqDxjUEksTErYh7ro3BoVEXQnLO/oUP649QzLkQhevPbYPlDELs+XPToYtOHjJifb+YFi0Wb1Y4gP3ct6fmc/AGlY94Ip7UL6WQDSXF9XihW0fwkFKoABUk/VJYF55So+Hw2jHrhrDXLIj9SiFgZYLxkKA3Br8YC0ACFA2g3m6k122H8Y7v4kveS60APdNl45Xh3e/PS2G9DCQr/3pUKBzD4mQUYXe0EQOznAkS0aa5r6ZqJrHuKgGxeHwK7ev6/K6B9D545AETYaUcRIfFQtEMVSbz+W4nQ7GzYFrhlEucPsdLO1Ce4t8qtG2SsIDkT0lwAwbbXjf5BxKczmAU+RSZe0QDQclEfGeiv/U9YH375QgVFoA6dIj3kwfDVuk+g5wjZ5uSfGri+yFUQvwhCYC+pjNCRuAFhf9TjcJfKqjE+OhAo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXArbzlKdmd2VTRhMkd2THpIcWR6WWtERHpVN0NjNXFGQTdSMjMxbk1EUjll?=
 =?utf-8?B?eHI3WmJjZ0tMU2hZVFQ0dlplL3Nrc2hUMTl0cVRaN0IwVm5idHU3S3pyTkZ2?=
 =?utf-8?B?TkUzZTBHdzl2dThGM1VFcGduK3JKY3EwUWdDWFc2Z3FGRS9LYzBnbUphVVZG?=
 =?utf-8?B?UEJIL2MwT0Ruc0gzeVIzL3pJTVdSNnd4bGowZVZicVdCOTFQeXUzKzc0U1Fn?=
 =?utf-8?B?Tm9KTkRzL3ZyVXlYUzYva3VzRGp6U0h1OTZiczNtV3RrdlJWSkJDQTltSklK?=
 =?utf-8?B?YlVKN1Y4MEljb2dXdzFpSm1pci8veWZadkJvNUlXWHc0Ylpla2VOTEpFdkNP?=
 =?utf-8?B?R0FPMk5ITXVrd0ZyczlaMVdaL1pQT3MzR2p6ODJDbmlZQ0Q4OTdWa1ZkeFpa?=
 =?utf-8?B?MTMvTEpaZGtqdjZEMDZidTJpSWFzSVZRbWo1MUhJY2pra2tSVVMrRmcyaktQ?=
 =?utf-8?B?bkxPU2U5OVg2ZmhEc01hREFzOW5MbWNGK3VzMGlFU2R4L1k1RmJZSDFtQjdq?=
 =?utf-8?B?SkpnNWNwcUZXU2E0dm9rTjZ0UE5QT0xSM0FMSDBHc2FRVHduaUx3VTNMNTdL?=
 =?utf-8?B?UGxrd2QzYkVRVzRwZWJyQkZFOXFaTXdocVlsaGhtMDFERGQveHVxWUtiMThN?=
 =?utf-8?B?WHBTc3RBSlN6dEkvbk5ER01tejRGU3lra2wvakRKbGRObTZ4RFdnQmM2VStN?=
 =?utf-8?B?dkZ6dGRQa1dVSE9GTzlTdlFjMUx6VDVqSDNlZkFIR3RDSVhuQXVrRHpNMkF3?=
 =?utf-8?B?RzNSeU12UlFvZm95emw2LzRLTkh5NXp6QjFrMElqQllXbHMwbWFJbkh0NE94?=
 =?utf-8?B?WmcycldlWGk1ZnV5bXZ5Y0c1Q0ZtY0RzQUV4Y1FBN0g2SWNOcUxUamUyWkpq?=
 =?utf-8?B?MU56b2FHNk5jVlVYVGVBZ3ZyM0EvMW56eTlPUFUyRHRPTUgvMDdkQ0c3U1or?=
 =?utf-8?B?M1VOQ3MvQ245bVZXaldBWDNkMGNTMTAveitrWUJwaG5rd01tOUVvWVBrKzhY?=
 =?utf-8?B?bHNFNWFtRk5Jamx2NW8wdUd4WmdvUlhwVjJJazVmUGlEZ0FpbXlOMmFTTlYr?=
 =?utf-8?B?amc1R3FrQWFNTXhCbW84dVhXN3lxcjFEZWMreUNVTlJwQXM2YmltSDBmcitX?=
 =?utf-8?B?bE9OKzFYM2xicEh0Zk1tOTV0NHNzVVZ6N3JwYlhic0RLV3kybUZLUkNaMGJB?=
 =?utf-8?B?eGlVdyt4ZzVFWWJPWlpCQ0I5ZTdHYW9PWEFaMTAyZXRqeis0NDljV3diSFRl?=
 =?utf-8?B?em9hRnp3aCtvUjJuVlBRM1hJOFFoL01vSmVPSTNUS1lxc1FhaEx5eFZFV2hu?=
 =?utf-8?B?TzFoOHlEL1lZVGxNN1NOU29HS3VPR2J5T0kvTldveTY0U0VrcGR0TVlucXV4?=
 =?utf-8?B?eGFVQ3hlUUVmeDNJdXBRWDRxRnlKMjRxNXdNUDE1cTJNMkJid29WVlFiYVVQ?=
 =?utf-8?B?VkNIQnFqcGlOY3RFdHBNNG9qZFh4Q2RPeGd4N1dMQXhYckJ4Tk1mK0ViQlFm?=
 =?utf-8?B?azVqZDIrRGUzTmt2RzFFNVEzSjU4NmhmK2tSU0Q2TE1QaUZSSWVKZkM3cUpj?=
 =?utf-8?B?ZVpCMERIdzYzR3ZvdEpBTnJ2Vzd5TTdTZTUzV3RJS1FtMk90ZDA0cHZ6elZ3?=
 =?utf-8?B?SDdyRU1ocHkyR3VXSm1PWGc0Wm55eSs0Z3BlWjZwbG44MGZpSUdsTXR3ZGV6?=
 =?utf-8?B?T0lPNVBTVFBJYkVWNUNzaTBIVC9IZStDbDk1eEVJcUR2aWdaUHArbU9wcWFl?=
 =?utf-8?B?N2dHQVNIVFpLMHNXVTJzWXJGV3lObUZ2c2JqTzhzQXp5T3JEU0IzU1ZFZkJr?=
 =?utf-8?B?VEcxK09UWkNYa1laYjZXVG9IUjZXWVcrMzVtY3kvSXlVa0syZ0NHbDVxQTkz?=
 =?utf-8?B?ZUJDRGhON1A5a012NElqRENGMFpXV3h1bjRuemxPZ2RHZncyWEVSRzY4L1k2?=
 =?utf-8?B?SjcxMjRQZHZGYkZkUDdFWDRZTmt1dFBzZFZ3Y2h0c1RtNkY0RG0zNFREM2Jj?=
 =?utf-8?B?MTI4bU5iWERhTnhDWkRNWmJDazNYQkdNR2xleENzWG0xV3B6bmRaTDVEdkw2?=
 =?utf-8?B?R0cwWmJqelZYcXNpN3RpK2RocjdBVitIeGpTdGcxcTNQbW9maVRsTm5QdXVD?=
 =?utf-8?B?TE1ZM1RmakRaL0kzQzBFYjNHcUZ4ckhJQjFKZHU5Y3Y4MVFyelpYQ3ZtUHR4?=
 =?utf-8?B?NWxjQ2pXWXN4ZjY0a1ZYYklhTnczZ2tGWXdDWHhZbmQrZWlPUVpnZkhYd1Rl?=
 =?utf-8?B?WTNnWGhUTHFjZ2JZTGtsZDMxMk5XSkpaWVl5U0RZaG1oUzdvUU5HS2pWbE5X?=
 =?utf-8?Q?fnmv1odgyOOab9GfWd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811921bd-71bc-467d-a57d-08de8c489c93
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:22.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoDS+msCi4iYG6yy/VF5B6Le/VwoHAiFyJEs4Sf5kKYSHrpOE4UkanICqVf/gVBQpuqFGbQMIoqfpjUnHBsdYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34329-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 4A77734BC16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

	┌──────┐      ┌─────┐
	│ SOC  │      │     │    ┌───────┐
	│      │      │     │───►│ MMC   │
	│      │      │ MUX │    └───────┘
	│      ├─────►│     │    ┌───────┐
	│      │      │     │───►│ UART  │
	│      │      └─────┘    └───────┘
	│      │         ▲
	│      │    ┌────┴──────────────┐
	│ I2C  ├───►│ GPIO Expander     │
	└──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v4
- add Linus Walleij's review by tags

change in v3:
- collect rob's reviewed-by tag.

change in v2:
 - change descriptions for device, not for driver
 - add missed additionalProperties: false
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2b0385ed879b70b24ca9c39b098c3840d08d7482
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pinctrl device for on-board MUX Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Generic pinctrl device for on-board MUX Chips, which switch SoC signals
+  between different peripherals (e.g. MMC and UART).
+
+  The MUX select lines are often driven by a I2C GPIO expander.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


