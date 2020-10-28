Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A94229D937
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389460AbgJ1WuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733178AbgJ1Wth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:49:37 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803EFC0613CF;
        Wed, 28 Oct 2020 15:49:37 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x203so1260944oia.10;
        Wed, 28 Oct 2020 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZyqI9WOFaFFLuncAlq6I3YmM/P3bEkVE3YcPg4W+494=;
        b=E+Wika7ptI5ifQPb2cHteAT5F6W79VkngYR1MAtRRAeojvQ/E/ieLEb9q6W3VVdoD/
         hTm9vLdXc+D4dSwielSw1QZeo9libI7ddPayszguUD1VQNCkjnCGvuxEjWEoKW77dC57
         mUwguKgypXHjLxa1bE8kl61XDQEIPDlKtNou2R/pd+2N/UXShkmya91i5KwXSUh/83nI
         cAwYbbme9gB/cPdpUbQB8T3K7I5cWZVz79oW/yOl9sNP7F7SWaDMHpuuIQ359rFbwRBL
         EnXMuNp7tC+DMJdmMc9c0pnfOQ8Dy9h2+9ieORza2v0IpbpqmhNmIiPW4ns3Onu4WuCZ
         rffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZyqI9WOFaFFLuncAlq6I3YmM/P3bEkVE3YcPg4W+494=;
        b=hFKKPiYgV7OVcmZ+tfVmg1+PjeGZKFDHZNEV08dZKAPQVfJpIB1EgalSBSeWDXurL0
         WsuO+HdXkh2xHWLKajF1AD6+uZCNzQGYjqVO3OE7PlLQx+8g467oFeE1AuYEUpX+MBQV
         l7h4GTGX7B+FkLjClZ+8ZJ+Zpjr4TRhwqfeW2dQxlcYEyJHqNGFE7TMcLPSd+qbqcj9F
         ZUF00m2EnH2Qxj55aWVnK4JZO1LvChlXdlG3owvZUo0mbWLzOCTL/H1m8IpD15yDYpZa
         8JypNvZU+tWj9LkpK5MQTgIxAzU4wuX0j44ow+4GJokiynkS4XVCzDU4ZavodGlspJPM
         XtgA==
X-Gm-Message-State: AOAM530mwK/L+E4cmy2ezDe8N102VuqvLmwqNYFXEFjzpAKuUDFYfL0o
        VMXgVzGkvW9P6LwjbMbv9Eloog4wdcjv+uAropoMTq1tWfg=
X-Google-Smtp-Source: ABdhPJxhOiKXDSjpjWn5c5s0E1t3ewEDz3qZiFvrZXffc8HZHIKZefVK5Ht5LUdgjI4/0wJDumOU5PqE/2AlVBZPvRs=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr6599112pjb.129.1603885353672;
 Wed, 28 Oct 2020 04:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
In-Reply-To: <20201027135325.22235-1-vincent.whitchurch@axis.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Oct 2020 13:43:22 +0200
Message-ID: <CAHp75Vcy-m6tT3ChPYQ8vvsAOwV4CUM3feewb5bpk8h7mqa+AA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel@axis.com, devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 10:00 AM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> Allow the mockup driver to be probed via the device tree without any
> module parameters, allowing it to be used to configure and test higher
> level drivers like the leds-gpio driver and corresponding userspace
> before actual hardware is available.

You have to officially announce a DT binding for that.


-- 
With Best Regards,
Andy Shevchenko
