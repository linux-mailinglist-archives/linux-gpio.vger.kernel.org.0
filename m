Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2165581DD3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiG0C6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240168AbiG0C6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:58:41 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022103C8E2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:39 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id b7-20020a17090a12c700b001f20eb82a08so795259pjg.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OMHGjGj70K/qPThpDcgUcjiBPAnF20y1MdHff1mj5gw=;
        b=jW0nVBRIDt9RghIsXanO0M+kdZx07QSEdIXC8t1OBY1hhVO5g8qu3prTfFf7E79car
         h3/0LNmcWq6Fj1vUb4ckPjLeP7Y0btTE0SxhOrwrfDxTH1jDFM7unqz5AFkGDG4ShHll
         8+nQR4lEShJKX2+G1UCjDgY/lizBytiWszb5Qi3CkCE2zI4jBfqak4x1U/WgGCIsQHeY
         6cZlhZK7EJBZNeMihjnpAERsg83mGvLJfq78rq3Pf1iISDU/N3uPuf2ZeZOBWDjLjGHY
         XlgOGIXJMcgdUS6jWTfMuBgWO/+djQbadTPlx74H5XIqmJlLFvwkCiGuN9S11UgJZVHw
         0+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OMHGjGj70K/qPThpDcgUcjiBPAnF20y1MdHff1mj5gw=;
        b=UQskfMuNBewdAfHcTxUZMu8atjzSY1Exe+zIjoGO7q5SnbhoEHwb/CFL5qnjtd+PG2
         CvJOzxur7TOpeI+DTPem8/bTgpoKliBXUcYmW32yi6lwJc9f2zI+wUNZLFco8vvv8YPV
         88dQovQ32CZiQzsTjiHwqK8f4k+0nMHf5/DGdkD5T3nNe7vmNpv23FCI2TKjCPhx+eQf
         KMxKBxBLeFAO6/4vUdwnf3HyxpBx56nkRBQaRtbb++uCOoS2H49fNdz2vwrsIooNBRt2
         3i7LWiurg7xf0WCykHv+jjvCz/0tSdP833SDeKwSGYxmOIVapHoSrQuGGFK1LZQbJ+sU
         8NRg==
X-Gm-Message-State: AJIora/xSnWPEa3tJakIaHLuWUKzBiumIBJv/T8IETOh43WY3/vwE52k
        5Mv3w4MGs2/7z5ccvLZ/g40=
X-Google-Smtp-Source: AGRyM1ua9lZ6lzPojMnSmjB/OXlSaiZK+uU0A8Bzbkm9pW7klCZuOEkBnkbzO8J54HI3zQmKJ8bEEQ==
X-Received: by 2002:a17:902:b70a:b0:16c:f62c:43aa with SMTP id d10-20020a170902b70a00b0016cf62c43aamr19462860pls.8.1658890718449;
        Tue, 26 Jul 2022 19:58:38 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090aab0300b001f21c635479sm329820pjq.40.2022.07.26.19.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:58:37 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:58:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 6/8] libgpiod: Derive debug traits for few definitions
Message-ID: <20220727025832.GF88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <490e4efc900d8173fb3e2f1373c97e1a20cb9ac3.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <490e4efc900d8173fb3e2f1373c97e1a20cb9ac3.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:59PM +0530, Viresh Kumar wrote:
> These are required for tests, which will be added by a later commit.
> 

Squash this patch into patch 4, as you know you will need them
eventually.  All public types should implement Debug[1].

They should also implement Clone, Eq, PartialEq and Default where
that makes sense.  And Copy if you are sure you wont add something
non-Copyable to them in the future.

Cheers,
Kent.

[1] https://rust-lang.github.io/api-guidelines/debuggability.html

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/src/chip.rs      | 5 +++++
>  bindings/rust/src/chip_info.rs | 1 +
>  bindings/rust/src/lib.rs       | 8 +++++++-
>  bindings/rust/src/line_info.rs | 1 +
>  4 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/src/chip.rs b/bindings/rust/src/chip.rs
> index 50b5d6102f96..ecff4b003cd9 100644
> --- a/bindings/rust/src/chip.rs
> +++ b/bindings/rust/src/chip.rs
> @@ -21,6 +21,7 @@ use super::{
>  /// character device. It exposes basic information about the chip and allows
>  /// callers to retrieve information about each line, watch lines for state
>  /// changes and make line requests.
> +#[derive(Debug)]
>  pub(crate) struct ChipInternal {
>      chip: *mut bindings::gpiod_chip,
>  }
> @@ -52,11 +53,15 @@ impl Drop for ChipInternal {
>      }
>  }
>  
> +#[derive(Debug)]
>  pub struct Chip {
>      ichip: Arc<ChipInternal>,
>      info: ChipInfo,
>  }
>  
> +unsafe impl Send for Chip {}
> +unsafe impl Sync for Chip {}
> +
>  impl Chip {
>      /// Find a chip by path.
>      pub fn open(path: &str) -> Result<Self> {
> diff --git a/bindings/rust/src/chip_info.rs b/bindings/rust/src/chip_info.rs
> index 950368b54c6f..7188f91a92a6 100644
> --- a/bindings/rust/src/chip_info.rs
> +++ b/bindings/rust/src/chip_info.rs
> @@ -11,6 +11,7 @@ use vmm_sys_util::errno::Error as IoError;
>  use super::{bindings, ChipInternal, Error, Result};
>  
>  /// GPIO chip Information
> +#[derive(Debug)]
>  pub struct ChipInfo {
>      info: *mut bindings::gpiod_chip_info,
>  }
> diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
> index 2f2ac515d353..63b0b82281b7 100644
> --- a/bindings/rust/src/lib.rs
> +++ b/bindings/rust/src/lib.rs
> @@ -59,6 +59,7 @@ pub enum Error {
>  }
>  
>  /// Direction settings.
> +#[derive(Debug, PartialEq)]
>  pub enum Direction {
>      /// Request the line(s), but don't change direction.
>      AsIs,
> @@ -88,6 +89,7 @@ impl Direction {
>  }
>  
>  /// Internal bias settings.
> +#[derive(Debug, PartialEq)]
>  pub enum Bias {
>      /// Don't change the bias setting when applying line config.
>      AsIs,
> @@ -125,6 +127,7 @@ impl Bias {
>  }
>  
>  /// Drive settings.
> +#[derive(Debug, PartialEq)]
>  pub enum Drive {
>      /// Drive setting is push-pull.
>      PushPull,
> @@ -154,6 +157,7 @@ impl Drive {
>  }
>  
>  /// Edge detection settings.
> +#[derive(Debug, PartialEq)]
>  pub enum Edge {
>      /// Line edge detection is disabled.
>      None,
> @@ -223,6 +227,7 @@ impl Config {
>  }
>  
>  /// Event clock settings.
> +#[derive(Debug, PartialEq)]
>  pub enum EventClock {
>      /// Line uses the monotonic clock for edge event timestamps.
>      Monotonic,
> @@ -248,6 +253,7 @@ impl EventClock {
>  }
>  
>  /// Line status change event types.
> +#[derive(Debug, PartialEq)]
>  pub enum Event {
>      /// Line has been requested.
>      LineRequested,
> @@ -268,7 +274,7 @@ impl Event {
>      }
>  }
>  
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug, PartialEq)]
>  /// Edge event types.
>  pub enum LineEdgeEvent {
>      /// Rising edge event.
> diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
> index 70b6bd6a84bb..426bd16aa616 100644
> --- a/bindings/rust/src/line_info.rs
> +++ b/bindings/rust/src/line_info.rs
> @@ -23,6 +23,7 @@ use super::{
>  /// line, which does not include the line value.  The line must be requested
>  /// to access the line value.
>  
> +#[derive(Debug)]
>  pub struct LineInfo {
>      info: *mut bindings::gpiod_line_info,
>      ichip: Option<Arc<ChipInternal>>,
> -- 
> 2.31.1.272.g89b43f80a514
> 
