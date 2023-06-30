Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC522743BBB
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjF3MPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjF3MPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:15:42 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A35130
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:15:41 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-471b1ba1a7dso635842e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688127340; x=1690719340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBYB3N+fd5FVZeU+ofYsIo5qPhbhhRo+oeSswo/G5ys=;
        b=ylu6s2ZzrfyqH/kWck+z/lqKJ78N43a1fzthBrBTrdIcZ4nZxrmvscOElGZKn39EOd
         stZnIDfOUPaTnp1W4HjQBc+38kj8o9wSOtlBmOb8kYcBYnJwFMHKsdwqNF+yJ6Wfr2Qk
         YzuOCtQvfeRcTGEEwXIlNQircY2GjyMRFxRw2yShhmZOszFtdmQjEl7YURmp725+pyfs
         V8nuyt9sAZxUW47CD0ZxlGKtvJOj3pem4oMeCnxHlNhl3Zdxh73C9BfZHkp/0pfRtaoj
         DWlKN/hhVPEVYER/hauOjvc9vfD9Hi2CFpm2y7SFsjjMSIlRZvJFUp42XY5/zkrN0Zng
         ShZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688127340; x=1690719340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBYB3N+fd5FVZeU+ofYsIo5qPhbhhRo+oeSswo/G5ys=;
        b=DH1eLV1MQ/adIFFeEu/2fabbwjU+jNWn84PWT1ilY2yP3fRuqkRr9CfPFbdNlVqUo0
         YtRaaZIXJ8uWLU74KtN2+WnBPg+nlYYceQt18nMkhMSQKQgwZjKqWJuIuYcDBXp/3ubL
         duDYi0YX/6aBWbgwfIBOnQo7J9yDDFCPdxoJX6Fxj7y4G+U7sb2ddnr9sKLgGAUE0cbm
         wdfp8TGodwR5RhWq3r58CMsGyHIV54TIl74QCDthAorMDH7Z+KUc3tNUM4vejwPFfZ4l
         n5Hs7+uzsjd3KkAqp7LmgL/8QnRccv9r6Sk51/ZYuhC4ggJADRFXirjV+u2Drw5WYIDa
         hlnw==
X-Gm-Message-State: ABy/qLaUtNhoVvyCdXEWEy4XDlG/aMDqjun+3C6eqcr6bYZcDh9YOZW5
        IZ7g1kSje7mjeQDbRLIkXnAJZpzLLhX0y7qI5fobX6rhwVfCecQF
X-Google-Smtp-Source: APBJJlEGQGMjl6A5CVOzu/aK8/W/ZLlyRl3EE0j25Jmu00z3pHQG1bYsHth/Ccrf2I3QnlIgCU8XQSogw8IA2yWJxP4=
X-Received: by 2002:a05:6122:231f:b0:471:b14a:fc48 with SMTP id
 bq31-20020a056122231f00b00471b14afc48mr1619651vkb.13.1688127339697; Fri, 30
 Jun 2023 05:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jun 2023 14:15:28 +0200
Message-ID: <CAMRc=MfSufpw162HTvm=+K4WkHqb0RHOu=VSYsBekPp92h0nKA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 0/4] bindings: rust: clippy: fix warnings
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 1:19=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> This follows up on my promise on Kent's series [1] to look into whether
> these casts are needed or not. Most are not, a few are false-positives.
>
> I also explored some shunit2 based test-script to automate the testing,
> but that became ugly with linking issue and needs me to revisit it
> another time. So this only sends the clippy fixes for now.
>
> Tested the build (lib + examples + test) and clippy report on:
> - Fedora 38 x86_64
> - Fedora 38 aarch64
> - Debian 12 armv7hf
>
> Test execution (cargo test) was tested on:
> - Fedora 38 x86_64
> - Fedora 38 aarch64
>
> Could not execute tests on armv7hf due to lack of suitable test
> environment.
>
> [1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Changes in v2:
> - Changed cover letter title to active language
> - Improved commit messages (hopefully)
> - Elaborated what was built and tested
> - Resent with hacked b4 for proper [libgpiod] tag
> - Link to v1: https://lore.kernel.org/r/20230629-clippy-v1-0-9ff088713c54=
@linaro.org
>
> ---
> Erik Schilling (4):
>       bindings: rust: clippy: drop unnecessary casts
>       bindings: rust: clippy: silence false-positives on casts
>       bindings: rust: clippy: drop unneeded conversions
>       bindings: rust: clippy: silence false-positive on iterator
>
>  bindings/rust/gpiosim-sys/src/lib.rs         | 2 +-
>  bindings/rust/gpiosim-sys/src/sim.rs         | 4 ++--
>  bindings/rust/libgpiod/src/chip.rs           | 2 +-
>  bindings/rust/libgpiod/src/edge_event.rs     | 2 +-
>  bindings/rust/libgpiod/src/event_buffer.rs   | 7 +++++--
>  bindings/rust/libgpiod/src/info_event.rs     | 2 +-
>  bindings/rust/libgpiod/src/lib.rs            | 2 +-
>  bindings/rust/libgpiod/src/line_config.rs    | 4 ++--
>  bindings/rust/libgpiod/src/line_info.rs      | 3 +++
>  bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
>  bindings/rust/libgpiod/src/line_settings.rs  | 5 ++++-
>  bindings/rust/libgpiod/src/request_config.rs | 2 +-
>  bindings/rust/libgpiod/tests/chip.rs         | 2 +-
>  13 files changed, 27 insertions(+), 18 deletions(-)
> ---
> base-commit: 4510231c95a087f58a155cf74164e403e1e0584f
> change-id: 20230629-clippy-890c541c6d09
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied the series with Kent's and Viresh' tags.

Bart
