Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F50B7B64E7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjJCJBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239319AbjJCJBH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:01:07 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7437AB
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:01:03 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c736b00639so4727835ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696323663; x=1696928463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMHyZNJMt+Shx2jNrCPkjSqXVBBOOyvN72/VVGyt8PI=;
        b=YzSE1jJxuDcmZbkTPSJjdPGJbOpOX4tDNToLw9viVoYGmJ1qTTbkoVM8nBegHaL9dr
         xqi96y0MIt4F/jzkropXyJvxIcQWt2VNqxeewU8Qb4oiteK9wxQcmC6wVIylbaF53rdq
         iDWGggoEzXlVHJLRRbqg8N4O3D+CN4wxxN9KkyRt1x4E2EzXWEZ5EBLwINQRhHmCEFK2
         ZLhkQRMWgxjD+MamPZEuhLMtLBLsCDv+xYqw0gxHzUe773xp98VkUcuHBhJvJx1oHh28
         qHKYxdfvM5DkpxlWR4eoDRni8qE1ScvimY+SmGMVeU+eTQ8fvntCLQS7BHnuwL01ZoF9
         L/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323663; x=1696928463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMHyZNJMt+Shx2jNrCPkjSqXVBBOOyvN72/VVGyt8PI=;
        b=ptkENm2gSucsv2yNyE5Ln/1GMa1TtGN0BeoFTRO+3STPdZNChk1fyJnZXdKV2j8N3i
         SB5kWOwAeJXRjTfacP5gra6htohUdGbO3c5Vk7DdgEdYc87fZl0Pu5cAp8LCPc+lA3jx
         S5rMmzpy4f6PDPjHgP6Glxd969uCv6E4Pis0Eqx5Kl9Nc7S6wtdpUUFCfeeZ9fuNk8RX
         x6PVWXfRHUFWvDCfa9SDhM/W8ZGXlM2wBEC6EYCfKnGTSVfe4a/XEwYDvnO6Ibqn/kPi
         2WHDAZpHJCWGswx8BM415L59pUtgCPM8ywupIPLyDO8kq1vvtpg3xdB/Qn9gXBv2M6bv
         j2KA==
X-Gm-Message-State: AOJu0Yxu6y7joet6OmT/g3uC0O8MoprRUWo0VBkn9Gmhtx5C61uJSUfU
        SJg9Fb7H5KfTgqrHM9iiDywhRw==
X-Google-Smtp-Source: AGHT+IH4bOTdaMqHw4b3cDuutHt4L1JwcR21RpGKxpj6Jr0NuZRnCtFvByUA9f1nTm6hHgA9ApxhsQ==
X-Received: by 2002:a17:902:e809:b0:1c0:6e92:8cc5 with SMTP id u9-20020a170902e80900b001c06e928cc5mr13069775plg.17.1696323663225;
        Tue, 03 Oct 2023 02:01:03 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id i19-20020a170902eb5300b001bdc3768ca5sm938963pli.254.2023.10.03.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:01:02 -0700 (PDT)
Date:   Tue, 3 Oct 2023 14:31:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: rust: allow cloning
 line::InfoRef -> line::Info
Message-ID: <20231003090100.l4nzrh4u5tegt2fw@vireshk-i7>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
 <20230929-rust-line-info-soundness-v2-3-9782b7f20f26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-rust-line-info-soundness-v2-3-9782b7f20f26@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-09-23, 15:18, Erik Schilling wrote:
> While one would usually use the ToOwned [1] contract in rust, libgpipd's
> API only allows copying that may fail.
> 
> Thus, we cannot implement the existing trait and roll our own method. I
> went with `try_clone` since that seems to be used in similar cases across
> the `std` crate [2].
> 
> It also closes the gap of not having any way to clone owned instances.
> Though - again - not through the Clone trait which may not fail [3].
> 
> [1] https://doc.rust-lang.org/std/borrow/trait.ToOwned.html
> [2] https://doc.rust-lang.org/std/index.html?search=try_clone
> [3] https://doc.rust-lang.org/std/clone/trait.Clone.html
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/src/lib.rs         |  1 +
>  bindings/rust/libgpiod/src/line_info.rs   | 16 ++++++++++
>  bindings/rust/libgpiod/tests/line_info.rs | 53 +++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
> index 3acc98c..fd95ed2 100644
> --- a/bindings/rust/libgpiod/src/lib.rs
> +++ b/bindings/rust/libgpiod/src/lib.rs
> @@ -74,6 +74,7 @@ pub enum OperationType {
>      LineConfigSetOutputValues,
>      LineConfigGetOffsets,
>      LineConfigGetSettings,
> +    LineInfoCopy,
>      LineRequestReconfigLines,
>      LineRequestGetVal,
>      LineRequestGetValSubset,
> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
> index e3ea5e1..c9dd379 100644
> --- a/bindings/rust/libgpiod/src/line_info.rs
> +++ b/bindings/rust/libgpiod/src/line_info.rs
> @@ -58,6 +58,22 @@ impl InfoRef {
>          self as *const _ as *mut _
>      }
>  
> +    /// Clones the line info object.
> +    pub fn try_clone(&self) -> Result<Info> {
> +        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> +        let copy = unsafe { gpiod::gpiod_line_info_copy(self.as_raw_ptr()) };
> +        if copy.is_null() {
> +            return Err(Error::OperationFailed(
> +                crate::OperationType::LineInfoCopy,
> +                errno::errno(),
> +            ));
> +        }
> +
> +        // SAFETY: The copy succeeded, we are the owner and stop using the
> +        // pointer after this.
> +        Ok(unsafe { Info::from_raw_owned(copy) })
> +    }
> +
>      /// Get the offset of the line within the GPIO chip.
>      ///
>      /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
> diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
> index ce66a60..d02c9ea 100644
> --- a/bindings/rust/libgpiod/tests/line_info.rs
> +++ b/bindings/rust/libgpiod/tests/line_info.rs
> @@ -19,6 +19,10 @@ mod line_info {
>      const NGPIO: usize = 8;
>  
>      mod properties {
> +        use std::thread;
> +
> +        use libgpiod::{line, request};
> +
>          use super::*;
>  
>          #[test]
> @@ -271,5 +275,54 @@ mod line_info {
>              assert!(info.is_debounced());
>              assert_eq!(info.debounce_period(), Duration::from_millis(100));
>          }
> +
> +        fn generate_line_event(chip: &Chip) {
> +            let mut line_config = line::Config::new().unwrap();
> +            line_config
> +                .add_line_settings(&[0], line::Settings::new().unwrap())
> +                .unwrap();
> +
> +            let mut request = chip
> +                .request_lines(Some(&request::Config::new().unwrap()), &line_config)
> +                .unwrap();
> +
> +            let mut new_line_config = line::Config::new().unwrap();
> +            let mut settings = line::Settings::new().unwrap();
> +            settings.set_direction(Direction::Output).unwrap();
> +            new_line_config.add_line_settings(&[0], settings).unwrap();
> +            request.reconfigure_lines(&new_line_config).unwrap();
> +        }
> +
> +        #[test]
> +        fn ownership() {
> +            let sim = Sim::new(Some(1), None, false).unwrap();
> +            sim.set_line_name(0, "Test line").unwrap();
> +            sim.enable().unwrap();
> +
> +            let chip = Chip::open(&sim.dev_path()).unwrap();
> +
> +            // start watching line
> +            chip.watch_line_info(0).unwrap();
> +
> +            generate_line_event(&chip);
> +
> +            // read generated event
> +            let event = chip.read_info_event().unwrap();
> +            let info = event.line_info().unwrap();
> +            assert_eq!(info.name().unwrap(), "Test line");
> +
> +            // clone info and move to separate thread
> +            let info = info.try_clone().unwrap();
> +
> +            // drop the original event with the associated line_info
> +            drop(event);
> +
> +            // assert that we can still read the name
> +            thread::scope(|s| {
> +                s.spawn(move || {
> +                    assert_eq!(info.name().unwrap(), "Test line");
> +                });
> +            });
> +        }
>      }
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
