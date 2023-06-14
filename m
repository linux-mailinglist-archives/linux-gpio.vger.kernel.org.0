Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7182272FE49
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 14:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244386AbjFNMSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 08:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238639AbjFNMSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 08:18:20 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA3C1FDA
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 05:18:12 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so864536276.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686745092; x=1689337092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xqwBeEw1hk5xn4VcXmpj3wyZNMEIN3L7jL2szWZp3c=;
        b=Kve0S08CAP3lsH0tnyAqWwbwWFQum8U37JpgmvgEvntnrZiWETPX8Nr+TTYeoiz6Zb
         DG+1Od4ppJkIHwKcLeBb3afwbqyDnxQT4dEEt8QA311SwRpIzxrzpGYvNCf0rx8XOU5G
         Hioq6YlMRz5dVcNi91gR4Hy8FkdWD51LbQk3sQNOEQEXwIN2QIR6BhtFbrkI/lS9iC5s
         00RKflUgq7ueZPdsL8WpEb7P6ym57qDxL+9DtsDV//YE4Qpc+NaSi8spkRuPo0veujWf
         G//NSe6Ij7TIFQ0s1LdxZrtHSHwuFmKEvLsOlilKxXu/AIKSHLuZltbrkmzKGWU43yOh
         yKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745092; x=1689337092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xqwBeEw1hk5xn4VcXmpj3wyZNMEIN3L7jL2szWZp3c=;
        b=cds8kSI7fFX1Q8Vj5gVC/v2pRWshaDVtCHtMRUEBSXIxmXbct9o8iIyXc2Zjvv/ixW
         MlDemwJWMDdwlDkVn7iAQad1vt4+7KHo2r52UeNYVRA+/IPmXe4pKZDbfjoiLGGE6YqU
         TL1uDQsB9sIzVz0gb9p+l10ic1EzQvtJ0+kLUwuzvSBRg9i7fjeST9vI0KaHbhULzKRQ
         +zHj8U0Xnq2DVFK16nol2EBniIbFepiR0HrGi1KC42k4PAABgi8k0CPo1SuufMvo1pI5
         AWaTyQbJeDOY8jWc/nqliKNo/zFRmtmAn7EZ5BfzRtlQ0YzdEPPNG9CLS8qdZSEld74P
         2g5A==
X-Gm-Message-State: AC+VfDxK69HXUVTZm6zhhc6Jts4e2JTSNJS33VoZBNRysP1dWU/wSrgx
        LEATJ0aqot3tgU01DruDVidSSTWlfTu8435KNxNAmw==
X-Google-Smtp-Source: ACHHUZ5+Ben8hijM5+pzz4DLNdhrmBBwVUSAPrma0St94qyK80nZeudAIWhLS7reC8/bAV8yKGXEn+PZVXTYR6RGj4U=
X-Received: by 2002:a25:404b:0:b0:bcf:d645:bd9 with SMTP id
 n72-20020a25404b000000b00bcfd6450bd9mr1963762yba.3.1686745091896; Wed, 14 Jun
 2023 05:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230612125248.1235581-1-eblanc@baylibre.com> <20230612125248.1235581-3-eblanc@baylibre.com>
In-Reply-To: <20230612125248.1235581-3-eblanc@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Jun 2023 14:18:00 +0200
Message-ID: <CACRpkdY91GaddouyEJPaEyfcg_0zCrOz8RO3qhC4V8Oy0rUGLQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
To:     Esteban Blanc <eblanc@baylibre.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        jpanis@baylibre.com, jneanne@baylibre.com, aseketeli@baylibre.com,
        u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 2:52=E2=80=AFPM Esteban Blanc <eblanc@baylibre.com>=
 wrote:

> TI TPS6594 PMIC has 11 GPIOs which can be used
> for different functions.
>
> This patch adds a pinctrl and GPIO drivers in
> order to use those functions.
>
> Signed-off-by: Esteban Blanc <eblanc@baylibre.com>

Looks good to me and beautiful use of regmap GPIO here:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
