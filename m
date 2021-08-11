Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3213E9125
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhHKMb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhHKMb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:31:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48BCC061385
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:28:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bn16so929093ljb.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5OlZ8oq6iOCdn4aMeG+EEph9Sb1Lla5I4LvuXvSK8A=;
        b=yxqhdCu/Qo68ddda8afkVdUuov6gTdX9x074yF+7r4kxHkkK2vFbEbiXB2Kl42komk
         uz5NPqfrnDYX3RbRLlnmXZODJDggmdPFMxMDSLwoD2l/HwkgDbE1gvy7STJCz+e65YtN
         z5xesgxo3uN8jH9rYn0Sob+2LRCkPlEIYS237Vz7rm8UqyQsV9NsHYVvmJqG1bjPQAMX
         zRStxZCtg5aGpGjtPDcYzmvw1ubJIwRv/tIDlskxY8flufvRcPbFDuYaVf3Con+7JPUe
         rOYO6dE9dJyA56ZEgtW0ecC8NkUjs+NlntX1f9Y4W60bbXOss6v4DpUWQ7CLJZgNXKct
         bixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5OlZ8oq6iOCdn4aMeG+EEph9Sb1Lla5I4LvuXvSK8A=;
        b=dOkuhj64YA5naM1Vn5qIZVvBq4UFCC/TWWipFQV9RW1TgMjiN7Zh5lwgv4aYhzIJkg
         1Jr5EzUwb4jeQfbzTWZPdSmgsFqGx1J7woXFWpQO8JZDThOKAACJWhSF3CxJNpMEN0RX
         P8q7S8h45Z3rgCoCJtm34/MvKfbpSKwG2ar7hYXa2gbVAvm60JkGXpyOv3plnbsXyB9h
         TneWlZ7g1eASWO/ZNlCI4eS3zRc4ONLmgfBcxP2SYIBGA4YuflF+2m76O8c5XeO6j4qb
         MvLdF3rijz+9OTZOGggOvwWcM+GR9zQO9V8PKEoxO0uPBEWxJU9w8X2MAc0/x8CJgXS3
         N00w==
X-Gm-Message-State: AOAM531BJkXBx8JJyPQw6pjALfzVzMWg4dnNX3PZyrR6V6xTIf4dgM6h
        lDcgRP5P+JrdU+pZysT0ylttQrT94pspifdpqfoufA==
X-Google-Smtp-Source: ABdhPJwR2jWpMR0T0owMZaLYzWcyHOEHETHN6xD7KLu7UfEpJk7ksIDK0sBzw2b6PX7p1HpG0zZox0yZRkt4VIF0sKA=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr12603890ljm.467.1628684898091;
 Wed, 11 Aug 2021 05:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628590591.git.viresh.kumar@linaro.org> <96223fb8143a4eaa9b183d376ff46e5cd8ef54b4.1628590591.git.viresh.kumar@linaro.org>
In-Reply-To: <96223fb8143a4eaa9b183d376ff46e5cd8ef54b4.1628590591.git.viresh.kumar@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:28:07 +0200
Message-ID: <CACRpkdbonnFd5xu=3_CdR=1QtxL0fDoWX-A16fTPMJypWsmcdw@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] gpio: virtio: Add IRQ support
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

> This patch adds IRQ support for the virtio GPIO driver. Note that this
> uses the irq_bus_lock/unlock() callbacks, since those operations over
> virtio may sleep. Also the notifications for the eventq are processed
> using a work item to allow sleep-able operations.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Looks good to me from a GPIO point of view:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
