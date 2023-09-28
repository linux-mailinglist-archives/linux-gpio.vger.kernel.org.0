Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4327B1AFD
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 13:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjI1L1k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 07:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbjI1L1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 07:27:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A672995
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 04:27:37 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fb85afef4so10797774b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900457; x=1696505257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+ful+CDgzMtpu/aHMKqUEapAW/9MKKCID/aypdh+hc=;
        b=jmGEFb7i+IAPYLOArL3aDnzzTvuT90n/EjmU7EhXiI6reOV3lcA1CyFnhh4qasXIrp
         9B9NsUdL6Tj7t+TpSA1YdprHEY2RTMFGi2D43oaIq+Z4H3MU3KS5B8vLExHuj9Qx7IHe
         +G5ViqhUanu85C7BJzXE7l2n4oISkHp0HlbldmhOeibu2cw0wJum6znvm/hKIdc4rA3w
         R+N9sAtf0BI/G4yb2HvKc+0vA4HItLYXvXj9RMArGpuaIOfV8kuJw/vxldr/VNo+wSOd
         rLu/GmjfPU3KtRPDy+jpAyT8DWW755FYhuDop3ejXqrfbQ3i4DnYoD//AUzTmlIysjxQ
         CTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900457; x=1696505257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+ful+CDgzMtpu/aHMKqUEapAW/9MKKCID/aypdh+hc=;
        b=gKo9RjEXrDHyJJyVBpF4pidBjXmFKN2w24hifVlwWR7P0NAh/xZaGd1ecsCgRqcglX
         c8sJNIopU8C+PBBRR1peW8Wap10OZhfm/BH6IdREB0Cmwo/Mk4iqwBtV33x+pBtsBwic
         AaVt0tm2yHIbZIopdIjIAzpwN7Vqf2uOStc/+/tTllTEXBIXdpxaE+bnAPEBg5NF7IU7
         xFB1wkqniGyIW0RdyEI7mPtJG/RZiWXkBDaRjUPBXiwfGlS4Zizgy0yiB0efBOLdb7l0
         e19PsgKuYeZhx7pcVivhGJrLBos3KchCZTNWxiY9ELIImLQpJ2N7kAatPEf6Ig3ntm6g
         h1KQ==
X-Gm-Message-State: AOJu0YxVhJO8s+x1UCA6dVnulHRbnkTzJA3Nq8E92JAH4nE6K39ym9sU
        +uH1FPkZi0ml4X+xof0LtBkgbg==
X-Google-Smtp-Source: AGHT+IEKcDdMUlJxmonVT0daq1ersYt4N8vG9Dv7kHGMw/1tte3bi+a4Qwv0ufMURoFWAtdIws8bkg==
X-Received: by 2002:a05:6a20:734b:b0:134:2e3c:9845 with SMTP id v11-20020a056a20734b00b001342e3c9845mr848774pzc.22.1695900457002;
        Thu, 28 Sep 2023 04:27:37 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001b9e86e05b7sm14784822pld.0.2023.09.28.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:27:36 -0700 (PDT)
Date:   Thu, 28 Sep 2023 16:57:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info
 modeling
Message-ID: <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-09-23, 18:29, Erik Schilling wrote:
> diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
> index 81e1be6..02265fc 100644
> --- a/bindings/rust/libgpiod/src/chip.rs
> +++ b/bindings/rust/libgpiod/src/chip.rs
> @@ -95,7 +95,7 @@ impl Chip {
>      }
>  
>      /// Get a snapshot of information about the line.
> -    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
> +    pub fn line_info(&self, offset: Offset) -> Result<line::InfoOwned> {
>          // SAFETY: The `gpiod_line_info` returned by libgpiod is guaranteed to live as long
>          // as the `struct Info`.
>          let info = unsafe { gpiod::gpiod_chip_get_line_info(self.ichip.chip, offset) };
> @@ -107,12 +107,16 @@ impl Chip {
>              ));
>          }
>  
> -        line::Info::new(info)
> +        // SAFETY: We verified that the pointer is valid. We own the pointer and
> +        // no longer use it after converting it into a InfoOwned instance.
> +        let line_info = unsafe { line::InfoOwned::from_raw_owned(info) };
> +
> +        Ok(line_info)

Maybe get rid of the extra `line_info` variable and return directly ?

>      }
>  
>      /// Get the current snapshot of information about the line at given offset and start watching
>      /// it for future changes.
> -    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
> +    pub fn watch_line_info(&self, offset: Offset) -> Result<line::InfoOwned> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
>          let info = unsafe { gpiod::gpiod_chip_watch_line_info(self.ichip.chip, offset) };
>  
> @@ -123,7 +127,11 @@ impl Chip {
>              ));
>          }
>  
> -        line::Info::new_watch(info)
> +        // SAFETY: We verified that the pointer is valid. We own the instance and
> +        // no longer use it after converting it into a InfoOwned instance.
> +        let line_info = unsafe { line::InfoOwned::from_raw_owned(info) };
> +
> +        Ok(line_info)

Same here ?

> diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
> index db60600..e88dd72 100644
> --- a/bindings/rust/libgpiod/src/info_event.rs
> +++ b/bindings/rust/libgpiod/src/info_event.rs
> @@ -44,7 +44,7 @@ impl Event {
>      }
>  
>      /// Get the line-info object associated with the event.
> -    pub fn line_info(&self) -> Result<line::Info> {
> +    pub fn line_info(&self) -> Result<&line::Info> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
>          let info = unsafe { gpiod::gpiod_info_event_get_line_info(self.event) };
>  
> @@ -55,7 +55,9 @@ impl Event {
>              ));
>          }
>  
> -        line::Info::new_from_event(info)
> +        let line_info = unsafe { line::Info::from_raw_non_owning(info) };

SAFETY comment ?

> +
> +        Ok(line_info)
>      }
>  }
>  
> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
>  impl Info {
> -    fn new_internal(info: *mut gpiod::gpiod_line_info, contained: bool) -> Result<Self> {
> -        Ok(Self { info, contained })
> -    }
> -
> -    /// Get a snapshot of information about the line.
> -    pub(crate) fn new(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, false)
> -    }
> -
> -    /// Get a snapshot of information about the line and start watching it for changes.
> -    pub(crate) fn new_watch(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, false)
> +    /// Converts a non-owning pointer to a wrapper reference of a specific
> +    /// lifetime
> +    ///
> +    /// No ownership will be assumed, the pointer must be free'd by the original
> +    /// owner.
> +    ///
> +    /// SAFETY: The pointer must point to an instance that is valid for the
> +    /// entire lifetime 'a. The instance must be owned by an object that is
> +    /// owned by the thread invoking this method. The owning object may not be
> +    /// moved to another thread for the entire lifetime 'a.
> +    pub(crate) unsafe fn from_raw_non_owning<'a>(info: *mut gpiod::gpiod_line_info) -> &'a Info {

I think we can get rid of _non_owning, and _owned later on, from functions since
the parent structure already says so.

Info::from_raw()
InfoOwned::from_raw()

should be good enough ?

> -    /// Get the Line info object associated with an event.
> -    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, true)
> +    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> +        self as *const _ as *mut _

What's wrong with keeping `_info` as `info` in the structure and using it
directly instead of this, since this is private anyway ?

-- 
viresh
