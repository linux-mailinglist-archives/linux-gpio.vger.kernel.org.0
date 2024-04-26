Return-Path: <linux-gpio+bounces-5886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B492F8B37F4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 15:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C59E283CC5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 13:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0110146A88;
	Fri, 26 Apr 2024 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="jlYv2+QS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2109.outbound.protection.outlook.com [40.107.105.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18913E88A
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714136922; cv=fail; b=WlOk2jEEj/6+jjL84oMsRGJ944Asyy0LP0DAynopfnzn6ZPOPkOIhzidZiwwLpE+JwcyFBMmB8qru3OP5XOlIpJ89iKyZWoS1miBSkudaC1YBbm4hhCUtt2cgVxyHRyqBb8761yCjCvopJcOJdUH9h95sWLqYkvQRdNv4xYUrWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714136922; c=relaxed/simple;
	bh=ATuhsOY9FXFj2MGFgpKoyrD4UT5uha6SYUoGCSetry4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=Gfx6LwxVcgwvWlL/36hc8L88tZtnapendum6mQ9QDSKOTCm6/gz6kkJuseJq60Prst6oLQHGR+VDV5FAKU6TSj2WDdR1E3WNonVjdThtIN/Ux3oLN22ocofdiZN1BDpHFHOdT9BRQ/T8tjN8fwqXU8XcIz1meO7xBKPjLnp2lU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=jlYv2+QS; arc=fail smtp.client-ip=40.107.105.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W04Ro9yuwK6KgmQjEoBprigwuaoAXZbZyiw9SI28+3DZJAiWF40+h9OXtJPwh6pXd4qzJxHDmjMilx9jHeKGDaJ8R1s3BBqPcusQX1hnG/Owv7NtCENIZgLBNSqL/eGckyN/qNceK5+mYcvMBrbqm6ST5lzH9dyNXoV0bWg86mAYEDExpA3bR33rLP57F6IAkPCOwqrsXlly93jxmoCCYEz77Y6Mh3afBF0EtNw7jU8gj4WTvXKqJv9KjrEUKNI0iqEXIfVWSmUlCAeKwGrkEXvzu9tQ7CbWJ/hlasukPV55WcUbrB0mTly8z7IBd6K1FHKJLxqn1pkCwPoFxgQDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKPK6+0ayK5NRp+pRsI+rnvSDTHe93VuHiSHoPj2efE=;
 b=QKazkCCkRECBrIPoTAQrkkHLHMwj5n/0eY957sQTKQDMtkCO02J66lPVNeXtbTs4pE3BENmvVIpmqm/KJGoenbjAYTGlxh8Hw35061Lgv22UMZaY+lqIJ4RxD7fUPGsS0T4rSkLd4vHdVfmBVcUx7dFVAlGaMpR7DqOpZMToAG5Bc1AMM3XThBmSae8e8DuYeTvaQVzPa2UpHlvXwSb024cnS1SWvYVTId2X1ijcSJ92AJ7ZpclL8CkJHV35EYfKmB0CqE7Q90N4EtBSJFv6raRgkRyXQ2Rb82T668vjhQemaX70+/sCBGE8Npt/1O7W3g7Qxdc1Qp3glfIz1mNEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKPK6+0ayK5NRp+pRsI+rnvSDTHe93VuHiSHoPj2efE=;
 b=jlYv2+QSsGXL3csoxAFqWBEBfHYnSJdFiXyYi3d0sZiSoDF8Il9aOXnrVOo9pwqbduw91THjDx4ZcE3/Wud4dXSyRgdRt+ikI2lhCCyeNQcHD5iQjtKz46uwDaR3/u3FTL3nDxSZkkp4kncu2LYDCc/zz9WDxcwI87PY5Ywjr2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by GV1PR10MB6268.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:90::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 13:08:34 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4%6]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 13:08:34 +0000
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel>
From: Gilles BULOZ <gilles.buloz@kontron.com>
Organization: Kontron Modular Computers SA
Message-ID: <76794fbe-db97-a00b-c16c-b3e4296c3b9d@kontron.com>
Date: Fri, 26 Apr 2024 15:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20240426020720.GA9777@rigel>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0086.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::31) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|GV1PR10MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: b6395386-247d-4ee9-f72a-08dc65f1fa9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFNwSTFNckEyeWVIbjRsMlBSeGpXWEllaWNUY25YNHBQQTZiOSs3TnpUVnlE?=
 =?utf-8?B?am1LVlFRYWJSVzdnSWhLeUpvZHNWcTh6NmVuUndhUFY5dXZ3UEZ3Tms5ZzRv?=
 =?utf-8?B?cnZVL3JWK2pqL0w5WTFhUHhqRHRESUMvVHhmdUVFR0ZnMmJPWThvdFY4Nkhh?=
 =?utf-8?B?QXpmWW5CZFdKQkdEVnVGUVVsVDdEVHM5WHZ2cUpISlFOQVVQQkpNMTY5MlZm?=
 =?utf-8?B?NllOWWFFU25NbWV0c0JKRk41aTNSeXgrVGNnMDJOclNnUHdXaDAybDJKanE3?=
 =?utf-8?B?ZG12QWxEOENKVmJNWGZnWHdadlM3eWJlTktLek4zeURlblVFU01oR0tHNEVi?=
 =?utf-8?B?MnU1RGErRjB2MWx5VUtwekVqMEw1T2h1TWZTdFd1ZXluSDVacC8rU0h6bjhh?=
 =?utf-8?B?bXhXZXNBdlpqdHo5Y2dCMjM5TmhLOUFBV21QS0hGc01vRVpaTUFtYURpbWpC?=
 =?utf-8?B?RDErczNOMTdiNUppOTRYd1ZMRGRiWFRLKzVGZTE5bVVhdEFDZ3duWEpvc3ZF?=
 =?utf-8?B?SWRJcHhmSDhWMEZPVy8xMlEvN2FpY1hOSHNiNTEveGkzZ1hFUlNhYXpBc1NB?=
 =?utf-8?B?elJhUCt5bEh2ZUc4cjA0WWxrV2xaOUpUUUthKzBFemRPeGFqc1N1eCtxYU9J?=
 =?utf-8?B?VHVZUkphWmkvVHFEUzk1TVRRM215aS9OQ2JRY25QOUg3ajNjejZQeU5qVzRh?=
 =?utf-8?B?aHd1UUZIMEszaWxOVVUrYWNsT213TERELzVtQUVKR3gxei9STlNEdkxYdnZV?=
 =?utf-8?B?UU1ydFRzdUVDd29RMHFIb2hoUWFFN0Vzdk16TGcyaWpybHByYXRqMlo5bEpD?=
 =?utf-8?B?U3pOMTA5bm1QbG00ZHJ1alFCblFjNlpUMkZLVS9OQ3I5L08vdzNGaWdHUDNF?=
 =?utf-8?B?NWxQbFVjOEJNemRDTUVLRDBUU0xXS00vbDB6c2ZyanJJc1lCNGluZTFxMitX?=
 =?utf-8?B?YkJiOHd4SXNmRUEzbkRrRnBQdXQvdjlYcmg3YTVrVWsvNk5MRmN4UTJyY3dp?=
 =?utf-8?B?dGVlZHhpRXk1WjFRbE90a01BbmJPVDJqQmRpVHgrUEZUbFc3SU1aVisyUGdC?=
 =?utf-8?B?Z1ozU2JsM3dMY05FbUEzdDM2b28yNVhPTDJMbERhMDd3VUk4QmNiaksxUndi?=
 =?utf-8?B?SENQWHRyb25NMGllaXZnWFRyRXJrQU5nNWhTMW9TKytKMDVkbURhbnVUd2J4?=
 =?utf-8?B?STVBOFNXQlVaenMyL0g0eC9PMlNleVgra0F3bjQyNTdqT05yblJBc2REVC9T?=
 =?utf-8?B?Sk9ONGw0dGhDRlNDS2IvaFB4UjVUbmV6VGJCRVlRT0dCeEx6KzUyR2JQTDF0?=
 =?utf-8?B?TEpaWTd5d1IyM2hyeVlXUmVlZWR1YllTOVRRR0xUcUNPbndSMkgyVjV2KzRl?=
 =?utf-8?B?TnRzZWNNMitJVER1RFhpaWp3RjljL0txRndLUDlrVWtvQWRrc3AzTVNyZ0Va?=
 =?utf-8?B?cHZDNlZOVFB4ZnVYYk5qUWVtSFB6TFdubENnZndsZGdzLzNDT1prV0c5cG42?=
 =?utf-8?B?VEJnUkRCUDJlWHlhVCszN2pMVjlQR3FJVG9lSHFqbHNmazN3VStKdzUrR1JI?=
 =?utf-8?B?dGJHdUcyZ00xQ1hTYlNndEZVQzZXUWRvOFp4VXBIKzNwbm5zREtBdWJ1azBZ?=
 =?utf-8?B?TXRDN0xMdVVvZ3BlNURvc0RueE9pTHdCNFhIcGVscDFQOUJiNEYxNGczYkdV?=
 =?utf-8?B?bEV2ZmcrYlBES3ZlMXQ4dlJLSGhiQVlRVmJMWkhOZThaeXRLK2FzT1V3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkswOFVoSVpJS3V3NkJlbWg1VDMwbE9zcFgzNHZnRllUVHNQT2lHS0diMWFZ?=
 =?utf-8?B?UFJabWpYK1hta2x0WmszM3c0N0JQVHNpbTJ0NWFPZVFvUXBBZ25qT2FxVzlp?=
 =?utf-8?B?anl6UXBhWlZFL3E1S3BtaC9Nb0JFV0dPM2ZKbWFYMk85Tjd2Z29OamlzRkJY?=
 =?utf-8?B?ckVuaTh0QVd6RFkvQ0V4aFNJeGNOaWVpTkpEUXlaeHU3aUpYSW5oM3dsQm9M?=
 =?utf-8?B?cEdzYk5TZlNPSEZqYUVvRjNTTE43a2N0UlE5L1BSc1VMK1ZWQVJSc0NYZ1pn?=
 =?utf-8?B?SlVCZEF6U3pUSGFRTjNSSnJuY3p6ajk1OElSNjhLZXZsaUF4MTNORXpzRnp5?=
 =?utf-8?B?U0d5Ylc0NnR5M3dxeFhGaUluRUFFM29hNGE3K3I4ZTFZTHZORzVQVTlwQ05q?=
 =?utf-8?B?VnA0Ny9OWFpxMDBIWUhIZ1NYekJmWnNnTEpCdzJvbzByYi9ESjEvWE1obytB?=
 =?utf-8?B?cHBMTjR6RkpCL1JNbFFjVDBrak9TV2NzRkVjekIwQktNRTYxYnBsKzhGclRj?=
 =?utf-8?B?QWEwS3BOYTZkUHBDK0x4dXpUcUJTNUlGSUdqNWtaMWtJcmJLVEdXMEEwck5y?=
 =?utf-8?B?QmNDaElmSlFnU1MzQVRybXF3QWp0WXU3dEEvMDNkcGM2OHdSUTAyMDg4S2p1?=
 =?utf-8?B?TjU3SmhqRUY3NDBBR2ltZStwZFk2cXVSdHZwVmh4bThGL1NFekZWaDR0R3pW?=
 =?utf-8?B?MHFoekJxajJwYWV6ZnlNdHVId2xUTTRWS2NqSjJ4ZGxuOEhzaUZWMEtvVEpH?=
 =?utf-8?B?R3VVN1prWFhwRlZkNkt2NzVidnFRNTJnZmxuUklKbDE2OEgyZnhWaGVPYVMw?=
 =?utf-8?B?a0YyU051OVJyS2ZQMzZ6dzVpOERIWkllaDhubGNXRjBDQlF6cExmajZBWWRB?=
 =?utf-8?B?cXlJQ2tjVWw0anJPRHkybVJqQXU2bGhDa0kzQkdJK1ZaaExhSjdhYXR4c0tB?=
 =?utf-8?B?Ukc2TjdhRGJYMkt1QVAxNnlCblRUZkhGelB3ckFJMVd2TUN0cDErZmc4OXVx?=
 =?utf-8?B?UnUrT3lpdVg2ay91NTdrTDJBKzM1SEZNS2tIMTIxZTFKSnN2U3FEdDhuZmwr?=
 =?utf-8?B?VURGNzdWNHZOaGtxbUpKWHc2a2V2ekliVnhPajBwTnFIR0tiaWFucE9YM1JQ?=
 =?utf-8?B?amdJY0diOEpzYmZkQ1piL3hoT2RJTnBzN0RwM1UzZkR6UDVnM2RlU04zaFRY?=
 =?utf-8?B?dHNFb2VpUmtrbFhSMVpsbEkrNUVGQTlsTjQ2NTcrSGt4L2JiWVhybUpEQ1dh?=
 =?utf-8?B?d2h3V0tESDlGNEpZWmlxZHd0aVJxNGl0MDJ2SndISUtibS9ZUnpkTkRaYkFV?=
 =?utf-8?B?YTE4ZUVrcFFzTFdOUWhwbVI1UVYxcGZzL1RjUkZQOHlMN2JYaW8xU1MzbW5Q?=
 =?utf-8?B?VUFvSDFidG12UU5seC9HNDZSOUdQNTJJUG1ZTjVzanhWbHpBRnFCem0wcmRr?=
 =?utf-8?B?NGtzY1JjbGN5QzZFbm1WZmtlUTF6SkN1TFl0VTVRelhyNVJ2WTN4aFppbWdR?=
 =?utf-8?B?QW1pelFKYTRWa0h6ekhaL0xKLzZ0aGdZVm82RzJ0Q3ZFUmN5ZlY3YTlFWEZ3?=
 =?utf-8?B?ZWNHQ0lrVFV4YzhsdTNLS2NJWlRFUkh2cWJWemliVWJYbzRMcHFTbEFzOVBM?=
 =?utf-8?B?c3EvRjZrRGc0ZEZRUVh0K1poWFk4alpCQlRYYnFZTnVmYVNyZWo5TTBIckh0?=
 =?utf-8?B?NWVNa1BiNndTZGlmcUxSUmEwQUd3dGdnK293bDc5dWY5Sm1hSVMxMWprU0My?=
 =?utf-8?B?TEM4QlRNSk80SFBEbUF5WnF5ajJ5VmRFbkw3V0QrTW9UOWsydEJQaHJhbTFG?=
 =?utf-8?B?T2g3MjQyUDBINWpMdm5FVGlXZkhYejBUWWFmcWYrUUpObjJsc0w5elgvdFdE?=
 =?utf-8?B?OVkycDB1UnhGL1RUaEkyMllmZWlHR3JhM1VRTXJiK29nOVEzRWd1aHUyd3ZX?=
 =?utf-8?B?Z21RdFpLa3ZRU01oaUFrVHJ6RFZSZ0l5UmwwTkdXODU3dmtnZ1lybHFYQmc1?=
 =?utf-8?B?aWtHUW5ZdWZ2RzVwa2NFdERhdUhwV21kZkJxNGg5NGJxOTcxdUZiNk4zWXVh?=
 =?utf-8?B?ZTM1MlpFZEpkaXhJZUJZYldnZjZ5eG1ZRDVkWUsrRENOMGhSZUZhTXdSREYv?=
 =?utf-8?B?WmNBM3pNczBCemF0ZkJjSWNCdVoyNU9nNGRIak9qcmJuTk1rMlhnMmw4U3lT?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6395386-247d-4ee9-f72a-08dc65f1fa9b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:08:34.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5C7DytuRf8xeaJ8HytPwFe0DvtO+17DPbnPoQXSuwvZqPk0bYhTWnB8I6ECkmVvc+aoM8pK7/6nxEEC4nkXiYTtYBBupoZ9qCIihusZ+ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6268

On Fri, Apr 26, 2024 at 04:07 AM, Kent Gibson wrote :
> On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
>> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
>>> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
>>>>
>>>> Hi Bartosz,
>>>>
>>>> Several years after our discussions about GPIOs, some things are still unclear
>>>> to me.
>>>>
>>>> 1 - The gpioset command has this in its help : "Note: the state of a GPIO line
>>>> controlled over the character device reverts to default when the last process
>>>> referencing the file descriptor representing the device file exits. This means
>>>> that it's wrong to run gpioset, have it exit and expect the line to continue
>>>> being driven high or low. It may happen if given pin is floating but it must
>>>> be interpreted as undefined behavior." But up to now I've never seen such
>>>> behaviour and I'm glad to have the GPIO set by gpioset keep their state once
>>>> the command exits. Is reverting to default an optional behaviour in the GPIO
>>>> chip driver, or in the gpiolib stack ?
>>>>
>>>
>>> This behavior is driver-specific. Meaning: you're in-kernel GPIO
>>> driver may actually retain the state.
>>>
>>
>> Which method should the driver implement to restore the state on GPIO when the
>> last process referencing the character device exits ?
>>
>>>> 2 - I've recently wrote a GPIO driver for an I2C FPGA design having ~112 GPIOs
>>>> and wanted to use get_multiple() and set_multiple to have more efficent
>>>> accesses, but realized that the line number was limited to 63 because of the
>>>> unsigned long mask/bits. But I've noticed that working on a line number >= 64
>>>> was unexpectedly calling these methods with a mask at 0 instead of calling
>>>> get/set methods, and that the only way to have things working was to not
>>>> define get_multiple/set_multiple but only get/set. Is it the expected
>>>> behaviour ?
>>>> At the end I've split the GPIOs into two banks (first with 64 and second with
>>>> 48 GPIOs) to be able to use get_multiple/set_multiple.
>>>>
>>>
>>> Please use libgpiod v2. That won't help you with the max requested
>>> line limit but at least it's more modern API and actively developed.
>>>
>>
>
> I suspect you are referring to gpiolib here - the mask in gc->get_multiple()
> being unsigned long*.
>
> The uAPI that libgpiod uses is limited to 64 lines per request, but that is
> only relevant if you want to request more than 64 lines at once from userspace
> (you would have to break that into two requests to access all 112 lines).
>
> Note that the mask in gc->get_multiple() is unsigned long*, so it is a
> pointer to an array of unsigned long.  Its width is not limited by
> unsigned long, but by the bits parameter.  In your case the mask you pass
> should contain multiple unsigned longs to achieve 112 bits.
> Refer to gpiod_get_array_value_complex() for an example of building bitmap
> masks to pass to gc->get_multiple(), in that case via
> gpio_chip_get_multiple().
>

I was refering the get_multiple/set_multiple callbacks in struct gpio_chip
that are defined like this :
 int (*get_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
 void (*set_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
With some debug in my GPIO chip driver implementing these functions, I saw that
the bits set in "mask" and the ones used in "bits" are the ones whose bit
numbers are directly matching the GPIO offset/line numbers of the chip. But I
only used unsigned long, not arrays, so I thought I was limited to offset/line
31 on 32bit arch, and 63 on 64bit arch.
As you suggested, I'm currently having a look to gpiod_get_array_value_complex()
but I must admit I'm currently a little bit lost. I've never thought GPIO
implementation could become so complex for my brain :-)

>> OK
>>
>>>> 3 - Is there some way to request a GPIO already owned by another process as
>>>> input or output, just to get the current level on the input or the level
>>>> driven on output ? This would be much more efficient for real-time
>>>> applications than asking the owner such information.
>>>>
>>>
>>> Ha! Please help me help you. Take a look at the DBus daemon I recently
>>> posted[1]. With the daemon running, the behavior will be exactly what
>>> you expect. You'll be able to get/set values and have the command-line
>>> tool exit while the daemon retains the state.
>>>
>>
>> I was thinking about some specific "watcher" ioctl to do so, not a DBus
>> daemon because this is not welcome in the real-time and embedded world.
>> The only workaround I've found is to directly read the GPIO chip registers
>> but this is bad to do so.
>>
>
> No there isn't, and I can't say I'm a fan of using GPIOs as shared memory,
> though it does seems to be a common use case for those accustomed to accessing
> hardware registers directly.
>

As a workaround, using debugfs in the driver to report the current state of
GPIOs to all processes requiring them is probably cleaner that doing a direct
access to the register. But this is not as clean as a specific "watcher"
ioctl could be.

> I would question whether "much more efficient" is true, as going through all
> the gpiolib machinery, including the device driver, to perform the get could
> even turn out to be slower than some IPC options - such as actual shared
> memory.
>

Yes, you're probably right. "more efficient" was refering to the less you have
layers the more is is supposed to be fast, but there's still some machinery
to go through.

> Cheers,
> Kent.
> .

Thanks a lot,
Gilles
.


