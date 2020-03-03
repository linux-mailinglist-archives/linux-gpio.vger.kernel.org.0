Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDA31775F7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 13:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbgCCMeh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 07:34:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40981 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgCCMeh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 07:34:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id u26so3302979ljd.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cd3PuDX7QGlpsLRHSkLqaNlrKLigo/VJS+jTQKxKQ4I=;
        b=Y9nHQ8bhBUHFsRGta95iKneEmmxYzcq36hN1eDHokC2iEnSBusLXp4oraHu4nZ44a1
         PDUL0NPlkSj9R2KiOB/guYeQHSCwsWMKMFUpofbpDnmeIuhCK2v4ZgKWv3wWeT0vU743
         Dym6dRgKsaosD8pNyCJhPyass3LMEOwPWFpoPjQuObMWqL9DenwMCAhhjzvmO/AsHhyX
         fw0zseDzmakF6WleQx56XgB1IR235elHrHqkZWg1JsKGZBFaC7R8p11d3N2ZRXjN48ae
         XtEr+3+tJuqIi3eXzd+pbWklChykz3YNF3fvLsk2K1+i4krGaczU7gfWhng4hbt5ZLKJ
         CtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cd3PuDX7QGlpsLRHSkLqaNlrKLigo/VJS+jTQKxKQ4I=;
        b=ajLfenbZhThIKDOKskOiA2GLFhlQgw3m7QklO39rPQYyF0wqcWQ3i7HO+41JgjoX9I
         oIaOU6Ia6B4M0cOJtetYJuGSrkcOfxAWh87s5m4UV3HZ5bf5ESuy2YQPJafLo9AoxNfM
         uPHWBc0q1wVI2oGxRztnO9xoPmadNJKi+YdwLOL7jhQPYJdgqfT7hT/P2h/DX71+6eXW
         Tuf7DWTR6pJcAydIGq0y/zL9eW+1G826I8seKqAWg6RRizbSkT8YQivp1cixnTvHgRxt
         a3rTLAbACiv6pSum0xehx7RgkSgJUYnIcvXlgchWA3AJbODfnEXGSQ0bEvU8XPh977CB
         Ecmg==
X-Gm-Message-State: ANhLgQ0SdHhdGwXVQ4NOajfN5H2ssVP0qEQJJsytXRVrhHBDeW7+OY77
        ghVQyPBAe01SxswZWAMjmR9z7mVFaxrGqiDvVbdLQg==
X-Google-Smtp-Source: ADFU+vsn3QSWuqyWnLpWbybp4u+9gaM0g0ZKJO5jT/H3hFJPpid+emxdoaQ9W2xtLAISDCjngcELgbpKPPFtmrs5BIc=
X-Received: by 2002:a2e:9c8a:: with SMTP id x10mr2417162lji.277.1583238876321;
 Tue, 03 Mar 2020 04:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20200302082448.11795-1-geert+renesas@glider.be>
In-Reply-To: <20200302082448.11795-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 13:34:24 +0100
Message-ID: <CACRpkdZXUVaDFq5TLmQnEMyRH5yv2XKE3au5KbuMCh0j0+Yh3g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix inverted check in gpiochip_remove()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 9:24 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The optimization to check for requested lines actually optimized for the
> uncomon error case, where one of the GPIO lines is still in use.
> Hence the error message must be printed when the loop is terminated
> early, not when it went through all available GPIO lines.
>
> Fixes: 869233f81337bfb3 ("gpiolib: Optimize gpiochip_remove() when check for requested line")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied with Andy's ACK.

Yours,
Linus Walleij
