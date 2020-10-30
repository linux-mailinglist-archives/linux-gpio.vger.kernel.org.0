Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9122A079F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3OQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgJ3OQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:16:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AF3C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:16:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b1so8035207lfp.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kTozaU2cyItVfE2OrUHpsMqlZy7i6JohBGwASN4mIwU=;
        b=Aul6Alo+Oh0vVuULTHt/zOB7D41KKyVBvls+SEJFRTyRjDCrfuOFjjDVgl7PXDDYom
         p1zA4X/cBhVc23n/DCqM0PKz3XDO3Ttm1HrqsBki6Vc+qoFUowgvxiVrhYjJimm9rAur
         7gzPm+nw/W1jk88eu0oWhM8ufMXqr00nRPV8FkVDo0m1pAtHS2vM1v1UZHwnANjZ/anq
         tnwT9Ssrek16CK5BW+WCwWZ1GYpxtrHV3Xp3iEGA1BxdbSMTv/RByhDs0i5rIC5dYilp
         G+5UfYIxH5x/VLcWvzNNCC4/gaN/UXU9DLxLfUwOHteH+c4S5siotfPj9zg2B1d0V/sC
         pixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kTozaU2cyItVfE2OrUHpsMqlZy7i6JohBGwASN4mIwU=;
        b=iG1iVra5CpKLFrPYyjwUn1rduncyXSNhHv22Qtb1YGCIgfqgx+vIFnXOwnJ3w43aeC
         5vXTCnwa9YR2ZmHllVyIli57FB4X/btYjV6S83RcEKctgQtwmp6zm8R3JB0BNafNagVa
         NRbVxK+Eck9jMFYL10nvumQ5PQzCOnHxCZaiyXYOzEuem2k2hZgnJT/pqRYHFV1IGcJv
         F1UKdi4w8yNKFOMZjAIppQZ4Ht0Ma5WhYHrSFUNsWCD4D9nBIjLFtaIy6YIKOKSoVwZF
         kUmkQOl78/CyazAqCDHF65SbB087uJKSNgNAecqaOcTj0sY9hWA4Y5XOLkY3sL1XC6IC
         tflA==
X-Gm-Message-State: AOAM531OsS8l9oX8g9/SyABo1GrVvZ2RJW6WQ1qgCX45gFjXLbdf/YDT
        YyFLmcJjxT6DNjj4D43OlUxPyXbqb2hIRklnwBk=
X-Google-Smtp-Source: ABdhPJzFjffyzyq0QAqHY58JLCqugXtEEERlpm9t8z74D6nnXXPLXVrYTmhGMU4ediok6mszWz43gX5zFfo4/iMTr6U=
X-Received: by 2002:a19:41d7:: with SMTP id o206mr1123563lfa.396.1604067378353;
 Fri, 30 Oct 2020 07:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com> <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
In-Reply-To: <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Fri, 30 Oct 2020 23:16:06 +0900
Message-ID: <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi! Sorry for the delayed reply.

On Thu, Oct 29, 2020 at 10:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Oct 28, 2020 at 9:29 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > The section titled "Interacting With the Legacy GPIO Subsystem"
> > describes as far as I got it the interaction of gpio_to_desc() and
> > desc_to_gpio() with new / legacy APIs along with their scope. But is
> > that description correct after the above mentioned commit, i.e.
> > 14e85c0e69d5 ("gpio: remove gpio_descs global array") when we lose the
> > always-present data structure (if I'm not mistaken)?
>
> Yes I think it needs to be updated...

Although there is no global array anymore, gpio_to_desc() should still
perform as expected after 14e85c0e69d5 ("gpio: remove gpio_descs
global array"), since it parses all the registered gpio chips and
looks for the one which range includes the requested number.

desc_to_gpio() is a bit simpler, as it simply returns the GPIO number
corresponding to a valid descriptor. The descriptor must remain
acquired as long as the GPIO is in use through its number. I think the
misleading sentence is

"The GPIO number returned by desc_to_gpio() can be safely used as long
as the GPIO descriptor has not been freed."

This has been written a long time ago, so maybe I am mistaken, but I
suspect the intent was to say something along the lines of "... as the
GPIO descriptor has not been *released* (using gpiod_put()).

For gpio_to_desc(), the intent of "a GPIO number passed to
gpio_to_desc() must have been properly acquired", is to say "...
properly acquired using gpio_request()".

As for "and usage of the returned GPIO descriptor is only possible
after the GPIO number has been released", I am a bit puzzled. My
understanding is that the descriptor is only guaranteed to be valid
between calls to gpio_request() and gpio_free(), so that's probably a
mistake here?
