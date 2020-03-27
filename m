Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234D6196069
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgC0V2d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:28:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33843 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbgC0V2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:28:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id e7so9085206lfq.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AKs2wUFl9mGzanJxstXyv3eIv3rgDvp5GN7P4hoUxzU=;
        b=bXvaM7O2ssMqHhYhwo6oK1Jw53UiTWSKEt1XglHA8CnPQ1fyd+ZI62/7aMfqESwZTe
         Xi/NInkuT/diSkGzzsziGL/kvqGwV/x5KpPlSLyI9EqIwJ7On3chcc4GlbVTgUzk3miE
         2r1OaW9CDcCesVopTtnBJ0O+A4i8bd9Vxnj7VEoss22QmJJ0KqWCw5zyIZsh2Qn4WD+z
         OwMCNsUjsbIrUpQLan32VNbK5Kih8QTdImTcN1PKw8nhsjgqa2sDUptAtKtwcclxQ5Sh
         2WXwSYmX4x7jr3wqpzvmb3Ma8eT5hVWACOCLyGLznxWB2t/W7oOPPXl/+5Y2Wsy12XlI
         N9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AKs2wUFl9mGzanJxstXyv3eIv3rgDvp5GN7P4hoUxzU=;
        b=oqHMM3bWLf8FxzcuPMJnP8N0y1nrviWfOzeKgVwkj7wG00A7FomRpNl51MHCNxoaUE
         BtDa6kejQbqw62ByrVYtbrai+Htlzw8jzgV1NW5Q7PI5gkBQbQv+TrkQ1PzBoDcg6DYm
         1iCIhsSA6l+Sxzf7A44mwIir+/wpcwxWgtSsHSfsDJcnZBLiNcVJSWSX1jZ/9V54MJXr
         AaH/FcLbliaMPi+h2IRSB5pjeVLBhX+Xg3/cvCM+kQUKUiNYdF49pffEqMYRAUWbVxO/
         MVsxVRSy+9wrjWwLIlfCRLkePw4v1HEAp/UZT0VfieNAy3XuXIrmxJa7EAhiXbLAmgmC
         0Duw==
X-Gm-Message-State: AGi0Pua7vdtwUvuSC/sygaLUT2HAdtnn6AATNcNdM9bBS6YdlCnPF4jb
        T3e/Hnu1A66ramGj/5CpD1IYC4G36abZh+OopbYAmA==
X-Google-Smtp-Source: APiQypKqfkkJWo0LyofqKXzbQiZeKqIvwRaDCBJui4ScAZ7ROxscEufS43eqyhCR13YrShZVlst0oCy4cgAUK1mRC50=
X-Received: by 2002:a19:6502:: with SMTP id z2mr763585lfb.47.1585344509130;
 Fri, 27 Mar 2020 14:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200325103154.32235-1-anssi.hannula@bitwise.fi>
In-Reply-To: <20200325103154.32235-1-anssi.hannula@bitwise.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:28:17 +0100
Message-ID: <CACRpkdafCsx+Q+L0q2j-=Q-5PY3yJx=JCmhPmDiDkt6p3YK2RA@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: Fix out-of-tree build regression
To:     Anssi Hannula <anssi.hannula@bitwise.fi>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 11:33 AM Anssi Hannula <anssi.hannula@bitwise.fi> wrote:

> Commit 0161a94e2d1c7 ("tools: gpio: Correctly add make dependencies for
> gpio_utils") added a make rule for gpio-utils-in.o but used $(output)
> instead of the correct $(OUTPUT) for the output directory, breaking
> out-of-tree build (O=xx) with the following error:
>
>   No rule to make target 'out/tools/gpio/gpio-utils-in.o', needed by 'out/tools/gpio/lsgpio-in.o'.  Stop.
>
> Fix that.
>
> Fixes: 0161a94e2d1c ("tools: gpio: Correctly add make dependencies for gpio_utils")
> Cc: <stable@vger.kernel.org>
> Cc: Laura Abbott <labbott@redhat.com>
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Patch applied with Bartosz' review tag.

Yours,
Linus Walleij
