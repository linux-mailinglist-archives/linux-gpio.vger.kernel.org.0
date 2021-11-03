Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE169443A76
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 01:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhKCAi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 20:38:59 -0400
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com ([40.107.244.75]:45148
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhKCAi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Nov 2021 20:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIQb/TJa1WKdWZN4a5Gbp66swYpVq61q951zix3vSCZHLDznBYG00scnTcU6c2d4pTT4XyKZUhL86Keehjk/Toza/QO12P3Yf+qB8SR4/dDaM/gcBrBLW3MROS51g9nFFRHUJu4ov8QYSI7KvkMdRZLJe5WTFodfh5qBbeavAiOCjNKgnrv+CDuAlIY6p8mz7rasqo4exI8BVXJSOssXvwXC8LnVPqjG/szsBEWQGX3YCNGIGByjBwPnLDSwRVgTg0zg2xp45FaGvj5Qe51CvUwwptpyiAfsSXJxt6UtEuJoN+EnU2T+dDSUhgOoAqZvXivtFtg38LY5W1p5dpyzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH5jxM49JMmiKzgqtmIyfO7TI/XvZiQSEiiVMHZm78g=;
 b=EeRPUj3xJ1wuYBU2BC5uQ9AZV408khkgzTkDUHtbttdRUmdz11KZyeAbm3ILOpuL5xHPBsYDPtwORLRSp+WKeIGJEYopMIj4Pz/L8SIuvSqUq+uknKuXOgOyQi6/5icC1B7CHT/NdYuHT17nFFfpVvCP38ZoX9GXJz2DJz/1FHyDa7mJlXYJQrkQYv0MBY9SrkMO0czngoGFH8RfcVycko6OYLp3o1rYtF7AY5hYEM+Klnvh7C7PVqW1IyVwmt82p3BQGssqN4MXD/L8DXD2L0/8caBr+Qq39MDjAhR0Z2y4HkujDedOJCyvuFldyBTlrXdxtwbsP/a9OIS9mGJ6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VH5jxM49JMmiKzgqtmIyfO7TI/XvZiQSEiiVMHZm78g=;
 b=F8i1m1nk53TK6MJLy26Ctwvbv5Ocs4W/jpznZKq5LQ2Ln8Y6RFYxa02b6v7/MbMz03YKaWpsx3T2SLcUz+iCA+K8rfEmcXUN37SggXpaTO9oQpDwJkrOmayRvyTv6bohqfrAj3kFAvlQjHqhpU5J3j+tYCvdfkrxInUNQgQtLiJhHIMzqx2YfKFzLQckKYfsnErQUGPbGSX5ZbqzrBEUsZTJ0HyquKhVo2cZKkp/XEH0T2ecgB07/hnmWVg2x5+pj7mv3seUqozKIrD/mmh6LKbeJRXFb7FV7fz+G6JfgIhm6kY+A5hNxDB7c7g8FnX/dKg6XmVhaCiVzV8Kpm62Ow==
Received: from BN9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::18)
 by BN6PR12MB1553.namprd12.prod.outlook.com (2603:10b6:405:6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 00:36:20 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::9) by BN9P223CA0013.outlook.office365.com
 (2603:10b6:408:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 00:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 00:36:20 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 00:36:18 +0000
Subject: Re: [RFC v2 02/11] drivers: Add hardware timestamp engine (HTE)
To:     Randy Dunlap <rdunlap@infradead.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-3-dipenp@nvidia.com>
 <010426c7-74ed-33fb-0c06-c42408cffc0e@infradead.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <b720c238-a285-9741-4209-c22166765fa3@nvidia.com>
Date:   Tue, 2 Nov 2021 17:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <010426c7-74ed-33fb-0c06-c42408cffc0e@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb6aebe-1182-48a6-e78d-08d99e61f4ac
X-MS-TrafficTypeDiagnostic: BN6PR12MB1553:
X-Microsoft-Antispam-PRVS: <BN6PR12MB155330E16F0159DD19B242A6AE8C9@BN6PR12MB1553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRDYA76A6dabcRcYmh3ZFTV8+MvtrRg2XeKI6Witt1SrGqLlLGeC/4IHeIJrLZdPzyerBKlkwUR7Dm0Wc+TNbZuJ0EDrBDMwU2IaiiWz1VA0cDWmZO395gJ2rs51Hxqa1zFaH6aDB/vPQyXxncHk+A0KUvNZbMnTQbnf3g4FZ4kbK+DCRe6ZXwOZOkZSzV5BjcQ4XepXNmgUVodIt3VnsDU25mw8DgNV960nJx++sf3JEhMNdCGUeXLNt7TAXhI8FgeFw5Bbzqymw5lY4o9jWyNStOzs46s/mllguEahzsD8WhldU4GCg2ePdsuAif5YitOKWA9mx1ri+XLRmgdVx8RLslbaJ4Utu7To8gi0mH/UF05DwG8+v94yamkr5Cmkyxo9WuBTqOe4AhHh4lEIzIw6zuSIZgd4Vz3xp+mlssjnGEhfAjhhwaBFQaz9FoP4OQup/EMJ81cCYrF2BD/o7D0gReB5h8JT1xwIKaqySJTJ0tuoKZh+X7eR5KzmfgsGbs8iuOJB6NFc+1EgyWH/lTMQ9z4AjIXFdlN67nNY/umGNuppEVut4szGSzHIFA8agz21KOJk47YAsIe69oaAO7JCK54+GM6lOW9ieRLzeXzGImpNb/zjeLjC8nrjWsMTfqvAVBByOvcvSkyuq4MaSFRvOJUy+U7AUrXHPXtlXix0BLSlcTqD01HFrzTNg9aiSAg57FCYzpxf+QyygR6C7cnGeQNRKMNIUTZ8O7pwLDWTx8Uz7S+xT1sSFwqNSKM1L4/GDCugBeYA0Lz0Ya9AzL5Anm9HAJVKIJATKO17IO0=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36906005)(47076005)(8936002)(83380400001)(508600001)(110136005)(7416002)(70206006)(2616005)(26005)(31686004)(316002)(86362001)(16526019)(921005)(2906002)(36860700001)(70586007)(31696002)(356005)(7636003)(8676002)(36756003)(336012)(5660300002)(53546011)(16576012)(186003)(426003)(82310400003)(43740500002)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 00:36:20.1805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb6aebe-1182-48a6-e78d-08d99e61f4ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1553
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Randy,

I will implement all your suggestions in RFC v3.


Best Regards,

Dipen Patel

On 10/1/21 4:53 PM, Randy Dunlap wrote:
> On 9/30/21 4:26 PM, Dipen Patel wrote:
>> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
>> new file mode 100644
>> index 000000000000..6fdf243d281b
>> --- /dev/null
>> +++ b/drivers/hte/Kconfig
>> @@ -0,0 +1,22 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig HTE
>> +    bool "Hardware Timestamping Engine (HTE) Support"
>> +    help
>> +      Hardware Timestamping Engine (HTE) Support.
>> +
>> +      Some devices provide hardware timestamping engine which can timestamp
>
>                    provide a hardware
>
>> +      certain device lines/signals in realtime. This way to provide
>
>                                                 This provides a
>
>> +      hardware assisted timestamp to generic signals like GPIOs, IRQs lines
>
>       hardware-assisted                              like GPIOs or IRQ lines.
>
>
>> +      comes with benefit for the applications like autonomous machines
>
>       It comes with a benefit for applications like
>
>> +      needing accurate timestamping event with less jitter.
>> +
>> +      This framework provides a generic interface to such HTE devices
>> +      within the Linux kernel. It provides an API to register and
>> +      unregister a HTE provider chip, configurable sw buffer to
>
>                                                    software
>
>> +      store the timestamps, push the timestamp from the HTE providers and
>> +      retrieve timestamps for the consumers. It also provides means for the
>> +      consumers to request signals it wishes to hardware timestamp and
>> +      release them if not required.
>> +
>> +      If unsure, say no.
>
>
> HTH.
