Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E23218A27
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 16:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729495AbgGHOaw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 10:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729468AbgGHOaw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 10:30:52 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC52DC061A0B;
        Wed,  8 Jul 2020 07:30:51 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4B21tt3ctKzKmbV;
        Wed,  8 Jul 2020 16:30:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1594218644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kX81NycJZXqFDav0WaAV9dyuGlCyo9ucVS5/FDIjzzs=;
        b=lvqdmIXuPZ0UF46UgaCL//Sdbd544riT3EyN6lY/8GIyk8uQLZHUOSTrh1VthcbJJFjZlM
        gko5xwrGOGzRPGT2zOWqrBPtmAoAmJB3tO5kxR/viiNoN1sKggTxLaTPooscm0RcGvIQ4d
        y3O2soWlcIxYjEBDiZiipcTzH+C6Fv3H5jA5A1LK02G/2at7ITZrH4LNTD16+3/LEqXrsk
        i0+PaAVpadhNh08rlMO9oKlRFuQ+TfFM/JxrNPSwoqQMDatHbVJAHQZnS3noOarvC+Hak2
        OAikDiV4gOSg9jOvJBvibZWOde8LYKRH7xmGJihkQs1j+F7JmFb4VqCp8xGejQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 4sg0785dkFjG; Wed,  8 Jul 2020 16:30:43 +0200 (CEST)
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20200705133038.161547-1-mans0n@gorani.run>
 <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
 <CAHp75Vf4440V5Oh1SA5tjVgss134qGkx591ANDY3aQ+oecEzmw@mail.gmail.com>
 <15d8ae43-6905-b861-3b50-d1ba780edf2d@gorani.run>
 <CAHp75VeKUvy9tkoBq=axx9g-2_p3QUqffA1z2WmGO-Uu8oyHHA@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <60306316-3dee-3bb8-3f42-7a6258102a42@gorani.run>
Date:   Wed, 8 Jul 2020 23:30:36 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75VeKUvy9tkoBq=axx9g-2_p3QUqffA1z2WmGO-Uu8oyHHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -3.05 / 15.00 / 15.00
X-Rspamd-Queue-Id: 5B421174A
X-Rspamd-UID: d14524
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks, it made me think about it deeper...

On 20. 7. 8. 오전 12:07, Andy Shevchenko wrote:
> On Tue, Jul 7, 2020 at 5:03 PM Sungbo Eo <mans0n@gorani.run> wrote:
>> On 20. 7. 6. 오후 9:00, Andy Shevchenko wrote:
> 
> ...
> 
>> But I don't really understand what mutex does here. The driver does not
>> need consecutive commands, it only sends/receives only one byte at a
>> time. And AFAIK each i2c_smbus function is already protected by a mutex.
>> So what should be exactly inside the lock? Should we protect the output
>> buffer as well? I'm not an expert on this so please enlighten me.
> 
> There are questions, answering them will give you a solution:
> - Since we have two functions doing i2c communications, can they
> clash? If so, does the i2c framework guarantee the serialisation?

I think it does.

> - Since we have a shared resource (buf), can accessors clash? How do
> we guarantee serialization?
> 

But the output buffer should be tied to the i2c operations. So I guess 
it requires a mutex here.

pca9570_get() does not access gpio->out so it does not need to be locked.

On the other hand, the whole pca9570_set() function should be protected, 
from reading gpio->out to rewriting to gpio->out. So pca9570_write() 
error check should be inside the lock as well. Am I right?

Thanks.
