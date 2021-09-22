Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E24414577
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhIVJr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbhIVJr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:47:28 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05EDC061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:45:58 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i132so7820211qke.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bTthP8lbagoNgD4znkkkPcaT2q+h8fGmYWbFuWXoDrQ=;
        b=IWHUjcdXwzYzIZEw0LJMOVNcxFzxts7J5SwUd4EoNozkeV9qZ4BmaoI2p4SW6AVAIv
         pLx/v01w2QMqzU9DQegqZZ7VaYeBr8oN5Yj90pYLRrlIUouBY6EDACJVwIoTv/04mH6C
         dduy5DsXXdVgwah75k/WJzgJLoCbrGdPowzKhaLgT0eJtIMmAgEVoElmpvJqTB1GNrmh
         gMxbm6gGc1R2hNP/fQXCDqVBGrq3GM6kT+ccApCizLZL5rDuAAUaDmtmoY6mX0DWeIMX
         5z9Mps2n/SaMjCT/qYLVY0DFTLYpMBxO1yb76Z0FnotqC9ITeXUxvtjatVbqRKLZp2Bt
         QxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTthP8lbagoNgD4znkkkPcaT2q+h8fGmYWbFuWXoDrQ=;
        b=wkUsvEzacLSqoST4KyaJeKdh5WRR7+j0QoopEeQ3bzfXzf8ohvdgD+kOoK8+00Qua0
         BjWy/Uj5zPUl/Dp/EAxU+l29U40ZflZQCrCcAIJMQXaCddAfX6+UN1ENwCpGWvnk8PRd
         w52KQvUWDnP+qalxkz5Rcj4v1qRE7dsTRwM2sW6JhKB1gtXedP9IUNmw3YWsmJHbBLGR
         wzimCtgiN2xmtpnUpClB83BGVY1B/J5BEAN4Fv3sFNgBxLqXnXwVcyZuFC7tzXcxHgJj
         dLcTSOHa2r0B2+yQJd9AuWY247WqCEiqQAcC1Kc7Di4UDUUm28AuHLQyiDROqv1SFN+p
         kkHQ==
X-Gm-Message-State: AOAM533hu12kzjWD1gyF59cyIPqYMyqBu4zFG6qJxBJBopb85nZIe/w9
        tcS+em4ZY2QeCyEVoQuUXmkLvro7RkVhS3Q9TLdorw==
X-Google-Smtp-Source: ABdhPJz1dWLmkTK19qnONV6Gew86lZTBWocxC61DECZPcAD2oPCv39vXAZxXVu5i/CJbZwh1QCWRFftDyNRigk96mqo=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43663441ybc.353.1632303958187;
 Wed, 22 Sep 2021 02:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210913224926.1260726-1-heiko@sntech.de> <20210913224926.1260726-2-heiko@sntech.de>
In-Reply-To: <20210913224926.1260726-2-heiko@sntech.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:45:47 +0200
Message-ID: <CAMpxmJWHoEP923iJr8WxN+oQ6ffQgyCZj7bwNDcR=j9T_Ngb1g@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/rockchip: extended debounce support is only
 available on v2
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 14, 2021 at 12:49 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The gpio driver runs into issues on v1 gpio blocks, as the db_clk
> and the whole extended debounce support is only ever defined on v2.
> So checking for the IS_ERR on the db_clk is not enough, as it will
> be NULL on v1.
>
> Fix this by adding the needed condition for v2 first before checking
> the existence of the db_clk.
>
> This caused my rk3288-veyron-pinky to enter a reboot loop when it
> tried to enable the power-key as adc-key device.
>
> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Queued for fixes. Thanks!

Bart
