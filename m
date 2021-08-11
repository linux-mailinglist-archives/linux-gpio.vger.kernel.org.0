Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8251C3E91BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhHKMlZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhHKMlZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:41:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91B3C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:41:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g30so5429727lfv.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sVEJCnI/+j28u/yya/sb9JoujCNOibmrs6FLKDvPdSM=;
        b=BJ6tQSXnTFlKSNIJGIoltg69Zs/3IcQRIpOvR0zQ+ET12mqlsONIm0ek1cOLASysVM
         1167rK3gUfIn0u7xVBdGwXircRtuuqmcOaIqaUiqaKEJtKLBR3m6CBqmQznvPfLUkDzZ
         MhDO1L/9YmRMWMzps6OIfnJ3kifoHjRGZ3gqZojWsGSTsS7Bms+PCzIqc53mZoNdqEK7
         UmGZsg6JEFCvczUuYAnABJHd/DxRxEQue5v9dDgH/L0xH5qj5frWXOHc88x09zrt4uWF
         eF83XhOcAvqQs+W2KDo/HvomIQHggkbtLKG75uZySrJT0Pvh6moYw/+wbg4IVKHaGS0W
         gAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sVEJCnI/+j28u/yya/sb9JoujCNOibmrs6FLKDvPdSM=;
        b=X/4nuUIFktkI6/nWwefLWv3g4RiE5qyiDC6LlD+TlcanlyDtPjJUYvRraCaKGgLZac
         W/RNzu+FOQsmWGduvgUef8fw4pF8cHdWKZmC83NEEG+z7GPpIERhvbSit0LrQzc5GkjD
         IlIHSX84i9YcdNy6qnWqsjXq7+piu0hgE9I0nXYx2nNJhiCuR2+Z+m2pVQBVUJSilgww
         3pnom0uF0ubRTRX+YVbN4RV9/vlMLrRlqPbfUzBB9OXUhb+kjN5468WpiqVLEkzHGfUD
         Hw3nLGppGYunvNKPY/l4BM6jz39gfXFaDPH9YB2Da0asGepxtqVgIP3wXBFJPmG+BEKy
         tU3A==
X-Gm-Message-State: AOAM5328JoaRJecIlgqyBgqa+XarFKGjx6eutfPj4Pzg5NFpMftVI7/I
        y8QXlMnnCsisjwvUKH7u+LCnxduHNSQbKIGo1/Vm4Q==
X-Google-Smtp-Source: ABdhPJxSCJ+yI29pfgowRW50YlvCiE0YBbuZh0GpYHOyKZvQSwWzV7Ob4c6QrJa9RUbIVKVEX+ioY2X+Yn67VegXHf0=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr25025885lff.465.1628685660264;
 Wed, 11 Aug 2021 05:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
 <20210802135839.4clqd34npppwasyh@mobilestation> <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
 <20210804124433.crh7w6jzfjcswubo@mobilestation> <YQqnrHAuSneeEFgO@smile.fi.intel.com>
In-Reply-To: <YQqnrHAuSneeEFgO@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:40:49 +0200
Message-ID: <CACRpkdYJyVUix6MSLQvF1Ok21gHdk6d8ToGpP_rh5v6Rpwyn5g@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 4, 2021 at 4:44 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 04, 2021 at 03:44:33PM +0300, Serge Semin wrote:
> > Thus, yes, I think we need to make sure here that the property
> > is only used in framework of the kernel and isn't passed via
> > inappropriate paths like DT/ACPI fw so not to get into the
> > maintainability troubles in future.
>
> Got it. I'll add the additional check in next version.

This seems reasonable for me, if you can get this done with
some kind of elegance.

Maybe use the "linux,gpio-base" property as mentioned so it is
clear that this is a Linux-internal thing only.

Yours,
Linus Walleij
