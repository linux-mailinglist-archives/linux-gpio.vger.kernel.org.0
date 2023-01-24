Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9426793CA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 10:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjAXJQQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 04:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbjAXJQP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 04:16:15 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0352B63F
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:16:14 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id e18so3557600uam.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HI0EE/7EoEaTek3d17pxWOZ/DwBkYtL+j+6shCXkxVY=;
        b=OGxl+6Ci21gRqrg7IV4Ppo+dlH+aIN5133D4D8mD5ybRO7r8R9VMNvGVnY4073fPNC
         zFgfjltcDDlrmODmT+E2lH3y5M2w3p8JcKCGA8QiQlYf0OO0sOKUZkZKj+QU6QJ4v20t
         F6PxW8NyME3M3Cjshd8EnQnnljagz9Lf+CVZDQoKC1DnNtx8gizwZUZwP/sNZSZiKPnv
         msE7P9fGdVPISABaNp7bSJPZ4pMfHPIgVetuhpniLqO12twjw/oree02BJR2abjYjbCu
         Lp868fhTxLjEd1wNgBuUVIQJnqEOm+6+PbgCgx6my17jwNHyqqwBf6cRyp1YvjCq7GAu
         uuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HI0EE/7EoEaTek3d17pxWOZ/DwBkYtL+j+6shCXkxVY=;
        b=E0zPdbU+knModZ/XQlN7gQiofX6d2PKl3j8jwVH1AL6KSiQk9HjQt30C1jz6DYg756
         9W9B5TBL9IVAziCiacj4hEDFUNwtg1rhjlzwd70bo+kEKdnfB/lnOgtx4f8wBPJ4VfsR
         U4nujb8Q43//Dq6UFLeGaPXqv8aRdGuhVLUvQGyQIdh0N7pQZUKGmv7etI69HNDHRUr+
         AoNq1ebbK+2/LziNuzh55h3yT9bL1bMkUmbZf/yT8jNnf/bN2stndRho8VwMvqkfKLa/
         qpElrE8EYZRYPeEKW3+aRJjKj8/nFaYdG3qjOj/4+MprYksRuAhXmAEyXTiPH+/rWMCz
         RHlA==
X-Gm-Message-State: AFqh2kolLcP6VgOXW7yBw9b4HkTi8N0qYji/Rbf4eZxYM6kbITDeFFLN
        SRvPbHMc+0HDFVSQzDWLl5gTvFhIAYHjnwlk4JtFLg==
X-Google-Smtp-Source: AMrXdXuivMUVFqpEDckpq6XMY+kgAYX+Ni3dd1mthumbHls/nW6o0kXjC/g8XNBuRTDVrJhq//GhSKum1YWd61M9K7Y=
X-Received: by 2002:a9f:3748:0:b0:5ab:8b60:2a44 with SMTP id
 a8-20020a9f3748000000b005ab8b602a44mr3013796uae.33.1674551773144; Tue, 24 Jan
 2023 01:16:13 -0800 (PST)
MIME-Version: 1.0
References: <3d03ede97ce0717e3f69de8fd4175407a3aa3a0e.1674548651.git.viresh.kumar@linaro.org>
In-Reply-To: <3d03ede97ce0717e3f69de8fd4175407a3aa3a0e.1674548651.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Jan 2023 10:16:02 +0100
Message-ID: <CAMRc=MdN4BRaJ9jB0M5oyg-e_t-xq637NPq6+NCzPk8qPXXM5g@mail.gmail.com>
Subject: Re: [PATCH] rust: Allow reusing locally installed gpio library
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2023 at 9:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The rust crates builds fine when built with the 'make' command, as
> static linking works fine. But when referenced from a remote rust crate,
> it gives following error:
>
> error: could not find native static library `gpiod`, perhaps an -L flag is missing?
>
> This happens since we only support 'static' LIB-KIND currently. Remove
> the same to allow others to work too.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/build.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
> index 274069eb9e9d..e3ed04afa141 100644
> --- a/bindings/rust/libgpiod-sys/build.rs
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -37,5 +37,5 @@ fn main() {
>      generate_bindings();
>
>      println!("cargo:rustc-link-search=./../../lib/.libs/");
> -    println!("cargo:rustc-link-lib=static=gpiod");
> +    println!("cargo:rustc-link-lib=gpiod");
>  }
> --
> 2.31.1.272.g89b43f80a514
>

I don't understand how that works very well but I trust you know what
you're doing so applied.

Bart
