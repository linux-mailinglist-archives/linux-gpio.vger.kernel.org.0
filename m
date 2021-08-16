Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BBF3ED0D9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 11:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhHPJIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 05:08:50 -0400
Received: from mail-dm6nam08on2077.outbound.protection.outlook.com ([40.107.102.77]:7777
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233053AbhHPJIu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 05:08:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do2bmTzWtLF+Fkf0WxoJ+MaRHdsjDGgIPbaKvW1lPKhVDQAMzhGyAb8+mcQTowZoD4l5NfpoeJcZmX/v3Zyt9QwEEqRSbXE2WpD2aURtNdcrHsQm8KTBre3QdRU4n+CUeEqHyfBDtctpQeR75CZ9TfmFVQHR90p78H8x80e2pNHG9jQaiZM2syjiRh9saHcydQ+ycy2PTm4CpyfKPZGoxDeS/M0Nx5wDh0uvQdmhcdInuD62dVC+I9FHRbG/Nu4VxmyZM9LAYQ3dalhGaqEWbno+6m7LeE0/oS1VXOQetyoQTSx7G9EqliYHj3vpo3oAM20KiAgAnjg/XhuSVskJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2gVf9fz7jjMjEFy/qnh7CWONKuz0yS4FXONGGD4Wxc=;
 b=ENxNUPxitxkwOA92oIgB2H6gaxTEB6+7x97C8hYw67DNmB/Hm4rA47h+dXA/Me5hIVpe4uD1SDf7XfRgDIIskOApEZFWsOmU3vTwZxcC/ozJMeGGiVvpK9HfIld9G7o/QN/lpzOfzGSqfDvFtjXJXMMQm2Zz96AliOv3zUDajhxZCtTelnDV3f8tTW6F4wFQeVQO4Yf8ks9Mc6uTutdXLoNwGoUdEx/RwZdO1Ps62s5wdsmYcozVBmcs8d15khDG7y7YlBZAFpfQavDsD3lX8DlTi2igBO4bdLxS0iN8mecWpNeXdirpPfDCJ7hh8KkBpY94cd1HHGGfZGjUBvh4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2gVf9fz7jjMjEFy/qnh7CWONKuz0yS4FXONGGD4Wxc=;
 b=CyptrVachFd7a0Qa+pByxuWT+HzDjXluZkNiWVd7fpnP4ZWGwvIlDbGA2M7hAeuRdTGtkyadleHvSkFYh0hEAbNGPD+/Ix9cZZxaKyfSPRfTc6DATNgRmrrRVKa+A4Hn8CpoLzCXCdLXLZ8VdxTVq/0xvLzHWTpbGPEh48KbzcY=
Received: from BN1PR12CA0016.namprd12.prod.outlook.com (2603:10b6:408:e1::21)
 by BN6PR02MB2289.namprd02.prod.outlook.com (2603:10b6:404:36::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 09:08:17 +0000
Received: from BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::a6) by BN1PR12CA0016.outlook.office365.com
 (2603:10b6:408:e1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 09:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT027.mail.protection.outlook.com (10.13.2.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 09:08:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 16 Aug 2021 02:08:11 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 16 Aug 2021 02:08:11 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 robh@kernel.org
Received: from [172.30.17.109] (port=54076)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mFYbJ-0000uK-QX; Mon, 16 Aug 2021 02:08:10 -0700
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
From:   Michal Simek <michal.simek@xilinx.com>
To:     Rob Herring <robh@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, <saikrishna12468@gmail.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
 <bc5185eb-8051-89ca-4a5f-c4e5fc90a7f2@xilinx.com>
 <CAL_Jsq+281knebcN--jQgYWtDQO4OV6ZO5CvnYpaYqrAaiGmPQ@mail.gmail.com>
 <fd759de0-d74f-3aa1-ad46-e3ee7f7f7e3f@xilinx.com>
Message-ID: <c49c9633-4bc6-0cdd-cb3d-8b9ffc92b671@xilinx.com>
Date:   Mon, 16 Aug 2021 11:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fd759de0-d74f-3aa1-ad46-e3ee7f7f7e3f@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 896ecd0b-b81a-4bfd-fcbf-08d9609562e1
X-MS-TrafficTypeDiagnostic: BN6PR02MB2289:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2289B2362C072E96AC039C2FC6FD9@BN6PR02MB2289.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kO1ptz2TCs5pr5IPWKZDPEBgziiqOAhmG+ME0F//hUm5I62ucSixTDHQ2OjGjv/85VRAjZHjYkPUxgTfE0idm7JiXBurgEwP8Lvtzngawsq7nsyZ+LgT3xZpVMvxiMIj+aIMfZrsuoBahBCOTbXV5cdAOZKD+4rxMKaDT7vxn0nPiSVFhhAbFzaxLvua8Z+3jlowaYkB+XtllWJ4Hfj6zADLJeW8SSFoYbprCKi/07R0Yn9q8jpw21mGuRpBAF9PmMYQw3Q3n75InMZC3G1i8/gRutN20Tswpei+jZY0oJDwKV9tmsLjMi3OPlyT2rw93nGx2xB2b8A/hYMfFT7DRiWqAHt5sYhc4DeDIInBCpd+wOsmcQxn2eQExWGNHCg88pCEIjXpeUTtfwUesiqwXZlmnQCG6pSDVMwxg+skr5/M4ZtjrJseCr+zyxTEuRop2XDtqkvHOrilILyXiR/p3TgRnCCfTo7M+WJG2PRvp73XbetnkX8o9cHps9hfgd/+XPQQMzm6o3siXJpumwgVVFy+1zwNWuRP8ePXHtvMFC+IxiMiQdNWsCsYvRUqKGltk2YCH0vtJV5jOM4Bt8c5P+M/SCTccpPG8Yzq4Z2mvkozBA5HGdBqIwODbyTzRvhm6GgYEglpVU3u2lTNWI2z/wLVHyjCPfvt3qfJ2ju+m5yidl15S/hRXgGMahXlOC6SrBVG9SmlPwKgbFw0k8vRszlNNqjd0SSkoVzXE3Se56y0NW3AGf4efn6Qb9cmOqlt4SccwDt7IhIVQS/Hga2Gzw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(36840700001)(46966006)(9786002)(53546011)(426003)(82740400003)(44832011)(31696002)(4326008)(336012)(478600001)(8676002)(186003)(2616005)(8936002)(7636003)(356005)(26005)(36860700001)(2906002)(31686004)(5660300002)(47076005)(36906005)(316002)(110136005)(83380400001)(54906003)(70206006)(82310400003)(70586007)(36756003)(6666004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 09:08:17.3677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 896ecd0b-b81a-4bfd-fcbf-08d9609562e1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2289
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 8/5/21 9:52 AM, Michal Simek wrote:
> 
> 
> On 8/2/21 7:29 PM, Rob Herring wrote:
>> On Thu, Jul 29, 2021 at 10:59 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>>
>>>
>>>
>>> On 7/29/21 9:59 PM, Rob Herring wrote:
>>>> On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
>>>>> Replace 'io-standard' property with 'power-source' property in all zynq dts
>>>>> files to be in sync with Zynq pinctrl driver.
>>>>>
>>>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
>>>>>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
>>>>>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
>>>>>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
>>>>>  4 files changed, 24 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>>> index b0b836aedd76..be7eae611fb7 100644
>>>>> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>>> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>>> @@ -57,7 +57,7 @@
>>>>>
>>>>>              conf {
>>>>>                      groups = "gpio0_20_grp", "gpio0_32_grp";
>>>>> -                    io-standard = <3>;
>>>>> +                    power-source = <3>;
>>>>
>>>> This will break using a new DT with a kernel without patch 3.
>>>>
>>>
>>> What do you suggest? Not to update any old DT?
>>
>> Your options are don't change the dts files, patch 3 needs to go to
>> stable kernels, or you document the breakage (if you don't care).
> 
> There is no intention to go to stable kernel and I don't think this is
> stable material. Linus has applied 3 patches and this one should go via
> my tree. It means I will make sure that this DT change will be in the
> tree when pinctrl changes are applied.

Any issue with this patch? Or can I apply it to my tree?

Thanks,
Michal

