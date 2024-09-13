Return-Path: <linux-gpio+bounces-10049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C564977B04
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 10:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 245EB284EEB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 08:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE2F1D6DBD;
	Fri, 13 Sep 2024 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="REffQhBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001A1BD4F2;
	Fri, 13 Sep 2024 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216236; cv=fail; b=JrexxLX+RD6GoFYgrAyOa0+Vv1hxLOie+aW7hRVU9tUhvPhC4YUZ47O6sVZcMU1R8L+pGG79VI2/XUqLGTeibC11vJT6K4wgVUb9Fc8y1jv5oyZ9+6dDkeZrSzDPO5CvjlsnBeVb6kHBS5u1zaXo+uJZSF2Lbv6yERfKwvTu8YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216236; c=relaxed/simple;
	bh=JyK3ywi9Ht00B6w82g3FOAv4l8N26tz0n+KvfNjPDcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/HH/e6RvpR7amsmJ2vay7nuoIyRa3/SwxlB/FwYhsT3dlrjE00l4X+tyaxh4t7p9sEnaGVwxZkLsiGSYn5cvbQib/4D8dj1lzZbh3lMoDQRUtKMy2k9vGWQ6wmL7si0ixrotk4jcbzbB1Dt99IX8lSk6aBWNGnkvjY5+QmpnyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=REffQhBt; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u57hf/hok5Uzu+ptxvjoTeKAuB4+hRiUlt82HOmC6+SQPfmF/gWzXv9IIkoO1uzR1SeHBW34ET4GpQIOLB1Y6k3UHAs8zCszcI1IWUaKjTILzeVd/vu9tPleaN/3z1RVlpLdTMYdG5XHEyBeKoqyhIouAhbdGz5POkoojcvZM2t5eWrpzCipWoe7/Sdfpv/lWjUFpBUFaV+mItB4HMI7/0d+BFO/YIVl8c6BoyFqcs2oq205bLnM0zsgbItbL1eGvi+NDf+KyTchT2AqER+AZHXUhg3zKHF2ApL7chS5ixMEfqUw3oM8vwr1WmIWjNpFOylQxhIPaRNraBDcPvKcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2azDZqodn8AAhlAQVoBzAcvBGio6aTaqiLcdDGJ007E=;
 b=R67aC3I8rRet9H9mVLO4W9F7kKTdt3G7KnAKdDRjJf+GkQptcZkGNhssYyVza39sjcb8bfCT+8om/PWpFmbh0HJqU4yYaaftj+yecoBNkUa1ckzfISyOMsbN/OCARmFKpM/P9C/dA42E0nMKB99bFQ7UgzYVXTgjsis5eMmKZrKioSy0F5ugo0mf8FWFqBlMA60nro0JHIPsEdcMv61Gqg9CkuaTPYugnHjseATjUJBC/qxACepy95EAAtPoKEjHwNeeAiBuYQQtE5vyzMjjLxyzE+C50legQMV7eR+M6H0vWdSV21JqBxaiMiXZg9IMTCh2EYKWOsJXJvMLIV/xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2azDZqodn8AAhlAQVoBzAcvBGio6aTaqiLcdDGJ007E=;
 b=REffQhBtfuo2iX7Ra6TtHFJECszgacgZoRJ5nKOJMO6ydbNSr4JVi5sjcwWX2JXaYRPh2GzGtj3mYtu1zaTSOrLuIBr1jA0eyMIq+TYtk3sh9KzOTog8WhQIggkP1IPcyHty1h61H/6Lrx6o+KUDMdopEpFMtdRWARFj2nD1UOvKVCjv8gZtY8rt1e7C7Gio3XR5we5ywdqn/9bXWwhGYdwE45XJKWoDZjUwEswpr9EkccX0Q36BB9iZglpw9JrvWZFRKR4ASRum+1GmHneU3JEnBm+XOPoL3BxMO3aqpzKZYuu++a7qdhkNa5OAMT9ew57QJbIuyB6VeQkRwTHAVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 08:30:27 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 08:30:27 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/4] drivers: provide devm_platform_get_and_ioremap_resource_byname()
Date: Fri, 13 Sep 2024 11:29:32 +0300
Message-ID: <20240913082937.444367-2-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d70aecf-562f-4401-c174-08dcd3ce51e3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3RmbDljOVNuMU82NExKRklvRVRWdFZDaGNiN0g4MDRidHI2dHpzWjc0ejd6?=
 =?utf-8?B?SnU3S1k0NFB1dlFtZzB1UG5yOFliOU5JbTZ6ZmxzUEFBd2cxaS9Idm0wUHds?=
 =?utf-8?B?MXVqOXdGYVdHNGlFTWVxd0RIb2Q1Nk9UTFBFUndoWW80SkpWNVhMbDh0R1Fz?=
 =?utf-8?B?MllDejlIYXg2eHlGb3BxYkFOd1BwWjJNWVpNb2hjSVljb1dnYnJ4L25xa0s5?=
 =?utf-8?B?a3RwTUV1aUZKL3NzLzMwZ25rVXV2MC9teW9XcXBkM3JnUU4vK1I4dXRWQ3l1?=
 =?utf-8?B?RmZFWVZ4UktBbGVxM040S1VKdUNvZkVUNW5EZTdBUTU3YmJFdVdLWmZvZkpW?=
 =?utf-8?B?TWw5Y3JxQVVqYTQ2NmFENm93c3h3dGQ4dXFybkNXcXRZa0kvbXYxbnM5S1lo?=
 =?utf-8?B?SWRkMDYvemRZR3ZGTmg2dFVnekZnYTM2STY2V24ybFdPRnZ3bEhVYjhJWXU5?=
 =?utf-8?B?bXBsaEFlOTh2dFdWMTFKeWZGMUNVSFJ4Wmp3Y24wck9tZVMwYkt3UW9zWU9Q?=
 =?utf-8?B?SThlUUYyQ3dFNDRTRThkQ1BPTjdUeVIxcm1sUnE4TjgrdENMeHNucDlFNGJW?=
 =?utf-8?B?NWNiUVlMYUpYMzhXOWFJMzhDTWFYa09MZUFYMWtEYWhYOHVWcHBJUW5HdzNW?=
 =?utf-8?B?UTExWVFRT1hiUzVwY0RiQjdBOVFRaFFlS0pOMTE5UjFHenpHTy9rWUllOEFs?=
 =?utf-8?B?eXpJa0Zlc3lka1p0bVVOajU5blByL2NUKzdNQkU5c1dXWkhKM2xwSTlQWms5?=
 =?utf-8?B?bUpWYng3TExUeVF1T1c4Q3BTTVVTd2g3ZVlwRWdscEZQcWRqYm9ZTU5CVlg4?=
 =?utf-8?B?Q3dBZGRUdndRTVVRTUI0Q2t1MUkwOWFGR0VCeGUwUC83eEp1clpFS3d6Qm0z?=
 =?utf-8?B?VS9pZjVqbGpKa011NHNXaUxOcjc2Yk4zY0FJblc4UW5wa1pYRHZBUDlWTldo?=
 =?utf-8?B?OUNMQjBUaE1YUjdJRmFaQmNsWXh0MFd6aE9TM3Y4WVAyUlo2QWN2RldUakJ1?=
 =?utf-8?B?Y0plNUdyUGpBS0xJaGd5NjVmbFJsSm1aa3VsM0JucG1ZZ29TbE5YbWg3Nkc2?=
 =?utf-8?B?SmlSS3N3c29kaGFzbDVKL1hrbVVuME5MeWpVT21RWnA0d3VFTTRFRVZVY1hp?=
 =?utf-8?B?dnlkWUg1aDYwK25hMkJ4K1dXM1RCbWFwNkJtbGtKdlUvNVlrNzZuYWNxeHV3?=
 =?utf-8?B?dmlqczBuNnlVcmVLMTA4Q1NmVW1xUmc5R3hvS3hUZFp6US9mMGhUenlhM2tE?=
 =?utf-8?B?WXJqdUJJblhQMEdUdUJpVDBMVzF2S1FBenJzYmRKckk3cFA3RXBQTTFKQm5L?=
 =?utf-8?B?Y09CREZnN2pJWEJJMm9zZ0pSVSs5MHQ4eGNtc0szaFd1M0x6YmU4c2I4V01a?=
 =?utf-8?B?cEU2S09mdnFYR0pjeW5CLzVNSGJ5WG5JN3Ntb2hpbitMcmdJMGw4YmlxMlJZ?=
 =?utf-8?B?d2JaWVlTYkhGL044ZEhxSEdPTWFWcnNuQXYzZHFOUmdJdm5qczQzTm15bmJN?=
 =?utf-8?B?eU9ZODBkWVNHamxVa0lhMUxFakFRUEhxS0xnS1hjZ052cHZ5L2RFelF6dXFB?=
 =?utf-8?B?akRQS3EzRjNXZk9wWDlKd2hnVmRSNSswTUxQaHB5VTczNVZPUnJtWEs4QXFN?=
 =?utf-8?B?K09ibGNKRS9yV1o1a3cxR1NVVll0ZFdyS1AzN2daNk1iMjlKMUQ3QXdaSG1u?=
 =?utf-8?B?ekNoQ2pSQmdlM0dSUytvbUl2NXNIK2FPWGRuWnJjTUpoK2FVckQybC9ISGNu?=
 =?utf-8?B?NTYzUiswY05ZalhJcjZNTEVTemFmRHB4dXJDbEYwQnd4VTRNMlZWczh5ZGlq?=
 =?utf-8?B?MlN3dDh1K1lKY29wV2tRcVRDNnVkdSs3Qm5CWXNaaE5RWHE4ZmJSakVIbnZQ?=
 =?utf-8?B?V1dlOVVWN3RZZW5ZdzlRZENhbjRJRGl1UTBFdHY1VkdxNHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGlqazdNK0kyTVdtc1NobVB5OTR2YzhaU2ZoaDhhMEY5TmNoSnh4Q3BKWml3?=
 =?utf-8?B?SU9HWUFPMlBOMGVQMjc2anpiVHhMOFp3TVNWSmRuOE43eVpnMEFVVmhhV0hD?=
 =?utf-8?B?SXp3SldJRnpZZTFRUzFmTGZCMFJ0UUtISXdtNnJScERhMFRmM21TeHNndjRn?=
 =?utf-8?B?NGw5NmZWbnR5OFAxdzdiNDd1YjlnOUFQZmsrVlpBZzByYW84cU9TZHdjOUlG?=
 =?utf-8?B?dFBDVVFTY2QrY3RyUGJ6aUZzMlg5M1BzMDNXZkhUMU8rWXRmUlFPeld6Z2Vp?=
 =?utf-8?B?MEppem9CdFBWcGhGMkZ4WldnYU9VTGdUMlpZUElQdFdyREZ2NmVjMzRwV21L?=
 =?utf-8?B?Z1RXdWFpdkRmdzZIcGNmT1hwczIxakxXK1R1QW5zc1Z2bDB1VnlMMU5OTEhP?=
 =?utf-8?B?Q2g5b2pNNkZXVE5veUNPNFV0bnY3a1U3eG0veFcrK0dvNU1WeDVhazM0U081?=
 =?utf-8?B?Zm9sREVaamdJTXpSZFNLOHY4NXAwdGlRS3kzRGlROFI1Vm9tS0ErSXhZcW9Z?=
 =?utf-8?B?TGIvUDh6M3JBT3NsVGpqTWk1V016alBqbjlNcVJxZ2VVQ1ZqaGtCcERMV0FY?=
 =?utf-8?B?OXVFaUpuOHVFZ3JQVkx2WE9ySWsrSkkxWGF0MVY4SStkUGJFaWEvNVJhb29R?=
 =?utf-8?B?V09hbUNMSjJNaFRiSTRPWlF6TzExY0EvdDNpNDA1aEk1RE4rL2hvY1pJdlRS?=
 =?utf-8?B?SnVXVWNLa3dUWXZLZERFUHpOMHIzS214YStQSEdMdFZKenhBbzRUdGY5Uk1L?=
 =?utf-8?B?WjlzM1EvZUl3Z1FFd0x6eG42YVJDamxtQ1NsK2duSVkxRVZaSWY0dnhpRFc5?=
 =?utf-8?B?ek1JUHFXclFMT0gwcHk4YS9SdmhPV05QUS9mQnRGYUZic1BBS3VnK3FPMWNL?=
 =?utf-8?B?Z2I3a0prSUhKYjJVd3ZaTTRRN0g0MmhaNnpqSnhtRUFLMG9HOUxIV0ZXdWJQ?=
 =?utf-8?B?NFBrb1NrY0dOSGFXWW4yZ2pJMzFHUDczNnZ2SlJYZkNMaW5CUkIvTC9vUWpE?=
 =?utf-8?B?SXNwempDd3VsVFZmQjhaWjNZTlVkcEgvdFBzN3dtMW1KSEo1dkVzanVaMHFn?=
 =?utf-8?B?TitvNzMxU2ZVSms2ZlVSdld0V0ZHbnpXUEY0SWNzM0xjTHo0eWcyUXhGajUv?=
 =?utf-8?B?dERENWlJQW80R05KQlltM3FIeXZBTDJlME8rR2ZhMGNsTkY1aFVlRmkyTTEw?=
 =?utf-8?B?Um50R1Q1MXBZZCs3dTZDREJDa2tMajRYcGhOdTA1WmF5ZzA2R0VtUGhQRzhi?=
 =?utf-8?B?RklUNUY3NXlZU21PNE1jTlN4T0NYbElNMTJnRzgzQURQa2FtVmYrdDRiWU5U?=
 =?utf-8?B?OWxHbjF1T0hackV5ZFdOeWN4bTZCN1pZYmdsdzhFM3c4QU41cDlhN01IY0xE?=
 =?utf-8?B?aXNwTFEwSFdQdEs4RVZ2RUljNlBKRStXTUJ4ZkgvTVFCUXJDZ0Evd25FV0dl?=
 =?utf-8?B?bG1aaHVtMUFBbVYzcnQ1Z015elR1SWh6b1hIYUtVZFJXcXE0UDZxc0JXcWdz?=
 =?utf-8?B?Zk11cVVURWRLVmdFUTdGS2VzOU9ienV1UWRFTUpHSHBDRW9Mc0t3bFJEdjY2?=
 =?utf-8?B?WHZjelgwSVNmcFZKTEx4TGFQeXVJZGJqTFdkSGdlbXZaVVlRTlRPQ0ZXUitt?=
 =?utf-8?B?RzlLcmNjUElJUUhRa2ZnUzYyNmpHRTZwTHQ3WlZyTGFCMjdOM2xhYVd0K3ht?=
 =?utf-8?B?alhsL1RVbi9CcTYzMHBHUHg1amIrNUlickViZ3NWcVhHanpKNEZwMkIwWjF6?=
 =?utf-8?B?TkwxWlU5Wm5xZFd6M3NDMGtyem15aHhxaVptR2pXM3FhWHJ2ZUFiWm1iYmVz?=
 =?utf-8?B?eXZPV3VFQnVtTno3SjRvbnJvV29JRWtRMDRCcnFKNUNpOVFKUStSYURLRlJn?=
 =?utf-8?B?RXNCWHdnTklwSzZxV1JHU3NWYkRwRHJhRHQwQWY3cDIrcm1ZOGRPWlVwcGs1?=
 =?utf-8?B?RTVsL0lBUFZaV3RqWkw3SEtaenNPaU1JZzVJSGw1aWtkb3UwNGJpWW9zUzVn?=
 =?utf-8?B?NGFQcExlQnBaYUM2Zkc1RzhnSkxXb1dsRE90K2tZY25QVjhSNW0wbnl5Tm1J?=
 =?utf-8?B?aDMwcGtBUDRsS09tOGVtaHk2NXUrUC8rZkVVY25DV1YzZWRSMHRaZ0JOWFNV?=
 =?utf-8?B?VFpDODRuOXFGLy8wcERBeHQvTjFuZFhjelBNL1ZSREpwd3BFYjB1Z1g5WVpL?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d70aecf-562f-4401-c174-08dcd3ce51e3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:30:27.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jJrLIKY/8Q2qBU3t8bfbIvUnwCW9dffIpkBGoCowRPVYoxTn0MDqNJaZLeEZbs3p2EE2K9OLCRaYP9kHYAhZ2RrrddZKn+tiU/RIkDOfOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

Similar to commit 890cc39a879906b63912482dfc41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()")
add a wrapper for "platform_get_resource_byname" and
"devm_ioremap_resource". This new wrapper also returns the resource, if
any, via a pointer.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/base/platform.c         | 28 ++++++++++++++++++++++++++++
 include/linux/platform_device.h | 13 +++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4c3ee6521ba5..ab48c02fcb2c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -108,6 +108,34 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource);
 
+/**
+ * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource()
+ *					    for a platform device and get
+ *					    a resource by its name instead
+ *					    of the index
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @name: resource name
+ * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	struct resource *r;
+
+	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (res)
+		*res = r;
+	return devm_ioremap_resource(&pdev->dev, r);
+}
+EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource_byname);
+
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index d422db6eec63..ab7f33f3c426 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -68,6 +68,12 @@ platform_find_device_by_driver(struct device *start,
 extern void __iomem *
 devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 				unsigned int index, struct resource **res);
+
+extern void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res);
+
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
@@ -83,6 +89,13 @@ devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline void __iomem *
+devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
+					      const char *name,
+					      struct resource **res)
+{
+	return ERR_PTR(-EINVAL);
+}
 
 static inline void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
-- 
2.45.2


