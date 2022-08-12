Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7AEA59137C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Aug 2022 18:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239118AbiHLQGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Aug 2022 12:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbiHLQF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Aug 2022 12:05:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481975A88E
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 09:05:55 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id t22so1407366pjy.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=4OVNFUuImLLig/MGlX7vlR8weBzwek79DqD1BdLgOpk=;
        b=hXdOxhnDhpBegqyCoNLEwbn81PWOhosp82gYxw3LUcdKmADMMMEvM8eJldJcSFhZE1
         Z5dRCKke8PHj6jXb6TPIVae6NpQ54/qQzufcn2nzN6JWSGimbxBPyyA3bGN8+bDHuiuZ
         XeAUdTST31jiYPcDve/nvcp4PlPjwnuX1fRImN+0pZMoqzp8SCqekeFVGnfAmKBcO8QB
         UFLnIEZBmQQb9imQ/6qGNY70F1h+1Af98cCgt6qB3FyZg7H6g15ROmRG4ayeCxXeN5o4
         vsFV5z50xf4BA2JPkDedx2vUoU2OOV0wrXqo2euDhmmMzobdlIeqJdzg6N/L0GOrN72k
         mIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=4OVNFUuImLLig/MGlX7vlR8weBzwek79DqD1BdLgOpk=;
        b=qCnRhtaBzhs2veGB6e780t9AGo/tDuwlVKC8ucP7PwSNxPZYibKUJqvZlM/fMiCpVi
         6j816/CHIpaia9UFeDiAjP9K1fp5RDPv5vll7EnfGm9WKrxdcji1lBg8VjSW318Du3lv
         +WUUvX12wcDggXMJoxIeCTTtiMyTn3vGITzJ/kQ2Lg3OcFJHZ3I+588deoGE4YlMOqET
         RPCM3fHBEpMbIxU6sCqtLVMCJenfKt4vMf6B6iO1thcIs1KZnFQoONd+wjGPHvvrS3ML
         QfFQsGWoi/22mfqHSLAfja1lnXAV0xbCJQs4I8Kx8PTEn8yfQuk2Pxt1SA26UokCXCYg
         Wgig==
X-Gm-Message-State: ACgBeo0W1ir/+nJ+F9G6bpks/0X2RO9/8zvk3nL3iQRCxVW+i1ddLDqS
        xsUz2lqILcU1ottjRmHeCBlyQQ==
X-Google-Smtp-Source: AA6agR5/COUTRoAh0UyVgQkf61YCv93x/r8lJgd5f8JFsaDvoPs//RQJEaMQhT8zl7lBJEwuv/cQgQ==
X-Received: by 2002:a17:90b:1e42:b0:1f3:297c:c65c with SMTP id pi2-20020a17090b1e4200b001f3297cc65cmr4993940pjb.208.1660320354716;
        Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902684600b0016d01c133e1sm1885809pln.248.2022.08.12.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
Date:   Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 09:00:14 PDT (-0700)
Subject:     Re: [PATCH v4] dt-bindings: gpio: sifive: add gpio-line-names
In-Reply-To: <20220803155539.800766-1-mail@conchuod.ie>
CC:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, conor.dooley@microchip.com,
        atulkhare@rivosinc.com, sagar.kadam@sifive.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     mail@conchuod.ie
Message-ID: <mhng-5813099c-bd9f-4122-aec9-44adb5d280f5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 03 Aug 2022 08:55:40 PDT (-0700), mail@conchuod.ie wrote:
> From: Atul Khare <atulkhare@rivosinc.com>
>
> Fix device tree schema validation messages like 'gpio-line-names'
> does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
> sifive,gpio.yaml'.
>
> The bindings were missing the gpio-line-names element, which was
> causing the dt-schema checker to trip-up.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3[0]:
> - Dropped patch 1 & the now unneeded cover letter
> - Added Rob's Ack
> - Changed the patch title to include the subsystem
>
> 0 - https://lore.kernel.org/all/20220726170725.3245278-3-mail@conchuod.ie/
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 939e31c48081..fc095646adea 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -46,6 +46,10 @@ properties:
>      maximum: 32
>      default: 16
>
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> +
>    gpio-controller: true
>
>  required:

Thanks, this is on for-next.
