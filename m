Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A765AD3A9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbiIENRG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236307AbiIENRF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:17:05 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510D931EF0
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:17:04 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id o13so597124qvw.12
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NlE6AanfqGfcKbgEmtLqkGJmZOunkjR9Q3eahuiuxMU=;
        b=D0W69AKc7L/tUbEQRd7/BKzzp95z9zlLiyFLZ6F9vdcnNlXP3KyIvMngklvB1PqnuC
         AZdt5Bq/IEHGknkg7QKKDzoCMq3RMC3vfmYKM04RCe1LQNiSTGsL0p6c9ZeYpGcQUiuD
         5kEYePWjwQFByT1LHBAW+UsSGgO5p4ZqCzyU9aS5/gd68445oQS0b27Fjb8DLohU9b1n
         yNwV6xx6nRxP9Z+8E//Z/a8DcllkVWHbf/MZGvOCUP6HUy+xmR9r/dmen7qP9D+74xTs
         IJuR278X2Q8L047d9KZXj57JTOUuGm6zow1O4roIHPN+Rc9xRrDXk+mxqRMJMRqVe4JQ
         4YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NlE6AanfqGfcKbgEmtLqkGJmZOunkjR9Q3eahuiuxMU=;
        b=3ZVTLszh/937ZHRfb5L0du1B/ztKS9nDHHwTGzMPCjvsqwwRmBJqhLKwbloi7hpTX/
         nEhkGrFNZAmVbb21+iIeeL2hRc4bmM6DBm2Q2bRMI+OL92vWA0pYg1n+XfY9Zv6tvGOD
         3c2TXKmEhwIHFFYFqIAcHyoEHS+eze21po2tvYdnIFlXod1rP0c4FszTXeSgab8sYCYw
         nWEe7NGm7ynxgAiJoK+pSTCmSPVje3vEpMTwVM+Jk8RlNiELdBhfYnMJhVxnZAgv2JQ4
         HBnIFC+8gUAfudV56/n5C1mATeu1jTvUQA0SseiaqUf8lJf604Az03ZrJ1Uu9DSdZzvF
         pABQ==
X-Gm-Message-State: ACgBeo2oue9XQVEwfLruZ27qJPiaaAP4pbXpq6z5IJU7gkbM0XgMOaHn
        hfXXkzu2nbTmJQp851pPon4wz7CgnZyw+nj2/Hk=
X-Google-Smtp-Source: AA6agR4Pvtm8q8Fc626MULHCblOFgk4eor+fMFKPZ1Z6Wp0NfiQ/zw5cAa4H1Nx5ANEpVJQ/p7eC+TRMpTmqn8T+/H4=
X-Received: by 2002:a0c:e24b:0:b0:4a1:d41b:e280 with SMTP id
 x11-20020a0ce24b000000b004a1d41be280mr5955701qvl.11.1662383823460; Mon, 05
 Sep 2022 06:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
In-Reply-To: <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 16:16:27 +0300
Message-ID: <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:

...

> Let me say again: I am not changing this. That's for Asahi people to
> do if they wish. I am the just middle-man here.

While I agree on technical aspects, this mythical "they" is
frustrating me. They haven't participated in this discussion (yet?) so
they do not care, why should we (as a community of upstream)?

P.S. Do you have a platform to test all these?

-- 
With Best Regards,
Andy Shevchenko
