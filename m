Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2A319608E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgC0Vjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:39:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40341 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbgC0Vje (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:39:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id 19so11744140ljj.7
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Je8mtxcs84zdxjm91ykSFMqUo8LaITxZQqe+nRBzKN0=;
        b=p46WdIT7WUM+8lq5BljY7Us2B92LkhGlQpWgUmNi8VgndmqisVWKJCpnNJONl8zIjF
         WnhoiwRRuLKwALzSgg7mxo9263rh1e8DiY5MyaNZfyatrxjYtZoeglDbYGQv0+CS1DOh
         FPzQV6oLx3Q6AWCVjgrMCq4pI+7KyfI0QJbzrytAV5BJ2IBGM0xgdAGEnaqP+3up0FeW
         uzmCWroM5Q/jLCyQNvYELjhTtUbI0HYXA7TOn4s4zK0UOFrMfqtFH/PFvwlh/LuU5sLf
         rnqn0EuBY76FIus/SRwsaTZkj6ijeuWcHJi4RVqSaBXjtZW3fhb6XQexr7oDz25dvwg3
         NIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Je8mtxcs84zdxjm91ykSFMqUo8LaITxZQqe+nRBzKN0=;
        b=D0xASUT9jU8F6Bq/dudJrzGRDORgqc1EJQKHyV498fHTMbZjG3h73fstb0xtWUg8Zk
         OfMX8vvbtkahALnBgkZVYY9hatK/ucBLamV8f7lSx/zeNsKufC2vHIVh9UnzNX1vlIVd
         /pRTeZ5M9yksVzeJjoR7gLy0D9NeSOekGhlNBIUZznenX8mA6OKyeBNPzplcXBD5Crw+
         p5CBg5JbfajrUOnbKD0IyHq/kARhJKWtPXSOTI16mER5/rs99waSz8E8a/0UvvE4cKaB
         USz1Mx2HBKeU9q/CmywIJknBeO9s8NBoU4Is01Ukvu7pNIj05LVnrYrV8IDJBTOJnEGb
         phag==
X-Gm-Message-State: AGi0PuakLyPnNAeO3J4DoXIY3M2RIevkwevJZd6oU6/hHXXqSdYkjF/R
        yFm0vmX8YxEExNEra/hind9My2d86ufYMvV7Squg+A==
X-Google-Smtp-Source: APiQypKvs6AyHW9t/QYsDDBil2QxnB2gGYCzDvaKDnk31e8soz/A3i2nOWFG+aEMqTx99zqIQddpZ7oQ7/O6U+ztSCg=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr549394ljh.258.1585345170980;
 Fri, 27 Mar 2020 14:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200325100439.14000-1-geert+renesas@glider.be> <20200325100439.14000-2-geert+renesas@glider.be>
In-Reply-To: <20200325100439.14000-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:39:20 +0100
Message-ID: <CACRpkdYBFBRFEzCUb19n0iHpJknn419aXdbgOAqG8h1P0J2YJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Pass gpio_desc to gpio_set_config()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 11:04 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> All callers of gpio_set_config() have to convert a gpio_desc to a
> gpio_chip and offset.  Avoid these duplicated conversion steps by
> letting gpio_set_config() take a gpio_desc pointer directly.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
