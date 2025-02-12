Return-Path: <linux-gpio+bounces-15855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86DA327D5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C0C3A1F04
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADE620E717;
	Wed, 12 Feb 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="JAQ6q9aO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4920E6F0;
	Wed, 12 Feb 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368717; cv=fail; b=qEnq2P0rXpvejKf8aX13jQ+vLNElK9+iwbWwqm+r68hxg3Msga3vuvncCPB3ht548xzbwtmd2rBSBkwVhtBgpeXQMRG78MHvEaYMobwRfQ6XPB7Zawg02tyGgPeykxhqkEohmzzUyGHb7BrW6JJb1psxGuTKkENZaH1ToHDwcpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368717; c=relaxed/simple;
	bh=U17fUQBnL2l8kEi4OOsAuDrpfG5OnTY000zJ7XyLyeE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VK2EBLA5qeIn6XW5Fe2EgWurauhK1Mil2QAsoQb6Hz+cgUXSSwfckUpvhxIhTmleRaF2zF06hlI57F4KojWqCfW++OdPGTqaBd+nfImRqVOBzdEEWyYtxyghrzjlPpfEepEDVPEfOFjzoCElEAltY7pdPyycPU/f3ty14W/EHRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=JAQ6q9aO; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDiGhj001511;
	Wed, 12 Feb 2025 13:47:03 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010005.outbound.protection.outlook.com [40.93.131.5])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8sy4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:47:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiW3y33N/8E/mr2klNULOjLgji1u/AsgTshs9lDbEwjrxCnghN41c7xz9h37wE7CAVeHpQIkMm5Wo6lxm74y9iG59aT3NcFxPJp9wemH+gd3vE4UzjT8WT+NArAaLUL4hH8I5WGwBjCpvZY3wknF0DoXW8rsLehOSG60SmYb7AbMX4kADH+Ht/1IWvfGljuAt5kL9PgG7AOd3JcaJdbBT3xecXWHs3Fk5Rtymt4Su07tzk2rZvy/eXBg72cxVbeirMMEAydkGPlUF4kZUI8XJ2NWAoOYQDtyAhnYz2Xuom06X9tAXLQtGrivU7cuo/FYFp1wVnS9wt0G1+FPhspiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U17fUQBnL2l8kEi4OOsAuDrpfG5OnTY000zJ7XyLyeE=;
 b=ta6ZY95NcCZuKBbYSAQSkQvI9vebRYirRRRreUZw1ol0nGN5mJAuwoIpUIDGGN4CFkipLfB+ZxxY8zFM7TLTnpd+kcLS/OAjXjoU2JHg/xWZ1JaGEr1Fs45fzv9nGOX/wX1Qv38Sh4Y+pS9qJ8zm+SMYWiMCzaKFuyBjNlukXFW45vasK/QYtzwLoU07CpkYILKPLy9NJ2v6dUh9eeA5JSKRHyX32dZol4TD7GJsMlRN1mg1eK9T+ju9C2SiN0uJjvF/2ETtNCtVwrgm7CydQ4qc7QHtXtdx2h3ReBh49Esn8bs3qCNQCexoBiarT5vylHo8yEHUI2sHk+v3npAk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U17fUQBnL2l8kEi4OOsAuDrpfG5OnTY000zJ7XyLyeE=;
 b=JAQ6q9aOLrFfRyPNL/+zcMjVSUWS5U/aN5nB4qrkXVPo3qcFBmFBt2o13fuwxL9S5penHJLqSpxsngroFmU6hnjdvpe7quhRA0nW6TuqLKaJdbQkDs1cZXWKle68FpXPmHh8Jrb3BdI9twCPAoDFK4RqQPjDkg24suGu7ZGjw0k=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:54 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:54 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 4/5] arm64: dts: blaize-blzp1600: Add VeriSilicon GPIO support
Thread-Topic: [PATCH 4/5] arm64: dts: blaize-blzp1600: Add VeriSilicon GPIO
 support
Thread-Index: AQHbfVSTZdT1ndjnhEeVKe+vAFeAEg==
Date: Wed, 12 Feb 2025 13:46:53 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-4-080e724a21f3@blaize.com>
References:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
In-Reply-To:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: 98575451-e238-49d6-4299-08dd4b6bb5c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NjVnb29jem5lN1FNS1duN1U2MzMrN2JMWE9Ua09XV3luaEpObTZwYWFsQUxZ?=
 =?utf-8?B?cEhFc1dIaEk5US85bTJDSitCRkZSTGh2VkFKZ3ovWGV5Ymk2S3RPTnVqVjRk?=
 =?utf-8?B?Tk5KK1krR3pzTGR4Yy9OREEreWRlK2d4Y1lEZ2JvdzM5dURKQzAxckFvdUc3?=
 =?utf-8?B?cGF2ZjllTU1VbGZ0S0VNd1IyWVI5MU11b1N4TzhWWXlHZWZubzRlaGM1QXZw?=
 =?utf-8?B?YzVFZTUya3JtVUdqbWVTUWJvb3BiaTJTUzVQeVNvWk1JSFoxM0YxOFhkWDhU?=
 =?utf-8?B?VWNTWmxVWmY1aTZWbWYwR3hlcXhVYlJoR1BjZDhUUWlmekw1WW9WdnhiNk1j?=
 =?utf-8?B?SmNjT090UWVieG41UFVQOTJiOTg1TktLVnI4Y2c2cExaL2pWQ2FraGtMc2c3?=
 =?utf-8?B?QnpyR3V5a3Urb3QwdC9iN1VWeE1kMDJ2eW81NExja01TdWxCUmk1SXFOdzVZ?=
 =?utf-8?B?cXp3K0pEZng5OTBDL1lXSXhvYUxyR3ZtdzlxUlIzSEFhTmFDYUhmeFg2K0hy?=
 =?utf-8?B?TGRWS0JFZU1JTG9wbHNPOEsrTUM1MG9RQm05TEcrYjJoZ0xmMnlQMmVCem9T?=
 =?utf-8?B?UlBxNC9FMzFWeXZWcEVKLzVDK1ZoZ3phdVIvVlliUVBlRVgyU2VsNHJGcDdx?=
 =?utf-8?B?SXRHeUMzUlhDWEdERUFjNXJkcXlhRXlkNVVVY0NQNEVnSDBnREt6VEpwNVJE?=
 =?utf-8?B?ZGt4QmN3cE9GbTJaZ1o2Z0gzR2gxdGFNOEVqQmR6bllSU2FmMUcvcUo3cGZ6?=
 =?utf-8?B?RThjMXJ0MnppMW5SbUlZUGJSVTJ4RTZ4dDB1OWtTOFhoWVZvZXZuRytWeVlY?=
 =?utf-8?B?bFFLRkZ0bldUV0xPNnhWalphNGttMzdNcDlhZVM2ckl4VU1MdllrcFJUM0hV?=
 =?utf-8?B?MC9mWkZ3Z08wYzJyUHFTNnlZZS9pVWpMZmRVK29UWENDdzlZQStaZ2VXOU5a?=
 =?utf-8?B?OFZEdyt3U0tpSXZadkRXL1VTbUVZMEQzSCtiQ3lLRHhscWtKOGNHVFUxamcx?=
 =?utf-8?B?N3BwN2MzS0c1blZxcWd1VjBMWVNZekdPZDRZaFh6RDV5eDI1R0Q5MDA1Tzg4?=
 =?utf-8?B?dVE2emNmdXFLSU9hcnpobFRkNFZYWFFYc1FCZDJkR3BBSXhPci8xaHNCSkNF?=
 =?utf-8?B?SmNWYVNLdWRNRGcxcklUS2NSTjZKZGF6azBhelFuRWhQdVNiTUQ2Rlp5UFZo?=
 =?utf-8?B?SG9CcGxzUFZwK3dJSTc0bHViUUxJOFhPaGxiNkwyeFJSK0M4SVVyVXUzUG03?=
 =?utf-8?B?bDFpUHRtci9KeUc5R3pnZUVlRHBia3Npa3hBZTZ0NGludlNBdWY3TVU3R0Rl?=
 =?utf-8?B?NTZNb1ZYV0Y2SkR5WnZVMktydk5IL2thRjlPRFdQQy91R0I1VlQrK0JCblg5?=
 =?utf-8?B?VU9SUTk0Y2Y1alBneVN6SGIzbmQyRCswOGl6YnRJTjN2eFF3dnJQTllNeVpl?=
 =?utf-8?B?UmFpUndMeTBxQ29LZEtrNWMwN2ZlRGdYd3RVWEs1aXA5NWhWWE9rYVMxbStz?=
 =?utf-8?B?cUExRWhLN3cyS3VTaC9FV0dDVlJyZUxPWEZyOFltZTVGK2t1NFlGaER2RnVT?=
 =?utf-8?B?RWRBc2NWQSsxL1dHc1oyNmY4dUd6ZDhLQ2ZLUWdaZTZGY0pQM3VzQ21TQW5X?=
 =?utf-8?B?N3VBWUNydm1BMnVoNmozd3hGTFFVYWRIVjBaaVZGNERINGtwdzI1WG5BNndn?=
 =?utf-8?B?ZEpYQ05wYkVKUDMzYlJkdUM5TkcwSWswUUFpbHU0dWtqeURGWVZnNkt0SDlP?=
 =?utf-8?B?U2FuaGFySHV5L2FEbGF2M3U5TWtpVWVleERzWXdpSUZrZ3R1UC9pUGVZVEQr?=
 =?utf-8?B?ZDRXeXY3ZU5ISUNFRjc5eTdkcGNzNUZ3bVYydmdtdno4WjFzeWNjNmxoakU3?=
 =?utf-8?B?WTMyUE8wc2hSWGh1RzE2WXBpTXZ0aGQvODU2ZmpiVHN4UmdZUWhFb0t1Mjkz?=
 =?utf-8?B?Z2p2V1JqQ2NINXlxZ1MzL1hUWVlHZXJxc21GbSt2ZXFIWURVaUZhK3hFTm4z?=
 =?utf-8?B?S0xBTllteEZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amlDK3puN1NYN281djhIUzVkUG9vTHNqbTJmRENSamd2NnJFeXJRWWxPYjhu?=
 =?utf-8?B?R2doWjluMWc2YkdubUNvdlhUZFFsWXZjck5YUkpGTnlYd0QvWXd1Y2tzei9Z?=
 =?utf-8?B?cU9aekU1OFlPNVM3M2RiallhekJBSXRjZFhPdC9rWFduWVRUUGprSHJ6eU1B?=
 =?utf-8?B?THc4MWNUdzlQbHZ0azBVbzNnUVlXbzVpUmNGcnBXSkh6Wmw0QzZnazNuWlVk?=
 =?utf-8?B?blR3WjlvWlk2L0J2V0NXUDJkZEc2K25ncmx6OUtwQXpqVTNVNVB5Z2hDWHR4?=
 =?utf-8?B?M3BuRTZHckJhMW5NSmpQT0xzZG9zTlovblVUL2UyOE5ackc0MUpPaitnUkI3?=
 =?utf-8?B?TnJWYTlibzl0T3NwemF2RmtZTG5SeldIMmlUYmloQ0R5WlZuVS9HQlF5UG5a?=
 =?utf-8?B?UFRlWkEwM09jdFk2NG93V21oOWZnVFo5QjVTNXBSTTBKZjJQTk9sa3ZkSG1H?=
 =?utf-8?B?QThXZVRkZTJpOU0yTm5HQWpRVXlqeWd4ZzMrV25OSEs1Um01cnoySmkwZ0RG?=
 =?utf-8?B?blpMSHIyOTRlQ0hwckVVTEZ5TU9SU1djcUROMkxEMUdPeDI5WDV2Rlh6OVFJ?=
 =?utf-8?B?dDNhWE5VWDAwWGI2MGZXYm1oYWFTSWJxUWIydmo0WWorYWM2OWhLK1M4cDFH?=
 =?utf-8?B?cGthbUQrV2hqSUwxTzFydCt1OURBa096NWQ0QStaZHRsUisvdDZHWjJqMkZB?=
 =?utf-8?B?OG1oRHcranhLZjN4WTJLRXJNdVJ4Z0w3UjdvaU1TeklnWCtjMmpmNXJHbDhJ?=
 =?utf-8?B?a2tjN3N6OE1mSnlnL3plQWFqV1luYWJkN3JVM1RnYlQrdFAzSnU3RnlOY3JR?=
 =?utf-8?B?eU55VHhMb0F4ck5LbVFySStTalRpNGJYcUJPTE9zZ3ZGY1haQ1pMbGhDMUlz?=
 =?utf-8?B?Z3BPb29XbktuZEFYNCt0OUs3aWFXOU1Ddmc1NGNzd2MwT3hrbU1QNUZPOGtj?=
 =?utf-8?B?dCtTQ0dCTnJYcUl5NWJrQkZhbEh1ZnBrQ1FXWWJiZ01pWXdyNlBGejBqQk54?=
 =?utf-8?B?Q3ZhMlpPQTBOT3UyZFR0SXNFNDg5MDVXSHVJRU1TdDhCeGpuckEzZ1lsSDVq?=
 =?utf-8?B?cXg5d1lzT3U0Yi9IU2RQaUJyeUp4T0FqVFlYVFpZWG9SZEZmZVNhcTZGcGRy?=
 =?utf-8?B?b29qb1BVdzYyR3ljWXV1a3hpRTA4cHl1S1AzYmdvWGd5QWlpNzdhaXh1MmdT?=
 =?utf-8?B?UXE2RzVGRUt3SEtteitCV1FHbzhJVWsrYitpVnFwTGN3Tk5xNUQwMWZ2UURE?=
 =?utf-8?B?aktUZjRQWEdJbVR4bVJzNEkrM0F2SGgrUlR5UXVBWk56K0ppVXN5STNEbktq?=
 =?utf-8?B?KzN1ekJLOXY1b2hySVlxNkhzSVV4Qm9ZMVRnc3JVck16VGU5SHpGbFhvNE1i?=
 =?utf-8?B?dHNkTnQxSlduY09jTlk2SExHcTYvT1d3cklwTmhqdFE3UHhXNTVSNWM1U3Vw?=
 =?utf-8?B?RXNZZ0MwV2d5L3dDNDFaZ29DWjY3V1JqczNHdytSNWJnYTR0RWJzVFhuRXZH?=
 =?utf-8?B?NjY4allWZ2ZoZGhRRitQWUpKTW5uK1kxL0x6Z1FXZ1F5WmFZTk83N3VGeVB0?=
 =?utf-8?B?WmlrUU90YVAxNzNBbWl5MlFUS1hxeXlNUU5TamZsNlYza0tsQU4xQlVsTlY1?=
 =?utf-8?B?WVJ5MzdLS3ZNS1pKSE9EbkM2cGd2SEc3VW9QZDFiODRremkrNEE4S3FITlBj?=
 =?utf-8?B?VDJCdjFpbnlaeVorOXRsWVBNZW44NUVwbTEzT0gwWjBFanl4NmQ2cnd1cURF?=
 =?utf-8?B?NFV3TFFkTWI5dXRYa0J3aHJvMlNrSmhjNU1SOXJzdmY0cFVWQkxrQWVCRmVz?=
 =?utf-8?B?VjR6eFRvaThISFByd1Iyb1M4TEErSDEvellYRXc0QzRhY2VVVWN6UzBYRWVV?=
 =?utf-8?B?UlpaaFZGQXV4MFhsYnJFVWE4VDNyYUpHeWFKSjRwMVZGUnk5ZlhaSGZ6czlx?=
 =?utf-8?B?SmdQdGdDelcyMFVkeWRhNzVQMHNlTjhXcHBmMlgxbXFHWUJqOENTMGhCbjJ2?=
 =?utf-8?B?MGV4RXYzWG5aRnFJL1gvWVhXSnd1Z3JNZGwyZndoSnkvMGV4L3A3ajQxVitR?=
 =?utf-8?B?QnRlcTBwTzRya0ZodGplMjNrOFUyWkxxVmRkRGxvRlhPYWVrOXBNYXNuR3RQ?=
 =?utf-8?B?LzltNjQ3YTQ1cHFZaDRhb2lCR2tGYmdSME5KQm9xVWVIbC9rTHlYbjdmTSta?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB42E9CDF2C7194F8BA511FD1B3FC809@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98575451-e238-49d6-4299-08dd4b6bb5c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:53.9130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tAuvZyDBZEUO9fbDsxNEYawp1wCrgbOdBGpRch53B7NA6VX282z5fihcFemTPumxfsBaAAHna835dzHFWI1Zp2G9gqalQjqnalGve22Do0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67aca657 cx=c_pps a=z1DpLKiO5LaG0b/iPMc9+w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=SrueIWi38-K_uB21zSIA:9 a=QEXdDO2ut3YA:10 a=tWsS5bxqnw_vor0FtidD:22 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-GUID: TO5Cocokyzwh6CzaZw5izrS3ZP5s5rDC
X-Proofpoint-ORIG-GUID: TO5Cocokyzwh6CzaZw5izrS3ZP5s5rDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

QmxhaXplIEJMWlAxNjAwIHVzZXMgdGhlIGN1c3RvbSBzaWxpY29uIHByb3ZpZGVkIGZyb20NClZl
cmlTaWxpY29uIHRvIGFkZCBHUElPIHN1cHBvcnQuDQoNClNpZ25lZC1vZmYtYnk6IE5pa29sYW9z
IFBhc2Fsb3Vrb3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4NCi0tLQ0KIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC1jYjIuZHRzIHwgMzYgKysrKysr
KysrKysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpw
MTYwMC5kdHNpICAgIHwgMTIgKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1i
bHpwMTYwMC1jYjIuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAx
NjAwLWNiMi5kdHMNCmluZGV4IDdlM2NlZjJlZDM1MjJlMjAyNDg3ZTc5OWIyMDIxY2Q0NTM5OGUw
MDYuLmZiNTQxNWViMzQ3YTAyOGZjNjUwOTAwMjdhNGM0ZmM4OWM4MjgwZjUgMTAwNjQ0DQotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2JsYWl6ZS9ibGFpemUtYmx6cDE2MDAtY2IyLmR0cw0KKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLWNiMi5kdHMNCkBA
IC04MSwzICs4MSwzOSBAQCBncGlvX2V4cGFuZGVyX20yOiBncGlvQDc1IHsNCiAJCQkJICAiVUFS
VDFfVE9fUlNQIjsJLyogR1BJT18xNSAqLw0KIAl9Ow0KIH07DQorDQorJmdwaW8wIHsNCisJc3Rh
dHVzID0gIm9rYXkiOw0KKwlncGlvLWxpbmUtbmFtZXMgPSAiUEVSU1RfTiIsCQkvKiBHUElPXzAg
Ki8NCisJCQkgICJMTTk2MDYzX0FMRVJUX04iLAkvKiBHUElPXzEgKi8NCisJCQkgICJJTkEzMjIx
X1BWIiwJCS8qIEdQSU9fMiAqLw0KKwkJCSAgIklOQTMyMjFfQ1JJVCIsCS8qIEdQSU9fMyAqLw0K
KwkJCSAgIklOQTMyMjFfV0FSTiIsCS8qIEdQSU9fNCAqLw0KKwkJCSAgIklOQTMyMjFfVEMiLAkJ
LyogR1BJT181ICovDQorCQkJICAiUVNQSTBfUlNUX04iLAkvKiBHUElPXzYgKi8NCisJCQkgICJM
TTk2MDYzX1RDUklUX04iLAkvKiBHUElPXzcgKi8NCisJCQkgICJEU0lfVENIX0lOVCIsCS8qIEdQ
SU9fOCAqLw0KKwkJCSAgIkRTSV9SU1QiLAkJLyogR1BJT185ICovDQorCQkJICAiRFNJX0JMIiwJ
CS8qIEdQSU9fMTAgKi8NCisJCQkgICJEU0lfSU5UIiwJCS8qIEdQSU9fMTEgKi8NCisJCQkgICJF
VEhfUlNUIiwJCS8qIEdQSU9fMTIgKi8NCisJCQkgICJDU0kwX1JTVCIsCQkvKiBHUElPXzEzICov
DQorCQkJICAiQ1NJMF9QV0ROIiwJCS8qIEdQSU9fMTQgKi8NCisJCQkgICJDU0kxX1JTVCIsCQkv
KiBHUElPXzE1ICovDQorCQkJICAiQ1NJMV9QV0ROIiwJCS8qIEdQSU9fMTYgKi8NCisJCQkgICJD
U0kyX1JTVCIsCQkvKiBHUElPXzE3ICovDQorCQkJICAiQ1NJMl9QV0ROIiwJCS8qIEdQSU9fMTgg
Ki8NCisJCQkgICJDU0kzX1JTVCIsCQkvKiBHUElPXzE5ICovDQorCQkJICAiQ1NJM19QV0ROIiwJ
CS8qIEdQSU9fMjAgKi8NCisJCQkgICJBREFDX1JTVCIsCQkvKiBHUElPXzIxICovDQorCQkJICAi
U0RfU1dfVkREIiwJCS8qIEdQSU9fMjIgKi8NCisJCQkgICJTRF9QT05fVkREIiwJCS8qIEdQSU9f
MjMgKi8NCisJCQkgICJHUElPX0VYUF9JTlQiLAkvKiBHUElPXzI0ICovDQorCQkJICAiQk9BUkRf
SURfMCIsCQkvKiBHUElPXzI1ICovDQorCQkJICAiU0RJTzFfU1dfVkREIiwJLyogR1BJT18yNiAq
Lw0KKwkJCSAgIlNESU8xX1BPTl9WREQiLAkvKiBHUElPXzI3ICovDQorCQkJICAiU0RJTzJfU1df
VkREIiwJLyogR1BJT18yOCAqLw0KKwkJCSAgIlNESU8yX1BPTl9WREQiLAkvKiBHUElPXzI5ICov
DQorCQkJICAiQk9BUkRfSURfMSIsCQkvKiBHUElPXzMwICovDQorCQkJICAiQk9BUkRfSURfMiI7
CQkvKiBHUElPXzMxICovDQorfTsNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Js
YWl6ZS9ibGFpemUtYmx6cDE2MDAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2Js
YWl6ZS1ibHpwMTYwMC5kdHNpDQppbmRleCA3ZDM5OWU2YTUzMmY1YjI0Mzg1ZGQ4MzdiZTk2NWJl
NzcxYzdkMjRjLi43ZjMxZTMwNTVmNzBjMWRhYzc5OGRlYWIwNzM3ODdkZjgzZTc5OGQzIDEwMDY0
NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLmR0c2kN
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC5kdHNpDQpA
QCAtMTIwLDYgKzEyMCwxOCBAQCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQDQxMDAwMCB7DQog
CQkJCQkJIElSUV9UWVBFX0xFVkVMX0xPVyk+Ow0KIAkJfTsNCiANCisJCWdwaW8wOiBncGlvQDRj
MDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJ2c2ksYXBiLWdwaW8tMC4yIjsNCisJCQlyZWcgPSA8
MHg0YzAwMDAgMHgxMDAwPjsNCisJCQlncGlvLWNvbnRyb2xsZXI7DQorCQkJI2dwaW8tY2VsbHMg
PSA8Mj47DQorCQkJbmdwaW9zID0gPDMyPjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMyBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsNCisJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCisJCQkjaW50
ZXJydXB0LWNlbGxzID0gPDI+Ow0KKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorCQl9Ow0KKw0K
IAkJdWFydDA6IHNlcmlhbEA0ZDAwMDAgew0KIAkJCWNvbXBhdGlibGUgPSAibnMxNjU1MGEiOw0K
IAkJCXJlZyA9IDwweDRkMDAwMCAweDEwMDA+Ow0KDQotLSANCjIuNDMuMA0KDQo=

