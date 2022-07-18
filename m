Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91DFB577ED2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbiGRJll (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbiGRJli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:41:38 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B474186DE
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:41:37 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 64so19763156ybt.12
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fOvbxuv2i/5Fzmz+3Q/qIWhDdrS7QG5wOKPzGz/uIY=;
        b=G3ldbuY+mWVn7ay3tMVHD/zVJ4BIpuzDiqmOUrL9SZtu6moGWd4rAPTZqsejlKf3q+
         yia8d++1RE9vr7d8BKUzuJih3iYsDhRndNPYzJtGPsDBs8IWzb5iPSPiun4IRIO/LEN/
         17tvA/OeTpsA0qbadS2ZCrODA/MY30gkZ2BUkc20mH2yNCeMy+U8hwukifQs42YTzFbL
         4iQxnLCjX4HYCKnVaupqTes4Kt9vVg7H26chsPzMoZIuuQitXLWbjdTCsLmBc9rld0pY
         Bg85u1C0QgW1d71VlR62SQT9BaTljmaRxhg+FZmtpxlRKXaWxQ5C7MQoHCZuH109IlEW
         c41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fOvbxuv2i/5Fzmz+3Q/qIWhDdrS7QG5wOKPzGz/uIY=;
        b=6K+hQ737yR2mrdFIP71jxMhNrr4yVMTCRxf8i4ANSSZQUbrIfB5XsG5uqbo/b2zqJZ
         PXgdvPnfEcHiDyVgBEdEHK+rKgWeqKOYe0CML+9Y0cLBOuhbwFcvbqiyYPc19iLTPi9H
         IVcA6r0ImkBXv0r/a0eKcNVG/HeoinD8s9XPtWc3lIrl1VUdPfIDj3VOvwFK7RLbPZmF
         U5kLRKPU/YIZDXECJ212cRXuhD+6q0umyJ8EYKpAdIEc3eNCfz95404SgAU41CPQTcKv
         B76CkCtFb3bGmioZ7I3Qz8pAkp4ki7Lr+Wg6IUkjwb05aGDUXYsLTP0efHXyfajvCshm
         PDdg==
X-Gm-Message-State: AJIora95hEJFMikz+fEJ+lSMu2vrxK0RYcxjfVj/9KGIVlEU/kGXIbVT
        3wywBDvZzodxxhzCVnFekvUu2umspP6hciwkrNydxlHjb6kjcQ==
X-Google-Smtp-Source: AGRyM1vAtV/OOZgvx1kKG3FvseqMLz6Z/yAiXnzUMl+LY6h0es27TmM8UASc1JpZ0HuCq+s3wHStVZi2IjNSqN7I20I=
X-Received: by 2002:a25:8c91:0:b0:670:5c00:7c6a with SMTP id
 m17-20020a258c91000000b006705c007c6amr1238342ybl.66.1658137296329; Mon, 18
 Jul 2022 02:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <YtH53r9UcYwquxcx@debian> <043cec12-b719-e9e6-d234-fe6ca75ca894@gmail.com>
 <a15dc5d9-ed10-d75b-3e76-e5e03ebfe25f@sholland.org>
In-Reply-To: <a15dc5d9-ed10-d75b-3e76-e5e03ebfe25f@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:41:25 +0200
Message-ID: <CACRpkdZ6yPUd0KPLqviB_ufiEe9dz3XyP+JPkP5ujKc7xYYKVw@mail.gmail.com>
Subject: Re: build failure of next-20220715 due to "No rule to make target"
To:     Samuel Holland <samuel@sholland.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 16, 2022 at 4:15 AM Samuel Holland <samuel@sholland.org> wrote:

> The patch in question[0] contains the new file, so something must have gone
> wrong when applying it[1].

Patch 6/6 didn't apply cleanly so was applied with
patch -p1 < patch.patch and then I missed to git add the .c file.

> I wasn't sure what to do, so I resent the whole
> series[2], in case the index hashes in the v1 patches were causing the problem.

Fixed up by applying v2 now!

Linus Walleij
