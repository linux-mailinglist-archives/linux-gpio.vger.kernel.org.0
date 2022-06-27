Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4706255C321
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbiF0HyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 03:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbiF0HyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 03:54:08 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2F660F3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 00:54:06 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id p7so13923211ybm.7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1ei7A46Wo+XeZcaVepJSKGhZWQY+RUqJ53iIKiK9ps=;
        b=tH+wNrFS+ESfn4pcCfsVQrF231u1KEcqb0O854NE2PR/BbVdcRIR+QWq5IsKyStI4U
         EhJeFlKucqVU9x3v/A+HbasBpbygp7x20XUBesmj2/1GyhPzsaQVjX8SWzIesM95tJ6x
         YRwp/6OayBgXm/dws56RGtf6NiY7i5sKXqOa5paxfcyggBhoXHPAp9FdWjz7LnhjsNZf
         SMN4bwGvXh/+XI0tBn01XMtRHKuZzrmGr4+YIulA7oc7d3K09ogfN8U1WGJUK1h+NcUP
         EABW97JTOSNFZkkOwCcDBaEbY4juNAWZH0HZRwwQoRI3BsJpNfrf0IgypWQLul8SxAIT
         Nh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1ei7A46Wo+XeZcaVepJSKGhZWQY+RUqJ53iIKiK9ps=;
        b=QcAX41xicWgwRQHFoWX9IoWJxF5isoHJveguPq30aRaKf+ydPheEN9lJ+AgNGR3FCy
         M0L0miGKAJgK5wbT9jMZrBSBKePwXyUS83TXwCcmf5Z/gGJo63J58KE7URvB4/nfJDqx
         c8LGpqBUy+9eA+TwaVm/7j7wYc5vUNArlFE4uJXC8boaOulOdIE6YPsZ+S01ED3Y9gJM
         HSAyta1fIy8efkOvhHo6rBTWF4ORsq77LjzxgSTIAHnYqeg+azZmPTOqhvy8LcrB8JSD
         vI0kjukip8ZoQc/WsgBVtQs4rtgO7XmcbqROGmzEA22VynMABRRZ5ooSPLCy7j0kqfqU
         ZhlA==
X-Gm-Message-State: AJIora/U0k6hW5E48eEDwA4yHVMnyMC7hE0e6GDkF1o7DvZo/z01u0GN
        i93SFIbgrCTmzdJfEXf8x1CP0fT7qYwtHMfL4hhefA==
X-Google-Smtp-Source: AGRyM1tQbWQgyBgE+001toAhOnw+/LWt+5fPYl+utNEITpm1Gcy7YSVbuHZu42gA/Gt5J/IZr2TxPvL/vku7o2S+Wn4=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr13029964ybf.295.1656316445592; Mon, 27
 Jun 2022 00:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <202206260954.NjQGnygt-lkp@intel.com> <37cb3f3239c9be1dd18e576e4823f364679bb44a.camel@mediatek.com>
 <CACRpkdYxaZqw60Wui-8=mziPvfkvuS_nQE=03y3VCbzBdc61vQ@mail.gmail.com> <208aa8069584038593cbcb18f7f049f650782145.camel@mediatek.com>
In-Reply-To: <208aa8069584038593cbcb18f7f049f650782145.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jun 2022 09:53:54 +0200
Message-ID: <CACRpkdauOS31Yof2p9XaGBc4amKYqjNyhGX1zF=Sgc5D7ozT3w@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 17/19] drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56:
 warning: "/*" within comment
To:     Guodong Liu <guodong.liu@mediatek.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
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

On Mon, Jun 27, 2022 at 4:02 AM Guodong Liu <guodong.liu@mediatek.com> wrote:

> I don't know which patch you mean, I just wrote a patch to fix it
> so my tree builds cleanly, thanks!
> evolution
>
> Fixed in Bellow patch, thanks!
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220626043955.32756-4-guodong.liu@mediatek.com/

It's better to fix it in a separate patch so I used mine, please
rebase this series on the
devel branch.

Yours,
Linus Walleij
