Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44326283495
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 13:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgJELCo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 07:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgJELCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 07:02:44 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0939CC0613CE;
        Mon,  5 Oct 2020 04:02:44 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u24so5782033pgi.1;
        Mon, 05 Oct 2020 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XnKOT8lAtvoMmf2DZLmwJPy7BfQRPbNOPZaTV7Nokbs=;
        b=LgiWQ6WsTWHge0MQFvDxD5ngk7kRfbQ2v9Dds0pd2W4YJFjMVDXFPzgcZYAM1HRvOp
         1uFmGoBPpInl5lT2XHMKZL2+vtw+3Kf9ISdD3zmbWoHayNUSaOXQ/MWxtYMbQZVxd8f0
         V4KZSkM2BqAYnpG0xER0iYJx0rOIXEdhg2XMv9vBdWtif4MqR/1yeSCTMd20bBCCxPre
         jY3ArCzxVPAAphZISzRP0XtLnZ62ov5ERCAx/ZCqMc3kXUYY1u7UEd/TsUryO/xLI+nv
         QrxR2GNzFfqG3yAJBw02ZorQXA5ZRlGiPXPOrpMIA0dyjtFkD0/8YJGkWiRrXwIQmNtT
         CseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XnKOT8lAtvoMmf2DZLmwJPy7BfQRPbNOPZaTV7Nokbs=;
        b=fw+f+r9NmTmZNMbrNQGtQ2YZDBQwGwjb+74M2ucfBAFkZe8MiczrsmDul0/U3GqSPE
         FAqhoKx08zY14S4zOOB1yuQl7Z9BvXtFtyNpexxRH53mD63+NwgXdbgaOnaFqStG7nP5
         sz5vCEt3ReZTWVIDxitSdoFwfy2mlvBy25ES4MaYCKl6uvX8sotSgt58KA74XvO9jyQz
         tNQ8hayGvBUnmS35v40tYR34fqNlJBzpCQdcoqnR0IfG/fVrwOOAe40pb2N1UcmsneYb
         lSNP8zPlmodJIWOTiab1igNRqkqfxXRX3thGRgq9bPXLfKmlpe53OzSqkzGaiBAspVsy
         2hOQ==
X-Gm-Message-State: AOAM531Cwjw/K6XrG7SLjmx0G7E0bdRJF1VsDGPF0eaxpLrUFcShkWPk
        Z8uRH9Byl20mFIQfmLy4xgSnRKzxws+AsdhTg+8=
X-Google-Smtp-Source: ABdhPJwRnvY5hDI53ltkz3o+IMY5jxbErfESzahapOBuRVz5/hHDHajYDWR0XC7iYEPv/9NJYxXsTZ+d6OgNK9+EoRo=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr953633pgs.4.1601895763587;
 Mon, 05 Oct 2020 04:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com>
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Oct 2020 14:02:25 +0300
Message-ID: <CAHp75VcJYwysrb00TGSpu_cFf7_-mAhu871VM8Of3y8FB_+m3A@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 10:04 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> I'm intending to add some GPIO chardev documentation to
> Documentation/admin-guide/gpio/chardev.rst (or perhaps
> Documentation/userspace-api/??), but that is taking longer than I'd like,
> so in the meantime here is a collection of minor documentation tidy-ups
> and improvements to the kernel-doc that I've made along the way.
> Hopefully nothing controversial - mainly formatting improvements,
> and a couple of minor wording changes.

Thanks.
For patches 1-4
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch 5 as well in case you agree with my comments and goind

>
> Cheers,
> Kent.
>
> Kent Gibson (5):
>   gpio: uapi: fix kernel-doc warnings
>   gpio: uapi: comment consistency
>   gpio: uapi: kernel-doc formatting improvements
>   gpio: uapi: remove whitespace
>   gpio: uapi: clarify the meaning of 'empty' char arrays
>
>  include/uapi/linux/gpio.h | 106 +++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 52 deletions(-)
>
>
> base-commit: 237d96164f2c2b33d0d5094192eb743e9e1b04ad
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
