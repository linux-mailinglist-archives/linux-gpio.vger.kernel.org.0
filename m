Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2673C209AB4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 09:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbgFYHlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 03:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390288AbgFYHlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 03:41:44 -0400
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 Jun 2020 00:41:44 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922B2C061573;
        Thu, 25 Jun 2020 00:41:44 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 49ssHB268wzKmgv;
        Thu, 25 Jun 2020 09:35:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593070500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=30dYw6jJSc3h50zr6f6o1QF9VOz2xKEDt+vOebdkixg=;
        b=n08L3MBTph5lqmuRJ2kmDCcR6yET3yCAq0yBhTwz5owm1W5+KKQdSKdxxEWmJI36EJxyw4
        fOP03et5MpGm8V9mnexWInoZttjfy3C8isXOJZ52Tw/9vlq1CINL7jsEG/u6D5QCgn6X0I
        7vNFVxvusEbX2gG+4uEG1jew7eeOT2vS15e5J1NmLZqf0Jlx8vW8d3vTgBbxxKVmlQ+D4G
        xKuJOeiTli4B+dhWTi6aMtsKAXXnDf9dRwD/s5VZFmCI+hALHQDXJfnc0krXbAav9lrNak
        VobZuvvvePGMueRiycbp2Oq0ZXrmS6FfSCBJuGu6Oy4WGTPYyCWT3xa4o5fDeQ==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id nWv_Bsve4R4C; Thu, 25 Jun 2020 09:34:58 +0200 (CEST)
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200623060526.29922-1-mans0n@gorani.run>
 <CAHp75VfMQh3KW276uAwBV-nOVTnLaAspGijPHyZjuHzm4XLPag@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <7965f173-2668-b122-1ba8-9fbf7d169e33@gorani.run>
Date:   Thu, 25 Jun 2020 16:34:52 +0900
MIME-Version: 1.0
In-Reply-To: <CAHp75VfMQh3KW276uAwBV-nOVTnLaAspGijPHyZjuHzm4XLPag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -2.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: E2DD71811
X-Rspamd-UID: 6fbf59
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-06-24 22:01, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 9:06 AM Sungbo Eo <mans0n@gorani.run> wrote:
>>
>> This patch adds support for the PCA9570 I2C GPO expander.
> 
>> Tested in kernel 5.4 on an ipq40xx platform.
>>
>> This is my first time submitting a whole driver patch, and I'm not really familiar with this PCA expander series.
>> Please let me know how I can improve this patch further. (Do I also need to document the DT compatible string?)
>>
>> FYI there's an unmerged patch for this chip.
>> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
>> I don't have PCA9571 either so I didn't add support for it.
> 
> My very first questions to such (simple) driver submissions is: Have
> you conducted research of existing drivers and found that none is
> suitable for this chip?
> Do this and answer in a commit message, if it will be still valid.
> 

I've done a more extensive research for i2c expanders and found out that 
gw-pld, max732x, pcf857x also use i2c_smbus_write_byte() without reg 
address. But their architectures are more complex than pca9570 and I'm 
not sure if I can make them compatible with pca9570. (I still don't 
understand what "quasi-bidirectional" in pcf857x means...)
