Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A190F771C8F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 10:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjHGIt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 04:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjHGItZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 04:49:25 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783DD1735
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 01:49:22 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-48715f54356so1358917e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691398161; x=1692002961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNPsTjNUnLgybBLODECRzVct29J4f21fo2ImBwofA5Q=;
        b=yexp+BmCRTjwlVZqZ+htnOe5B3xdCyE+4/vRThOu+0/7PwlT1s1ziTyqV1M5HhlLS0
         m4+zeCvqUI0NQzCgP2I9HVaHSaXqhwvaEJTL08foQO8xdv7lCQoI99UlvcIgOp/xPslo
         QFbIWGoR6iuOV3OXsxoAFUtpdG0KYwKUqFsa2OIrA9CIhkLM8Vn4/doJC+vyVGk1BPII
         iK8WD1/4B79SEiTlLRe3JgTcSrrAldAeGn6WX2k0UqNKGIpqVgZYYw3p8wBw4L+gEuRr
         yC+NPHATX/UORv8PifDvGk4FHwQ4vaLbReZ6P7u714d45sVE4BbSzKwz+cqINScW54ci
         lHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691398161; x=1692002961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNPsTjNUnLgybBLODECRzVct29J4f21fo2ImBwofA5Q=;
        b=eFdcIssr2F58skUnZJvzR+V/VnUNelGMP64mw64Z0IjB4BZRad+V1O2VohwkoNfcpq
         /Wb2EjTj2EqF7SVs7Tc00HEjiVapPWl9HVoQiwMX7sSwdQ7vGV99M57ot4v4fvoCH5xR
         gV8BY09coyJXXr/gZ6NVpuW/1bnRnXgMd6vxz/DyWe8kwmvbKoTiSNPPl6HGjaFNI8WK
         mq2cnu4xNnHp0mrWEutf0x7+d0wtrxObFcK4AGrWOInEu/pr1fKjf2J70BOBrq9xgU4K
         wJ7s39TEtDOqcRgFTctsOaofI86H4frGNwfPFfGXfCOxGnSiJdv128dCEM/k4DflxFYW
         Ebxw==
X-Gm-Message-State: AOJu0YyOSNiV9wvvA7JqDsXzc1/2p9FCVf6VRMcizIrzs1yvPIEyFl2O
        gmlUinBnHcAhss9sDk9RYfTsKZsi9IxodKnLOfvlZQ==
X-Google-Smtp-Source: AGHT+IGa7Pi9bdWBLLa5asY0NgyOZyKMEeELj4DxSQFkjCpwnCGBn+9lI4om3W+o9wkNmLHzrxBX4l+1oIrMr3o0PHw=
X-Received: by 2002:a1f:41c2:0:b0:487:12f5:de63 with SMTP id
 o185-20020a1f41c2000000b0048712f5de63mr4743598vka.10.1691398161418; Mon, 07
 Aug 2023 01:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230731095026.3766675-1-sai.krishna.potthuri@amd.com>
In-Reply-To: <20230731095026.3766675-1-sai.krishna.potthuri@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 10:49:10 +0200
Message-ID: <CACRpkdY_7D-OORNTyXLZGTTO+GMpX_NuUa1e9UaYtpwAmH7M8g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: pinctrl-zynqmp: Add tri-state
 configuration support
To:     Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc:     Michal Simek <michal.simek@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tanmay Shah <tanmay.shah@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>,
        Marek Vasut <marex@denx.de>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        saikrishna12468@gmail.com, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 31, 2023 at 11:50=E2=80=AFAM Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:

> Add pinctrl driver support to handle 'output-enable' and
> 'bias-high-impedance' configurations with proper Configuration Set versio=
n
> check. This will ensure system not to crash even if older Xilinx ZynqMP
> Platform Management Firmware is used.

Patches applied to the pinctrl tree, this looks fine to me, firmware
patches ACKed by
Michal so I'm happy to take these in the set.

Yours,
Linus Walleij
