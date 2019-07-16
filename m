Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B1E6B150
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 23:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbfGPVqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 17:46:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39989 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbfGPVqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 17:46:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id m8so21460790lji.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/RAqXRe608t4DMx9FGyKisTh63SKLqBM/Ij+WPbCgPM=;
        b=w8nkOPU+3uflSrcrXxVEWNs9uhGpDdd+Rzxjc1vZSogoQypeYtVZZXnBAYPYoeQwTk
         QXylYhCAuTzEveN/SdH0E3tjYsDhtyjvhezP1JjINApaDK6H0Yi17N6btnci60KnTRnv
         7RX4plxLZk2v0cncumOcFIrmpLUqJn+4F8v0K3eEGHefnLHMrFASyUd0UGVcTzNozd1a
         vcogndbzJPjwP1MTJvTWUTAO9gkwTq5N8Sr2X2Fi2XFAPKEg6agIcorsdZPHxNFgGWgf
         7HdIu/jAzowkZHNUKuzdFQlzwV3SabCls6H1gs85AuaxjcVSAOo1qHdsEH//0kKtxz1k
         8vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/RAqXRe608t4DMx9FGyKisTh63SKLqBM/Ij+WPbCgPM=;
        b=FLmMLC4cRuT01P3BGp8C6Dr+R2geiFe5B5hMAU1vZpvnqZu1FJFHBQLWIhDowFTdbY
         EhFSZKUYg1Y17YuR3hpFQdF5YqtyXC1iWxZOwG6Cyq/4YpXhw8SBr56GMahriW/uQinr
         UKSSj2SW4eoXqJrbLOp0oQ5RczUEM1qVD2knxk7aTmqvF/uTQN394CcK8N1tT2V2yOqJ
         vCOr9DjJSmi1Jw6v0ygPbkjpb+Uja6/TG+FxJvRxOqFjaWcWQuPKItZPp3ajHDaJ7f6X
         JoeAAcByiY9NDTDAltt4cOInbf1XNpSbhawKDz2KsmH7dnccSYsZSKzpZerJfGKkkN1q
         wLag==
X-Gm-Message-State: APjAAAUGkMVnCFzYWiFSS1U8Zyn5WTXHqf5vi/SnvzdNvSEM1mJH6owJ
        qSML/m6jwxF5slW7/F57npWrAivfO9ZjtP6pBlsEKA==
X-Google-Smtp-Source: APXvYqw1LRlGMkwD0Zj/mXq1MDJT8exL4YfTyq/7bILPPJJo6uRhVajc9X7deRiYqmtGZGr6TgE+sPe18oyUING8rnc=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr18018479ljg.62.1563313593593;
 Tue, 16 Jul 2019 14:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl> <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
 <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com>
In-Reply-To: <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jul 2019 23:46:22 +0200
Message-ID: <CACRpkdaiZgK1EoaUxDtbm_GJHVjZU56e_qBQ-OF0mmwb5W8+tg@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 9, 2019 at 4:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 9 lip 2019 o 15:30 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > I was thinking something like this in the stubs:
> >
> > gpiod_get[_index]() {
> >     return POISON;
> > }
> >
> > gpiod_get[_index]_optional() {
> >    return NULL;
> > }
>
> This is already being done.

Ah it is.

> > This way all gpiod_get() and optional calls are properly
> > handled and the semantic that only _optional calls
> > can return NULL is preserved. (Your patch would
> > violate this.)
> >
>
> Maybe I'm missing something, but I don't quite see how my patch
> violates this behavior. :(

I missed that we actually do pass a poison from the strict
*get functions, mea culpa.

Let's apply this, will you send me a pull request or shall I
just try to apply it?

Yours,
Linus Walleij
