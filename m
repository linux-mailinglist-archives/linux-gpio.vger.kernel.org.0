Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689321A7F73
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 16:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389556AbgDNOTO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 10:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389449AbgDNOTD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2020 10:19:03 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B58C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 07:19:02 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id c63so13354589qke.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3EraRtfW5RLJEDi4lMBW11PhnefdSMnejhmHO2K18DU=;
        b=UcIb0PcdWiFibmHdGVpYwwWIzuY5kBjjoeQUiF4QHkWxHm/+d1NDgIlJTgKq0acvgc
         q22sdojzXgOovSTEjCTMI12brLIlZntbmMwHWvtb9Z5CoAjChvo6jK3zzV3bB2Fbye5S
         3uV2GKhljThlWre7zOLuafSsAeFcDimgVmf55hLxDXgv5DbX65yyi1cbUZaGXTjoSxzS
         aBf42Jt8J6/9lKIFIhXHMf4977lqnmbEP1ZxRbJeNICIJiKdfU1DF1wzI1SefbsaYS+C
         ExIdgm1vfcefLkQ0jAFQblATMmZUW3pK7j9qV9+t2hxzeOBG8LDNEdXVB8v8dgBpQSF/
         vVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3EraRtfW5RLJEDi4lMBW11PhnefdSMnejhmHO2K18DU=;
        b=KTcvYz43Kb0jwfmVoAjvnAUvWZHWY68c76wtoC2M98q/dJJjUqTw1LhJvtqlDaVZmH
         18p705CBElb3C9Qfrh0KI5EatGVxXmOBTrRxW5jT4/r0dMdrSYaSPO50jDV+v/lhLuCH
         DpgDIOm+VTQTJqElpw7Yh5gJ/RBBYCtks6VnaiCW4AyIr2kJ7RX+7XBZxrIGqUQflJuY
         aO00MjqcAXgB6sKXAlzHZGtrlBrhY5trorPOJHRDR5TFWv8nMEsSWUoXZxgu1uUvh3wk
         g+PuaWT/oxjyYlBp2ntLgfzJpMmbKNBbKCeYB2+OnQ9IG9xvfZlzqoOSFEXRTTUeh8J+
         E1BQ==
X-Gm-Message-State: AGi0Pua9sg9/6kY1wE8QNpe156jtIkO6eoV/3/okZBkPKMP0FRFJsy+b
        cbls9dz6DSGjzZeXg5pJ1k5mmR3IJCX/BnGQqJ7r6qIQ
X-Google-Smtp-Source: APiQypJ45n/aqPRRRlmXJ+LAlmliigwfL2fjEIEMVDsr+Acnlac4ie5oYjgyJ5a4H0HbKUrpS04udcBWMdnHrHvqZwo=
X-Received: by 2002:a05:620a:1259:: with SMTP id a25mr10285006qkl.323.1586873942074;
 Tue, 14 Apr 2020 07:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200406165115.25586-1-pthomas8589@gmail.com>
In-Reply-To: <20200406165115.25586-1-pthomas8589@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 14 Apr 2020 16:18:50 +0200
Message-ID: <CAMpxmJUUp5whscqBX2CU9--4zrh_+LUQOwVt1yUpffJQdPftkw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-pca953x, Add get_multiple function
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 6 kwi 2020 o 18:53 Paul Thomas <pthomas8589@gmail.com> napisa=C5=82(a=
):
>
> Implement a get_multiple function for gpio-pca953x. If a driver
> leaves get_multiple unimplemented then gpio_chip_get_multiple()
> in gpiolib.c takes care of it by calling chip->get() as needed.
> For i2c chips this is very inefficient. For example if you do an
> 8-bit read then instead of a single i2c transaction there are
> 8 transactions reading the same byte!
>
> This has been tested with max7312 chips on a 5.2 kernel.
>
> Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
> ---

Hi, this doesn't apply on top of current master. Can you rebase it on
top of v5.7-rc1 and resend?

Bart
