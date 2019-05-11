Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359661A86D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 18:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfEKQ3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 12:29:46 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36271 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfEKQ3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 May 2019 12:29:46 -0400
Received: by mail-ot1-f65.google.com with SMTP id c3so8273644otr.3;
        Sat, 11 May 2019 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZzHN3zauAcBtN5IlZNVMcaiVtPK5nHl2Qa8zQKF6gE=;
        b=rjfe8l7g1Lg+z+2ZtXMmi/4mZzY9GSFNBmvwmdQz84cVb0WYB1ebXK99xbK8S79Syp
         XcvjX6NZHcEhfdBykQ3nzhr1qjz6omLREhXKmLmqguH24iwRTy1lkS37+MiGm59EOWvy
         2p4NOCrxwlsLKi7YbCQCRexZPt7DHBghiN/i2gYdnIwH9ouMQH7FbAKUiM0AWEDSPFS/
         uQcRVqdsZrFjaHdscERh6dOvD7P1I67S5trob9Ct1a4CgFxm+vqwO5HIt+4vaJSAwan2
         HZ1DVT1lsNuuDItCLUKwUa3Ikv0jUQ/5Ej8Os6Cl1AVvzLVEYBipj9s+pG2kTtclF8tf
         sztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZzHN3zauAcBtN5IlZNVMcaiVtPK5nHl2Qa8zQKF6gE=;
        b=UrIE/q+CuJImU1A0cfgNDqVnJdCzAxKYNseQOsdADrB9p/bO4fm31BjFwQUB138Bzk
         yJb3jqSciLUdb5p+roFsjKSaCr28yvAqxcg03jvtLXp2dve3qaqilWme+x8NtmEUXlr/
         3Wy1G0Mfes8J58v/mmevQ3dE0R9+6Q59FUyJW1PtXPGUe6jtmJAsPzrDHXJH+WR38pNG
         pKJHio5tEkaitXKIp7cCFmjsQtJbHg+RzpvW/ZZz8rxxxcv8ixX6dQ1PrRggQp1rPrBO
         fy2w1m0J+AbOMDgJO8JaV3aG96NuQhopTuq8O1xAkhyd6gZoA1FQDuDHwjKkzQMafq4h
         LmkQ==
X-Gm-Message-State: APjAAAW66UQt4V1vsnk3K0Fymk0objaFqDE6amya0rnYTYSlCLJqKMLI
        +8mwUzp33BJeeCPgG2Y4D2zumBkSGvoMDyNBG9s=
X-Google-Smtp-Source: APXvYqxYAiLMIsh+e5gmiAeV9giLWQ29St2ZNVL1zPXQU8yHBvbFgyp7oBLutNPeVA3qo176+dZpdjBuvII29LLhj/U=
X-Received: by 2002:a9d:5781:: with SMTP id q1mr10130018oth.86.1557592185326;
 Sat, 11 May 2019 09:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190510082324.21181-1-glaroque@baylibre.com> <20190510082324.21181-5-glaroque@baylibre.com>
In-Reply-To: <20190510082324.21181-5-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 May 2019 18:29:34 +0200
Message-ID: <CAFBinCBoTB8OpZhDVieYBGRgVGD=aXMqGtyYdYLLk7nzSFrpFA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] pinctrl: meson: Rework enable/disable bias part
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> rework bias enable/disable part to prepare drive-strength integration
> no functional changes
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

no problems spotted while boot-testing on one of my Meson8m2 boards:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
