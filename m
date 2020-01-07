Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3DA1326B2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgAGMul (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:50:41 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36469 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGMul (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:50:41 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so38789117lfe.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qMXhXLoLeVvu5/KYc9JCl6rH4kjAJAtUCGbVA3bRuPs=;
        b=paHxzlrVDhvmFYeN1JGQwt2RwNg4fYmXZskPhFpHB3VCz1uJBigeHzwAv3aET5bv66
         25q2+0DyIkpyxS6j91qo5s9cKu6uckc+sNnqV9/5GG/SknHh7lJRgxJYlQfXIEN9PsAf
         +2HLTcKYN97TqviPUtqfs9qQWyjdbo8lg4R+k1XuJxkxlJ71gfJvjZMhIXBemRffD9XY
         89rcRqRZk1QW21k/VTCD7nCpH9B08Dem2GE3C1KIbg8aOulLbfrtb1R1YqpAU12q3aRW
         WBYntYA07sAdZOyekyHdoPm8s8BVUMPrlz5EQGLidmsr7sq1UrIWeOeEmT8Wc6z+CDfQ
         eTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qMXhXLoLeVvu5/KYc9JCl6rH4kjAJAtUCGbVA3bRuPs=;
        b=capsWbsHXlI7r6QzaKM1MNyAcJylS3mIFtuqaZAIKdhkzJyu1tq036TolyhwB1+Hoj
         CX+n4VuPwvPFtKYLQNP+wFj95WTs22/17UYgu5LsUDPp/vdTca+jtHke8+yNFlUhrYP0
         od0HmFPxlfX/dMKrS7R18U7iHvcK650UHeoNx/5467KQpX7qKxLdi2mwNTpE+aj8VSPC
         VDHo4FuUPj/RxRutJFwMD+gg5d9059kNbqTc4EGFY7ylfxqPnYDJWIgIpE8wYWQN/vo+
         Dl65PSvCnd3RVkx8vDbBH64Nh0g4YeKiI0bsdQpYenTdNfxAQYEjsQPRk2oBFk8ULpoX
         xQOg==
X-Gm-Message-State: APjAAAUcKXIPm9L0hTmNUIOwbbmQGloLIy/levHhTOi76gK3Punj4uuS
        BtBdn87eJ71zgI1G9PiEn3yYEpQEzsrC767JJ+U3Ew==
X-Google-Smtp-Source: APXvYqxktsFdjUU+MPfexe9Q+wp4ek2hQ056LJObVZR3yFINNyTkjkuQciwpvjnY63x1130vLWSj+yy7dPiIs6Siioc=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr59272175lfd.5.1578401439549;
 Tue, 07 Jan 2020 04:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <CACRpkdZ_TroKCAnDWiY-jPbe0NL+ingm1pMLQLPxT1Uh78kx8g@mail.gmail.com>
 <CAMpxmJXikLw0d1e1Eq7vVzoORz3utEBxfG6nRmkngLqezVqtuA@mail.gmail.com>
In-Reply-To: <CAMpxmJXikLw0d1e1Eq7vVzoORz3utEBxfG6nRmkngLqezVqtuA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:50:28 +0100
Message-ID: <CACRpkdY2NXNrAk9VY18YDeQ2WDfDfAyi4mgW26JuTPHdEOE-uQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] gpiolib: add an ioctl() for monitoring line
 status changes
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stefani Seibold <stefani@seibold.net>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 11:38 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 7 sty 2020 o 11:07 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > The patch set overall looks good to me, I don't understand the kfifo
> > parts but I trust you on this, though we need review from a FIFO
> > maintainer.
>
> Ha! This may be a problem - there doesn't seem to be one. This is why
> I Cc'd Greg.

I was under the impression that KFIFO was part of the driver core.
Let's try to CC the actual author (Stefani Seibold) and see if the mail
address works and if he can look at it. Or did you already talk to
Stefani?

(git blame is always my best friend in cases like this, hehe)

Yours,
Linus Walleij
