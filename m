Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B84231AD1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 10:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgG2IGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 04:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgG2IGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 04:06:05 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8EFC061794;
        Wed, 29 Jul 2020 01:06:05 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k4so11450911pld.12;
        Wed, 29 Jul 2020 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=atgSrHfyaIIMUl6mCM9j8rJFm+650O1VFwhX1wLqJE0=;
        b=TBPc+Z0v6XjWZeyZLo63YPcRkh6CFI+rkus4Pe0DomT73g+LBPrWIfMsSA/xrQ+Xyg
         oduUg3J0YiJ3eC/hk6h91d13pP3m5kwcxaY4R+CCRMPWito9lZvtLHlOzGJtDJAHALKn
         3VswITBh4BsEhsHNn0cAmL86eDF9X6k1kipiO9XioSd49O3W+6K4fV9XA3v9+W995oxd
         OQiMcQp5sDCDlA+eGIPauprXZFPJGZ6WFamA4JJJkE3LQp8c2/h1Prs/VsM/MH1YP3Xb
         qMAteG8+jva1c/b42HdKRXwlA/ZZO9YI22gEwpXvH9VS5gCi32bXJTzfxZqsc48/dGgd
         SRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atgSrHfyaIIMUl6mCM9j8rJFm+650O1VFwhX1wLqJE0=;
        b=Avrw7sUOR3gA6B3ttrZhpXlFu4fvtfsNXZhHpmJ9c0xPcWLmHxkgyTVFScHVBCMS/i
         dXbrQrzBPaIZBkrP18izMwPnovekBS/kA2CcdQLdzQTMMo6nHac4nGRNWeGMbLo8l4ap
         Wa9aHwT4jEc3fqcgZiQv83Vhif/oE+A+YSwZ4D6/zipjsSOLYKN1GigCERM+QrwIqsNW
         rSxuMFnTXh5QG3A7ChMlQZNnLh8cG8UV7A7EKMQvarlZjhK5Wl8L1SqUspom3roeC1Gs
         o+QvAGlkg2SVtFlFiX3e7Fa3Q/t7ccS97pEupOeocbE72kjdwDp0F1IQAOoTbQ3mmjm2
         sZ1w==
X-Gm-Message-State: AOAM532362ab19pxUiMAfds+IkjDLuiNuqTAptHABpqzUvxteG+iZE/G
        JsexjtZOFt64FGV8W/FtYVOYzuFu0cj/mwPO1Xzqo68fd9M=
X-Google-Smtp-Source: ABdhPJyVYjvDLkNLYisyvWJLCaJhKACd6mYUkfnBr05zG9w8Y/DUip4ovaDRb4q4sKL93Je9Got2kY4/V7351sE3WFo=
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr8829272pjh.129.1596009964773;
 Wed, 29 Jul 2020 01:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol> <20200729022814.GA1750878@sol>
In-Reply-To: <20200729022814.GA1750878@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jul 2020 11:05:48 +0300
Message-ID: <CAHp75VdUZ=N7Gd8NgYY4ifY68Rc5DyEOqrfjdTJvwiZ3ayNCMg@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and GPIOLINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 5:28 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Sun, Jul 26, 2020 at 09:12:44AM +0800, Kent Gibson wrote:

...

> I'll rework that for v3.

Please give some more time to review v2. Especially the v2 API approach.

-- 
With Best Regards,
Andy Shevchenko
