Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4A61A7FA6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 16:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390518AbgDNOZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 10:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733197AbgDNOZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2020 10:25:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F41C061A0C;
        Tue, 14 Apr 2020 07:25:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w145so9532583lff.3;
        Tue, 14 Apr 2020 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AL/rSIOXzRALhbbc7RDQ7dvSGuJ4UW9/hNwkAujcGNE=;
        b=Kc+D8iHok/nMrc7I4UEn1Y13I9db33Tnbg8Yp/j59jx5AGWSg0yG+gH6MeavyHw4ki
         j6Idw2cz18ZAzOhcTuN2gpo6L90409Hfuub5DxzTUFyDRJSCZge8lRp1Xk1iCWLmES3b
         9zPWN4w+Xc0Sh2tjpUN0AFYpctZ9Q1KiSaKXPzdeqItbmh9Z/FcuivQ8jePErCzwWHWH
         K8UuCTojhsMPPcT5e8zbphpDUkyHXqvy84XjKpRc5Zq3SCaszoMEa+lXVbgW6oUWMxpl
         2174dc071AYwqE17GPRYLvY+kimZv/VgkqYE+0lOVNo2Fz8IEabZ9y6lU13f9mqwqtau
         wvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AL/rSIOXzRALhbbc7RDQ7dvSGuJ4UW9/hNwkAujcGNE=;
        b=EBpwKDjeATsnTXSXVBdxGJPo+L4V9uMCmcmM1c5LYZLinBSdKUIjaAPgyqI9WqL8Db
         issBmmA77fWmiSk4hRT1Cb3Mauq+j1S8rz8wCWweUfEtF5rmwgkUSD2PGugFAT68by7P
         m7SO/mncfG5R/Z2u7FYfOiriCkDaLNcXHfW18ksowDwgMDkcXn8JTs9JrvomjSSYnPgX
         btUz/R2puD73kYVlHd8piiJWLCLdXIMhcrv+uBW9kXMuFBk/ky1ERQtN7G7eTvgsE3Ws
         l3NKOsoLWq2ptCMxdj4F8OFL8vO10Dde0dilIX+d5EOm812XlMiYQ886oveIJF3GGs8d
         tTQA==
X-Gm-Message-State: AGi0PubViamBfK+CweynGGm7kEjLX9EeNFYdAnT/YB9H/o/ogwNqslbg
        XVHB5XY6sa2OLZssInpcoKOFXv39SRcyhDBJkRk=
X-Google-Smtp-Source: APiQypJKK5USiZiW02S04+8XOtcQAW77nGRQKVMZt7WWJ5TscSAZP727xWdAYZV28idFeAINydz8jeD/0EmxqcGZD6o=
X-Received: by 2002:ac2:569b:: with SMTP id 27mr81255lfr.134.1586874346415;
 Tue, 14 Apr 2020 07:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200406165115.25586-1-pthomas8589@gmail.com> <CAMpxmJUUp5whscqBX2CU9--4zrh_+LUQOwVt1yUpffJQdPftkw@mail.gmail.com>
In-Reply-To: <CAMpxmJUUp5whscqBX2CU9--4zrh_+LUQOwVt1yUpffJQdPftkw@mail.gmail.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Tue, 14 Apr 2020 10:25:35 -0400
Message-ID: <CAD56B7c3xewt7LD_1=FQgLk=kNqeouznRuyUh4n=AkNnvdowpw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-pca953x, Add get_multiple function
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Hi, this doesn't apply on top of current master. Can you rebase it on
> top of v5.7-rc1 and resend?
Yeah, I saw that. I'll resend it.

-Paul

>
> Bart
