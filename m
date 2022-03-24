Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98A54E5C67
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 01:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344347AbiCXAlT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 20:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241667AbiCXAlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 20:41:18 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E837065172
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:39:46 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2db2add4516so36064947b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rN13FMeqEprGT5GtmNj2tl/IA4XlrCPy/4n11uT4fQ=;
        b=lFcisYYInl3HhTN9FFSdwKvRMetfhMw7fQeFnSW86dZe5L+XqQ8MjGPrpAEzEQXAt5
         LqcnW/7aRPO9dsI6WqRmEMkClwvp14cGL86TdEutHb3KsvDkXQKXUfGGg7ilRtflQNot
         B9t9JuVMDSN9Yp43S1qt7s0f/KCgHaYlpqDq33vcvwDEgKRSVwskw94RPWF1v513MvNS
         cqJ1fmjC5zqHjWYggPS2OFCXXvXU1ZFq8hQaaFVc4Xy8rUEUf1T20Yv4i0Thg5beToNh
         tSE+Z7oHq0TQBBvu+SyIfWvdRc8wjdmorRSrF5DpZfzWilfYZV6b58FF4MHzQwxoulaj
         A0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rN13FMeqEprGT5GtmNj2tl/IA4XlrCPy/4n11uT4fQ=;
        b=sbX/Aozy0mu2eMns/DoH6WgpMJp5MANGsDvx8XPwjgW1iM4N7JoOt0VvNVmcDG9++2
         rCOUBFCVTIAFT9ZZKMolg6Ji4PGfqDCg45DoQdTcg5HgN4JZ4+LUqJR8Qje83a9fTzxn
         gQ+K2GvIZF1rkyE7/P/DWIJkPmsNbmkUpHpg7j7n8dP4iq0eCXFDlZxjPN5A5yteYxM0
         wDFJkEluJljjJfbKNc4ppGt0Skx4E61N1zqL5cJeux+glbG22M9OLk3qXAwJQy2xrxi6
         DqbRoaPxrjknqCsNEO19Cyz5k9TUdbBV/qRjRMpKP0I5PB8w9w2lWiZJRz9K/v8ikjAZ
         3zXw==
X-Gm-Message-State: AOAM531K9lb5ohE+TOy0pbsIetr9ZTXt30vHWWDtNruztJWLtGRMMmBD
        uwDLqPgx8OMubk/Kqvx9YqPi8bolLroAd00A3H5SEQ==
X-Google-Smtp-Source: ABdhPJwT1ooHzR6MDCbcAp1jYjLkMSCzH+kNHbpUiB/d+Fr61zHv94kOyIzetchA0tV5BKYcAwVjw2Jh3I98bLj2M44=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr2644500ywj.118.1648082386034; Wed, 23
 Mar 2022 17:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220317065851.495394-1-zhangjialin11@huawei.com>
In-Reply-To: <20220317065851.495394-1-zhangjialin11@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 01:39:34 +0100
Message-ID: <CACRpkdac+fBez9rX6Ewqng9mbywKBcMN3VACdMO7mhh=dXUnow@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: Fix return value check in wpcm450_gpio_register()
To:     Jialin Zhang <zhangjialin11@huawei.com>
Cc:     j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 17, 2022 at 7:49 AM Jialin Zhang <zhangjialin11@huawei.com> wrote:

> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>

Patch applied!

Yours,
Linus Walleij
