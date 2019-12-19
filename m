Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB7B1263F7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLSNtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:49:00 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40465 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfLSNtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:49:00 -0500
Received: by mail-qt1-f196.google.com with SMTP id e6so5071411qtq.7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 05:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nEi+rMseplpL8K9/o3hzvTeZzIKfvpTQTqZI1Edu43k=;
        b=HXJ8A1TMvEXeXH4rXf7H/skDPRbS3vl/upG5qoyTIAc2Wr000tSDZavV6dRp3bdyxN
         EAWLk0K8R4btHjWavREIJTMu/wULs6LC7cqRqSSpJbMxFd4Dbxxt8or/+9Obl6ru/lDP
         ARKn8zW9x+b0IlLPqpI2o8eRcSu1K3R3Uj1LbZYdzvwdLvZQfW6UCSnYrgLAmK/lUdBn
         SwqMbKqaFcL0PvGtunilt3evPV57A+LNIAxPBZA4UXLZhMrtRs2NkPK+HLyJhcXT3cYr
         Oajb2sXtLP3F29Thcu3sskCWYVzkbP+sfF2Yhr8JB2wx2as0A3DrSa72agEWaV9L7k2M
         1ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nEi+rMseplpL8K9/o3hzvTeZzIKfvpTQTqZI1Edu43k=;
        b=dpGV1qFrdRxKDFcO5sqQ+IsvBPgPHcab1V5CD3E3Gl5Bk+uGpbzBQ1nXU17rBPiXgW
         SgcrF+SzB0mO9Nw/B2TETMvLSz4+tVdFTGnfnPC0cagpAMjDGfjOjRMLn+E5lIoqQTls
         kcIRfm0o4lacxBGTKDDrzi/mWljhKsx3nnWRjKR9dzyTEuTQD5XvQbs1D1GSw3H+2SKw
         cI/J1fwa26eXL5i06Ol064a554LsI3XuApWMoIfZnsm2xQi4v0QZN2T7Hg4tAX4ehyTI
         lrt8FV5P+yy//h+CDpOLThQ4dHxSvempzGgKOKgqBTmdWWxxSURuoiOSf60arDj8WilF
         ONEw==
X-Gm-Message-State: APjAAAXZXeSBBBKZrQSU0iqqOx6XS91U347fKvzVblUtLpbEPawF5jMi
        UujVkFMu+yfbUJVgjkVrVQ2R2oiCPfp5+E01fyn3SA==
X-Google-Smtp-Source: APXvYqxGeMd5IjU8QIeZ2yLoV1XRjV5x1VtTy4h1Jv7wx+bC9v1ctKDBVuFm+CWnelvlrrz3wHPv5tjonbE1T7Nut8U=
X-Received: by 2002:ac8:704:: with SMTP id g4mr7011740qth.197.1576763339479;
 Thu, 19 Dec 2019 05:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20191218142449.10957-1-brgl@bgdev.pl> <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly>
In-Reply-To: <20191219133502.GA12028@firefly>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Dec 2019 14:48:48 +0100
Message-ID: <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 14:35 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> > +
> > +     ret =3D gpiod_line_request_both_edges_events(line, GPIOD_TEST_CON=
SUMER);
> > +     g_assert_cmpint(ret, =3D=3D, 0);
> > +
> > +     gpiod_test_chip_set_pull(0, 4, 1);
> > +     usleep(10000);
> > +     gpiod_test_chip_set_pull(0, 4, 0);
> > +     usleep(10000);
> > +     gpiod_test_chip_set_pull(0, 4, 1);
> > +     usleep(10000);
> > +
>
> I assume the sleep is to wait for the event to be generated from the
> call gpiod_test_chip_set_pull, which is not guaranteed to occur before
> the call returns, otherwise you can toggle the line too fast and may
> miss events.

Yes, this is why I put it there. Otherwise, some simulated interrupts
were being dropped when they fired while the previous ones were still
served.

> Arbitrary sleeps in code, including tests, should be avoided as they
> are brittle and obsure what you are actually waiting for.

Indeed.

> An alternative in this case is to add a second event fd and wait for
> the event to arrive there before continuing.
>

I'm not sure I understand. We can't have two event fd's for the same
line. Or are you thinking about setting up a second line, generating
events on it and consuming them so that we can rely on the timing to
make sure the events were registered for the first one too?

Bart
