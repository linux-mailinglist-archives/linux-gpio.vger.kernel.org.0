Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E91054F22
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731233AbfFYMp3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:45:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44411 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfFYMp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:45:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so12491892lfm.11
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXP4JRJ2rx8WTx/IvB7mQlU4cL4GwpdkUXm1s9F/K8M=;
        b=JvFEoAV7t7A7Gd3chCUpGUWBoH7VZKOdGjwQL1PXHfW/MZ0/GEKzYw3Y49Q+vUBt8x
         RE0UIWrmCQ9HAV5ULaYw6u9jSS4VW3F/LtboJjVX5rVH6Yf8LAsc8uq3RuuPRIRPOOIu
         hGIkyrJLzyB4lGOvU8MWIr0aE6gpNpDoiu8sc/syl0UFPFNpROK0ZDbUfGBRSqWpQslR
         gA2a1r9kJqxMrBFpNwiFaKEZWXUf4mPYNmqzhQpIjGoDqHMnGeFaLDgz6X30EKKWIIwy
         n41PsDmCKGdzDa/2f4JFV2q9WeAEKgPxdwmyaTlXBsIcFW/nX6kwM05fTp9We0hOmo/P
         dREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXP4JRJ2rx8WTx/IvB7mQlU4cL4GwpdkUXm1s9F/K8M=;
        b=YuEDwjJ/ALd9jl+a2dcckW6yOqNH+G7Ql6kQAGHWDGdRJXUqGBDVs7KYTBVJ1SI5oA
         fCxA2BeOKhVg77yd7l1ZnILaWaZXdPEr4dQyBiuYKHz5f/ZZMZe6HlEPC+ixKYGUMVBw
         LW/dzlyc2dRKhegHEMvkvTy5Yzld/pwn93V5tL15qbYGnE/ODeljstZByX5F+HGULcv2
         q9ipGWGiJOUdc7UdUH2gN1FP3qfBUTbZ19ERIpzms5SrKhZ502SoKmtKPUvva/tYJq4B
         hwOxbFR6cf4WjdboWYq+44YT76NhHF91eBGPnBF9BVT3Dz1QkdED1KKO502WZxBbOYJZ
         vx6A==
X-Gm-Message-State: APjAAAV+ABrvWPyqS2CMnJ4lIDdxRmpWcVzs/iASR6NHJOZp8swRdHoV
        KRpeaiypZTdFl2E6pPnFOg0YZxeKfpASlRGYT2Y5vA==
X-Google-Smtp-Source: APXvYqxLapz1FuSnPhrExtNmolE9CysKVN2/5nODi0MRw3m7iwOde5NUq7AMikl8LpOek82orn2zUlstqHlNhkuQdEA=
X-Received: by 2002:a19:7616:: with SMTP id c22mr25050223lff.115.1561466727514;
 Tue, 25 Jun 2019 05:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190618155047.16894-1-gregkh@linuxfoundation.org> <20190618155047.16894-2-gregkh@linuxfoundation.org>
In-Reply-To: <20190618155047.16894-2-gregkh@linuxfoundation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:45:16 +0200
Message-ID: <CACRpkdYjsQbG_ZQXs2d089_bCbd0DBHKJBj0pa09AgpGMiWR4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: tegra: no need to cast away return value of debugfs_create_file()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 18, 2019 at 5:51 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> It is fine to ignore the return value (and encouraged), so need to cast
> away the return value, you will not get a build warning at all.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied, fixing wording and stacking up the ACKs.

Yours,
Linus Walleij
