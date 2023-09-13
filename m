Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD5E79EAB7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 16:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241600AbjIMONh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 10:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241325AbjIMONY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 10:13:24 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEE94C24
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 07:10:13 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so4684170f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694614211; x=1695219011; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnt4/pCq44dWvdGTiHdkHtZ57VielIjKNYRlOlt3p/o=;
        b=PJggrOld6vl2o/Uj6T59dF4cywL2aynaP3hUQJQcLPQiqorT9AbfiLir5fsND8kEtB
         Y+VkWdjJvm6N86bL3PDA2LK9SIMrGPzu0WjgSOF8mUVt+Ep3Q677W36C/n2r8S8TP7TH
         y/ULjyB4nNaXMzJnxMrIlQ2frNmqOMQAfanjQbUyQ3TV5uR9Zm1FAsckY0CsXu/168fr
         vU/0L2Dy8adXQJKc93aL2ImksF7IQBuLuw6kzgI7OVaacyqCTS4rMk7H93SJLwSLktd1
         tV+aezsP2yqtlEpXEU7qojF/RkxRw1Gqd0AYpQqodfb7eHXmJCG0G9TulTSZQ22TaTZq
         Z3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614211; x=1695219011;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnt4/pCq44dWvdGTiHdkHtZ57VielIjKNYRlOlt3p/o=;
        b=fJnM5Sm/rbNfOkq5gwrc58MUdxWj4la0kHRpOuAzsIdzvrdE4TW216GJjPRQu1uYKk
         RcmVpYMF9Nvbw8ypl/H2xhzFVTS+49l8JWWVyX581ESDPyGPa7nPPZWHKRFyWpiVMyrh
         eIEeqgB5/O3/rurXkpXL4L4ubjamLGdQXfZzBhKfPGEFKuqkCeBkPQ25wqBsxlIxE4Nf
         Xl7ugoIOPVn5LLCwMRY4CVKnLg/BrLewbwgMQrr03sRxNpeMDZPam1AubCLOfcRsZL2y
         jAXyPKQlrXockjeB0NlfZ9qcTyVj3PkdpL/wBZl6fH/acuFRyOsw+YTW+GgbVUkL9AaR
         V6ig==
X-Gm-Message-State: AOJu0YzxUzMWGqR5jAP5pZ+fzOuJijt1G+yzmwuFT0/Ht+YWYMm9YOzm
        Y32vwfCGEb/+pIdihMq3XRf0yg==
X-Google-Smtp-Source: AGHT+IH/HOKc5T/x3ncnOnwuAaNcOTPDA/7WFxSNjiBnL1kB4U9hZRiSyRTIkRAbWhxQrZTYUmGFdg==
X-Received: by 2002:a5d:458b:0:b0:318:7d5:67bf with SMTP id p11-20020a5d458b000000b0031807d567bfmr2168311wrq.49.1694614211508;
        Wed, 13 Sep 2023 07:10:11 -0700 (PDT)
Received: from localhost (i5C74380B.versanet.de. [92.116.56.11])
        by smtp.gmail.com with ESMTPSA id e24-20020a056402089800b0052565298bedsm7461459edy.34.2023.09.13.07.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 07:10:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 13 Sep 2023 16:10:10 +0200
Message-Id: <CVHULP4LSR1M.U8ZIY7UL0OU5@ablu-work>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod] Thread safety API contract
Cc:     <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: aerc 0.15.2
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
 <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
 <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
 <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
In-Reply-To: <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Sep 13, 2023 at 3:45 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Sep 13, 2023 at 3:36=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> > > On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> > > <erik.schilling@linaro.org> wrote:
> > > >
> > > > Hi all!
> > > >
> > > > Currently it looks like libgpiod does not document any kind of thre=
ad
> > > > safety gurantee. However, the Python bindings tests
> > >
> > > Indeed, the library is thread-aware but not thread-safe. Just like
> > > what is recommended for low-level system libraries.
> >
> > Just to confirm:
> >
> > I assume this means: thread-aware in the sense that all created objects
> > (chips, line_requests, ...) together may only be used by a single threa=
d
> > at once? So line_requests of a same chip may not be used across threads=
?
> >
>
> They can be used across threads alright. Thread-aware means: no global
> state in the library, IOW two functions won't get in each other's way
> unless they work on the same object.

Sorry, I did not phrase that question super well. A (hopefully) better
try:

If I create a chip and then open two line_requests from that single
chip. Can I use these two line_requests concurrently on different
threads? Or do both of them (and the chip) have to share a single lock?

My assumption was that everything derived from the same chip instance
must not run concurrently.

- Erik
