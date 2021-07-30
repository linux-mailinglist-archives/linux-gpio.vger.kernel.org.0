Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B103DB1B5
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 05:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhG3DHL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 23:07:11 -0400
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com ([40.107.93.60]:64737
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229971AbhG3DHL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 23:07:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHauhoCssFTMYNbxLwTQUexjobuPveUDIhoL7GNZFZljaV6MSqiaPw/NGj+asJFl7Gh2wNaGvQTXPBXEpBb/scL3Jh0IT8fMsUN2zcd5S/Hsz02TB+AzlPWMxnv2pKpu3puX2hlGyROJCaAfIYkKRwvWEE8yt6KTNZzGZ4lMVUCG1BrOfzgof78Kyg+nLF+4iNrwlSWB0SgYtH8YXlkMmedsqktkpFHYPhRXQkRXCMwAlrw5jLUIers/vY6qtzmtJAlaS2vAu+2e/XO1fSHrO+GHQtIbhrxNa1BJZIb/k8eKAC1ICBF4ZG0A/oZTXbjftanJxHKe9hctekx1XCPd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXjphJzuSa0fuTg0rixMXjTZ8V8rcOxqVszxF6wKcfQ=;
 b=I9ZiBHNt0F5gJr+JorbZg/TKK+k7+H2HdBU+fNS5hkMUoY3AVXuaCTXxX5jtLnJTv/KVHT//EIOo1kHMx+NFuMdDLfkbZE7Lv+VkRdSfyfEaX/bcXc491JRPrvuhOt1eExhmJfA5JDkPzIwjWPoGmnk2BQzNWwAVCGDsdmCnmsv6Lj+zcqAXmSFmk9V8bho0NMNqP7VYHyabdeKqm3Q+I9KHLpCMgzI4x4IfanIdRTWC+Y3oVQMg08NQNZbfWnGSiynPB3zdGQOaFMUbuVR8tfA0jhf7249jQEs/Op41UjBsEhSICKDWPGg2ZpIUC43VJvJKq063wDKVz4KOo5C1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXjphJzuSa0fuTg0rixMXjTZ8V8rcOxqVszxF6wKcfQ=;
 b=Ur9WH04cLH/BzrQeHPZaVIDUPB/oqcBvCU5KNqlr29SgqvJwfKjGjYDNYlgMxBS6Cer5au5o8ElDGIchx7wO2Zk2f6J8yQXtHivSiikMceLKFVcGmT05O6hP6J8fDF7rMUVh+uo9ysrdZs501vSKSGg3CBhuquRkCC4SZDLFBY9K2GCkpeGFJy2pdMGFk/3d9Qgw6DC1d4Ub5uVYv8LRJRCP2Q+ehbMAmSLlR5ZQd1HJe+vrKr8NML3L9w98/SUINlBOO/jd22YAjvExfdrMhc+4AeQWrWNcu3iw3cQAzLk//AvqTDY9RIAaTHSrDchNNNCvcXWnrvuaFLiKvSBtew==
Received: from MWHPR14CA0049.namprd14.prod.outlook.com (2603:10b6:300:81::11)
 by BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 03:07:05 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::8c) by MWHPR14CA0049.outlook.office365.com
 (2603:10b6:300:81::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 03:07:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 03:07:05 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 03:07:04 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <CACRpkdb-AFvLhwOLSs5ocqiZ6ZwZbQMzWGfQ6C3AX+=ouH+=ng@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <2bfbb684-d9d3-8779-11fe-6b4152f114d6@nvidia.com>
Date:   Thu, 29 Jul 2021 20:16:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb-AFvLhwOLSs5ocqiZ6ZwZbQMzWGfQ6C3AX+=ouH+=ng@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83cc6103-438c-4f3f-68df-08d953071c35
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53201C1216BBD6E2A0F05D35AEEC9@BL1PR12MB5320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P2PkTkcFL3v5e8okW5LiEJETyZ0dQqPu+UUpCigvDWtSYW+Tfkuor4P5GNm6sITu8p5uZl+1XyIRrmnskK6ZWDuHS3WEg3UbkW+S33X/VCOfsLIuhJujgAoVZ1t2kPJN/3Iz0zwzHNtzR2Ew1KdkadCi7yjI2828ivQgS9ICC1iymZlBSVbwGxCY52MRQZi0LKFfYvZfovBBhqrptncU+cvHVfpTMfoCmXqpuKF8K3UF/r8mO9gEK/fK2za+7fY9/nz0972I4z2Gi3oc7EcMTjj8JN0+WCYFgOU50ZVEA4KnBWA+7Vj24S1v/ZxT6vgbVnHBHbKGCTepbP7ZSztxYpH9jz0ppKIAobNbOY+Klq/WCvzR6ImnSYO6E+Ph9EfILLcI7r3ME89lTHhY8JO3zeqqT46jN3Q8GGAJRX+0EgTx1N1KUh+YaY+UMfGYK8lI8YDUO127O5t7UQY3UiCn3r4IU4vnJ5Uv8clN6zz/+e8QJ1vNQoULN35Jg8slh9SGDKH9AmEXD5IW+Ab5bTK63AevAGKhkE/R1kpuNvseOC4cjqNBqBEZQEyUYJE1zSCaO04VNO0Q0IkOGOVHjxHmG2N8dyuKhHNjyTVJi22hWzOl+AYwyOq0Zhte3149FQ/N/URVSOjJnsCkRx7PwJ7CMDEutdlL6SWNjlK7DHYZBKssYHpVb02nSpwzmyJnriwTZXq29jSKnx1wjrSGKTnGbUvCKLHDBKkyRL7sbwk5+Yk=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(426003)(70586007)(70206006)(53546011)(2616005)(316002)(4744005)(8936002)(6916009)(31686004)(7416002)(336012)(4326008)(478600001)(356005)(2906002)(86362001)(31696002)(16576012)(47076005)(82740400003)(82310400003)(54906003)(186003)(8676002)(16526019)(26005)(36860700001)(36906005)(7636003)(5660300002)(36756003)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 03:07:05.1645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cc6103-438c-4f3f-68df-08d953071c35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5320
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/27/21 4:49 AM, Linus Walleij wrote:
> On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
>
> Just a quick question about this:
>
>> +        GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
> Is the usage intended to be such that since hardware timestamp
> can not be guaranteed we need to ask for it and fail and if that
> fails maybe the software wants to fall back to the realtime or
> common timestamp?
>
> I'm thinking from the view of libgpiod or similar apps that abstract
> this and they will be "I want to use hardware timestamps if and
> only if it is available, otherwise I want to use this other timestamp"
> or is that use case uncommon, such that either you know exactly
> what you want or you should not be messing with hardware
> timestamps?


The way currently is implemented, if you have requested

FLAG_EVENT_CLOCK_HARDWARE and it fails, control will return

to userspace with an error. There is no fallback.

>
> Yours,
> Linus Walleij
