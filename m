Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8D6632451
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 14:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiKUNvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 08:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiKUNvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 08:51:16 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2093B1E3C2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:51:15 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id k84so13650078ybk.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OC2dnciZqHbQv7bck4ZM4yvqMVwrtYUiDz/KQUUfBFw=;
        b=x81a3w592lABjIyzgo//7Odymi3SiKhozLTTKlLDmeO+Mn/JvoOVoluXDwKFgHG+C2
         KmO5eRADzFCpDvqkLvL5jTlKCZMM3Ucfsp1pgNxvaoYcp8dyEuqq5IbZm1/Tk2JDKdkT
         7skuRPkwBeVaulSzHHNhsnD/nPc7CxBn2Yc08ngiORywAG/YFbpgYcUxUnPDcfj5VXJ4
         DwKG80hcQzPrtE+lbf3T2opiZIed7ZqGhv9eDBH2PHuupcUtnfPWRR3389U5Kszazhhz
         Wv+ONbsT2C5RX5emiZVcdRDenTxcvCv7cwK22ihLFAGWka4WDiwKgG2vy80tBcVYqLEe
         BJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC2dnciZqHbQv7bck4ZM4yvqMVwrtYUiDz/KQUUfBFw=;
        b=udxB9k7pje/JuXd8w8Yg4FAO63+vIMPXG/UvcQv/xeCaNdpuc/1eJMzR3EjJRaQjJn
         6cTIlWQZI8d1Ps9REvNazZy/6wVGOOT1F3VbGETulgGuER12Gs9MsJahCe6UkRMq6UIf
         vZ46436HQNLhKEBZx5hBbMVoV2HQgRmz3IxLLVfTRisgRajUqchhNF4qeUS3x0t982vc
         6gD1+qmuxWhE5FgwPAuSyB0czIhDkzKC3ptPLm7MlxpQkwU0DaOgKC4NxaTDfSrS5KG1
         VXnk4CItPFEOGVjrz/4y59KEWAcAn4GZZgE3mIc6GbsKRhERQxwXvAYub+exMrNupXRZ
         I0aA==
X-Gm-Message-State: ANoB5pko7iBtdL4sIos2yyLDnvd4iB+H88c6xe7+VYRFwv5rCke/nIqi
        rhaZSYyJFLNqD24uHhFI0P4YXYsxs69EgueUJw6aAw==
X-Google-Smtp-Source: AA0mqf53bbgUybixKyoC3FP/zMh6ddK5kH7FK1QEae9KYabkbpynAnpM9EWfCnBBfYiozyzqsSohAcgz/1Pgy027gNo=
X-Received: by 2002:a25:c7c8:0:b0:6bd:1ca1:afd6 with SMTP id
 w191-20020a25c7c8000000b006bd1ca1afd6mr16645628ybe.43.1669038674366; Mon, 21
 Nov 2022 05:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mdm9615-sx1509q-yaml-v3-0-e8b349eb1900@linaro.org>
 <79ba65cc117db8102bd8f7e30d6d44fdbd0542f1.camel@svanheule.net> <b5970487-9326-9d41-a004-6369e854e530@linaro.org>
In-Reply-To: <b5970487-9326-9d41-a004-6369e854e530@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 14:51:02 +0100
Message-ID: <CACRpkdYZOsBSx_ODLYPc-po8mCs0SB=XCZhvT1LzggHXCmA4Ew@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: convert semtech,sx150xq bindings
 to dt-schema
To:     neil.armstrong@linaro.org
Cc:     Sander Vanheule <sander@svanheule.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 4:23 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> > A quick search for some datasheets turned up the SX1503 and SX1509Q with 16 GPIOs, so I assume the
> > intention was to match "gpio0" to "gpio15". I think this should be "^(gpio[0-9]|gpio1[0-5])$" (or
> > something equivalent).
>
> Damn you're right, Linus should I resend or send a fixup ?

Just send a fixup on top of my devel branch please!

Yours,
Linus Walleij
