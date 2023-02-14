Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F293A695D70
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Feb 2023 09:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjBNIsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Feb 2023 03:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjBNIso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 03:48:44 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837F218B0B
        for <linux-gpio@vger.kernel.org>; Tue, 14 Feb 2023 00:48:41 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id u3so2673822uae.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Feb 2023 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSrfxwe3vKfTzHSwGSFml1JYJbz5leygYoXhAvsr7M8=;
        b=rYtAqyMO0xYwips60BsH4HBYAasCNyNEqEa9ZMFodpr4UivC9P1WQDoVusD35+zgsU
         FO4oo3DqG022kd+xwC7kwWDTcnGH9WWefxxvG9WMvM8plAOoXUCS7dq5tQQ7zFTUaLsO
         nPCuKQ/RsYefNwcHKKn2p8XgpRMp3mMGKzXBEMQnHbcjmIBcKDCOFrvrK9SZjw7vtJJU
         HOBJddzhbtmjuiOl8JYxtFrIeU5OW9gGOyz8qAlFlcxMSAAOQB1xEeSsdCMqZNBOKGnG
         0DA+GJW45njdWucS8Q/7JRwImctF5eq8UTSgLh+AGjs8Zl69B2OBs/T7jVfw9cPmWZxP
         dN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSrfxwe3vKfTzHSwGSFml1JYJbz5leygYoXhAvsr7M8=;
        b=iM/pXlx2qbwSw45lrYfH27+zUv3T8jWy2FhfxToyPIYrTutwckJKazRsOUzYqNtVOI
         M9aE3Is+06W31CG3AOqp5gqgg7lcOVGvURkFZ9bR9fPnOX4LHB+dICrwqs8KyG65fdNl
         DV0fIV68L7zl0p3o/KCQ/u/r5WqayBG5AFTri9q3GQD1RXZ+oaljtj2jbO2eaBym6mfV
         RkwZPTsHRDI1Eo2eyDTsYAqChWpMDSZnqsglX9OmwrvyckB+t53auaHidOwSpluU08ud
         cXItMuFC5MWjcTXtfA9Ttwh/5/tBY2+dAhVxcGrUtL9OAKV7lWzE8uuWX4KIt7T7+DKD
         0Mow==
X-Gm-Message-State: AO0yUKW5pW/f5dMeX6aZk99WaIoTRS0bu2mooAO0g1TN3jM0PuixxGNE
        s+xzOcQj7L4HyWLhNJj87PaLUBAbJ4V/W39M9CB6mA==
X-Google-Smtp-Source: AK7set+boPM/CcHSpUoGsEMd5wh3vYOGfZbXscENit/6swaHtYo7z3E3ku5GTvxpNaIgachox6m/0PgdsppaSeH47/M=
X-Received: by 2002:ab0:70b3:0:b0:681:b5bc:62e7 with SMTP id
 q19-20020ab070b3000000b00681b5bc62e7mr175554ual.71.1676364520950; Tue, 14 Feb
 2023 00:48:40 -0800 (PST)
MIME-Version: 1.0
References: <24d754e5d765de80f99d8f8942d7ffeea8f3110c.1676357080.git.viresh.kumar@linaro.org>
In-Reply-To: <24d754e5d765de80f99d8f8942d7ffeea8f3110c.1676357080.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 14 Feb 2023 09:48:30 +0100
Message-ID: <CAMRc=Mcu6J6LE03vKHCzbuDx5CehF=y1KxyGNOE+RsLheEA6GA@mail.gmail.com>
Subject: Re: [PATCH 1/2] bindings: rust: Align formatting to what's suggested
 by 'cargo fmt'
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 14, 2023 at 7:45 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Align code to follow what 'cargo fmt' suggests.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_config.rs    | 13 ++++++++++---
>  bindings/rust/libgpiod/tests/line_config.rs  |  4 ++--
>  bindings/rust/libgpiod/tests/line_request.rs |  6 ++++--
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> index 6ddcec336da2..3848a3a68304 100644
> --- a/bindings/rust/libgpiod/src/line_config.rs
> +++ b/bindings/rust/libgpiod/src/line_config.rs
> @@ -55,7 +55,11 @@ impl Config {
>      }
>
>      /// Add line settings for a set of offsets.
> -    pub fn add_line_settings(&mut self, offsets: &[Offset], settings: Settings) -> Result<&mut Self> {
> +    pub fn add_line_settings(
> +        &mut self,
> +        offsets: &[Offset],
> +        settings: Settings,
> +    ) -> Result<&mut Self> {
>          // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
>          let ret = unsafe {
>              gpiod::gpiod_line_config_add_line_settings(
> @@ -84,8 +88,11 @@ impl Config {
>          }
>
>          let ret = unsafe {
> -            gpiod::gpiod_line_config_set_output_values(self.config, mapped_values.as_ptr(),
> -                                                       values.len() as u64)
> +            gpiod::gpiod_line_config_set_output_values(
> +                self.config,
> +                mapped_values.as_ptr(),
> +                values.len() as u64,
> +            )
>          };
>
>          if ret == -1 {
> diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
> index 6e8962cf686c..b5a04ef8949a 100644
> --- a/bindings/rust/libgpiod/tests/line_config.rs
> +++ b/bindings/rust/libgpiod/tests/line_config.rs
> @@ -5,11 +5,11 @@
>  mod common;
>
>  mod line_config {
> +    use gpiosim_sys::Sim;
>      use libgpiod::chip::Chip;
>      use libgpiod::line::{
>          self, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
>      };
> -    use gpiosim_sys::Sim;
>
>      #[test]
>      fn settings() {
> @@ -93,7 +93,7 @@ mod line_config {
>                  Value::Active,
>                  Value::InActive,
>                  Value::Active,
> -                Value::InActive
> +                Value::InActive,
>              ])
>              .unwrap();
>
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index 8ec497f83406..d60e15a7a106 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -181,7 +181,8 @@ mod line_request {
>              assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
>
>              // Set all values
> -            config.request()
> +            config
> +                .request()
>                  .set_values(&[
>                      Value::Active,
>                      Value::InActive,
> @@ -193,7 +194,8 @@ mod line_request {
>              assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
>              assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
>              assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
> -            config.request()
> +            config
> +                .request()
>                  .set_values(&[
>                      Value::InActive,
>                      Value::InActive,
> --
> 2.31.1.272.g89b43f80a514
>

Both patches applied, thanks!

Bart
