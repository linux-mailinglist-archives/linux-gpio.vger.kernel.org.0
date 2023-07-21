Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9251D75BCB2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 05:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGUDPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 23:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGUDPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 23:15:43 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEC92709
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 20:15:42 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-565f2567422so1015260eaf.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689909342; x=1690514142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoI/NuD+9Ll36hNC+/TWGwR24LsLVMLBBg5eHaUTKqE=;
        b=iu6UzL9SEqFnOiJXZsDd7gY2e8G+grUCklVDFXmlov9WLEpD2+CYW5Yc4aZ+LqHuHb
         nu3ZajLSgH6KlHwHaq/OIlOtaDhBZcCLkyXiwkOfc/tTLegiecjG64eRueofxmOvMAx8
         rlt2vOh31vbwz0wv22PId5eyizHy1qYNimyi1M0AllncVWlxjCLPhSBTfyeMiylucmMG
         IWC2B2egX+OmVVY5anGyhWsiFyZJtdH+01m4z9SwKy4gl0ywMFDHbP/lYs7FVbxsBjDP
         a5ecCL03DDvyEaMPuuVEQ2HdnkdYkbAoG3IlUAKS88E0HA3TRO1A1Q+s+mwC08fjKDY0
         8BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689909342; x=1690514142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoI/NuD+9Ll36hNC+/TWGwR24LsLVMLBBg5eHaUTKqE=;
        b=Sj3FnklWFPqsf+pG3+EzRczgG68RJpJgJDaOlubzxKeJQjRGEYBr9gbRXMzZq/ulZM
         EpKNlPEyrst99NzKYi7OpZPBfyY8NAbD1nHnsfMBsbt0aYvkMscU3DYpT8q42bXnRqpC
         KSMDejgq/Sh4FITuiO6WgG9yjO4uoIj/eN705ji/88kuVDWAL5ThcvPROSpX5lUtMLOy
         jJ6U6jzYRnMPGem0oMl9QxkVpFOKWTEOHzJejacHHhXVi2kvBOYAFBUczo0yMsF31/SK
         syYNi9SvMWT9sANzZmVTSb9yy2zzkwnR//VI/YdVD9Ip9f0E44sH1Qs1ds8yyVlCby/j
         I90w==
X-Gm-Message-State: ABy/qLbQC84J1tws8uVe7xihLVCPqZFLh9d+YjSCjSPxQDII36B2Nr76
        oa9WGPBqtoSEqV8B4IGz5XBEpf3F+zk=
X-Google-Smtp-Source: APBJJlFS4TRz5P9ybrysu6dhTw66tTaamubNt610xoUYQes8mfEnJV0d/msSzDLMVsIoYdsoMXDgDA==
X-Received: by 2002:aca:1202:0:b0:3a1:dc2a:a1dd with SMTP id 2-20020aca1202000000b003a1dc2aa1ddmr774448ois.47.1689909342068;
        Thu, 20 Jul 2023 20:15:42 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i127-20020a639d85000000b0055c656ef91asm2012018pgd.77.2023.07.20.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 20:15:41 -0700 (PDT)
Date:   Fri, 21 Jul 2023 11:15:35 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide
 LineRequest::chip_name()
Message-ID: <ZLn4V9IW0nI8djau@sol>
References: <20230720144747.73276-1-brgl@bgdev.pl>
 <20230720144747.73276-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720144747.73276-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 04:47:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> bindings and add a test-case.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
>  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> index 1140aa9..737c06f 100644
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -2,6 +2,7 @@
>  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  
> +use std::ffi::CStr;
>  use std::os::unix::prelude::AsRawFd;
>  use std::time::Duration;
>  
> @@ -25,6 +26,21 @@ impl Request {
>          Ok(Self { request })
>      }
>  
> +    /// Get the name of the chip this request was made on.
> +    pub fn chip_name(&self) -> Result<&str> {
> +        // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
> +        // as `&self`
> +        let name = unsafe { gpiod::gpiod_line_request_get_chip_name(self.request) };
> +
> +        // SAFETY: The string is guaranteed to be valid, non-null and immutable
> +        // by the C API for the lifetime of the `gpiod_line_request`. The
> +        // `gpiod_line_request` is living as long as `&self`. The string is
> +        // returned read-only with a lifetime of `&self`.
> +        unsafe { CStr::from_ptr(name) }
> +            .to_str()
> +            .map_err(Error::StringNotUtf8)
> +    }
> +

I would drop the name temp var myself, but that is just a nit.

Other than that the series looks good to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
