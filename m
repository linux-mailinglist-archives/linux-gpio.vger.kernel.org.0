Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9743E31D0
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 14:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439584AbfJXMG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 08:06:58 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34981 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733180AbfJXMG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:06:57 -0400
Received: by mail-ua1-f65.google.com with SMTP id n41so7072304uae.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Lbvvl6tmDfsef6Adcm223n4P0saLVKySDcFwg4whEU=;
        b=CwWCuv7zqHDpb3UQa/HhY2uB032NkGh9fyxr+zHL/5NeEcJty7gKPJOyZH91LIGw1u
         4Ig/ixYsJpvxvQq2bS+sOrYW4T5ZUEoVU38sq7UELpHT/0VqKITEOX+WK8tIcGE6w1FS
         JVx3sc2PgANsKhtJv2TY+buoWqv8uUNxqR6rACKXPic9BmQ39dF+y6gjqS/8IHAUx08F
         pfPRkH7SI6qa+O+wStiIyP+NyhhhbKhJi+LVE81jeNfpDqljknxTCK8TbS9a+5DBpxxQ
         U2NQyvJMvBngiOJggMOHDt+NRm7yBPfaJEZc/RkvfZkBheM4+fY7NeHGt+bdEL4WewuR
         tq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Lbvvl6tmDfsef6Adcm223n4P0saLVKySDcFwg4whEU=;
        b=Gy0tLRMQNn1BZ85Hqsg/eoyiyABQkAlIyLI4bELDGNrokp1zQFZe8rmos/J/oBMEuf
         PyUSqEgLQLgWh6RuxhJhEx+/O/tjRmn4QbW0TVGZTxksZ84ZgdwxOWUr+3nI0wwH7Hul
         ZRfBJnhmyuDq81p3826KYCv1OgoY1M+MVdDVDCdXLU6P5bpAOmmt/KKMUBlCB8ZRChii
         OG4pgqxuJv5KIBWsbGJ+RI/cvPxryYEHTr3eKIaileE3eXRfKRWL93Y9dIDDId7BfX4Z
         T/hCBZBJXouEHjFR8A6HD98hHYuBBbT5FJ0l0Ex2UZeGSRtiXHm0MVzx0w3Ti32Cj3N5
         clBQ==
X-Gm-Message-State: APjAAAVjAAsCUlqD+uZ1SIH9BS+Ud2+VAoypqIvY5BR+aBbe4N1urVgC
        g9XRzDd2nnWRNeVAWeJBGO96dYt76SM2S2jzV+BhojPK
X-Google-Smtp-Source: APXvYqz/u7GDculbgv4Ltb7TsTfgDqc2G1JnhwfCdOEAQ5op57bB4jqXOhU4kGn1Y5/Z2ijpw5NUrHB9jSIPCGb29oQ=
X-Received: by 2002:ab0:7043:: with SMTP id v3mr8419775ual.84.1571918816518;
 Thu, 24 Oct 2019 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191016142601.28255-1-geert+renesas@glider.be>
In-Reply-To: <20191016142601.28255-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Oct 2019 14:06:45 +0200
Message-ID: <CACRpkdathjE3CLWsJYapL-0ri9_mC-uCKrh058zBk_nN5wHkDg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Do not use platform_get_irq() to
 count interrupts
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 4:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>
>     sh-pfc e6060000.pin-controller: IRQ index 0 not found
>
> Fix this by using the platform_irq_count() helper instead.
>
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by, Tested-by.
>
> Linus: Can you please take this one, as it is a fix for v5.4? Thx!

I'm not sure the little error message counts as
a regression, certainly users can live with it.

Can't you just put it in your queue for the next kernel?

Yours,
Linus Walleij
