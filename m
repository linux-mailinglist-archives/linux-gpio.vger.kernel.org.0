Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259FA443A6B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 01:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhKCAht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 20:37:49 -0400
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com ([40.107.237.61]:17761
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhKCAhs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Nov 2021 20:37:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9QCSCsTatEyF24IJNqo52yW3uoA5iV7p53JfxhVjBZ1Amq4IfCBCQcZqIJK9uQ//TZ54CCeDDAir/jUKlW55LLhN4zHeZpO6zE2bQmSf7R8HuYKwHYMuhhIQvus6fSkvoYPd+6dn8Lu1tvxDIXf2wFwPriOJyeAyM+kl/eCQ1/rhykKMTe5la+ZTBIOqMUH5ljvtmrJC5KQJqegg5kKF1Q51wT6bVSbyUcozPfdH+i+hrv3E+FwhOk5KaQrBH3/Uy005rjA+S5JLQ3u2GdrnllzamC1hEsPTsZJ1Bwy2XFqQwRu+ZvoUQIh5bBMFkZzJYyf+hhTknVLRZjlAm2lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlYIZHOnDE58Q1y+HDJLus2LokZmLQcy8wnDyfhMSyk=;
 b=bqfiY7dTYRry+vF/ypF1KEB7NYIUHHV+WsD5L3duxRWFoOeKZzXQAi/onttUjmr+CZGEXFo3L7orpZu5KLZFyx0TuNU9+LdhKjF0DEA4Edm1bQJP+R5KfaSAbXp5B0zEcHCwBdQFMw3fxQUM9Y7xsx0MujnwdUKuvkKcEfcleT37SfNFCnyxBJbqfBa5EnMHb4BqGktp/Od3XAP0iYJEgpeC8eFjUjc7yl3U1YqzxTkA8Ua+D85u0ZnUGFCD5P1wSbgF/z6zhDBqPV6xrEF10ukW67dkkUjKCVQeg5sTFHxKiFqGMVKrdlRn0UoQd59GluSntF1L5Jjtc0P3YcjPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlYIZHOnDE58Q1y+HDJLus2LokZmLQcy8wnDyfhMSyk=;
 b=l2NjiDJi1mabLIw+jeTKXhm6R1DrULJSZolZ93g/vo7kq4tmDg25PyM15dzVq8JmQbICKh6g5gLs45LG89Po3dINUxaIgnq8urmM3JguFXi/maJCiUBEHTq9mlPwRsU4YioDpLnSzrQ4+XuFOc0BeAJXAcubyTVEXu27gWrEsGDJn2ti3yx+sF4DYsKXWtNvOE+kGjYXv/8Lqs5qnbcnbPZyW6EHo+4XbNoSzNVGWsGYqBA5gK5xGIsE1blFtRILoy0u59eRpaC7BdSRQxEGvGLPIOpmvJG04bG3ehXN7uh8ZeeJH9uLJBLj1HwO//u2YARAmMj3LDaz8aYP7OgBiQ==
Received: from BN0PR08CA0028.namprd08.prod.outlook.com (2603:10b6:408:142::27)
 by MN2PR12MB3581.namprd12.prod.outlook.com (2603:10b6:208:c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 00:35:10 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::23) by BN0PR08CA0028.outlook.office365.com
 (2603:10b6:408:142::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 00:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 00:35:09 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 00:35:06 +0000
Subject: Re: [RFC v2 01/11] Documentation: Add HTE subsystem guide
To:     Randy Dunlap <rdunlap@infradead.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-2-dipenp@nvidia.com>
 <70321686-276c-b972-302a-e649f28412de@infradead.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <fa9d2328-2b4b-fa94-f884-3980706c1ae6@nvidia.com>
Date:   Tue, 2 Nov 2021 17:36:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70321686-276c-b972-302a-e649f28412de@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca91de19-c5b1-4e7e-b9eb-08d99e61cae8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3581:
X-Microsoft-Antispam-PRVS: <MN2PR12MB35819D718A4D975A3A99B1E9AE8C9@MN2PR12MB3581.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a63TZY9thK8yiKI+WnUogp/3WTuJKEAKBSWROOa5QMBvg8rWeLQiaAUpx2rgQS5J9Maju/NJy1y/RMO6Gs4/o199zCZQNhda5z6SVs9HNsZ3gJxdg0riBTfQ4qoSlsw00k0yJDFCDIT7YKFKd279ct+rf0pjzgNQTqUvdgOnPKfqwwUktUhqgPCjBjldIwmJrr3ZjO9F/kv83C0olo07qeCb09vacFU7z0l2wxqq512/cOltFJ5PHKuDKKFxX934KGb9DOBmzk5s3DCOYIuMYIrlICbSqCY5U5x2Fl6ODvpq4/aMTgtUhAqHvBX3A7fjVh2a4NOYmx69UgO8IkFmgY++sqSi3tUAu1xhvl8dlybEcNIMtZtl8symsd+0k87A8H2Ryl++ITNHaUVxMf3EE8VA25xJRGC+/PXY3/8N5GSnbc+D4ccKoA7zKFVhml11qI7GmPb6CcieorVH+P2ZGldDsE8zRq9i2gr9SA9L34uf2kf8SwK4RAQRVrrJtU1UeSPDH0G5O/lrIE7zNrIXdPTQ4Amn4xXBZt874iMgv8JbjQjlpfVy/wC6WtZTu6OWUARgOciYzA1t/h/gw7pCJnWSAXs1EQcn0BaVWtv6Tf+k/a4QwCHEzi3o/KY9uDUcvdRgK8LYPugB6nrB6zJLVsS9f3iU0zlJvM3Qowg+Fx/xivoBueLH/qYuLAq9TKHzuly/L5dRqMxk0GxbFt38ZMr1FmLSPsZKBI3zvLl6cammwnLgEnlApnCn2N9TF+3mKahWKBBAKPhNEzRBiXIkQxhG3z2JWPjcyJcmzEUXOKg=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(16576012)(110136005)(336012)(2616005)(426003)(36906005)(83380400001)(8936002)(316002)(31686004)(47076005)(70586007)(186003)(7416002)(7636003)(16526019)(31696002)(53546011)(2906002)(921005)(6666004)(70206006)(36756003)(508600001)(36860700001)(8676002)(356005)(86362001)(26005)(5660300002)(43740500002)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 00:35:09.9953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca91de19-c5b1-4e7e-b9eb-08d99e61cae8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Randy,

Thanks for the comments, will implement all your suggestions in RFC V3.

On 10/1/21 5:18 PM, Randy Dunlap wrote:
> On 9/30/21 4:26 PM, Dipen Patel wrote:
>> Adding hte document which can help understand various APIs implemented
>> in HTE framework for the HTE producers and the consumers.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>> Changes in v2:
>> - Removed explanation, instead added kernel-doc references.
>>
>>   Documentation/hte/hte.rst | 83 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/hte/hte.rst
>>
>> diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
>> new file mode 100644
>> index 000000000000..c9b1badae601
>> --- /dev/null
>> +++ b/Documentation/hte/hte.rst
>> @@ -0,0 +1,83 @@
>> +============================================
>> +The Linux Hardware Timestamping Engine (HTE)
>> +============================================
>> +
>> +:Author: Dipen Patel
>> +
>> +Introduction
>> +------------
>> +
>> +Certain devices have built in hardware timestamping engines which can
>> +monitor sets of system signals, lines, buses etc... in realtime for state
>> +change; upon detecting the change they can automatically store the timestamp at
>> +the moment of occurrence. Such functionality may help achieve better accuracy
>> +in obtaining timestamp than using software counterparts i.e. ktime and friends.
>
>                 timestamps
>
>> +
>> +This document describes the API that can be used by hardware timestamping
>> +engine provider and consumer drivers that want to use the hardware timestamping
>> +engine (HTE) framework. Both consumers and providers must
>> +#include <linux/hte.h>.
>> +
>> +The HTE framework APIs for the providers
>> +----------------------------------------
>> +
>> +.. kernel-doc:: drivers/hte/hte.c
>> +   :functions: devm_hte_register_chip hte_push_ts_ns
>> +
>> +The HTE framework APIs for the consumers
>> +----------------------------------------
>> +
>> +.. kernel-doc:: drivers/hte/hte.c
>> +   :functions: devm_of_hte_request_ts hte_req_ts_by_hte_name hte_release_ts hte_enable_ts hte_disable_ts hte_get_clk_src_info
>> +
>> +The HTE framework public structures
>> +-----------------------------------
>> +.. kernel-doc:: include/linux/hte.h
>> +
>> +
>> +More on the HTE timestamp data
>> +------------------------------
>> +The struct hte_ts_data is used to pass timestamp details between the consumers
>> +and the providers. It expresses timestamp data in nano second in u64 data
>
>                                                      nanosesconds
>                                              possibly:           in a __u64 data
>
>> +type. For now all the HTE APIs using struct hte_ts_data requires tsc to be in
>
>                                                            require tsc to be in
>
>> +nano seconds. An example of the typical hte_ts_data data life cycle, for the
>
>    nanoseconds.
>
>> +GPIO line is as follows::
>> +
>> + - Monitors GPIO line change.
>> + - Detects the state change on GPIO line.
>> + - Converts timestamps in nano seconds and stores it in tsc.
>
>                              nanoseconds
>
>> + - Stores GPIO direction in dir variable if the provider has that hardware
>> + capability.
>> + - Pushes this hte_ts_data object to HTE subsystem.
>> + - HTE subsystem increments seq counter and invokes consumer provided callback.
>> + Based on callback return value, the HTE starts kernel thread and invokes
>
>                                             starts a kernel thread
>
>> + secondary callback in the thread context.
>> +
>> +HTE subsystem debugfs attributes
>> +--------------------------------
>> +HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
>> +It also creates line/signal related debugfs attributes at
>
>                         signal-related
>
>> +``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
>> +
>> +`ts_requested`
>> +        The total number of entities requested from the given provider,
>> +        where entity is the provider specific and could represent
>
>                      is specified by the provider and could
> (just guessing here; I could not parse it.)
>
>> +        lines, GPIO, chip signals, buses etc...
>> +                The attribute will be availble at
>
>                                  available
>
>> +        ``/sys/kernel/debug/hte/<provider>/``.
>> +
>> +        Read only value
>
>         Read-only value
>
>> +
>> +`total_ts`
>> +        The total number of entities supported by the provider.
>> +                The attribute will be availble at
>
>                                  available
>
>> +        ``/sys/kernel/debug/hte/<provider>/``.
>> +
>> +        Read only value
>
>         Read-only value
>
>> +
>> +`dropped_timestamps`
>> +        The dropped timestamps for a given line.
>> +                The attribute will be availble at
>
>                                  available
>
>> +        ``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
>> +
>> +        Read only value
>
>         Read-only value
>>
>
>
