Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5908C20F925
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 18:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgF3QL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 12:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgF3QL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 12:11:27 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C374C061755;
        Tue, 30 Jun 2020 09:11:27 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49x8Vj546PzQlLc;
        Tue, 30 Jun 2020 18:11:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593533483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WvyEvwVOE6KFGw0IR8ROR1P235uwh5VDXyfvL1XeXgA=;
        b=j73ErYfMWm6xpXPOypH1e0O4BeBvU/7X9mMqNt5Fubpqo0+PCONMb9KncbqekxtX/KxsAI
        rRdgPTYv98ApEr+JHhC1zMsZyMwkHJELP2L97BCJ6ypolHE93O8ajAus4ZdOhN3owbFieu
        qYUhmXIo2VU/JGBbIzQrGAWYQ0g3X2fKpxtkOCX11Da0Y7fZwDbCJKtTYz79vGuG4MpFEX
        jdPeIkm3+rU/KFoATWeODmhE3Y1FBjxpfSaWHJ0tRabrrp/7U+poAC944c+vcOGbfsVWAw
        S0WNDqoTa+osV9iYeyNlS8cYXGfp+8bYpU2Jy/8WB5caAO3661zgVB7bB4DbZw==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id GE1n9uaG34HV; Tue, 30 Jun 2020 18:11:22 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20200625075805.363918-1-mans0n@gorani.run>
 <CAMpxmJXDHX-U-HWR8093orBU1ZxEeWp_r2Xar+k5FMoZ1pS78Q@mail.gmail.com>
 <CAHp75VdNh8nFNqZxSD0g7ADD8GvY+Dmbfg8xc6LW94hw_Brwew@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <c7fd2365-0f47-b2c8-4085-020928c79254@gorani.run>
Date:   Wed, 1 Jul 2020 01:11:16 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75VdNh8nFNqZxSD0g7ADD8GvY+Dmbfg8xc6LW94hw_Brwew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -4.04 / 15.00 / 15.00
X-Rspamd-Queue-Id: A955F1800
X-Rspamd-UID: ed3a9e
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for all the reviews! I've updated the patch, please have a look.

And I have something to ask.

# echo 1 > gpio408/value
# cat gpio408/value
cat: read error: I/O error
# cat gpio408/direction
out
# echo out > gpio408/direction
# echo in > gpio408/direction
[   91.006691] gpio-408 (sysfs): gpiod_direction_input: missing get() 
but have direction_input()
ash: write error: I/O error

I've never dealt with GPO expander before, so this seems a bit odd to me.
Is it perfectly okay to leave get() and direction_input() unimplemented?

Thanks.

On 2020-06-30 18:53, Andy Shevchenko wrote:
> On Tue, Jun 30, 2020 at 12:28 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>> On Thu, Jun 25, 2020 at 9:58 AM Sungbo Eo <mans0n@gorani.run> wrote:
> 
>>> +static const struct of_device_id pca9570_of_match_table[] = {
>>> +       { .compatible = "nxp,pca9570" },
>>> +       { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
>>
>> If you're not using it in probe than maybe move it next to the I2C device table?
> 
> (Side note)
> ...and even if so it can be assessed via a struct device pointer:
> dev->driver->id_table (don't remember by heart, but you have an idea).
> 
