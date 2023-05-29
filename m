Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B68714772
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 11:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjE2Jv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 05:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjE2Jv6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 05:51:58 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9378A3
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:51:57 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-565d354b59fso23726267b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685353917; x=1687945917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su/Rx3R9SIBQIy8nzLVz8h4unOUxvvoq51HIXg2HVxw=;
        b=SvgGalIWd4YpI8eO1XbYqYkkltOBsRIAg7aVjdN8kHIzFpwL4etKpQt2zwiS/Na++Y
         x40/GZ6rKzPbINfTSD746IbsAr8IcQjWFM71bPZxb51lpVQDLlCJIc5DOuKAFkJ357gW
         EB+RadmpKVbRMCOZI1FiOzWcOpI/YMdo1IogGxCIuUqkGqlmAHJlTN7JrFB7EOejkM0Z
         TYsH+y4DCN/62wUXm+gJwGVL0sefHaXOvpx5ddoGyR7k+q60FMHU8cGFoudslg1u8BR1
         vxElZPligfVKNmVHKtzpRR68WYzmcD+ApeT9Lhq9m+8b5p8SPj0zFE7EYREk6IG4Y7+1
         rqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685353917; x=1687945917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su/Rx3R9SIBQIy8nzLVz8h4unOUxvvoq51HIXg2HVxw=;
        b=OrXEPa8uh+XAvRJ/G59CiEY3GCGU5f6cIXvN/LXOvQhwtg0WMhSldqbGvBR0QwyN4Y
         eD2+VxUAkt/Tx5lvZUQu2FHGcwuIC4IMuyy20DI0bnRMD81AFk1IJnVYNsVkbix4zeUh
         krh+/a2iO8tWModS+SwSd9nvJad5IIueTN+h3FdTM/sEZreT4khhmm3pID8qDtP3DXfG
         fMdfLWAkWXIkMPhKb00kLEPkRul0QDNpHKfI6SUCQkhFuw4Dlalo9fWrgIBnHh6F7iZn
         2/rkAoTqxCMw0ze9RMFhQcoO92EB2M2g6grJhnh3YDX/CuJVkyRHZpvjLMKA/+cOIBRm
         /YpQ==
X-Gm-Message-State: AC+VfDwUHK5/DVfvsoao4GFf81f2cryRv1gyPVCUi8drh/eES4TGItDS
        g0X3inZpze2+Jgdixdx+/vfSJIkIrfrtnZCpY2RqQA==
X-Google-Smtp-Source: ACHHUZ7ThBBzG5Zs+36ad76vI5Em4SgJRU6DaA7EJm+LaJAP+r6+CaqDcEkYZqMbcGvrTiWS9Gf9/EIH51/1Z/ln1w8=
X-Received: by 2002:a81:4a44:0:b0:559:e8c2:6a1a with SMTP id
 x65-20020a814a44000000b00559e8c26a1amr11677406ywa.18.1685353917052; Mon, 29
 May 2023 02:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681580558.git.noodles@earth.li> <cover.1683719613.git.noodles@earth.li>
 <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>
In-Reply-To: <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 11:51:46 +0200
Message-ID: <CACRpkdb-wp2631KphG+iwnVaYk0Sm9JCLpoz1DuSQd4jXvEdAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: axp209: Add support for GPIO3 on the AXP209
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 10, 2023 at 2:01=E2=80=AFPM Jonathan McDowell <noodles@earth.li=
> wrote:

> The AXP209 device has a 4th GPIO which has a slightly different register
> setup, where the control + status bits are held in a single register
> rather than sharing AXP20X_GPIO20_SS with GPIOs 0-2.
>
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

This patch 2/5 applied to the pinctrl tree.

I just assume it is fine to apply this one patch, Bartosz already
applied the binding patch.

Tell me if this works.

Yours,
Linus Walleij
