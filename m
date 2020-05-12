Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4031CF58C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 15:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgELNUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 09:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELNUB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2020 09:20:01 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8595FC061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 06:20:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id d21so5910061ljg.9
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UvPU8FSpJL6vomdakXFP0JIBTIocccxNqXkUiwLZfOI=;
        b=sRVBqHUGwXqLACapxJU+IJttWdKv97HrGvlKUNtqaZIYYH9oM2jwMPJXaTLfT3vaGG
         6TEDmnCrrnp6K+HkFTwONKRdxnIdQC20saOW9JGPpfE75qv9QnFGvpRV+91MClVm5fww
         jdHaaheP5FhHpPQnpjhCJONGol7mOW0qWQ+pN1bNFFgbI5FhpvNuFfTTe80h1EcDzLKG
         sSx0XiQzyMRJqyLIkyMMfl4syjZRHOnP0mx0lXx1Iz5rCxnI/7084+tanVGrr775YC5D
         L+D3mK6TggC+X+h3mpe+eNt/X2FLIkCbkaxiw3qtoOAbldLuL0zkXkOsQnlfWp2EySqs
         dU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvPU8FSpJL6vomdakXFP0JIBTIocccxNqXkUiwLZfOI=;
        b=rReXjgvlAFdaovRilVFo+DbuxJB5iQHneJHdz7hBZTvoVYicU+UkwkOpnAgZjzfDhy
         ySENdwBQuCm2tLCjnRCDsrjHzU+p1K6Ano7pA9RSqAW6+KMvWEzHRD9h3izxoVOlCfe2
         SW6H0lJPxUBTeRv6KbUqWqsYjG5l5PG567tyHphz5UfPBjnDnnqEAmtISCYs1uULUHXy
         Z+2DX2CAl4IMuzvs+QpJd43RK/NHiX21MNNbPhOej45QVfRcN7Y8HuKg3TBLlV6zTpEi
         92t302YeqtTSKrYfjAh7XDbcwPlzqo6BHWUSPO80DRlCY/itMinsNg53lHpQWf/dFw0y
         tAow==
X-Gm-Message-State: AOAM533AlCEk4o9mK4vW5A44flnv9+LRU9JAypAME6L3kpOJ7GjFZiHc
        3R7VIvhCi4e2JIzmYPUzbkJZmizLgNX11GxKqDYoXw==
X-Google-Smtp-Source: ABdhPJw8wP7XpfU8cUdBtC+cqCuUVz4x1NCpBf8cueselkwXXJLi0jQILeraFJCVVqHvxUUoAKOVK0N5Uuj1VeSbpSE=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr392955ljn.125.1589289599714;
 Tue, 12 May 2020 06:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200506101424.15691-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200506101424.15691-1-dafna.hirschfeld@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 15:19:48 +0200
Message-ID: <CACRpkda0cSqXLb0JaXvFY58rxkgStbCRC2QE9=CB8pMT6vA0GA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: return ENOMEM instead of EINVAL if
 allocation fails
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 6, 2020 at 12:14 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:

> The function rockchip_pinctrl_parse_dt returns -EINVAL if
> allocation fails. Change the return error to -ENOMEM
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Patch applied withe Heiko's review tag, thanks!

Yours,
Linus Walleij
