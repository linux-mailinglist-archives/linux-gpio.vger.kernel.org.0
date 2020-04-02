Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C89A19BC5F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387476AbgDBHRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:17:04 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40994 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgDBHRE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 03:17:04 -0400
Received: by mail-lf1-f68.google.com with SMTP id z23so1822393lfh.8
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fGCNVs5ms+lfI0CqvvFzJ8SjCEm1mygHViFV+/PrmR4=;
        b=qF6WMmu+6KzQwDt4TcfDAG/fnQND28dHhorj99K8/ZgLslOE0pB8tqgeQapcvDAlpV
         IW4ggkMHsjFymJWUzMRxbaqZhCDh0ScHLhoqc/Cqpd4L9rNp6UZ0EgcuuvZY78y//6WO
         DCGEyYiNuOZPnJZJrUC5nVWf6uF6q1Yf3zYAO2m2Obk/cd+ig7feCpRIcg8oI28jQunm
         4yCKjlRWf9UKUeXtUwUz6a0qulYEH9q0fDP5W1GA/Vc3oMnIZo21r8SL3fS6MIUOfqu9
         NuYt0xfKQoCkt0cAPPMo/rr5jcZL4aXHoVSJWIUsxWePAh4iYu/t3eI5vZCZ8GDlE8ex
         duuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fGCNVs5ms+lfI0CqvvFzJ8SjCEm1mygHViFV+/PrmR4=;
        b=iKPHJfiMA/ZOyV4Gsf6WV2uV5gGC1kzTcqHxmZFuP7rtchpCjiNpC7+ABhcx881/ME
         Gt5czmAZKHRlZuLRcm++5p3IGIP36tabOvbubNt7ngUAYpfIEJ0R878XfO4fwaa+Cdlz
         dMaEJSC9EeNhkVYFfU+fHKm9ZNN0iR1zRjJzs7q0DoDwYIQ+b5uRPWmEIOBVSAphGXnk
         MY5eh+fcJIimfyPVn7VHLBzddVoxSBqhSIzQ1FjZ7fq9BP+ebnvbUkZ1Icu3a1yXKXtp
         GBWgOYfpYcJmd4LP1ExITan6SXqKiHd1eAWjfgRxx5K9cFA1+XG8UWlXxACzdmk3AiDu
         I3qw==
X-Gm-Message-State: AGi0PuZsSjPkGYtSFp3ymG1TeaEVlMAoREUdf7F5aawiKdF59Q5pdbZv
        lzummSdYuXvAE8r+iA4lITxNDtnqdSLWiYLBZKqt4g==
X-Google-Smtp-Source: APiQypIKx3lN+NN6JUHXlyLWDQZ6Blqq6gPdb0V+mmQsewb2jzU0GTc0KYjU3uhwIdwbNat6G+7QnOFTaAbutVtTvkM=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr1232471lfe.47.1585811821663;
 Thu, 02 Apr 2020 00:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200401200527.2982450-1-thierry.reding@gmail.com>
In-Reply-To: <20200401200527.2982450-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Apr 2020 09:16:49 +0200
Message-ID: <CACRpkdZQ=S003MqmTKSD7QTp=j7NJ6xVyGbqkDyEoARW6+O54Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: Unconditionally assign .request()/.free()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 1, 2020 at 10:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The gpiochip_generic_request() and gpiochip_generic_free() functions can
> now deal properly with chips that don't have any pin-ranges defined, so
> they can be assigned unconditionally.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
