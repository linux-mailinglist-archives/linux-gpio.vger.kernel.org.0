Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2871ABF0E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633069AbgDPLZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633067AbgDPLYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:24:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5244C061A10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:24:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so5338816lfc.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=91IoQt8MKAEQHzNhIomKMTipSgMe5lSxVgD3BjRS3II=;
        b=pUm/dCpD1e2p3xp5gP2FxIaTOJYH0dKsBte/U1WzRr/sqJJwTvU48GZ1Hka/i50iXd
         qtjfcbVtvHLKx1XrN94vL42DhN/4djLHGAUiQ5poHDIcSowJ443iu7reqIKF+ON22+gS
         Y2NWQ06wB3tcXZq7wXxv8j6UfTyqFg3Ar5jehrqa1s0ETPFwDt4DA6rXO3d3p5W2yh5s
         gSl/BFbmFQAJSUmGZd4GHYpEh869jkZu7qzgqocMT1j15y9uHq9Hfr2K1ZO69FmFxPFp
         oxAyzQs5QM5P4B4ak5prGL/jnsvIWWmJE4hd7EEfjVMUtMwd1GH6SW70YOJSrqloA4gF
         M0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=91IoQt8MKAEQHzNhIomKMTipSgMe5lSxVgD3BjRS3II=;
        b=Xo4nPtSaekf85rNIxwVoQzKUZyPbJwGKT8cinMhsOoHqbTxatiaLkmGEqHoZ5wm+Co
         ekpJBti0UrUFO91kPBE2U145n7I4mzwsqTzZP6Q/V7UIoJAG8ozhz9RPvTOxZyu9w4qa
         UaGdzfk4bwSPrhI8dWtktcx+tsMt8On5FvcCSbUlznzQtlj6hrujRQJDWG5n7YO0CzZ0
         nNfQbFc/zXQX6tn51BgEwzHZ9/NeU3JK1sRAw3+WWtTY/FMNvREQ+NcFQXkKNR7tFNNI
         nhaeg+4dpdBjOt0lRPVrQMLvZ4Su+U7JmfOoCy1dCQ0LSRJOXdCrLCqHsBvisjkeohzD
         AJYA==
X-Gm-Message-State: AGi0PubVdvMG5Iu+z2anyGemHe2aiN4XJbwKDfpFJtTULSCJGg9Tt+Nz
        0sc/8KitZLNj2XtXC3u7M+CTdcTSaJqJueQSPx+bNQ==
X-Google-Smtp-Source: APiQypKER/2EB8Z5ELqVAMozkqwK3O4AQM7q+civrEIeHemg21DnYBd8b8x4Owji7jfW3OIAelN4bep/jvanKBdDm+A=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr5679216lfa.194.1587036284149;
 Thu, 16 Apr 2020 04:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
In-Reply-To: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:24:33 +0200
Message-ID: <CACRpkdYZ1_EzPPFaiEUihnxuMB=9EquVPnRxf3pVeJfxn8AbcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] HID: mcp2221: add GPIO functionality support
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 6:48 PM Rishi Gupta <gupt21@gmail.com> wrote:

> MCP2221 has 4 pins that can be used as GPIO or configured
> for alternate functionality such as clock generation and
> IRQ detection. This patch adds support for GPIO functionality.
>
> To set direction of a pin or to toggle its state after it
> has been configured as GPIO, driver sends command to mcp2221
> and parses response received from mcp2221. Based on this
> response either 0 or appropriate error code is returned to
> GPIO framework.
>
> To get the direction or current state of a pin, driver
> sends command and read response from the device. Based on
> the response received from device direction or value
> is sent to the GPIO framework.
>
> Command from driver to mcp2221 device are output report.
> Response received from mcp2221 is input report.
>
> Datasheet (page 45-48) contains details about how to decode
> the response received from device:
> http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf
>
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
