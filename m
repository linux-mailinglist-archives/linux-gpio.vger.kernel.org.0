Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD59D91BA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388821AbfJPM6q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:58:46 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44055 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388787AbfJPM6q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:58:46 -0400
Received: by mail-qt1-f195.google.com with SMTP id u40so35860811qth.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmA+aKQ+Mz4roVfarz1mhTEhPUBs6dUMbgV2hRJ9D+I=;
        b=idlvvJzj03O9Dhoii0QwehDgHJo0nSR3M2StWcQWMCo6vOqUSBMbRfpy+pg0hIqH6X
         PYeUVVfauNdBBUdYTwdnHR/OLPE1V+z99iR8UGdRjikl6zsVv+aH5/nZ7e6WUHzE7QSY
         i6HC0o6rJtvBwysJxo38EdMH1kwvt/BsdjGe8dmXgh+IkDOHFPQqnOxs/d2yFjlAZr3b
         EEnDvovROM/5da5tXjvbxBkafdAAICCoWhxgy0D1vgJ/ojcxEFc/ky/eZozyVfMh0DM8
         4FztcTZ9UIWTart0EL9P7qG280dGOH7mhl3+7N0P7j+w5zNnauJ1ViKgBVgesEwyvDaS
         pKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmA+aKQ+Mz4roVfarz1mhTEhPUBs6dUMbgV2hRJ9D+I=;
        b=Lw9fcUKEnHLEKb2RcP70PTn3hv1Ke3OVh7sapkbwPUal7s5r25c0Wf6WfoLPtFeFj5
         rrE+98ouXjdiCVtqH29NsmHDiy9kPk/bh109zcMbL2Q3JcB+cuBXNKxWRrHvT+Pyg4xP
         P0nkqJgz71+pJ43IHkbODNR0NaNlV4Sm5dpt+Zl9wl/a3FRdQC7IuCcz6Fo+oZFA2X4R
         O59kh3w3PBxLfM5ChYPwqcdJKKKHdpqD1NruTFjcmOiusPgeuAufvmWvd+6eJ2kwLLa0
         kw4fR+jo/sN075q2oqQ9rXw9apHK5Crklbu3kGTK0+HOYCsrKfgz5qIvMxzScIPcnVv3
         M/HQ==
X-Gm-Message-State: APjAAAXIra0lt1SlKNsYRA+A8a2Y/zVd/1UFONtvesOD4e7vT2CTSdqt
        gnikPZ4QEbXf0L0n3c4EFFReakAwLfAHrtAsmcLEIg==
X-Google-Smtp-Source: APXvYqzzAj4RRoyWWdn356bmclofAMv7LyLqwE4YshT93mqUtpQ1x6mGLzCX0QswCj37V36hjSDWEY2bBLupcVUzPM0=
X-Received: by 2002:a0c:d6c3:: with SMTP id l3mr42024556qvi.201.1571230725676;
 Wed, 16 Oct 2019 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191014095104.77689-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191014095104.77689-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:58:34 +0200
Message-ID: <CACRpkdYK9L6n2CTz+aAoOhTRSboQvq+QTfmkC1-w-6RkOkr=+Q@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Avoid potential glitches if pin is in
 GPIO mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Fei Yang <fei.yang@intel.com>,
        Oliver Barta <oliver.barta@aptiv.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 11:51 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When consumer requests a pin, in order to be on the safest side,
> we switch it first to GPIO mode followed by immediate transition
> to the input state. Due to posted writes it's luckily to be a single
> I/O transaction.
>
> However, if firmware or boot loader already configures the pin
> to the GPIO mode, user expects no glitches for the requested pin.
> We may check if the pin is pre-configured and leave it as is
> till the actual consumer toggles its state to avoid glitches.
>
> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Depends-on: f5a26acf0162 ("pinctrl: intel: Initialize GPIO properly when used through irqchip")
> Cc: fei.yang@intel.com
> Reported-by: Oliver Barta <oliver.barta@aptiv.com>
> Reported-by: Malin Jonsson <malin.jonsson@ericsson.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

You surely know this best, should it also be tagged for stable?

Yours,
Linus Walleij
