Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1760166B6FA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 06:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjAPFwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 00:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjAPFwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 00:52:14 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CC6868D
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 21:52:12 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id c85so16902528pfc.8
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 21:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0jfQzx1X4P+e2xDv8H4mVjA0nBkpuvJHa0HOHNWwNg=;
        b=ghDPO/FVosVts7hpekuw3c+V0MaDssIe1jzF0M8rNfuOSsATA3iR1NkGqJnngHJMD2
         W0P/bGsY0kw7nTapliGaUpW5VMerrCSB/1jpWwIXBnzZYBwwbu2At5bhNlp4nQfMjhym
         Q4yrPBGeTqBJrCPlZ6Gx7QYE/LZcctvOAJ8b5+aAU/uaD7MFeBPiCCPq0mqYzI0MCjRs
         ll3XjVMKLbd3jFlkaAvA7HV5o7nksQhPZY31mjGxXhzOdDmiV0ytu2q7O4zMYX8yFtLd
         Q2fIGNXA31mspiE5wb8Ryyxr47npuR7i24FILcTkGj98dSUB6W0jz/8FDwGo7uKXYm5w
         1luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0jfQzx1X4P+e2xDv8H4mVjA0nBkpuvJHa0HOHNWwNg=;
        b=pl1cbHxh3t0BmXk75DQTWL+qjDFy6R8omM3qEboYjritlR9QWJrqWLhAxlOff0QvQA
         G4yzHgOxFu7BavIZF5vHSLf1fL8qk7QlsIRNOWXY62GM3k+7JkW3+C4zyjIj24NuJPTD
         AdfG1FzSbd5sHtfBlFYPGoV9t/xUCdYxMZGoKO5IivyTsNkteYP0xS4ECgCjRHygdTi3
         WXPRggiiZjMCM6HBwYXY+hvw+Zl1eW4i8K/SVHTUy5jBFeoPX7y2ygPgaWFo64U3dqbA
         AQw9jIn73gklZKUeF7jGMlXoZbE3XMBfP6Nxmg6MC3tLRD3r7YS+PvUuCvpEV7YYsaGb
         nP3A==
X-Gm-Message-State: AFqh2koQ47sOUyMQfq5Z8tYyroq0Xef5B734I7nMSqolnId7LpxmViWT
        xZSA+aRRKubSog/0LgJXzpFWwA==
X-Google-Smtp-Source: AMrXdXvu7S6nmHQZNzglRXxVXX38O7H791EyKNjTr8AGUPeTE1AJkFQil0E+FZGnQ3NrfkwhDqMp2Q==
X-Received: by 2002:a05:6a00:2493:b0:58c:6ba1:58dd with SMTP id c19-20020a056a00249300b0058c6ba158ddmr9881045pfv.11.1673848332427;
        Sun, 15 Jan 2023 21:52:12 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id l4-20020a622504000000b0058bb0fb6295sm5442118pfl.26.2023.01.15.21.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 21:52:11 -0800 (PST)
Date:   Mon, 16 Jan 2023 11:22:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230116055209.b6ydvderreqtqedp@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-5-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For Rust changes, please run these as well to find any formatting
issues, warnings:

cargo fmt --all -- --check
cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks

On 13-01-23, 22:51, Bartosz Golaszewski wrote:
> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> index 19dc187..0c8b293 100644
> --- a/bindings/rust/libgpiod/src/line_config.rs
> +++ b/bindings/rust/libgpiod/src/line_config.rs
> @@ -2,8 +2,8 @@
>  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  
> -use std::os::raw::{c_ulong, c_void};
> -use std::slice;
> +use std::os::raw::c_ulong;
> +use std::collections::HashMap;
>  
>  use super::{
>      gpiod,
> @@ -77,51 +77,32 @@ impl Config {
>          }
>      }
>  
> -    /// Get line settings for offset.
> -    pub fn line_settings(&self, offset: Offset) -> Result<Settings> {
> -        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
> -        let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, offset) };
> -
> -        if settings.is_null() {
> -            return Err(Error::OperationFailed(
> -                OperationType::LineConfigGetSettings,
> -                errno::errno(),
> -            ));
> +    /// Get a mapping of offsets to line settings stored by this object.
> +    pub fn line_settings(&self) -> Result<HashMap<Offset, Settings>> {

Just like ValueMap, maybe we can add following in lib.rs for this:

pub type line::SettingsMap = IntMap<line::Settings>;

> +        let mut map: HashMap<Offset, Settings> = HashMap::new();
> +        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };

This needs a SAFETY comment. Should we check if this returned 0 ?

> +        let mut offsets = vec![0; num_lines as usize];
> +
> +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> +        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> +                                                                 offsets.as_mut_ptr(),
> +                                                                 num_lines) };

Can the returned value be < num_lines here ?

> +
> +        for offset in offsets {
> +            // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
> +            let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config,
> +                                                                               offset) };
> +            if settings.is_null() {
> +                return Err(Error::OperationFailed(
> +                    OperationType::LineConfigGetSettings,
> +                    errno::errno(),
> +                ));
> +            }
> +
> +            map.insert(offset, Settings::new_with_settings(settings));
>          }
>  
> -        Ok(Settings::new_with_settings(settings))
> -    }
> -
> -    /// Get configured offsets.
> -    pub fn offsets(&self) -> Result<Vec<Offset>> {
> -        let mut num: u64 = 0;
> -        let mut ptr: *mut Offset = std::ptr::null_mut();
> -
> -        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
> -        // as it is not explicitly freed with `free()`.
> -        let ret = unsafe {
> -            gpiod::gpiod_line_config_get_offsets(
> -                self.config,
> -                &mut num as *mut _ as *mut _,
> -                &mut ptr,
> -            )
> -        };
> -
> -        if ret == -1 {
> -            return Err(Error::OperationFailed(
> -                OperationType::LineConfigGetOffsets,
> -                errno::errno(),
> -            ));
> -        }
> -
> -        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
> -        // as it is not explicitly freed with `free()`.
> -        let offsets = unsafe { slice::from_raw_parts(ptr as *const Offset, num as usize).to_vec() };
> -
> -        // SAFETY: The `ptr` array is guaranteed to be valid here.
> -        unsafe { libc::free(ptr as *mut c_void) };
> -
> -        Ok(offsets)
> +        Ok(map)
>      }
>  }

-- 
viresh
