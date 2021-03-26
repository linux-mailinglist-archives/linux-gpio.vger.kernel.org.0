Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF61134A7E9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 14:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCZNPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 09:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhCZNPL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 09:15:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91B6C0613B1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:15:10 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hq27so8323801ejc.9
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2J16m3JBhK3o86H5FC3pePsPlAfGY4Sh+XHvCjx2klY=;
        b=qpu3G270UEuaCf9P/+CR4FdVpn3VFauM58BfowENzPNXn5RembVd4digrvdOmNadMX
         L2ECrVwQ1/moXjZdtGdD6MXb0eYSNBMnpy/kWDBpiC06uU0JZ+3Ls4FR762bRFRMltqW
         5NtJVfr5CbDKCLZKTc/1UQcHPSFbrYwUOk1+G73siskirYqPR9B54/Yyy7wctiskzlmD
         n7kP+hgrXGrjHULG3S3MiGjpUnVpEtbqKmpUGeZWK3Y98BAOAQuLwDQB2aQJ9LZO4cSX
         EKLtAMwvaJ6z5NzPBwOI/NaItjpFSWT/t7+OUkUt4bt/g2z0z+mLsJPPZFvKLDqBTcLF
         3MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2J16m3JBhK3o86H5FC3pePsPlAfGY4Sh+XHvCjx2klY=;
        b=Ig3jBm2zlHmU6r/nRdj+DksuUv/8mqJyXIYg4GoPFnTcswRrgh29U9fvFWftb6+raT
         PO59FWdUok2n+aALsi/Mwzi5T/3A0hJBh73nh3JgEmn0FtKBOApFCX/92OQ4Xgw2pq6E
         TPBKtkrU8RYYAt8c4Tp/BWjOxE895ita9gOdNSK2VeVxOYS17qzve5GCDvqopcZvOxEy
         2+nHlByWH+n5bPNWDaN0Cvo9ixk9BQbqlbQbIlo7csJfvzvjk+Z2Xgqtr9GzFAfMyP+M
         TJJ5dc1DFIGM11tGJwwGZsQcx/B4yf1nmqi9btDenye6YcEZBkhC0sgaxaYnpYilIDFA
         vnpg==
X-Gm-Message-State: AOAM531FS35xiyFsNXU0fCi5t8CaEdjrKYm4MZvfy0pfxksczOfzDonu
        dj2C/jhptdTQyqctsl2i4KsNYOAULCi6t3d30+1IXA==
X-Google-Smtp-Source: ABdhPJwcRSLkuHG1kkW5pQ8n1j55IpOHcz1Qepo6mqDzIWcjxnU2enWBgtTMvfvKZCY6D9oZa9fzwZkGvgTF7TGApp4=
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr15636859ejr.516.1616764509533;
 Fri, 26 Mar 2021 06:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210324081923.20379-1-noltari@gmail.com> <20210324081923.20379-3-noltari@gmail.com>
In-Reply-To: <20210324081923.20379-3-noltari@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 14:14:59 +0100
Message-ID: <CAMpxmJUcNvg3dN0DQY1ezzdta6rAKVZSPdS0P+XMwHM7JH=WeQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/22] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 9:19 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> This is needed for properly registering GPIO regmap as a child of a regma=
p
> pin controller.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
