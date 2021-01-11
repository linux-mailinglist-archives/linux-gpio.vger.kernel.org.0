Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2B02F0FBA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 11:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbhAKKJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 05:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbhAKKJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 05:09:52 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47367C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 02:09:12 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b2so18194274edm.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3K0MpZVfZ4qA+deXtIfoeZlGXrSGVuIknlVGq29zqxQ=;
        b=JlIVTeLfWTLcy1lOjF8lhG+U2nO45hk96tlPN2muNjc18yd9pXXvCcIvGZTA64u2S9
         hao2vyhCFvg+gQQUz7p7z1O7/SmuEsbv5iRLQwsGqXLUMUfyUTGuV6tL1aodjwHdxaBm
         5k6Y1kgy0aQ6bxyjK+FYPWltKXUWmVKaeds/xLfkhJ/C3dFor4hl7SAv2/PvLM4enQiX
         bllQyG/kW6kn93uKa43F08JSe6XqpEbM6VFAiituDHdbeozxgXW5L1vBijbTLDSHy8po
         J08Q7DxTg4ctb4qFUewoOTCb6sLbyjqTaaO0Gul1y0hGwKrGzmwsfasz0AnSWWdUQRKg
         mzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3K0MpZVfZ4qA+deXtIfoeZlGXrSGVuIknlVGq29zqxQ=;
        b=sUXd7iZcyrXRDnDRX6v46867CHA2H2HOII9bkHQEJEWLT40PIqHueRIXvKX0AI89qG
         /VJjUipVO8tMjCkhzCj/LrBI4sK+xY0DhS/X4OFLV98+M6uD4AptezkfhwpJnk7tW8vb
         n90iTynWNVv8UBRhlHCG5NHpyPySS3bLsSng+CIgndRMVy6aQEFSKKGlburFAGkWGxNQ
         BkK0wYbw20mhOuyR7W8yjlFFlPSj2NgdfUkxOdTkvPmY+ksLAul3OymgHg5J/kDrCck8
         n3Z1B53ZXfFr65rpK77JqZsQ5+XqH7ffZkgiRbSTrIVBn8DaAwgR0ccyCy+N6attmsTe
         SrpA==
X-Gm-Message-State: AOAM533XdVqSZKCX0bys2xtNH908YqQE0gOUhmgOarl1FNhZHcLBtzE+
        mlozk06VKKiIlmnhUGU4oayL90QJ+wTtI9g35L1qMQ==
X-Google-Smtp-Source: ABdhPJwD7a4C5TCwgNuaYm1Y3CaAEaB74ZsK7DSwWR6bjHtbH4dP04JQh/VEKHHOxR3bV1VGcgOfJU9w8Y+Czx3SFTk=
X-Received: by 2002:a05:6402:307c:: with SMTP id bs28mr13630886edb.186.1610359751075;
 Mon, 11 Jan 2021 02:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20210108102026.2024478-1-geert+renesas@glider.be>
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 11 Jan 2021 11:09:00 +0100
Message-ID: <CAMpxmJXagq7X5_CdB3XfGzr7roSYDHPEzJNb7e4G2b9YFAFKDw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: rcar: Add R-Car V3U support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 11:20 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz, Rob,
>
> This patch series adds support for GPIOs on the R-Car V3U (r8a779a0)
> SoC, to both DT bindings and the gpio-rcar driver.
>
> Changes compared to v2:
>   - Add Reviewed-by, Tested-by,
>   - Fix SoC part number in oneline summary,
>   - Reformat comment block to match coding style,
>   - Rebase on top of commit 3a57026a83ba363e ("gpio: rcar: Remove
>     redundant compatible values"),
>
> Changes compared to v1:
>   - Optimize GPIO pin state read on R-Car Gen3,
>   - Enable input unconditionally in probe and resume, instead of during
>     GPIO line configuration and depending on GPIO line direction,
>   - Assumed authorship, as this patch is very different from v1, written
>     by Phong Hoang,
>   - Add Reviewed-by.
>
> Thanks!
>

All three applied, thanks!

Bartosz
