Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5429932AD09
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837349AbhCBVTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384634AbhCBPca (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:32:30 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1C9C06178C
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:27:34 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id q14so24433536ljp.4
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r1Bp6X2TUGgr9qZgSQhS7kIyMAWZEdmhofozCo8c78E=;
        b=D8gkSeT2wzUCr9+RxZs1jMVw0J/9GwxoQQZUG5y1i9DyeuNAjLuFh3DqQzPY1akkMw
         52F3BC/uO5zHWRGDe8TTK/NJzxUqMHNXOCjEEvmwzjiNVvG9d8JDpdInobytPkALcmCv
         nbCab71U7+A48wRDdpzM/ilB13kCiPEQOdyAxyoFlYlZYNO3uuYJdELE10LsykIk3rqs
         m/9gCFRfuSavzLiAYy7pyAsnRh4CzZr32E0b3SOGWiZPC9EBUoEhiGiXoAU9vgS27k3L
         lIkmWfEVDMi7G5IFlNiOXTIVIquvsUVBn6nKtTwfHPzrx6iMZI5DVFZM1Srioigxf9l1
         Piag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r1Bp6X2TUGgr9qZgSQhS7kIyMAWZEdmhofozCo8c78E=;
        b=j3lZvayuW/MtM8mzlzxo2CT4y6qoopbMbyQJ/+8eUxQDrqABaTiUK1d4AYhv7ZhjSy
         MkIwN636U/hZlXb3RXOH318fEFGcqgLY/PlkVZWpGHzELlPMLXgDQ8yakWY/rYwPvl1D
         dle+muoCBY2+H0mrjdUbCA25zN99Zd9GfR/hElVyOrBlpIjUK/dlDc61aAN0U0k81qKA
         AV4bFPgheqY1Avq7yCR/abefKbUTjuStEcNXNZe52/0QaSf2OkP9I0trFyUm2wCPWbC7
         5yafggPJjAr5CHJUuP7XFdE0LBH67g8xajGrnVQyJ7JJnhudfDfOPzqKDFwfGgXjXL2+
         7cHA==
X-Gm-Message-State: AOAM530rvdJDW67R8PRvbqaHOtoW+APoiI5hnn/j6XprA+uLfE148nw1
        MP6h1dLwhjtPNXvmDpVKHibsLB24QKq7P8AXW/23Sg==
X-Google-Smtp-Source: ABdhPJwsbLWQHce+a+m2pHUDSfd7DMeBlapLGLDVSq9ee6WP+evL1dpN40CM581dz6vte7V78NI7dmX7qNdbrh8wWZk=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr3306679ljj.438.1614698853255;
 Tue, 02 Mar 2021 07:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-8-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-8-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:27:21 +0100
Message-ID: <CACRpkdZ_p6LtewhcMk9zwDHRPH6=W10Gn=PjadQhXvUnyuw99g@mail.gmail.com>
Subject: Re: [PATCH 07/12] Documentation: add BCM6368 pincontroller binding documentation
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

> Add binding documentation for the pincontrol core found in BCM6368 SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
(...)
> +  interrupts-extended:
> +    description:
> +      One interrupt per each of the 6 GPIO ports supported by the contro=
ller,
> +      sorted by port number ascending order.
> +    minItems: 6
> +    maxItems: 6

Same comment here, this is hierarchical.

Yours,
Linus Walleij
