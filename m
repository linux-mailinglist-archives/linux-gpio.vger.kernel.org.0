Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0BA2935AB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 09:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404961AbgJTHXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 03:23:11 -0400
Received: from mail-dm6nam10on2057.outbound.protection.outlook.com ([40.107.93.57]:42337
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731209AbgJTHXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 03:23:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEAAUt0YbIxmkrmD9H8rbdp/N2c3v9bm5Pdtjf/6WxQ/xkyys3zjeReuBohVfqon5TdHc05CWU/r36T0xgwk47QvFm789+iYWnuNl94MB6jt/UqTa9flm41nQrbiTKhy53LD4shvEk3/9cO54HfsFcYSP+EOO46+L7PTLnFdA88G+UJ/URRhz7Hx4TQ3cWq26ShxxBUr/4nXF7hDFERg+8aCRNrAJfDgUAs0hFPoMPginwP+TwlNAj0UjxufgU9AMQFcsRnYop595aCZ0Po0EYw4ym9y67qzW/W9AoVwQOWOFClek2tGqdz995ZyZ5zvlaMDXWOvH1Ct+d84TzZV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGUrNGAoAhV8ZAtmdVJxYmCqEgMAq1qr2us420F6SaU=;
 b=YVi0vxIfPl02SAuap2CFF0ik33lDWWsrthxZp8fI9fOWINmc3LrG37uZI9Oa4eeHb5f8jHYo8gwIA6yA4kYQCz/qLEHErP8huHWoVcGachDAjkDyi4Sk7hiP5OokI3VxW3K73ofy2WZl8PaKZ70ohdQkOeXyu0kH8jtfQTG+ctvzqTYt8ZHepDGmbmZz/tcoZosc9VRDpTGOGeldoWmbS/9nuuQ+4Q+MOqgkX4w4qyY2TWcXtVN0nQIClF12CNXZpONnituvN0ckvFhueTeyJWecYS+B6Hdq5Np4ekEFpa7+UG+/fik6APWNH6WiamYAOQaIVV1clQVNFtBkxZ3Feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=calian.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGUrNGAoAhV8ZAtmdVJxYmCqEgMAq1qr2us420F6SaU=;
 b=E6ek6g/kBt9rmlODHe9CKG+ODZjeV/ujiGZ9YylYIPivSGEAzDmSwHvWGd+IpT2yrT7b9d5FekfuAgwQPyyQ0ds+MEBhEcQ1igWuJ14IFh5cQOFmcZKNXYZqgJL+5RyfSWM0E91cQU+IkMWqIMAvs4Polcbjq/ssIXO8N86tSG4=
Received: from SN4PR0801CA0021.namprd08.prod.outlook.com
 (2603:10b6:803:29::31) by SN4PR0201MB3534.namprd02.prod.outlook.com
 (2603:10b6:803:44::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 20 Oct
 2020 07:23:04 +0000
Received: from SN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::3a) by SN4PR0801CA0021.outlook.office365.com
 (2603:10b6:803:29::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Tue, 20 Oct 2020 07:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; calian.com; dkim=none (message not signed)
 header.d=none;calian.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT033.mail.protection.outlook.com (10.152.72.133) with Microsoft SMTP
 Server id 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 07:23:04
 +0000
Received: from [149.199.38.66] (port=33970 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kUlyD-0004ZZ-Dz; Tue, 20 Oct 2020 00:22:09 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kUlz6-0000X7-AV; Tue, 20 Oct 2020 00:23:04 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 09K7Mt4l025909;
        Tue, 20 Oct 2020 00:22:55 -0700
Received: from [172.30.17.110]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1kUlyw-0000Nr-Rx; Tue, 20 Oct 2020 00:22:55 -0700
Subject: Re: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
To:     Srinivas Neeli <sneeli@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Cc:     git <git@xilinx.com>, linux-gpio <linux-gpio@vger.kernel.org>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
 <YT1PR01MB3546541973024526CDB6BBECEC1E0@YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM>
 <DM6PR02MB53868B37CD6C93BB4F9FCF98AF1F0@DM6PR02MB5386.namprd02.prod.outlook.com>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <53ea7096-e434-182b-7734-8e5abc1af90c@xilinx.com>
Date:   Tue, 20 Oct 2020 09:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <DM6PR02MB53868B37CD6C93BB4F9FCF98AF1F0@DM6PR02MB5386.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49fefbb6-d19c-4bee-4dbb-08d874c8fc3a
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3534:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3534AF4C004C879D90607C47C61F0@SN4PR0201MB3534.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7cHR7b037ecrQuiwNnlT1N+gUo0YA6ZXVn8WPciC/zfeiO9i8D8e29/b10PA8lls8RLiNdiq0Tv6uB8GCMm+jgyS3fYSFKUTpD8J2eUjv3yB8cUIZtMDRQM07bycGq1rD56IeIW+iIp77l1z2RUgXMLIFGSWMwANPJTx2nE/xZuxt/Hwl8e5vpmPk2PrfcLgfLclRpEimatiOEBCqs5VBw9nv/PThXryOnz5DQEQ47RTF9wJB6aUo58kQpMpsavwaTAaamN7zVSJJhWj0V/Iyj9ME4MH4tx/2bNg3JeawY09uyl/q2NBLsZ6o0i+1hUpVMsYMVqK2rMGl6xuk84OXco4k+yhM76zEaREpadvDtrRgzcrApwFjeTXsfrAmisV7PFYnXYCYNrAs8BreCIgrnQamYNmoCs16yS407iXfzBtu/rMJZyvG1rhJHmjXtvZQpfCERfFnI5E4ubBOk+Ufd/dG73w8Vm157CrAADkR0UauQdROKMrP4Tx4paqXFm
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(39860400002)(46966005)(26005)(81166007)(2906002)(4326008)(478600001)(336012)(8936002)(47076004)(6666004)(31696002)(82740400003)(316002)(5660300002)(6636002)(31686004)(110136005)(70206006)(36756003)(70586007)(426003)(54906003)(2616005)(9786002)(53546011)(83380400001)(186003)(15974865002)(8676002)(356005)(44832011)(15650500001)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 07:23:04.6855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fefbb6-d19c-4bee-4dbb-08d874c8fc3a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3534
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

let me correct this. Merge Window. :-)
5.10-rc1 should be tagged on Sunday Oct 25. After that patches can be
send again.

Thanks,
Michal

On 20. 10. 20 8:59, Srinivas Neeli wrote:
> Hi Robert,
> 
> Will send the next version(v3) after Mainline Window close.
> 
> Thanks
> Srinivas Neeli.
> 
>> -----Original Message-----
>> From: Robert Hancock <robert.hancock@calian.com>
>> Sent: Monday, October 19, 2020 11:18 PM
>> To: Srinivas Neeli <sneeli@xilinx.com>; Michal Simek <michals@xilinx.com>;
>> Srinivas Goud <sgoud@xilinx.com>; Shubhrajyoti Datta
>> <shubhraj@xilinx.com>
>> Cc: git <git@xilinx.com>; linux-gpio <linux-gpio@vger.kernel.org>
>> Subject: Re: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
>>
>> Hi Srinivas,
>>
>> Just checking if there is any update on this patchset? It looks like there was
>> some feedback but I didn't see another version submitted.
>>
>> Robert Hancock
>> Senior Hardware Designer, Advanced Technologies www.calian.com
>> www.sedsystems.ca
>>
>> From: Srinivas Neeli <srinivas.neeli@xilinx.com>
>> Sent: July 23, 2020 8:36 AM
>> To: bgolaszewski <bgolaszewski@baylibre.com>; linus.walleij
>> <linus.walleij@linaro.org>; michal.simek <michal.simek@xilinx.com>; sgoud
>> <sgoud@xilinx.com>; shubhrajyoti.datta <shubhrajyoti.datta@xilinx.com>
>> Cc: git <git@xilinx.com>; linux-arm-kernel <linux-arm-
>> kernel@lists.infradead.org>; linux-gpio <linux-gpio@vger.kernel.org>; linux-
>> kernel <linux-kernel@vger.kernel.org>
>> Subject: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
>>
>> This patch series does the following:
>> -Add clock adaption support
>> -Add interupt support
>> -Add MAINTAINERS fragment
>>
>> Changes in V2:
>> -Added check for return value of platform_get_irq() API.
>> -Updated code to support rising edge and falling edge.
>> -Added xgpio_xlate() API to support switch.
>> -Added MAINTAINERS fragment.
>> ---
>> Tested Below scenarios:
>> -Tested Loop Back.(channel 1.0 connected to channel 2.0) -Tested External
>> switch(Used DIP switch) -Tested Cascade scenario(Here gpio controller acting
>> as
>>  an interrupt controller).
>> ---
>>
>>
>> Srinivas Neeli (3):
>>   gpio: xilinx: Add clock adaptation support
>>   gpio: xilinx: Add interrupt support
>>   MAINTAINERS: add fragment for xilinx GPIO drivers
>>
>>  MAINTAINERS                |  10 ++
>>  drivers/gpio/Kconfig       |   1 +
>>  drivers/gpio/gpio-xilinx.c | 404
>> ++++++++++++++++++++++++++++++++++++++++++---
>>  3 files changed, 395 insertions(+), 20 deletions(-)
>>
>> --
>> 2.7.4
