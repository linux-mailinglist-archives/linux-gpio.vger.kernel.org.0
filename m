Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AADF15BC8C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 11:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgBMKRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 05:17:20 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:32892 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgBMKRU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 05:17:20 -0500
Received: by mail-il1-f171.google.com with SMTP id s18so4510607iln.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 02:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nwUeT3lZ8+uh/3kVImJSecB5U2oS2aEfDmRuh4Lgr9Y=;
        b=nAfu2JiT5pE00DmIrG2ADUntVaTjETs5C16tjokqa8kWu+1/jWLiAz/GSLxNYtKCcn
         lh7EU50m/ilHUMmX538on3Tu5El3ngwfFAEkd0ZVeoZUjbNm8QiEScdJq2DR4ox2VVXn
         EB3A1YwRIYiFbOiwduI5AUX50ggK6a9rSmJYNVPUgDF/EBLUfcv42f7Pg6W66vQboIbb
         8husRXjcbW4n7pD/9w+cDmDY/5636OMW31dIXaMjjEoHGjsTFbaybfVLi/YCT/CccFaG
         sH8OTodI5+eoxMri4hlGoO2KXFCOVkwsz62eddK+RqYUzO+qRUU3So04lbUXAPTzGYcU
         MzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nwUeT3lZ8+uh/3kVImJSecB5U2oS2aEfDmRuh4Lgr9Y=;
        b=ucZrwJPk+4zloM8HA9vs4oIeIQqmw4VWWDT0X2gU5++mGFKWHe5EeSMAJHXhlxOz26
         Zzr7u31+4smEHUgJmWJ9oaTXhKXORWbrhf4rEueSemcIUQrWcAx9KgibXxdo86x75XDp
         qGaqBs8MG4nt0qFpgyZKOqWb32zc8V/QZa3JJWnHwGX6+q6M0AsdOKJT6iZv7GoSKWjE
         ueuPBnJwrnADMGOcMmS+pAKPtjqlUhOGYtDSsPp6MDvqj3D4hrxWpOlB4Q69OANSCc+v
         68/R91wN6M6xJC3lK2XDnPHihbrTWh0cQLFm0+gO6b1rdHbfREX0u8hrV7iCY7+D5Mk+
         LbfQ==
X-Gm-Message-State: APjAAAWD86H0pXYvRl6v/dS/9WX/2jMAzHIy02vdjJ0bjVXCoa6ToENP
        KpSTUodxeaFR0r8fVpjxUdmzJd+4VEfYgWnTN7Wa0A==
X-Google-Smtp-Source: APXvYqwm3800NEDuGSb7mJP2UBpbBac/mst3rHUthaJqwd8JXJHoFRTum6oFnX+3XgAujz/Z0xV2C+SFfvqFqj0jDlY=
X-Received: by 2002:a05:6e02:ea9:: with SMTP id u9mr15400950ilj.40.1581589039611;
 Thu, 13 Feb 2020 02:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20200212074243.GA17928@laureti-dev> <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
 <CAMRc=Mdcg2hp0VUsQHO2kW_uTiDAvDTCckad9D5Ja002wn1LAA@mail.gmail.com> <20200213101542.GA16222@laureti-dev>
In-Reply-To: <20200213101542.GA16222@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 13 Feb 2020 11:17:08 +0100
Message-ID: <CAMRc=McPTNKo+J3s3h9NAr9s1eCOsd_oUu9jRLTkfKH2gfBgXw@mail.gmail.com>
Subject: Re: [libgpiod] consider changing the license of the C++ bindings
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 13 lut 2020 o 11:15 Helmut Grohne <helmut.grohne@intenta.de> napisa=
=C5=82(a):
>
> On Wed, Feb 12, 2020 at 01:58:40PM +0100, Bartosz Golaszewski wrote:
> > one more thing that's unclear to me: I found this post[1] on the eigen
> > mailing list and started wondering: what makes MPL2 better than LGPL3?
> ...
> > [1] https://listengine.tuxfamily.org/lists.tuxfamily.org/eigen/2008/02/=
msg00003.html
>
> Thank you for pointing me to this. I mostly looked at the LGPL-2.1 and
> overlooked the fact that libgpiod already uses the "later version"
> language permitting use of LGPL-3. Indeed, the situation is much better
> for LGPL-3 due to precisely the paragraphs referenced in that mail.
>
> Thank you
>
> Helmut

Does explicit relicensing to LGPL-3 make sense to avoid any potential confu=
sion?

Bart
