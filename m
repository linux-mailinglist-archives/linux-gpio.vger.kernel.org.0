Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294AD745483
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 06:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjGCEWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 00:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGCEWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 00:22:40 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC917188
        for <linux-gpio@vger.kernel.org>; Sun,  2 Jul 2023 21:22:38 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76571dae5feso370997485a.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2023 21:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688358158; x=1690950158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBiWWNPUDlOEwZogtu65ONVk92fdi9c8tzrq6QP0fko=;
        b=zx3FVXq3QDABNonlmebLpAJt4r/x9F1tHSyCwpR1+BBPMPUtRRp9W+WbS8QCLqzD+k
         b/1jpfLdg/Z5vM4Q7kyyyrUKs9rp/yTegw8ZgtBwCAdVrggSaVufKOGO4gaAh/g2dP7l
         btUhQymIQqQLrI4tF1v0MWFmPL6Q9HkBRgalx69ytRfiC0dB6z6iS0dzC85g55945ODS
         YLZ/h53FbUbuTy2NTt8djVnp1+uvjn69nOZZ0IbuVR9Nm/d5ssAUuQrd79G6iX4F0bE/
         UP/og9DxgyFd2DKQV4xwtl5xSbEthBq2TQk1mGBlWKP/P9t4LvFwwVWgeb+rbNU8RiMn
         TQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358158; x=1690950158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBiWWNPUDlOEwZogtu65ONVk92fdi9c8tzrq6QP0fko=;
        b=jTy9V7Y9kq0OS2KckdSLPYjSRP4awkde35LgrKe2Qdq4RFo/aeLzuMLelgZ/FrgOVw
         CB0m8AhwSIHlFwc9EBqMFXfEE3KdFcSvzi8mZhfgYhgZGC3ZTNbeRkqMtGUHC0BQikP3
         wA4q4EFpbp6BKt9mplFdY40KBrfANA5PVIl2XBx9b4e0fUpJRTPPQcqIUO9PCgS+xsYn
         /cd3lA1Z+a8XxQXMfC5tG5sxyAsHvDUluMooq6xTfyKHNtUjWut0SxYC77eyFeSJf3Qy
         zwmUVUxJigdqr/6O0J3SQUBeMUg/DYSEi3CsIFWrbm1mTR26++x9vnTMe+MJk9LXyLiR
         eMTw==
X-Gm-Message-State: ABy/qLaNg0ev91cNyg6UZMOtXwrOM4SwVv1Gm4iDJP512387Gag1rQRS
        3bmKBEA2NWaCqqNte/9oFF5OZEFXiNsvQFZPZ1k=
X-Google-Smtp-Source: APBJJlGiCqbZX6Gax0RYjT7bElogrqAdCPV3fUYsmwwANLxsRrxuKDKpS3EBoQQsuaP6AswFjOIIVQ==
X-Received: by 2002:a05:620a:3c07:b0:766:e430:21b8 with SMTP id tn7-20020a05620a3c0700b00766e43021b8mr8525255qkn.75.1688358158092;
        Sun, 02 Jul 2023 21:22:38 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id e5-20020a62ee05000000b0064fe06fe712sm13133691pfi.129.2023.07.02.21.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:22:37 -0700 (PDT)
Date:   Mon, 3 Jul 2023 09:52:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/2] bindings: rust: mention the libgpiod crate
 from libgpiod-sys
Message-ID: <20230703042235.76tunznh7g6mns3a@vireshk-i7>
References: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
 <20230630-rust-readme-v1-2-1ce9e6f7985c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630-rust-readme-v1-2-1ce9e6f7985c@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-06-23, 12:46, Erik Schilling wrote:
> If people view this README.md on crates.io [1], they likely want to
> use the safe wrapper instead. So this hints the existence of that other
> crate.
> 
> [1] https://crates.io/crates/libgpiod-sys
> ---
>  bindings/rust/libgpiod-sys/README.md | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
> index f9db496..05acd9e 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -8,6 +8,9 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  Automatically generated Rust FFI bindings via
>  	[bindgen](https://github.com/rust-lang/rust-bindgen).
>  
> +Typically, you will want to use the safe `libgpiod` wrapper crate instead of
> +these unsafe wrappers around the C lib.
> +
>  ## Build requirements
>  
>  A compatible variant of the C library needs to detectable using pkg-config.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
