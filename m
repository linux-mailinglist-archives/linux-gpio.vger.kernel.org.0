Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF63356CA2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Apr 2021 14:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240277AbhDGMvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 08:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhDGMvW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 08:51:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F868C061756
        for <linux-gpio@vger.kernel.org>; Wed,  7 Apr 2021 05:51:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n138so28347526lfa.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Apr 2021 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=21PYniXvfQevYDt2LqUVPqF+blkV7WW7UmwNbAtAyYE=;
        b=SKLeNtLCloj3EXjblEOYq2alS4B615/buEGe1OC6ziEVEgroRrEfmyqcS9muQnROVN
         MjMm5iMLUkRRWNXi+ELfYLXxRbuybFoXvaQLPHPIPDWZxDEr/yF0WD6aSsI8HalneP3C
         m2rx6wXEqNQT9dn5FIjmPdk2jw7IeEUXsQCGm09ZACl1FVzM+I5fen5b6j0zlkyKjBcb
         TrPaCfV8mCGWx3a6khS0RdmbSWenPyxBQUv17epKvvZTGuQE9QWW6bSeJtxy1/ExCLUm
         cnCST4Q1XsIX2RY3YlunfPiX3HudklnzbHz36oPexKuKNFXdjv7gdG+t8Ar7+5P+PJSn
         SWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=21PYniXvfQevYDt2LqUVPqF+blkV7WW7UmwNbAtAyYE=;
        b=YS+5al3GTy0IevgG06YNX8X7lYdXYEpoSUXbqL/4hreXray/xx7xFtgS7mb0zkhXob
         rbiCzC4jYoCkHgMhdS3uZsjYicBXJB+qGyY6R4s6Z06f8Tej5iDbE+pQwu+FIHZAognN
         t6aqasHzC0jY52c99TdY0FJNsLWiXziWwgXxXzAG5/JmSlh3aIUxBmh/2qmeZ+Jx8Eha
         ialAocuy8aKQEWjwbvbQ7JFs6wFl+XPTHpRXmz1/YxOU2mNQJDFv5+jj3+dUfTGZFaMe
         vRcTns9j3cYlxqTuD/m2Rq3/+86U+jm8cmiUkTZll6ld/t+WLrmesgX9a0N2bK7x2fDb
         550g==
X-Gm-Message-State: AOAM533uW7M9khIf4/UgMN0CVYWOudSniyNOtj64jE/QMDlT0CWBgJcf
        fZQfaFnmZUvV/wJktfS+38XywgjC5le4AbqPTzAt7W1UqgVBEg==
X-Google-Smtp-Source: ABdhPJwvsJVtXk3vkL3CrbfITetQgHXGm5hNvOAan62p9wJPBjI+BMzBVPm21pnHwxF1yDG28BKT/SGqSePlzhFw+AQ=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr2226571lfa.157.1617799869912;
 Wed, 07 Apr 2021 05:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210331124733.2059013-1-linus.walleij@linaro.org>
 <1a2033f5-dff4-ef2f-82c4-26c1f2fbd785@infradead.org> <9e1cec76-1c0a-9203-7995-4c2d09b711d8@infradead.org>
In-Reply-To: <9e1cec76-1c0a-9203-7995-4c2d09b711d8@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Apr 2021 14:50:59 +0200
Message-ID: <CACRpkdaqwpbACVYz5+d5HuwRO=W5J-f93W+1N=mp9UhO_Wz5rg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm63xx: Fix More dependencies
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 1, 2021 at 7:47 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> Subject: [PATCH -next] pinctrl: bcm: fix bcx63xx build errors
>
> All of the drivers that select PINCTRL_BCM63XX also should depend on
> OF since 'select' does not follow any dependency chains and there
> can still be kconfig warnings and build errors without this.

I applied a version of this patch where I also drop the depend on OF
from the BCM63xx Kconfig, it is better to depend on OF for each
driver.

Yours,
Linus Walleij
