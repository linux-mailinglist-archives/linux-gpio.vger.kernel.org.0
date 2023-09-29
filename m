Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0ED17B32CE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2Mrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjI2Mrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:47:46 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3B8B7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:47:44 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso1910544866b.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695991663; x=1696596463; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm2F8LF7BmwbeqVvo18rPgRWDf9rtY4UAoVPUx2Scq0=;
        b=nqiJ1H5Rnmr5BAUtlDkXvYjQE1+eAACkvtE0YlmibWuGg3BnV/YBw1L0tw3ZkTztc8
         8+iARTm04wV64S5DSPqkXImSUceHK4n8d1Hrta9jjfOkyc+7jsCtVZ+3CxfqpQMTKDSW
         GUn4Zfh43K4Zoj4aTS917n1OQGLpHWalg2wiDCPY+OA5h+iEnXwQpZb3eSbWrWncCsqD
         WNWAOLrGhroPt7nmPkLLpysRe1qxFnZe00riAt709GwNT5MnNZxIn9Ce4p++iSP6Hs3a
         FY4qLiSvqjCmoPqX48IKhq3CREQRo3OJF8XaBYYMkm878LCMqH8UJg6ZzS5yQZPNgt07
         PsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991663; x=1696596463;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lm2F8LF7BmwbeqVvo18rPgRWDf9rtY4UAoVPUx2Scq0=;
        b=sbvn4AgpwPXdhxTwm6MkMSQmofGtIUO31M0vdPp/tL38CBr6gv810RT22Kixdapzza
         4OD6XC4zw8d+bNEZyT6+UI0vgSubB0SBUbuL0WLyuNk3pIT2sCAv/xsuVlG22crbFrs4
         97NOhe2f/Zy0RZbF1ObZUk9eEv545gdbDbTkdDzDtOs5UumzRltbjhSDTF+UoQ9h++vJ
         iQeqoBKLLsou4wDfQCxWPoJDbUkpSRK9nP6AMJADt+yVtjR6BfUZNsQAKi0DfF+Dh6uY
         Rmu3Yuk1YXXfIy6I4t7yx+TJrUBBGD9tHi+OybLmYghVE2EMBAlMsBTM+r1gY2F8hnkc
         p2kQ==
X-Gm-Message-State: AOJu0Yzgud+Qz2JXSSSpodO/dD2alLDYorsy0Pip7xrACxLCDEZxhnnk
        xKrBH8Tj6PveMkbLbmZiQuVrFg==
X-Google-Smtp-Source: AGHT+IGZCMoAwX1rISabhklOtAsHTu2LkvZzulQAFnT/D/+5f2xQefIuO1/+gCjXpHNFsetDlU0/Ag==
X-Received: by 2002:a17:906:5a6b:b0:9a1:e8c0:7e2e with SMTP id my43-20020a1709065a6b00b009a1e8c07e2emr3918995ejc.14.1695991662645;
        Fri, 29 Sep 2023 05:47:42 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b0053112d6a40esm11200614edp.82.2023.09.29.05.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:47:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 14:47:41 +0200
Message-Id: <CVVEV9GFLWN5.1AB912RVJSYUC@ablu-work>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: mark all owning types as
 `Send`
X-Mailer: aerc 0.15.2
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
 <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org>
 <20230929105829.vm7ed3unydb5rrh4@vireshk-i7>
 <CAMRc=MeU+yS7L_HguALjoYiw8NHqTWQ1=X5s4OmqnNiqAZmOOQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeU+yS7L_HguALjoYiw8NHqTWQ1=X5s4OmqnNiqAZmOOQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Sep 29, 2023 at 2:45 PM CEST, Bartosz Golaszewski wrote:
> On Fri, Sep 29, 2023 at 12:58=E2=80=AFPM Viresh Kumar <viresh.kumar@linar=
o.org> wrote:
> >
> > On 28-09-23, 16:37, Erik Schilling wrote:
> > > The thread-safety rules of libgpiod allow individual object instances=
 to
> > > be used from different threads. So far, this was not actually possibl=
e
> > > with the Rust bindings. Not being `Send` disallowed the user to trans=
fer
> > > the ownership to different threads.
> > >
> > > Rust also has a `Sync` marker. That one would even allow sending
> > > references of objects to other threads. Since we wrap a lot of C
> > > functions with `fn foo(&self)` signatures, that would not be safe.
> > > libgpiod does not allow concurrent API calls to the same object insta=
nce
> > > - which Rust would allow for read-only references. Thus, we do not
> > > define that one.
> > >
> > > Chip was already modeled correctly.
> > >
> > > line::Info is not marked as Send since it may either be owning or non=
-
> > > owning. That problem is fixed as part of a separate pull request [1].
> > >
> > > [1] https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-=
990dce6f18ab@linaro.org
> > >
> > > Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
> > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > ---
> > >  bindings/rust/libgpiod/src/edge_event.rs     | 4 ++++
> > >  bindings/rust/libgpiod/src/event_buffer.rs   | 8 ++++++++
> > >  bindings/rust/libgpiod/src/info_event.rs     | 4 ++++
> > >  bindings/rust/libgpiod/src/line_config.rs    | 4 ++++
> > >  bindings/rust/libgpiod/src/line_request.rs   | 4 ++++
> > >  bindings/rust/libgpiod/src/line_settings.rs  | 4 ++++
> > >  bindings/rust/libgpiod/src/request_config.rs | 4 ++++
> > >  7 files changed, 32 insertions(+)
> >
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
>
> Thanks, do you have any comments about the other patches in this series?

Hm. The others are not Rust-related and mostly try to document our
discussion about thread-safety of the C lib. It would probably be good
if you could double-check that I summarized everything correctly.

- Erik

