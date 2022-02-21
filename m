Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8C24BE4F0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355151AbiBUKgZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 05:36:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355187AbiBUKf7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 05:35:59 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79AB276
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 01:57:39 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2d07ae0b1c5so131570597b3.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 01:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nl0T0iJnVKphPzFb8UDMXZHBwxSlA4pey//XXCrdqBM=;
        b=JV94Ro4lD58Q8SSlPXbqpiDYr9lPiTn34wLn1CoDReV03JWAV/y9Brn3dwuSMXGRgT
         DROiEU8RWXbWiQ8H9k8V5+uV5rlKeTp7xPJYZ9J0bKcc27t3pnrevykxr6x12Ye8rkFl
         cjGxmxCuAiYBGqYuUlStAHFQNAwwMHnALLesA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nl0T0iJnVKphPzFb8UDMXZHBwxSlA4pey//XXCrdqBM=;
        b=hV+qVvMIwcpSogCcjA795I5nQSFt3NUXPjtuh59qR/aWH2LBqvgdAP20jUdhcZt0nE
         osz1pMvUJGE+4JHmom/alS86ZvluRwaTg5APVYmh5cNm23L187e/XYNhIL0xOYQxiClR
         yl2jHNTDRftGwFq/cmDjjUlrakYdnggaAF8EY0Hosyn+LwsI6oobeEUHDcN9XcTLDVrL
         SY8pxaFRL/99GrW5YW0rkE2tbgE2/zRgyRbKEqBB+/aoQR6JnY8Vu+2LCG8fyxvakGJC
         H9mV50LcwJwFQKb5Wax6XwTFGOxdp3AEH3Gc2jSPoDmAZckKHdrximAwcev9DW8pthGI
         Hb5A==
X-Gm-Message-State: AOAM531qqZCBmeOwiBXPhFxxhpRTORTeOKJJ5jCi2EROpDVKCzYDaNG2
        HrC6MA/43EcMTcd58FvzxcuysdEoXYWOiDZVnzp+nQ==
X-Google-Smtp-Source: ABdhPJylswhYS8F4TyxPo8vzjQfGSw+My43raz8y1hBk5uNq4ma5dn4gMAr3+HLi6N3zsrnCjLR1O+p4nSGhYfBM834=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr13604624ywk.27.1645437458949; Mon, 21
 Feb 2022 01:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com> <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 21 Feb 2022 17:57:28 +0800
Message-ID: <CAGXv+5HKbd+w0r+YC59Tw5mZf4P1gqYX6sysvoFj-JxUKH7hDA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: common-v1: Commonize spec_pupd callback
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce code size and duplication by using a common spec_pupd callback,
> which is possible to use on all of the pinctrl drivers that are
> using the v1 pinctrl-mtk-common code, with the exception of mt8135,
> which has a different handling compared to the others.
> Since the callback function signature was changed, this had to be
> propagated to pinctrl-mt8135's spec_pull_set().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
