Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732DF6E47AF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Apr 2023 14:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjDQM3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Apr 2023 08:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjDQM3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Apr 2023 08:29:09 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E337610FA
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 05:29:07 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b5465fc13so861003b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681734547; x=1684326547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VikSPEaucE42BRa4WJpfiZ2fpXB3+koXvtJAh7ajBA=;
        b=NbkYL6dRZ+hEvFzcR+kAFqgCT3EgSJ+LPnat/pgOd/M7ma6kucIeg8aUpkwGg4Pnse
         z1wDxNlPEDUV1tLc72h/V9+Yq9zuOmU8s5t/5lIPqldDryd8YL7lc5ZC3PDTEHk9mb2B
         nW6RGBdB+jHR1qblKGbWQVcWsvY3Yvm5Znm3c1IpSEuqxq/vKpJIpNsvr/WPAL/UeBy6
         3zFvOkPSWRwZKJZfbeoJBFFyrtbtmQdJCGWZM1WyD5tWn27lLaSuu5XVuZorwu7A6sGg
         kAMxq/sxqaXdHU9BQBv7NVP1h1Oyzxo/Qv4QNm3+eep0Hk1EMzBHmpxQ086t23zRdZqW
         LO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734547; x=1684326547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VikSPEaucE42BRa4WJpfiZ2fpXB3+koXvtJAh7ajBA=;
        b=bAlE15GZg3poqOKgaovcJ3vekr4i6Bfsh0V4llHGCOtlb5p4/uTNAm568skk5jLLs9
         MWw4HRo3G+z2rwkQh4lg6tGmdJKbHk8dadaYHr3CNEY44ZVXkIby0PbUuWMUyNFCI8N2
         rttgzgt5RS09Mu2sF6vUvEjGTdsEveCUNptMrw945CgBJoh2FV/uOz4/cjcJfj43aufu
         WLR8hPgXCNDpEEu6xESNcch3s1fONGtWgojU2Iv64+XmrGSKyWwt8xOo7Uw/asCiMpcD
         dxNpmJ0L9tNQwwYZPVGqJsDiEermjXIbw+mjGV9P/CHcZ2otOsjCX489QYt7tqSCs98g
         a/Mg==
X-Gm-Message-State: AAQBX9eYB4uG0jx1i7S8n/uycXdZViFnoVqK2DmKcZKkRlpmphTygyiy
        qOXxMo4Erx5SyTsqFFGZ/74=
X-Google-Smtp-Source: AKy350YpZCBby+6e8EwHvccwy2XUCdSD7DaWdCczYnXlDx7RLNIkDsMCXwcuNqmqyT5w1N+iHKoYoA==
X-Received: by 2002:a05:6a00:1822:b0:63b:68bf:f764 with SMTP id y34-20020a056a00182200b0063b68bff764mr15872752pfa.7.1681734547262;
        Mon, 17 Apr 2023 05:29:07 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id n17-20020aa78a51000000b0062dcf5c01f9sm7533311pfa.36.2023.04.17.05.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:29:06 -0700 (PDT)
Date:   Mon, 17 Apr 2023 20:29:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Sameh Mohamed <sameh4@gmx.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Question regarding locks / race conditions
Message-ID: <ZD07jv32RzLXKGfE@sol>
References: <CABrMOxZY6Q3wiYsJUaXZiSET_gjMJ3GWaMrDCXwXC6nf7AX2_g@mail.gmail.com>
 <CACMJSevuPg=bWkE5fTdechJMrTUWiaM9nn1f8G1tTDdphcPWFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSevuPg=bWkE5fTdechJMrTUWiaM9nn1f8G1tTDdphcPWFQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 17, 2023 at 09:19:31AM +0200, Bartosz Golaszewski wrote:
> On Sun, 16 Apr 2023 at 18:20, Sameh Mohamed <sameh4@gmx.com> wrote:
> >
> > Hello,
> >
> > Many thanks for your excellent work and contributions.  I've been learning about libgpiod in the last few days.
> >
> > Studying the cxx bindings examples, particularly around line request, I looked up the C code for gpiod_line_request_get_values_subset  and saw that it does not deal with any potential locks.
> >
> > I searched a bit on stackoverflow regarding Linux device drivers, and saw that it's basically up to the application to manage locks.
> >
> > As an inexperienced programmer in the Linux user-space; I have worked primarily in python and C++ client applications at a higher level, I wanted to confirm my understanding.  If I am writing some library to run the RaspberryPi that will make use of libgpiod-2.0.1, it will be up to me to avoid locks when making line requests, etc.
> >
> > Thanks,
> > Sameh
> 
> Yes! It's a design approach low-level C libraries usually take and
> libgpiod is no exception.
> 

Just to add my 2c...

It isn't clear to me where you expect that locks need to be applied.

Single threaded apps, such as the examples, do not require any locks.
Similarly apps that restrict a given line request to a single thread.
Any shared resources within the kernel, including the relevant device
drivers, are handled by the kernel.

The GPIO uAPI provided by the kernel, and that libgpiod wraps, is MT-safe
(though I can't think of a use case where making calls on a given line request
concurrently from multiple threads is a good idea).

However, data structures returned by libgpiod are in userspace and are not
MT-safe.  So if you want to share those structures between threads then
you need to add locking to prevent potential race conditions.
As Bart alluded to above, the best way to do that is dependent on the
application, so low-level libraries like libgpiod usually leave it to the
app.

And again, you probably don't want to share a line request between
threads anyway - even if you think you do.

Cheers,
Kent.
