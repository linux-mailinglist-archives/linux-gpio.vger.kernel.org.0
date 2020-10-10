Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BA928A255
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 00:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbgJJW46 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 10 Oct 2020 18:56:58 -0400
Received: from aposti.net ([89.234.176.197]:47164 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731325AbgJJTKj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Oct 2020 15:10:39 -0400
Date:   Sat, 10 Oct 2020 21:10:14 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 0/3] pinctrl: Ingenic: Add support for SSI and I2S
 pins.
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-kernel@vger.kernel.org,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <2L20IQ.FYURHZYQ6ZCT3@crapouillou.net>
In-Reply-To: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
References: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
        <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus, Zhou,

The first patch is bogus. Half of the SSI pins are wrong (GPIO chip D/E 
start at 0x60/0x80 respectively).

Sorry for not catching that before.

-Paul


Le mar. 29 sept. 2020 à 14:48, Linus Walleij 
<linus.walleij@linaro.org> a écrit :
> On Sun, Sep 13, 2020 at 8:59 AM 周琰杰 (Zhou Yanjie)
> <zhouyanjie@wanyeetech.com> wrote:
> 
>>  1.Add SSI pins support for JZ4770 and JZ4780.
>>  2.Correct the pullup and pulldown parameters of JZ4780.
>>  3.Add I2S pins support for JZ4780, X1000, X1500, and X1830.
>> 
>>  v2->v3:
>>  1.Add Paul Cercueil's Reviewed-by.
>>  2.Fix bug about PE15's pull-up parameter.
> 
> This v3 patch set applied!
> 
> Thank you so much for your hard work!
> 
> Yours,
> Linus Walleij


