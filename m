Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9F1F63FA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgFKItp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:49:45 -0400
Received: from mail-eopbgr10064.outbound.protection.outlook.com ([40.107.1.64]:60898
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726708AbgFKIto (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:49:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/neNhnLnKbjE4d56YbMirKJV2OrA/k+rhkdTS8wu+l3104R6QP/SzeI8SCAIev+VRV7Pnh0W7tcfawvybgr+gCm3ZvaVLcEL0//0faSYfaGiOqMWwRd282NVM66zeOSD7H6p2meZw42DPYIct4w2YtzOMIBLNn9Bu9tN2IjNmeUXqVr7fq0B5XTnK3BlTjP0D3iaLduEnH+Ykn3/Qg5cptFA98aBnMVZX6qENAxlDMvEhDTIc11yN8P4j4IbcX00Hi6l/rGhbbS+5s2hbx0/kKm0TDYGgIQItAyGBdWiPrifAlDKbqVUAEbvLciYNLWknrRySZce+/48OnfvSDmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL2l2poXSqNiwnoelraimj8dfu7GheNoARyA725HHWg=;
 b=erSyKrpgQq+z70JOplNOQEXhG615q1U+6uU8s5foQhorvN1NThJ0Ea6RFscQWAnFnhtBKj1jc3NY7tRosPJXF31RBhtaE/6JGgScdY94y7MwTZj3bOJAjUsyfcqDoW+dedNPEivlopEE9xVCWt/iYs0LhqEFCk3uzgwwnVZkZkOf0fN0lluHagQUllFsr4xUGi3Vm5LLjF4fSKO1kP/QI9nCDKYEH/D7J2LDeS6mKXlwYlWfHvYPp8+0OP+OEjJCaATk6v3Hx9Gk7HbpSW7qnflQN7feiyyeT1N8JGdXX3Y00XhVMa3sRBzkMbUEf8QaIHPSPm/S3eQ+eIyFeMEO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL2l2poXSqNiwnoelraimj8dfu7GheNoARyA725HHWg=;
 b=gML4mUpCQNbBNaKwg1TC6sy3fJl1XSBGAO2qof5KIZnoacHfMp/xLXuDKiVm/3RWU3UqDi+7XBbRJ8GJI+g5X2AemPDau89C7WO2YUi5WnWr8gArSgEj7fV4xm+H1RkPjl2g+mtjzKAWICyinm8aPOAZ4Z3Cihz6DvLbPrVCJ94=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2413.eurprd04.prod.outlook.com
 (2603:10a6:800:2a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 08:49:39 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 08:49:39 +0000
Subject: Re: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as module
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
References: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
 <2dfc7a60-1e96-190b-7385-89a843312d80@nxp.com>
 <DB3PR0402MB3916AF541FC5692D00625EECF5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <0eeb2beb-e4f1-bf53-843e-c78bc84809f3@nxp.com>
Date:   Thu, 11 Jun 2020 11:49:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <DB3PR0402MB3916AF541FC5692D00625EECF5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f08:560d:e500:fcf6:7c4d:8076:b570] (2a02:2f08:560d:e500:fcf6:7c4d:8076:b570) by AM0PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:208:122::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:49:38 +0000
X-Originating-IP: [2a02:2f08:560d:e500:fcf6:7c4d:8076:b570]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd89a9c6-7505-4bad-f268-08d80de46063
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2413AD56A342C262EE7432D3F9800@VI1PR0401MB2413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cNXQ1JUn3xGUTNpXV14HWH8RgB12IJf+BGamFLZq9fxnzbh/jTqjJfml2F4GdQqXv39ZJZeLpeG0r7YEB5eLq2mokTHklbXo6giSJIGL/ksOcmzFkPMWyEBCYn6JOVAirGIY3ie0Fk+CK5jP9fPwvz3KJ+ujdFinLgkE9SXAPwhYhWE4GTp10swsVXlOkXevyw+XKq5qs03AjeMI9MBaJlcUaFSL/WyD2xplKeUZFD389q2cahnAN+z3B7UGOkq5nG7pQXC/bKnEXfAGypZt4EkeQDFWShiOFbbcWhCUi679mq06KeO4Xg7DCtPisV47XL+tOUs5bPGUyWHcakaX/roh8Rzs+mFKFpqPQy8ANazX4zCD1syL3mTgu/IpxT72C48gxsHhnBOuVZQgwxE20g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(8936002)(5660300002)(478600001)(86362001)(316002)(52116002)(110136005)(53546011)(186003)(31696002)(44832011)(4326008)(83380400001)(16526019)(8676002)(2616005)(36756003)(2906002)(66476007)(66946007)(31686004)(66556008)(6486002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: S9EIXz2Jlwo+wSZzIYWQiohfxMbBuYr164uqkQFoONzVQ3vw17vLIvaLAXadtlcd74WaotY+zvSNRI0s5+pw35GXZVS0mN36rCxEi7PmDE29qAUx1IunlK0iFnCdbFfIvmuwhTyhCk9TdChb4+TiNAe8esXBpJJoMc4hbxhp4nf+F7cmPhv9FRqFCAYncatTgwxU/M90X/TEY2IlBUWRwfCeqYSJ9gww8KXW1M4Ss7nJgll8cNLJk4TyC/gfoRW0z3tUuNfbFH7Gw6/Ulrb9/NsE8+cp5FgxI4c/VS3n4fsSlWUvS6ZuqhCMkb9khL9DCtvUt33w4RbefMTVrhCP1EWXCWhrHCqJQoem3zjuMNdn21k3F0yiFtt7IxjbQY+E9ilxWFKxPhzydAns2kszYo0x5wxBzI3+aipXyJrZ2aDYVqrU4HTDLpx2k08II2fJ4queT1FKDL/SHYpbkvoAyABeNgYljSgMvkT/aj5h5Mk6RbC8p2Oi7A+xXMqPo9sWVAxgb6ZNvXN+nkuGyNYVlWR0InPTMIVk7bsaZWVcKl8mGFuqYZl7Zfh7tKN6mvU0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd89a9c6-7505-4bad-f268-08d80de46063
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:49:39.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJzwjjZg9L9k3CTV6MyYKK3ioYLP3au77iAn0lPBc+Kk8TFs/UGXzWE45snVHviVXmrzRsz9lad9FtakCwATvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2413
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 11.06.2020 11:44, Anson Huang wrote:
> Hi, Daniel
>
>> Subject: Re: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as module
>>
>> Hi Anson,
>>
>> Patch series mostly looks good to me. I have a comment about adding
>>
>> the MODULE_LICENSE. This is a pretty important change.
>>
>>
>> Can you please add this change in a separate patch with a proper explanation
>>
>> of why it is needed.
>>
>>
>> Most likely it is because it was forgotten in the previous patches.
> Yes, it is obviously missed in the previous patches, as previously these pinctrl drivers
> do NOT support module build at all.
>
> And MODULE_LICENSE is a MUST when drivers supporting module build, build will report failure
> if module license missed, so I think it is also part of the module build support patch,
> do you mean it is better to add a separate patch to add the MODULE_LICENSE to all pinctrl drivers missing it?
> Maybe we can get more opinion from maintainer, I am NOT very sure whether it is better to separate
> the module license as a single patch....


Hi Anson,

This is my feeling. That the first patch in the series should add the 
MODULE_LICENSE to all

of files.

This keeps things simple, explains our intention with next patches.

Daniel.

