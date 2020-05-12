Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4481CF370
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 13:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgELLgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 07:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729568AbgELLgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2020 07:36:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09972C061A0E
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 04:36:14 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id r17so7224552lff.9
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oXz/yNpIRm2hDyqmY4LrwoICA7tFRRtqLeIZr1n4hgQ=;
        b=fM1y7ppAF8YttAacroZbaXlkzyGSPLl+OgOaC5PI80aAlq//szCR6WCR+YmEseJHeM
         RCovVooARtxTCuzJxE78pnLkF+rxy+KN66YghG//4UH7qw/lwT+jw8WAD+e1AWN9zLH3
         4/QAM4K0LeAubfe6R6CvOYaR6KEh2FpZyZa/bSvfNA1T0j6wB4RR9mhr/yPym1VeLjaB
         h29YNU2KunEbvBtnCIPwL62rA5gAq4lVMz3dQ5RwApP2OP5utjmpcGTqCxIFo6DRc3sV
         qiqUsFfo4/dl+0q7sToUqEE+EPzz7qT1/LCzAY9MjPRlmZCzc3FN8v+PG4RQAy1phDxU
         9N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oXz/yNpIRm2hDyqmY4LrwoICA7tFRRtqLeIZr1n4hgQ=;
        b=Oqx6VEOHQZHBbYrdaZKSRYEdW2W01CoOwu9HY5OjB2jtjdrDxShYlROqWcvDyKGaeV
         i6GazoN1GYpteOSUKx+SJqvq9ZczoVQEIneGRlWflmRWChdzVVfVtz2rFwQSHt/OBSc4
         Mdap9lsECSDv3YgDgrj/KAfN3Hoo/xaYeD/7gUchS8K/0K52hGqkUQbd2Y+/7zPD32bO
         0+BmoOqLy0z3hJ09yohWbYq4YE8vHUlu2TVMxU5j4f/Bq5+diuJJ/ElcqspfL4yjKyUg
         5VEkNQjO8MN0l1zCVw+rTD/6mKbGbwohqDK2mfRbN0ODfO1LaetCuGZpMGxcvUToM5zF
         JHhQ==
X-Gm-Message-State: AOAM531VRS2aVKJbMvhjFrq3jC4W0WRfjqdrzVWNyxP/zGC02ZHSqxos
        FsCjh4YU5UOYAPVNxspCfOskPsrA2lpLITj0esNj6A==
X-Google-Smtp-Source: ABdhPJzU/NpqzyTWWkbOeLhtKKqfDcF5gMlrXxanCv0l4ELQ+8+totfdERv7xwcOZhjDKhUfZqv4J22pNOhf8IEToTg=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr13910730lfg.217.1589283372423;
 Tue, 12 May 2020 04:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200425203813.6442-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200425203813.6442-1-rikard.falkeborn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 13:36:01 +0200
Message-ID: <CACRpkdY0D7sfOW-pvkH1ZeF1O06+TERyO45cc=vrYAN-=kTR1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rk805: Constify rk805_gpio_cfgs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Jianhong Chen <chenjh@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 25, 2020 at 10:38 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> Mark pin_cfg as const, allowing the compiler to put the struct in
> .rodata instead of .data.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Patch applied.

Yours,
Linus Walleij
