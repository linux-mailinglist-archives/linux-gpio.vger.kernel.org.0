Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730A262F1A0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbiKRJna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242075AbiKRJm7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:42:59 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0535C91529
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:41:23 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so7813847pjs.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PppxPWYYJo9dXcLCa/DvI/TfFtovpjmCM5pvjccevtU=;
        b=RzBsCDOLlzqxRK9wl6f8pHj4NsswNw7jR6kLJAk6KLczBM9a9GDKftX3i6LEY4SEOP
         4JAja//+mjYqsM8yWPGzhXjbBYFVjZTOr5MQi7F3CfGQ5SmZWKRtWnpYXLHBDccx77Rx
         hmbff1YRfRZofxD8CIisLg9L++HVZYjICi6W+z4mh4nCuiaXq9BbtcWpxEP8kxrC/RDj
         AZLlu25bOEn5m23yEFLc1ktNMPU5QRw14uX+g4xDK2I76WPDDs1wLP5yk46r2iV/S22W
         Z2PoCmoQR82wrV+BM7zBtI6fo7am8/NvuwoaWi0YXCBIBImNpzoAUyjCyKvbU6CTIsHD
         6kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PppxPWYYJo9dXcLCa/DvI/TfFtovpjmCM5pvjccevtU=;
        b=QdxnFmB6NcqR0vQ3WdeZV6YCFv+8qd5aYMsBwKnTgA+OLpAzafuTpEaBiOt8fsbjbv
         nV0MyzXGd+kQ+w5NbZmn9e5JcX4d/0myth46HoW1bMME1XkFQKT+YekN/jbUVB+7p9wo
         uYlmu4ZRglrxKdNXEdLLORJxOZBnvYSAmIE1P/fftWV1jq9gIVyobzht/nZnTr6gv5y9
         h++uHeSVcTwT9PZy60OPyULm2trEyWkboliyGle7Uh21OaZLleDkCl4olCZ/PIrXn6GR
         pIjBjZ09DJJnGgN39qQEuSRo0G0/VNibzVw2If6INJk1c1mB1IWP0KlCPwG3xfYLxpVG
         Hccg==
X-Gm-Message-State: ANoB5pl4ivlRhuWi6PRfd/X5F2AdfxRE1glzQV+QhNLsM+bMp6jxO5K0
        ujBk9Q2ZA0SBZMuVWjR8I0N32g==
X-Google-Smtp-Source: AA0mqf6uT/A0kTnBZiE6+qq98VGtMSYwlDNMZ4RLDTWXs3DSpudVFlIwJKqud6ugcd/gCg1rJdnpVg==
X-Received: by 2002:a17:902:cad3:b0:186:9c43:5969 with SMTP id y19-20020a170902cad300b001869c435969mr6731908pld.32.1668764482526;
        Fri, 18 Nov 2022 01:41:22 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id y9-20020a170902b48900b00186f81bb3f0sm3078588plr.122.2022.11.18.01.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:41:21 -0800 (PST)
Date:   Fri, 18 Nov 2022 15:11:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221118094119.s4jeafgf6rn4hxn3@vireshk-i7>
References: <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
 <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
 <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
 <20221118093558.hopbhda6knmoekyt@vireshk-i7>
 <CAMRc=Mf8c8sen+8_76POGjCzTea-SK-DBPJOdGH7MCvTzWjFPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf8c8sen+8_76POGjCzTea-SK-DBPJOdGH7MCvTzWjFPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18-11-22, 10:38, Bartosz Golaszewski wrote:
> Should be:
> 
> # SPDX-License-Identifier: CC0-1.0
> # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> # SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>

For all files ? Or just Cargo.toml and README.md files ?

-- 
viresh
