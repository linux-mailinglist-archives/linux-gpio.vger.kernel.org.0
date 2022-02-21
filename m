Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EC04BD4BC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 05:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343763AbiBUEYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Feb 2022 23:24:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiBUEYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Feb 2022 23:24:37 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9959B37BD1
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 20:24:11 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2d6d0cb5da4so69865567b3.10
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 20:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/DnNowH3r+bx2ltFVLOEYXPzes7apZHo8qc6tZmack=;
        b=fuogfxbwZ/6ejxZgnJLHJjEabeg/rv6U1j6/+NVdkHF2h6fOz/7kaiooTto0bFrWvQ
         C49ySfCJP0IPkPbSYdUy/0BOxppwbhbASyu3EX9qZHmuqU2vm4oLabP2+768NhJcGRb0
         MIfk8uu7JooxnViFnBvk4Drqt9uhUnO/mZ04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/DnNowH3r+bx2ltFVLOEYXPzes7apZHo8qc6tZmack=;
        b=pAz/VYRn+mQntIrj9l7Pvgk7R4uHavu7YPWu05dF86agNLK2zS/PrnMR+pzyzwvPst
         Ir3MGIqw9tLiOAQcIpL8Fk3Fybn7C8G4cT27bwQx2dLwu8raL5d82YzwqlPelyp9DTgs
         9rjB5QgFnsd+fY/3ghVEhA8BfG+gTpq98BzOivG5NxOHK75/KvwqcuFLU+p+mMFdS1vr
         WKpvs85DZEpTVQAoet5UukZKTmK0sId6n+mw3IMkXKNjUrG9uHMB4Tc0RHNZlrYLIFFV
         BDWFV+llaZFmvc9j5zhQ9JdH8WLzYJPOhdrj+fFt83rYmTiFiRD3Sc0IOPRe7ZhPk/3Q
         HUhQ==
X-Gm-Message-State: AOAM533GZamtsbWqfgfgGCQz4LwxjGacyONABFNgukT4Tmq5x7Klp3SG
        lfnfoRiNfNpuXRzY17pxnwQy1ejWhrdrx12d4vIIjQ==
X-Google-Smtp-Source: ABdhPJytZN/PK4m+XtCToX84qZfVUy9yfbPQVMa2AclViI286QsZGxFQJJ3+GhCYLXLRPIrAMIvQ+wG2ySoMQRrxFwg=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr12913803ywk.27.1645417450796; Sun, 20
 Feb 2022 20:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com> <20220210141931.291712-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 21 Feb 2022 12:23:59 +0800
Message-ID: <CAGXv+5HDcKYcSfdVgVBcZm1uWzVuoUr9AZDQbugYxeRAGAxNtw@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: mediatek: paris: Unify probe function by
 using OF match data
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the SoCs using Paris pinctrl are defining a custom probe
> function that is simply calling mtk_paris_pinctrl_probe() passing
> a pointer to the SoC specific mtk_pin_soc structure and nothing else.
>
> Simplify the probe mechanism across all pinctrl drivers that are
> using pinctrl-paris by passing the specific mtk_pin_soc as match
> data and using function mtk_paris_pinctrl_probe as a common probe
> function for all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
