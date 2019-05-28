Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7D42C165
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 10:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfE1IeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 04:34:14 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37087 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1IeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 04:34:14 -0400
Received: by mail-lf1-f66.google.com with SMTP id m15so13266078lfh.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQlVBElgqXAsDEjOxVj9oK5E1X6lwcA+b9Oa3dAIje4=;
        b=udG6T27C4vdJ8zRIZhbkTWMPAJ+dtGnvQtSiuSdnq2ColNYCkE2PvnvMty+raYMKkH
         79zqDkoEkMJF9R85zm4zDZKeR1iEwuZ1Rt2B+7EaLfrK3bS9lgX4yE9ilGZce6u7iY/f
         /5zfPG8/NTnl9Di/S0ey7teztK73hy3mpScooR4aD5NS/9bOjXHjJ/SiVz9wVGIwqGft
         i20oZVz4vT8ysrW4zdU3vX6l2KiyA4aHJQ4nuM69GH4ko2LsN8KqUlm77NE5fw8/4HDt
         VMP57lwYrL2WWQqTCihljvptTWeMX9JPy/pgr/gUXnIqU/UewvjvBC6Pf0LBre7pVqZM
         xgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQlVBElgqXAsDEjOxVj9oK5E1X6lwcA+b9Oa3dAIje4=;
        b=Al7AJbZSGvtZJIZ/Cj5AJWlRt0nKMxOe7aNxZ/AdoDy0EScmfLf760jbdnAXB1eTv8
         ud2naqXKTVRLQaraacvnUDRBZJgrp5vCbHqX6M11Rw5MsoZeZf1oEa/eqeuuorujofNK
         p53YTGwsulmjER7KO+Og46OEID/ry3qz3qVCgzxLtZh8/iKf7RqSlQpzNzo47wE9yey8
         5SLYSNS/pAeLIOnfcelxl7xnSifDmEu8XQRl1y0YQmaTgGV0XK3iJZljSJQYnyXddXF+
         U11cT1ZRoUFspn6gLr+ZIVdUDE3oeK7jJxpWsLTzt+f8R+g2/wjnATvtz/yceLEByySB
         6vVw==
X-Gm-Message-State: APjAAAULiQ+Op7afj/EM0N71xZoMTbm2ql6O6eTGdu6YXJVjLc4Ramey
        xm8CBaeqqbLXrVyTFzc+IPLq4qzvD44/bQft5kAnZ4mZ
X-Google-Smtp-Source: APXvYqxEgjRjWENBkz7z95vx7w4Cpgl0m4NZZB0qQ+U9+mLZUVcLXmiPEJ9MA2A3h94RRT/FZGoGmDskw0N5eZFtLck=
X-Received: by 2002:ac2:48a8:: with SMTP id u8mr11205394lfg.141.1559032452849;
 Tue, 28 May 2019 01:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org> <20190527112720.2266-5-ard.biesheuvel@linaro.org>
In-Reply-To: <20190527112720.2266-5-ard.biesheuvel@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 10:34:01 +0200
Message-ID: <CACRpkdZt-AosWLPcwDQqi_2i4adDk-ioT3g3aTicyXiZpQOGGg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: mb86s7x: enable ACPI support
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 1:27 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> Make the mb86s7x GPIO block discoverable via ACPI. In addition, add
> support for ACPI GPIO interrupts routed via platform interrupts, by
> wiring the two together via the to_irq() gpiochip callback.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume you want to merge this through the IRQ tree or the ACPI
tree, so go ahead.

If you want me to queue the whole thing in the GPIO tree just tell
me (once we have the ACKs in place).

Yours,
Linus Walleij
