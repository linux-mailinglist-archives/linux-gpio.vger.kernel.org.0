Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0890E52777
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbfFYJFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:05:40 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42506 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbfFYJFk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:05:40 -0400
Received: by mail-lf1-f65.google.com with SMTP id x144so4625164lfa.9
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PfsIEjwno9984x0xaZFvFQRHreP7y383b0yA/8o51ao=;
        b=nFParKFr+QigyexDCDFFBgRPTVH7s2tgXQic1JyrzOYcjzvFaAe0cJHxr3XlvxzlAS
         EqoKOFf6cyewb+42kGLyTQwePgf7SG6lJd4ZkGBUqGk+nrP0IstFMCC8dsyJrh4MG+4o
         y8yLMITzcDvN+qcKEfUIKfrhpQKDA3P9F4vEkqC2efNYSKyO+idLW96uKvbpLkW4YC5c
         k5IHlLaU47Xns1FNHNwJVKZe/7ZDZucBQe9oFpX5hB18sgoAMYhpobbOG+6xsaWebLcu
         dIQH1HMond/+QbcSJZM8ejlgvyYcuZmNXTyCoyVpQT5PbnIyriqEO7x6N/gYrE9rFJMr
         ANxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PfsIEjwno9984x0xaZFvFQRHreP7y383b0yA/8o51ao=;
        b=mx+E1euCRSPM7mFRP4OR2ad/uDR7dJc1E9AnFhUWXzFJV0EFemifjFwtwCyaa3KdTn
         theWRnY5cleErwVa+aNDXVNVkukD5Og8U7Mn6uuC0qQWpkYmWqumVodbjtPq/I0GAvpB
         ZAPoio537MHxcDhxYOsu5Q2+r3ZTFkBRBv/5ag6QdexNHDHb4M3OnPTe/kn9aFwb9eG8
         7gyOLJKHulaTcEVP3suFOGjFmN8U8MBjjrOj4WabPEQ6/e9MXi5heCZRpPKVDrw6ML2k
         zdpPJxMG8O7VffuUm+rZzRxUWwzjsQOkmDlwpH6vrmTidFo2t3S3+GJTpD2TdDnHUh3S
         pdVQ==
X-Gm-Message-State: APjAAAWFDdAmknG9OKzWf9CytScSEOhu8kqhAQLxwT11ei9dO0XCVnxr
        ORNowDzHQHd4ILWbIRtVUA/In13TxLJcAYIXO8GIsA==
X-Google-Smtp-Source: APXvYqxeHuqZCf8OLU6iYGSBN9wT3sJ7A0Tzxmly5Y10lX4/3f8I/dMLymuTvaCc9HjkJUkdC9fFt7v7D9Pf1Y63hFs=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr28635379lfc.60.1561453537378;
 Tue, 25 Jun 2019 02:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-2-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-2-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:05:25 +0200
Message-ID: <CACRpkdaSj2OA8RX-oxK2sn6=fUQd=xB6oNnbErqxbQUMDVg9Eg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drivers: gpio: amdpt: drop unneeded deref of &pdev->dev
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> We already have the struct device* pointer in a local variable,
> so we can write this a bit shorter.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij
