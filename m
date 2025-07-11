Return-Path: <linux-gpio+bounces-23160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE4B01C2A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100D4763360
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8372BE620;
	Fri, 11 Jul 2025 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VggWe66g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012018.outbound.protection.outlook.com [52.101.71.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBD3C26;
	Fri, 11 Jul 2025 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237560; cv=fail; b=BUI5V17Pf4HYqpugeUN9DC9wO/NxHiubR3KlVBHPXqlPQ96Ixos1lUrq4ARB96KSqeLI/VH+ddTCfjdjDbdRA/qpr7yrbzrNQ8RupCz7l3uOdGLykAg0f4YMRJPzK2zsQXl+WajicK4Dc/UZniF2WtDEq+3DVsEP1EE6QW0SdhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237560; c=relaxed/simple;
	bh=/OG8EeO6OQ6ezwdBZr70nCdlVMsJDCt3g/3PRWbGPSo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SQcZtXYLDqe4Q3mZYWYXwED5of7MVa5h7iuLtW8CubW6XqudP3cG+VBjWidnd8h9+aT9lgcb8wQ35IqWhLTqa9eW8ZV425JC1/jG07f0OBE84mJmdLEdWH833sGt4SkStEl3CSGfX+VQtvkYvlLORwJjE/MZUujieL6pMmu/wd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VggWe66g; arc=fail smtp.client-ip=52.101.71.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQRzTpxLR0s4sMpPEBjSoOA4/eNwfDO8tmln2c1tZJgHT+NspUadrUN6kmLygdp/7loVxpmayYYFRngHb9sXsI8Cj9Xbrq6aPnfGw8C8AquCb3rYGvvq8If8TFOS0tokCLGRScQfiAGubti2/rARQD/BgpzoLglA+LEjkxRzCt4p6CzZ54xhf5B8F/4VtUwoCA9PdRZgi6L36DQHdNBf51OOXjl2sFmk2WJYj2ZYP5yZQ5FIuI0P1TLSNMsewgfKA7qv2i9aLPYtvmJlUo7dXyaKxi5XCHDht6OdJMHVHPkgzyK20TPTKO+65j6CSGE3fXH06EJYE1Re/5skeMOtug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/VY0s0yhwlT9oMeuDzV+68cyDaBQt9zCCad7+GWn0k=;
 b=orZf7/87+gIdpguhJnM9pItkBmSLluJY4afHQoTh0mFcLBAoM3cVfzD9CjgwQFx7wfOld/A+nT/6BZGIzHq7aY1U4mTR3gPffzNxVBSZi+dLlTrSmjCYQ9PEXQYo7jtbJCAOlHXbU0s3WAXTtCCLEGC2iUfmyOsu40F1yjhf/y5z4tFfmwXvC+Z3nVQKSH8i6z4h7kWvD8TR4c+SXqe376my+OFfR6AkM3gadkBDX0PhJRtWxys/Y2kfai2dXmtvM6LvlAj3/sjOosa39AsKPPE0GN+4D0RKENqHodH6vOyaBsD9gwtTqymgN9nYjKX5gV/3forY62S/yDsMzVG5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/VY0s0yhwlT9oMeuDzV+68cyDaBQt9zCCad7+GWn0k=;
 b=VggWe66gSqNgomOnKjjMFIa/Kwi2xaadijQYBICMQWKWDH5KcnS5Jfkmzft8w9yU8M86SzchUlxK9xO8wr0i/nROmiOd+/ouK2DqTXrfaPq7UusytwJ9wNkfyT035igJcDyAQ2LMdB1PUpu5m5pSEzBZwa0U1vA+Zec8aBxJgwpiYTlUhXjoHEKwNpIilnpWA8GijEI+vs8fz9QWiOauR464hr4FKJIApvAD5zjJL/BvN+Op9bfh9uLuhm1xI5r0SjxwYbuelBMrUnfoHhsb6sdyvCRyR2QVDcFv3TDsDRGs1pdmO3/9syRjjjOLEnJ36u8zvawgA26n/N3nTF2WuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB7896.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 12:39:15 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 12:39:15 +0000
Message-ID: <fa24772b-0038-4f51-87c6-15b810d8d454@oss.nxp.com>
Date: Fri, 11 Jul 2025 15:39:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, aisheng.dong@nxp.com,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, echanude@redhat.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
 <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::9) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d52441-4d3a-443a-8a22-08ddc077f20a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0tVZWJoMTBIN1NLMFZVUWxDQjZJQWR6UXE1cW95N3NlSHAwak44c1I0NU4w?=
 =?utf-8?B?RzNQMUs0d0tVWmhRYjVVTnQ5RnZBeXA3Y3RMVjhSMHVuV3lEbDJmZlhRY2V0?=
 =?utf-8?B?VWEvSFF5TVNIZy9BWE15S0pIamNvOHBnTUdYMU0rMzBHMXlVMmdwQUs0NkRH?=
 =?utf-8?B?R2c0OTdpaUdyK3M2czFCUm9YYjZxUWE3MkNoVXBHcWZkcjNncHVIMXJoeVZ6?=
 =?utf-8?B?RlBYTFVlTHV3Q0w5V0h5VEdSWTV3QVQ3QWVQSHcrS0hKQTducDFuMGIrTUJ0?=
 =?utf-8?B?N2VLQ3lzM3dOVEp1Z21wSGI1OTVMNHdWVmZieFFoSUJXNzVIQWxGT0h2R3cx?=
 =?utf-8?B?SFBlOUtXeHFkcnBqRWxFazZQUlBVYXczMzRSVVhKU1JvbnlkVGdGOG53M0pw?=
 =?utf-8?B?aml1ckdDcjVCWEdGMG1OcmhEWWdKang5TDY4cmxnZHNyckJVYkF2aXJzTTZO?=
 =?utf-8?B?dnN1Z1VIVDgvU3R1VzZCUXdiak9VVmdSSzlaT3ZxQ0ZtOGUzSjVJdWIrRWxW?=
 =?utf-8?B?QWRRQ0F6YjJULzBQNFFEKzJBRXpSUTNBVUxnWlJOMVlnaXQrTy9tWE1GTFlQ?=
 =?utf-8?B?Q0Z4bUNINUw2MmxSS2N0K1liUk9haThJOUluZlNHVVBjMlFUK1FRakdlbXpq?=
 =?utf-8?B?ZEZ1TGpiNFgxdFZ5aDNkRkZtdU9zb0dSZE5jT2FyS0ZrajZpMjZac01VUUU1?=
 =?utf-8?B?OTNTZkM0V3FQeStnNzJxKzQrY1RlazRxVDl3aGY0WlQybm5sSlRmOFVzRXlK?=
 =?utf-8?B?d0tkNkpVaGVpYTI4MWw5N2NTdkVSWmFaU2dvN01tRkdEN3hmS0NyQXgxQ0k5?=
 =?utf-8?B?cmUzWnAzQ2pjS2hCaEFwS0VMd3NYRCtvNUFjNi9hV29WK1pQbWJoR1pYQlFP?=
 =?utf-8?B?OHVQcEZrTEJjcEQ2cmN6WlNKMlZZS1IvaGU5NDBxN01wTWFidng2VnJlVURK?=
 =?utf-8?B?b1FxQ3dxOUpiekVON2ovbzdvSHVTNE9YNU03eTF3RE1MTDJ6RXpmdlBlV09h?=
 =?utf-8?B?dUdQMDVlQUJ1Z1lnNkxMcjI4WGdkWVRxN2JIQzJzdS9pS1NIbmlXYUJXRC9O?=
 =?utf-8?B?L2prRUp6bTd5ZGlGa1BWTTkwMm1SQy93SHV0SFExMTNVaklBa0c5ZlhUN3pH?=
 =?utf-8?B?UTdXQk5uMHVqN0xXd01KTDd6ZE5XdUFYM2FQa2doM0E5U2szQ2M0Z0pJU0RF?=
 =?utf-8?B?VnVhNmVHUVJsblRFbi9CU1dPd0tUR3FUTWdTVmd5MnNNd2h3REZGaHVnOW4w?=
 =?utf-8?B?VjFvWnBDcHhHS2xRZS9mL3hZRHU2cVZXd2FzYkNzUTN0UXJqY2JTSkJiTnFE?=
 =?utf-8?B?REdZbWswN3ZSRHpUYnp2dFZaY2M5Q2IvcUUvYnJ6RGk0ci92UUVzVnoydG1j?=
 =?utf-8?B?NERlbld3c0hxdGNtakx0ZFVic3graGp6ZW1wOXJIK0pWdFppNGRmZTRkN3dO?=
 =?utf-8?B?bzNIN3B6T2Z4OSs3d2lUbndsczZrMjZMQ25lUm5tZDM3VGlObXgySjJIdGFo?=
 =?utf-8?B?VUxKMHhwSmFFWElTK3kwd0t1ZEZvZ0d5TU9wMmUxdWh1RHFhZTBmNGZ3Qlpi?=
 =?utf-8?B?YmM3YmN4Qy8rU1RNN29YQ1JvM2ZmSUh5T2pEZzZkWjRLbUR1akZ1cTgvdW5y?=
 =?utf-8?B?WXlQUzdsbkJ2Qnpad3BEOVQzRVlTbytHeG54OEFkbUtkeWRqK05lUkxUSVdn?=
 =?utf-8?B?a3RXbVg1TGY1Q3hIODJqaGlFVTBpcTJBcXhPQ3ZObTZadXE0eWNhR2FqM1hz?=
 =?utf-8?B?VDlnVFBza053Tlg3SUxjZnROV29wSjlVUWgzRTN5ZjdGY0NlWTUxZmpZV0pG?=
 =?utf-8?B?cVlXRlR6bFpZNVpZWjQ3RUo0Tm9aZFp2M2VobTVKOFRrT0tzWmVNdGhzbFdW?=
 =?utf-8?B?bDZFbWVabU9ITFg3RXd6ZkFkSWxYblpIN2NyMkM1ODZINXNiL2E4U1kzeW9K?=
 =?utf-8?B?Z3liSWlFTnhrMjJDNVUyZnYzRUhnYmtGalV0a0pQUmROSEsvdHBieHdqcGpL?=
 =?utf-8?B?WkxlSkZaN2l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdSNHlZQWZHWno3bVMxNXhCSWQxYWhTbURRdTllMHVtOVZrckdBbGNmNlBP?=
 =?utf-8?B?b28wRHpkQ3I0NTlzWXVGc3Jmd0NQdUR1UVpWZnI3TytvYUFTMlNtcWIvTDU5?=
 =?utf-8?B?RGh4YjdzM3JCa3Fnc3JaNlpZVE5IZDl3YVhmK0t2dVVGcmVlcWNlcnE3djZu?=
 =?utf-8?B?KzQ5Q1hoN05LeTM4cWxXcjBjYWNTYW9LaHRyREsvamRxSlNiSWpJZk16dVVR?=
 =?utf-8?B?d0swOGNURmVuVFNXOXYwWHl4NStqQ2c2NDVjTVc5d2syUlQ3RzM3MkIrNzVB?=
 =?utf-8?B?Q2c3WnFoT2RNaGh2TVpwOTNXTWdGZmJGeFhxUWxwMlNLcXBVN1NJRTVMZmt6?=
 =?utf-8?B?ay9qcHlHTVA2OWtuZzh3bEllQjJZcG52UkRZUUp2dGRoNmJWemtTeTM1MUVw?=
 =?utf-8?B?cWJZKzUxSnI5U1BVRktyaUJnS00vaDZEeVJEUmovZk5tRVJYdWZiQVJrZVZW?=
 =?utf-8?B?b3BpeUtjdE1BRmNkd2ZVOEozSWxDM1VjYzFrZkRQb3ZVMm9kYXg5QWhlWVJw?=
 =?utf-8?B?LysxZm5FeGhLRnRGS2hPMUNYTFErOU43MkdWZnRVQm5qZHh3eC8wZm80QWp6?=
 =?utf-8?B?eEtTRUNNOXE4emg0c3BxQW1ZblBndXpFSDMwUzdIYUtWMVhWSjhHYTFuZEt4?=
 =?utf-8?B?TG9kRVVob1VNVDRIWmliS1FxbmpiWW9KVm91eDI3T0N6TEpOSHVtQ3BlSFcy?=
 =?utf-8?B?cGdDK3BkVzhBclVRdTBCK0dNQ1lqNGYvUWZJNFBHU05ENmtIT2h4eForTFRr?=
 =?utf-8?B?aUc5cXhqZG03UU5sRlNzV2txQ2ZnR3pSd3NCM3g3TFZqSVIwYXlaVFBvQy9s?=
 =?utf-8?B?V0xFOTFjTks0dFFsVHZUTGlZVHVZb2tNcDhwNE5qdjlNeHcxYWc0UC9Xem5D?=
 =?utf-8?B?SUozczNQRUU2bEczdGI0ZlViT05xclN4TllEbHhjSEFvNVhJZkRWWDB4eHJ4?=
 =?utf-8?B?RVZURTQyMHVSSURack5lZE85VXhBRW42dmxVS0FJRzgzWkx1YW1laVRTYnFJ?=
 =?utf-8?B?WU1VajVCeStIOU4yelNNcGZkTW5mME5BT1hnRzRhY0tnd2N4UjEyOGJYR3lt?=
 =?utf-8?B?YTU3YmFMNnM2QjltdnR0RUdMOUxPdzhKa3FmeGpWcWtjTWhQaDNkUHc5M0VH?=
 =?utf-8?B?NWZDSmNjT292b2ZtZWNOS2dnMVc1ZmZCOXhUSjZmbmxjTkFVRkVjZnVGSDdy?=
 =?utf-8?B?SDVIbmNaYVNIZDA0RUhtaTlIR2Nrd1RXdTRDcDVIdExwUlVyV1FWcXY5dmVj?=
 =?utf-8?B?NWNUZSsvS2JoLzg4NHJjb2JqSk1yMVdqT1BsWm1iVDNiYTNHU2ZYSW5iVVZt?=
 =?utf-8?B?UEFZQVltZWxEK040K1N3VE9tVFdJd21kWWdRK2gxRjVSWWhZMFo3V2UyclNS?=
 =?utf-8?B?ZGRYamlxb1Q1SGZqMnR5SGVheWNBMjEwL0tyQ21uaHZEUXM3YXJQMjdsUG5o?=
 =?utf-8?B?TmpWYzB1TW4zcTB5Y1lsM2NCYVp1OFRvNGFqQjR6VkZXY25iN00vM2dsQlBV?=
 =?utf-8?B?SWRBWUcwTTBJR0dwNDJHMmtaOTNJMmFiVXp6YVE5RzN2dWV4LzFhRXJ0MlNj?=
 =?utf-8?B?TTdkYU9tczY3N2dVMkwrdTY0VmxjM01TLzBtTzJZTTZEcWtYa3VjOW8yZ0Nh?=
 =?utf-8?B?eXJJdlRvdEpSWFZEcCtyRmFZdy8wd0dFZXNxaEpRMUF1WDFPYndOeG9EMkpY?=
 =?utf-8?B?SVBKSm1LUXJEUmZxc1NFWS8xV3lra3N2Lzh5a3VMNTJlZEtsN3puWEZFa1d6?=
 =?utf-8?B?bTVrelpkS0FxZittKys4M0UyUXZUdDFjak5mQzJXbEFjbEM3eHpHd2licmMz?=
 =?utf-8?B?QXdCNG1tdThBa3BkUFBIaEFmUzYzZm9jV0MrMnBENEd2TkxQek4yNnNaQ0Ez?=
 =?utf-8?B?enB4Yis0MUxUcmpBQlkvQzdKWTRQc2t0Vlkrc2k1QjNXdXRpN0xrZnVBNGt2?=
 =?utf-8?B?bDVOd3FMOHBJMlRyMlZBQ1FHSUw1ZTdaSThwUGxtRk8wUXNtd3lsbGVJb0NK?=
 =?utf-8?B?NUphbGU4aW5ZNGR3MDc1T2FqT0poalBkZWZnMGNFdEhkQ1hlTEc3L2ZYODRq?=
 =?utf-8?B?aS9LQkh0aFdTVmJJVHg2Y1plQ1V1a0ZpTERsbTJFS0JQakpVRTlaWHhmS1dk?=
 =?utf-8?B?K1NzWUFsQ09sLytzRkI4bm1lVUFwb0Jvejc4aU5YM0VOZ1pLZXpzcFpTTGx6?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d52441-4d3a-443a-8a22-08ddc077f20a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:39:15.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK5i21Bzue/7PWOpIaB5hpsNm6IR3EWgvGNVpDnty6uMgV70TVA8UPpdPc9M5vm/PJq1IWVwCg9t3MTSHhSwNhR/KVpX4MQgSqiyLI9cE0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7896

Hi Arnd,

>> The SIUL2 hardware module has registers which expose information about
>> the given SoC (version, SRAM size, presence of some hw modules).
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> This does not look like an nvmem at all, it appears that you
> are creating an alternative to the soc_device infrastructure
> based on a binary interface tunneled through the nvmem subsystem.
> 
> Why not just make this a soc_device and have drivers use
> soc_device_match() if they need to know what chip they are
> running on?

Thank you for the review! I've just taken a look over soc_device
and I agree, this driver should be a soc_device. I will convert
it in the next revision.

Best regards,
Andrei

