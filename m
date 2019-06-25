Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5102552412
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 09:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfFYHKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 03:10:37 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36879 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfFYHKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 03:10:37 -0400
Received: by mail-io1-f67.google.com with SMTP id e5so1460128iok.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=de69OCjWLEoJOVupj+z2Vrj9cMrX8EO/TnQ/3IPkUjg=;
        b=rUbw2h7m31+afZF5Hr38OLSiDf3+gH/T9QJYuR6ow/SKpzay6u1adULGW2w8WI8swO
         6TmWtb1H2tnA2eRTp1XhJ6xFuV4KKqYxxLZpwjhmbpDtKoazMS1JkdiWshJKB9fi9y1C
         1jqjTA8vWAYQ0NXea3jrS/F0o9/oU5bt/JIJ9e4QCjjXBLjnQMqG/VhToI+VHR+Hww/F
         dh6G+zJ0dDyqFCGAEVZzU2trUTWDnuygPYSNubyDA4UaCzt64ekqZtQRAN7b7kJwJvLR
         Q4nxcNbstX9ZKADAEFWAVYHsfTVuuk+cJyHNV0276iR6KFhboN5emsKeB/TC9ePB5QM/
         K3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=de69OCjWLEoJOVupj+z2Vrj9cMrX8EO/TnQ/3IPkUjg=;
        b=obDjvDAg1HtcCQdMgjYzdYwZzqvl6/brUV+rsVnxiQUso6xXxBfEWNEbYBBrlD1Yop
         DeTlksdoVk2zRgYRUFqEV1btXsVWeMhnu2I5tJUvZYeN+nyB1qOHutVv1V2SBF0q4SNR
         +vDDV9r7c+20a+fj8zHC0Md7IywKXYuMP0uYjC3/idn9W6QOLf6kBoi0nC+uJcT2W9zq
         rOswyqj86qVHcySSFQGmiqgzKO4d7K/N/hMpXMPSSfsxxagxFQabgGuqzp1a1+hfHs5c
         CU//+5FQlPONve+M7DJoY2gZ8hj/3K33kWwQMrLlhXLuej4SVdjxQrVQ3/ZU7H/6zdPF
         c/Vg==
X-Gm-Message-State: APjAAAXbu2m7zJb5VJiUzO9dM2DLHkdvdIai7gwqeumVe0Vd/TiFirWJ
        mBSAgHY69BGWOMwg0CQiQGK9atUSlgv05YuM/2Pe9XG5
X-Google-Smtp-Source: APXvYqwt9FUPbNuPIYl40S3Z6LGQFhKnprVrc15JCgOBrx5+zp4ftaGlrybHhDlwTUDwZpPQdqmFp5GLjNd6LUptR+I=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr2262547ioh.40.1561446636658;
 Tue, 25 Jun 2019 00:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190221162627.3476-1-brgl@bgdev.pl> <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net> <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
In-Reply-To: <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Jun 2019 09:10:25 +0200
Message-ID: <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 24 cze 2019 o 20:22 Enrico Weigelt, metux IT consult
<lkml@metux.net> napisa=C5=82(a):
>
> On 24.06.19 12:46, Bartosz Golaszewski wrote:
>
> >> The patch seems pretty trivial and doesn't change any actual code, so
> >> I don't see hard resons for rejecting it.
> >>
> >
> > In its current form it makes the code even less readable. The #ifdef
> > should actually be one line lower and touch the comment instead of the
> > EXPORT_SYMBOL() related to a different function.
>
> Okay, that missing newline should be fixed (as well as the extra one
> after the #ifdef). Besides that, I don't see any further problems.
>

Are we sure this even changes something? Does kernel documentation get
generated according to current config options? I really think this
patch just pollutes the history for now apparent reason.

Greg, could you give your opinion on this?

Bart
