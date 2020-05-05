Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747921C5D67
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 18:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgEEQYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 12:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729365AbgEEQYH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 12:24:07 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A797C061A10
        for <linux-gpio@vger.kernel.org>; Tue,  5 May 2020 09:24:07 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g185so2886356qke.7
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2020 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=URyHbD0b6VvGXIAxJMtFkLfSxA+pJ99LyvYiCEW+Gvw=;
        b=sUkReXunZvh2bYEUD2/LaykRe129h0P5H5gZUPSANBLDCWkmySs2Uo73yXHbIDLFih
         zEuOip4QQWVXcz2XFh5Wi0n9wps37xfAWgzKCxEcWaqkqJu8X7RbML/jyquRs2uaZHZ2
         Tg64yy96y/vvenBNLjcYjRZojl4bWo/RIiYdFdQtfsBtf7hjSsC1c8+tRPLFQpCLnnZv
         /o3L9XxkrYoHT6UiA4+FiFHXYMGdn6ycRgUD+mWfnCy2Z6UZWxdlAhj9m1Xp3nJ5TLLj
         eYVwzrEfhT4AZHPwUPPUz0AReVA7E4q1NlOiSg8pl6a5hteljqLUpMb9AZDF8zAkQ226
         LQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=URyHbD0b6VvGXIAxJMtFkLfSxA+pJ99LyvYiCEW+Gvw=;
        b=W1zB2MyylpVHHv4jRdIom8x667ZDN7FGWbyWgCg2cpMVlCt0ygfFwTS94bFHLvN+ip
         RswCZtH86OzGXOD6M37kIB4D6xKMr/FgUsYujAmFxhJ7urxEBG8Lgq3I5mPXGzU+Tsjl
         UEuWMlKHPWK4s5cJ61dEu2S308qWLoSh+QMfqtzHBRe3uPwHZUIQ3Lhe9eDmnUp5Qk3z
         2NMGNyjMsDozzm7zHsxsKvp+PUWas54Va1ti/Rh99mJB2OL8eeg2Xi79wHYWB07y5LsP
         TOJTioKN5K9FesT6ZAr56RKq0C+hkhan4EpNEtFVjTzas4xA97bAkwFppPw0cb8Yt0LP
         IudQ==
X-Gm-Message-State: AGi0PuZzOZNClxwOAY5aiaWKnAvzi1MQz6kUhKRYBK68rtD4IPXeO6em
        3MsUZxXAK1XQqpWs2XnIWnj+fFV4j6LKZgBgXmLNxA==
X-Google-Smtp-Source: APiQypKmH4QXCDccUEG7B64ooa0b5Bx+mw9OszfIv/3xB2iMzegem6Yn83znXSgFEK56y6AoEaM733iPBrf93ND74Fo=
X-Received: by 2002:a05:620a:1395:: with SMTP id k21mr4338823qki.120.1588695846247;
 Tue, 05 May 2020 09:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <4340a212-89f5-8c62-db61-f061e494d6b1@kiho.fi>
In-Reply-To: <4340a212-89f5-8c62-db61-f061e494d6b1@kiho.fi>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 May 2020 18:23:55 +0200
Message-ID: <CAMpxmJWytUARKF_2N4vkUcFbX7P6Lf=oaRYOn8BP_b3eKrEp9A@mail.gmail.com>
Subject: Re: [PATCH] gpio-f7188x: Add GPIO support for F81865
To:     Petteri Jokinen <petteri@kiho.fi>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 2 maj 2020 o 19:22 Petteri Jokinen <petteri@kiho.fi> napisa=C5=82(a):
>
> Add GPIO support for Fintek F81865 chip.
>
> Datasheet: http://www.hardwaresecrets.com/datasheets/F81865_V028P.pdf
>
> Signed-off-by: Petteri Jokinen <petteri@kiho.fi>

Patch applied, thanks!

Bart
