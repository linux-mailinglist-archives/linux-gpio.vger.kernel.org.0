Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6082C6279FA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbiKNKFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbiKNKFG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:05:06 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FCC1EC70
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:03:08 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso10123159pjc.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WEi/MrgWQuRnfV/2JU0xH1VEnl2tVY8TAuP2k+4npM=;
        b=xvTHsNik7wSOujKGMVCr8m6wGBpuQ82FSpGqXiPjm2V5PZWeQDUQBQ76+Uy4fokmLI
         R2HKGrKyBwUfJcrE2xXrkRm661Cy5RGYskh8S5E2rJHdA7V6mkOcf01pf1cs4Ga/2tpi
         sLQOi7qk8QwoEaLE4BHR2TA35yvBdw+7C3Bn1Jlcg0hoz0qtam/0X8gyEI73BwxouKJH
         kF+PsuTaCfdLaX8H7R0TxRJmh52zU0rNg3mTYQTla2TrVmfTAhNI0FbK5qhNZpTPWoPk
         fwIsLzvi1+SrF66RESauADGodBLnLbNx6RZGO1CaNI9g4mbFxpVbTYXnKUjowbVmKMFF
         NmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WEi/MrgWQuRnfV/2JU0xH1VEnl2tVY8TAuP2k+4npM=;
        b=MRcAtIPhaS/zFItcM8SExOLx89u/fG24JeTHN2w0hJbi/KoAGdgo9eZjj324JAo+qi
         Yq1fDbZoIz9HKXc7vaC0AZCRbogVv93uuwMJjnHg1yrbJxj+Z10bG0RLXjvur7Mh0EdB
         QjKPq0yDgRivrz8X9rnfSZiq5uCUWONoxTsqqjkgEzcPYxzPmt4cgu/yDJx6gFtyXCD7
         Oa+klNMYFoomsPc4LV8DnqpdEzPSaMk0FRhZQ/dpapTM0AsGKCiXsRsWvJTT8TIFdtew
         G9QdMMvWjckjy2OePtdv/BBXpbhRSafaTayle3pCf8Uuqd1J+3GDMsy4dXidfivzxgnQ
         Widg==
X-Gm-Message-State: ANoB5pl3OSQKS2bWHyU58ozzdYMncvVWsNl/39GGDPTj3YghhSoAui5+
        M0WuwtBT7ksUiV2N1dUf+/c2uQ==
X-Google-Smtp-Source: AA0mqf4/XINb44pRHsi00ULheOw/vhjq3XnNCKQCad2T6+Hz6lV0VTFzjd1NVr8bktJd/mwMOO84fA==
X-Received: by 2002:a17:902:e54d:b0:188:4ea8:a685 with SMTP id n13-20020a170902e54d00b001884ea8a685mr12815409plf.71.1668420188216;
        Mon, 14 Nov 2022 02:03:08 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id 186-20020a6206c3000000b00553d573222fsm6286667pfg.199.2022.11.14.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 02:03:07 -0800 (PST)
Date:   Mon, 14 Nov 2022 15:33:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 6/8] bindings: rust: Add examples to
 libgpiod crate
Message-ID: <20221114100305.2siyj2i7m3a6bvdb@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <43c0d28fc12bbfb5a0feba0d30542a4ca2d4bad6.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=MetERzq-SjosE6bxTHh6Np6133CAMxz09YVrJAgvnpssA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MetERzq-SjosE6bxTHh6Np6133CAMxz09YVrJAgvnpssA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-11-22, 19:26, Bartosz Golaszewski wrote:
> I'm looking at it and thinking that it would look much better as:
> 
> let settings = line::Settings::new()
>     .set_direction(Direction::Output)
>     .set_output_value(Value::new(value))
>     .build()?;
> 
> settings would not need to be mutable (we'd have some intermediate
> SettingsBuilder object?) and could be directly passed to
> add_line_settings()?
> 
> We now have chained mutators for LineSettings in C++ and keyword
> arguments in Python - somehow I think that the former suits rust much
> better than passing an array of properties.

We already support chained mutators in the Rust bindings. This example can also
be written as:

         let mut lsettings = line::Settings::new()?;
 
         lsettings
             .set_direction(Direction::Output)?
             .set_output_value(Value::new(value)?)?;
 
-- 
viresh
