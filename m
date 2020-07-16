Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9D52227E9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgGPP6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:58:23 -0400
Received: from mail-eopbgr60049.outbound.protection.outlook.com ([40.107.6.49]:14029
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728894AbgGPP6X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 11:58:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1DfjT+7dgTUD6Ror4ITE1Uh1WWOFJIXn1VMRUD9Swu9WpXj0YKMlBKf5/kYREbjNkozBMLX7IK6QhYvk7TYJNy4S13baA3jrS+lv+rMAr7Amqv2LyWw6onE8aVsCyO/Ef6KZd1vWwW764AXE4fR/sax8D4SOKJz1NO6DOXegkJ4HJWC7cqy5auTG92HZWqG7E0E2UbsGh2XyI5EyUw7vMRyhZbvSm6PaG3VlayuADVxUrjyop7Gks3RNrQghCiEhXuYjICY5gq97RzBjPE0Qj4vUU83mwJdavmMsi/L9QySZFqeqODmcBS8r2CwFm2k+NCxGYDosNWRVGyf57glOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDdOats08uiivfFKQ9w16CuOWD1wH3qiRRQF9SKSRO0=;
 b=C46tHVs/OQkXC1hRzo5Kjh3pTbVUr9ypvPsP3gZ17lfosZJSOuEuVKjlkHOAg7Gq0YfKLzltVVcdD/SVvtca+NxosRVugJ48mMWQdduCJvMK4BOP7wKQLKJpIKPEPJ3f8B7B4mfQy8ATZujq0vHFgJUsxK0Gp/hvHoZARMCNCtzjKik2rQWo8qAT3Y4gYXjibnXFgl906xUXLWJb4vIVZfNMubruZX9dKsqGWcsARl3Cib6Anj956NSsVZaO8Jjz5n7/4M4TN8G3vWlhdpN9YzMCFZ5aLIhFfD6LFOHl82jcWyPG85cxxAwwqiFFQ84tI4XYJM6jiTIlkhVWWdmwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDdOats08uiivfFKQ9w16CuOWD1wH3qiRRQF9SKSRO0=;
 b=bnIm6+eSYB4222oj4ETtL1Y0D+iF9fkCdzXIAHKGx2J6ukKV2+HRFtrWNKWNcXhL33/kJ5GJisfdENRbk75aemP8FWzFuED5gfHOgVWuv+j+ryGcx+3VIZFHLZloRA4Jr29yfy7Kyjss1C0+6vLoOnsFTqfpiyLyMgnSqaHINwU=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB2784.eurprd04.prod.outlook.com
 (2603:10a6:800:b0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 15:58:18 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 15:58:18 +0000
Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
To:     Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
Date:   Thu, 16 Jul 2020 18:58:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0117.eurprd07.prod.outlook.com
 (2603:10a6:207:7::27) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (188.25.93.120) by AM3PR07CA0117.eurprd07.prod.outlook.com (2603:10a6:207:7::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.16 via Frontend Transport; Thu, 16 Jul 2020 15:58:16 +0000
X-Originating-IP: [188.25.93.120]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56dddea2-617d-4f3a-16f5-08d829a10e95
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2784AA18877904A70995E8ECF97F0@VI1PR0402MB2784.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqB1PYYIUtpmklCUVke3Z8SOI0Cpup/gSI/RhD+E3AqsCbNEf3QM5TKCK/wHmMkjOc/r4aNes1epvHXwQ6DQMJqJVMRvh3P8huG63JYK9TtxCeifu9gfhxPr3lSTAWQumkT8LxQ25+hcVY8DfgCe+C5B2oVkkE26Qj5OW7aCgrfQXy78V5PpEr5/LMXP5r89OWN3y0OKG4oTSGG8Fatj/vE4iIuxi5FQOkFTDeMGQk7699oXfRdkJlmMcYkxFjm5n/lH4D70pLMIXLDCWJTH7/bIcc9q4iXngOY4uv+L3/wnv3G+WvE3ZUeLv9n8hlKYDmyQT7Rg48Ut5fec3SDv7VUE9WO2AIYxhqTq9T/NO21hs4Z/4uEb7ENKltV7gXqW28n2gin1biSsy6rR2+7J3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(16576012)(6486002)(52116002)(86362001)(2906002)(4326008)(44832011)(53546011)(31696002)(2616005)(110136005)(956004)(186003)(8676002)(316002)(66946007)(31686004)(8936002)(66556008)(66476007)(83380400001)(26005)(6666004)(16526019)(5660300002)(36756003)(478600001)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OYnPrIunIEc8Iz8n7ulRM42sv4l5t6OMPIYxY5QVA2EmdTZhIvkoMpSxNeSw9szqiNM7yWUtE3hrp0ijecbObbScqvWV4T/ee+o2kLIt0vYj+ML0aaYBQu6SuqZkQPTf4LhurI7Pa94Rp1Tne3yts12tV7l+RlVJugimA/QJVTfK+29jKEdV/oQoNUPGQUQp1VmmWQYCsntV4/d7rGagH/XenNcqr+SqYO9uShIt/6/Dwz8d2uBOCAj+dfq8WamvuNSrAQOVNglM771A9/MOpAQfSkG+JpSKS/xEit4wbPK2eElIK6RmALVLYH5s/C78f4ZrZ5NxeM2QpOzdkdI+31Q54CV88DDPEmPF8q7/3xty7INRoZ9PtLQkyxFX62kprGIgrhlfOKX3KHjZJY8g+sqYAzLMIdFglzYR7zfc4WGqPVUEM9iurZ/6PxLuIL40c+enPkKj0oxnrtYK9Ky0RrkWY8re53kYuBAguxgfEN0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dddea2-617d-4f3a-16f5-08d829a10e95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 15:58:18.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc0tweodKtdSyMZsWu77jx/F6KMYo5GNKgz9PZmvZkcd9IxTyQlESClrppjreajk7aZ4rQaZ5wNDmZbzTESWnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2784
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/16/20 6:21 PM, Anson Huang wrote:
> Hi, Daniel
>
>
>> Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
>> module
>>
>> Hi Anson,
>>
>> Few comments inline:
>>
>> On 7/16/20 6:06 PM, Anson Huang wrote:
>>> To support building i.MX SCU pinctrl driver as module, below things need to
>> be changed:
>>>       - Export SCU related functions and use "IS_ENABLED" instead of
>>>         "ifdef" to support SCU pinctrl driver user and itself to be
>>>         built as module;
>>>       - Use function callbacks for SCU related functions in pinctrl-imx.c
>>>         in order to support the scenario of PINCTRL_IMX is built in
>>>         while PINCTRL_IMX_SCU is built as module;
>>>       - All drivers using SCU pinctrl driver need to initialize the
>>>         SCU related function callback;
>>>       - Change PINCTR_IMX_SCU to tristate;
>>>       - Add module author, description and license.
>>>
>>> With above changes, i.MX SCU pinctrl driver can be built as module.
>>
>> There are a lot of changes here. I think it would be better to try to split them
>>
>> per functionality. One functional change per patch.
> Actually, I ever tried to split them, but the function will be broken. All the changes
> are just to support the module build. If split them, the bisect will have pinctrl
> build or function broken.

Hi Anson,


I see your point and I know that this is a very hard task to get it 
right from

the first patches.

But let me suggest at least that:

- changes in  drivers/pinctrl/freescale/pinctrl-imx.c (include file and 
MODULE_ macros should go to a separate patch).


thanks

Daniel.

