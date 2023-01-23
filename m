Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED482677D38
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 14:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjAWN6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 08:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjAWN6R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 08:58:17 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B1E24108
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 05:58:15 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id t10so12947249vsr.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 05:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Zudi99Pw2UJGBVk5hnwhU+Mukw8P5eg81Y8vZjPDI=;
        b=s8F7t6Gl3VnI+rLSNkwB0IuHlmxwHucXVNi3fiafWUShkSYwqC0B4v+H/8V1XeaTZT
         WRT3Go2R4IC2kejAqWviNKrpjAHPshjzxFrpeKYce7/g2mIm1NjjfWo5GtuGWu0uvYz4
         DXlJbiy/MWZmYyfXx/LNYGgMShCcLP5BeFju3R20jIHoyfcHK7s5XJe3F6ZuDQZ9eHpD
         bQD0m51n+B7bq8tNOUfY/OzHKkVYMOdA267JTvM1+HpwWm0KjxyXp18ANM68UjtDKX7l
         0cJLWj7Kj0XN5vl3Dei++S+wHCDvW73lnHWTLku6fBTnyd7QXczvVZ4rTEQNAgymU3it
         /QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+Zudi99Pw2UJGBVk5hnwhU+Mukw8P5eg81Y8vZjPDI=;
        b=4v5wYAcXcZx+VRJWQQkv0ExYIg6wPuG2ez2UuAz+3pW+gDrC0sdN6vIuXDV/yvuFBg
         dVFakwILAtbbujIciOSrHEbxZMxy407h8NadbxjOmxU8DVHOQkfBKsDihqODStVBz5aS
         t+U/gzv8Vp1i/d6lhdpWTQLPkKGB0ffrcz3OQ2lvmKUHo30Qd3cinLCQOv/6KbDbXgmd
         sLOn1U7MWaolKkp8dItkbnxZWNVVAd46ZTk13eaQ0dK63IZ8UAeiogF+qawGP+zcH5XZ
         N2r1YZ6sXRLqFOFg5cHa3u4OiF5i0I2YNuAX5TKUUOX/v3TYCgGK0wECvrTBsCwpMiZK
         sk6A==
X-Gm-Message-State: AFqh2kq1vnc6kRJXwCGItnQOHNW9Nbcstm310yRp78bb5Ov6QWh60cba
        hpBoKW3vv+dBCJ+7hSGT9omZWPlKvoEj1KxM1HptCQ==
X-Google-Smtp-Source: AMrXdXtDzJO2u64ZBWLWlx1d47bwU6P9lHmaBcrfnoYiogSHmW6pKX/SU6TtEkINONqedpjzDsr3JUm5aPdT9LZvysY=
X-Received: by 2002:a67:c387:0:b0:3d2:3577:2d05 with SMTP id
 s7-20020a67c387000000b003d235772d05mr3037524vsj.9.1674482294758; Mon, 23 Jan
 2023 05:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
In-Reply-To: <20230116055209.b6ydvderreqtqedp@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 14:58:03 +0100
Message-ID: <CAMRc=MfkoD2SRNtyoqYdriGj82m-dEP3wNXinp=mOi=9axRzMQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify gpiod_line_config/request_get_offsets()
 functions
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> For Rust changes, please run these as well to find any formatting
> issues, warnings:
>
> cargo fmt --all -- --check
> cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks
>

FYI The first command introduces changes to unsafe blocks' coding
style that the second one interprets as unsafe block with no SAFETY
comments. :)

Bart
