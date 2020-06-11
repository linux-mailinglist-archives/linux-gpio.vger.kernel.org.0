Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAF31F63B1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgFKIeh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:34:37 -0400
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com ([40.107.21.46]:55745
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726651AbgFKIeg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:34:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R55udsL6zlDXwduLw6Y9H9bBaqAURlYPyLeKiu45FcD5iT3h/3y1psi9hpheNEvBJQ01bn/q4ql8JGfxRyFHCmGCPrXTwLbt5wxAIC1XsXzoMLd9Ui7lFOOOQsLD5EOGg9UEeYFrQSXyqGE7JzigH04XCmMf64m+70Iv0qAbBaL8SCkph1j6ipkNtzZ56Fu1VkttvePvjNjx12OvOx8XSZBuIBFQ0efriDpwXWoAfP20+bN8fthnpRkz5DOdST5SBwpVSHUNkVY/e7NmiPVEjZt4xPZ6W/8RE1LCYwp0yiobP0wJGBMW+A2/REN3aTBZcBbYxWEghV4yhg9HSQwGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETx5Dd8sTz943zVqBZvQ9vUea9KnbB86qk4neVQp18o=;
 b=DTTlphKI+WFjbzqunOFumACQtuXay+XFMMCPgM5+F2ZdWYzOXk8TgnK8pg/K1s5MRSU0skSsjbdRWIRtBl0hFWoYLXN5rFTxG603O6T+YCDgIGLrPDkHHnRsVJocqCG2UAquh5JYkpBqNLgtCfJ1D6GIGxOwQhqN6QxTLJoX82bxuhWalOpO4kexGtn/xjn68Rw2APeE8t29NqNBgxqbEmto1Au/Wl33DktQN5QjVV5G2b6iClwhjuWlN8AzUFdOgWZkRRjWM1/QIANwQmyxJg6bmL+YEWjA0rQ7u2URsvfmfsNvFUDzd4K74ru2D3eaIaJEOtK/ikiGnibCPHGbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETx5Dd8sTz943zVqBZvQ9vUea9KnbB86qk4neVQp18o=;
 b=aV8Jxp03Gj3Gd1ySzGTfh5fshfFodjWzeMxnYdZN+i5K8ot2p5jwgYfQ/DmvmREu/EaW8e+xq3SKA7pLCDxCdZcbkCD/X7/PCTubNj33eXaYjHfQgXyTDdil1GaM3u63rhJrKPNwGLc2ANehYYNHnmmfApvo4t+0EcrVtt6UxAo=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2575.eurprd04.prod.outlook.com
 (2603:10a6:800:51::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 08:34:31 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 08:34:31 +0000
Subject: Re: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as module
To:     Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
References: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <2dfc7a60-1e96-190b-7385-89a843312d80@nxp.com>
Date:   Thu, 11 Jun 2020 11:34:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::26) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f08:560d:e500:fcf6:7c4d:8076:b570] (2a02:2f08:560d:e500:fcf6:7c4d:8076:b570) by AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 08:34:29 +0000
X-Originating-IP: [2a02:2f08:560d:e500:fcf6:7c4d:8076:b570]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73adfcf3-4b92-4a00-d2cb-08d80de242ab
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2575:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25752EE570A5BD96BE36FA57F9800@VI1PR0401MB2575.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QAlozSzh38Wo5H9Yf29wpqpcWGLuYIGUNvm375u+1WKN0oBnttb5FYa0i2lF+hTme0rDiFx91nkI2SfJ0ELHI64cTNu5sOvOPiDu1W3X4fXlOLqAlz4c9IlCc4iRzCfaEpB7e28w1zS73IEmJkJ/VWLcj2R/XQk6SKktYOE3dNecoy5MaOTsK232SjgRjTwmqFSUWAJg0aJKqOpzroMaD5ogSxjeBwVnpO0AqNPqhHt2m6FlXwNO4lASJnvQR82MMyD0tVDjhEsmuTY/ainzg0wy3TFZnUKNXKZ2UpaA3VZe7YVfINnxi3/dOTZpjrAAH7McW5apW7zTdWcb1MSUP73fm9Yuy8JbbDR75YDuCNCOGgn34e3gg5EZnfLV2vpwSeaZhcdxBwiEf5zwZUDDcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(4326008)(16526019)(66556008)(6486002)(316002)(478600001)(186003)(66946007)(66476007)(44832011)(8936002)(31686004)(83380400001)(2906002)(31696002)(86362001)(2616005)(5660300002)(36756003)(8676002)(52116002)(53546011)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Z8IIyIi+ZcEElHByDKH6i3Gp6JxWuY7+36yzvOiA+9v56UD2jIcd4RDqi3DeTx1k5gbpqpvoeq4gMjA757xRnERnkPbVdxELooumcS6c+qlbWsT4MBLM7uI+VMSOVxn3dlwSsZw8WMeLtijvQwYClc6902j0Tdznclfed4TrS8UVnAy5pPX2ejyiqwZu2Fte17L/LMppe9uQ2m6LfDdqa6bUl8R61zKDSpMXXQBr8UD2YZnQk49XzAhp7pqsUxIliwHysMK9jmSQKqdD4/x7RY4icouCjazyH/p3b1hqfEJQhB6NVq12KOLQNOcq28knXbcfk6PONVirfBI1btpkWqz/m+lNGkKm+LRhRA+1NzJXaVUkGmA76RaG3EdoZ13GqLKWDgiNJzhHYS21Kan0j14rQ4vvvkxXqOzL0Fr6FdGkPhDARfuhmmO1NuawJUEpWJ4E3+suJFtRJhW3UjDIM9zTuPX25paMm1HxSUMaV8dn+dPne02KPlCDLghfdMPGIQikxkD2mWSP/AEuJgu65921cb25To8Vg8Yj/J7A8wtFQEnFELuzszTi+cLrlxj/
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73adfcf3-4b92-4a00-d2cb-08d80de242ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:34:30.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4uPxu6FJufNKrJlE2cB7xPmBcIiChiwx3Jg7gACR6gOi9d90UqOklF4j7XqB7OnmDSAdpnbBcIXRkEF34Xleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2575
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Anson,

Patch series mostly looks good to me. I have a comment about adding

the MODULE_LICENSE. This is a pretty important change.


Can you please add this change in a separate patch with a proper explanation

of why it is needed.


Most likely it is because it was forgotten in the previous patches.


thanks,

daniel.

On 10.06.2020 10:57, Anson Huang wrote:
> There are more and mroe requirements that SoC specific modules should be built
> as module in order to support generic kernel image, such as Android GKI concept.
>
> This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
> including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs, and it also supports building
> i.MX common pinctrl driver and i.MX SCU common pinctrl driver as module.
>
> Compared to V3, the changes are as below:
> 	- change the config dependency back to original;
> 	- use function callbacks for SCU related functions, and all drivers
> 	  using SCU pinctrl driver need to initialize the function callbacks,
> 	  pinctrl-imx.c will check the SCU function callback and call it when
> 	  it is valid, then no build issue when PINCTRL_IMX is built in and
> 	  PINCTRL_IMX_SCU is built as module.
>
> Anson Huang (9):
>    pinctrl: imx: Support building SCU pinctrl driver as module
>    pinctrl: imx: Support building i.MX pinctrl driver as module
>    pinctrl: imx8mm: Support building as module
>    pinctrl: imx8mn: Support building as module
>    pinctrl: imx8mq: Support building as module
>    pinctrl: imx8mp: Support building as module
>    pinctrl: imx8qxp: Support building as module
>    pinctrl: imx8qm: Support building as module
>    pinctrl: imx8dxl: Support building as module
>
>   drivers/pinctrl/freescale/Kconfig           | 19 +++++-----
>   drivers/pinctrl/freescale/pinctrl-imx.c     | 22 ++++++-----
>   drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
>   drivers/pinctrl/freescale/pinctrl-imx8dxl.c | 12 +++---
>   drivers/pinctrl/freescale/pinctrl-imx8mm.c  | 10 ++---
>   drivers/pinctrl/freescale/pinctrl-imx8mn.c  | 10 ++---
>   drivers/pinctrl/freescale/pinctrl-imx8mp.c  | 10 ++---
>   drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  9 ++---
>   drivers/pinctrl/freescale/pinctrl-imx8qm.c  | 12 +++---
>   drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 12 +++---
>   drivers/pinctrl/freescale/pinctrl-scu.c     |  6 +++
>   11 files changed, 86 insertions(+), 93 deletions(-)
>
