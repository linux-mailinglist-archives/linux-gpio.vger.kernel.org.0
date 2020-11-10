Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A452AD308
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 11:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgKJKCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 05:02:52 -0500
Received: from mail-co1nam11on2075.outbound.protection.outlook.com ([40.107.220.75]:22977
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726944AbgKJKCw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 05:02:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edBnPMDc4KBZnR+Yf/IAZuab5sA+AVQA6wabznBZ2bL5fQehVqz8ZsFigRzx5RWTPXO9NKl+uvTN6zCwDGbnGlZSr8HgqWHvKbXEa+T+pE6WNQo7xy14+Q0ssMvZy8U33mxhtEw3OpvuGiTbAqIrkI/IsjfqZVII2VvtgVIL88pUzv6h2Yj0LfEN4Qut0KJg9L17ik5vpRxNe5Jr6mnTERyOIhTgvVcI2IGqdCpBps1vYo8lqr5jdV57MnOApjd3qe36qK4Rca2XTYTssyxOHsB8AuceiWS5DhQwvZumgiZyTU3BVhiicI/QimJSmd35qrBGkSQZ4g3wVxyR/Xl9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT0GiqS5zxq7DthfXVsqQqgOnlUR0z7bNN1Qp+zYmgM=;
 b=KOt0TdK61+42wvK3XfAaSaBi2peWn3G/9HDjlfio3HQ7QQC/nITi3+PsRFrKMpq24WEz8gPzxeKWRdZLk/5rf83zgzFTppXvvCP4dwQ/lE8uUx0VGJjaUy0kgw7qGElJjQb7bHJG8sChrZh3tShPpj4H7nKiArGqaQl64m8jLydv4Fxx0hEGgi4mCcjMom8kaoRtV8gtd3s376A/FyFSSkn/xiFEYUW3K2+Q0DQS1Jeyl1+X1G0clQ8WDx+CMwc8tN0HhhgUxLDNgNzQI4v+LtHSh3O0Y2C9wcimHw8e4UtIYoKJIY8Hwh2MWo0dNOQAWs/tL3JWwN+2t2P/8zXqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT0GiqS5zxq7DthfXVsqQqgOnlUR0z7bNN1Qp+zYmgM=;
 b=iUqn9Y5/hJFO8Mo1KP7PJo3vy38u9rRSU8sO3VHle9nysX3ig3sqdBe8qIMC5p1W/skQ0mmw7watpUonIt7dTO8ba3ZJFR+usmgF6oyxwiS7PRFA2ws2DXmAOkn8xcm2YLf4DP1j2md8bmKVSFIebtlg6h7MsPivuZ+UMAbx1vc=
Received: from MN2PR05CA0066.namprd05.prod.outlook.com (2603:10b6:208:236::35)
 by SJ0PR02MB7263.namprd02.prod.outlook.com (2603:10b6:a03:2a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 10:02:49 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:236:cafe::47) by MN2PR05CA0066.outlook.office365.com
 (2603:10b6:208:236::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Tue, 10 Nov 2020 10:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 10:02:49 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 10 Nov 2020 02:02:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 10 Nov 2020 02:02:47 -0800
Envelope-to: michal.simek@xilinx.com,
 linux-arm-kernel@lists.infradead.org,
 bgolaszewski@baylibre.com,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 akpm@linux-foundation.org,
 linus.walleij@linaro.org,
 arnd@kernel.org,
 syednwaris@gmail.com,
 andriy.shevchenko@linux.intel.com,
 vilhelm.gray@gmail.com
Received: from [172.30.17.110] (port=56692)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kcQUA-0007ev-R1; Tue, 10 Nov 2020 02:02:47 -0800
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed> <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name> <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com> <20201109173107.GA14643@shinobu>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
Date:   Tue, 10 Nov 2020 11:02:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109173107.GA14643@shinobu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e8f29a8-e2dd-432f-5d74-08d8855fc7bc
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7263:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB726375C60FCF0167908749B8C6E90@SJ0PR02MB7263.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRP1JTTQcgfKgKBH2gknttrj5XxxIUfXWAMu/UHp5w2vNV14ars7MdUEcy/rT3aklfoqOL246S319qJRRSnBiVirogFex7dwnMnqTmIB1e8h9k+9O19/xsASIFqeqZ8YjZ+zWDPMElXrnL6HuqhsxX0oEnEAvlthHfXvVsdwQTJGZnaPF32JHTxaeWTDw+bWvq8HAwAn0Kc//BDIpKEDQqdoUiK0+AyICOM6f7SdqCZ0WeCy1dpRpXZPuXF3VllxK0yKBIMbXJMa98F154QiIKUn9+Netmrii8mDyWxs8b7wVPYRt4nrckoLZoDr1DosFe2tukzD0E0bgLooK0kEZkpHpBIA2DNEO34T3+54cY1zfBXkl+yCKkEkJelXfNn4axOnU2cIV8bdDJZGs+BQCDKn+kQGmaa69j+QStCYZp4vh4VFCB+mB57MaXMJVhp5GesmbDegX0IaL5HlwFGVj7v7/C0rZJ65shTSwevooCI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(82740400003)(82310400003)(70206006)(356005)(31686004)(36756003)(9786002)(8676002)(5660300002)(70586007)(478600001)(44832011)(36906005)(316002)(54906003)(110136005)(7416002)(47076004)(6666004)(7636003)(31696002)(186003)(336012)(2616005)(426003)(26005)(2906002)(4326008)(8936002)(50156003)(41533002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 10:02:49.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8f29a8-e2dd-432f-5d74-08d8855fc7bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7263
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09. 11. 20 18:31, William Breathitt Gray wrote:
> On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
>> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
>>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
>>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
>>
>> ...
>>
>>>>  static inline void bitmap_set_value(unsigned long *map,
>>>> -                                    unsigned long value,
>>>> +                                    unsigned long value, const size_t length,
>>>>                                      unsigned long start, unsigned long nbits)
>>>>  {
>>>>          const size_t index = BIT_WORD(start);
>>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
>>>>          } else {
>>>>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
>>>>                  map[index + 0] |= value << offset;
>>>> +
>>>> +               if (index + 1 >= length)
>>>> +                       __builtin_unreachable();
>>>> +
>>>>                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
>>>>                  map[index + 1] |= value >> space;
>>>>          }
>>>
>>> Hi Syed,
>>>
>>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
>>> to value_width.
>>
>> length here is in longs. I guess this is the point of entire patch.
> 
> Ah yes, this should become 'const unsigned long nbits' and represent the
> length of the bitmap in bits and not longs.
> 
>> But to me sounds like it would be better to have simply bitmap_set_value64() /
>> bitmap_set_value32() with proper optimization done and forget about variadic
>> ones for now.
> 
> The gpio-xilinx driver can have arbitrary sizes for width[0] and
> width[1], so unfortunately that means we don't know the start position
> nor the width of the value beforehand.

Start position should be all the time zero. You can't configure this IP
to start from bit 2. Width can vary but start is IMHO all the time from
0 bit.

Thanks,
Michal

