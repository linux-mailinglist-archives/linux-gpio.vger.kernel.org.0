Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FE2582468
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiG0KeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiG0KeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:34:02 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0872043E44
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:34:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id v16-20020a17090abb9000b001f25244c65dso1761782pjr.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3l+8olBsP8xnmjGlES3uLMATJnO2qX5ekxmQ2eT2Hmc=;
        b=x/BaJM6/MDR+3lL4hWurGlGcpSdgDWFx0ksbO9LJDEHAyGO7y50YRVQ3IHl6JOYF/v
         Av2RFBhSDVaib1Xj67wzEEzXGYioNXL4nZ6H39kcgaBihfs0IEivlnxZjp1Mquhx44fZ
         z0KDa51+y9F4xj4AJKdCUx7g9YIjOjgbuKWCG1Wli44rYpf2JGWzz0SJvI5YFMJToC7a
         xnBOH0wadV9vaRp0IKERx5KY57hf6rhkATX8ZKE68O7sBVvadXw5x0cKrJlwWUmHc74+
         GWpIQNYfjUWnuP973hoLy9QFAawQl1n7nYeskXAl8D++EOj0b6G7YrHp+yotIRnk4rXY
         PpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3l+8olBsP8xnmjGlES3uLMATJnO2qX5ekxmQ2eT2Hmc=;
        b=yCB1dpDABiWcJlEhVJkUionMQ5+rof/o2qlAn3REQa2nCLmhIPbggkFbGKoLX4sBvx
         /mWeQDdK8FY9+5Q+1ZMj93lNorm8AQT8Y97MknSN1nYwFBLc22a+Z/fBefx8E10jhHMY
         5c9NNfCSplOHLuZd4VZMlroVIo0tpSj7N8Xzs9NWnJZS8dGJjduK9CGIgygSlO0JrvNW
         nzjUtLjCDAiB9QwwGvgncANntWZCkglO5FQKYG8XujVGdgXEOWFQKTbnWdRRO5fER8gA
         awvONZc1nz3c0wPZobzQNWu8dhbOn2kUN1CY2OKzMzqDPbO2ifKfXgegOein5aPI+cHI
         0+BA==
X-Gm-Message-State: AJIora+02/a8pR1Uoa/UlYa81Oth+A5Pxz7O+swuSm09VV+ddNLQfR0M
        3eNb3UDdbFdFLMzwJts9ztjnJQ==
X-Google-Smtp-Source: AGRyM1tl7bqFauRVLU0G7Eb1kzbsDdgY3Nv2g/YBMTpNnbYTKnsQ1s1AF5nB2uCpfYpRb+9I/qqaeQ==
X-Received: by 2002:a17:902:a516:b0:16d:4379:f34a with SMTP id s22-20020a170902a51600b0016d4379f34amr20706481plq.26.1658918041553;
        Wed, 27 Jul 2022 03:34:01 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id t14-20020a170902e84e00b0016bfbd99f64sm13620920plg.118.2022.07.27.03.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 03:34:01 -0700 (PDT)
Date:   Wed, 27 Jul 2022 16:03:59 +0530
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
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727103359.3erlslx47awj6syv@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
 <20220727025815.GE88787@sol>
 <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
 <20220727095945.GA117252@sol>
 <20220727100633.4hrldpruyhblxobw@vireshk-i7>
 <20220727103215.GA122301@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103215.GA122301@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 18:32, Kent Gibson wrote:
> This is for an example gpioset, right?

Damn, got confused :(

-- 
viresh
