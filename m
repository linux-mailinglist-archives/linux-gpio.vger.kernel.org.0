Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92044619099
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 06:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiKDF54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 01:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbiKDF5h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 01:57:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CA5FA2
        for <linux-gpio@vger.kernel.org>; Thu,  3 Nov 2022 22:57:35 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so3821165pji.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Nov 2022 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKPa0sBC7CjFLBGt+xAAQyhavApoCvJluoffYzZCwH4=;
        b=gRN8mC/ZDPE8HF1qe37+GEBeT8jGiOmb7KNrRB3mqCFQzFvzE9/lxnofGm1TyMkQrf
         0yP7oTs6q8JFoN2d4WzbBSEWOz0qru1ZbLxhT4cpWyVLYqIX4EHF73ZKjvg58QFwp3fp
         gJgGrB5uYDOb5qzWt1PtpR066qh/d6cxz1Ns0pbjjlpCtqjXcI3E0NB4nmLQXtl7TURU
         lH8ZzUhErt/ruTW+5uI288XE3pNo6l/FF6o0p8o86IuJri6lsvdzRwF9GNTvJNtDLY+H
         HLuuOM1XZRaHXMWoTr6DgvmvN70hcF5SfcC0ed5NKPqeUnLUWodN/xy3QB0qwTxM47JQ
         z9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKPa0sBC7CjFLBGt+xAAQyhavApoCvJluoffYzZCwH4=;
        b=8HHroJtb7dGKdhxb6gyQmH/AuMf4HqRFretZ8x9huCOiGa8kNQycvMDiOP/VMGHQAw
         rW4W9jO06kyRQ8GaXUh/bvjTVTXY88IrPYIKdd8sQnHlUwpm9BVh+Bb6oape7EwvCIXV
         uAw7F9aOgJrCXWrvLIeGDk4klVVxGNDZV6LU49P31s53esSQ4HqY0UGHfyOgU5OAS6Yj
         qynAayofkSuJnaTe+EItrn3o/E8zBAwbWO/P+yTpLok7xWJu1UhMexiqPJrs5Du5+aAE
         kQXgyKqmBj+Ll4ePx8zdD9+AL5ZkIYhp1/BhdxaOMmEttTBZvJQC7xwgN0u367STew3S
         /xrQ==
X-Gm-Message-State: ACrzQf0WFBMsaZP/SZfnzGIwNq22FvFtLON1cmAGWRkfO1AnSbFu3NfF
        btZ3RTWoBqCa2AFBRBn5EA6DwQ==
X-Google-Smtp-Source: AMsMyM4q1dmsiuIOxCEd6D/7trDQQPgcvlvUm9MAKqPZ/H2EiMix8SIwGdfjdSIZcWDoaUArlsSeug==
X-Received: by 2002:a17:90b:11d4:b0:212:ee83:481 with SMTP id gv20-20020a17090b11d400b00212ee830481mr34384588pjb.36.1667541455349;
        Thu, 03 Nov 2022 22:57:35 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902654e00b0017e9b820a1asm1695409pln.100.2022.11.03.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 22:57:34 -0700 (PDT)
Date:   Fri, 4 Nov 2022 11:27:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: Re: [libgpiod v2][PATCH V8 5/9] bindings: rust: Add libgpiod crate
Message-ID: <20221104055732.yc4jvk4zuwda2kex@vireshk-i7>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <08d4095c314caf50430c2eaa733d925122242b12.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtSw+laG5lgCUl@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2JtSw+laG5lgCUl@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-11-22, 21:14, Kent Gibson wrote:
> > +    /// Get the file descriptor associated with the chip.
> > +    ///
> > +    /// The returned file descriptor must not be closed by the caller, else other methods for the
> > +    /// `struct Chip` may fail.
> > +    pub fn fd(&self) -> Result<u32> {
> > +        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
> > +        let fd = unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip) };
> > +
> > +        if fd < 0 {
> > +            Err(Error::OperationFailed(
> > +                OperationType::ChipGetFd,
> > +                errno::errno(),
> > +            ))
> > +        } else {
> > +            Ok(fd as u32)
> > +        }
> > +    }
> 
> Impl AsRawFd, as per Request.

You suggested it for line request earlier and I fixed that.

My bad for not updating this one, I completely missed that we have fd
implementation here too :(

-- 
viresh
