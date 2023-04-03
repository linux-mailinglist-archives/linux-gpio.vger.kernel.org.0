Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52846D3FA9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjDCJCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 05:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjDCJC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 05:02:29 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16EA86AB
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 02:02:11 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-544787916d9so538056097b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680512531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhbtcZltj+ypNIMZCagCuTClsnuy+dnZITVz+eknFe0=;
        b=Y5nv9GAKEk5L0ugkpavxev1XuHuo/DIYsgiHvn8xtDzDiKCALFCZA9Lkpb/EsJXva5
         qnjInYE3ZQgXFmkE0f9Hck6AC0TP4W0hFdRLVV07ftol7GpvJ4BML7mcfdwJkzKlRGFD
         wPIX8aeQWgIipGbHef27DcCkbgzUpvQl1AqVf/kmll1b3uARGqeyk1F1UFkPCWgweY98
         /2XOvTtXlTPIZoVMEm2e68aI5QnjXCp09tEDO+SUltgJQKsH+7jI94KHQzIkb4qcgqo8
         cdP8xwYuMBRdAr3GY78JTpiR/Sy+/E8RbqA0ZWTlvyUUcQUmnlBDJ6/858x3tH1EaiII
         8I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680512531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhbtcZltj+ypNIMZCagCuTClsnuy+dnZITVz+eknFe0=;
        b=jVeeqcNcA2falFJ44klJM+yiTzjc1eHXuJYWYNGNQbaW8XiI7pdeF/97/ieffeDNHc
         Uk81kZvvpU3ehuVPIArcx6elFGaTPwAWqzJ0G49YHrGiljbWVMr+BZJrMpGa3V7hVnPa
         UbARyGdp67ugUhRBzJDSg1ggaO/DrQgt46YWRXQpVPkm3AfMfRkyzg+0JuPIAn526g7w
         qUEmJrq/BU7ALf101+Xc4r82JLDjek5EWuzR/MJTV8SfVFryUit1Bot3IuewvfXtzqpB
         YdpOvthAamS6FoHf9tTmPobTyHOKtY2aN4b7vvsEHC8odFxVGKo5sEVlG3zqnAIoRzNg
         44SQ==
X-Gm-Message-State: AAQBX9cm6D1EQVkUipCg8QjE2Zb3vzjxBE4xbLBS9bPJvkdHV3MZSF9t
        5JxAWvDGirfG1QSVB4GDhpv8xpqlF0IB43VgPNGy+Q==
X-Google-Smtp-Source: AKy350ZkpN9yjY1F5nTfy5VE/mrL48bstbRfecVOLioHamgr6vrDgn91occ4GlSBW5859XCRyPBnKjtEmV/heNbNH0Q=
X-Received: by 2002:a81:b617:0:b0:544:b864:5532 with SMTP id
 u23-20020a81b617000000b00544b8645532mr16893143ywh.3.1680512530770; Mon, 03
 Apr 2023 02:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com> <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
In-Reply-To: <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 3 Apr 2023 11:02:00 +0200
Message-ID: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here a build-able & working branch with dependencies:
https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/=
i350-evk-board-support

Regards,
Alex

Le ven. 31 mars 2023 =C3=A0 20:45, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> You forgot to apply the patches merged by Matthias:
>
> Changes in v4:
> - Remove v3 applied patch from the serie:
>   - arm64: dts: mediatek: add ethernet support for mt8365 SoC
>   - arm64: dts: mediatek: add mmc support for mt8365 SoC
>   - arm64: dts: mediatek: add mt6357 device-tree
>   - arm64: dts: mediatek: add pwrap support to mt8365 SoC
>   - arm64: dts: mediatek: Increase the size BL31 reserved memory
>
> ...
>
> Changes in v3:
> - Remove v2 applied patch from the serie:
>   - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
>
> Regards,
> Alex
