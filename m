Return-Path: <linux-gpio+bounces-23000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53034AFEB2A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E831BC0086
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88B52E62DA;
	Wed,  9 Jul 2025 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ASXljfkR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76881E505;
	Wed,  9 Jul 2025 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069335; cv=fail; b=eGvMJ449ZmhownvXa2P3SJP8c+A+hgJner1514EAjSHGo4gm+0i+OYj+vSQdwsmEgaPyb9aC2L8TuqGoj9k4/alInwccc3zEkhoOXwawM/8ZjMmSvFN8tCupU2W9dsG3PNzOYPQ+hX3FSvPLjgYe3BlLJRKtS7LCR2io16I2ae4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069335; c=relaxed/simple;
	bh=RWIVVNxwJl1NoAgMrll6FA3orvN/uhUTnbtSLzh5VmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HGz+vF9Qev2eMVEWvhNlCkBTM4visyMWmDi7jvewoR6mJMUEsL+DzVjEU1oIRvfKwgEgqnwtpQ5n8/pfxrqJ0Id7MmvuG74sRgaUJL4kw4Iw3dYTB2wXWP+n+/ypCdecfX9eB/eSUYm4ybG3ApTF8uR2Ehmd6ufIvds0tBZ5b74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ASXljfkR; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3+YdvLeQvBXotyLUmJH/+Jjd43Bbl3HgAHtL2hsywLldV7etfHd0qp47pWPGfOkpIqnqImY6Lz0AgMI8ID+9q4Nl4QBbsni2MeIwaZvgmsKpLsm6EMKh4fPuhLjL+JjMv4y1dfIITGwsD6SIpJH2YhEaedmmSt1UIdTh2uPOnzGRvplGWZxTFXIcZ2K1hNnbYeQ8NihZNQyfAmMjhcRHohtCG/zAXO8b5DO9AHaIN4nddexYnX6raMxIjgsLB6nJTH4jFd4EsjnV8mXP+37BsA88PgQpbpXUwKUJ//TpAHBVGbfuZseGqMPt2qdUPd8Wpxbp1bm/IhHCseZzB9fgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6/vwkW82qoQWrV89+srymJxcEx3e90cyJI9SDfLR74=;
 b=SVszb+LjpGUNkOuKO/kKNoo1G6k0o1957zzl1Zp/+McF5kYfN1LfuemdtAxo4vGNWE6CbKWA7G2A2UsH0R47tGnRvdo0sftnqTBoPAfCdpt9jYxScfFqZxYszMuYW086vwNjnjXSeCy+6aKS48hZXKpsUnykBJAzFMkYkliMeNPPuM+5ysmy0Nk+3LUTeM42AEMVYjDZ47yubX5EGkO34coXBQEoaXL9k97jV2BsSnI2OF62H3zCtuFBNXF4mdWHZ3sdn32uIgo3dMmAglXPNdm5nOG7B3/I0Ps2bVUfG+4IYlXQED4mre7PRbHqw2dS8tVprWseS7tr/RbdrcGGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6/vwkW82qoQWrV89+srymJxcEx3e90cyJI9SDfLR74=;
 b=ASXljfkRoUKV0HpOD+LLQEre/s23e5oeFyBOLiwoXTD1EIeCPnxCG92v6BMC7qHwQ0KQA7z05/76703UOVFz0zK2L5Wem7Ny5mAhqgQME/ZXL/2f5fh8sL4nh0dbJP2iOYfg3ukSHICDAF+y5HqO/JZLbJ+zhKCq/ITvriK3axrTeJ65YLuzXG0AQl6ZBMu2ildWjGei6o5fohqq3inNF5cyKOMUsuGTPZiPjldXyV/6JgQ2ZWckaha8GUFfkleiq9YiAbj6CERhym0mgpz8J5uFga68afV+Vm4tQE1Z/FVPWgpZcFKHu0rwpAs6cZeU53I/DGv3EuhUXBOVT3saew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 13:55:28 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 13:55:28 +0000
Date: Wed, 9 Jul 2025 16:55:24 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
Message-ID: <lv55xheu2glgsgey2wdupqp3cvem27afhrs3ibhzqgglf4ql6a@tzy7uwule7z4>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
 <9aff4894-a8aa-47d2-8800-62959e064254@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9aff4894-a8aa-47d2-8800-62959e064254@kernel.org>
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 7889dbd6-2cac-4310-9ccc-08ddbef042b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o7xoMl8rNA8D7/m+ZxdS7vkdbYJD+5GOTlDOIBGJfhFEVy9qlrCTWJ6g5Kif?=
 =?us-ascii?Q?n0oN6iZSnvqAzjQYnSzaEgnRFXczyBRiNliqk1hK0yfMJ9Y6wQ1AJTzsRrcs?=
 =?us-ascii?Q?6VxLm7ilLSgfh9WYydv7bxq89XaxEBNZwyNLkm4tQqZYcomxgNJlbAa1gmwY?=
 =?us-ascii?Q?trmrKDPHCR7aZTJfSs2wgu0aRDM/wULsOu5RBGTitDli9bVKB22Y0J3B9dit?=
 =?us-ascii?Q?hJ1WZEbVx9AEDGpXCiXNPUOq9k7xRD+rjKLKyAI9BtWk9+IEfNRiYcPHmSAx?=
 =?us-ascii?Q?hy3eDL+QWWCG7t5qMMv/ugDXFmOvXJNpB8V2nHRgu4TzGKyMG5Pyz385sHuv?=
 =?us-ascii?Q?9tz4usL3jfGdd849nO8SArW4OfxRAE7/o9jvZIZQ7m12AjKNwHeHDxf3oJ/b?=
 =?us-ascii?Q?uUhYP396rRoNJrc1ok5WvO4a2bH4CzCA0Wf5ivYtUIdJDE8mcEcO1HYwou7r?=
 =?us-ascii?Q?b4WqTcc5J7e2sn8++kgw6bYH8n8ckSlnFaOPGEGW9DHef4hSlR9t7GCTzZrJ?=
 =?us-ascii?Q?50hSgXLE7fE3U3OaH9GqT9fyVXZubM5NMtzYaaMLXqRhvNp/B/Xs174Jn7mk?=
 =?us-ascii?Q?WQ57nFJ+JNDSe6mDgQoW3HC6EzkNJ5lqE3wJ/DvvTCloWu9yguNoUfAihxEQ?=
 =?us-ascii?Q?kxpT8w13g5RLtbPNhuAQvrKdYjIWB1bE23ExgOWV78fAMSGI5brN2NtNobU5?=
 =?us-ascii?Q?sAXtWbrGbdYvuOIW/UIgT9UixxBnjuNZscRd9rKgefcWg9c6vlL69+csGdCE?=
 =?us-ascii?Q?3SadHEy8P5f5sp5fW6xPWxD8/i86zMVpP2rxlg8zVgWtzG9Da6aK6Q8O4DuB?=
 =?us-ascii?Q?U3PX9RpHRcF67LuzcM2Q9gV1eZ/FOy0sBKgsvoTMoubQvFHA6D0itvS9UYRP?=
 =?us-ascii?Q?1XBiBPnxxbHyyBEV66NW0G4Q4kgvyHxZjks1JgYozoZAgcPrsdkslgLexVxl?=
 =?us-ascii?Q?3N4buvUv3uaXM3hiqTUymN0Nelq4MzjcyTfFAS571iuH9GlfoPXxc9z6AvLx?=
 =?us-ascii?Q?BthCjJ/Jm0FlQovSh7oSIEkR+HeQLGNAykYDNX1R/lXI2azcwJ+Qb0Igkd1d?=
 =?us-ascii?Q?C+RjZ5aar1LdeQDPlxYDLFovX3KW6sz30njQQJ9ENVqP4RF93XBPqfN0ZLE+?=
 =?us-ascii?Q?hFeXg1x3/d40CoL8nZ7+jR95dDjYLjDbH1ja3UvqZFLZSM9pptuvmkuL6S42?=
 =?us-ascii?Q?Gy6BrX/ZZ/FGimSAQ1e3corz8ckvA4tcv5EK5HcqqOmkfisnK+K68ljOHlVB?=
 =?us-ascii?Q?7BxZ9PPQK2lDGfBqhw1slXqpmH7BvpkkJD0/oR4B/uXp+iRnbVlWgOaRTaAa?=
 =?us-ascii?Q?+lwluFfQ9kHzXXTIuk3vtQW82by56kLHqlKMzka6ioC5R08cBsf9dSuL4ZcN?=
 =?us-ascii?Q?3m12qbSqVF/wzGfAeOSko3bVlqn/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bS3NP2RCQ7BdNT5z8Webk6pNBmnpGaWuuqf00xND06wtGskp9FzdqUk0WosI?=
 =?us-ascii?Q?JIdtvlmLfpXLN6ULRmOLSpggeLYwptm0IEdlresXJ5VLOSjg2j3eAun9hJtx?=
 =?us-ascii?Q?LYKvxWBGbN+jWSlWAPxWv7rBHJC189sBKR7SS9lTSdhwO8VfUiAcuzL6hF8D?=
 =?us-ascii?Q?q9Zq97q5KPqOBEDSkx/CLvReyQk/b2Im5zke2eECoDrcUimAr/p+9x58eXRs?=
 =?us-ascii?Q?0iUZCs+wKKYp5GJ22+Dngsr3xo203/wPzUCHdprgUo9HetTyfa4rPQA7IYzd?=
 =?us-ascii?Q?WsoKrU9NTJBWhscrGeEkLRQXsomSz3ukh26xBVEhTYIgqHQms19YThP122ZV?=
 =?us-ascii?Q?S13Q/jmCaStugLMgIlzT0NN/q4DlbaVoitLnW4nOnh3z9T+UiZSi4l7Jz/k4?=
 =?us-ascii?Q?2y5IdkVt2DRGnscatKQ9GbJs51MHHX6F/SW/GpZwSj3sS1nrJ3f243JvzyGu?=
 =?us-ascii?Q?Lb2/EJFQp46CST8rEw/TIrmdt9GbbRA6mK4OqeNDzU2DlkyvppH1W/lYJ6Nn?=
 =?us-ascii?Q?6s2USdyQQ5mj6tbHv5O32GWbZ5tCwbpgp/NenazSSuDjkNhVuKwEzNgQPoK+?=
 =?us-ascii?Q?pet7QD621VYHEHA+RpGxeaa+GAEEidRQOVvQn3Zoj1Gts32gujYOLIy7wisF?=
 =?us-ascii?Q?qVKm2zFi2sIBpl9dZLM8TaKNCNuBqUZwvVCaM5Ooa1BB+thyhVY08O/CxoJK?=
 =?us-ascii?Q?QNLIZhA31JmkLXsIINEBdHEwGwI0HrIlSuxJUgZZAN+M+3Ww55QSM7tMnFx1?=
 =?us-ascii?Q?B/g6z1Zr5c5iOJvQy1DKP8coit71hrpeFc3eI8tuuIZO2P49U1AU/3tYiYEE?=
 =?us-ascii?Q?HmVwhsMrHWxbIanwd/xOW0HixZlLAYt5OTE+iqTmPhHKbIoy2QdCJH9uzl6r?=
 =?us-ascii?Q?kKRMtdsAkHG/7Jomr+X+MLWkM3oKxLzYlj1RNDZh7OK4AqbHTza8U5b4NGGR?=
 =?us-ascii?Q?MqgBROkjBy8FehDUSzXik1XdBY69MFQEXvphUPQag8si+B9ToCq81C+tARKM?=
 =?us-ascii?Q?JHzQ1ODze0qCfEUTlR5QUrxJlLXYG086GCXTPn+dixU+w6IZ8GpUY9hXN6dK?=
 =?us-ascii?Q?h2SLf5qQUdg+ZR8aeg60z1Oem2GuhT0lKnlYJ8qL5GrbNCRnpSmFb8zIHlYP?=
 =?us-ascii?Q?fWfcJ2nACk2bbCBwB+ys6KhLx2ZqvybwRPs12sXnfBhSZGAmFNU9MK0FYanl?=
 =?us-ascii?Q?LRh9+u283NtW+0bGrtfIMt8CNGiEiSs2n/oDl9g/FlpF8LYKKa3p5N83ORSg?=
 =?us-ascii?Q?eR81Gvbby8qinQU8FLwQfuqQbILoxwl75a5ccBwIkDBBA6MtdDrPejKtWZcM?=
 =?us-ascii?Q?F5rxiKCTL/CCGmQ0Jz5dxKUuxAusB1oMG1+75bPK1xjDNwoePDuUP146SrGr?=
 =?us-ascii?Q?d+1gxMVfx6TUYE/mJO99+On0Eg+G57UshX9j6QLsFH5DyY2xMZa6bg9ZcM2O?=
 =?us-ascii?Q?JUNbwzXJ8MSqeTJRf839/kMgTnSl48Hs2fvKWHCuqVSreWtad6PGeyMRrSLQ?=
 =?us-ascii?Q?ruOQfH/UJYMC6ZjcauaoE0IXlOc3saMMfFcd1/6NZMBAcI5w/D/t1i0+e2yV?=
 =?us-ascii?Q?iTSzVxD/SFFvoOHSkefqejQ32LWy+RftgNW7C2h1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7889dbd6-2cac-4310-9ccc-08ddbef042b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:55:28.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgP9WQTQrEFPOfGzGJ72oLQnQ8Z0qJ+8Lrnqr/HBa2fHJs09XQBDtVc75WEplvlPn6Ev/yUbJX8FZdGBzQhn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301

On Wed, Jul 09, 2025 at 02:14:47PM +0200, Krzysztof Kozlowski wrote:
> On 09/07/2025 13:26, Ioana Ciornei wrote:
> > Add a device tree binding for the QIXIS FPGA based GPIO controller.
> > Depending on the board, the QIXIS FPGA exposes registers which act as a
> > GPIO controller, each with 8 GPIO lines of fixed direction.
> > 
> > Since each QIXIS FPGA layout has its particularities, add a separate
> > compatible string for each board/GPIO register combination supported.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Your changelog explains patches, which is kind of redundant - we see
> that - but does not explain the dependency you have here between patches.
> 

Do you mean the logical dependency between all the components like
FPGAs, GPIOs etc? I can expand on that, sure. I will also update the
cover letter with some of the information below.
If this is not what you are looking for, please let me know.

Layerscape boards such as those that I update here have a QIXIS FPGA
accessible through I2C. This FPGA exposes a set of registers which can
be used to monitor the status of different components, configure muxing,
act as GPIO controllers etc.

Since the register layout that this device exposes is different on a per
board basis, each board has a different compatible string such as the
one that patch 2/9 adds - fsl,lx2160ardb-fpga.

Going deeper, some of these registers are acting as GPIO controllers
exposing status/control of different SFP cages on the board. For these
kind of registers the new gpio-regmap driver is added.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 

Sure. Will fix.

> > ---
> >  .../bindings/gpio/fsl,fpga-gpio.yaml          | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> > new file mode 100644
> > index 000000000000..dc7b6c0d9b40
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/fsl,fpga-gpio.yaml
> > +$schema: http://devicetree.org/meta-schemas/core.yaml
> > +
> > +title: GPIO controller embedded in the NXP QIXIS FPGA
> > +
> > +maintainers:
> > +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> > +
> > +description: |
> > +  This module is part of the QIXIS FPGA found on some Layerscape boards such as
> > +  LX2160ARDB and LS1046AQDS. For more details see
> > +  ../board/fsl,fpga-qixis-i2c.yaml.
> 
> There are no "board" bindings, so this does not feel like correct path.

As you have seen already in patch 2/9 there is already a dt-binding in
the board/ folder.

> 
> > +
> > +  Each controller supports a maximum of 8 GPIO lines and each line has a fixed
> > +  direction which cannot be changed using a direction register.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,lx2160ardb-fpga-gpio-sfp2
> > +      - fsl,lx2160ardb-fpga-gpio-sfp3
> 
> What is the difference between these?

The layout of the registers backing these two GPIO controllers is the
same but they each expose status/control of different SFP cages.

> 
> > +      - fsl,ls1046aqds-fpga-gpio-stat-pres2
> 
> Keep list sorted.
> 

Sure. Will fix.


