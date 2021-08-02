Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F623DDE5E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 19:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhHBRWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 13:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhHBRWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 13:22:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D3BC06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 10:22:11 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g21so6236288edb.4
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h2WFxDixB/3t9fazJ8CAmz6nn6qFdm6PXqRa55jZXDc=;
        b=IGA65fp6Y9kJutWjUbrVyl2Fs2yX4Y5Nyw28VRkXSOrXNKV4pwbGtsURCm+e8WZpUR
         x0mtLdrpESyaHaw5TKqAI4w4xDOMKeUyHWzIHWMLfffMCzKuK37dchQ901kx1R8JCCCc
         6i0KLFK3B4yuhCa1XgAC3ZyvHMLOtcSTV1I39so7gLs1g2zafIyK5AdnKEns1eKgIRoJ
         nGtoTkpucKVO/x5axn0iLPo+QW+yyDIGhhfKvmu0Pzf9DKd3u0Lv6XI1hGK1b0+n7pl7
         +k94W8iuHbX4nsGDg8w9cs/qu5UN3+k2ssGkVkTrkr9PxQhyEot9u7KqB5CxRtuG5T85
         3bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h2WFxDixB/3t9fazJ8CAmz6nn6qFdm6PXqRa55jZXDc=;
        b=rVEFGIcnVyTIa6URsAzSg40G7iN+B7CU+KQ/5HAEVTiLMFnZe438hM3aH6jzRF6i/e
         4zQ3rrWNbVgtBGErN/1Hx3qXbCElvWbN0qPDShrlLqIR5tZ6g8SHK9mKyHoxVLIkVI/G
         T/IUGH6oNWwoCI0J9Kmljpp7yEcILu0ryPoQtc0UQI3n+4ijneZ7ACgsdmXgKv6H85+/
         w91JXW9Hwx8hKpoovoDgiRsqeCSZTcJp7igho0u97dMoDrJEl3lr8O1H4fq2bh5p9q9m
         THYdMIF45uGnoeOujXSmxK+Wk8+3YSmGBAI1+WVGhs6duTx5AuvrNZZbS7zZy3KUNATd
         vvlQ==
X-Gm-Message-State: AOAM530zCm8+sRGmc8FTZK5HVap1I5ZjjOlxszOQlSJm1Y9ev98ilmGg
        5LY8+QmhzXzDmCq5ae19TmBnSojwOG/qkltMwrY9dw==
X-Google-Smtp-Source: ABdhPJz19+tyHdDM44MeIwvI3vcyw7uKr8xbYUpmMeohq0U2lnKM5LfUtJK3ERmgE2kBTYOttq+f+oTgLkTURIWbxDQ=
X-Received: by 2002:a50:9ae3:: with SMTP id p90mr20511605edb.154.1627924929507;
 Mon, 02 Aug 2021 10:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YQMIhBPwcNw1YqMq@robh.at.kernel.org> <CACRpkdYrHTMLL_CQi0BoNZsXV3=2dBK38pkvd+EEkuPrzoG_Cw@mail.gmail.com>
 <2f5d9197-4a5e-08b5-7e47-595d337478d2@xilinx.com> <CACRpkdZu2-EE1hqJ4nVA5uxaPuJRGWDH_ciKxRvrNncQ2Pyd5w@mail.gmail.com>
In-Reply-To: <CACRpkdZu2-EE1hqJ4nVA5uxaPuJRGWDH_ciKxRvrNncQ2Pyd5w@mail.gmail.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Mon, 2 Aug 2021 19:21:58 +0200
Message-ID: <CAHTX3dLbRcfBhaqfbcK=RbQOAG5uxpSzHmMx7aP+QYHaP-idew@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

po 2. 8. 2021 v 15:20 odes=C3=ADlatel Linus Walleij
<linus.walleij@linaro.org> napsal:
>
> On Fri, Jul 30, 2021 at 2:46 PM Michal Simek <michal.simek@xilinx.com> wr=
ote:
>
> > Linux Zynq pinctrl driver and in tree dts files are using io-standard
> > properties at least from 2015.
>
> Ooops my wrong.
>
> What about supporting both the new property and io-standard as
> a fallback, simply?

That's exactly what I have Sai to do and PIN_CONFIG_IOSTANDARD is still the=
re.

https://lore.kernel.org/linux-arm-kernel/1626868353-96475-1-git-send-email-=
lakshmi.sai.krishna.potthuri@xilinx.com/T/#md7d304d9d8f746e51d909237b9073f2=
ae8930543

But IIRC I have also asked to show any warning message when io
standard property is used to convert to new property.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
