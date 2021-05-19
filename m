Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50D33883A1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 02:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhESANm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 20:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhESANl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 20:13:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC48C061760
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:12:22 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a2so16323773lfc.9
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
        b=vvBSqOjC78aj5fWRQSsZoFhAPgjyKXreaLn2qc0ueH0m+gryUOA27w2Z+SpYbsW+AP
         wK9J8Qugui3AbS4s0k85oG0VOb5+yNdNc22hkAcg9x9RQIzaoaP8m7j8eAYTrEC/GG+p
         YZMWkAW4B95iGlH2UkU2TftwyCks9Lr6EexgrQWQQLOGdn1LqflzAxDqxSGWQfEItNau
         AgrUm9ex+QWTrpjXbk80zgpFBlCIMYxEsfEhwVXv4sS34SGhO21Y/L17k5N2VhlNdUSo
         UN43A4PQEiEPxbuA/RMexrA9PtL+9lEKgrI5RUcBJoTuA86MdeqX5CtAGoErWgTaBXso
         9mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
        b=n5kD69wj64ubEBOq0ZBIkkdAvqHWciFx+uf6dt4k8PQwkY7KJ5lAHCThmfKYQm1Og7
         YZsXoeq5fiYlh98CVCE/CirhSUL8CNBKYn0YhcaeVZTKEI+FEgCFVNMsqxeS4N+Bxq44
         /DYkH6E8dTxJ/er7qOwfi8bneoRw7h90eGTy673bI3clCXZxhtNva54jGf0MTjsFIJkC
         7k309eVQCx1mwSQTr8cR01rX0FmaFtvOuvsak4MQuN1g1B7gFFnMN/U9ES5mr0/6Cz7q
         ZittNeBy5w8xpYIBomwRPs8xG9xmC2g9VnnvcGf6fglQYXyZ9Frs7KKX2Du4UdLWUNmA
         byGg==
X-Gm-Message-State: AOAM5322imRNqaxU4cLseVitdb5uYAeCb3Ras/NIB/3Z17lYFQuojdAH
        FAH/T+NM+vqJlmCEUSAA9i/6S7RLWD5CdLl53++95A==
X-Google-Smtp-Source: ABdhPJy4FzN7hFkVlARsIv205HJnTPbWVjj0FRfYHskNGYlGD2BX2/SZGDwbbYLTxXAevIsKhZJd4qstb4GB0eWfjr8=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3450917lfd.529.1621383141079;
 Tue, 18 May 2021 17:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 02:12:10 +0200
Message-ID: <CACRpkdb+3MjbtFvo3t-hX9uDDTdnPQx-KfZAqQUrvQQQ42mqKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 25, 2021 at 2:26 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:

> Kernel test robot throws below warning ->

Patch applied for fixes!

Yours,
Linus Walleij
