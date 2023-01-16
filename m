Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D961B66C07D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 15:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjAPOA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 09:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbjAPOAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 09:00:11 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5F622793
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 05:59:43 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 203so30327781yby.10
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1ttIi9T1Jv8lKb+okwnGnQ8m/nJSHvTSd4dWJNzDLQ=;
        b=Vif8LIymrEdQfoBLSAnJaFmS5DhkZq2YJmQ0WHNKcOqgrS7vhbUV0ke5i7dnazftGr
         OB90m+1apbLbt5NKjRx3VF9QdlZzIMi+TIpsSaiYXIVygs3RH+YqlDQPvJBw26pw8cO6
         cgXec2cKjPCRY5rCPgrAjsPf7vnhhU6Ek0POsodoMIW1PbKdBXueB4TAqxQ/FI3uIeM6
         YXEl0RkchaAqubP0snNSXzucBZK35DISeNXKLMutsu2JQECylXQv4jbrBA3fzt86SltE
         1nT9tN2+5WDu7yQBtrnLl2FdOi0gvzAqFrE4X9J0w0bHW/OCOtheCbLlpIQXIaQXkm9J
         IRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1ttIi9T1Jv8lKb+okwnGnQ8m/nJSHvTSd4dWJNzDLQ=;
        b=DMRw4w37T7ULnehxheAH+KlBloAG2QBxnM9jltHdLM5iGONqmOZ/1SicwBhKckqZtk
         +C12z/szgZzyvrJTAyPiqgI6udCgueFb+Di9B0/B6OoeFmnBobYl2Jv5l9BFU/uGKErR
         xDjc74dN8sTCWMPDNGgV1Y4lXBdX18Sc5xh1sPKzWXgUZZpZ7q2eXsgljp0Xfe16JTcH
         u4K+P0L78QRp6xjRBGEcJDlqhMdKe0a1CMf3NZShHqjCrzYwQuBR94f/k9b5REkTLV49
         tgSq+iYxHKn8jas6Yagww4B5fr+iAADOD6Gmrk/rRTxZQJmtO6iKlT4pKk4jedIELaoO
         JWQQ==
X-Gm-Message-State: AFqh2koCx5bLPj2GxYSC3yxD/eDlhxpCJo/vjy2nPBTgbSGs+LoqGohU
        jhecgYBlpW/oytOQwWBs22gXQOu+oyz02JDEsyl2AA==
X-Google-Smtp-Source: AMrXdXuYW9CqEWNtglBTG66rTDEihKTr/73litVxbhWFGCXJq+pZNNR4vVLxhzq7EJdQ3J84HuKxTZXJE0NHL9kP708=
X-Received: by 2002:a25:b07:0:b0:7d0:afc9:d194 with SMTP id
 7-20020a250b07000000b007d0afc9d194mr1183633ybl.341.1673877582408; Mon, 16 Jan
 2023 05:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 14:59:31 +0100
Message-ID: <CACRpkdZbkKzcB-P0g_-QpbL6Bgd0XQ45Ax=7WP+nNNZzLrNQ6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: samsung: Do not mention legacy API in the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
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

On Thu, Jan 12, 2023 at 2:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace mentioning of legacy API by the latest one.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
