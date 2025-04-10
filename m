Return-Path: <linux-gpio+bounces-18664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC4A8418B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 13:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A1E9E01DF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51631281518;
	Thu, 10 Apr 2025 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="dxS8NfWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2112.outbound.protection.outlook.com [40.107.255.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628321ABDF;
	Thu, 10 Apr 2025 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744283687; cv=fail; b=h56HWRla/812VNSSfk3dInruVPdWUBItMSO2MVOqQAph5Vhdxy2EHXQC6H+Nd8+HT5FFzzXHbQ0fg4n7hOc9uvf/KCQhc3cK1FGxlQ3aA9w+sm3KPyIA47NH+bE1I2Ao7rCIhUDZIk5h5mS/QS+ZI/d3lZHAQewdZETXbcZ3SPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744283687; c=relaxed/simple;
	bh=toEXqbKo6eGKLXn3JLP7K6lG0jmsoT9cDbxoy1FE4I4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Th8Nyuo4OzRCIf9d/miEXZSd1fC4VXcIBsUPX24PJgAdfTw5Z6xV0ixvSYSTh3IFNfA3lHdymL/Wi4p8qFVJihUxBJW39ojMpqYrkbnkboXQ5fIXaa+cSF8GBJpDhfwl8mMFQZnLwFm1RRDd8RqaxwztOhNGQCH61KUbPtoJEMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=dxS8NfWN; arc=fail smtp.client-ip=40.107.255.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scgC0DSFcESvvToxJBbF+8eC33AgPtfeSOjL57po8dwC4VfkHTc+4dIoiXNm0HJMLiiiKYTdqFXjSmh6KW8PhDNKj2dbiPHanEqfJbhVSTtfn40N36RAadSqfN2u+zBi6pA437FGM+wdoVvT4X4fC3aZHoLtOP1V5SQn/Wkl3cu4USeSXTb28zIYxJstqveM/7dyOGsYcF0wfNOoQqJoq5wMa2+dFNJ4VLmZAaLBEBdm4jgq6tsOItID5yCJIyMR0R5VZpSBSaMWm2IwSUmhX2WJLSpz+wOKEu9bUVr61ZYa1QmD8LhP9u8Tl6ITzOlQ/Ezdm8GWqogY6visY/sjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6Ty5V6g7YfJERUf60P263uEGN5eTcNLk7MVDQb5ajc=;
 b=Q5Hr9NmNbj1RYaGfk03aHoktMfi+tM8dW+Dnjsn3j2SMVmqpwXpHJJaS2AvW8eZ1NyLx8G/nEKkmGhsDop11cGTazDS+rrQ5iAlOgfEYvHPX25wVuas6iAGFaV7FcxWcT2wm+EHpNzv2QcVuDfNg6i4vixusP8cAipVsl6vmLwjJbest5ztsFQS5nzJ0gYgRkRBrAyGJPdIDjyIb9qnxBo0EjkBp8CdcCvemkXdWp6c2lHuzQgKMgUlD9i9ny9g1edAPU6Gk1265tE0Zbho0DKPXcNYWlQinatYmvc0/IM8t1rbokD6JndQGm8+1PzZHvNGwQbZgE4mZZVJNve40fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6Ty5V6g7YfJERUf60P263uEGN5eTcNLk7MVDQb5ajc=;
 b=dxS8NfWN5z3kRNKyiZnvt99GKTYejyF4euFurCP09wlh310whqfyHgM70a+/2Xwyqn4H4P0Qc1c6qLRLiS/n3gWsh370hYYfxyqRWFWANDRqdA+cdLYiFQ7+dt27bJZFAROANtYQU7f8ND5obnrjUKflDv6+2pmHGc47F+VKYdijf9F/ztj/Q9CkPfDC3Jd/b5Dsgyc+NVGKfWUbCsoPUIDntsvHfhWmpTHhVDk8a+NtLdn6Zz2dnfKqCPDwBed+WIXLMli+biyxO0UMWivlAv1yAXqFhJHv7CUnmSoPUV4ixjbXDi7JE0Ff6AsPwigl1VBuHI3fsggy7oj1PYMh5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TY2PPFCBACDA68A.apcprd06.prod.outlook.com (2603:1096:408::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 11:14:40 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 11:14:40 +0000
Message-ID: <0a0f3243-7720-4c5d-9c71-c6c18286675b@portwell.com.tw>
Date: Thu, 10 Apr 2025 19:14:39 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <e0e9e958-2a04-43e8-b2e4-fdc97906fd9d@portwell.com.tw>
 <CAMRc=MensaCPF4PL3C0PgfgR=YY++KRqa3EcXzKkQFu4VftQMA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MensaCPF4PL3C0PgfgR=YY++KRqa3EcXzKkQFu4VftQMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::20) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TY2PPFCBACDA68A:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb94564-9a71-49fa-5653-08dd7820e35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z05lMERMRUlXQ3U1bmxnK3g0M0JoRENBd3hmQ05qc2Z6NTNKMDk3UXhDaGs3?=
 =?utf-8?B?TE50Y1JndlcyUng3WjhqSlk2Vk1zYVV6dC9jNHlDZXJSdFJtRmp0VVJvZlhU?=
 =?utf-8?B?aVQ2UWtyRThOcnRqSEJHV3Zjc0YyTjI0Q0FBWS8raElJM3RGQnFIQUJUUWF5?=
 =?utf-8?B?bXl3akhhak9KdE53VENMaVdUT2FaeU5FTDFUeE1vaGxWdXVKN3h5ZFlINnVy?=
 =?utf-8?B?WEh5UmpuOWFRVS80ZitPRTYyWCtPWmxXVVpQRFhTSG55cEVDYlRjeDhGNGtH?=
 =?utf-8?B?UWlHNVhieUR2UVcwOGt4RlNVeUh6WmM0dnpabjlwWFVLL3RXMVR2dXFGZzVT?=
 =?utf-8?B?cFB0ZWJ5YlZ6RnF2eXVkMDYrOFlnWnJuUllvMjROZzd1dDdzeTVaNkVsZTB0?=
 =?utf-8?B?ZnBBanlVMmJiQ0s5WFdwREtvK3doMnB1NHQwTHpKdHVMYVNOUmJobVVVaEVu?=
 =?utf-8?B?RnhhZVMwRTRFc2pINURZVEtDUmhKV3czRG9YMGtLNXlsRWlTMGcxNFRZNnlL?=
 =?utf-8?B?LzJib3h3SEZFV2ZVbTRpUkJGVHpta01vWmtLUUF6anhnRU4zTDMvcFZGVjNv?=
 =?utf-8?B?NFZHbUJpQndKUnJkYlR2aTdjVm1iWTltM3krWUdQVzdUQ1c5RHBkNE1GZWcy?=
 =?utf-8?B?eFcrb2xmOHdGZXlxT3ZMWkMrQWFCRFpyTU9LVHRNMU05Nk9saFVLTSs0Y2xW?=
 =?utf-8?B?MGVVYmdET3h5Qml6QUZvTjFuWG5PMmI2MmJVOHJJUGpkaFFrV0RjSllTREIx?=
 =?utf-8?B?M1licVdCV3ZQTXVUckdSc1lFOVZ2cStoV21sYVNRM0hldHl4S3lFZVc2QjhL?=
 =?utf-8?B?a2h5Vkt0b1lpS0phSk1HVVhCVHo5RWEwUmpLY3NWeE9Hc0EzRmIwZ2RtZ0cv?=
 =?utf-8?B?UFNjTWhpdi9UT2lEamlpWUg0RzVpL2FEZ1pQZ2xtOUE2KzhnSmo4cFdDNFFz?=
 =?utf-8?B?cUZGNENlMVBBaFRWQ01jaTZYUUdGejFtR3IvUURkUGh3MkU5alBCem5kTnRy?=
 =?utf-8?B?ZzN5M1h2VFZWaTJkMVdEdkM0enRBN1Qvc2RPQ0FRV01YQnhPVTJuYVMzbTV1?=
 =?utf-8?B?aVM5MDhTTHdDNFVLYWppVFh4K2dxSUZIbGlQSHNiS1R2eGNNU3IrTlk0OTAr?=
 =?utf-8?B?MDB5YnhOd2lNSnE2dGtlY3QyblFFeEl1WUw2T2cvdlI5eVFOWUlTNDFqV0w3?=
 =?utf-8?B?aVMxWWVhM2VpK1ZjUXRMTXpKSDFFb0hiRGtEdDlNcGxEN1hVek9FdHFNdzRh?=
 =?utf-8?B?dW50aHBVQjlFRGpZWGVkNDJlTGQyanpCYTZoN21kU21INmhjSHBEbXJDRDg4?=
 =?utf-8?B?eXhOVWliYVY4NWpuMm5LWEI3dVVEQ3B6QjNVODh1MFFLb3BHbVdJNzBUUGVJ?=
 =?utf-8?B?b3E4Y0VRY0hNNlFRSGxLamNWZm9Ld3BqdmNPaGpDdWF6cjd2N3ArWnhoRkM3?=
 =?utf-8?B?WDNKR2o4MDZIQ3NwNmlnRkF5MmUvdms3ZGhBYXJSenBzL2pVRWNtRmkwVXFS?=
 =?utf-8?B?K3kyeWxCdmhickZtRkIrWGkrWWRoQ28vWEtZY1JRZ24velBtQ292RDRvSlc5?=
 =?utf-8?B?cUdmZFBDelYzUUllT0dDNlNXcTZNeVhNQUllSmJVZ25IV0xrQ1B6ZmVyeHNK?=
 =?utf-8?B?aStFT1Z6eXE4bnlNYU1idi9aY2FiS2dZbExyYU9mZ0tNQ1VhRVNybldmTFRl?=
 =?utf-8?B?Mld0bFhxREJsTmRFV0tyVCs1TWR1WExHa0VXUlB2VERRZ2I4Qm5zeHRxY01X?=
 =?utf-8?B?eFBQOE45MWUxbXNYblB3OHhZNmNaY1BITVFPRWJBcDkxYjZiNzdFMWc5eGtS?=
 =?utf-8?B?amlBekxBUm04cWl1NDdicTFiY2RoZ05lakk2bTdja2oxN1pETFAzRVhHRm1N?=
 =?utf-8?Q?4nEParvi9GRT6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDJDTFduL3BWenFKZ0R2cWxacjdVbnJRUWF4RGpFck5LTTYrN3hobC8zblli?=
 =?utf-8?B?TzZJd2luNmRoQlRLSFp1YUh5WXhaZ1M1czdLekhMeVRXbXVlODBrYnduZVdO?=
 =?utf-8?B?dCtJRWxITVN4WTFjZXlCbjVaL1p5NWRzYTRkR1B0MzZocm5EZUxsamJMTmdX?=
 =?utf-8?B?WWl0N1FBUDI4Y0JPbHZkZVkxemY1UTBqbGJYS2xQT2FoV2xoOVRjRllHNVNx?=
 =?utf-8?B?VDZBaDJOMFlNZDFDUFRjZEdzVWR4RXpqUElMbm0xOFpvc2JBa2ViQiticVBH?=
 =?utf-8?B?dTh6VEY5aW1WOFQvVkFQVEZwb0VTcmMyZXRDdlVUZ25jK2tTODM5OUJwdHlQ?=
 =?utf-8?B?ZGRsRTRNQ1A3UlZIQUY2TStpYzVuKzVDTVlNUVk1ZmxZUDhPRTl1MTJaejF6?=
 =?utf-8?B?N05rSzA1c2JWOUNlUlNkcHhOd3V2WW54b2dmM094amk0anZ2RWxTb1IrdlVx?=
 =?utf-8?B?MWlnRGViMnBIdHJvcWFoTW9kVExnWnZQUEo3YndlN0lMUjFHUnpjNkc2ajV0?=
 =?utf-8?B?NTAvanVrVHNWbi94eVJRbnJIeFhocEptbWhPU0Z3TENDY0hRTXJ6WHRSVTM5?=
 =?utf-8?B?Q1JTMFpXRDdPR0dLeUhvdDdRV3pDeGkvYURiUk01WHJ5OSswMmFDNFFaK0NW?=
 =?utf-8?B?UmpvbzE5Z1hCeDM1S0JtdXhJYWh1dlMzUU4zV0cxMkZrVDNHVitsWW5peUtJ?=
 =?utf-8?B?aTAweDdvbThIak9QOUJhUXpGNDYvaFNsQjFUd1VIblc1RE1MRlBFTE5LRUJU?=
 =?utf-8?B?azJTOXdSWjJtSXNkT25GeURkUU8wQmJwOTZVNzVIRkVWZ0dNNVJzMnNXSGo5?=
 =?utf-8?B?YUlOcnd4RWJKMTVKMkxLeXA0aXJqd1N4QmtRZmNMbkZueVVnMFlpWDIyWTcw?=
 =?utf-8?B?R3BtRjAyUTZZNVZHWWhhTGp2cWJzYW13aU80RlJPL1A2T0tDcng0Y1NNVWdp?=
 =?utf-8?B?TzdRRmVmdlc0RDVXNTk5U2RtMFoyUi80Wm84ekIvRGVXM3RqaEVqL0hobHN6?=
 =?utf-8?B?YzRWN055akx2THZjY1RMbEQrbWN5bXhQa2VXOUdvNVVRMjhuWlMzTndCcTc5?=
 =?utf-8?B?UWc5bTRQWERPWTRNLzRvYy84b1o0d241UytNUFRJcFJxaGwxMm1TbjFZR3Zq?=
 =?utf-8?B?VGZuUDR1UWxCbzQ2MWVRQUkvbzJLYi9hNGoxMzNpYmc1STd0aDYyWllNTjlx?=
 =?utf-8?B?WHJxSzhaSzdhMEE2TitlQVZ0K1kyZTNYQkY2RlNPbVE5Z2tyb0drdkx4S2sr?=
 =?utf-8?B?SEYxTDdZS3R2eCt4SUI0WDJ4QmRHL3VnckErU3E1YUU0YmJCbThwVkFaVzVi?=
 =?utf-8?B?VEovc01LU01NZml0RTRVdVJ5T3pxWWVwKzdVQzg4L0cxd3RjYmRodDJYZXUr?=
 =?utf-8?B?elh2Rnc4VUJQMnpWQ2hwSFhDRjVDOGZwajFxcTZGbVVqemRlNEJ5WG9XMDR3?=
 =?utf-8?B?ZVdhNFZCNEpYNmZKYkhMQ3pEbUNVeHl1K2laWWxLUHNGYktjTmlMMFg2YkJk?=
 =?utf-8?B?MVFqYTJCWnhLQ2JGZm5oTnllRHRUZnhJOXZMS3EyWEhDc0xocDVBdzlTRVVy?=
 =?utf-8?B?WFk0U0M3d1JVa2dQUDBBRUhYcTRDcU5Qc3B2T0FUS25UTXlaRENQc2gyREdv?=
 =?utf-8?B?QWZMKzRsam5sMkhJb25kN0dqTzhHQ0dPWmVRUUdqMk5tZWlFdHhUelk2SGlp?=
 =?utf-8?B?Sk9mRG41WmtJaFdwT2h5blZkcjlBaG1RZEhEYlExbktkR3FFQzViOUo1R0Fl?=
 =?utf-8?B?OXo3c1dnS3VmSkQwU2QwY01pYXdWcmFIZ2JkL0FlZTZvNE9lTUxuQ3hUTzNl?=
 =?utf-8?B?Q25JbVlZbG5VYjc0aEFBcllBcTBIQ3RRS2Vyd1RtTkZXdllVYWFVa25tTFBk?=
 =?utf-8?B?UTZLOHMzRzNHeThvYUlqZXB0TUVMSVk0RXpDdjF5bGpxUVdBbDl6SHhMVFFQ?=
 =?utf-8?B?eEt1TENsc2RtelV3WmI4R0JEeTdMVTEySUZ5RmtyNlZPc29CN0VXODVveitD?=
 =?utf-8?B?ZHZTTlpKQStGdTNLQnlGSUhoRnR0WnRxUS9FMk1GbVNYWlRJYll6aXBlUmpJ?=
 =?utf-8?B?dCtqTHU4aGFPSWsvOXVqc0NKTTF4OEw1VDk2R1ZXUDVselNqbHRhOXAxMGF4?=
 =?utf-8?B?Vm94NFFVeUJXMnpucXdEelQ1YlVPblZhMGdQUzEvTVpxcldoeEhsbjdYMk9a?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb94564-9a71-49fa-5653-08dd7820e35e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 11:14:40.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DJheF3M98kCukr41voRWRAgMkr42KZWq8UWvNxy/YADaZbie7vfD5ceZluoMNRdBZ0oFDgpww5VoDa99N8U/o8mItqHq2kK76Em642P2Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFCBACDA68A

Hi Bartosz,

Thank you for the review!

On 09/04/2025 7:46 PM, Bartosz Golaszewski wrote:
> On Wed, Apr 9, 2025 at 1:26 PM Yen-Chi Huang
> <jesse.huang@portwell.com.tw> wrote:

>> +static struct gpio_chip pwec_gpio_chip = {
>> +       .label = "portwell-ec-gpio",
>> +       .get_direction = pwec_gpio_get_direction,
>> +       .direction_input = pwec_gpio_direction_input,
>> +       .direction_output = pwec_gpio_direction_output,
>> +       .get = pwec_gpio_get,
>> +       .set = pwec_gpio_set,
> 
> Please use the set_rv() variant, set() is deprecated as of v6.15-rc1.
> 

Will update to `.set_rv` callback in v3.

>> +static int __init pwec_init(void)
>> +{
> 
> I'm not an expert in x86 platform drivers but shouldn't this be
> implemented as an actual platform driver, not a hand-coded
> quasi-driver?
> 
> Bart
> 

Will update the driver to use `platform_driver` in v3.

Best regards,  
Yen-Chi

