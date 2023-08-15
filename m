Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6155677C9F2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 11:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbjHOJIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 05:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjHOJHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 05:07:35 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC8911A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:07:34 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d64f0c2bc95so4351930276.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692090453; x=1692695253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJiwa7MX7E9UzCFZRPS93zbDDNLkVOtjyj6xJhd5fHI=;
        b=Gwn/JRJCEEG3RzTctzi5baxq1GNHVPoTdzdSW8HQC6lhuPhc05i4QKK/RvP5fnCkLi
         CTPO9v4lQuR6T0HCawxn1jpMIB1u2o60Jql7qnHqYVPLN7r3MuLwgR4kCxfYHAf0v7Sl
         Jrj4DqDKoY+WPWsehTLjW4aYsghUiHiS8YN40ZJF9npjZDFs2rwVRNtAUM3uFextusUL
         S0aRw9gVbKeWXlj8hfVp2gwasHNRguPPt/k2KNcvYHfi6kxxpygAZ5zicbXLDJy2CBIc
         mz2wMFHzdiEYS44c4p1ivn0fxR7nPnYAHv7IsrGIJKU3gj86b9Em7ZrVFKT4GLL19doX
         wEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090453; x=1692695253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJiwa7MX7E9UzCFZRPS93zbDDNLkVOtjyj6xJhd5fHI=;
        b=PFLp8P61qjU20Z8rJD0ncoc6paXCnfuV29U2EboBHiVxq9Q5IcPK4FE6YbLSbg8kKn
         5NMBMUYyOtjixVMuGz04ZXLthgQeqbbzQZ/D5yY1DxKCiwfvX195bbcuJGbiCLu7zNEt
         55WX7Hyg7xUQqb/cXhzwu5LwLPWRkTbQuNZRDMkiTFwX4Y4ArIpD8Wy1z6FsWi5UE1p2
         zX3yBw8sEt3uNwt8hiqsLleyAQCHXYN9pj69uxQ9tFv19y9NZ/a6xAWnuQIZMddg6OwE
         XJrTU70BlgrpTXFK/5J+v65r5MlAODoyD6gVImIkU1gxlS7TwEnNwSL5fTK9enDLP3tG
         S4Qg==
X-Gm-Message-State: AOJu0YxLy4Sry6MqEUkAA0UlAVcmv+v7iyk2kRbo0hwNhx/0E1q7Iivo
        Hl6C6F6IuCJgK+5mNZQGmPM5xrnnvEQwo6h2sJpt7Q==
X-Google-Smtp-Source: AGHT+IFxreQVgIKgg4ARVAgssmx6oUKCAKo87yIkx7T3/VZxIUtSvSF6EhjfXJPBHlRd+AtI3dpnbxfbc+KttA68TQo=
X-Received: by 2002:a5b:18c:0:b0:d0e:9914:f5e1 with SMTP id
 r12-20020a5b018c000000b00d0e9914f5e1mr11458463ybl.15.1692090453424; Tue, 15
 Aug 2023 02:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
In-Reply-To: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 11:07:22 +0200
Message-ID: <CACRpkdZmLFb_abUqN8_oNTx8NGt91Ub8KMftiY8qiOpRS_uGSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: oxnas support removal
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 10:16=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> This patchset only removes pinctrl/gpio code, and is derived from:
> https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remove-v2-0-fb6ab=
3dea87c@linaro.org

Patches applied, sayonara Oxnas.

Yours,
Linus Walleij
