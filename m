Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED3148FA0C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbiAPAwz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiAPAwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:52:55 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124E7C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:52:55 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id z25-20020a0568301db900b005946f536d85so6004492oti.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vtwpHgqc8n1MzEYhRLM1BGDi9+kKITvPm6Of9j/5+PA=;
        b=mWwI/UAQdKwFt/SREpEk5bv5aYb7Q3d6UfTKou1MBe2kPk+pGB9IKvl6fFuYtdsDvo
         WMD3bqaI/6If3oo0pKnXUNYXP8Q5OlT5u5ihgUenx4C4lBEOer60i9UGlzPxRcgEE01X
         DJXrNx2H02zKqvsw9J9MOs8lAqb98hQdMm7OYdJfpyXw4+yIH/poW7oTQ8geUEUnZzb+
         +LCOFgz0WudpN8Vi1VkfWSsyYCFz3Sq9lKzdF3XzBFHU2uz90pDLAnE1O3Z46PEF56gC
         +bFup1CQPS92TY3pcLUQDGiGHgJxRt7HNIwKGy98py7pcyexYc4ZICnfNP1SRm++9M+K
         Wflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vtwpHgqc8n1MzEYhRLM1BGDi9+kKITvPm6Of9j/5+PA=;
        b=EuWc1v6qQptC1n5Z5qJGP/RorFBgEro6u7oZ3hVX7wZ47eUYAbG4GVsHRaPKHhMm6p
         KtxkUw47HzlteEbmIPPVpTtce/pGcPCbO8QxT0TtnIYxQ9WZ4AtzrXz+y3gabh4GmHhN
         qiG3zevDwYeuNQMHy6Vpzg0ZOxaPqHXSaz0vJ7z/PBw8vXRsXoITEkMCJfEQZrh3FX//
         F2LDF1wsq8rsKW1ZQbpEicPf9VQiswJ7L6MX/EXgv409PMor/gK728XK1RCZT9APwVk+
         9KWvPD0FqwyKyNugGz3jgExYSfrAkTRhrFm9OBts7wx0tGHu3CDJ2LiQmH9DDiotAo0p
         /W5Q==
X-Gm-Message-State: AOAM530tj8ENBeMNE8UYyl2x3RnVq74l4DBwmrN6BmKQrPSXQ2Rz8tDk
        UWVoHzB600wVDbbhrqRV+otQ7SL4GeBaFC7S4CJNyA==
X-Google-Smtp-Source: ABdhPJys0FNc5YdZQKQrBTGsLn/N7nkHC5Fv4IeYxfSs68Xhltz4tSyT0Euw9O3EsGLD+jRHnx0/Vh0KNpV969a70Hc=
X-Received: by 2002:a9d:465:: with SMTP id 92mr11687403otc.35.1642294374442;
 Sat, 15 Jan 2022 16:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20220111172919.6567-1-zajec5@gmail.com>
In-Reply-To: <20220111172919.6567-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:52:43 +0100
Message-ID: <CACRpkdYbR-hpLTcvN1_LuxEH_mgHLqDmopDqo1ddui9o8ZvSPQ@mail.gmail.com>
Subject: Re: [PATCH 5.17 1/2] pinctrl: thunderbay: comment process of building
 functions a bit
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 6:29 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This should make code a bit easier to follow. While at it use some "for"
> loops to simplify array iteration loops.
>
> Ref: 5d0674999cc5 ("pinctrl: keembay: comment process of building functio=
ns a bit")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patches applied!

Yours,
Linus Walleij
