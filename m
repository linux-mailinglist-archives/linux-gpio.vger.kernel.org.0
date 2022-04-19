Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458F6507BC1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357917AbiDSVPA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355276AbiDSVO7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:14:59 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DBE31934
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:12:15 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2ebf4b91212so186715467b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GTIriJZRdzlai9p0KTJ6eZhqwTfpS2AfPb8HEFikq1U=;
        b=MSAHMd8HItA386Snoi0cQdBzaMZmt++Msg+jgKOsbUchFNAsko5EYv20IHnrcbWEkZ
         KVsW4nnJlySyFWu+c7zRQ6FDydCv4n+NHdMd0iIXi1nLTmPWk59Ufmj6FKd49b9shCrv
         os7UmwWr97et0rhtcRdZ7VNm7OiyCX7c1CKB+KkoUQefoi9vcgpmrRzBxIiaURtix5A/
         GAE/meQ985XLTSOkhjsF9V62jvw3Uy5Jq4LQ5grJ+QFWro6uk3ZrmRIB95VuaYV5q/qH
         cbaeg+aTIwt/YRf+ZkHeGoJsNQsbg25kp3CApeZACsmKPYYIN/9NBtYi4DABU6ZLnQkM
         fHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GTIriJZRdzlai9p0KTJ6eZhqwTfpS2AfPb8HEFikq1U=;
        b=Q/RA5DihWGZiF6AsiNmNQswH8QqzOHFb7QjIGOcpKOy1LEuRdKK8rFVqJ1Ik6F+F9u
         FGG55x2TSQDfapO5E7vs93diRSkt9MFf4UhKSdtD2Tj3HWEgA98P/E3gV6cFY2GhfBVg
         SkOQnAp7ja/GuZqFiJBdzy1fLnBimsqT2OZHiRenGo/VRlbBkDT92zj1CjOQ+OCBvT6d
         5oT9/jmcaNxO5km+/S/93fFFx9iWzL/mFFtfiAItPwK8gKQ61FuYoYulu5fCdtdzYHT6
         ECbiWPqsp8TS8KyIjqMFV+SasQQ+ytQd10AnZNYqy3LYwmFEy4SdP7TaNKxDlnfz6mxP
         aixA==
X-Gm-Message-State: AOAM530Jd21jJkV6X/qY63VWT1/+d03MinIKEy/4mEJ+jy5wZkfntRwY
        K+7CJfVwze26MrWLSCgZxgncYZcmMl3Xac2WZuLXuQ==
X-Google-Smtp-Source: ABdhPJwG5RC4bZTkqfFKCXotubzDXv70N9eLVBujE4q4g85LijmPwhkXxfK7oHa4RIuKIBZemwIyMBCXsDtNUmOBs38=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr19126960ywh.140.1650402734784; Tue, 19
 Apr 2022 14:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com> <20220315211936.442708-2-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-2-nfraprado@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:12:03 +0200
Message-ID: <CACRpkdZj7CWNaqXx2+zUnGUgo=L+vqdrigbqqxMETBAnM9nYwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt8192: Add wrapping node
 for pin configurations
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 10:20 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> On mt8192, the pinctrl node has pinctrl groups to group pin
> configurations. Each pinctrl group contains one or more pinmux subnodes
> to list needed pins and their configurations. By supporting multiple
> subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
>
> Update the mt8192 pinctrl dt-binding to add the missing pinctrl group
> node that wraps the pinmux subnodes and update the example at the end.
> While at it, also remove the example embedded in the description since
> it is redundant to the already supplied example at the end.
>
> This same change was done for mt8195 in commit 79dcd4e840cc ("dt-bindings=
:
> pinctrl: mt8195: add wrapping node of pin configurations").
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

This patch 1/4 applied to the pinctrl tree.

Yours,
Linus Walleij
