Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B59B3E0FB3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 09:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237881AbhHEHz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 03:55:29 -0400
Received: from mail-co1nam11on2053.outbound.protection.outlook.com ([40.107.220.53]:61766
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236977AbhHEHz2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 03:55:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwuG9PHXpOJ0yoZxLgvpgX+Ry/mYIjmiUnWhDioRi7KZTH73P5yJx2577dtuEkammzmUJaxuFQznBxv+eYg8U5QQ0iDkvXdyM8fxpxSvxtD+IBpvrrfLSmV8BV2S0bWh46VCnlfQBPlcMs/fS9doxDD4997CGhSj4CY6YcorUPh/BDPdQgAdDBoiugqj5eRowpO6w2XJC3CBJXEI+NoItMPgcFS9FnD9Vpapa2GZ8bX0QEnyv7c9K7MSstSAwc+mBRKtu3r8pAwpVYzCnu9i9XN00e1RCPgccMbibK0F9oKZ4ze/dP6RCxHeXYYS/Z1UiS9av2jRP7XVLPAKrxY4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+AZ5GWE6zK24ArJj5bRzzBWFig4nfuMiNvp7IeHj8I=;
 b=KHCqQ0xfhYuFi+ECWYPW+vyybvGlmhgMJRIr013B+KbslRJPOWiaCQe7hbqE5pCTzMV7omyYCFhZUAYVHmuASFALzrfomA7o62HATzDfCwO/ZAqWn1rImuY/jc0OKh4bN8q1mKgai9zO8bkc906q76s0vC1rVjUgA97He7N9bNKMc+uqLMKmZiCcXfciw/NKw1uBiFRZDY0bUh1w1MbKeO/yosmioH3uXBZNKoNMW+/P81tOJnYrw1KDxmaNUtY/tS5brtRdiO99/+Mm8FSZWJX1aEU5wZnBbp9gWZNc/t1XaMkbacRXwS692ATpiWxgKD+u15DEPi+a77aIHExy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+AZ5GWE6zK24ArJj5bRzzBWFig4nfuMiNvp7IeHj8I=;
 b=gq8m6Ssc93cJhWukEArT2u9Cyayw4ay/yShxiAgt/0hN9l3D0OzDoJHiruxIBwFbsHAlKVCMfki8CARQSwZNWHFg0vLpyVeXFzmg9+M6he3++h7UJsRUPCgckX5WxjcbRVoERPsO/d7Le2yjWXx7sbJ4wAvgyVJvETJ8IObjZzI=
Received: from BN6PR14CA0017.namprd14.prod.outlook.com (2603:10b6:404:79::27)
 by DM6PR02MB7034.namprd02.prod.outlook.com (2603:10b6:5:257::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Thu, 5 Aug
 2021 07:55:13 +0000
Received: from BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::65) by BN6PR14CA0017.outlook.office365.com
 (2603:10b6:404:79::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 07:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT036.mail.protection.outlook.com (10.13.2.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 07:55:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 00:55:07 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 00:55:07 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 robh@kernel.org
Received: from [172.30.17.109] (port=57428)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mBYBA-0003Ic-Jk; Thu, 05 Aug 2021 00:52:36 -0700
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
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
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <fd759de0-d74f-3aa1-ad46-e3ee7f7f7e3f@xilinx.com>
Date:   Thu, 5 Aug 2021 09:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+281knebcN--jQgYWtDQO4OV6ZO5CvnYpaYqrAaiGmPQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6a3665-0c17-4d43-e2ec-08d957e65b70
X-MS-TrafficTypeDiagnostic: DM6PR02MB7034:
X-Microsoft-Antispam-PRVS: <DM6PR02MB70343A49EEA1545AD9E3C3DFC6F29@DM6PR02MB7034.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuRssuWlvludF4Rqjhf6K8koj8R7IYaPnG/vwReAg3oDgWUdlTstbsja4Jr98hPujUfjrNpUjxtC3gmeTse98pdpp/zvh9Dz++wqBHYN4w+Ft5rsQljHVazohgF2GuisIGbuDrDar4izxRIbHiMG7zrjLy3QeB/5Niy2+9cbAOt5lgDViAI7anLLPsCTpNp4ID2GoD9XfHvh3yw/a0uY11wR2XY8B23zoKzX1z4CWnhjsXObz//RuJCL4yqWru/8+/A3mOURu5Hiu7SkoPvHKCpT4///AIq5CQdKdGAJygFfKVt2Ysjz/dgA5lnmrI3Vov9iwg0t3EyGDnCuZxYfJusLr6DrzPylsTdlE5H37jJOgWZJMz2Zhx3nM9GTXzkbDoXcBDW2E07B4YCgmn2nxaTDYRMUl03WNJ+AB4k1Oia/XdX/gv6mJSTO9mdvZFOIdAp2ao/EI4kOatPKNDLgOIEazaVnMw9s87+440rTun8k7qIPGmXrNDwGk2YWx4MlsMbZwRRq4HuDJbECjQfQjYRNHqfhWfwB97StB8WUNzKskAmVATrSjL6Xe4HUHlJ4Vh1YPK6WK9w+nu7w8P4c7gn2aL9orxbz9cuGS7AMT8t3ILx9YQ8oFPgT2OaiLKCuMxaiIlyCjaPK32wvCGw6L2h2dtgJll4CtX39FVfJ74pnY/dTzsy56eZnWyJuTH76o85hJAy6OlhrOmB9ZoZGfwKidKfh0Eqdsc18zdLyt31UM7tBamC2k71ZjqPdYX+1reSOszK1TxU0HuS6PKbppQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(31696002)(4326008)(356005)(2906002)(36756003)(7636003)(26005)(70586007)(53546011)(6666004)(2616005)(9786002)(5660300002)(426003)(44832011)(186003)(316002)(110136005)(8936002)(82310400003)(36860700001)(336012)(8676002)(31686004)(47076005)(36906005)(54906003)(83380400001)(508600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:55:13.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6a3665-0c17-4d43-e2ec-08d957e65b70
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7034
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/2/21 7:29 PM, Rob Herring wrote:
> On Thu, Jul 29, 2021 at 10:59 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>
>>
>>
>> On 7/29/21 9:59 PM, Rob Herring wrote:
>>> On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
>>>> Replace 'io-standard' property with 'power-source' property in all zynq dts
>>>> files to be in sync with Zynq pinctrl driver.
>>>>
>>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>>>> ---
>>>>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
>>>>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
>>>>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
>>>>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
>>>>  4 files changed, 24 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>> index b0b836aedd76..be7eae611fb7 100644
>>>> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>>> @@ -57,7 +57,7 @@
>>>>
>>>>              conf {
>>>>                      groups = "gpio0_20_grp", "gpio0_32_grp";
>>>> -                    io-standard = <3>;
>>>> +                    power-source = <3>;
>>>
>>> This will break using a new DT with a kernel without patch 3.
>>>
>>
>> What do you suggest? Not to update any old DT?
> 
> Your options are don't change the dts files, patch 3 needs to go to
> stable kernels, or you document the breakage (if you don't care).

There is no intention to go to stable kernel and I don't think this is
stable material. Linus has applied 3 patches and this one should go via
my tree. It means I will make sure that this DT change will be in the
tree when pinctrl changes are applied.

Thanks,
Michal
