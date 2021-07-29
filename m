Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9FE3D9BDC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 04:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhG2CeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 22:34:16 -0400
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com ([40.107.223.54]:5728
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233256AbhG2CeP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 22:34:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRNc69ze35VpdoCzd8OP/5L6aBFWkSdN1RxgZVkYMFStcVIdVZMf49n5eroxCykhHKl4dIhVWSaTpjfDDJ9NsOku+DIaq/WSPV4DDB+Pc4WBIoGh40/pCqcCwIr7hnvjFaVJY6uRfKJ/Wh6Shuz57+pd0W202kzaIaB4IbEJWRLImp2dK5fGPRovRMEZGNWdmHt42B4gjpM/QKvSzz1U69YfXaOzGus4Gi4RmuGPVcczHQybW5jurAK8Bn8E8DUbwf88jqmQ9BsmB4Bd5EMmWNxWh6GI02824hlehjxQXAjad65jVJ36PG5hP3ql4DOeZhOIDu4rUM2UyAfhIlGzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJMp3LtMC0aUsoCI313qE9kTxEUhSqB2aJRasr9CuUw=;
 b=V8iUUs9l1nhePqLU0fLE7D175meRblYgBU311xNkZw9YtcEMx/tUNmZ1B0B+0vSFrlbsCOUiVG9M/5h8oZHIHOsud10WbtKptGS5NE2aLNTD25Go4KaPVsGqsEkseSzDlUgi/xrFn1pC3UEs4ClLOuLwXmVVTwUN/PLrxMG3hucy+3mTzWjM5NNvDWCbMCkSNSqLkapHMVK+LwxDOd3BmzsXmIUAJGmxpPN5Q7ccaDwXTHGCuHwayW54Tmi+g636TmauJgyI+mZPJP9klJoViApm6Ita2uQlqkp2TjVr+bwMhVf6Aubjz48Ifs75uADdv5WrESiLMf7uV8qDwn6ZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJMp3LtMC0aUsoCI313qE9kTxEUhSqB2aJRasr9CuUw=;
 b=CJbWZVF3fb2St7tgkj9YUJzT1IBx+RRe/RF7cMqAWtuCdLNhihcKYEK5o8Oi/m/9kVzTuNL1pjSVshbg0UeeCradcFVidzx32hkZz+iyUvHeXF33l6tKF9ycchDtJtE+K2hG53S3GxZJBDw3u6I/oJuKVWgOa2UU+ZytPODJeVBbA+Rzroaktty21YlRCFVNT/hQGzrdfLrTuYiUzjWG6MUULNJ4icaEPGh+jI+gs+vVmeCKSND5Y4RFkhIAxqobFlLIpLsjTNk5oSkJX1vZ7E0izIwuKjlBW8SLWXesElswYyXjAU4XFve8kCkv1IZjOGbSxOMWVXpdhFwbHalvLQ==
Received: from BN8PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:d4::13)
 by DM5PR1201MB0105.namprd12.prod.outlook.com (2603:10b6:4:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 02:34:12 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::c3) by BN8PR04CA0039.outlook.office365.com
 (2603:10b6:408:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Thu, 29 Jul 2021 02:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 02:34:11 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Jul
 2021 02:34:10 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <YOeLT4T5stjsAUMr@qmqm.qmqm.pl>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <945e19cf-5575-ae19-d3bf-c819b7aa2199@nvidia.com>
Date:   Wed, 28 Jul 2021 19:43:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOeLT4T5stjsAUMr@qmqm.qmqm.pl>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab11dbb-b12b-4734-ca3e-08d9523959a1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0105AE294498335C84BBA96AAEEB9@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHikgkLCGQn+/Q6X/DmzTqm61N+BbsT8Zzk1jHNcsthMyfv2b3mOLA9xoeVqOw8HEBpY1ujcN9qMRA7IU2rkorBx3uhpWwZm5GA6CSNNTVZHLcgWG+3tw4cZzMTAi+jiyyiiONG2zyAjYqNTLNYAM0e4yAX6YcxOsbpkIXbYwLYaZxBAoYhpkJw5C/ncmTFQPdGRcdkFy4UJSNxJDeeTlBnuGOVjwgUy373S9he3ZMUzFxzRbRkSqUUfBpsvudyxJAMsfWuP4DpRgvIO2vmVKDQu93cBA+rCrZltCV4gIZCVzWeMZGtDPkuY0RButXKoNgP1YVktfIemlWjnKDYEDPmBiMQeK1CrkPhvIqqB3TAjK72gsjSfLokIJCNcLz3X3fLQ0eIwmJz4kJgv9r5ceDD0xIDqrdNxYs7aTn4A8H0tQSvJI4r+H4Ay8SHAhUdPHmw0U9miS4KDH1CZgaJDU/e17k9lluS9aIjv2OoznSHrHXk81NOcTUO+eEltKJGhjTMaUyzw81SMeWvcopYujbMrpw1U8pa6c8zpGOGd38ib+dID2j+hCfIllArrW9/BhwXG3h3J2XmgWAc74b4wg5TVQ1WPusNIWnGBEUaKmP7pOAMVCrogiLmaosPme1ngCZoTEfTVdeyNifb451B6OOmXEOpinqkk3ixwJb1WnOKArQBnYocRmUDybITW8XZvJzOUQM/Ps0kx+b3CyKnxt3xp+Cdpi/TOKJFXDL9gBps=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(316002)(336012)(4326008)(7416002)(86362001)(31686004)(8676002)(8936002)(4744005)(5660300002)(31696002)(16576012)(186003)(26005)(7636003)(356005)(54906003)(82310400003)(47076005)(426003)(36756003)(53546011)(478600001)(16526019)(36860700001)(6916009)(2616005)(70586007)(2906002)(36906005)(82740400003)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 02:34:11.8505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab11dbb-b12b-4734-ca3e-08d9523959a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the suggestion, will change it in next RFC series.

On 7/8/21 4:33 PM, Micha³ Miros³aw wrote:
> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
>> Tegra194 device has multiple HTE instances also known as GTE
>> (Generic hardware Timestamping Engine) which can timestamp subset of
>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>> and exposes timestamping ability on those lines to the consumers
>> through HTE subsystem.
> [...]
>> +	ret = of_property_read_u32(dev->of_node, "slices", &slices);
>> +	if (ret != 0) {
>> +		dev_err(dev, "Could not read slices\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	hte_dev->sl = devm_kzalloc(dev, sizeof(struct hte_slices) * slices,
>> +				   GFP_KERNEL);
> Nit: There is devm_kcalloc() that will check for overflow in the
> multiply in case @slices from DT is broken.
>
> Best Regards
> Micha³ Miros³aw
