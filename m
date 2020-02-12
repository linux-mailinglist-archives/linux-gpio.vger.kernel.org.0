Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9389215A73C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 12:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgBLLAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 06:00:54 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41155 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgBLLAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 06:00:54 -0500
Received: by mail-io1-f68.google.com with SMTP id m25so1713521ioo.8
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aSKIxcntvsr3pmsKt/+cdMc3rZOnUjeZ84ryZ2jbHA4=;
        b=tHTnYrBXaqIwYEvdyTiSUB0I6yuO+lN0+ySHkEToccoDe0rm+mTa+btszT1Ozsm2S9
         L3gJsR9cboW4dDEKBptIbiKHyx+dUfn3uXZ196IzRJbhuf8ZznaXxAZS7L2FBFTTMEzg
         5EX4G4uU4TDLWWR8+iEAzCdO9vF+lKDU1NMuBSxv0CH/CM33vZN7GB2fnyOBj74lwtdH
         0bC05bKR+b3EiTFJGafxQxomSB5kahswKQu1aaQePKCYSD8ZPD/qxDPE9Cfl5+IrbA+A
         gNTgdKA3qX0/+RFzJG8JS28E2cJNNRnKiIoXBpAxACQidWqrKJL3RBs18D9Ie23j1flG
         G5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aSKIxcntvsr3pmsKt/+cdMc3rZOnUjeZ84ryZ2jbHA4=;
        b=dpId5Bk3BdYC19htokT17lzHEP5tBGY/q37JlvRtsCKeIfNYTP10LWPn1IAITVFxCr
         poUlqMPnr/S/oRpQn5KSKqk2f9Fs1Y7pxnrgPyskEwxSnBdbrutIvWrlMT6sROU2MmOy
         AJDSJZHWPSLKbq6JfLBm5yZ2gMnF7rlBiVrkSi/kbIY6me0wa1LTRlzRTfKPomRqNTYU
         IhWvZ4Sv7wE/9SBlT2Sqa19sm5zhUxwCQStStfgzco5gT3nCftIU1Gr+7nMn9x56ElOq
         XyEWUzjJzBEt762gt1+Q9ROowZUi1c4uRx08P92UC9Zecu90iTAt89thn3d3z90iS7Y6
         qnKg==
X-Gm-Message-State: APjAAAWO4OIqb73A+7aanpViwTl6Te1Azxo90dxdIvkl7j7itlr1G/qA
        BJRL8Wwa/NBcNwn/lH/8AxC9tHuJLwNj/kNtsNqeAw==
X-Google-Smtp-Source: APXvYqzUscMtmWnRVXqD/RZwHPnQ0OM2Hl7YkBbT3HjYaydata0WGb6m01JGjeBVubE1qiVg+wZpciU/D3QVj1KRi78=
X-Received: by 2002:a05:6638:72c:: with SMTP id j12mr18660353jad.136.1581505253344;
 Wed, 12 Feb 2020 03:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl> <20200211091937.29558-7-brgl@bgdev.pl>
 <CACRpkdZNyCBxQF_pVPGENob5EKZfYjuaNq5bLNA42XjraXzNZg@mail.gmail.com>
In-Reply-To: <CACRpkdZNyCBxQF_pVPGENob5EKZfYjuaNq5bLNA42XjraXzNZg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 Feb 2020 12:00:42 +0100
Message-ID: <CAMRc=MfkbJ=zTvgpaxFC7L7APEhfC7J_PcncGaQ_AQUA9uw2Fw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 6/7] gpiolib: add new ioctl() for monitoring
 changes in line info
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 12 lut 2020 o 11:47 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Tue, Feb 11, 2020 at 10:19 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>
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
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Looks good to me. This got really slim and clean after
> the reviews, and I am of course also impressed by the kfifo
> improvement this brings.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> A question:
>
> Bartosz, since you know about possible impacts on userspace,
> since this code use the preferred ktime_get_ns() rather than
> ktime_get_ns_real(), what happens if we just patch the other
> event timestamp to use ktime_get_ns() instead, so we use the
> same everywhere?
>
> If it's fine I'd like to just toss in a patch for that as well.
>

Arnd pointed out it would be an incompatible ABI change[1].

However - I asked Khouloud who's working on v2 of the line event
interface to use ktime_get_ns().

Cheers
Bart

[1] https://marc.info/?l=3Dlinux-gpio&m=3D151661955709074&w=3D2
