Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903BC23FFE4
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 21:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgHITzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 15:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgHITzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 15:55:32 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67D9C061786
        for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2020 12:55:31 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w25so7356469ljo.12
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2020 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gb6GBTcn1DdG5c+MbfZGxeWOEsq1soV0Ir9YyDDSzao=;
        b=h1FboOCE7RlnYs62A2tbSEYOTjOhRbOyxysffdQzD97v64yqUYH+LkI3uaTSf73Ffz
         F/Wk/pzRKYDgYSUQJrPlZr627hNEwmRCKd7HGP8+n5OpijIXum4wlwitfZWSyD14YYsD
         OGw9ZyXnBt2185IQ/b/Xc6NtGDoeXKNyqsp6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gb6GBTcn1DdG5c+MbfZGxeWOEsq1soV0Ir9YyDDSzao=;
        b=mywLuWLqX5Au8H2vjv3K9bbpa8LLhe4nC7xUotwXT7s3S9Fj3AI5FuUOErFlNHh1Fj
         SB9/ehs8PJQS8/yEhwAbWa1MVAjTLJyXOpNZnJgUQrRA+wxBcsQ6vHJs+QUgyM34J0zq
         ZVAbMQZCqVcGcIGhtLLaaXHXQHU+e1tBKfrWZGsLfwX7UIUeorHafzUjbLiLfIyvwZWg
         cikUu481oTuOt9w9DyB9Pf8vdRObyXKX5fR2xtqbI3C+Ji+MW756xgRuBbxQHS9w6gF0
         xq+APnU8i7LTAwX7Q2YQuzW0MWdiudzKdYoqXDBwj26o0+u6Lu1CbBd2i3WmftPDvmr7
         Y/0Q==
X-Gm-Message-State: AOAM530k94YNB9RX+dUrvSYYMggeBpqR9NdLBMVwnZu2WzrYxmPaBbrc
        5HXCS4Zo0qNyKV0DPeQtIF96r7CzkOo=
X-Google-Smtp-Source: ABdhPJy5jxzl6u2BVAWKVOyPOL8LTgg5Oy6v9Ls9PiN6bkCwAr7wBWfHnZix9C5qphNbX5evi4N2Cw==
X-Received: by 2002:a2e:9905:: with SMTP id v5mr11214665lji.42.1597002929600;
        Sun, 09 Aug 2020 12:55:29 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id d13sm9450091lfl.89.2020.08.09.12.55.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 12:55:28 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id i10so7401650ljn.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2020 12:55:28 -0700 (PDT)
X-Received: by 2002:a2e:b008:: with SMTP id y8mr9469780ljk.421.1597002927878;
 Sun, 09 Aug 2020 12:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
In-Reply-To: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 9 Aug 2020 12:55:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHNkPHvGG_Ca_f8=+w5od9_XTQ8yD55+v-3WCKhvKviw@mail.gmail.com>
Message-ID: <CAHk-=wjHNkPHvGG_Ca_f8=+w5od9_XTQ8yD55+v-3WCKhvKviw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for the v5.9 kernel cycle
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 9, 2020 at 6:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Driver improvements:
>
> - Linear improvement and cleanups of the Intel drivers for
>   Cherryview, Lynxpoint, Baytrail etc. Improved locking among
>   other things.

I'm having a hard time parsing that. What does "Linear improvement" mean?

Anyway, pulled and explanation left as-is.

              Linus
