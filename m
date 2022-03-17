Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4934DBC0C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 02:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351679AbiCQBJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 21:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237661AbiCQBJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 21:09:11 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B224E63EB
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 18:07:55 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2e5a8a8c1cdso34085557b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 18:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2tFRxT0rhwghQI8gEvi47agtg8vGan10MotjOAuSr6Q=;
        b=UJOX6oklTwkW8w72dCmc8m8zhGfK8OpqY0/JVXhh45Qf9zajdUvJ14OecbKjeXTDIs
         OM3lvFrvqyTnAzZVECEKF6QZ3diKcgggyF082T/v7AtjkiOrjGQhVeFx9jGG4FaZMKo2
         /ym8+gOqDqEiR8ZDRXt8IjN/mjety+rHghP+oqxFfyGl4gpfTgfKTSOUhStMHJ2oTh0O
         ULFgNodNSUChULDs2nHrd6T0fE9xmpCMcP6oQUhbdTx/SBsul0rXyl9MMmaGVMrywVky
         vj+2LH5h7FeYGb38x/w1Qf0qKpcDpoaigVkx0OwS/uBcEaqr+kdfCutCk5cHI4FhCj3v
         unoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tFRxT0rhwghQI8gEvi47agtg8vGan10MotjOAuSr6Q=;
        b=nBqLHpWatI2GFuWFHBLAO1sS4SRHELoTKUncLZ0Cv5imxchDDuCLHukO0r0skk8ZG7
         9rROSx5Ke2X4jw99yWDJfLnq1wyRAoFx++GDOurZaQejcQr2btstkg3xMWPHPzuqyMQX
         RK4G/22CuhXmanuvXLFBP1Dn0xhbuVXH09gP5eY0zjQwuNXVPOku2/rn3X/Qn4Ehu/Ds
         AKpQfuIqt4Yipxn6RtySPe3wyjHe3Fjg7+sQcizm+BdsKRgHDMq7u9PMnKiILk2MnvjC
         X9REo9RLJv4S0SGaczUHqW7U4sp9wosVtySfbRzANSSHlZ2Mcdy+p7KOoe14u0/9C1jZ
         Y66Q==
X-Gm-Message-State: AOAM533JUkBPt5u0/T8Lhjh3dk8XeoEHDlXuuUV1pc+sBM+wMoZJ60ep
        d6Ssn2c04H3Vg4nf197DClF/QM37e35qWJX3731zhQ==
X-Google-Smtp-Source: ABdhPJyLzDO8+2Z9/Iy26d888RjB5pB/JHSL2FsWcJtTJ3c4CwGNFG7hfFkA0IlkcXmr/Z6sEsDLQrOFpMY4U3ojLsM=
X-Received: by 2002:a05:690c:9b:b0:2e4:da22:2a71 with SMTP id
 be27-20020a05690c009b00b002e4da222a71mr3697904ywb.126.1647479274986; Wed, 16
 Mar 2022 18:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com> <a06003ae-2dcc-f5a4-3b5c-62db99d18950@collabora.com>
In-Reply-To: <a06003ae-2dcc-f5a4-3b5c-62db99d18950@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Mar 2022 02:07:43 +0100
Message-ID: <CACRpkdZnz9ry74mGZ-SvxvVt0NOZMpjGVL3KayK+xRXgRKSQPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MediaTek pinctrl drivers cleanups
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 11:57 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Hello maintainers,
>
> friendly ping for this series that already got a Reviewed-by tag on all patches :)

Patches applied!

Sorry for missing them in yesterdays batch.

Yours,
Linus Walleij
