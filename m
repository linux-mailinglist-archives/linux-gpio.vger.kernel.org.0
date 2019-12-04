Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DE011310A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 18:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfLDRq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 12:46:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40691 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfLDRq3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 12:46:29 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so24530plp.7;
        Wed, 04 Dec 2019 09:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Ef0Di1Mlcu80Pa6OnzfRhYDxxXa3qHYCdrx2xSTUmc=;
        b=G4LQ6SqcaxFkJGoL1gpd4ycNNviowxOzXjMa51EICkpxjrYYKiJD3loZwTL+Gkv4It
         8tnh8Jh31009rAnHy7t5m5o9L4JQhj8UnsU/g/TZX+KIIy7cF4uxsqWlPNw14XbfGt5L
         ZfMFGGCNIBRexdOkiAXYyvTNGmrQRg1Ekd0r1RaXg1PWZBupfKwBcjUCD9n0bIG3JdN2
         /uZc71iqkVP4G/1nsUfAbPkpEpXihYZ2kT1OSmLohRYMzGE0oONmwZ79plxW1S9qLJDm
         e6wmAkszZTetCNq+go9X7sZJxsGFbn1A+Y21YkkSpp0UCJO3nHHsetNaD51Gd59goGP5
         ei9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Ef0Di1Mlcu80Pa6OnzfRhYDxxXa3qHYCdrx2xSTUmc=;
        b=sTndvu00bd62VfRAT3e0Z792RxLVXA5QZNESEXgFZgL+5B+dXkKoRgFdewu2JzdOs0
         SNPFM0hP2MoId3c5PG9U353WYuJYlGlORIgGPrXbRWkfm8U8APBobWB+22bzndSiB384
         4H7eN/2z40dEbhnT9+SlgfaTpKXY/ckFb2YwK8maQkwxHhO3B5MpcRFaPZwE2IizvcpT
         QwMZWAMKKOjj3ajNI1/urofloQ0anvPN2gAKIBp2CnBt9OBqXJwg05G4X0U3P55UKwvj
         ydbBwEL2tbWaCv1TGSuxkWXZZsk7R/g7AX0DtVad3F6cQPwrGk4MZNgiR+8lakGP1q0C
         PkFA==
X-Gm-Message-State: APjAAAW5IDu3lWaguT4Dn5ySM3jVgOkVdHIT8qLkMOCwazL8mFSSamgN
        pCT5t3KGsVEoL5F2DZxmvdg+mwjzidmrLZKIiBA=
X-Google-Smtp-Source: APXvYqxiM25mDXDKoFbGOZwJwH0bs15OaVwiQHsUdLywdLhGhJgTIeOLfUI/3u70DWdr0QFAtP0DkmvBfaWiUg2YCwo=
X-Received: by 2002:a17:902:9308:: with SMTP id bc8mr4717449plb.18.1575481588283;
 Wed, 04 Dec 2019 09:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-1-cleger@kalray.eu> <CAHp75VcMm3PPAgfFPLzVwg_RN7_vQfRmufvWiPOkYaErdGiNsw@mail.gmail.com>
 <2116673293.95313020.1575466238935.JavaMail.zimbra@kalray.eu>
In-Reply-To: <2116673293.95313020.1575466238935.JavaMail.zimbra@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 19:46:18 +0200
Message-ID: <CAHp75VdrsM8hzKdOo0AnRoEeTK-KKy-A-Aj_7yuEp9ZMNUjZ7g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
To:     =?UTF-8?Q?Cl=C3=A9ment_Leger?= <cleger@kalray.eu>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 3:30 PM Cl=C3=A9ment Leger <cleger@kalray.eu> wrote:
> ----- On 4 Dec, 2019, at 13:24, Andy Shevchenko andy.shevchenko@gmail.com=
 wrote:
> > On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:

> > This series misses at least GPIO ACPI maintainers to be Cc'ed to for
> > the certain changes.
> > Moreover, I would like to see entire series in the future in my mailbox=
.
>
> Sorry, I messed up with get_maintainer.pl while sending the serie.

It's not your fault. I sent a patch to update MAINTAINERS to include
header file under GPIO ACPI record.

> I can resend it properly if needed.


--=20
With Best Regards,
Andy Shevchenko
