Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC0272A124
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 19:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjFIRVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 13:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjFIRVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 13:21:12 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5B63C23
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 10:20:48 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75d4094f9baso187835885a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686331247; x=1688923247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C0K1xdwndgBNW0YDQyyOi1RArcLQ78z0GGBNEc1ZEuU=;
        b=Q+YN33+MPZ/KyNwbxluflczPkuWx35ML7tjPBZNUGIhWCslVSXYFlR2Uy6h4TWzsQk
         XOnc7Qklt1V0GeEa9eqn/urSxdV8+zqBAvDlp2UHFZjUE5mRyK6E6Q0AnkNJDt2IYLV/
         Lv/z0GjSWJEHazJXPcI0QjtDI306iyTCpwFOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686331247; x=1688923247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0K1xdwndgBNW0YDQyyOi1RArcLQ78z0GGBNEc1ZEuU=;
        b=ag/gdADcdMkGPPDK/bsO8fuQGjdDZW24dc/dmxxsQtyg6fPE3yVpTm+mDJ0nsqYfii
         MD0aNj37EcKJhmf4Xi+sSa4xpz0e3q5pL4WN8ucEjTbLSNK5b8orFJDMj152TDmdkx/4
         rb9DA40H4p5j4+zdxjEICDYYWqoXoSXaOjc65jsXDq3OxDr95iZ18IuRGTTTUrBpJOuU
         81RdjKjnErB0I5TouCdf+qp/1ivmM+TgfaYZ0ggIbO8L5JuXiL9QC8IcDwjeMlTANzmv
         x/DEEpI6KlN7HqOyRwb+1Gw12QFfvVpGDF7e0Q492o0LDP1KHZFCFYFhhXOWD7hbp2zV
         ORCw==
X-Gm-Message-State: AC+VfDxKacYWBCOysMKNI6GVzNb80rzGx6TqPNCPHGXEfzl2XsLy4il3
        w9M3+GQmJ7q9IVyFhLrMfe26+2RSkSTJz/ZaA/U=
X-Google-Smtp-Source: ACHHUZ52RAdB+pe19du5jItqsJmborh/2vTsnV+wXJQF86Z0hJtjAviEF6MYJXDNlIiMeQJ8HkSU0Q==
X-Received: by 2002:a05:620a:1d0a:b0:75d:a00a:1e1b with SMTP id dl10-20020a05620a1d0a00b0075da00a1e1bmr1862890qkb.6.1686331247266;
        Fri, 09 Jun 2023 10:20:47 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id o23-20020a05620a15d700b0075cdad9648dsm1174809qkm.25.2023.06.09.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 10:20:46 -0700 (PDT)
Date:   Fri, 9 Jun 2023 13:20:45 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     pr-tracker-bot@kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] gpio: fixes for v6.4-rc6
Message-ID: <20230609-trillion-imitate-f2914c@meerkat>
References: <20230609144613.210272-1-brgl@bgdev.pl>
 <168632880867.22652.10987437416013616928.pr-tracker-bot@kernel.org>
 <CAHk-=whVcTX2hJ9VrpooL1ft34oB5kyrRsziM7cH94d8RGA_7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whVcTX2hJ9VrpooL1ft34oB5kyrRsziM7cH94d8RGA_7g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 09, 2023 at 09:43:37AM -0700, Linus Torvalds wrote:
> Hmm. I have no idea why you got duplicate replies from the
> pr-tracker-bot for the same pull request.
> 
> Konstantin?

Odd -- I thought I had dedupe logic in place to avoid the situation when the
same pull request is sent to multiple mailing lists, but apparently it failed:

msg 1: X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
msg 2: X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>

I'll double check what happened and fix.

-K
