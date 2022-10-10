Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50EEB5F9ACF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 10:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbiJJIQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 04:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbiJJIQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 04:16:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5DE580B6;
        Mon, 10 Oct 2022 01:16:23 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 237EA66022C7;
        Mon, 10 Oct 2022 09:16:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665389781;
        bh=7m1P0uQdVeYZ0P/r2K2/caJqWj5cB2sMteSYpiLHPaI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AftWLdqK8mRvjg/FfSUvul6ff3jDfz84tkNTjCDWpICGur1U8iKFYWOkcxgt5B3R8
         N/Edf2oIX134OBP9WM2xEyx1FdTkkX/77RRIAhOd7eHwoa//SY6DGVneOem+C54mhK
         vlluvK98oLcyGlmFCSsCJXltzn3B/quqwc8BgSzTdXzyjhqTgSr9zFeUXbkxuj2Ukx
         LlSzc6iMaoxH6l2tNRGYFTk1kqovNYJ5GmomWULWJVtt5gI52mYjw3jwdyc1E6nJbS
         7jTObHaFI+wfMSFqMVs82Tvi9XKyYDhCHQ7oCmHCgRkR+12U4NOKA4j2wa/cMtsnlP
         zntjCYeBhNjyg==
Message-ID: <e01f710f-9f62-c5d2-30c2-1d1fc04f0688@collabora.com>
Date:   Mon, 10 Oct 2022 10:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-4-y.oudjana@protonmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221007125904.55371-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 07/10/22 14:58, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The pin controller can function without specifying gpio-ranges so remove
> it from required properties. This is also done in preparation for adding
> other pin controllers which currently don't have the gpio-ranges property
> defined where they are used in DTS. This allows dtbs_check to pass on
> those device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


