Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3963F2244E9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 22:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgGQUJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 16:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgGQUJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 16:09:28 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD486C0619D2;
        Fri, 17 Jul 2020 13:09:28 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k27so7193375pgm.2;
        Fri, 17 Jul 2020 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWgTw4SO7HlV8PPTjgP389Ux/qhYArlWIa2voew7JMo=;
        b=ott81wzf+3QElLTOn1rqr8bX/GCFvTHKKXe7X72vUj7IdLFfOmIyx2KmlScch5Y3Se
         DJA2mVl7SiBnANwMnJq1mpNyVf2B7it+sn8Sx5lODm3cBbFYG2ys5h5kaeFE5ayg9vof
         ThFyg0I93K2s4jWohSzdOZG9InUPiIyCaic2J/kkZh4LIxty1P0T0eDxbm3j0SRuboS4
         7vWXcwI9eb36kRCO/nH9/6hpRcNTvNJDbPxrHllKz/KZTWefW5aA37Vz8EiziqZovugo
         crxI8DtNA7DFhU5fEUhz/Kcy6787n05Y+GBRiWMIvoX5BspgQ5p1VyKGlQ7NihFgX7xz
         zzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWgTw4SO7HlV8PPTjgP389Ux/qhYArlWIa2voew7JMo=;
        b=LbFNJwbyYHWvAUtseRc0z1Bw3m5p6b4V4xtEn3PX+eB0hFjfWC0QEBGWObjMd96/Tz
         V6ohWPWv+Qgtijzpk7y36XpXfAzw0DLQ2VO8h8kXWqdkhk/SVybEd1CQ7Iu0vcOQa17/
         AtLekxr6kWGEXqhqKtyhG7p9LvK9o5sR/E1C8hrEDD0ZpSkm8v+wjlyauzIldaV6kkp8
         Bq1Yq95VdztbbEJcYna+VIGMJc+yQzJ2CoEqnTQ8Nev7rYJhDshtNGnv0gPENvMxgxZ3
         XMEQfasw2x95cAfZoi6dy4vrDJsYDzl6HQYAaboUTeczXqPkpvO8nEK8c+7lM1swVJ47
         KtAQ==
X-Gm-Message-State: AOAM5321ge8sOQblEb5z8MwKlpMpyQYLb6w/HhayZ0DLIS/LGjDywDnp
        EDjX/kuBnmeI+NOohBj9GsVENSm/PZ+uAuA6ygg=
X-Google-Smtp-Source: ABdhPJyRhxMlEuPo5nw1qAg9VXz35N6qGPUIcx/S6mCWJtx2WBrubDRGLIHaPmnOl69CtsAXW+0GH+PhrAARtTDCWEM=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr10278831pgi.203.1595016568213;
 Fri, 17 Jul 2020 13:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200717013338.1741659-1-drew@beagleboard.org>
 <CAHp75Vd_s-W7Z1iG4fA5JvY51OzstkTYUcQcd=OGJUQtcJ75Ww@mail.gmail.com> <20200717195028.GA1775511@x1>
In-Reply-To: <20200717195028.GA1775511@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 23:09:11 +0300
Message-ID: <CAHp75VcL8Cz3E5HB6WkpddNzGRBY8w5m5m_vbxEr5EfBz7mWdA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: print gpio number in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 10:50 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Fri, Jul 17, 2020 at 06:14:06PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 17, 2020 at 4:36 AM Drew Fustini <drew@beagleboard.org> wrote:

...

> > >   pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
> > >   pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
> > >   pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
> > >   pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
> > >   pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
> > >   pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
> > >   pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
> > >   pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
> > >   pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
> > >   pin 9 (PIN9) 44e10824 00000030 pinctrl-single GPIO-23
> >
> > Wouldn't it be better to have this for all types of pin controllers?
> > But I'm not sure about the format of output.

...

> I added the gpio column based on Tony's feedback [0].
>
> I'm not sure how I could do it genericly.
>
> The pin_dbg_show callback is implemented in pcs_pin_dbg_show() which
> prints the contents of each line in the 'pins' file.
>
> Any advice on how I could implement a gpio column for 'pins' file
> without chaning the pin_dbg_show in all the drivers?A

My question was exactly about changing core, i.e. pinctrl_pins_show(),
rather than each driver.

-- 
With Best Regards,
Andy Shevchenko
