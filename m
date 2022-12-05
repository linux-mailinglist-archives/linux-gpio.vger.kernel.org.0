Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D49642933
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiLENUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbiLENUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:20:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C781C10C
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:20:34 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so14786549pjs.4
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
        b=xSQoB37UuJKY4tgp5wdRFk+Jl7R8ZVhz7LrwXSbrbklLb9YmO/YJV3aWfjWuMzXxvj
         omoun5S6Ud66T3ElLc81i5TsPhZoAR39ojH/1Wi5QSdttzgYrmTsy/M4lIBg/B3IOetD
         h3immFNZ5DIsJUSfnVrO9h21CRqUHIJN/0LBiCEmBco61C1XqF4DCSnQhvABC3ephT/4
         t6YCxd/sJ5lVnZo36pg543Hs6D6FRmWspx4S9qqt3OQQzZxATzMCC0hOnzJxbyH+GkjI
         OHTDUczl1V59I2H72EN1VUfq/Tfhm3rHppWTPBzCK7D5gJz+f1cu9mH1cgy2xVjA5cdz
         6OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
        b=gHQgoTZGaxsw778juGnIg0JPGPtji+do9XKYLmQTk5gnMnpIj1e32xAW4qkj+pPtH8
         1mrBvOtb+ZNKlR4ZhiOc/f5d8Qq87KEJq8RWcw7sJg2U0xMm3MHb3h7bvZzjPbTc/kTc
         s0O15NvBBq5ejv52cBN/Z+POhE5xS/ow8eVisc9gu3Jm14Bn5DPeHkuFthwyeYwpm8g4
         JvvYBPrk7Ky6y69IZTwDPaJUpbGzS6UfV+xqk3JV5rv0xbvwt5IJFY2Kdn5/NpV9V//X
         OhCP2bZ9VxY+0egtc3ikHJRvKKTfCpgDCBSbfdlzuG73ht2pgctR3prMJUew2qfcYYX0
         0W5Q==
X-Gm-Message-State: ANoB5pksP5ZvS6SlWZZkqPn0/0l4QQFOueTxKlxQB6iOb5ppX84e4/TH
        cg9BfxvrHfM3bEpyAkABIyoQWQ==
X-Google-Smtp-Source: AA0mqf4PU5MhibxptEdBYx/Cd3SYioOJVCBMu5pSY3SfrC83bIr+4Og81l5n1VthaeXFLy+b7Gr+uw==
X-Received: by 2002:a17:90a:5298:b0:217:e054:9ac8 with SMTP id w24-20020a17090a529800b00217e0549ac8mr96191538pjh.246.1670246434046;
        Mon, 05 Dec 2022 05:20:34 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902780700b001899007a721sm10496368pll.193.2022.12.05.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:20:33 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     matthias.bgg@gmail.com,
        Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org,
        angelogioacchino.delregno@collabora.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 5/7] arm64: dts: mediatek: Remove pins-are-numbered
 property
In-Reply-To: <20221129023401.278780-6-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-6-bero@baylibre.com>
Date:   Mon, 05 Dec 2022 05:20:32 -0800
Message-ID: <7ho7si56n3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Matthias,

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the unnecessary pins-are-numbered property from
> arm64 Mediatek DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Kevin Hilman <khilman@baylibre.com>

Now that the driver/binding parts are queued, I'm assuming you'll take this=
 patch
(and patch 6) via the mediatek tree?

Thanks,

Kevin
