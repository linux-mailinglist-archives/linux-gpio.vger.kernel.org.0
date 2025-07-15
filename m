Return-Path: <linux-gpio+bounces-23301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D371B06234
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 17:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564AF1C22CC1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD0D1E9B35;
	Tue, 15 Jul 2025 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jw/g83n5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D63342A83;
	Tue, 15 Jul 2025 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591377; cv=fail; b=t1gGqdziKDZDzAK2V3bOD/K6OtLnqvkInfj4CmdfJarw+M6SMRDAthdXkBLNGkFGk2l8mDh5RkRXD+CitExZ4Ahe/X97iICH3yseYjwIxUidOOxGwHKX93EGDQI+mLh3Hw76zoCtRYETi/4jqU0+t4KcjDUZ3dExlFkLqZxsfag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591377; c=relaxed/simple;
	bh=xuKHmo19THPPPNs/5ar8aX7wyhKBx1Utyel371nkTec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cLQKZ8c/9BEU+Po2zQkPPOmxYFxT2UyBgr2tfFkfVR9I9okk5aQ0qo7eEdV/ocgvJV2E4KDuK5FG0ymXmDLlGqkU7xTwb3rhfrbSAUWwzC7qp1lUhpz4vogZf/xD9ftgLglvLcGnBkM26qZXx1SPpLDVYpaxO5RkzUmcX3o4C9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jw/g83n5; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSbns0DxiE43KBXvDMJrbs4jVUYxyx1dUjbnThvOdq6oXHfM18ndyxXFkPsczkQggMkbMKcJ1kDqDfqn89pN0C0p9QYPzsQhEzpY6sYFqt5644MeZWflAAzvx0/FPQinKhT43tdJCsq+Vbqov9woJs+t6LC5GzqvV4u7qG5XmSEB//6bLuofVcnkhvkL0Ec7/CSq0CtWtTuD9yBL0IKzKP1fAkQZbE7N6X8/PiQngUP55wOjLpX7ZnCGfvoE2+XCvpsZVmqaLhfzU09uC6kTDYvKR/8YSI/bvpFgpItG6DjKP7QdSv0J3Fh6LUk4bYSOU0Ka+45fxd55pnYUnQuoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQfcmebLHUv1BfOcxeY8PDgw0dX9IsNAfMA8NrJwBSc=;
 b=i/yQHKg/Mmy+e4OvodyCt7kaqi5cfT3j0hfJRet9mnCIsmd7MEqdz1ec9GVbfo5XkvSYKqxPykpqjbp1ilh4Y7kmkSwuy27wBv3NEjF+JbRJ1dNbaGEnRNm0l0+8boheFiCzLFOoZ6Fnc6SZVT64zHVqvbF0+0jZvRRU1NXPKU1TLzlH2EGPYDK2pFTqOkT9Z6LGlvRKLSdz4pYQPDKA+c3UlliW9vfUp1rusZDvr2bRofjqUoX4KZHHtyobS4a2b27TYyHexVapMezMLFu10Xzt8ibZ3uADKCG29hfS0IF8TPClb27ryoMUUQJBfj5tag1Y8Yv9dwzlgsnSS10Feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQfcmebLHUv1BfOcxeY8PDgw0dX9IsNAfMA8NrJwBSc=;
 b=jw/g83n57ZFMCcrx6UVPVXfr64kWBi87R7QUV3Enj539yZvMwi4ZV/6sz6xafSLTpgcli10LsrdFUxiFfxcRJkg9BNWAbmoZlVfZ7K9l8TY0Wsf3BeXsv9yN6778/CfrZIRvDlpeiXZlRyv62kZR6Jspyyj+wYUSXHLYhag2N3nccY+IizW6gzgGxb2x2zI2Fq9vPYBYS3OK+bf0KLgydSKOYz2Dr4AUcgWmsK9MVWgOQTkWpSeaTbnr1fFsXF9tF6tV3h6bSftRs9g57elu8KfiHe60GYBSxK+1TFrdlW89zYQvatpQfC5Xd+jpYnM7/QaCm68teBgRcpP20yEorw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DB4PR04MB11279.eurprd04.prod.outlook.com (2603:10a6:10:5e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 14:56:10 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Tue, 15 Jul 2025
 14:56:10 +0000
Date: Tue, 15 Jul 2025 17:56:07 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: Add missing mpc8xxx
 compatibles
Message-ID: <5h2fhjr6xufwgho4tob5d63rlhee5f3ox2pvz3j2tiuvhz3nd6@sozlxikrmh33>
References: <20250714202941.3013390-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714202941.3013390-1-robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0328.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DB4PR04MB11279:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cc9295-7685-41cf-306e-08ddc3afbc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NqpznsMck1AcAoie/JpWJzEpGEhGLBRjVxtQ95eRKVHMEb7X0PRUnUk4D8mH?=
 =?us-ascii?Q?ldW4WQTJxMieZyc5AWrewhNRTE3Myafq25Eg6OQWr9CQ6+zbWIVpD5hQ2GUX?=
 =?us-ascii?Q?yAL6aDmV2ihjpettZXxb2WbqHovcKxJEiIDsQe7Gn4bQh1lTrmex5Zo066Z3?=
 =?us-ascii?Q?b32Ubt5KsRo3cGhosueyEY3HzzipYvK/dQ1YLZyUpJwbx8HPknVH8FJHTsIv?=
 =?us-ascii?Q?m18vjKmdo5AfUqe56zK5+NDvxjJ/U5CHNLJWy9qIUYe4hZOhUxtxJYpv0AJm?=
 =?us-ascii?Q?zfodjYwQ8bz5gWmMM33uE8OK8NLwx19CrsCDAKJ+iZChA1y3QmHfuZE8IZwq?=
 =?us-ascii?Q?Ni8ObyQPg2VcAqPPZgv299QRnGdurvl9K1kphHmDNG7y/bsVGz2h8NgWaAiX?=
 =?us-ascii?Q?xgdM0FBRY3OxgEkCNW9m/p3PoXs37d7XTYUkpDGIrLVFosXNXYH7ujEI2ONo?=
 =?us-ascii?Q?YLcX4/4DynPP1Ewr/yJcGUCQ/2s3Mb6DCHwbDXoZlkBKlXHs96UPy4V1tw7m?=
 =?us-ascii?Q?Wd96bveWOOfCMwTcWPyIVaQ8SWOdyVAb10JVH9UL3CVcS0YRVuLvpnPL219g?=
 =?us-ascii?Q?eNZ5vK7UAgUQKL1hHerxu0W+kZwqQ92HfhZMVIEW2o2zWqVKShcWdvNa+wGS?=
 =?us-ascii?Q?mhFmJwSVVe4titNoLOm05VFvfxU0hDQi6/xd9rgi4N+d5l7XqNsScyH0/paG?=
 =?us-ascii?Q?2JfzT9dEk1Ak9zxOd7CK6Dd+ol+NtJPp1ZgcnOFIbb5hwi/SyYp++FT3sCln?=
 =?us-ascii?Q?D+gzLwk1LloS6OwRxOvqzSYeJBtAkQuu98rYazzSSgvikQtx/2Kfs/NUgkUe?=
 =?us-ascii?Q?gdQaPyOVrA/uD28QzwkpaJxM/ct3DK8/ccS/FcIXzsGa23Z5qiW8C2JIUExU?=
 =?us-ascii?Q?w1xMD5ogKeQLAhSHcnC4kJF1CHlwnolawc8K4BsqtIur7atK4Ble0QWiYznM?=
 =?us-ascii?Q?riUKG/Ly6N/Gz3Oyq5P5kKwK7qUu5tPQ0LpseWu8+JAsNjNUL7qWS0wrBt/R?=
 =?us-ascii?Q?Z6plFOhbAH6mOu0X7cWZGr816FK3hHoxlIr26oyw4oo/xFM4UjNZ0iSjvplk?=
 =?us-ascii?Q?cXXXPhw4wXnidGF/Y7DTxd55ZXVvOP5NlHepGjFb4/Md9Tb6RVsszTswW25F?=
 =?us-ascii?Q?CXHphPhx5+On3KsZ/n9Aum9eqzPUTBeSXLruPMURyfEtANpRKc7AQxV1zec5?=
 =?us-ascii?Q?nrPv/op3FKjOu6p6NrW6tR67YtUylMyYI6VxG65g8JgTCsL/IYoAAR+//A+Z?=
 =?us-ascii?Q?W5AflWvAjxIA/xSmBMZqmiWqIvemyURIBas9nUKSm0Il9PAfvVB7nIwdKjzp?=
 =?us-ascii?Q?kRMqV7CYiNGWLX8/hwH0gfnHWUe/3ncRzvFFnQRbXXYL6ZFzVW/Jz7FxJbFa?=
 =?us-ascii?Q?nRXsfgagR4q0fANuRRpQHT21YJVxHWq7WSnUukTlGJc4HzdZMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+hn130hfucmVtAIZwyTaWRlrKbbleVflBn7Zkqs32nrq68doyWgRIlkNFOtq?=
 =?us-ascii?Q?fL+FFB8jlv06bzXY7iqcA2kJY89DpEDGurzoTJhSbAq82EPMeMOVWizvNbpM?=
 =?us-ascii?Q?mtGtG4JBTuEypmR22eOcdUNYMX82Y3cVjCoNDkpD0WnPS2GjE3GDQ1+M5rMf?=
 =?us-ascii?Q?1cBY6RlqMR8YABsKRGEn6ZQNLV/QBsPeP5yrB7NZj0yk3jYZq4mtPkcwPeZS?=
 =?us-ascii?Q?GxzYhKKqSvhLwogRSmIBbyLt+9otkN3Uxx2OuHVjj4WKjWaubFGbucHKeeDR?=
 =?us-ascii?Q?Xlt8RnxjqsugCoc6aNeDB87mDWSZTcWtukE+kkGyoS8duu0rYcZIntviR35C?=
 =?us-ascii?Q?YRCtvqOb2MZWiuyWRpCVzASIcE14tRepfVPhOSRb8Z9BK2Ho/v7Shz4pIWPY?=
 =?us-ascii?Q?qtFYxvgYExvqpLQmiaXXfS73Nq/bt8CX8REOChF3PN+SSMLpsMHmAzxM/aRQ?=
 =?us-ascii?Q?wMmwOw7Wh+xPV1rf6gZeMo8NcI+Lb/3xzNIi2JNI8xlFhBddnYJH+yhShEVx?=
 =?us-ascii?Q?EDfuN5Yka6k/nc93OdylANlJW26zZcGe169KebsH7WfjudxM7bvq8aK4k7oW?=
 =?us-ascii?Q?gzv2wsczB9nm1bP5T5IYiJ43fmMBdG/VytTcvZ3gRmZrNfwnSIxaBC7fDez7?=
 =?us-ascii?Q?nS9tsckTZprelw/J0x29G2k/kBAjbWn3X8rGT9+IUDuKUmz37QzNz7rHsuor?=
 =?us-ascii?Q?nRu9aFFs/FmxLSSMp1PTaTxeUffEgmAHWpx1+6duGuqGXNNE+nmqlG2gvimj?=
 =?us-ascii?Q?6NDGC7OtTMvIskVHUfscGk5O1gR2EgdN1dlbxo8mPm1cr1Z1stY5Y0NSeeLL?=
 =?us-ascii?Q?oc/5r4gQeRL0X/5LhlG5X71uauZzE17gjCIVlkR594dZaCy47lS/u86pFAQD?=
 =?us-ascii?Q?tKveE5U9/grYo+bF/e+fnqAcWMqrjycHBSZTxRmNCO3276SoEcMsT5xnMtQ8?=
 =?us-ascii?Q?UECMs1CqxXP42ub039dMTO8S3M+YRN9OshWyfRH33Llht0OjmQVAy8uacMWy?=
 =?us-ascii?Q?hCh4NyxBVslRhibK/w8YOzrfJAF6OHvfALp2xKiDUuRW7YB02bDDL7avGvbj?=
 =?us-ascii?Q?T4nLacScAFeW/n7jeMQlDAOGosylSYBwyAwHWZy73mDnDjeoecDi9eIP9WC9?=
 =?us-ascii?Q?17oyVRSwgTetszkgWEqS1uk80IHOya/xurGfJeZNkj9823IKvAn/OFghv8BI?=
 =?us-ascii?Q?FOrgU+BNNsczaOnhmrO18R1lly1RV5u6ezQ8w9m/+1PLF6CYuR9DERhYhP/5?=
 =?us-ascii?Q?dr6P5PoHbGTac5Bj3BVc/nc5fy8cRh/ng10pkHVpaEfZsJ8pz39dmouXeS5k?=
 =?us-ascii?Q?jQ5fApnR+IdyvrSNSCdaorSvM87DBYRmb14Z12H8yze8TFT77PEW6YOIggX+?=
 =?us-ascii?Q?TKXn9V4fVmRv5ax4LovUS8ADhRdYe9UVi+MQAaTtTgdVn6YroDSd60lGd4gp?=
 =?us-ascii?Q?YOHay38wHCIP27y9xTAdYbcMN2C8SnNyQVkCt+fHu+XKLEOsW+1Ck6knUtdW?=
 =?us-ascii?Q?QIvDJHhoVNQ1tdDE3L8q+FdcIoYdnTLj+/Y2jHG2J9jl7qmeRpi7lhGQknPP?=
 =?us-ascii?Q?ibomhmeOA1cvuVYmxqLDzuL1QB5iHZ+8iZHIvaUn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cc9295-7685-41cf-306e-08ddc3afbc4a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:56:10.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ2mWJfhRhLp0j2AkSYaF84lguzcTKfb4kmAQHRtFcUe7G77x4+7/JiMvS3IZMS7DM5NeZj4p9r6dEV4vtJ0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11279

On Mon, Jul 14, 2025 at 03:29:40PM -0500, Rob Herring (Arm) wrote:
> The fsl,mpc8349-gpio, fsl,mpc8572-gpio, and fsl,mpc8610-gpio compatibles
> are already documented in fsl,qoriq-gpio.yaml. Add the additional
> compatibles that use fsl,mpc8349-gpio as a fallback. With that,
> the 8xxx_gpio.txt binding document is redundant and can be removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>


