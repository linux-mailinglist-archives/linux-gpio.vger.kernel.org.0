Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE8A216CF2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGGMiu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGMit (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:38:49 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262A7C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:38:49 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q7so36438737ljm.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALRzdTLy834Js6tTsVkyDFm5RYrKEAntVTYaxszaiDQ=;
        b=aLfGXKCbdw5RslyT1YhWet8LBrZh/bNQOtTk/PwK3iEuA6A5iJDWcvk1bkngR6dszE
         S17yZdv7HMYGw8iriZsrT/yS2o3URiwMkIbC68bx4k64nYHX1LTL3DAc0ovy67QinFHe
         Uy81/Joga+AfxTgbUzy21gDXBYdXYpTgwH7/5PnTVG39MfOI13n8Ajr/CE6o8bZE0+Im
         noIImb5Ap+OC5jGxyvqFPMgCGmp6IiuCKNXWJsN2AF3OTk6UwEf+z95mLA3tKx7I8VgR
         WmMAUvK+o57Vm/BemnxhxxeiymNsBmztfjhKRAwEhVrNM7EyxloVWpW/uxCs7cH/WEKg
         EW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALRzdTLy834Js6tTsVkyDFm5RYrKEAntVTYaxszaiDQ=;
        b=swJxhMcoEQFnbsEPj9aPkcGsHrmPItOaedLYY9z/A7NWXUnCgNJHumEkS8C4wZf8RD
         I3mC4c3fzDtuwVCJUOawv1NS7dxNsVFAuimBeIdEq2umLZowT0hboNwzmIyWOsCNkaBs
         Njl0OFVhXpO3xz/ECkaMvelVyDl9M4aU1Fx+8ibDyIeA8hfnXftZk+atH+mOSQtof7G0
         BnpgbqOkMqN2rxAj96C4cPfGic1p1SVOhLbJeKZ1tPWK1bZXfYViZJWc7gIDMZaJDPU3
         Ssj3qCqZiKfuER8wYDAqdSHRmLd3P8OPPkJWfFL4BvCv0FqFABp3kPOnKWGmRUA5/vpy
         /sAQ==
X-Gm-Message-State: AOAM531+UlJ2Al07nFe2euZ5Wxxpz5bY5hP+seJQIEHVtviO6pIS4l1x
        +L2TqaTH5GBGAHjizGlkwb1vARrSHpMHXB3aN+g1ramTBns=
X-Google-Smtp-Source: ABdhPJwxMSAmN1uyPf5LNJGh5vCr3v5HdzAsOO+vaOfhxHwx+Q4+PAvi5tR60rOLYyZ3HfYO4u2xvmlGWU2veYJflBk=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr14155071ljc.104.1594125527565;
 Tue, 07 Jul 2020 05:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200625002736.GA24954@x1>
In-Reply-To: <20200625002736.GA24954@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:38:36 +0200
Message-ID: <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 2:27 AM Drew Fustini <drew@beagleboard.org> wrote:

> Tony and Linus -
>
> I'm hoping you could give me some feedback on this approach. My goal is
> to allow a userspace library (like libgpiod) to be able to set pull-up
> and pull-downs on the AM3358.

I'm lost on any pinctrl-single specifics, sorry... Generic questions about
pinctrl I can maybe answer.

Yours,
Linus Walleij
