Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC961F640D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgFKIzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:55:24 -0400
Received: from mail-am6eur05on2058.outbound.protection.outlook.com ([40.107.22.58]:29641
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726802AbgFKIzY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:55:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/OHrnsmpoaHtD+fD1pdeRlNMc2MHkYYgHt/8wjPDqTq7lLDyaNjJE9XUXetSNShXn6oK2Cb4IUWW0DdqAOnIqfAV954QRav6gEGkZKtIHcCzwvnAtCweIv0iI3VRf/iuB9whuCnz/MTSCw9pq2iRPupt5gzdu7JddpRM4Y8vHzHxQt5VZ+SCBtxWMY7VqRfZVhyOcLweHT2IJ4NUG601GNPxZPdWyJweGWU00UZeLXsSwCSiF+62oOZPj1tOhVZYYiNCp9PmBYeUhFeoZcQOFrgEM2QewiTYIBr36tBN7yciTCC+3zsblGOTXKMYDV95mBoNuzl8Rcs+6uRSiTdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOLDR6+8YucV1jyxwREMv1Pf2R4Jth9+nYjWECpqYp0=;
 b=Yq/s2eefsXuae/J1fd6aTsKXUQN0TdbC7mfjJgRL0tr8+01CTJaLjShNvj2Sic2sw8Qo7Ncrb7gfAaOhEc+77tUUhT2GySmMvj9X7eb1Sv22Ul14Cb0fYtzLBxQ0dJH5U6WyrtNJyjyudCe/PGLSUVOUIT3ZwTYPQJL4bmayD+2p925Uu6rxCScNtlsbkpBOSXA5Hoh1i3wF/WIk4qsmT+Tm9pDm+lYJ/AFFBL2UnWlQ64QAjmaZn+lqxVeDgkxPXiYD68Umuvqhy99COQ1URZcydZtEEStntjH1muuLWQsjTVCWgWwWHo8MOvG82z0GsdEE7MyVU3A5N1vvh4DA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOLDR6+8YucV1jyxwREMv1Pf2R4Jth9+nYjWECpqYp0=;
 b=mcNU+NTlfmfAyulj98kPuQykSoNuwYr0ykwXoUT7PlYTAnuV5b+aGQ0goZ3YqbZPkoE37vwphAokpUXDqcbEMcZ7QFjtmQFrRfq18sce0iG5zEfKXFgr7izbF1j9KXEh92Ajw3u/k1hrEQ3OQQV5nRPyyhHpN8DH+9RaLtJdm6E=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2413.eurprd04.prod.outlook.com
 (2603:10a6:800:2a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 08:55:19 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 08:55:19 +0000
Subject: Re: [PATCH V4 4/9] pinctrl: imx8mn: Support building as module
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
 <1591775865-26872-5-git-send-email-Anson.Huang@nxp.com>
 <33292cab-c49d-0878-dd8c-1166258e089b@nxp.com>
 <DB3PR0402MB391645F95B19B2438736B546F5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <d23114e1-1a81-45cc-e8da-6fed53f455ab@nxp.com>
Date:   Thu, 11 Jun 2020 11:55:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <DB3PR0402MB391645F95B19B2438736B546F5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0066.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::19) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f08:560d:e500:fcf6:7c4d:8076:b570] (2a02:2f08:560d:e500:fcf6:7c4d:8076:b570) by AM0PR10CA0066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:55:17 +0000
X-Originating-IP: [2a02:2f08:560d:e500:fcf6:7c4d:8076:b570]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fff8481b-0618-41ca-ba98-08d80de52acf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB24134DFED1A6F17DA933DDC3F9800@VI1PR0401MB2413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iy2akpeYGcbdvT5YVKl+4o6yR42XR8vEzbdxW130lXg9M6u0Zm+JLWZLvhzxjuqYi5hNLf2DSTyHmApMnTMAoSoVvPLo9Xo9yg78PJAnr1YTwDlP1dGZ9C+dKroHxpbcmrLzCnP0T7F2d6WuaP+znFjt6chSUbn8blpRsDNOoE/Ll+gUs54GpAtEnJ6F+92aQGeRFPYrQCuLkr/woE25TuO5Fjm1WWD//QliWNXcJOBRjP+GUlyZcuAv7JnoysHyqHVOIz8vuwcVwKcPG2cKv+SSIfGGSfhPkAf0ZXmJeaV9zhXeujQt+PX0PvdWD3TPsK5rDbTetIg/N/pAzYW9QyvJSPuEG81vuShUI096sCjThdcPFhxPRZc9Rac0OfACiz2j/6oQcCJ/8wdsMkZExSzkpBN2lG1UEhYWXcfrG/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(36756003)(2616005)(2906002)(83380400001)(8676002)(16526019)(66556008)(6486002)(66476007)(66946007)(31686004)(316002)(8936002)(5660300002)(478600001)(86362001)(44832011)(4326008)(53546011)(52116002)(110136005)(186003)(31696002)(921003)(32563001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fz3Jl0HwAs93cw+scyx0XZJcfH8SNWOflFIAYqWrlOozaW/rkNVEXA/OfDBuo8UzxlIAfYcsCQ5zpqaCVzoREBLpD7My7mX20bXUB80jiX7/OKiWiiby0XSxxCGeQm0KIEsiaiDm9+FZ3xDKtdTlFTsnG1K4QBqKgKuf6v3nIwSU88N4O5NNvTOsKOtF0SuibzkSfKiuySWb2mILPAvHa/EGzQ6iLf+speWCyppvHG32LkjjjdPpp/5+SyFSnzxBXtB0vf6XMFMurCA0VDzloVwifIAo+q+W8iv3Ilyly/7Np8ZLdyKas3fQHvu8X1R6x8fz1JsmwUxWhtko8lVBCztzBn+Rsg9HixKVPI2x1srcp7LgYAHGHTlOiIxN4rWdWdn0ugk+ozewjm39ejZjgJOCLa9NtW4gq40UNnGPyuf6PQWyoVFsKt2wkHdHg7PFgLbDw5KdYUZ2QhPhm/jsETyevcYofB/ZHQsgQRm7/MqikzZxvCOxKKDCLVXn5M5jhX9TftAP8M6nINAoCG5SFUcshToXHU5DchwOQuFqwL2gG+a7/IhbEnR8BvyqGNfy
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff8481b-0618-41ca-ba98-08d80de52acf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:55:19.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5h4yL4VAo/PG7zmxGMO8rflxFcDhzBBE6lYEqL8qJNESahukXIM2WoDoNauyRbS0ZokvBXahvcX4CEHT7SkNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2413
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 11.06.2020 11:48, Anson Huang wrote:
> Hi, Daniel
>
>> Subject: Re: [PATCH V4 4/9] pinctrl: imx8mn: Support building as module
>>
>> Maybe this is obvious but I would really like to see an explanation
>>
>> of why we are switching from arch_initcall to platform_init.
>>
>> Commit message act as documentation  for the reviewers.
> Yes, I noticed this, and it looks like unnecessary change, and I just replied in
> mail that I will change it back to arch_initcall() in order to make sure nothing
> changed for built-in config. Below is what I replied in cover-letter mail:
>
> " I will keep the arch_initcall() there in next version patch series, it can make sure
> the change does NOT impact built-in config. For module build, the arch_initcall()
> will be same as module_init(), user needs to insmod the .ko with correct sequence."

Ok, that's great. Lets try to keep in mind that the commit message should

answer to a simple question: "Why the change is needed" :).


Then, the details about the change should be added.



