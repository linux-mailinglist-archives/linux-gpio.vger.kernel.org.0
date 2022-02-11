Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AC44B1B16
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 02:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346727AbiBKBTM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 20:19:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346716AbiBKBTL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 20:19:11 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254E5267F
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:19:12 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id bt13so20655441ybb.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
        b=AIRSI3cMzMaKni8HjGUVaMbZAhUVlceEUvM1TVFe3VPqQyWXLz2Ak+cDAO5nh25AUQ
         dQ3wE5W1pllDsx+K8PXA7t3fk+pbwx53ncl4DxX+P/sPCtfqhhCY3p7GAiLGMElEMBcT
         Rs8XBznNz1hO9TGGw0UyBDAxLBlsOUXgNThNiBBNFXT02GOdDU4CcMQpLmmNZtAIXMiP
         J2U67gmXjBPoFTZ3vC2aObwrtGXtzFhHXF5ryg5us7Gj9GfRYv6xoqaEfVp4BRY4OcPD
         OmITTZAdt5Pngu3Te8EFZT3oHj3uqqBgP3EASdlKQFgwu1voCxa7FR42hHWE70gz11wS
         uSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
        b=woqNSj29XfMqEfhLH/Xt7Q65NWEXMR6jergmIunqH7FM8Q+zTcTK3OO6mjdK9FfuTW
         TGiE1jS+VWeFee2ESQVv1VS5b5sd6TsXeupPA2DhDbsJ/8voxVMzCfges7dX2Q5M7fUk
         TLTq+z81WtwUiCbHqJfXbg1JFM46pN5zS+NEWn7GkD7Q5wiG3qIo+RXI/hesC/9a23Ow
         XuZeEj6zXGGE9JZPU+Hss6/qadrsWiBHo8M0se2M+7eBqwP6zI/LQEHIzara5rBTGHzS
         UklHd3rmo1Am0Gv7/K0gbqKnF/gtLsBfwaWOlA+qx9Jm7AHgOKee83x2Ou3Nxw8fFkGY
         nrsQ==
X-Gm-Message-State: AOAM530VEjosgOB2e2qLYrK5c5djuIXUs4XC6YbaZa8nD3xqfg5m2KZW
        mFEPVd5UnTkH+qb9aky4Kogtass6mkobsVBw058Wxg==
X-Google-Smtp-Source: ABdhPJxGv13LWL9egJMKkc/oNhbYkiByJArEzDE8gyZspHDoaexfLcX9zE0exXWR0/WRRRWmGDJt+Pt+o9nTlBDv9/M=
X-Received: by 2002:a81:4cc3:: with SMTP id z186mr10688352ywa.140.1644542351380;
 Thu, 10 Feb 2022 17:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20220209180804.GA18385@kili>
In-Reply-To: <20220209180804.GA18385@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 02:19:00 +0100
Message-ID: <CACRpkdbgbrHBO7JFAf9yUjdOfnfavDaDSoUDniHTJT=-im0+oQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
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

On Wed, Feb 9, 2022 at 7:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
