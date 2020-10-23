Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AA6297583
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 19:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752994AbgJWRHI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 13:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751575AbgJWRHH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 13:07:07 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72615C0613CE;
        Fri, 23 Oct 2020 10:07:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id x13so1727291pgp.7;
        Fri, 23 Oct 2020 10:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+fxpDYm7C3rVwjeo6HKW/dMvFh98f9UBjpfGnryPKpI=;
        b=BBJZHbZe95C5QpVNBrwjT9sdpX7YUUy0kR8+3at3D7FXokBB2MskRpfweGiLrAeez0
         4+ExvBjAkF7U8QOdVsvLiXglq/Co4vH+jpjR4M+PECRn2Nb8obQzb5ADTkSqAaU3aPPz
         xW+ROLwg26g9TG4EVPVkF2ihS1bHxHTc+w6yQiRx9ZsE4yyHPGegefdSUUufHw9u6W9R
         wYFAOcWJNFXO0Dq0V5V50RuNetAdLV0FUawWJMMjtmlZPKpnBbbrQH67c2XfRdtwKlcr
         VgB0/2K9KVs5AnSXh+I9yf9HpsY8yH/Bojsw3A1N+l6Acu6zTHZ5cCyE6JxWannrWkqo
         jB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+fxpDYm7C3rVwjeo6HKW/dMvFh98f9UBjpfGnryPKpI=;
        b=GF+aXieut4v7gc0zrqc1/uMPwqyqlXtWbDvWVHELwhUryabU1RPIOb7Pd3D/Wh8vhP
         4/rX8J8oaea309GewkRqfr7UAhMPFhOO9IfZc9HH3CCPuSHshGDmtJ8Fw/i7opLQygwU
         XIzTyIrkPIBfpPV1cObP65XfwoEHbA/gj1XqVGA5KTBPrwJ/IyfDOpAaEa0BrVnm4THG
         cSQvIIKPMNIp3cqFQa3Ju5whjJAyeX0xqp7N6/NBAaZqL9PHSjbdTb3lF56WbyAJb6bU
         mmN1BZAoeN2GMWDbFpFbQpLSICFXJizkBHjRbJtQoBB0QA2QrMntyjonDWT4JJmBY76w
         xtkQ==
X-Gm-Message-State: AOAM5313wqYxln9iQlqmfR/F7Pbwexornm7u2B32aFgepzWmK8EKWJVf
        tQKR5b7NmSAluvXCUT/aMbWU8QoGgh44Ka5ldog=
X-Google-Smtp-Source: ABdhPJxktvpIzNJ0eO4BRDCRmf09akagwcZhDeD3Nxdq0gnyXv8qKT3zf52gyWNTYUCnqGLcEmXVEZArgR+Ud1MxFz4=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr2150440pgi.203.1603472826884;
 Fri, 23 Oct 2020 10:07:06 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Oct 2020 20:07:56 +0300
Message-ID: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
Subject: Request for pre-review of pending MID removal patch series
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

There is a pending patch series [1] to remove a lot of legacy code
related to old Intel MID platforms. (Note, not all of them, since we
have an ACPI based Intel Edison edition which continue working nicely
after this)

Most of the code is shuffling arch/x86 and the series is quite
dependent on the contents of that folder (for the sake of
bisectability). Since that the only way it would be integrated is
through the tip tree I would like to have your preliminary review on
other contents =E2=80=94 #3 and #4 are PDx86 and GPIO subsystems. In this c=
ase
I won't resend this many times.

I have a preliminary offline agreement with Len Brown on SFI removal
(#2 in the list).

[1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/

--=20
With Best Regards,
Andy Shevchenko
