Return-Path: <linux-gpio+bounces-28529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BBC5F85E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 23:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B0984E05B9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 22:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8330146D;
	Fri, 14 Nov 2025 22:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="MWIfzpCY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54772C21CD
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763160201; cv=fail; b=hSz3oIJ297I28oZyKavNxF9Dhf7BB3jh0LJ5AnTLjT/SpomQU2ch+sm5Nj5b2kgrGOv17dAqB3lvwQzclfbFilP2KrXv/3hq3z+JcIdSpgc4YnqgtZsFvgIcq40eQ7dAcy2LpJvVgiYtwUnb/HQ/Lf4YfHFmQW9byP21WC2LN9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763160201; c=relaxed/simple;
	bh=2cElMohck6oEFkv6JuDSnyOFHOP2zD+Ba7ZPVwmtkEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EDeRHAUQg07aeG1XQUtdUhAkKyv8RW8i6v+TE0FHLXFqNgXxz4+i8DjQ4oWHI5d1/SMF5HKoCGgBRLx4ukOnuh+AMAgIBJLBigFxd5K6FVYRGoeHjipMb1XkGGVTfofYn9nO5SGvuuam+gHpbH53Wy0r3CvjLTWETi7aUPGM1iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=MWIfzpCY; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvjPQluDndKi64IUrMa50PKKcNGMNyYlJqcClRJarJbiIVCcOuJI3vHtCMdaCAdYo7dG4vqD2GwvCen0XHv/KgvTFRNJa1cixH6thSoQYjQejvZmHgnZOluxvwzFqilqyYSmP+m4hf02yFWs1YcyKVq9q71NYFZ74jWTF/M7+AFQtP9vSM/hANtSnsuWiL3DQqNZFGDVZh+OrZ+0U8ANXMkXLuNf9fVVzhLelgWrghC3jR6WgU9uF7BThYcjXX3YNMeYk8O+uUThtszAbpLgp7WPBj5PnI+/nWfzqPwYhUPWzwEgXOOI6HMXLd31zsrs9wvMhHhDU8r7uFaMjuN/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cElMohck6oEFkv6JuDSnyOFHOP2zD+Ba7ZPVwmtkEo=;
 b=g589sTaVK3GLllUVGrgaj6mf0tWf/ev9/lI0UGlMse6RaqyoYCUsd5DjlbkansXTs8rFUYFbiGAL2tLtcyaJ5WxT5ctdnxDK2bGRzi/DEkYdNiHpHAzme3EEdXggnL9igv2P9To/to+JRsfUUKgSGZWCg+QVs0J+zDrY2uE8Y8z+kGGG9thhj5Bzb47xkFQiNk0M3mbvNZbwWMrjJHl8XmdQlMEewmJUI0he5NHLRhempcNnI8U5EvXzg9l9DVFsNoBd6RoTCP4INUj6JHuwBi5socYSUoo88n4BoB6aR/O/Ig6A05eC9eGfj3y3T41pnh/gJcBob/tUIxr0Xehsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cElMohck6oEFkv6JuDSnyOFHOP2zD+Ba7ZPVwmtkEo=;
 b=MWIfzpCYsFBaifb9cya3eNBIrtC3NHnYehXWDM/T8GPIC1OYc9zuWdSO3VoEWf3NV2FcfPTKF1sP9JQvoxhNZqwfYqypamjlENNMyx8uWAWWykwBjCMSkYKmUi8v528hpMxpxyWknVfRFnHlA7PnEd4Gtf3J4UUZVs5aDKarsOwXKN1OG2wERtHTAe0nFZsitQF2x0vRGcnTd9XXDVR5+GWMJcMHzjGq3zNLCGeni94B7+vKBFpHMx9dnaAvz5vhv4wJXE60Mz33nDsq3h0Thv1LeYlwjo/s9Jj+l0ebPmuI4LYzOfCLGkl/NPDWdt1/NbNTmEVAoILIN0RQanOHeQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAWPR10MB7866.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 22:43:17 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 22:43:16 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip
 twice
Thread-Topic: [PATCH libgpiod] dbus: manager: don't try to export the same
 chip twice
Thread-Index: AQHcVWrJiIxc8vuKkkSx3HGVJLRr8bTycgGAgAAByoCAAFF+AA==
Date: Fri, 14 Nov 2025 22:43:16 +0000
Message-ID: <3c3bd52678aee5f1d7b93d59ad351c3a304ae8a9.camel@siemens.com>
References: <20251114132957.33750-1-brgl@bgdev.pl>
		 <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
	 <CAMRc=MdFOFiZpjkec+zsx64Ww7MDhT8eSmCrFR4SparxhexX_Q@mail.gmail.com>
In-Reply-To:
 <CAMRc=MdFOFiZpjkec+zsx64Ww7MDhT8eSmCrFR4SparxhexX_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAWPR10MB7866:EE_
x-ms-office365-filtering-correlation-id: ba1d040f-5b55-40ac-fb06-08de23cf33e2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RkpWU0FrOElqUk1TME5uMjI2eUd5U1dVcEozdktBQVhWMkgrYWhYZGxITTMy?=
 =?utf-8?B?cElkRWJzTW1BYWlpbm9NeTFJWEJWaUo2ZlA3VnlveC9VZTUwVVBTVFMycTlk?=
 =?utf-8?B?L3hJQndJUCtRWHpXZ0lGMldUWnF4cmQrL1JWQlJBMWpFa0xpd1hYOWM5Wk8v?=
 =?utf-8?B?ZkxERWo2aG5wSk55M2ZuK0Z6SDNkVGl2REE1RnVjUmRFQng3SVh5cDY2Q043?=
 =?utf-8?B?NDFjQytyWERyNjlNQzZvQnBmSWxheXpEb283TlFjRTJZUzZZMlB1ZXZCRURo?=
 =?utf-8?B?bjB0RHcwYWpjbEp1eEEvd0kyUlIrS1hyOG4rc0hkZHFQb3MrR3B3NVhiczFY?=
 =?utf-8?B?V0dNeDF4bzl4ckRnNmFMbC93aXFianVtWlo1bDBuaERCRUZ6NEtPaUpzUHJl?=
 =?utf-8?B?cXJuVzJCdjBGVWhXZXU2S1RpVUZUZVZPekxESVMzNlJGaXdrY0JEQkZlUW1Y?=
 =?utf-8?B?cE9JcHhmczJQMkM4b285U2lCMUMzUW9PaUIxMVA1MXc3L3YrazhSNFM2djdC?=
 =?utf-8?B?Y2VtdWo3VEl1L3kyRzYwTnZ6UXhJYWpoUlpyU09yM2pKMlh4MnhqWjFOcW1N?=
 =?utf-8?B?SDNsRmwyK0VjT0xpZVVScGJOUzdpOERudjhKRjY5L3kzUEh5WGxmbGhmRDNC?=
 =?utf-8?B?UTlQWVFlbkZRWHY5MWVSaEdBSFAyQVAyRFpYeGQyY21IdzBXYzRlZ1llU0kz?=
 =?utf-8?B?bjFTN0hIWkZIeUdjTkpBNWRTV3l2Wml6elFDVzRKSDNaOFBKSEtON3JTNTc1?=
 =?utf-8?B?NXgwOUZvaGgyT1JUeVZBQ3NuNmNTMXZIR1RMQk5NOUMvaVNKMEdPTEIydEFl?=
 =?utf-8?B?aFFnUzQveE9SMW5TUW0rRU5qa0w5ajFDeEg0TUNITkpDNjFiMDdqeUlkUEVG?=
 =?utf-8?B?NFN3emFJM3g5b08wOEdTNktHRm1vVGZoNEswUjM0KzFFMDJiYldDZ1AyaFNr?=
 =?utf-8?B?bWNlRkMwdFJKK1MrREFPMEVLQmdDampFemVQdUlZdHhBRkswNGtIa1JaY1Rj?=
 =?utf-8?B?eWdQMlF4cUVSa1VmT3hGKzRLTittVTRkRjByNm05UWhCeTNLWi9BUllOR3NF?=
 =?utf-8?B?dDhsTEh3SFZGakNCREFkTUhTL0dXaWlCY3d2YUVxVHRuVXpsK3JZM1BUNnl2?=
 =?utf-8?B?MTAvNFJvNVhDdWFvaE9MNUk5VFBORy9jUWFkQXcwUy8xUnB5bjNrd1JvRlZm?=
 =?utf-8?B?U3hzWFFRemkzYzBDbTcxNFM2bE5ENE5sM1hyKzA3Qnd1Z3RQY1paV3NPSHlD?=
 =?utf-8?B?L090LzNkVk1tN0tLZFZnNnVUcGtjSzZxOHhnd2hBcEhzK0daSHphMGdPNXdE?=
 =?utf-8?B?Z2orcUhIRmUzTlJsYnVBMlMrTG43d1dCaXBmcDBYNXZSNVFIWFBUMWw0TnpR?=
 =?utf-8?B?OWpRbUNaM0lKREZ6eVQ0eUxINFZkQXFXRmtBRGZNU1RMbTNkZVBFbG5oZUdz?=
 =?utf-8?B?QlRZeFhvOUprZlIwZnlXWW5BOVlUTVU0MlJEVUZHUExiaGJid0VJWno4bENY?=
 =?utf-8?B?NTJmc0J0ak9QaE5GZkdRM05JQTVFUHExRTJVU1hncCtzaUNFWjd4VFpmczhm?=
 =?utf-8?B?cnVyQ0cxYTYrSjNUUEgyN0owLzZMVDlHaXJ0Y2VXRDY0bXdsT3RKZ05jWkpo?=
 =?utf-8?B?aFlpbEV3bEJ4aXFkYkc4eDNZNVpZOURMOHZjcFVzYW9tK1BQTDduV1Q3N1ND?=
 =?utf-8?B?ZnAxYmNIcVNyNzJzcUtIV1FRWjdscCtvakRKczkwOHJIVzRZLzZZMCtHYmZL?=
 =?utf-8?B?TG9tRG5iZXdIOE1IOGxtNjBFak9vTlZZNEwzTWVVcldsc2ZLa2R1cWYvL2Yy?=
 =?utf-8?B?Zy9JWFJOM01acmt2MEZMaGdmamxOVFMrVS9Hb2hlK0ZzTXBjWm9pOFpBcStn?=
 =?utf-8?B?L1ZGb0huSnFXY1ZaRHc5NkpzYTRxbzlkeEl5b2dIQ2hxb1hreEsvREhpWWc5?=
 =?utf-8?B?Vlc5LzhxWEZWSmRXUmtPNEIvcW1jK2RxSGl3VWRMK1pqV1RDVFV5SjhhOGRU?=
 =?utf-8?B?bzZRVUtvMlZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnFRZ2hWb21UN25YaitHeUNXU2RoRE1NZmhaTEFiRFVtZ0xEL3BJNnFwSmRj?=
 =?utf-8?B?MWVlM1VEb2t2VG11ZjRpQzNUK1ZIaXVIR3N2YmdhaGxlZFZyVmMrWVovUjd6?=
 =?utf-8?B?TXQ0NmxZWEhCMjFpTWxtSmNhSm9JZjFlaDU4Mk9CYXR2bGlRempUTnhpQ3pY?=
 =?utf-8?B?NVNBdnpyRzhybW41ZlVKZ2I1UUhlZDR3d1dTVHBYRmRzYVAwWjBVSGdMNFRk?=
 =?utf-8?B?ME1rUDZkaGpIajgweEt1bUhGSHJMZjQrTFRiMFYxQnpzNkZxVmpselJPakpw?=
 =?utf-8?B?Rm9mRlBKRklsWThPWkdIbGVKeERrdlMxNGhiSTFhNFNSMHN0bHZMRDZYeXVp?=
 =?utf-8?B?K0g2bDVZNUVYYjNKWU9PcUJ3alIwMjBYY3d6WU1kK0JWYnkzRzJOWkpNdlh3?=
 =?utf-8?B?cW5RL2NINUk1enB1b2RJTmVWUVVtcjlwYXAwTS9EekRFS2NKVGZZcHdhL1FS?=
 =?utf-8?B?Vno1ZXFmbU5NZHA2OWJscFRmUGxsSHVwbFBJNnlNNlJkb014Z09QcWNLbkRX?=
 =?utf-8?B?VEhDY3F1RkR5eTJtKzFxZkt6cTJ5NVNWcVJadkprUzRRQWNFakJtMjljWktk?=
 =?utf-8?B?MmkrUGN5TEozYTFwOUNFQmYvQ1pVdHdFb3VRL2xEMTJPU1dCU285OHlyR3Y0?=
 =?utf-8?B?VE9oOGc3bmpTN0FrWmE5QTIvTlhBRUdaWDd5QXJwbXl4QVlqVWQxOUJ1U3Ja?=
 =?utf-8?B?QnUxRVZUbnovYjZCYytkUDFodG92WGVoOXJFWEtqS0xwWFBjbEdCSnNyVmFk?=
 =?utf-8?B?clpjS2YvaWw1cWMzaktKcXFuQTRMYzRnbk5lSStMZjQ4TDNJZEFpamFnK0ov?=
 =?utf-8?B?b012bjMyVm0yUzg1c3hpSnJDS29uM21UZjBpRGdnZ2FQNmxyNVQ5YnQ5Wi9r?=
 =?utf-8?B?SHJ0VDBTM3NnZDQ3a0hCSVhZOTFUTzMzQWE5c0Y2d0U1RzA1YkRtcThVOFB1?=
 =?utf-8?B?Smt5cmlKM3pVVzdJcEJPZDRyM1Y5UVRXUllrODNaRTU3dnpiM2NHZFZadFZv?=
 =?utf-8?B?QnY3QWhxZWtaTWZwTEJvQ2JQL210NXFqZmRLcGFHZy9semJ6WnRMS3VFRVl6?=
 =?utf-8?B?TlVNanRmc0crcDNXSzhUaSt6a2QxQzRWVVNzT1NmeVdxbm1EUGtXRGVhMEx6?=
 =?utf-8?B?M3J6ZXBtTHlCL083NzVlejlXT0Z1c29Id2VVS2JPK3ZGVGkyNFZkV0QwQlZV?=
 =?utf-8?B?VkFjVzRjWmpVc0xrTkhLYnVFYVgwNDNKa0Fva0IvZXVzR3hoRVhGM1FpNmdZ?=
 =?utf-8?B?UEhNSXBzWVVsamRQRkM0VXd6QWYyTWlpUHI5U3ZJTUVjR0xGU1BxcjNKV0Q2?=
 =?utf-8?B?Y0YxZStRM2FHeUJEOWcreGw5ck0yYjNkdldwL2RnMjlhWnRobzVBU3pHZGVP?=
 =?utf-8?B?RUJyK2Jxbm15bTA5ZmpWdklxSEZKa095T3dabmNHR09JYTdkUm0vNDN6Yzd2?=
 =?utf-8?B?YXlYc3FZenRtUGk5OHVNZnBuekV0cGN2SDloUWN5aEdyNFdJWGkybS9GbWxt?=
 =?utf-8?B?bWlJV3JxMm91cnNPNm9HUXg5VmM4YXF6aU0ya1lJOWtQa014QWdQcXJxY0pK?=
 =?utf-8?B?cEMvcmFocFRyYUxYaXh3eXJmL2hzOUQxc2QwdWVFV3hHVjFlMmlVZS9XdEVO?=
 =?utf-8?B?QnJjQzhyOVluTmQ4NVpOT3RHS0JuUHUwQkQ2c1NwT1dxYzRMYW5YdVpOR29P?=
 =?utf-8?B?NmhtUGUvbGNldWNEMjMxcmRIMDhtS1kzYjJNK2J2cHVJdzVadnUyUEF5czdC?=
 =?utf-8?B?Z0sxRy9Cc2NCSjlCTjJFYmJxVW1VN1pZKyt5aFJSL1BiTkJ6SlgwbFlxcHF5?=
 =?utf-8?B?ditmcTV6MDdTZVNTN0JlMTkxZ2g3TlFjbHNWbXZuQUtvdFJLVE02cmUySElI?=
 =?utf-8?B?c2ZncG5xR2hoL0NvbGRvZnZwcnBxY1ZES2tZelFrbXRkN2ExcGRxUENSalFq?=
 =?utf-8?B?RDFOaGFtaDFvUEI0ZDdxWkxpVXc3Qkk1cUM0Tk91STAwaklxWlQ4K2FSaDBB?=
 =?utf-8?B?RlQ2RkZwdUlIdHVKa2prOFBqa0hqVnV2eGx2am9GMmtyeFpRUWhBUUNLMDJB?=
 =?utf-8?B?NU80WC8xZ1JOeW5FeTBUTHJiSVJ3aWsxa2VpODBPemtZZjZFQytPVzJzMmNh?=
 =?utf-8?B?ZVZUcXprVEIxL25pbFlpQ2VTVDdCRjBZVGlVTWhsWU54YzZrU1pCeEdoYlZM?=
 =?utf-8?Q?JZvVWufFeuWygxnJtx6Y8ws=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E053767265419A42A8DA7D26B251BA3B@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1d040f-5b55-40ac-fb06-08de23cf33e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 22:43:16.7975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6qizK6d06SQffrDen9tQGEhGaVTfxzC03j3yO+lQbhE308rrx9+6Av+K4XPfpsfRQnvvt2/km25tbIepmek3VhQUZVLXf0h8GK9EhKu9TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7866

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDI1LTExLTE0IGF0IDE4OjUxICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gSXQncyBwb3NzaWJsZSB0byBnZXQgYSBzZWNvbmQg
YmluZCBldmVudCBmcm9tIHVkZXZkIChmb3IgaW5zdGFuY2U6DQo+ID4gPiBtYW51YWxseSB0cmln
Z2VyZWQgd2l0aCBgdWRldmFkbSB0cmlnZ2VyIC1jIGJpbmRgKSBvbiB0aGUgc2FtZSBHUElPDQo+
ID4gPiBjaGlwIHNvIGl0IGFscmVhZHkgZXhpc3RpbmcgaW4gdGhlIGhhc2htYXAgbWF5IGFjdHVh
bGx5IGhhcHBlbiB1bmxpa2UNCj4gPiA+IHdoYXQgdGhlIGNvbW1lbnQgaW4gZGFlbW9uLmMgc3Rh
dGVzLiBXZSBtdXN0IG5vdCB0cnkgdG8gZXhwb3J0IHRoZSBzYW1lDQo+ID4gPiBjaGlwIHR3aWNl
IGFzIGl0IHdpbGwgY3Jhc2ggdGhlIGdwaW8tbWFuYWdlciBvbiB0aGUgc3Vic2VxdWVudA0KPiA+
ID4gYXNzZXJ0aW9uLg0KPiA+IA0KPiA+IEknbSBzdGlsbCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0
aGUgaW5pdGlhbCByYWNlLCB3aGljaCBtYWRlIG1lIHRvIHJlcG9ydCB0aGUNCj4gPiBpc3N1ZSwg
YW5kIEkgbm93IHRoaW5rIHRoYXQgdGhlIHBhdGNoIG1heWJlIGRvZXNuJ3QgdGFja2xlIHRoZSBy
b290IGNhdXNlLg0KPiA+IA0KPiA+IEluaXRpYWxseSBJIHN1c3BlY3RlZCB0aGF0IHRoZXJlIGlz
IGEgcmFjZSBvZiBncGlvZGJ1c19kYWVtb25fcHJvY2Vzc19jaGlwX2RldigpDQo+ID4gYWdhaW5z
dCBncGlvZGJ1c19kYWVtb25fb25fdWV2ZW50KCkgYmVjYXVzZSBJIHRob3VnaHQgdGhlIGdwaW8t
bWFuYWdlciBjcmFzaA0KPiA+IGJlY2F1c2Ugb2YgdGhlIHNhbWUgYXNzZXJ0KCkgaW4gaXRzIHN0
YXJ0dXA6DQo+ID4gDQo+ID4gZ3Bpby1tYW5hZ2VyWzU4OF06IGluaXRpYWxpemluZyBncGlvLW1h
bmFnZXINCj4gPiBncGlvLW1hbmFnZXJbNTg4XTogZ3Bpby1tYW5hZ2VyIHN0YXJ0ZWQNCj4gPiBz
eXN0ZW1kWzFdOiBTdGFydGVkIENlbnRyYWxpemVkIEdQSU8gbWFuYWdlciBkYWVtb24uDQo+ID4g
Z3Bpby1tYW5hZ2VyWzU4OF06IC91c3Ivc3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9naW8vZ2Ri
dXNvYmplY3RtYW5hZ2Vyc2VydmVyLmM6MTEyODogRXJyb3IgcmVnaXN0ZXJpbmcgbWFuYWdlciBh
dCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNTogQW4gb2JqZWN0IGlzIGFscmVhZHkgZXhwb3J0
ZWQgZm9yIHRoZSBpbnRlcmZhY2UNCj4gPiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5PYmplY3RNYW5h
Z2VyIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1DQo+ID4gZ3Bpby1tYW5hZ2VyWzU4OF06
IC91c3Ivc3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9naW8vZ2RidXNvYmplY3RtYW5hZ2Vyc2Vy
dmVyLmM6MTE0ODogRXJyb3IgcmVnaXN0ZXJpbmcgb2JqZWN0IGF0IC9pby9ncGlvZDEvY2hpcHMv
Z3Bpb2NoaXA1L2xpbmUwIHdpdGggaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lOiBBbiBvYmplY3Qg
aXMgYWxyZWFkeQ0KPiA+IGV4cG9ydGVkIGZvciB0aGUgaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5l
IGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1L2xpbmUwDQo+ID4gZ3Bpby1tYW5hZ2VyWzU4
OF06IC91c3Ivc3JjL2RlYnVnL2dsaWItMi4wLzIuNzguNi9naW8vZ2RidXNvYmplY3RtYW5hZ2Vy
c2VydmVyLmM6MzYwOiBFcnJvciByZWdpc3RlcmluZyBvYmplY3QgYXQgL2lvL2dwaW9kMS9jaGlw
cy9ncGlvY2hpcDUvbGluZTEgd2l0aCBpbnRlcmZhY2UgaW8uZ3Bpb2QxLkxpbmU6IEFuIG9iamVj
dCBpcyBhbHJlYWR5DQo+ID4gZXhwb3J0ZWQgZm9yIHRoZSBpbnRlcmZhY2UgaW8uZ3Bpb2QxLkxp
bmUgYXQgL2lvL2dwaW9kMS9jaGlwcy9ncGlvY2hpcDUvbGluZTENCj4gPiBncGlvLW1hbmFnZXJb
NTg4XTogL3Vzci9zcmMvZGVidWcvZ2xpYi0yLjAvMi43OC42L2dpby9nZGJ1c29iamVjdG1hbmFn
ZXJzZXJ2ZXIuYzozNjA6IEVycm9yIHJlZ2lzdGVyaW5nIG9iamVjdCBhdCAvaW8vZ3Bpb2QxL2No
aXBzL2dwaW9jaGlwNS9saW5lMiB3aXRoIGludGVyZmFjZSBpby5ncGlvZDEuTGluZTogQW4gb2Jq
ZWN0IGlzIGFscmVhZHkNCj4gPiBleHBvcnRlZCBmb3IgdGhlIGludGVyZmFjZSBpby5ncGlvZDEu
TGluZSBhdCAvaW8vZ3Bpb2QxL2NoaXBzL2dwaW9jaGlwNS9saW5lMg0KPiA+IGdwaW8tbWFuYWdl
cls1ODhdOiAvdXNyL3NyYy9kZWJ1Zy9nbGliLTIuMC8yLjc4LjYvZ2lvL2dkYnVzb2JqZWN0bWFu
YWdlcnNlcnZlci5jOjM2MDogRXJyb3IgcmVnaXN0ZXJpbmcgb2JqZWN0IGF0IC9pby9ncGlvZDEv
Y2hpcHMvZ3Bpb2NoaXA1L2xpbmUzIHdpdGggaW50ZXJmYWNlIGlvLmdwaW9kMS5MaW5lOiBBbiBv
YmplY3QgaXMgYWxyZWFkeQ0KPiA+IGV4cG9ydGVkIGZvciB0aGUgaW50ZXJmYWNlIGlvLmdwaW9k
MS5MaW5lIGF0IC9pby9ncGlvZDEvY2hpcHMvZ3Bpb2NoaXA1L2xpbmUzDQo+ID4gZ3Bpby1tYW5h
Z2VyWzU4OF06IGdfdmFyaWFudF9pc19vYmplY3RfcGF0aDogYXNzZXJ0aW9uICdzdHJpbmcgIT0g
TlVMTCcgZmFpbGVkDQo+ID4gZ3Bpby1tYW5hZ2VyWzU4OF06IGdfZGJ1c19vYmplY3RfbWFuYWdl
cl9zZXJ2ZXJfdW5leHBvcnRfdW5sb2NrZWQ6IGFzc2VydGlvbiAnZ192YXJpYW50X2lzX29iamVj
dF9wYXRoIChvYmplY3RfcGF0aCknIGZhaWxlZA0KPiA+IGdwaW8tbWFuYWdlcls1ODhdOiAqKg0K
PiA+IGdwaW8tbWFuYWdlcls1ODhdOiBncGlvLW1hbmFnZXI6RVJST1I6L3Vzci9zcmMvZGVidWcv
bGliZ3Bpb2QvMi4yLjEvZGJ1cy9tYW5hZ2VyL2RhZW1vbi5jOjc0NDpncGlvZGJ1c19kYWVtb25f
ZXhwb3J0X2NoaXA6IGFzc2VydGlvbiBmYWlsZWQ6IChyZXQpDQo+ID4gZ3Bpby1tYW5hZ2VyWzU4
OF06IEJhaWwgb3V0ISBncGlvLW1hbmFnZXI6RVJST1I6L3Vzci9zcmMvZGVidWcvbGliZ3Bpb2Qv
Mi4yLjEvZGJ1cy9tYW5hZ2VyL2RhZW1vbi5jOjc0NDpncGlvZGJ1c19kYWVtb25fZXhwb3J0X2No
aXA6IGFzc2VydGlvbiBmYWlsZWQ6IChyZXQpDQo+ID4gc3lzdGVtZFsxXTogZ3Bpby1tYW5hZ2Vy
LnNlcnZpY2U6IE1haW4gcHJvY2VzcyBleGl0ZWQsIGNvZGU9ZHVtcGVkLCBzdGF0dXM9Ni9BQlJU
DQo+ID4gc3lzdGVtZFsxXTogZ3Bpby1tYW5hZ2VyLnNlcnZpY2U6IEZhaWxlZCB3aXRoIHJlc3Vs
dCAnY29yZS1kdW1wJy4NCj4gPiANCj4gPiBVbmZvcnR1bmF0ZWx5LCBJIHN0aWxsIHRvIGNvbWUg
dXAgd2l0aCBhIHdheSB0byByZXByb2R1Y2UgaXQsIGl0J3Mgc3RpbGwgbm90IGNsZWFyDQo+ID4g
dG8gbWUsIGJhc2VkIG9uIHRoZSBsb2dzIEkgaGF2ZSwgd2hhdCBpbmZsdWVuY2VzIGl0Li4uDQo+
ID4gKEFib3ZlIGlzIHJlYWxseSBhIGZpcnN0IHN0YXJ0dXAgb2YgdGhlIGdwaW8tbWFuYWdlciwg
bm90IGEgcmVzdGFydCkNCj4gPiANCj4gDQo+IElzIHRoaXMgd2l0aCBteSBwYXRjaCB0aG91Z2g/
IGdwaW8tbWFuYWdlciBkb2VzIHNwYXduIDQgYWRkaXRpb25hbA0KPiB0aHJlYWRzIGJ1dCB0aGlz
IGlzIGludGVybmFsIHRvIEdMaWIgYW5kIEdEQnVzIGFuZCBBRkFJSyBhbGwgdGhlDQo+IHByb2Nl
c3Npbmcgd2UgZXhwbGljaXRseSBkbyBpbiB0aGUgZGFlbW9uIGhhcHBlbnMgaW4gYSBzaW5nbGUg
dGhyZWFkLg0KPiBOb3Qgc3VyZSBob3cgdGhpcyB3b3VsZCByYWNlLg0KDQpubywgdGhlIGFib3Zl
IGxvZyBpcyBmcm9tIHRoZSB1bnBhdGNoZWQgdmVyc2lvbiwgdGhlIG9yaWdpbmFsIHJhY2UuDQpJ
J2Qgc2F5IHRoYXQgd2l0aCB0aGUgcGF0Y2ggdGhlIHJhY2Ugd291bGQgYmVjb21lIG1vcmUgc3Vi
dGxlIChsZXNzIHByb2JhYmxlLA0KYnV0IHVsdGltYXRlbHkgbm90IHdvcmtlZCBhcm91bmQpLg0K
DQpCdXQgbmV2ZXIgbWluZCwgSSB0aGluayB0aGUgcGF0Y2ggd2lsbCBhbHdheXMgYmUgcmVxdWly
ZWQgZm9yIHRoZSBjYXNlDQpvZiByZS10cmlnZ2VyZWQgdWV2ZW50cyAod2hlbiBpdCBkb2Vzbid0
IHJhY2Ugd2l0aCBzdGFydHVwIGFuZA0KZ3Bpb2RidXNfZGFlbW9uX3Byb2Nlc3NfY2hpcF9kZXYo
KSBhbnkgbG9uZ2VyKS4NCg0KSSdsbCB0cnkgdG8gcmVwcm9kdWNlwqBncGlvZGJ1c19kYWVtb25f
cHJvY2Vzc19jaGlwX2RldigpIHZzDQpncGlvZGJ1c19kYWVtb25fb25fdWV2ZW50KCkgcmFjZSAo
aWYgdGhlcmUgaXMgb25lKS4uLg0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBB
Rw0Kd3d3LnNpZW1lbnMuY29tDQo=

