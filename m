Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE93061EAD3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 07:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiKGGNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 01:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKGGNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 01:13:17 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A080ADFAD
        for <linux-gpio@vger.kernel.org>; Sun,  6 Nov 2022 22:13:13 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id b29so9647277pfp.13
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2022 22:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MzxeZiUhgAc3R6pruCZvgDm9QI3Mrvany4bUdqY3Xx0=;
        b=t4/KQrsO2ieVdR1h45HP4RqU6qgtIDHKe5mU0U4pab18/IEwGq0EYlORQekEmahhhN
         ruKae6rfrDz0Ax9RQy2Bi/Z1C2ZynAFGxC8ecDUMST60KnJteM+aSp+rN8ZnOeqOab8g
         MzOIGcLV1PChvlZsIu8IvuGWriZClt8bZ5NESOs4O8R8jo/6vXYcOgU8W8WeZmQ7U01f
         9nLLA5iixP5LWUtLOzDB+DFEgDpnXT8hS5NWM7sXgLIF12awb56HS++G6tD5+6JIqMLR
         CLIhkxVidyeM6AgY3OC/2OSErx1gYbgLcD+djw3BscXS6bpO7sHoDTg1yAk7GUZ9DZJQ
         PoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzxeZiUhgAc3R6pruCZvgDm9QI3Mrvany4bUdqY3Xx0=;
        b=YtdGUSmGaEi85JJVjaulUr0ecV72hQQeLHTPuwf/+9A2XjG0u5qwChx+6+IUV/NXv9
         b1467fTqnfL78A7ZdYP7KeFTEHbKhNIIXbuI92W6M3kb8l1ON+Njsw8cMh8rQrMXb687
         3T/eRXgmkaFqt6JeQR4YisH/lOFWZrJrjndrH/ZFBLx/hE86Fg1trGSZSMv2HglcG8Dw
         ySxjryZCBDo5Bx/unv9UEuKstm+zB7Hz8H4/g0oFVi44GSJAsgGbAryPCQ6n95IWab5V
         CAXOUnXIKrDhFyTLYUIdVhft8yenyYwosH7qYmxzq/JNtVXQUL9PXvnrc9ahvtsJ3u2m
         Un4A==
X-Gm-Message-State: ANoB5pl4RJRML3kRF/i7bGIy/PNUcYqI72Ux1ou57OPHtnpa6pkeHxth
        boTCa9v1/JTGaHEmSbxomuIpGw==
X-Google-Smtp-Source: AA0mqf6kEFwv1qf9JHlMFb9qS8gN2z0+CmnO0oK3ewWF1oq1hjO02k5vLTvL55vK7sfQRcRxNDlxyg==
X-Received: by 2002:a63:550a:0:b0:470:71e2:132f with SMTP id j10-20020a63550a000000b0047071e2132fmr4335537pgb.614.1667801593141;
        Sun, 06 Nov 2022 22:13:13 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902da8c00b00186b04776b0sm4102494plx.118.2022.11.06.22.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 22:13:12 -0800 (PST)
Date:   Mon, 7 Nov 2022 11:43:10 +0530
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
Subject: Re: [libgpiod v2][PATCH V8 9/9] bindings: rust: Implement iterator
 for edge events
Message-ID: <20221107061310.g6q5fbl3nesd247g@vireshk-i7>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtqgmRu9fYXiag@sol>
 <20221104113147.rm6psaajhj73k45k@vireshk-i7>
 <Y2UGf7UkNuCtjpBN@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2UGf7UkNuCtjpBN@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-11-22, 20:33, Kent Gibson wrote:
>      /// Read an event stored in the buffer.
> -    fn event(&mut self, index: usize) -> Result<&Event> {
> +    fn event<'a>(&mut self, index: usize) -> Result<&'a Event> {

I tried that earlier, but then I also modified self as "&'a mut self".

>          if self.events[index].is_null() {
>              // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
>              // as the `struct Event`.

Thanks.

-- 
viresh
