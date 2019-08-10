Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97D288A08
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfHJIcD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:32:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42694 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfHJIcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:32:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id s19so8502787lfb.9
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVHoD/kFYG2+UKWyfR9Vz4jg8lLzKuoZVZM/VErCL8E=;
        b=Goy+1fh1bV3JbOPmD7gfeGw8Pplhqu/VgLRSSwuu3/OCtZ7lCDjYAKEt6SmsMIL4+m
         7snSUOSn3Igv+Bh9uN2NDvgCwwpGIr95+t1b7FHoMSG/KVEKw3uaZEQyYt0Sw12CZims
         Gs/i3TIV0zOBLQjI+uIx4rOFg1rglgnVfVe3VXJY2wO/vOv97sLTt6oKPDMlkie7+LCx
         XW/BNRpSp7F5+Q+XnlVceamffP7LlFnNtuG3CN6B9GTKG3VEd9y4rKZt397gK83ycuV7
         MVRP662N8F/INq+TdYktgAy71fNps9sL/e7liwlVgAl/WoC5DWLbOsio9zLr5qluhtzT
         +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVHoD/kFYG2+UKWyfR9Vz4jg8lLzKuoZVZM/VErCL8E=;
        b=b3QAbzpQAAIdIXR9mW8/ABMevUGKjWDjX/EOX0Nme5H1hxDkODPN5rQn4B5gKKEUnA
         wemtKURmlqwzHqie2Ai5pY4OQVei5cmCZkoOd47No7xeXepin4Wfb2l2eszgJuiVX2rZ
         qmrWEgt1pUc2BSyWEn7pfEj+4pHiNKgnd4TYinHyaTDs8DjPwHProuwx98hrk8OPekFm
         qmmoyGCnuRD0sG8pODn9NLUNrgbWyP7OkI4Dg9ezIFCP/19bMtQgO8tYLzyouMd9xAvx
         +d/vpTek/s7nX/LlqZUUb+6SXZtedatdF08QZoah6OoKsa73CnLcbh+jliNO7T+6/Zss
         UGtA==
X-Gm-Message-State: APjAAAXMdwmirhlulbNF2uabJ7hSyKFCZiIygCHVQFbw4voOo/RAbJmR
        C2f4WlWUgq9+IqRfzSZcH3C7Y3nNKf+CewS7QKZW7KIHahQ=
X-Google-Smtp-Source: APXvYqySUS5WDap6akhFSliYjDaWYZFixsK7mUC4osTLggtfhjnYzwKKRmx57CnB44C1+CD1hV7/vrs0/ZGAXQRE5Uc=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr15392081lfp.61.1565425920681;
 Sat, 10 Aug 2019 01:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074420.27006-1-geert+renesas@glider.be>
In-Reply-To: <20190809074420.27006-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:31:49 +0200
Message-ID: <CACRpkdY4hZ3kUMs6n-kway=rbp1bocpLsJ1qMAe64oC32NZA1w@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 9, 2019 at 9:44 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.4-tag1
>
> for you to fetch changes up to 625efea83a7c37d281c6a90526813a1366929d24:
>
>   pinctrl: rza1: Use devm_platform_ioremap_resource() helper (2019-08-09 09:34:45 +0200)

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
