Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C772AD8D6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgKJObg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgKJObg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:31:36 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF262C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:31:35 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id o24so8230779ljj.6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vPuQC/kpZ38anzcR4XBhtMFqVNAip7Kc8QT7E3OTrPM=;
        b=UFO30gNmb1IuSvSQ/yZ6H6xUZr16EjaijPHT24ZwQIrXgLg8juErJH4dydwjcNccFc
         zNumqyolrM8+25r2Y7ivqdtyp6wg7xUgnnAqE0tZ0M5I1JRetO5lC2EV5in+KmzDJ0/g
         31dmaboN1YpmcAdwMZ6WU8VpiyaXfHRkmHtyCRRlSr5yoC8g7ZH7l6jAMoqEVBYq5hyy
         fLWM2SvCKpiQIys/3u3RMKogj9IjOuPPtuzy5+hhjvfMCKcQWPcvsBZTjNkBnLj9rhP4
         6nFGvaD7mIxj8nLICvIZ55O+XdMdctaup1N3HN+cj3+wpjkUH3NFpYFDYPOgpUHIiZlp
         0Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vPuQC/kpZ38anzcR4XBhtMFqVNAip7Kc8QT7E3OTrPM=;
        b=HDPP6W3u2aZKBZX38zCWUp+3ooci1hlGQtcf6DKGRp/fJA+xU81egO/lOmapH62u/S
         wobGVSg0WKbq4tk4ynk5RekRnILhmavJuaAS0Ky7AuDnxbYkaDNqWnLlA1slL7tDupVc
         o+Q/h7tZ+AVK20j81dZPGc4U331hxpFOHkOH7ata6rvI4c2siwUFs0oAsl/JBGfH4a2W
         9xb2Q4HVe3PbstX/i+U19Bi/Ss1o/Lmm5OBnZSnu4UxVb7NO5399ZzTgUedHbBASrDMy
         f6QqzMKOQyBa/HDqKUxA6n5EjnXgwp1r/PWJsLXFPuvqxqqy4tqAW1vYDuXgMYBZlCT9
         Hu9g==
X-Gm-Message-State: AOAM531oFCuBVcbt/mUqvbWqmXfUDeMgsrDYoE0KjKOcsOCAaTA3+Aqo
        8zwDwMMJ9Z4gbxQF+mjczcAZP6eic89BW6P4Tp/UEpe65dQM+A==
X-Google-Smtp-Source: ABdhPJwk7kAYKypJmaeSPrf7+wL4AJ/I5fH6BOhfKS+z5zvrgNNXvLwiyd0ZUMnLUJnTlOfpKHIQGwjiRapQ1//GVJw=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr7990143lji.104.1605018694483;
 Tue, 10 Nov 2020 06:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com> <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
 <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
In-Reply-To: <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:31:23 +0100
Message-ID: <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:27 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> It may not be the best interface for regular end users to
> manipulate gpios, but it is definitely super useful for developers to do quick
> tests of their setup/drivers (which is what I did for my work with the Kendryte
> K210 RISC-V SoC support).

It is a bit discouraging that RISC-V, which was invented after we already
obsoleted the sysfs ABI, is deploying this for development and test.

We need to think about a similar facility for users which is less
damaging but fulfils the same needs. I think I saw something a while
back that looked promising and added some funky files in debugfs
in a hierarchical manner per-gpiochip instead. That is how debugfs
should be used.

Yours,
Linus Walleij
