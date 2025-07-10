Return-Path: <linux-gpio+bounces-23090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F0B00502
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2565189ECD7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B03327056F;
	Thu, 10 Jul 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ftTlTRXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042CD272E4E;
	Thu, 10 Jul 2025 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157329; cv=fail; b=SUuDjlhCZt9OGX+lgGcal8tixPMCf5n4H+n/US9iIqTqd7DVnS/nrUE8lT5xzr0VKxvK5Ph7Z/pHzzvUIh6tpjPjUgvBBVSRfSnlKaf1OWMKcAC3oz8XHepAC15C3Agf47VpttWDdayALoy+0uSB1wbQm8wzRL7HED2o7d0YPq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157329; c=relaxed/simple;
	bh=t8aL4UXNt+zNRQgkXvnebUhsVYy7VLVJPRhyOaWi8uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pp1NQnfoMb+e+EXtx3inOQfUKghDQTbo6ZqG4E4J5qokLsgO5MhsAJIoHcLDcdYYm9/eo7YxrOeQ1KeJFRMbuRB6MAKV+2P7moeLm16KDI6PxFiuLGryRgT6elWXqIICLZ5aUyGb6fsVnP/BPnCcV3dYcc97V/XkZbUgjJ3UCtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ftTlTRXB; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI6H9HYY+bPJysnOIvQcmj8/GRt8R6MJ4ojE49CPObqfF5z31S36KsKVXJbNlYq4RvgrsaJT2VBd5N+INaEo2rzgwX7bfiWGr0yosw4OAexuMlEdQzPhJMCKUJ81DA5AAcwR1pYxLoUgpKFFOaoxYmAYBhsniwX/WDFyHOA1iSz7V+gaAty2vZzZOizUjlvzbkeUHTWttzv5LwSTRugIkRmXavfg//sUpMO8ynSTXfvcg8jk4B5iglmL7gh75SHyaAJx+IeklNKbAxPiPuik/7UmBNlOn2tK6kiYQJWspjmEzmHkf0zlRwJIv+qLPYrdX9tIHFecoWl5f1358dARvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4PH9Wrx57Cejn3+T5ESC65rGqXNKkDiQLJnPD9wgQw=;
 b=YJR4gkro1uZhx8ufleC/86XU1+5W36A2a5zTD5KwtTqZQHXRQmWnczwwIDuSDMFFY3V3FoEhdD3jwO9T5gm2LP/vnbXH7nZ3NPwASdFd3cnB1ymvGFZCXTG13ntizYvM5jKOKeHvCAff8sWvV27BDvYv1e3rEcGaiM2GERXLRQm2oTnquCWosc1wI8DClVWRFiUMf1ZuG76M3xRm87UNl8OIuz4dYvXECXCGGMwXnHbz4xopLpuBslVNl8gHeS2L6Gj9w3uwvJE5O/nZ9HYIU3CuVNf3tcYeYx/VwFBwBOlhrPsoJnOFor84eiR5YBtWocmQjhXm1qP4APphuu7/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4PH9Wrx57Cejn3+T5ESC65rGqXNKkDiQLJnPD9wgQw=;
 b=ftTlTRXBJXtfhrARMlMz5OTzUw2KZslHnvUCdcsFB4+/csGnotUlpZpqLSZf4c/zUFy0Ijhs9RjASC9dbX+OyQS0d42EQeqOltr2maqOk154X+9FD39SHAJeJfaP4IBqYze6NZMvJk1WtaBNti6Srh+f8jFM7uT76S9KtMq6KLCzsstAmJn1mbUS/j0q3oJHXZaTckhbwn8Yl2J94HXAq1zai8ZfDq+wStndu0VW7v+XZZg/KG9DfCqw0uD+eI9B4UsISVR6071JI6Pn5wJB6giMkWtqZwnhCU/kr5kVMrIPH80XYmI1wtRA1G1kYp5V1/XW5bYkKH+yjxIHiv/0nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:02 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:02 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2 module
Date: Thu, 10 Jul 2025 17:20:24 +0300
Message-ID: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 22154ab5-4ee1-4afe-eeab-08ddbfbd2373
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aStWekIxNWJYVkd0V1BkZTZmL2s3SCtsaUN2OFVvQmk5c0VtR0RzQlk4aDhL?=
 =?utf-8?B?YjU0QmpRRDhQU2JZcnFPTUM1N203eVExUUFzZEsxYXdMZlVDV2FiV2VCRERz?=
 =?utf-8?B?Z1JLSFJuVnd4QnJUOU9DTUtldTFBZThseElQN3VySGtqNFdmQVJmSlNJY0Ex?=
 =?utf-8?B?Y2luVzhzNVYxay9vRlQzVVNPK0tPdlBKWFlDN28rRU4vMytWVWJzT3k5SHlo?=
 =?utf-8?B?Qkh2Y1ZYa0JZYUtFZ3RJdVhFdTN6Q0E0RCtKTEpGTXR6UkpHRG9SaWVMa0lp?=
 =?utf-8?B?akwrd1R6UWVudCt2cFIvTFY3d2JwS3pDQnU1Vk1RZXljWkRjV2s0anhleS9n?=
 =?utf-8?B?MTJ3eHhKZXpLR3pIRzZicTZUWG9COHMybDVjcDVNMnVCSWQrdzRJZlBrUDBB?=
 =?utf-8?B?Q0ZubG02ck9UODJRaVJFVkNmUkdsQUsvTEV3ajlmSUsySkxhejI5QWdveDFq?=
 =?utf-8?B?QnA5b1p0dGR0U1RjTnRXWmdNOFMzbE8xS0JDeWNLaVgxSUYrc1I0UEFzVitG?=
 =?utf-8?B?Z2lFajVpNHZSTERIRUt2VnIwcE81NW9NZWZxeWozRjVWM2VMVHdMVExjMGww?=
 =?utf-8?B?dEpESHpQdGh3eTRhTjhsVWx3Q000SDRNSnJlcTNBZGpZbzNtMmFMYjNUeGFl?=
 =?utf-8?B?NDF3TWtXRlVSSXBubUVPQjJPaEdoUExUZXB6bTVQeVJWMnJ2TkNkcUdwb0tF?=
 =?utf-8?B?YW00UktZSnBvemlUU215RElBSFUzWURGaGNWM1lNWlFNczVTOEFIVFdYb2VP?=
 =?utf-8?B?U1JBM0U0NjZEd1dwMFFnd2NGbCt6bTg2RGpUd2J3NUI2T1RIVFhtNVF5TkpJ?=
 =?utf-8?B?WkRvY0w5dkE4QmRxS0FyK2w5UWRXTkx4eHA0ZEdCem0rem8wSmhTckIxSjFD?=
 =?utf-8?B?dFB1WkZpQ0xRYmhwdkdoTndYOCtuWE1Rd0QvT2o2amM4cXUzSlBibDVFMHRT?=
 =?utf-8?B?SUZBRjlWSDB4aWpWSmxiVUE2OGRycnp6NTkvd0VMNXQrcEwya1l4ZEpVRCtr?=
 =?utf-8?B?cnZLa2NtUDlPbWVCMlQ0MEpaSFFpdU85b01zRWdsUE1yaExPbmlqTWlEYUZK?=
 =?utf-8?B?dGFNUHg3clFWcW5nb0JjMEtlZG1KNjJnNDZ2U3orSVNIOEw3RXp1RG42ZU04?=
 =?utf-8?B?RHE1eVFzeWlVVTUzMWRPUHZxM3JWU2lTMUk1UlA5a05naWpyNkJBK055azFW?=
 =?utf-8?B?Z1htS2hRMUY4ZEpHOEZwVnJpUVpUUHdjRGxZVU5xRmNmcXliOEN2TlRoaVpD?=
 =?utf-8?B?cnR5L0U3YzM1SFpCSXF4UFZDVW5LME00MjI0VGNRZnhjRjY1QVhJaEIrSG9u?=
 =?utf-8?B?bC8weC9CenVLaXNjQzNxVk0yOHB1Zjd1cU1vVHY4ZDBsRkF6SFBOc0U1aVI3?=
 =?utf-8?B?WlgraWM0NDUvN3JlY2FYZjE1QTF0YngzMkJUZlRjTjJQN1lEaVNRREU1clFT?=
 =?utf-8?B?VTkraWdlcDkxeDZmUDZ6MFlPbG8xVzhNTkRDSzE5TTVDbmVzVGNJQW5QWE55?=
 =?utf-8?B?VnNkRmtZK0M0a3dSTzMwUXMrUUhZVWRiYTFJeEpmeDkrWUI4S3JzZGg5eW1K?=
 =?utf-8?B?MWhEM2hTSnJqTnp6SkRhbktpcVI1UEVoMm0xbGhuKzBNeDJyQ1RPNlhRRXlR?=
 =?utf-8?B?b3J1aXNiK21UMzlzNElHaCtuRWFOUk5wQjl2RUJSZnd2dTYvOGVPRFp4UVVH?=
 =?utf-8?B?MWhIMmJsREdiRFNKUGx2TkZJWTkrWkxGNmxCL01vZ3g3WkF3MGVSR1V4eldX?=
 =?utf-8?B?anFzaVpjTVN0U0d6SVhTQzBIUUVWZStWMXJrelhFZUFpM1p5SjByb0VqZDd1?=
 =?utf-8?B?ZTBVblZySENpWTRLNTlPNEM3RGIwOWVNUTNNVnRjOEJNMjhjU21hOGNhM0c2?=
 =?utf-8?B?a0diRldGQnRDOHEwQjRXb0cycWUxWk5mNlFmZXd1akJsM2ZxaHVYdmhtWGxD?=
 =?utf-8?Q?Ykmnd4aIAVAKr+E8wqH0Ee22dQY/6b60?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2Q3WHpGY2c4VHF4RGpQVkMrb2hCTHlZYmpHOUFhdUlmdENBS3FGU2tBd0x1?=
 =?utf-8?B?ZHhsemZQeTNhZzZ0Z1I0U0RwSjIxSzFEdzdrbzZoQ2lsSW1QTzhCZ3pnTE40?=
 =?utf-8?B?SWF2ck8wQUMyK3h2akdmTUpDeHo4Vmc0ZERjWlNrWG5RTlNFeDZxZTd4Zk93?=
 =?utf-8?B?c294WGZGbjRHMEtUdzNiK3NvVGNvbW5JTGtuMnhNR0NxRlNGeGtjbU45bXNX?=
 =?utf-8?B?UlJqTlBZZDVjNmNGOEM0WGFva2g2M3d1d1I5d1d4aEpUekhUUVkrOEdwZUdy?=
 =?utf-8?B?NFV2YnkyUWVaVmEyWlJ1QWx3eXNaaGFuS1JrOVJaN1VSOE84a0YvNHA2UGdJ?=
 =?utf-8?B?eVVsZjNtOW5yQ0w5U3JxTkVzd2ZOWTR3bEZVWmdnVXZXa2o0b3JsRXRyRFVG?=
 =?utf-8?B?RTNQb00xOUVlM3duV28xQWdNYmRzdWUxOUl5QzZ3OFhMbEI4dVpqdzY5Z0Zu?=
 =?utf-8?B?YW9JMERBSWdsRHQ3VVRoTFFuRGFqdXF1NVJCV1NJYVZ6UGdITXNlOTVFTkVj?=
 =?utf-8?B?eGduaU1Tbzh1Z0ZvK0pZcG4rZGJGUEV2bnlWQ1ovMktpZ1Nna2JwZnRvRnQ2?=
 =?utf-8?B?dVgxTWRVS1FjcFRwRkprbWROOHFtQVpzL0xDVXY1cWJrQU9aUmZ1b1FPRm9D?=
 =?utf-8?B?ajU2SXl4aHF6aVFtQ1lZb281UVJ1MlVYVmtlVFh0SkRSZStPeUpjQUpjRWdM?=
 =?utf-8?B?NDNwYStBWkFOZmdMQ05QVUEzVmVLV2NFeVJ3L00vYjY1dTBDQUkxRFFkc21C?=
 =?utf-8?B?am00U2RQN2R0VW9DVDUyQkhVM3o0L3N0UkRQS1FBUzkxSVJpOWprZVBVODVE?=
 =?utf-8?B?dlZnRzhDOXRpMy9LdHV2N3B0MUh0WDgzUk9hb2FpaXRUTmJreHRVOUYzVWdO?=
 =?utf-8?B?VmFTYnp3NW1tOTlmb1lFL0hhZ01KYlgzNXhaVkgzbERrL3FxbTJvMmlNdUxm?=
 =?utf-8?B?TzkrMXlhRE1vRDhTY2lvR2doZG9zZE8rUW8rcXN5R29yTGFubTRPVkJVejZv?=
 =?utf-8?B?eURRZG5TSzN1NFVTSUpyVGN2UUtUMkNoZmUrNE9wRERwVGV5cVFXOWNFbDhQ?=
 =?utf-8?B?dXpwSk9ZTGNOVzNSUUpIS3lZdFVwOXVScER4dlk0SG9haXRUanN0MmlXQWo2?=
 =?utf-8?B?Q0l4ZDdXM25Ub00xTGdsMUt3QnRZaE0rR3gzVlcySDIzY2FtQXExYVNqRmtG?=
 =?utf-8?B?SHY3UEVtenB0ZUVPTW5EVThsU3NQUGRidGZkRVNnRC9BbW1yYzlTU1pHUGFo?=
 =?utf-8?B?WklmaU0xVnp5QTQrdk04cGlTZHI2cXZ3WkVMWVQ4ajd1MmdHWFljWnVqanJD?=
 =?utf-8?B?a0xyUVEva3BGNHNPOVZqRE4wZGVXdi9BV0FkSWZ2V2pKQUo5U09ZWCtxRUVS?=
 =?utf-8?B?aEw3aTlaUFFvUDZwR2tMU3RVV0dlMkdKNHpJSGZ4WkpxUXUwdWN3L09xQTRi?=
 =?utf-8?B?Sml0UnJHMmMxZVBESHFJTGFHQWdiRFFqWlBNeHRRMk1OTU5RTklpUDM1T3VI?=
 =?utf-8?B?dVpnbURmVlRNa1pTUlBkbE1zdzErd05kcDYyS3JWYzFPckUzVnU4MnN6eTE2?=
 =?utf-8?B?WmFGdkVRQnVBQUFpVG9KTHZPaXZMQ1lJNDZacUxmbjFyTWtnMjdjWnF1TEdn?=
 =?utf-8?B?NTh5NGdVQmpkQm84OTJLQlpUNWZGWXJIWGpicDNlZUdEeHlpK1lEM0tFM21B?=
 =?utf-8?B?cmJDTFZsWWEzOGdocWdabDhzbktyTXBpSGpmVmhUb2lxeHNHdHNUUzNyRGty?=
 =?utf-8?B?SzkzUTZxaUw4ZnNZUTcveFl1REVnZWFTa2Z4RVQvU0tJd0hMc2dBZWJSREJO?=
 =?utf-8?B?QUlGTEpqb0ZrR2RMclkxQzBzUjlBRUx6VzgwbktlZ2g5eHU4dXIyR01DZWNi?=
 =?utf-8?B?bWdDN2xFdkc1Mm11OFM4ZDVidDJtRCtCTEFFTzkwMHBPTGdIejlEdm9zZENE?=
 =?utf-8?B?VDNHLzJYanhXbEt2dk5SWEVmY1o4QzQwZk10M1Y3Nmh1QitLbFZJZUN6WlVp?=
 =?utf-8?B?YlRmendsbFdNeXF1SFA2QWJCT0MzaGJWMVhubzVaRkZmdk9RaFVSYlVQVWF0?=
 =?utf-8?B?NUVMYldQa3hZMER0L2ZzRENYRTBjanV1Y05NNWtVYUdzZ1YrMjRRTm1BeWNs?=
 =?utf-8?B?RTEyUVBNRXdsQks1YlMrSFdqYTA5enVQeE1NNlB0NjJRckcwUitLdUZETnBw?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22154ab5-4ee1-4afe-eeab-08ddbfbd2373
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:02.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7Ed5M+JzOvnsIeibGG4oIxXqKq8Z/057vXfBMJAVdDOMCV51JtpABF4I9V89JSlotW1A9ETkp1cJCLV7OuxLrxU5MyQ10MmYYkT+2phKqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

Add the dt-bindings for the NXP SIUL2 module which is a multi
function device. It can export information about the SoC, configure
the pinmux&pinconf for pins and it is also a GPIO controller with
interrupt capability.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
new file mode 100644
index 000000000000..8ae185b4bc78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32 System Integration Unit Lite2 (SIUL2)
+
+maintainers:
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description: |
+  SIUL2 is a hardware block which implements pinmuxing,
+  pinconf, GPIOs (some with interrupt capability) and
+  registers which contain information about the SoC.
+  There are generally two SIUL2 modules whose functionality
+  is grouped together. For example interrupt configuration
+  registers are part of SIUL2_1 even though interrupts are
+  also available for SIUL2_0 pins.
+
+  The following register types are exported by SIUL2:
+    - MIDR (MCU ID Register) - information related to the SoC
+    - interrupt configuration registers
+    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
+    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
+    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
+    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
+
+  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
+  16bit wide.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-siul2
+      - items:
+          - enum:
+              - nxp,s32g3-siul2
+          - const: nxp,s32g2-siul2
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: siul20
+      - const: siul21
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+    description:
+      This container may reference an NVMEM layout parser.
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    required:
+      - gpio-hog
+
+  "-pins$":
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "-grp[0-9]$":
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        description:
+          Pinctrl node's client devices specify pin muxes using subnodes,
+          which in turn use the standard properties below.
+
+        properties:
+          bias-disable: true
+          bias-high-impedance: true
+          bias-pull-up: true
+          bias-pull-down: true
+          drive-open-drain: true
+          input-enable: true
+          output-enable: true
+
+          pinmux:
+            description: |
+              An integer array for representing pinmux configurations of
+              a device. Each integer consists of a PIN_ID and a 4-bit
+              selected signal source(SSS) as IOMUX setting, which is
+              calculated as: pinmux = (PIN_ID << 4 | SSS)
+
+          slew-rate:
+            description: Supported slew rate based on Fmax values (MHz)
+            enum: [83, 133, 150, 166, 208]
+        required:
+          - pinmux
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pinctrl@4009c000 {
+      compatible = "nxp,s32g2-siul2";
+      reg = <0x4009c000 0x179c>,
+            <0x44010000 0x17b0>;
+      reg-names = "siul20", "siul21";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+
+      jtag-pins {
+        jtag-grp0 {
+          pinmux = <0x0>;
+          input-enable;
+          bias-pull-up;
+          slew-rate = <166>;
+        };
+      };
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        soc-major@0 {
+          reg = <0 0x4>;
+        };
+      };
+    };
+...
-- 
2.45.2


