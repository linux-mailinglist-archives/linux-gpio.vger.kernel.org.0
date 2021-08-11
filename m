Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BA93E933D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 16:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhHKOHf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 10:07:35 -0400
Received: from mail-bn7nam10on2073.outbound.protection.outlook.com ([40.107.92.73]:5056
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231240AbhHKOHc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 10:07:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb7UZyL3flrMeozIu4SfI8A+3upyHd8ayaX8DxzUdZhR9AOBFiUxj+SgkOhxJ5/du9QsFPsvRKP5Qc0LYPnLYwTXvoOFy/ud78DaWzQ865nsdz/e01ii58TnKCwruWAUHooyIGf36Ewi7klXt64LU72C0kUf27ZFLx/5W465t68/uN6bzTcLJ2XPEj1gGNctb20It24AYjo7K8w/Q+QLgItc0XD7nPQkMksFXIG03wTxJg7QuCpD3Twysw9QoXqU1mUblO3M9/2VLT7b9XgTs0PKc2lrHn+P054joLmKtYpwBwPqOjhyFnuN95mfitavgOVrvlbtTc5eVqLg1EIz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XobEoBJIiAfqmkwAnNzkkmns1lYgjRjpXkvmuv9zrc=;
 b=h73HsqZvzkkrEkX/pFB5Az9EoZikpA7tK8N9PyV78PzpAQ+waCQgt9iPzMypYNU4+FD/uQNGDEN0FlzKZNwcqPSH6R23/oXaFYWefMI+ZFhWQ2NFu7Vvyq4jaqL2bSNu9pkrP4tPQ6NKSp98vvcXsq6Jag1kDj5qASuFIG8lxPT8oybtG2RC2zGT0ESNqf2GubsP8qmQZYEXgIhBz8fgVvCysbl2ZuH8HnPWt58wpQWtnzZMNZiK7zpwte41vfaLGcOY7BXhkljnp8QKGQzUf9l1dTXJWLuvtS8p+2pnPW9LMpPZ2tSLCMfOZRUIlmGfFDvBdqsaKxI3Hx+b/r769A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XobEoBJIiAfqmkwAnNzkkmns1lYgjRjpXkvmuv9zrc=;
 b=aqfAVlvmR8pvnm8teDkgCGPDj+ewNrPa8DVkYON0uhfASTRV1nECrYpiDiMpjCJRtsVDRiNviEyITRkLWyxYLZsRo37XFykQklw0/K8iiLZI37KlkVqtLCGg2mE1AxO8/xE25Npu/oxeGEA8B/OhTl2U8Nb4aKHWL+pgL6Zm+qk=
Received: from BN9PR03CA0627.namprd03.prod.outlook.com (2603:10b6:408:106::32)
 by SN6PR02MB5712.namprd02.prod.outlook.com (2603:10b6:805:df::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 14:07:06 +0000
Received: from BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::8f) by BN9PR03CA0627.outlook.office365.com
 (2603:10b6:408:106::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 14:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT052.mail.protection.outlook.com (10.13.2.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 14:07:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 07:04:33 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 11 Aug 2021 07:04:33 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 bgolaszewski@baylibre.com,
 iwamatsu@nigauri.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 linus.walleij@linaro.org,
 arnd@arndb.de
Received: from [172.30.17.109] (port=54794)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mDoqO-0002S0-3Q; Wed, 11 Aug 2021 07:04:32 -0700
Subject: Re: [PATCH V2 1/3] firmware: zynqmp: Add MMIO read and write support
 for PS_MODE pin
To:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Piyush Mehta <piyush.mehta@xilinx.com>,
        Zou Wei <zou_wei@huawei.com>,
        "Greg KH" <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <wendy.liang@xilinx.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        "Srinivas Goud" <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-2-piyush.mehta@xilinx.com>
 <CACRpkdYo5e7uTJJRqnK1R4QLtUzRGNbsvNvm-47UFZOr4_R9Cw@mail.gmail.com>
 <CAK8P3a3ZdZSdiX6_AeSW4qSFhUp+wKrUe6S5z5bKDtcU068sjQ@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <6f067aa8-27e2-3579-54e5-419f940f628d@xilinx.com>
Date:   Wed, 11 Aug 2021 16:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3ZdZSdiX6_AeSW4qSFhUp+wKrUe6S5z5bKDtcU068sjQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b040671-926b-4de1-9b94-08d95cd14d8e
X-MS-TrafficTypeDiagnostic: SN6PR02MB5712:
X-Microsoft-Antispam-PRVS: <SN6PR02MB57129B8DD365380E3EB6AEB2C6F89@SN6PR02MB5712.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2n9Nr0yxHEdjn38nwCtjX/zaGxDol9O/P1leLnkHr2v4INA4xNCnriguR4uVUmdpoqSv43Klxj149835/a1HhxhS1QADHDezg4NuCUHKJPv0BJXiK7RzhPgniHoxxZmWQuwGGTkwOTFJ3FSP8hiTCdtToi0iz7vHuu1JzPozMcJo6Cug/vgJUod9CVcuAVeW4tdXOlPdW+9YhgiRkwBWW+vcf7btIjpJCOPKo7Oh8rkdcgjT4LXa7OqQL2xMV8rbpHyjbdch3jKW1Dk6iSmxvKPf3J5Z9p6ptoh5Z6bYlS+tTbB6alHiOjRxZfWtvx4MfU4orqTa3G+9E0y61i94udW4Ddb7qzEvwHlvbl1JddAHVi5xsLSpwuUiNfn+KRXSVG/EIhFLStBGC54SiGDcsdYKzHQR6N1zJ94B33Y2uf6TR7wZA0CTKMNezCrLEcqfJsnZ6Ieopz+B1xBgovnT/pS615YwQt05HOwN+Ix/legdUGqJYq05/Wf0yhhdOj0nvzXkCfcbd3BLK3y+eT0BPJsZTvm1RnLAzbODrNKxpWIf8UudhfJcDzUw3PDAkk/kQDIMvy7mpNCCMCRLh7ZnNnOOIuXxDBycTDFNZvjZwtg+2Zgx6Ufnc+yQw515319emX3sBQcJO84wsr4iQX4NQhtJEQ4OiQN2q3OqDVAKfQMER6VpzhH3ApkDZW2Xk/jieXkP5ZZFgot4HVq6eIpsBvt8uPcWrTmWYNoFu6G03rSDBWMs9kuvZXmumMogfU2iTXJRPiHOUoEXbk1ZQGI4pUFFIwPWt7ZNQ4VYxhNwekViHGml8KwmwcZZDZF4yGnFz+Q8l4bxXbVdBx9SUptkHHDCozR4pp3y1sCKKq6VnVduqLt57Rrpw83EID075tH
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(54906003)(110136005)(53546011)(2616005)(47076005)(4326008)(426003)(478600001)(8676002)(966005)(70586007)(70206006)(44832011)(7416002)(356005)(8936002)(186003)(5660300002)(6666004)(31696002)(7636003)(36906005)(316002)(9786002)(82310400003)(36860700001)(2906002)(336012)(26005)(36756003)(82740400003)(31686004)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 14:07:06.7438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b040671-926b-4de1-9b94-08d95cd14d8e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5712
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

On 8/11/21 3:46 PM, Arnd Bergmann wrote:
> On Wed, Aug 11, 2021 at 3:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Thu, Aug 5, 2021 at 7:42 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
>>
>>> Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
>>> pins value and status. These APIs create an interface path between
>>> mode pin controller driver and low-level API to access GPIO pins.
>>>
>>> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
>>> ---
>>> Changes in v2:
>>> - Added Xilinx ZynqMP firmware MMIO API support to set and get pin
>>>   value and status.
>>
>> I doubt this is "GPIO".
>> General Purpose? I think not. It seems to be about boot mode.
> 
> Agreed.

here is register description.

https://www.xilinx.com/html_docs/registers/ug1087/crl_apb___boot_pin_ctrl.html#

> 
>> If you need a userspace ABI, then add sysfs files to this firmware
>> driver instead of bridging it to the GPIO subsystem.
> 
> I don't really want custom user interfaces in firmware drivers either.
> 
> What is the high-level description of the 'PS_MODE' here? Is
> this perhaps something we already have a user interface for?

The reason why this can't be mapped as memory mapped device is that it
is in IP which has be secure. That's why routing is done via firmware
driver.

Based on
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

page 46

PS_MODE Input/Output Dedicated 4-bit boot mode pins sampled on POR
deassertion

It means ROM just capture boot mode at start that's why they have
special meaning and after it is free to use for whatever purpose you
want which seems to pretty much as generic purpose I/O.

I wrote more comments in reply to Linus already.

Thanks,
Michal
