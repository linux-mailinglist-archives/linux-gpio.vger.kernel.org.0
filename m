Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91270627AD7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbiKNKnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236401AbiKNKmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:42:54 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA081F9C5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:42:53 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so10267057pji.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DSiYZ1dD9IybwYpphNkINHuS503aGiAw068X9ymb1yI=;
        b=W0eH7RJuSLVI7/LnJkcfUiAmgUTdCf6AFRArxAPlaEr5oaeLFvcLXQOPD6VgVMVFMq
         j4Oz+b/Bs5LapnDfqxas7nZ9C4Dpq7akFm2PCeNrcvv6m53XCukbhKFRIQ8Ku5p1fGvP
         OxTr6NOyD8KQAwc2TTZ0mHig2ySqQZWIijXyZGXAdliLEMu67uRkQzf9qX3sWa/dA2Nf
         ufsRzRnTEl9x+8likH2GdosTzA5WcdMm+v7vNiCpb73uO/mBj77R0GO7Rx7eLu1Ei5VV
         39SoeWOlKVyDKZLr3CPcE+XTdDbS2IFFrZEeLDh6TV6xYK5Vw4qDlBwySOsGepRAgTLe
         U2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSiYZ1dD9IybwYpphNkINHuS503aGiAw068X9ymb1yI=;
        b=IO4KW6irw5Wfg1vEB+cYD5en/TVQxXU/l5GjuE5rhLs1o4xyfQwD2M5Wo8zJFcYvBV
         bjUMr73FcHEyoGWRwGCRUxEJBlAh7PwfwmXT61CbVvFkX2K1h+mSDzyUdphZbS4lapHx
         pJrHdFgX/wZo3/EczfD0JKdGSZe0029mpgy5w8YkjU676OD+sPTmV3BQVFRDU77cw1gL
         awWdxywMmvYmT5NIiaHUqC7uX+wNWinN97LkrHaTQ8MNdgoCkpdFpeRyC4Te1Q2Z0+eG
         qTCmYmA75ZASxL3xBHFM1O5n17MeNf23bnOOJjTLYQ9FYmRdmCX0c/n0lMTSMylpkB9U
         mY0A==
X-Gm-Message-State: ANoB5pkH1ifPbSzDkXl4Yb/8yXAoJ3NV57w+2Vy6Kd7VjL35KpBrqg7E
        CsxGdbeeq3FQBy3TRzRa7ZVEnQ==
X-Google-Smtp-Source: AA0mqf7JUOhefNNj5D7+aEKUFKYmEWY4zekT4JTg1WaIjJBQeLjYq471k/c7sIrtlyeBkvBqopqtqw==
X-Received: by 2002:a17:90a:7ac4:b0:213:6442:232a with SMTP id b4-20020a17090a7ac400b002136442232amr13399030pjl.117.1668422573511;
        Mon, 14 Nov 2022 02:42:53 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id z28-20020aa7959c000000b0056be4dbd4besm6422632pfj.111.2022.11.14.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 02:42:51 -0800 (PST)
Date:   Mon, 14 Nov 2022 16:12:49 +0530
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
Message-ID: <20221114104249.nuobaboz63rpcd4d@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <43c0d28fc12bbfb5a0feba0d30542a4ca2d4bad6.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=MetERzq-SjosE6bxTHh6Np6133CAMxz09YVrJAgvnpssA@mail.gmail.com>
 <20221114100305.2siyj2i7m3a6bvdb@vireshk-i7>
 <CAMRc=MfU3a+28eoLcxbB+3fFb04PkRvmsaT_Gd+-BosUecd_Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfU3a+28eoLcxbB+3fFb04PkRvmsaT_Gd+-BosUecd_Lw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14-11-22, 11:29, Bartosz Golaszewski wrote:
> Ah, I missed that, my bad.
> 
> Would it also work in non-mutable way like
> 
> let lsettings = line::Settings::new.set_direction(Direction::Output)?;

No, since set_direction() expects a reference instead of the object itself. So
currently we need to do Settings::new() in a separate statement and so mutable
is required too. But then we don't need a build() routine to covert to lsettings
here.

-- 
viresh
