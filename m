Return-Path: <linux-gpio+bounces-28526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29AC5EC69
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 19:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2229B3A8F1C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 18:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBE42D24BD;
	Fri, 14 Nov 2025 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="coYb93ic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BF2D948F
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763143517; cv=fail; b=EpmqPdlcnD4/EpA97rtZamk17wll8MdZZktMVN9rMC8/MQyDKl+L1Yxe1nO2ryvWyKlhDEBpr4Ftq43cgZW61V+J2fPy9Pvp57s+K++i3RIxo9Xk3+Cd4vW5AK4u1fu2Cha9vUoEjczhmNqUqr7Urq0WDrVzd4vceNH4iJwqrr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763143517; c=relaxed/simple;
	bh=XtIR7NgHGJLUSJRDdCOJQ/P7Fk7gzBVQ7yYFAphfuv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fYGzqnGmi260iGnmJb5mfKmQmsGt1+zdCi57PVlnbMrc0VHSXGkCuseaXwHBQ0lRcnjsrUJyiLCiT+54XjOl7wUDc3j+/Ats9sKQ+v70Afc+YuCjRyXOIfDXyDX0Fahf60dkQkpcWGj5Aih0OM8xUdvJfUCk2LRvqXCcCNG4T28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=coYb93ic; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIFqteeMy9qYwxtRZbz4FExAsAxhi9JdABiDJlMMBqQsu9HdGYylmdNeJAdq9Ev4uNbqOY6Jr+lqG3mt/RnL/RfDTxCfUSO57gv0QZtXpU5IU1qaq8ByL3cJjDCIiVR8CEEirhMLc/wZ5zRUpwMd8582pwSVwHurSdFgPiEyj9j8tFmY8RgfVlpv+tmGdzDPkMXPUNw+YHTYEb8sW0p6Lvtx+MM+CDZejQzp816YgkelZ0YTJhP8HWikzdwS0zWrfUMnGBTGabAtmYfhRV3oR07SImbSOc8HHdtZS1FAIuARiI58w4G369BiYhq5Olod5i21Ktjp0M54Qph/GfU/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtIR7NgHGJLUSJRDdCOJQ/P7Fk7gzBVQ7yYFAphfuv0=;
 b=NCrYGjmZRcfpn+rFOBjVeL3O3xLkKkhuLKa4i/J+zAa3PaQ/I5TxHio2DNDmMaDTDbxJ6gWrl1EwMYW2C0k33bhnNu9TT7p5BqgSOcdaI/Gz3NEdvKE7djVDZrrpO64VM29moOshCpm49sSqttSyygS1Rj8+98uABMImrZXJBVPPqLOK39crDKWYbrv/xM53pTB1lzJijGoyt4Y8O26I5ltykRqz1vqLjRvHd8Oac+ctiLmiEQPPEZmd/fa+BBvjt74hc6J0zzBoaYUX5Qt7vEM0Kw/lcuJJXdykoEKSWm6dfX5u325LnkxK/1CeMtJ2at7xzRTcpllkXqLrg3HShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtIR7NgHGJLUSJRDdCOJQ/P7Fk7gzBVQ7yYFAphfuv0=;
 b=coYb93ic9LtlT2BPX2QYeMxID65lw2RCf4/YURZ5aM7DFh5wXXBCVwiDeKFmL5OTitx58cfz8HGwLG9pnnGqckGCNem4Uuy1xbferMFRnyJJ29yBdOFplThZTgqhOt3TBfKxhfU2R+y/oCqwGUORQos6K0EjoeKUCwT8iFomcnFMMuJFOTl043K/4wk2U+LO3cQuCo2K1ZE63K9ZoFEwIjKbVpHVcPz27fzAF5lac41fnKtRJqrPTsAzRE88OPegdhWWdJjUcjdEqWqWfjUy9ljm4lsxZi5+l4VQH7Mcbn778l9qpwYE3+PgRSJZ2Ji9s+WeC70e0fw8gpIszWEbaw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8556.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 18:05:11 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 18:05:11 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip
 twice
Thread-Topic: [PATCH libgpiod] dbus: manager: don't try to export the same
 chip twice
Thread-Index: AQHcVWrJiIxc8vuKkkSx3HGVJLRr8bTycgGAgAAFloA=
Date: Fri, 14 Nov 2025 18:05:11 +0000
Message-ID: <4aa78378378a9aaaa9970e8f85b140b70848074f.camel@siemens.com>
References: <20251114132957.33750-1-brgl@bgdev.pl>
	 <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
In-Reply-To: <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8556:EE_
x-ms-office365-filtering-correlation-id: 18a24a86-23e2-43f8-1153-08de23a85a91
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFc0bGYwRHdmTk5MaGpZVlh1bXZ1OTdwa3c3RW5vUlRrb3NuNnR1cnRZSnVW?=
 =?utf-8?B?dWFPZHVuTWdUdW5rdmNpL1BvN1lWR01IMmpJSk5nSFN0Yk40RkFpWDlqOEFM?=
 =?utf-8?B?ZFpLWEoxYUpCYXFaUFpXak1hMllpWGcrbDk3Z0FWTU5KY1RoYko0bUJvQWVY?=
 =?utf-8?B?aEsxa1dEa2txUkFNdXFlR0VteXFEcGkvbURWd0ZUaFVJOVkxeXVJU3R6dkZL?=
 =?utf-8?B?TWphdCt0UE5jeTVlK3NDa1N3L2xFWWVMOTdySU9rWWZrQWRXYVpGTGpTUDhV?=
 =?utf-8?B?b21wNVFVMmV1WTNYTFJkdGsyd3lqckpxbjZyRmx3U0xOendacUVEb3J5Nlh4?=
 =?utf-8?B?T0dGdkVveTc0N0VkZURjQis4bmhpbzVVSHlpOHJQUVk3cittanpYTzdQVWQx?=
 =?utf-8?B?R2EvSEVwd2pyclhWaXM2OU50S0htQkxJWXBRTStTL3lZN0tscStKWW04MGdL?=
 =?utf-8?B?ZHZpSXlXa05CeXA0WGordWFGZnhvS3RMQWk4V3AwNFRpQ2V6RU84alBPSURK?=
 =?utf-8?B?REZSZ2w4ZGhray9kVlBaNXE2NHB4RXFhcGlMaDl3S3Ivd0NiYlBIY0l1MDUz?=
 =?utf-8?B?SGs2VFgzc2VSRVRKQlowM2lWTGU2MW8yUWZuamg0QjVIckM0TTk2N1pWM3Vz?=
 =?utf-8?B?UVBkK2w4YnVYLzZobTh1REZJTnZScXZSOWZKaHNxekJHbUN3Sm5Gc29CczFV?=
 =?utf-8?B?NlpmdlVQSUVuUmc3ZkxFVzRWZG50azhKbjFBKy9iZEQ4TjNtMzJyenZEYXFt?=
 =?utf-8?B?WU5VekVEaFlhZVFjUU9hdi92U2Fsc2dSOUJneFlXZTg0VmtpRVp1bGlEZEdn?=
 =?utf-8?B?N2pJbWNPaXp2VXNOTFhEVXQyZmFScVovM3lPdUlTQUYyOWMrdnBMK3RlVVk5?=
 =?utf-8?B?a3JrNzY4UDA1UW5GOEpYbjRBSGZpQ0xZMFZlMmZrdUNRTmhheng2QnJtTHE5?=
 =?utf-8?B?UzVueVJoYXFUemlpZkltVWx0dlRia3J3TFowaGluY0JyQlVzcVZBS25Wa1VX?=
 =?utf-8?B?VTdWTDNVOEZob0xDVjRrR0hleW1NR0gyQThNd0tJSDV4MFZ6NitleXI2NVlD?=
 =?utf-8?B?azFySU5tV2l6eE9xUFJoTHp3K2dVWDRJNlFnTWFvQktPUkFPYldyWkEweXNn?=
 =?utf-8?B?ZFBVYTJHWWRFbkdwVTRZejNOcW1URytJUXI1RXlzaE1TYzMrV1lhNnQwM3Bl?=
 =?utf-8?B?UEVpQ3lHdG0yNWlaeGZnRWZReEpvKzIzK28rcTRrM1JGdDdnQjJOVkRYMWZm?=
 =?utf-8?B?KzdHMDdpN0ovZUt3REthMGNxWVA2ZE5ON2NCSjJ1cGFhVUg5cDlKQk5oRFRH?=
 =?utf-8?B?UkdlSmdNTmRTUitNNk5aUlFwcG93dmhJZmtDbkxUS3pGZ3ZrMUh5NHFrRkNS?=
 =?utf-8?B?Kzg3ZWtIRjFzTEkwR1pzWkJJcU1XWEgvc1Bxc2l1eGsvR2EzOVhRRmFldURu?=
 =?utf-8?B?bTdnOEZRZkR5Zi80TGdxMjlCZ2xCWUN6SHUycVEvZmtjbk1VZkp0LzAyanoy?=
 =?utf-8?B?MFMveDNQNEFOYVZNUVFwVjZ2a25EckYwOEtzRkRITm1pNG9rL3paTHhsZHhq?=
 =?utf-8?B?cDZQNjZ1cFZYMjVuQStCRW1jd2h1K0w1c2c3bTJKcGc2cEl2NVhWMjlTNTRW?=
 =?utf-8?B?bnRRRmZZNWNvSGtqZVNkYk5uSHNlWlhXZ1pmU2dEWUgwWWZqeE1oVUFyWE5y?=
 =?utf-8?B?akNEOVV2M2ZZaVVRUEYrY055V0J0emlPb3BjZURwaUhPMDVMS1Y5Mm54NWs0?=
 =?utf-8?B?b1lyR21YalhUTmczdEhRaVl5SHkyL3J6S3hyM0c0aHpzS25NYzU1RDBHMzlX?=
 =?utf-8?B?YkJpd3JtVEdhS3VWdTV0R0Izd3JsbXVWeHBIcGpzVWdiOW1sZlpLSU5VejZy?=
 =?utf-8?B?U1ZZMTlXNTAvWlJEUEl0cTZkSG4yaUdFa0VBeVBOVldKOGhuZ1Brcjd5a0Rw?=
 =?utf-8?Q?FsMfJgq9AH0F6K/WuJNFNYSXWxLdsyz9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0cydktpVHliWG1aUWtJenZ2ZjllT0gydllyN25tREF1SFNLZFRiVmR6UHIy?=
 =?utf-8?B?cnAzZi9qNmNCSkxIK2MwdktaU2NRYmQ5TXNXNExxdHQxS1l1U1lxbHlJMXBx?=
 =?utf-8?B?SDFOSDFheVU0ajBzWnNERGE5T2g1R1BvTURKQWZsVU8yTktYK2dmbW1xbkZn?=
 =?utf-8?B?OVV4akZ1Qm1MQXF2SGNiZ3VBNEVrVkt6YjJjeklXUkExWkZpSEpaNjVoYkth?=
 =?utf-8?B?T1I3bGtjeGJQc0E1TVJxSnBYdGJGRXFaQkw5dGh1QUFVdnZ2L1VZVHlxWFF3?=
 =?utf-8?B?UXpFTG1rcGVPSzgvU1ZhTjd3eEh4S2I0cWdQZGJOZzdPQS9sWWY0OXA1UDRh?=
 =?utf-8?B?UFNKK0h5S2VwWnl0ZEthaUlKeDl0TDhZZlhyak1KckhrWUtsUm5WeHdmUVpY?=
 =?utf-8?B?WXJZd2ZWdEZDRVNzUnl6Z2pXaStJVTRYc1JHZU5SaFpwbHdqdVB3M2hma1ZP?=
 =?utf-8?B?UW1RWVptWmxxQ0ZYRCtaT0VSY0dYUDVRVzZPMUVNWWZTczV0NmMvQ3FmamVO?=
 =?utf-8?B?MUR1cW1LNEhDMEFlUW04bi9xSmlLdnpFdkE4MmRZcXlTK2Q5UXJtU1Q3eVh0?=
 =?utf-8?B?YWNvUGtyT2o2VmtDZ2MxV0dqbEVic0Y1YnVtV1BERlBhYmo4L3ltdldybUho?=
 =?utf-8?B?blN0M1NFK0grWmdZWG1xMkZWR2t5Q0VjOXpHUzcwS2JJcXZoRnhsaTBrdUp1?=
 =?utf-8?B?MjhFWURSdDAyNmNyNEZPSDk3Mk4vOGFJdmhPODE1M2dLS09CL0lPOWo2SVlW?=
 =?utf-8?B?bkJ5RjZIaGRPc2Z3c2JHQXk3YkxYazJUUkdLQzFsMUpjYkNZcDE5dFpOc2hZ?=
 =?utf-8?B?bE1CVmtiWUxMd1NpNW5MWjQrTDR4MVFuOXlJY05aSmhnRDh2K2lxN29zMUJq?=
 =?utf-8?B?RjJIMmJXQ3crZmR3ZFZQMm05bTc3UzVDQ1FzUm1rdmFoWDBqOUJLN255NDcr?=
 =?utf-8?B?anJycUNkb2ZDeTEwaXJjM3FVSWlYbUxDZ2dHRVcrOGljRnV2U2tBMW1yNk5z?=
 =?utf-8?B?RlZuUWgyRkpkU2UzRDhtb2V5VWhNQi9RUzVIWVlwS0ZXOEx2aVBYN01zL1Rx?=
 =?utf-8?B?OU1JZlhiODk5Q04vTEswWitxc1piS0R0VGJvMkdBYmlRUk5GMjlkQjN6N1o0?=
 =?utf-8?B?ZG9WK3RJNDMvRlpvRkMrc3NGMW5BMnJ4cGlnTkJvUTc0NHBUU0pBTlZISmc1?=
 =?utf-8?B?UGE3eVhHM2c3bXA0SnlBdUZhMGZKMlE0aTQ5c2RnbTlhWTBZdHo2akRxV2Jl?=
 =?utf-8?B?SXczMU1hd0VJQnhJME5CcHY5Y2gxT3ptdzBCakdoMlJ6cDl5WGFaMngxSEtG?=
 =?utf-8?B?M2xhUWtYYjFpZjVTQ0p2UUxXUWdwLzVGYmdveStoUjY1RUxMYSt2NlllbUJw?=
 =?utf-8?B?U29vb0srR0c1amVMd0tMbGJWMldrVXlVUUEwazZlRCtCWHVEc3ovNmNkbisy?=
 =?utf-8?B?MGRvVGU4UkNlVmcreHc3YnJmR1A2VFo4SEdrV3N6RWdIWEQwZlhvMllBekdo?=
 =?utf-8?B?M2pkQVpJakNjT1lreGdZVlJVaEJwSjVuWHJrM242ZXJQbFI3VkUrR3FhQUZm?=
 =?utf-8?B?WnZ2OHpxUUdnUVRuY0VjTlc5ZU5lcWM1VnV0MUVWWjVXaFNpUVdyZWl0SGpI?=
 =?utf-8?B?NWlWSTdad0txclE4QU1BcXpkZ1ZKck5GUlNtQk1IY2xMUEdTUkE0YWQ2T2Y1?=
 =?utf-8?B?TC9pM2oySS93SVlla2NnaGJ4U0QzVzdDZmZDVFVpNm5nN05QY1BONHk1b0VN?=
 =?utf-8?B?b1BWMDZrK2tDdUxrK0lNTW1NRTBhVHY1U1FXRnFDREx1bzRQN0kzbHVXenNO?=
 =?utf-8?B?ZTB1aTNwakFyNDZzQXRwWFBaeHdDKyt1aWZwdExWeG5uRjFsU0Q5U0dUcE1T?=
 =?utf-8?B?LzRRZnlPZnR0NStrdDIyKzlObHE4cHJOUFBFYXFYU3lYWDFhUHp3cGdzNm9k?=
 =?utf-8?B?UE8vVCtKZUFZeEhGOWJYNGRvUnovQ0hiTmFhTXVPcmFydkJFVWk2VExyRUMw?=
 =?utf-8?B?WVVyd2p4TWh6aEJRUmRGS3Rta1lqby9MVEE5dzBmY1E5c2loS2xDd0VuN0k2?=
 =?utf-8?B?My9FeWcyOGJIbC9VZzhiYW5tUkQwSzA1dS9WSnJmNzBieThGQk5iS0U3NlpO?=
 =?utf-8?B?dFZ4MjgwT0xTWDdSRFBkRkFkR0VEQ01OSDVBc1RxN01YalpyK2hqcW1zVE1a?=
 =?utf-8?Q?z27HVwKBlwfOisG5GsxtuO8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2F89725E25BE44ABB4B0AA59726ADAE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a24a86-23e2-43f8-1153-08de23a85a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 18:05:11.2965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9PBeGJba0N5I+07mWqAVlbvHgwyTj/Y3FsxRDiUvGHQ71tKoUG907kH7wTdtu0bOaCPPzcxQiSKsR1szqb/4c4I9kGSOk5YAFQIidhTAgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8556

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDI1LTExLTE0IGF0IDE4OjQ1ICswMTAwLCBBbGV4YW5k
ZXIgU3ZlcmRsaW4gd3JvdGU6DQo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiA+IA0KPiA+IEl0J3MgcG9zc2libGUgdG8gZ2V0
IGEgc2Vjb25kIGJpbmQgZXZlbnQgZnJvbSB1ZGV2ZCAoZm9yIGluc3RhbmNlOg0KPiA+IG1hbnVh
bGx5IHRyaWdnZXJlZCB3aXRoIGB1ZGV2YWRtIHRyaWdnZXIgLWMgYmluZGApIG9uIHRoZSBzYW1l
IEdQSU8NCj4gPiBjaGlwIHNvIGl0IGFscmVhZHkgZXhpc3RpbmcgaW4gdGhlIGhhc2htYXAgbWF5
IGFjdHVhbGx5IGhhcHBlbiB1bmxpa2UNCj4gPiB3aGF0IHRoZSBjb21tZW50IGluIGRhZW1vbi5j
IHN0YXRlcy4gV2UgbXVzdCBub3QgdHJ5IHRvIGV4cG9ydCB0aGUgc2FtZQ0KPiA+IGNoaXAgdHdp
Y2UgYXMgaXQgd2lsbCBjcmFzaCB0aGUgZ3Bpby1tYW5hZ2VyIG9uIHRoZSBzdWJzZXF1ZW50DQo+
ID4gYXNzZXJ0aW9uLg0KPiANCj4gSSdtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBp
bml0aWFsIHJhY2UsIHdoaWNoIG1hZGUgbWUgdG8gcmVwb3J0IHRoZQ0KPiBpc3N1ZSwgYW5kIEkg
bm93IHRoaW5rIHRoYXQgdGhlIHBhdGNoIG1heWJlIGRvZXNuJ3QgdGFja2xlIHRoZSByb290IGNh
dXNlLg0KPiANCj4gSW5pdGlhbGx5IEkgc3VzcGVjdGVkIHRoYXQgdGhlcmUgaXMgYSByYWNlIG9m
IGdwaW9kYnVzX2RhZW1vbl9wcm9jZXNzX2NoaXBfZGV2KCkNCj4gYWdhaW5zdCBncGlvZGJ1c19k
YWVtb25fb25fdWV2ZW50KCkgYmVjYXVzZSBJIHRob3VnaHQgdGhlIGdwaW8tbWFuYWdlciBjcmFz
aA0KPiBiZWNhdXNlIG9mIHRoZSBzYW1lIGFzc2VydCgpIGluIGl0cyBzdGFydHVwOg0KPiANCj4g
Z3Bpby1tYW5hZ2VyWzU4OF06IGluaXRpYWxpemluZyBncGlvLW1hbmFnZXINCj4gZ3Bpby1tYW5h
Z2VyWzU4OF06IGdwaW8tbWFuYWdlciBzdGFydGVkDQo+IHN5c3RlbWRbMV06IFN0YXJ0ZWQgQ2Vu
dHJhbGl6ZWQgR1BJTyBtYW5hZ2VyIGRhZW1vbi4NCj4gZ3Bpby1tYW5hZ2VyWzU4OF06IC91c3Iv
c3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9naW8vZ2RidXNvYmplY3RtYW5hZ2Vyc2VydmVyLmM6
MTEyODogRXJyb3IgcmVnaXN0ZXJpbmcgbWFuYWdlciBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9j
aGlwNTogQW4gb2JqZWN0IGlzIGFscmVhZHkgZXhwb3J0ZWQgZm9yIHRoZSBpbnRlcmZhY2UNCj4g
b3JnLmZyZWVkZXNrdG9wLkRCdXMuT2JqZWN0TWFuYWdlciBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dw
aW9jaGlwNQ0KPiBncGlvLW1hbmFnZXJbNTg4XTogL3Vzci9zcmMvZGVidWcvZ2xpYi0yLjAvMi43
OC42L2dpby9nZGJ1c29iamVjdG1hbmFnZXJzZXJ2ZXIuYzoxMTQ4OiBFcnJvciByZWdpc3Rlcmlu
ZyBvYmplY3QgYXQgL2lvL2dwaW9kMS9jaGlwcy9ncGlvY2hpcDUvbGluZTAgd2l0aCBpbnRlcmZh
Y2UgaW8uZ3Bpb2QxLkxpbmU6IEFuIG9iamVjdCBpcyBhbHJlYWR5DQo+IGV4cG9ydGVkIGZvciB0
aGUgaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1
L2xpbmUwDQo+IGdwaW8tbWFuYWdlcls1ODhdOiAvdXNyL3NyYy9kZWJ1Zy9nbGliLTIuMC8yLjc4
LjYvZ2lvL2dkYnVzb2JqZWN0bWFuYWdlcnNlcnZlci5jOjM2MDogRXJyb3IgcmVnaXN0ZXJpbmcg
b2JqZWN0IGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1L2xpbmUxIHdpdGggaW50ZXJmYWNl
IGlvLmdwaW9kMS5MaW5lOiBBbiBvYmplY3QgaXMgYWxyZWFkeQ0KPiBleHBvcnRlZCBmb3IgdGhl
IGludGVyZmFjZSBpby5ncGlvZDEuTGluZSBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9s
aW5lMQ0KPiBncGlvLW1hbmFnZXJbNTg4XTogL3Vzci9zcmMvZGVidWcvZ2xpYi0yLjAvMi43OC42
L2dpby9nZGJ1c29iamVjdG1hbmFnZXJzZXJ2ZXIuYzozNjA6IEVycm9yIHJlZ2lzdGVyaW5nIG9i
amVjdCBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5lMiB3aXRoIGludGVyZmFjZSBp
by5ncGlvZDEuTGluZTogQW4gb2JqZWN0IGlzIGFscmVhZHkNCj4gZXhwb3J0ZWQgZm9yIHRoZSBp
bnRlcmZhY2UgaW8uZ3Bpb2QxLkxpbmUgYXQgL2lvL2dwaW9kMS9jaGlwcy9ncGlvY2hpcDUvbGlu
ZTINCj4gZ3Bpby1tYW5hZ2VyWzU4OF06IC91c3Ivc3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9n
aW8vZ2RidXNvYmplY3RtYW5hZ2Vyc2VydmVyLmM6MzYwOiBFcnJvciByZWdpc3RlcmluZyBvYmpl
Y3QgYXQgL2lvL2dwaW9kMS9jaGlwcy9ncGlvY2hpcDUvbGluZTMgd2l0aCBpbnRlcmZhY2UgaW8u
Z3Bpb2QxLkxpbmU6IEFuIG9iamVjdCBpcyBhbHJlYWR5DQo+IGV4cG9ydGVkIGZvciB0aGUgaW50
ZXJmYWNlIGlvLmdwaW9kMS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1L2xpbmUz
DQo+IGdwaW8tbWFuYWdlcls1ODhdOiBnX3ZhcmlhbnRfaXNfb2JqZWN0X3BhdGg6IGFzc2VydGlv
biAnc3RyaW5nICE9IE5VTEwnIGZhaWxlZA0KPiBncGlvLW1hbmFnZXJbNTg4XTogZ19kYnVzX29i
amVjdF9tYW5hZ2VyX3NlcnZlcl91bmV4cG9ydF91bmxvY2tlZDogYXNzZXJ0aW9uICdnX3Zhcmlh
bnRfaXNfb2JqZWN0X3BhdGggKG9iamVjdF9wYXRoKScgZmFpbGVkDQo+IGdwaW8tbWFuYWdlcls1
ODhdOiAqKg0KPiBncGlvLW1hbmFnZXJbNTg4XTogZ3Bpby1tYW5hZ2VyOkVSUk9SOi91c3Ivc3Jj
L2RlYnVnL2xpYmdwaW9kLzIuMi4xL2RidXMvbWFuYWdlci9kYWVtb24uYzo3NDQ6Z3Bpb2RidXNf
ZGFlbW9uX2V4cG9ydF9jaGlwOiBhc3NlcnRpb24gZmFpbGVkOiAocmV0KQ0KPiBncGlvLW1hbmFn
ZXJbNTg4XTogQmFpbCBvdXQhIGdwaW8tbWFuYWdlcjpFUlJPUjovdXNyL3NyYy9kZWJ1Zy9saWJn
cGlvZC8yLjIuMS9kYnVzL21hbmFnZXIvZGFlbW9uLmM6NzQ0OmdwaW9kYnVzX2RhZW1vbl9leHBv
cnRfY2hpcDogYXNzZXJ0aW9uIGZhaWxlZDogKHJldCkNCj4gc3lzdGVtZFsxXTogZ3Bpby1tYW5h
Z2VyLnNlcnZpY2U6IE1haW4gcHJvY2VzcyBleGl0ZWQsIGNvZGU9ZHVtcGVkLCBzdGF0dXM9Ni9B
QlJUDQo+IHN5c3RlbWRbMV06IGdwaW8tbWFuYWdlci5zZXJ2aWNlOiBGYWlsZWQgd2l0aCByZXN1
bHQgJ2NvcmUtZHVtcCcuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCBJIHN0aWxsIHRvIGNvbWUgdXAg
d2l0aCBhIHdheSB0byByZXByb2R1Y2UgaXQsIGl0J3Mgc3RpbGwgbm90IGNsZWFyDQo+IHRvIG1l
LCBiYXNlZCBvbiB0aGUgbG9ncyBJIGhhdmUsIHdoYXQgaW5mbHVlbmNlcyBpdC4uLg0KPiAoQWJv
dmUgaXMgcmVhbGx5IGEgZmlyc3Qgc3RhcnR1cCBvZiB0aGUgZ3Bpby1tYW5hZ2VyLCBub3QgYSBy
ZXN0YXJ0KQ0KDQpsb29rcyBsaWtlIEQtQnVzIHJlbGF0ZWQgZnVuY3Rpb25zLCBsaWtlIGdfZGJ1
c19vYmplY3RfbWFuYWdlcl9zZXJ2ZXJfZXhwb3J0KCkgbWF5IGNhbGwNCmdfbWFpbl9jb250ZXh0
X2l0ZXJhdGlvbigpIHdoaWNoIG1heSBpbiB0dXJuIHByb2Nlc3MgdWV2ZW50cyBhbmQgY2FsbA0K
Z3Bpb2RidXNfZGFlbW9uX29uX3VldmVudCgpLi4uDQoNCkknbGwgdHJ5IHRvIHByb3ZlIGl0IHdp
dGggc29tZSBjb2RlIGluc3RydW1lbnRhdGlvbi4uLg0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxp
bg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

