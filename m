Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104087B330A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 15:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjI2NIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 09:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbjI2NIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 09:08:05 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47F0B7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:08:03 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4526ae5b0b3so6147369137.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695992883; x=1696597683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxf0/FyTTukPZaR6SdHjgImiVLVk6/MUUSQkTxW8+KU=;
        b=iRLXMPBN0pRIwZDVR591iCU2kMjwUF6LgjSsBdkAJXU8rzaKnBXjzHnulSSU8S+Vv/
         30d20CV1p2VKPVGP0c5O+84pjrkQBo2uF8I64G3a+X49sDM/uRjvN/xuVsez4l53ELia
         2HXUA2kGNLlTrtvilhrErurOWmv848hYH0vg2eOIcr1JBOr1pD5HLvCsr9tAxI7EFPY5
         nn2eQSPiypFibsqy/XweRxMjkdjJsSak/9ykOV3KxXusghxMI4lr1huo8+7dKCBsrQhM
         pMAbd7M212i99Ybtz2+/s4JxZozI4qQBCHlwnIMx3MyKso73qqLMR3Z/swWZDX20kCZ/
         gxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695992883; x=1696597683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxf0/FyTTukPZaR6SdHjgImiVLVk6/MUUSQkTxW8+KU=;
        b=OBOu6mABGU7CzHhqxLbF8IfFG7dCHVprjKZKEfyfSyV20o7bikCUf/qQS5Vm7GVo5a
         IvS2kN8RtXu7xBMQCBt0PMp8LdvER2Y8+K41XA/yuT06eJMWLvQrDPEGP+OlwdnYaVgR
         ccEbPS8x1Mwg4ACjx8/cEybpX7Nf+icn+sGXkAGQWTrr7Id3n6UWC3sreiKZjATS8b16
         eOO5nvQTg5FBz5PfGreDwi/av15tUgzrYhxwf6U5JSKe0QQ7Cg+wEJpUTVOhVZmVPD96
         umq9IV28uk4tOHH2vBc6WXZmjUSuH2fFknFhtmh/n+kiUMa57Bg7uttFcXFcYIuln2uG
         zvoA==
X-Gm-Message-State: AOJu0YwgUyXE9qq52dqvVVELeRB+keX+GXGALtU2Hvtdzg24Kty+Sox4
        ypd8MWQ9f6VVOzTGKC9wVLGbG5rVQFKueioEl6AK7Q==
X-Google-Smtp-Source: AGHT+IFucZCo8279H51n3/tmS/YO6dD0AvhFbS6fpKa1lhTxaDjzXKhPWSNK12VWIBjTL/LzXSRDg9l/h3uoHBsGxzE=
X-Received: by 2002:a05:6102:7a4:b0:452:d5f6:cf5d with SMTP id
 x4-20020a05610207a400b00452d5f6cf5dmr3655845vsg.32.1695992882701; Fri, 29 Sep
 2023 06:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
 <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org> <20230929105829.vm7ed3unydb5rrh4@vireshk-i7>
 <CAMRc=MeU+yS7L_HguALjoYiw8NHqTWQ1=X5s4OmqnNiqAZmOOQ@mail.gmail.com> <CVVEV9GFLWN5.1AB912RVJSYUC@ablu-work>
In-Reply-To: <CVVEV9GFLWN5.1AB912RVJSYUC@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Sep 2023 15:07:52 +0200
Message-ID: <CAMRc=MfxCUYw_X_gVeRbX1m2KC-VBJgfQ1B2cE=kyF6FKy94+g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: mark all owning types as `Send`
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 2:47=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Fri Sep 29, 2023 at 2:45 PM CEST, Bartosz Golaszewski wrote:
> > On Fri, Sep 29, 2023 at 12:58=E2=80=AFPM Viresh Kumar <viresh.kumar@lin=
aro.org> wrote:
> > >
> > > On 28-09-23, 16:37, Erik Schilling wrote:
> > > > The thread-safety rules of libgpiod allow individual object instanc=
es to
> > > > be used from different threads. So far, this was not actually possi=
ble
> > > > with the Rust bindings. Not being `Send` disallowed the user to tra=
nsfer
> > > > the ownership to different threads.
> > > >
> > > > Rust also has a `Sync` marker. That one would even allow sending
> > > > references of objects to other threads. Since we wrap a lot of C
> > > > functions with `fn foo(&self)` signatures, that would not be safe.
> > > > libgpiod does not allow concurrent API calls to the same object ins=
tance
> > > > - which Rust would allow for read-only references. Thus, we do not
> > > > define that one.
> > > >
> > > > Chip was already modeled correctly.
> > > >
> > > > line::Info is not marked as Send since it may either be owning or n=
on-
> > > > owning. That problem is fixed as part of a separate pull request [1=
].
> > > >
> > > > [1] https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-=
0-990dce6f18ab@linaro.org
> > > >
> > > > Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-wor=
k
> > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > ---
> > > >  bindings/rust/libgpiod/src/edge_event.rs     | 4 ++++
> > > >  bindings/rust/libgpiod/src/event_buffer.rs   | 8 ++++++++
> > > >  bindings/rust/libgpiod/src/info_event.rs     | 4 ++++
> > > >  bindings/rust/libgpiod/src/line_config.rs    | 4 ++++
> > > >  bindings/rust/libgpiod/src/line_request.rs   | 4 ++++
> > > >  bindings/rust/libgpiod/src/line_settings.rs  | 4 ++++
> > > >  bindings/rust/libgpiod/src/request_config.rs | 4 ++++
> > > >  7 files changed, 32 insertions(+)
> > >
> > > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >
> >
> > Thanks, do you have any comments about the other patches in this series=
?
>
> Hm. The others are not Rust-related and mostly try to document our
> discussion about thread-safety of the C lib. It would probably be good
> if you could double-check that I summarized everything correctly.
>
> - Erik
>

Of course they aren't and I should have read them before assuming the
entire series is for rust bindings. :)

Thanks.

Bart
