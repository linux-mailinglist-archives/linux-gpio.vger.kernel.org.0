Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE74B3E910B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbhHKMa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbhHKMaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:30:09 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8224C06119A
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:25:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id n6so4229021ljp.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zEH3nbdjRk3iKKEKjuiI8MahBqLUdJ0ANeHswehlAC4=;
        b=fryX8NC6y6XlhC7j8uc53VpWuPhaK1RvrhW4QxLCjceOa1J59cngm58Q5breUEAZbO
         OdlWLshstDrjt6UOfytqzUzuH9ayTdiWPqaDLgUlsUlCyZld1UlCCVRE0nBVaW4paNh6
         1a3FNJ14ZhQ8hNw03miW5hJUrtt3hETfd0HLclQFNJOttkWqXJ3IQJ2dZonNKhWThxNV
         s25hAQibOskooQ2GsZBsZ7KyVni2733OGYGblU+c4qNb68oeRVGM9Zmcpn+boaMC4754
         13X17tG6W+wmrmnj86w4abOEdedO5ZYDks6sohT3FniDvvsgkv/WrYVhuuAwaLgJG3Rb
         a1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zEH3nbdjRk3iKKEKjuiI8MahBqLUdJ0ANeHswehlAC4=;
        b=LIuHGR24yldJySqnwr4slJaiJTzPjCR7dj9QPkrubOPXVxhk3UIIh5fdeP7aIWWwpm
         Dpu9kQjPw7G7c0qQMWz8aMGWMFgNOZK6mBUUpi15F/DwWnR5bSREeofthZcCITUGsAb/
         YRD4asPwZMHh3axMK2wkclcNIYi6qBOSMwQq2ccnyVT828V9zW0LqYo0r35rvl7NBoU5
         CY2YXUvqo5EgzNoc+EOaiUAlRpNkcgXkc5geS4TPQmQN9zN0cqjXKDW7V9O4wK84yT4J
         Ow+GyvLb4ZMdTTZmEt+VyeDjzSn6inkT9JOMWALDfDX3pJ2K8QtU3ZIiAztEPNkCo/fN
         EjoA==
X-Gm-Message-State: AOAM533ld3jiaXJ3Go0yRQjle+TNZTYIgSxtI6yvRYi39skzhwipYH3q
        G7arf4j9BE2yuiURdJ2sB44/Vp55CL09Up/9H7j5UiWebQc=
X-Google-Smtp-Source: ABdhPJz/gGHq1zq1jYiqFyFHQT7Hh0KkvI1s2Ai88t2QU+nt6YVYNQmSr60cJpcwWEILkaeEmBjD5VELf9BFPZPEGi4=
X-Received: by 2002:a2e:9a4b:: with SMTP id k11mr12624317ljj.368.1628684730077;
 Wed, 11 Aug 2021 05:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628590591.git.viresh.kumar@linaro.org> <afc7b34cee856f1ed1a65034f4a9fe705dd04d6a.1628590591.git.viresh.kumar@linaro.org>
In-Reply-To: <afc7b34cee856f1ed1a65034f4a9fe705dd04d6a.1628590591.git.viresh.kumar@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:25:18 +0200
Message-ID: <CACRpkdajnPsD01ztx5xdVnR=cEK78KY+D169HXeDKuaOMS9qfQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10, 2021 at 12:25 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> This patch adds a new driver for Virtio based GPIO devices.
>
> This allows a guest VM running Linux to access GPIO lines provided by
> the host. It supports all basic operations, except interrupts for the
> GPIO lines.
>
> Based on the initial work posted by:
> "Enrico Weigelt, metux IT consult" <lkml@metux.net>.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

I see there is a dependency that needs to be fixed but
the driver looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
