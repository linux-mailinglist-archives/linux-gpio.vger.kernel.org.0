Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8121102750
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 15:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfKSOuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 09:50:03 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45095 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfKSOuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 09:50:02 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so23596982ljg.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9ZQjl9wnsKAB3Zoo4F9RgP5GlFui/VJLm448ki3rBw=;
        b=vCkQI+d2K135zgtVt+7P2PPf2Rpc8MsPNf2WQPoLquYf8/L7drQL26yA9UAHUJxyqh
         aKyvyc75wnsr+ma1wiqXJ28O7DcQeoghmTGnmeg6tmxgbkomWa7qrTFwKgugNxbViahZ
         kPSzFfDpFONKL8bgd1IQ7YFuKo0p+8SmIY120vbz/xGiZYeNAb/dy6+uDZ/+oqOOAU9r
         zdbkv1/RT9QnRUoMm3iZmlYaLHXZd12EB3PUjcI8ua5L2tpxXDqulpQ4+XhSf7bYXxw+
         Qh6faNWjS2YKiAay4R9dTNE8C5ccVZn4fFaOhZ4l/oOx3/9D/eyfzJO0TazR1CnydRmE
         HClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9ZQjl9wnsKAB3Zoo4F9RgP5GlFui/VJLm448ki3rBw=;
        b=rfQI/GzB+9Z4GR6G/vIDChkG4fl/XNMt3I5zfnu5Tm+PDveIJ0omO+K6RuCAv8AnvM
         D2KV6PcBhaNiNKPPKLbUkM3nLlOC/bmp5/XVoNsYhnu2logiCxMoCHjHZUUXuja1VpXW
         ZVYTmS0Czq6HbVkkdW+bEegrd0pONyaCtyyFySDvIIDLusky75MKYZt/01jhxr3dLNs+
         Lv2/F+omXIXmZQhkmxPhtnrm+PssfdlNJbdDs4wNVJNXRyof/DOIDNa8L3WIjIPLu2Zu
         zO+Jwx/vHziGLH1Yt1A2lvXLgrDkC7tX3Oq9FdXXtv2H5OiXS/p2HTfeqsyEFqT+NjMt
         jB4w==
X-Gm-Message-State: APjAAAWZh7e9qzkG9eKq7mQ0AFI8f9cKu/Dm8k3eKh6dUxSY02J6RhaN
        MelRfaWBVl8PWnFLdxsnhwOhFWWw9fUyzynxT8Vr7A==
X-Google-Smtp-Source: APXvYqzJgWBhYdXEJT831ipF+tbS7McUT2nhsFOn/XLqq39OkcEoN7fRPKqD94tKrLYR0spiriWRyeFk0XTbbtftwxs=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr4328823lji.77.1574175000780;
 Tue, 19 Nov 2019 06:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20191117205439.239211-1-stephan@gerhold.net>
In-Reply-To: <20191117205439.239211-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 15:49:49 +0100
Message-ID: <CACRpkdYZr7LAZ647DP1-_OPxE7eRnEDhfpMbL36XnELHcc4aTQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: db8500: Add mc0_a_2 pin group without
 direction control
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 17, 2019 at 9:55 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> Some devices do not make use of the CMD0/DAT0/DAT2 direction control
> pins of the MMC/SD card 0 interface. In this case we should leave
> those pins unconfigured.
>
> A similar case already exists for "mc1_a_1" vs "mc1_a_2"
> when the MC1_FBCLK pin is not used.
>
> Add a new "mc0_a_2" pin group which is equal to "mc0_a_1" except
> with the MC0_CMDDIR, MC0_DAT0DIR and MC0_DAT2DIR pins removed.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied.

Yours,
Linus Walleij
