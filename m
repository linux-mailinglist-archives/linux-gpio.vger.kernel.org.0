Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A617B3105
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 13:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjI2LGm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 07:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2LGl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 07:06:41 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98F7199
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:06:37 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5334f9a56f6so17514085a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695985596; x=1696590396; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52P1CjcQduwZ/Qf2MZDP3p2JkwuTTvvzuvJ1lIEs2D4=;
        b=znvtQafZbLqLOzMR5hhmpSKy9M16Wsq/AWPiYnVywy+gdTqT6NtV/WrXvr6eJBhlJx
         HozJi+svVtu8/qv1D626TZ3Vzmybhru6/lO7rQ6wkIbiJQ29ylMPjgkLalr2jPvchDUV
         iYHQPtjWJxHppwWcNrBjIzyBFRH3qhF6o17/YvHi5LUR4lqhZeP3TmFJRFsdEh19DuXo
         yjcRlQ7tl4Kpd1Clp6DVg5Lmmt6w24yJleizth3DpqS8ItMrQJ/3fsDE6I8W2YMMEYRt
         t194uM20Y0ymOCvveHg9OWGEF/ZCt4cisW8TuMzQwtEFKnWRNkQqpujFF4l9RaF1limB
         iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985596; x=1696590396;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52P1CjcQduwZ/Qf2MZDP3p2JkwuTTvvzuvJ1lIEs2D4=;
        b=mziWnKusxRIU0JQDSkrnCcqwHhFfsKlY6O7IHffVkspeV618n/J5iosPsgS84uDPSW
         mxOn2klsib7w0w3MbneIjfUl0fA3zDPU6ZZ5Kw3LHz+A2zCmFdalL+fQCVC65gPz9HxM
         SBaQe6noRxfP59tc5o9rixLu0Ew4fVO04WovSuCk/H1fIO4lUtf5g7aWz7w7scwQJHiu
         8JMZ2h4iRLumJnWGrpjiZb+gGSzJa5vYonDPVWAF/FjKau/IIRXPOyp3rUI8r/4aFtXB
         2jXEJ/fask6sQ7aw1qW3QabBS39TyKtf3wih1TsdSZrwRvUKmAyBaBERThAnMPU2BZ/e
         C9dg==
X-Gm-Message-State: AOJu0YxWHSPX8/kKnGJNQ+IVrfj5fwWxNxHJKgtNu1JX1h5lpNMEVCJC
        COG/XC9Ho3XAlFemmbv2m0b/cMYdcGs5ZswtRew=
X-Google-Smtp-Source: AGHT+IHbL++lalhTq1Vy+0zbvwkwpG1ULYQ05LgfPkF2R7Oy2CekNmi0zu4vPkLBkhE+edQrwVqHFA==
X-Received: by 2002:aa7:da0b:0:b0:51e:5251:8f45 with SMTP id r11-20020aa7da0b000000b0051e52518f45mr3313390eds.4.1695985596062;
        Fri, 29 Sep 2023 04:06:36 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00530a9488623sm2131026edb.46.2023.09.29.04.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 04:06:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 13:06:33 +0200
Message-Id: <CVVCPTVMR14A.3KNMCU2YXYPBU@ablu-work>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of
 line_info modeling
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
 <20230929103959.ahaf6edlxkngyhir@vireshk-i7>
In-Reply-To: <20230929103959.ahaf6edlxkngyhir@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Sep 29, 2023 at 12:39 PM CEST, Viresh Kumar wrote:
> On 28-09-23, 15:24, Erik Schilling wrote:
> > > +/// Line info
> > > +///
> > > +/// This is the owned counterpart to [Info]. Due to a [Deref] implem=
entation,
> > > +/// all functions of [Info] can also be called on this type.
> > > +#[derive(Debug)]
> > > +pub struct InfoOwned {
> > > +    info: *mut gpiod::gpiod_line_info,
> > > +}
> >=20
> > While going through all the structs in order to add missing `Send`
> > implementations, it occured to me that it may be a bit confusing if
> > only this one type has the `Owned` suffix, while the others are also
> > "owned" but do not carry that suffix.
> >=20
> > Not really sure how to resolve this... We could rename the non-owned
> > `Info` to something like `InfoRef` and turn `InfoOwned` back into
> > `Info`, but reading `&InfoRef` may be a bit weird?
>
> I like this one and none of the others.

OK :). With Manos also agreeing, I will do this then.

>
> > Alternatively, we could rename all other structs to add the suffix...
> > Then, "Owned" would maybe sound confusing - given that no un-owned
> > variant exists.
> > Maybe "Box" would be a more suitable suffix in that case - borrowing
> > from the Box type name [1]?
> >=20
> > Any opinions here?
> >=20
> > [1] https://doc.rust-lang.org/std/boxed/struct.Box.html

