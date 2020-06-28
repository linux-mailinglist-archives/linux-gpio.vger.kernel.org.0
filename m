Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F37820C8E2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2020 18:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgF1QAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jun 2020 12:00:01 -0400
Received: from mail-co1nam11on2044.outbound.protection.outlook.com ([40.107.220.44]:6184
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726011AbgF1QAB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 28 Jun 2020 12:00:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFg9ctA0GRZANawBufLY3mceeGEQb+muOge7DhOyJzYQam89LWm3sHj21T2PVEZuY1zFIWO8tPI5/nNjlAWUgFKl+zWhwxb6YVW4K2AHWfQF0z+1DlX9x+40OOFd1HLuJnvpvDoHOvGnZGLqV3mNAgFSqUhPfz/b6Web/hx85Rab8F7xTGN/aYfXcRWMrDKm+R5mCWwefL8XfT2300F2oB+42HyguufSm02Riwl8NtyTrkPDLT3O1//cCcavcmHspRIOrmTtjbzZuO0KhYsckW8552UhnWuZmVsw1Iy75L2XYCsru3qCZ4VhX1wqdETKwpMamj5Q2Q8l8p3nDLIf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uLbqaT1JQ+X9EKxEkd2jbrzEupg4a7xdGTQlyKO95M=;
 b=VYgqI7cTs9gvaTHGfBDj6O7h7s0Jhe1FubVgJNmth6Ib2/iyfFdBMM6uUnInyaQ6sor8jKrOBcAkFa6nCdecF7kI24nipamFerwdPpwyVhaYi77hFfCIAlOvAvmN1jXEZGz7KdXj4jY4WCrgQ38rcsEvxaCjOR51FprE0BfkNastSTCu9YJ37etnK0p1+scmXRsS+Hn8uYsz4XR5ZwBhuDTk8EtoXcxIq0j9qqhlo91QVvx75+KE3RBTt2mueD1dcL58sGWPkbEzg7Gdbd7urhYuAKwdBa8yAo8hfyYTxfkyU6KZgGpSSNg8Th4RRme/VpP8c/boYi7gsEwoDdt+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uLbqaT1JQ+X9EKxEkd2jbrzEupg4a7xdGTQlyKO95M=;
 b=rKqR4tAxE0vBzRY5/apHdwuBWPsv+lEgZJvQi6WwGQUtnn0WSzj0b/vDwjq2XMQI0ILxEkHza2ebVJ9xbrlyilJ5SNK+GnR2Gd7BpgEohyyOrJIi6pqFaFg/KFrBQ1VJje8gfe6+pbKW+VgUVuPkae4QuGmqFWhe5ZW+mEWNvDI=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0268.namprd12.prod.outlook.com (2603:10b6:4:54::16)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sun, 28 Jun
 2020 15:59:57 +0000
Received: from DM5PR1201MB0268.namprd12.prod.outlook.com
 ([fe80::d826:5909:ca60:ec2e]) by DM5PR1201MB0268.namprd12.prod.outlook.com
 ([fe80::d826:5909:ca60:ec2e%12]) with mapi id 15.20.3131.025; Sun, 28 Jun
 2020 15:59:57 +0000
Subject: Re: [PATCH] pinctrl: amd: Honor IRQ trigger type requested by the
 caller
To:     Furquan Shaikh <furquan@google.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam-sundar.S-k@amd.com, akshu.agrawal@amd.com,
        adurbin@google.com, dtor@google.com
References: <20200626211026.513520-1-furquan@google.com>
From:   Shyam Sundar S K <ssundark@amd.com>
Message-ID: <b7875c51-f99d-1bc0-0ca0-ad44c9cf8652@amd.com>
Date:   Sun, 28 Jun 2020 21:29:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626211026.513520-1-furquan@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BM1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::14) To DM5PR1201MB0268.namprd12.prod.outlook.com
 (2603:10b6:4:54::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.180] (165.204.159.242) by BM1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Sun, 28 Jun 2020 15:59:54 +0000
X-Originating-IP: [165.204.159.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09238be8-4964-4f02-4ead-08d81b7c4e0a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4187:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4187F23BEBD954BB2532C55B9A910@DM6PR12MB4187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0448A97BF2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMUHphNi9ibp3lba7gn9Tim4zfdr//XLgL8FJ3J+yVW9JIfcHm6/tbFBWtuB72GIGbnGMORTTR4F6TtPoT5nwG7wsShJRSr/PaGA04XrH/tb/ly7unkLa8if6o4YSa8Uq4A9Q/2EizSUi/bppsW0b2LFPuUWpWcn1uoX2CazGcm6OKUnQkByNQL+b2Q2cyaQm2LyKtsVXrdHsbGYOsAZTMuR+JSOjDN2tkhtcFbMcI3W5qBPKTAwyIz4DRRs+mHP78iyEWharKvHBQeMupn4h9w+vl/H0lGF7Xi7WRJqHL3s1tqEk2XHkhoWedxeX+JsPkzqJHvMgkjTBvQ5c7xJVr5FKUjU//Fd2365V4wciinEMWlUh8CYKgXetrO+XgAY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1201MB0268.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(16576012)(110136005)(956004)(4326008)(83380400001)(36756003)(2616005)(66476007)(52116002)(31686004)(6486002)(478600001)(316002)(6666004)(5660300002)(26005)(2906002)(53546011)(16526019)(66556008)(186003)(8936002)(8676002)(66946007)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +eiD1sE7INZcbsUzXfRqwMFKKcMwkK3x0iOqwY9A199cvNFPrE/d6dd0XBsCAeDFxYU47RWXkxLVjSZN5VDVS6V6RBrHYBOUZcdSMvQRon9YsP0JlU1c9GLeolNOF+HTS/4N3Q4vOtubQE4HbMbbqWLYRMjb0cGDEDYVUgXU2OKwnUHUuyoqEngNKf7KW7Oxjq536DHqqy6GLPogTCMV+8epxpf/X9+vlMEgwsiVVNd8A7FumZuMnBRByp6t7vXCUalJidLgNZEeKBTBMZa3Z6O/NDRJ+fRX3CF4Bw/AW6iGPR5Q1SZ2/qjuo//XxzMM5QA74T2CMaw2izYkq2JKgvvcyw2GEPaegVsO9gOY87jdoeEHTAR8hG6Fii9DlGYP+or+l1EqXycUAKarnZFYPSSO7cNMbjC6CBTMbNR8yA831uj0Y1hbRofK22lNQiGVDempwNZBuQ235dOdO+a6S+8z2ElzTeBMyu226efNj2k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09238be8-4964-4f02-4ead-08d81b7c4e0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2020 15:59:57.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3Ugtr6WT7kET/AEHWkGXQUHTLlgfzaD1NEyMGf4pGvJxz1mjmgtM3Zex+5jRC/uw6iVWZKypSQ++RLziQWhcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/27/2020 2:40 AM, Furquan Shaikh wrote:
> [CAUTION: External Email]
>
> This change drops the override in `amd_gpio_irq_set_type()` that
> ignores the IRQ trigger type settings from the caller. The device
> driver (caller) is in a better position to identify the right trigger
> type for the device based on the usage as well as the information
> exposed by the BIOS. There are instances where the device driver might
> want to configure the trigger type differently in different modes. An
> example of this is gpio-keys driver which configures IRQ type as
> trigger on both edges (to identify assert and deassert events) when in
> S0 and reconfigures the trigger type using the information provided by
> the BIOS when going into suspend to ensure that the wake happens on
> the required edge.
>
> This override in `amd_gpio_irq_set_type()` prevents the caller from
> being able to reconfigure trigger type once it is set either based on
> ACPI information or the type used by the first caller for IRQ on a
> given GPIO line.
>
> Without this change, pen-insert gpio key (used by garaged stylus on a
> Chromebook) works fine in S0 (i.e. insert and eject events are
> correctly identified), however, BIOS configuration for wake on only
> pen eject i.e. only-rising edge or only-falling edge is not honored.
>
> With this change, it was verified that pen-insert gpio key behavior is
> correct in both S0 and for wakeup from S3.
>
> Signed-off-by: Furquan Shaikh <furquan@google.com>

Signed-off-by: Shyam Sundar S K<Shyam-sundar.S-k@amd.com>

