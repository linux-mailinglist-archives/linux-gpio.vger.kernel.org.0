Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8729F15A6F6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 11:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgBLKtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 05:49:20 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44881 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgBLKtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 05:49:19 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so1237686lfa.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N0TeS2zfvRk35tG8WU847z+I2PJ7ZIUmWpoNJniHHpk=;
        b=uTT6SXhPQOATzbU2laTg5XgknbfixaAFUhPiS5Db1hVmRYSGlw6QFiK15m46cn64ug
         rhNQod9kPXcalmENQQJZxQQxdbMhfFx60l3Z/P9Q5LeLrffqXHSF5CwrdSxi1Yx1G4UM
         iu4+3qs92C3FKHCGjDFAMnItO7ubJJyaP6LXkLrs28tXwk3N2+O/vSpC0Avq88muQ2Hq
         eAY6sYdWobiaJaQfmu5htD14aDZ7H93f8YWAfOEvs0dS/JJRVMqIsFM1TO+39/n61PD+
         hn/dz8gxd1H3a9mmvjlhgqpAuOhN3KpxW86G+ne2j6ooctn5ziZ6/U00BgEfOpx72R0S
         fB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0TeS2zfvRk35tG8WU847z+I2PJ7ZIUmWpoNJniHHpk=;
        b=SXzLJ0TZW0Gf7Jy8OZwrfpB3MkvXq9jQxL1jEJi8KmSGaliVLsdYTlZJeuv96SU8T4
         ttiteeGNEa3prEJ3wQSVmumofMyKpcDYKhRd3JfmneA2HeHlB3DTLGK3Asoqrf5aFVUk
         6sOk1Gy4kCII869OdsNHBP4nJMVZ5aCRBJNyMHCB2W9l+mY3HRv1tIFVXj8sqaoqSiM1
         K2NtF3yNgvSVaVSvKW01H90MXRZYlvHbQfMzFUe2yc1vh1td+GnsEV6JUDAiVYflm0do
         ry1BOTZcLoobTe4Ccwdq43o8WMv+RfWuizyPkf3IrMWJ/dXKxW8oEZXmeq63k93aLtAc
         rqsA==
X-Gm-Message-State: APjAAAUO6gCjFQWXjKeGo8jlO/cKhR/WiWAjFoJ5kD02fyN/YfVque3k
        IIqeJ7a5Hxk98DWL4HAp4KWAdhskOTbp3hxhwGnOYw==
X-Google-Smtp-Source: APXvYqz2rRuaqT3tJiOfxESNRIkjs6Uc7SYMQNr2EDOW/VHVelbskwwm6KbE431dhr+gJ1Ygk840ZhCa1gAddAh84a8=
X-Received: by 2002:a19:850a:: with SMTP id h10mr6420997lfd.89.1581504556953;
 Wed, 12 Feb 2020 02:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl>
In-Reply-To: <20200211091937.29558-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Feb 2020 11:49:05 +0100
Message-ID: <CACRpkdZoRUzhPW+WbhV7RKt6x4zj=ihcM5Vm1JUgXiHiW2+ySQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 0/7] gpiolib: add an ioctl() for monitoring line
 status changes
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

I'm very happy with this version and any remaining nits can surely
be ironed out in-tree.

Since we have ACKs from the kfifo maintainer, can you send me a
pull request for this so we get it into -next early?

Yours,
Linus Walleij
