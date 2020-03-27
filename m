Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7128B195512
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgC0KXF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:23:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42600 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgC0KXF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:23:05 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so9564712ljp.9
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6+qsGlY5ufaYGYSvfi6R/XdWdgiZnQOUmk027h++wY=;
        b=txdKACCdM7XXYtTJw1Cpjkvm6oyL7atR/RjEVZa4sh+MYp1TgRoMuB4B04Q0FgZjsv
         y0KzVBiDt3Z1FhO2p8E+MU3YRMufVrRxCYmY7YjzjKWlGskcN+zZ06vyYjx+OiQr0UZ3
         gpNercDKBycZnaS5EtnhmJ38FNp+YDDfQgGRFHKExKCyZWsHI9amhTlaUmujm60c5TI2
         Ge3c0sBOTmyfm1JbVHfFedn9QZukp8yXjcH/fCQ5IpDzWxKthGjvXw00GQVULuC2mKz0
         n2kpIEvWqRvtHSRWdfOvd0+a8KJf2vlqa1o2A7Quk9XZ2UFXj2EBVl8YdPspHfIuzTXf
         v91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6+qsGlY5ufaYGYSvfi6R/XdWdgiZnQOUmk027h++wY=;
        b=eK1cd1v0aLy35dk83XlMU8/BxMVqGoPPyP7inLpYkwbN0+QQPjmbAUGPGpK+fvH0IA
         d0Re734+uBEBwYPZuRzjCfhkzybgGY8YPNKZdTqIj3dsh4RpPkPi6KdJdM5DDMzXLFT9
         2rBVERo7ynGhQoGcaxxdFyAOJeBHfsGC1OWM0NPdWFxZGZmACpo49kk2xhDInWcU5KSY
         AlnrLuLPNDRGM2R+4JbKJ7powEXVpOfNh37nuTqpqljLd86M2orMdU8PF/PTJbje/gQX
         4uCzisAt28xMxRwDN94ZwVR5YNZ04A4G+Qe3JK0u0WirnJAXwl0TuU9nah1aeD32BJe6
         CX2Q==
X-Gm-Message-State: AGi0PuaE1JNTOgUAyqlsqo+VnvxbnM3De1cvYxq+EUh6Hqzb+8AiTzej
        05x+xIePatijlyKW8UK8ZLCAj9gu8Cq78kYamxNZjg==
X-Google-Smtp-Source: APiQypLAxlxUn/h9pbLaNqfw8TLuPxvnQJeZXEcak++olZSdCahmwgdRjDUQzOitW2xd7O4LOLGl+Jaw0WeumCFSA7U=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr7429532ljd.99.1585304583741;
 Fri, 27 Mar 2020 03:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584456635.git.mchehab+huawei@kernel.org> <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
In-Reply-To: <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:22:52 +0100
Message-ID: <CACRpkdYrL02YHn5dPnh_Oz0Ysm5BxHrwQgwNMtsD55XGid_hCQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] gpio: gpiolib.c: fix a doc warning
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 17, 2020 at 3:54 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Use a different markup for the ERR_PTR, as %FOO doesn't work
> if there are parenthesis. So, use, instead:
>
>         ``ERR_PTR(-EINVAL)``
>
> This fixes the following warning:
>
>         ./drivers/gpio/gpiolib.c:139: WARNING: Inline literal start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mauro are you merging this or do you want me to merge it?

Yours,
Linus Walleij
