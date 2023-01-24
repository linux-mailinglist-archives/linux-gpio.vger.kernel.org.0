Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74DC6795D0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 11:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjAXK4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 05:56:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjAXK4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 05:56:43 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C00EE07E
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 02:56:42 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i1so10937359pfk.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 02:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzXBGxaQrZ+vwDNSIT1BubFNDwf9IjytpVxPsH51lXc=;
        b=g8/WDyuaQjOzlsLkVYRCoWATzKLKVSi92PV+UqH1Fo7PpGgyqZ+fzeM1hqmMtHSE85
         2l0eqkoRdOQhd6x9ej6YEsrnEKmO3UM6xl201OJaFYfu/X0S1YJza7nZm3TycNw2jLhK
         wzfYv8qtg5q4HIpJfKqnABhEASegNDhjrHg/rXBQT6z63lh996erNqsD4JumedAk6fFf
         AR+G9Q6lpFdEm4kU9k8cvZfbsRH1DrtKbQWD5gaJY5vG+OorU9DEzx2o5gldCYfd67rP
         4nPlKP7cTDcNmN5kZJE3QxXoxKgKVNxwNy8W4XbUXO3tMfJ8ZJfzKoXuWdi2EBtUZzch
         MEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzXBGxaQrZ+vwDNSIT1BubFNDwf9IjytpVxPsH51lXc=;
        b=VDQJ9D9igBriD4g7faXtyerzYboZ4CGMJthREP1T3Zzc1oWH/NuFhsDxPvfs5+7M6c
         F/ArhDPadNfKuFTQC9MBoN9jm+4lZNjlJgu0osEFeEue5ByqtZc/0/1YYyJqvmvnnT1k
         aDJlJi202KltFVcsMOq0c+xg7MTPuqOovg62bPX0vMIXoVV1LDR46TJLFOO/kSZUcBfa
         9Neg0fDPW60DEETCtz2E6r8WGypKb0AKzVJrDDkjwG7u1a2uqxqStsgSW23Aal22p/+Y
         TUcriOQpGWxeP6HQy1Q7KO34ZWPSJfShdWP+b1wSeDNwsp89qTf9DD2769zJMb7rBCha
         rhXQ==
X-Gm-Message-State: AFqh2kqZCy0p9j4gSPNmN7KbzuCn3mLnIA2FZy73IFx/ImzTq37aSrPP
        f2mJW5pS6kXEnorEj2VdGNz59g==
X-Google-Smtp-Source: AMrXdXtadTx5iJlXEoQqB9zh5SMKEIMI0RUpWjNONgmdpETe2RO8lI+aZE/OyL3C/lOccGHaNXo4Wg==
X-Received: by 2002:a05:6a00:300f:b0:58d:94a2:f404 with SMTP id ay15-20020a056a00300f00b0058d94a2f404mr32010102pfb.12.1674557801668;
        Tue, 24 Jan 2023 02:56:41 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id p20-20020a056a000a1400b0057447bb0ddcsm1292675pfh.49.2023.01.24.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:56:41 -0800 (PST)
Date:   Tue, 24 Jan 2023 16:26:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v4] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230124105639.22dqnysyb4fox7br@vireshk-i7>
References: <20230124095811.112830-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124095811.112830-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-01-23, 10:58, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have two functions in the C API that allow users to retrieve a list
> of offsets from objects: gpiod_line_request_get_offsets() and
> gpiod_line_config_get_offsets(). Even though they serve pretty much the
> same purpose, they have different signatures and one of them also
> requires the user to free the memory allocated within the libgpiod
> library with a non-libgpiod free() function.
> 
> Unify them: make them take the array in which to store offsets and the
> size of this array. Make them return the number of offsets actually
> stored in the array and make them impossible to fail. Change their names
> to be more descriptive and in the case of line_config: add a new function
> that allows users to get the number of configured offsets.
> 
> Update the entire tree to use the new interfaces.
> 
> For rust bindings: also unify the line config interface to return a map
> of line settings like C++ bindings do instead of having a function to
> get settings by offset. A map returned from a single call is easier to
> iterate over with a for loop than using an integer and calling the
> previous line_settings() method.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v2 -> v3:
> - use a custom type for the offset -> Settings mapping (defined as an
>   IntMap<line::Settings>)
> - add missing '// SAFETY' comments
> - apply cargo fmt
> 
> v3 -> v4:
> - apply missing cargo fmt hints (by using rustfmt)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
