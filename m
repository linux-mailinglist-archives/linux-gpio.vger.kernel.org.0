Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5654F32AD14
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378869AbhCBVWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448837AbhCBPnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:43:15 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F13C0617AB
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:40:34 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id m11so23624273lji.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JoOi1VQKYJA6ZW+eLQKjH4JJ8KX9VGExJXoWL2AhruY=;
        b=GYvzW/XasiKnxPmuWkbAzZbF5LKRI17d2RmV7gJqNx/LMDjfElx3+drTy5Ok9hoHwJ
         0NdMg3c5pkaBawgYqv6MiudwMsaPEa17nwXwWPm67zE7MgW9sp3OGNwagru7DWgr8Z1E
         QKyBxi71GaLJJ5dmGVyH52upR2fhfFaHdZWOXFNUf9AXub1NrEw4nfuDMZ/E6Ubu6GE2
         /bQwOW20cMAhYMK0ww++42kk2FyzfETKTs8hsjPzPJiBUlAkMz3QbkFjm4UItoI/Ztxb
         iWYfvthYa7VvqqgLM7olobJRHXXHIrzjUn10qclu/BiLjm9NEXk0zAYLhW6ejOR7PK3f
         Wr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JoOi1VQKYJA6ZW+eLQKjH4JJ8KX9VGExJXoWL2AhruY=;
        b=tAVhU0DsHvtx44rNAy/wrh/A5kRAhIApYg8xyNOMf+H/Q7SUIl8JD4/CTYRPFG2hez
         c9cJSbB/3E+Ofgxok2z/Oed+Hx4X0hUVZVs/jhbcNwlbiKBOR3XkEojPONVpBArNuSUN
         Sa9VS/ttwzHgxyWH776+VJHDO8cAH5V1IHu2KEJ1LAP6X/gBhrFn2/ryhgAKzAtK7h1v
         0cmguOv4ga6LjIQRMIu9p4vpyvYajFYGgAnqFmxSBlmunDubNbK+3a3i1kQySYj/yWaQ
         xrzvE/tpjqOkPSIK41gc2WtO4uIh4Ljd32lhHkBxAJAeNRtmyRG9xCKd+pD1ADxjtlrx
         zULQ==
X-Gm-Message-State: AOAM530tlOmSuhQ2YNP39TqF4DWUOkiOYvDldOJ47O3Qz79VMF2TA2hf
        em2qdBUQRm5ahCEAflN4hJLSUCvaMJZS+HMva75V5Ck/vozyUA==
X-Google-Smtp-Source: ABdhPJxAF/jrM1Av5GDPesEvuTwFJDWud8eBzIJ9ciWNFS4BX/hg//rj+YkivMg+oKgMEexukt6ngmz5XGZ+SjvYNHU=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr12521528ljc.368.1614699633208;
 Tue, 02 Mar 2021 07:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20210301090519.26192-1-johan@kernel.org> <20210301090519.26192-2-johan@kernel.org>
In-Reply-To: <20210301090519.26192-2-johan@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:40:22 +0100
Message-ID: <CACRpkdaif9UJ2SwyMFuYXB6U2b2ikT8QtCy9Se9zfswLkaJNkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: fix NULL-deref-on-deregistration regression
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 10:05 AM Johan Hovold <johan@kernel.org> wrote:

> Fix a NULL-pointer deference when deregistering the gpio character
> device that was introduced by the recent stub-driver hack. When the new
> "driver" is unbound as part of deregistration, driver core clears the
> driver-data pointer which is used to retrieve the struct gpio_device in
> its release callback.
>
> Fix this by using container_of() in the release callback as should have
> been done all along.
>
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
> Signed-off-by: Johan Hovold <johan@kernel.org>

Oh nice catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
