Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076987B30F6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjI2K66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjI2K66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:58:58 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB174CE4
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:58:32 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-584a761b301so5569056a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695985112; x=1696589912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+x4IlzbbJNtJhEUhC5FVH75rnyIh4yoJk6c09cmM+lc=;
        b=cuxeNPq6326oDLVz7sgTK+PkLo4zbCns/UHKlEpOpFhAwGYeh+sH/nXTOf7cuic0bK
         49phbLLFv2vyD3Hxg27Lp1TJ1koRir6G23Z8ghNGe+mJMK9Ulp8qiYwKkmTVFlz7ggNe
         K5+jLLb52kr0/Lwuqwgc5ZfoBMO5aMpvfL3QZ1bRTxQWaT7k1F9nN6B6XKSdUeolcHMn
         rMP2V0l/V4wWix+Xn9RUOFclvLNg+57onQqZbQuQWqrrcImnUcWH5I4vD+MSBpCZFOfT
         STEgv0Qnn7juDLZbgbVoB2OvpIGGJh0g0L/ZRhJPoDVNVABgHtA2WLIbXLDGcn06ZO7R
         LbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985112; x=1696589912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x4IlzbbJNtJhEUhC5FVH75rnyIh4yoJk6c09cmM+lc=;
        b=JKCI1OMjJmy0pgO3RziM2KD1vl1oa0Qj1x8V49HurFmPehiU62X8NblocH7/evH3Pg
         SkyvvQBGZ8J27c3KTaQWd24BgunpyAA+NGMpI0UjBvFwggWBCIrrV5wf4whQHFRur8gY
         vEM9imiDk4ctilkrfu2z1d5ZaukW9WBqK7odl5E/eBWTyVyuUG1SCCqfBQ92kKF76er+
         rmIo/nWAo9S1Lq6RYvpRqCDz6W3Z3K72pLiZ1hJIQLVX1Mnx2C63US5WxWQv3R3aDDyG
         xubpCMKgEWhAGMLxbWDgNAEW1h6ucj4q/q5YhTCLAg6HgU1oq1EkRxU1DxippwXdktKz
         wUxw==
X-Gm-Message-State: AOJu0YwuX+s7/6e4mVw6RHiH7kaOzFk+bqcCGYFBD2/hBtJfAeCfl1WP
        KUWHigSLWiqT9SNoHM6iPJhDQw==
X-Google-Smtp-Source: AGHT+IEiMg2QvfFSP9wBdauTU6d6fgisYC9Jcm8N7jCBsvngzWgdJkqGkA2gJSqBZOLZBPOjbO1icg==
X-Received: by 2002:a05:6a21:7783:b0:15d:b243:6131 with SMTP id bd3-20020a056a21778300b0015db2436131mr3955137pzc.44.1695985111997;
        Fri, 29 Sep 2023 03:58:31 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001c726147a45sm4980177plg.190.2023.09.29.03.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:58:31 -0700 (PDT)
Date:   Fri, 29 Sep 2023 16:28:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: mark all owning types as
 `Send`
Message-ID: <20230929105829.vm7ed3unydb5rrh4@vireshk-i7>
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
 <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-23, 16:37, Erik Schilling wrote:
> The thread-safety rules of libgpiod allow individual object instances to
> be used from different threads. So far, this was not actually possible
> with the Rust bindings. Not being `Send` disallowed the user to transfer
> the ownership to different threads.
> 
> Rust also has a `Sync` marker. That one would even allow sending
> references of objects to other threads. Since we wrap a lot of C
> functions with `fn foo(&self)` signatures, that would not be safe.
> libgpiod does not allow concurrent API calls to the same object instance
> - which Rust would allow for read-only references. Thus, we do not
> define that one.
> 
> Chip was already modeled correctly.
> 
> line::Info is not marked as Send since it may either be owning or non-
> owning. That problem is fixed as part of a separate pull request [1].
> 
> [1] https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org
> 
> Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/src/edge_event.rs     | 4 ++++
>  bindings/rust/libgpiod/src/event_buffer.rs   | 8 ++++++++
>  bindings/rust/libgpiod/src/info_event.rs     | 4 ++++
>  bindings/rust/libgpiod/src/line_config.rs    | 4 ++++
>  bindings/rust/libgpiod/src/line_request.rs   | 4 ++++
>  bindings/rust/libgpiod/src/line_settings.rs  | 4 ++++
>  bindings/rust/libgpiod/src/request_config.rs | 4 ++++
>  7 files changed, 32 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
