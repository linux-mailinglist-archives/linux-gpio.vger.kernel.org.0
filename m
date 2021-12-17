Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA28478936
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 11:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhLQKtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 05:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhLQKtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 05:49:23 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD673C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:49:23 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id q17so1505362plr.11
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cethrsP6M30I2sW+YWZ2T2YPOVkxP/B7veaSBGygoog=;
        b=g9lcCPbh2e/n6fc+1YW2zs5sKpS/80Ci19JNnNpZU+MYwXNAHaofW9WcnJaW11jGQM
         hHR06Dh0OoMKDHHCXTq686BDRXI/Imm0bZJdTGBFzWkRaHgAfKxZ5y2K+FiK7F498zpK
         U2c5riWHoRblT+Zx2rF+UEGCICTooZJHIicdioTEVomDrmDrTpGE18a5iRJn0TonHVQZ
         sHWe9z+uXatbnEQIkBFfaopBcYVYNxExLZL9maEmmYEh/EVajJtJ65/46DeseL3zhNSO
         CipVl5b5EZTnkhuoWE/KINztpsmrKLYqNpcXlqbq74cvQO2oQJNXsgbS8gCBhwFUF8Gx
         lnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cethrsP6M30I2sW+YWZ2T2YPOVkxP/B7veaSBGygoog=;
        b=0NM3ROcA8fspaVQG23/KEopUP86OX8j79fn5kjHhR2NqU+8VWf6nZzbUeUp6yHTWN1
         GCWdRrwhj6q5yoorkqR8JQbrJ0EfZX1vTNn4/3AEWp6tdmPeW/QIo/ARt0Ksxi0y9vNN
         l0Z/Har3kTVkQRtbnu5AfoejkNpFJVlL0Q5qfYWioUL9DmSBhUkht57EviQwSNNWJqn1
         JD0XFcuEpcZMNTpDgi5kkI671LulY6FIJs8/gHegiO1PntC+nYNBGOCHkpOxvgbqasrr
         SMGl8O5U1eDT0lL6gg7Pz/8MIWPK3L9jxmwJ5vUooQZQYJiU9Az1cYadG2OM3uBUvSZ8
         ARUw==
X-Gm-Message-State: AOAM5332ys9uct6k2HliGp16/bomcFUdq5f8Kx8v3NSWhtFjO/p4ddd2
        SgTfjcN3xq/7Bhd6R502Wz9ANw==
X-Google-Smtp-Source: ABdhPJzdugwOSaYRg75EZbzhSQO5qm0EZMfbUu6aVR8VY9+NOn1AsHpFYVvOEJFOXYo3/HoItiKl5g==
X-Received: by 2002:a17:902:c111:b0:148:ab3d:7d44 with SMTP id 17-20020a170902c11100b00148ab3d7d44mr2564858pli.126.1639738163135;
        Fri, 17 Dec 2021 02:49:23 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id e14sm9018168pfv.18.2021.12.17.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:49:22 -0800 (PST)
Date:   Fri, 17 Dec 2021 16:19:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
Message-ID: <20211217104920.dxvgmw3536ii2de7@vireshk-i7>
References: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
 <20211217055001.535wscahbxfkrxn5@vireshk-i7>
 <CANiq72nimetRmi+aHF1h+hqvSjFJxVXsBYKQHUEnTQ50Lp5eqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nimetRmi+aHF1h+hqvSjFJxVXsBYKQHUEnTQ50Lp5eqw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 11:38, Miguel Ojeda wrote:
> Having optional pre-generated bindings may be good for some users,
> e.g. libsqlite3-sys does it. I guess the main question is whether you
> are willing to support/maintain it. Also consider cross-compilation.
> 
> But I wouldn't only provide pre-generated ones if you are using
> `bindgen` anyway.

The pre-generated ones are normally good for kernel headers, where the userspace
ABI is stable and so we don't need to change the generated bindings soon.

But in our case here, the ABI isn't that stable and will likely change soon
again for the first few months after v2.0 is released for libgpiod.

Perhaps, we should make it compile-only for the time being. Once the ABI is
stable enough, we can think of committing something to the source tree.

> In any case, I am not a Rust expert, so please take that with a grain of salt :)

:)

-- 
viresh
