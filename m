Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0A15C8705
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfJBLKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 07:10:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33868 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfJBLKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 07:10:53 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19so16707618lja.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwI8NApt5Ezi/UOFwN4vepl5V2JxgALUwiv2PyNJ1Dk=;
        b=t/dWnBYZCjYS1uXNdlZktt16ajOwPdVZkvUhV83hOauAwIOhkzA2rlgxijbDZ9gTv/
         JOpZpcnLw5NqtzxxGrBcPkS4YHL80CVjjyGFS87q3o3UZpOyN6g4p3odgDYQhigp4ZWe
         6iVC6Psz4DDqcLAs9PrP791lTNlyA+DyvTph0JBEDhKQAJ2d6mwSjOLdeu1zB93VFAEs
         mQ0nIGYOWJV0mOdk0LQQx4oSXMFNFIijZ99+dFE242NtTGfY3B7MnJ/z5Mpgfgx2kHLR
         FnL/9DG3sQkTnDcJPPMpxjIpcfWWYj5f+NGf9EPakhd4jWeZpAzlBmlpVnCRLDzedpxy
         Xi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwI8NApt5Ezi/UOFwN4vepl5V2JxgALUwiv2PyNJ1Dk=;
        b=PWTsAkwv/RH2QryhkWZmkG6mXiTf5V5UxGceJIgGb2UoTH8CX2zmbumM9EVTpG8ue8
         1GUWmbEbqArL0YfjCEfrYLYU7CCZzuMw0XVfjGTXucpy4+Eq+zGwcZDlKGzEq3zjxvpz
         9SxrpXkGea25I5A3CxrJgAwP8Z4uGNKW9B1jxXBiQfA7AoqaYl8RRR90urtNwLu/6SGP
         rW4DMvfzGvKKPKJkvfldFHBC0UwMPRYOTSXymMA6xb7XqH4h9nyxwprT8m8X/qtWOb43
         CtQI3z149sLJe8MaVkM/pdrrWFaHnMjkeLSuT9GGlXsvAW1ra9jfbP0rx+lPL9Kb7agH
         DCrQ==
X-Gm-Message-State: APjAAAUDCJOqQwz3flFeWvbrUEMm7RyQZ4lz7VLhhEx/QZXgEYXiA/Ob
        TtsNvZiApFi4/Z9m9K1OHyVppEKbB1hvPj8v8TYsO32FwqU=
X-Google-Smtp-Source: APXvYqwkxOykoE4IohBVAmNhI2imnKOCl1cqKLzNy3zuEP5/JbRKIxNjiaKVZ47jnp4fFYE29J/Ijkdl/JXt8ZoYAp4=
X-Received: by 2002:a2e:412:: with SMTP id 18mr2093014lje.96.1570014650827;
 Wed, 02 Oct 2019 04:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
In-Reply-To: <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Wed, 2 Oct 2019 13:10:39 +0200
Message-ID: <CAEf4M_AaSRppq06G4yfQ=+=8JzqPRq1+D+Sp=o+16+VKVdOY=Q@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 10:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> I remember discussing it with Linus some time ago. This may not be as
> straightforward as simply adding new flags. Since PULL-UP/DOWN
> resistors can - among other parameters - also have configurable
> resistance, we'll probably need some kind of a structure for this
> ioctl() to pass any additional information to the kernel. Since we
> can't change ABI this may require adding a whole new ioctl() for
> extended configuration. This in turn has to be as future-proof as
> possible - if someone asks for user-space-configurable drive-strength,
> the new ioctl() should be ready for it.

Thanks for the insight, Bartosz.  Would you be able to point me to the
discussion if is available in an archive?  I would like to improve my
understanding.

What do you think of adding pull-up/down flags first, and then
implementing the extended configuration ioctl() later if necessary?

Thank you,
Drew
