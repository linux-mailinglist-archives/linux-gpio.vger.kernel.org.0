Return-Path: <linux-gpio+bounces-12899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFFF9C673D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 03:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FD4A1F21BEC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 02:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF10413AA47;
	Wed, 13 Nov 2024 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="v7o5bE2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2096.outbound.protection.outlook.com [40.107.215.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4223098B;
	Wed, 13 Nov 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731464626; cv=fail; b=ZFJl6NOTXM3Xj3+Jp5DI8HRupeWomGmqqaxIrlSXc7095Cvy4cc8FW+tdgST/gxO6ykic64FvM5MOfrE+XtjKk6BBZzFGUJObHKIhRU/9LWfFia9hRV/Bsi9oNL5HIS3irEOrked0aNr7Z7HEo94lcMBqFcNluuWDK6mR0bqPGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731464626; c=relaxed/simple;
	bh=RmtOdiWzCGh5kA3/Z2B6K0HOt8Us0doxic4Y+rqFUno=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n23NiBLP/N8JpnVieqJzUWgtOYVJMK8U5O4eI34IZVCx6yVGacTHPqIQwO7HjRWRlHJxKVe3F7pHlwsbqeeHpJBthk/sDSoJ2//EjXqVL/ku9zCuWzAU5bnSI9sxUzhk+8GPy+qhMYDsp+prorF8i4S7wRra0goyVRrQxGIVTs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=v7o5bE2M; arc=fail smtp.client-ip=40.107.215.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuSB/pIfmojvn54Mx4IJtIuw+EfHdjxM7hQ9JHog1igCU40HFJMZK9cDPf0w44/A/V2QNtv0XEVEdKRp0JqlblnbmkfGQLuDVOP2Bf48UdRd0ljTEA+AAMBjtAbDqa2+YwRIDJYeXV66zI/JEbuPfHghlsAvnbgS9tIYg0CtMZlt0Z62Arx+AIZeNbC41/ZpQpNQRJnbltNkmiOVZdVhVMLf1kZ+MK1shQrPzI3rsSDPoY+V+HTj4tz+8PFh0rtkNrTRhyt/RuTfgcKjlzsRfGv2NLsvrKMi7Mv2PhpjZaQrQ5nNtawM6bTzGlBmFIaO5zYT7jLEqOqprIzPdoc2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZQ/2IzKTbHfDk4yzgw27NtkErsJjxtYlIREeKzMMVo=;
 b=dzAggPL5tVO0fNv+EvTDjo1FKbGmgFl8Dk8YNQkzhMEiF5I/i9Lh9YDePnnWMJkyboXhcoFkadngSMrk9cZp6xjJ1DrAx6MVHq2yTsPcyw6Ne6cPVtSGuYfrKH33x9US373m48GNLs/L7GeSaMxdUvQxQQJJ21D+/7yin6oXwFaCmtWGSD7z5rufR26jCq4lprL0KTaLmBu63ypgfjFcCVb06VWvQsnlTb3bfQNedop4dUfK/C/4ix3PNXsBsx+h/WGVKbBivBg43mENtyxcO7JsqEuFqZ0/qaaRcC0IH2dwFv/mu0TpbHZDXD773pcQPYx5eFsZeXo7uHqaErnFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZQ/2IzKTbHfDk4yzgw27NtkErsJjxtYlIREeKzMMVo=;
 b=v7o5bE2MhuXOJqBn5yOsyme6mYrvFHBeqbN/PocheEyW4qM9R3VikYiUZk3MbU0ymDLvlNojqDqVryKJ1yuXeJ93+1TM0dN8dPNfxH/x2nVBieHU4uN84qkPEpi0KIB0/voGlsgW8eegOGIbBAr33so4oZS0dVMr9ewuUNC0xUC1ejI+bw+8cO52CcrZhA7aA4kkJ6FDObD3scmKPkGw0nChRnB1J+9hnHfjRXGNCpIgM0XDl4ZP3xp0mVCnF1F68b1nHeqYWwg3Cw1VYuKpxSNe06G8ec9D+LFArUG269M6bP3WCtqlTvhURtxm2QXvodT8BpsgRz6ThDz5INL7pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB8507.apcprd03.prod.outlook.com (2603:1096:405:5b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 02:23:39 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 02:23:39 +0000
Message-ID: <8f41bc32-2579-490d-af1e-875a6d12c219@amlogic.com>
Date: Wed, 13 Nov 2024 10:23:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: pinctrl: modify gpio-cells property
Content-Language: en-US
To: neil.armstrong@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
 <e1b810f6-b5b3-43aa-9cc1-e9601589ddf5@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <e1b810f6-b5b3-43aa-9cc1-e9601589ddf5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4be333-c766-41ef-35a0-08dd038a2f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blZMQTVmaytrYndZcXZRcG5RZGlsdi9keXlzRzJBbGMrRlVRNm9UdHhGOHdG?=
 =?utf-8?B?UzhnZFI2UTNYRzRIUFVPT0N2dk1XU2hzOTBpZU1LMXovSmc2aEljclZncDlm?=
 =?utf-8?B?UXRRVmhSTTcyZGp6V2c1RkdwbzZPK0NxN0VVNkoxMDNGc2ppSlgvUzVlRDFs?=
 =?utf-8?B?LzRMZmVIY25XRFZKRTV0Wkw2NjNkZzc3RC9KdEU3czhwRFNGeEN0OWNxQjdP?=
 =?utf-8?B?K1U2bDFNc05iSFE1VWQzVm83NUgzZ1ZDR1BUdEk3MUtoR1VjVW9yUGl6SXNr?=
 =?utf-8?B?OVdZYTdSaEFUL1FDOXFscSs1T3AweGVQc25Dbzk2bWJYenB6dDkrZWtEby9B?=
 =?utf-8?B?NjhkU3VPS01KQW0zOWM5YzVYVjJPNkFmTmhDK1N2cDQ4L1lIRDNMZ2dvTjN3?=
 =?utf-8?B?a25tSDBibzJQYk1ON3JCcVNwS0V4cDRmR0xFUjYwaldiWUh4WVRzRUJ1ODNN?=
 =?utf-8?B?dEk5eFVFNHlSUDlmc2p1d1FQWHJYc21ieVI0cHltVjJKTE1TTjJ2Q21DbXFO?=
 =?utf-8?B?SFFQNHBSbDRLb2VpWmxwSmJmYldDK2ROSzNnckwvU0pLMjZyQU1HcnVGblNO?=
 =?utf-8?B?OFE0aDhTdGk4S2hYSW51MW02dTRKT0M3ZzF2Q215UWpFZ3VycWVRSTJ5YU82?=
 =?utf-8?B?THFPNy8vVDhTQzhPZU1pMXRwbm1wTE5uYmhuajA0RVNLSkthZ3FmalNJenJo?=
 =?utf-8?B?UHd4UzdMLzVHcXkzVVpRMTVhaDBVS05lRHFzbWNqV282dUFTNnE3bGFTWUtE?=
 =?utf-8?B?Z0VsY3RRenZ0VU1xU3N4Wis1aGluK2xsUnpIQVZoWHY5aWZSc3d0c3ltY0l3?=
 =?utf-8?B?K2tYR0xKbmo4SDYxV0FMK2dQZVI4TnZBV3NiYkVEZyt4VnRvUlZtemlnUnRh?=
 =?utf-8?B?bzNadWJlRWFmYlRITHF1QkNzeTRCdlpvdFNaVjlqeGh3Y3NIaXk0S2NqaU9S?=
 =?utf-8?B?MVhGdS95N0J1M2xPOGR4N0FOSzhoc1ZaOE1WYWJ3Y0FYWFhPVXVpZ3Y1Vkd0?=
 =?utf-8?B?VXIxK1FSeEV0TVFObXlUblZoWnlCNUhFa2hraFBtekU5M3huWlJPQ1BLS1Fx?=
 =?utf-8?B?TlMyZVUrdkFPbXRxUVZDNkNhOWVGMFhCSUNUOG8zOVYvNUlxeVhwcFBHako2?=
 =?utf-8?B?ZDFGU1dtTDBPTkdKQ3JPUHkwdjl6T0ZDQ2VERGRGQ3g5ZzBIZ1dGeGlTdnRE?=
 =?utf-8?B?bUEyVUNBNk5STURKK0dBY3dJWnNrdk1icjVKMDQ3bzJXVmc3TENXT2JEQVl5?=
 =?utf-8?B?eDNIZEZsbmc4cmF5b3M5d283cU1JYWFLS3RCK0lPQW8vMkdBcTdJVk1zMmZM?=
 =?utf-8?B?OGZkYTRZTXNLTXJlR2FwTVpDZ1hDNjdYWFlqeHBaNWJpNE1lMEU0cGlXNG9M?=
 =?utf-8?B?RVR5Yi9BWDNWTDJyVDZIZ0hKMGNQRmFhZkIrYkU2TmhHWTdXUk1aK2xHY3pn?=
 =?utf-8?B?VG9yWW1lRXZGV2pndklOejllWWpMbzNTZEFwOGczK0tpZDkwUXdNT2E2bGVs?=
 =?utf-8?B?Qy81bUZONVBVNkRZam1IcmNLaUtWUlJSdmI4UjYrVFpuMzhERm4vMllSYSsx?=
 =?utf-8?B?RU9aK0tVN0FPZi9Ya0gyRjN0MXBGejNUZGNLVjJFOU1iMWRHT1Y0V0xRMlFx?=
 =?utf-8?B?VXFOMjhYa3h2SHdBbE9rSW16WnhNaUMzZG0reHFvTG41TXVPMEZVaXhmV1pY?=
 =?utf-8?B?VHB1NnZic25IYkpUQlVhM2hKNWNYeTFWc0Nscy85YmFMTEhKd2I5ZzgzZGlO?=
 =?utf-8?Q?/pkczsi4O3aQLvV6rAOlVLZvsuICT4rb8sGXdSq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmtNVVduSnFvM2NsR3pMQUlIWFRJNnpSeklsWitwaGV1amwvRGlKVEJWWmda?=
 =?utf-8?B?ZW1QUFJ5d0NCQ1hrMnYxYjYxa2lNYkU0c2pURTUwVmFoSm9oY0NwMzNyUGpx?=
 =?utf-8?B?NDFQbUY0cjloUFA5eTJJRi8rSVZPdzgxV0FqakhLRXpJRHZsamVaWGs3bnFC?=
 =?utf-8?B?M0IrK2NQc3ZpUkg3c2RHRDlMWHBJTHFadnJLMzNrNnNWOExMUytVUE5wcCtV?=
 =?utf-8?B?YnFyV2J1QTNQOHNjVC9XWklVdDRDSWRLZXVUL0NRWnhWVE5nZERUSEJDd2pk?=
 =?utf-8?B?eHdxTjhwNmRpSVhqTzk0b05ZM09qQU9KOGg4SWk2SHQ0N1p1VUNXOEQ4ZG1M?=
 =?utf-8?B?dnI2aENXTzNCMHVWOTF2TXd0ei9Kei9jOUp0TDBkcGJ2YStYKzdNUUdBSldr?=
 =?utf-8?B?QmFsV1dIdDQ5OGt5MTZzTnNIaGhyTERCRnJMdDFwMmpHMTgwcnNHTGxJM3I3?=
 =?utf-8?B?cXpRNUFqNW1KbW8zcWxwTkJ2OFNlODBGdVBzNGVQQlFSTks2OUlZQ3R1VDlG?=
 =?utf-8?B?d2tQd0M1VWFXaGMyTjA2R3ZNL1NUeTRaUVBZcnRvbWV1MzZIK1cvT2dldFNr?=
 =?utf-8?B?YThST1pCS2oyMnI5RVJ3OXZidjZvemlVRXFVVTdOUmNNN3llQ0ZqV3hBTkI3?=
 =?utf-8?B?OHJGcnVaN0hSbU4rRHpHOFZlQTh2TzNnS0RDNDhLaFNMRGhieS9CSkN1TUdV?=
 =?utf-8?B?R3pRUCtTVVZBYUd1d3hvQkZ0a3ErdlhRZmZzNE4yUDR0WjQrNWZVUUc3OFJm?=
 =?utf-8?B?NEp4NEZ5Tkk0aTBSVGdyT0tLRVE3R1FIQXZpRzZ5UDFUQlJsNmJEajQ1Y3cv?=
 =?utf-8?B?aFdCR1dJbmpsL2dpV1Z3QUpSN21BQWVuOXdFZEdoT3NpRVZBd3hNV2NpaFIr?=
 =?utf-8?B?eW9yUVZkeVpqYzNlOVFJWGRBWWNxTndHQk5ObWE1S0RwK0w0OW1LUWM0NDlW?=
 =?utf-8?B?aFJFYlM4Z3NXaG5NSFhlaXpnd1F0WVc0VGI2RzYxU3ErM0xrY1llUExRNDQw?=
 =?utf-8?B?OGthMHNvbm9uT1VGL3dRbEF5R3Z0bXNBeEN2RUJleEpTK240QU8wbTAvdnpl?=
 =?utf-8?B?ZkRTVnRxZW9LeGgzZEVSVi9iSzZZb3lBZXVIU1ZMQUNJWEd3Y0Nlc3BtODI1?=
 =?utf-8?B?b2drY2k2L0J0M2JNZmdTMk1oeTd3WmxQNVJ3VThCM0dHTktFZzNMam5tbWdu?=
 =?utf-8?B?ZVQzZXEvOHJ0SzNQL0daNXZuN1U4UTFCbVVKN2JZd0JVaXFaRGkvd2FMMXl2?=
 =?utf-8?B?QWhJcmJGRWF4NEtldDRyZm9KdkZ5VDVaNDNJOFB3R3hxOUM2VGJqWEpheXp4?=
 =?utf-8?B?RzNVVmRyL1VJTFJzRzZ0REc3Q1pPWVljaUI4WWRtcTdZcmczSlRHZ3JMQm5o?=
 =?utf-8?B?UXJjYkNhMWd0VWR0Mk5id2hRbHczRzhuWDJEVGkwcjNDZ015MFVtaHAzRWVa?=
 =?utf-8?B?R2xuWEhlZ3dGWEF5TWhiUFJ5bVVNNkYwN0doYjgzSkQrZnRXZ1BvQlBLMVJm?=
 =?utf-8?B?ZVVKM2Z4d0FvU0NYYnNJNFdSTktPbmxhY0dJNVcwdG5yaDZmb0lLak9sbXpq?=
 =?utf-8?B?dVUvMG5hZ2ZtMXZnWXNxUDZIV3p0TnAyUElFbENQUEZZTzkyRmpsZEYwWUth?=
 =?utf-8?B?U1Y5K2FkS3RjV2ljNkpPallDemFUYnBVZnc4ZEJiMzN6VDMvNmY0TFc4RkRM?=
 =?utf-8?B?SE9ubUdRdDg2bTF4cWJZVE81MXhmVFhoUUMzOUVYbWNzWTRrY0RKMDhYNC9t?=
 =?utf-8?B?VFlVbWhJU2FRQlAyeTlqZUF2N0tqT01BRXo5TDRFc2lvWlRrdUMvcjBCbmh5?=
 =?utf-8?B?UUxQU2ZtMlEwN09UWmNIQVVJRWhDR1oyUW14cXVuc0gwVjFxNjg3NzZzVFhP?=
 =?utf-8?B?eDExSVNKZFRuOGNibVBySnpPbzQ1VGU5T0lFMllta251M1U5RDNmWHIrNE1M?=
 =?utf-8?B?bStHK2hJOFlockJDWXY0ZVYxUXE2TTBvQStGZDltaVVzZ3l3YjJxc0lob0Qw?=
 =?utf-8?B?bVpNM29wNlUwR3c0Y2JjMi9FN05aUGRZak1lT3BnQ1RzNUNLWHBkdFZKMDNG?=
 =?utf-8?B?d2JJUDJXU2VxM2p5RXNNUGUxeDhITHdMTlR5a0RvRDA2SkhnZExDUnB3akEw?=
 =?utf-8?B?NVl1QWQ0SVZueTdpWWdWR3QxSGxkalluSnQzM09xU3JaVmlQdDV3OWllTUVD?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4be333-c766-41ef-35a0-08dd038a2f36
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 02:23:39.0671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7tLSqOKiR8ylb3rzz2vtCLQG9vP4vmtYNrlqUN10JHtfa6RevkAkM6Qf9zsKXGzlJJ+Gfzq++FkT5zha2w4TO342jmKIFttQlUM5EVxi/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8507

Hi Neil,
    Thanks for your advice.

On 2024/11/12 21:26, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Extend the value range of #gpio-cells property, including [2, 3],
>> to compatible with Amlogic A4 SoC and later chips's pinctrl module.
>> The early GPIO parameter number is 2, and the later GPIO parameter
>> number is 3.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   
>> .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml       | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>> index e707c222a07f..6b53577dea59 100644
>> --- 
>> a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>> @@ -36,7 +36,7 @@ $defs:
>>         gpio-controller: true
>>
>>         "#gpio-cells":
>> -        const: 2
>> +        enum: [2, 3]
>>
>>         gpio-ranges:
>>           maxItems: 1
>>
> 
> This is not what I expected, this allows 3 cells for all Amlogic pinctrl,
> which is wrong.
> 
> Instead, remove "#gpio-cells" definition from 
> amlogic,meson-pinctrl-common.yaml
> and add them in all amlogic,meson-pinctrl-XXX.yaml with const: 2, and 
> then when you
> introduce A4/A5, add a new amlogic,meson-pinctrl-a5.yaml with const: 3.
> 
Got it. Will do.
> Neil

