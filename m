Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927416CB0F9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjC0Vsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjC0Vs1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:48:27 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A05D9
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:48:26 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5419d4c340aso195583837b3.11
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679953705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdTww4WzcUpLDoiL2bDzx/ldQeZAbCSgPQEL9AHx+Co=;
        b=ws6Qs6nZCHu9bCZ05S9m5EcuGcfNOqs7mTbCwPfPASP6i2cs98NoLhDVm0YWl0BVRo
         gel+5a+Ti2o1fraReFNH5b9h7hGTn7tXgVPbFj7YlNbKGt5XqDrtejiPfweD0+8AZuPE
         tFpcCAlNFSqt8JJwPMs0WxWso++WlAfv1iUi8N+UQgjqZcXSPyL1g3AvQYUZGcSQO9xz
         ETwHwvFg4qSLJLTbVQ8VbVvEw4MS67v88Wc2iM52Elxs5yZ2fI9bJgsoP6sWCMATsgst
         3EN9BhaaraxDRzXFD2QPLaQ+m5lTTzLNh2dE/W29q5LZGYPI6hjoaMMztym02kDG7rTK
         ZS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdTww4WzcUpLDoiL2bDzx/ldQeZAbCSgPQEL9AHx+Co=;
        b=eziLZcP5SnVEcVbQuD5JKJsPFbaD0nTS+NZo5DKSyZzH2SQwmdbZGfAx4KdcKjNmfC
         mUZy/jez/F/PipkKjACNvSXPAQZF9tC2qpb13Gp5J07uN3dWXQXhoxktnlgLqk8lxQzB
         hOwf5igL7V+K+MZUybehK7QWwu39XbVrP2rWC481jIg6B7jcPeUH9jgGtI3UwFG/CrxI
         h/mkJ9x5fBM6hrZeJagNl7y8pRjjJMnmMUxcERhxVmnK08PvY7x77dIIGqvDtOG0gsCS
         unZH6PyfFKlfSHnDTz+LxGYcIdk7f9OIrivPeOSCCUUksB+j71WFh9DrlaBHHT2qx46/
         Wynw==
X-Gm-Message-State: AAQBX9fbhokyURHHx+GsTMK0LNfqZAsfRtokaTSnbe17AM2+YnSws7vO
        MA3OPlhTzdD6nZvqUQgjqtz6H36AMM3b0NBQWK62jA==
X-Google-Smtp-Source: AKy350Ys4b2JB7JAUX9iVy6IEhD3Bi/kXCG2nruSjeIpZO6GuHnrFZeLoV2WgnvD8lgdGNGYCCjSLC9y/fhKrpawBuI=
X-Received: by 2002:a81:e308:0:b0:532:e887:2c23 with SMTP id
 q8-20020a81e308000000b00532e8872c23mr6154400ywl.9.1679953705097; Mon, 27 Mar
 2023 14:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <dd29c1b7-05db-dd98-df40-20a238d89a96@gmail.com>
In-Reply-To: <dd29c1b7-05db-dd98-df40-20a238d89a96@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:48:13 +0200
Message-ID: <CACRpkdZZDHriGoUMXX7uSa2K6pPFZooATOuLC1Ye4XiaWbvjWQ@mail.gmail.com>
Subject: Re: [PATCH v8] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 25, 2023 at 12:54=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:

> Convert Amlogic Meson pin controller binding to yaml.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Patch applied!

Yours,
Linus Walleij
