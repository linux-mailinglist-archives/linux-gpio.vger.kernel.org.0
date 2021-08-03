Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19503DF7DD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 00:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhHCWdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 18:33:01 -0400
Received: from mail-mw2nam08on2044.outbound.protection.outlook.com ([40.107.101.44]:2336
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231770AbhHCWdA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 18:33:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQ5ciM1daNFfIuMS4N5ShMKh9Bz2fZ8TUj88qi1RM4ZWB9jzf8SVmdSL80OXDMZL2NJqKhZA+yw+FqOUIN35z6R182/vGZdxcLnEyfwxW78Y0YQ4EP+7gzwdvWdX/IDPUWC51s0Ag86TMCi6CqH4MDxDPyLkQI9fylVtSZnlGbzNkrlYnCpR4nKy7UhtUZlNexCzis1nSlB67wwudrhE4wOiRTjNfQ1yvxOpZuR9PMUGVjjscdtTCGIdZoOrB72Ya3nYSJWtdkHfgE6XHPV8fVgpyG/WkgK7gK84fXI8N/9wXgpkHmPMSRlxm3JosL7/x9eVVK0FrI8C1DHgVPsn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksUfCwgOxEyu2+7DaLVabqkzyyy1eow5nbOPqkmrJHE=;
 b=Pcefr7VmcqeaA+ezqwIWrhv5jX5BCzPQ47XNL6yPQ7Z8OQjdze+iFUu/h2Y9rxJloizLBx9cQitvKDLHE9z07nrLBdop/tikivpNIAPf3ZDWCTZwq98+w/reKS9QKLKHgYHzXpEvFM1oBya+Cs9pCTy6lA//fw9pnNwJSbrz7zbWT/Au+8tI7Ea22ArNhEJfBeRkpVw7KEiqt1Tk03l5PhpzGaHt7abpGzbKE5lBgSicTdPe1wOFZtQoCi4qdq6+RAvDlRDpAJTGKsZh4LNhKgpy0ZpojAFPCPZVHPhUL7m47Uf7yaV6/gyrqncsfOoQc1+wPA/ik84DpHYya0jKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksUfCwgOxEyu2+7DaLVabqkzyyy1eow5nbOPqkmrJHE=;
 b=duFhZya9+/iQKOQRA/X6vQxXVWJHNLZobXnsSNMXKFDk2sE7nnyxn+9eYit2uX3DlPxNtFDI2eoXVYvgWrW8xwJr08poCOtT1W18ftk886LYGW9bliO3K0NteE6fMX7ed/wSZ2aSCl0IQtg2mcopGzWiIXz1d/h+djKgFoTgUY/qq5VoKVF1Hi7L7nGxLO/SMRbfmaSZd93tOleJseTFH4G23sOWXMaXYSRSyNCARCkH1AVoFec3piN+t0zjtlj7yOV9TU0jRxH83gkT0TIzCqA5XgZVmB6fe2lb462t0qwvs/jd/B5gn6YG6NV/dMQSn5m2ZuyHh3YeUg7YtP0Azg==
Received: from CO1PR15CA0077.namprd15.prod.outlook.com (2603:10b6:101:20::21)
 by DM5PR12MB1658.namprd12.prod.outlook.com (2603:10b6:4:5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20; Tue, 3 Aug 2021 22:32:47 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::e5) by CO1PR15CA0077.outlook.office365.com
 (2603:10b6:101:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Tue, 3 Aug 2021 22:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 22:32:47 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug
 2021 15:32:46 -0700
Received: from [172.17.173.69] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021
 22:32:46 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>,
        <andriy.shevchenko@linux.intel.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com> <20210701142433.GC34285@sol>
 <ba32de51-0639-36e2-3575-1f7915542a19@nvidia.com>
 <20210731060556.GA11043@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <1102e1b2-9d53-fc93-b7c5-bfeb9eb2e18d@nvidia.com>
Date:   Tue, 3 Aug 2021 15:41:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731060556.GA11043@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ca1f5e3-4f08-4fa1-c1b1-08d956ce9ea6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1658:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16587D97267E31FA3EE82643AEF09@DM5PR12MB1658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHQ9GxCegR+tiHulOVpE0AwxuEkvFZLSRZw/iHeFWdpuMBmnTOtRL+uhBqG60ESceP+agd8rDLRzEZkF1cVdwzkmaM0H84rkH6WITvLthMZUt8eMw96+srb0+7kN5lGLIi2TpqpnBML1UsB3sdWsMjwQ3pZf4MEhaLB1PRko0y1ZCuC/hLTKpMOq9Bcx2QxcAcATS/ta7M7fnSuuS/CrKbiDwb7gS5QT0O5fCJr04tgMHO3/b7clGx0jlGdmYKc2pmiXDov4boHZaBAinhgm7XlmS83aZQIOZV37Bef/kWNqs6D/hmJ5OGtIrblQXjlGT+o9cxBJqdqegXnFLtt034qEHMgoQDRx7vr6FmqJY9F2f8s7boQOL08xYVvcJuMnWr2DNyV15ueIkMov7BMogadXPGfj/y6qD4POmVY7VTeRUNFHj+umVc5Mn/iQxJhvVaSFq3K4M1dRDak1d89qUN1LDHcpOKLy4eX6q2+hvXVYtqpLtHE0JDbh108/H8jozDGoEBoBB8PNovyrLIQ0WDlTNFpyIqboZqxy9xCynFCuIupweXOTQrqMvZxzXLkVK6fzmRAPs4iw/fZEMs2Ea8ssFMXJiHumczAMcVAiZ/SZSVJNPgCq46/oeZ3WNWpYjoBwrGV9L4SEvwVqVOUskkZN3oKswHq576oppAJ2JBVDrl2ovSAzHkkQuq7SDiRdStw6PswXeS/zHbSGDomJyJVh9avh6CmGFpYU+lo63is5Pgui2Db9tM+Kdbk/McIwkO2oYjBExXjYnhwVuJfUvuyg/fqMol4a5rcO3hscb6kbwrLZnVfiDCKH+WNFg7uc
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(70206006)(4326008)(478600001)(5660300002)(966005)(70586007)(2906002)(82740400003)(426003)(7636003)(6666004)(2616005)(86362001)(54906003)(31686004)(316002)(16576012)(26005)(336012)(8676002)(16526019)(186003)(6916009)(53546011)(7416002)(8936002)(36756003)(82310400003)(47076005)(31696002)(356005)(83380400001)(36860700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 22:32:47.3187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca1f5e3-4f08-4fa1-c1b1-08d956ce9ea6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1658
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/30/21 11:05 PM, Kent Gibson wrote:
> On Thu, Jul 29, 2021 at 08:07:15PM -0700, Dipen Patel wrote:
>> On 7/1/21 7:24 AM, Kent Gibson wrote:
> <snip>
>>>>  			ret = gpiod_direction_output(desc, val);
>>>>  			if (ret)
>>>>  				return ret;
>>>> @@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>>>>  					polarity_change);
>>>>  			if (ret)
>>>>  				return ret;
>>>> +
>>>> +			/* Check if new config sets hardware assisted clock */
>>>> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
>>>> +				ret = gpiod_hw_timestamp_control(desc, true);
>>>> +				if (ret)
>>>> +					return ret;
>>>> +			}
>>>>  		}
>>>>  
>>> The error code here can come from the pinctrl timestamp_control(), so it
>>> should be sanitised before being returned to userspace.
>> I do not understand what do you mean by sanitise. I just followed what
>>
>> gpiod_direction_output did just above which also returns ret from gpio
>>
>> driver code similar to timestamp_control API.
>>
> In this context, sanitise means convert any kernel internal error codes
> to their userspace equivalent before returning them to userspace.
>
> Fair enough with the gpiod_direction_output() comparison.  I was thinking
> of a patch Andy recently submitted[1] to sanitise gpiod_request(), which
> can sometimes return EPROBE_DEFER.  But I guess we can wait until we find
> a case of a driver returning an internal error code and add a sanitiser
> then.
Make sense, I will add sanity check
>
> Cheers,
> Kent.
>
> [1] https://www.spinics.net/lists/linux-gpio/msg60998.html
>
