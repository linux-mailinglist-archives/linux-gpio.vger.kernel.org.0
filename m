Return-Path: <linux-gpio+bounces-13316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3E9DA606
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 11:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81124164427
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 10:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBABD19884B;
	Wed, 27 Nov 2024 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="MVRTqieU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013058.outbound.protection.outlook.com [52.101.67.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70313145B0F;
	Wed, 27 Nov 2024 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704146; cv=fail; b=RuTJBv4YQemX+vgJK724uDhI77o3/8A/UVf7ks1E1mk1JZ70YU9kkhw29MlJ5h3IU2Y6SEG+DMS3331aWRXwPcg/gS+srNdWQj86IPN52KF4LXcmKBgMjZJC1gUh1df/PlNt1tY+dVIZMbVd1wUpfOZgctJsKZvEoOHvVqjUok0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704146; c=relaxed/simple;
	bh=JFdsogo+R2IsJ4+EGIN6okbKjH3rHUGk+iX/QRGsWQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uncjNvL0vai7wsnA4zkNHSV76KsmSxh/7LmEHxVJcmyGDf0NZgtQ3AUXi2Jyb9Xdmhwc+DipDxwaUoZtDzg96IPvC++Oe8a7VghAWmzahTC06OK39Qot3zmOJ83LM3F81wTNMJitvqxsPPUopMbqgYhB4/jbZuKVOcrzVY6VXxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=MVRTqieU; arc=fail smtp.client-ip=52.101.67.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlsFDP0/OZ2s2hjEUZ/t5G0RftQ8qrWg9BMTzxizaAy/ckyMvSxvpYUyr3xgqlw1dTKX8Edb5agjDgJbW5UnVvQ9YPQ86CCcRVgj9CkonMM7ujKE04iLz46Y19qlBVIZYUz5KAlH62CBy3Uea2MgCq6ns1NbIlNRfRSmH7ejfiJClBKGRY24NVfMX0WQuqBsXrlK9dlg2Q7i6w7m5U/MwkHHk1BNlBbKKOe8z/ztG/MKb0HTptYRvj8hCz5mGbT/I1nw/0hW4wzMeCA5z91E81GPdID1s42Zrk/q95EKmbZxCiOl+QIDI0aRUG3piSSyZNvWOF3M5aPER10/mmBTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFdsogo+R2IsJ4+EGIN6okbKjH3rHUGk+iX/QRGsWQA=;
 b=BxN+F9XlZAfTb6tHYMHSh53KHXcMXbrrkjLaAOmGR2znS0jlerInKSDt/3eRnUBb81yRctC1oQJ7Ty47kLdtzbK7mYhEhP5dXmFIYt/7QBkdcYj1T1xQzOsn5K/MoSGjsHTJovy4TXyzRjNmUVSjaRS8V1qaDnEDSjaPVOqT0KqRDL7CMbLfRXUu4vwxr+jovbp1Ou08SkKORqVs8aQ8EnPwQ68adYkqFXVdVkXWckhh4lqwVAkaDLhxbhS6fehcHL7kcgyJIceaWA1I8ABtrjqg9wtlZoQiuNsxqy97OEF98hbkL20uT5/mHbJi24TWgzPKhVB69VfKeZlT5e/dGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFdsogo+R2IsJ4+EGIN6okbKjH3rHUGk+iX/QRGsWQA=;
 b=MVRTqieUCVTgsNw3QcRI/9VV3B0jDa30W9uU4hVmfLlLenrXUSYuzL7v22k5WuqgJOpLc03v/4K/fGXa7xQjdwvucihlyLRBXL7k0QDOgfFwSuxpER2VmilSYJ45pWSCbbV1LKl4OrJJE7PSicLHc5iP9Pa+RsM7pj4vJNy18HCm9bxKvLUEKJqhBhCzq924fzQoAFjZjObiHGyxGedrQF16jI2VpSe4XO6uva5fTVNuuz4QXpCFJ8LngXo9Gt/YDpOw+Lq6AZmA0IJlYbmfdX2GvAEQ5LGg3e/3dAyScP+sF5RXh45JvIBjTO1DxTDpVRi4QTLP9XKsS0x0dmVTug==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:465::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Wed, 27 Nov
 2024 10:42:18 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 10:42:18 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"ssantosh@kernel.org" <ssantosh@kernel.org>, "khilman@kernel.org"
	<khilman@kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "grygorii.strashko@ti.com"
	<grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
Thread-Topic: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
Thread-Index: AQHbPxDOQhx+KS++tkuaGsavRuNpBLLKB+qAgAAGIgCAANtNAIAACpOA
Date: Wed, 27 Nov 2024 10:42:18 +0000
Message-ID: <603280913b6531163833303b8e98971ee5080a9d.camel@siemens.com>
References: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
	 <CAMRc=Md03oSc6jkib=g9B7C51i4aAD6LdXGHsmXuRxB7VjDxaA@mail.gmail.com>
	 <0f5f4cca8b7f69b4b9cd3c34abceb7846e4cc187.camel@siemens.com>
	 <CAMRc=Mc6D=isJCWzZekx8p9RYXG3Bmr39u15bThEeXbzKgAbEQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=Mc6D=isJCWzZekx8p9RYXG3Bmr39u15bThEeXbzKgAbEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB6876:EE_
x-ms-office365-filtering-correlation-id: e72746d6-5aa8-4e77-96fc-08dd0ed02aa8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkROWGdyei9ZZ2V1RENNNGx6amJzREJqemRPRXlyTUJBUmZKVmkxNXhubFAz?=
 =?utf-8?B?eTFZSjlUaEN1SDAwQjl3dGEydXNNOGNNV3VsR2t4anJ6YjFKVzVoTHRxODlt?=
 =?utf-8?B?Y2pyVy8xTGRFcVhrWnFrMzVWYVh0c1doalgybDVkTjY0UHNwTWhaVFhBSkZF?=
 =?utf-8?B?WDZObk9DeFZuQmU4d1VDdU45NUY1M2FpbU54STVIT2UzQ0F4R3VaRUFqazlu?=
 =?utf-8?B?NG1oMG5nUWxQckxpbXlGMHVsQ0R6dmdiOGxCcVZNMzczN1QwSmNmMWI0bEVS?=
 =?utf-8?B?TllVVkZPdVBEakZrelRYOE9EZnJQQTlqOUhZc3ZxTmw3Uy82ZnFIbFdsMEZy?=
 =?utf-8?B?bENWMUM2L1ZVelBUbjREaDRSR2ZoTC9EQ0ZrTjQ4MlJVTStqQkZwcVhyWnlv?=
 =?utf-8?B?cnRNWFhCUU02aEVxZnM3R2VkR3pnWm1BVktLRE1OdFhwMDh6dS9qV05oUlc5?=
 =?utf-8?B?ZzR6bFJYZWFSUFNyeEFnWXBkZEptSGpqRFhMSEdybUhKWG00bU0zV0F5OWxH?=
 =?utf-8?B?clFRY3lKMWRKL3RrYnNkRko0T2U1VU5oQ0FaQUtUSVMzNnZjN1gvUEJNdGkv?=
 =?utf-8?B?NzY3TFg5VW4xWk5nb2tJSkx1R1JEeWtaY1k2YWEyeEpNNnpjTU8rN3Y2S0M1?=
 =?utf-8?B?T2xkaEx2VkpuWTNEQ1F1N2IwcTRPUFBjUjNDTVRpOVE2RTJTOEt3TDhWWVJ2?=
 =?utf-8?B?VndRWlUreWlRZFMzSnZ3SFAzK3czTzBZMk5vNWJKeEJnSGFXa3B3dmtMQzVE?=
 =?utf-8?B?dzZ5UTRPMlVvd25xVUwzNXBlSS9ydmMwNkR0enhFVFZYUDB2N3BuT3BkWTJF?=
 =?utf-8?B?Z3VvQkl6bTRRU253NG5oam1kRURMb0txK3N6LzBiWnRBUzFTK3VXSkxQbkNi?=
 =?utf-8?B?WEl5aGZpWDRlU1l4aUM1WU8zVHJFQmhNRjFHZ3ZxdFFDMXdodE56azB1bzRY?=
 =?utf-8?B?Q0V0QUpOU1l0SGk3Y2U0NkN3WjNSbjdvdUZ4UVk5ZmUxclNnRVNGanh3eXda?=
 =?utf-8?B?SThBaVd5WW9oZHRDenA2THpQRU5TUlo2VVFaQVFrL3p3enhtVG5Xa1FrU0xM?=
 =?utf-8?B?enBIYlY5Z003bFJ6ejRsTHd2SWNqR05QRlY1My81blMrREpwdGNxL1kzOEFP?=
 =?utf-8?B?OXFJZjdCblBKVUhmNkIvQXVCSXZXMzFtUWYxTHFhNEszaEdPLzRKNlJiblNj?=
 =?utf-8?B?U1l3ODZNY3ZKTGJJV1BCeFQ5a0V0QjVMLzVRZVJTQjZhVDJWbllIMHZURzZU?=
 =?utf-8?B?bDVPYmtIaEJMMzAxVmpvS2ozRUtYekdOTkpCOVllRXhoUUF0clBiOEZwQUFq?=
 =?utf-8?B?Mk9GWDliRFU0TW0vWmhseG02STlxREM5QWZqK1BiRTQzOHB4RWZiaWphY1pa?=
 =?utf-8?B?UWl1ZEJGNURkRmw1bHJIdlMyY0NERk44eFllMmUyUTFKaUNoSDgrZm9UdUg3?=
 =?utf-8?B?cG5ZN2VPLzBDSzdjYS9ydHNTT0g4ZWhIb2xoK3lWOXJNRjNKcDJxOEo2dVRL?=
 =?utf-8?B?ZWZiWkVWVFZiT0kycXp0UUhaRVkvV2EzNzM0MFhubE1XRGFyRzUwNlk5RDZT?=
 =?utf-8?B?RGsxcjJLMnExZXJxQnBIaUN3akhxcGsyb2RVZS9rd0w3cFpVK2JmM2ZhNXIy?=
 =?utf-8?B?U09HTVphbExxdThzNVdGSnhvT1BqQXdobTZxNUJNTzRHeE5ic3l4M2t1UklW?=
 =?utf-8?B?WmI2Yk54OENoQURsWjg5dk5DRnBIbENPU2hoRCtGRDZRRDhGdnVCRE5HSVc2?=
 =?utf-8?B?U1hKQXVzMUNXZ0tUNVM5SUpLczE4TnBhdDhObU9IQWZXQmU4bXVNandjZGVD?=
 =?utf-8?Q?BlFBYyIwVKTzk3L7SRkywd0BqJdn8kadC5RMQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TktYWmthZklDN2NKOUZQMlFjVm5HQ1VXNFp2Mmc2emhWcklVeXdpaElVbk5r?=
 =?utf-8?B?Mk85eG1jWjEzMUsxNSt3TWxScTNmVzRkTEtWOFVrOGV6djdIMU5HM3IwYm1I?=
 =?utf-8?B?TGZobWh3ei82YXN0dmJmdnIwNGd0UisxTVNxNjM3OGZUYkN5ZXVZc0xnMWll?=
 =?utf-8?B?Z2NXQzNUSHBwNmdzWGtxNmQ5UEFtdnZYMUwzRlV2ZmxpMTBnblFFVUJKUERr?=
 =?utf-8?B?eFAxZmYzeDl1cklkU0dRa3gwZmVUY1JzYlVIeGd0WjVzV3NjMWUrRTJWa2c5?=
 =?utf-8?B?ZEVtRWZPVFlzZ1o2UTlTcys2ajhtU2x2cDZvR2FwVUgvZXVtaGtSM3VFM2gx?=
 =?utf-8?B?dEhrK1NyN1djVHJHK0FRWUFlRGZtQ1FsL0pZaWp1dnZyTWI2NDczaXExOTM2?=
 =?utf-8?B?ZTBVL3lyOTJJVExKTjNzanZlQ1lrWUh4MGRVcS9XQ2wxbFgzTzF5cy95TCs2?=
 =?utf-8?B?VG5jWm5Zd2tXL1k0d0U2Nm14SVhVUVhUN3oweEx2MU5iSmdYTlJQbGdLd0ZD?=
 =?utf-8?B?NndKZWs2TEtGci9nYWNVNzg5dy9DQ1UwdVNmNnJzMlZ5V0ZOLzMxdVdoY0l1?=
 =?utf-8?B?dmdzcTdZNEw3WXpaV3lhQ0ZwU1pUV0hWSjExc1hJbk05aFdaVEdTVmJuTnlK?=
 =?utf-8?B?azZWbGR0MXJ3UkRqbTh2dmhaSVpJdXMzeWdud2JSWWxtZTk5VzdKaDRpc0Uz?=
 =?utf-8?B?ZllTN3YrSGM5L2Mxa2k3WTBGaXErNUJSeDRCS0dUenB0ZEt5cGlRU3VVYzJl?=
 =?utf-8?B?VUpYbERWSDFXWHY5RmpidkwrczhoRWRsUUg2cGcvTENBWWVPcHpPT1NaUXZr?=
 =?utf-8?B?elVvNjV3RENKZEJJMVpDTUYxdHAxdU1FZStWZnhPQlZNVHhrUDF6MGdtVlRt?=
 =?utf-8?B?RHZHYkxxSHIxRTY2T0V1MGtCRVo0WHgrYTdSTHlCdE5jVE1KYjF1V2V6SzBM?=
 =?utf-8?B?T1VNS2JPOUcvcDY0cEprakExRHFPUWFFMm9Oa0JjY2FyK1gySFA2SkZXU3Rj?=
 =?utf-8?B?c21aRThCcVZIMUNPVFZZQ3p3akJLQWxxNEhzVThaREpETzh2dE92WTZIM3FY?=
 =?utf-8?B?Skpzcm5mTzVZblRpdkF4SXJYblBNeVdXNmx3ejJyemt6RWx6OVNwRlpxNHpZ?=
 =?utf-8?B?RmNSajlpbDl0T282UHNrSmN5WmdLd1h2RHlnUVFBZWJWZ2VVNkx2VHZOWk5S?=
 =?utf-8?B?Sy9ZdFNRZXZFcWdXWjFxWGFKM1YyVlBYY0JlZFhGbmRzb1htdSszd2JWcVh0?=
 =?utf-8?B?dSswS3lKZW4xS1pHdW5BZnJtQmlIdnA3WjR4Y2FKbW1MdEtTbUV3aWpwWW1P?=
 =?utf-8?B?T2JmbnlDZzJZWFJwZnNweW56QnJFczg0aFJidXRJUGVUbGphbU1NZ1NVS3FD?=
 =?utf-8?B?b0RNTTEzVCtiQ3gzc2hmdVgyd1RVL2VCWUhOakpFNnVuc3VJZS9rQVlJZmVm?=
 =?utf-8?B?d1g2UThqMk9LTHhlUTdNSGlocUx0YWdTZWNYSkpKYnhDcUFPUS9uUzR0NTR5?=
 =?utf-8?B?OEl1R3hhdldMSGVLTThOZHRqL2RBTkZtVXdCbzZ0blpCMVFLMlhDTEpPd1Ft?=
 =?utf-8?B?SkN4V0tBaFFoeHFLUmpoVGptVFRlSThvZEUxa0F6MnpEbUh2Y09WNURkcHhw?=
 =?utf-8?B?RjR4MXpuV0UwYU5vT0FLUnZXQWRZNEpBTCtIVW9tWlVwcHBUR3BhWmdCZENm?=
 =?utf-8?B?cHFDaVIyMzc4blJlL3E4YTh4c01WRE5hYVkyOENEUmJHS0s5ZnJGQmw4bWw3?=
 =?utf-8?B?MUxtUGVsTHlqVGFLYzh6OVkvU3ZEeFBVN0xWSFdGZGdERlNHM0U0NHJUTUxl?=
 =?utf-8?B?OGhVTEVHa2xEbm50S3FBMHZFK0VKTTB1bHU4YVRsWkY4OGVpY2R6bzVxWE5i?=
 =?utf-8?B?NGorWXFhVGI1M0pqODI0NHovc0JKMkhJUUpzbVgwTnVsU0xTcFh2OE5GYWpt?=
 =?utf-8?B?UVJVR0lvK3U3bFJlNmFxUnNLQ0pGM25tOEJmdUJNejJvSitNT3pSZnJNVXdt?=
 =?utf-8?B?YlBrbUQvaEg4NDgwaE1DaS9ON0NncG1FV3FzSWdXY2NsT0crbCtPLzhYTDcv?=
 =?utf-8?B?UDdYMHlablZIcVBtOU5tenNZS3orYWxJTDNwV21mMCtwMElLcVVIWGdld2dR?=
 =?utf-8?B?VkY4NGxCMGlWdUJaemx4bitTdzlQYWZMa1ZwTFBCazZ6cThUV1NJSWhHK2xn?=
 =?utf-8?Q?OTN9BAhSWvfQemwDd5qHM7I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <574E3C3D266EEF418314E5EBBE5C3DDB@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e72746d6-5aa8-4e77-96fc-08dd0ed02aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 10:42:18.7752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxL/m76DaPCHiyylE2t8l14xX82M9MOmuXksJ3yKpmDIag0sZCPiMK6KBzArqAwIMsuMxBWEQvm8gzJJD0JlHXJxllVb1deOtsPMT7cQ28Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6876

VGhhbmtzIEJhcnRvc3ogZm9yIGxvb2tpbmcgaW50byBpdCENCg0KT24gV2VkLCAyMDI0LTExLTI3
IGF0IDExOjA0ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gPiBAQCAt
ODI3LDYgKzg0NiwxMyBAQCBzdGF0aWMgdm9pZCBvbWFwX2dwaW9fZnJlZShzdHJ1Y3QgZ3Bpb19j
aGlwICpjaGlwLCB1bnNpZ25lZCBvZmZzZXQpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZ3Bpb19iYW5rICpiYW5rID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ID4gPiANCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoCAvKg0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBFbmFibGUgdGhl
IGNsb2NrIGhlcmUgc28gdGhhdCB0aGUgbmVzdGVkIGNsa19kaXNhYmxlKCkgaW4gdGhlDQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIGZvbGxvd2luZyBvbWFwX2NsZWFyX2dwaW9fZGVib3VuY2Uo
KSBpcyBsb2NrbGVzcw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoCBpZiAoYmFuay0+ZGJja19mbGFnKQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjbGtfZW5hYmxlKGJhbmstPmRiY2spOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiA+IEFuZCBm
b3IgdGhpcyBzZWNvbmQgZW5hYmxlLi4uLg0KPiA+IA0KPiA+ID4gPiArDQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoCByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmJhbmstPmxvY2ssIGZsYWdzKTsN
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGJhbmstPm1vZF91c2FnZSAmPSB+KEJJVChvZmZz
ZXQpKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghTElORV9VU0VEKGJhbmstPmly
cV91c2FnZSwgb2Zmc2V0KSkgew0KPiA+ID4gPiBAQCAtODM2LDYgKzg2Miw5IEBAIHN0YXRpYyB2
b2lkIG9tYXBfZ3Bpb19mcmVlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNl
dCkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIG9tYXBfZGlzYWJsZV9ncGlvX21vZHVsZShi
YW5rLCBvZmZzZXQpOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgcmF3X3NwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmJhbmstPmxvY2ssIGZsYWdzKTsNCj4gPiA+ID4gDQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKGJhbmstPmRiY2tfZmxhZykNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoYmFuay0+ZGJjayk7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiA+IC4u
LiB0aGlzIHdvdWxkIGJlIHRoZSBjb3JyZXNwb25kaW5nIDJuZCBkaXNhYmxlLg0KPiA+IA0KPiA+
ID4gPiArDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBwbV9ydW50aW1lX3B1dChjaGlwLT5w
YXJlbnQpOw0KPiA+ID4gPiDCoMKgIH0NCj4gPiA+ID4gDQo+ID4gDQo+ID4gQXJlbid0IHRoZXkg
cGFpcmVkIGZyb20geW91ciBQb1Y/DQo+ID4gDQo+IA0KPiBPaywgSSBuZWVkZWQgdG8gdGFrZSBh
IGxvbmcgbG9vayBhdCB0aGlzIGRyaXZlci4NCj4gDQo+IElJVUMgd2hhdCBoYXBwZW5zIG5vdzoN
Cj4gDQo+IEluIG9tYXBfZ3Bpb19pcnFfc2h1dGRvd24oKSBhbmQgb21hcF9ncGlvX2ZyZWUoKSB5
b3Ugbm93IGVuYWJsZSB0aGUNCj4gY2xvY2sgKHJlYWxseSBqdXN0IGJ1bXBpbmcgaXRzIGVuYWJs
ZSBjb3VudCkgYmVmb3JlIGVudGVyaW5nDQo+IG9tYXBfY2xlYXJfZ3Bpb19kZWJvdW5jZSgpIHNv
IHRoYXQgaXRzIGludGVybmFsIGNhbGwgZG8gY2xrX2Rpc2FibGUoKQ0KPiBvbmx5IGRlY3JlYXNl
cyB0aGUgcmVmZXJlbmNlIGNvdW50IHdpdGhvdXQgYWN0dWFsbHkgZGlzYWJsaW5nIGl0IGFuZA0K
PiB0aGUgY2xvY2sgaXMgcmVhbGx5IGRpc2FibGVkIG9uZSBsZXZlbCB1cCB0aGUgc3RhY2suDQo+
IA0KPiBJZiB0aGF0J3MgY29ycmVjdCwgaXNuJ3QgaXQgdW5uZWNlc3NhcmlseSBjb252b2x1dGVk
Pw0KPiBvbWFwX2NsZWFyX2dwaW9fZGVib3VuY2UoKSBpcyBvbmx5IGNhbGxlZCBmcm9tIHRoZXNl
IHR3byBmdW5jdGlvbnMgc28NCj4gd2h5IG5vdCBqdXN0IG1vdmUgdGhlIGNsa19kaXNhYmxlKCkg
b3V0IG9mIGl0IGFuZCBpbnRvIHRoZW0/DQoNClNlZW1zIHRoYXQgSSBkaWRuJ3Qgbm90aWNlIHRo
ZSBlbGVwaGFudCBpbiB0aGUgcm9vbSwgc28gbGV0IG1lIHJld29yayBpdCA7LSkNCg0KLS0gDQpB
bGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

