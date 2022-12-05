Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B90064293A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbiLENVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbiLENVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:21:38 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434261C404
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:21:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id k79so11316768pfd.7
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
        b=bA7kTiuyMy0akuLe9I6Y5TgP9Gy1UA4+voCgPw03Dv31AGXnaMq3Tu3xCLVfTtBYuT
         BmEHqWRXfM4T0tjjyfH0OPzCnL56qn2UHFc63E/NNkDRq1UyeZ+LZcH5nSiRFJCcB1GU
         aWom9nox5uFGWQj8KSr7ur8u7qzEutw3B0+D32rFqRRV62cAXlUZdFHg6e8mDpao/8Vg
         iJkRjCgxZLp2Y7MtBQcwFlWMXcrEUllkujlYGIQOkZbpsS85kaD//C+49imHis3uiDNX
         jFB4Hwp/hOxExMtsTQtiqDVOD6l7M4SZ59B4NsAsAAEJvbXqyp0SRf5BFKM2opyA09di
         1Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
        b=xdcChedbKTejLYVAcCCDfMZcV/OCcPcEkMz0/LS/t8wRF/5/2aczx6HDMdagfahefy
         kjaRteO/sBDYE7r0Kau7UNMQVva6sbIsWOp5xFjxEjdOd10JKeE8pGt9znW9SSTOXgbB
         IaQg6iAi8UkJJSLEkTmDAnE7Ssto4j8a0PQ2bZ1BuygHTp8AwjMbGFrUjHGV3XLldgqY
         In//kuiFIH9okF+h50WLQgVmgKXyX2ebq0ElSiGXLGmFma6AsiFeZuV8GJTtw7msRkIv
         NedLVbzFszUBctBtvW0NIxnHU9mapvR2DnvH0kPwmDus/j2t6QCmJPLo6smzK24UpT5y
         EKfg==
X-Gm-Message-State: ANoB5pnPp8meKqNwuA0Xr3DvqFrgz5ceMxr9NXpo8cDbOHY9B2lIeU9I
        l8hepQaX67ZYu8KIJ8Jb8kQMYQ==
X-Google-Smtp-Source: AA0mqf7MiItBstwxtCl5bK9j7nFlFPOtd2lA9WFHspdb9k/DZyXPDYMrLQK0IU6wIzVKzqL9WVWUQw==
X-Received: by 2002:a63:4742:0:b0:478:cd7d:3f55 with SMTP id w2-20020a634742000000b00478cd7d3f55mr1407966pgk.624.1670246496752;
        Mon, 05 Dec 2022 05:21:36 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id g2-20020a655942000000b00476c2180dbcsm8250956pgu.29.2022.12.05.05.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:21:36 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     alexandre.torgue@foss.st.com,
        Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, krzysztof.kozlowski@linaro.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 7/7] ARM: dts: stm32: Remove the pins-are-numbered
 property
In-Reply-To: <20221129023401.278780-8-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-8-bero@baylibre.com>
Date:   Mon, 05 Dec 2022 05:21:36 -0800
Message-ID: <7hlenm56lb.fsf@baylibre.com>
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

Alexandre,

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the pins-are-numbered property from STM32 DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Now that the driver & binding qre queued, I'm assuming you'll queue this
one via the stm32 tree?

Thanks,

Kevin
