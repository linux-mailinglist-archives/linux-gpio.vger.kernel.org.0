Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE2C32AD0B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837360AbhCBVTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447310AbhCBPdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:33:44 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91C7C0611BC
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:29:40 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p21so31856145lfu.11
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sWSzaWWbzyPyu6uykYAaJrqhSOJqXcp+xt3SDSKUiT4=;
        b=qCx1lcWswuw5DoTlpkHcllQN1I0UiiKbKHGIch77U8NidsjWcZ/WYscKhg+8gJQk7b
         A+Aw4T9iYXS+hD8ZWVr/ylo6w7TpxVpXDL0BVxQm8ZAAAifYYBKShIBeLghuVjbVE+MK
         zSSd1Yd0kiXBRNNyRc6X900oPd18UrslVtJ506N4CFYk+dG2ealuCagpqV8sPZ4X6/82
         oFgwvXoWtsRwzfksjLccHfJRHrLg5T9DpPZTfbQ8VtJgQAP8wAwK+fRRatbNxTzSTaid
         OPtWLlfw7G4PomP2Y9Mawa3+sCs8d5TrczolOh1FyTHeXrRdZXzthYBTmF31G7m4gg2r
         CyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sWSzaWWbzyPyu6uykYAaJrqhSOJqXcp+xt3SDSKUiT4=;
        b=JIthIWCSoWWfONggxyWj3RhDBidgH2DnG/vGN/TUsCwgPvmM3C5Q60vMtHJxcVYsx3
         btii0LKgfSWBwPINfoYEyHUJItS7mO50wdjSNcd6pCpwG3Vc2M43x3TrdfmfCaFgAmC5
         /c1ZpowpYkI8NcKv0M9Mz2SuJV26jwFOGW5/EALnGb6hRc3iqre1fMAywP9e5Mm9yCaQ
         YXRJCxpeL9gz5TGbYHbb4ujKKnLbVX8Cx170rTyNcpngPWZ7+GoLtTBUR6qfhjulaUcM
         X7A+VTOVthwwKa0OJWxgOE+4Rl9fym+SDZQtwsA0+mOKQqcbKmniJHHcZO8pD/EFvt2C
         8pdw==
X-Gm-Message-State: AOAM533DzllTtVXPKwXBBCwS2gK5r41Q9tm3ctb8+wiDI49vjLvRUK5p
        j/xfP4NjqqyBlHq3URuNJDBMwnP+y1RxLAqTrILhnw==
X-Google-Smtp-Source: ABdhPJyaRDfvOXcbXwWIQg1BVpvxTAXseyBY7XMxnAuyhRJ/4QjBxTR7Kl6thFN4h7FWAkpFrwbEtu+nWwX56vMBeBI=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr12813240lfs.586.1614698979488;
 Tue, 02 Mar 2021 07:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-12-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-12-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:29:28 +0100
Message-ID: <CACRpkdbnNEE_c5VHv=42rvKzYz9rMw6JpnbWqnK0mLeAy656=g@mail.gmail.com>
Subject: Re: [PATCH 11/12] Documentation: add BCM6318 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add binding documentation for the pincontrol core found in BCM6318 SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

> +  interrupts-extended:
> +    description:
> +      One interrupt per each of the 2 GPIO ports supported by the contro=
ller,
> +      sorted by port number ascending order.
> +    minItems: 2
> +    maxItems: 2

Same comment, hierarchical.

Yours,
Linus Walleij
