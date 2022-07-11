Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4470570411
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiGKNTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 09:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiGKNTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 09:19:08 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E1D37FAC
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 06:19:07 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31c86fe1dddso48612187b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HFFvSJiy9C6h5eEA5lIxkZ96QkaIF6q9xej6bofnIOA=;
        b=iXTcpM/R8oovk0hW0zsjaq3ZFhj0IgJSwn4IO5nkkmBJWbF5bksy3o4vlCWl7JJ8c2
         MXwVwExCiLyUTKDaDEEIvU4hNIhROGQfrud9uOZk68QbfvRrlkreCB4WLOsau+eesmmq
         +h51dd3M+q8RpNrDYPR6V5TRpR2ugG7h9HduGHw/qJ0ZHBWy5la5UQMbVRoREFDFcyuL
         tYKTgw5nx6QLrHPIgwzrbM8qjRFO4XvrTnO+qO/Ov0EZWbzMYKdn6iZzrx5ogxUrViZg
         ifeGS0gsCJ8VgJx53hYhSrf30766YbL70pujRLAhLh1wG854Lnr6t0/6LBEkra9knhPL
         cPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HFFvSJiy9C6h5eEA5lIxkZ96QkaIF6q9xej6bofnIOA=;
        b=KiE+qaqrjucPs5U3DfFOMJ9Hv2PJ1fRPihW+kbzpFmNW03X5s+rWhlQhtzOQcyf98M
         q1CC9w2nKlMtw2HoUE67oBGOh6NRQ4rtHAvLhjwmyC/y6NnJe6EtdpRJsbuOCDUunG5n
         cUsiQnZee2KWL8wDX996EVeXHN5ujeNGlNXk1Ogmk9HNwbh6gIgGBpLLvGpjSgIj4r/v
         iX0nQB/ew+YvgNlAZ5W4QO/AyiPFyjjU85s19KMQ9qiISmhHOf2/Dc+OqT6OQKuvreF1
         2c1LM7GT3eashiSCP7B6a0DDVTr7OTCnenwN+xnVAZcaWkWwPz0PdkxpBdkZC/4MlRlU
         spLA==
X-Gm-Message-State: AJIora8eqn+t9OFZcVTQCdKyhq2ghZCzgntbkXJidhHDtA9OMMk9Edvm
        Wm95lrnlBYO/PaxL/DKJgKB6OxuWgFuOyQbJH0tmDA==
X-Google-Smtp-Source: AGRyM1s9F/RTcVozTPMP+67AeExg0O+N/+9pL+qB7dMhstr23N0lKo+Xuyivg58GtU0Q83r/x6R+o6ik2GRjOCC4ddA=
X-Received: by 2002:a81:cc4:0:b0:31c:839c:7e27 with SMTP id
 187-20020a810cc4000000b0031c839c7e27mr19758682ywm.151.1657545547155; Mon, 11
 Jul 2022 06:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220711083528.27710-1-ping.bai@nxp.com>
In-Reply-To: <20220711083528.27710-1-ping.bai@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 15:18:55 +0200
Message-ID: <CACRpkdYf5+JSpd176-pvWvTBc8zyFuPk8FQAi9_i+3_qNSzPbg@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update freescale pin controllers maintainer
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com
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

On Mon, Jul 11, 2022 at 10:33 AM Jacky Bai <ping.bai@nxp.com> wrote:

> Add myself as co-maintainer of freescale pin controllers driver.
> As Stefan is no longer working on NXP pin controller, so remove
> Stefan from the list as suggested by him.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Stefan Agner <stefan@agner.ch>
> ---
>  - v2 changes:
>    remove Stefan from the list as suggested by him

Patch applied!

Yours,
Linus Walleij
