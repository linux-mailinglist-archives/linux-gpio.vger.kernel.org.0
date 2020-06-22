Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCD5203D2B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 18:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgFVQyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 12:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbgFVQyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 12:54:17 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F871C061573
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:54:17 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i3so3655047qtq.13
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U2Loxh0UBGoStu/YgkMRO85TtEfjsm65VCNYI1DGVpM=;
        b=hBbGeGzLTLBinyYmygP0QeLy0oQ2I6xRNrZUWldovLttIo6FHiqlFsCCneBCMwtu3b
         l+eesx3TqWWgSxl13iviJuwhWHwKLTn7AY8Is2/HdRql4/bKOtAaDyhKU0pudfhGb6hf
         vOBncZGzqJGUBX98xFFLXxeGqf8B1bZUTWawV79agKnkyFxjCy7Rx/4ZFOGzWsLkvJBY
         MlXWlf6wngLFVkq5RHRa/cCd2QQpyoaItKpMgrtNyi7xkZUfsovspyvQo28R97Guf7cf
         bz3cKl0CGfDrGP+HCW1T48Xk7Iz2QCCeVukYl1g3hzCWecOtEngG3CyZhXIMQPya+XkI
         S9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U2Loxh0UBGoStu/YgkMRO85TtEfjsm65VCNYI1DGVpM=;
        b=Hh7vjY/isMsLHpBRL4xyCEB0MhojOn5gK0YzKOwE54B2I771O9PQXzt/O3HytzIsjs
         sX5Z75lE2Gol6m2sjzmh0ia3N4aFLZsN8CJfL2DKIyMNkkGX9nFvCMwYbUzuf+8kixOl
         KzZYT7OhEJ4vGGhLRrpAPxNTdiaymGcpuhi+BY7GW3s68GpkxWus1E11Vq8tdpZuzkUN
         /HfvM/54MP9IT6WDrIFspOsYrjWZ5y/MVFCR3/D+hAHwxYtP0gv3nSg8I80/fH0FQBQp
         P8a59srYqBFn69azUEUD+M+o4Xo2ptpwqyTlMod+nflMBTZBGzu6/hSp6kAoQTc1l5qM
         HjCw==
X-Gm-Message-State: AOAM5316wGWEjev0RCkkNcP8AqHYgSYPEclFtNiULwAR9ALg6TYZkSNc
        K/SJRvjSdo+C7iIN2wxXwctYUDaKYvAUW0LPzY6V/RDP
X-Google-Smtp-Source: ABdhPJxJRkNoCJbxm2I4k4r24isKwYxnzf+6aabgXu/eybkXHa83zMm5fzbIxRLx/cTRNHny+hAKtkEMW1qPcyf1Vm0=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr17439684qtr.197.1592844856891;
 Mon, 22 Jun 2020 09:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
 <20200617074023.30356-1-navid.emamdoost@gmail.com> <CAMuHMdULgdhgoydX-nnVSyCEBd4zkCgSyVZ+ojFzGM0gky6OJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdULgdhgoydX-nnVSyCEBd4zkCgSyVZ+ojFzGM0gky6OJQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 22 Jun 2020 18:54:06 +0200
Message-ID: <CAMpxmJXV-Ujx2zgXxiYWOED2CYz_89aAiUUiqak1JbtNJKgSFg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: handle pm_runtime_get_sync failure case
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        mccamant@cs.umn.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 17 cze 2020 o 09:43 Geert Uytterhoeven <geert@linux-m68k.org> nap=
isa=C5=82(a):
>
> On Wed, Jun 17, 2020 at 9:40 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put if
> > pm_runtime_get_sync fails.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Is this stable material?

Bart
