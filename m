Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB1F46F8C0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhLJBuE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhLJBuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 20:50:04 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0768C0617A1
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 17:46:29 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id bk14so11316002oib.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 17:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K4JW2/qEYStrILqartAbBx8B5bJfEolL5T76+9kS2ww=;
        b=gnJArJOmqf5dXJgQmwXxkiMoRA26lm9Syi6/vDeIRWWvbI9yqNgFctwWu18wVvkR87
         7bX1DzX+R1/CVJSR7nTJn+WgGjxRa8WCkGdGika4UeHu9CppIpZ8AmiYVAHDdTP/RGT9
         RkxWzF2XyE0n4elmehdxEZ5R3ST3g/iwkD9aie0CqEduZB8FQ3144N6bBpUd0pI337/O
         YQMI8RIArukq0jnHW8ZSrkPF/Cvc0cuWFC10bzAWWdLjYRLDqVVyag8wXRvPSr+y2Tyz
         DiUJMcYShMX1aXyvhQZlP8+TnMwavHx7NQcbU5dg1rrXOaRyZyEj3ku2XSgp335xJpBx
         BOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K4JW2/qEYStrILqartAbBx8B5bJfEolL5T76+9kS2ww=;
        b=pIUiu2OgD4gdJPBcn7FAky6JfF5o6No7mEx/gA3rBL/dDYTO/I1d4FoXroB/OBD3YZ
         PYoc5PQXs/ngB/yGoRDLN3EbPXjayPtNqfMEDvbIgnUuyHYx9qOWdH61pzwnXrqqXi3G
         eHGJOWGKQdvalu88OnLvNAYtJPALXWd5ibbPaONRSElXcKLYj5HdKp0qt4m4fF4wVktY
         oJmyCyvURRrYr2bSwJvQ5GNoHykot5rnjpXhY/BfMpVwvq4TDxvYwiQnv/YdsI4fIjS4
         C+uceX/7VrmWGzhKdlHZBahOk+vIOgjD3ODhy0SKk9oQr27VTMnyWwik+BoxKfQvf2pH
         ldaA==
X-Gm-Message-State: AOAM532y5gv27c0CNEikWfb5Q3cvXj3i6uCiQP9mKrrF82ldZpoFFLGw
        79SmiBJ6WcAH6Vvrjxx0J8wMOcPCZUawq6583K0ekw==
X-Google-Smtp-Source: ABdhPJzAYaCwfSsBf3NmLm9BUy57Q2PiaK9iFhZfHmspReUMseWKJMiLIxy10F1Zzmq9OQfuGU/u7ItKTB1guKDlOao=
X-Received: by 2002:a54:4791:: with SMTP id o17mr9973234oic.114.1639100789236;
 Thu, 09 Dec 2021 17:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com> <20211208173047.558108-4-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-4-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:46:17 +0100
Message-ID: <CACRpkdYoD6dFy3nXJhf=kwtyUNq-UVn0TLHaEPRy=hiJGOb-KA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: tegra186: Add support for Tegra234
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 6:30 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Prathamesh Shete <pshete@nvidia.com>
>
> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra234. While the programming model remains
> the same, the number of pins has slightly changed.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
