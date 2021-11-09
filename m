Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D585E44A5CA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 05:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbhKIEf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 23:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240591AbhKIEf1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 23:35:27 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C393BC0613F5
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 20:32:41 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t19so1248742oij.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 20:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPW05/I7JWkMC7nH5tjGxCD4A2fkhvnHq9/c9af0GlQ=;
        b=VFf04iPQt21pyD9jgemG/8UjO2n+aCufGZ28WT29USfCMN6WMRHlJwx6YXw+G3e/hi
         l9o4HvJMRjBXcEtDAfVqfI/VaiwPf2WUa4KQ0P7QxDCtMWmKQjLBzOs+WMGiajpfWV6f
         tJvIJtL62+qGxeqv3bId01R5WrekNfG5dXKMnM1Co3lyCKvfakCxjba5fV1JyCegCZj2
         Utq5TtiPKuebOMiYUKoJf2lr1+CEfFHS4Zxmsb10U26N4R220mDZuQ7KqHAgoI48UelD
         9GNTCoVNJQBCLaaKtRh+eysMJuWfQcbwR4Biv7fUkF/W0ifQ3BcBJLRP5A2PfWbpV2Xb
         iriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPW05/I7JWkMC7nH5tjGxCD4A2fkhvnHq9/c9af0GlQ=;
        b=NFm0IbRL7FDUoTaE86bMuyM9x8HF4tKW8s3WQexlQ984jpa/EfLoBjKT8YahhxzuNN
         EV6LVbHyzMQBUTO814jUzBUEomBHlOKSIzVxGcTkxxXTCVdoPceA6bHYrrqz48B5IhER
         7jlDGsrtVeBaqBVzn7/C4YjHfz0eI1DacE6Ug7Geu5QAvrjUh6mctdjYZB48RbukEMNd
         uNycdn5sDGuIM2TO4NmCHoAqMr5UmqVj+Qovx4Qw/RqO3Ra2x2sGqB5m/St9XWfTpkGT
         7R62gbuAnfVssAa4qNCE4h8Ti3zaGyOGAs3tU03penrP6NzzjxxUwk9p4DfBZu3cfqe5
         /uww==
X-Gm-Message-State: AOAM530dFZWOXczMyQtvVSVKuRepcOvXG/4rgQ9fyjLm4KeV51ak95EY
        t6g3hmrjXssr5tLqHqmDmfPBLtqPpkNPAR1kgPkyD3NObvk=
X-Google-Smtp-Source: ABdhPJyiXYZZr89IAwXjMdgsg06kxN10S6s/oac8LsbHgXOCPomhOTw0JA/nU8TmlBO67To6uEcKTgdCFGNIZPdoNy4=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3342475oic.114.1636432360933;
 Mon, 08 Nov 2021 20:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:32:29 +0100
Message-ID: <CACRpkdbY7QtjACCu63k+=Mn-XeLN3+fOjmKYR0w2NbhEZYGbeQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: pinconf-generic: Add support for
 "output-impedance-ohms" to be extracted from DT files
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add "output-impedance-ohms" property to generic options used for DT
> parsing files. This enables drivers, which use generic pin configurations,
> to get the value passed to this property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Geert will queue this patch with the rest of the Renesas stuff?

Yours,
Linus Walleij
