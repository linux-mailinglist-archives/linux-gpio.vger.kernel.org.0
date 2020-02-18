Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36D9F1623DE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgBRJut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:50:49 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:32884 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgBRJus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:50:48 -0500
Received: by mail-qv1-f66.google.com with SMTP id z3so8881374qvn.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CMpbsuUrAguPuwyvtKyydMgGKcHAmQpZ4ST+OIxCEvo=;
        b=UcxFtM3QvoELxSrxXjAyIIXy3ToxtOp8v/RoUtffuAnl+jI58nEFBR1JfxJY6YtEQw
         9bYRta+CO8LsBnfm/X4eLsihAf5TgEDgmxF4Bs5PE4fRh4/h//8ujYNZxkb/Mm4Sb7mE
         Pi7Xvy5MjSfNG4TV0lpR+UxwArd/G1fzDVmtqd2vyDsNRPzBqc+NURhylRKULiboYYvF
         lWHTHJZVF4CySygCylj+JeRXkC95mF3hk5uK4Bh2fLxSKi46PMaN+rFyPssMcSzFT3FE
         1912mA/8K9fr3BZd/ovrfL67iBHvZ7vBCRcoTsF0XuWtmLafy8R1n5hjtG95q+ZSPHd+
         EiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CMpbsuUrAguPuwyvtKyydMgGKcHAmQpZ4ST+OIxCEvo=;
        b=sJs23QJXnWrf4sMQfNm3gvVQxg5TllZhMgNpL8qwSTKNf/N/ycPxb1iR1hqV3ShdVg
         UkdXev67UCbp2bKRP4qSgAZKsMYFMCFf3A3fWlmZRPa8v1BiS+GFaJIRjswGZQ83aaAG
         mgDq5AvPYm/S1RGY9g9hKMSmRDboDbe0ldmuwrwIrPM0WVKbyobJQyZ1kSLPkyNCchRX
         cYyBYtZzGZZliWIRLQaZ3KsJ6maIbdzIzTAu7xf6gcP0KpJx/DY/JP7xBy1tL4Wr4isk
         tjf1HO5+GSXfsQE1BmU6u3S8xJBuHYOmOCQAZI1s2VTvLDQuybmZvFriDDM7/e83SDWH
         tsmw==
X-Gm-Message-State: APjAAAVe22B3DKiqZ5seLgIIrfGJ2YKkmrtjLm3iQ7FYZ3poR1nE+3JS
        OUmf8HKTBW0yAhUyuCW0dVE/wil0XopCczt1QMj52Q==
X-Google-Smtp-Source: APXvYqzay4vxReDT+unINvbnfD9zstcDUK4FIQOUDAgcsMRXsQNMHebbaD1kPFF714OvcWTxxfS3Pe6fQRaEZjqn1fc=
X-Received: by 2002:a0c:f28f:: with SMTP id k15mr15645199qvl.76.1582019446430;
 Tue, 18 Feb 2020 01:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20200218094234.23896-1-brgl@bgdev.pl> <20200218094234.23896-3-brgl@bgdev.pl>
 <9519ba1b-17fe-7121-ce00-d940b3de2777@linaro.org>
In-Reply-To: <9519ba1b-17fe-7121-ce00-d940b3de2777@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Feb 2020 10:50:35 +0100
Message-ID: <CAMpxmJX5mo239fe3Y6a7uaLFpWSAbLg5mUpCw-idJuBjYxOdYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] nvmem: fix another memory leak in error path
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Stable # 4 . 20+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 18 lut 2020 o 10:47 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 18/02/2020 09:42, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The nvmem struct is only freed on the first error check after its
> > allocation and leaked after that. Fix it with a new label.
> >
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> looks like 1/7 introduced the bug and 2/7 fixes it.
> IMO, you should 1/7 and 2/7 should be single patch.
>

The bug already exists in mainline - the nvmem object is only freed if
ida_simple_get() fails, but any subsequent error leads to a memory
leak. In other words: it doesn't matter if it's a single patch or two.

Bart
