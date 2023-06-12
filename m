Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95472B74A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 07:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbjFLF0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 01:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbjFLF0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 01:26:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72918118
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 22:26:38 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5183101690cso2727901a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686547597; x=1689139597;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBz4m6TeVw+a4WYnsqYoRm+WsQ26uxdfEVamSjevGGM=;
        b=B4zSpTr/4d85ZYO3Kod8MsOUKGpydPD5LVdPWz8VQq5Hc9csWX6+dOBEWkUixB+Uv0
         7n+BTrb0SdimwDs5gkxCfuP21fXfu6DCF6Rs24Wiz4N1JeEEVUYzhW12dcwGPgj1253I
         w1Dk+kefDe7Wve8jjmgeoGiyO8866XeHEVrQa7hqwOKeGvqK/2B/BgeW8SSoRPZbHnbN
         zW1nt2yB+NJotQJ+ETXWHEsQWotNuIFJU9HWtrcAz7VUq4fGMx1KWQtg8vhzXlE1f6g1
         DFzyMLo1CJYI3nKQMRh5q/iumIUVZSDpvC/NhnoLnWjJQ23rMXHpFR8q7N8mID9L//XA
         Zp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686547597; x=1689139597;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TBz4m6TeVw+a4WYnsqYoRm+WsQ26uxdfEVamSjevGGM=;
        b=jlYp1DpuK0/2TpiUAaSiIdD2kZyB0K1GrJsNxystpDwa0+YaG9d6U8XemcILA9O8jt
         QZYELOr/gDEoUIX5CWljl+M9/bJzoOOgmScozm0tI+ldo4kDMWWTKFqbHf4W2GVH3Ckw
         aqEiBdAoFvHtFaS33WvXeqXZ16oDMQprciG5b5KwuG1PmsUqXunLOo/OLdA2LRlvtMMj
         NiJwhpafWAXjOGyu9XV5y2PnwXCZn05q54UKwDMMhX6bBzQ1ZDsd07dRepp9hyP/pyDK
         EshFYtiQ5CnF/68Il3nPYlbWBnw/AlgfmY/GZpKtW9O26j0bFvTO7zLgnR+lE3Zsal4c
         6AMA==
X-Gm-Message-State: AC+VfDyw/IZ94CJ4jXBWUAKx1c5CK6b3lHcmZ+b2YqYompfq7pIFjjIY
        BRdtb2CdsMcu+u2sH6BWxrcg+vFMsF7+PjJJjL0=
X-Google-Smtp-Source: ACHHUZ4YF8B1r9GiCR6tFZbFO4IDD8cFf5NndwRa5fzqtf/fn7/tmvwXq0MWu8S/t8tdlQMMVbiBoA==
X-Received: by 2002:a17:907:7f1e:b0:96f:f56a:e9be with SMTP id qf30-20020a1709077f1e00b0096ff56ae9bemr9198839ejc.8.1686547596950;
        Sun, 11 Jun 2023 22:26:36 -0700 (PDT)
Received: from localhost (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906360200b0096a27dbb5b2sm4563175ejb.209.2023.06.11.22.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 22:26:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 12 Jun 2023 07:26:35 +0200
Message-Id: <CTAF85GP5JIH.308KO3L1T9153@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Cc:     <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.14.0
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7> <ZILE258m92XrBvNP@sol>
 <20230609062456.fqw3mqvtcactx2zj@vireshk-i7> <ZIQJquwzNacp1Nuh@sol>
In-Reply-To: <ZIQJquwzNacp1Nuh@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> On a relate note, how do you run clippy now?
>
> When I tried `cargo clippy` I got an error about pkg-config not finding
> libgpiod. Fixed that by pointing PKG_CONFIG_PATH at my local libgpiod
> build.
>
> But now I get:
>
> --- stderr
>   wrapper.h:1:10: fatal error: 'gpiod.h' file not found
>   thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic=
("wrapper.h:1:10: fatal error: 'gpiod.h' file not found\n")', libgpiod-sys/=
build.rs:44:10
>
>
> so I guess bindgen/clang needs to be pointed at the include directory,
> but not sure how to do that without emulating whatever `make` is doing.
>
> Same goes for `cargo build`, come think of it - now you have to build
> using `make`.
>
> How are you supposed to tell if your code is sub-par without clippy to
> tell you?  Or, more generally, how does the development process for the
> rust bindings work now?

Setting PKG_CONFIG_PATH will only work if you point it at the install
folder of libgpiod. If you do not want to install, you will need to set
something like this (taken from the Makefile):

    SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=3D1 \
    SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../lib/.libs/" \
    SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
    SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include/"  \
    cargo clippy

See https://lore.kernel.org/r/20230522-crates-io-v2-2-d8de75e7f584@linaro.o=
rg/
on why it had to become a little bit ugly for rust bindings hackers.

Maybe we should put that example back to the README.md (or into the top-
level README?)

- Erik
