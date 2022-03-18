Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBCF4DD429
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 06:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiCRFVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 01:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiCRFVq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 01:21:46 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2065.outbound.protection.outlook.com [40.92.107.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C2D1D761F
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 22:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y31exmIHfwrbON10rNUfWqpQpS0qOsQNl8OFNFgG7B5voseVCBGOFTV8aMrqrzBO5Vb6ElBV9sz39FIe/Jgb1PsKms4ovbvAfi7SW4KboHK8m5+F8+Eg7YJyHrxgKKbXuNpkiGSvA6i/5/R4A9tEr9+VM/psKMFeqnOaC8NFKy3k99ZfyqezYeoDJgSL9zZdfeAN99BdPBvuxBGTCZgShCDht78vXlYWY2i+Voak54HmnO/CxR9sSsvtDz2IOG7EW3gsSiDLYOucpfJwIoQ7CMji7Giy4cyOl7ALWXyAXwTT98FEK1hgKGOg8h7WiEXK2+9PKGfUXiqJ/ZHbCSLluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nBvVN8BbhVtcZpsnDT08Xzh1tbkJqjtaGDWVsO5gvk=;
 b=lro1oH6bdwOEuliQSuGblSoWCu0Jar6pLYA9AFTHYq5m78GodKId/A9Ftqms8Mvnla5osLFOXKm37uB1loVHtBoGCLvkU1/WQ6aJiAbvpDqKcop404mP1qWf5j1jTEbl3OGUMtpSjttWt8J69NrrTlvlcB0QCkxIHkUjhnNeI+O1uLyHnqk/rJPCbOANmIln0QJHcRN8sWiwOWG8YANdjitkZeFnAaClPuZT2w/trP5L8FoZJz0ZfArwoobhCvlINbNXrpwlTHquZI6+ot4kpOlJ7h+oV76Q//yAbi69eQuL1HcCXTcSkOmT9553E0RqKu8G0b52wBhb/hrDX0ws6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nBvVN8BbhVtcZpsnDT08Xzh1tbkJqjtaGDWVsO5gvk=;
 b=UMUqdlaWUIJtCz5u0Rysri//qYrfAgGLaLZMbkcLkJq/qwoRsw5unrTpL5xLtP7Do3VNwyoXcuk3vQDQio7iik4v/MGZME2i9gZBZNqHzuF4hmYnWZ9MSuVqB4St+vDQHY6Gx7iUzotjrxv5UTJbYFux6oyuG3teOE1XlxUQIqDGR4OYX/tOLbAkN/VBBJPPAX6Urhrc2dHsMA1ki6CxTd6BLE3F9WALR+2SGzeAU+DKbE62ceIQfC6ZL0o83S/A938J8VdplZ1D4ZK/ZkDCYEJNLelztGYi0kGwyz4dhqWv52+cIcw2FN8MWvddoi+hxNcvBqPPCYc1wUk2i2+q2g==
Received: from SG2PR02MB3194.apcprd02.prod.outlook.com (2603:1096:4:5e::19) by
 KL1PR02MB4530.apcprd02.prod.outlook.com (2603:1096:820:41::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.18; Fri, 18 Mar 2022 05:20:22 +0000
Received: from SG2PR02MB3194.apcprd02.prod.outlook.com
 ([fe80::b48f:a03e:4435:cf63]) by SG2PR02MB3194.apcprd02.prod.outlook.com
 ([fe80::b48f:a03e:4435:cf63%4]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 05:20:22 +0000
X-Mailer: PYRYI 16
From:   "=?utf-8?Q?=E9=B8=A6=E4=B8=98=E8=A2=AD?=" <ynvnis@hotmail.com>
To:     "=?utf-8?Q?linux-gpio?=" <linux-gpio@vger.kernel.org>
Subject: =?utf-8?Q?*=E5=B9=B5_=E5=8F=91_=E8=9E=B5=E8=AF=B7V=EF=BC=9A130-8004=EF=BC=8964=EF=BC=931=E5=91=A8_2022-03-18linux-gpio?=
Message-ID: <SG2PR02MB319444B2962CAD41EE8C6621DA139@SG2PR02MB3194.apcprd02.prod.outlook.com>
Date:   Fri, 18 Mar 2022 13:19:59 +0800
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TMN:  [eBcgFc9fCQ2DkRhi9zaxI0dDTjHcNiOT]
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To SG2PR02MB3194.apcprd02.prod.outlook.com
 (2603:1096:4:5e::19)
X-Microsoft-Original-Message-ID: <421a984bc1eccda013f2d5f50141b7d6@hotmail.com>
Importance: high
X-Priority: 1
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b729ea68-75ca-4241-6701-08da089f001c
X-MS-TrafficTypeDiagnostic: KL1PR02MB4530:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xw7yp5aZJiu0Eh2DSd/2ky8aFPVMm/6N+/u9Ef9f7FlKJJGxbGXMoy8kKHOaTvz8zTdHSGvfKrqi2qvPQfl6UjdvqS8NH2lvVRlBIAvEsSsSwhIYvmgxApY2lolzDsiYqrFfRH5fj2Fcu/2LgFI9vS32hX775FL6o3FV6S56uiBVHQflSa0NUDMsnuRwBjEGYI/wkcrZ4dRb31+gseaSgmHfUcLW2IwdUlD3/hSxY2i/E52VXKpFg3yVtPBr5OtuXspmGYah0H9/ik70BOlMDRi1dNUX37+rLFcwec9cFNvG6gJTsQBqMuCfqEtPBcEiLOgWbZt93cAnMtBZjOVE6n4IbOnO9G5XwEgZXWLJX4T0e6gYxo3japggOUJVh6X6QEZvFURaSkpvcWDd/6g0uJ6XDjWtdLskFx9SoLXo968i77vZITTYSwEiH6qvtPj/gwIJu+nxJL3KdHFQaUT0BXf9MI5xU+VWklnAbSlqcNWLve9hAByA77kVrcdyu+iAhcynRZyEUJ9plQV7CIUqgSYzDHP+zUz7Yg+3PRUIHS+L9TvE8k7lE3SrhuAbunRcLPVEtgKoemc3quq4S4dRjw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZreGJIQi9IWXBsMGt3NjVFZ09qOXRWZkVmckFGVEhSbWcxdzhodkY2d2dt?=
 =?utf-8?B?NTVESzBBY3ZsS2NWbjNKbG92c0hzMkVnVlgzRHgyRnBuR0VIanRnM2VzdXFB?=
 =?utf-8?B?a1BqT3B2MWhOSENveGQxU3FpaGdDOXNZaGV3ckdLN0pTdEJqWHdiYmlUbWEy?=
 =?utf-8?B?RjRqdk8vUEhNRngvMDdqVCtxa1VGay8xM0Z0ZEhva1E0Q2JFY1hvOHQwai9D?=
 =?utf-8?B?TWwvYWpHOGN6NGxLYk4rVWhxZENvY0Vxb1F1bHp5ZzA0amJaaWdWMHo5ZlVz?=
 =?utf-8?B?VmVlR0NNTkRvZnJwUnpOemJXUFlVemRTZDZ3dWQwY0NoQmI2Qld1UFVxejhR?=
 =?utf-8?B?UVNLQkhDNU9OVHc1c1AxSXVjajliZEo1RVVZaU9ueTlaYXJrMEVNV1RNWWNz?=
 =?utf-8?B?ajBBQzg4VFExQ255VzgwSHdjRFptV2FjTGpkV216NXpCUEpLM09MNWZnbWdh?=
 =?utf-8?B?RnlVQ01TeVl2SWhxajh3WVVhS0VIWjBNNkYyZ01vSzRBWVBKeGhEUm5EREVF?=
 =?utf-8?B?UURYcWt6NDRhNG1MSDJXWmNvVVF1ZUFJSi9Fcjdnam85Z2VqdFZtb3RkNDBZ?=
 =?utf-8?B?dnRiNTNZa0NtT3dEdEliWmxzWVFTVDhseUdZTVhlNmw2bCtTa292eFZGRktE?=
 =?utf-8?B?QlJudGdPUjdpbEl4NS93VHVieVpiSng3QVc5RXI1QmYvYTcwR0hLZ1J5WWNW?=
 =?utf-8?B?KzdrRXprWGRzdnFxeWF1VzJDbDN1VGd1RUF3anJZOHM3cU54T0E3UXZZajRZ?=
 =?utf-8?B?b1VidnRsNkE1cVFYWDRjeFdGRERRbWhYZUM5eXhKTUUwY3FhdkFYSUZlZnFB?=
 =?utf-8?B?TUt4VzUwVkRWNjhiS051eUtrSmVhN0xRYXMyd2RZMHJudmUxSUpZYzgxVXhF?=
 =?utf-8?B?dDY3UzR2SWExRy9TbTNueVpGYXhkckJRa1NiYWtiRk9IVDNsRVFscWFXMlhi?=
 =?utf-8?B?bUZySkRQZGJVZ2EyeDNQeEk2bW42TVA2VjJKUk54VWwzOFBaa2xHQVZMWGlZ?=
 =?utf-8?B?TnNVWlhVSTFhY00xelh4elJKZ2FvVXpRQitLOExpNHRrc2NUVDZrbDNMWmNy?=
 =?utf-8?B?Q2FMZisvSlJqY2dRUmVsOE9tSUhxTXJhVEJDN0I5bTAxbElJRzFyZFB0WCtU?=
 =?utf-8?B?dlBlY2FwYW1TUHhmQlB1TzJRRlJwK0lmUnpSL0FVbmgzVXRHTVVKZFladDJC?=
 =?utf-8?B?K3MrWmRzSjRyVzU5eEFHa0RVWWRHU3BHTVpCNTI0TnpETURCWnJLbjhWY01u?=
 =?utf-8?B?eXFTSHJxNFIxRzJYNmx3UXdHUUl3bmlCeGJFdjRZVy80ai8vbENPTXR3RXlV?=
 =?utf-8?B?R2l0V1Nsd0J1TGRuZ0huaUpxaTNSZ1FGQmxTcEZnSnhtTFIrVnc3ZDZsOTlC?=
 =?utf-8?B?NXpMWXFpVXlJakhPRGxybHU2SU0yUmZPRk84T2FjRlZiYjVqMnR3RDJZdnJt?=
 =?utf-8?B?WEJvb3BRWkM0QmNoblp5a0x4enhmb2pmRE9jNnlsbis2dWdtdjhVM2dMM3JQ?=
 =?utf-8?Q?rxMaySX8squYhRpMAlO8Bqnq+NU?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-20e34.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b729ea68-75ca-4241-6701-08da089f001c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB3194.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 05:20:22.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4530
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


代幵 发…彯+-*请薇130-8004-6431刘 [%French(2,5)] W6r 



linux-gpio过程语言

