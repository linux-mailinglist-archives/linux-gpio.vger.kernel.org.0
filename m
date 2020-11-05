Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B902A80B3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgKEOUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:20:11 -0500
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:58937 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbgKEOUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:20:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.208219|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0233462-0.00248599-0.974168;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.It0N8fJ_1604586001;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.It0N8fJ_1604586001)
          by smtp.aliyun-inc.com(10.147.41.187);
          Thu, 05 Nov 2020 22:20:01 +0800
Subject: Re: [PATCH 0/2] pinctrl: ingenic: Cleanup & add lcd-8bit group
To:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201101090104.5088-1-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <3043b88a-d854-9c6d-ab19-2e9c816c4aa9@wanyeetech.com>
Date:   Thu, 5 Nov 2020 22:20:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201101090104.5088-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On 2020/11/1 下午5:01, Paul Cercueil wrote:
> Hi Linus,
>
> A cleanup patch to get rid of a lot of const data, and a patch to add
> the lcd-8bit group for JZ4770 SoCs.
>
> Based on your latest for-next branch, since there are already some
> commits on pinctrl-ingenic.c there that aren't on v5.10-rc1.
>
> Cheers,
> -Paul
>
> Paul Cercueil (2):
>    pinctrl: ingenic: Get rid of repetitive data
>    pinctrl: ingenic: Add lcd-8bit group for JZ4770
>
>   drivers/pinctrl/pinctrl-ingenic.c | 1267 +++++++++++------------------
>   1 file changed, 455 insertions(+), 812 deletions(-)
>
Works fine on JZ4770, JZ4780, X1000, and X1830.

Tested-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>


Thanks and best regards!

