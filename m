Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3570A7B8036
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 15:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjJDNFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 09:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbjJDNFo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 09:05:44 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FF898
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 06:05:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso382758766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696424739; x=1697029539; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf773RqqbvK1ST+uBlOfJ8R2x4EhFyikOffuYi63sKc=;
        b=T5EM7LfPCS+V35ne82244YpZyHvj3PR91drrVDUXkDjPo6Geht6nVR8uY8k13YOCz9
         XyCC/TfBj8nC0aomzHPjj0NOPns5pJ6+Z4r5PAdrQWal3ONxAJ9honcAslc0P33yNHFl
         sJv2ZukvFdTA2YA3EwnkTYRfGflaJhA5UoBi7wLZ3SXNEO2qgWkjvindEP8W/Mt9GxHS
         6o4hDV+MMEGx0mc9Qv+r8fSd9hBIb75C3aJYuTEhlzwhFgUibSTUPsKPijFWbHlWLNXv
         b9FDd9dzzXfXhLCJ4MNrkr2lgkrXxoTNohqZQemtVQZn6rtQCIO1fn72y93RYTC0IueF
         Ls6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424739; x=1697029539;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lf773RqqbvK1ST+uBlOfJ8R2x4EhFyikOffuYi63sKc=;
        b=kl5gaKMdMTgx0YmJU4uUJH/ShBH1NiddaVEtWSlbpNEq5VoCeCTIMzichee1k0Bgw+
         JyZN6k7WRqQh70858hVCNoWiw6QT3z3qqruqqAKBddIJw0Cge0EYX8PBN1TkwOBmAp8x
         aBldCcEGBsv+ZVnLpLUE4jpw+i8BTOdI2wtfhgQajRoROvU9A+TWCdR72uQztrnovEwa
         KTv85r6yJWXv93XfNQgZaLwBE2ebwFldzTTA+S/FEa1Sd0G59dppKmkp2BihiaqCnQFn
         W890VDH3pX3a9+gLnCrcJthtH1BeFejLGoTl/MoMGbIkgVTVdn1z1fIwyf+IsP0216kh
         l/NQ==
X-Gm-Message-State: AOJu0YxAR7BjuO19HuAIMePpwg1yCyPzqn/MZB5/rz9g0EUazYyII0vf
        vYTyrlDZcz9B99gRI9gGSE6vPg==
X-Google-Smtp-Source: AGHT+IE8+IiF4aq1BizWYk8jW1yPC0gr0iwLbzmo4YXauyLTcaNfKGvc8y01euG+Ny313Np9wjHvXQ==
X-Received: by 2002:a17:906:5357:b0:9ae:7681:f62a with SMTP id j23-20020a170906535700b009ae7681f62amr2377972ejo.44.1696424738665;
        Wed, 04 Oct 2023 06:05:38 -0700 (PDT)
Received: from localhost (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709064e4600b00991faf3810esm2797105ejw.146.2023.10.04.06.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 06:05:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 04 Oct 2023 15:05:37 +0200
Message-Id: <CVZODPRT7CMN.3DCWMHVZSE92F@ablu-work>
Subject: Re: [libgpiod][PATCH v3 0/3] bindings: rust: fix modeling of
 line_info lifetimes
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
 <CAMRc=MczoC6Bj4ZigNt4Dse_6YXwGnQxgxPOVJn5Y1L8niSJ8g@mail.gmail.com>
In-Reply-To: <CAMRc=MczoC6Bj4ZigNt4Dse_6YXwGnQxgxPOVJn5Y1L8niSJ8g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Oct 4, 2023 at 1:26 PM CEST, Bartosz Golaszewski wrote:
> On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > While reviewing the bindings for thread-safety, I realized that the
> > bindings did not properly model the lifetimes of non-owned line_info
> > instances.
> >
> > This fixes that. It might be a bit mind bending. I tried to provide
> > lengthy comments to clarify what happens.
> >
> > To: Linux-GPIO <linux-gpio@vger.kernel.org>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > Cc: Kent Gibson <warthog618@gmail.com>
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
>
> Please make sure to include my brgl@bgdev.pl address too in the future
> when submitting libgpiod patches, thanks!

Thanks for merging!

Will do! Though, you should probably update the CONTRIBUTING section in
the README with that and clarify whether you want to receive it on CC or
TO :->.

I will update my b4 config accordingly.

- Erik
