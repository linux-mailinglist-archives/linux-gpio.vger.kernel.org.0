Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 216C9CD233
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 16:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJFOLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 10:11:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33403 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfJFOLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 10:11:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so6995426pfl.0;
        Sun, 06 Oct 2019 07:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CC9KVA0zIM+Q1TshWA+BJK6ppT/MaKoRfm3TQLmliFY=;
        b=pFMnIdCqeL2356sDmaUldFSpLnt+OzX8ly+GSOfmJSpfiiVEoMbmVz0nyF5QqHyRZs
         2mBbHSqn8mOVXUvjTtRbhMOSgEtP8UVJ95p1l20R6TcowZc4Dr4FZ7xT/kA6il62ex6v
         kNpMrCKVAMWqVe3+KyBvRnUHyuHQGbIQfe/a3SvwGPzGVrKw3EV5L6FTLcpcGhjlpIRu
         maxalMtJcx8d+5/Y2Ax7IeLOQIkQLmD6bvNboWZQ1dxkVX005flzCitvPGFqBdQfAL8u
         msy0kCIEzvskenLbFaAMCzVy/X+PK3W0QyQWOgHmyQM9W1hCMOX/WkUapoxz9Zmsv02h
         uy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CC9KVA0zIM+Q1TshWA+BJK6ppT/MaKoRfm3TQLmliFY=;
        b=Aj6CJ96VyXA+UG7tqeyLxhJC+m0PcbcAL56qmQcuwfaSgXd/QPm5NVFWp7EGQTayDd
         HW3mB5MMl38micFWIXhXo8CheLGGvL0TDhr6NyGt5TLAyoMo6sG0hvb9XO7crCm+2IH/
         T/2Z63fmZgtwWAdWEAaC5wHw8ERWah97cDprci0iDl57+AZAeAYByUDPAgjWGcyZl3mf
         y/WlohO6Fv4HAN1JrFm0zAHMNZwf3cAQ4unnayURh2AugMAb2BiTNlu0Ef2VRJmu/TjG
         gjPeyvsj0fzyyKaHDMZAzv6kBS7Y65oHnpwogy4Yt47eUSjtPOdu8FXkMs3/LtuiwPzk
         lBhw==
X-Gm-Message-State: APjAAAV9WXyftoJnxQIUmnYJiRVO2XtNNrwU8Hu2UZxcn12P9nj0dtkx
        WonH5nkO/MR2lX6TlUyLsN8Jl/wxnQdN3DGXeDZOrqjJ
X-Google-Smtp-Source: APXvYqyF5eelmbMsx7TTdIhk1ay8X6cYpBxrsUNV+mexLe1qBP/eTUD7tFbFQsb9kumhBdRvxaEYNMVtTY/dTmPRRHk=
X-Received: by 2002:a17:90a:8986:: with SMTP id v6mr28668044pjn.115.1570371114847;
 Sun, 06 Oct 2019 07:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
 <96ac332f-359f-531a-7890-45b39e168b82@gmail.com> <CAC5umyggUm26JHU9QeND=rTozjXwH5uMiVvoK=Zqo31eBn69pg@mail.gmail.com>
 <7d451092-bf8a-e1d4-996c-8af3cc816fc7@gmail.com>
In-Reply-To: <7d451092-bf8a-e1d4-996c-8af3cc816fc7@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sun, 6 Oct 2019 23:11:43 +0900
Message-ID: <CAC5umyiK8LBqQ1B1LPQgWXGCk_a+JyKgidrRZpPMDu+NZncDXw@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2019=E5=B9=B410=E6=9C=886=E6=97=A5(=E6=97=A5) 4:17 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> On 10/5/19 3:20 PM, Akinobu Mita wrote:
> > 2019=E5=B9=B410=E6=9C=885=E6=97=A5(=E5=9C=9F) 6:17 Jacek Anaszewski <ja=
cek.anaszewski@gmail.com>:
> >>
> >> Hi Akinobu,
> >>
> >> Why do you think this change is needed? Does it solve
> >> some use case for you?
> >
> > It can be useful when using with an LED trigger that could set the
> > brightness values other than LED_FULL or LED_OFF.
> >
> > The LED CPU trigger for all CPUs (not per CPU) sets the brightness valu=
e
> > depending on the number of active CPUs.  We can define the multi bright=
ness
> > level gpio LED with fewer number of GPIO LEDs than the total number of
> > CPUs, and the LEDs can be viewed as a level meter.
>
> Can't you achieve exactly the same effect by creating separate LED class
> device for each GPIO LED and registering each of them for separate cpuN
> trigger?

If there are GPIO LEDs as many as the total number of CPUs, we can.
However, if there are only two GPIO LEDs and six CPUs, we can only know
the CPU activity for two CPUs out of six CPUs with cpuN trigger.
So it's different from using cpu (all) trigger with multi level (2-level)
brightness GPIO LED.
