Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2375639D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfFZHp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:45:27 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39330 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZHp1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 03:45:27 -0400
Received: by mail-ot1-f65.google.com with SMTP id r21so1582017otq.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vlsf9GvS+RoA9yjo+zy35lXcVFVFTK8sik+ld3DEIhA=;
        b=JwYUYDfFq92gNHudM1vQhoBBNb0ZqKKmDTNu5ZixbVdDx8Vpa/Xqbc0ZrIIMte3n/g
         S8lRFThDhS/G8vZkzbW17jaFdUZQWwN1OgPTFRlKiUgoJS17OzG81QJ7e89/XqubZ4/u
         AA+Z6tIAUBsvRRlxAAC9QQPbpEiM/ZWGsSxwYxXwN2ltlEqpk48aAj970n9B2FDB42JX
         sdFPIo27kdqiwd3ljBYYd7wfk29r+rLmbavPis7wGYNXQKOrWtQ5Hy5xTbCRdbgkf+7f
         QbZThkasqErV7n5NWref06NpUqOEK8BooZ7I8fR0cm9CiwfFwKNyfoKEvcCNR9KeIRuB
         1ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vlsf9GvS+RoA9yjo+zy35lXcVFVFTK8sik+ld3DEIhA=;
        b=K7x3Iv7SZQ0mmKKDieYgoKyWE0R3Wymbo1DcOeiqD+cb88AdTDp3h7aJqpzz1M8T2u
         wlczfkGgdTCJA3VuZtnurX1gqklqFK8wosqJoecXsCLRI7Igd0nA/UCMv9MwP/6n36Qs
         OnP61obLbXdNg/B+cvdhvh1XW5yJEENci0VkYCNDaDoWVORX2Cxy9IkOw+Cqky+xlvlv
         Xs4pLozdneUp4ZlGoEaAMnnPTOHjNydPMAO/3DcFdl7+R/7vKxS6OFjgD+63iLNIKlee
         8F91mW4qTP62C3zn7hHd7R+jlgcZYb6eVC7J08hjOSyZFqcI4x0fjpPS6FIPAx7S8jQv
         zAQg==
X-Gm-Message-State: APjAAAU1rP4iy2iW1hoTlrCh+767VAKJ2suCiGSX4uwDpF/8uCb8PJFh
        wl6MI1AJK81DL9VJvkJgTa/dnTxL5Z1Kt4regC60tg==
X-Google-Smtp-Source: APXvYqwbwFBszV0lqL7f2V9fgvETkTT3LTkcy2p5b4vbWsnWnhWcyzC5rm4zgjR7Ytb1RCdVTeUXElHm/udJ+n9b7qM=
X-Received: by 2002:a9d:2969:: with SMTP id d96mr2174841otb.85.1561535126477;
 Wed, 26 Jun 2019 00:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190625153915.28424-1-ckeepax@opensource.cirrus.com> <20190625153915.28424-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190625153915.28424-2-ckeepax@opensource.cirrus.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 26 Jun 2019 09:45:15 +0200
Message-ID: <CAMpxmJXK50tMXfKfXR2=tPgRLfGH-3jm-NUB65Kf8gg8mQQCuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: madera: Fixup SPDX headers
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 25 cze 2019 o 17:39 Charles Keepax
<ckeepax@opensource.cirrus.com> napisa=C5=82(a):
>
> GPL-2.0-only is the preferred way of expressing v2 of the GPL, so switch
> to that and remove some redundant copyright notices.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/gpio/gpio-madera.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
> index c9dad0543672a..4dbc837d12155 100644
> --- a/drivers/gpio/gpio-madera.c
> +++ b/drivers/gpio/gpio-madera.c
> @@ -1,12 +1,8 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * GPIO support for Cirrus Logic Madera codecs
>   *
>   * Copyright (C) 2015-2018 Cirrus Logic
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by =
the
> - * Free Software Foundation; version 2.
>   */
>
>  #include <linux/gpio/driver.h>
> --
> 2.11.0
>

Patch applied, thanks!

Bart
