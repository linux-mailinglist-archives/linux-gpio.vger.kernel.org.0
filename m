Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B1446E7E6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 12:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbhLIMCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 07:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhLIMCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 07:02:47 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA30C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 03:59:14 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id r5so4887429pgi.6
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 03:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6K7nH29BUaj31wF9V/fbzYtus8fhNQZXRph84D/C0vw=;
        b=UbnGYKAg+6z/d6+MPqnM5xaoy4xhJ4FQ0oF6kUsS5Fjvc9rO2V9w0UAdBGGiFY3WCk
         kWQrgB4eZiKg1Qw99mUCRREU+esH1BGphnHBFbkOdpCdOn84OXKU6+CWPkTighjXQwky
         Qf7r4GkiwGar7QZZuH4HDJxDo8+7CvgiDwvGOhv9dFAkUl8dypjK29jvWbXRKUOXvqwQ
         bpsMU8KtZWtRsqRAr2XZ6Mz7JmwuaRBHfllkgHtr3NI/F5joC04Ym0SJZsKGrAv3DylR
         8UogcrCMB0KKGtrlRXD/uTUz+jsQv09iJw0H02zWUgYe961qZrdoSEgEWRDTg8m4OfSd
         LzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6K7nH29BUaj31wF9V/fbzYtus8fhNQZXRph84D/C0vw=;
        b=Kn4Cxf9Z0TymTQNwC/vZqqYRViBmpvEv/1xSi358t1Bsww4xX5xVbsTsBl0zxZV3DL
         Ol+bNVm4/0QFJr1S7PdG9U1aTeYsdraFWI9w2GgJEHV9benapVPYuVYqkNuZn5J8zE+P
         dMV3z0fiUQzo2Ie93iEPBgV2oe1a8FLFm61x3Ogid4Lt3WOA2J9DQ4VHMb+GR3yB3DvG
         qVFpyQvxxb6s8PmlsEgZBkTdesKxgNv6P6/0Myl/uu6Ww67+AD3julOFVTAeOLND8dlh
         rZ6HheaqGNdlzQ7zN3lIG08tgaXxAKZBXSD/TInom+yRIxgLiIFx1uzCosfZoPIOmbbM
         QBmQ==
X-Gm-Message-State: AOAM532qCWRIG+uFm9TAbVTtDDxdx+tIrHsJQXm9FP49zujQ7a8+Ahpx
        PD1KIOSMpqIoowzQZ6CMoTuCTg==
X-Google-Smtp-Source: ABdhPJx69QT4KsYCZplzGdEsn/KN/5EaDC3OfnEd9Nh3fAaRIA+JvJURFppab0r0wlznZ3uOdZAgCg==
X-Received: by 2002:a05:6a00:1a56:b0:4a3:3c0c:11c0 with SMTP id h22-20020a056a001a5600b004a33c0c11c0mr11276122pfv.42.1639051154206;
        Thu, 09 Dec 2021 03:59:14 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id y4sm6958277pfi.178.2021.12.09.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 03:59:13 -0800 (PST)
Date:   Thu, 9 Dec 2021 17:29:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
Message-ID: <20211209115911.xhfsttn2cnqf7yy6@vireshk-i7>
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-12-21, 16:28, Viresh Kumar wrote:
> Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> and hence we get redefinition errors during build as <linux/ioctl.h>,
> included via <uapi/gpio.h>, defines them again.
> 
> Fix this by undefining the macros between both the includes, document it
> all in musl-compat.h as well.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  lib/internal.h    |  1 +
>  lib/musl-compat.h | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 lib/musl-compat.h

This one is scrapped, please have a look at V2.

-- 
viresh
