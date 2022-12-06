Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90193643BF0
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 04:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiLFDkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 22:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiLFDkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 22:40:42 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658951CB1B
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 19:40:37 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id t17so13177940pjo.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 19:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/leipwkaHct+NX+XWch3vOzAqMjI2o0G0qBgkcPfGeQ=;
        b=MBTl2VaXCIcQGPDzfTYcMMxoz/SlrWOYvETLlAg6CIW4gPSwj4ekkprQzSvK9i7Jy1
         jJoG3UQ5lYgIK/QKsDTJHNBbDxlGwiahBhoiuIrQ4EpA6l6+G2kZuB2XnlEK4/46ymgR
         oZ+fX/xZbGbi8LBlUmmzwRZkavT+F8y0WZY8jg0hgczRe3LCKP8ys7uBNJPy3ujZyaZT
         c9qKLE1JshmDUNVTdQoN/v9ufnSPZXeiq6q7dGau94VABJHm1Y3YS1Q3ilZ1Eq2DvmW8
         3ow/YniSBPef1EAMYq/xcuN+pRSAvDcmeMUH0CoLmNhHKiNyU5joTRXzGTBoOpQvLQnA
         pqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/leipwkaHct+NX+XWch3vOzAqMjI2o0G0qBgkcPfGeQ=;
        b=oR6WkIE/FDD2jM+5DTr99US3ezPOcpeh7I4q7kNJzPeSMhqb2p9X97O8EuZwNHXG5i
         7/Pglnr2T2SGSmvcELyiGnF4ciK37Kl0fovaW5aWJdMSc2cNpNfczsy9aNbx5ywUOSyk
         lGXC/POteNKZcjJmatvxqVSe+wagy8tfiO8PiJ0NZXH3aX+uKRIH/dAIVumEexqApneN
         0DEyx2+zc3ILtCq2pBtePoE0GfWoGGfnDr3LY7Nt9sCg/SuQLAsZs8K/PVFJKwnoy5j8
         QZzhYjLLiXwv6GwrwR4Uim8xrDmQP8d58NKqAfB9w5lp/+2IUSqduYtlr/vPr4ZlglZP
         5r0g==
X-Gm-Message-State: ANoB5pnSeW2KpY2IcwVdpjuMxKcbIi95gsBY11hldCFIPLF92bBW+/9B
        NlSLMU6tD1PNbyO4G2PvsHvUfQ==
X-Google-Smtp-Source: AA0mqf7IU4VNnUgWYpkbFH6jEsA7K/A3HBnZsN/t3oGk/oD4fDVHT5IGM/HFE3RMH4/d08ygXWUJ0A==
X-Received: by 2002:a17:902:ef49:b0:189:66dc:4af8 with SMTP id e9-20020a170902ef4900b0018966dc4af8mr51752994plx.148.1670298036908;
        Mon, 05 Dec 2022 19:40:36 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902860500b00189951514c4sm11310217plo.206.2022.12.05.19.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 19:40:36 -0800 (PST)
Date:   Tue, 6 Dec 2022 09:10:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to
 meson
Message-ID: <20221206034034.wranm36qjdd5ueqp@vireshk-i7>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7>
 <72c1c5ef-8cc4-4ff7-9048-c9095e930e83@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72c1c5ef-8cc4-4ff7-9048-c9095e930e83@app.fastmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06-12-22, 10:56, Andrew Jeffery wrote:
> My experience with rust is (unfortunately) superficial; the meson
> conversion achieves the same outcome as the autotools integration (runs
> `cargo build ...`). If that's enough then I don't think there are any
> further issues.

That's all I care about at the moment. Lets see if Kent have something
to add to this, else it looks okay.

-- 
viresh
