Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF65348D2A0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jan 2022 08:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiAMHJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jan 2022 02:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiAMHJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jan 2022 02:09:04 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BB3C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 23:09:03 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id s1so8369886wra.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 23:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsdeaXjgHbZ2/UfrJWYVySumeY+Y3zjY30iyayv+RHE=;
        b=YHDgzL7WyBtEUR5hXa+9UD9QL2wlkZk0puGcMYbYGKfw+oWJegrU708+J4NceKDDsK
         pYHz/tmIrus1E00ZQfDa4HFHXgjrINdYbO5jCcx9+ZDp2/5Kvn8T5A7xInAw8CvWJfov
         hXOY+fNqvnBqvNCnGEng5/yKvCgSHgy7LTrvSuMWqgKNfMeRcc1Z21/pUPWv2S5drNRT
         gS++S66nwOdNa+vEotHLdWBPuis3bTrKI0Z10bhoGYldMYYmpTnfWYfFWYjfpnw2l9co
         lMykJ+lXR3gHmqg/WqQpYb+z/9ao5RpmNpYWvgZxlAVfvA71scx5xw9IBIQ00QZ8eFVz
         Tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsdeaXjgHbZ2/UfrJWYVySumeY+Y3zjY30iyayv+RHE=;
        b=dBwyXcjv24EaoOZ2rLP7bA5OvOZi5vm+DQlfhWDMjFsJ1ZWiOP5IggirR+/HnDteqP
         y2REgl98Y0CW456vz4+V8x3w2C98SKGAdn3gKI7RqA6rTHcGtPJJVv5jhgJbjUSyMjjk
         op1ho3dGKwHy/nunl3Yw27xDGL6hyuCQ6DNOIYpatCoeETn1GV9Kdb4cDY8BAmybUsNu
         2DynSI5o7uOdG/k9oCQ7D6SjXgiOER/2t0BS2q8CbL4+BYCUVfnZpEulLgzRshFs7xoj
         c2AxDwtIu7D2ZNZI9hLKVXtB35D9mGq8QMld3BHHyhOQyZzc6Zq44s92BqbZ6uX7jeRc
         JBxA==
X-Gm-Message-State: AOAM530AT/L2p/lzQaCFNQ/L6Npc9uN+3Hgk8R+dNcYGZkyed5blZ1xb
        jj1cvgZs1TL0a/MjECQZSFY=
X-Google-Smtp-Source: ABdhPJzqetJSsCYuYg8dgmaoQV8E1NWvkLypktD5mjVTcd3MXAQUPCkeonxKhwbIZlKpWKgWPs1IyA==
X-Received: by 2002:a05:6000:18a6:: with SMTP id b6mr2583003wri.675.1642057742486;
        Wed, 12 Jan 2022 23:09:02 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id n12sm5846038wms.32.2022.01.12.23.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:09:02 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     SASANO Takayoshi <uaa@mx5.nisiq.net>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
Date:   Thu, 13 Jan 2022 08:09:01 +0100
Message-ID: <4368018.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20220105172952.23347-1-andre.przywara@arm.com>
References: <20220105172952.23347-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andre!

Dne sreda, 05. januar 2022 ob 18:29:52 CET je Andre Przywara napisal(a):
> Two bugs have sneaked in the H616 pinctrl data:
> - PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
> - PH8 and PH9 use the "i2s3" function name twice in each pin
> 
> For the double pin name we use the same trick we pulled for i2s0: append
> the pin function to the group name to designate the special function.
> 
> Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin
> controller") Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


