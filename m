Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2D196096
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgC0Vk2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:40:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43657 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbgC0Vk2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:40:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id n20so9069709lfl.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWvqzxQ68orfsU5wVGrPwHZstZeUoZgAwpjc8oVDsBg=;
        b=dE7k842Mne2gjoXyiXH731Vsan6HgmNSIdECyGILZuvPSn7f9Yx8whBsiw1+Ng/GYf
         aNQyxgkyc1DabFksfajSMoalsLlxzy0DtN6GCGpn9kbKcLFLQ66dJbxwP+RfShWaFaBs
         kwBHlIG8f9TLn3TU/5xyYr18HaEZtUQYnQBIwjqfq++mfjO2vIedT+KNDYmxN8nAB6np
         0eqBDeeGN/CrrJ0eXH5NgAqVCiuRSsxnUTaxfuXfOamc44PkTruloNP5erfywvx+cq8j
         33dLPymoCjRrtjGDhuFCm0zl8VV30sS9QVM2ViEM9rOV/fTARij5zU+QqhruhN2ts3BV
         ov9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWvqzxQ68orfsU5wVGrPwHZstZeUoZgAwpjc8oVDsBg=;
        b=JmK9GBylTDAWrtoZ5o4l4eZ2U4spPnt11/sqSqK2JUdXA4PcMfXgtR9EbsCgILR/7j
         GnyuY47kw88E+0zEHw/+YEtmEXbj2OgcRYVD3wiyUDrlrMJm+dj7oBkMOVLQ83qE8cQj
         6Jmmwj3tV5SZRi7Qj9fx9yOAEzO6TqbIv+PyhEOsO7sAjZ4rSVpMUxk2ElE6ROiG51PR
         ro14mQlE8JJQJfNyuPF7gZo2jgkJVnZomrisp5h+fQfTAMdE6rEGfxTuerEn77ZireTi
         +kpjoRkfCpGbrl6tqJnZRqyS4XzacNmJjoFploXrsMz0GR+36EiFDfIvNEV4RWjt8eBX
         V4KA==
X-Gm-Message-State: AGi0PuZQrEmIH4aAw4wPVkya+o59p4/zivpz0QiWn19zaDAsrNThVw9i
        QKtozRXpCph/utTTHn7caSBz5Nivekp+IKWCprxvBEXNr/8=
X-Google-Smtp-Source: APiQypKoESGaxGDUVG8C19mo3Y7gFBZgveCLKoT5xmd9St88Yt/yqhte0zS0kmSTM7co7vkwMtYY66RM0ss103NH/6k=
X-Received: by 2002:a19:6502:: with SMTP id z2mr788276lfb.47.1585345226577;
 Fri, 27 Mar 2020 14:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200325100439.14000-1-geert+renesas@glider.be> <20200325100439.14000-3-geert+renesas@glider.be>
In-Reply-To: <20200325100439.14000-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:40:15 +0100
Message-ID: <CACRpkdYhC7VMEtZbaq8u=iGk-pDAxGJJH-92kp2Sj+z=AxGAfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 11:04 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> gpio_set_bias() no longer uses the passed gpio_chip pointer parameter.
> Remove it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.
I really like the result of these two combined
patches, crisp and clean.

Yours,
Linus Walleij
