Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663A52ECC7E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 10:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbhAGJO2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 04:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbhAGJO1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 04:14:27 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5361BC0612F5
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 01:13:47 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o19so13033091lfo.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 01:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vU8pNhtRQ1PvNAVWChOm8UC6bNblaWRI/tkvRQJA1Hs=;
        b=yDKqYoWjr+HwSSLYKN/4M7oMI+yy0pg7sciZaNk3ykNF7uyJPjIbRilipDrpWvHmYn
         GgOjdaxGgbMuz3G5xZ4Ec10J/1vU0831y3jBF6CGmhwqWoHR/aRjOiAmmlWIM3OrrBZs
         C7+HzPWFdH4RtUksuoaBnY9SiWThIr9y+YGHR+rUvxxuTcA3PS8rgckFPoUOqsYmDMef
         3YOo2AkQ/g1paNbjmlmh6qVGD0WyBQzhT0SVkSQ/AlGJ9U6T+osd6ayyLrubyG1Q4Llv
         vPCpFvs6TlgDhaEDGUwFh3eiDf16/Qx99w2wFYKOitA0DDURzy9TAErmsTG/wKdTusuw
         n5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vU8pNhtRQ1PvNAVWChOm8UC6bNblaWRI/tkvRQJA1Hs=;
        b=isM0gqdnJ4hKLhs5nGxz8QYpg2MbtUotidhZ4VtM/LbFiBjspBJahAk3tVELnURFnU
         9M3skAgLz094PTDDufZwDXK6czuqk3PIIOIEG9T7EJiysY7paoEXCG5OhcDfK0GxU7ws
         J4kg5PONvsN9AGANokOqUR0v/h1wXutBppM3cQ/E+LlS7T3A/r0AAUNW2Unx7d2RqjCp
         qQIpCoFF2aauIc/5OSUMv5SV3Yt7tYrP4TxVLCL+3WQB79tblMsvAw7yY8C22U3uH3Tj
         1+RRpmyQBslBLzJKYb1z+53JoP9DjOqHxvZX455qXLkpamTDp06JoOOQl6LiPpRuf+Gq
         uiUQ==
X-Gm-Message-State: AOAM532ZZqQH90DzJyomUKeF699usWjGcyxQW4gYP+/X22wo9B8kTI4r
        BHXZR7LB0Igwuks2gbxEma/ty0T1ZApavjxV5ugIPg==
X-Google-Smtp-Source: ABdhPJxVAq31BopMDztrxGameILb2eovFh3jbpUD9aZxX8MzBmth+b4fgTbNxq/LjkGjmWt3W+tYi2C7VWDkal6MjYw=
X-Received: by 2002:a19:495d:: with SMTP id l29mr3396987lfj.465.1610010825879;
 Thu, 07 Jan 2021 01:13:45 -0800 (PST)
MIME-Version: 1.0
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com> <1609936000-28378-2-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1609936000-28378-2-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 10:13:35 +0100
Message-ID: <CACRpkdZk0xaLVWHwE3CgT7LWva2gs2vfeVSQy+PNkaW1m_uS7Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] gpio: gpio-xilinx: Simplify with dev_err_probe()
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe(). Less code and also it prints the error value.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
