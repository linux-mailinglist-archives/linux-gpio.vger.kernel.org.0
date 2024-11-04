Return-Path: <linux-gpio+bounces-12528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AF9BB8C0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9721E28239F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 15:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1349F1BC9EE;
	Mon,  4 Nov 2024 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fSrgE/m+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328794A08
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733446; cv=fail; b=t0LFkDvb+pwF4TI0ZDSU7sx80UbfNS8q80IaQySM5XLgCWM/75R+F61rqLrHRGn7RZ/AJ7QDnnJOTk4HT9jIvCAZ4lX4CMWnEkrniq3byLeI+ung2tmxAWbq1lv586uPmKmLtvxvdhRrpV19kWPEInf9p/AmRxEi/hnPpxRiuPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733446; c=relaxed/simple;
	bh=OcpyQsJcs9aCXZwQIuLyoweYjGwcaMeMUMSKgYLnNjk=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gbepvxVPmwsdHy/kLwhUpznla4DYRKC983fPnQGPdh2DPm/PARvRlU0iYGASSz2yquaAS6Fc8fkhf/j2tgMMwqdGPNiaFFvzWjb9+aUhrB1h0oADvfaLUJWhW4516d2DbX3ssUf3eBT3KHTE2PJ1NYKYjxemGZnqO8LqXBwCjyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fSrgE/m+; arc=fail smtp.client-ip=40.107.241.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyScGNaLaG8pl/8HDqNqEpJnsAhsWR00Loa0o/vvD+4SZczDTUWZjBj5mrWS+vO4PjxY6N9cn+4zOiDfo8f4PREYCZRgOKNiVlnVqtAT++F6Vgo9qAzNbz8L+lFTSK2WAum2M5m+gDpwo8hnzRPrQ/M1WSCdF7ndZh+rLatH51A+gEshXQ7DDEv688fkkI7i133cmr3t+HDu7Qp5bNntDPMIOINBsI3prL6coGHO6w9gl8nCz6WziEy8XOfT+FqSE66l8u8Skw7TtB+ndyLpBzr4JJfRuNwHe+dTH0qpb3Jkw6JL+OkvFT4y1XkRyuPWcYzGH7rlaeix9fELG5pTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4ZaS2rhUAEQmj3zZ3eojiWmS6ig7YBL70fAj+7SWDY=;
 b=bZS2zSYESvZd/2iEOgmgBpndTxxyHY+RaDszUjScGtf5YdJop2dzRHJ9WhN3/xAeh46Kl3gTKUqh+gx2hM13tGnoxuh9dp4jZ1fUfc1evFcGRRiG9o0dgHoRleWf0sHMnYe9/j53qkLu7DXx5OPe5/qxV9VZyGwL4JMAIa+Z5Wryb7edeNl0KNCGp+OIdxl12OAYHJxkW6VrXB73uhTCgbw29DpWNBv2tBZmHMWrilB9qriYJOehXo5a7wxx8XcQX5U0rmcQ4Tmg50u7kT6vjkXxoXeGXHlyKaBObvGWAg4Clp2kDSyGIQnzuOO+olDY+BJVCvMi++DjZ3ipw7IzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4ZaS2rhUAEQmj3zZ3eojiWmS6ig7YBL70fAj+7SWDY=;
 b=fSrgE/m+2B+AubmW6K1EqJ6mzkvO8oXZ/WMt8bvX+THeEqvi60jYN6LOmfVXWWBX5zUgOP/b+Wgjmmm3QBtvIOTx8Hj0/5wRzUhr1MsIdXpSqNo/88E2sT1mvlosv/tCpB0AWTh8z/cRzeGKA1mMI0zZpubxMPrivel8c2j0Gwd+RCDWw7kEvd05knfI+blR7kWapwmVq/GEV5adbF+INpfhz14QaPbkquFgjBe/hd6KWOFlgZs93HMb6/Zsp3QkZmk7mJgHFz6r6op8WzYVlbdkk6Xv5AyW3TafsCHjkQKSxxJrKZfTJanQ28E9DE/BazF1f/HC0XAADw87c6nD8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AM7PR04MB6822.eurprd04.prod.outlook.com (2603:10a6:20b:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 15:17:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 15:17:20 +0000
Date: Mon, 4 Nov 2024 17:17:16 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: GPIO forwarding question
Message-ID: <isb6f4jduu7utcs7a7hc6gw3ttk5ovxxz2domwjjx5zvhyrima@snw6jc2ghdlx>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: AM0PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:208:69::14) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AM7PR04MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 484663ef-523c-464e-47d3-08dcfce3c658
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8i6qxEf0jwK+CIQVdXZm9458fvT0HH/TDyOoXNKYaJ4D4+uq/P+0XOVEbC7U?=
 =?us-ascii?Q?/eCBafbwj3O0i1OdVeUcJbFsLZVTJ+xFIuyHgxvqYJmbn/5Iz+3V6mlQ2iXD?=
 =?us-ascii?Q?RW5hePCKpNVv67kG7B4B/mYI1YIdIfxCF6U5/ncU9V0YmTocD80/b8BzOO68?=
 =?us-ascii?Q?PC5DFGN0rq2CoRO98+Lvgp0qlWh6Plh+fFbIjF6KgMKZg8Z0nmRb2iskXwzO?=
 =?us-ascii?Q?1h9qjRK4gmrquqlNuGz1Io5MdQUAssj20jT+F2EE3ORmG12Kk/FcWVabbzLz?=
 =?us-ascii?Q?j/eMwTox6nBqRpScXAJrJYVVBZYCJaq4Qgn8dtzAzgN2b2SXtGLW4A6S4x/I?=
 =?us-ascii?Q?dNNlFdNYyuMS1YIeAYG9YTxwsr21a1uY5iMoLaVUFoThXz4RJyYQb7qkr0xv?=
 =?us-ascii?Q?/h0vUuMtO5k+Ew9i3sL/vVfZT1uOiCOMiiK5mGdW0e3A843o5c86S0Zcy/ur?=
 =?us-ascii?Q?q44elSZrnoJqMIJLwjEZkF5QbmiQ5G7X4Te2PckulvSE679Y/WwOg9PODplf?=
 =?us-ascii?Q?Ixae6Bb4XxWtYuRXE21th3+m/SvZGimUextXr+3ZUU4Vu4BuzHcZYZiM2QT4?=
 =?us-ascii?Q?ouqSytPw0gh73ui/EVmyCUc+FpM9UQ/0Fp1YPU1dlljPcT/zA8XH/aaypUGL?=
 =?us-ascii?Q?CRk33vTRtoSRsqALWgPZukqw3lA68dv0rUgZhRExW85fBNL2qW5L//Gzt7S4?=
 =?us-ascii?Q?CKTYREyxmoXT/hPi8FX0tgH5/jGTH0+k1exRuhKJu0+svGf3BUr1w2+9tty+?=
 =?us-ascii?Q?BpQ70FI8yxYNtt2m7UWFWsy8SB6GgcBDlaUt3JrGu5V29CX2RI77c4CgtL8u?=
 =?us-ascii?Q?P1VIrxW0r9jkzszXLqRAyCbQTmle3rML6K6zbRZSjTaib6X4CozmIh+Fjj8e?=
 =?us-ascii?Q?eBdrL07WmzpDGFApEdRZiUfvTmydZF35v2B91UX5x7vV8hf1aduDoesYBKHb?=
 =?us-ascii?Q?jHCqrNbk3ZC0NlLR3jtyDVqkexJsd3bhVUjYO9YRtQHHS9W0IunIYr4oEm2p?=
 =?us-ascii?Q?3DxHq1j+4d559/xXMoO540qjvjtMO67kIxjPEmxhlrfhk+Yfd3CTegPA2isf?=
 =?us-ascii?Q?Aio7P0iYAT5di5LxLP/aiWe7w94EkNeB0gVHtQGTdmsH9vcvCJ0g+HARTtRz?=
 =?us-ascii?Q?fd4OfvvtChm5sLjr9LgWsGRmTbJPQITVDxMwX17fZ1RiGiyhaQMD5LZndEiQ?=
 =?us-ascii?Q?rtdYexi65jWrFBOuG5KRrEbfrvcai2JkKpGFp8KPIugSyugTij7aYCr16MHB?=
 =?us-ascii?Q?8tQMGoDHpm1JPOuEoZu7ounA3wIo1MBrRn2HBmNlqQTpg1qORfOO3Uz9G45G?=
 =?us-ascii?Q?c0w0WPnmJlQ3oHn4SbVw/D+1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ykkbaMe2Irt8Buo+LmUurF77Qzl4lk9C4V25BZ+njBON8ol05KOpW8HvvRUe?=
 =?us-ascii?Q?EgnArq2C5+LKynBoeS+030UkD8xQLF0iVWmqM1o1JtTK+TbEXKiTJGhrpdoB?=
 =?us-ascii?Q?4JLR07xISOtpLeptUDkiBkN9svdx/SniRXFgdGASB70MLkNP8ZEN+YvCimpy?=
 =?us-ascii?Q?xhEdODOAsaxEfDMMttQZxXyBftKa5HKYtqzmv6DIp8Ko3TqFxuCFEdbigwiC?=
 =?us-ascii?Q?iSj5NF6HrieXPqtBDN6vrAfB0S5ceFmzeQxehY2LpTZJm8/AD8UTi4uT0QIu?=
 =?us-ascii?Q?TcGPoIXhfFJGbnldM4zfnoGyPlN4OJaGiH4DD/gpkrMjsbFnsgeXM3jN69dj?=
 =?us-ascii?Q?LvWdoN4X3safIYd7psBZ/bYfPtVwLNDgUKGnr53rh8dBCVoypM4aYVl5g8wZ?=
 =?us-ascii?Q?4hGMd1lO6Bu7SjZ0bXv259KMIaA+JzQ0yrabBBXF4AZdb2OGHV1jUQ0yoIV8?=
 =?us-ascii?Q?mT0kPgwET0n6LDjgVF9g2YiZc7aS+o+6P8amNsVviVG7QFCJ7moERsOHSIWS?=
 =?us-ascii?Q?sWnPUB/+XIexYFfFYLTAyIg/fhf+Gbq413yewZfw8iHNka9ahKhFAONremna?=
 =?us-ascii?Q?vWDVItjIRBSwusJrF6Ls7kImijC1KjyiwIIX+sggDb/+J4nBL/nFyIb80S/S?=
 =?us-ascii?Q?UIAZPMPjU7sQ8QfLOApMCjQuVSObQsI6k4Psdp74pzQUBTvjCcajQE7JDqiE?=
 =?us-ascii?Q?h1LIlh6KHC6AwzrXpFZZ4S/AGdZHoo5spwyD1ZN1vjgbk0fRTwBholHzBp5p?=
 =?us-ascii?Q?aiAegauanw5XOHWsUooRkw6loJSL8HWTddasvy00YzMchvqyZ8QM1uK5sn+/?=
 =?us-ascii?Q?Zu86g2ty7CE9tRegsFm3k69IMxHGedQTc6qz1nea8kTI5/ixXTX1jwloPKeY?=
 =?us-ascii?Q?+zTZShw8RL0ophb1KFqO5F9TSuP/O4x7jBChsbl2awJfHPiZb67ETArp6Wiu?=
 =?us-ascii?Q?e6QFgze/Uu0zcMCoQbIPqUpa3QbmtGvyI6NMflIpTJIEOHidk3CHdckmXPpn?=
 =?us-ascii?Q?kJCuseAzDDbDSGFbuqwBUqXZfliBUo8rB3hlawTRIbDgoqGc8LLANzYwWdaC?=
 =?us-ascii?Q?TUeM44v+AaW3r4tZsEWBiVoZlOd9aJtGfn6mrUaD81e+qx4i0xEOrd+vw5D6?=
 =?us-ascii?Q?BBJ/8ZAMEqpVMhxZ5YQSraggzJz6E2MoZRxFUV/pMBm1xFtr4PoTwBYAg2Pm?=
 =?us-ascii?Q?VaEdpi2TtKZgtJhn56Lj3vTStOXZghp3wwZj5zgMOBxfIuDuCJMxhBFBkY5d?=
 =?us-ascii?Q?FNvO5jOcOUbFW2gtF6NR0NoKA3zK7wT/R/TfRypyrok5L7rcetrQv8ZvTV5a?=
 =?us-ascii?Q?rZMcLQBX9kDh/tU7LwAW0iTbmbpGYQofTPw9QjlRy7moBmL/We4iVfjJqpA5?=
 =?us-ascii?Q?h9PFzdUOnjnQTNF5/7EwxMt0t46LOdqSC0oEUTPuUO639SI4UYo17rKV5LSF?=
 =?us-ascii?Q?MPXARrpZZunqEpZSRHdJ1d7n3j58n7Fs4AjFCcruEi5k2b/JALAI/gZVHxlX?=
 =?us-ascii?Q?eGQdfieEjDjTiNZsD2xDqy80SV2hsVV6+flaZDHdz/DgC9zOHrlZR9X+PJmK?=
 =?us-ascii?Q?mE+V87imO+dHePCNmsHRVZm5OpWvcYCYH7J/Qjw3fYbSclp9Oz6TQL4ws7rE?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484663ef-523c-464e-47d3-08dcfce3c658
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 15:17:20.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPaE3O/M09AuO0/qLs5JK58paHI1K3l6DEgPJCriOu/NeUnBT4m9K+4JrN8KM1n/6QGSGQU9A1Rke66lP7ik5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6822

Hi all,

We're working with some Analog Devices SerDes chips which provide "reliable
transport of high-resolution digital video for camera and display-based
applications" over a GMSL link [1]. But, besides video data, they can also
transport audio data, control (I2C) and GPIO.

We have some drivers downstream that I intend to upstream but there's one
particular issue I don't know how to do it right: GPIO forwarding. Below are 2
examples of how we use this feature. For the sake of not complicating the
diagrams I only show the SoC on the left leaving out the I2C and other data
connections.

A)
     |       +-----+            +-----+
     |  (1) _|Rx   |            |   Tx|_ (1)
     |       |     |            |     |
SoC  |       | Ser |=== GMSL ===| Des |
     |  (2) _|Tx   |            |   Rx|_ (2)
     |       |     |            |     |
     |       +-----+            +-----+

So, in the first, simplified, scenario, any transitions on the Rx pin (1) of
Ser chip will be replicated on the Tx pin (1) of Des chip. And vice versa,
anything happening on Rx pin (2) of Des chip will be replicated on the Tx pin
(2) of Ser chip. To make things more complicated, transitions on one GPIO pin
can even be sent to more pins on the other side...

B)
     |  +-----+            +--------+
     |  |     |=== GMSL ===| Ser1 Tx|- (1)
     |  |     |            +--------+
SoC  |  |     |                .
     |  | Des |                .
     |  |     |            +--------+
     |  |     |=== GMSL ===| Ser4 Tx|- (1)
     |  +-----+            +--------+

In the second scenario, which is used in multi-camera applications where we
need to have all 4 cameras synchronized, a FSYNC signal is generated by the
deserializer chip and sent over to each serializer in-sync. The serializers
will then send the signal to the camera sensors using the GPIO pins.

So, my question is: is there a way to implement these 2 scenarios using the
current GPIO subsystem API? If yes, can you point me to some examples on how to
achieve it? I tried to find anything in the documentation about this, or some
examples, but I couldn't find any... :/

Thanks,
Laurentiu

[1] https://www.analog.com/en/solutions/gigabit-mulitimedia-serial-link.html

