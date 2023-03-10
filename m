Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D385A6B4AD9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 16:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbjCJP1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 10:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbjCJP04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 10:26:56 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C16514ACFA
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:15:59 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kb15so5619048pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678461319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FUSLMud1/EUO2NdxXWv5FFRYsGvYVv9Bj/E6FNg3XM=;
        b=KSYL0HeBee6gC3Ooo5RDvQ/NDo7NPFYFWoexV+6YlpPeBL6uPGEaAhIssTKs8/hOmj
         FEVHYrXZGi8/E6F/NRYAnX4IewU6GMRlWIQwRv/urg11l/hIiEaX4Ao4OMblkslH3T+g
         xtctco4x3tmMfWf15OmHVER+prZt8kcCIpGvAOlTc9cteSgE5YuzbfHtkckPXTqKJ6Ow
         VnezORrkqdvYUpUqdLCt5jFhQQOE0vOl3hALjZlWpMR2RnVm0WIBN0/oFOylw1QTGxWV
         diKo5pC9r3aWeEY9FQw/EKIxzy1GWafAFOAJi3rLsbPd/L3h1qk388sZHtIPBfR4A0z4
         dDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678461319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FUSLMud1/EUO2NdxXWv5FFRYsGvYVv9Bj/E6FNg3XM=;
        b=vsTHxk/cnW9YXQKbpRbZgrGH8NazVGDXdNewTGGpBQCzSEuICmWXQ+ylX3dReHXZJn
         xg4eEsk5WDUuKrl75KpI0quZ4y0rva5nbx5dUp8W4KjvRz5+VRh/StWoSvcpYQb6YHH8
         b4Re/lVxA0ELOxlRj1fnIdUNM0YS613puGGkj/c9wdvRe10m4/yvjVTws2mPYZUbZZSC
         gC6eVH9n8Jj2810cljKELx5SKl66h4xN6Whg3cWV4IfcDXJ+/wqoWVDoKo1Js1sKEwp9
         xLfeQ+seQKhIiyX2wlvOkCOnM5OEe7yHoWT4Pq+g5ElvLWk+A8lXpa9NScNDVurw294q
         HRDA==
X-Gm-Message-State: AO0yUKXVdossqTnoljK03fthu7g68aJWxwEicZ0iPoSBaNfDXVVV58Ea
        n51urzWCViJwB/CzSfFZ8P7lwTtoMskRznCxyVIIJg==
X-Google-Smtp-Source: AK7set8Y8SU2ADi3YJHj/fTmISh50U8e7aW35JZfQM4zz8PalMuTuLly1fUEosqA7lI1e3N8DnOnGTzVYF7XqEfZhTI=
X-Received: by 2002:a17:90b:1283:b0:234:925b:7d61 with SMTP id
 fw3-20020a17090b128300b00234925b7d61mr9645464pjb.9.1678461319609; Fri, 10 Mar
 2023 07:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com> <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 10 Mar 2023 16:14:43 +0100
Message-ID: <CAPDyKFp-2H_7G4bOjYHpXBHe2=8VTEwF3w6HmrPsOwKaZ+auiA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] dt-bindings: mmc: mediatek,mtk-sd: add mt8365
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 7 Mar 2023 at 14:18, Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
> Add binding description for mediatek,mt8365-mmc
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 7a649ebc688c..46eefdd19a2c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt8188-mmc
>                - mediatek,mt8192-mmc
>                - mediatek,mt8195-mmc
> +              - mediatek,mt8365-mmc
>            - const: mediatek,mt8183-mmc
>
>    reg:
>
> --
> b4 0.10.1
