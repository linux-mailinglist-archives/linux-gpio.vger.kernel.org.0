Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C80113E5D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 10:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfLEJm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 04:42:26 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44545 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbfLEJmZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 04:42:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so2118948oia.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 01:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M16yxDpYn9UDJVCbvQS7s+4Ht1K+4/sjQn4ed+gQl2Y=;
        b=rhn/I2qa1MOMrpA2jbedpqL1tIIkOjS6IZsW9SCXqYXSIXfSxK2fCzNv4LJZbQOPit
         vzJk9FfH+ckrPw0lH80ugedcjaYpw3ZYIY5d7izcmyx5kKGDCYUIa5gU5NncXs9JDn8e
         +6J1ULTl8FvvSnlt5CQxoRq50E9UjLlNPlBztpHXoVBpGH8Ckmow3zzwDoX9urNCUoSu
         ftfE4f7+x9OnEf3UJ5nm1NqBzx4SS/OL5KDIjEHwROKAsI22nWu1st8MIodz/JlFpk5T
         V6OUFIi9NhnCzMsZNdGJJJ/ksfA/WU53cYOVMYla7qehd7gnEQIhoTJPXRvuqVPQvgLs
         sZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M16yxDpYn9UDJVCbvQS7s+4Ht1K+4/sjQn4ed+gQl2Y=;
        b=fAyKJ/onpk57IAzeqdc/wYtBNKXwJu4N9/CriA3+apMeU3mHtF0rEh7fMu5YaNNPw3
         HTG/bXZx+rflFyM0cT9YFJ7Xxxw366DXntA4Xy/xH7e7PjnQfrbdVosXs82tdRsnZrut
         0f4pPFgyMayY3Osz7nHLosx2TuJ3fcuoqgkYaMwE3t0btp8nBo6FpLcBEVYbwUc6ySWB
         8AcB3BrxsUaJhrXaeF1A/YfwWVCYnKrWNjW1FCDRiTtQOnfj2051qMF40o55DKWAJ/nH
         UfZscJ1UpsqPRmb66ugDT8DzK9BYRZXvDA1J41MdcBqCkU0YwfdEZnCYZP+uQdUzePyx
         CV0g==
X-Gm-Message-State: APjAAAUagU1kW4Gmf1xC5PKRHgk897QDOWu48vsBUNsAnO8WRRL/rXZ4
        hOo2zIuyh+brddR72pu8KcjeAzl9Q/dSKcigpuD7iA==
X-Google-Smtp-Source: APXvYqwh5CXcbkuFA8xfFGxIPMeKJGhoX+55Swyky3xnEfrm/nIDW88vnWSBsV80dYujsZ41PFbsJ1zn1pr69ezYNgE=
X-Received: by 2002:aca:3182:: with SMTP id x124mr6518859oix.170.1575538944954;
 Thu, 05 Dec 2019 01:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
In-Reply-To: <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Dec 2019 10:42:14 +0100
Message-ID: <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gmail.com> na=
pisa=C5=82(a):
>
> On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently there is no way for user-space to be informed about changes
> > in status of GPIO lines e.g. when someone else requests the line or its
> > config changes. We can only periodically re-read the line-info. This
> > is fine for simple one-off user-space tools, but any daemon that provid=
es
> > a centralized access to GPIO chips would benefit hugely from an event
> > driven line info synchronization.
> >
> > This patch adds a new ioctl() that allows user-space processes to reuse
> > the file descriptor associated with the character device for watching
> > any changes in line properties. Every such event contains the updated
> > line information.
> >
> > Currently the events are generated on three types of status changes: wh=
en
> > a line is requested, when it's released and when its config is changed.
> > The first two are self-explanatory. For the third one: this will only
> > happen when another user-space process calls the new SET_CONFIG ioctl()
> > as any changes that can happen from within the kernel (i.e.
> > set_transitory() or set_debounce()) are of no interest to user-space.
>
> > +/**
> > + * struct gpioline_info_changed - Information about a change in status
> > + * of a GPIO line
> > + * @timestamp: estimate of time of status change occurrence, in nanose=
conds
> > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RE=
LEASED
> > + * and GPIOLINE_CHANGED_CONFIG
> > + * @info: updated line information
> > + */
> > +struct gpioline_info_changed {
> > +       __u64 timestamp;
> > +       __u32 event_type;
> > +       struct gpioline_info info;
> > +       __u32 padding[4]; /* for future use */
> > +};
>
> Has this been tested against 64-bit kernel / 32-bit userspace case?
>

No. Since this is a new thing - do you think it's possible to simply
arrange the fields or add padding such that the problem doesn't even
appear in the first place?

Bart
