Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84AA5BCB13
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 13:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiISLxF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 07:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiISLxE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 07:53:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3431A2B270
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 04:53:00 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y17so58788469ejo.6
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nT165KwVdFzwm9eF9hv47+7oQR3xfKBQSGECoZbQrwQ=;
        b=yxgCOqzLUyZrbNS4xKX5orKTBMvizkj8LApdrsboHhv1LbRJsGmwXA8RGbPu3gBBuh
         FedWCjxfgxuqKWro5LoPnoe3uzhqQB/ZerkOoD9pRkTkAfS9FTvSU5tpyLNoeK32LfEx
         Ypyx8Wrwn9iVFWdoiWr0/wRotNyfEZ132Ie443HVgprSsl2dE2weO7eimWWW6CWzTCLj
         kib2TaC0B9G+aTGGOHtFDfg/3WEjtyxfzvur9/gSU8g8fugCT6EUxHgOVKcoYSHzkaJp
         tnc7CYpvrdFe73phEFjpXjxJlQxep7v13tdy/Me5WvgM7VsuuQHw1lBt+11ZMfNJ8AVU
         bO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nT165KwVdFzwm9eF9hv47+7oQR3xfKBQSGECoZbQrwQ=;
        b=019houTusBL5bqb0SwFGQcJyX1A7IUFPxkXtddJh4kgwwRb2+igXN5O+PlHfhVsjgF
         8uNTD/26kicnj+n08z9i/7DH2pcIFI0Az2dojXViSjT5cmCDXiYAxRLHx6TAT7+iwQ+K
         zpUsfjHNOXN/ET1RQ71xReLa8bphUywn/d8mZb+WQd7EsqKaRa5wFQJteiz5K9XyEXng
         GlWXXgWz2hyPmHmkaQ4rWqEqZ1hNFThnzOK43WBEtJB+/v4nWe48sRMlBYSDkoCbPAfE
         n6sS/izoeeR43gWOzx41NtxYRTbR0ivTnbFsmqzC3ax+CIegzst0X6PB3ih/tSdNRN2O
         FLSQ==
X-Gm-Message-State: ACrzQf3wc6K0WunNYS/tSt7qvEM4JdinlvEdDPU0t/j0Z8435dXLYNFS
        xMNKUO7K9Wa17Y1C9DRJdp8MMeGICbUAE6mEsx+7kQ==
X-Google-Smtp-Source: AMsMyM5ygi7n4k1vCY3ONaJjWG8v/roOjtXTbkg/tYw05LbaZacpnV8RloAcNYT8n3C/14MsyoxS3UvBxJzajdsfuqA=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr12779573ejs.190.1663588378814; Mon, 19
 Sep 2022 04:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220912210624.4527-1-quic_amelende@quicinc.com>
In-Reply-To: <20220912210624.4527-1-quic_amelende@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Sep 2022 13:52:46 +0200
Message-ID: <CACRpkdYb+RRspmF_tDrD8ESQCNBBNaTDXbVuPhW-keWJ1owBtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add Support for Qualcomm SPMI GPIOs
To:     Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2022 at 11:06 PM Anjelique Melendez
<quic_amelende@quicinc.com> wrote:

> This series provides support and fixes for Qualcomm SPMI GPIOs.

Patches applied for next!

Yours,
Linus Walleij
