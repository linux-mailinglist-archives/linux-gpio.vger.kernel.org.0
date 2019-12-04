Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBB91130FD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 18:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfLDRor (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 12:44:47 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43766 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDRoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 12:44:46 -0500
Received: by mail-pf1-f193.google.com with SMTP id h14so181938pfe.10;
        Wed, 04 Dec 2019 09:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xieo7DVrzh+d8TV7kse3tIsl9PUn9L4rgSef1a60iA8=;
        b=Y8eDwwoj1dZld1AfGYSlrrpu8jykA5AqMysL9yMy+QqMWtZhws7mKm7TFcJ3iMlPRg
         MVugd8YY5lb8A3IvJkuM5CcNvpMZoYfeZ3tJmow++HxwiKAEm7k8CTJu/Hm/V8eF/dGo
         ktyduDDN3aw5S4c0esnwX8Ybi+XjGuTB3oJ5ufbVNJfp9nGwYVUYyQhhpVkLbtS1VljG
         OMm/4q0/oj8y+ASPIQahScGplo6l0tOGUAm0rbTUGGAtVG2rilcfuM0qpfscfWOv9hx0
         t3Mz+x5hYVYwTIqn8T2II+APZcNYZCnQ4cnQRLubu71mGC85eLGYl7jmPQpnetapXlCz
         h6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xieo7DVrzh+d8TV7kse3tIsl9PUn9L4rgSef1a60iA8=;
        b=p+8kghuUM3hE0PRV45q72/iFhvCQc93Z47PAJrNHbY4QHYtRqS/qdhNK90QH5Pnsdy
         uS7Mh0qGbmyhjahPlNsG74NrCj/6ARQRrgFVcAP/+YnjC18HEhiqaaOQP5cz+Hk86zqy
         DsCLSIwdYJLfXY92GEsp9DWmAABZoWEB9eRNuCiQIZ7n7CA6wScrYW+oHXd8cAgXCM+x
         CXz/DGX4qEZxp/vtcmwEG7ODo8rcrw6DDOohRDzLFmyRjI+3zhe73L4u883i5yRhkcqJ
         n31wT6DnsbxIxMt2YZgbSdUzQcI4AznNsRAm/Ou8ag5m0WHIWvriLHSlY1NhpCLQZsaG
         2zEQ==
X-Gm-Message-State: APjAAAWzQwShG9JMMrFJ1RUpFkYCiA/I5NZM5PUXfqZhKwHumIjCn6EJ
        o4B+7Mle2FoKdSvMJuBwncfFn2FoNLh1xpSzKXE=
X-Google-Smtp-Source: APXvYqznW9TB0OrpUSEqOd170HVXG7xE9GtDvD0yoK/7HBIN2nmukdhetAltiRvEX9B3hwPS2833/nDabw/8e/aN6Ps=
X-Received: by 2002:a63:941:: with SMTP id 62mr4933191pgj.203.1575481486183;
 Wed, 04 Dec 2019 09:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-2-cleger@kalray.eu> <CAHp75VfL5mRB0wy86_352nosKkKqVLZC_amCbLvhBTyNZztgRw@mail.gmail.com>
 <1746901411.95313623.1575466785578.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1746901411.95313623.1575466785578.JavaMail.zimbra@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 19:44:36 +0200
Message-ID: <CAHp75Vc4qPeVmzgn8fn+EweoSoKveK5tDS=RwmfASojDcxuWBA@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
To:     =?UTF-8?Q?Cl=C3=A9ment_Leger?= <cleger@kalray.eu>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 3:39 PM Cl=C3=A9ment Leger <cleger@kalray.eu> wrote:

> Ok, should I fix the original driver first and then submit the serie to a=
dd pinctrl ?

I guess so. Because we definitely don't want a churn with exporting
symbols like this.

> ----- On 4 Dec, 2019, at 13:35, Andy Shevchenko andy.shevchenko@gmail.com=
 wrote:
> > On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
> >>
> >> dwapb-gpio driver which uses this function will be moved to pinctrl fo=
r
> >> pinctrl support. Export this function in gpio/driver.h to allow using
> >> it.

> > I don't think this is proper way to do it.
> > The driver has to register IRQ chip and GPIO core will take care of
> > ACPI related stuff.

--=20
With Best Regards,
Andy Shevchenko
