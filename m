Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C2E2AFB18
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgKKWHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKKWHn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 17:07:43 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D308C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:07:42 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id x9so3805743ljc.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ghHaB9kFwZ+qWAzm5xF5KDNSEe6oUbM3S2WPBG/P04=;
        b=l4r8L7BpAE5bSyQi70Q1YZN3JegNYg18O4HteLK1ZXu1pfzKV7mKFD90Vqs+omfqq9
         KYBm07efYDGacg3jhnOG3CpOdgulHuzjwtjPentitjhak/L9Or4Jy4had/1uo/GLYcLv
         Dcl5wChXjSMwP1lFuH43fiWe3hPJykQbRN1HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ghHaB9kFwZ+qWAzm5xF5KDNSEe6oUbM3S2WPBG/P04=;
        b=G9KJ6EATQablObmyVKKMhjxrp/ZDsXxihvCQaAAzO7NPCKBXNb8zGbni07KHzcMyc+
         wzLkjhLFEihcZhgbjB2FjEbY8OSS7o1q1j67VwNTijwuXb8IVEPctr2w8ZwaRVhxtWJo
         ScMRLKst3W88oPlDiRhP4ms24AUeghrW5CrJKwMDt5/qvnfrozkB2SwGhsg6BxjOv4vg
         X/f7sjInXSn7tNXIZQyjjH2qmmgGIBEzctcJbxi0CXnjEaBU7YGuz5Hm5mEvl1AQgaDG
         R5FUueQ+IYeXfQMUvtOSQcYjjLbJ90wFysRnYOLTMRBSY2/c3XoiltAaxrR4fEIHy/QO
         OfGA==
X-Gm-Message-State: AOAM533lo5TzPP4yFfL7YmKGZxrP0lLj8sbq04U/0EAw6nyYRGlthbem
        766739Q5OdT7lo9clopx57X2Jp6ErpVr6Q==
X-Google-Smtp-Source: ABdhPJyXw2BM19O8RzKxcWWeBzcsQ/NjtQgFi6EQ/W0UVDa/Kg8P0lfXanxtshuJkHHRX0a5vP7jkQ==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr7713234ljc.5.1605132460792;
        Wed, 11 Nov 2020 14:07:40 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id p14sm354408lfc.40.2020.11.11.14.07.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 14:07:40 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id s9so3786536ljo.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:07:40 -0800 (PST)
X-Received: by 2002:a2e:880f:: with SMTP id x15mr3599683ljh.99.1605132459597;
 Wed, 11 Nov 2020 14:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20201111215401.34449-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201111215401.34449-1-andriy.shevchenko@linux.intel.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 11 Nov 2020 14:07:03 -0800
X-Gmail-Original-Message-ID: <CAE=gft7cuEiA+esfsA4NCj4xKx5jA=Da_Su9Y+vUjM2vCeimXg@mail.gmail.com>
Message-ID: <CAE=gft7cuEiA+esfsA4NCj4xKx5jA=Da_Su9Y+vUjM2vCeimXg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: jasperlake: Fix HOSTSW_OWN register offset
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 1:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Jasper Lake uses different offset for HOSTSW_OWN register.
> Fix it here.
>
> Fixes: e278dcb7048b ("pinctrl: intel: Add Intel Jasper Lake pin controller support")
> Reported-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> I have got a confirmation that PADCFGLOCK is still 0x80.
> I updated my patch and put your name as Reported-by. If you want me
> to have your patch instead, I can review it (it needs some massage
> of the commit message)

Either way is ok. I'm happy to spin and edit my commit message, let me
know how to change.
-Evan
