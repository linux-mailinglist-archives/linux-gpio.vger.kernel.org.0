Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6655376AB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 May 2022 10:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbiE3ItF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 May 2022 04:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbiE3ItE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2022 04:49:04 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFBD71D9D
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2022 01:49:03 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c2so3050779edf.5
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2022 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KdmTZKV5bAWWibsKGoDyDVnawfDT1ekKG/l9wkg6Dbo=;
        b=O+tMK7fKkNS3cdG00a7FIZz8rDmwpiQ4s28vmwkRJ4H+PxsdNK2NP/kzmoyI32uKvn
         ceLHtiBCigj8mIKJSpIuJW2SCh3qDetUFXBtiFO2K8AkKdlUVjoULSwy+w0+2dj3iHd5
         P6msn19xSYiMEMXSxiI1LrXQQMSQzIACSBdmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KdmTZKV5bAWWibsKGoDyDVnawfDT1ekKG/l9wkg6Dbo=;
        b=NHuu/bGuGspo1RoEfq6NY9gX2cHJvt3SQlihGc8jBsFX5Wr6Iup+hkusSDfBEUY7LL
         NvysKkWjrvEMVfcjtfpPwoN0799Rkmca6HntYtHLhMP8aaMSS/huTXvYYqVpFISBf57Z
         NiURh0ed+dIPBvdf4AKRDi8NH3Zj/ksb3ApIcFy9sHzjwWa903hv1WoTHE65vLtkXbet
         LQtRl8HFbuFvyYvChDSzfe3QwPaga6rExcSSPxwzOUNuCcwEDrJ6KSiR04atsP57wTsf
         ANetwbnGvsN5VXJAKtvkPwFoQyKKnf3aih51wWefb5bd+2UwaPnhXFg9Ly+wmLqu0vhO
         tQCA==
X-Gm-Message-State: AOAM530qMKS1ASRutct9QKID2/zDYtwALKNps53vn4aOXxPX64CwacIy
        a5KEb6CWNAkOrgXEE/w+m+9PH0nF3gBXGL6y7jAq7w==
X-Google-Smtp-Source: ABdhPJwchKnnxjbAHZc6RltykgOiT9kT+2Oq/vjwVsee32HXXttxbpNK8n6+tJXaL8hgRk8PqRd69W2OF9hgdc/ruxc=
X-Received: by 2002:a05:6402:2381:b0:42d:c8fe:d7fe with SMTP id
 j1-20020a056402238100b0042dc8fed7femr7872055eda.248.1653900542017; Mon, 30
 May 2022 01:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220525155714.1837360-1-nfraprado@collabora.com> <20220525155714.1837360-2-nfraprado@collabora.com>
In-Reply-To: <20220525155714.1837360-2-nfraprado@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 30 May 2022 16:48:51 +0800
Message-ID: <CAGXv+5FRAvJpn-Nz08NLzqj+X+-yXLx6w-Bz7qa9g8Ct5xTNYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 25, 2022 at 11:58 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
>
> Since there aren't any users of mediatek,drive-strength-adv on mt8192
> yet, remove this property and add drive-strength-microamp in its place,
> which has a clearer meaning.

Cool! Thanks for taking care of this~ I was looking at this and tried
to make drive-strength and drive-strength-microamp mutually exclusive,
but since they are optional, it didn't really work, and I put it on the
back burner.


ChenYu
