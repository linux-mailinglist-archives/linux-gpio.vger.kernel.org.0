Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFF442CF2A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJMXZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhJMXZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:25:38 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146D6C061570
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:23:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y30so301386edi.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfaQfeP9FyjtdQpkWhju+caqJV4V55dH7RrdtRGiP90=;
        b=GGDMPIaDDL4uqr98E+pOJttqc++kVXNSJSUwsX45D1Hf53QI1QXATvTazQLjARIfQr
         JD48o6lTDVZOzVzxl5JLCdtff5M8jJfHESkMaufh/YnclA9BmQlT86Imaf8snrrd5uGX
         HCXtFADJ2j8sCgxgkmfxB0MASxHeYSCCIG+XTLPeN2Ix/zHFIF+FmuBTmMriBItSCAdt
         PqRdNjZOxmD1mPelSZiHHStX5wjmjIYeXq+plt2IV1ZLP/svlsc35MnsslrgjWRI34mF
         BbwGWry+iaTiVllGR8k26gdk/TdQ1SWgLpyyhT9t+Udx6KhVRDXpa9g0XAIpdd5WYgmW
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfaQfeP9FyjtdQpkWhju+caqJV4V55dH7RrdtRGiP90=;
        b=1Kif4Cl/riL0Mnx9RecITM9R+Le92mGuDugmQ/7TFkg+ltJVl1hDHRrndwEYZRy4Ge
         RfoxABU9H1juhA1vl1DVBtipzUch6yspij/7a6rL03ew4LIoSgnshrXVViaxkvd/5fft
         LgSkEy5oliSxWO7EVgkgqRHVuwPz/ps6vjUN3E6AilI8XX5iuzYBD5Yiu6tIjIf6mYzj
         F7wmGFHqmUOgqv87iKLc9JwreV9mLwm6LS1L9wmdGBeaIAVWGxEJdCjFpEM5NZ8TrBi/
         mQ9c6n0iUnd64R5cszcxQHO3XsP/wnsyaU+Q/qpWOGeKOXx04ynRsFykSAu4tR/nKqXC
         TwJA==
X-Gm-Message-State: AOAM533WG0Yxc0o5wDMixeCS3jmDgl8Ge9n7OpRJC5aaz3u4XE3chgT3
        PZrVfPC9cGgnnQjawbGfduROmviCiD3P1w59DXzKcefg5j0=
X-Google-Smtp-Source: ABdhPJyb4EQyAssBZkG/fq50rqb04Cr1hgzGxM8N1INwCj41M1FhNEGxd/CU22qvPpQ50ckvRPelpTGsyw/66+L5WGw=
X-Received: by 2002:a17:906:5e52:: with SMTP id b18mr2635931eju.560.1634167412696;
 Wed, 13 Oct 2021 16:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <1633879405-11658-1-git-send-email-dhu@hodcarrier.org>
In-Reply-To: <1633879405-11658-1-git-send-email-dhu@hodcarrier.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:23:21 +0200
Message-ID: <CACRpkdahoq+g+m9SOGRRZ4bsZs2AufjGHeaVSoOiTZDTZzB1zg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: gemini: fix typos
To:     dhu@hodcarrier.org
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 10, 2021 at 5:23 PM <dhu@hodcarrier.org> wrote:

> From: Du Huanpeng <dhu@hodcarrier.org>
>
> Signed-off-by: Du Huanpeng <dhu@hodcarrier.org>

Patch applied.

Yours,
Linus Walleij
