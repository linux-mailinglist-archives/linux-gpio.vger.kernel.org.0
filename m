Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A07B3A596C
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 17:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhFMPxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 11:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhFMPxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 11:53:34 -0400
Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [IPv6:2a00:d70:0:e::317])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC71C061574;
        Sun, 13 Jun 2021 08:51:33 -0700 (PDT)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
        by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsSOZ-000Jm9-IU; Sun, 13 Jun 2021 17:51:31 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
        by asmtp013.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsSOZ-000DQg-Ft; Sun, 13 Jun 2021 17:51:31 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, Stefan Roese <sr@denx.de>,
        Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
From:   Reto Schneider <code@reto-schneider.ch>
Message-ID: <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
Date:   Sun, 13 Jun 2021 17:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 13.06.21 14:44, Andy Shevchenko wrote:
> It smells like a fixing non-existing bug. Yes, I understand that there 
> is some custom hardware with custom firmware which is using Linux kernel 
> with some never upstreamed patches. On top of this sysfs interface is 
> deprecated for already a few years and shouldn’t be considered as 1st 
> class citizen.
> 
> That’s said, if there is no Fixes tag provided with clear point that _at 
> some point_ it was like this in upstream, I would tend to NAK this patch.

I did some digging and indeed, it turned out that I used the 
pre-mainline GPIO driver from OpenWRT even on Kernel 4.19 (for which the 
current driver already got mainlined).

Surely do agree on not breaking the interface in mainline, and the NAK.

Sorry for wasting your time!

Kind regards,
Reto
