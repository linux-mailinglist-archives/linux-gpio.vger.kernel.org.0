Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8F32E8C94
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 15:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhACOUk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 09:20:40 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:43683 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbhACOUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 09:20:39 -0500
Received: by mail-lf1-f52.google.com with SMTP id 23so58495556lfg.10;
        Sun, 03 Jan 2021 06:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyRDga/P88nXpUNSjHBPV4V01nLvTjv4Bg0ZMq7KWiw=;
        b=Cs3qe7Y3sa+2q2LMYf0Bm7gIHJuTwHz6MmY4eRtwFa9XsmZNSFuNVrEackUJmhBlCY
         PwhEHiZqJLiA3wwYy+AHKCXDsq7w/lvANqWtKWrDTbIUAEFo+XXFqmBxkSOEC8CGacmO
         H2RDTHzEf9uAMy5Xz0AVd54y5PuqXgFPhkHyOUX8PVZvlHqBPNoWY6b9Ex8SlZ5Cen6x
         9uQk/fIM/SyrojJgPswp5a3ZuHHt/XbPScYV7tZdLYm6T2IPkgJtEFVpZYEgNlJgx5My
         Thf3kQnL5Y23KYjwxYOQVBo4hszTMDHSFpcOTyYzlAL15nMjJYdPgtOPn4zl6H0EGS5E
         N/rA==
X-Gm-Message-State: AOAM531YXMoc+jQ3/eKKoQ2GI3nqSmtj4K1QyWy1rne3R2vdh2awrWdH
        L5nQLQuFO46DQOcymOKZo4atiyE6zkXQ1Q==
X-Google-Smtp-Source: ABdhPJwqtCL2WZR2lgnS6qNkJmmik9smGPVjF1BAIHsjdmh83+L3Lk9l+Ce1n8Nn8PS141lKdVuKAA==
X-Received: by 2002:ac2:430a:: with SMTP id l10mr10776662lfh.22.1609683596842;
        Sun, 03 Jan 2021 06:19:56 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id c16sm7006237lfb.236.2021.01.03.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jan 2021 06:19:56 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id a12so58583911lfl.6;
        Sun, 03 Jan 2021 06:19:56 -0800 (PST)
X-Received: by 2002:a19:810:: with SMTP id 16mr33000667lfi.233.1609683595991;
 Sun, 03 Jan 2021 06:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-3-samuel@sholland.org>
In-Reply-To: <20210103100007.32867-3-samuel@sholland.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 3 Jan 2021 22:19:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v64KioyzGK0uLTVNyhc38fH2A8DWRYc8FVkEVZDjVwr6RA@mail.gmail.com>
Message-ID: <CAGb2v64KioyzGK0uLTVNyhc38fH2A8DWRYc8FVkEVZDjVwr6RA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 3, 2021 at 6:00 PM Samuel Holland <samuel@sholland.org> wrote:
>
> As there is an RSB controller in the H6 SoC, there should be some pin
> configuration for it. While no such configuration is documented, the
> "s_i2c" pins are suspiciously on the "alternate" function 3, with no
> primary function 2 given. This suggests the primary function for these
> pins is actually RSB, and that is indeed the case.
>
> Add the "s_rsb" pin functions so the RSB controller can be used.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
