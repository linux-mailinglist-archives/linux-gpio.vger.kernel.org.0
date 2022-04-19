Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC61507BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346804AbiDSVRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357936AbiDSVRH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:17:07 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6C0419AE
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:13:46 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2eba37104a2so187335627b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ca63RDZP2/Fhfduz6S7nMbWQq2gHUTg7QQlbnT0kCs=;
        b=KauUyG3BMITTVwlUM0DdJiCAHqmwzHq8NOc3VoUwvavZzikh9PsyOG0ombzvtAmEBt
         RuRiPkPVmUGPu34MXTDAECFDJQ9K2FCq/8lPnIlfKgkNVn+0VHebX92OZ9bVnNCbVcXV
         LU0snQSURVFYH4FzoYga4oVdza1mWDsel3HUVwBXDJDeyLDljFxGcQ/W6mSdg+UJK9GV
         dclnu2838nfpFl9tUQsV24o8rzqSCK+NijneKWFd7AH+l+7YV0ksJPUiNVECWVPDpm8h
         8RytxIx0awNYwFikfXS/0tllZLVgJEfXxR8V+ocUfntmQcop4zVefLaOEsCSKUTfsUvA
         Druw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ca63RDZP2/Fhfduz6S7nMbWQq2gHUTg7QQlbnT0kCs=;
        b=pYu1NItbWMNU5H0UdgPa+JMTCZk71iA6MywCILoQp2Z78ZvfTKJUU7QfMaprd0OAXr
         p4vjNPWHLspuEUjODpl91GPWbJtFLJYR4Cz18VCkTpzVXlowHl4SWLnGaZ/1qtsOjsVc
         KREWiYfh/2KPOc0iqKk06A0QndpCkuf2mkiNNcUPW5QWV23YtDGMfm7np7R2ajs+xBXr
         8vKxChrYdINZGrPiUy3MTpagnW5segPSey3jgTtBmL9lJaQ9r+eikulkTQim/OwfVEDI
         Lmn42ZqVCxTul8FGLp25vN/qWGUZDqE3V1fsbHzuMEnpT84nBweeJ/00NIpKRbCZ1tPY
         GLqg==
X-Gm-Message-State: AOAM532sZlrYHE+cNxfDEjFcQ6kNgB5uS+WReSviju59fwEMDZ9NHmzM
        Rp5xnN1Ll1Llle7ZoArSpUIkGlNJh65anDCLbJ8TUA==
X-Google-Smtp-Source: ABdhPJyt0MqLnf+DatszokGGQDXTSIysqg2Jql7hWnFyrC9meOK1weMLsDJUvUiJx71pdYgXI9ufHDksHv7z6RPmiYk=
X-Received: by 2002:a81:6d14:0:b0:2eb:fbdf:639 with SMTP id
 i20-20020a816d14000000b002ebfbdf0639mr17895570ywc.126.1650402824448; Tue, 19
 Apr 2022 14:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com> <20220315211936.442708-3-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-3-nfraprado@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:13:33 +0200
Message-ID: <CACRpkdZErg0v5_CcfUMsVaF+Df-cEGZa-+N+kW5bfCfHD+3gQw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,drive-strength-adv property
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

> Add the mediatek,drive-strength-adv property to the pinctrl-mt8192
> dt-binding to allow further drive current adjustments for I2C nodes on
> MT8192. It is the same as in mt8183-pinctrl.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied!

Yours,
Linus Walleij
