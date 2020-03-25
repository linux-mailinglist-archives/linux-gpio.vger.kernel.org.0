Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6523F192355
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 09:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgCYIy2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 04:54:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38432 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgCYIy2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 04:54:28 -0400
Received: by mail-io1-f67.google.com with SMTP id m15so1443910iob.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W2aO09GaLIA//OMpryPJlfnUBRQNatfNyS/NGPJVmt0=;
        b=l7Wd4avBr3tySjTbJroFT1B9WaF0E2Axi9USU3FzFUiWaxqqxB/7FNmUpoaKaK+Orj
         d2olp8y7qKCXsr2uS8G4JQcxWJgb5M21St3LbEO66QYYtaAin54Djg35xBXa0s+k2L8e
         4XlR0u/5PQZiGFYNoEy2X8Yv0bot7Kn2YDSqsgCuP4SX9yWEZ//ZeoZxhLc/v1JhtbBj
         Uh1DuDeslVSHiHIDn3Pchy/wmX6sPfK1cPFrKsp/qSB2n8ML7WdnTBhcQFHiioo5Tf0W
         TGwxOsqf46jaAegqPJ+EV3HNDXpCON25uxEPsjPehosRCLT8ExZCMrqkrLxniGatLlJh
         /bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W2aO09GaLIA//OMpryPJlfnUBRQNatfNyS/NGPJVmt0=;
        b=hpkwJe4SlbIuPKz0A/yxnzAjvk6qV3qViCuVaRF72yw8s94Yr7vkOKss2PzYJuoGmE
         ZN8NNyTv1BQpgEe1GSMbCDfz4yX8J5/PpkLo4AtKEtT/Q+u/D6gLrZaegqPP2A/avvtl
         ayclVnqv8XnNQUnjXrMFxVkKpoaKKduD+TOFCEUrFyXMz9GUd/5VkTBb71RlrY2Dksj1
         AFv2zJnPn54Dd+uuG5PvWc2AQsyZkfTlwV7zg3UVcBjjkeRXJ8IbYENlFndLGh+D/zUK
         7IdDvTPhTxnDlMG+JsDJwsw1K9FUsJrWY57HZuTN8kx+LFBf/pSzRskEtL2g3uMWTTff
         2EuA==
X-Gm-Message-State: ANhLgQ0vM534tKxJa33zvhZ8Tdpj0wOoef//SVJ9fGueQ1kaYyIi1ufu
        Qu3odoMw+DeB/wz/EgAa6M8O9f4QJkSNV8mpluvLvQ==
X-Google-Smtp-Source: ADFU+vtIRncY7HcI4oekbiMR8AFXoSIEI2ly47rx88dyx6k9Fn0z2aEvCxU4x2ktrYoxK1aB5kqUlbZhbERPo2WEglk=
X-Received: by 2002:a02:a882:: with SMTP id l2mr1951442jam.102.1585126466058;
 Wed, 25 Mar 2020 01:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl> <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
 <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com>
 <CACRpkdaQQftxqVLNYeNnVzbYO+S3fKeVqshO98On+WJ2WdcALw@mail.gmail.com>
 <CAMRc=Mfx-rYCC8sqtTthhzND_-k_oZxOen900q6fcZr6GZ0KKQ@mail.gmail.com> <CACRpkdbbJp91_tZaX-c5Mbhjm3Yf_ah-SjFjZ-kfF1TJNmZefA@mail.gmail.com>
In-Reply-To: <CACRpkdbbJp91_tZaX-c5Mbhjm3Yf_ah-SjFjZ-kfF1TJNmZefA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Mar 2020 09:54:15 +0100
Message-ID: <CAMRc=MeJzUPygg0D_9zpXXDP6i8JP5khRJfsm5NrfnnHQ-Pk3Q@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part 3
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 24 mar 2020 o 22:15 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Mar 24, 2020 at 6:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > wt., 24 mar 2020 o 17:58 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
> > >
> > > On Tue, Mar 24, 2020 at 1:34 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > > > wt., 24 mar 2020 o 10:05 Linus Walleij <linus.walleij@linaro.org> n=
apisa=C5=82(a):
> > > > >
> > > > > Hi Bartosz,
> > > > >
> > > > > On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > > > >
> > > > > > this is the third and probably last batch of changes for v5.7 I=
 picked up
> > > > > > into my tree. Details are in the signed tag. Please pull.
> > > > >
> > > > > Which rc is this based on? I got a bunch of unrelated changes, so
> > > > > I suppose I need to merge the right rc base to the devel branch
> > > > > first.
> > > > >
> > > > > Yours,
> > > > > Linus Walleij
> > > >
> > > > Hi Linus,
> > > >
> > > > this is rebased on top of your devel branch, so you should be able =
to
> > > > pull it alright.
> > >
> > > To me it looks like it is based on my for-next branch which is a
> > > mixdown branch that I create solely for inclusion into
> > > linux-next.
> > >
> > > Can you double-check?
> > >
> > > FWIW for-next is created like this:
> > > git checkout for-next
> > > git reset --hard fixes
> > > git merge devel
> > >
> > > So that branch is highly volatile and not very good for
> > > development.
> > >
> > > Yours,
> > > Linus Walleij
> >
> > Hmm maybe I messed something up. What branch/tag do you want me to
> > rebase it on then to make it the most comfortable for you?
>
> v5.6-rc1 or my devel branch (e.g if you have some deps) works fine, thank=
s! :)
>
> I tend to base all next development on -rc1 unless there is some big
> bug fix, then I pull in some later -rc as well.
>
> Linus

Ok, current devel branch from your tree it is. I'll send it as part4
in order not to delete existing signed tags.

Bart
