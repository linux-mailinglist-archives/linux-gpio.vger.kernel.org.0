Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6E311D0F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbfLLP0z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:26:55 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40886 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfLLP0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:26:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id s22so2732755ljs.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxtfVCy854UiCdW/Pd4nrn0GmF8wmwHJm0o9NwdBja4=;
        b=QM0qXmnLM6JznscH8Nk4M3SeXsM64afUcdaE+aLIFTnj9NVXBfzvucfz76HbVmio48
         v7xTCrDbpjbrr9DtuQppfYV7aL74zRG/SwpEgGw57m7hLXfkDtQu8KWdmqJSRu/nIjqb
         shpYNiZ0TW+IilCNkNeS0jbjl1Ag4M8ghAwcVAD8qmz36BcbGTB3qRsjWT77tg1ZJDXt
         Npa4efyci9fS/koXUMhhaZMYSMRHcd0dO3i/hCFyQTqkz6pO/ip7lCWZGaaHn9BA4bRj
         rNE5okjC8b5YTqMxvZsIGmrAR0Bc4K2ow8LmwAogwYpOwCOTCPlsEzL4URftnfL0mlvK
         pxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxtfVCy854UiCdW/Pd4nrn0GmF8wmwHJm0o9NwdBja4=;
        b=iXQ4uu2UrD3rVeYak9YL5sZGCFZIFodrwzOT7QrNX5cRvA7g0T4TO4eW/tCi80i2fF
         89SaK135qAosZuxO7Yu/qzcorpM+Y292uHGoxk+oKCoimBpFC9WYNIFoK8LfbcaijwXy
         fIsLW3Ms7M1vornRaBMrH77MGxxlz5CKFVhTEGKexIV0TyJ+MLwySxata9JncKRPGNtt
         wt5Mudg1xMW9vIzHS+QPa0GkNi/NvqzWNLPbGiO8dGeSZks70T64v9za+dKzTaCTH0rd
         fxka0maMnGslIQwZMbaAcFXqiHyL2R5QpADdw/ruotwtUd8Du39prtcApxS0XfyT4pzG
         oLSQ==
X-Gm-Message-State: APjAAAXs95diX0OqnXOLy8UQos+1YIq0LVMpy7joqK8rnioFk6wc2HAJ
        WNx2jGcM/v5InJOAN5UarjRfPMngKHpSTEazSW+6fw==
X-Google-Smtp-Source: APXvYqx+KpcrEMoHeICCBXZ45UEn0qf3Fzm8PCoh+PnixT+kWNR3k/NselgLwIuIleUjpqTTKNhQ4a/q/7YRTFP2LIs=
X-Received: by 2002:a2e:8544:: with SMTP id u4mr6132830ljj.191.1576164413346;
 Thu, 12 Dec 2019 07:26:53 -0800 (PST)
MIME-Version: 1.0
References: <20191129191023.2209-1-miquel.raynal@bootlin.com>
In-Reply-To: <20191129191023.2209-1-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 16:26:41 +0100
Message-ID: <CACRpkdZt25zK3WD9qZdJ=Aeq9YbcavJPVOX=kt8qWLdH1dHckA@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: pca953x: Add Maxim MAX7313 PWM support
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 29, 2019 at 8:10 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The MAX7313 chip is fully compatible with the PCA9535 on its basic
> functions but can also manage the intensity on each of its ports with
> PWM. Each output is independent and may be tuned with 16 values (4
> bits per output). The period is always 32kHz, only the duty-cycle may
> be changed. One can use any output as GPIO or PWM.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>
> Changes in v4:

I'm fine to merge this v4 if I get Thierry's ACK on it.

Yours,
Linus Walleij
