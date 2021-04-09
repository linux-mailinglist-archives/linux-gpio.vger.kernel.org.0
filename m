Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74003596F0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 09:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhDIH4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 03:56:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232060AbhDIH4X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 03:56:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A500D611BE;
        Fri,  9 Apr 2021 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617954970;
        bh=g5uN6Pl+84n19Wf10nEdkopoOYV20QI0EjR4ZGbc7jw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u2BbVFCGWc0iS4ph2dc5d1nDl187zG5P9pXL1Cm6UOvWXL3L0dBEsKrg9/h1POc19
         h1WrlG2N5RR70AfSyZdWdMlRfjSGxKElfDb2SekhNnbfeKF4rnj6bxkOif0Ar50QQN
         L8FOwMyG1mXV7kTv/r2whQZMJUOhdTOYVDxPMGm6ArRqHL3EPwgc0LK+44RK7rTaEo
         QtrxjBMbCvXDQloY7nyKYEsuVDzznNlhD0KJKBz6g7AEXPQ+O+gkf4K5ostmrJzQXT
         Ao9W8Dtp2lp0FyPZk/qIJzxaOuEHjUxNrPcTk6TwRCsXKnPbtf7wW4aI220hiiVUBS
         iOtE6CzaWBe6Q==
Received: by mail-ot1-f43.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so4871507otr.9;
        Fri, 09 Apr 2021 00:56:10 -0700 (PDT)
X-Gm-Message-State: AOAM533wqrDde4EzYCMRg7e5KTjTRx1/w++3Ha+pEjFrIcSEOZ1h+CHZ
        lnaaGkQHSE4W/ziTuOS2o46325t3o/c07NGzehg=
X-Google-Smtp-Source: ABdhPJyqkLL/YHm17TDMQcZw+JH1/6IOKmDcxX4k29Ovd57mDpReYbYM6BJUI+r5hcy0H4zXnuBQh0qM5jt0HH/0Mc4=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr11539093otq.251.1617954970003;
 Fri, 09 Apr 2021 00:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-16-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-16-andrew@aj.id.au>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 9 Apr 2021 09:55:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
Message-ID: <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] ipmi: kcs_bmc: Add a "raw" character device interface
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        DTML <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, chiawei_wang@aspeedtech.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> However, KCS devices are useful beyond IPMI (or keyboards), as they
> provide a means to generate IRQs and exchange arbitrary data between a
> BMC and its host system.

I only noticed the series after Joel asked about the DT changes on the arm
side. One question though:

How does this related to the drivers/input/serio/ framework that also talks
to the keyboard controller for things that are not keyboards? Are these
separate communication channels on adjacent I/O ports, or does there
need to be some arbitration?

       Arnd
