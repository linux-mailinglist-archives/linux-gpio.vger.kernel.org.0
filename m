Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62264483D16
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 08:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiADHlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 02:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbiADHlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 02:41:09 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE42DC061761
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 23:41:08 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g11so79999167lfu.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 23:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
        b=bt1dpabRFl1fZ8T5SBzU3zX2YrJv3AsPCn9mVTUi72pE9/1bN4aZhW9dpJl33tZaM9
         7iaESPWbHBFnnXArza/MTy3T7FYJJCgiv99Di/U7qTqFZsyAYk/MJuo9oKra72g9vygN
         17jVAOAM3wGl52rn6RtjqDkgFo6TsIUDIPU5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
        b=ra+xKDSuSwB6/hBYPsW4RpwHLxR+/dztV4PtOmmfzPLtsCbF+4wUDXewP8Nain7prz
         aHLJ+gMBKHKvEPk1vPZJHHrsDGMzZsvpptzNnyH+zGWQUkJwECH4SttstR37qmdS3x/C
         Oglascwf82ZCsPvYj9Yx7ew06spx8/p7YGQXQMlndWZum+/tL02fceD9LxpjuI8wAuWp
         lF43hYUyUZ7dWRWQdimceXrTuzMDcILC4gSeIE4l//+7T5lrXoax2/YcoTWLRc4Iwoqz
         uith/pMYSTBnQEGlosDAk55A+DcLNQUx4iMKuGGgw8dcQyMRHMgFLdXGHb85x0fnmv2U
         Iw9A==
X-Gm-Message-State: AOAM533Ao2Wiaredu+nlQrbJOWsgYquTnaSog6urNHz+UeVGrj4dgB5l
        ov1YOzcEzq0vFigBTKbRz8DuIKRxD52SJZ/szjmo6g==
X-Google-Smtp-Source: ABdhPJytUCpP+bhk+Y00OMKDkyKKeQaE6cvos2kOI6OSzqWU42kDCIZUSxoTZ5LSAvJPEeULqokCCRGBCTIG3y8Buzo=
X-Received: by 2002:a05:6512:202f:: with SMTP id s15mr45046523lfs.501.1641282067147;
 Mon, 03 Jan 2022 23:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 4 Jan 2022 15:40:55 +0800
Message-ID: <CAGXv+5HJSDZe-Ob4jpPcPnsCn=4Pqu=JHz9B4S4hANQF80r2kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: pinctrl-moore: Simplify with dev_err_probe()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
