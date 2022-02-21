Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51B94BD4C4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 05:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbiBUEg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Feb 2022 23:36:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343872AbiBUEgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Feb 2022 23:36:25 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAB44B432
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 20:36:03 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id y189so10185283ybe.4
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r5As6xybMbHa3s0ZXvX3I33YiMXVbFBM/uVu6GSmj6s=;
        b=KQAkF9WmCe/QnKSzp/0OcCmZ2i7giu1lnJTkZqJG76g0Z2atpAQuJb+p+BSHEtd+jz
         kJR1XsOcZ0NJoGGUxYJWO+V1dxs3ZYCtuYBr9BTww6Xra0W4HE84l14HlAtuSZDZ8mSa
         WL1s5P8QcpAiJ78jjNvzo4AgrnLUO5q8ShE78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r5As6xybMbHa3s0ZXvX3I33YiMXVbFBM/uVu6GSmj6s=;
        b=oKzXsc6HTdDe5LSOtlsCMgKV+Uzt3ARD4RKFLvxpZfkLYwbF+7s+l9QvjfgphG13ED
         2rIXU6QU8OnRqtnXPo/4a4z1G/YrC/YSVRYbtumlARsgUU7APcJyuXfLhdWG498RlZIo
         j6ycItVhA5b15jxUyB3Dckw9n56aIURe73wQcgMtyOnlp94xlIZ/MR88Pfvi25V/AxG4
         zbSmprQNSgKteyaX97jjF46kr0HQBQ22CcFSBauaK6Ux8hbrf9cmKyigx7+uYGre4kcR
         PJidVeIJtUU76ASlN/HSGqUncH5qt1QkZrzgHjP3AdAx02k/QTdwzDpYFjafX0C8tMpo
         i6bw==
X-Gm-Message-State: AOAM532IqS/Ws1uvnLFywi6Qsi59aIQ2jjJc9KFrroDw0pEkZocn585r
        qjdhOSJxi3R7ZTfOv0bc+2RFmiJom+8kkeneuB7fJQ==
X-Google-Smtp-Source: ABdhPJx/PVV5BHv+xdUNOqNjwWrd0XWmqmIJ7BWEOj0eLrR+l3qaKvWwKMXpjaw2dzafRJLIgp5b10sJsULqf9JAQkk=
X-Received: by 2002:a25:2d52:0:b0:624:1bf8:2f8 with SMTP id
 s18-20020a252d52000000b006241bf802f8mr16353156ybe.219.1645418162345; Sun, 20
 Feb 2022 20:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com> <20220210141931.291712-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 21 Feb 2022 12:35:51 +0800
Message-ID: <CAGXv+5Gsa537Q7+mk_DBCBvQ8jrgHrd=m66FjL5TMuTFdBovmw@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: mediatek: common-v1: Use common probe function
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
> Most of the mediatek pinctrl drivers are calling mtk_pctrl_init() and
> passing only a pointer to struct mtk_pinctrl_devdata, as the regmap
> handle it passed from device-tree, with the exception of mt6397.
>
> For all of the drivers that don't require passing a struct regmap
> pointer from a parent device, simplify the probe mechanism by assigning
> the required structure as match data and use mtk_pctrl_common_probe()
> as their probe function.
>
> While at it, also collapse the of_device_id entries to a single line,
> as they all fit in max 83 columns, which is acceptable.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
