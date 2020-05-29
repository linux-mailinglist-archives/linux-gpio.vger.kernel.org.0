Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F121E7C89
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 14:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgE2MDX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2MDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 08:03:23 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94265C08C5C6
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 05:03:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v16so2269923ljc.8
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vMjA6Hc6hIkjRiWvhUjavzLBkHkAuzzyci/4r7aQoVk=;
        b=umjUHv6R2CawC/x8CK1YWG842nEbfESWDzVn4wynfcxQiqp2Q3I1itUDOHZm3Ck+aD
         YMigjJO1hnK2CAYw8q8EqCT1vjroZhOJa2EDHaBBGbBmIVZVHkcx1xh+jAlt8r8JmGJM
         rNmlsfppdQUegjlqgT0FdfIznCsXzNP/zxSZH5dhD8I+ooNC8KQMzTdL7dcmVgJwEsJe
         TUjZIjEQqHMvBPVmBG+gDACW5JtnwFdYgsol5U9qBNriVSvtEdq7mqfVQ0wF8p+8bPhd
         uKR6/DzejltvtRgxS0ppXkaIfmk5XHHV590gOCb2jt/bQ1774bWQFmxXk6553R8lIpOh
         Eb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vMjA6Hc6hIkjRiWvhUjavzLBkHkAuzzyci/4r7aQoVk=;
        b=ucLGNfuMNArzkCsUZdbHkmoykV8WTFJqQ6gHLaS4+t+sZ39V+ZEs/9DbeIeeXj1uTd
         oemURNeQLzxjjqBOeuT8ks98ZgFIeow7nGtU7crKUbvsSRhUZSgS0MnUABgvSVQJVds3
         mf0UxxfzjK8ZnfviHUdk1PACgitUqgc/55czCvQz+8d9Dcb895Se0Wx61/UVNzxxhZPt
         oPH6tGh0X5dcWEWw9NGTVCbgOHRAKHgk/xijg2stgptwtW9QoG3tIlsxqsHIeZHo2tYx
         Gzoxi6VCFA1nat51Ay0I0fksZI287L1CPuhSktbUVEkHt+SJKz4RGlg+ZgW0bNGxe6ED
         BX9w==
X-Gm-Message-State: AOAM533P8kBjRxk0gZ7RYaJ/MSJC0oB2M7XHuYIbdJWU/+0yJ2G6kzHH
        bHIdm3wU8+1Sxv38RlHxCyYamDjTs0CN6PGqurMu8g==
X-Google-Smtp-Source: ABdhPJzcdJjznkl3ebRjgq34cvBkCJmbArDdFm8nniaXEliCWmaQ8v1EHQypI9vMuWe9/3pkJtFxUFFwEI3CsFS5iOk=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr4256021lji.293.1590753799633;
 Fri, 29 May 2020 05:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200527140758.162280-1-linus.walleij@linaro.org>
 <79d89e93-4e40-089c-606d-e7787013bc80@xs4all.nl> <3965eb9a-d3ea-2844-68a1-57f88ff9f8b4@xs4all.nl>
In-Reply-To: <3965eb9a-d3ea-2844-68a1-57f88ff9f8b4@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 May 2020 14:03:08 +0200
Message-ID: <CACRpkdZpVr0O7tn7iqMkuzWo7mL5MtPBJkhPca8go8NwGjKNiA@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix locking open drain IRQ lines
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 29, 2020 at 1:06 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Close, but no cigar. I didn't check the kernel log and I now see this warning:

Oups.

> The fix seems to be to just add this change to the patch:
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks a lot Hans, I folded your fix into my fix.

Yours,
Linus Walleij
