Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326AA20F0FC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 10:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731761AbgF3I5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 04:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731591AbgF3I5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 04:57:09 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7ADDC061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 01:57:08 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id q198so17877198qka.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLfyA6kwAk3sFKrISr9s3SubY2mEnwLHD2Bu93ov3kU=;
        b=b43IWOnxRsypW3ZvtE6GOdHeSq1it21xnZfm11oR1prYjnkDmCgV5GI51EaOc9852V
         61fm//3tcUCZ+FHey/EAdlCAcAo90oHSIuxxp9cBo7XEDz0kSmkjixQwrI+Et0UpR7bh
         DJpLgzaBmvF+VzLb5QJeSpgNobbLekRrbWNVmxSEfxclrZhNJrCOdA8xj8YRCjvL1Egk
         zrY5fXKqAg/4t4zZo/1D2odDdaSMrIfS2ROO0J/S8yVDV4ZNkMtBvmzBDoho9cLrl/c7
         5XdqGnX6Z8Sun+Kzw/3ApvKk9X/jm27KJ+E5qFo/HYhsgGG3Jq4PpK4mBAP94J1KGn1X
         BCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLfyA6kwAk3sFKrISr9s3SubY2mEnwLHD2Bu93ov3kU=;
        b=hanSFJuB/SOPKyrepm5KafFLVI7OklMI+wDUYFoTUfw/+s/3OTPWw1Ky4RWKy750gL
         Z3tPw4GdT3zCbU4ah4vM2nyuoZlTBP8LSqpa5QSM9tValDBLO/ZK+wT1XU5J7K6fE8Da
         XgE+Ie3cSFqXM/PdlkTTWSgKyr+d90H3bKdmpc/hUARgTVBlyjbsnFNHZWjW+4mhpCqE
         QnEFcMzOFio2dS/L7eXKSrlpgNI1COGJqLCs+oe2j1cI6qyQ6aEmaw52A3+LKsMv1/D/
         9QtQbEO/RYISYV08E3xfltB1nSqX3aOrtx5wn6wl46ng+nmLftlRP57ZcY2hHptamWp6
         fCBg==
X-Gm-Message-State: AOAM530t0VtDYCpNVkkspyX3iLz4xns8ezcQ+bRiiaZu765b9JRqfJuA
        uAiNNWBojFyxWLAFdl5K0ICc1Tk0o7Q6QjtOJ10B3g==
X-Google-Smtp-Source: ABdhPJzps1YB8ezGIBmRJ3hfs+iy1hFiHLPHFZxcAaGXZRtoWn4YonE9966faoaFJCS+TsMSaqxR6nyw0IsMbP1OWOc=
X-Received: by 2002:a37:7741:: with SMTP id s62mr6662405qkc.263.1593507428004;
 Tue, 30 Jun 2020 01:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-12-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-12-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 10:56:57 +0200
Message-ID: <CAMpxmJUDvfaFJSma642BAyprugae16Nag5zSVuApNPakiR-O3w@mail.gmail.com>
Subject: Re: [PATCH 11/22] gpiolib: cdev: remove recalculation of offset
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 6:02 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Remove recalculation of offset from desc, where desc itself was calculated
> from offset.
>
> There is no benefit from for the desc -> hwgpio conversion in this
> context. The only implicit benefit of the offset -> desc -> hwgpio is
> the range check in the offset -> desc, but where desc is required you
> still get that, and where desc isn't required it is simpler to perform
> the range check directly.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
