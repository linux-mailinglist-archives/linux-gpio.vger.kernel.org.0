Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720977B4C7D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbjJBHWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 03:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235696AbjJBHWh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 03:22:37 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD618E
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 00:22:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5363227cc80so6130474a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696231353; x=1696836153; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7D46kJeMegvsyu+SqZBdwCYZmwUBmdR9yeUZQMsjbU=;
        b=ox4ZqOeu6GoPGKcB2UWw8O53n4IEP4T7WmwEeAFtgoJvso+wFMbVBLVsCRWtZyi6WE
         6bAPHDYw/Z/IIHPtfJEXZtvADJ1ubFdPCiy+S/IRxj0R5sSgQyPm3G+3DtpReWdSy5YI
         werLsonzbrfkaK3T1rf/FB9sHIXrdP5qx28RNd/+TXeHF0jyogcepKPI13CBkQFGQeVZ
         dgYIG1ISv71aTx+mZ2gbrXgYwq4Cg5L0Cr4cHADX/2acMzwInG38F6MdGJTHhWWReIUd
         SdUtf77lQIj95ggX3eVQ9WZcjtfiv0BfxOsaCWeKSdk3nkT1vRy9ahtzOs+/JdI1wxad
         UOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696231353; x=1696836153;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7D46kJeMegvsyu+SqZBdwCYZmwUBmdR9yeUZQMsjbU=;
        b=pZaj7CmbhXKo/vXos0XQryD/CFg7SoLPCJdBD3LYbONvsQonTqReD5pNTJ7jenQxxr
         xOnO95bU0yFPYgYx4JNluGc+2PKrf8XoymTwcOkwiqcWVyTIpZHfFROZk4pOFPgB1Rdj
         dSji1vlzNzSUJ1jrahKWSSo745JBgE4C214Ys63WIAW4ILYoLWyqxHhO6YYL5wMpWMnd
         yk0MJNfXsYP7Yq6fuzPLV+v4FQE3AgO0u+BKmcv4Ium+bF/x/Zd75wY21/AGfkVMWccN
         D38buOt0zPPXOL/ifd8d2sbR11PLD/sp7X9HfxvQjdELoSebMXg1HQ9rHnQ/T+pNIsYX
         Swkg==
X-Gm-Message-State: AOJu0YxTx3Q0WVbHcHdVsDFWN20kqxGJlAVm/J26ofEuAxcyJ6LPYrpR
        xJtNDoW9ycGwOTRZc9vLnciHqw==
X-Google-Smtp-Source: AGHT+IEf7kXaO0uZkhgMS0feoMQZtfg92oK+E3fhWZ8ujt+8rp5FxzYl8gNtSlIWcWycltAcaeZFQg==
X-Received: by 2002:aa7:d98e:0:b0:527:251e:1be8 with SMTP id u14-20020aa7d98e000000b00527251e1be8mr8893856eds.13.1696231353070;
        Mon, 02 Oct 2023 00:22:33 -0700 (PDT)
Received: from localhost (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id h20-20020a0564020e9400b0053441519ed5sm9844561eda.88.2023.10.02.00.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 00:22:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 02 Oct 2023 09:22:32 +0200
Message-Id: <CVXRTXOO8559.2M83QY2U5MC0K@ablu-work>
Subject: Re: [libgpiod][PATCH 0/3] thread-safety doc + Rust modeling
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
 <CAMRc=Megx1B+zEqsntLOnJ_dcQngFOy31qr=TMKreefsjX_MAg@mail.gmail.com>
In-Reply-To: <CAMRc=Megx1B+zEqsntLOnJ_dcQngFOy31qr=TMKreefsjX_MAg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Oct 2, 2023 at 9:16 AM CEST, Bartosz Golaszewski wrote:
> On Thu, Sep 28, 2023 at 4:37=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > This updates the docs with what was discussed in the linked thread.
> > Then, the Rust bindings are adjusted to match in behaviour.
> >
> > To: Linux-GPIO <linux-gpio@vger.kernel.org>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> > Erik Schilling (3):
> >       doc: drop unneeded <p> tags
> >       doc: document thread safety guarantees
> >       bindings: rust: mark all owning types as `Send`
> >
> >  bindings/rust/libgpiod/src/edge_event.rs     |  4 ++++
> >  bindings/rust/libgpiod/src/event_buffer.rs   |  8 ++++++++
> >  bindings/rust/libgpiod/src/info_event.rs     |  4 ++++
> >  bindings/rust/libgpiod/src/line_config.rs    |  4 ++++
> >  bindings/rust/libgpiod/src/line_request.rs   |  4 ++++
> >  bindings/rust/libgpiod/src/line_settings.rs  |  4 ++++
> >  bindings/rust/libgpiod/src/request_config.rs |  4 ++++
> >  include/gpiod.h                              | 26 ++++++++++++++++++++=
+++---
> >  8 files changed, 55 insertions(+), 3 deletions(-)
> > ---
> > base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
> > change-id: 20230928-rust-send-trait-316a8f31bb97
> >
> > Best regards,
> > --
> > Erik Schilling <erik.schilling@linaro.org>
> >
>
> Series applied, thanks!

Thanks for merging and the clarifications!

- Erik

