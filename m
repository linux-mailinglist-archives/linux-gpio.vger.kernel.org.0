Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8715FAF32E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 01:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfIJXTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 19:19:09 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:33357 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfIJXTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 19:19:08 -0400
Received: by mail-lj1-f169.google.com with SMTP id a22so18164613ljd.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQzzFJEZyin+tNmCAStXGylVOr1mA0WjPRqoFnYKmBk=;
        b=KtS5iJSgKtQiWjM3JHCKyYLGnW7UtL/owPW2qiYTUZLR/JxSArh8NB1ToLkgHmYp8Q
         O3qBTxHb2OcqamT7kV5X+tQCjL1XJS2nOkzzt2h37GVM1iqo1yxOtYYOyJkS3KF/omZE
         prYYhpLVVBA5RpwL7F8MfzgR24kx8jeZhnqAeGdr4MN8L4H7ub1VpF7c30yGvXg9akIC
         Np3ngj/Ru3C7HuPO2xQ/+z4VEgoFVEzBdjlYgpLkx0iiY11w1KEoV4P8ldpc1mMkTwWs
         4K59g2EJuiAG60NqlMSVPLrwQf65Uxsf0LBnlKK707ROD/1gz6CDh8wDdHDnGXIb1D48
         vbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQzzFJEZyin+tNmCAStXGylVOr1mA0WjPRqoFnYKmBk=;
        b=l/nROKStJQTPgf6Ztn5RBspJ6BCh2trBayx4m6dPq35uVkUqXL1IZfEkSZU3FRRYzM
         aHfjt9K0XHD3iilXyAd/VvOv+QV8pKrt5r9dgrfDkKO7+S6H87ChEzHYPor+j72/eoMa
         Y6gYlhxVlvNto44BpjoJQLhRPdOwYRKI+/curINDrEq0nmApHp38vCIH1vb0yMHyLeMd
         9ibQhJvIjTgElkUerHGx3wt1nK95fqsgKMJ9YqFRUuAxjcbGOMEWPQJxcTKIK8gC7cFu
         X5ka0OdxiQaNCwabhjHYXY8GNaKFyfCh7SV3S8csxvewYqRgK+fVnaSenZmGJpGefyi7
         XiMA==
X-Gm-Message-State: APjAAAWyfrRyMsYe6yMYm96ojFhgbxoKiQz9k/KaSbJzQw27wibjVuab
        tEtMd8h2d49L/2dkfm6borpVvBK4FhhhENVx8ZQ70R0UlJc=
X-Google-Smtp-Source: APXvYqyO+8h1Gs1reSMZiPHK5RUjxY31izln0QPgc/SX1O4mVYjM0RyRMUg01CM831mFyISrqkQd4DVp2/WdZsR2Vag=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr21392138ljh.104.1568157545400;
 Tue, 10 Sep 2019 16:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <08ac3d50-ae2b-060f-0210-4be213b6c97c@korgrd.com> <CAMRc=Md9yD6U+_BAEY_pB1vdri6oZuMLwAhvDuAgpee_bQEpVA@mail.gmail.com>
In-Reply-To: <CAMRc=Md9yD6U+_BAEY_pB1vdri6oZuMLwAhvDuAgpee_bQEpVA@mail.gmail.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Wed, 11 Sep 2019 00:18:54 +0100
Message-ID: <CAEf4M_B2RXbv-B2fsU-15iF56bO0_K--UeSdmdXHqgYNjCTbYw@mail.gmail.com>
Subject: Re: [libgpiod] hopefully simple question regarding pull-up/down control
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bill Barton <peabody@korgrd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 1, 2019 at 4:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> As for your question: it's in the pipeline, but it's not a trivial
> task. We first need to implement the kernel part, then define a
> future-proof kernel-to-user-space interface and then implement the
> support in libgpiod. For now it's impossible to enable configurable
> pull-up/down resistors from user-space.

Hello, I'm curious if there has been any further development towards
being able to control pull up or pull down through libgpiod.

Thanks,
Drew
