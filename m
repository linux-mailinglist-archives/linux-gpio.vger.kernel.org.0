Return-Path: <linux-gpio+bounces-10606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B321C98B7C9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 11:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60FEC2820CE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5550419D083;
	Tue,  1 Oct 2024 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YalPNeHp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782819CC01;
	Tue,  1 Oct 2024 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773239; cv=fail; b=Q7llygm9ycFus2qBIQhpvZ3ZpwtsgxTS8EL2Zd0JVKm3YdOZI8AlaILap0w7mNKi34mh30+pZMzI035CAbWuW57Q2aN0Knja8u0c7bAu48mHJL+2aeJaQeY3EzETKKmNUHQA6mYQ715CQ/lQmCUN3EblOLbI8FFVtw3jFGxQ7L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773239; c=relaxed/simple;
	bh=UTwbc30sXmJBDFg4LOn4oqEBB+CUr175eCQNWP0f+cQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lp7EnO8wzjg0QfpxHfhZ9xpOI9M1ClK50Wofbeo81mvhkDl3cd72dNVfWddGxoJ1pXLpffuEUKZ1Exxy4x8NA6BuuDFeqgz26HTBbtnGgzdjv8LjfGOTak4KcqdUsihucQxX6R/dWHCPbac+UY8zDp2uU4W2XI7JmRVzNvwNB00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YalPNeHp; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lApLsw30NWBCOQXWvh2Ft3dffnVbpLHT6WohIWfWEZDmvjb5nAelXviY2eJtBDD+SnRLh+UJbxOJpXMUaAKIES1YfM304/7vmf4gjybc55CzGZgtopQI1vGt5FYfxgIDWHedm9/FBckTB5zwXKKxUrC80LqibHenpimbHpTCQ3cLpO/3u6QOnE8AezDYaCKdkJmoadRmbtM/1XJDEkJrdutkjy+J8oV9Vyg9KjuJDpq7YHSqBKbenuHqsuCHtjxIUiQgca9G5l6lA0DT+oo7j3j6Jsmzz2yOfAcBhxEEyiFvP4JqH74RJnq2lsY0T1mu3LJK1EOqMmec9vnvr8CX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LT9MMpRluVZAuMeLYiR8OVnAzssPPGJ0HUrCKYCtSA=;
 b=p4I5Pk/ym+HQui4XqbckARgDDJpEnKz/16Xov919z2kfhWiKvGCG3C8M++95J4v5wtsCBisZbGt2CDplwQ7Dn6PuE9SfDbeyKG3e9ONa/Uedxp5JbYKhALvWGEnJqhUhZbXTsRO268edWtNBzaEgXNEAxB12dKDmovcWknO+/te4kvQFAgSGbRZnBMf0G2TDZlQqATJoUHWvgbVM/HPEbb5Zm/byaTEv/XX5qLzFFE9X/bVqhE7kg32ecv877dQy47aSSd0CLbmcgE6yOKWdMQQKRiSwT58QEBB3V9dJppmjiaMUDNIXgHg975Bk5eukbBNTBElvp1c15eYaToKpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LT9MMpRluVZAuMeLYiR8OVnAzssPPGJ0HUrCKYCtSA=;
 b=YalPNeHpJfn45gnFzVALRH77Ro7JBB9CAxzTcIMgFyAgo7hHkjyCm92+pAOHtE6/jfai2+jsqT9RAjIzCrMT4VDFAhi36ZKithqWMjFBzpOqSMPOiT+y5ZCJjL9A3V151byS+BxGRDZUQS+vkb8rAka8EET/R8JEiCgiNuSijfTjSsBsUGLmhTbJURtXTSZj3bbt4gf06sS6MBTXpzyMelYisCVhs6RZ6NC7++GeJndeDHQIEK35wRoUma9UV1s3SVyS8h/4HJ4xQI+CsaSKyJT+H6uEzN7KlqWRVz2DWznv/sTHYJ5xd2UZ/HB6B1KeONxdiypXqJ9LeyOtxUQ1ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB11064.eurprd04.prod.outlook.com (2603:10a6:150:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 09:00:33 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Tue, 1 Oct 2024
 09:00:33 +0000
Message-ID: <20d46ef0-8c58-407d-9130-3c961dd1656f@oss.nxp.com>
Date: Tue, 1 Oct 2024 12:00:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
 <20240930-shortness-unedited-650f7996e912@spud>
 <20240930-bamboo-curliness-eb4787b81ea3@spud>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240930-bamboo-curliness-eb4787b81ea3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB11064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1313399e-04a2-4a36-614a-08dce1f78190
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTF3eFk3eFhFcjZCNlI2MG1xcEtTYkJKMXFlTXpzRXZPR25md080OGpqWXor?=
 =?utf-8?B?T2FPRnJ3T01WUS9ZVDVDenpCZE5hcGJxVy83dVM0OGlSai85MHJZYVozeXl2?=
 =?utf-8?B?OEV0VTNibHhqdVdpYnhBcncrMG9Sc2VqMnBEeURDUmxzdEpHTTBQUGVtbGZs?=
 =?utf-8?B?MS84RGFVUS93TmIxVHZTSUl2TjN6QS9pMGVTT0RBcHdsZkx4SEd5TWxWUUMv?=
 =?utf-8?B?UW1CZlozMXhHaDhvY0dZK3liWks3YkdvanFJMEhESzRoeklvbnQ0NWg1cEtG?=
 =?utf-8?B?NWk3cEpEYXRreEdqaXRYTTh6QkYwc29MWnNreHZFRjVXa2x4bHppRTloRnN2?=
 =?utf-8?B?ajAzWjFhOU84QVMzTGZRdlBndXdoNVk4VmtMWTgwcmRzV3R4OU8zckYzNzNn?=
 =?utf-8?B?UGFyYXRtdkRjbDVzTk9Fb3lSQyt2bHhCNW9GdlhuVjZqTjRaakU4ckdkQjR3?=
 =?utf-8?B?eWU4a3dJTFFpRlNoQ3NldExNNzBRbllvb2djQUVYSnF0ZWNYYXY4UHk3cjhr?=
 =?utf-8?B?cFQ0VS83RWppUTJSZmZ2bXdDV09LaTkvUVZaZHViVDRObEZ4eElZK0NCVENr?=
 =?utf-8?B?cWF6SUJucHhhWHJkQUR6UTkvNEl4d0VTU0hkVWEwNkhJSzNtR05SUS9mRzFP?=
 =?utf-8?B?bmRqREt0VlBHZTI3cnJVY0FUbUtkeXBvczg5K2tEVjdDK2pnV2ZLVnFYZmxk?=
 =?utf-8?B?UVFTTndhb2cxUlZtbTFlTVJVdVdXdHpiTXE3NUpTcU1SbDgrV1FrRkhLY2p0?=
 =?utf-8?B?NWRkcThNTk9KT2FqUHRIM1NCbUNLeFZiTURIVEZobS9iZ2tlenk0YWc5V1kz?=
 =?utf-8?B?VGNoUmVyWS9Gc2hoaWEweVI4KzJzRkRzazdRRzNsWUNLUVoxRUt1eTZsUjBt?=
 =?utf-8?B?SlI3b0RFMHQ4WmcrckVObm11TnpocEliUWJzeGJaaDluNC91VHhiYWZYNlBj?=
 =?utf-8?B?YlhUNHJlQmdZaUJhTnZGcElhUnVVd1FaaEUvcFRaM2ZQUWp3V0QrZXM3Qm1y?=
 =?utf-8?B?RGMxMDhISjdEZ2pWOURTb1JwdjJwZjBud0JzRjZldTJVNFJqcHYxem12Q0Z0?=
 =?utf-8?B?TVJpQ2VPZjZ0dTBZUmE5SzVEUTRldTE4RWFTczN1VEY0TFJ4S0V2Z1p3UVpw?=
 =?utf-8?B?czJBOGVwQmYzRytyNWlkbjEyUE9oc2x5M1UvNXNOSDZoTk9aQ1JiMzlVeU5J?=
 =?utf-8?B?VVFYaktYdGJYWGJOL2tyM2xtem9NSUxKZk9mUEdyUFFPVis4UFdxTEVncSta?=
 =?utf-8?B?NEhJSnNHMHB3N1JtMHVQN05uenVMMXJXSFN4bHR2a2pVVytZa2UwVlJrMWVm?=
 =?utf-8?B?RGw2QnBHbURrdFdkalhZSXRHTXBxZFJtRDlDZDNpYTMvSGhwb29IVUJ3NFlY?=
 =?utf-8?B?UjBvbDBtMkU5Z0xhRDlFQzRFS2dFcWdkQ1hmdkRvcHgrUGhxSDk2bG9sZzZ3?=
 =?utf-8?B?aUUrRGFXTm43eEo1VjAzajhIODZ3dU1sMmZKMEQ4SVNuMTdzTmtvOUlPNUxs?=
 =?utf-8?B?cDk1NEk4ZXcycndzNE91Tmp2emlBSnNGZFJVWG1aOUVqam85cEN1ZjN2c0Jp?=
 =?utf-8?B?U01XcmZHdE5WdVMwd291dHRSKzMxdTNwakRqNWpUSkdab3RSV2grUk9POWlz?=
 =?utf-8?B?Z3VaOGM5bm85YkVla1h6S09zczRxUXVvNWZvWS9mdXFaTytGL0lqZUh4TWNW?=
 =?utf-8?B?ZE5NcFZNbUJJcnM5OGdGS1N3ZU4xMlBOQ3dXbUhHa3cva3hIZUpVaUp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1JnMXlsQ0pkYUdxQ25BSHRMclBZZHBzOWRyZnRQa0UvM2gyRlJSQVhIOXZa?=
 =?utf-8?B?OXFsTW5NNHJmMTBra1FiTFM4Zm90cENYWXJnTWsrVjRoTk02c1VUak9PK2kv?=
 =?utf-8?B?Tzh6bjF5azJ3Wnl0WlZON25PZlZrblQ5b1pFYVM4WTZ4U3FPaURMVE41RlJl?=
 =?utf-8?B?Z0IxVDhqTGtkeDJEWTBrNE51Lys4TUNGSFpkNWoxTmhjUnh5V3N1YllFeFli?=
 =?utf-8?B?NUNPSGoxazdRRUpDRXRFbmQ4VWdUbFQxOVRDcEdaRjdqRnhWSktlOE9FNytl?=
 =?utf-8?B?eUVUN1NIWG8rV2NjZGN3bmJGUlFsa0pkeStianIvU3F1RlFHdXk0QkRJVTZs?=
 =?utf-8?B?a21ZaTFIMHg1RG1FdXBoM3pNZWFFTzVxQ24yZG02QTF1dkx1NlZKY1hDZHVv?=
 =?utf-8?B?c1JQNm9OK1A0VVJUaEphZVdkc1VabEJBYjUyNGxJTDNNR3dlNjNjaHpLQUlI?=
 =?utf-8?B?WkRQMGJqTFlHcW5PeHFxVTIrU1Q4Q2dhL3FzUmlvcDUxR3Vvanl3ZVh0cE5K?=
 =?utf-8?B?Qm9DcTEzbFBzcHN1aGkrRUVWOEZCVkpOVzZFMFJVUGxEMGhJdFNEU056a3Zt?=
 =?utf-8?B?THVaMmdUdFpld2R0VHRteUwzd3dYUEM1d3JDN1NITVdML2VzVm5WTXZrRDZJ?=
 =?utf-8?B?TVhIdU1vSWlkZHMxUHh2ZXFLNkMrSk0yYVRYbjhNd2hqZ3VUTElWVjZpRFdL?=
 =?utf-8?B?OU5TZ2EvcGZDcUJ4cHNNaE1xU0szaTJVUTM4bHNDSjVUQ1B5MFFHd3JUK01k?=
 =?utf-8?B?TjdjNXdWZ3UrVmVyVEFKUHBCYXNKand0ajQvT1dEeEF5d2pCNE9XZExpWkxV?=
 =?utf-8?B?TjhoWnZxZDJoZEhHd2FnUHlEdWlVYzBCVjFXTWszTnY0KzFyQURUdnNSWEFk?=
 =?utf-8?B?RS9TWFVKLzdKTmFmQVZDVEkrNitmaTM0QkJkSDJ0VTJsZkREc3gwcXBQMzZq?=
 =?utf-8?B?bW95clZtd0d4VjVSWUUwMFVTYng1aVZXdWNhY28wczZSSHhSdUQvTWpNYjhI?=
 =?utf-8?B?MC8vNm14eFVWZ01XUmw1QlVENnNZczA1WjBNU3hKcVlFZStjcllLc3FaSGtm?=
 =?utf-8?B?Q09Nd1dTSW51SHZzT3JvR2kyeHhYNXdXS1ZsTEhlUCt0eUdGK1BlTVE5V1pI?=
 =?utf-8?B?UllySVBUem5iNTFQU0pYTGNpUlQ5bUx5ZlVZM0htWkJKTVJySE0zQXZWMXRI?=
 =?utf-8?B?N1Y5TkRNOXdlaUN4TVpjR29Dc1VCRkxRaVlhd2h1M0ZheVZ4YmZoQzdZeGhy?=
 =?utf-8?B?SjZuOStSWFVRZVlhV3hRM2lHYWM0U1FGZ2xabzVPSHpWRy9SOW1TbktkTzRY?=
 =?utf-8?B?T0txREZqTkJuZ0dVUGdEdzEyL0NUUkxzMmJ4QTFXNGZuVzBzeWNRYUIvRVRa?=
 =?utf-8?B?U2wwQmFIWW1XeDQ5UXBqS0VtVUpiY1B6cG9LZ05uVEwranZBNFNrcEM4VDVq?=
 =?utf-8?B?MXhidmNpU3U4bEVPbUoyZEVud204cnBKZFlWOUdaaTNqTzlHSWZUSnc0Um5M?=
 =?utf-8?B?VFlnaEpkNlVZSzJRNENSM3E2by9ydzMxcnlyUEREOTVsZDlXLzEyRmdtTEpV?=
 =?utf-8?B?STBaUkFtNjZEbEZ3K0RDYlpWZ2RiU1lkVElpS0pkMFNHUmd4RVVUSDR6MGc0?=
 =?utf-8?B?cFd1cGRoZFBKSHNOUGwzZDc1R0NCeTlQNlQzalNMVEU5cXllMXJCWDJZbnNV?=
 =?utf-8?B?cXlkTkNQVGxLcExtWWw0U1FrTGVLdnAxQ28ya1V3bTZXdEdVUUN3enQvcGZS?=
 =?utf-8?B?anpGMllvaFdqSVptV0llT01LTnVrRzh4THBSZGhiNkwwbCt3NDZ0a1JTTGxi?=
 =?utf-8?B?TjNGTkRML0VDTG5UQzZJRlozY0Zqc2Q2ZldzcTBRU3hvejY0NWNxYjk1RHVS?=
 =?utf-8?B?N2tWb2dQR20rOFcxVG9teXdTMzl4RFpEZDhFaE5NOTlNY21SZnNjdWxaMUxV?=
 =?utf-8?B?Rm1SRktkaktBZ3cyVStoYjMwUWYrQUNENklsTlo4QXBxUXErN2JvN1F6N2Rk?=
 =?utf-8?B?MGZ3OTVIYVJZaE1PcjNhQnBzNXZhOXRGN2Q4aG9LY3oxOVJ6bGV5Y1ZCUHor?=
 =?utf-8?B?cWFoeGZMVmlrQzE2UlRMVXNqZFhaZzR2UUhCYnY3QzNPdFpvcm5DUjNURHRJ?=
 =?utf-8?B?NnBTb3VOdlkyaHVDOEJ2STVHUWY3OWxLK0U3QUtTTkdZOUFQUmJKdDdGVG0y?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1313399e-04a2-4a36-614a-08dce1f78190
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:00:33.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdIYC+fvKSzd5EDqnnr5ug5tB3pE5ImyF3ipQmXk5Lpj3ZCulnA2ZZoBxpOMoz8CJ4H7v5J0g7frCY4vlY8H34sl1SYbSI9DIysbRXlvCoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11064

Hi Conor,

On 30/09/2024 18:07, Conor Dooley wrote:
> On Mon, Sep 30, 2024 at 04:00:57PM +0100, Conor Dooley wrote:
>> On Fri, Sep 27, 2024 at 10:13:54AM +0300, Andrei Stefanescu wrote:
>>> Hi Conor,
>>>
>>> Thank you very much for the prompt review!
>>>
>>> On 26/09/2024 18:38, Conor Dooley wrote:
>>>> On Thu, Sep 26, 2024 at 05:31:19PM +0300, Andrei Stefanescu wrote:
>>>>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>>>>
>>>>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>>>>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>>>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>>>
>>>> What's up with this SoB chain? You're the author what did
>>>> the other 3 people do? Are they missing co-developed-by tags?
>>>
>>> Yes, thank you for suggesting it! I will also add Co-developed-by tags
>>> for them. In the end it should look like this:
>>>
>>> Co-developed-by: Phu Luu An <phu.luuan@nxp.com>
>>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>>
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +    gpio@4009d700 {
>>>>> +        compatible = "nxp,s32g2-siul2-gpio";
>>>>> +        reg = <0x4009d700 0x10>,
>>>>> +              <0x44011700 0x18>,
>>>>> +              <0x4009d740 0x10>,
>>>>> +              <0x44011740 0x18>,
>>>>> +              <0x44010010 0xb4>,
>>>>> +              <0x44011078 0x80>;
>>>>
>>>> Huh, I only noticed this now. Are you sure that this is a correct
>>>> representation of this device, and it is not really part of some syscon?
>>>> The "random" nature of the addresses  and the tiny sizes of the
>>>> reservations make it seem that way. What other devices are in these
>>>> regions?
>>
>> Thanks for your answer to my second question, but I think you missed this
>> part here ^^^
> 
> Reading it again, I think you might have answered my first question,
> though not explicitly. The regions in question do both pinctrl and gpio,
> but you have chosen to represent it has lots of mini register regions,
> rather than as a simple-mfd type device - which I think would be the
> correct representation. .

Yes, SIUL2 is mostly used for pinctrl and GPIO. The only other uses case is
to register a nvmem device for the first two registers in the SIUL2 MIDR1/MIDR2
(MCU ID Register) which tell us information about the SoC (revision,
SRAM size and so on).

I will convert the SIUL2 node into a simple-mfd device and switch the
GPIO and pinctrl drivers to use the syscon regmap in v5.

Best regards,
Andrei

 
> Cheers,
> Conor.
> 
>>
>>>>
>>>> Additionally, it looks like "opads0" and "ipads0" are in a different
>>>> region to their "1" equivalents. Should this really be represented as
>>>> two disctint GPIO controllers?
>>>
>>> I will add a bit more context regarding the hardware.
>>>
>>> The hardware module which implements pinctrl & GPIO is called SIUL2.
>>> For both S32G2 and S32G3 we have the same version of the module and 
>>> it is integrated in the same way. Each SoC has two SIUL2 instances which
>>> mostly have the same register types and only differ in the number
>>> of pads associated to them:
>>>
>>> - SIUL2_0 mapped at address 0x4009c000, handling pins 0 - 101
>>> - SIUL2_1 mapped at address 0x44010000, handling pins 112 - 190
>>>
>>> There are multiple registers for the SIUL2 modules which are important
>>> for pinctrl & GPIO:
>>>
>>> - MSCR (Multiplexed Signal Configuration Register)
>>>   It configures the function of a pin and some
>>>   pinconf properties:
>>>     - input buffer
>>>     - output buffer
>>>     - open-drain
>>>     - pull-up/pull-down
>>>     - slew rate
>>>   Function 0 means the pin is to be used as a GPIO.
>>>
>>> - IMCR (Input Multiplexed Signal and Configuration Register)
>>>   If the signal on this pad is to be read by another hardware
>>>   module, this register is similar to a multiplexer, its value
>>>   configures which pad the hardware will link to the module.
>>>   As an example let's consider the I2C0 SDA line. It has one
>>>   IMCR associated to it. Below are its possible pins and
>>>   corresponding IMCR values:
>>>     pin 16 <- 2
>>>     pin 24 <- 7
>>>     pin 31 <- 3
>>>     pin 122 <- 4 
>>>       (Note that MSCR122 is part of SIUL2_1 but the IMCR for
>>>        I2C0_SDA is part of SIUL2_0)
>>>     pin 153 <- 5
>>>     pin 161 <- 6
>>>   The IMCR values should be aligned with the function bits in the
>>>   MSCR bits. If we want to use pin 122 for I2C0_SDA we will configure
>>>   the function bits in MSCR122 and write the value 4 to the I2C0_SDA
>>>   IMCR. 
>>>
>>> - PGPDO/PGPDI Parallel GPIO Pad Data Out/In
>>>   16 bit registers where each bit(besides some gaps) represents
>>>   a GPIO's output/input value
>>>
>>> - DISR0, DIRER0, IREER0, IFEER0
>>>   These registers are used for: status, enable, rising/falling edge
>>>   configuration for interrupts. We have 32 interrupts called EIRQ and
>>>   each interrupt has one or more pads associated with it (controlled
>>>   by an IMCR register per EIRQ).
>>>
>>>   However, one important thing to note is that even though there are
>>>   EIRQs for SIUL2_0 pads, all the interrupt registers mentioned above
>>>   are only present in SIUL2_1.
>>>
>>> Because of mixed pins (I2C0_SDA in the example above with the MSCR
>>> in SIUL2_1 for pad 122 and the IMCR in SIUL2_0) and the interrupt
>>> configuration registers in SIUL2_1 we decided to have a single
>>> driver instance.
>>>
>>>>
>>>>
>>>> Cheers,
>>>> Conor.
>>>>
>>>
>>> Best regards,
>>> Andrei
>>>
> 
>
 


