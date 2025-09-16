Return-Path: <linux-gpio+bounces-26217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B90B59D60
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73ADB3AE4AE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC9B3054C8;
	Tue, 16 Sep 2025 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BJFTAbHY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E329E109;
	Tue, 16 Sep 2025 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039503; cv=fail; b=uALzevba6z/ydrLXZdlFAvGPb/HA1xRAG9/+rNZg5dz+T7cPr88k9R2LsamZkI7yf0+17n2v3Ma8E4rVS/BSex1Jrj8HSqu5CmjyNlP34p8mBiNHQheE2HUsSMmwcJg9GY2O21vuxYUIaDASLfk0ztV8gMXy+pzDR8OnRwDaJB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039503; c=relaxed/simple;
	bh=aHv4wH3rYZtlZ2f8zSdzp3uGtETYa+9RDtssFIhGRqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HLwOebmrtP78i9kM/NVTiAU92NPZjUtJ6tvQBuxYxpZmSuhzxgxLb85LvXBvlpaZqm+FclNa2ro7OO1btdExpkDFyj4vOvRyutFD8oYXIe0QctKewb2n8L2mYaAsjcAtot1AEc/pH3kecyCXGSWFsCKEAbHeVNRZ0gvxiGia6MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BJFTAbHY; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk2jn+17OetEMJx8YxyDkESsNj6NFwZkrXHsaKW5k9Ij9BiRUsqWbRC1SduBnoJDQ52XeS4vNlc9N8oayVQyKZwmtHgED14MgRIR+alN1aB0T/WyXmjpUfclWT33EC0bMNtyYR766ZXQ/PFRGtrg6GjKM2shyJIioc8I1vbxRNqgfQjvdWxmvY+4db5Buqyw6sruE6dO54TiJShK3wQRNvt4Xg28wgg6aP2l4U0V1A9hlHOlUb/yHUCLqjgN2NJ9m6xVQ3J8wVNNU5kJkUIMVFpi1g3E17zwdkW8q68+3L5r18xxAo3VuG0PK/sLfCnQoud+EdNbIjixpYqJoehm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbU7EaSi9djusq9Yz7fwkj8Sq+AJyXy47zhbxovEDok=;
 b=O6SfsCZbya7VQsW3wr00PDaUEeQySBXeK4H/W4Eo3A7MWeLFpkqjPn4LnIr/TeEx3f5sAfF0ZnrmXLuvHnNHIUFEpO2v+lo1UqoZ0pMqrjR1E4NjtWxfDBglh3II4kyMKsQRToqHLJoKmKnmYRT0i/VqMIX3DNHEeGWotPM8GRqPhQaOmXLK/iNd9aC6SSp+QQfo8WTyFNbiuvR1OTKOuolHhrVPvwYtYnOlZsyQk/QB72/PrjzoZt0SMmLbw3gh9FVgT0ZbcxxZC2uk/xlZJrd3WXFEBu4sJQAYp9LCmxjbZDygP3tn8UsbKI0MxTT37AJzP97CTWqx92bLSwxcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbU7EaSi9djusq9Yz7fwkj8Sq+AJyXy47zhbxovEDok=;
 b=BJFTAbHY0Qc9/UsXO9dldwBVQHTxkSFUcerpESBUYgr//mQW4niwkkUv/JGc3Bozh26NQ1TtyOtcfdJELwismiOy53qHOQ4VnkpJJIQyDAUrwuKB1I3oZuCF9beoomvuFgtzUAlX6UV7BKjRQ2H2gkhTPljvMnfsfDuc5k1VDEssCF1OWNQ6LvLnu5yR6mLdWatd1FTlyzkMfK2/2RfWzJP+2v7WroV5crDbpkA59tn6FhEct8Sfc1z0OIa6ikyYyFHNbQ9q9Gf8d6gE4Gn5VKNXbabqDnip5zVtruI0WrcYc1c7T44h32tj2OJFIVYT8eEoE0G3g4UAHwliK1ebTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 16:18:18 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:18:18 +0000
Date: Tue, 16 Sep 2025 12:18:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support
 to also cover the LX2160ARDB FPGA
Message-ID: <aMmNwurzsaPXDs4t@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-3-ioana.ciornei@nxp.com>
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd56cab-092f-4c84-8375-08ddf53ca59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2fR7Vn+9hIPwnxdubF0HHurINYd1HkLPw+60QArk1D4qX6uYlPVDZL6EBw+H?=
 =?us-ascii?Q?OY6Czuw8+WhHZn25Er82nyH/1GUpviVQFKOSa5qXb9M2LEtCjrXgb0TM4yKD?=
 =?us-ascii?Q?ItouWHhYyj/QokG9syJsJxOipbCcSZKN0+GI5cw7QaAX99aqp9Y/4KyLNPiS?=
 =?us-ascii?Q?oWdcnFzczmprYz2XJ2hPuR+HHrrKZ+z+GLtpMZikHPAp5biJs+ipwrBE/9/L?=
 =?us-ascii?Q?ZRr/b/wZ7KHuLUQQUEjKKLrUANHC9PBKI8wHAaYH5hxUE70zjxbsdVmeT2av?=
 =?us-ascii?Q?DbSLHdwc0qXwgUilshQk2muoyHKUs4UYdvYoJI4Rsd4/XtenfT4S/P3u7UIj?=
 =?us-ascii?Q?CG9KRF2yaNSlfbQXzVLlCqFKbLlk8xQNboUcNEuNf3/WJwhkJ8mXOCg+kZ0l?=
 =?us-ascii?Q?poH5KcbAL/Kkff66wm0mpIywOcXRQku/LaWDyLlXv/iyAPl8yleXnAZJ5FZG?=
 =?us-ascii?Q?vHb9nyUvkitYMeG1vdPMEKp2lgFI9vHcftHCl/lYUZy1gOGQhDi/8E+sM3wE?=
 =?us-ascii?Q?CaS1IQfnRtf3P3nJMxSRIxdIw02JBYnU0YjoSO1NGMEebIc9qrTcePJARtl4?=
 =?us-ascii?Q?unGoQWs35ezpqQUIBwKCshj48I0RiAoPkgXiy1id+mbqIU+Wam0EAsfKWFrH?=
 =?us-ascii?Q?OrhegkoKWjyeoYk39Uxs2Uo0EmxKdEXaCzclyoJlE1y4HJj/UffFtlaf2V2r?=
 =?us-ascii?Q?rNJ+abIvKwPYEFv2sgUZpUbfJ1Pyfrs7GUyX6RWEOzFnI/lYoYDy89+nAtM0?=
 =?us-ascii?Q?SnQFJPnNRKSc52evWSWbJZbACkbIHn7ZmaHaAErMK3gcq6j4xE1F95tWoifi?=
 =?us-ascii?Q?wVnRI5MI6f3bi2vOi0BSw7ZsGIFhthHSd4b1kXasbw/sLoiulEx8EGqy2Pr8?=
 =?us-ascii?Q?pIdOxBBqxw4HjOVI8hAvLJD/Xz8BwFxLfQT9f5H+NQnV8DDGGzKnP5rUeF/z?=
 =?us-ascii?Q?uJD0wmt428F2QOuNLMT/qgVxIPheTld1cwwAG7UxJHGVK3g2djfeOcoTgJyr?=
 =?us-ascii?Q?BPXoKnLAtygt8d7n+79hxiePb8SzYvrtofhcJBBRcUBQ45mVyZJVZ3Krl2or?=
 =?us-ascii?Q?YSn9O0bCJrfJmOIESthZYGjv6yBriDDHSNL3XVvD5vgCkaZEHv6mm53usqJd?=
 =?us-ascii?Q?0Zm8bGuyM0IIxV8gEFwn6h0VMKJVsE1qRob1ifwJaQIExAS9HO91WE2pLuTF?=
 =?us-ascii?Q?YxiEHph5tcdBFBtnxLjqMI/rvRpJflYGztCBlttwH8S4h1dXiW0VpeKWoFiV?=
 =?us-ascii?Q?s4zMRATA2Lp9Ed196KEo4dhx7r4h8pyZIVMURfOTQPq1dovp59P0oWYbShBj?=
 =?us-ascii?Q?/uVzHcb/fK5Bvf64QdfxZjeR1OSjhArKC+pJ+CAprHJxLbMt8/qJSnM6AdlT?=
 =?us-ascii?Q?GNSJH6lcFUGG3ZBa4ZufwLpxKDh+z+7m8Qw9haJnPUSubBzAIydpRRdeK0by?=
 =?us-ascii?Q?KJtNyN5RAYn7ePH2Aza1u49VQt1beHqYBWZFhn7t+cnhCH8p0wSe0Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oY347kQ20JBevnZGeNDhibz6jfE0IgjIoyAf/1H3cLx+XkPIAvnVYi0yWwye?=
 =?us-ascii?Q?nuPdquTisQb+9yupmwq0dPFROl2SKwir8ngdJNkQfl0gLWxgegmzf5CeqQwC?=
 =?us-ascii?Q?P8PiP0/wPX6dNoygAEW5c6kVEeei7Ow0G+0SwpQQfQCh96LfIVfjQeO5mgC5?=
 =?us-ascii?Q?E6cWWSLxr22AjGEuBKa3RhOrNAPvPnoJtUanMiCSvoHpbb0eqVMltwBXZvsp?=
 =?us-ascii?Q?9jAcI4SUgmBydXCbXzqHiXBdH61p/cEZ+LTbBqLFvZksr+Gc1Bu2MrS628ec?=
 =?us-ascii?Q?7GHNxdA32X3EfEVcr7EczSBfxM2E5aYaoXjyy9yIh7IR8vxPrVyM8fJnOPwy?=
 =?us-ascii?Q?quhyYpPwrAo2JUdjlCAQBAYAMbTnJd7LMyQuJw8IK48/flHdiEhr+EqTK2nk?=
 =?us-ascii?Q?bFz0lbvAeGG5Y5FdgWLKt+JRFdUbfxjnXXGSEzXfGSv/SLQZigxk8A75sIqm?=
 =?us-ascii?Q?OwPIRkjlDrq0ALr9Etu1nIFpJYeZuKXvBfI+upRERt6u4hYJRy7gUNuMJcbn?=
 =?us-ascii?Q?VuhSE4zsLBThJGL0BTFxVyaOH16Q2LH0qUyiaw/vustc3k9z1/9xXJhfbOjY?=
 =?us-ascii?Q?dLdOc+KjU9K2DHGbsBTFD2EVo19gkV5yAjcXxXmvrnBiPv02I2yT3dnrM7Fl?=
 =?us-ascii?Q?YVLaVfwxRobc7Pp0CNKA/c1MyNG+PUdQU2zqWOjcOnnpWqWL4BFUi2YaW8mn?=
 =?us-ascii?Q?HzY00j6tInEdpv7rlZ/TsUH73SETcfp34sRmFQffOkCNpcUb0Og420KH0tnI?=
 =?us-ascii?Q?TwJqq6csA38B5FNfLN3HrYn2uCztTY4QkHxdfTCn0AIJl1C9XrYqDfoqmd4r?=
 =?us-ascii?Q?HgozWRyRscvVy3WyxuXaWLbxQDn34fIG/SInO6HKx0KwaSGsgrxVb23aw0To?=
 =?us-ascii?Q?iQp3YveeONoULawAIc276gRmaz5kjrbV4dX9UrOang7U4ZvVwgxJJbxsg3W+?=
 =?us-ascii?Q?Qtc6zLrJfEjUBbZay0fSrm0T2LCernrcv7wejdGz063M9n8NiZle9pjU15VI?=
 =?us-ascii?Q?0fSZ0Durv/D2oNpIshCa9g87vkyPWxlVTwRa6XGXTO6CST4Gjqn0vahbcf82?=
 =?us-ascii?Q?nDXLepLI79wi/vVfdb/eTv6NH5Y5jGhx17Br84ErvsQK9UZTHFLmjgQrhtbc?=
 =?us-ascii?Q?oh129cWK6fXZ6gqs4lRqXmxn4+GPr9zuJiKzszIpGz2CzoGA8AueGpTjrdUY?=
 =?us-ascii?Q?5xVxX0q/QJdHxm3F1IZhaDv7/Lg8oNgaMA3ZFCJtP40OtQgfjx+RQWP1oz1Y?=
 =?us-ascii?Q?AKav0XKwMhdlbs8RXkOJYi4W/YjyOPkyWfN0DYv90cNf2gubXfApKPvs6Dlu?=
 =?us-ascii?Q?qCRyj2vLtguaZ7UkvuuIERfEeWOZuFKknVKn/RhdPJv1S5s+Pi0CjHwjmW1t?=
 =?us-ascii?Q?Cj0w9pwb4IOVYvMrm6YGs76TmCsTmV3p9VhfXCa/peFjNADThs1k7Zlw24jN?=
 =?us-ascii?Q?vHlimxiCprOXNnmDLnBPqnkzuE0cRgas9h8BpoR5ohgKC53aGpCzujL+W5OD?=
 =?us-ascii?Q?KIMJKsl17xZmtqVh+zDmnsyZ4wlWlNQT1cNsdxQqAoGmAvZg2sTyoMuYFKp9?=
 =?us-ascii?Q?zJXzWJb/LyHTnLUnyfQDcmMijFEmWxYHzXapO6LO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd56cab-092f-4c84-8375-08ddf53ca59e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:18:18.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJk66AgF1mEjej4r2DYIjjB0uhiRDD5wkRKhKJiE2988v07LKsYqpJOl3z9WfOTlkcy+Xp4eCD3zjC+AdVw1Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317

On Mon, Sep 15, 2025 at 03:23:47PM +0300, Ioana Ciornei wrote:

subject:
dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA

> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
>
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property.
> At the same time, add the #address-cells and #size-cells properties as
> valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> addressable.
>
> This is needed because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location.

These are neccesary because reg of child gpio controller nodes is in I2C
device's address space.

need empty line here.

> Impose this restriction for the new compatible through an if-statement.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Enforce a unit address on the child gpios nodes (remove the ?)
> - Enforce the use of unit addresses by having #address-size and
>   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
>
>  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
...

>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,lx2160ardb-fpga
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +
       else:
         properties:
           '#address-cells': false
           'size-cells': false

Frank
>  additionalProperties: false
>
>  examples:
> @@ -68,3 +91,27 @@ examples:
>          };
>      };
>
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        board-control@66 {
> +            compatible = "fsl,lx2160ardb-fpga";
> +            reg = <0x66>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@19 {
> +                compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
> +                reg = <0x19>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-line-names =
> +                    "SFP2_TX_EN", "",
> +                    "", "",
> +                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
> +                    "", "SFP2_MOD_ABS";
> +            };
> +        };
> +    };
> --
> 2.25.1
>

