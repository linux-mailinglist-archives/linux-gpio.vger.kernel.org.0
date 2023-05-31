Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245D87181ED
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 15:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236566AbjEaNcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 09:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbjEaNcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 09:32:33 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2734191
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 06:31:14 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6af6f5fc42aso5396456a34.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685539873; x=1688131873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwu53Tr1pjodPrUOeQkCpfZLYubIQV6+YYZ5UoUicb4=;
        b=GsvV0BMQTK/iinBOIgiBZT8SfysjPrw0iX8HXa/lywMvVFQQd62lMT5LW+Nv7KXJvi
         x26nnQjRBL1R3/x5M70qr8Xwn+sSOWNDW9CvTwLCvJRVYVF0YZy7lgsc1yqd2XRbTz8U
         cbs07x0/uEhy6OphmnPl2sH/5jmZ5l/fRF0eNrj1vBJKaKQxzeBPWdooAzxrU8Baz8W3
         h/2DnZPddm9gEA/XpZNmM+WL/HVgnSmtmnHG9BQsk5SqlP0wHbxuA0MaQPmrvmfBZgLe
         LFosdGJjKeDVFI7tABUCqBnKlDvdpPPJAEGnBk18o2OXmvyNn3fgWyKWumeG0isOL/Xe
         ZR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685539873; x=1688131873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wwu53Tr1pjodPrUOeQkCpfZLYubIQV6+YYZ5UoUicb4=;
        b=bcee8jdLX67uptsPiciJr5v5c5MTxeW/J4JUgf49sZuxpn81PrEwBtReEu4yRivpV7
         iPDIV+N3HbgHGWr/UT3P8+dkoXT4umFWljXbjEAo+j6EHL1k72I5w2LZtWclMgRcJUWJ
         9JwswM9BmKlfL/3xfn0swyloGUNBbXsdf1vyqCnyEpuI2635nK9vYfkC5wOrZm9NPjhJ
         cuEm3k9vQrll0YsKNoDU5ZtayLU9ZUdo2krjJmpBZoasLDBR4RcuJP+04BJr6MW7x7hM
         99U8Cf3906DAhiILubmVg/6ePe28Yvr8srRQ7HajpvFs7q4foCiy7Ox3XnfvAis2OVkj
         8a0w==
X-Gm-Message-State: AC+VfDzaHWulw18EU9LSLIQtRGJ9HpOskdWDTT0o7KvPFQoswoL3ofeU
        NIhlKnbj45tzlV0nCdtA5tG29mKjKY+NNuXY47HI+Q==
X-Google-Smtp-Source: ACHHUZ4gCwRwSShUTl2ea7MNMUyZcEDpVxBPz40GMGXM677J3vyT6k+xi5AOCJhVJ6nx5t/wnloZbREEls0Qihighl0=
X-Received: by 2002:a05:6358:7e84:b0:127:c478:641c with SMTP id
 o4-20020a0563587e8400b00127c478641cmr2306355rwn.28.1685539873197; Wed, 31 May
 2023 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
In-Reply-To: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 31 May 2023 15:31:02 +0200
Message-ID: <CACMJSes5+vT=NBqSe7xpSEPAEMmkgrZvJ8iKx7oBCKZQaGB_rg@mail.gmail.com>
Subject: Re: Publishing libgpiod-sys and libgpiod to crates.io
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 31 May 2023 at 11:24, Erik Schilling <erik.schilling@linaro.org> wrote:
>
> Hi all,
>
> After merging of [1] only some cosmetics should be missing from being
> able to publish to crates.io.
>
> First, we would need to agree on a version number (or rather a
> release management process). Rust is suggesting people to follow a
> SemVer approach [2] and I would strongly suggest to stick to that
> recommendation. We _could_ just start releasing with the next libgpiod
> release and have the Rust bindings follow the libgpiod releases. While
> this may seem intuitive to users (they can just spell libgpiod = 2.0.1
> and reason easily about which libgpiod version is in use), it would come
> with a couple of implications:
>
> 1. Users would likely expect new features of a C lib release to also be
>    usable from the Rust crate if it uses the same versioning scheme.
>    So this would also tie the necessary effort to expose those features
>    from the Rust bindings to the release process.
> 2. Supporting multiple versions of the C lib with the Rust bindings
>    would be no problem in general, but would become awkward when trying
>    to replicate the version numbers of the C lib.
> 3. Changes to the Rust bindings would always require an overall version
>    bump.
> 4. There may be a conflict between SemVer bumps for the whole of
>    libgpiod vs a bump that would be required for the Rust bindings only.
>
> This all seems pretty restrictive and undesirable to me... So I would
> recommend to manage the version numbers of libgpiod and the Rust crates
> libgpiod-sys and libgpiod all separately. It may help to think of the
> versions of the Rust crates as ABI versions (the C lib has its own
> ABI version too!). This way we could :just get started with the version
> numbers starting at 0.1.0 and start bumping them as needed for both
> libgpiod and libgpiod-sys independently. Also, this means that uploading
> to crates.io would not be strictly coupled to the release process of the
> C lib and other bindings. That may allow to spread the load a little.
>
> This may be slightly confusing to the user, but I hope it is less
> confusing than the mess of what I listed above? Any opinions?
>
> After agreeing on a versioning strategy, actually publishing to
> crates.io should only require to add version number restrictions to the
> libgpiod->libgpiod-sys dependency. It will then use that version for
> installs from crates.io and use the `path` when building locally.
>
> Once that small change is also done, I think we are ready for
> publishing.
>
> @Bart: How would you prefer to handle the upload of new versions? Or
> would you prefer to be the one doing it or prefer if someone from the
> community handles it? I can offer to help with documentation and setup
> if needed :).
>

For versioning: I'm all for decoupling libgpiod API version from rust
bindings version. I did that for python bindings starting at 2.0
(since they've been published separately on pypi).

For uploading rust crates: I'd love if someone else could do this. I
don't care enough for rust to do a good job at it. :)

Bart

> [1] https://lore.kernel.org/r/20230522-crates-io-v2-0-d8de75e7f584@linaro.org/
> [2] https://doc.rust-lang.org/cargo/reference/semver.html
>
> - Erik
