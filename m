Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E0F7BD5F3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 10:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345562AbjJII6e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 04:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345563AbjJII6d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 04:58:33 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A67AC
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 01:58:31 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4526c6579afso2931842137.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696841910; x=1697446710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IjKT0+Ypkn7zhjMVgKrjoaDsjd0guLGpl3xLXwO7Ww=;
        b=oCVUTXigbL5LbRrTjAqaGNT9GpuC80QRXxrLi5m8XEqJ42elJ/YOeLjloqQUTQ68cs
         l0tjZ5/WIU1xhK4NjXaJW4Lpb27ljKy34DQt8/Sl3+zVCN8MthPhFBpdyOnEfqd7bYoF
         cApwkYUr9s8yOR2QvMptaAywR1P7FuKjMIMQK2kBIrrZzPviNCh3EN8fuNH42kzfvaY9
         74IsdkZC1cQuezT2q+m7qvL22hE39UZtSeBY6a2OBFqsE4atY6VtAJz5fAMkXjk4QWg5
         svXQGCkbj+UEip++wETAJzmlDBVXcUqmmL7tzh6d+Roz6ox2d8+nZQ5Zl0EK8ouGfP38
         6C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841910; x=1697446710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IjKT0+Ypkn7zhjMVgKrjoaDsjd0guLGpl3xLXwO7Ww=;
        b=vX10TeqWneO4h1Hfe9ON/6rD2acfQLXlQXIEIuOsxiwGdUJPMOjGdDDWBdisENFMof
         g0iLRBXxQkUjX9ZB8eVxQyFC9QIztnBtua9ZFj60yf37ZHdLqPvBPte0cFIb7TVyNLyG
         UwbO0lELECOMSOS3xlM1eQ/FjePKhtngEtoJ2OLNaKdXoMwyXLSBkY8IwzSm6y6r9qAN
         v56mEVV0baGrlVzHk35DVARnQJj9JrDRobykeIo7lZMuGluZ9xdH6UM5TfIWJxZqyfr2
         2omNoXwOwgfZVTp5iGVrLgD4v5OgCW6DLBF56LobeBCctTfBZNSjL/h3lANgVdY5Ukgl
         RHqg==
X-Gm-Message-State: AOJu0YyFSSHcUsZAr734+e49ogZ6B5mgyERzVJFi9+v9+YQZq5OxxPxf
        FgWgJypw5RVcXJ48XVfMs6yQB/b97PoTVVwKt2txqQ==
X-Google-Smtp-Source: AGHT+IF3oN2+wdoasfvC0M7azC7LrXRxULp2EbwuusLoXmW0fNMOcPoS9Dg9e8by2GRahDN3v5LJIlxSVnAbMX2vYwE=
X-Received: by 2002:a05:6102:3a6b:b0:452:6834:b8f6 with SMTP id
 bf11-20020a0561023a6b00b004526834b8f6mr5293733vsb.3.1696841910663; Mon, 09
 Oct 2023 01:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
In-Reply-To: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 10:58:19 +0200
Message-ID: <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased features
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
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

On Fri, Oct 6, 2023 at 9:24=E2=80=AFAM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> When releasing the 0.2.0 version of the libgpiod crate, I did not
> realize that there were C lib features that were not released yet.
> Helpfully, vhost-device's CI went up in flames and revealed this [1].
>
> This suggests a way to handle that and sketches how further updates can
> be handled.
>
> I acknowledge that this may be very strange to C developers...
> Traditionally, one would just use whatever your distro provided and the
> distro would make sure that dependencies update in lock-step.
>
> However, in Rust the default way to consume libraries is to pull them
> from crates.io. This is a balancing act for -sys crates which link to
> distro-provided libraries on the system. Since crates.io does not wait
> for distros to update their libraries, crates will need to support a
> wider range of system libraries.
>
> This sets up / sketches the infrastructure for that.
>
> Only the first commit is intended to be merged. The second one just
> sketches how a release will look like once it happens.
>
> [1] https://buildkite.com/rust-vmm/vhost-device-ci/builds/1746#018b0110-b=
9d3-468a-973c-c3bbc27cd479
>
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Kent Gibson <warthog618@gmail.com>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (2):
>       bindings: rust: feature gate unreleased features
>       DONOTMERGE: bindings: rust: simulate v2.1 release
>
>  bindings/rust/libgpiod-sys/Cargo.toml        |  9 +++++++--
>  bindings/rust/libgpiod/Cargo.toml            |  4 ++++
>  bindings/rust/libgpiod/Makefile.am           |  2 +-
>  bindings/rust/libgpiod/README.md             | 14 ++++++++++++++
>  bindings/rust/libgpiod/src/line_request.rs   |  2 ++
>  bindings/rust/libgpiod/tests/line_request.rs |  1 +
>  6 files changed, 29 insertions(+), 3 deletions(-)
> ---
> base-commit: e7b02c2259d97c77107c77b68e3bc1664e6703c1
> change-id: 20231006-b4-bindings-old-version-fix-789973703b77
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

I'm currently discussing a similar problem with a developer who
offered to help make Python bindings released on PyPi more
user-friendly. His suggestion for python bindings is what many PyPi
packages that provide bindings to C libraries do: just compile the
library statically and make it part of the C extension module bundled
together with python code.

Given that rust programs are statically linked, maybe this is a
solution we could use?

Bart
