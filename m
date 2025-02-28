Return-Path: <linux-gpio+bounces-16822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0333A49B08
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407B6174886
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D325F26E14E;
	Fri, 28 Feb 2025 13:54:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2114.outbound.protection.outlook.com [40.107.103.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5826E157
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750872; cv=fail; b=KKErtoZ+MP7wJ6ZoW6Rl/zEg6R724t5gyz1/qYxohJMdkZNdo9u0l/snnka5KeP49FMhzvqEfVz038+BF1JF7Co0rnoxRpYzkB04e3FEFamy3B6Yb8bO9ySNZ0AOXt2pZpIZc913Wf7aDVWo1aM1V89THAdI+pJdqQ5lIdBfb4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750872; c=relaxed/simple;
	bh=3YwdAKUciJYvnAFEMExwSClldhPy+2JV8bYqPqafSQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pnorE8y548c0bult3fr5VKr0/+PJBR0dmsnS0DF0vVN1CeutzqkJ/tFuy1mJdlQte+X2zLw0mistTW1jJJ1yrpjJ32GA0A6OBreg6Z5PqrAq6ORT9qIeThp34rnFZvL7ttTbm8cP0c1vx66KMZbBhOzEDdH57yc8tMGG4/+3jnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com; spf=pass smtp.mailfrom=cyberdanube.com; arc=fail smtp.client-ip=40.107.103.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberdanube.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yygxjddWy8RQ/YzzABwlGLnuSJCMXe6+joK6+MP7+qwu10Ye8DbbNfuPrwkrVhBdIjXMv5ZYVQk6XEfx9DUiVX53406N+9KoQ8qcZRTQ0snozqv881Api3GaJI6uahJCOq9Kf6tfsvYi9Qjj2/yBgzgtLDAOWYjO7lygTOZztZllW9mRdODckjKao5C663z0ad4uH6UqBLTQfuF0HAPw8/qU471eCQXbK6RVGMVn2av7CVRcQhGwFIZ5Q+r5IpucR5ou3rA/jX7vG+12tI3wZh6ZSr+m34xZn8DwkPizECvkO4ae/LOzDLSKGoijhCFm2+LfNRjJArTH/Iq3e39QbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGVwVtCo0OWSq4DfVpDwBkqHcUws17kvk2WdbCSrcnw=;
 b=j57mxWqfsQFP5sl9yts7/pZzAJI7rC8sLnEswFAdfuPZ/yAnTEoE/5lqRwfWClLbr7QBQRjG70qR1XKMhGGp64mwko4Z7yOb3yVj0n3MiLQiwsn2Lp+22tJP3Kkf09Aww9x7qluSxgLo6TucAIgCglCo8TQoDsXVmvq8IQA3co0ezTEp6lqqOJ/22Eabh3Q8pTJh2f5tzg4LjG9IUNIAMxwC6IevMKIYukrjGzBq4/3+4XZ+zHBoKPm06GwyR+GK7Ze7pi4pEHXA5O5c0k/qh7SvR5kBMYaAljYF0gH2/RgeFvI6vaKebBafg8U53PLXAjL8mKY5HP9TAjjJSGTNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cyberdanube.com; dmarc=pass action=none
 header.from=cyberdanube.com; dkim=pass header.d=cyberdanube.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cyberdanube.com;
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:344::19)
 by VI0P190MB2047.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Fri, 28 Feb
 2025 13:54:26 +0000
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413]) by DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413%6]) with mapi id 15.20.8466.027; Fri, 28 Feb 2025
 13:54:25 +0000
Message-ID: <661c2ee0-013b-4ee1-8c53-51729a172cce@cyberdanube.com>
Date: Fri, 28 Feb 2025 14:54:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: sim: added configfs option for static base
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
References: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
 <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com>
Content-Language: en-US
From: Sebastian Dietz <s.dietz@cyberdanube.com>
Autocrypt: addr=s.dietz@cyberdanube.com; keydata=
 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
In-Reply-To: <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::42) To DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:344::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1708:EE_|VI0P190MB2047:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ab77f3-2e24-470d-30fa-08dd57ff699c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnRvWS91Tk0zbUc2bGtkNWZGbUIyUXZ5VnhpNFlSMGhUTU50b01EbVRUUTgx?=
 =?utf-8?B?VUJoUlVMZHhiaGI0eXp3WDNZZ290WHRYQnhUb0hJRjRudkZjTWRSZUZnY2NG?=
 =?utf-8?B?SUdOUVBwQ0NuNHE2TTFNRXJ5YWRETFo3dHFmMi81Yk1MQmtIbWovbEFSS2F4?=
 =?utf-8?B?SGJlZXpHcVdYcXpyUGNBRFZqcWFFWDdhem1xSVA1YzRicmh3MUtTeWwzMDRk?=
 =?utf-8?B?Mk1tZUVWZHVRZHNUc0dCQktkTThjY3NiRmtBN2ZORFB3ZDNlZ2l0VkFHN3Np?=
 =?utf-8?B?Z3grRkt6MUdqM21NanY3eHBOeUdFam9FWUUvUDQzZGx0R0VzSmM1dWFuTTZ4?=
 =?utf-8?B?K3FrdkNqbC85Mk5UVEp3QTU1NWpIWkF0Z3RvamhiblFpNnFNdFY0SEdRczc0?=
 =?utf-8?B?cDk1b3IwZ1U2WnZyZzVtMmd5Y3J4TERhZmFhdWRHMjdXSmN6ZXR4M3YyWVRK?=
 =?utf-8?B?SFhXb2F6RDI0ckRTREROZ3YwZWJsOG16SWVST25oRWdOdTJNZnNZdkNqUEhi?=
 =?utf-8?B?NTVCUXl2RG1TRzNTd2duRkJzSG9ydVVUZmNkVlVUbDlVTExBMW5iM3U1NlRj?=
 =?utf-8?B?RlY5NkJVOWZWNHlNR05Wemgycm95WVphWVBBUDZaQzJoekx4UzZkZklwVGpo?=
 =?utf-8?B?YWUzUndVQm9lWXNCSmJRcnNNdXo3SVAybkRnK1F5d3pJTUZUSUJXWUF6WUlt?=
 =?utf-8?B?cWtoNUd0RFZUay9tb2NmWVBhOEI4NEthRzZZZkFXVDU5ZmUvM0dKdzJLaWR2?=
 =?utf-8?B?OEFUODE4YWNlUXZvZEdSRDlNeGI5UFBxTGpPckhQMlZ0c1VUcU5BaXMwMGJO?=
 =?utf-8?B?bjRrOEZ5Zy82ZWJHc0xoWTNCTHJFNXpEaGJJM3E2Y1RGSUlydFdHbGZ0eW9r?=
 =?utf-8?B?SVVHa3RUT04ybHQzaDlVam1pekFNTzBXU29tenZueGF5MTJPR1hNdDE2eGxi?=
 =?utf-8?B?clpmcm5zbmF5NmUzSndWSmRYdkdTeFM1N25mSm9hODUyRmN5OEtXRW5RQmJw?=
 =?utf-8?B?TUhBVmVhcS95VnQ4WnRialM2NFVHb1VmWlVuRG9Pcnk2MldSa0x0M0RWckhL?=
 =?utf-8?B?SUgyV00vZFVXcWJ6Q0pSeHRlZXhTMm5kYmd4OGxiRDFkNUMyT29wQXowUU5O?=
 =?utf-8?B?bFlzTTVycE84TWpCcm1mQzA2M3FqZ1dvVktlbVYyNnZiWUJMNHZHRVpoOTFt?=
 =?utf-8?B?VE1YWkpndzNvMVQwbEZxWTlNSlUveVk2di82NHAwbXdKOEZsVHhuN0Qrd1di?=
 =?utf-8?B?eG1JU0hIUWE1L0gwdWpMbysvQ2RHWGIzQzhoUW5mS0dRajdnbnd5clpYUUlM?=
 =?utf-8?B?TkFFamFTN2RFZWh0NGwrcFRMQ0d3WEZtWjVxZUdTRjU0R0ZaL2ZsQW5FTjdD?=
 =?utf-8?B?RHdGNkdiOUpuUDMrbmlyNC8yRVVHRUtGd2JwTkNpa01pdFQzdXEyOFB5Z2FF?=
 =?utf-8?B?Q092LytlNTVGSXU4Ni83dlJia1JzUnY1T2dwWVEzeG1rZXFVMGNVeVNMaWI5?=
 =?utf-8?B?SmZFV2RiYkJMalNXZU8yaXltdHlEbEZkSjJURDltS1NmcStLdWRYSFJCOUdx?=
 =?utf-8?B?ZC9YS2h0Z21GVzMxUnowcXRhN1VoRm1XOFB3TjliZWc2RzkvRWhiUkdEQ29h?=
 =?utf-8?B?bm1PaU5yeHJSYVpSNXR5Z1Z0bUxOUnZaeEZIQmhKbGhwbkdrUC9oNEpvU0F0?=
 =?utf-8?B?L05pbkRBSDdkNTdQbE80NXI5K01HOVg2V1dwY0g2MDg0Vk0rYUl2VmNGSDRW?=
 =?utf-8?B?YWsrTWlWblMrclA3b0xadnpURnhUSEJYODBiNkpaemdHRGN6d29OVGk2RXRo?=
 =?utf-8?B?eWNMRXI4Zi93cmtrWG5IRU05WFpWUkZ1RFh2UitmV3VnZzgvcnZZc0ZqOWFw?=
 =?utf-8?Q?Quqdr+R4EDiCn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1708.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REFGcjFJVEFVUFRkMXMyVTFPcTZZR1lVNjEyVVBnYlhRYjlXOFY2S0FEbmlz?=
 =?utf-8?B?RGdNbjhzcUQxWlJpOXRCUjlvR1FpVmc3ZGN4ZVgvcERzTWNXMHFRYTFmVW9H?=
 =?utf-8?B?Rldsc2ZyTXJjNDdONy9aQ0cwSVpsLzhpZTR3aXgxSWhHdXRBWnRQVkJUWFFu?=
 =?utf-8?B?bjlXeHRyN3lVeGlBTHJSSFJ5VGxIS2RRbkoxUHFLV3ZtQ2RaZG5BSGN5aVNX?=
 =?utf-8?B?WEhwL2tmTkpSSytiUTZpRFpCd3BrQzhSQ2tid2FlVWRvSFBYdE1LUzBGZ3Jn?=
 =?utf-8?B?RlJjbnNYRkdqUDhGT1pnTUJhaWJRN0FUZzFjbDlZRzNkdFBHY3Z1YlR6cUdj?=
 =?utf-8?B?NWFtQ2JrN2JrbXBlaVFXZHJjYmtvOWpkanlnNUkzU2VHMUpyTWlBV0pWUnBs?=
 =?utf-8?B?MzhhQWRUSHB1d3FYYmRpUnRCc0pWaHpTWnpSbFhNZUNFT0hNWTZBOC9VdWls?=
 =?utf-8?B?ejJCQjZrMFF5VDE0cjlsZXg2eHlMbVBLYVJWUDBiVEtpbWJTUzlSalpVNTNi?=
 =?utf-8?B?UENmMDZDZ016YzdreWZDaUNMMGZtbllseFBtVFRiSzVEWTh5VTFLSEE3bXd2?=
 =?utf-8?B?M0NmdlN1a3hyVXhTakFnUlpLM1NlSSt1QkQ5MjNpcDVaYVQ5VmxuaGJZV0FM?=
 =?utf-8?B?K0ZFaHhEZytLUGgzbWIxUkhRZWF1UzlDdjRtcFkwaisxaHZFdHlXcGRtOFd5?=
 =?utf-8?B?NkhaSDBpek1lWWk5SVFIeVZjMmlUK1prR2FtbTNPRE9saUtGWGZvWURWbjB4?=
 =?utf-8?B?R2tJendUVUdzV2FtUGxLMGJDM0tRSGxNTmRMQTV6eW5XeWVkUlpPR0lZcy84?=
 =?utf-8?B?WC9zYjlOckE2TVN5NnlIb1VJTEVPaXF1UWptVFhDOTdvd0xYNnBCRUpobVpm?=
 =?utf-8?B?Z2JIY0pROGtIcHpxbnM1MWtsMWlDMmZ3bVI2TE9sbUVKN3lWNXlUVk1jNy9X?=
 =?utf-8?B?Yno3TVpJMkJwbjFDbHVQSjBLeUNQWnpVYmhwWXJQV1JLYVprZ0Rmb0o1WWxM?=
 =?utf-8?B?SVgraFkyaDJoV1NhU0JDd2NnRUg3ZG04cmdQUmhSTC9kb1NrNUVkRXUzQTVs?=
 =?utf-8?B?alQ4dkNkVmtJSitEa1R1UEdiT0Zta1FhQ0FXc1lNUkt6MUlORnJSWEVjTytF?=
 =?utf-8?B?MUF5Mkt1R1djakYzUm0rZnRqc1RTbHRHOWhiMEZSN2lCNlRKZTRodVNMZjRI?=
 =?utf-8?B?T1BXa3dXYW1lbmh2STlObElEakRjbGlIMWplNGZ0QzV1R2h1d1VSaFFJa3pG?=
 =?utf-8?B?OW1IeUVMV213TDZMWERkdjNKZVA1Z1I5SEliOER1N2tWSnZMM0ZSM08wTFQ0?=
 =?utf-8?B?RjBVUGxaWE1oZHNVTEtCZGt6eHJLZ2Fua3FIRE9PSjQvK0paZEVwL0hzNi9J?=
 =?utf-8?B?MUQyRFZReWRyNm5JbWtXRDZRR2FGQ2FRR2JJOUtjZm9scCtjSTZScXlzVlhI?=
 =?utf-8?B?Y2k1ajNGVVBwbkZ6cG15QlNlUDFNZTRlanlCREFWWEVicHRZa2kyZDZZNWh6?=
 =?utf-8?B?LzVOdFVGOGJiWUhESkQxazJueTEydFNla0xFNnVzMDcwS2RuUVJHdnpFZlVV?=
 =?utf-8?B?NWxTUWJqM0hiVUF4UGlMekxQQ0tOb2RpcUlPNXpRbzdFbnlmUXc0L3N1YWwz?=
 =?utf-8?B?WWg5VEpnUmRQdXd4ZjN2NGdxanhXbmNKVzI5cC9rY29IajRlTEZ2SHMrekV0?=
 =?utf-8?B?L0hYNlE2L0pSUlNsTjJLSjJPSEd5VTNaLzlJWldDL0ViN2RDV24xc0k0K0dk?=
 =?utf-8?B?V0JZdG9RSFRCSHp6RlBZOTVsQWdXWXVFS1JLK0liL3k3bkw0OGZtQlM0N0Nk?=
 =?utf-8?B?c2sxNjFQN3U2Q1JZK0p6V3VDMUk3ZEExL2FBVTNQNFY5SEVTbjMxeGgvRFJF?=
 =?utf-8?B?MENOeUxFNG4xeWdFZHdCMjFxRDVtSlEwN3ZvWEc5bTQ5dzVPeTY3KzlWSGw0?=
 =?utf-8?B?K1c1MVcwK1ZudEVjd2t0dG5xdjB1czV5K0I3czk2akxqOVVtNEErUS8vSGJU?=
 =?utf-8?B?emlLaTNXMEgwLzZiL0VnemFEZlVlTXdUWEpMa2ZPcUtZUlNoOU9jU2tXak1t?=
 =?utf-8?B?eTFXeW9ncjRYUktOMXpVSStUZkF1M3AzdG4rRG1sTkY1QlNCNGxaclAyeHBZ?=
 =?utf-8?B?emtJcVRic3g5aklhRC9lWEVOWlkyTTlnKzVyRENjdDduRDdHd0FtS1g5T1dm?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cyberdanube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ab77f3-2e24-470d-30fa-08dd57ff699c
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 13:54:25.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f36f8ec4-80a4-4765-99af-e8d63d22f744
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW00Mry9GS1JCHvlKcmo5RCcX4ZDCcxaKq9jOXPXTszqNMmWjneqG5Mtz5WY0/Oq+N8utTQ7AS5adYXhtWcSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P190MB2047

On 28.02.25 14:22, Bartosz Golaszewski wrote:
> On Fri, Feb 28, 2025 at 1:46 PM Sebastian Dietz <s.dietz@cyberdanube.com> wrote:
>>
>> To replicate gpio mappings of systems it is sometimes needed to have
>> the base at static values.
>>
> 
> Can you give me more info on why you'd need that? Static base is
> largely a legacy and deprecated feature, there's ongoing effort to
> remove it from the kernel.
> 
>> base is treated as unsigned as there doesn't happen to be a
>> fwnode_property_read_s32().
>>
> 
> Ha! That's interesting, I wonder why that is. We do have signed
> variants for OF-specific properties.
> 
> Bart

We are building digital twins for embedded devices for security research. The 
firmware of these devices often export static gpio pins which we simulate 
using gpio-sim. With this patch we are able to satisfy these conditions.

While the feature may be deprecated, i would argue that it makes sense and
fits the nature of a simulator to be able to configure it manually.

BR,
Sebastian

