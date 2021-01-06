Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEC32EB82E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 03:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbhAFCk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 21:40:59 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:45029 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFCk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 21:40:59 -0500
Received: by mail-lf1-f53.google.com with SMTP id m25so3226296lfc.11;
        Tue, 05 Jan 2021 18:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvJTvH2rimxkqnfQ5FUZB8oT8Z78yOSFzTFON7khOFQ=;
        b=p1NmxS5JsMiQRdm8dGjgW98QQiYznBL/k7RVJ8wN+1yWiEs4Td7CrMm5lOcam6BFBB
         Wm8UPdimTaInYpJEWad8QqKEEW+RtVUlf9dOW11LcGzUZqd8zb89kdRWDqNJobjIuNqi
         +ms9mUuXpg0KWFCwzEf5BoXFI1UKmsivv80MXENZxaZaXg1CFs6VInIuhKKn7F8hLs8P
         OfJ9rkl4Y71QMXP+vdBfmNu4FvMKVkd1WmzR2SW4bMY1DKCGhixqj4FjB32YC7Q/1QPv
         qRX4+pptHxITjGVwFp05Boqz7tRvXNZo77Z5gw/WP1R3RGRCq/jD7D4RjHrZndFtZg/F
         fcqA==
X-Gm-Message-State: AOAM532i4EDAPpBhjnf4wfOiFAQfosfvqldk48Og+ggkb/BMGymjo+IK
        bXz7//MULp3Wb3XJjwWLbz57hMmUwA1RvQ==
X-Google-Smtp-Source: ABdhPJys+8HE8MK92sM4I1Wf7hppX7XzJHemG9lARoJLI+3b+ySXw/a5EHDfvCHGEDdxwfLZ5CcIJg==
X-Received: by 2002:a2e:b80d:: with SMTP id u13mr1084797ljo.143.1609900816240;
        Tue, 05 Jan 2021 18:40:16 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id b207sm109074lfg.94.2021.01.05.18.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 18:40:15 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id m25so3226217lfc.11;
        Tue, 05 Jan 2021 18:40:15 -0800 (PST)
X-Received: by 2002:a19:c783:: with SMTP id x125mr914598lff.303.1609900815227;
 Tue, 05 Jan 2021 18:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-3-samuel@sholland.org>
 <CACRpkdZbNUxizfV5Oo8F8b0bsjNcBF6JfP=ufykNLeqErvU-ug@mail.gmail.com>
In-Reply-To: <CACRpkdZbNUxizfV5Oo8F8b0bsjNcBF6JfP=ufykNLeqErvU-ug@mail.gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 6 Jan 2021 10:39:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64MmtmpYiLjV_3H_K3i9FVEqmj2jp02HD1FBVzqK1N=eg@mail.gmail.com>
Message-ID: <CAGb2v64MmtmpYiLjV_3H_K3i9FVEqmj2jp02HD1FBVzqK1N=eg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 6:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jan 3, 2021 at 11:00 AM Samuel Holland <samuel@sholland.org> wrote:
>
> > As there is an RSB controller in the H6 SoC, there should be some pin
> > configuration for it. While no such configuration is documented, the
> > "s_i2c" pins are suspiciously on the "alternate" function 3, with no
> > primary function 2 given. This suggests the primary function for these
> > pins is actually RSB, and that is indeed the case.
> >
> > Add the "s_rsb" pin functions so the RSB controller can be used.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> Is it OK if I just apply this patch to the pinctrl tree?

Please do.

Thanks
ChenYu
