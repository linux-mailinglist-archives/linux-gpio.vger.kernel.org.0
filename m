Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6A4358568
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 15:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhDHN6T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 09:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhDHN6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 09:58:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A8EC061761
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 06:58:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 12so4115033lfq.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6tbn1tI2G3tBIgRayZS9aXICGu6KDbVjOAf0j/hQNiQ=;
        b=CS/ErZC0v4wrWQNQ5hzG01iDbDSinO80SXg7GXfUcN2dF55XM/+XlP3IoAV6A0brt+
         Sf7Fz5g7s0FLWq7zvH/koSgO4OpVStfDNd5GVg5Mdwk+gdmA6nCLivuQbyOzn60ZIZ4f
         GjVrGRi9S/cCfDrbooUQA249kIWaU886GZZKS6wB2RKnLShV3gwjuMYwJEcRv35QHvR6
         d7a521VUbO2ZQtZUxZ5lysGLrx1ZbZEo9H6BnGpCW8UTMFeS3uoHORCA6mGKWKCTn0Em
         3IrCWCrecKOWmHd5vBOlrfxMOx3tsf23OLwDjRNzGfWCyE4GZ4Ft1YS9GmZCQD77i3wy
         hkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6tbn1tI2G3tBIgRayZS9aXICGu6KDbVjOAf0j/hQNiQ=;
        b=Ub2FRqnZVzMcavP3c8Vwg6dDx/u6iVxDd02fUHqrKwpavGQiJjcJJVpWiFuz5la9WW
         VL86A7EKf6eP16yZDhDm3amo8TkeD1ot1CML8nEfm6PC54loo2Rn3u1lmT8IbSxS9PRS
         DzOaksEJ/KeL8fek0t+7lzHB5g6YdObmsNKnnLEqZxm9BgCOKN32O4aTbXRBk9MGBdbb
         4CUDpiaffO9aE05271fXb4KSTAKr6/HHDxEYFk8EqHAgrCuVZEBQa3dqCQryLwGiJsk2
         5H6vo+IU+xwzdZcUVCp+uuUMGjTd0MoAl10GfZbRj8ikHffsF/cA5WBCRYemMD1gEPyG
         2DzA==
X-Gm-Message-State: AOAM530UouKu3b7hSSLjqYJFQMUxPHO8rSsGjJQjsoBbM86ZxnYKjHYx
        bCtTnrKWdi11gNJdRdqHq8ya8SFpSPAcdL/BKVf8vQ==
X-Google-Smtp-Source: ABdhPJw1fFR7RAMMEQXftCBL2C/BR9NOHS4C5Noa0+fVfEGGST5YGXcioIWRzTYte6GP8x3fWB5YzK4bkVuDprX3Eeg=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr6083018lfa.157.1617890285813;
 Thu, 08 Apr 2021 06:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210330062655.1027-1-angkery@163.com>
In-Reply-To: <20210330062655.1027-1-angkery@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 15:57:54 +0200
Message-ID: <CACRpkdYs3m_OCF-JaLFwnSO-Zh6n41tjdjvwV3Ye1E8MYbwBDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ti: fix error return code of ti_iodelay_dt_node_to_map()
To:     angkery <angkery@163.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Junlin Yang <yangjunlin@yulong.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 10:39 AM angkery <angkery@163.com> wrote:

> From: Junlin Yang <yangjunlin@yulong.com>
>
> when devm_kcalloc fails, use -ENOMEM instead of -EINVAL,
> and consistent with other devm_kcalloc return values.
>
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Patch applied.

Yours,
Linus Walleij
