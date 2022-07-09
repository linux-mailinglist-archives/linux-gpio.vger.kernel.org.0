Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486D956CBE5
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 01:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiGIXId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 19:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGIXIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 19:08:32 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671BDB6B
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 16:08:31 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id y195so3337097yby.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jul 2022 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnbxUfPe4Wv3r7bkgdhBdHy8QD3875PR8OE7vTRZZcc=;
        b=Nl3qI7AmtVx6yQrfbsUdAVwltRNGlTViHYE5wj7y5g1OLa//n6SG3rv82eiT8AHQ4i
         dXYWPsVmxqFdmJ+NKEszIzMN5S4utXr0X0vYUQVAPXUlozNd3RMSvTI8FxMnK9e+itGr
         8652Wf64TWPGSGS/l4nuONOc8RhSsmzEuhFs8gbP2utdRLvPyUZteUP8quvLIwEGnmai
         HzHlgukukyt7Ji4aS5FvT1uRo/zhju5Slt/yvp/g+gJlr9eZTHTMeVItLDdWKWQ2VlU3
         yiYvriUAx34swgP/lI0TYnl1/+NK3zvJGL+SD1JITFTQJbZznXKqhBVBxQVSsrQniRVm
         nGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnbxUfPe4Wv3r7bkgdhBdHy8QD3875PR8OE7vTRZZcc=;
        b=XFCEBY4yWc8Fw2bXYsnUR6xjaB0wqU77DxW5DSmXGLi1V6WmllYxqIkhbktfHJAsL9
         fSTtDkMSnUlxheJbgWOFZGzH/DELh+POYRcdjtLioRkPMC9yStac4kNexfYfcixjaDPI
         4fPz8zM+yyFoGHqTlCfr7IdcYcaFg4yIt60bZh6Tw47V21ZY93Jsvc2TLp7aXFA4r7+y
         0nrE7iGiVJ3MeFZYc5as6eL/e+U+xQhQkQsy5QiOwyjxxmcXFRmzFKT2LyRXI1/fJtpY
         AWOEOPfMgnSzbXtznwLJH38wpz4JJJGEr86yprMgXyQAj4ZmdAtSEuElpf0hkEbNpYfk
         tKuA==
X-Gm-Message-State: AJIora+c932qmtY6trxEWociaoQtRafExwcCjzjQMZmVC69GZylh11f/
        ChLvigxGWgLkoV8NFuZsJGcj0x6ipYVclbapSgr2vKhmkTQ=
X-Google-Smtp-Source: AGRyM1sI4768Xzrm4OnJ2xhKrP6MT783ivNwQAMh7Z+Res6cuXa8vyX02uf1Dpju19WrehhrVrNY7irLbbVQ1sGXfOc=
X-Received: by 2002:a25:e00f:0:b0:66e:2aa9:82b1 with SMTP id
 x15-20020a25e00f000000b0066e2aa982b1mr10821078ybg.626.1657408110599; Sat, 09
 Jul 2022 16:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <YsiWqB1vCr4gdt7Q@smile.fi.intel.com>
In-Reply-To: <YsiWqB1vCr4gdt7Q@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:08:19 +0200
Message-ID: <CACRpkdZmkv-11kLnxxoCRkNmAwSkkfS3nJMKV3TgRhxPcp3q7Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.20-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Fri, Jul 8, 2022 at 10:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> For the v5.20 we have not much stuff that was sitting a few weeks in Linux Next.
> Please, pull!

Pulled in, thanks!

Yours,
Linus Walleij
