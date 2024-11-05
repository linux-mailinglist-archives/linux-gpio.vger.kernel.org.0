Return-Path: <linux-gpio+bounces-12563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE459BCCF7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D386A281C32
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 12:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99771D5148;
	Tue,  5 Nov 2024 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nr+tbtsh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2049.outbound.protection.outlook.com [40.107.104.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3591D1F71
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810593; cv=fail; b=H0pDOkN+y/wdTh1eAGgWfjWxb+Z9lUB9U94Jkop3+ZQYKeGX9KW8fDKiaFB5nhxMmt5Ua7HEJPI/1C24R9QxVi8vTkK2I2mUB7Y9RyeTIl8dED4ftE3FYtJh+KQNSzxFQrc+xJ1USiwGRANRCXV6y7kZ6gkLzR0pxM0UW/5REfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810593; c=relaxed/simple;
	bh=mM2NSJhNPoULXCMM+G3OL+xsDThMYq6qZA8jrp/N7EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q7waQawsUyT9x12eWLmriHp3vAd+3pTSh+1ynVJ018+3CPgfakzYKrK3A0Yl6Df2gLXWsdFvK5vGh7t4HBWheHcrD3r6zcxZXSKxe7fXnfjt4LmS0vAIOTSMxYTslvHs0iJZt/vb2ltKEpu+uj70PV/HHVTQW3t0n6yis/H43aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nr+tbtsh; arc=fail smtp.client-ip=40.107.104.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCVWmAQPvRG75Yxg6+MBy9hkFenZzhseR4rMOk4g6/NZfyBxgxtRb+tSlprGcA1dl6uuDKwFeCOo8sLIMI0qgBemya0kuJDXHWi8DKa0+EKwFRY1w+L4FKDHyNhNfZprBry6mnW8h4mne+ZiuFKW5gdK3bbzlokuYLEn2kwluVNHKZSMe27aRA+YAva4Ln2roh+ZKn6oMpO0Yii/vqSs+/HWgU5+lP+9UmLlbIRrH/gCE4mX+zIiJ7P8zsDmvJ+Mpl5JFazEIPh1EZzNyK07+sxN7BoZuOn3Tvm7TxspguwnG84ICfUKbjvqOmhC4FI2neak13LBjRpcnVSRTjhinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn9Ao0H0NGp2TYYYyPx/YUJhD3A7mq3nqvTVHjDC4uE=;
 b=hZqPC/7ns/H7wPiVsG4iXowWP6XTsXwWITr+nXLOFt2jSdVL1CexpJWZrZKFiY/geirSpUmMspzSVL92ZcxYqsqgYPXy3v6Q3761Npvxvtg6a4H5lTK34z8DP0p9RguvWvENal6UOvK0eKEEN1/lzg7v5mDXK5TFgEk8E/4yGL4COzWmQMQ8J/0JVIWXuR6U6ID/rA0AG8H6bTxy39F9QF6aXlmlk/d149SgXiRl1G44SJxJNnl1B3huN8tUyQJb5CBNWQ76lVGlYd9+XJJnYwuseO/2YvKxfbzWK4xzbXBCKA9L+u/BBdE1Rpku4IBFsHrXV3ohYiwncebDGSgFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn9Ao0H0NGp2TYYYyPx/YUJhD3A7mq3nqvTVHjDC4uE=;
 b=Nr+tbtshoWK5uGvzY+Z49B3jiWAG64wPxRLoEie89Mhl2wGF5KAeSRrrCX6t2V56FJIlb2Ql5CH3oZHiTh+//XweoXe5fP4rPZAdMqOHXxnSaSDRe1pXPSzwQSVTf0jhZC6jF0Cv0dlsmLLwDBbbsC5nTJBDMkkaAFntQoFkue/cKyP0pTPPHJZtYeSTyZg9PeTit9biNi5EZ6T7EKETnF828WygZn9xcOGH6sKPnfMQcBAhFR6r5bLWvNQNM8xnrnKE9vEJDct7tM7NuDOaafkndkU8JxNUVDPXDftPU0VEuDJ/ODi/E11Ufv5e6noMga/obvlUGSVhEQ3SB4dRPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB10011.eurprd04.prod.outlook.com (2603:10a6:10:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 12:43:07 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 12:43:07 +0000
Date: Tue, 5 Nov 2024 14:43:03 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: GPIO forwarding question
Message-ID: <skat2d5p7jcugkvjsq2aqoj34qjb7mkcafaipaibs7n7zgxwow@gqokhpkzv6i5>
References: <isb6f4jduu7utcs7a7hc6gw3ttk5ovxxz2domwjjx5zvhyrima@snw6jc2ghdlx>
 <CACRpkdaRpYDS9qj0K4hEM9VFfG1rxM+OSZZNiVjgdbHrxiFDRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaRpYDS9qj0K4hEM9VFfG1rxM+OSZZNiVjgdbHrxiFDRg@mail.gmail.com>
X-ClientProxiedBy: AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::33) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB10011:EE_
X-MS-Office365-Filtering-Correlation-Id: 4567cf56-207b-4a87-1b2d-08dcfd9765b6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW5yYnJrMjJNN3FVMS9qa1lKQTFWanBSTFZtV3FIbnFVc3I5anR2QlBzbGpo?=
 =?utf-8?B?enIvMDIyVFhuMjl0bkZnWE5pV3BnOWh3dUlNTWk4elkwUzNwM1hkekZKZ3FC?=
 =?utf-8?B?cXdnNnpIOEE1Vk9CRHFaSnM0amEzOHpWQWdGOXdpZm5FbnZtUnRZdE9ZT0dS?=
 =?utf-8?B?eGNwZm9GRGcyTmhUaURzaHhjbWRIRURoSjdNdml6YjZrb0grNUJPb2VNRGg3?=
 =?utf-8?B?Q0pXUU55aHVFVDg1ZXZ1Z0hZcmMzTFBPUHkyR2RxOEdtbUpwUGVSWGpSYnNy?=
 =?utf-8?B?NUp6SlBlbytZYkwrQ3pjSlJoczlqM2ZoenM5WmZmQkt5cG9tSzdxUGxwWVE0?=
 =?utf-8?B?Y0lRbU9PMC9XRXBoWSsrQllIOHBFL2RDdEFNbTdFUy85SXprZ0xQRXRvMk9z?=
 =?utf-8?B?bGVyWGpqSHB5Tlh2YldCU21BRzk2eXJ3Q3lYM0YvTC90RFc0WmFybCtJZzMv?=
 =?utf-8?B?d1hLMHFxK3ZpdlJ0RUlTSUlaMEdhWndYNXdPSDcrSHFEb1VoODdpNHkrUGFN?=
 =?utf-8?B?ZmRjQWNCakFlSk84Z1RRVjRNK2s5U2tXZEc2V2ZXcWN4dkpxVjhIWjVNWUw4?=
 =?utf-8?B?NC9pOFYyU2dZaklHVlZURHJYZGs0VnhLVHUxbHMyeWdLZDdPMDZOQ0ZQMFlJ?=
 =?utf-8?B?b2IvWnhJS0QzN3I0Q3BSdU55akNDK3BtUFNXS2Q5cVB1KzNUZ2NwZ0RpUW1S?=
 =?utf-8?B?dmxqZU5TK1h4Y3NWU1JXQWJHbUtibUFUZTY0QUhTcnBJSkJ1d05JK1pWMTdt?=
 =?utf-8?B?TTlqaDdVR1VFS0Z6ZEJ1L3AzeW5CNGJwVHRhQmVFT1dlYll3NjE0Y1RtR2hz?=
 =?utf-8?B?VGl2Zm1mem42OU9TWmNwSVFKYTl5SFZ4RWFvdTJhdW1GcVFPNU1RekF4WDlV?=
 =?utf-8?B?aXRlaTZWSDZUMVJZRnpjRWxwUENWVm90ZGxtS3c4cmRZZWFraWlLdTRWUlJM?=
 =?utf-8?B?TVFyUSt2bWl2RWt0ZFJSRjZjWHE5K3FnRWRYZHVicnVTVklMYnNBVmFLTlNz?=
 =?utf-8?B?Q2VKeldCbVpObFdFL08wQnlDT3lKU0ZhNkdOOHFheGdVSTZGZVBGL3FnVEVv?=
 =?utf-8?B?NWNldFFCa2NuK01YamhPWjdjdkpwcmMwODd4WVZrOGIwZklmUElSRlIwa21p?=
 =?utf-8?B?ZFVmdlptaklrTmpId1JMVmtJZWVkWTBSNWs0Y1lYY09mZitiMmVMeVV1dzNS?=
 =?utf-8?B?RFF1a1l5OGlEdG9lN0p2QXR2RmU1WFA0ODl2ckdnc00ybEcxUHJXRGRCZ2Jo?=
 =?utf-8?B?S3BSdUI2NExZTW9Ed0pFTEtFcnVVZGI4aVlpNTN5SzZ4MGVwQWhSc2JlV0Ry?=
 =?utf-8?B?cTJyRC9OK0xObFM5ejU5aTQ2NUNPQzRTWFdOekozZmNMNnR4SFlUNTZKNlVq?=
 =?utf-8?B?dS9La3RhZVV5MFcvSGFDUklqL1NXQXdoZWE2My9MK3J5NGxaSnp0SE9qdy9K?=
 =?utf-8?B?NVkxTUo3c3FZQ2UrRGNWYmtEY1BFR2lZMjVFVmcrckduR21iTXQ4MTJ2cEtr?=
 =?utf-8?B?b3ppNjBKckVNNDJLMC9kOE96Q3Urenk0dzJPeHZuOEhPTWNQYzZOZGpmbXp3?=
 =?utf-8?B?WW9qdTZhSnBEbEEzTk9UNmdsRFdMMENOUVFuNDFxaTN2UXhZVzdUNWsxL3pX?=
 =?utf-8?B?ZTJOdkx2RG5RM2UyNkhBc2JTZmVPUUJUT0ZwbFZEUmI2djhLWk1qQ3BpeWJx?=
 =?utf-8?B?YlRNYk9zMjRTeW1HQmNYODZEWWtJMVY4YjRoNHVkeHQwTU5abW81UCtnUWRa?=
 =?utf-8?Q?lMvQJt84LvRsS9Kd6hsDTYfNtkRmpcGzOoXdEdP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmtNbmRZMDAwYTI2YkVTQ1JYRXlMOG9YZHJDNGVhTitIc1RGRHhEL1Z4VGd6?=
 =?utf-8?B?V05QRmwvelBBbC93WjVXTjl2aEdHSmRITVNxRi9ZOWN3ZFdZUnR3MGw1dFd1?=
 =?utf-8?B?VE5aMWNXQ2piZWd3SThZYlVtZnBDM3J6NXdBQjhDTTRNcTVNY0RGc09BdnFu?=
 =?utf-8?B?Q1JKb1AvRHo1SlhvaFg3U3FIbVlTYlN6YWNveGQ4SEgzZGpMSkNxTytsbkc0?=
 =?utf-8?B?dWNNc0tabng3ZjhlSFpsMlBaeUVsWnZCRElNOFA2VlIyR2hEL3BES21wNUtG?=
 =?utf-8?B?ODh6SHhRTnJSSU1EMWJxRUU4bEc4ZXZhOGlCZkRMNXU4MlczdjRxOUNWbUw1?=
 =?utf-8?B?ckFWekt3NnhEVmFyVUFuYXp0bTN2eEd0YStqVXhJZmZ6UUQyZmNidlFjYnNI?=
 =?utf-8?B?d0JZZ0h5RHdRNncwQTkyWVlXT0lHMTVodGZJQ2hBa0V5dWxnNWlXczV6clQy?=
 =?utf-8?B?cnRsemMrTzFUem41dzNVdFA1cVBDeERvMnlpcnVtZnNPTjl1dUhTZjBnTkxl?=
 =?utf-8?B?MnlpSDFoMWlXdXpvdmwrZUVqUWxMU0VzRTJIYldoN0hScEs4cTY0UGg2N3di?=
 =?utf-8?B?WE41VDdIdXNKQUJoVkd3UjliZDRDRHZZVnVsVkkyM0lENWZJM0lKcFFWNEp6?=
 =?utf-8?B?RXUydURCK3JXaThmTVlWVGZCYzN1b3pJMlhTdERnTHZGM0R5MjFwMzJpRmtE?=
 =?utf-8?B?dGZSYjhCcGwyVmt5RUhFaVgvNzFwMmlWWTRDcDh0d2hCWnNBNktqOTJvSS9n?=
 =?utf-8?B?NWZSZXAxM0dPUlpCQ01wQ1AxU0l5K3NtZFNFN2d6U2NPTDdMNytuSnJPSm80?=
 =?utf-8?B?bUE4ZWVadkF4ZnkzWTZZam1uZ05TeGRpTUJVZ0pvUWp5UnJjYkVyUDZtcE5u?=
 =?utf-8?B?SVp5UEJ1VDVwbVRrZU1JMDFmcTJ6cS9xMWFEd2d0ZVJYT1lBL1VHU1lZRThz?=
 =?utf-8?B?T3R2aytRQWYzdzhMNlpjZTFRb3JZKzFHcWo4TVFSRnhwTTZROER5WkpBZW1a?=
 =?utf-8?B?UjNCcFNrdnBuKzV2Z25JZ3AySkpmZUtDSzJxTzA3YmxGYXVicmJEcEMrUTFB?=
 =?utf-8?B?UC8xcDFkTmtNeXVBUXAyaENCSzlhZit5b05ZcXdRWHNOSFl4clQrZlhKTitZ?=
 =?utf-8?B?TmJhbU5keEN1QVlGNWxoTVY0dGcwVFZaaS9wSHJIMmRIdzkzQ0lSV2FNY3I2?=
 =?utf-8?B?MFozYnV3NEJBV3FZUFk3NExGRHBwNFdZRm5Vc2JDNm5MTlcvVDAydGg5ZlRX?=
 =?utf-8?B?bHd4T2ptbXJ3eHoycWNYTFkzT0JOYlVpanZEZWhkSFB2ZHFwaFEyWVdTd0du?=
 =?utf-8?B?T0lsWEwrNEV0eHBma3Ywa242MlRiSmg1RldJbVlUR1NTSlJIVGVNVzcrYkZD?=
 =?utf-8?B?TjgrYWhxdHBPMU9WK2R3WVVVbHNGbi9FUk41R2l4TXdYdFVaK2xyajVvVXU5?=
 =?utf-8?B?dk9TUDVGdVpocjl1cjJLblBaSjMrN2JZQU5ETlkwR0FUWjBMeUVpQlBuTUhO?=
 =?utf-8?B?c1BGWTVVeXF0eXZrRlY5blVzVmpjYUFNT3VlM1FmWFIvZ2IzM2QzYVY1anFn?=
 =?utf-8?B?UklWaHM1VkhqbmV3VjBPanlYazRBcVcwcWtWS3d0aHFGdUV5OHIxdjNDd1RQ?=
 =?utf-8?B?L2pSSzN5OHFyRjFlQmZRUjZkaFBWNWVlYWZoaGJrOU1tWGJScHVsU3RzQjR6?=
 =?utf-8?B?ZDhpeU1GYkUyc3FTMkJPMDRSQkxaKzdaa0lUdE5Qb1lLeDZnTUNpVFlWVWdK?=
 =?utf-8?B?bWRPOEtOeXVPdVJXY2NWMG56ZjA0ZFhMNWR3TXdHZlZPZVZvSFM4RVVvOFhL?=
 =?utf-8?B?bnJpUHNLMUtsU0w2WXhFSUJRL2JQZ0szbjBDQjdvOS84REk4V1dSVEk3NG5K?=
 =?utf-8?B?dVoyNjU2U3o2UW45YVlUeFkzMVl4enp6K0I2YklSM29LS3daRk1HakJNMUsy?=
 =?utf-8?B?Qm5idDNHeUIzRlFjU21HUzVwQzhFQVdZZHp4RW53QjBlR0xZVGlTWjlxaG1w?=
 =?utf-8?B?SUoreERnVTZPTlhkN2FlNjRQeHdTRWU4MVZFWE9qUHhsaVN1L2RuR20vWHdZ?=
 =?utf-8?B?M2xBZzM1WFRFT3J1cXhzM0dkaXVNSlg3QWJXNk5HLzhpd1FwTjRnL0h5MWRw?=
 =?utf-8?B?WkxaWmNlV256WUFDSk9kY2EzbENPV1NST1BVOGs5RjdQVlY5YXVhYW1QaUVN?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4567cf56-207b-4a87-1b2d-08dcfd9765b6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 12:43:07.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk+aGh3N61x0hx57tIMbqUsz925fSUoG4SZgiYFXJYwKdGrjz4uVS71ec5dd8cq0wVQj13u5C5MVZ5pz7xp2Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10011

On Tue, Nov 05, 2024 at 11:00:21AM +0100, Linus Walleij wrote:
> On Mon, Nov 4, 2024 at 4:17 PM Laurentiu Palcu
> <laurentiu.palcu@oss.nxp.com> wrote:
> 
> > We're working with some Analog Devices SerDes chips which provide "reliable
> > transport of high-resolution digital video for camera and display-based
> > applications" over a GMSL link [1]. But, besides video data, they can also
> > transport audio data, control (I2C) and GPIO.
> >
> > We have some drivers downstream that I intend to upstream but there's one
> > particular issue I don't know how to do it right: GPIO forwarding. Below are 2
> > examples of how we use this feature. For the sake of not complicating the
> > diagrams I only show the SoC on the left leaving out the I2C and other data
> > connections.
> >
> > A)
> >      |       +-----+            +-----+
> >      |  (1) _|Rx   |            |   Tx|_ (1)
> >      |       |     |            |     |
> > SoC  |       | Ser |=== GMSL ===| Des |
> >      |  (2) _|Tx   |            |   Rx|_ (2)
> >      |       |     |            |     |
> >      |       +-----+            +-----+
> >
> > So, in the first, simplified, scenario, any transitions on the Rx pin (1) of
> > Ser chip will be replicated on the Tx pin (1) of Des chip. And vice versa,
> > anything happening on Rx pin (2) of Des chip will be replicated on the Tx pin
> > (2) of Ser chip. To make things more complicated, transitions on one GPIO pin
> > can even be sent to more pins on the other side...
> 
> This is just a big confusion for me because you are giving a UART
> example and then saying this is a GPIO example.
> 
> I think it's a terminology problem:
> 
> What Linux mean with "GPIO" is
> - A number of lines which are software-controlled
> - May go into high or low state on request of a consumer (such as
>   a driver)
> - May be read by software to be high or low.
> - Optionally supports interrupts triggered for input lines.
> - Optionally supports biasing and other things.
> 
> I think you have confused terminology used by hardware designers.
> What hardware designers mean with GPIO is "some wire we use for
> different things". This is not the same as what Linux GPIO means.
> Compare for example the pin control subsystem which is about
> pin multiplexing, which is something that some hardware designers
> unhelpfully call "GPIO".whe

I guess I chose the example badly as it does, indeed, resemble UART...

However, even though those pins are MFPs (multi-function pins), it's the
GPIO functionality I'm referring to. An input GPIO value can be (or not)
tunneled on the other side of the GMSL link. So, a GPIO pin on either of
the chips can be controlled by the host in the way Linux means it or it
can be forwarded. If we choose to use gpiochip API in the drivers, we'll
be able to control those pins in the Linux GPIO way. Which is fine. But,
I'm totally lost when it comes to the forwarding functionality.

I think this brief section of the specs does a better job explaining the
functionality than I did... See page 95 of the following doc:

https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Thanks,
Laurentiu

> 
> For this specific usecase, however, I suggest you look into
> drivers/mux which is the multiplexer subsystem, it looks closest
> to what you want to do, though I don't know much about muxes
> myself.
> 
> Yours,
> Linus Walleij

