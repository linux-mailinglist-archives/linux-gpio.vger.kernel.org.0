Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0224166B759
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 07:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbjAPGM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 01:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjAPGMM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 01:12:12 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6639612858
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 22:09:18 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so11332564pjm.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 22:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SbBIu+Oz1OMptxuqc4ooJdxXd8l9qz6DiGaJjzvgsiI=;
        b=XT9hgDiGVwAADKH+YVCJ83dDtj4gtxgVMJkscDLZgw1Rl0leNycixqUM0UhuwFl81P
         vr6FCr8YvftDabzs5lNgFbixkPN6x9sCNPqzrIwUCmH0jjbUCyafeM7LF2w3zY5qqUKz
         dWa3KMneEBRHSgFvR7FoPS89gKYCnHRA90hMITFVdwLPGRwKJO8d2BnU0ima3Y2nsy3f
         4rib/4Mnp/ZiCnOlym5kIbhoJ7Ey/9pE7MnN9PNU42W4Ei2D4Qz7XLwvgzcJ88P9S9m0
         ugpvhsdbZqq8NhomV/hYSwmaaZZFW7S9mVyBRP0MPtx7Kf+WRV5vJhjp4bk6AERPCnvv
         76fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbBIu+Oz1OMptxuqc4ooJdxXd8l9qz6DiGaJjzvgsiI=;
        b=6zUEFqDSwxLU5q+xPZk2Lxqx5Sj8IgJk7wQ6UmEAI3bBpUpyoDwEr/ckKPbBEBD+2W
         fk8CDAgdap5YYw5h0uY3ocahnywBdOiE7bG5XoErCq830nuuUGxEm/BN2PWFzKqja4Gn
         nZ0vHIiq4b9Tc/Kb0VVXgmpCBhEqxjxzlyiwvUiGs/rcTwbUXsKayKfsqik+mld1XYH0
         ZDi1mNzUi4RnrOAoCgNhUrIVxfmGGbLuFtXXl9s2LAVTaZjINtIB21xyfH1s1KDtFKGN
         auadytMbxpMP4GZs6JJ7Qu6DR3MzZ8Qz06MiDWz6yCrxflrRR/FIhHu4phfcNK5gJJm6
         l+ng==
X-Gm-Message-State: AFqh2kqq0f6pPTYkM8uQ6m2G4PM44xwUNYc+8Vi1eWn7n8XmBfQtMse8
        o8oqdJhOAkYCl4Oehc9Nztb7yA==
X-Google-Smtp-Source: AMrXdXvgTwTn8alwN7zMpxH7qSsuUZGZ8/GLNAPC8qyiOmgpDT/NoNtBypLSuXvQfQ/nXp9BJymE1w==
X-Received: by 2002:a17:902:caca:b0:192:f281:b933 with SMTP id y10-20020a170902caca00b00192f281b933mr35325668pld.9.1673849357902;
        Sun, 15 Jan 2023 22:09:17 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f7c500b0019337bf957dsm13735730plw.296.2023.01.15.22.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 22:09:17 -0800 (PST)
Date:   Mon, 16 Jan 2023 11:39:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 16/16] bindings: rust: provide
 line_config.set_output_values()
Message-ID: <20230116060915.4nskyj3en7oixntt@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-17-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-17-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
>  
> +    /// Set output values for a number of lines.
> +    pub fn set_output_values(&mut self, values: &[Value]) -> Result<&mut Self> {
> +        let mut mapped_values = Vec::new();
> +        for value in values {
> +            mapped_values.push(value.value());
> +        }

Can be rewritten as this too:

        let values: Vec<gpiod::gpiod_line_value> = values.iter().map(|val| val.value()).collect();

> +
> +        let ret = unsafe {
> +            gpiod::gpiod_line_config_set_output_values(self.config, mapped_values.as_ptr(),
> +                                                       values.len() as u64)
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineConfigSetOutputValues,
> +                errno::errno(),
> +            ))
> +        } else {
> +            Ok(self)
> +        }
> +    }
-- 
viresh
