Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8ED020751E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390898AbgFXOA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389484AbgFXOAz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:00:55 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD098C061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:00:54 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id a14so1064379qvq.6
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IHUFmFa+PERILwSWl+mXNut/vkPHclyZKqXAUx/99u4=;
        b=vUXMPXXq8Zw5TkXeHV4MZ7HPDHkvugAyM9PvNdF5sQ0X9X/y5xDdWI0eOuPqS9MLRn
         CLyTd3RTJJNfD4ec/t+xppt3SM7P8qheiP/tZ+l+UuSAT84i4lRyFqJfXzMHRxi9yLZx
         TL+WEvKnvzFFvzHsiJ3ttZaNdkHPMx6wwlC9ZmOT+DExbI4IKVdGCBvgNw0CE7Df9Urb
         fsKb4LetTAWs0d6WH6QufVofUMmr61BnGKBY3PbwlSdEEMY8OuMN7bEWxCd0INJH3zs3
         8kXkqXAjOZEoggqsXGkYBXFf/TFyobF1d76m++X/tO2QWZogFrKqMq1S8uI1P3/XZOpc
         ymcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IHUFmFa+PERILwSWl+mXNut/vkPHclyZKqXAUx/99u4=;
        b=HUoQuOAl1RyGHUwqsv71fwI1KvIWw7a9oUJSi3P5gGudNa7GeOFZsAd+a9k53a8Uvj
         Qx8KIPmbBZiIgSC/BQKoAeBUVm0EwPvPGexat5SXRBgc0t+ya1DdkxdbdyYOp/GGtkdl
         p/tkR96O8IK/ieBYgqgPGjHH4kg/guZKyyhiuQJc7rghUtnU/wWGLgVHtfHyRqida/jc
         Z3PoY8QXa6R8gg9kxDjbvfDNRWgrv1Wl6/GOAmgU994qV10jb79lq+6yXUYtbwPvH+Kq
         c6E2ly/062hggjMFRSK5GBCYq5tyIauXVSAxT96pFgpoWu2Xl87YwyUiYjrs9VDASut3
         1egQ==
X-Gm-Message-State: AOAM531AB7UQN7oGMkSYdOZJftRIqa6h3WckDwNTAKqz9ZX5EEi08jmt
        RSNytwu1hOE+1YEGYd/X/TRsCHbeg1nyO9NZ7uedjw==
X-Google-Smtp-Source: ABdhPJwc+N7OLcgF2n6s7AYzvFq1sI6X0oMw7s/cuElNqvpPqyRyd7bBZnFfZ22kg8kVyDwekNyPWQtA2v0Bw1QGcu8=
X-Received: by 2002:ad4:55b4:: with SMTP id f20mr30749529qvx.148.1593007253628;
 Wed, 24 Jun 2020 07:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-9-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-9-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:00:42 +0200
Message-ID: <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com>
Subject: Re: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp handshake
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Reset the timestamp field to 0 after using it in lineevent_irq_thread.
>
> The timestamp is set by lineevent_irq_handler and is tested by
> lineevent_irq_thread to determine if it is called from a nested theaded
> interrupt.
> lineevent_irq_thread is assuming that the nested, or otherwise, status
> of the IRQ is static, i.e. it is either always nested or never nested.
> This change removes that assumption, resetting the timestamp so it can
> be re-used to determine the nested state of subsequent interrupts.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

This change makes sense to me but I'm having a hard time processing
the explanation. If we're requesting the interrupt and allocating the
lineevent state in the same function - how can we run into a situation
here the status of the irq would change like what you describe?

Bart
