Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AEE72F8DA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 11:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243707AbjFNJQy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 05:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243186AbjFNJQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 05:16:54 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D87F1FC7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 02:16:53 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8cc04c287so3641515e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686734211; x=1689326211;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bIW1Xo9RTCl8RhQy8Z1sloli6+QlNF8nqmC6pmHEvM=;
        b=llca+bsBWCsyn2aUpx3iE86g/QmfgE55NTogZ1k9nVuBRwjgHhllksegpuiKzLZEcu
         VhLtrB59bgPQVmmprG1MmyFtKWAZH32ijYvBXdD1jYaaaOUxVRKpXyFCVlQKfXwU6fhv
         c0fWzgUu+nFzb/E4outM6RxpHX1j1ZRKPGnGhd05IbvCWuP5rGZJEFOfvUw4fgOagbYq
         5UZ2B2kQVpCth6MMSzEnhWdX6nFynnFoiHOqlByWnmokIrUrspuOX8ROPZBggcCE1ckW
         eTPWW+RComZzR4ZqPwEuVRMf3SKptcUq7nEbddu9eA5qxF26pVZko9mRegj+VdaKttkP
         /okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734211; x=1689326211;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bIW1Xo9RTCl8RhQy8Z1sloli6+QlNF8nqmC6pmHEvM=;
        b=MVns9vq22NNEha4qDTLa3/n9XyXMmlJFS2W8kXiTLhnYYkDyfEnym4KNBzNEFB9a88
         fpYeMeu+UvfyhASes8ZJA4DLSrWNo24dA2MAOYt/NllYLNsf8lb6jvICjDb2/SV8zapR
         V0emYtxNqNnbsHLy5sR2U934Na2Qe3YQ8KhIvc//nqvuLuRKgj3ERlFeQbxqGCDhVYgk
         x0Fxxi3WbObnRiMMfh+9wkdAGDYiUmdGgYM8idoJ/i0OhjQP31s4oYscr4nNztutSElM
         O4N03XSBRbr/KNEnRKa82wrQ29Ld0cPRvyIR6Jd/AlkjTXyikjFS8541MKO+OxGtF0Ms
         ERfQ==
X-Gm-Message-State: AC+VfDzsyaxVoJ5GPLUgO49bRnUAEBR3zqiMd9c1mwrgGQanQuWWv/hb
        DBC6HwI49I6MwlmEfUFhTEdPDA==
X-Google-Smtp-Source: ACHHUZ4w1D1TLNmUidFGU+alHBI+O6fHdy/K3ZvelwvEW7Yp6jhAIwvk9yYV+Tm8T/ATNuw8o8MygA==
X-Received: by 2002:a1c:6a18:0:b0:3f7:19f9:4c4f with SMTP id f24-20020a1c6a18000000b003f719f94c4fmr10263680wmc.21.1686734211028;
        Wed, 14 Jun 2023 02:16:51 -0700 (PDT)
Received: from localhost (i5C740811.versanet.de. [92.116.8.17])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003f858ae8f9dsm6516242wmj.31.2023.06.14.02.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:16:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 14 Jun 2023 11:16:50 +0200
Message-Id: <CTC9DIU5X5C2.1M6232L22HH9K@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
 <CTC8M1AAQDLI.DNPMW5PQHFNK@fedora> <ZImDFS2ATTxeFxDK@sol>
In-Reply-To: <ZImDFS2ATTxeFxDK@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Jun 14, 2023 at 11:06 AM CEST, Kent Gibson wrote:
> On Wed, Jun 14, 2023 at 10:40:56AM +0200, Erik Schilling wrote:
> > On Wed Jun 14, 2023 at 10:29 AM CEST, Kent Gibson wrote:
> > > On Wed, Jun 14, 2023 at 10:14:08AM +0200, Erik Schilling wrote:
> > > > On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> > > > > clippy from Rust 1.70 reports a host of warnings due to casting a=
nd type
> > > > > conversions across the FFI interface to libgpiod.
> > > > > These casts and conversions are required to support old versions =
of Rust
> > > > > that do not support recent Rust FFI extensions.
> > > >=20
> > > > Could you elaborate which extensions are relevant here? Would it be
> > > > realistic to just update the minimum Rust version instead of needin=
g
> > > > to include these suppression directives?
> > > >=20
> > >
> > > Types were added in core::ffi[1] in 1.64 for just this purpose.
> > > e.g. c_uint[2]
> > > Though c_size_t[3] still remains in Experimental.
> > >
> > > And I guess the clippy lints followed soon after.
> > >
> > > Wrt setting the MSRV, but I assumed not, hence the allows.
> >=20
> > For me bindgen seems to generate usize of size_t, thats why I asked.
> > Does that depend on the Rust version somehow? Or more concretely:
> > When will things like `gpiod_line_config_get_num_configured_offsets`
> > not get translated to `usize` so that we need a cast?
> >=20
>
> No idea - outside my area.
>
> > On my end (with latest toolchain and nightly), I do not see any
> > clippy warnings with `cargo clippy`. How exactly did you produce those
> > warnings?
> >=20
>
> Interesting.  With stable on libgpiod master in the rust/libgpiod
> directory, and with these in my environment:

Oh... My fault... I saw the -sys somewhere and tried to run things in
libgpiod-sys (after inspecting the generated bindings). Need to revisit
this in a calm moment.

Thanks for the additional detail!

- Erik

