Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CE75D922
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbfGCAfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:35:08 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46944 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfGCAfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:35:08 -0400
Received: by mail-ot1-f66.google.com with SMTP id z23so431952ote.13;
        Tue, 02 Jul 2019 17:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qbrn6+3X47dwhyUkAWXte8J+fjd+tHfpJpFHgAD+S58=;
        b=TtsFiJatyqjLoJBxRVt34oXzoLGjO+FToXJtmv6CMHqLJ1J83PkR6QLrCwLHwZJnDn
         rctTXjH0uAqvaRXNTUMUyew3QYxk8VGHKOJx53ikFwb5551GicsjHXcHFydA3g2ygLLm
         qUGMeUdNAuAwkIfZf0Xdyzf7BNKslpY47cG4HmIReOIUhHcoNfXFQGvf7od4YcjkIT0x
         xfigNk7ibXc0Nk50OjWAz5Hnkma8gjHVw6gkyxtRaWT80undWb/Xshw9gtH2ElUj2U6b
         xNHQG6Gf3IEUxRhcTkGmBLtMbJiauTEClCyOKiARxVaySyOrgn6brYMqadKyW+9xVZ78
         6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qbrn6+3X47dwhyUkAWXte8J+fjd+tHfpJpFHgAD+S58=;
        b=f4gxwhGxUjo3niQhJVlsG0kZkWIFZR/51ztYJA2hFyhbtLeb0BXv7kMIuGAkjo7tWl
         VHvt5lOjpfBxZ9Ps/LH7o1wJyWhstKF+CvtZKKxeHHHmOeyp5lDvsfMcfzY62looSKJr
         B5eWUJFIlCWJIj98g80TFQbC1qygNCnnARIr+bmy6eWdjLxCR3YNHtJ3sGC/kTuoPfv1
         B/AH0OCNMuUZnvTp/ef3cVlddTjvDnGXtvZHDLFlZ0KSE2MUxwWipMPkQM2Az+cXC1VO
         gaZwddATfFOc38kpKvu7mDlIN9L+OUja2CM04m++ukD1QagFEVXIUz9TVtZ7W0WJVpEF
         ReyQ==
X-Gm-Message-State: APjAAAWMeYzMoD4mZc0P3anNqE2vh3Tj3jjHvGm/TBeetPK5S6YxQbtd
        rnzk4SoTieMRqmKAhKafMRBcTqwUf+3S1ePQycq1ER7Q
X-Google-Smtp-Source: APXvYqwyhHHZpYKTd+W1EP2ObsG3A5HTjaf6wiigNc78pHsXxw86smXpidtCkCRHFB9PyazmH3UOEt3pYpO/+Mr8cF0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr26119392otb.98.1562108518402;
 Tue, 02 Jul 2019 16:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-6-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-6-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 01:01:47 +0200
Message-ID: <CAFBinCD8WfhgcjKfstvVoDaLWm9yoZUg4SJpj-i1R+KgZ17aKg@mail.gmail.com>
Subject: Re: [RFC/RFT v3 05/14] soc: amlogic: meson-clk-measure: protect
 measure with a mutex
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to protect clock measuring when multiple process asks for
> a measure, protect the main measure function with mutexes.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 19d4cbc93a17..c470e24f1dfa 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -11,6 +11,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/regmap.h>
>
> +static DEFINE_MUTEX(measure_lock);
I wonder if that should be part of struct meson_msr for consistency reasons

apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
