Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4C870EC95
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 06:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjEXEhI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 00:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238495AbjEXEhH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 00:37:07 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269118B
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 21:37:02 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-53404873a19so356936a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 21:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684903022; x=1687495022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hWZ/LxIXvt/onveWnOMS0K/IVATDg09v2NV1/6mnYdQ=;
        b=e2VYrLMPT5jEiPEOEQaCxpjkZ1ZQy08gdbBaNuPUpup7AK84snvKg/QeNLgAD5wr1P
         GtAGyQFrLkofspfTzIQnZp4q7nuEoMR3tbrcdFIoCS1MvuzMF5LP3MvjIVX3Jgyf62Aa
         lxcvSzfxWX0US59Ncb6blGJan/lvQBdO3XnVX62aN3wNfUGE8BdUjbrWxKxqv305Gn0U
         Lnx6EF4mPxLS001CygWUiOYTQPqGWfB0YJDUImVQ45SVU9Jo1vH27YmTYn8J0S06uz+M
         fsyKAL5RrPR/vkYYryvdNpNFKA2r+tTwBWMTDIvHxnks4KtVMHczw9FOegZtyxgYVIaF
         qGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684903022; x=1687495022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWZ/LxIXvt/onveWnOMS0K/IVATDg09v2NV1/6mnYdQ=;
        b=UVbAtSNzpSv6Uyl7UrhcTj5HfraKU0Cq5/1DrnUDVt5YhB2PSQsKh8b9ogd2ZbrL7N
         6Kd6Ofq6+HMc9U0wxxZIGiWCMN/gwNWCDa6lRpa+FzmFnIRbEeNN+zBvcp68xlXD1CKA
         SUioyw+sUHFWwsiWhEiImOPGNIDWfgjCOx+bfFJFjZ83s8N1pfZZklssodkoqceLY7SC
         kfTvZh1XolHE0X0kVVmORGVENL9VSxsr4RSXFgkcIxatLK+AVLeyf+FcKClydBahNYyI
         0HtYEda2FllZxXyQ0NBTi9xmxDGLYKCLDR9kP88nwO132urt1yIJkLSJRMjGTIoEQSm2
         KVrw==
X-Gm-Message-State: AC+VfDyuMXco7tasYRoUivZrFvu4ila51GP/Yzat48oSfz04Q8LDxoYk
        cd68R7EH51l54QgZRorNTpufAw==
X-Google-Smtp-Source: ACHHUZ4oIPGFh6cmCKQc0jAYyRSn31lgWkwUNbjr0CpnsZoyE0jvW80qLlj5fpBsu/HprQDlH6x1XA==
X-Received: by 2002:a05:6a20:c18c:b0:10c:ef18:746e with SMTP id bg12-20020a056a20c18c00b0010cef18746emr1546493pzb.58.1684903021746;
        Tue, 23 May 2023 21:37:01 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a199900b0024e4f169931sm446070pji.2.2023.05.23.21.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 21:37:01 -0700 (PDT)
Date:   Wed, 24 May 2023 10:06:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 2/3] bindings: rust: remove unneeded cc
 dependency
Message-ID: <20230524043659.mbff7dpkinpxhp7t@vireshk-i7>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230522-crates-io-v1-2-42eeee775eb6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522-crates-io-v1-2-42eeee775eb6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-05-23, 13:25, Erik Schilling wrote:
> It was never used in upstream. The use was dropped during review [1], but
> this dependency did not get removed.
> 
> [1] https://lore.kernel.org/r/cover.1659442066.git.viresh.kumar@linaro.org/
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/Cargo.toml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index 3bc3525..cb8dc70 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -18,4 +18,3 @@ edition = "2021"
>  
>  [build-dependencies]
>  bindgen = "0.63"
> -cc = "1.0.46"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
