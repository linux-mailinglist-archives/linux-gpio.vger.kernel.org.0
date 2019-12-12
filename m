Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A4711D044
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 15:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbfLLO4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 09:56:32 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46097 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfLLO4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 09:56:31 -0500
Received: by mail-vs1-f68.google.com with SMTP id t12so1719107vso.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 06:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OX4zk4wxYTktxsmTx0I1SgEecxCR7OBq76rwcWS2QcM=;
        b=H2tl9knlt3H8RgNGDBtl4J7XukIIgVP0iDZZLdpVUMwUSKgzdJG1Zz4EME71NkxtkX
         YQnCixPbi5kXFyUfqCAsAXfesEzvhYlD4JFEiFLK8tMMqdgYc6X9pLvup7iQ5I8vboK+
         HWqSdTnE712mmUu7DaEZcaG5t+8oDpHpdM2bla3yJaqZKzZKqfs8LzP9bR+JiwXBi5Me
         VXE6mzGfOEcn9/PBvhthyVj/LS0Fvqz9LNF79QXa07Tbv0xE9ns2FcaO/28LN4BRHaJw
         J45i78TCJzhKM+/CNKLjQrs1MI91VLYW1Rb5L49jSbZPWeW+We+4clJnZOdXXiZqISlu
         3xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OX4zk4wxYTktxsmTx0I1SgEecxCR7OBq76rwcWS2QcM=;
        b=EY+Sybx2UaTyzWTWyY25Sv6ym4CAmDW63M0vtmkj46x4ICNmU9sZA23Af74e2Xo9kq
         iJfxOHa5rtM4DVMfjouVqsB7zY+809/cTeQu8mRnySWjEKpPjBCzSUtMBGo4pBrKGArx
         mso9djxWmG7bSDonjMBJrew2UXwJE2jZI5wMT5tbNuCzdeD1axd15khdPUzTpaGiMh4/
         +P2NXqUoly/9Vf+2YdMRsOWN42bS4lKYAQKnJD6flplQOkmIgIB2T9DKR3kK6GubIb5U
         B0eS7uy49kR1f/Pfd/Tp85SC09lPQRQaxSvNc3uktk8qRg8+E/ynGyRC6RwR5+T/rX+h
         z1DQ==
X-Gm-Message-State: APjAAAX80wmV1alFKy0Bvy9sXLsh47eqafiMtq4jXjyeN7gjMl7LS9ew
        qWsRVVMYX4EznHxC/Xl/7cfAlT8bBHIkQgvjB1lJqw==
X-Google-Smtp-Source: APXvYqwfEZXZnabpRD+WvBNGhPlP1tTWmH1yYXCkCdRzn+3pp4QCG4wELwnFl0M3dm+IXwfFn2jInwxXQSj1giwhzEg=
X-Received: by 2002:a67:1447:: with SMTP id 68mr7148934vsu.115.1576162590859;
 Thu, 12 Dec 2019 06:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20191129165817.20426-1-m.felsch@pengutronix.de> <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
In-Reply-To: <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 15:56:18 +0100
Message-ID: <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 10:51 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> gentle ping.
(...)
> > Marco Felsch (3):
> >   dt-bindings: mfd: da9062: add gpio bindings
> >   mfd: da9062: add support for the DA9062 GPIOs in the core
> >   pinctrl: da9062: add driver support

I can merge this to the pinctrl subsystem but then I need
Lee's ACK on patches 1 & 2 as they are to the MFD subsystem
and I think he will want me to create an immutable branch too?

As Lee is not even on the To: line I think it is unlikely to happen,
so maybe repost, stating your request for his ACK?

Yours,
Linus Walleij
