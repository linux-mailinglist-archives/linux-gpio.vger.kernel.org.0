Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE86F2C2AA1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 16:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbgKXPBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 10:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbgKXPBY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 10:01:24 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A54C0613D6;
        Tue, 24 Nov 2020 07:01:24 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id v21so9564141plo.12;
        Tue, 24 Nov 2020 07:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e3cDrG679ihqpisNhP/stj2I962GpQ7amV8CNs8/PaQ=;
        b=smGIZTDgXcM6Jyu631FZoO91xmcTi16ubvE6AprWkirHNLx5TzD5S3wKvstwo0732s
         mZiopWnEsz/wcF3AOVkyWv/MVjzIJESUOq9yQE1moZM+73upBDzMayx7KpgFqbyEKU0i
         BdyL8siDS0BL/LW79RtvO6fjrwOtyoGBAv4ougj2hr8m3qYM5435R5vHT1IIJWtIbmRz
         bVtooDbORU0K+hwZHkVy/V87Ozz3cD5TzLEdl3Y6OYp3gSR2rCEFpIzEy4r1cXm890kL
         tIJLAhZJkQ5ohADKXNza0h6x3N5CqSYvCatTP8xpSaToIqkS8wxk/o98XRGLrIgq/9qq
         X2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e3cDrG679ihqpisNhP/stj2I962GpQ7amV8CNs8/PaQ=;
        b=SZBVxrRHyGxCO+QOcagnwGLQiXNi+UDZ/j2muOIG51Y3PZqMpyXwAIajLcQJtVkuHt
         UzPaGGOQlvy7Sdm5izhLsqqFIA4/0+JDwB+TgRmPPs7COS8Lx/k2QrmaLuQVgxGxRgTM
         M6pz0htK+k4ojU6BUTyeOICJUtfBiDB+2BauQtUI5H2FY7JfhCGMbuwu82YVUTEWvy4y
         3+2/PBrm6Erlkbmv20CyqJtFzSS/AacmxGQ+8mMt4PvgVJhHLf3Tpcsx5/gGt0ELhRkn
         PnenO0/cYH+SOthFbvkJh1kOaVAmJHFHSCyBuk3gx61dGbwwhRf7I8gTWOnyoFOf0eP/
         NR8w==
X-Gm-Message-State: AOAM532LynqNWzP0Sjye2Ja4LVPxD2iwl5VIGeq2jQTlHmFgDFEbBn2P
        ph9oAHPWtSrQHYi5kn93qE8mWLuQjqAJ2QM645Y=
X-Google-Smtp-Source: ABdhPJwRVslghkzivG9spVlq4JaFv1qAFKbeNSMKmoKNRE7VjMwKy2VrolHb9GNSCdYPl91dnM6lScdO0JkY+T48azA=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr4269486plz.21.1606230084391; Tue, 24
 Nov 2020 07:01:24 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
 <CAHp75VfpxvGgTyHFA6p1fmqpAu9ok3=ztGp3USviAHY6m8y=7g@mail.gmail.com> <20201124144300.GM2532@lahna.fi.intel.com>
In-Reply-To: <20201124144300.GM2532@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 Nov 2020 17:02:13 +0200
Message-ID: <CAHp75Vd6HJpt0DgE3ugB-qXGT5FL2tzg=CCKn9a-PeAYY+n+ow@mail.gmail.com>
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 4:43 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Nov 23, 2020 at 07:59:29PM +0200, Andy Shevchenko wrote:
> > +Cc: Mika
> >
> > On Fri, Oct 23, 2020 at 8:07 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > Hi!
> > >
> > > There is a pending patch series [1] to remove a lot of legacy code
> > > related to old Intel MID platforms. (Note, not all of them, since we
> > > have an ACPI based Intel Edison edition which continue working nicely
> > > after this)
> > >
> > > Most of the code is shuffling arch/x86 and the series is quite
> > > dependent on the contents of that folder (for the sake of
> > > bisectability). Since that the only way it would be integrated is
> > > through the tip tree I would like to have your preliminary review on
> > > other contents =E2=80=94 #3 and #4 are PDx86 and GPIO subsystems. In =
this case
> > > I won't resend this many times.
> > >
> > > I have a preliminary offline agreement with Len Brown on SFI removal
> > > (#2 in the list).
> > >
> > > [1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/
>
> Looks pretty good to me.

Thanks! Can I use your tag (which is better?) for some patches (which ones?=
)?

> I wonder it is possible to remove gma500 also
> or it is used in Edison?

It can be used on other platforms based on not-going-to-be-removed
Merrifield and possibly Moorefield.
Hence I would like to leave it for now.

--=20
With Best Regards,
Andy Shevchenko
