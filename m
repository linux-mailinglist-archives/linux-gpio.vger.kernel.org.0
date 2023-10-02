Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC87E7B4C71
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 09:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbjJBHQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 03:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbjJBHQ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 03:16:26 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1068E
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 00:16:23 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4527d65354bso7197571137.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696230982; x=1696835782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNMo9T/ZDDmhXp0VotIvFA1cLI5FfTrK+uuGF3k+mcM=;
        b=yKTqf/Yd9O71j3RU1eSUH7UVPYpKjtS4O9SK+9kkG7QZx+SzSxbtx5AP7qwNhh8zck
         +RGeG+lmD5wMGkI0iRtnNznbjDSjSrxloo5b1fy9kzCX0S6CDXgLyhSIvDHLXNKo1Rrp
         XFeoOJg/VdUMUQeclsRZeW+F7tMMgOvlanZOU8NboFqjlidSK8GHEssI7lmzzeeVmPVe
         0n7riOksLmlkwEv++8shcxAfpNUJqizp1em3SKmJdZhcAkFB/oTuR2TUwCtEErkyX1o9
         Ow6o+1R0KJXbzmJ8PmmSJQ18UP4sn09P0dOxqQ9ji9hCzie7kZm/q4+xpj3DdWiOmlq/
         OiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230982; x=1696835782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNMo9T/ZDDmhXp0VotIvFA1cLI5FfTrK+uuGF3k+mcM=;
        b=sG6Yq+94rlIXzwpT8rIPCzpyibDbf64Lq9EqYIQHVZ0PX8umzsPyN8PS4Ck/0dOul5
         bXsqBHIx/uBG5nLC4N01uMJEjh2XAykmqCqwXM2LFPJD9DRRV9tQhoy6Rky8FOwGL5z8
         Y5pOA8jUFD4fWIUiX7Uczf0MhKjSv/asxnniGkE8QEGhsTEKMzY0AbomQuV5uVxAPjAb
         wOVld9jW7JsDoaL7EORHniebx+wm8vT4yCOoDz6WeKCx3lDIGgu8S95b8yaV95HXSj1B
         JSogXVcPkC5xM4AOp6wO0vPY93PDGi6TE7MJEijDkG2pL0I4m603dAP34Vwzax5zA0UK
         MCmA==
X-Gm-Message-State: AOJu0YyqnWLFYt5y/sUoY8Ip4QbYYyFtbOtsRfGYdqApoK9hdzn/rAHd
        Q5ddCHhbNkpsxzb6Ijf9uz4+p9jmRCze+v+1sA/JFIpmyO+uT/vy
X-Google-Smtp-Source: AGHT+IFqQPTj8HjXWMTyXGbHCfwecYjUADVtuybRkWdAFNw/kBCO+ZvFMBkfPPLvm3laX26sx5zRPBVmOZTeQr3m2Y8=
X-Received: by 2002:a67:f84e:0:b0:452:6a4d:d40 with SMTP id
 b14-20020a67f84e000000b004526a4d0d40mr9486634vsp.23.1696230982260; Mon, 02
 Oct 2023 00:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
In-Reply-To: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 09:16:11 +0200
Message-ID: <CAMRc=Megx1B+zEqsntLOnJ_dcQngFOy31qr=TMKreefsjX_MAg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/3] thread-safety doc + Rust modeling
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 28, 2023 at 4:37=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> This updates the docs with what was discussed in the linked thread.
> Then, the Rust bindings are adjusted to match in behaviour.
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>
> Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (3):
>       doc: drop unneeded <p> tags
>       doc: document thread safety guarantees
>       bindings: rust: mark all owning types as `Send`
>
>  bindings/rust/libgpiod/src/edge_event.rs     |  4 ++++
>  bindings/rust/libgpiod/src/event_buffer.rs   |  8 ++++++++
>  bindings/rust/libgpiod/src/info_event.rs     |  4 ++++
>  bindings/rust/libgpiod/src/line_config.rs    |  4 ++++
>  bindings/rust/libgpiod/src/line_request.rs   |  4 ++++
>  bindings/rust/libgpiod/src/line_settings.rs  |  4 ++++
>  bindings/rust/libgpiod/src/request_config.rs |  4 ++++
>  include/gpiod.h                              | 26 ++++++++++++++++++++++=
+---
>  8 files changed, 55 insertions(+), 3 deletions(-)
> ---
> base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
> change-id: 20230928-rust-send-trait-316a8f31bb97
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Series applied, thanks!

Bart
