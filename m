Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BF65A03E6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 00:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiHXWZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Aug 2022 18:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiHXWZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Aug 2022 18:25:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B18165801
        for <linux-gpio@vger.kernel.org>; Wed, 24 Aug 2022 15:25:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so9800451ejc.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Aug 2022 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kDVToxNABKExacQDRas3ZfiqJDBEhrku2fBWS/e4Ums=;
        b=QbWgY9eUD1zG3WgOqqUfxW9fMX6snU4715+IcBpKmh1MrmLrkYTcH7lzfjFBS6FSGH
         HbfJ62NYzu26g5TV7/ztucYz5h/oIUBCz2B8gewsoMFUe59eaQbk927rosFU98AJ2H1L
         cBzYjyAevj3H55ar+M+fMUIRIvtNwlnzcUCg5uWhbGudTsq204asxcleL7jvn3QA2Vf4
         PY2KXQ2xcP2S8EVArXU67iI9bdjzKG77xc0CkzoVIEffBeqenB4DytFkV0RvGb4y9aLT
         Kih8d2Jda6WqiZSYF9lGzhEbrnhfV2Tp+Vk5rbFzfgx0LSDmKlaBMRiZq0F6mQy0oybv
         /uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kDVToxNABKExacQDRas3ZfiqJDBEhrku2fBWS/e4Ums=;
        b=b8sovC1SBi29GxZy7EYEZYTSZ5aY740tJR1RF+6jZV22uSZDbDpQqwC9LUXkfdy7B4
         jfXRADtcZ59B/KVemBRMlrX+HhaGo1Yc9fwNP6unP6cZTIKxYj0tsmO6cZ0zbzdu9BF5
         VQ74VVwypnw6uGqj4U6MY4lAkhfcRf7UfBkpqoU5z4IX9vgfnV5rVYiEk2KftHaX/S3z
         vcurntFWGS/eJWQGaEUO4llEnYtw1952w/bkrwvWm0ilYrbejl1X5g+6Y69Cx1ZX3BLX
         BnXQuF5kDrLFTIKL8tGrAiSeOZlrMPUxfgu4G++et8NVumP68ajEkRNnTAwUJ5FqHXUF
         /aiw==
X-Gm-Message-State: ACgBeo1P99nNPVJ/DZcdbrdpOAlt666ByCduF4RjLdiuGGwNNh50yzlF
        aVThyHnaqRov91wmIXQxwnzWNrTxePnw6qWWhyr+IQ==
X-Google-Smtp-Source: AA6agR6ZYmN5BEtXa49LjztHM12ysUmgfCda/hpQKJfdUpqjhL3Q7V1u/tTNdkmkXGp1bJMtNEXZRj9TD13SM/iJsDU=
X-Received: by 2002:a17:906:974f:b0:73d:716a:7d98 with SMTP id
 o15-20020a170906974f00b0073d716a7d98mr662932ejy.208.1661379910763; Wed, 24
 Aug 2022 15:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220816054917.7893-1-patrick.rudolph@9elements.com> <20220816054917.7893-2-patrick.rudolph@9elements.com>
In-Reply-To: <20220816054917.7893-2-patrick.rudolph@9elements.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 00:24:59 +0200
Message-ID: <CACRpkdaEjTKXn-hcDAtt-Tfq5Ggo01YJBhicWby1fAR7zPJoag@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-binding: pinctrl: Add cypress,cy8c95x0
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 16, 2022 at 7:49 AM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Added device tree binding documentation for
> Cypress CY8C95x0 I2C pin-controller.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Patch applied!

Yours,
Linus Walleij
