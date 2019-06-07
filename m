Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3B3990D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfFGWkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:40:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46115 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfFGWkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:40:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id m15so3027211ljg.13
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2He8fM7kcXQfsornTR9w4EIW8ewTHe/YWrAox5h8fVA=;
        b=Y1wzQSw3xyLXOije8DwbtzUeT40ID/RB3K6j9lA9ycHeOawwFiOB2UGDToQY9iptd8
         qdB0PTbgAPUdAs5j6OGLikt0UDPGJVvwRx3MQrFm1sa/4ive4N+MZEH1ZdRZkWTj7jan
         Ea4lmsPTV1MmZvUaLuyQ+1N202QQE1+a5jt06n7dyjTuxVkLeGD862oU7Yv/bwPfI6Ek
         /0wcCoDdB4M+BU3QmL1/uR/m3vbdS1Xuj9DKutHK5+rObzRUXA/CJBp+n7yQU+Lsvz5R
         vbfHWFBswsWYELI4G8Akq5VXlkm870a6aSKiOWw2ejytuYdUkwWGVItwc6Dc/nd3xNkF
         S0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2He8fM7kcXQfsornTR9w4EIW8ewTHe/YWrAox5h8fVA=;
        b=XCw7jcXBVsOwQJL5j+CIQm8NvjB1ZXlKkR88aJJX4W4sbznY9G1wN7/JSA0U7HPVcL
         VV90Z1nUKDZtLxUohHvUcJvq6lA4VD/alpz0NBmpgSrMtYHxsPfN1dpf0I8yvAFvfDvn
         AKm4S8uMhIXhvn5AwC5UxdwOQUyTsZ8qEMa5yQ7mjlNdsyjF25OIAhqqbSwQ1qSPaJyH
         zp0UjGbuj9QwmR4nDQKAy2DGXJsF/ahgh/5a1pjxTqkUERcA4ADbM2ngoUKC5zA8UF54
         agH4O2YMM2qfLhySmAmV+yCqBfLYq3YHFQqU3IJB2sbcLo89HNvneQpt0myEZTQSmGmi
         OMVA==
X-Gm-Message-State: APjAAAWYxnUfxsvd3jE3UKN5silvABo0diPg66+qJt0tO1iw9bSi1pql
        TK/r2VsRGG14ImR1Ay2mWc/zXqM99zc70s56uFMxig==
X-Google-Smtp-Source: APXvYqx/VwNEsPm3ayxAU3renmpKyYQsiC7r4U3mSDqbHCSnM+jZ3lPRwPTRSWn4x0qqtNvr8hw2rES8YOA2GkaI/gY=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr23363303ljk.104.1559947203348;
 Fri, 07 Jun 2019 15:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190606095620.6211-1-j-keerthy@ti.com> <20190606095620.6211-2-j-keerthy@ti.com>
In-Reply-To: <20190606095620.6211-2-j-keerthy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:39:55 +0200
Message-ID: <CACRpkdY-yK3+uZvq1Xk7qJ2Nd7mgRkQ9C22AYO4AiZP5Cs719w@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH v2 1/4] dt-bindings: gpio: davinci: Add k3
 am654 compatible
To:     Keerthy <j-keerthy@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, ext Nishanth Menon <nm@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 6, 2019 at 11:55 AM Keerthy <j-keerthy@ti.com> wrote:

> The patch adds k3 am654 compatible, specific properties and
> an example.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied with the three others, so now all
GPIO changes are in tree.

Please funnel all the DTS changes through ARM SoC.

Yours,
Linus Walleij
