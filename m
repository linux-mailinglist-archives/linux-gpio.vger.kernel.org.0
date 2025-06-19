Return-Path: <linux-gpio+bounces-21893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B734AE0CFB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 20:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1F7189F21F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 18:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6BE24394B;
	Thu, 19 Jun 2025 18:30:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazon11022093.outbound.protection.outlook.com [40.107.155.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DEE1EDA2A;
	Thu, 19 Jun 2025 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.155.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357841; cv=fail; b=GAZpIpBVW+AdMsVVnPJ4HARJ/zJ2X8TDfLPHqLxv/dfGRHfToAsKGPS1pJV7RW1HG+HMCdxxYH9+Kob8bQZcmTBgDa9PSWTtgzAqwyqTfNLmOtkOWY9zLXUzvhcNzOlC2dKhmcgiS2+AVutWVX8xbU3fUoL48JoMOasE6tyw020=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357841; c=relaxed/simple;
	bh=PHluIehl20JWIpe6jq2Gei4uDTz3YPzTLlZjk0zKnFs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PpY05gwd75fuWPQeZQIEqL8+VAdodTEdOvNNuHQsDeIoaTVRoGFEQuxcZmW3lWQmUok1/hZQNl+JnZUfveTyBhrUcnkri4KpETjKEIwp2LMjMpK/RsahIe5+43RsqNgctuBZApHEgFOf1sb5mXqSdlawtR/NsJzAPfePczX41NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.155.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a78M+M3p7Khq9ePfZo+B9be4gctw4WgZ5MNB84ZE1nFwjCZXNBo7S8saUyvb1OKQVmOyDOWw5hHpEGl1nMOquSGQBnRU+Y3GZJkag+FJkoFPY2nFItNscQn+hm4XaeaOTWjXsIIH9r6jEW0Rd7MDOnnU/qQNx2clC/BOOYNxQnx2uCKsHsz8xU2lxTStIX8MPUboSssGnuOeQhkk9iX6e7JjbLZUxL0XDkz4pc6iAON9heLFfqsxKhivuJ3MytL6ESohTTfJjnKaNGSqdONkq3QUhpSXSPqqjp/EVgHPP7GDPTjySVEJfh+rb0drvr4k1VlpcQNUdMo7TxZu5yTm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK4D3GJW/B/HIssozlmgajRS05Y8k9zPp9pMjcEiqIc=;
 b=uo3H2U7t5labABQSUpHwjU6xfe9YMmelHGpgc4rpeehI4UHOZrMRPMi8EILspQX978DcihQ0sP+Zsg24vvuE5h44k9DZuH+/G4I3DIOjwPR6Mw0HQaZSleJBDUg768Ly7762W0FSs/Ju1HT6ljkmy+AOn9YFGildbcOFyTglE5odad6qp+AbwlEDFzbsRTEnfhG6PkEyHJkZQeuKnWg9zsz29syqs6JWPDpvLhhTvgFdd6BuFPjZwLqVGM5X0h2yEB+grooHqRGNr5sJ0ms+kC541QZ+L9YYCzvw66PTZL0QP7hB1lZkPOMihaNHfCF8L8tlgGHQh2adOXJk3cMMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA2P291MB0287.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:22::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Thu, 19 Jun
 2025 18:30:35 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 18:30:35 +0000
Message-ID: <e7c0ab0c-7d4c-4735-9f0d-22874edaf347@videtronic.com>
Date: Thu, 19 Jun 2025 20:30:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-16-demonsingur@gmail.com>
Content-Language: fr
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <20250618095858.2145209-16-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA2P291MB0287:EE_
X-MS-Office365-Filtering-Correlation-Id: 4360aa31-eb30-47da-2454-08ddaf5f6165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG54R00vRkVTd0dnQmtwU21uQmFhSThFampnalppZE9yb2dZSUx1SlQ4UXp1?=
 =?utf-8?B?cEhNRitWaEY5RFFJZmZNVFluVDQ1YldWZzNWZjNucVJ1V3dOb2RRb3l3QUlw?=
 =?utf-8?B?RUowemExSEttUmZOR0poS3RSQksrU1ViQVRvbGs0L1U2T003Y3NKUDRQMnlL?=
 =?utf-8?B?MUI4dVQ5MVJOQTdEcURBMjNMazhKYlJrRW4rOXEvNXhFb2dpY3E4ZnVOMXY3?=
 =?utf-8?B?NzJzeUhTNHJ5YkpFVlpjbXUxTG1JSm9vdTJGNVRhK3duZ0w3Yy9EaXQ1bWUz?=
 =?utf-8?B?Nk1xYkJCaVJTRVdTRWFhbFZmNXkwRTRkTG85ZVBDOXpSdlFoVEpjSkhtWlFW?=
 =?utf-8?B?WWRLTkxJNVZUMVc5d01vaFRSK0JPanpueTFJSkd0S1NmdE5HMStVK1BHRzdx?=
 =?utf-8?B?MmIxZTBvbFlZeHc4QmdlRWF2ZmRZNlM3NWZDSkNPcXo1aEdmV3FqdGM2WkdJ?=
 =?utf-8?B?OG9heGZhS1NsYjB3SCtEM0QzQzJkb2lUOTF6MXZqWWV2S3c2aHJsSnNzVmha?=
 =?utf-8?B?aDNiOExxK1FxTmxodTJmQ2dCZHdtYVZ5by9IL3R1dGJHbkxGc3NNWkdqNFJP?=
 =?utf-8?B?SlB2V01tSTFYUGc4VmtUcW15a0VuRTBlczRSaXlHQkJrcVhhRGVKN25MN0NL?=
 =?utf-8?B?bTYreFVUTjc2UzdrOXAzV2RiUUZGSmswN25qWDNkQVFJMjZoNWZ5dlNtbE1N?=
 =?utf-8?B?ZFBpUUlsMlpoa1NkN1RaTGF1N3pJY2t6TlFETmxjbkRVc1R4bUlxNW40cG1Q?=
 =?utf-8?B?WDd1MjBFam9XN2NXT2hGdGFLYlJqYlZBcS8rU3dGcXdaSzBLQkJ2aWZJS2o1?=
 =?utf-8?B?eHl5QmJwOEEweHQ4aFZQWkVMUzUxWDdyS0V3RXhMYWliZ3dXRTJlUTRHVG10?=
 =?utf-8?B?ZGtlcFlIZmJZY01QRlRiZG5JbFdBZ0NwNXJxNTdZNm5uUno2TkFKNHFUTThh?=
 =?utf-8?B?QzR3UmYzU1F4YW9Bc2syN0xGa01US2IrUitnSlB3WWQvUGs3ZmhKZnphVUVO?=
 =?utf-8?B?MGI1K25BY0JyRUp3cGVGeVd6RDAreTIxTjJNWDVsWVNsK1o5akdJdFFIclRI?=
 =?utf-8?B?NUhsblc2enRVSzhsRGpGeUZDdkRJYkVPNGJNT1h2MEhaT3ZFL1pHQnBacU1Y?=
 =?utf-8?B?U2gxbmY4eTlkdUZnV3E3c0h6b29uSWd0R0VyaG1MVVRHNnEwNXRISXNRUjZR?=
 =?utf-8?B?WGdVZndYcUFkRXJodVBnZEFYYWVFVGloLzdkZnEyNlJ1ZHNyZlFkTWNycDlz?=
 =?utf-8?B?alBEZ2J0Mm1BVzFob0p3MHNrM1F2N1cyR0tLWmlmWXJwV1Q5aXIvZmhQcnFn?=
 =?utf-8?B?TGdSTGJyb1EvQnZldDBPNUNKaGthMTc1TFFZc1BjMjBuYmIrdUhmNUNRWUhU?=
 =?utf-8?B?QXJjRTRvMGVwWnMxSGMwS2VDbnViTjRPbURKaXVnZlVqVlZRVU9INjYyNTky?=
 =?utf-8?B?OTRjTGtCdFhkUVVlczdaemtpT294SkcrQjlNemVpMXdsMThibk9ENm9iQnRK?=
 =?utf-8?B?bU1IN2RMTk1CM2N2eUtFYnF0YUhOSWdhTFFZTFovUWQ1czFmcjZ6NTFDdzdM?=
 =?utf-8?B?SHpoZlJVSFIwR3dzOU1QYlRTdlQycll3MGJMZXlJRDNWdmdsV3VNbjR2V3ND?=
 =?utf-8?B?UGw2aG1qZHVpTSttblFTVlRmcTAxbVkxWXoyMXdtMStidC9hZW02QVNXeCtp?=
 =?utf-8?B?RFI1WW9Xa1Z0OExFcklDdG9zRWZPUTBZb3lxN21ncWNvSHhiWGlRL2FacG9h?=
 =?utf-8?B?VUtlNU5UZWV4TmxucGdMTkpMcG1oaVJqTWhJN2kxSGpJZVJ1UmoyeTJnQmNr?=
 =?utf-8?B?NEc1RnpSVlFzcmtScG55cWhGNWRheVJHcE9NU0puNEJOMmoxU1VDZVJhNjdh?=
 =?utf-8?B?Vmh6OWtDSFlFSnhkcytSb2drVCtsdFArc09NSTJIdEV6UkVGWGRqdzdUY1V0?=
 =?utf-8?B?ZTY4c0t2czNpRjVPUU5iM00wTWhwSERYdjFacWlScEtJdThoY0tjclR1dVlw?=
 =?utf-8?B?bGlwSGtTcHhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUtEVjdOVXJYZ1RYWjR2dnMwVjlSbmhFRnJvd0hiN21SaUJTZC9SbTl4bU9q?=
 =?utf-8?B?KzEzaUtackJ3WGtMWUovMlR5cDJGcUIyRU1TcUJKVTluWUFwVTJ3Wm0wY0k4?=
 =?utf-8?B?MGdONzY4WTJwT1FuOGpJUEgxSmRRNTgycXhGd3VmTDJmZEdCaWFkY1E5TUF5?=
 =?utf-8?B?Z1hsVzBsZGpOSUlUK0ZLKzRRekp6QWkzNHFLS0VYeWpoMjZtbWh6L0ROZUhp?=
 =?utf-8?B?RXoxYnd4MXNHVytnUnFiS24wa3JQUGZOV2FSNEo0aldYZE5VeWp2ZTZrSDdU?=
 =?utf-8?B?T0xqRzQ3Q2pselN4dXg0bUJtSWJTWUVLSXRHbTgzS3RXWnFrWnRETlMxZFBu?=
 =?utf-8?B?Wi92VExKcWxneDdRc09sNXNlME9EaDloQnozMUtnaE9rdG1EcmRGSk45K0VE?=
 =?utf-8?B?SU9KcTgraDhWUDV5N2pNQkVucG83b2QyWVNCcWV2TmN0eEVzUStJVXBxeDht?=
 =?utf-8?B?cEZaRlo2K05zZFhUcHNsTlFKLzQzelZmUVFoL25RN0lSZTd3bjE0TTdyVy8v?=
 =?utf-8?B?M0pQdVZja3gxU0I2cjBaMXhLT2l2d3dGT3E0Q3RHdmxKa0ZHdVlFTWF4aW5l?=
 =?utf-8?B?ZCtwbG91aEVhK0xQdjVXWjRkeE9wR3czSDBHWUIxc0tSd3BSUEZSRHVaczl0?=
 =?utf-8?B?NVRTNHJnbkg0aEg5RGl0SVVuU0VUektuSTdYbHBPMFcvak9XdjZGcG96allG?=
 =?utf-8?B?WW5IRGxsRU8zY2FzOWx5Qm9JOEVPSjBnZDBydTlraDh1dFNuQVJUTmh6SWth?=
 =?utf-8?B?UC9Rc0dwaUdDZ2d4bzBDTlY3YzVETm5jaVJ5SjErbWxOQTByTE8yVGF4d0wx?=
 =?utf-8?B?MG82NHhEcG9tdUk0RW4wbDUzdGx2aVVWcGJLYk9BL2xFWEJZM1k2TG1pa3o1?=
 =?utf-8?B?WnFrWDJMd05OZS9xTHNKOFRNNXBsZnAyZUZuNlhDUGFIb1VRZlo1TGJ1VWRC?=
 =?utf-8?B?NEp5eCt6Vzk2aHVoRVBtMDhhZStGY2hQaVRGODFQeFdKUU9YS1B6QVNZaDRQ?=
 =?utf-8?B?bGFLaVZZdDBIdS9aOXVzUlFBeWZXd3QxN1dmTGdIV3lMRnRQUmdiRWVpSWg4?=
 =?utf-8?B?L0x3Z2VjNGxqV1NxTUJiYjBkMVhrRndBVHUzeXRQQ2VSUEhvczF5eFJMRkpJ?=
 =?utf-8?B?YUtiSitoY05LMG5VV0UvYWtOekE3NStrOURiL1FtaGNVYTUwSEpkaC81QWI0?=
 =?utf-8?B?N05KZS8yUW91VnBVa1N5VjdFc2drRkc1elFDZ2VQalJ0ZFRjVzQ2aHdFRU1P?=
 =?utf-8?B?STVOOGoxTjRSNnZRdzBDV0RxQlB4OFordCt3SXVpNTBObU93MUV5aXU1eHVl?=
 =?utf-8?B?ZDJKUEdxcFhtV3Y0SHl6UWwxZHFWUmYzT0poTExmTVZaOGhTSGlZZGdwbjRN?=
 =?utf-8?B?dklaN2dzdGJXWWJuZTlUNWhpVElYUGI0WE1kUGlhN2xBeXJGMmkySFhocDNo?=
 =?utf-8?B?bTlJVGxRRC9jYzhPVnUwNDBkb1FxVW9id3hNblNlVVZyM01OeDByZHYyUGQx?=
 =?utf-8?B?V3QzQUhqNTV0aEZ1VE5yYUVqYURkZ3daZXp3SytqSlJZWm1oVHdaSkpCN2VF?=
 =?utf-8?B?dWVvWUZRZjArQmRkbjVSQ3d3elREbjB2bkZ5SmQ0VXF2VDlPOE5NOGdEMFhh?=
 =?utf-8?B?QkR6WnVjVWRtbVI1TzliZXQ3TC9KTmRWOWpacDJSOGdZcHdxM2kzZlhxSXNM?=
 =?utf-8?B?UVgzaHNMZ0hDWWhla2ZOTTR0bloxRENPbnJIVnJrblpmVU84QklUQUZQRlpz?=
 =?utf-8?B?Z1FYVUVpOHM1ZnlVR09Xa01Cc2dEZEhzNGp2UXBOQS80T1NLU21naXg3RHlG?=
 =?utf-8?B?bDU1OGhBUitnVnRXMW52SnFEZG5uS3Q3OGxxNUtKYlRwOTZ6WnYxTTMrQTBU?=
 =?utf-8?B?ckdoWG83N3hQenR6eVBSbEkzMDNpY0F5MFlXNU9VL1NMc0FsQU4wcnc2NWFh?=
 =?utf-8?B?NHZHamhkKzM0eEttUzd3QjlKWEpEOUhuY0RRUW1MN1AyNm5JYXZpWDU1K3hI?=
 =?utf-8?B?RHVTUkJEdk5HM1Yvc016cyt3QzFLcWY2UHJEVzFqa2tWR0tqVVpnYWJWKzU5?=
 =?utf-8?B?a2Q3R0s2YmgzVzZqaXVjOFIwRTY2aWZlYkxtSUVYVWlwRm9Fd2VvZ3UrYitZ?=
 =?utf-8?B?WjU5cnZ6a2pUTHhISHp5LzdCbExEck9tckJQOHltZjI5M0Q1dXFxb3c2dGlu?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4360aa31-eb30-47da-2454-08ddaf5f6165
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 18:30:34.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPsKFCKHuSK1PyCsIbVRCVevvI+BO0WbcAPTFt7dOxHNWt9qSdu6QszIzFr3ClBDWOi27GowRt2OIT0HklI3O+hli7oNs2AEkIAX3cUCJhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB0287

Hi Cosmin,

I have tested V4 on Raspberry Pi 5 (v6.15) and I think that I might have 
found some issues.

MAX96714+MAX96717+IMX219:

Streaming to memory works as expected, however I have encountered issues 
when I was testing
this with libcamera (streams + meta pad).

To make things work in the first place (tested on V3) I had to create 2 
streams - one for image
and one for metadata. Essentialy what I did was setting up routes as 
follows (for both serializer
and deserializer):

Image stream: [0/0 -> 1/0]
Meta stream: [0/1 -> 1/1]

With that and some extra adjustments on libcamera side I was able to get 
video stream.

Now, above fails on V4. I belive that this is to due with following line:
max_ser.c:

> +	ret = max_validate_tpg_routing(routing);
> +	if (ret)
> +		return ret;  

Routing fails here as (I believe) tpg routing is checked even if tpg is not being routed.
After I commented out this check all worked as before. This was not a problem for deserializer
as such check does not exist there.

Perhaps this check should be conducted only when is_tpg is true?

MAX96724+MAX96717+IMX219:

This setup was also tested by me on V3 (streaming to memory only) and worked as expected. With V4
however, after setting up the pipeline, I am unable to get video stream. No error is reported.
I doubled checked my setup with V3 and it worked flawlessly (with the same configuration scripts).
Streaming simply hangs after VIDIOC_STREAMON.  I am able to quickly test V3 and V4 so I can provide
you some further information if needed.

--
Regards
Jakub


