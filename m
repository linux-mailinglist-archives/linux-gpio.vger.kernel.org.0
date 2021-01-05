Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E138A2EB150
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 18:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbhAERYj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 12:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbhAERYi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 12:24:38 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C31CC061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 09:23:58 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id m6so126513pfm.6
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+hqT07JH1bpJ/0U8h3HC2S3NcqQzDs9Op7M4OqqYpA=;
        b=UbGqK+BwencdBGSuXDoXWS1qOQPft4l1vgnHHGWe8M5+a1b+Oauu7QCcuofDWSFuWp
         QK5rE9AgQODn+i6idVKG4N+rsr+J2tLw9XjtLu4xqqaTj1WO2oLex4OuuIIdJHkxR0Yf
         iPjiMg64vetzonm1t6WIhV63D40AYqbSGUqX4fLEiv7WIfwUMyFADZVt4fsi9bluP8Kv
         N3Ku62GEtru0ShWy/qJ4QsFQM1kuhE+LM9o+7kVbgVbbKhebFMfznvJKHPxtPbSyhvW9
         2d+KGMezH4vuCYkUQrtWJr905LJRNPaaIevlMMaZFtJI9m6VEeZO8aD3egJzdlowP7Ml
         txQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+hqT07JH1bpJ/0U8h3HC2S3NcqQzDs9Op7M4OqqYpA=;
        b=uZPhzGrAvyukmXlA74INvUr3r/2H3Xx77rkNPLzJ7A5yFu7gWGq5eeOCJrWLd9zPy0
         fxCbRE+wFbrfTeY8R/tbYNq3Vn1evMeEgUSu+5wOGljX1YxfENIgaRhPgUwhtPUvgrz6
         PSNYIXzqwGOxeKV5TjDYGfpMlaN6vM+eBXEbcBr/u7TJbqvDKv2ZooRlwxKyOKa1wQm9
         fx14xOUKB/oMIhdN4sdc53BXQOq9o8Rn9j2FO4uZ07Ib05cCNXyMvlxa2gIjxpx+aTG2
         Vh1MibhMiBcn++Irt4wIbOEQnBrNf9dyMmKBuUIeTjA2iKKKlMIw470XAaJZT+uaBHb5
         /SwQ==
X-Gm-Message-State: AOAM531fb+VFy1o0SXENn1g6MUqXWCWeT3yRqBzzifI6Z7NY5Q9YdoVt
        tXyrpFLy0C3Q+1PiC7SGunKU07ztBLnwAS569D3r70Vhkvc=
X-Google-Smtp-Source: ABdhPJwGpqghvkGAL1meJr2hzzSpUF7TE+Pg4/zFBfCxsFhoiOnodrOw0ZBEbXxtDg9Di121FsE1Pl/DxU1xcVH/Xvg=
X-Received: by 2002:a63:4b16:: with SMTP id y22mr343550pga.203.1609867438109;
 Tue, 05 Jan 2021 09:23:58 -0800 (PST)
MIME-Version: 1.0
References: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
In-Reply-To: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jan 2021 19:24:46 +0200
Message-ID: <CAHp75VeuMfA4ojn7xDEKx6zbn7VZzYrcHMtjnC6_-j-wJhY=+w@mail.gmail.com>
Subject: Re: [libgpiod] AC_FUNC_MALLOC cross-compile failure
To:     Anssi Kolehmainen <anssi@aketzu.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2021 at 4:17 PM Anssi Kolehmainen <anssi@aketzu.net> wrote:
>
> When libgpiod is cross-compiled it will use rpl_malloc instead malloc which then
> causes linking failure at later stage.
>
> This happens because AC_FUNC_MALLOC wants to execute malloc() in a live system
> and thus cannot be run at cross-compilation time. libgpiod should just do
> AC_CHECK_FUNC instead.

Which version of aufotools you tried? (2.69?)
Btw, have you tried autotools-2.70?

-- 
With Best Regards,
Andy Shevchenko
