Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25520153717
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 18:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBER5S convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 5 Feb 2020 12:57:18 -0500
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:29112 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBER5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 12:57:18 -0500
Received: from belgarion ([109.220.251.231])
        by mwinf5d45 with ME
        id z5xE2100A50Jj11035xEhh; Wed, 05 Feb 2020 18:57:15 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 05 Feb 2020 18:57:15 +0100
X-ME-IP: 109.220.251.231
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: pxa: Avoid a warning when gpio0 and gpio1 IRQS are not there
References: <20200128210845.332679-1-lkundrak@v3.sk>
        <CAMpxmJUPcackGYLfX83TT1V9x2=iHgnw3cZ=KufuHn9FeKOn_A@mail.gmail.com>
X-URL:  http://belgarath.falguerolles.org/
Date:   Wed, 05 Feb 2020 18:57:00 +0100
In-Reply-To: <CAMpxmJUPcackGYLfX83TT1V9x2=iHgnw3cZ=KufuHn9FeKOn_A@mail.gmail.com>
        (Bartosz Golaszewski's message of "Tue, 4 Feb 2020 11:13:44 +0100")
Message-ID: <87ftfo29zn.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:

> wt., 28 sty 2020 o 22:08 Lubomir Rintel <lkundrak@v3.sk> napisał(a):
>>
>> Not all platforms use those. Let's use
>> platform_get_irq_byname_optional() instead platform_get_irq_byname() so
>> that we avoid a useless warning:
>>
>>   [    1.359455] pxa-gpio d4019000.gpio: IRQ gpio0 not found
>>   [    1.359583] pxa-gpio d4019000.gpio: IRQ gpio1 not found
>>
>> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Okay, what would have really be nice in the commit message was to state _which_
platform doesn't use these, and still use pxa-gpio as their gpio driver.

Cheers.

--
Robert

PS: And yes, my response is late, but I'm moving house so my ping is huge
lately.
