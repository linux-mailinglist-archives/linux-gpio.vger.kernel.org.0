Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3970D216E51
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 16:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgGGODP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 10:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgGGODP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 10:03:15 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC712C061755;
        Tue,  7 Jul 2020 07:03:14 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4B1PKW5V4WzQlH2;
        Tue,  7 Jul 2020 16:03:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1594130589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ll7gVSOL9XzROZUsvjqsjM/q+j59gZ3tVsoc4JCDtNA=;
        b=ZS2vQUAeQJHJPZt1jny2VGDtSVHRhegIw8xtPLsbJocmWRMiL5uVguvw1FWnkqtYb6g7q6
        AdMEjo0BFuMFRATOn5oElrxBJWvbqmyma+Mc+NAo0aKypOcTQmk5Myd5v++BNafQDp32b2
        +bigyB6DFx+jbTfxFDcREMbZJhTRGdkr/LgF0gY4i/qy1c2qO7+cLekhLc+SBNR4pGZity
        xJYXCmnpPyORS35HePL4T4Bg+FRA5TYmlN9T8/ORs8DIvYQFOEMj2RJNLbb80Qm20dwPV1
        /NvEVW8MXCzf4LOv06HV8mpDURY6xZS3+uimkweMl2B9rkp3sn/fxaRHl1RYtg==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id aMe3dxk8w6IU; Tue,  7 Jul 2020 16:03:08 +0200 (CEST)
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20200705133038.161547-1-mans0n@gorani.run>
 <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
 <CAHp75Vf4440V5Oh1SA5tjVgss134qGkx591ANDY3aQ+oecEzmw@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <15d8ae43-6905-b861-3b50-d1ba780edf2d@gorani.run>
Date:   Tue, 7 Jul 2020 23:03:00 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf4440V5Oh1SA5tjVgss134qGkx591ANDY3aQ+oecEzmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -4.05 / 15.00 / 15.00
X-Rspamd-Queue-Id: 78083178A
X-Rspamd-UID: 2ba226
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20. 7. 6. 오후 9:00, Andy Shevchenko wrote:
> On Mon, Jul 6, 2020 at 2:21 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:>
>> On Sun, Jul 5, 2020 at 3:31 PM Sungbo Eo <mans0n@gorani.run> wrote:
>>>
>>> NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
>>> Its ports are controlled only by a data byte without register address.
>>>
> 
>>> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
>>>
> 
> No blank line here.
> 
>>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> 
>> This driver looks nice now but why did you remove the mutex in v3? I
>> think when Andy commented on that, he meant not understanding why the
>> error check is protected, not the i2c operations.
> 
> Right.

Oh, probably I misunderstood the comment... :(

But I don't really understand what mutex does here. The driver does not 
need consecutive commands, it only sends/receives only one byte at a 
time. And AFAIK each i2c_smbus function is already protected by a mutex. 
So what should be exactly inside the lock? Should we protect the output 
buffer as well? I'm not an expert on this so please enlighten me.

Thanks for your kind reviews, as always. :)

> 
>> Are you sure you don't need this lock?
> 
> It's a good point!
> 
