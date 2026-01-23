Return-Path: <linux-gpio+bounces-30973-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIX3CwxAc2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30973-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:31:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E375773632
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C792304502D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9A934DCFD;
	Fri, 23 Jan 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uaXbYquk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF2305E32;
	Fri, 23 Jan 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160544; cv=fail; b=fimNmHhhZmdPe2DxE3/96M/nROtmJjYBUNkzS6QVZtvhPL+rEZ8CGG02XBiFlU/bJ/r/rqlu/dU9ftW7XGqK6M8rgOZ2U5erC1YX2Hu725UddWLuQDivWT6BenSrWe0XOkTFXlQtEAqHuGc0fr4Hu7dtg/vPtSwat/YrYjUuook=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160544; c=relaxed/simple;
	bh=qbFUChqOjUChqgQ0D8cSEqyWNUvR9/cJvE3b1dZsxBc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MTud1JPIj49CoRLl+EihusqdxY95UsZ1ZC3m/Deky9f2YvjQuZPGUjXWM1gbzlCV1SvbonRPXF5LreblFLZ/pwTUeY9Dgr3FeiDJEBMZvn4bgKLBky5TjFO8JOSfrNbrOlxq3qeio6Ll0lckCNNJTUYwMyf+oqUUUf822Zka/xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uaXbYquk; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiDu/izR5IPyX8M/RRIHbzSh2XqfzpDcsooM8In++KX3y0ao/KJJABu6lrxT2Dc1xLN3WVHjBxZHo+Z/5ySjK/KcZCDF5Qeo6VzD1jT6lrgW74EqYlQlXAWlDcLqp7j7E1OhpsGE2jnzekdDHU4MXtlUBb6hOrvjRoD1U8LU/dOsUEnE9futTB35UUB29SbLajZaxoaJiFTXXjJuN4aGtwhznQ6nvCMpspUJL4uhZ0QmmP/J2xz2WP4dE2uDeI4cxFoExJLwXlZWEVqvXk6B8eEEkuB+C8xQgrimjYBz+SS3y6itbbnMC3vWV1PSZ3cn+93XU9WFSQnwv2duyLbnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFEnccgYJTXx24/4MlQMCPv88qcL5ttVkdraf7DXUn8=;
 b=pUoi+L0bxCE885qTYCHaLkiNEeIVGEqBJEwiGZObzTtFfeQCThdu4xhQepGIvPg3gvgFHvS6PTDdrquLQoGR4SaZNRN5vTgL2Ntn6wIsnEUSRpK2GIOCw6k+uDxmH1Og7cnJR38Ro4o61i0rG/lzMJwJdJe2L6x2bUCOpbWHOvECSmSWZgma68HprOe5DgM1Zw0O8CPC3pbC9ydehk25fAXk2g4J4siB3VoB4hJmrlcE9JzDcFXds0VmJnMvVKdAqL5K6yLSzL6XDBCoxHjBOg9XEas5bWLvVHI0I5YvBlHmgU+E/DHOE9vAOKoH70f+J6q0WahkHPZ80UmnV0GwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFEnccgYJTXx24/4MlQMCPv88qcL5ttVkdraf7DXUn8=;
 b=uaXbYquk2RRbjuDnKTdyCpQyUZkOzSa//CUFEkSTBCl5CCfrxTl4Htb/FCLbDSWV7jFfj5qqtfBKrI+qlJfWQuNcM4DpKVGccrL6E/Lnv5SYT2IcotAT0eaRCX9zijxxj+pxOKfhkv2huMd0UZz5rWa34GCdbJlHkKAijT6x86/hrV7L6GYjq0FbHIb9kBnqB9m9AsoxQ/4R9VjOLYna+AqDm3XyIrWiXgKb7O0cV7eAnt9LaD6GzjBO7SgxekmLQyF/FmpREhO/URqHrSZPYTJEGRA3b5OUs1GKpxebkGhl6z1Wc0bf4WdNOvkefWkhrwZzF/23TVpUNKEsJXQslQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 09:28:59 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:28:58 +0000
Message-ID: <f4babc6e-2f8f-463d-aa40-9df97621b5e8@nvidia.com>
Date: Fri, 23 Jan 2026 09:28:51 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] gpio: tegra186: Add support for Tegra264
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, brgl@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 robh@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123064140.1095946-1-pshete@nvidia.com>
 <20260123064140.1095946-2-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260123064140.1095946-2-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: fb82f288-e245-447e-5b0a-08de5a61d5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFhGWlJIVzJTbTFUcHU5bGk2WHFseHhSenhCWHhLNWt3QzFGLzEyVUZrTklj?=
 =?utf-8?B?aXR2TE9FeTdwK3d6WEloTHZ6MC94M2ZrZ1FoTTJsOXhoYjV4dnJyZ2xJRFZJ?=
 =?utf-8?B?Z2JtV1NTZmo5Y2RKZHMyV24zdzRYb3BYWDF6SWVWZXltcUExNkYwY2F6L1do?=
 =?utf-8?B?ZzZIZnNBUzdnWGp2Z3dBRC84TDBqQmNCdm1XUkZuOFZpVjI1RFVtZDJ0WWZr?=
 =?utf-8?B?emJDK0Z3aW92eTI5WUxWSENJR044U2ZGcUR5bEFGVU9OYVFPQ2ZFRXRkV1BX?=
 =?utf-8?B?UjZXTCtuTnAyUEJ4RVR4R1ZKQ3g2bHRxYUphc3VSclRMMU1pRDJGZEV3R2JE?=
 =?utf-8?B?OHZNdWtaelVXTXJiT25zeDU4TnF4K0p0SWFaaERZeEZzWEF0YnFmTkgrNElx?=
 =?utf-8?B?MVVYYUpSTW9lY2N5RWtHc2gvOUtoOTc4eWo1UjdaaGxhWWlPTXF2ZkVCdEEz?=
 =?utf-8?B?WWNUa1Q4MnYrWXFyV3NKbW8xbFVHU0EzeDlycndHL0E4NFpHbUxTWU93bXd4?=
 =?utf-8?B?N0I3RUc4eXFMSFJ6c20wR0wyREVzV3lOS3pzQjh3YUg0MmNINTIxTjBFZld5?=
 =?utf-8?B?TG9vUmZsdllrQy9ialhlajFNd2ZvWUNiV3ArTEt4b21RdWdJZDl0UVlXenNy?=
 =?utf-8?B?MG41Q1RhMkYwNndtbTArZlA2b01jT3VoOG0xNVFoeDloa1VHMG9GanVSVitq?=
 =?utf-8?B?a0FJOE5EaFdQZWFpQXlmMmR5QTdZVXM5NFFhNHRvbFBBNlNSb0wrWmh5ZVAv?=
 =?utf-8?B?ZzdaVG11MkdLV0ljb21oTkxuVTJiNDRvZFF2SFhWRW5iVzZRSFY1RGVLdFNS?=
 =?utf-8?B?RDFhVXdyMnh4NUFFSWxwVEplbUFmaEQyK0Y2UHFYNkFaSml5U041d2dMdnF0?=
 =?utf-8?B?Ymx6dk5WTDZ5aEZsVXNzUVIxelQ4cFlkcmNQL2xyRnJKZnNUblVEemlONTB2?=
 =?utf-8?B?WmpnNVlPbWV5aVpDSnZjNjJPY1pqcnluM2ZGSWpsUmJxcC9IYmNhYmZYS1RN?=
 =?utf-8?B?UU5jZTllUTUvV1M5Q2s2Uk4vOExuU2xXbGFpL2FBd2Vwb21zYTlIN2VaYndu?=
 =?utf-8?B?ampFOVpPSHRPOHQ2T3oxWXptQ1pKcmQzczhQajA0ZW9BV2YwRjJpN0J6TUJZ?=
 =?utf-8?B?eHk2UGxUSHhOMzRmSFVxWUsxWG55dVhVRXFsSG9KVCtXOU5LUGVxMHQ0a0VP?=
 =?utf-8?B?TW1mVHEzNDhLenN3c2dFb2FaTkpTV0FUNFlyM1grTVh6cDJNcjhuUzQ2MEN0?=
 =?utf-8?B?SnArcENjb2VKbEN4UTU0NE5QT0lMWWV1NTBBalNsNlJob3BibXBXdWZBczdh?=
 =?utf-8?B?U1hKeXFQSi82ZmE4cW0xMHVISk1VRWNWMWMrTkxwd2tsWWRBeVp4TGc5RE1z?=
 =?utf-8?B?THlFR1VNMVp5T2c1S1pmR2RDRWk5d2JxclFJNVFtZnZ0K1l3WTFqc1FIZzNK?=
 =?utf-8?B?R01jc2ttRGVUUTBVS0NoZVVML1Y3T1p1T0lteUdjTTdrRlFkdTcvdnpVNDBk?=
 =?utf-8?B?UWRrRStwMEZwZVpZcUliTllUbEFuM3hremlodUdGQTRxc0JHNGpqU0dVb2VY?=
 =?utf-8?B?a3RFa1pSMVIvYzI5RWFpNmE5ZmtRTDJmOTRQeXZXRzlnZnoyRUJyNGcrL2Vv?=
 =?utf-8?B?bW9LQms3QVdSb2Z2OExKNVp5YjBSN1lINXU5V0M5ZklRTG9uUVVNcXRIRThF?=
 =?utf-8?B?L3dpeHVuclVaTCsxVk1BUFhSWVU2ekpPa2pBTFNMc3FQMyt1YjcwWnFTeVVS?=
 =?utf-8?B?VzhNM3dFUENYazFHZzNaa3lBcGdFbklzMmFvZ1JYdVYwbHoxVXRPVnJSRzQz?=
 =?utf-8?B?WlFPWWo0WElQNFJqbVNrZXdDdUtDNmQ1S21uRk5RcmpTRUxnTFlPbDBMSkRs?=
 =?utf-8?B?Z2svc2NhaDJVRWxzV1JJTXpLY3JJMUZpUnY5SUh6bzRkeUNOQW8ydlRMMENV?=
 =?utf-8?B?UXIzSkVTbHVselM4QUVxb2llaWd3MHJaeS8wcWdiYklPbnZ4QnBBbFAxMjdq?=
 =?utf-8?B?eUwyczZjQVo1OEpuWVZoZDZ2NUZvdW9KOHpjc0NhVlN0NFA3TCtJOXRpTURE?=
 =?utf-8?B?WHc2eEdZR3lndGg5VEFiMkVabmoyVmIxTGRsNzZ1d0R0RlFncy9LQmFQc05w?=
 =?utf-8?B?WTBjY3p4aFJXM1NWTzNFaEp6UitncUdMSENjMEZVTVE3N2lrSGpYdGl4SGxS?=
 =?utf-8?B?Z1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2lEbGpnQnc0aXN2MkxhbU81QnZIWmlYT05GN1hmVXBaRlBJWkhkK1NZRGpo?=
 =?utf-8?B?Z052S3JzZUVRcjBYZkczRVdwRG4yTjZxalltN2tVWi9BZ1cwWHhEUXN6cFJs?=
 =?utf-8?B?VGdrUEU2Zk5OSXAweTJaY2ViUWJIZ052VDY3L3o4ejM0SnlOTjdiS3hXcDYx?=
 =?utf-8?B?Uy9QaW84UDgzL1IwRHBIUSs5RXFsVUg5YkJwSExjYVNYeldlVTRWaFZ6SU1W?=
 =?utf-8?B?YmxFVjdsWUg2NFY2NHdYTk8vUXVQTGVmNndVRTEwR1VQb0xQQnhQYTcyeHE1?=
 =?utf-8?B?S0p2RzA3TmxZbjlSbFVzWlpWdzNmY3E1SjZtSEdKTHg1T09kWGdzUFZTOG1T?=
 =?utf-8?B?NFd1RCthTi9wSVpEWGk2VVZTYkdUM0dHYWtXQzlyWTBMWWRocUYvTm1RamU2?=
 =?utf-8?B?b1U1YmNMRGVveUZlTDVYRjNuUVZ0Q1o4R1RSVUVjQk1aYW8yZlRXY01vOGRt?=
 =?utf-8?B?WndqN3FWSEZMVS83NkpVNEtVMUE4NEdDcHkrOEtQdGN6bXZsL0VQTG1ScHFM?=
 =?utf-8?B?d3VFbldGNTdiQkZ3Ry9BZ2YvakN5aDhZN3BnTUpROGE1KzVad1pWd1BGRjds?=
 =?utf-8?B?MnY1Ylg3eDh5WHdFRkZKVFkzL3QxQXV5R0dkcTZKMlpvM2xVc1cwOU9meTlq?=
 =?utf-8?B?Rzd3Qi9XYzlaM1ZCY2tNL0ZXSWV3blRuVmpKRUd6ZUtPZVo0cnZ6cmQrSnhv?=
 =?utf-8?B?N1FiVlhHb0NSNTZkbDlnY2xDR1hhRGREZTZsWEdhbnB4QTBRTzZKYTB3WVlF?=
 =?utf-8?B?bXUwUmI1SjMyYno0WVpMcUFaZGpoaEtlYTQ4ZGZBdG1NRm1hN2tXUmhKa0hn?=
 =?utf-8?B?S0kxUkFabi9CVHVGZGNTWHIwOXZoZld2cGNVWkZwejhtU01Fc1VGbmRZd1Fh?=
 =?utf-8?B?dmVyb1pQZWRoWUhTY2pTNG9rMjlPYk5pYVhUVG5MQ0N4R3hvM3laSk1qTUM2?=
 =?utf-8?B?cVQzU1hHdFpoZWo5ZTFCRTBmZFJNcndESGFNZnJwaG1PUmk5S0Q3eFZsU2tV?=
 =?utf-8?B?aDhoY2NnTmlObzRHZGwvRUJPQlF4Z1VTTldtQ0lqK3c2UXJkNFBLelNUOGxQ?=
 =?utf-8?B?c0Q4UDlqbk5oa3UxVWxyWFFWL1duTmhpZTVaMmMzM2dMVkdNdE1aaU01QVh0?=
 =?utf-8?B?VnRvTVAwamlLa2d6Vy9qN25CUDBlSGE4VktBKzk0TW1XWFBORlJCWEdLV0lt?=
 =?utf-8?B?NTVmb3lVRHJ4WjVCZWhzQm5nZzhETmpvV2hhVVVtZ3pJbUp0WldwWk9UbjRq?=
 =?utf-8?B?bXhGNnhwRE5ERTFQUUw1ZFBiMXA4UDZxNWl1L3p0bmhFa1FRYWIwMFpiZzVT?=
 =?utf-8?B?VCt6MU04c09KdE1rVlI1aC9va0YreFN1dVJoYSt1YTF6TmhpcThkZ1ZOVHg1?=
 =?utf-8?B?aXVmMERzWFhOK2FBZlQ1SXhRSzBuZDhydnJhekFDQlArQ05LaW5nYkYwZlFh?=
 =?utf-8?B?eXBUdGtPQlJkZUVkRFl3eWtjUmMxQkF5WXJlc1JhSjZjSVRCRWduRy9kTFFV?=
 =?utf-8?B?NGMwNXFDZWxaY3U2a1FFbkRVM2ZqQ0FCNGdGVDE0Nk1ySFNwait1b3d0YjlP?=
 =?utf-8?B?NkJreWgwdTc1aGFvR255dVNSdVRtRWRnNEQxOHlMTFRvaVZ1Q3RsS0FiZjFm?=
 =?utf-8?B?d0x1L0VvdlJhQ1JwUkw2aW9lU3lRR0ZCNm9tWEFKVHR3UHlDNElKckJNbEVU?=
 =?utf-8?B?YTcwOVlBTSt4cXp1R0krN2dkN2lXOGtEdmROTEdGZUhWNFl6dmtoMFhWdEJ1?=
 =?utf-8?B?bkhGaUQyWURreUwyWU1sR1NUWGlCVFFSZUVEblM1VjdkQTU3Ti9Lc3gxZUk3?=
 =?utf-8?B?Si90MXpjUTAyR3p2QkU3R2d0VHBjbXNJTEQwendsRTVTdjlvY045ZWtZVEhk?=
 =?utf-8?B?VlZpdWpsMVk1Sm1QSjZ0WHJMVzF5aCszaEwzTXNxOWZLNXBDTUZma2p2VEVI?=
 =?utf-8?B?VU5ROC9oeER3Mkt3bUozSGRaZ08zQVVhWTluUks0OUxSelMveGxPLzc5SVNW?=
 =?utf-8?B?YlowRWllV3VuNytZb3JDQ0pxQ3VVQ2FLWDlJL3Yxek4rSEZESk1JbVErUkJO?=
 =?utf-8?B?VE4wMGczeHdPMUtBMWRhbW80NUtENWtPV2ZLQy9GWHBkT2x6eUNSZTBHNFdr?=
 =?utf-8?B?M1lqaHJvR2taT1lzQmMzK3BGa3V1TGVpemh0UXI3Nk4ydktGSVBWNHFSQ2VZ?=
 =?utf-8?B?Wjhnc2lZQkxFQXBTaE9vUHhIbWh2NDh4VWZpaWJlRkFDcU1vcUdMQXppcTlB?=
 =?utf-8?B?TkNIY0xVYXdtcnBnTmlncGFWS05VMkptekQ3MmY5VDFwQWZENFk3WVlCQ2V0?=
 =?utf-8?B?d3ZuNkxWOVQzekJDSWlmdE51Q2pLTC9tV2Y2M2Rha2ZXZXJkRnpGSS9nRGsy?=
 =?utf-8?Q?b/35S0iSiGSpK02CsuTHtn8Nkx0OUmK/BWMLrWmChESwe?=
X-MS-Exchange-AntiSpam-MessageData-1: +yTFRFD+J+9Jww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb82f288-e245-447e-5b0a-08de5a61d5dc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:28:58.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1CbIlxV7FFKToKbVTzeLF1nyKq2zII2S1k0VuPc1Y9cLzHdQbacg29eikZBi/YfEWnuObMcfOZGABTsav9mVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30973-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: E375773632
X-Rspamd-Action: no action


On 23/01/2026 06:41, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra264.
> 
> Use the "wakeup-parent" phandle from the GPIO device tree node to
> ensure the GPIO driver associates with the intended PMC device.
> Relying only on compatible-based lookup can select an unexpected
> PMC node, so fall back to compatible-based lookup when the phandle
> is not present.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>    * Use “wakeup-parent” instead of "nvidia,pmc" and include the renamed header.
> ---
>   drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index b1498b59a921..9c874f07be75 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2016-2025 NVIDIA Corporation
> + * Copyright (c) 2016-2026 NVIDIA Corporation
>    *
>    * Author: Thierry Reding <treding@nvidia.com>
>    *	   Dipen Patel <dpatel@nvidia.com>
> @@ -21,6 +21,7 @@
>   #include <dt-bindings/gpio/tegra234-gpio.h>
>   #include <dt-bindings/gpio/tegra241-gpio.h>
>   #include <dt-bindings/gpio/tegra256-gpio.h>
> +#include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
>   
>   /* security registers */
>   #define TEGRA186_GPIO_CTL_SCR 0x0c
> @@ -1001,7 +1002,9 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	if (gpio->soc->num_irqs_per_bank > 1)
>   		tegra186_gpio_init_route_mapping(gpio);
>   
> -	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
> +	np = of_parse_phandle(pdev->dev.of_node, "wakeup-parent", 0);
> +	if (!np)
> +		np = of_find_matching_node(NULL, tegra186_pmc_of_match);
>   	if (np) {
>   		if (of_device_is_available(np)) {
>   			irq->parent_domain = irq_find_host(np);
> @@ -1277,6 +1280,80 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> +#define TEGRA264_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA264_MAIN, _name, _bank, _port, _pins)
> +
> +static const struct tegra_gpio_port tegra264_main_ports[] = {
> +	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
> +	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
> +	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 6),
> +	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
> +	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
> +	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
> +	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
> +	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
> +	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
> +	TEGRA264_MAIN_GPIO_PORT(X, 0, 7, 6),
> +	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
> +	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
> +	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
> +};
> +
> +static const struct tegra_gpio_soc tegra264_main_soc = {
> +	.num_ports = ARRAY_SIZE(tegra264_main_ports),
> +	.ports = tegra264_main_ports,
> +	.name = "tegra264-gpio",
> +	.instance = 0,
> +	.num_irqs_per_bank = 8,
> +	.has_vm_support = true,
> +};
> +
> +#define TEGRA264_AON_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA264_AON, _name, _bank, _port, _pins)
> +
> +static const struct tegra_gpio_port tegra264_aon_ports[] = {
> +	TEGRA264_AON_GPIO_PORT(AA, 0, 0, 8),
> +	TEGRA264_AON_GPIO_PORT(BB, 0, 1, 2),
> +	TEGRA264_AON_GPIO_PORT(CC, 0, 2, 8),
> +	TEGRA264_AON_GPIO_PORT(DD, 0, 3, 8),
> +	TEGRA264_AON_GPIO_PORT(EE, 0, 4, 4)
> +};
> +
> +static const struct tegra_gpio_soc tegra264_aon_soc = {
> +	.num_ports = ARRAY_SIZE(tegra264_aon_ports),
> +	.ports = tegra264_aon_ports,
> +	.name = "tegra264-gpio-aon",
> +	.instance = 1,
> +	.num_irqs_per_bank = 8,
> +	.has_vm_support = true,
> +};
> +
> +#define TEGRA264_UPHY_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA264_UPHY, _name, _bank, _port, _pins)
> +
> +static const struct tegra_gpio_port tegra264_uphy_ports[] = {
> +	TEGRA264_UPHY_GPIO_PORT(A, 0, 0, 6),
> +	TEGRA264_UPHY_GPIO_PORT(B, 0, 1, 8),
> +	TEGRA264_UPHY_GPIO_PORT(C, 0, 2, 3),
> +	TEGRA264_UPHY_GPIO_PORT(D, 1, 0, 8),
> +	TEGRA264_UPHY_GPIO_PORT(E, 1, 1, 4),
> +};
> +
> +static const struct tegra_gpio_soc tegra264_uphy_soc = {
> +	.num_ports = ARRAY_SIZE(tegra264_uphy_ports),
> +	.ports = tegra264_uphy_ports,
> +	.name = "tegra264-gpio-uphy",
> +	.instance = 2,
> +	.num_irqs_per_bank = 8,
> +	.has_vm_support = true,
> +};
> +
>   #define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
>   	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
>   
> @@ -1368,6 +1445,15 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
>   	}, {
>   		.compatible = "nvidia,tegra256-gpio",
>   		.data = &tegra256_main_soc
> +	}, {
> +		.compatible = "nvidia,tegra264-gpio",
> +		.data = &tegra264_main_soc
> +	}, {
> +		.compatible = "nvidia,tegra264-gpio-aon",
> +		.data = &tegra264_aon_soc
> +	}, {
> +		.compatible = "nvidia,tegra264-gpio-uphy",
> +		.data = &tegra264_uphy_soc
>   	}, {
>   		/* sentinel */
>   	}

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon
-- 
nvpublic


