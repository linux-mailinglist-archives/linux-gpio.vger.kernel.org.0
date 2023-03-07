Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE096AF61F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 20:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjCGTuo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 7 Mar 2023 14:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjCGTuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 14:50:17 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85861BA85A
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 11:41:30 -0800 (PST)
Received: by mail-pl1-f175.google.com with SMTP id x11so10777717pln.12
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 11:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678218046;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CWFDL0Togo3L/5bvFloyMlrVxNWJz2dZaxBpDesLPPY=;
        b=qWbAWquwDYwhihHD84WfVRkOXTgny4nPq7JZFuNInuDmtfXgC3DiCKWQegLDe8D9+C
         TRLVtH+cSLwj9wv1MBRZKx9ihsv6917yrY96NZI5TCnRQJ3wvBYZjQLH746fORxJVZV1
         jYIRz2rXDVKA50gLXQdmy6Yo0t/DkKLmC6rEXFdd6Gi4QACtS5cZ7GJqHGljLdiTZi+B
         djrAmiWUFL2vfBPB/2awA2palxzGZXr1ZhbgpvURdgv5A/lB9y3p+ozog0lAgyFykZH1
         /qw79wj7i0O7L+Ctof2CNAHxw6893SdFwePwlCO3UbquoDBZbyMsmwb4zcMhOp3sW0gC
         v5mg==
X-Gm-Message-State: AO0yUKX82N6oaP+jj8yCWUoEQkvgK+GmT3l1MHX4Q4j/lqZWFA0OE9cy
        5KH5jnW2TxRSKFEtZqtS++ALWQ==
X-Google-Smtp-Source: AK7set9Pfl0SQYm8o4d/CzeLw+E0U3nXeg314CNzFcmKQNtPX+Scglz04h5m+eRyrouDFqS1XFo04A==
X-Received: by 2002:a17:90b:4b49:b0:234:234c:72d9 with SMTP id mi9-20020a17090b4b4900b00234234c72d9mr16195349pjb.14.1678218046516;
        Tue, 07 Mar 2023 11:40:46 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id fy1-20020a17090b020100b0022bfcf5d297sm9742902pjb.9.2023.03.07.11.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 11:40:45 -0800 (PST)
From:   Kevin Hilman <khilman@kernel.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Bernhard =?utf-8?Q?Rosenkr?= =?utf-8?Q?=C3=A4nzer?= 
        <bero@baylibre.com>, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
        allen-kh.cheng@mediatek.com, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 8/9] dt-bindings: serial: mediatek,uart: add MT8365
In-Reply-To: <0dec66ce-424c-e682-3f73-594e5b1edb65@gmail.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-9-bero@baylibre.com>
 <0dec66ce-424c-e682-3f73-594e5b1edb65@gmail.com>
Date:   Tue, 07 Mar 2023 11:40:45 -0800
Message-ID: <7httywfiyq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matthias,

Matthias Brugger <matthias.bgg@gmail.com> writes:

> On 25/01/2023 15:35, Bernhard Rosenkränzer wrote:
>> Add binding description for mediatek,mt8365-uart
>> 
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Greg will you take 5,6 and 8 from this series through your branch or are you Ok 
> if I take them. They are all just adding a new compatible string to the 
> following files:
> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> and
> Documentation/devicetree/bindings/serial/mediatek,uart.yaml

Might I gently suggest that you take these along with patch 9 through
your tree?

The driver portions were all been merged and the bindings and DT all
reviewed since end of January.

Thanks,

Kevin
