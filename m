Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6095D5F403
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfGDHoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:44:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37130 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDHoS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:44:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id 131so5173063ljf.4
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpdCeLUoBh4DNHtAtSr77HOQTlACCI/6Pjsw5SZSdjg=;
        b=wTuDj32P4i6zb27aRMtS65T3OIeBp5OCqxQ8bqEVrOCKQBzq0qeh0SPeMIohcNOSne
         jfSd2pab1IdXLS2D1kjdAHRX/Gkn8tbC/b00lt2SJ/9bt4SmyV3jeJVysFrLJ3tLIxtB
         WzRmxJ2z3oH98kCCcQNjQVn+bWP1onMMBzybF9yezab+Xqhzy2fIV/p9hTzraljDjp8W
         rdD0FMiTt7dAaI5T0rZmdEjff/601jcVwFlcMu5N2mCMroPlOQfS5rzSxEejlIGVYGvT
         DuvQLUWj/7zRJ99j2kUfyfX8NCUwv79jQ8HveklU4RT7vxzocCCRdWrZkeLQUs5saT7Z
         h/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpdCeLUoBh4DNHtAtSr77HOQTlACCI/6Pjsw5SZSdjg=;
        b=Iq56MlNj3qCFYJVGG/CoxuiRdAtgESc8kIRIZbdv7hXnV0V//NJVNVIT5IlDFuSHAa
         RyNj7Cfc4d0ugJ9ZMk13Mz3Vy6n4OgtLT5sGh4geNaN8ymUuU8UNZNbypeWyawhD7oUV
         Kx1S/tKuuYJ2NDvOaEMEuDVbPpp5IxNeEBeoF5kt737uCtNzgjLODESjKLAxn5C0Da2/
         fVXT2B9JUdU+hbmVwFuBzFHyW3KQ6J2kFL+kMYskQgqH8vBXIA3djJymISIdZvKKb49b
         WNlHy17ajq/6HHECnmnxsssMAWAHzzpMLlKxEolixeHakPToGVJvPPyC0TT6pMht1CcW
         DRpA==
X-Gm-Message-State: APjAAAUOeeE8J7X9HbHcxkHfPFxwfajZ+ku5f3gyWfeGxWv6mFiONy+m
        zFi/Rj6k3TSxyCpo3mbo4Joyz5GuJVOYJ6h2mDoJiQ==
X-Google-Smtp-Source: APXvYqwXEkssJqbTmDrqvNywyodc/3AMhglFknj69Veuy+PImsyE8rqZmPtOkLWguna6Qh+Z4KDTdg2glDqKSmMUx6Y=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr24023400ljm.180.1562226255809;
 Thu, 04 Jul 2019 00:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com> <20190702223248.31934-5-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190702223248.31934-5-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:44:03 +0200
Message-ID: <CACRpkda+f2o+S25dHFLV+1Mui0-=ShiBSp_8J0W-ptNxTRLW+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: stp-xway: allow compile-testing
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     John Crispin <blogic@openwrt.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dev@kresin.me,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 12:33 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Enable compile-testing of the stp-xway GPIO driver now that it does not
> depend on any architecture specific includes anymore.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
