Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B603749EB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 23:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhEEVKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 17:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbhEEVKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 17:10:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34F7C061761
        for <linux-gpio@vger.kernel.org>; Wed,  5 May 2021 14:09:07 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id h7so1848330plt.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 May 2021 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mzL7+lfo0jgpxWVMdqWo9doOV0ATdOWWCvUN85rK7VI=;
        b=IdQvxHFBYeLPm6jvoN7IWLE8cBuA3g7jeOc/4BvVlHlq6VxGy4sxKNXuI3t+EHRWyk
         J8Z4DIjRZ4XcPDg9BJ9cSTQYGnai8TfchuijkdpghvE8VBb/0u5DQICC71levMT03GZv
         9GB/wZ7lylyx4/4dt0cz9+4fBEGjD0t5MQgbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mzL7+lfo0jgpxWVMdqWo9doOV0ATdOWWCvUN85rK7VI=;
        b=dOFJg2EYJBk8bCfjuRBB5tcJ3vcB7UDStJuutQiswSUlaJ1GgQYeyTMRXZ06lZxNN6
         kKwEZL8kCQtzf8DYU6x9ZPOGB4KO0R2h964umCT0tDoymmnY05N7VbW+yKdY0TEubqMT
         OLwK98xk9fmD4WV4zoV2Jj1GQ2cltJFRWW7dXkO/jNCLNdkoHZSGHjIYA4WwdKsNnYgu
         6swnpH5abnUxtjUXjSAD70r3tXiy6ETQuoQVxvYBCq49X4gKBD7w+Z2vaFCt9QTmVe2y
         hVw7ig2UFnSyHhMAAKB0aJ/SeuGnNu1UZpWzSqrkT+i5pARyBpFzmzEyAtHj72Y0aVub
         FALA==
X-Gm-Message-State: AOAM532mJ6a0Yz4We/KR0POC+s8/FA6ElvP523EE9BMYz30G8yc9Ga8C
        j8VYWMosGn84rz0T0HtehzUpRg==
X-Google-Smtp-Source: ABdhPJzprjQ8B9VzBx+H58+wlW4Y5N3kcETfQLTkFMAvI8As/kebf+R+AEyUhM3pM3n73PgphHiGAA==
X-Received: by 2002:a17:902:b7c8:b029:ed:2577:8dc3 with SMTP id v8-20020a170902b7c8b02900ed25778dc3mr665834plz.9.1620248947323;
        Wed, 05 May 2021 14:09:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q27sm142223pfl.41.2021.05.05.14.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:09:06 -0700 (PDT)
Date:   Wed, 5 May 2021 14:09:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, chao <chao@eero.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
Message-ID: <202105051409.6FDC4F9AD6@keescook>
References: <20210505174515.87565-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505174515.87565-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 06, 2021 at 02:45:15AM +0900, Masahiro Yamada wrote:
> <linux/kconfig.h> is included from all the kernel-space source files,
> including C, assembly, linker scripts. It is intended to contain a
> minimal set of macros to evaluate CONFIG options.
> 
> IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> should not be included from assembly files or linker scripts.
> 
> Also, <linux/kconfig.h> is no longer self-contained because NULL is
> defined in <linux/stddef.h>.
> 
> Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF(). PTF_IF()
> takes the general boolean expression instead of a CONFIG option
> so that it fits better in <linux/kernel.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
