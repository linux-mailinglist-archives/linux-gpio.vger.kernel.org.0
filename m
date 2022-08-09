Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F1258D978
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 15:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbiHINiP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 09:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237532AbiHINiO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 09:38:14 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1B21A813
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 06:38:10 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso8963487wma.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Aug 2022 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=L8Y3Dk8A4ulKp+C4a9lBQ4PHW99/sTyB9TwnfhAHaTM=;
        b=LPo+XsmRVponWkUQ76JJ03/11N7kIq/yNVGRl+NdtbQz4gzIMzcnhA2v4U7r+vkZ/B
         mdcLP5/g614GV5r2ypxnKRhbhBrg6zdzCFrwxAy0erSRszVQy5og/8i6NOlm2HxCLSTj
         UpkRKWUxBuNOGZeSFASVwy8MnMwKNJBastcZCsAePegT9IlrHWM3dIQr9X1t+aa/zTMx
         t4q9ChDfiuSsp2D9qvW35cuKX0JcHyazqIt6RdTSMilLT/Dgzq6fGi1kSjLa7KidxiO+
         XOPVoVS8/WxXnRdjaildKnZ+4HvW5eoFOmQYceOZhmCNYuFdCDXo7vT7w109tkF7dcJo
         Dizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=L8Y3Dk8A4ulKp+C4a9lBQ4PHW99/sTyB9TwnfhAHaTM=;
        b=4bnn97CPMvc/Ll0pByfVm6NtlN5BzT1CvZ5xJ40xMLRallNMhMzQXNQbwajB4fKWyw
         rwW7XKTFsENlJyX8R3I4BDgZ/mSQxb1GPFL1cfEYZSeb2j3wxZ3+s9Ijbq93l36CGioq
         Ll+ukvAIVtqIVpTOpYYZ/Hy72oSRSNGE9+oFwcYdf4Iv176lO4+wsheq++RQlZx3K/5m
         O+W9iLgL6den0DelzzJn8+QTg3pHEPxMpVmcpQ73Fory+xtyMPlgw02DQb8/wjJD9GE0
         J2PfkuES2GsxGhyyu0nDPyKxE/SJ4/WKtg9opW8f641ZoZD/u48sXJl4M+pQdqwaIk6x
         YhpA==
X-Gm-Message-State: ACgBeo3b+ytQmZyiP7py0GYpAnDPZnpQKSNKHJAD3Bbt4UgOqwnsMIuL
        HXcMq3PxdM5ngRhorUk1NkGR9g==
X-Google-Smtp-Source: AA6agR6P4URfdHdOkFHOO1v+6iVuvXKNBQHssvN6cH1CcKM+ytjDVky+5szgPvRvUOeXW/a0y8PW4A==
X-Received: by 2002:a1c:29c1:0:b0:3a3:79b0:1ced with SMTP id p184-20020a1c29c1000000b003a379b01cedmr15872870wmp.73.1660052289001;
        Tue, 09 Aug 2022 06:38:09 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b00222d512d96asm3994817wrm.75.2022.08.09.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:38:08 -0700 (PDT)
Date:   Tue, 9 Aug 2022 14:38:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 0/5] mfd: stmpe: Probe sub-function by compatible
Message-ID: <YvJjPmAQwh+UxiSz@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220809075416.GA7736@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809075416.GA7736@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 09 Aug 2022, Francesco Dolcini wrote:

> Hello Lee,
> thanks for picking up patches 1 and 2. What about the others, should you
> pick also those? 3 and 4 do have all the required acks, I'm not sure
> about 5 however that has the ack only from Krzysztof.

They need to go in via their own subsystems.

We only filter in patches from other areas if there are build deps.

-- 
DEPRECATED: Please use lee@kernel.org
