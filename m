Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD31CA320
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 18:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388051AbfJCQM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 12:12:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38057 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388046AbfJCQM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 12:12:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id h195so2076443pfe.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=XiVsYRW0n3APOo8SN5jHN6423sGK1hzLkdW22R6gUlQ=;
        b=b8geVaxUUmJEPSmYVZ/urv+GIDjPVA+tUw7s237kt7/4+W9qC3LDCPfcGAQhQ7qMnw
         4T4SP4lmYuQYPQV6SzMaM7KOid5w+rycvgqMZD86rgttuyzqDiKJchqoCKkH6tOvuN0f
         TWekoQ3fbZ0zfYkqUHWkpN71y1uBl7+ZV27Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=XiVsYRW0n3APOo8SN5jHN6423sGK1hzLkdW22R6gUlQ=;
        b=fsF0mi/YsuHXTB745EMba4ecR/YZzscYMiq7yh4jI+v85mBplIrwbEstVBcKbo33T5
         OZ3+b7cAxAcAo1L/r9n18vHQ5exR1JrrnWYKlO31cpKfLybvmbJXWn6WTpisFXcKvDYX
         nhGPd6QYHqFj8cFlX8f0hNPU2aAtJo0w5WjgyKrdKGcle9Ag1i2X0dPt6OktCiPz8ije
         WnzFkpHl8w3FMCArJxLBfw9sbC1tBOkAM61sir/kJufIrTzgEXNmtVJBaMSHiKyZmhfV
         3rZwVQRNNjY8akpEwFO7Plg8ectkBR3ztVEkzKcoq3aOa0fHEkpQQHglm+DJBoVtRDlp
         whZQ==
X-Gm-Message-State: APjAAAXXl38TlwTAXWJx2psKYhf6i2mkWwiqfgUKUrWtn7JytIM0/kvU
        0lK0lnznJYHM/2sETEUH1NI5Ww==
X-Google-Smtp-Source: APXvYqz1b4RepNxT7vkrCPPzJdtlfmm8TflfIc9vumG8d7od9p989etC+nr8zMpohgtuvg7k7k8vtw==
X-Received: by 2002:a62:5847:: with SMTP id m68mr11824475pfb.23.1570119147433;
        Thu, 03 Oct 2019 09:12:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o9sm3228540pfp.67.2019.10.03.09.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:12:26 -0700 (PDT)
Message-ID: <5d961dea.1c69fb81.d0777.9f4b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001180547.734-1-geert+renesas@glider.be>
References: <20191001180547.734-1-geert+renesas@glider.be>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: sh-pfc: Do not use platform_get_irq() to count interrupts
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 09:12:26 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-01 11:05:47)
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>=20
>     sh-pfc e6060000.pin-controller: IRQ index 0 not found
>=20
> Fix this by using the platform_irq_count() helper instead.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

