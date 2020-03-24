Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0137F191712
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 17:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbgCXQ6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 12:58:16 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:45317 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCXQ6Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 12:58:16 -0400
Received: by mail-lj1-f177.google.com with SMTP id t17so8717301ljc.12
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CPM4DQLJgGNJQ4Wt8UfEVMnJCkQpdqu/eOPtIKFxI+0=;
        b=O+ijfRdU6ig2prtl0eLOVaeUKMhWBFSG2x9+ccBmMySNR274K8fX8JryLOl8fg0JlQ
         WjtlJSfaHJsLOn6flOZcQG8DMdc7Hy8ek6/v31ugRHue1wy9/B/AlP+l4RtZOxCc4tuO
         ZiUn+0cwt7XWf/VUe3HRy0AneFV0DhwzYBfIa0lu1tLkDEJwYo0q8yXNimAlbCovZkd5
         /1APP4XshSWtYQ+YTfIUkc2ZBanQSusZyX5MYoetlXfAJhvVYU0yTh0MpyEhZ+b66+Um
         CghHEky1uWbPDAd0ESiuvlSO3GrVT4eQ7YUlQlUdvgDSSMd7WHloHfIopKRcyHIR2Jn4
         h4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CPM4DQLJgGNJQ4Wt8UfEVMnJCkQpdqu/eOPtIKFxI+0=;
        b=JMb8kgOIwslRgo6Rr5+0E5sRVOovyn6GtOoi5cD484SRJgxgOJKvTBfZK1Kip56pwD
         5gUvdeEn4vQNbp2Ud17RnHAM4c1FX7FBGLlmvmgIarGDANqKg7RJD0D0bxYZSKdvOG5Y
         AyvC6sqm9c0CP1KBGG3zzCgeB5VFS4d0hBefx0Jq4fRMESRVusfZOQPbgenpuR+Jv3cA
         aYDoPkE+egVB0GZSHGsOAJyP75l//XslzrLOcDFbwcGVjrg2h0qhsBHH3i+wTrQyoXAd
         mCjWB0lJLvs5qmGWUmyX41Y3jEYCb2rqHdxKZnx8awjSsDy42uBuInVEerll8/Y51Kvv
         0Cwg==
X-Gm-Message-State: ANhLgQ3qgpn3XZRR5vsQ1S0wksxA9GW6pdrTfHgH3EZDGXqOF+BUCGT6
        3YiTCQ0w8QCnWV2mvl4USjxhqloL33DIzD+UU7YO6w==
X-Google-Smtp-Source: ADFU+vvw+U9JHQWhhnc+AYbR0WFA1PJoRX7HX5tY/Vd08mWXiON078p7kAVIxKKBlY/KvCDmC0s1UdioCoImq87B1mY=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr18308192lji.277.1585069093752;
 Tue, 24 Mar 2020 09:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl> <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
 <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com>
In-Reply-To: <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Mar 2020 17:58:02 +0100
Message-ID: <CACRpkdaQQftxqVLNYeNnVzbYO+S3fKeVqshO98On+WJ2WdcALw@mail.gmail.com>
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

On Tue, Mar 24, 2020 at 1:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 24 mar 2020 o 10:05 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > Hi Bartosz,
> >
> > On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >
> > > this is the third and probably last batch of changes for v5.7 I picke=
d up
> > > into my tree. Details are in the signed tag. Please pull.
> >
> > Which rc is this based on? I got a bunch of unrelated changes, so
> > I suppose I need to merge the right rc base to the devel branch
> > first.
> >
> > Yours,
> > Linus Walleij
>
> Hi Linus,
>
> this is rebased on top of your devel branch, so you should be able to
> pull it alright.

To me it looks like it is based on my for-next branch which is a
mixdown branch that I create solely for inclusion into
linux-next.

Can you double-check?

FWIW for-next is created like this:
git checkout for-next
git reset --hard fixes
git merge devel

So that branch is highly volatile and not very good for
development.

Yours,
Linus Walleij
