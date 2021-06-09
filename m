Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3A93A113A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 12:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238952AbhFIKgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 06:36:45 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:38484 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbhFIKgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 06:36:44 -0400
Received: by mail-pf1-f177.google.com with SMTP id z26so18054412pfj.5;
        Wed, 09 Jun 2021 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ev80YovBIlVWJS+RO/GBMGe2qi6AXe4JDQTN0MTh/0s=;
        b=ogMvtAiF2JN+J354MPhiU5ntuKvaaRKNGWU/zUwHi5cXq7oDw9wGilxl6eWpIWVqY/
         KKlhvUSu5YWhOeJ6FRwV6Ff7Kv3bZSbGnZbU2KGi4qP75C2HceFUGje8PxfLc5mYzBO/
         0oh2BFw4/moMx7SwPpyzYfCxlASNmcCfrQlbKny0SUd89jUnVN4rnCvVHnAn9T8LBRRP
         SW7Yv/QOae9iD4srOziTrs+ufRlzlM8a8RJcS7cmgPrB8ctjRMtM5uQhNtyGKXVWOBEB
         WzGmQb1G3mnYByDypKEINWNE9qGsWQDDjACPjcwwzRt3oWlgRbDopXLmOX+wBJbHpfcw
         C/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ev80YovBIlVWJS+RO/GBMGe2qi6AXe4JDQTN0MTh/0s=;
        b=KDN9WF2CA7SMksJ/HsboFpAhuNohYenEoLzJqzayRpjQbIqEYAZfPo7aVTfIG6Vow/
         l7XmE1hgz6gKVtdkM8rDRPWuWc3+l7yLlKTFhgV+RMnsS4/xzn4ioNBwOs7+QAnaKPjl
         SssIx16NNUamTtC+wWxnoaDRHGBFRkVmnv7XdPh8r5xOeeoeELzSdAy73HFo7srTsf3Q
         pJK77V7ZXtpitZ2gIFd5qNEidtvcYNEOM2rDVohITKE4qgPFdmhVmDmXnVMAbW3XooYC
         QDO9se5coOkRppGH0LI0eub0l014+SEA3E3rAh074U0ml6+y1R7WLDCeX8/2y+x5LL6S
         tD6A==
X-Gm-Message-State: AOAM531KZngdshwmDsszY8JllmmshXuRsxMTyrw8JoDihCTPQoS6as/N
        3fAFEZHY+Tyr71bci5Y+vuk1DopBeuZZ9CDCZaH9r5p/jM03aw==
X-Google-Smtp-Source: ABdhPJyj9aW6PgG4Tk5hHIOg59I8yrocu9mtuS0J0yNiQoA5ZN9QmaO2LfQV2tteumt0RurKJ3zJOuvRMjHGbk7aQ9Y=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr4619952pfh.73.1623234830296; Wed, 09
 Jun 2021 03:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210609062722.9132-1-henning.schild@siemens.com> <YMCT+izizEg0gPLD@lahna.fi.intel.com>
In-Reply-To: <YMCT+izizEg0gPLD@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Jun 2021 13:33:34 +0300
Message-ID: <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 9, 2021 at 1:12 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Jun 09, 2021 at 08:27:22AM +0200, Henning Schild wrote:
> > match could be NULL in which case we do not go ACPI after all

...

> >       adev = ACPI_COMPANION(&pdev->dev);
> > -     if (adev) {
> > -             const void *match = device_get_match_data(&pdev->dev);
> > -
> > +     match = device_get_match_data(&pdev->dev);
>
> Actually we don't even call intel_pinctrl_get_soc_data() if the ACPI ID
> is not listed in the corresponding driver's module table. So I don't
> think match can ever be NULL.
>
> But feel free to prove me wrong ;-)

It's possible to have bugs in this driver, but can we see the real case here?

-- 
With Best Regards,
Andy Shevchenko
