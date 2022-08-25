Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7EE85A1134
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242033AbiHYMzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242084AbiHYMyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 08:54:53 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6663BA
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:54:44 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t5so25953184edc.11
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eTyJ5ysyBJphDxI681uzkkLxuflLaDMmY8laThwgM3s=;
        b=ZZjLAnzUFfkR+G4v+IgfNQyxujKrroHVtRt6sLDmiBVTQl1pPP39LVWYfE+C14b7jy
         drFFGtc6MLy9HT+qhNoOGpDmgp9Nboo9hsk8n/VBZknHf0aWOQQyO3nzK40UoyCG0HzW
         fXNWZFVaOMNNvtkDmAdm9sA4YcRvMnM9SQnlAFfOo7DkBCBOSHh9X5DDisnwDiJP5v1w
         3G2pmpLNsi239BmZHC5GmDihLNEHiBKMXvDnQlNHcRwVVh7BQdClm3jrRWHJhv5h6f0e
         2nDWc2tbxe/8Dv5Tl/zjy2f33JnCJOxHzk2QC53ZDPcp/U36ngjXCxslQJEmi8JYCPPI
         ow9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eTyJ5ysyBJphDxI681uzkkLxuflLaDMmY8laThwgM3s=;
        b=syvn4Vi2yI82+ZhwgytZm16JTLIHI/GF3la71LmiA96l5pZ7Bk+7Ocq5vfzE3HXmKQ
         mEnTlAAoA1i2rK9sOLZn1+sE4jGG7UhDg0TRThdAi1Vmkt/vTaBDcY7V3FzBGUiPcWJp
         +fFhbcNXsm42doXiLCXeOtNQhNt1Nrn14Cna+4QBuTP0EO2UeucuQ5aIVH6ytZOuJSxh
         1Y2PcbOWBXTrLkFc5SleLVLReszZXfNa3XYp/cjJ0N9NY4uNSmdoY34v/tDXvIfsLMnT
         RC2LVjsWFSrO9JrdEcfm/QcxvLJwX80XtCIEyS3ocTxeMwa8LfoDNSAgPxPVAplBaxhq
         MXGQ==
X-Gm-Message-State: ACgBeo0Q1InyVU8edoax0ECgL45XfOEPYkyOnnVVML+rbSMnt2YQBi2M
        wUJbnDpHEox138Vo7ZsK0y8hHWwH5Gx6FSD8RA2Hmw==
X-Google-Smtp-Source: AA6agR5gBoA+DyRoVe1dyTC0LYezrrsqDvXPMxIYYWdtzgEXrzgLMkOxOeINwsG5S/OWaW8sXg9+wvi2winSXMVBq2c=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr3117148edc.126.1661432083303; Thu, 25
 Aug 2022 05:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220818075012.20880-1-hui.liu@mediatek.com>
In-Reply-To: <20220818075012.20880-1-hui.liu@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:54:32 +0200
Message-ID: <CACRpkdbGjbd9Q9Chcnnc=3nD3XALsCdk7dz9mT3BfJdZs62xjA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] MediaTek pinctrl patch on mt8188
To:     Hui Liu <hui.liu@mediatek.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        wenst@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 18, 2022 at 9:50 AM Hui Liu <hui.liu@mediatek.com> wrote:

> Changes in patch v6:
> 1.Update driver file's coding style.

No further comments on this version so patch applied. If Sean
has further comments they can be addressed in-tree.

Nicolas: thanks for helping out with review!

Yours,
Linus Walleij
