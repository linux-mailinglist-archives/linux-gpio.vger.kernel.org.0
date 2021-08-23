Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E63E3F466F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhHWIPF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 04:15:05 -0400
Received: from mail-bn8nam11on2079.outbound.protection.outlook.com ([40.107.236.79]:45886
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235316AbhHWIPD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Aug 2021 04:15:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/JP+xDCWnETnddC9j6QX99jXhPEtj+UkhyPkvQr17vQ8X7GU9iXecpEwKS1XUGJYpv+9u5DEFGpJPs8verSIhlRslRI3cKy6cNhXVMwjK6rgDiL70NNo0JiooKWi1OU32lBsqmGbWHjFED3HEe064UTY5qyiU88KZt3sRLsFs+ODQGa4oI+t8P1RC+o9DwCvg8AB8zfeVJ10yhHoIVbSSaUMeogts1KuVe8ptwQIeNOCgvC3yVDmJgnHEvViFztyAT+sjmVeH+Xy2RpmTu5542SDupoeANKvnFjYDzmwFf22m3evnJX6aDhxqf0pfVTHQxMa+b40pGvb2zn8QF0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+T66ubG+3EJnOQ7uJVmXTTg9LSZ+vge3WL+9enOAUg=;
 b=N64Hveg76qNceXJsabuprIbgN15IbaMKsCCC6yCgKsPfsu3K6E9LERacm4ZTouYGD1i7n5LGtn7sOHrpSHE9xOUdBal6mM/xHvMgE5OzXjslKct8g8+v4gBUXCIZcJwCCTDdtM3WNnxXIymfmMBK/HWPhrxZ1qx8y8A1zzSxVwBKdURLfexWiEQW5Mm05B01JUg0sR3vylPFJQ/TXCdM7xM45SdJHN9QitL93DqQ2pu4q2R9YDDPK9u3/zqPfzaJk0IM9lBJ2grxWQmVyKZcPPDobcxaCTGtqmMfzH47rp7sRJUdli6Sh5ruCyFOEE/knNf7WxgJCq9GfS/X09hVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+T66ubG+3EJnOQ7uJVmXTTg9LSZ+vge3WL+9enOAUg=;
 b=bccU4tFdfABzuSWsc27xuob2SbEICP/f8uGUWILR4kq/51orGtiCYvnMrrI3UmslktKcQRENMGGZdyfvWkp1m5ENvkvZKv7rwWoeEHFRYlzlUsFyUqQgjWQsYyU4hjx7TZW/4AtSFf43yVtJl3KBClW5QxXSKVb+Ti6IU14nH1I=
Received: from SN4PR0501CA0081.namprd05.prod.outlook.com
 (2603:10b6:803:22::19) by BY5PR02MB6418.namprd02.prod.outlook.com
 (2603:10b6:a03:1f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 08:14:17 +0000
Received: from SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::bd) by SN4PR0501CA0081.outlook.office365.com
 (2603:10b6:803:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Mon, 23 Aug 2021 08:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0024.mail.protection.outlook.com (10.97.5.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 08:14:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 01:14:16 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 01:14:16 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 iwamatsu@nigauri.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de,
 bgolaszewski@baylibre.com
Received: from [172.30.17.109] (port=35578)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mI55z-0001wb-24; Mon, 23 Aug 2021 01:14:15 -0700
Subject: Re: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO
 controller
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Piyush Mehta <piyush.mehta@xilinx.com>
CC:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <wendy.liang@xilinx.com>,
        "Nobuhiro Iwamatsu" <iwamatsu@nigauri.org>,
        Rob Herring <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        git <git@xilinx.com>, "Srinivas Goud" <sgoud@xilinx.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-4-piyush.mehta@xilinx.com>
 <CAMpxmJUvPg3LvT1EJa-ZecXMWpR82EQMr8vhTjBpO3_6iiGecQ@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2286343a-e061-d5bb-b266-6f657cba63e2@xilinx.com>
Date:   Mon, 23 Aug 2021 10:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUvPg3LvT1EJa-ZecXMWpR82EQMr8vhTjBpO3_6iiGecQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bfaa1d1-9ff5-4880-c819-08d9660e00a3
X-MS-TrafficTypeDiagnostic: BY5PR02MB6418:
X-Microsoft-Antispam-PRVS: <BY5PR02MB641827D5E2EDABDC7E6CEDB5C6C49@BY5PR02MB6418.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 417dcU2B1RczQzXroOytsBpn7O6YnFeYBhM9wWSgnzSRO0RfvNnVzkAPizIsO2FUEIZxFrLnRpAT41q57M4n2x2aKlCXs8xrnMG/vRL8GJg5RH7jjm97W9pWtcjXEs1NrOrKP3g3gxd1ldcoKGlBNWmmIt42NBe8AI4Rnvoj0qJeG+umfzXb+I3gJtrberz06CM5m0GhVRZZdB6NPiqEJR4kH6XilnngGuvOGPkz1MwipF9fMKbH3Rx11TMB7i5pRmRHNcHt4xwjWr7+nWAIPugPCUsALE0hHk9XvCTSou3YFKtNiR4LdZj8izVZpA0nJZqLoOY4HsTVu10Gcuu/DfXILko0Um8XcshqbSTgs2uCTfg3h7x3LF5HD1kTUkKt89zLjy0FQIgwzYk5ZWY+v6kRTP9cdcVdpMGacv2eKLrXt45IGzCGafmi3b+Laq0wXB00LXsRmqnPtqLuBLrWRxzwuAXAgKe2V7fkAEn9cTmKXH72QAZP2DbqT298rO1nt4UjmcbC1Dgd7wMiwrnS9znqxgaCZo49t7DDiDpXW0MkFtGAMalS/TqYUMSb9QOarQRpyKWmiZFnvtiqoZ45Cz9ZBwFxH12EA24CkL3OUFYgjpd/WwTpthX8VsoQFXHwUqh8EQ/vo49oHtMEm2CTvG0ta8WD/PB7uq+kpUOCsWvcoqB6QRcrbiat5fMJmVAu5BGMGW6/l7oYk1MwGhqHM4Gaqprtjqkv1zjeq5MnYTmf4o5PPfv/LSkCBFRCWqaeFRHzpnXY5r2+Oln3D24whg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(2616005)(31686004)(426003)(336012)(31696002)(6636002)(5660300002)(70206006)(70586007)(7416002)(54906003)(8676002)(4744005)(2906002)(508600001)(4326008)(9786002)(26005)(36756003)(36906005)(47076005)(8936002)(316002)(356005)(36860700001)(44832011)(6666004)(7636003)(186003)(53546011)(110136005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 08:14:17.5145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfaa1d1-9ff5-4880-c819-08d9660e00a3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6418
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

On 8/23/21 10:02 AM, Bartosz Golaszewski wrote:
> On Wed, Aug 18, 2021 at 10:11 AM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
>>
>> This patch adds driver support for the zynqmp modepin GPIO controller.
>> GPIO modepin driver set and get the value and status of the PS_MODE pin,
>> based on device-tree pin configuration. These four mode pins are
>> configurable as input/output. The mode pin has a control register, which
>> have lower four-bits [0:3] are configurable as input/output, next four-bits
>> can be used for reading the data  as input[4:7], and next setting the
>> output pin state output[8:11].
>>
>> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
> 
> Which tree should this go through?

I would prefer to go this via gpio tree.

Thanks,
Michal
