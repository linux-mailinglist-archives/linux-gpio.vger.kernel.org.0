Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2605C7A9D59
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 21:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjIUTbR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 15:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjIUTaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 15:30:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE178ADC55
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 11:04:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c007d6159aso22364201fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 11:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695319468; x=1695924268; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLu1kFzMi5OTWpSvCFb1Jh2IvtJRIUlkrOolz/Jszqk=;
        b=xmkfbqkApFBrsnhJnxNmIvUvo66kHw4sAmtSs9FT1fekuoH/goQ4sIP9ft2mDsKQjA
         RRvsGL1QSc3fKG6KJgdd3ewFVJpcUEI/wkM12a6MqxO+jUdeSon7h68XkZP1YCLqlgZ7
         Kj4D7RzU7xbHsFy1Yw340Qz37Yl1Lt63YUb+XMIeOz1TLaQ3M9aiu5qG5fbdPAGw0Vj0
         7k7vmPLchxFxHjaorXOeTAzAKNKxzXlm4g+b8s015o75ERxPtr86eaXvS5LgdOprmT60
         xlXab2rXqibMUFMTK0nqWKdiqfSZGPYg+PvoIcoe9HXc8xQ5g7Gmk/zQmNMqA2efB/PV
         8aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695319468; x=1695924268;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RLu1kFzMi5OTWpSvCFb1Jh2IvtJRIUlkrOolz/Jszqk=;
        b=AWDNpouYXzNsehKBAt/NS5NSxWqcT2saV/RE22/sr1hWaLKOROmxtkmaWp8Ff3dl1r
         vPxwwr6+MeMvViQ7a5BIY/twZDBwbfssFMDf09mo0i+eHFLCTIz6GevLkC04IYmIizZ0
         pUtnc4UwyYLAJln7OlRX2ue1Qjv0r33kC7DqSfXID7E9x1m9yZVhMCG0kDcOWfe3gqnD
         To+1qOljEQKALZlx51sSrK4K7UQ9qfIh4iS5Gg7Y7utVtZ0rkOsILXs0YsgzHQ22hLff
         J53isOVWfjDyrmB7Yda0B+LDiBHG5Qkbyt56RiHpswgrm9ikRPQVtq3pInk11+hp9OuT
         JGqQ==
X-Gm-Message-State: AOJu0YygcZ/wAR/Ebi18zXhBBD0F8FhKYFDC0e2e8ADWVTbfsR6SB1lY
        gYItoN2MnYKLPKo7nYRHrckUkDMhujeQ3ccHRqfjqw==
X-Google-Smtp-Source: AGHT+IGfFevDnb2l/HaENbVpr0ZWm22+55I05LmJOSLeIIEJVJQspbCgHX9JeAg2WZsUYSXhoNEfHg==
X-Received: by 2002:a05:6512:3a82:b0:500:b872:7899 with SMTP id q2-20020a0565123a8200b00500b8727899mr6122035lfu.62.1695301584541;
        Thu, 21 Sep 2023 06:06:24 -0700 (PDT)
Received: from localhost (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id r22-20020aa7da16000000b00532c84e6997sm813474eds.23.2023.09.21.06.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 06:06:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 21 Sep 2023 15:06:23 +0200
Message-Id: <CVOM97T49C5Z.1XA78Z7SPY16O@ablu-work>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod] Thread safety API contract
Cc:     <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.15.2
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
 <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
 <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
 <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
 <CVHULP4LSR1M.U8ZIY7UL0OU5@ablu-work>
 <CAMRc=Mc4F_PKk3doS-MQUE0_=iRdQtJoWXO+mkhWcMBcudh--w@mail.gmail.com>
 <CVI29A6AMQRU.37OB8UWFQNINW@ablu-work>
In-Reply-To: <CVI29A6AMQRU.37OB8UWFQNINW@ablu-work>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Sep 13, 2023 at 10:10 PM CEST, Erik Schilling wrote:
> On Wed Sep 13, 2023 at 5:17 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, Sep 13, 2023 at 4:10=E2=80=AFPM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > On Wed Sep 13, 2023 at 3:45 PM CEST, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 13, 2023 at 3:36=E2=80=AFPM Erik Schilling
> > > > <erik.schilling@linaro.org> wrote:
> > > > >
> > > > > On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> > > > > > On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> > > > > > <erik.schilling@linaro.org> wrote:
> > > > > > >
> > > > > > > Hi all!
> > > > > > >
> > > > > > > Currently it looks like libgpiod does not document any kind o=
f thread
> > > > > > > safety gurantee. However, the Python bindings tests
> > > > > >
> > > > > > Indeed, the library is thread-aware but not thread-safe. Just l=
ike
> > > > > > what is recommended for low-level system libraries.
> > > > >
> > > > > Just to confirm:
> > > > >
> > > > > I assume this means: thread-aware in the sense that all created o=
bjects
> > > > > (chips, line_requests, ...) together may only be used by a single=
 thread
> > > > > at once? So line_requests of a same chip may not be used across t=
hreads?
> > > > >
> > > >
> > > > They can be used across threads alright. Thread-aware means: no glo=
bal
> > > > state in the library, IOW two functions won't get in each other's w=
ay
> > > > unless they work on the same object.
> > >
> > > Sorry, I did not phrase that question super well. A (hopefully) bette=
r
> > > try:
> > >
> > > If I create a chip and then open two line_requests from that single
> > > chip. Can I use these two line_requests concurrently on different
> > > threads? Or do both of them (and the chip) have to share a single loc=
k?
> > >
> > > My assumption was that everything derived from the same chip instance
> > > must not run concurrently.
> > >
> >
> > Ah sorry, I didn't understand your question. Actually using requests
> > from a chip concurrently in a different thread is perfectly fine. The
> > two structures are independent from each other in user-space and their
> > work is synchronized in the kernel.
>
> Ah. That makes things a lot simpler. I think then we only need some
> Send traits on the Rust structs. Does the same guarantee apply to all
> structs that are "created" from a chip? Then I would look into whether I
> can extend the docs while fixing the Rust bindings.

Summarizing a short discussion between Bart an me:

- objects created from chips are standalone and different instances can
  be used concurrently
- exception: edge_events from buffers are tied to the buffer unless one
  copies them (as stated in the docs).

Will send a patch mentioning this in the docs and adjusting the Rust
bindings.

- Erik
