Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3F3679177
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 07:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbjAXG6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 01:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjAXG6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 01:58:13 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B20B8A60
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 22:58:05 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 88so2326636pjo.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 22:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdaoWGWiOaLYdolYBHyQDn+NGdZgT0wfVblo8neSlV4=;
        b=qg+rww3rTQ16zlrfm8KqU7EehGUYWKs2+9UUj3pA5iTlt57JAME+nVfdhPieY7J12z
         XhanhDZjTT08BwKIBLbz5bULge8rkPcvq6eBZUh5vwewp5yQHDbsmihn4XJ+XJK3zL6J
         VY9B6RZS4kQatq0aTS9YdWcf5JZakmnFL+T0RPpth9LIO4DV71f3oOsi/Khj6tYaAvB2
         +njp8GX3kwxxA1nICF1tw/4sZ2qsaQNr06sbiA5d9UUDOquwHsn8lEbBzgwfxOzxPO1B
         15D2Y8+ZDTBTClhw6Vo95CLbPbvmw7Ivre6nnw+zkTWQnJA1FCx7HJutdgefpg5wwnj7
         DfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdaoWGWiOaLYdolYBHyQDn+NGdZgT0wfVblo8neSlV4=;
        b=QaTz1XiQrgalz1ug/hrVTFYsTk3WTwVgmnnNvw2gGyt9TQGVB3AfOmljztNtget7EA
         inBkPR0Xk/cD5kCPpl9hKj982ddXlQtuyrdzsiExmX9Yx+WGijBvTWzVppoW2YB5aWo7
         x/lJGMq/ZFWlvmpXW5j2Mg7POXKTAddlT0IEMm3O1oOZRkQGS2i1Tc0IpmBDc+uaHQxw
         l2j170aif/eDgistxmwUOJ/siekDRh8B0vv/ueeCCRS3UG47shQRzstjDt39x/ZaK11K
         Odc/iFfwAdZmJZYXt2BFZ5q6Wm2czdDaRgPiQ7d83OqwWEaYf/188o7FFBFB7jkY4vNS
         1tnA==
X-Gm-Message-State: AO0yUKUJDUj3/VyxguxbCzSEoD/3Kq9YvRY92X/wz2sPxl8zi9tS2XgU
        c5yz4tz1Bel3rtzmnYobrO0K8g==
X-Google-Smtp-Source: AK7set8/1Ap3HwswRBWaw/6/3FWt/MNI6ThvHX9t6SODjKi/OqrT69RxcqJnxJu2aW8Y7QRiCAQhCA==
X-Received: by 2002:a17:903:18f:b0:196:cea:487a with SMTP id z15-20020a170903018f00b001960cea487amr3441557plg.53.1674543485028;
        Mon, 23 Jan 2023 22:58:05 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id y16-20020a170902b49000b00195ee621f0csm864691plr.68.2023.01.23.22.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 22:58:04 -0800 (PST)
Date:   Tue, 24 Jan 2023 12:28:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v3] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230124065802.uhmiy3rgkuyl5zh3@vireshk-i7>
References: <20230123153456.402675-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123153456.402675-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-01-23, 16:34, Bartosz Golaszewski wrote:
> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> +    /// Get a mapping of offsets to line settings stored by this object.
> +    pub fn line_settings(&self) -> Result<SettingsMap> {
> +        let mut map = SettingsMap::new();
> +        // SAFETY: gpiod_line_config is guaranteed to be valid here
> +        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
> +        let mut offsets = vec![0; num_lines as usize];
> +
> +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> +        let num_stored = unsafe { gpiod::gpiod_line_config_get_configured_offsets(
> +                                                                self.config,
> +                                                                offsets.as_mut_ptr(),
> +                                                                num_lines) };

Hmm, this isn't formatted in the cargo suggested way.

You sure you don't get anything with:

cargo fmt --all -- --check

?

I also see that cargo fmt reports issues in master branch too, which
must have happened during your previous set of patches.

-- 
viresh
