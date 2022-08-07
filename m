Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE1658BAFD
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Aug 2022 15:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiHGNUv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Aug 2022 09:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiHGNUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Aug 2022 09:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8742395B3
        for <linux-gpio@vger.kernel.org>; Sun,  7 Aug 2022 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659878447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X//k6+FNHhJAUG8QayckaY6B+DxZJ/GB5iffLRC3cB0=;
        b=PyMmB/QEveZQa9SoDWArpRjZ7ycgCHCFTETMLVx4TtWq+GqvBxSr8D8LG+TdTDUyZXkcwl
        cbJI9PGuTMjwRaagTm384jpfGUyAWcPbLE/gK46BqjyPl6bwQ7cDxIXtS+kN4cmyZ9x6e/
        2GUtlc2QkJgwavogJT8LyLY4EyFrbRU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-jKgGJ3CZPBaclst8zbNCJg-1; Sun, 07 Aug 2022 09:20:46 -0400
X-MC-Unique: jKgGJ3CZPBaclst8zbNCJg-1
Received: by mail-ed1-f72.google.com with SMTP id m22-20020a056402431600b0043d6a88130aso4303569edc.18
        for <linux-gpio@vger.kernel.org>; Sun, 07 Aug 2022 06:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=X//k6+FNHhJAUG8QayckaY6B+DxZJ/GB5iffLRC3cB0=;
        b=xVE+bGYuDuFgCEb+m66fz3yIEIGj3SKVhmVT0MLcJtBg3+Dl3sAs7Y40cE6roahczR
         gKgzc4Xcp00fYbitFfjkKlcCbaP+KLDE2gITXuqgyks0rdyqS5gR2vU9AAyXO4/4PLmV
         YSmFs7FFtJ8eS5naYifvKOHx9+1nng4RxR6KgHKbS7+iAnn1i7Ef/CtzBlxUk3794EoR
         W69yUZvyTju3V/VB2CXrwR53d2TkoHgOnICKBolEX4/tOEVFpLnVrZ5x2Y/JeGTzojen
         LTd+LKHzq2EIEhcOEWAFXRebNrl27Vig03AY4gKp2fxuWyxtAYFqSNIE6ipm8zemZh7h
         Oebw==
X-Gm-Message-State: ACgBeo1UxqlkEgAZGylE/zQ5Ty01rf0N/dzQC6UzpWOZe6DcNr1ji/0Y
        AglfHi+bJzDatQA6UAIFlaLxvutL8ZPA6PZQVjXg0oeJjcR8RgnTn7uF8BqKyLDhuddwQwCWIWd
        s9/jdg/ugeVbfqROrlBpo47M8BDgSBsUvY4P7kw==
X-Received: by 2002:a17:907:762d:b0:730:a52b:bdc9 with SMTP id jy13-20020a170907762d00b00730a52bbdc9mr10626328ejc.565.1659878445156;
        Sun, 07 Aug 2022 06:20:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43gqjYyJuUU8yeab96AOuroYzxCkCa+v1VR4j9w4oVQoMttQHPrU8GH5Z47sLyqPitXBDEaEOHvC3iPOeXaL0=
X-Received: by 2002:a17:907:762d:b0:730:a52b:bdc9 with SMTP id
 jy13-20020a170907762d00b00730a52bbdc9mr10626319ejc.565.1659878444961; Sun, 07
 Aug 2022 06:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4BcJPg@mail.gmail.com>
 <CAHp75Vd2dh5QDxAY-9N0xu6D0ywBcYnRL6FF5ZoKdqnnkBtAyg@mail.gmail.com>
 <20220806134052.GA26217@sol> <CAHp75VcZ8UxNiGKEq=uU5UFx+XK-B8zOjfChNqM9P-+Tf=dJAQ@mail.gmail.com>
In-Reply-To: <CAHp75VcZ8UxNiGKEq=uU5UFx+XK-B8zOjfChNqM9P-+Tf=dJAQ@mail.gmail.com>
From:   Robert Baumgartner <rbaumgar@redhat.com>
Date:   Sun, 7 Aug 2022 15:20:33 +0200
Message-ID: <CAKdJ40QmeOgGdbscp06BorATN3d1gW0zraTB+FKSXqRbgowRQA@mail.gmail.com>
Subject: Re: [libgpiod] How can I use PWM
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Andy, Kent,

I believe I am on the right track.

I added following line to my config.txt
# enable pwm on pin 18
dtoverlay=pwm,pin=18,func=2

Now I have
# ls /sys/class/pwm/pwmchip0
device  export  npwm  power  subsystem  uevent  unexport
# lsmod|grep pwm
pwm_bcm2835            16384  0

and an example I found is working
https://github.com/jdimpson/syspw


Kind regards
Robert

On Sat, Aug 6, 2022 at 4:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Aug 6, 2022 at 3:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Sat, Aug 06, 2022 at 12:12:31PM +0200, Andy Shevchenko wrote:
> > > On Fri, Aug 5, 2022 at 1:17 PM Robert Baumgartner <rbaumgar@redhat.com> wrote:
>
> ...
>
> > > No, you haven't missed anything except Unix ideology. That ideology is
> > > telling us that one tool for one thing, and in very featurable mode.
> > > That said, lingpiod is exclusively for GPIO ABI between kernel and
> > > user space. For PWM you need to access the PWM ABI in a way how it's
> > > represented by the Linux kernel. I believe there are plenty of
> > > libraries more or less okayish for that purpose, but I never heard
> > > about any official library and/or Python bindings for it.
> >
> > I'm assuming Robert is refering to software PWM.
>
> I don't think so. The article he referenced clearly tells about two
> (hardware!) PWMs.
>
> > AFAIAA Rpi.GPIO doesn't
> > support hardware PWM, and the referenced article also refers to software
> > PWM for the Python case.
> >
> > libgpiod doesn't directly support software PWM, but it is fairly
> > straight forward to implement yourself using libgpiod.
>
> Hmm... I was under the impression that we have pwm-gpio in the
> kernel... Can't find quickly if there is one.
>
> --
> With Best Regards,
> Andy Shevchenko
>

