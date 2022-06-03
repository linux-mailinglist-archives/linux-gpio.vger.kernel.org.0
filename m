Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EE553C834
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 12:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239061AbiFCKNd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 06:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbiFCKNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 06:13:31 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36133B283
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 03:13:30 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id z186so12910497ybz.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=cWnKkwPusG0TKPrwdSeL9GfiK9qV2jq8XHQI841ZQi14sBambMQZLS563NvaLZElf2
         75115UwtrmhkAHVhZHmiunsBxqODjE2sgZG5RZUUttFd/XjwT9ELF81y1MF+VjPTBsXy
         Ecc+OxP4Ug9Nkq1KWYx7PsS/8LdlHSvr8pmzuBVF4JJSNw/zCKM/57awLBnHtRJH+URJ
         ivbdaF8SKbVQFRj++AP6rq74w+ppYkrOD3IrIlaZnu3m6qTtGWAs0bfx8BngaVgPvKTf
         vdUOkox69Qac8HsvfBibu1f9UhbH8lmh5VamMeFlCaOhbP7O16w6ZyMfyL8EpGm81ssR
         AiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=VWWBU90E4MBLiVnGN7dxCPZba0VN5o+pL7R1GUoexuD4G5idXePIJOfpmItqWMURIn
         85KafLNSTSV89atss/oByL6KMH/EmLXUIwhcOzdjsqwDzP+VPpX532gNXPy5BkSNciuN
         Iq8EHgrgJyD1zH5DKlqQYmh2iPEPeR+px/5nzXoypM3EPIcTmP+/X6c7Nf+I4n3lhEb/
         HroDQoLLpO8KzL7wth1YJe7MXOe1Bldm7wWVrcd7JCvh8UTP/7uKQrwRghLZTsy8Aoav
         OIAVFjVMMrzPHN8x87IegGFkg1d2eN6s0niW0iqinyC+Io3pJHUH7RGw8LB8dD9ilTTz
         yaTw==
X-Gm-Message-State: AOAM53061lx9ka+N7itZ9wHMCn4D6qhNyZoV8tmwG3qck6Hx01tiFnTv
        MngFAaJUha6WtG6h5QzY0bTerpsZkwiiJpAatwkNVQ==
X-Google-Smtp-Source: ABdhPJw/KRcAuBS5Qsp7lOCZIpBhbUKTpsBgops20ECaxi3YO08dKdMkgM9KLeB4ACdlmuIwzLo5Lgpc34BZ5v0Gd3Y=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr10098240ybp.492.1654251210044; Fri, 03
 Jun 2022 03:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Jun 2022 12:13:18 +0200
Message-ID: <CACRpkdZPZ5fNxt3=LCT4YRcnH5wNw+i50dde_eQGynzK0FCXFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
To:     Haowen Bai <baihaowen@meizu.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 21, 2022 at 4:28 AM Haowen Bai <baihaowen@meizu.com> wrote:

> pdesc could be null but still dereference pdesc->name and it will lead to
> a null pointer access. So we move a null check before dereference.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Patch applied, sorry for missing it!

Yours,
Linus Walleij
