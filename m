Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E65F164A27
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 17:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgBSQXy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 11:23:54 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40586 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgBSQXx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 11:23:53 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18so985808ljo.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+koYLn7ZJhaqj25+W9188jeUQ5uNdHzeqMm7FamtmY=;
        b=tqwyRN7XCiE959aKxjtEOi7/UiVPLzQgbupb84ZCRLoTrnACUhp19awz+tzxddbR1X
         9Yly0tVxiHyjnEOptVx9h+2uf8YOzE5dvLYJkwDqI+81p+8XHhPg9iGCPm0HJtE2JlIN
         T1qaWa2iiTxPvshRd+3CGCmfMnZq80U/hWBatQRYUYlUClXPIgDK7pRWOri0lpuyWzu3
         NBibHPKrpoVeYevXQaFye8xcnO1QgQuIk+je/kzXoFM4qtTR3f7899B7sEiilbXCfUA3
         KPTriTwoL/s9tqAiZvdW9zYCz5Kmt8FriQ8IIGF8dXC08E0ZDt4nlf8pJZJPKLZc9jTr
         0rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+koYLn7ZJhaqj25+W9188jeUQ5uNdHzeqMm7FamtmY=;
        b=O2qj7e++gE/87fGDXl9Vl3pSqZoNwvTx0MZ+99H+aD3jt23Q1l1QOy1j1SPtTldzYJ
         txr7kCEvj9cMD6jv2KiKj32TfWJuhGIxDmsp1xhOJYw/EAoeeftTfPDWfthAodERhUt0
         WabTR2BEb6HmRYrye7jmDYSpIn/98UJLhMEPCHsQK4N7E5aFDHGZtHNTj84MAIKY/ggR
         S9TO6BM6xjRW44wxhkj5FpEOtINaZp1uSFwj8/vt8aJhQN6A9fqXwFqnguzSKf9+lRvi
         c1AxyqHfOOtsAOkizuD6n+em3ld0lCKZFDT/g+Vc+yrlyp4fDgfbb6EQVdwO3/OONapV
         RfYw==
X-Gm-Message-State: APjAAAVlSyoPpZnYPdlGnA6pGXrRi6dcsXm8gyJ4DgdlZYbx8VyLN+VZ
        RA7w3TkLCJBgk32B3aRboOMa1WLSK6FtdUO99WiBpg==
X-Google-Smtp-Source: APXvYqxJ7AMu2+7ZjAhkwR9hwSCjvmhllaXVwoznlwbfYWEU+J3T+FCENxb+Oo9gQMBsOOU7sXyzFQ8kRLk7wptkHE4=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr16811174ljg.223.1582129430832;
 Wed, 19 Feb 2020 08:23:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
In-Reply-To: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 Feb 2020 17:23:39 +0100
Message-ID: <CACRpkdYXw0D9BJSBd6tvnKM3tkMir6ptcpg0nZxpbWQdAHYooA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: fix GPIOX sdio pins
To:     Nicolas Belin <nbelin@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nicolas,

thanks for your patch!

I can't apply it for some reason, something is weird with it...

On Wed, Feb 5, 2020 at 12:22 PM Nicolas Belin <nbelin@baylibre.com> wrote:

> @@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]    = { GPIOX_0 };
>  static const unsigned int sdio_d1_pins[]       = { GPIOX_1 };
>  static const unsigned int sdio_d2_pins[]       = { GPIOX_2 };
>  static const unsigned int sdio_d3_pins[]       = { GPIOX_3 };
> -static const unsigned int sdio_cmd_pins[]      = { GPIOX_4 };
> -static const unsigned int sdio_clk_pins[]      = { GPIOX_5 };
> +static const unsigned int sdio_clk_pins[]      = { GPIOX_4 };
> +static const unsigned int sdio_cmd_pins[]      = { GPIOX_5 };
>  static const unsigned int sdio_irq_pins[]      = { GPIOX_7 };
>
>  static const unsigned int nand_ce0_pins[]      = { BOOT_8 };
> --

For example the patch just ends here with -- two dashes.

Please collect Jerome's ACK and resend using git-send-email if possible.

Yours,
Linus Walleij
