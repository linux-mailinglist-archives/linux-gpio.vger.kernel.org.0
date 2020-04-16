Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC57F1AC0E1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635196AbgDPMQ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635002AbgDPMQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:16:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC80C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:16:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 131so5372967lfh.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t68CbxFaeKnYXts+L1lX3BCdeb2tFJ0W2dgkKwCzAv8=;
        b=gaJpAydA8WAwfe5QLVb1HfYfQhjZTdZwf6OIn/w105Quvjv8Zghd1RkRu6K/wPstl9
         1HLPqrvca/lgAOjYJQVXBUeMkPm+eH7JT5kftT/ty3ftGlOWbJY4UsePLaW8JHh1VzZ/
         1KJ+7CkTHQ6vK9JBn2IygOxvOsq2D4Qs0XAd/gT1NJxzxgQUD+LcXHh/BzZea4oRe8Mf
         8KWR0V9Y+w6S7W8HmSaUjp0kNDdNwPXSzhGMrGHNWwYc2YtJ9LGY8irwddP5CmWo3qMm
         wO5ArGZaY4i2ylXp3jo+huvpzRDWIU6g1FSvSyGivvPECZhYI8vrAOxKK+GttN7/P9nF
         CEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t68CbxFaeKnYXts+L1lX3BCdeb2tFJ0W2dgkKwCzAv8=;
        b=JD3IUE9RifsVD9DmfHc1pg5aEQCn6ODOt7SCexdjJvJdEEZqbK6oZnKWrhNbKwgHum
         MqHzrDpwBZjaTFcIajHlQ0Q6C6Ctpj4TM70eFOGFrP/agbbaRrn1Bn004UmRey2RFa7k
         s1WYLjz80n3E5T7wJOi/EHz+/jxGaqgj/BwC0ZCYqUVv+a2P1XLmlTTK0LJJzxMbcXDw
         IbJVRpUjDYVm+tMqM4A6rxKRhnktFicV9igeGXCmroTBezPpTGjnNdPwRPWiCSey/CFu
         mMr64caYBJq84o4EcdKwQemXnNizgMRPitXT04YPCAI2P7FtbRXEijjyUDy6+lP9ervM
         SlUg==
X-Gm-Message-State: AGi0PuYLbkwUh756mfx/rEgfZUDLsgyvd4r2dEwrEaPEabHkG1iY5LO/
        ZfwZ3vF61GkTSdnQLWZfKocr4dgNzn8qi/zeEm3xUbQE
X-Google-Smtp-Source: APiQypK+N9jqVDZAfMojtnL5sjeaXSvMQB2MNiXRPV586cyFvGm5lcLzeqfBUKJvAPenRfJdIDzNXva4bT9JnX6assM=
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr5744919lfc.217.1587039407819;
 Thu, 16 Apr 2020 05:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZKEpz=acfw0zQ71pWmLU8dALS4tap412U2x6GyY82opw@mail.gmail.com> <20200416113543.GB185537@smile.fi.intel.com>
In-Reply-To: <20200416113543.GB185537@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 14:16:36 +0200
Message-ID: <CACRpkdZt-Amd64qE+UaGjUu4CuJ17yqyNBoFstxpcPgyx8c7nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: merrifield: Switch over to MSI interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 1:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Apr 16, 2020 at 12:50:43PM +0200, Linus Walleij wrote:
> > On Wed, Apr 8, 2020 at 5:41 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Some devices may support MSI interrupts. Let's at least try to use them
> > > in platforms that provide MSI capability.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Patch applied.
>
> Can we return to established scheme when we send a PR to you? Or you think
> better not to do like that anymore?

No problem, I haven't pushed this out or anything, I will drop these.

Yours,
Linus Walleij
