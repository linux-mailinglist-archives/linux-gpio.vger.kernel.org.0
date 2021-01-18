Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EA02FA90D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 19:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390648AbhARSl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 13:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390664AbhARLlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 06:41:04 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C855C061573
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 03:40:23 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id c6so10074701ede.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 03:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vshsWQBeiwB139OpCVXk4pgxSbBBXSNBeuPsbbzJ++E=;
        b=GSigEZgtUTyPg7nYSNWcWogkL7R1PhBOgF7ERfMC5MlWKkT5mKXXwDgD4UxRKBQwE/
         NvbmEKRywy2OuZ0CLIX7+dlxq9ecxUsql2IGzhiQJMC1Sw8lkPS6HchVrBnJcwPv16Zh
         O9FPLJDSGaul6QIR/MP40tS0N5JFnxWqHGv2v1oJFRxr5oxZI1DdQaDTGUoUyRBOUEjJ
         MgEc8FMkgedpKu2FBRLvvs+br/75fu1PKO+BtvRW0Y5J3pWynthOV0IHvx4r/+Gir1P2
         GtfdtGpZA4rhZq2Di0mAviE4v4IgmyXielvdQo5+JLdlmvViayAXrxjN8a3lYhUmGcZh
         fRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vshsWQBeiwB139OpCVXk4pgxSbBBXSNBeuPsbbzJ++E=;
        b=PdDS9o3q7pGhQkh6+VsqWY3sgHHFPEDiEIfHXDqxv4rYuNjwxnc94hp8Trnei/QTYX
         SgRk6fuAXdaHPiVciBitYJZs6hS6nIdfkHXNcEwOiVOrVW/WZaoR9AH9HbfdCekZp3lq
         FmwSfut5c2Uf3hb2lOUh1a8M4taQYeJiZ305eeezvrBrAIw3mGwZsKYNv+xB3uKtSX0T
         zsf6369PHfp1NFrycTKWutePOk+R+hljZcckxTFHXJEHXjgFztf6GtVsf5LI/2h4Pbfn
         5GAJpIJBasNgNVsaWXn7486weVlvetaTXkCoRlK9SQ/wdOF0V4WUx/98pPAbl//hNczg
         Y78g==
X-Gm-Message-State: AOAM532iGbj3P67ba7Dj+rbzYYyDat26EbQ1EjS/q00RmmK64qVZ5JXQ
        BeACGRn4PZAnsS3P4hDEpzF0eHTFHpL8jB299Al2LfXtMdpHfw==
X-Google-Smtp-Source: ABdhPJysiEsC+J6d/t5i09biKSNmqHAly6hQMnGCGoBmVDXB4djchwtWMzJITe2dPRs8tqbWEoMQTjLNU9zv6Y2Ewk8=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr18530054eds.134.1610970022033;
 Mon, 18 Jan 2021 03:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20210115103018.27704-1-brgl@bgdev.pl> <20210115103018.27704-4-brgl@bgdev.pl>
 <20210118000738.GB6841@sol>
In-Reply-To: <20210118000738.GB6841@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Jan 2021 12:40:11 +0100
Message-ID: <CAMRc=MeD3r0Z50kn8_ZW9PXi+=yf-fHYAHL_KYXoY-DXDUYHMQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/7] treewide: rename BIAS_AS_IS to BIAS_UNKNOWN
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 1:07 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 11:30:14AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > When inspecting the current bias setting of a GPIO line, the AS_IS name
> > of one of the possible values really means that the kernel uAPI can't
> > determine the bias setting because it didn't set it itself. In this case
> > it's better to change the name to BIAS_UNKNOWN to reflect that.
> >
>
> Your checkin comment incorporates some of my review comments, which were
> actually a bit sloppy.  While I didn't bother to correct myself for that
> email, I'd rather the checkin comment be more precise.
>
> Specifically, I was conflating gpiolib and the cdev uAPI.  If the bias
> is set via gpiolib then the uAPI will report it correctly.  If it is set
> otherwise then the setting is unknown to gpiolib and therefore the uAPI.
>
> And I'm not sure if the DT example that I used in that email was a good
> one. But say the hardware initialises with pull-up enabled.  If it hasn't
> also been set via gpiolib then it will be reported as unknown.
>

Which makes me wonder whether we shouldn't add a get_config() callback
to drivers in gpiolib for that because some controllers allow you to
query their current settings.

---
When inspecting the current bias setting of a GPIO line, the AS_IS name
of one of the possible values really means that the kernel GPIO subsystem
can't determine the bias setting because it didn't set it itself (e.g. the
hardware may have internally initialized pull-up or pull-down resistors).
In this case it's better to change the name to BIAS_UNKNOWN to reflect that.
---

Does this sound good?

Bartosz
