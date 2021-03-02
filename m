Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCA632ACE4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383748AbhCBVRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377972AbhCBIqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 03:46:04 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66083C061794
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 00:36:13 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id l12so24101599edt.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 00:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPEd3ZWOrDPdJsgpae0YrRdxIn9JORoOxr1+HhQ4nsQ=;
        b=YP5OR8dqN/jG7rmEVnDIoEVcFqLwM6RLa8I2TgZ7OyhAk3kKbCUzALhYWDZECgBFVq
         aqsHXXwlWW12fIyk/8AarK51wyYTVSALKsOGoy9yB9VLDl4dsrS5M47OxX7WCTNUzf2M
         aQ2tsaoY9zVFjT2Ilpbo+HDU6YxUQj//eFvfkuh9q1BUOkuRs/uqPFCv97gX5IepGCQi
         Gx5MmYiSu5DooNg6uzceOLJaUtPVkFEiNaXthVHOyXDpTfSX2bHjhp6K1aP+6tpCGZqb
         Wiix9ho6dyHmeujZasdYsNLmSQwer4C1+tSapg+g8LW5Uaf5s1wIyvGZAO0yjj9UKsoQ
         Qndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPEd3ZWOrDPdJsgpae0YrRdxIn9JORoOxr1+HhQ4nsQ=;
        b=KQFFFwndF+NTXeT3fG5dTWjkXBizvUFCiZwsUR9QyokvCnJJf9M9X3PEoYN0vdGrVx
         RuCG0MSHuIJkMPd/tWOt8jSmXKyyiMx9So8278fJ9ztf4tG3PrbnFKW2D0TESUAWRak2
         M8UvGqLgmgbguC9Dhf5sjZ7dOnNIxIKQ7Uy1A3qPCDltcRUDRjJ2KjhXwA03qEVR7n/R
         JSLtrV8QWAUk+2VNkoxfCmCAlLdGF5he3F6eCL9tkhyufRR7oOx95ehVykSWOXWxC5EB
         1R5qIjCOaGntMipzNYzXaFOU3Ss16NDKYGD/wFQSvjMyrc/GP0vkirIAAuS0qR3dO5sY
         GJYA==
X-Gm-Message-State: AOAM531ETBqynE0HaJG1ScKh/odHO35IcrQBuQAd+re4I40Kr8NsKtqy
        +cbI2RVwnveo3+1E4Emgxi26hQ1DjUR6Fu4rSwCKNQ==
X-Google-Smtp-Source: ABdhPJx/bIxnUCaiO4mcXpkxxeCw7G9Tjsy5WYLNgO6oYK3hHdtHN4D7xyPKg5cGGEnq2EQMIZCFEmBauhr2OqioNbM=
X-Received: by 2002:a05:6402:382:: with SMTP id o2mr5274208edv.238.1614674172145;
 Tue, 02 Mar 2021 00:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20210212223015.727608-1-drew@beagleboard.org> <20210212223015.727608-2-drew@beagleboard.org>
In-Reply-To: <20210212223015.727608-2-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 09:36:01 +0100
Message-ID: <CACRpkdb1-OqZU93nMD+iztPOfLEn3-j+-=uTEo+zbE2TmezmLQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs files
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 11:30 PM Drew Fustini <drew@beagleboard.org> wrote:

> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
>
> Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> in fs/debugfs/inode.c
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
