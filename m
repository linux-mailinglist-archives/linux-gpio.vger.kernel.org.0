Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504224E5C54
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 01:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346783AbiCXAcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 20:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244949AbiCXAcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 20:32:12 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C91887BB
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:30:41 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v35so5704190ybi.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
        b=sm2QYz88Sv85BbdSp7wAc5CC6Vfap2Cq9y4XebXVny0JR4QYb9e9KNo/SFvPOwLosl
         mwzbQ7d9he9CGO8zrleFg96U3k6ODOL+TgiCseeneDpFrmmuQJ6QhITJ2gUXejK4cJZO
         +9L1JAd3FXWEhQBeG6IoqDowTNCS3TxIMtQesAWN3eL33dsnwicwyjghchSDKJ2kKi24
         vzXoGk0QUKC1kgbkKA1vKsljIqxDGJ7dgnlzFDebBxH/zmTNZ3EnYs7Tum5btiB3Eho7
         F2j6tTJ1COWjTbHY+1RuJF9pajtIzDt1cFlLuxtbD6p1lFbG1rw+a7X2529r8Xv3c//5
         l8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
        b=14g2ba0UTsgQoQ+eQT3IdL8CY12KLpwpSj+x/XNsnfGQlgT0VR4kq5w8C1FEDrvwyq
         MaAwshPWqMAqyZG+/0sN4THI6bWNvn17//kq9v/GnZtAko0YQfTYZnsVT+SU+pByygNs
         A2ifcO6gYNGGvQdQF6ZS7xcSMNzqg2N5Owlf9p5MzPAfh+9IgNFLxs6e4XduAO0y5BQ+
         vfOPpQF2wGSdFsTIZZP7/qb0Xgp1LrKi9eo242OYnuMdGBcIHgrieH7HgrigpHFh3It1
         jRtzjXQ41haj2uJgU+EWCFcTyOLiv+AOrDTs0I5o7ZRRRLQM2lNnZbSBll+IVjOPCeYV
         tCCw==
X-Gm-Message-State: AOAM530a7xA72Z6Geb0xFfATzS/0Dn6hE69iw0No2hu5fWpiht+qAflR
        EB7hQCma+6mnsyUKATUM33WA9uiL1f0ry3AKfqghzw==
X-Google-Smtp-Source: ABdhPJziaumYzsskDdP1Z7xO/C1TBQ7mH4rtodDlPc2lDpMBwu8r3qc8JCK82cUNPyNzbPdp1h5GHG0MmzYCPdQlTNE=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr2498519ybr.295.1648081841132; Wed, 23
 Mar 2022 17:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220318071131.GA29472@kili>
In-Reply-To: <20220318071131.GA29472@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 01:30:29 +0100
Message-ID: <CACRpkdbuX2Prw__ka3+ns+eGuE5CtLwrqGjUyHXoy8pRRPURxQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: off by one in wpcm450_gpio_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
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

On Fri, Mar 18, 2022 at 8:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > WPCM450_NUM_BANKS should be >= or it leads to an out of bounds
> access on the next line.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
