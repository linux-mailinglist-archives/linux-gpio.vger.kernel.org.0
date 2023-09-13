Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A87779F299
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 22:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjIMUKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 16:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjIMUKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 16:10:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3261C1BC3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 13:10:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bf3f59905so29813766b.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694635807; x=1695240607; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUJnDn+VTOffrfz4QJCY3KYdogH0rKoLJDMz5lT2a0g=;
        b=v1h8VxhtWodVhLfZd9291CkJR+YjkIMMKseAPmVQbWoJ+Udpl4TGNZwcTtYuIxMwMx
         te4+vR/j83IuNNzalAa9deIF5Ty3F0fhiQjKF73OuxuKawIGA6vOTw+6pE/U/Ki39E89
         bFqpncBd0hmHOuXF0lFqt23zaV0mvjNkRMZYBDJWD0GvrHui0JNnHpnnu3cz1EfRFIBv
         dlAVl//dgKCponfrTM47NKsOzIR9zuPBIe+In9dCHSfhd43ao72pGenwLBMQ69nDBrb4
         2KJGRu6SfB5YvDLhqY3yGpzbJZTJnZA7naYFynDiq5aX36Em67ZCVfLxeulmBXV2JJmZ
         PbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635807; x=1695240607;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUJnDn+VTOffrfz4QJCY3KYdogH0rKoLJDMz5lT2a0g=;
        b=OrUClw5Mjp9tm8+lJ1TWFQzb3RGPStzuCXN4g24PbDdipnc4KbRYAaJQHLxFP81cgH
         4vUbg3dsW5CZH5byzAc8whW+0hgyYMVUTuJBH/ZoJeuSQCbi11HtkK6SXQxIRxtfN5Op
         oElTeoQUVffZ70ISN7v8rXjTJ45cMpxoC3FGyemVmFX8UQbO5jfspSan4oXFZHp1fZNs
         EvlEyyKaeeHeE3RBhgsvpHdhIF59GZU5i1QQsMpb9f4mzPkbFtozXhKQ3H2Sw3ko8glR
         M9uTys73EE+nDy0qzUuDnxotWn8kPHwLXUqfIFFYEvQ2cPuqQ/PpFBKz2WOt8JhRq4mt
         eXKQ==
X-Gm-Message-State: AOJu0YzkyEpi/CtJaVftfPFwtUlKoq44pCK7bR08MyTVeYce78FAvD/T
        9kNYDvV9JP4FVjVl5SM5XIuXimY1518cVveiuM4=
X-Google-Smtp-Source: AGHT+IE/Rh/X8AwgrgUO4He5jiQcbm9eKV484fRjtT/+7cv+Az5W+Efi7d1NFjRD7EfK1zkx3Lp+mQ==
X-Received: by 2002:a17:907:77cf:b0:9a5:cbb2:3fab with SMTP id kz15-20020a17090777cf00b009a5cbb23fabmr2686041ejc.2.1694635807479;
        Wed, 13 Sep 2023 13:10:07 -0700 (PDT)
Received: from localhost (i5C74380B.versanet.de. [92.116.56.11])
        by smtp.gmail.com with ESMTPSA id lc15-20020a170906dfef00b0099bcf9c2ec6sm8889427ejc.75.2023.09.13.13.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 13:10:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 13 Sep 2023 22:10:06 +0200
Message-Id: <CVI29A6AMQRU.37OB8UWFQNINW@ablu-work>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod] Thread safety API contract
Cc:     <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.15.2
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
 <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
 <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
 <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
 <CVHULP4LSR1M.U8ZIY7UL0OU5@ablu-work>
 <CAMRc=Mc4F_PKk3doS-MQUE0_=iRdQtJoWXO+mkhWcMBcudh--w@mail.gmail.com>
In-Reply-To: <CAMRc=Mc4F_PKk3doS-MQUE0_=iRdQtJoWXO+mkhWcMBcudh--w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Sep 13, 2023 at 5:17 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Sep 13, 2023 at 4:10=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Wed Sep 13, 2023 at 3:45 PM CEST, Bartosz Golaszewski wrote:
> > > On Wed, Sep 13, 2023 at 3:36=E2=80=AFPM Erik Schilling
> > > <erik.schilling@linaro.org> wrote:
> > > >
> > > > On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> > > > > On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> > > > > <erik.schilling@linaro.org> wrote:
> > > > > >
> > > > > > Hi all!
> > > > > >
> > > > > > Currently it looks like libgpiod does not document any kind of =
thread
> > > > > > safety gurantee. However, the Python bindings tests
> > > > >
> > > > > Indeed, the library is thread-aware but not thread-safe. Just lik=
e
> > > > > what is recommended for low-level system libraries.
> > > >
> > > > Just to confirm:
> > > >
> > > > I assume this means: thread-aware in the sense that all created obj=
ects
> > > > (chips, line_requests, ...) together may only be used by a single t=
hread
> > > > at once? So line_requests of a same chip may not be used across thr=
eads?
> > > >
> > >
> > > They can be used across threads alright. Thread-aware means: no globa=
l
> > > state in the library, IOW two functions won't get in each other's way
> > > unless they work on the same object.
> >
> > Sorry, I did not phrase that question super well. A (hopefully) better
> > try:
> >
> > If I create a chip and then open two line_requests from that single
> > chip. Can I use these two line_requests concurrently on different
> > threads? Or do both of them (and the chip) have to share a single lock?
> >
> > My assumption was that everything derived from the same chip instance
> > must not run concurrently.
> >
>
> Ah sorry, I didn't understand your question. Actually using requests
> from a chip concurrently in a different thread is perfectly fine. The
> two structures are independent from each other in user-space and their
> work is synchronized in the kernel.

Ah. That makes things a lot simpler. I think then we only need some
Send traits on the Rust structs. Does the same guarantee apply to all
structs that are "created" from a chip? Then I would look into whether I
can extend the docs while fixing the Rust bindings.

Thanks again!
- Erik

