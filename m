Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C67966E677
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 19:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjAQSzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 13:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbjAQSvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 13:51:52 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AA64E538
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 10:16:13 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 203so35108176yby.10
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K71xX/cWRCOszSsUEA3IJIhyWSHXMIZjKFhy6mle9xY=;
        b=en3ViOZMbrP4Uikiu/2WpjFPDaZ2MZS9XnYFDx8yBKisaQvRWhuGkY3AQtNSZWJHp8
         6EnxnmGlDMk/9pR/VaGa4iIQ9WFlTPAbfZ/4AKQlT/Xw65J7J1FzOXXk1nWpgnZVVcNp
         x4X4thpG4Fbgxx4oEisVqBmtzK5ufcFlWQWLWjN5Vfv2vrOmhbyyYJF/5O/xhmtrgFWl
         lsYuIOLzrkT5PVQsvvbAzBdSOQASKeD6FLA+DX0AxT+gqRNdl7iSwrTub/eEdRv3adX2
         1bB2gCzIYjz8YogEyIjqgBcQoeGGygQrI5vqYVF6+yOzR227dycqOllDNroYlFWxP1LQ
         oMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K71xX/cWRCOszSsUEA3IJIhyWSHXMIZjKFhy6mle9xY=;
        b=wB9Spj0K1nUdM1tRGwQ3jvrJPEseNdh5iYQj5T10fLfaaTLVrr2cTDttade+VzLvPh
         LmbVE9FM2az1ZsoN8C8z+WLju7ZMgfdmlutKVSfdXd+L2RHPuaCvcx8Fgwn8hPqrlfh6
         ZGGh0ohUm4cn+q9pHRf25uWixk+1km4fFwIL17ofH+cOQo7naQRxcgiEWdu4rRpZJdrw
         GJBLucIY4JTu9oenTR2YbL5KizIHYwPhhrZMXzpb75hQMcwujBGmVgd/vtcuHqt+sHqW
         5BvuY6ibIo+BuGeTVnavgmTunLxsV0OWjv/+ZqDKM0UKYKR1hAeS3ESLBWtC11nmNs5k
         vFNg==
X-Gm-Message-State: AFqh2krdtDt9QXDDe/xsQtsNfOib8vpn5CbdJKl+etbLHGMI1fl7h7XT
        fSG3pLRbaFxF+zY7UQPN2Lmlv4PgOQ89AM1mdGCj2g==
X-Google-Smtp-Source: AMrXdXvYCBByr7y1fdbMzgX8r0rcQIT1xBf6yzo2htNPvKO5M4emG6u4gj4DL+7oQzTyzr5I28cSrbvcw2ebDzkVUgk=
X-Received: by 2002:a5b:9d2:0:b0:7d0:afc9:d194 with SMTP id
 y18-20020a5b09d2000000b007d0afc9d194mr546110ybq.341.1673979372493; Tue, 17
 Jan 2023 10:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbVa3XEDzcuy7iCqx0cvj4trzPe7N0B5PswA1mQ7O+GtA@mail.gmail.com>
 <Y8avtfifZpy89rS3@smile.fi.intel.com> <CACRpkdYTFDsU7xhu812Lh1mA1Hs9kGeid+akR84ervAsaxVYkg@mail.gmail.com>
 <Y8a4BAotZAax9Zx4@smile.fi.intel.com> <Y8bCBMoeNHlBG97a@smile.fi.intel.com> <Y8bCQ9QlhMpFdTiC@smile.fi.intel.com>
In-Reply-To: <Y8bCQ9QlhMpFdTiC@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 19:16:00 +0100
Message-ID: <CACRpkdbn+UWU-dzp+MXSVB+JkpsFwENyi+5Eq+GV1zPaaaf3rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Proofreading and updating the
 documentation accordingly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
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

On Tue, Jan 17, 2023 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Jan 17, 2023 at 05:43:00PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 17, 2023 at 05:00:20PM +0200, Andy Shevchenko wrote:

> > > > > Actually I have missed the repetition of the comment I put in v1,
> > > > > i.e.  that this would be good to be attached to my PR where the
> > > > > struct pinfunction et al. have been introduced. Can I have your
> > > > > Ack?
> > > >
> > > > Sure go ahead,
> > >
> > > So, which tag to use?
> > >
> > > "Acked-by: Linus Walleij <linus.walleij@linaro.org>" ?

Yeah that's fine sorry for being unclear.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> > Added this tag and pushed to my tree, thanks!
> >
> > P.S. Tell me if I should do somehow else.
>
> Note, I have slightly amended couple of lines, and if you keep the patches
> in your tree as well it may be a minor conflict.

I pulled them out now!

Yours,
Linus Walleij
