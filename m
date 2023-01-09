Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60EA662830
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 15:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjAIOOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 09:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjAIOOp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 09:14:45 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D595D11C37
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 06:14:44 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4c9b9185d18so43216657b3.10
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P5bobKMsIRznoOvXz7SWvkB6xJnFk6PiGIGY3G6MS2o=;
        b=HOzC/Pq5ulIIhA/KnqPJQFum3MX1CVNtRK6oFn+qIyK8JqJgTT715WipABxQaFbEIF
         1JRnwSZ1iTMbopEbnyJarYGppK+0WlOe+lRVtcbvzLLP4OKuQzanGeosfsnAQ2rzBvme
         ifEHdi6brOwOevGA90SB3nzXbWGUx8iijhMoAS5uCrdXdpWSO2WRFkn/a4EjmL1UFdzI
         LGF8EngxkFLPNipXCCuv4RLuwe082RQHDDIpuow4i/Ek7CL4z6nc5wmLxgt2tYhZJWk5
         Z6ZJ886e1bKQG28ifP4evROVVFlQbCMbPOPfo9XM3Xo8A6eY+zCa2e42XKO9JBTFrbp/
         bc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5bobKMsIRznoOvXz7SWvkB6xJnFk6PiGIGY3G6MS2o=;
        b=n7kbyHreAZo5sx7XeReAdWk9oGQZx2Xvc/vtGNCb2fHIMa/UtAsdVaBKYd6xXzwNhG
         vXxPKgtb7RxNQZz9HObX2R1LL1ElELFjE8yFO4CI4O8/4v11JQSyDnYJgtan1dnNswmR
         gN8/kmYTxB+FZpcXjyEQZ48RlzpNA2CU56IexmybIRY57JABrqx3f4UM+jnYQLJmhdgY
         pfCUKrq1YrnpNSNeZwUu0LB6fvoVcHLopTRq1nQiND9tPgcaeAAbwbpX13X8r6eC6tgi
         5htNDaXl4dB9JWDMDyCmyRWtfA79ChqhqLb+SuvFZMpu8RgeCyHxzpFLRkAuLCX3qLtX
         CmMw==
X-Gm-Message-State: AFqh2kp1zY3AqlC4KUb+l62HkI4hmundcj1DI9Pa8XDYYY26zPrTYL6w
        PZT+qLJBDPetdHf3WQEbx+aAivqKe6jINt3+w9wIWA==
X-Google-Smtp-Source: AMrXdXscmRBkBgsHrMgvS+GuQDNO+z0Lx7t3uA7rUCKOfuuDv3g/cNEA/iPtCL706VwjeVKzC2ZoKaSu/RKf8cwNQKM=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr1508199ywa.477.1673273684076; Mon, 09
 Jan 2023 06:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20230102112845.3982407-1-linmq006@gmail.com>
In-Reply-To: <20230102112845.3982407-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 15:14:32 +0100
Message-ID: <CACRpkdb41r2JiEoC2o5+QXVtLVH5OBHzHD=npDj-omS9NTwzmA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: Fix refcount leak in rockchip_pinctrl_parse_groups
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2023 at 12:28 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_find_node_by_phandle() returns a node pointer with refcount incremented,
> We should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied!

Yours,
Linus Walleij
