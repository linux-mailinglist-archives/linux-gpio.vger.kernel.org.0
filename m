Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B642AD9BA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731142AbgKJPJQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730681AbgKJPJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 10:09:16 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47566C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 07:09:16 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 6383222F00;
        Tue, 10 Nov 2020 16:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1605020950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KwjGWo9bbYvzV5RALNqMObpqJAjMOooq79hzppZLfXc=;
        b=Y1p7KrZSZsWM5oznpflQO+7xhtlwZZho6WpBbb8VgxkquDR/8lEnhLbBuYOjoRplzQb6HO
        CtcXL9rDFbP1m7xBBzxkzQ+WTvuYfvn0t3JS9kwLcsyqahC/DgM33S82H/0kuqyR3a/mPg
        EXEqPROgJNrgX3hrnUXzExno4SaBzXA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 16:09:10 +0100
From:   Michael Walle <michael@walle.cc>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
In-Reply-To: <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
 <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
 <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
 <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
 <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <2ba78a0c9509a65de3155d5e90cc4744@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-11-10 15:40, schrieb Bartosz Golaszewski:
> On Tue, Nov 10, 2020 at 3:31 PM Linus Walleij 
> <linus.walleij@linaro.org> wrote:
>> 
>> On Fri, Nov 6, 2020 at 12:27 PM Damien Le Moal <Damien.LeMoal@wdc.com> 
>> wrote:
>> 
>> > It may not be the best interface for regular end users to
>> > manipulate gpios, but it is definitely super useful for developers to do quick
>> > tests of their setup/drivers (which is what I did for my work with the Kendryte
>> > K210 RISC-V SoC support).
>> 
>> It is a bit discouraging that RISC-V, which was invented after we 
>> already
>> obsoleted the sysfs ABI, is deploying this for development and test.
>> 
>> We need to think about a similar facility for users which is less
>> damaging but fulfils the same needs. I think I saw something a while
>> back that looked promising and added some funky files in debugfs
>> in a hierarchical manner per-gpiochip instead. That is how debugfs
>> should be used.
>> 
> 
> Basically something like what gpio-mockup does for events? Was it
> something out-of-tree or was it on the mailing list?
> 
> Also: quick tests have the tendency to become long-term solutions. :)
> 
> Is gpioget/gpioset duo difficult/cumbersome to use?

No, but
  (1) you have to know that it actually exists. This might be obvious for
      you, but I don't know whether every embedded developer is aware 
that
      there is actually a tool to control GPIOs from userspace. So a 
simple
      find /sys -name "*gpio*" and figure out how to use it might be his
      first choice.
  (2) you have to have it installed. If the reference board doesn't come
      with it preinstalled, the sysfs is usually easier to get going
      because its just there.


> It's a serious
> question - I wrote it in a way that was as user-friendly as possible
> but maybe I'm missing something about sysfs that makes users prefer it
> over a command-line tool. To me sysfs was always a PITA with the
> global numbers etc. but it still seems to stick with others.

That is correct, and I actually find it a lot easier to use than 
figuring
out the sysfs numbering, esp. if your DT contains gpio line names. But
there are still old habits (at least in our company).

-michael
