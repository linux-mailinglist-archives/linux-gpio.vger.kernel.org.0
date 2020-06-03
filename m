Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC8F1ECF63
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 14:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgFCMFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 08:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgFCMFf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 08:05:35 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9685BC08C5C0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 05:05:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so2374835ljo.5
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9SpwZSDLLoRDpRZcnQb1YhQ1cJLsVFtPtxsWAHnQ96E=;
        b=KYrSN3XwqTd8l8UwldrI1/Xoa180XrwAEd3HoPYcGOcF1OtHgwG2KM8YX8FeCtaFTd
         8ahXFHa91KoxEyi8GVnbzui9KOKtt67Dd+G9SMTglFKY+VulzeK9LrvX84Qmiwm+6r3o
         f5aqKrGsMqkyUmAJbcGAdfmDqLHTnWoV5xHBn1H1EjoAvudRzRC2oNHxYS80aLQoHsv9
         R3Gm6SvV7oaf8dKPcTglPfcbwsSCDKve6gKmcClChHS9NfnT7eLmA3dM26zj1SdPSxcH
         iuZar9OURVCj6SxBcaSn3sFVNIqNgfoNBVw/y9xGwlXdLdZ/NedX5E90lhOKXB4bKeUh
         Jolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9SpwZSDLLoRDpRZcnQb1YhQ1cJLsVFtPtxsWAHnQ96E=;
        b=VWfo0KjfB4dyJyakbr+hfh8XWIp0vw1xTMXWEx0vRuXxHULTYESPw3vRYAH6a9dLPs
         btArzUpk+xvTk8m4hPcJujo0bxqHbW4JzsRzBwGyEZMsliRv8bv5glc7RkZWsTsMy0X1
         1yZDNDRwAuVaTbxdEbrOmmDrYmYdWth0B/CFH0muMNBqB8mAQxBm45j07H6MkFfLq0QO
         ywGpSFXDmHaWvYkdPXNp7RnX/IBHjF8vXclsULcBe/IflO5srzCmUK3Sr6nYAZfFO+wx
         n7mKTbKMHSqayLV0DvDt/7HHKC+AJNZDFFZlDdOPPsFH/zlPwWO+KtwcZ7oHh/n5fCIW
         PKZA==
X-Gm-Message-State: AOAM531hBxBI0a12Dc2sqBPyGU7UUUvJqN7bnPaPY1qlkjVCUAmLDBcn
        6AyIjGH6apfMl27pJ0IT54QwjnNiFdlIttnXxuEtshEH
X-Google-Smtp-Source: ABdhPJxDCM7eTXfshTCW0cR2ch2sO9/HZ5Y8fKiawF1it8noQiKNIEyjHGxZZjLrUdt6kJkQZ3iC2x8o4EwfT93tX/Y=
X-Received: by 2002:a2e:974a:: with SMTP id f10mr1978577ljj.283.1591185933049;
 Wed, 03 Jun 2020 05:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200520211916.25727-1-andriy.shevchenko@linux.intel.com>
 <20200520211916.25727-3-andriy.shevchenko@linux.intel.com>
 <20200525175819.GH1634618@smile.fi.intel.com> <CAMpxmJW71t5Vy6q+wdRO1dkmZbeDKZcP-_9W=CKXX69A866n8g@mail.gmail.com>
In-Reply-To: <CAMpxmJW71t5Vy6q+wdRO1dkmZbeDKZcP-_9W=CKXX69A866n8g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:05:22 +0200
Message-ID: <CACRpkdYZjmzEY04_qSZtAqU6od+kAr=_Sk+PMVFj2UOjXxNVFQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpio: pca953x: Drop unneeded ACPI_PTR()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 3:13 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 25 maj 2020 o 19:58 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> >
> > On Thu, May 21, 2020 at 12:19:14AM +0300, Andy Shevchenko wrote:
> > > ACPI_PTR() becomes a no-op when !CONFIG_ACPI. This is not needed sinc=
e
> > > we always have ID table enabled. Moreover, in the mentioned case comp=
iler
> > > will complain about defined but not used variable.
> >
> > Bart, are you going to apply this one, or should I resend it as a part =
of v2?
> >
>
> Ugh, I already sent my last PRs to Linus both for v5.7 fixes & v5.8
> updates. I'll let Linus pick it up once he pulls from my tree.

I cherry-picked this one (patch 3) on top of my devel branch.

Yours,
Linus Walleij
