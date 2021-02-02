Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4D630CB86
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 20:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbhBBT1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 14:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbhBBTZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 14:25:24 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D426C06178B
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 11:24:44 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id v15so22324708ljk.13
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 11:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9owLXMczWEb4Ztg0zvw8dotQtfhOiQnS8DYe98Uq1Q=;
        b=C1d/u70iNVqF0YU3/uMpTxQ0i1/b49rZKO9wZhcDe9fq/gMk1BRfTBbDSx7VzP1DlN
         +q2AIdzhBfJ4dzhyz+FQB5W08mXgvo3JpNybGr36rDPgCfkPhKUZLK0hJ4MQCsA6sX7W
         XNPheltPipapQI6sztWLU5CYXj+imwMPzmn7bcjBkrNnqhGr9wyTk4cNmvJqWzGlyKMI
         RDLHwSicaXXtVz+Wj7JE34/UjHEtq73pudJueXEPVgtuzOd55DtZJNfd9JrcbYmY17YT
         izu1uLg+L8YZF8GyWk9H2W3UVJjbKLyUS73Uc5HDOE0v4BdL/Ufmy5k//VUsn0ZDKPnL
         31dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9owLXMczWEb4Ztg0zvw8dotQtfhOiQnS8DYe98Uq1Q=;
        b=bqrl3/4ArF8KaubOO/Yev3/Nm0/2hFuINYwuGTwlewkJnPVL1zoQ6ozLNehQLe/AEE
         mwFByGc9cdK7eGyWNZm5AUri73TTxWM5pQ5wG+bMmh4x7nQX2gyHuetBj7ImA65lnHU9
         1YSfXV1e67Yog5MHc0P9rUynV5HINOh5eiVTKxz1abRqUct88GxvJPxCZvrUS/zIEgy3
         zFkSxYBU4UMkky0ymQglOQSx4UZgGJBPV/r9VZa6/VuUQNcDNv5M9APSumt5QCWigeiu
         MnuUmOFt+hgEyo0Je2TcFXXQsVu8FL7s4+j48/DTRTyRhlZxxbKgbqsCK62HPjD85Xd9
         iHuw==
X-Gm-Message-State: AOAM532+7JapdDCErkhQZ9npyIMWivgX7Y4oFrK8GLrPtZLgReaXC5DT
        i1PRKnlsWLeYpgziJ998/zGnj0Yygosg5qF7LVX17w==
X-Google-Smtp-Source: ABdhPJw19V4spv4EJbAssYDHp9VPhqKgCm9OtOemkVez3j2HW/g7+RN/7eYzkiLVuxBKet770V59kl8cU/7dEYxYL6U=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr13398675ljl.467.1612293882781;
 Tue, 02 Feb 2021 11:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Feb 2021 20:24:31 +0100
Message-ID: <CACRpkdZs6Z1r9Fa0p2vu+234rXrJ3tvS=0OeJsKJE0hnkvJ5+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

For the entire series.

Yours,
Linus Walleij
