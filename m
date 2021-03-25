Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D568348CD0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCYJ2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhCYJ2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:28:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2CAC06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:28:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o126so1560906lfa.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYI+PuLtimhXH77xMKx0d9cmeN1WTmp9BxMwwXCReuc=;
        b=vkzZ2N2UrRZK5RBwQrQvsfRbVolmmcIiwHGBhARupxqNSDLeSev5dOC8UG/dIL2rf4
         yMuWSVyBRtrQdgtoazo9ipzP1CYUQvSfFuMRAHBCb5L5wngj9mwiuSxdSwcBO/tyqxgy
         MenwoiIXh96QhrN/0K7wklslZj0ue96gv/4dyDUrUl9ze2rsSqdGCuAQ/mQkETIMfWDc
         tJaVq9+8YyARo4Y7YBqdzP5XKqLqs7PnHgG+D6nt/WClVwbGDCJ7OtYGpCsV+uG85gTn
         T/tsQ6lxBa02bW/g29IbIKCgrIr0gLI7QFlTAQ5zL+kZuZKIQrSnDpnPn2XjkYacbRxX
         Luyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYI+PuLtimhXH77xMKx0d9cmeN1WTmp9BxMwwXCReuc=;
        b=an6K72B2Pvr+iOCNsHLUstCBybYYikUN1hRJzvwEPJx0Qcc9hLNpf/t5y5Y/GQ66XH
         EUA5bSrKrDvhXeFlyJas7JBIeZnCbb8yJxvK36RDr673Z0txfQ15PJIxEsC5OPPM+Th3
         R0mpMKej5k289T5tuuJLllM7yy71qx+S/1xw79TB4qujbWVdYRZWfmpnp1dIoJVQiT8b
         IUiX+CEGchKsAOSfGQm1kTlf45DxwVS4WkCZ/u7bOJMJ/BpoDMoonxd30MRZNF4dosE/
         9XK3LPq8r6VLuSzYs4j5uo6bsC0DXgQuv2pgU7SNrd4/tQykNbld9QKtEoLAK+yCtN6p
         G4QQ==
X-Gm-Message-State: AOAM533XRvj26z6Q/5i1zxz5UGuVRf09ShYKGU8AcRFZViR9JOj2ERXD
        2GeuqVSmEk7dTSXS1M0JL3eGizvVzeYT4oZO0GTiLQ==
X-Google-Smtp-Source: ABdhPJy2Z4Gos2vxj/iljbGSCtdK0ftBcKclmf8nmtikeFu0/ui1OQLJdrfnXCEhSNQC1St0TY+IoxAm8bt9VLy7J7M=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr4757768lfe.29.1616664499245;
 Thu, 25 Mar 2021 02:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210323145509.139393-1-hello@bryanbrattlof.com>
In-Reply-To: <20210323145509.139393-1-hello@bryanbrattlof.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:28:08 +0100
Message-ID: <CACRpkdYYV8HLf+HCXbkiRPZFZww+1L_mq3VcqJ5Jse4hY9TkDQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: chip should be plural
To:     Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 3:56 PM Bryan Brattlof <hello@bryanbrattlof.com> wrote:

> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
