Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34AA4472D7
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Nov 2021 13:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhKGMTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 07:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhKGMTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 07:19:53 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A158CC061570
        for <linux-gpio@vger.kernel.org>; Sun,  7 Nov 2021 04:17:10 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id o83so22992068oif.4
        for <linux-gpio@vger.kernel.org>; Sun, 07 Nov 2021 04:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qwEmrvgjr3BpBfj02IBFbEAwkHhmYpc8H0xeadfaW/8=;
        b=SERr7CikvTZ6o7H4yCkuAK6p0w1lFBY63/W3t3kiTrOe8/jBAJqhRtuaR7tWOgvevh
         lGSpmrP3pjmZL9btCSPs6X/poBJ70EvK0fW+3xDavlxd9aSAIWLbfA4ztLGpxpK1RJZA
         t8JrL26wdtbp0XDjiDoITU9ZZzqTPXQvknwd/SWTdSyP+uQGpcjiswleAj7dl2ENbyww
         5I4v8j/tL96bxB77IzAfSqukcWBTYc7LGZ5B9m2PO7f/SVzPwrGViuC5zBzCuYGp64Cc
         JtN+GGBpu7t/L9SljzhutYSX/10sE8EldTAgMcABDWDwv2qunb1Qd8ngqMBtKRrlaIfB
         VzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qwEmrvgjr3BpBfj02IBFbEAwkHhmYpc8H0xeadfaW/8=;
        b=wIW2KmKN1+m/Y5Q7PgW8DkpGlPD5RBVltTSlme1SmtHU81G7ZOlvXw4SOrdbphIbsf
         fcv4UOLo6Fm8UldCNnCw9LVaxCkn61SjY8AjE+yIdO9Ex5y9X6SL1uu/9FTnSR0ULInA
         OzXoJ7kK2VSi0IN0LntjK0hUxAvjf8kab7VdSYBai/EeaRcr0jdk5tlmslXaAtWo/OMv
         nOK3DLfYumY77cF5QzeZcUBBByB64D6elNVSs9cyQspuHIZ5KbKK7M9bN/k5qZXkupBr
         t0E2/nN3sE4sacG8mIYjNm5PMYaDNIOQ1F4Iz/41zp9Me3yfIxEMBivrtF5mYCfK//ib
         fhFg==
X-Gm-Message-State: AOAM533h1xkE6T7pYJagR/SiA3JTlER54yLxmMjOmE/umosOE9sXqEwq
        ePMwuheky84GqzYVzWn/Kw2vbQw0MmKf0G9q1q+YuQ==
X-Google-Smtp-Source: ABdhPJz89tuCao9ba4CKBLi+ty9PyP8AGd+5kqn4zJdJIfhJI9J1mmK4wY4R7VMJb52bBeufGMhaE+BZHPcA1Ck5JPU=
X-Received: by 2002:a05:6808:144f:: with SMTP id x15mr31149867oiv.132.1636287430009;
 Sun, 07 Nov 2021 04:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20211104190030.20660-1-brgl@bgdev.pl>
In-Reply-To: <20211104190030.20660-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 7 Nov 2021 13:16:58 +0100
Message-ID: <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 4, 2021 at 8:01 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> A couple months have passed with a few more iterations and I still can't get
> any meaningful reviews from the configfs maintainers (nor NAKs for that
> matter). I decided to give it another try and send it to you directly again.

I think this indicates that configfs is partly orphaned. If not formally
then practically. Let's poke Greg and see what he says, configfs
is important for USB.

I do understand the lack of maintainership hours and that people have
more important things to do, we all suffer from this.

If you are the only one who really care maybe we should consider listing
you as configfs (co-)maintainer as well?

This pull request FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
