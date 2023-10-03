Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71777B64E2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjJCJAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239302AbjJCJAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:00:15 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C71AD
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:00:12 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-584bfb14c59so421385a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696323611; x=1696928411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb99VX38yvDvccuTPifAvrO+mRcxC/1h188AcXvpiIY=;
        b=k7q2kvLIIE3JI3rmTvif1qgJ/wvLChfiPv77vjnlHXkUoerNN3ct+ZF9FQ1YhReDzl
         O8K0A2JqTNM+sUBito60Gkj849n1UszwbgcmMjahIjZYvKCwMG/kzrmUleAY7u2xlDy8
         r668v61p8CJkOvskGvtV1oWCX6NI1qIZYIbHvCM3h1C+zVTAA838g3E5NnWMYbyX03dQ
         qPTpyE7/S5f2njDW2ZAequRjsbkCmj+cSzWssOBu3upqSTFTZX6kAojtqOkTghGA6H3I
         UGzhOV9OSEhoC1lkcu3lCvZ+8mJm+UDx6vfH3idzVq6UPl/OvWfExLmseN1PY+knTBNO
         OfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323611; x=1696928411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb99VX38yvDvccuTPifAvrO+mRcxC/1h188AcXvpiIY=;
        b=DNBiUWaASFvv60C1aSsKpLp+xbQmNGD2A51tK29OB9WF1ZdQ7LUyzzS+8dVhXYhJLp
         YbEJ9SuirDgVlyVNcDLsyjM38+xLtQr8Do37KRceWB1loTzEXd3WYgL5c6WJuS48fzrN
         jUd+e6lISHzLVW4lkJKP0qsk8h4tZDwF9woAU+ZCxOktkOtpmDiw6QXiN3d7ulAW6dwp
         A6vRtw641cgBjwOrMxgXbFo0YetQkSSSaWL2fVYPg7QfEQcqICZ5O0jKtTnfDS9/dYb4
         Md1zO6KjZhyBM0yidkXyX95OtXjBVqB0xVwX1XlEWJU6Z4ZmoTzKJ9W2HGXAKvoawI3A
         +vOg==
X-Gm-Message-State: AOJu0YxHRv1W7WxZeTOrHSarqSA1yH3/MObH1IDXl040fJEFzVzaxaL0
        JVrvqP3L7pxV1/+CcQ+GqL59cO9R8QrED7eFDjM=
X-Google-Smtp-Source: AGHT+IEAfkzY/L8U8Bx9qhrI9KxgFq+5N0DFfG5L22TkaIfpABDpUE+xuykV5amDcimLf2gaw1K3Jg==
X-Received: by 2002:a05:6a20:1596:b0:161:3120:e888 with SMTP id h22-20020a056a20159600b001613120e888mr14279469pzj.46.1696323611373;
        Tue, 03 Oct 2023 02:00:11 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001c73fb506aesm940281plj.128.2023.10.03.02.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:00:10 -0700 (PDT)
Date:   Tue, 3 Oct 2023 14:30:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/3] bindings: rust: rename
 {event,settings}_clone to try_clone
Message-ID: <20231003090008.b75anhi7joftsayq@vireshk-i7>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
 <20230929-rust-line-info-soundness-v2-2-9782b7f20f26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-rust-line-info-soundness-v2-2-9782b7f20f26@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-09-23, 15:18, Erik Schilling wrote:
> What is getting cloned is already clear from the type. This also aligns
> a bit better with similar methods from the `std` crate [1].
> 
> [1] https://doc.rust-lang.org/std/index.html?search=try_clone
> 
> Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs | 2 +-
>  bindings/rust/libgpiod/src/edge_event.rs                    | 3 ++-
>  bindings/rust/libgpiod/src/line_settings.rs                 | 4 ++--
>  bindings/rust/libgpiod/tests/line_request.rs                | 2 +-
>  4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> index ad90d7b..8dbb496 100644
> --- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> +++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
> @@ -34,7 +34,7 @@ fn main() -> libgpiod::Result<()> {
>          let event = events.next().unwrap()?;
>  
>          // This will out live `event` and the next read_edge_events().
> -        let cloned_event = libgpiod::request::Event::event_clone(event)?;
> +        let cloned_event = libgpiod::request::Event::try_clone(event)?;
>  
>          let events = request.read_edge_events(&mut buffer)?;
>          for event in events {
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
> index 0c0cfbc..4c940ba 100644
> --- a/bindings/rust/libgpiod/src/edge_event.rs
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -25,7 +25,8 @@ use super::{
>  pub struct Event(*mut gpiod::gpiod_edge_event);
>  
>  impl Event {
> -    pub fn event_clone(event: &Event) -> Result<Event> {
> +    /// Makes a copy of the event object.
> +    pub fn try_clone(event: &Event) -> Result<Event> {
>          // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
>          let event = unsafe { gpiod::gpiod_edge_event_copy(event.0) };
>          if event.is_null() {
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
> index f0b3e9c..41b27e2 100644
> --- a/bindings/rust/libgpiod/src/line_settings.rs
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -52,8 +52,8 @@ impl Settings {
>          unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
>      }
>  
> -    /// Makes copy of the settings object.
> -    pub fn settings_clone(&self) -> Result<Self> {
> +    /// Makes a copy of the settings object.
> +    pub fn try_clone(&self) -> Result<Self> {
>          // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
>          let settings = unsafe { gpiod::gpiod_line_settings_copy(self.settings) };
>          if settings.is_null() {
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index 9af5226..8731719 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -272,7 +272,7 @@ mod line_request {
>              for offset in offsets {
>                  lsettings.set_debounce_period(Duration::from_millis((100 + offset).into()));
>                  lconfig
> -                    .add_line_settings(&[offset as Offset], lsettings.settings_clone().unwrap())
> +                    .add_line_settings(&[offset as Offset], lsettings.try_clone().unwrap())
>                      .unwrap();
>              }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
