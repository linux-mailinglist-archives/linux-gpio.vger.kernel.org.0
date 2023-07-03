Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC19A745480
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 06:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjGCEVw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 00:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGCEVw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 00:21:52 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3EFE6
        for <linux-gpio@vger.kernel.org>; Sun,  2 Jul 2023 21:21:49 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b89bda02ebso1769545ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2023 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688358109; x=1690950109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O+SnPMsLMBwb52S0PBcfdjTVGTKpd70lgshw6AfptCs=;
        b=pGgNL34l5iFzN6mdtQulXgZAl+JBspqQU2+lcUrL66w4bU1HwvlVA4C8ihVk6v1DM4
         RqK120pD9jpYd4+LhGWjn+P5EBCe0CGOYAJaxsjUb28sqAWqsB7qCLvCoRabZlmh5mXP
         q/+U+Qhkm9YhiLDWXpOA/cClO0OFDElanXUdJd62Le+UoBZ+4rtIwrDu9Gof18KnP4EK
         7ZlM+/VM+HdMKzxu6D2pM6NuWxBjTvyxSLsdF0fO36+LzshVPR5MtUagfSMAxwq9Mff1
         2jMRIEvSI34SR4tznu5O19WLG4ATiASum+eglBz6eVtGe6HDZNq0UeQP0ftK9vwcuiR4
         eBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358109; x=1690950109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+SnPMsLMBwb52S0PBcfdjTVGTKpd70lgshw6AfptCs=;
        b=YCFp/oshk1y0tTumShfz0jf/Kfy3RUUrnDuSzrlId8BCwVJR4ydAq6x0Mdlo2hQWg0
         SRdqCahcNHL7N6HnaYlJv9xNLfJcQKaHbaqDWfFAqH3i9H8bFv6wyQDwk8IUJxTPJtSd
         JYqk3COli9T107F6usEbxbkmQgwtWNMc4tHnS5YAxEF2Hlpc+4ouSVZRFphUsVNLUF+Y
         1SfWnkFITsO5sutvJ9Bdy8Mknnq1OyRxJYArjOVFFcmDm9IzYkY2+Jt+LWjkaZE/xx90
         oQABEmpnGylXNmIpWK882/RdU0UdrRLG0mhwbh/oByU3ZV7vknUJoBVDCdMLD+eWXOvh
         HizQ==
X-Gm-Message-State: ABy/qLb1NJgP5vgrMflnspyzSAx8FeMB/ucJOTG7hOSjS+ygYWMJU6IU
        D2D40Dc4oQDufIiNG654uLngoQ==
X-Google-Smtp-Source: APBJJlELl1NtrSK4O1qOIYmbuUBOyYTkX96ULf+XmDSUsSY1qfM5ladJyV21ynBtfzBX8A3CXBVDTQ==
X-Received: by 2002:a17:902:c94d:b0:1b8:3e15:46a1 with SMTP id i13-20020a170902c94d00b001b83e1546a1mr9636775pla.67.1688358108850;
        Sun, 02 Jul 2023 21:21:48 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902728700b001b8761c739csm4163972pll.271.2023.07.02.21.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:21:48 -0700 (PDT)
Date:   Mon, 3 Jul 2023 09:51:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 1/2] bindings: rust: add README.md for libgpiod
 crate
Message-ID: <20230703042146.7bthwaiypzg3prhk@vireshk-i7>
References: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
 <20230630-rust-readme-v1-1-1ce9e6f7985c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630-rust-readme-v1-1-1ce9e6f7985c@linaro.org>
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
> crates.io treats the README as landing page for a crate [1]. Since
> we have none, it currently displays a blank page. Lets add at least a
> little bit of info here so people can figure out what they are dealing
> with.
> 
> [1] https://crates.io/crates/libgpiod
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/README.md | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
> new file mode 100644
> index 0000000..4afd3d4
> --- /dev/null
> +++ b/bindings/rust/libgpiod/README.md
> @@ -0,0 +1,25 @@
> +<!--
> +SPDX-License-Identifier: CC0-1.0
> +SPDX-FileCopyrightText: 2023 Linaro Ltd.
> +SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
> +-->
> +
> +# Safe wrapper around Rust FFI bindings for libgpiod
> +
> +[libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/README)
> +is a C library provides an easy to use abstraction over the Linux GPIO character

                 ^ that ?

> +driver. This crate builds on top of `libgpiod-sys` and exports a safe interface
> +to the C library.

-- 
viresh
