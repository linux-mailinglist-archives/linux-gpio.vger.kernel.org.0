Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924F2EFB0B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388230AbfKEK0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:26:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35655 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEK0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:26:33 -0500
Received: by mail-lj1-f195.google.com with SMTP id r7so12481487ljg.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLvUPtvtHKjgemXlXrBT42+PdbyBvxn4T43Za3BsRPg=;
        b=p9q2QPI/mv3KLNsbCeaP7eraT0yNcrVmfyIlo2F4Gir5b+tgxtrZRkXRnraOfhmwB8
         pkC2Z4rRM0fz0ItRoA2f8qcBBDasA1q6LUMYifLr0Q3n4Ajjz66Z5nNLrEduqrRejg3I
         do26cwXRXrTTdb6JGSqHTCSUcj2y26CzdTx6VJrhIf0igHSPef0kCOAH60UT2Hrv/h+M
         GiZncqRDgnYe4RfG3h4o8jwBprMFCmPU0dlwVtUV3ngXf6phWor0CaughaVFPGvljoAU
         sbas0KelWyykvYFL4rVWkqc6ll0GC2jWEjgnEVQu6MrZYtlcMxMzmz0xrUjhSBMAFA3l
         Pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLvUPtvtHKjgemXlXrBT42+PdbyBvxn4T43Za3BsRPg=;
        b=Gdee2Qa6k1WNbijSt766QI2JtcZQHDsZk1IbBOi4trWb4vZb8kQD5CAho17uIMzhPk
         vh/OoSSpze7YxO8ahTxIws3qCZmVptTcCdT5xwXu5daglxlERqoec5xxaaUPQSnvf7rb
         1ou1F3eWf7XkGqG+mmdI/9KAK/YhpZbqceZNgKBTPxNIsOzF1QSPikFaa7que2mQQlo/
         TfX2fo/u+Z/0EnylMzw7BMAutEzHR0POJ3C8oQ1Tatc/3nd+DjsDzpoEKgZM3Xiqp+DF
         gGKBr2ktpuuDUvw/jS5QmEXE6cCsiRq5SAQU6tYTD49ohWsWuETgc/j36NzNZZeJVYoT
         3i+w==
X-Gm-Message-State: APjAAAUaI4Jr+oFFNL2CmTbmnb60pq1tz4jhhRoZuwfAC1+qxNbi6e7T
        ULYMU1YsPO+mnCeiBzo84aKE2FJti5yReebDZGN7Vg==
X-Google-Smtp-Source: APXvYqwTPyIvvf4EpYlsgAh9Pr1HrUwypabBqniAQygRTuy+8l+ZH6hqZnQRH1n46KGAIJN8WYMpN9pGk953D0hCvhE=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr22795513ljm.77.1572949591253;
 Tue, 05 Nov 2019 02:26:31 -0800 (PST)
MIME-Version: 1.0
References: <29421e7720443a2454830963186f00583c76ce1e.1572588550.git.lijiazi@xiaomi.com>
In-Reply-To: <29421e7720443a2454830963186f00583c76ce1e.1572588550.git.lijiazi@xiaomi.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 11:26:19 +0100
Message-ID: <CACRpkdbG5biQFxZJGMfNREfTXFLXEGUuQdUGL2js_RVEGngKyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: just return if no valid maps
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     lijiazi <lijiazi@xiaomi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 1, 2019 at 12:44 PM lijiazi <jqqlijiazi@gmail.com> wrote:

> If there is a problem with a pinctrl node of a device,
> for example, config child node do not have prop specified in
> dt_params, num_maps maybe 0. On this condition, no need remember
> this map.
>
> Signed-off-by: lijiazi <lijiazi@xiaomi.com>

Good find. Patch applied! (I tweaked the text a bit.)

Yours,
Linus Walleij
