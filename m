Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C35F66D102
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 22:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbjAPVjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 16:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbjAPVje (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 16:39:34 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5FC2BED5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:39:33 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id p1so13542521vsr.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6JynRwiy8gz7YHR9An60AFHfE2ICu98HiIak1luck0=;
        b=MmhSajs8U01I70zHhUpP66e3TIKEO2rbWI89AQR0yP45D6//+WC6M7LMh+q8dVA5r0
         RMVsgJtiDcEddZngL0EBU+iqL8BpuzIkRPKOex3r0gmAGb1fh3ASUWJ11WTwigQOlt5i
         1yR06Qd3y83Q26Q9Bc/u7UgbesR2vDmEGPlLIt9+g/KPODgKLvhwXUbxYcw6NghL93Qs
         QIhYCBLGtp9WPlJy9XD3fxGkONjNqruWHJPKze5h+DcvGAl+EqLAawOUVKzotI/ZMkna
         36su1MHrlCdqXhxOpl0EuosU/BWaf4JnB9sAihol3jbVnebLPuBiwfse9ip70VRReKtV
         7K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6JynRwiy8gz7YHR9An60AFHfE2ICu98HiIak1luck0=;
        b=7tABMc0qEJ3FlWcpVPTQd2nuSuyAGjtUq3k+MQUUnsVOTW6q8uqRwr0AC40hssya5I
         DcyOOc2q43U7rDq+7gaMROcIJhmAS/qgI2QyEj44U8J6ssno60sZkhEC5Uvc9spr73bD
         BLXNmslh2wCdcZElYuwWr/aD1iX3hsAciSmRoyrkTjXcX2ONxLzrGXKpTSCUQHK3BnuL
         IquGmpY3MkjErBf/qMlx5P4ZoMpHe+wWOTnt0Ixe4g8Z7kn+lOK0Yxq77+ZQUOTYeI4s
         n291Cm7ccWBo1vpCFUEYRJjMEVVZzuCBjBlst9bB9yqv/zZ45ewEz/8+w/S6sEaWD59d
         o72A==
X-Gm-Message-State: AFqh2ko1S1jMdHA6ynIQgMpo/wYBcpWbeVDbtRIrZ/yun52Wvjw0HJel
        0CQ6hEw8PJJl+ZE0gYgKH/wZwAiRhq0Y3Flk1hJ8uQ==
X-Google-Smtp-Source: AMrXdXvnr6cXvMXGTmIWET1CPpqhYjXJbMZUq6uEn9XoeG+MibOT9fkxZA5NYYDv8nQsGNSZuVwfgUdmdKx9E2WX94A=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr55530vsv.78.1673905172455; Mon, 16 Jan
 2023 13:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
In-Reply-To: <20230116055209.b6ydvderreqtqedp@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 22:39:21 +0100
Message-ID: <CAMRc=Mfm9ENHh5T4MguXh9YaPYdvSwsOWXyvHYhQGS47xOZcTQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify gpiod_line_config/request_get_offsets()
 functions
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> For Rust changes, please run these as well to find any formatting
> issues, warnings:
>
> cargo fmt --all -- --check
> cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks
>
> On 13-01-23, 22:51, Bartosz Golaszewski wrote:
> > diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> > index 19dc187..0c8b293 100644
> > --- a/bindings/rust/libgpiod/src/line_config.rs
> > +++ b/bindings/rust/libgpiod/src/line_config.rs
> > @@ -2,8 +2,8 @@
> >  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> >  // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> >
> > -use std::os::raw::{c_ulong, c_void};
> > -use std::slice;
> > +use std::os::raw::c_ulong;
> > +use std::collections::HashMap;
> >
> >  use super::{
> >      gpiod,
> > @@ -77,51 +77,32 @@ impl Config {
> >          }
> >      }
> >
> > -    /// Get line settings for offset.
> > -    pub fn line_settings(&self, offset: Offset) -> Result<Settings> {
> > -        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
> > -        let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, offset) };
> > -
> > -        if settings.is_null() {
> > -            return Err(Error::OperationFailed(
> > -                OperationType::LineConfigGetSettings,
> > -                errno::errno(),
> > -            ));
> > +    /// Get a mapping of offsets to line settings stored by this object.
> > +    pub fn line_settings(&self) -> Result<HashMap<Offset, Settings>> {
>
> Just like ValueMap, maybe we can add following in lib.rs for this:
>
> pub type line::SettingsMap = IntMap<line::Settings>;
>
> > +        let mut map: HashMap<Offset, Settings> = HashMap::new();
> > +        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
>
> This needs a SAFETY comment. Should we check if this returned 0 ?
>
> > +        let mut offsets = vec![0; num_lines as usize];
> > +
> > +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> > +        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> > +                                                                 offsets.as_mut_ptr(),
> > +                                                                 num_lines) };
>
> Can the returned value be < num_lines here ?
>

Ah, of course it can. Need to add a test case for that. How do I set
the size of offsets to whatever this function returns?

> > +
> > +        for offset in offsets {
> > +            // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
> > +            let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config,
> > +                                                                               offset) };
> > +            if settings.is_null() {
> > +                return Err(Error::OperationFailed(
> > +                    OperationType::LineConfigGetSettings,
> > +                    errno::errno(),
> > +                ));
> > +            }
> > +
> > +            map.insert(offset, Settings::new_with_settings(settings));
> >          }
> >
> > -        Ok(Settings::new_with_settings(settings))
> > -    }
> > -
> > -    /// Get configured offsets.
> > -    pub fn offsets(&self) -> Result<Vec<Offset>> {
> > -        let mut num: u64 = 0;
> > -        let mut ptr: *mut Offset = std::ptr::null_mut();
> > -
> > -        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
> > -        // as it is not explicitly freed with `free()`.
> > -        let ret = unsafe {
> > -            gpiod::gpiod_line_config_get_offsets(
> > -                self.config,
> > -                &mut num as *mut _ as *mut _,
> > -                &mut ptr,
> > -            )
> > -        };
> > -
> > -        if ret == -1 {
> > -            return Err(Error::OperationFailed(
> > -                OperationType::LineConfigGetOffsets,
> > -                errno::errno(),
> > -            ));
> > -        }
> > -
> > -        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
> > -        // as it is not explicitly freed with `free()`.
> > -        let offsets = unsafe { slice::from_raw_parts(ptr as *const Offset, num as usize).to_vec() };
> > -
> > -        // SAFETY: The `ptr` array is guaranteed to be valid here.
> > -        unsafe { libc::free(ptr as *mut c_void) };
> > -
> > -        Ok(offsets)
> > +        Ok(map)
> >      }
> >  }
>
> --
> viresh
