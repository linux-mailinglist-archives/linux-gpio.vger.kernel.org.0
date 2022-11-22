Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82502633469
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 05:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKVE1f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 23:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiKVE1d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 23:27:33 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91D45F8C
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 20:27:32 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d20so12471299plr.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 20:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YVtA8N1sdHZLjx4HU/16XwPGz+35X2DZhKl7DshSd8=;
        b=VcV32sLkT4dg94INfCWg5svMAmdQAemKvL5Z9EZNVfpDIIE9cgEh3TxtPOJMVagtdM
         JyNvJcuvxkWTt+j/p7EfChp8+6E2KCfd6zfMaa0b7sWTI8xNXme8tphUjVqq7kjA0udh
         T9T/2Osc3jpsMePSsRhbMxpGZStVrLhfixGUzrNdzIJUhqxTvhQ6guqjokPD+3y3mRHG
         hekTkymqVyztFkyRWSvx9ti+Tiul1eP4jNjQ3Vmx0+NViH/SugkoNc8pZ3vIB64r70oA
         eWMpA/1fbPu+gJnQoXehEQfJgCEUvXVUR2wA0PxjedhOMtcrWFSAUxcUB2wPC6CDkMiy
         RtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YVtA8N1sdHZLjx4HU/16XwPGz+35X2DZhKl7DshSd8=;
        b=T2+EQSExI7rEihtk8/366Ore56VMaIF7/ImjYB54CBcoP7hnhYsqDNUJJk0gTnmWwp
         E3YFqCJrNXW2ua9gw7kyI0r8D22/OadV6w+Tv4kohyn9Pp1O+tU/YOPBvVkJl3+Hfeyf
         aWswqgLX3D8MTwYL6JBDg0WXWAeUY8I8oURoCoGVS6IuH2HjJ69eDv2HkmS812WlpJ+2
         BVkmONwhuMSP+HTt5TgBlpdkDGfEn9bqa5nodR5jeAfUVFVbQ4bmDF166MwEVuTlhGV2
         86AEmn6YH6FPD251T59fz7I1tk2Jh4p/LLZBqHNAg3I6WZy2xc0SFpUsaBUthUG3GDBb
         FpdQ==
X-Gm-Message-State: ANoB5platAVnfkLmKIMIzXruzHJX2iJttqE8s52rdS2Ytpd6Xsm8WGiI
        X42kYEBe6nHsJ7Nfx42h6Epm8g==
X-Google-Smtp-Source: AA0mqf5bhD1gPAUgGiV+j6kXZmbD45AFq/eng+fMyXHZ021KFn9+HHme4Yqg1oLH+9JqceZ2cl//sg==
X-Received: by 2002:a17:90a:be11:b0:218:c83e:4735 with SMTP id a17-20020a17090abe1100b00218c83e4735mr3581872pjs.9.1669091252159;
        Mon, 21 Nov 2022 20:27:32 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902d40c00b00188fadb71ecsm9141530ple.16.2022.11.21.20.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 20:27:31 -0800 (PST)
Date:   Tue, 22 Nov 2022 09:57:29 +0530
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
Subject: Re: [libgpiod][PATCH V10 0/6] libgpiod: Add Rust bindings
Message-ID: <20221122042729.whi3oeqxsrlddrqt@vireshk-i7>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <CACRpkdaB1u9jwa+qXRZXG_1LSgO1-xVxfK_G1YwHe1LpSF5fzA@mail.gmail.com>
 <CAMRc=McHUfLO4CbgRdBwGF0YktGFaQvbHszeNqcxRFifUNat4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McHUfLO4CbgRdBwGF0YktGFaQvbHszeNqcxRFifUNat4g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-11-22, 21:22, Bartosz Golaszewski wrote:
> On Mon, Nov 21, 2022 at 2:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > This stuff is great for the GPIO and Rust communities. Also, looks finished.
> > Here is a cheerful:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Linus.

> Agreed. Series applied. Great work and thank you Viresh for the perseverance!

Thanks Bartosz.

Just for fun, I went back to see when I started doing this work. I
shared my work with everyone for the first time on 31 Aug 2021. Almost
15 months :)

A special thanks to Miguel and Kent, who were very kind to allocate
time to provide reviews for this work.

-- 
viresh
