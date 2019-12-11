Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 564EE11A01B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 01:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfLKAkH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 19:40:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33300 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfLKAkH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 19:40:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id 21so22012362ljr.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+6mwPhn94U0FJCp8N/iLCGyoYPPPkFesQi/ZLGlNabg=;
        b=DzWEDMV6zFCN5CPxuB98wPU/lUNXV9fCtKG8vCaJDjqrBnuzhjUaeFZ1+la3wXQNbZ
         8/1piJtHwCYSk/iJH2vOcrQprWHzccO/cVI8fc6j9HT3nMHYJPMp50W2ZbayjxlZafpm
         OEJRafmYkmHflbQUtOlcyMahRvYz91/Hf3goXN6Zz+WIFvhQesbfOgF9knBF8WlES3+4
         fSxUmiSMjXRfs+mEUZbI+ocT2kGtWBHBQ/Q7pfc/glkE9HXO7uVV1HvthjvSH71AzryA
         0t0LBbJSLwDUNu6noDycU/vAunTwuYiBsh7EDK/8nri5y9zn1jgRN8DduJjuRD3zSQA6
         fmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+6mwPhn94U0FJCp8N/iLCGyoYPPPkFesQi/ZLGlNabg=;
        b=CEgIslyMAe5rf1EZawMn2nJkuwG9tzfGOpHauR/GdTPgqAgQESzhRzhQT4PNgT1d1p
         t7nIn48iFQoJhPYZC6UVWjQxAvHpXTeHLqG7o06XNSI8piP2b6cLIbyjkvg6KdGnOl3A
         2gcVTzxboz04Q3LAGekS9A6F4MQE1bR8YIvr2PvcmNwuoz/zCU1Zha42rSRZgscqh67H
         VGFTs3qLaPnQDic7zMUgPIm6jBHql6bGXuLG5s9ZxbLUtzdoxdT+5TGQd0TH+lVPhEsD
         GUp9dKgFUBSZpOkQl96859Aj6ngWbIqB/Jxnr3SLt58fF03kslVV0DzWRB6R6t1J5joh
         H58Q==
X-Gm-Message-State: APjAAAV2t8uMZgeEp+q3Pa3cSG5nnPGyoqOi4/EBd4uYy0HCqxhkWRjt
        dAOKD3+kHFdH0OFv7IEc9AH0/aDTIAn+bKnlqzLYCg==
X-Google-Smtp-Source: APXvYqz+5hSx8AyIO68PLEgCzJXxNiyGKQgrsukDLUqC8J76DV8xgyxi+ERIJqysr1OXhO0gL6QnXeuXk3A1jZ6O+EM=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr93491ljm.218.1576024805657;
 Tue, 10 Dec 2019 16:40:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575925023.git.mirq-linux@rere.qmqm.pl> <56d2568cd45a13c738e2804d04348566a8ee8d03.1575925023.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <56d2568cd45a13c738e2804d04348566a8ee8d03.1575925023.git.mirq-linux@rere.qmqm.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 01:39:54 +0100
Message-ID: <CACRpkdZ0mk2dWBnWh+mRmBy2t-ALONtvv23Hr-2o8LD8CPYtgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: add gpiod_toggle_active_low()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 9, 2019 at 10:09 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:

> Add possibility to toggle active-low flag of a gpio descriptor. This is
> useful for compatibility code, where defaults are inverted vs DT gpio
> flags or the active-low flag is taken from elsewhere.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Proliferating APIs isn't good but I think this is the lesser evil
given the mess there is in the MMC subsystem for this stuff.

Maybe I can make a second attempt to move all polarity
toggling back to gpiolib-of.c and remove the API after this
has landed, hehe ;)

Yours,
Linus Walleij
