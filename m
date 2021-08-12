Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436813EA45A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 14:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhHLMOZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 08:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhHLMOZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 08:14:25 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A383C061765
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 05:13:59 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id n6so10212080ljp.9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGgVa5hBrqs0ojtg42ufhr1RsUwE9AQt752t5H2QUXc=;
        b=HK/mNAIPErKGTyY1+mnVojWRmKAOEEA6t/G4VqTFtt3+7UwSAzYiHLsG4szARhaFBu
         KZHt7KcTpW6Wn8cjUKoe50wHDN383daMR3iD+egE1SCUp34JVvv5TfKHm2xYE2dVjH9G
         jkOPYaT9RgevNi8fYHKqskycSN+dr9BcSOsFC8eZjEI78TTRk71ltkgsjV324yzTZFwY
         0SFvXQLdnoWd1Z9w8VkC6c6ntNa1BMtoYww3kLG9Q+L+/IwqcVRTRZILROjCJZouW0/6
         Nv+bT47k6/XtdqdIulBIbWBCGASvWHKhpz/1caP2QTVxOMcDkRpCPVkCIkfFZMqqQL0e
         6bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGgVa5hBrqs0ojtg42ufhr1RsUwE9AQt752t5H2QUXc=;
        b=c1qR+x+GD/zxFm6YIL6mKGyYD2stALhzmodhE4UTqmXNzOUgEP7uEpJykq9UQsNDMQ
         vDWUV9+c22AwFK6OeraHpRuOsjskduSpHULVzc7VQpLe//83UeM51jrME7jTc+bkVhdG
         xebLPJkk9I8mEalK6O9DyLdpil+cuWoj5UHAcXeR20PduLfm7jdZq7g373rI15W0NoF6
         5EPzUrZtr5/Pd1NKMm9gTJnzjBXSlz8wJpX6mLJ3ib5JW6PbMwMOdoYASYPmg4iO6sAy
         DFevR9vQ16b5N/ZZTR5o35k3/PChuXrJLHOcYTyXXH91MkcMakcSVW5wu8KyMRLUPTav
         Rv3w==
X-Gm-Message-State: AOAM530uijJ+Yuopa70SPv3MTNGnNdC5WeHZ4hdaHNB0Y1wGzDfDwjJk
        Xs58yVmJCko0RQ/gN/d9QwTZAmzkHDzQ+9wl0gmuOw==
X-Google-Smtp-Source: ABdhPJwoSjLHnk00y/X2ONZ3VQCPRrNi9vvV+j9IowLaMGq7wa7dGaSNQn/hEtwwYh8UVycG78YXbnw1s1pjKMIdjiM=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr11325lja.200.1628770437657;
 Thu, 12 Aug 2021 05:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210812115322.765379-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20210812115322.765379-1-Shyam-sundar.S-k@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Aug 2021 14:13:46 +0200
Message-ID: <CACRpkdavfJF=r4a8j9Lw4NkYTMwQYPgP7KadxHGpEDKYJyO+OA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add maintainers for amd-pinctrl driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 1:53 PM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:

> Adding Basavaraj and myself to the maintainers list for amd-pinctrl
> driver.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks a lot! Very nice to have official maintenance for this driver!

Yours,
Linus Walleij
