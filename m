Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76491286053
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 15:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgJGNjI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 09:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 09:39:07 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62453C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 06:39:07 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h6so2340531lfj.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6q9aYjSyTuS6dVvXSKNCFBRSmK/W1vI2grPzL0Jy+c=;
        b=lL68wbUGdoFGOtkZ4uo0nIVUKjQVDAqf/wVRSTOKctQXT3PYmetA/ZjpRR08vVQUTP
         HmJEPH00xx44oQWQ00rxHJAcTl6Iv7TkFwi/5zChDBOHFJx8lfpr1o45KFg425gxcu1L
         bT8Yq7bwwUIiw6NTEAdCd4rRyWEhcZshUS/nkrW7oo8kQnQeGvD3w4JnyTi/CFt0Qzq5
         H9UAmVJtWv7TmKdK/woH1oVH6ZWUBBBSHSRJtDIhsQzgOJAp9O1QF3C0qIiW4+XtaZR0
         Vy+ZuwkDax6vISAdadFxgRwgUQz0nXS8atnHeafMBeyf4N0/s0c+yR3v6rfTDXlE/62G
         Xibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6q9aYjSyTuS6dVvXSKNCFBRSmK/W1vI2grPzL0Jy+c=;
        b=YlBblrwLfxumXfgLLLot1O2doM0404iOOUJ6E01Ez4x9TSVtTvZyrPGh/oTSn1wt0c
         Q1TQrCRhcFMUjshw5VXlZVgtyx3g4bcHU7wnAH7GHlstJh9KYOJdIOQdL63vclHwOQ4u
         FeDzry88tMCr9s+aRPsy2EYl9d7YQTNVP8mJ9V6rq5iYS46h0L1Oss85QOnl+YoXlg8G
         pR5QFb41jLDfRoWSj0C4R1B5TYVGCIBDzq63kGGn5Y4DU4tJ5JTnCKscZOLBEe8hzXEU
         HSArpPHcfVKFckMtNKQsNsJXvAiWgfnhdrYJ9ciMrysXCFJkMUwI5lh62KCwRiylUxMD
         HFnQ==
X-Gm-Message-State: AOAM530Uwt4NXjHD9NNYL7ZyotAQcGs3UN0V90Gv6kIwZOkfwxILAK11
        5O0aVs3ZZ8Ie6G1j47AAotoTP3TZz0cbYy+De7Wj4A==
X-Google-Smtp-Source: ABdhPJz0PQCgiTiJKmsFBfz2nlcLvW+qKpaLH58qY2CgMcCuDWaSD8etmtyuqHAkyqbUEdJN3nLgnRdo/e5RMJx/ZnQ=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr894998lfb.585.1602077945846;
 Wed, 07 Oct 2020 06:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201007111220.744348-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20201007111220.744348-1-Shyam-sundar.S-k@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 15:38:54 +0200
Message-ID: <CACRpkdZHbmKUx4=FYZSiCNHsUV-JE7aCWuG-ZFYqabRkTujLBg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add missing pins to the pin group list
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Akshu.Agrawal@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 1:12 PM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:

> Some of the pins were not exposed in the initial driver or kept as
> reserved. Exposing all of them now.
>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Patch applied! Thanks for improving the AMD driver.

Would you consider assigning yourself as maintainer of this driver
in the MAINTAINERS file if your job at AMD entails maintaining
this? Would be much appreciated, thanks.

Yours,
Linus Walleij
