Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001E85D920
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfGCAfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:35:04 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46941 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGCAfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:35:04 -0400
Received: by mail-ot1-f68.google.com with SMTP id z23so431793ote.13;
        Tue, 02 Jul 2019 17:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6HvJuM18alyeMHoRBjFAJz8IVxm/LOrt6nImzFK3lsE=;
        b=ZL/zgmk5C6P8mXBb7AQ7vp5C1Xz9VF3Onrg6rH+mPkYfq1bkn35Xn/20CUxdaHn/Ba
         As8W8rj8MO2TPxJbLYAsV8Zr1JcXNxcB7S3nTswhG/q8JMEduSCQJcmZLLQ9zOQSQfyk
         kx6R2lLIgaUoq7ViMRDuO36Wn2pKUGkrTuOcSp1cqtLZyOJUPgX447cc56NnfWuKJcvy
         dk+DNAVbg9S/dYMV8QLSIJUIMiqtDPDb9aFykMXk/YpOwSbjg03XRU3rPcXWYsTdoOjF
         TQXzWG83z4s362gpdu9ENdszdpz5ERCO3qPD4xQdAvzEluLxpKpd1AhOMkZ7qym/hOma
         +DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6HvJuM18alyeMHoRBjFAJz8IVxm/LOrt6nImzFK3lsE=;
        b=szqJMGikUpqhNZjWfnCCEG1CoZQnO2s9EhLAEYk9FYBMQQV80GY1Ucj7NvjP7lG9He
         oCesTSL4qn0a5gDvzs2yGN2KRYUr5uAz6ONbjBO9CCVdFEDyvYK8sxwl6KLw9mP+1Rbk
         3Kl1GK0nGeF8cpjN9SJYylPcVDxZhDj6Af+fFWpieWBuGSYaMGh4tIrhz/CCQfPk5Klo
         kY+OEHwy4fxsAu34AcX9F0eX1ovnGALa/8I6iPlLWk5CbV1PKKA828fgELaWnI6AJ4p7
         xkPUKUOVp9A9AUtIV4MIbDGUgbNuyV8HXwvj4485nF49mTSctM153f05tG84GogWyQTl
         3xJw==
X-Gm-Message-State: APjAAAVvuH0gniloCtMUxKFWHd4DBS+JGwp+3aSy9IBz4epPd+gRz8L0
        iDltOaHOyUL+lOO36yqaL1Vz13O9hj6f+eeNykwgsG1F
X-Google-Smtp-Source: APXvYqyZYeVdqlXDt36fdhfbAYHQ2O+BsFsPr+MyhLgpJe6VJlBkHeJ6Eta6tLBIetsFlmHLbT/xvN+x6/atColGNo0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr26108783otb.98.1562108343442;
 Tue, 02 Jul 2019 15:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-7-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-7-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 00:58:52 +0200
Message-ID: <CAFBinCBdB96e4PzxNMbOhuiRrxGz-4vRXu3dOs7n86qoA8MDeQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 06/14] soc: amlogic: meson-clk-measure: add G12B
 second cluster cpu clk
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.
>
> These IDs returns 0Hz on G12A.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
