Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99294301E9A
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 21:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbhAXUCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 15:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbhAXUCp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 15:02:45 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65E0C061574
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 12:02:05 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id kx7so7049560pjb.2
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 12:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rg00FzYj6K8hgdCck8q0gQENvaFKlmec4XdGuwimYA=;
        b=Z2zjUddLcVyoB5AlgF5l8KIDuIFNQYWQwnS023PlNBe1gQGjGI5hvPUqGz/Y8z75in
         cplNQbMf26pn8Vk6a4IrE97FcGxfdwpjePe8S78TVsghJoZH1oCenFV6XfDtjAbRI454
         /LeLjyIWfqJQo/Wn4cNXfRnaEMoQGbb9qE4BeDIsdoQHIwqCuNNlHnLi0bfiw8PI767A
         q/SXaHRi5GKkLXbiBGZc7f7Ib4RnJMZjsMWjrhaqQe3XA11zbmxPhXS6lN3Spp7mwPFr
         RLXaC+806K8KP3RBvt+8LIq8XtCWfXTIiERAyWVdK7Ep/IbeQK2Dn0bnctGERI+j+2I1
         7jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rg00FzYj6K8hgdCck8q0gQENvaFKlmec4XdGuwimYA=;
        b=AptLyszfzrDMpr3izQsticzUletcIIbSHrOmgfVxuD+cslAy3AHVlP2h88vOuMj6+z
         RtlD8mbqndbdzOa968q+/WtCiwFEetxNI1FpC4aMmAc11hkYl4sl4V3ubKqyWQd3k9RB
         OueOpTCMI27B1gA8LygsJHpZSoIcjPSFkbX8nefIYTzauL8OKEo7zu8ta0wezHuiDtbl
         ZxAv18SzKEpamjpLmAwsTWXBWyn1oQQ/lp2EyXG1Q6hg6KVJ5ltY7qYJJK3XlSsIQGb3
         vvVVk0QU+w1+bRKgnBQVS1R9wND0IdW1Y3KTBgpRXFKQOMEjP+t9NXD17aOHpDTA5gYn
         8Ycg==
X-Gm-Message-State: AOAM531WgoZk/9eEoSsGcXcKxi9R+GRkxSCDOjDMxtmjQJd+Rp5pUakN
        BQWPHEFqioqXJYNahSTCxT/eV2RjRLHfGpeQ7r6qubMTJ8Kaeim5
X-Google-Smtp-Source: ABdhPJyjN+gMNcyixcxl7WDUJeDuvPPClehgKdJOfoUys3ewiyy7MK/Ht0HGqorrWzbHoHZEgO1pQQFDBLTuX+zjehc=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr16318855pll.0.1611518525176; Sun, 24
 Jan 2021 12:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20210123202212.528046-1-drew@beagleboard.org>
In-Reply-To: <20210123202212.528046-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 24 Jan 2021 22:01:49 +0200
Message-ID: <CAHp75Vfa2iS0RTXxaoUv9zwr7+GvaUwm0xqu4tiSF8zu1CkECQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: add function selector to pinmux-functions
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 23, 2021 at 10:44 PM Drew Fustini <drew@beagleboard.org> wrote:


> Patch note:
> This may seem trivial but I found myself coming up with series of pipes
> in the shell just so I could see the function selector in line with the
> function names. At first, I thought I could just pipe to 'cat -n' but
> that counts at offset 1 instead of 0.

SO advises [1] to use `nl -v0` instead.

> The only downside I can see to
> this patch would be if someone is depending on the existing format but
> I don't believe that is a concern for debugfs, right?

Debugfs is not an ABI.

[1]: https://superuser.com/a/1433656/415970

-- 
With Best Regards,
Andy Shevchenko
