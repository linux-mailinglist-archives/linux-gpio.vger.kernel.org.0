Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 643F38CE36
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfHNITi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:19:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40514 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfHNITh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:19:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id e27so8843965ljb.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cwScbmtrmNuBR5G3wRFxtNr9QN4NohyZ8GWITq0x6hU=;
        b=V8M9wR7C9ozDvj5x/n1qmUeH2muGhaG1wzA7Zlb4kegU5t2aFJAYOl9EzRYfyMwp9D
         HNbTFdjH9tK9TSpgu+dHXVCBNHgXlGNvEEDdVGAPs1UCdYTf7mbbPQyCoXnDghD1KAEy
         9zfljzusxRi6Wcp6ofoQz0VCgFM9/8s2bu1RPdrRTWqGqlM2GsfaOQ3aQkz2ouwJ96A2
         oDd6QEFU7qdKXqwExWOQqrQY0uLl6TF+BgsoxXnWbLYVVON2faa1crApvkpo6KJJDH7M
         +Kzd5oslcbein27xy20a+2SiBZX32CXBAiDdJnLQHQc6qgdElJXCxtHW5hvSiNu5peeT
         g4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cwScbmtrmNuBR5G3wRFxtNr9QN4NohyZ8GWITq0x6hU=;
        b=aZGEos4cUr9IKBALBW0QWaiqDWF3ik2kPY0/I0zU6AqkBoG9M5NQXvKJ0Pj8UnTblE
         CnLhQNJXYSAv7jx3iovEkVxSh7uH/TReZrZHhXQW1pA1FxQrydSkxIXEKl/YAaLbLKjB
         BykYYwWDd+6ZpDmvdiRD1uEnyfOS4SBYVSXnfGUPgaVfHVpWgaVn/BN8QYAILkEqMrfy
         elY4LG1nYdLT8qJWARWdqMvNGQnsZ2aikviGo9dIfxQ04G5Rp0HgDWv0hj3hnxYhsmvn
         bUSSB6F/RGZKgt/hvfG8si0TTI8QkohlTzS7M7QnMQmcpuOSle8V2j+gbXH33sZQYug+
         gwoA==
X-Gm-Message-State: APjAAAV6l8f0KHtaUNVJYLu0X99YA70jUZjldqLQUS4W21+4g3l40KB+
        j2aG3A0aadI/Y9dnlUdRnx6drZvPbOimpcciDIHZOoMAYjo=
X-Google-Smtp-Source: APXvYqwSvcufDjugPxDTxi2pAbD528o/rMuXFqscn4JcI3VY4FGSnTAwIOtvyglnsPLl7NwT7jW2b/yFz3DrChqvFMM=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr7386596lja.180.1565770775501;
 Wed, 14 Aug 2019 01:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123242.5359-1-linus.walleij@linaro.org> <20190808123242.5359-3-linus.walleij@linaro.org>
In-Reply-To: <20190808123242.5359-3-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:19:24 +0200
Message-ID: <CACRpkdbB0etxmkB-jUG5dhW6rvQhm1wkudCE0-V1ZndX+yCO4Q@mail.gmail.com>
Subject: Re: [PATCH 3/6 v2] qcom: spmi-gpio: convert to hierarchical IRQ
 helpers in gpio core
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 2:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> From: Brian Masney <masneyb@onstation.org>
>
> Now that the GPIO core has support for hierarchical IRQ chips, convert
> Qualcomm's spmi-gpio over to use these new helpers to reduce duplicated
> code across drivers.
>
> This change was tested on a LG Nexus 5 (hammerhead) phone.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Change "child_pin_to_irq" into "child_offset_to_irq" so
>   we avoid confusion with pin control.

This patch is now applied.

Yours,
Linus Walleij
