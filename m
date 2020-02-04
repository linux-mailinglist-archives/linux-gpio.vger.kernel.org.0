Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A2D151C03
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 15:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgBDOTY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 09:19:24 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42817 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbgBDOTX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 09:19:23 -0500
Received: by mail-qk1-f196.google.com with SMTP id q15so18009653qke.9
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JEaZXnQgRmJRs0sCze2fGfvUiD8ItQAT/UDTApx1jBo=;
        b=2ORLFDZ2MpcgvfUAAKbY/ZBOMIdYSYm+bDoyWUs+8ohXlgmGx+XlZ2nG5nwJbOzx/H
         poTEE+/tmGHIUvnRXmTYQCqjcFTa3OrTkIBNzGA+3hlCGR9boYoamV1v2R83nh8mO+Pg
         kNjhPJj49rM/dD1v5Tlhzt22nlp06/h0BPhY0V+vD8NhgX0qatwZ4SsD/b9ZzyPrNZFX
         i5c2M6LTRi943zO6CpCyRg4h2vC5/y5jfMIK5jUftyeIpj6bJf075a536RAdX2I6bWG6
         RWyb0smGgHY9nebYjxt/NuyRtpkbhq89blDqtIjjwlkkcDRpVxlfbh0jGiO/v6QaD3o2
         +xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JEaZXnQgRmJRs0sCze2fGfvUiD8ItQAT/UDTApx1jBo=;
        b=pMcOF9GJoyXSxGHmBaqwsxATIOzc/RCSQ8Rw6SLHntKgqDEdqrERZQiJCCO4dCVYLS
         GY7UZkZFtQsGLKF7aYnCgeaj9c3PotUZjAf8KKzqg7/Un1ETn46wH6L7VDHMpehiAahc
         LU354WCcrOTjimh5YnMXa/X9HVWnFe7+XYDw6Yq9KPO74WMefemoakZwJtfWpmdz5f2Z
         o6iR/XLRDsWLXGYuaM5YfiuobbcKcfmg5z9E16a8R7cb/RMBz/I9R5ppH7mYW/dfOQPF
         BCrkrNhQag9AYHEI7ZctiNTSGjE+EDA/uU3JeDCBjYPWRmWabzXnhAuEZA9I5GeRsKdC
         LdUg==
X-Gm-Message-State: APjAAAUzoF4gsNVfW32IqCnJfIqHRMHzUd4oS6FadzihSd+vaA4ucSgK
        4RFn5la3bZs7Wgl16TtYbVgdlv+D7PPJ7Q9Ts6MLmXpc
X-Google-Smtp-Source: APXvYqwcKKiCE8sNK/qjqtaLlrt2nKYFsYIfO3RRU4twps/qjjjXucWdecDo1SjSArZ6BGEZabTKGZoDSOSXVZL47gc=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr28160135qkc.21.1580825963065;
 Tue, 04 Feb 2020 06:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20200131122918.7127-1-axel.lin@ingics.com> <6ca9f838-cca1-c168-334e-59c3e13ec43e@linaro.org>
In-Reply-To: <6ca9f838-cca1-c168-334e-59c3e13ec43e@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Feb 2020 15:19:12 +0100
Message-ID: <CAMpxmJWG5462pQxSNnULDYs0QGieGCFNOB9HxJnvvUoxhk_9eQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: wcd934x: Don't change gpio direction in wcd_gpio_set
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Axel Lin <axel.lin@ingics.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 4 lut 2020 o 11:32 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
> Thanks for the patch!
>
> On 31/01/2020 12:29, Axel Lin wrote:
> > The .set callback should just set output value.
> >
> > Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>

Applied with Srinivas' tag.

Bartosz
