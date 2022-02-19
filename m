Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BA94BC480
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 02:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238860AbiBSBSz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 20:18:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiBSBSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 20:18:54 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045BC53736
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:18:37 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2d625082ae2so83765267b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DGT/rZxYfeIRN4PryD3wZUZkIPDyk0u8ZLHZrKc1pU4=;
        b=MRmdeVmcNKEnsHTomHtBMiUm3AzGlkfp4v26DR4HhiHWPjXOB0goSG+7RD2Tqgaddj
         s03PxJp3LR+6iT80KJT+9CBPMBrzndI0wGzwcBwSwqT6soz0wsOXWpFJSpExX9TJirsp
         regrFDTKP9RArg6cxmiE2IzLY8GgQxZTqLE3cQcPkaE5+TFayKzY279pe11wmz8065wf
         QFwHyFcFMAwpwOMize/32bHk34fkf6qD3NOIcCzMz20B+sPPPtvQrMbq3ipfkAV2wUPY
         ZE0yoBb/ASfLmSke9ojlYCc5KRk6gjl2GubqzwacKg7xqnqgoadNG8RTZaHUR4vfVgRj
         +VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DGT/rZxYfeIRN4PryD3wZUZkIPDyk0u8ZLHZrKc1pU4=;
        b=mKdsk0gaMXYTbdnPKxZFliu6g73HgAJ1fEQUt/r0vJ3h74NqDh0fjva3tPDX4lfeq0
         3jW4ueruUWe/PadfVdHAgfdKwNGJwXvmNb3nUZXebkAlKI6Sb4ZYdI17VAe56EnIIT/1
         Lw2YbUAnYPoXfP3hdWyA+xyPQ5iuakPc2wyqYl9AMY4qZlqaSfwfZ832ZVN+szX3MGGk
         qWcc7VgIEAozq1CQy0QVRwP9vjjh47MblsKfE+1Ji56CSuVoz2THIvABgcG/TQsmnGkr
         AVhrx5jfnDGMskxYjwKkKp1mQE9+eCRBEx/YnwspPteIReDB3DSOUmouP7ePtjECi3kr
         W+OA==
X-Gm-Message-State: AOAM531MVo8hgqNQbpWkYzs3To0CgDX1CqOpGjvoZ0NRksl11rdelEOP
        qOF3z8zxaPsu7qRVyWKiRYKpbL6lvFjTYj9mB+Jy7Q==
X-Google-Smtp-Source: ABdhPJx4AWqwViXR95drFaA/1PmHTlK3qOQcUR4fd+92TEe6IlEg5Gc0YF60g9HzAOXP0I8wgHinz+bSWpmmm678Qzc=
X-Received: by 2002:a81:1e57:0:b0:2d0:e613:a2fc with SMTP id
 e84-20020a811e57000000b002d0e613a2fcmr10099613ywe.151.1645233516167; Fri, 18
 Feb 2022 17:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 02:18:25 +0100
Message-ID: <CACRpkdZOX7Sxc6hSJV8+BBgeLpHO0ZGGh2nW1WW7NDO6Qc_LMw@mail.gmail.com>
Subject: Re: [PATCH 0/5] MediaTek pinctrl drivers cleanups
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Cc:     sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 3:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Hello!
> This series performs some cleanups to the MediaTek pinctrl drivers
> by commonizing some functions (reducing code duplication) hence also
> simplifying the probe mechanism by removing unnecessary per-driver
> probe functions.

This looks fine from my Mediatek-untrained eye but
I need some help to review this, Matthias? Guodong?

Yours,
Linus Walleij
