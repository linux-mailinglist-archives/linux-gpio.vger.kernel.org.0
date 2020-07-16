Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B055222237B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbgGPNFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgGPNFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:05:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F66C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:05:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so7042268ljp.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruUcWHpAX25SqHSlxnSJmiPi/ZbeiW+By6HZVPnMDB4=;
        b=a3oMNXy1OxKO2GgQyHV8bNNbS8hYVv5rPh91+E+xtFoeq9TGyEN/F7Ue5vCdja5pjc
         AojJoGPXeQk1PeffZ4VS4r4pOaHCjZRh/qqNOkHOKz3l2zpYQtpdQsIHFv37AJrqkjLL
         ZOkUT+h+Cnlg2ePavbRoap5QZU0+Lt0wVVYTgWxN3O1f340VhBnm5ssUCNiizMxZs7ZY
         6PRa27fnggcVzjXMgvILAobdP/4HWUG6DRsMxVKRiEKei48JBj8sRbNIvmzy1tug7okg
         5mMJoNnNr42LyUFgIvVdDqh4vomG60mDdEBEgYcr51qMR3TVGU/1m6WsyBbVKH6Elm1x
         l1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruUcWHpAX25SqHSlxnSJmiPi/ZbeiW+By6HZVPnMDB4=;
        b=RBVXjbVWhPXNYfoMjY4NNn5921MMnnX1KEZHlOZ9NbSsN4o11JagUbZYZVylLFXMP0
         ho2EHI8SfiR1IQveKgdLQMOB0GrVLp4IRJSXUTSwiRBGABiG5F6H8wbWknRj09+btzeM
         Snldq4CFVXtkOxwsq40SZTyJ1gn/DHy8VljMNdLXvn9JOfPGlBRIV6qj/fiRWmG6c3Fw
         bBlEi+DnHiLhYW5uIBAP5fZ9AhSHCoqQfLJaZdeyh4FZC3oFoHCq1j1aWJ66QPscLgnV
         pTGbKmamSrvGdlfzKwNKoEjRz3hc45BqZnAxEm5oyYcZWyNxv8aZI7ZA/eMbRXPdq1wl
         EPnA==
X-Gm-Message-State: AOAM533lIT3QjNxV0I2Sgg4oXERLv+o1Zy3lXwzaeWhRQMLAxbzZqEKV
        ZhkkPk03HZrDsdMqCJcrIBYhsWBRWAZr44oFDXJlsw==
X-Google-Smtp-Source: ABdhPJwZP6ponE8O8lLi1/kuYNusEhjJ7aWp5r5MCmgf5ruim5Ya8w28a0XWndi0+Aa2FFJPlGBKsEmYX0+ShfPxZJA=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1929957ljg.144.1594904752512;
 Thu, 16 Jul 2020 06:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:05:41 +0200
Message-ID: <CACRpkdZ7toWRvWbw-7e7t-HEr5hdApV+F=bDrkv4vkCjGCNCtA@mail.gmail.com>
Subject: Re: [PATCH 00/25] Rid W=1 warnings in Pinctrl
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 4:49 PM Lee Jones <lee.jones@linaro.org> wrote:

>   pinctrl: pinctrl-single: Fix struct/function documentation blocks

This patch didn't apply to v5.8-rc1 so I applied that one separately
after merging in all the other patches from a branch.

Seems to work! So all applied.

Also THANKS for doing this!!

Yours,
Linus Walleij
