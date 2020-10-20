Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A45F293A3C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 13:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393806AbgJTLpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 07:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393579AbgJTLpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 07:45:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51571C061755;
        Tue, 20 Oct 2020 04:45:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o3so909595pgr.11;
        Tue, 20 Oct 2020 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+sMvGQJ6Sbqoq9aGV8WWCZd3SUHN9ACUz/+BbiQqU0=;
        b=NLt0GHi9O1TZ+qqT7Z+NtNn0ZdJbC2Zs5PKB8cm3YI3quK0FbaB4oIZcCW0z0E6ukm
         A+sMkPsnHXBXQc9u4oDNh1hBD+I31CBUwflLsr8C6hwoMFUngCvHT3t3svRSyJEOQHPt
         F7gFoivZ24Y1oT2v1KGZ+jMW99VJSY5+aKlEliRpS3+aphEQ1w52zRAePWl3YldYok2z
         5bNACDFcYuv19ED8BQS66PFjisxdBSe1omFrP12DvD+m3ciXl6b+OiU70QIi4QvMYDWc
         o1v4QKWmVYRZKSLg/EqTaAytp8as6U0uLLLGwJvP3yOvv2lcbaMRnn7XIDFn4jCY3fEX
         JRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+sMvGQJ6Sbqoq9aGV8WWCZd3SUHN9ACUz/+BbiQqU0=;
        b=ttEmSEpkrGnxFeVGcB3BpCPcoSyAqKE7AJQqDGkY07zWlqT+q+WvAUU7aO/vtQd8tQ
         Cx2R8/GQb1hfB7Xe/OlHKzU91fPy16fO1OnfhU++HfueO/E+KCbIt5XaqFAZVRe3AFtY
         KeYJcbedRiAx3QdhckgR0AHh4AkDP8T0CeAINT8qqA7O4ZU6dwRpxtSoGyaoh0n1nVId
         cdWGzVkaFsWcNzMXIPnG968MzqVHd5Y4DJxAk8pQMibR2hRq9hI5BUa8oMXJQAw0+PpU
         6xcx5nofp8bKMWuJ/x0AiiCUgdmJwxg3RH9Sm61OxsvXXXPoDZhDIlYR5rSgWb8q52+O
         lDkg==
X-Gm-Message-State: AOAM533TC+iA0RZon148ZFvURrmWCbEK7L04yaMLdTQMyQz1SFUdQRKr
        juiiL/ROW4XgW+p+FHzAqZ0pAjFUlESOlFM3DxI=
X-Google-Smtp-Source: ABdhPJxZSsmUQZk1HAQQXbs0xwM781Dn5B1XLSDQzVljRre2Ya9BcURW4popkBCcFnC7fltKYOs3FF8Pb5xzeDmcw3M=
X-Received: by 2002:a63:f908:: with SMTP id h8mr2330043pgi.203.1603194349831;
 Tue, 20 Oct 2020 04:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201019193353.13066-1-trix@redhat.com> <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
In-Reply-To: <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Oct 2020 14:46:38 +0300
Message-ID: <CAHp75VdxXw0_W+MytA72sBfYT6nr=xHc+tTsTp7GPLnR9EgOVg@mail.gmail.com>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 2:26 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Mon, 2020-10-19 at 12:33 -0700, trix@redhat.com wrote:

> > -             break;
> My personal taste is also to omit these breaks but I am pretty sure I
> saw some tooling issuing a warning about falling through the switch-
> case back when I wrote this. Most probably checkpatch didn't like that
> back then. Anyways - if you have no warnings from any of the tools -
> this indeed looks better (to me) without the break :)

JFYI: it's a clang which actually *is* complaining for an extra break.

-- 
With Best Regards,
Andy Shevchenko
