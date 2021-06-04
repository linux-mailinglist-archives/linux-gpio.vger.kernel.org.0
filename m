Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2716839C32C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhFDWF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFDWF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:05:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ACFC061766
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 15:04:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f11so16154628lfq.4
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQZbuWUG03lQ2rSsW03oJWLnLVkei/e7oxh8vFKy7HM=;
        b=nWeoqrwgWO9J+GywK0+9MkhsUybMt4qICY9XGVkIHqhglHGFgf1gsU6s0vwiblTgKC
         EJ2yjEw7gmTSbvLVaWKTrTGLAzw32OApT5lGPAxEzeqkw7ff9fwT0QF8W0x7bVBwr6OI
         IDBq2rqdoRFZOyQbTUunBPM3/qkKhATM5edS+3bVkAgEckv2uwTiSnR27+p3Zp8ecxYQ
         j+NIQBSSgc/oHPPrJ2+YwxswY4zMVnQXwtpakhxXGGy69pNEe7HJiqxfQizni8azumPa
         bUkAg0yy4EI72OZMDRf7S9so3g5JB68AjUgiFTPzIecay/6ac+JVlgW9ieJGdeKdjwX1
         FHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQZbuWUG03lQ2rSsW03oJWLnLVkei/e7oxh8vFKy7HM=;
        b=Jg3jxh5/j3v8/ugHAmcwC3q0iAdlIanjN7rw7sWY8xaTUMc9halPNWFqBrPI4E6K8f
         /9O0VDGWkEhlM6APpB8DhXO6Ls/4nS6DASXJxDQxBxDDyf9lv0d77jko8xB5Uf7eYrhj
         JLrvj4HdsEQ7e8cj/EpERP3CdwpRTec8eNuw79OS/hgllKsqk2Uae6q0JN7ffSc1uLmm
         KQNqd7nkFvxIeWugLMXfLXh3aNzc4pcukeQGJWJ0uNs7HOO4bB4+orRBIrpg175vYn72
         GfAjIHwQakByxyHkhvDYoo492EbIAXh4jH0J+l9DVPt0GRUkjXa2jgBBHYcAUyRR3IfY
         2fkQ==
X-Gm-Message-State: AOAM533SRZ+4ZzReNJBo6VyktYpGMA+kzQgbqmkdQNZGkRyu4MxO9amc
        wPLW8s0dlv575DynNto/rmYcdjrZIdb+4TC9Tw0aFA==
X-Google-Smtp-Source: ABdhPJxrXNHigb02NXg6KvBA1hhlWVQqvBzap419QCgz9FmREBg8ONmXhdrIziS9rug3ASrPUTOzuNFzPRSRw8rrQ90=
X-Received: by 2002:a19:8157:: with SMTP id c84mr4135763lfd.529.1622844249725;
 Fri, 04 Jun 2021 15:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210514123309.134048-1-tsbogend@alpha.franken.de> <20210604122223.GA8940@alpha.franken.de>
In-Reply-To: <20210604122223.GA8940@alpha.franken.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:03:58 +0200
Message-ID: <CACRpkdafaMUjai4VCxePX2kWFkh4=Ks5qQvHTtYvVtkeHPhKKA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 2:22 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:

> is there anything a still need to do to get this integrated for v5.14 ?

IMO not really:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz is collecting the patches for v5.14.

Yours,
Linus Walleij
