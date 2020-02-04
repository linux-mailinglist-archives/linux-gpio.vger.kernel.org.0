Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C509151C05
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 15:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgBDOTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 09:19:43 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:43039 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBDOTn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 09:19:43 -0500
Received: by mail-qv1-f65.google.com with SMTP id p2so8571883qvo.10
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4/e8shLmK1QV0oRTVhpxG3oSJwOsp92FTsok6nu/jh8=;
        b=04VWvuuRZQe7IjNC69CZwIv4IdQdY7dO1sPTVpFLCKDtfFKJZ3+ZFd/bEb8saqJd7a
         zgRJevogjwVeLdw3hJ69+6CJ/pmFnbpRKPUlFwL3z/4uC8ZUjJ04hFPJ9PGURKVHxlvz
         TUUaWEqN5WkgfXUcv3/yW1DQBY0nUFrO+PY7AX3IwFO2SNI/tOGvQZWSRDveoNT5tDhu
         /pcWLg2wLcrgGnYeV/2e+4uWYjbaJ7mywyqXpEa56OsBoRw5kddoqw+REu08K4AvMw2q
         Tv9ge2ZLAoN26n6Piy30NAWezOWObykNMJWBda7IlEkj6KqsveqDgoSw8NyulTKvp5jG
         OkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4/e8shLmK1QV0oRTVhpxG3oSJwOsp92FTsok6nu/jh8=;
        b=A4Hths9L+4J/MYREXh78YlFKN1/MGiGMHihEclzmnjZjnM7Qg7nUfsdpxD5/DR0izl
         78q5z/e+Zv0I0fYkku5cZlOAA18IeWFsRrwKLXmxaFmU9YC/HEMLs5ValwDScGZsHlpd
         J5bq+K+XCA/oNruqjbXAvHB3vcGt03dNixY06KSavbABafQhMQbj7d3Sr2XUi3bE4Dxf
         mmsgo0PhpFwzdrw9z8yIot4uEBpgwKwOZFcWJigSvfnSi8FWFIG78VLzHgsvwNNJNBZy
         BQRJlYQpKVWEHVNtd8eD6X8zB/tvu874By+CcI4YX35GoNcsyk2TUj4D/I6WUL6svm2E
         9bnA==
X-Gm-Message-State: APjAAAU2To7lwoDIZiZN5U1zZihn8YwYCCPQ3QXAXSmDdZ83VE2SdtUj
        KW4yIGctcJYkxzJoKqRMqmuTBq20Rm9BI6fnCR7kpw==
X-Google-Smtp-Source: APXvYqwdUEglgsz8aAD637zQQCNOBhawbIXSOBL5ViUOZIvPmc8XRY0sv+Y+IiJy+i768mTvb9ythAneIGyvOwi/GL8=
X-Received: by 2002:ad4:446b:: with SMTP id s11mr27611901qvt.148.1580825980508;
 Tue, 04 Feb 2020 06:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20200131122918.7127-1-axel.lin@ingics.com> <20200131122918.7127-2-axel.lin@ingics.com>
 <f1968040-6ae9-8bb9-b47d-5e5ec3abf2a8@linaro.org>
In-Reply-To: <f1968040-6ae9-8bb9-b47d-5e5ec3abf2a8@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Feb 2020 15:19:29 +0100
Message-ID: <CAMpxmJWB1Qzy6rM9Zbjnxar00fPub=ZFC3+h6RxzxsRS36ojvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: wcd934x: Fix logic of wcd_gpio_get
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

wt., 4 lut 2020 o 11:33 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
> Thanks for the patch!
>
> On 31/01/2020 12:29, Axel Lin wrote:
> > The check with register value and mask should be & rather than &&.
> > While at it, also use "unsigned int" for value variable because
> > regmap_read() takes unsigned int *val argument.
> >
> > Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>

Applied with Srinivas' tag.

Bartosz
