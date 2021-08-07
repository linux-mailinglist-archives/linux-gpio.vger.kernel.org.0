Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56453E3398
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 07:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhHGF0O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 01:26:14 -0400
Received: from mail-bn8nam11on2084.outbound.protection.outlook.com ([40.107.236.84]:21505
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229747AbhHGF0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 7 Aug 2021 01:26:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaXQ7fxgk8Fe076okKyuyfcvAhmhnOoC7ZGnGTntxAvBPLoC9y4wBKz6IipNnZqRpO97vXdMPaYmMJZtqxzthBPkvJRjt8RejIwjdkq19/7eY3fs1gbnS/AWU1Qj82VuXB3h/H/aeRxSozND7MkcFmAtbn2T2XXAq/5FDavpDwrOHL4NB4wUMrCpX79oa83NIqy85734wol3uFk8Yta5RHiqajqlyWNAKEvvTyWETBEAXlB/62Ei0jsTXeErdi5CVIlV9BYBo6E7bX/ITvQOiJnapnqFAZcwuOwGjH3+w485IOt9n+ss3DFTXX6+0hTD0lCTVVnICBGNLACRVE8HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUrW/8P46VipEpAe88XsPZLZEuL/O3pznkNjqVwB5Nc=;
 b=Pg56bTM4qIN/g+PwSaNd3Ig12oL6diFvaq/Fi83hXW5Wv36QE/HhtG2uIK/Vmo+wDnK868UrNj4JeFDxo1TcoPtWkP5PkH5iA82fN+p300Odhkf9YLYISGNmEO1fIbSf6a/pKVUiLWTtNtPwOH9SqlNaBaDMAuAByOa32SRnETAxopvM+pVgfOQlcGq5vd0i50457vQ47yoVyyDRW97kW4plpLVak+IJewPlmjhBdeJVHd7sZ4m2deOxuExuM/WVg6q2S+si7hpqOMLTyELav4tV8FtizGS2bu5e4V5KUtH04Fhz8/kpyivLT3D6bXC3QhoR2IuMO9A07IES7tirbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUrW/8P46VipEpAe88XsPZLZEuL/O3pznkNjqVwB5Nc=;
 b=knyVLT7C+JyQv5JovVUu+nEN7KNcv56nvsomUVGwKxDqMDfzITCs6Ir5M6Uwa1l6dRkDEvVTjtR1IiL51Ia+6R4Z7aPzuR6IZjkLuK19Ug85C+F59E3Y/aJKn4Q6eyt/2MnpFMnb7fuJkeqIJwCTmUIC/2rP2Osd5gXJB3GKszdwPfLtYXLrOZL3OIWex5844KmFyhOYcMan+HzUA+Dgsk7EfDvgbduUDbxgOQJjlf+lvOGGLKJZwgEOavmUnZYS+FbDytENbu0jC9rSaNb4LoLg09P+9ejp10+oUG+V8turYqRL+8vxxSrrRNI49BoO2H7weEmXAZ3Nft6qEWMpZA==
Received: from MWHPR11CA0045.namprd11.prod.outlook.com (2603:10b6:300:115::31)
 by BY5PR12MB5526.namprd12.prod.outlook.com (2603:10b6:a03:1d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Sat, 7 Aug
 2021 05:25:53 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::f8) by MWHPR11CA0045.outlook.office365.com
 (2603:10b6:300:115::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Sat, 7 Aug 2021 05:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Sat, 7 Aug 2021 05:25:53 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 7 Aug
 2021 05:25:53 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com> <20210807030746.GA9850@sol>
 <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
 <20210807045116.GA13675@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <7f6a2591-c264-e005-18ae-242320d4a22e@nvidia.com>
Date:   Fri, 6 Aug 2021 22:35:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807045116.GA13675@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26735bb9-1de6-402e-8bc2-08d95963d38e
X-MS-TrafficTypeDiagnostic: BY5PR12MB5526:
X-Microsoft-Antispam-PRVS: <BY5PR12MB552667B7CFDD8B0352B1F1F1AEF49@BY5PR12MB5526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wr3v5h2zVSWYfktlOZcZG1plwNkUf/1mCDdYlaqRM8GrRgDV1aHA9aDvl3RSqpMwwF4RHTo6pXfnJ9Q3PBDdi5cdUpcM9yxj3EoCXJpHtgHHvLoXyi6cVaddmhCSfiG9qCXPZ8KltLtILrgyeRAt2EQYsxawgJwlnlC8eUX67w6J9pg/MyGmuJn6CzD98VBLl5Zp9XVOyIoLJD3NUjM91fmj7bYEdhZZ1BB24h2Hih+pxvhgyPDj9njVBeSG4RfBmWKX+Zjzp/feBuv0egZyMq4MlxBbX28Wv07eIzim02Z+pXdo7j7NvokOKZ4IpfIH+8t0CQXb8EPL88m71JV5DGZwgUwHAstD9KGK+uj8AZTTJnQ5Y0wPFUd2+SnOJ6Grw9b5G6CZ7FVeVU3lAghJRq2MXAxUxnPfMKek3fIcPoWzEa/9fh4vkRPI2vYwM+R8aQTIecWZi0sNK02qRWmURBePuzaHQwtZE4gLOj3gULAPg06DskXddQAHU5v5zu5HckjVbIeukjnQhh95tfPyJMVD3QKZEzw74ugz+m3sNwkiKhufn7A/emZMgWOQBllg4RK11gImzq+TNTL1f/vZcUeD3eGeB0H1CG71kmw+Ynw2EqN40hMg6J5ZZWVBOqL24+uXCLynATBSpLmJEF5cC3h5D8a1Ls//OpJOOzpa+illBDe75uVOCneVPCLsbRQKS5wZvQZGUmjx/EZNax0lWkF/wOkwCNagJ75ZYLwlLOR9jRy9T1pwBNI/YA6dTLFsJVLTFrj1+0Ag3RwIP5zspgZhrijjUiKc0LAzbDcN85ghdI6cX9V0n6cWenXXPmNkYw0Bx0JBzocjWsqCi4sHqDqn26adkaz6HGOeB4aAyKM=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(53546011)(8936002)(7636003)(26005)(70586007)(186003)(16526019)(8676002)(5660300002)(426003)(2906002)(4326008)(7416002)(6916009)(70206006)(336012)(2616005)(86362001)(36860700001)(36756003)(316002)(54906003)(31696002)(16576012)(36906005)(6666004)(508600001)(966005)(356005)(31686004)(47076005)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2021 05:25:53.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26735bb9-1de6-402e-8bc2-08d95963d38e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5526
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/6/21 9:51 PM, Kent Gibson wrote:
> On Fri, Aug 06, 2021 at 09:52:54PM -0700, Dipen Patel wrote:
>> On 8/6/21 8:07 PM, Kent Gibson wrote:
>>> On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
>>>> On 7/31/21 8:43 AM, Kent Gibson wrote:
>>>>> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
>>>>>> Thanks Kent for the review comment. My responses inline.
>>>>>>
> <snip>
>
>>>> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
>>>>
>>>> hte_handler, for the worst case scenario as below?
>>>>
>>> No.  If hardware timestamp is selected then no irq is requested from the
>>> irq subsystem for that line - only from the hte subsystem instead.
>>> So there will be no edge_irq_handler call for that line, so no possible race.
>> That is not possible for certain providers, for example the one I am dealing
>>
>> with which requires GPIO line to be requested as input and IRQ needs to
>>
>> be enabled on them.
>>
> So, for your hte subsystem to work, the consumer has to also request
> a line from the irq subsystem?

Yes

>   That makes sense to you?
Its not me, its peculiarity of the hardware that I am dealing with.
> Have hte do that, rather than the consumer.

Sure, for cdev it would mean to duplicate (most of) the edge* or line_create

code in HTE. For such hardware, my initial doubt remains the same about

the worst case scenario between two handlers, but perhaps that's

implementation details for hte to handle.

>
> And another reason it makes sense to integrate this with irq...

Alright, will explore this route as well. I remember both Thierry[1] and

Marc[2] raised some doubts (time to revive that discussion).


[1]: https://lore.kernel.org/lkml/YFm9r%2FtFkzVlYDEp@orome.fritz.box/

[2]: https://lore.kernel.org/lkml/87h7l1k9yi.wl-maz@kernel.org/

>
> Cheers,
> Kent.
