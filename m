Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3D56B8490
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 23:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjCMWOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 18:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjCMWOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 18:14:06 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A395293C
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 15:14:05 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5418d54d77bso97344197b3.12
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 15:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678745644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixG+7bGig9QHUQWnSF4UiYBq7vDEpHXZ8tekX/nmxsQ=;
        b=i8CxBO0WR7OmBfqqlAHQje/zcyzikon1rCEQV8cWh4onUJHRcEPZyLMZHhYU8qM+wG
         tJzYFRNjiv1Z/A/sTasyGUOYa4VvMcsgTB5BpgqWnfGW84mjSKI5Mz89MrAdDJnorOwL
         BwanhOpukWSMVYSZyxO3rXY1pN8mY+BqNm4Beaw6YsLf/JPIPXUbt3MXDFT3t8Y0LK6u
         zZTkyf3m+KAQ5GPL/bPmsc+4fAsNSOagyt6yPbRI6DD016o5xrlwDmOcru7T9XjoLIPp
         A7B29wj2g8acbk3A5z+k4Kl0d5CN0tP0/YDsUdxAqmZ1w5q4Uq4UFH5TuzFxn1wneijl
         AKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixG+7bGig9QHUQWnSF4UiYBq7vDEpHXZ8tekX/nmxsQ=;
        b=UCqduubzmuqf0LBM71e7eaVsPSd5ihdsJn/ThofvXsvLWMgtwTIAiQ4XuKuZkVrWmx
         RdGheYfKu0Rs/0UAPVQBwq6wKtKmg5bGXcRjjYX/y88Og7M5Fi9q5Yl1df47/JG+1YuZ
         C3wJ7Bp1eQBAFUkYoNuv5F/IOlR1zDeV2MnakGqdHAUYJj6c98N8OdYlzG80TNxsCm2H
         yEVv5/rCoA5LbB/iWhs0WyJATHHMqbWWp5zJDOV0BUYOaJGRltfET3PVevr/2GNQm8UK
         mwGAq2X+KURM+L4D3esy9TcrQc8IjVk99eTvOLcrZT1PVNYHJXwZDDqP+pDfEc5zkocD
         1yPg==
X-Gm-Message-State: AO0yUKUspihMPtcabg/+a30bMof7lt6/EumzTsg+CuCg+I/xXJ6nSo0E
        QnMcTI+Mmts78cC3wKHjEnNxOorKHUmSbDIUqNQfag==
X-Google-Smtp-Source: AK7set+Bv76Po4Imp7oNwzB71WD5iLKQpfUzXDzH+Fp9A4JeoAaFi4DIdhTJ4chpyUfVvGitWyG/QEjZRdrFvDwK63c=
X-Received: by 2002:a81:4005:0:b0:532:e887:2c23 with SMTP id
 l5-20020a814005000000b00532e8872c23mr24535003ywn.9.1678745644324; Mon, 13 Mar
 2023 15:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com> <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com> <CACRpkdaj-0dyqWdSbQbjyUed+khDLi-awgan1BnuDvuY2JBzFQ@mail.gmail.com>
 <d26bad8d-82ea-ed18-fa3e-081ba0d5dcf6@ncr.com>
In-Reply-To: <d26bad8d-82ea-ed18-fa3e-081ba0d5dcf6@ncr.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 23:13:52 +0100
Message-ID: <CACRpkdbDftrKzSHfRaO8Bk83FT=JwjR-X3M6wyjds4Jo9y8cEw@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     "Leonard, Niall" <Niall.Leonard@ncr.com>
Cc:     Sean Anderson <sean.anderson@seco.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 13, 2023 at 9:53=E2=80=AFAM Leonard, Niall <Niall.Leonard@ncr.c=
om> wrote:

> > Niall are you sending a v3 of this patch soon?
> > Include Sean on the reviewer list!

> I never got around to working on the V3 patch. The hold up for me was
> the changes to the bindings.
> I'm now wondering if I should wait on Sean's patch being accepted and
> then I could re-submit the driver changes.
> What's the consensus ?

Sean picked it up for shepherding, it looks very good, as soon as
the DT maintainers give it a nod Bartosz can merge it.

Yours,
Linus Walleij
