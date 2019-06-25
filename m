Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A255507B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfFYNhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:37:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45048 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfFYNhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:37:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so12620907lfm.11
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YW/KvD21S7dTueZqvi4PzPDxvm5Nz0P8icQCvj/V/Y=;
        b=xnIGqs6POFy9pHKSDX+/OlmWZQJ30txkC6JeLn+0DGczGQNMFl9bAb2gXDgBzeTHo5
         uGR2NTk4YPf6AfO6wBQ2cBdT2ZoFNgZ+3cYRAlZvxQYtLhEcE5wPlfURQ+fgb0WFVBGf
         HvBAiHtZWO/8CdwZS2j/agXVoTeUSD50Zcr4DS2Kpgc0/3impfScBTAwJWbLAnp4nY5s
         fPxyCsph/uKPgKyG7fOJx+TZx1a7F12KGG2JNzlZ2z2rLY99bQLVbuJHLwDoUKYXVldz
         E34P5NUg1Q0yUV8yUNN0Pe4anWJTogA2yNFaBwrhvCCdRyJ9iJ0eQlpNhqt+HRxRTA0R
         oqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YW/KvD21S7dTueZqvi4PzPDxvm5Nz0P8icQCvj/V/Y=;
        b=JTnWGvwzAJh218VonwrFb2el9/0LvxFTF/4y4vu1hbv6VrgydbDE+C+vS/Yb63I0F5
         p6md4+wzZ4rgdWfnPY361pFuLnO2y1w1bU+db1zfQQ2bfmVIVnft/kAlb3OG2S12l8Bb
         fTHTZzKJbHGFGchgPAL9QnDkV2EHLZwGRs/bHeTUpgXbrmpQC35u/Xevmpo3cYdjO0JG
         2dbhPjAJQxvjenCjZ8rPnI0idH+9M2nb/BZLeUjODCQOIvsH1KUI81A6HGaj+hYSat+M
         hcf9lrGAKEkZ/WJVOEkfINTr3aURNfquJOh/sMaLhccGzUDt9oMa7uYREa5kFnhWT9YI
         67Yg==
X-Gm-Message-State: APjAAAUBMDyNPPRSqwMQTfD+79xrF+Q/I/nXZZ4NsHCeLdKxbz8s1IY/
        Rh1QtD01aWK+icJ/UKPZNmtzWfXzHIlqdxzmiX7IpQ==
X-Google-Smtp-Source: APXvYqw/dcdizd0Y2/ndPTSsA7zRCo9nBDtU4Gk2oprHrhR0QAXEdcjOtjZAGAqCZjwHo4lc2JEtUJQbkmnoZCtFSls=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr206035lfn.165.1561469832888;
 Tue, 25 Jun 2019 06:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151932.20662-1-thierry.reding@gmail.com> <20190621151932.20662-2-thierry.reding@gmail.com>
In-Reply-To: <20190621151932.20662-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:37:00 +0200
Message-ID: <CACRpkdby=J4OjJcuyzRrKEbqGL2vG04_ygrOKdHpYF9M63y2Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: tegra: Add bitmask support for parked bits
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 5:19 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Some pin groups have park bits for multiple pins in one register.
> Support this by turning the parked bit field into a parked bitmask
> field. If no parked bits are supported, the bitmask can be 0.
>
> Update the pingroup table on Tegra210, which is the only generation
> where this is supported, with the parked bitmask.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - write to mux_bank/mux_reg or drv_bank/drv_reg depending on pin

Patch applied with Dmitry's ACK.

Yours,
Linus Walleij
