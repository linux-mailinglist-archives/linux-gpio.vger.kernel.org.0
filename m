Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999B135D4C2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 03:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244534AbhDMBXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 21:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244453AbhDMBXi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 21:23:38 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC2DC061756
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 18:23:19 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so9542809otf.12
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 18:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=897BjAOv+b6gjmVRfviPsYFkIinkrJJh/mhiyaSduAA=;
        b=f1Uq2NVGhXAw7ssF30F6Rl4a931XLPuberDBkvO8yqwxrv4skbSPaulIGvY/TBNuYW
         C8qvSLdkO4K2Apai/bcgywCGx5FOJDDxLo7gWbus5wMYCOT6qqBhuU4I6v9IUxOlLxZU
         u82f8ZeItvOq0UyD+d2Fmf6TjvPDXOCwBBtJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=897BjAOv+b6gjmVRfviPsYFkIinkrJJh/mhiyaSduAA=;
        b=tU2Km0gpG/ps6mVtAXUv8Ubk5T7pa5ujnS5A85HHMjlD07eAPM9UNsdwSb6sqnnyaA
         TbP512022GwbDpJ/Bx0gJ4p/n4BDcYGcMCdB//GcV/Y7Y0TZ5OHtshe9gRcVjFvUp7Fv
         mk/dpd01Zc5FbBx7KHv4v2HUt8djSjCH2c1WNxCPXP6LupR7+ttP3g8btAuhlo8WSYiV
         Rdq7J/4l6ZLhCQ6kx+uPptQKiGzK1cX4tTt1neazZ0M3fZmZbCJSvLRx3crBSi5Pji3W
         yZ9RV0a52GEDNHbYb9wL/4+UnKUDlfGWNjXq8l5gQSvJi3UV9eD0tZ0KG1pdprZ1EmTS
         UMng==
X-Gm-Message-State: AOAM532WKqthWxe0jSXQ1inIYG3Z2dVryCtPv2kvIyYbk5qlAswqZVEU
        VzKefBY9x//4f5+Ix1dYVDxJxnQE844cWyddKjMTQA==
X-Google-Smtp-Source: ABdhPJysewZJIT9HmU5jN1biyxWmZF29nXZhDwWct/E0AJie9jOc33z6BHjZQjzdRpL1/co5zqjDkBX//vPIVmW+ufY=
X-Received: by 2002:a05:6830:4a2:: with SMTP id l2mr9266600otd.181.1618276999315;
 Mon, 12 Apr 2021 18:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210412231759.15474-1-yzhong@purestorage.com> <CAHp75VcaaJ+j6H0H63CEA2_-p0GXskEUUvywcMkQxW0G_qFGrg@mail.gmail.com>
In-Reply-To: <CAHp75VcaaJ+j6H0H63CEA2_-p0GXskEUUvywcMkQxW0G_qFGrg@mail.gmail.com>
From:   Yuanyuan Zhong <yzhong@purestorage.com>
Date:   Mon, 12 Apr 2021 18:23:09 -0700
Message-ID: <CA+AMecFoXhwgd360PCWD4-AZiv9XsuCeTyx0YkMtATiMg0-UTA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lewisburg: Update number of pins in community
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 4:42 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Btw, have you tested this on real hardware?
Yes. Tested on our in-house hw.


--
Regards,
Yuanyuan Zhong
