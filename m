Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A62C605C8B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 12:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiJTKhq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 06:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiJTKhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 06:37:46 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0344F1BE1D8
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 03:37:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id l6so18828884pgu.7
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NviTK5H9rUNPxpWswLXdUm9oYTc1SrrBtuVBuHNRdZU=;
        b=T7cOeyV3q4N54G/5PUwYhq7ig3dsEcGpRUfqU+XVBzHCIHhNvcc7lY5Jqsg2VAwqyW
         WUkaH8Oog4xxavaLgMQ+7DMWRWuwTlePq0vf4/PgKjhK7gL2LJY7gaNxnPQnQzn31Ufp
         yVTNjvWuKsq+7pQxV+UmIZk5LAiuMJVvFTw+l+tQFbF4RXqngBgbaPevUJXAHpS2EbBF
         DYnYAEhscBc55UnjwWx7h/cfet9X6GOtplhj/yOL0zqV0EHZzr5Hn//f0XHQkOP+sAGO
         Z4NGyZSwc66cIFVjaOA6hlEWDKC8HDvlqC/2LgsPSc7cYmKlROVbsuFCqheFokItJ0O/
         j9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NviTK5H9rUNPxpWswLXdUm9oYTc1SrrBtuVBuHNRdZU=;
        b=JkdS4aR7/v+qPWZEqTwkeQIKvl0iDNGbe4rzMVMQZnmqzB4BrYCzxAUWEWzxbT4vqN
         3UHvC0sbFPqaqenmz4lg/B6JT09OhAF6/ZPTqax44qvlTtVYBG3W4jpHgkzN19ceSSbm
         sRHGZ9Bh9CzO7m5TkcbG+sCKekDT88d2VlRdhQxteqqcNrkQQtIelD/chkJkxZ2eXO7K
         xiBfU1m84pLOAqcYvQmJ2b1R9eDVMxy732seCN+9JlJvbXeDchcHrwn9CMlOcujVQdiu
         Iho2kAnsdVTCqLKE6+W3ElXeNj/lHn4QCg8hZCeAIHI7uPGHRVAXmB3GtbFEHoMv9+7h
         kbfQ==
X-Gm-Message-State: ACrzQf0saxnFewbUEQ+IvKsJsoqrxjB5jdMCC0KFUFYR6qF+TwLEGyn1
        jRsgC63CF6VC07umJXmxpKiaXw==
X-Google-Smtp-Source: AMsMyM7ZgVp0NoTZHIIdzbJ482B71mbJ5fzwNedLt6Z87avKxoi/QgrKPY4DJJhUHo4IRX2+DlUNOQ==
X-Received: by 2002:a65:6d8a:0:b0:43c:9fcc:cb24 with SMTP id bc10-20020a656d8a000000b0043c9fcccb24mr11329995pgb.477.1666262264455;
        Thu, 20 Oct 2022 03:37:44 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm12605995plh.117.2022.10.20.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 03:37:43 -0700 (PDT)
Date:   Thu, 20 Oct 2022 16:07:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 7/8] libgpiod: Add rust tests
Message-ID: <20221020103741.vdo5xwrjgqmfizbx@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
 <Y01R+58inH5MgXl7@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01R+58inH5MgXl7@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-10-22, 21:00, Kent Gibson wrote:
> I was surprised to find HTE tests passing on a kernel without CONFIG_HTE.
> I take that as being a kernel bug (GPIO_V2_LINE_VALID_FLAGS includes the
> HTE flag unconditionally - which is wrong IMHO).
> 
> You probably shouldn't assume HTE works - unless you have a system that
> supports HTE.

Should I drop them ? Or run them conditionally ?  How ?

> Other than that the tests look good to me, though as with the Python
> bindings I've only skimmed them.

-- 
viresh
