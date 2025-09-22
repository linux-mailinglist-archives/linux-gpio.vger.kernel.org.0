Return-Path: <linux-gpio+bounces-26483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8913B91C3E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E23B3A9600
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46EF27BF85;
	Mon, 22 Sep 2025 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TyG2yUmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD619F111;
	Mon, 22 Sep 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552122; cv=fail; b=WOBAPrDsnAoNXumabbe50ecomwgWyC7oY2z8/qjKQZg0UQPsIwRGbDJ/10gsVWIQpVRBQpuzYsl/yGleFRvf6TUc83x2DSWK0ghbcKfXgR6gKYMM/ejrIAykrbj2ybaUB/zXihIyjCih7KAclKF1PlRTtA8qc9Xj+1jXR3PanKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552122; c=relaxed/simple;
	bh=GTpmbZO2ThdhZIQnivvm7ikYPyZpoUm63uTlBfY8svk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S5IwddkeNKQSH1kyBFzUJHW3S6bjakeaXNLMA2a07g5JayXgPzQM+G3uzuvBpiS2m3AUCfKr+3rIvMtOLB4eQEExNXet9uV5pljmUY4nVCwVcyq4oxkbafR4eqgvuPIANwOBFirJDj/E97bP0d+TK4VnsAHdU6aXx9e7wJ7yLmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TyG2yUmJ; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g87u/at2LV8zNdFsd0KAhA2WgOgcbC4c0Z8ioGCtdwtH5w1rzvYY2dFWuQXeZUDi/t8CTBzOPGypxOV3QrgYdsTBzpPzuX6f9oJN3kyOl2oQc8rDO9aVUVKEhtrZHNkgfENv3hxv8h6VeonyOEOJavYC0PNg2JHnqL9q6Gmyk6ry9EZnRzUks7Lx/cywM0EcZ5ONF/kjm/+FB2nNPgih2uj5sq8unwCfD1invxBoSS4TX30e6XNSVYSddg9NDW8q97SMVwOL6oq+Ne9bBV4w7dSgqnh2y+/GHe0GOr4mOajwhLI8GGPlnXEi7FSFnlqwgTOg5A2PHtOkJSOWYntIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQ7YsEx8FWbsNumFQidRF3h90Nk1NkOKYwxUin44GJM=;
 b=L8DpOz/XWK52pb5/45IE3gpK+WzsAtTpRC5CD+ege/TpEztulNP61/rtuZXvP31M1XXx6L4CiNEfYs1ZuPL5gS9IlcNG4AGwYfOhwI8OaCByedQUdLoP3DBPhz/gdCL1vVNGQE2+BbG/6EANv0X5EcFdd/3NqWUQQPdGFfplMUhgwPbJ1R7Adkt3TDbQmudsDp3EpO2gP7+Uz/Fg+T34SDGNf9Dy4cnZJIXoZq8cMD+OYqIdzNgPWWKS3cX4PQT+EpQkc/aZ9bXO4bLRWVjdpnBf9vdZmXp5TB+IbJknWFQ90152zxRXwEWgKtsf1XDdkm+qGF4biI02zZq4viWa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQ7YsEx8FWbsNumFQidRF3h90Nk1NkOKYwxUin44GJM=;
 b=TyG2yUmJjjonlK84Y+MEEuiWXquG/9DBVl5WQpqQUj36iMr+8JNhGuFG5MKGERecMTaBih/XA0MEt0SBfFsJXHirKtdCGXE86Ip4rk/jpkeRYNoUMZcyZKDDF4qPJpQIcB82Xstvb8f1ucbs+nW3AiX8hzgNXPALRwT67TFCGmEgM5Sedc5iv5usts1CNzK/s54NsMsmuPqLN6DvG8VZO/V7IRYVPmUPguWXGRnQDCWXbHJz06dFtxOPDuRZ1L9XpjChORL73F+CRMkpM0VGcPTEGzaiW0/dDUQKtRPxICg7svvNykrU56SlPx1Y8oc2XktCZqvjGtpLrde1HN3XMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:41:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:41:56 +0000
Date: Mon, 22 Sep 2025 17:41:53 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v5 00/12] drivers: gpio: and the QIXIS FPGA GPIO
 controller
Message-ID: <tivmhgayexnbolynvgea7yecfnx4c6cmz4iwmwf7bdi2eepqze@mlv6hpzz7uo3>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <175855172655.83493.11261124209453796236.b4-ty@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175855172655.83493.11261124209453796236.b4-ty@linaro.org>
X-ClientProxiedBy: AM4PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:205::40)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 10eacaf7-0d46-49c1-76df-08ddf9e62dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5VUa0i0PesvluIfKuvd1kP/86wMzlhno1y5ZjJvFObmlQ/jf0GVuGaY1944Y?=
 =?us-ascii?Q?76m50CpkAt9zSTMWb5jKEdXNTtbirf46kHTOGLdtOlxhBxEuFvrWrfjhazQl?=
 =?us-ascii?Q?N0KVnSs45SgL8uz7pVu2tnEns8wy2sqzgzd/m4wVbsVtih+uUL1ms/K4jsKx?=
 =?us-ascii?Q?wk8nxKlRclivua2hgeBl1k+jEGUcRHCPUcIPkLeLKpApBKvgnH8E7iKTpu33?=
 =?us-ascii?Q?Yrdxnfnbig/gP+hZUt6OdNNZXH9cKiWdNdMma4yJ3FKTG7OCbCMtHNf66EV9?=
 =?us-ascii?Q?f1bwP2SfQYUnVYxjhFi6CT7rLDD7mC3UYd624gZzZd33/07NDFbyoxBTZ2mo?=
 =?us-ascii?Q?hmTv11YTAwvpD6+ZZMnQBI+uyUj5nXaavu0jbwlk/8RfwmlLcxMisoYonN88?=
 =?us-ascii?Q?X8JX6GangGZjbZCaK5pZrOnOjMp4QJzjaecsw+1jChdKvxMWszesDslDzK8w?=
 =?us-ascii?Q?VrW66OV771ISRU8esjCo5J/m+Z9zu+ZxDnta7qqB778Db1J2NnEgD/40KOtc?=
 =?us-ascii?Q?81EHHt0fVVNTrw3QqnwbByQQUv5ZCE8n76VcrVkkrgvioCtHmvVyfE6RzE54?=
 =?us-ascii?Q?2dwVQ45ZCAgUKLeKRE2v/4JdTD1tOgoq5HZYe2w1qcpgOmeVz4qaFiq6fhtN?=
 =?us-ascii?Q?9KLhNNWC4351j0T3ow/8cteRCZeAiYhNXSITTY+HBaQ52e86rsOaBwBfiQH9?=
 =?us-ascii?Q?ZzhwGKF1QdC9OB1v/RnMvpTBm30WKDPszB+JCNIkmzkb0+1vj+/ktNRNWw3l?=
 =?us-ascii?Q?VALDm2PSYLw789aebhrEXGGGUdfLZwle76tqOAEY17upaO1Iy16kFGTAOrJv?=
 =?us-ascii?Q?c7AjL34RNbMjZxD1gxO2QpklC+MYNeTo/NuUXh19DF9qaJVMiFgdV2KmaeZc?=
 =?us-ascii?Q?HEPGVJ35NJDEdtLeE9k/XvBPcE6WYzE6Pn+oOBqhyyzhtXj0U/8NZtMm+isW?=
 =?us-ascii?Q?f8iDxT0ratapDmVl84eALbeUYxeBsmQlWhUtx9qKq0fN33eRPWQ0cgDakphW?=
 =?us-ascii?Q?r82XGkjDhkwoGpXe3qaHs/7gTtSx776qzMTWChSLEbtF46iCGH4A14J3fX0y?=
 =?us-ascii?Q?gswS7wXoX9avXzz0k3KFP6NH2U36pL5U0Rg719z1a05CrFfokVxDB9E1cbVo?=
 =?us-ascii?Q?N4/HIxq21MD4ZKOUwvjLDOVpy9Zcrrcy6o9Ucw3YAhAvRKNtbZJiOhMPWmKg?=
 =?us-ascii?Q?MDtjmpN+kYYoF0C2V8thCTjt9pd9bb3dObebMg9VqxbCZ/UiCOyb0HJ1o9py?=
 =?us-ascii?Q?lCOqRmamliR6ZShPFBDJ6fVEbPqEGvJ5w6/I2qy26Mw0wFWZNXBGmZS6pz7V?=
 =?us-ascii?Q?BQZsNYlO1+mqy4Pofr0fbt8/J1fp3vSubgwrYNet8GzZcQMo3YJ2rOHzkiui?=
 =?us-ascii?Q?FfkVvXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCArDdaH3lCz+9gI2iUIwTG0FL0/e8v5llq5BDhUuIjqSdVjWvKM9L9X36WW?=
 =?us-ascii?Q?flckc8youA+0Ac/C7gXfEWGUxOMT8hY7BH5vhvVramZoLH5AjRvB2d7Z8ssz?=
 =?us-ascii?Q?8IQ8U/e0gGRc1lf1b5gGyeVb1/ewyaWQe0BSWMkLPaxQiIGC7qr4azy3STmu?=
 =?us-ascii?Q?zkzlzeia/m9uzCMkX60ufX7pfNACiMAvwwdop/TefyWc0E/9nKEaXaqD8OzG?=
 =?us-ascii?Q?kJ87RsbHD5m7d8utudDk/8ujjRqr7ZJG3k7oo2u7iOnfp01khL6HEVkZlVVT?=
 =?us-ascii?Q?cCPjvnGkD/r2r9+7v3NDvPb0vTdphBDfvni/9PDj3FX6hI8tCFBGaHokGrjm?=
 =?us-ascii?Q?deliqMMA9bfC8ep1fFSa9mYRy210ixwfMYE1GLiedkH6lo21B456ip7iTr1J?=
 =?us-ascii?Q?SJO+FPSuBPzqQOETIhxuMvU7Muw5KV1F+hjFhZ9vMUXktmByDVkwI5yiKeIv?=
 =?us-ascii?Q?rgQl3xS3FFW2vj+Z22eP30BXE0HcF0foj4mciwj7H9b8WVJf78LihSifj8kc?=
 =?us-ascii?Q?9xMjMnKklH4CYlbowdMpxwrpgbfUuAv/RgWhqt6rJkTE+rm0ze4aopOHq3mk?=
 =?us-ascii?Q?Jj9ILjQSBSbIAWgyS2DNQSwb4PqiWUcWwsVm0dUwlevqKBIyOjhW1SwIogTF?=
 =?us-ascii?Q?zR6K5M4gmRLP0iPVi2QSo9ph42vfKmFMrph45y9GEqv7hfePl9dFC4J/Tz95?=
 =?us-ascii?Q?t5eEGMGH9MY5ql2L8gUFY9eo0kCl/90+4d9jmr+pmHIndbEBhJTOjvTBSHyS?=
 =?us-ascii?Q?Qv99LnCg4QmhQASVMLS8dMVScZRkmx7Tq7F8jpe7Zzp3bAaJMX2VqDU2Jsfs?=
 =?us-ascii?Q?gaJisVkNTDMLzkqn77QDtrGchujDrRWN9lPNjS51gzvUWE/vMspySnCsFQBa?=
 =?us-ascii?Q?KSmtODiyaBHrYdOxOSg3+iDUhaHs8z9MxxIBO2x5+4EozrLWDlP0fulpgh86?=
 =?us-ascii?Q?WdOIO3JjLuVbCiHA3QJ9dImk4o6NsQi/Jx5MzMN74V2NFmFK2wJ7hD9daR5Y?=
 =?us-ascii?Q?Hoq7YwZdDGSPznEahiDFWMAZfX2Nrf8kAR0n1qxMNAOsXmQnqsnnHXhk1NUF?=
 =?us-ascii?Q?f11DQ3BZDWP4LVKKtX7WCOyBOKLrfX5EjmRDWZu+If/TKyo6coFjgDU5LLAI?=
 =?us-ascii?Q?IpzfPI1jGJ3LHbgOSoo5rDhY3iYf9HWtK1pL85KBE2GvgfQsBVpu+XSos0TV?=
 =?us-ascii?Q?3HlmvDH8pKfSShfOSagtl8grcPMi+RbIiyULFYfJibQ5pfmpWV5Yu900eXUC?=
 =?us-ascii?Q?/xRuk5OuUZXAl3rYDqXjaCx4LiJ6ZUAvrsEgo8NUJjoSRDTR0DwYcL0apbkY?=
 =?us-ascii?Q?T4m7txRN+hV8pmkvQKBT81ItDg2Yn9F6q4fOnvIp4z2rzt9SharytbWJIiML?=
 =?us-ascii?Q?2yVsW5bbw1aN6bSbk1aAyTg5KvOo7xxUnOX3p3SL40jhrQVAfKmC3Rrcuh7p?=
 =?us-ascii?Q?wmf5aKN9jSsbNIiK4slQZYTB5rrtR7ipiStxg6qi7+sxBl4EGvfRBeI7Isms?=
 =?us-ascii?Q?owsA3nGqc7w+WDwO9EZKVv03JaJhsKMytTBbcrNFhCKrUIn7si+4M+tl8X8a?=
 =?us-ascii?Q?3JSJ9M9diRmX8DNMY4bxj5Cr6A1CTvbAM3Qk2z36?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10eacaf7-0d46-49c1-76df-08ddf9e62dbc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:41:56.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7KeBv2PO4u2rXJ0H9syyqYNHJMiaPtlZcyESwStSBpmspGnfQm4lnqhKKpqB5e2pnhmMNgo6ES2US4tYM1zyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

On Mon, Sep 22, 2025 at 04:36:11PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Mon, 22 Sep 2025 17:24:15 +0300, Ioana Ciornei wrote:
> > This patch set adds support for the GPIO controllers on the QIXIS FPGAs
> > found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
> > the same time it describes the SFP+ cages found on these boards, which
> > are the users of those GPIO lines.
> > 
> > Before actually adding the GPIO driver, patches #2 and #3 add and
> > describe a new compatible string - fsl,lx2160ardb-fpga - which would be
> > used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
> > other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
> > fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
> > will be used in the next patches when the gpio controller node will
> > define its unit address as the address of its underlying register offset
> > inside the FPGA. This requirement is described in the yaml file and it
> > only affects the newly added compatible.
> > 
> > [...]
> 
> It's too late into the cycle for the entire series to make the v6.18 merge
> window but I queued this for fixes and will send it for v6.17.
> 
> [06/12] gpio: regmap: fix memory leak of gpio_regmap structure
>         https://git.kernel.org/brgl/linux/c/3bd44edd6c55828fd4e11cb0efce5b7160bfa2de

Ok, sure.

I will re-submit after the merge window with what patches remain.

Ioana

