Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF5610071A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfKROM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:12:29 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37389 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfKROM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:12:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id b10so1180846pgd.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rQ0nIjnMlyv5xEjJ8GcKTQ43YSx28Qy1zR9On/ew7Vk=;
        b=OCEUgGuP4le7B0xKSyAWYTocTGY0XxwFQa9id6nFGV8GqElUJbrP73lxRHUzqZNwvs
         ol43ceVo6awsLB/MKIaM4WQs7mETiYzTEETNJhhJVP6RwfLM+7WKRQVZTn4i1Q536tPN
         Lr/kVZNupLXjBshOvqxfNtrHZQNK+7FTIbTfHNIW2M0uVOMV5Yi5K7P7/rWTa2mwBOtP
         F1u5diRBnVyUSr4evhcznLfK16hJhWYInxlGdhHKdha9vhrBXYkIXqmIjNE6YS8All/j
         hrHLUc9jF7+v5aUrb30ue37JG/xr7uV4PKOghdAWl/5elsIavDfLc0RLnuF6k/6mJx76
         nkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rQ0nIjnMlyv5xEjJ8GcKTQ43YSx28Qy1zR9On/ew7Vk=;
        b=rM8oNY5Al9jZkQoBnpECl6fWW/2rICWjJOTIKMdWKLFdAYz4y/8ZEI0wkMqNtYAOHv
         l27IzXmOgOP0GgimPDWgVVAWhVmCLCxwwJsXdiC12cica23JfOR/7kL+l8uTfUFJ2lNN
         0CM1HEcX7DFPQTN8lpj7rE46EogXHNfaddJCBsKKCVX3031CqfVaWF8NwIeA9kAeJr6/
         F2ZPbqpqsaAlnJRLul1PsS2t3UI3cERG5YXGYTZ00FdVBlFk1gRPHYGnVyObe7+eMYk1
         5qrdA42gf7K2Y580voz79NXM+xeisyt/MObO0dwXfTfjHKIjxJWQICJaP/rlmrEQ1UfE
         nOgQ==
X-Gm-Message-State: APjAAAWLnh9P2VJ7PvdAVhWtWF4KIty6rOHkqXKFq29hTEZOJo+mOUO6
        yFMMhmd06htYjP2kkyTET94=
X-Google-Smtp-Source: APXvYqx6fbADSOtVaW4MDbFsV7GSg8rnzszeHjebVYwVh6KcNAl5lkbsHMh/6YJmuBUrb4GZiWFlmg==
X-Received: by 2002:a63:588:: with SMTP id 130mr33820797pgf.148.1574086348084;
        Mon, 18 Nov 2019 06:12:28 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z6sm9532230pjd.9.2019.11.18.06.12.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:12:27 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:12:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 02/19] API: add support for bias flags
Message-ID: <20191118141223.GB27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-3-warthog618@gmail.com>
 <CAMpxmJXRuRmE9-9mk9uv47kviMUO=+oEgPO0KtVB77JW8M_AYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXRuRmE9-9mk9uv47kviMUO=+oEgPO0KtVB77JW8M_AYg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:51:06PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Extend the libgpiod API to support the bias flags recently added to the
> > kernel GPIO uAPI.  The core change is the addition of
> > GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP
> > and GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN flags to be passed into
> > line_request functions, and the addition of gpiod_line_bias to return the
> > bias state of lines.
> >
> > Extended variants of the ctxless functions that accept an active_low flag
> > are added to also accept other flags. The variant names add a "_ext"
> > suffix to the name of the original function.
> >
> > Based on initial work by Drew Fustini <drew@pdp7.com>.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> Hi Kent,
> 
> this looks good, just a couple nits. I'd change the subject line to
> "core: add support for bias flags". Also: how about moving the flags
> argument to the last position in all the ctxless extended variants, so
> that they keep the same signature *except* for the appended new
> argument?
> 

Will do.

Kent.

