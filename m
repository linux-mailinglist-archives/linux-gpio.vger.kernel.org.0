Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD67B212312
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgGBMSh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728719AbgGBMSg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:18:36 -0400
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1C6C08C5C1;
        Thu,  2 Jul 2020 05:18:36 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 49yHF72b7SzKmV1;
        Thu,  2 Jul 2020 14:18:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593692313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8PdW4mY0M10JbXsnQKZPQGWOov3L8734sg9udOp2odM=;
        b=myuci/fRw15/QzDb3nTia6hCdEO/4qQDCzXXK8x0k4uR/xxZcky8rf249YE93rqV+l4UNS
        mp/jqH72t546XWpFyJRasU2fVyJHP6kYW/4tkXdpTtt9gWPXXin25lv+IFPTsgIuKklrO/
        /2Gl2+doiqmOEgkuZxHWIYRPuY7rEAC2e4rxQ3DUkGIZCCZaNyon3lvkodXNXQqIvTeAz4
        NahrXayIWFOyVLQtaFjoUYPes/tLihjK1xNSlorsR7gvMPE+/jRXdtZySe+q6QsRhwx5zS
        g8bkvbSx0cz8O+1IBpA3UMWLfrsYU+r4g3Ndgp+czbfR+fjMFJitU7BlBtzy4A==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id K4S0sSUXSksq; Thu,  2 Jul 2020 14:18:32 +0200 (CEST)
Subject: Re: [PATCH v3 1/2] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200630160736.1196697-1-mans0n@gorani.run>
 <CAHp75VfuvuMQ3r_SHSUzE78TViQMqDCqPLEZ4eUjLVUpNHj7kA@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <70c39afa-ee69-f867-61ae-a7e3a5c149d6@gorani.run>
Date:   Thu, 2 Jul 2020 21:18:24 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75VfuvuMQ3r_SHSUzE78TViQMqDCqPLEZ4eUjLVUpNHj7kA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -2.70 / 15.00 / 15.00
X-Rspamd-Queue-Id: 32C4F1807
X-Rspamd-UID: 0a1fcb
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-07-01 06:30, Andy Shevchenko wrote:
> On Tue, Jun 30, 2020 at 7:08 PM Sungbo Eo <mans0n@gorani.run> wrote:
>>
>> NXP PCA9570 is 4-bit I2C GPO expander without interrupt functionality.
>> Its ports are controlled only by a data byte without register address.
>>
>> As there is no other driver similar enough to be adapted for it, a new
>> driver is introduced here.
>>
> 
> It looks good, but I would add ->get() to return buffered value.
> 

Thanks, your suggestion was indeed valuable. I reworked the driver, 
please have a look.
