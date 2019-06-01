Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC153203B
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFARtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:49:04 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39553 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFARtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:49:04 -0400
Received: by mail-lf1-f67.google.com with SMTP id p24so3989833lfo.6
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo0+ueJv/aJTWlBAJydFHhGp+OjN3tsRRuz9/0epPIQ=;
        b=p7slmxGplfKpVqpg89DZmqNY3zX6aMXgXEo6pld3GgkCVTWHjXat8Tr+EZnVJkmFXz
         bPgHceCmVhDyK5x4b2UE+eD1/W+0btWiQY27OG9oaq/G8l4z810BzhjOWHGyqfXb893M
         ARJdFlMGmfx/Br2/XtGGTcgfFL5mQ5WLZOQoJhbKE1dUwbNCP59V9bhuASndyUYnNhwa
         8eZCBFRZKLbwaaAGjVlo2bxxwSKoF1I0l5QTiMyBvj22JjjK6DYS9VgjnlFDjF9SoE50
         r3DoXN5xt6scKG6FaHR0mNpgVIxbQMdkaih0jqN6iNgUKtRV1Ws8xgRy+Osjeik4K+vi
         jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo0+ueJv/aJTWlBAJydFHhGp+OjN3tsRRuz9/0epPIQ=;
        b=XpEOu37aD/r9XiNgrSPoODmQtSFZer42VB/WbxI9Zv8e5btX2EDpB9gF6IJuxKMPcp
         Qz7ZmuZChqtGF4MNp71it9wpEe9Vu3+TE+Di78jwYel3wfhjjGkPwbHctuJlHkefK7b8
         3iyiYWDkGU6WTUSxmQJjt0iLKlbCu/exM7iRZ4fIIXTRRlGLQnUIslWLngH8FxeqBOoq
         tAvxStVSCMRUY9tuU0LK3DZhtv9cZEBEBvuxIkjiS5+yQTTj76y3eVTm3zSkiRLgwjNf
         Ig8GysI0bLrLnc6snfRiE/lfdDL9cVdiZZvm9xj5tyfLvCRnTqLwuEbIhLhvOw5KGqKe
         yINw==
X-Gm-Message-State: APjAAAXpJse2io/FUqJ2GpC2JL1eqaM64UwNI0a1rNUwHa6PE+nASwNC
        H0vcP2Pq1hi05bsyK7E84WC59JV0NkeSRDA93yA707JI
X-Google-Smtp-Source: APXvYqwv0jWGV4BMtWQTcGLMEUlFaSUlJ/eW4uXxjl+y7Xj0xYXGg60k+K2V2O1AZftPbLrmQ9hmGHJI7cqMILC9PpQ=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr9147805lfc.60.1559411342738;
 Sat, 01 Jun 2019 10:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be> <20190527124051.7615-3-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:48:51 +0200
Message-ID: <CACRpkdbsfm-CU41Gj1b6-WhZBgkBDjtOUn8=W1YXe5p0EG=RAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: em: Return early on error in em_gio_probe()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 2:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> em_gio_probe() uses managed initializations for everything but creating
> the IRQ domain.  Hence in most failure cases, no cleanup needs to be
> performed at all.
>
> Make this clearer for the casual reviewer by returning early, instead of
> jumping to an out-of-sight label.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
