Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497F239C9D5
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 18:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFEQ2r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 12:28:47 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:33496 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEQ2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 12:28:47 -0400
Received: by mail-lf1-f54.google.com with SMTP id t7so11634249lff.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Jun 2021 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrCDT9/BrFc5JTZQvS/vmJq/oRXt2DZtyVSWmdgwMSk=;
        b=NO+aHNUK9eeNAXYlgZh+KdSaJPd0/ddCUtczvY28depLkTGy6F3fT05tmVi3sw7ycH
         mmYh2Bm0ignR2mXzhBksbvf7IWCw2xPhxUDKmkjXKTn82/F7eM53hqh2AMHwnd5Gy46E
         gEB06bXm8YCNWp79uD48Qml1bYDafyzKoRGlWfvddfZF7QO7hyFf3ysWGfRSF3knwOa7
         udtK0E82puJ3rfpuNk/cdlQT3m1z17G6YOeGaI5TVniO182hHOKEhOlhfNgbjt6eLtvr
         SYO+A+5/hgcIh0sb4YSr1VHJKVPm3Y9FD+pV3Tld07I+yHuKa9ma52CuKb4FviJkbn7X
         QzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrCDT9/BrFc5JTZQvS/vmJq/oRXt2DZtyVSWmdgwMSk=;
        b=Pm/cAAfwZCxiYcsgP/j0Knj9IywhkL/NtW+W0f1POX6/vDclz3ME8gYwLW4Sowc2xH
         xg5s05dPOJZdwy8IdWIBVFwly0GPaf3Kqbb1P2ZBpBij2sex1WzY22+I4sAkEKz+CKQ0
         Pb2Z0XkTaSQumefD/Fi3EjHlx6bGvt48bP75YKEbQIQI9IE/HvVBzGyd5xMc08dYtCPg
         txUkfm8KBkKk/czz4vLlc9AYm1m15S63a9i/8eYQENzE0OwmKyKlG8koniPILec4vBrN
         rGPRM7bkxEW5g5hEz9dtbY2b7Efvs4SK0s6qcdgZtx4bF2gTrcw0zfvC0p8DlpFtePkf
         X2mw==
X-Gm-Message-State: AOAM5305S1yIBl7isGOZE6VSjppI/9Dc0dgPaGiGHjutMd/+IpkIC1IF
        yVyAnoiFTDftfEmmQnAWCdxC6zMX5OzKB3GZZ2eBpg==
X-Google-Smtp-Source: ABdhPJwWXh8YFjT5OUKlc/yT0+RpQOtLPrqc9AOXSBB/yaIWf+9GL/lva+Gj/FpKd1g/afqGfRV8xMUi4XrTt8covsg=
X-Received: by 2002:a19:c753:: with SMTP id x80mr6370090lff.586.1622910349250;
 Sat, 05 Jun 2021 09:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <ed02be4feb78dc86dbd17ddfa2e896d8dda7fa8d.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <ed02be4feb78dc86dbd17ddfa2e896d8dda7fa8d.1622898327.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 18:25:38 +0200
Message-ID: <CACRpkdYYioDfJFEGREhjxmT7YU5_3nrJR8wP3BAC4b=ihqVY5Q@mail.gmail.com>
Subject: Re: [PATCH 18/34] docs: driver-api: gpio: using-gpio.rst: avoid using
 ReSt :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 5, 2021 at 3:18 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
