Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F10AF191BCB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgCXVPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:15:42 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:46133 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:15:42 -0400
Received: by mail-lf1-f49.google.com with SMTP id q5so2615642lfb.13
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0xlKw7FlZJpHme1uYVMMtLHfJ4ZjoT0kWFs0zoUqT3g=;
        b=OUVaMDnGnVqkou7If8KnHnpymtOpa7HucLC9ODvj1L4UpCntbNExJjjzzCuMdf50Uz
         bxCVRgi6OGhS2QzFQfgVVK8lKQCeWulYL5gojunZHYFMl3CkDUn1ui3MCTx6GOql+ynZ
         Aw8BYU5Bizn+8fDffxF8cR8B2/YyxHPO5m454hk+UuEdaTDAYucbx8+JEtvshs9Qx74t
         Hn/I3Vn+Uo+6ic0dUbFFDu+SB7MUMAP3Zuz2EznD5b4p+hOJVCAwkuG4AZMZIURcDaZQ
         uOhQk8WQf+L9V+K0qigAPLDrxnm7r2sG3arlbUsESDElOwnAAuVd11lyfMq+gfdjb4TH
         t5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0xlKw7FlZJpHme1uYVMMtLHfJ4ZjoT0kWFs0zoUqT3g=;
        b=JH8Ya611qQuQk1kr8AosDlM9lo6BlbQs5+xorYmrriWU5IVRb0QN/E3IriF6KYpSQV
         Xzic4NzLBj/RxI1PkuUTr6DRb5o86MMgwc4qXGbI2Tqu6upwuVrhjhgB6fmSdMAy2YP2
         bSte69SlbqZXITFhJ2uGlw3plu1RDLzfxYVqHcA2xNqfG8YTU8N0A5OqQwUpQwD/ah+L
         Hgoy8pvYr0S7/Yvg/Bfm9VqcLM+BrtnXFtoPhpBNXFtYL30aEnOo1X7vpIj+TdeBBGJ8
         RB66tY+Mmvlr7UdYjkdTZ6UXg2FFydDT0N5H6OWD150qSi1yF06XZL6msy2UWgl+8zEC
         2Zww==
X-Gm-Message-State: ANhLgQ1Yz8MusWM6RriF+b+EyQu08VLLPeC2x61NeWyJrEn/twNdqh34
        OHmkNWT13E1jPW0AII0qpWcNrUMwbtZKy1rv85FpxQ==
X-Google-Smtp-Source: ADFU+vsTqN5+qBq9AILc0YbEgP4wuWCqyzn5Yt8i7WjXEvIoFJiOXLBJ0Jc+lIixRlBFrElgFKhO45QF6w6+O9lIInA=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr42351lfc.4.1585084539422;
 Tue, 24 Mar 2020 14:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl> <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
 <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com>
 <CACRpkdaQQftxqVLNYeNnVzbYO+S3fKeVqshO98On+WJ2WdcALw@mail.gmail.com> <CAMRc=Mfx-rYCC8sqtTthhzND_-k_oZxOen900q6fcZr6GZ0KKQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfx-rYCC8sqtTthhzND_-k_oZxOen900q6fcZr6GZ0KKQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Mar 2020 22:15:27 +0100
Message-ID: <CACRpkdbbJp91_tZaX-c5Mbhjm3Yf_ah-SjFjZ-kfF1TJNmZefA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part 3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 24, 2020 at 6:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 24 mar 2020 o 17:58 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Tue, Mar 24, 2020 at 1:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > wt., 24 mar 2020 o 10:05 Linus Walleij <linus.walleij@linaro.org> nap=
isa=C5=82(a):
> > > >
> > > > Hi Bartosz,
> > > >
> > > > On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> > > >
> > > > > this is the third and probably last batch of changes for v5.7 I p=
icked up
> > > > > into my tree. Details are in the signed tag. Please pull.
> > > >
> > > > Which rc is this based on? I got a bunch of unrelated changes, so
> > > > I suppose I need to merge the right rc base to the devel branch
> > > > first.
> > > >
> > > > Yours,
> > > > Linus Walleij
> > >
> > > Hi Linus,
> > >
> > > this is rebased on top of your devel branch, so you should be able to
> > > pull it alright.
> >
> > To me it looks like it is based on my for-next branch which is a
> > mixdown branch that I create solely for inclusion into
> > linux-next.
> >
> > Can you double-check?
> >
> > FWIW for-next is created like this:
> > git checkout for-next
> > git reset --hard fixes
> > git merge devel
> >
> > So that branch is highly volatile and not very good for
> > development.
> >
> > Yours,
> > Linus Walleij
>
> Hmm maybe I messed something up. What branch/tag do you want me to
> rebase it on then to make it the most comfortable for you?

v5.6-rc1 or my devel branch (e.g if you have some deps) works fine, thanks!=
 :)

I tend to base all next development on -rc1 unless there is some big
bug fix, then I pull in some later -rc as well.

Linus
