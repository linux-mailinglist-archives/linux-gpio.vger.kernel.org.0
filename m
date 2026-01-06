Return-Path: <linux-gpio+bounces-30186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E766CF78BA
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A755930028A9
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E65E2DA775;
	Tue,  6 Jan 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="DyFl48l0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2292D94B5;
	Tue,  6 Jan 2026 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691975; cv=fail; b=I8zw63LCMs92QavAEnxlkxvwZQ2tOWJkFN1HzEgK0hQX0AJISE0wU/Qjv51riAHEm8IYNadgZ1e9H7BGoXZWDUQXkEYWQSNp0azCzcJsxoP/YJ/P2s1wu7v3C5QtwOzp46NRt+PNm3cSmdW1gvJjBSz969Ha6zh+JVqWagOW3KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691975; c=relaxed/simple;
	bh=KMywgPV1kJpJ9Bc+Vbi9QK7CvrGao2hVUPWeZ84hsyE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MjhvuBtT21qAWyzTCuvJ+FelzdSNxFXx3vJVaowXx741AN/xlrtpo/KBTaz28H6mHdwYzPW8M/k/abGC79XhoPLY7ZBmv5+WL6RbaUqNaXdbQejpBLOLSWgcHB59um1lXPBdZj47OOuQorBBqrZmqCaqUCkktAq6zmIHmJSPig8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=DyFl48l0; arc=fail smtp.client-ip=40.107.75.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoMEuR8azlt4SmNgYl0aMVtQNIntBtE/PJSW8aReZ1SV+uxmrSjixVXHKSP8tLvCXu4QFLf3WkX2DTMSEHs1icqAs2z9Sb0FxeBe/epwTn9e5SzI3nSobKXH09ZnUo1dtIr/ZpRqXYdLEjmlj60hJcquLxB2YJ11H1QUNRP8zOIk8l/vTvwPf6ITgpXlHfHIjzcMjcsEKL3bluw4Ops6uTcpL15S5r/jDjSgmu7DSQEbSOLxyZfVtw9kz/NznR2CYhGUf/TyxivKTBibhPMH+qb/33GmSh3znkbG8VqA8JeXGpWf0oOBNU1nCECgCwHNC0pUZQNLji08gOX+rrLg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imxO/QkRe1WjdrPX4D4chSpD9AzacTKTZxKUlB+RnnM=;
 b=cdZs3MljAfdM9JJVyMRFF0sjzu1AjIO+XidynsAnu0GpNnfhuNjxydA4wvTQYOuZKfE6MmUQ7rKB+qWDHs0xyNVHkmS36pevVBr/8/xmwZnBRyc0/e5IbITIH8nJ9LJeZy2uu1Vu72akR6DxhF/PXOblUzi3bv5i0XfPZ7b7mnhAGsEbjwEamkd0bL1oflVjjI1OKnchuKiezAXg/36YCRjVjiUspsaMerdBTxo9CvW2HBhgGhhyKXbE0a3FUVPNCYvNXg3OES2LJM9ZMy3unYMjqu4FbVN3AiDW5pqHsMMdKulyhsumG08OZ4iUPesb0xsr4ulpBqVAvhTUix4YCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imxO/QkRe1WjdrPX4D4chSpD9AzacTKTZxKUlB+RnnM=;
 b=DyFl48l0kysN7VtVXvcIPWTqOLsLV5HksL9wHfl/IsHS3O/w/WE/z53HXcb7XKdLvXVKTbSYmRB7ivLMbsE+cXrYfU0tAkhpeLHhytflEWYvhIarFSBlh4FQC03XMAIl+DtYv8ruon8agTas2GaLRiB2pHvlx7bKElhTGIufy/DnaCKEAhYt6QZ04L9YAlMpLT2j1a+A2jCCPvFqcfcdTnN+e6NcSpnxoFhqTvD5Jlr5+2QKIw7GedDvM/7nQe2uxU8YstrOuDTocYI2Ul4VXh/K6C11Mlgi874o4HURq1wb3s28C9brPkPP+lWnbC13eRRb5fHhyg5l15KkfuedUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY1PPF52C9F4C99.apcprd03.prod.outlook.com (2603:1096:408::a56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 09:32:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 09:32:50 +0000
Message-ID: <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
Date: Tue, 6 Jan 2026 17:32:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as
 sleeping
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
 <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY1PPF52C9F4C99:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b69425-3252-448d-b5de-08de4d068f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2pJTW9Xby94cUovVHhuaDl2aWlpeTd1SFN6RmlnbkdYSmcvZURBdnFSdmhJ?=
 =?utf-8?B?Z0U2alQ2T1VkclpEQWV3LzJlZml2Y2IwUUhuZFpReUJKRzUwMno0Tk96ZWFv?=
 =?utf-8?B?Z0VKR0VJTUJXeVVlRnRIRHZFNUZhZGo4U2QxS0VYdXlIVG1KWEQrRy9XUk83?=
 =?utf-8?B?TjZJcUgwdEhtYnV3SDU0a3VWeDROaW9YYXZtSHRmZ2FOajlrQ01kRWdwTEds?=
 =?utf-8?B?TGRaUEV0dE5ENWJjZkNjalpVNjFmNWRDVGJ2Wm1nUEpsUkg0aVh3dmpKWXZN?=
 =?utf-8?B?ZmpTNzlCQUZSQXFkeElHUVJkTktPUU5hd2ZES1RaUk5tZjArNlVkZVg1bEk4?=
 =?utf-8?B?STQyQTlzQUdOamN5RmZEQnJFZ1JQZ1RQNXFwUjMyeTJvbkNaSTFQQW93eEto?=
 =?utf-8?B?TkxUTDVrcERGR2ZNOTlXOWlEaTJsMkpFVlVsQ1NHUTYwMk5TblFyS1d1ZHpY?=
 =?utf-8?B?VlAycEkzaHlzSTE3ZlVpcll6OHpTWE5DYVhpVEJyYkRVUWNGZU9EY3dZZTU2?=
 =?utf-8?B?aWtLN1UrTkxJSjVsRERJN21HZHA3SVBraGpaTVlqL0lHTWlNY1R0bzRDb2pC?=
 =?utf-8?B?TzEvN3k4KzRHL1NvYTFlTDB1UXlpT0ZnWk95Nm4wYm1lOWF2Q29uenVzRkdT?=
 =?utf-8?B?NE9YdVVHWDk1aGd6SnczMm9TZVlnWU5jOENhRXVuelhPNFNTYzNISUFYOEh3?=
 =?utf-8?B?T0x6U1FOOGZpTUJLUUVLNEtmUVVVaGNCZko3Um02Q2hXVklpOG1WVG1IYTJ5?=
 =?utf-8?B?TnhNRDBZdTQ2QU0yZW90Zm5ydEpNR2RNRGpaR3ViUFZGa2FsZERvVTljVXhH?=
 =?utf-8?B?RW5WVjE3YjJ6SkpRQ2lvTDdHZ1VseHpiNlprQnhURk5Ec1JZYStycXZRNlN6?=
 =?utf-8?B?dWJDYURMVUw3QmZNaWZBYlV5MHJjNGtpS2tlZEpZVkFvMkhEQVZvQ1c4UW9J?=
 =?utf-8?B?b200VXlUWkNvdU05MHlQRjBJMjIvYk1EVkN2OCs1YmxFRFA5dVpiUTJ4ZWRF?=
 =?utf-8?B?SnZFRFRZVlNGSDZHTVRWWko1T3BkZ05BV2dFUEdGdysxeHY5dWdrQnNEQ08r?=
 =?utf-8?B?d2ZKdDZHVkJwRlVDRjRUZENYYTA0NjFEN0FJRVdMVnl0aWpvc1htUXIwZTVY?=
 =?utf-8?B?TnczeXVzdEtrKzZHSnFGTWRUSjVnekJkTmg0RnRtQldFOTVaRnB2Yyt1NHZC?=
 =?utf-8?B?Q3dzQk8vcjd0WTZFcGNIdjBiVkZIdXBmc2s1ZHRCMFBCdEt5ZWs4SHJ0Rm54?=
 =?utf-8?B?MG94VFVoL1JaMFh6d05yd3BmR2V3cXNCdVN5MTdtUVVVVTc5bE5vSGtTaE9R?=
 =?utf-8?B?ZTJKOHBPMWJJLzhMa0RtZEY1dnRESHFoYzFwalZHamlDVTRIWGtrWVVyY3hD?=
 =?utf-8?B?VmNxM3d6Y2lNancxYXZwYndqcjlESWdrWXkyTVpNWmFFbEZidGlVTFR6cTFW?=
 =?utf-8?B?Z2syNjA2ZWI2UGh2YnhSc1FYa3gxSGNldXhRSDFXTG5iQVRYNHdpNllORWVQ?=
 =?utf-8?B?QWt5YjByckszY2NFZkgyNE5WSVJFV3k1c0dWeTdGYTBhbUlNZzBVTzJ0OGtj?=
 =?utf-8?B?emFnRGpFQVBaVWoyYjQ5ZzByVjVIdkxPaXpZT0ZvNEM2R0tFRmx4cjh6K0VO?=
 =?utf-8?B?dTF4QzZDVnJtTW9vQStHSTR4Q3JySEx6RDdHME1WM2JrVzU0UkMrbXkvWU9r?=
 =?utf-8?B?QUlNTHE3dHRjbnJJQmk2TllMZXoxN2VueXhZME8wL2JnN2tOcHBBSXpYcW5Q?=
 =?utf-8?B?a3VyTHN3Q0FHc1NDdXdoUUhudDRnQnRZMU5tdFBjNDRSbUZBYlhqb0tub0tU?=
 =?utf-8?B?aXA4dDl3NDMvSnRuRk4zNENQbmdINlQ4RTUzMkYyYUV6UXpvR0tUdjRVa0Vv?=
 =?utf-8?B?ZUpsRUhJeVZ5Tzg3Y3BBd2YvVDI1MWRpcGc4aFlWd1pHVnNtQjZVcGF0SGV6?=
 =?utf-8?B?cDU4UVlkeHA5M3FLeDdjeDFOOUdTSW9Bb0NvQkREOFJGRis2RmVYNkhBOXp5?=
 =?utf-8?B?MW9iRFMxc1p3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVDZnNwSjJjSGUwWGlTNzFwTmRGRDVtZC83ZFhzZytzZE1UL1FvN1FaWk0y?=
 =?utf-8?B?N2MwTFh5dkFPRm5paTM0VlBlcUo0Q0p6M3JqU1ZLc1llejFtc1YxbnpVNExO?=
 =?utf-8?B?aVl3bmxoUUNuV2k2bFBvOHJYR1VUbEFKTnBiNDVvR3AzTmxWSlBMemt6Vitx?=
 =?utf-8?B?VHBnZVJ4K3pqSkxHQ25TS3lJZVlUbzZiaEtCamVxMnVzcVJBaTcwWDJENDll?=
 =?utf-8?B?N1VOcnNLWHZ0VmxGTU0xWmViQWlqM0xGYmpteVNJRHlUOUkya0dsN1g4bW9C?=
 =?utf-8?B?aGFwcU1OTzlvV1JRaTViWjBTK2RzemVmb21adnRnN0FudTZNTlBCdEhDK2pJ?=
 =?utf-8?B?ZkRxZXV6aFFiMlVnd0R4N0dvS1ZIbWphZTA3ZkRDcjZXdTgyMlNIOEJNWHBq?=
 =?utf-8?B?a3VpY2IxTEN4bWVWTnpLMmViQmxHVFB6UlpueTl1d1U4UGtPaWFzRnZXOWV5?=
 =?utf-8?B?RGdGYW5MQ0YzZVRqVUtJMDFmNTg1eDdSMVFUaWhQS3FYR1I1QmZjb0swZWNF?=
 =?utf-8?B?cy9RekdUTEJleXF0cHdZUDQxYlJrMTlJb01KZTkvNzlZZThjK2dwdG9XaXp4?=
 =?utf-8?B?Ky81VXN3QURpUkwvVDFhaWpUbTJZNm9pUEtjbkI4S21XUk5abzFOeUd1TGNq?=
 =?utf-8?B?bUlFOENySHVGL05uWUxDZ0lpbXRRN3RwYzcvRmtUZW8yM3cvdHcreENlYSsr?=
 =?utf-8?B?b05oVUxMdXJtbHhEMXhiOC9CMWJDVklYRWdvT2hydTFSd3o0dEFYcXJUZkVZ?=
 =?utf-8?B?NC8vU0dZblNscDdlOUxyeEtkZms5ampEUElXNGNTRWt6bGlmSVVEWXFKazRq?=
 =?utf-8?B?Y2hCQVpPbjhZTmIzY3FaQ1BENWtTdlZIamFjWUs3dWVlQ01JNmNTYzBaUml6?=
 =?utf-8?B?ZkNSc3c2SzR2QUtvT1NvRXFoN2hMQzFmMXlaZWx2MFYxNy9DQ2IzL1hZS3p2?=
 =?utf-8?B?QjVFcUNjblR6ZnJTQVJTSlFWTlFGL1JqV2JvVzNHVEJnS1pyNFJ2SEJ2ZGhJ?=
 =?utf-8?B?OWlWTU9KckZQcHhtSmx5UFc5bkJURFZoaUU0OWdBejRUczV3VGFWUko2TklB?=
 =?utf-8?B?ZlFXK0xZTy91SnFiQVJtQVFzd0luZjhmWWpGdVpoQ2hqZVltVUtybXNmSW4y?=
 =?utf-8?B?VUNqY3RzRVdlSytwbnFmQ2VCTG85VDhEUFpSM0Q4Q095NVJRaEZnQ0IrQUhY?=
 =?utf-8?B?M3ExUHp3aTdYeGZrai8wOUswbXl3RHhkZjYyMTNrL2NjT1ZsZ3A5M2Vuanhm?=
 =?utf-8?B?OG9UM3BPak9Vd1V4YWtBSWVtWDdOMGVvUklnTG9qRlBMZlB6MUIyT3VqQlRR?=
 =?utf-8?B?SGhvSFdHM3A2eWJQM25TRldhcnJBSlBiSU1lV0pWNjhoSlgvZlpPQUw4bksw?=
 =?utf-8?B?eC9ONndnQ3hramtCQVB3QkJQcGNmQXRsMnEvcjRFTm81cWpoYXY3bENQWXA2?=
 =?utf-8?B?eCtPQllmTUFhRk1sK1BrRkV6K0pNSElmNU9KbVRWZCtNQWY0eEE1dVc4eFVD?=
 =?utf-8?B?Sm4wWlZMWjIxdkRxVmpwSEdVOTduQmtBNXNIYmdjaDJJUXFUdmNqQVhUUWdM?=
 =?utf-8?B?SnJYN3hDbzZZV0NBMWsweUd3VkRmME85RjBnN0NNSGk4MFVFa0kwZW1OMlp1?=
 =?utf-8?B?Tlp0bTIrazlJZXpHbllJY284MjlRb1B5K1dJam9CdW5LclVNaTNsZ2dVVkFG?=
 =?utf-8?B?d3NLLzZTNHNLUHdya3VLZnlPalAxVFQ4UGNkazVYUUdHdnFVVWEzU09kOVNk?=
 =?utf-8?B?Y0t1K1QydE9MSXdMcWQyS1IvNkJ3dXRIZU8wRUJIWlpNSGRaL2F4S0oySzIr?=
 =?utf-8?B?c2RDODFnYWdrYUtYcSsycHAycU05WktNMU90aU8rWG1OYy90MHhtUTloSnFK?=
 =?utf-8?B?Yi9mekdteVpqWWlXVEVwT3JUaGUxS0MyV0VFbDB4VzdCWmNHclp6c0c0dE1E?=
 =?utf-8?B?alNXQU1IOVM2YmIybHM2WEFJa0pqa05OL2lrOUVuZFhEQlBCQThsandEd2pX?=
 =?utf-8?B?cEhFNWtEY3BBUjFVZi9ERmFLamN0d0lVS0wxbXVoMDdJamJmZk5PbFFpTXk0?=
 =?utf-8?B?My9uU1lKRGJDanJkV1ZTVlEyVHJmRkZnZHZBL3hoem5LUk5EbG5Cb1NqNVN2?=
 =?utf-8?B?U3k2VXVEWUpTMGtuQVVmSGlkaS9hYWEvalhRTW41Z01yVTZSTGxMdDh5T3pk?=
 =?utf-8?B?MU1qK25lcTQ1ZW9mSzUrSXlVM0EzUE5vMG43YytJa1FnTDdMSHhTRDNKa1VI?=
 =?utf-8?B?dGhWMVBRMDNMVXNCd1lRMGJ4ckNLaU1EQnF0VktOU1VBYXBxRnkvODFNS3Vi?=
 =?utf-8?B?OW54anBVZDRCZ0U0cFBGVXltZFk3dGNkb2IrWG9FakNNRXR5cVMydz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b69425-3252-448d-b5de-08de4d068f60
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:32:50.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQwpO05x+QBvFl0CD5beWKniLhFSaOvMbtnp1cxAnIiwqg7QcxQviWqB10w6/Z+CSYe5gcY6SFv+ADXs5iW7s6Y7Iiw+n6sZzjeNcoERM4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF52C9F4C99

Hi Bartosz,
    Could you explain the reproduction method for this problem ?

On 2026/1/6 16:55, Neil Armstrong wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: 
> https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>    drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c 
> b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index d9e3a8d5932a..ded7b218e2ec 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
>        .direction_input        = aml_gpio_direction_input,
>        .direction_output       = aml_gpio_direction_output,
>        .get_direction          = aml_gpio_get_direction,
> -     .can_sleep              = false,
> +     .can_sleep              = true,
>    };
> 
>    static void init_bank_register_bit(struct aml_pinctrl *info,

