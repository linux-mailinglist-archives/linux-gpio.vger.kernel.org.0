Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9DD7B1E25
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 15:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjI1NZU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 09:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjI1NZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 09:25:06 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CB1CD7
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 06:24:17 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ad810be221so1697568666b.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695907456; x=1696512256; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMH5rJIO2EsRT4lLTmhmwwK2yX2jsPTijApSi5B+48U=;
        b=NtYrod28vdxdr5ujKzKE6mIYpJ28urF6H9GV2maxxM/Fg9ZmGctaua04L3AX8Sq037
         n/1NLoa1AxFMoy3kB7IkicTOX3cfyhqsMNpE9dGBVyiB22G7P5sl+9VK7DPOgCrbi7vX
         Q1A8G1f0uPKovSVV66Ncx69RQPhL1ZDvt4TiJnlpdtXhWQ4ydWqsq92t3TcZci9+nlpf
         4T7uO/ryGrPs3F/QFfCxzME2TZFgTSyKlozo02ckvbjizwflGnoFfJnMnaKc86WHYzBD
         kIZwNVlNXCqnsR0b10CH8WFyI0BgkrnVzsKdkfp6tOaLjvG3ni9vXifWeI9RNKRT2Tfl
         zpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695907456; x=1696512256;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMH5rJIO2EsRT4lLTmhmwwK2yX2jsPTijApSi5B+48U=;
        b=MW75r7jcz11TaXKD7KLitjrQYJekBBYB0Q/lwRAfH7K2/W2e8UmHRQWuhHw3SZJatG
         TNfxV9Vz6g+rzTC1riVD7Qt4FrItdmgpEm1r1NNw9/1MB5svIWTRg+ZnnSR0RGLvlr78
         ZnZ4MG2EwMiJp5zlg4UIKNQZFwK5BWdgcqiYl6RsqM0srG2OUf/px2b10n7Cso+q9UU8
         Q4NCmExaKEP8/of2OQLnMyNKadky6zZN5HA4Qb4VLf3g8g4bT87zHq3ozdm8WXgW5PFP
         iZm9pl9ETW9FXDLRvf5pasV3V0NUd6v4cHcNBZmsRGmr2XLQA6RDcMrotToo2Coo3LKX
         q55w==
X-Gm-Message-State: AOJu0YysFEa3VGwY1YX+wk8F433x+g+lPqmZcKiQLm06/OXG6iDbL99M
        TRq+puTTUoh+ALPPgxfu6WS4SQ==
X-Google-Smtp-Source: AGHT+IEOp2MdjVALwmnWcvGxIChRhwxw1LmqojIN+NTEPCblHe1N49OAUPdKlftMxnKqezuz+QV+tg==
X-Received: by 2002:a17:906:19:b0:9a3:c4f4:12de with SMTP id 25-20020a170906001900b009a3c4f412demr1274163eja.37.1695907456312;
        Thu, 28 Sep 2023 06:24:16 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id s25-20020a170906061900b00997d76981e0sm10855370ejb.208.2023.09.28.06.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 06:24:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 28 Sep 2023 15:24:15 +0200
Message-Id: <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of
 line_info modeling
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Erik Schilling" <erik.schilling@linaro.org>,
        "Linux-GPIO" <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> +/// Line info
> +///
> +/// This is the owned counterpart to [Info]. Due to a [Deref] implementa=
tion,
> +/// all functions of [Info] can also be called on this type.
> +#[derive(Debug)]
> +pub struct InfoOwned {
> +    info: *mut gpiod::gpiod_line_info,
> +}

While going through all the structs in order to add missing `Send`
implementations, it occured to me that it may be a bit confusing if
only this one type has the `Owned` suffix, while the others are also
"owned" but do not carry that suffix.

Not really sure how to resolve this... We could rename the non-owned
`Info` to something like `InfoRef` and turn `InfoOwned` back into
`Info`, but reading `&InfoRef` may be a bit weird?

Alternatively, we could rename all other structs to add the suffix...
Then, "Owned" would maybe sound confusing - given that no un-owned
variant exists.
Maybe "Box" would be a more suitable suffix in that case - borrowing
from the Box type name [1]?

Any opinions here?

[1] https://doc.rust-lang.org/std/boxed/struct.Box.html
