Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8433D84A0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 02:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbhG1AZ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 20:25:26 -0400
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com ([40.107.93.71]:23212
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232778AbhG1AZZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 20:25:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqXSeoALO4ceagFEbQ7PdDuXNrX5Po7M3bB6j0J0HFoteSrPDf+VZIqVZ2vvfyduBF8kng2wuIU9MOBEmgmLO9Q8H6/oGfnAb/Jq/a5woyIa71qGP0JDoRVI1eLYIPzl5g8AKdka9MnREugwo2JfuP4cFYSLqHnj6uMJPxsj1LHA3zUI3zdPBKi9m72yqmakbKq4y+qvzgc4tOxcoKDUYEMsHHArbYLTjctgjKv5IhCrehfKiAZuIX6WfsDowDrE/bZ8kK/cXiaw0AxP9ko3SR7BfW8BnD6fuGRTmTtaekSFHzSkF7+XzwqylwTxfajsmhe0VZejgVHxGRBGiKvvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM4bA0aJHOjHkpfMl2GzHejORM4gQj5erY2EsU2HIU0=;
 b=jCDY/WvX0vP1mvHJxGwJ2uInb669ZKhcVMP7gYeVnEJxMUvK9VOqCYgMlhRtKFWuVhu8sYrDRQk0it6xjWeFhZoqZqM6Xn79w2Si2iit4mSugizxzkacWPygp55HvvtUVA6wh15Uze7RmSsYIfYf6efgefi2+FA3Un4bj2paB9OdNbIU2GnWSQ2kAjelA7F44iXZXWgCsWiGjCrNyF9Ig3xb/IkuqYLhFgVjZ78pDzhN19iOvX0+mN28KPk6Iz6RmijsM6TvOdfnyLVXBKlaPQz9AimDrAlh4RmNiEVc0Q/UCp6pIelV/CLfrP2Tued9ksHVyKrzgWerD7fByjxOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM4bA0aJHOjHkpfMl2GzHejORM4gQj5erY2EsU2HIU0=;
 b=XaaSgMqg81dF1rnJ0n5D54Q3FtT5kQ9l9sU5hKucO7YQZ3ELAEnm1vtsuqj0oMeRr/b1kHduO0dvc8KGSObt1L39TkZjI2E9lNkSUB1Vpv/ujYQrulzvx7GFu5l3SzE7m/jAybeD5S8TdO+OGOR1sS96wutrMYAeZeolQZfvSv5jJR38/jhK6K/r9bb5CWlYuStlTR4hPIBOUnQZeuoTC/AipAoErCFX3eEKHg9jtsekQ4u3Noee0XhULMj4Gh6fkU2/6DfRsno86HOYT33FPIzftLW6XWDRAYeq/Q9qT7b/CYerDqauBbvTyFGjZ0M+YdDYIPFqXEJpcdor60QGHg==
Received: from MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45) by
 DM6PR12MB3547.namprd12.prod.outlook.com (2603:10b6:5:18a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 00:25:23 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::48) by MW2PR16CA0032.outlook.office365.com
 (2603:10b6:907::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 00:25:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 00:25:23 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Jul
 2021 00:25:21 +0000
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-3-dipenp@nvidia.com> <YOK1Fq45P/DeqxAA@kroah.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <60f42b1b-309a-52b2-3090-722a3b7360ac@nvidia.com>
Date:   Tue, 27 Jul 2021 17:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOK1Fq45P/DeqxAA@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e40ddf2f-c89e-4c25-6afa-08d9515e30a6
X-MS-TrafficTypeDiagnostic: DM6PR12MB3547:
X-Microsoft-Antispam-PRVS: <DM6PR12MB354796749412CCFD0D9A97EFAEEA9@DM6PR12MB3547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRLcm5tu1lr+XtzvsOibKyPJOHRkAK+g9fJFzYeCFLVL0LFEr+d1POOEUTYPaOXdBKY4+Lwm4AJElxX+xLW1Aqc85AbIeliJX4FAdnsU/FuYA0QAnb4Avk7qCDf3ODz7czPjODBQm7EdrfHHQEDNnml+tP59DaJONesldi94f7jTDle5TJUEi5c+rsERs2ZIRvWAyeVzUq6LXGlPNA1SpS0ASHEJh8vlIfWzgZLxbYj94SJ9JVjQxOSsRiMY6YQKvXNtSHI7exNjUI8IXLug1GOYDaG6QXHL1rqu7/cLJOUdsr6OGjf39dGqL0VYR1wCJhDE6MhpKePYtUV8jvm7PNVxaT8ZBVkEZqC8vgEjMSvXVz/GRibmh3SPs7AvC/jsGth8P9PDD3Yw7Nos4JdXqx9JNdDYNvQoVB2Dcs+4QesGjwvQPIqc9UdJv193TZA31qt4XRUkuom+4xUVKMgb/eUwxussEPTTR7fV6UoKjfLCQhrRq98HMiIN8HPxD6nj/vG1o3jUeNyoSQqs63UHAazte2/7X0j9832DFC6qvsIBgLfRG/iAQYab8xcCgcy0BPiNisKwzbbWnsysSCxErCC723YmMDqAIcWEBSR0ItXFeFYrgFpmaXDYwBMfv1y8X3zTUYTWKj6rdWX44164THzQNuZRVSWa/x2xeP/UWMxqm25EHKWRzXVYnjoZjQmgjzRvbQwNoCa+tFbkI0HiPrfkkrkPvHWNWACzb2sUc28=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(70586007)(6666004)(478600001)(5660300002)(336012)(70206006)(186003)(82740400003)(8676002)(36756003)(36860700001)(16576012)(31686004)(8936002)(36906005)(54906003)(2616005)(316002)(426003)(86362001)(4326008)(7636003)(82310400003)(53546011)(26005)(31696002)(16526019)(6916009)(2906002)(7416002)(47076005)(356005)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:25:23.3484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e40ddf2f-c89e-4c25-6afa-08d9515e30a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3547
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Greg for the review comments. I will address all in next RFC version2.

Best Regards,

Dipen Patel

On 7/5/21 12:30 AM, Greg KH wrote:
> On Fri, Jun 25, 2021 at 04:55:23PM -0700, Dipen Patel wrote:
>> +static void hte_chip_dbgfs_init(struct hte_device *gdev)
>> +{
>> +	const struct hte_chip *chip = gdev->chip;
>> +	const char *name = chip->name ? chip->name : dev_name(chip->dev);
>> +
>> +	gdev->dbg_root = debugfs_create_dir(name, hte_root);
>> +	if (!gdev->dbg_root)
>> +		return;
> No need to check for this, if it fails, your other debugfs calls
> will handle it just fine.
>
>
>> +
>> +	debugfs_create_atomic_t("ts_requested", 0444, gdev->dbg_root,
>> +				&gdev->ts_req);
>> +	debugfs_create_u32("total_ts", 0444, gdev->dbg_root,
>> +			   &gdev->nlines);
>> +}
>> +
>> +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
>> +{
>> +	if (!ei->gdev->dbg_root || !name)
>> +		return;
>> +
>> +	ei->ts_dbg_root = debugfs_create_dir(name, ei->gdev->dbg_root);
>> +	if (!ei->ts_dbg_root)
>> +		return;
> Again, no need to check.
>
>> +
>> +	debugfs_create_size_t("ts_buffer_depth", 0444, ei->ts_dbg_root,
>> +			      &ei->buf->datum_len);
>> +	debugfs_create_size_t("ts_buffer_watermark", 0444, ei->ts_dbg_root,
>> +			      &ei->buf->watermark);
>> +	debugfs_create_atomic_t("dropped_timestamps", 0444, ei->ts_dbg_root,
>> +				&ei->dropped_ts);
>> +}
>> +
>> +static inline void hte_dbgfs_deinit(struct dentry *root)
>> +{
>> +	if (!root)
>> +		return;
> No need to check this.
>
>> +
>> +	debugfs_remove_recursive(root);
> Do not wrap a single call with another call :)
>
>
> thanks,
>
> greg k-h
