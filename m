Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13419734C70
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 09:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjFSHgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 03:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjFSHgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 03:36:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5507183
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:36:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-988aefaa44eso107823766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687160210; x=1689752210;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVUyGfFZYXEK25wKbgQAFh5W0wnBtn6dn9eMAnbSf84=;
        b=oe9j0koU8fYe/03CE8tNxzrN14WBo3mcL2tHYZUo85ms0P4UDZBhtqLHpIxgl7J7gh
         5Jlnqm9vdlDTE8LXceTDFbAwdrQ8q0sSCBuNS2EgNhVZuf7aBmaGodM9EI4KkmApsBbM
         k6rgEPPtCQkY4I6DXG2qbnMpzNZAYKlklbVOgYAhYlk682p2XcR0c8JZFbovYKFFqYvb
         wibU+QgeHIC/RsbcreceY3cTPIiQw5p+99kGRvJD2kqP8iZvNBbdXHwqUcOhLrwIWfKz
         dpT75+tJjzUVocF7BQYb/tQpZ7WD1Q+URAkO9CkR9dp2Usu5srsCc2rXY43bGyyO5CaJ
         8t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687160210; x=1689752210;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VVUyGfFZYXEK25wKbgQAFh5W0wnBtn6dn9eMAnbSf84=;
        b=gdGvE2TJMUZoTIHTB2FDBrUQgj60cA6bxvcHH+mIHlocnJb25ZBraMzjY9uGpR6rOj
         PUYRxOu2sbmO+lTqhKfYo+7OL3KaTNw2MiLEQiTbHRCY1vBytEVoO1ah0hDV+k9cCx7V
         S93lPynDge5HWdxQlbVqvg7EwnRRBtjHCJJLB80BI/vdHUMPNbK4UCRnGu3uIiraqHOy
         dhNAqguCiOQ3WrPw7c4oXwaw5LHscXqj1vG0bViAZrW47YxAnZ0sGqtZ9wrMMvJfupJ6
         8zyl1EsKHVFBvoXHXOTCt7Gxh1pUmqTvJ8HKSwAkpVaVjpwZox/uLXERPym0qcoIluF5
         DMhw==
X-Gm-Message-State: AC+VfDzDtOUApkw4xQsp+wEOHq04DLHbP8pRHIpZupaJaiBmdG+XOrwo
        3P4DLZI4Mm3K8kfTvonpfhkVkA==
X-Google-Smtp-Source: ACHHUZ7XTD03Wftcem+GQXCl0GEsrNUBER4xuLgJmJ7FLeTMY3KTJmVdt8pxNTI7g7SPupungzSEoQ==
X-Received: by 2002:a17:907:2da4:b0:988:806c:62da with SMTP id gt36-20020a1709072da400b00988806c62damr2932900ejc.58.1687160209752;
        Mon, 19 Jun 2023 00:36:49 -0700 (PDT)
Received: from localhost (i5C740111.versanet.de. [92.116.1.17])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906354e00b009888b71c368sm1551902eja.152.2023.06.19.00.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:36:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 19 Jun 2023 09:36:48 +0200
Message-Id: <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
In-Reply-To: <ZIl6X8YAUHS/n5s8@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry, got distracted while sorting out the MSRV mess that I sent a
separate patch for [4].

On Wed Jun 14, 2023 at 10:29 AM CEST, Kent Gibson wrote:
> On Wed, Jun 14, 2023 at 10:14:08AM +0200, Erik Schilling wrote:
> > On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> > > clippy from Rust 1.70 reports a host of warnings due to casting and t=
ype
> > > conversions across the FFI interface to libgpiod.
> > > These casts and conversions are required to support old versions of R=
ust
> > > that do not support recent Rust FFI extensions.
> >=20
> > Could you elaborate which extensions are relevant here? Would it be
> > realistic to just update the minimum Rust version instead of needing
> > to include these suppression directives?
> >=20
>
> Types were added in core::ffi[1] in 1.64 for just this purpose.
> e.g. c_uint[2]
> Though c_size_t[3] still remains in Experimental.
>
> [1] https://doc.rust-lang.org/stable/core/ffi/index.html
> [2] https://doc.rust-lang.org/stable/core/ffi/type.c_uint.html
> [3] https://doc.rust-lang.org/stable/core/ffi/type.c_size_t.html

I do not think that this is the reason why we need the casts...
bindgen generates bindings using std::os::raw::c_uint [5] which is
stable since 1.1.0 (and was previously defined as u32 [6]). I think we
can just drop the casts entirely? I can run cargo clippy --fix on latest
stable (1.70.0), then go back to 1.60 and everything is still building.
I am having trouble to execute the tests in that version due to some
linkage errors, but that should not be the fault of the casts.

Did I got this correct or am I misunderstanding your reasoning?

Note: One needs to fix a bug that cargo clippy --fix introduces since
it replaces nth(0) with next() in event_buffers.rs and introduces a
unconditional recursion.

[4] https://lore.kernel.org/r/20230616-msrv-v1-1-1f0ca25b8222@linaro.org/
[5] https://doc.rust-lang.org/stable/std/os/raw/type.c_uint.html
[6] https://doc.rust-lang.org/1.60.0/std/os/raw/type.c_uint.html

- Erik

