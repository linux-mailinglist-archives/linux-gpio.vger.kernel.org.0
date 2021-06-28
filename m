Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475633B5D6B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 13:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhF1L4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 07:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbhF1L4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 07:56:45 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C753DC061574
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 04:54:18 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id u190so15277652pgd.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDHL7atvwrkjqitTJnhJQpUCmhXV1vAgxYQQV4DzVrE=;
        b=fNovtvzDdkNEDxV6/vZdRWRvhuzWFT/8JuPEpDhu7BCYZPHxrNCp5TVi8Tt/34M4VU
         +XznUMVjyEX1WaKmMaNdQ59KXvFXE0vuzzzYRvFc2a5W3var3gEmDl6Y/t8M1NV9N3d9
         ddQlGWx1+vClRJZwIN8CDapT9z6QkFeSFvx9yWN5jlw6LcVgG1jPOeBdf81/YCiFGt0F
         vGbwfFV7SJfKSpJZNVQAYp9K9+1zYH/ZFItTVPEjzTlGg6ZuJHuNFno6DUhEueRItZvW
         5O7TQrY7DBvEOnO3UVO3P4pXvoqsdvH9OKs2I54o5/Uo9iAn41AfYZ6ASoQHZwkBGtTj
         0xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDHL7atvwrkjqitTJnhJQpUCmhXV1vAgxYQQV4DzVrE=;
        b=LrssPOrQFYEG+xCy1//niZslB3y5z7/OWSqtbwF6wwjHtW7/xqK+oR3b4oCXdxcEdF
         6bMpDgTN0Y1kROpY8DDdjcaRadXKfKT1Pwuv6yC+OY7rjc5jDoKIEKxEVKlHsdUkxppq
         ATHlADQE3BAvubBHBv6I43KQhNErG+FE+2DE3GWyKAPE4pCU7KVokdMZII8oChZHIbVX
         gWDlJjRJtqdnDpGB8ZrYZq+5vFje0HLOEyAKAQI9IKPEwgR2hwIUPtAca1DMqNyw8N3O
         kPkUbqP/Cpz+lvd5dvCQCRX81GKcqFmJLFhdmOl5M9zw0Cu4aP7LncOVsynAWmksHPAE
         A9WQ==
X-Gm-Message-State: AOAM531iyVGqY9WPOtdRUHFONAWHbM4dE3hGUke7WRWFhyVEsPymcSyy
        EVRg2ALq8KL/FrRHCFY6QHemyra3cLykFApTtVFf+b2RJYY=
X-Google-Smtp-Source: ABdhPJxae5agVG0byrtWt9Mmed2E4LyynS1MYVqz4WZTyQG1i34ssyCVn4rU5sg3neJYq2JQVb2yPquBzfeKA4I23j0=
X-Received: by 2002:aa7:8055:0:b029:303:36a6:fec7 with SMTP id
 y21-20020aa780550000b029030336a6fec7mr24896741pfm.40.1624881258197; Mon, 28
 Jun 2021 04:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210621191830.10628-1-brgl@bgdev.pl> <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol> <YNmyvYDZwNeYRyTU@smile.fi.intel.com> <20210628113413.GA20057@sol>
In-Reply-To: <20210628113413.GA20057@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Jun 2021 14:53:40 +0300
Message-ID: <CAHp75Vd+5wVa6-B+5kj-0N-wyxr8iT_tSs-A36Pn30p3Z=THQQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 2:35 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Jun 28, 2021 at 02:30:05PM +0300, Andy Shevchenko wrote:
> > On Sun, Jun 27, 2021 at 04:47:57PM +0800, Kent Gibson wrote:

...

> > Kent, do I understand correctly that Go bindings use C library?
>
> No, the Go library is pure Go - it makes the ioctl calls itself.

Hmm... Interesting. Why is it so? Performance wise? Other points?

(It means you are basically replicating what libgpiod does, right?)


-- 
With Best Regards,
Andy Shevchenko
