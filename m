Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4817A333F5F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 14:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbhCJNgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 08:36:44 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:34272
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233374AbhCJNgg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 08:36:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbu4SmUsG3SJN6eYbkHdw9yIea1vtefDxnsLY+o80gtiSnT1x2hH+5zJvqGvDfYEfrGJEiqounTkLOfus88wUNDfCnxHKO33MPQo7FbDkY2UUg2zAffOw2qcz0VZ82yZ1LutzFNcdhdx84mT/8s5s54lnw9izhOmh7yM1FI6e9EopC9KEvBsDz8YMImxMhzfYn7dOkVTR2UXs/w3beQ74Ut1qxkuRMW1fSTdIMBFQtDuDF+u+tJimsrb/S+b/Ks8qZ/CQDW5odwlYYQZjczgKOg7bv2whSQkQzTUHwYssr5bU17P/XN6OCKTd1ezQR2FlAArwiifFu3NTVS071QjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgHTKHc9LfunL4YoMQVRahtl8os9OMadTOsjabm6+PI=;
 b=b5eHfjAJjthE8jjh6lhIaz9v6Btg/gpRNusMwNnsQ2QVhSVU3CxscI5gQcv6+/PNvEbKR/pzCLQViPCfiRBHbTmsWuvK6HKgxzfaVgEGBmWqaFfBNvbBT7GupeR58P6XQFDQS245LtdQrVk13yJSSNTIvIlJNYJn801EtEoeQOA8Hxciv97ahdr0dtlgw2fnEiK0qRgahxYEIuOv8G1g8EbmyY48MCoie/7XrYwoqt/j6jd9sEVvgEwYHtVWeJVnZsoonJsW5Q80Ai56mdaZ4Y6fGBQ7paa9v21mv2PhMCwThkHH0QMGhKc3Wpi6rSMAYRpxgQRd6ZRqIx5W+JwiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgHTKHc9LfunL4YoMQVRahtl8os9OMadTOsjabm6+PI=;
 b=sc23WzGyh+hyfDpbocVWeGeROOWFOH5kY1Xw5ZsOJ8h56184iB14iMpMxmjX550EQ/UXA5vEfAAL3wxwr4bfJOHnXNNOuvc2MG1rvuaNwrzD3Z7A+Vi2vRn15MDjr3jUzmCibMxiOiTroboVJ5Na7zPsO5yxuVsrmEdJI+FZ2sYQOSUYQR8ibJha5Q7tvEQnblkBkPoOfhNxhfH+9myHbGr+NN08O+OnDT7q/6q30gvdnmuZlTRNNJu2hAfkMpUuZQoc+8nmR/QrerHvq6iCeAKR3Yalw0We+zWp4BeYS9qFI7MdpsPTFQ6LYEXh5KA8oFP+3Hwx5TX4iMb3Zma4yQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from VI1PR0602MB3568.eurprd06.prod.outlook.com
 (2603:10a6:803:10::31) by VI1PR06MB5567.eurprd06.prod.outlook.com
 (2603:10a6:803:cd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 13:36:34 +0000
Received: from VI1PR0602MB3568.eurprd06.prod.outlook.com
 ([fe80::c471:1848:5f45:95a4]) by VI1PR0602MB3568.eurprd06.prod.outlook.com
 ([fe80::c471:1848:5f45:95a4%7]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 13:36:34 +0000
To:     linux-gpio@vger.kernel.org
From:   Tomas Melin <tomas.melin@vaisala.com>
Subject: Shared access to gpio pin
Message-ID: <fd30cc89-8048-700d-edc1-95bf38184b0b@vaisala.com>
Date:   Wed, 10 Mar 2021 15:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [85.156.166.133]
X-ClientProxiedBy: AM0PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::46) To VI1PR0602MB3568.eurprd06.prod.outlook.com
 (2603:10a6:803:10::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [85.156.166.133] (85.156.166.133) by AM0PR06CA0141.eurprd06.prod.outlook.com (2603:10a6:208:ab::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 13:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a223393-555e-46fb-f84b-08d8e3c985c1
X-MS-TrafficTypeDiagnostic: VI1PR06MB5567:
X-Microsoft-Antispam-PRVS: <VI1PR06MB5567D677DC140D4952702E34FD919@VI1PR06MB5567.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JiBTHPsKMVWbLDCZ3fNwKuaIyS1NlsXVVqBtwYzri3rO2UMP09tWYuTVMCElyty/Md6g2PtbDBN+qBP5Znmk/XCT3XHwYBLW6GLvOvEpyEilM0Str7k05pbtwLCxco6VuogkwxZtfZBcQLdngpsSkNqJjEoEzU5vd1hzKN5IalEua2MXRJU5fTxMteHlFwfvbZzqWXQSqWeFpW9EsbQHkG/h6eqs02YgFYoGOVMUAT8mSiOVbS2gqI/GoN4ogNMPhTpvCfb8Dz1DDhAHI+4J1btVfZrSbV2WuwK9fRQ1JkK+28YXCmME0sR+1ranWhY1M6b76wWfIMglGNjKTuYgl9/BBWzNNnt2yreUKbZSIagOkwA5fRfjJkyydGEDYgJkj9TvqSNmwe596CZMSb9PL1PLnci/kKZByz7dF97ggMNMW40XN7G45lMtwuelfDroTESNdvS2CH/SK4FkfBsq+M3HYRsz/y8VCx9q4WWUOiKBZmvltlPhsj7a0PF8vSpMSrDwLbkS90bEEFIG4P1MMzZK43lFwZKvxRRSUzZg6239xfNymlcgFLZi1YDGbpLhAuv7VtToCR0RKfVhwv1HHmLrzu7BnEY29ttia1WVsG5F7NLlKswBj6aAA6yO0cmiHgwU8kX0f6Ipi7rhU7XgyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0602MB3568.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(44832011)(478600001)(31686004)(31696002)(956004)(6706004)(2616005)(86362001)(6916009)(316002)(2906002)(16576012)(8936002)(6486002)(52116002)(16526019)(66556008)(26005)(186003)(4744005)(66946007)(83380400001)(66476007)(5660300002)(8676002)(36756003)(3940600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3lwZ0ZmQThFYVluSjhtNlRrT25NT243Y09FT3JXR2tWMXVkVE16TW5aWXBH?=
 =?utf-8?B?d2JRWmlyRWtZZm8vb3VjYUQ0OUNzUFllYjBUTmRvd1AzQk5BVkRQTDBBVnhk?=
 =?utf-8?B?dVh3cHE5TmF4UldDdlBJUEFvM1FBNzU3V0UvVnRCU1grSUxjNTI5KzRTcXlY?=
 =?utf-8?B?SE54aFRRbVpDTVRBVXkyTzc0bDk5K0VYejhBdUpCRkN1RVRaWkpxWFEwS29k?=
 =?utf-8?B?TDhOSGFwUjVwMGpkcVFGR01GYXo0RWpWdDFQUURELzUzMnlnYm9xUmdtcjBK?=
 =?utf-8?B?OHNzWitQckVJTW5FblVVdEpadHdvUVJYSE10MEJEV3hUbTdDNDEyL2tjQmlY?=
 =?utf-8?B?TiszamYxQTFpcjVvZUxlVGtBVVJVUXhCUjlmVHhSVHdkVTNBY1IyZ1ZYSm9R?=
 =?utf-8?B?d1hsM1BWMk9rTGtBWGFJVFdZbGloWlZpZmNVcW4zRkwzVlpKTzRRbVlaQ3hH?=
 =?utf-8?B?cVFER1MrcmtTditkNnBnVWxZK1RaQ3R3N3Rzdnc2YVM5cEJPTHZhMU1TSGlp?=
 =?utf-8?B?T3g5WEFmbHFNN0RVNit5Y2hlV1dzNDA1bnV6TzZ3RjBaUjlFK1kwajF0TzR0?=
 =?utf-8?B?QmVQaVowWkdCcGlLWVBzN2VtWml4SitZcitaU1djQ3VOSU5EV1gyaVE2V1Vq?=
 =?utf-8?B?b0lHZGk5Sm9NTEgvMDJHMWw1OEJ4ZTIrQkdUZTFuMlhSb2RQRlMvWmtRZlZZ?=
 =?utf-8?B?MTFSekVQelJTMUs1TXFqZXFlak9lcWxUTWRFd0h2NUtzTXR4b3NXcGpwUzNv?=
 =?utf-8?B?U3VZRUp4K2wydDFIdXZoZUh4aDdCVmFnSFdmaVBFMEJIZTZaOVhxdjJSWEE2?=
 =?utf-8?B?dzJ0ZzVQd3M1RUZtK2txdHRwMG51YlFMWktDYnZCS1RPMTVuMURMOFZsbVFz?=
 =?utf-8?B?cnlBR3BlTVNMNlZtREhlSVlZRmFXV1hRdHpObTdqSjI2R2FidTZyRHdJRmdR?=
 =?utf-8?B?Y2h6ck81N1NtV3RrN0NXNlRKdmwwUHZGRlExSmJtZTB1TWM1V2hTZG4vQ0Zr?=
 =?utf-8?B?T2YxMVJQZjE1UTY5djRSSnR5WWYydXJOWFpxbTZDd2lTTUZxWUVpYjl3ZVRZ?=
 =?utf-8?B?U0hlTFRNZnk2SXhYalJnMTl2dnpCQmxpZXd4QmFaTlljei80TnlhMitQNSt1?=
 =?utf-8?B?dGtpd0xEY1JrL2g2RHFRN21sMkJVOTI0V1FpcDBjVFFraEVBY1VHMzl4M3h0?=
 =?utf-8?B?RVNMNTEyc1lBd2VrTEhBSEpKNE9URkpROFFVOERkRzQ2NWYrWTl4TzhIYWtD?=
 =?utf-8?B?NDlFdDJ4TGZ4eEhIOWdteThGc1NSWXp2MnhFSXhidlg4TnovQTNmYnpLZHJy?=
 =?utf-8?B?MmlodzFYOC9lQU1xQ1dldzVYZFliVS9xaUJkYWNUZmdib2JwdEttTVpqdEh2?=
 =?utf-8?B?bmFwMCt1a0VUcE9TSG9rQWpiZ1EwMHdMT3lickN4U1lISVNsZDBoQyt6V1gw?=
 =?utf-8?B?ZWNXamp6aVppRXlwTWFGaXRWNzA5cnNhcElyb2VsTjM2aElBSEFhaTl2NFdl?=
 =?utf-8?B?VmlGV2kyRSt0WU9yQzdlUmJ2UlpuaXcrZ1daaGl0OTJqcXA1ZmdHeUkrTDB2?=
 =?utf-8?B?Ri92Z3VGZVRkbjFMUFA5RmpNdkpQOThzY3haM2Jqb1c4bGpmVFMzdTFOR0l3?=
 =?utf-8?B?ZTJMS1hzUTRzRS9xOTJKaW9tR1Y0ZWFmOU5KakZCR1NQSlBsMHUyakwwanFJ?=
 =?utf-8?B?WjQ5S3pEd3RvMmxxRFl4UHdON1Z3ZHpYMTZvZjFoWnVMTVVlb3VwS3MydVQx?=
 =?utf-8?Q?jMHLQGHSlLYR6nm9L9haRmPsRlYSVTBRSLfiSKs?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a223393-555e-46fb-f84b-08d8e3c985c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0602MB3568.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 13:36:34.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZcU9LD9HnhjrGb33dE52jnfAOb5z6I+M8Ri8DPAJCo6smRApz8s/OcQreTL/bzYK2WDEhVHaqpNzREKpA3ugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5567
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Is there a preferred way of providing shared access to a gpio pin?

Use case is such that there is one application which only monitors the 
state of gpio pins, while another

actually controls those pins. It would be enough if the monitoring 
application could read the state of those pins regularly.

With the old sysfs approach, it was rather easy to share read/writes to 
a certain pin, but is there a

way to provide similar functionality with gpio character devices?


Tomas

