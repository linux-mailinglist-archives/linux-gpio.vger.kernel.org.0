Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAED2AFDFB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 15:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfIKNr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 09:47:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38813 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfIKNr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 09:47:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so19720426ljn.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nz4fH/KXhHqij+iKLC+4ZdFFxFYVPPUbmfkrz8PDltg=;
        b=DLyK/+ak64rFlOgLttB4Ar6+FvCSJvNmybyHgUL9jbUvEeVJP4xCwXQub9DeTUYgzQ
         oFIOh4cIsoZgefy7yGqAdOMhQftEPQhmqMAIc/qK/PsPNoiMlBtc+b+Epg4fgRQx8HTl
         tfLuyhv8liTJMMaYuFV7ooLfozyYVY410LYKBnZbnYS53wdNPyggQx/gc2ZGyFUOcPkB
         J28uSaE9cRbADj2qWANkWsow//32yG/JkSeOhgwrI4t8DNQnmXcjFkh2WSOJHEK6tKpH
         ACtkBTUtObT8s1TFO+my597cL5iP9sxoRJfZKL5yHwZmMI6pJGgoq3XPz9nRSZNG7h5V
         satA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nz4fH/KXhHqij+iKLC+4ZdFFxFYVPPUbmfkrz8PDltg=;
        b=TFyMxH/GwG+d3Gvcnee+9aZynAp54ycO2fUj1uukAxscYSAnpjS6LiSy4JWuzFX26H
         mCbEhffbd+29uj3S8Kz5HOECN65PqLDkTSraNUweIB7CJ8snLKNajYDwBNeLwXzlruMn
         1lMv4qWq7+Ed6Orne1BoLC31cK+jF9aLjvFSAUdU5r+aKeLN6qip3sqzqVvsdYKCmgPq
         cMD2qIhS6ET5e+nGML1mrEzu2266MVirykBgUEzw5rz0QSpjlQnpHoGzmaNpvqIATAgK
         pM8m4vjmbMAY/rW7tMJbUaEstKRV5dB8w3X3Sll4vqwVt3rzdTbiDMulo+NW/04ha1wT
         6vRw==
X-Gm-Message-State: APjAAAV4RXFctHpL+MRiv+zn043I3f0cbsv0m26OeYi42k3XqvbOEfSM
        6Fc1Sv9sAd1IJhJVJrlMF0NnvRs0Iason1kKh4orJA==
X-Google-Smtp-Source: APXvYqws7ORqRB75L0oY4eDnjG2Wm//MH3lyQsM0QYHLeySy7D/AoJBKfHnVdu6FeiCtY6iZ+Z68Vtiu33mFOJqqeOI=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr16276037ljc.28.1568209645791;
 Wed, 11 Sep 2019 06:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be> <20190906084539.21838-4-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:47:14 +0100
Message-ID: <CACRpkdZYbEhyGGoo9P=cnjd8Z+oDLUgqAYhKDeuqtZjspw7sSw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: of: Switch to EXPORT_SYMBOL_GPL()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 9:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> All exported functions provide genuine Linux-specific functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
