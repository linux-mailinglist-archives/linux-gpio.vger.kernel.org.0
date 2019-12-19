Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4927C126440
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 15:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLSOHV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 09:07:21 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:38779 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSOHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 09:07:21 -0500
Received: by mail-io1-f66.google.com with SMTP id v3so5868847ioj.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 06:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6k/Qj0SWvi251FmEMvYU5nN9ewMtMfEIuXrPQeg9+Aw=;
        b=UpTCp1DFb63YNo5yUIN5GN5ZNg/iIV7VV+yAFAplghPYsH0pPi3Ju/wshLojC7dPF9
         SFxr5CFeqkEYbIMeoSrKa6/xEJ/9H4qARZRaJNXOF5hN88gXp8pkObyCwOMQInEwj+2+
         YFG2YVz5AgAiVGWhlFWzrsPWtMjpt0SUCM9ZrA2Li4w7P3c5ttUV0TzMit71NIUDd0Ix
         zfY5y2GkR5mWHtuemWZtEJPc8u++OyiKGJh061i4MqK/MIJQAnsPLJpLbW76KnEnOCXR
         x0/S6knn1N7zRY4ILeV/90DqzcGwtpa3IYrnsCLlhzBqePBmlE38gQLr6rEyamzjSrzG
         As3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6k/Qj0SWvi251FmEMvYU5nN9ewMtMfEIuXrPQeg9+Aw=;
        b=g0VD84RcDOqFdivhNgzG4sgivLkN4IsXeC6LZLjPuTPedXcSCbmasuvHAexsevLFwr
         vZxaV814M9G6sfHr67fmVWY2FqxZaZX0MxpkODtORdjshWYXUTNFoguYNM05sctxkeUI
         vaanb376Dc9nTuOE9Xux2zrXxOaw8sUdAH8imJ6fjIbRQHq5AM0LDu75J0Ee5oN0/IQk
         wUx8JwtnBnZlNpEe15XvwZ9e2C/ISI2uHSA3ByoQir/MsdRF8JRk6IvVO+CoJzf+VAND
         85VM4D06dnUBH5OBdlLNkDRDouUM6R9YaWc9FdvhYbM6mUZRUCIlvnTh1w+PdQ04laML
         /TmA==
X-Gm-Message-State: APjAAAXbGWHCGhoeIceUxThB5QGMEwTAsJ6ntS7KERKaKnXcwwcPGG8K
        41NmfjWqPxn0CzVzOkK0huBBLECs8mbtrZhvppmkJg==
X-Google-Smtp-Source: APXvYqyOvDttQPDDNx69kBCqVez62qPfUsBeaFjtP0pfD5BD1dJy+f6XJdrd/IkydT4oSvJTqrutkvUfVLSIzprwgRA=
X-Received: by 2002:a02:3312:: with SMTP id c18mr7216260jae.24.1576764440948;
 Thu, 19 Dec 2019 06:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20191218142449.10957-1-brgl@bgdev.pl> <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly> <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
 <20191219140518.GA12078@firefly>
In-Reply-To: <20191219140518.GA12078@firefly>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Dec 2019 15:07:10 +0100
Message-ID: <CAMRc=MdKhLpBsDjcwM4JfFkUmx_VFAjfxNrMFWUBsc8ZWO49Ow@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 15:05 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Dec 19, 2019 at 02:48:48PM +0100, Bartosz Golaszewski wrote:
> > czw., 19 gru 2019 o 14:35 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > > +
> > > > +     ret =3D gpiod_line_request_both_edges_events(line, GPIOD_TEST=
_CONSUMER);
> > > > +     g_assert_cmpint(ret, =3D=3D, 0);
> > > > +
> > > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > > +     usleep(10000);
> > > > +     gpiod_test_chip_set_pull(0, 4, 0);
> > > > +     usleep(10000);
> > > > +     gpiod_test_chip_set_pull(0, 4, 1);
> > > > +     usleep(10000);
> > > > +
> > >
> > > I assume the sleep is to wait for the event to be generated from the
> > > call gpiod_test_chip_set_pull, which is not guaranteed to occur befor=
e
> > > the call returns, otherwise you can toggle the line too fast and may
> > > miss events.
> >
> > Yes, this is why I put it there. Otherwise, some simulated interrupts
> > were being dropped when they fired while the previous ones were still
> > served.
> >
> > > Arbitrary sleeps in code, including tests, should be avoided as they
> > > are brittle and obsure what you are actually waiting for.
> >
> > Indeed.
> >
> > > An alternative in this case is to add a second event fd and wait for
> > > the event to arrive there before continuing.
> > >
> >
> > I'm not sure I understand. We can't have two event fd's for the same
> > line. Or are you thinking about setting up a second line, generating
> > events on it and consuming them so that we can rely on the timing to
> > make sure the events were registered for the first one too?
> >
>
> I was thinking of two event fds on the one line, and you are
> correct, there can only be one, so that wont work.
> Wrt using two lines, I'm not sure ordering can be guaranteed as you
> end up with two separate debugfs writes...
>

Yeah I gave it a spin and it turns out it's not reliable - some events
still get dropped albeit less than without any syncing. The usleep()
calls are still better than this. Any other ideas? I agree this is not
optimal, but couldn't come up with anything else.

Bart
