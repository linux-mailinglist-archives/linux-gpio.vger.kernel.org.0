Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41CD73A2A3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jun 2023 16:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjFVOHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jun 2023 10:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjFVOH3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2023 10:07:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FB1118
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:07:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31114b46d62so7541922f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687442847; x=1690034847;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKLDJCUki6m2i2Yj8YRRmBkMsOwCFvMKQuBgaIB9Y6k=;
        b=Vor5zOgHDgKwE57/jXhWprTJAk+7n+tObW73Uqo778zolDvkS46PVvQiOqtvx6G8Bx
         PcTR4PEicGkiOA9macxs4Ybh7tpTNbm77Ez3Xfua9AhOoGhDF5/YrqPy2TghnVpbvZ0K
         qmjMlhkE0bHTCwZI7671X7QBoTFVH1CpAtk3J39pPve+JGEG2gEl1u/Vvq8LSmQW3pgw
         TYAyAbqHEVEkt9NCBxObnNAiI/J852/oPtUt6fcx+8l+HmiIx4IrXN1jRlnK3YUtFCYc
         WKqkVN7qyxU+Q8QrQ0ziM9hIv2ct2osv7iTAouKsvZIBBaCLrLHezcrPoSngkabLnmxj
         4DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442847; x=1690034847;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IKLDJCUki6m2i2Yj8YRRmBkMsOwCFvMKQuBgaIB9Y6k=;
        b=XM/N/seYucA2stvWUHVGgGSEaW3OCp8uY+8oh6SC4dHe/9+S2iOgwajUuswRYbJmox
         1TQ0szr9jRs3VVm9Msuss4GM2OTNTx2s+YAmbbg4MI+lhk4Cz4M0ThfCjI2MKHzfNSkY
         EN0Vpa4+7F77M8TgvfcUvw/Gf9vYWIxcZCcf1OTVdiwtEKKwAxVslruLpQTfRaTSzDTv
         8uO5FI9my/m8i2po/ktnxokVKrzOJ+vQ2VxBMRMYN/rHqe4x6lVggNy562hcavPE3QgN
         xAQq+Ec3BQi/pNAXIHk5GA90pdHKHVCEV0kSRbbHz8RRnJ7VyzRQ94vkM/S87UyaAc9W
         aZmw==
X-Gm-Message-State: AC+VfDxy3UQMuOjXtYnuPBMNZt6I+hrki/Wr1zcjiKsXF+G1L3FF+MZu
        eY0ljspkIVeE7+asM7vu901C1g==
X-Google-Smtp-Source: ACHHUZ459o0Mbrl1XQeBZmwCiHZnymIi3fHP3u3bAUi8YM3OuIeNAzVjVxELTnxgfndkBzVWx1c+vw==
X-Received: by 2002:a5d:4cc2:0:b0:30f:bea9:bf17 with SMTP id c2-20020a5d4cc2000000b0030fbea9bf17mr17683122wrt.30.1687442847181;
        Thu, 22 Jun 2023 07:07:27 -0700 (PDT)
Received: from localhost (i5C7405EF.versanet.de. [92.116.5.239])
        by smtp.gmail.com with ESMTPSA id i15-20020a5d558f000000b0030647d1f34bsm7354291wrv.1.2023.06.22.07.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 07:07:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 22 Jun 2023 16:07:25 +0200
Message-Id: <CTJ8KDK5038W.25ATPA3IS7C8R@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Joe Slater" <joe.slater@windriver.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.14.0
References: <20230620124130.303427-1-brgl@bgdev.pl>
In-Reply-To: <20230620124130.303427-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Just took a look at this since I am looking for ways to invoke the Rust
binding tests...

On Tue Jun 20, 2023 at 2:41 PM CEST, Bartosz Golaszewski wrote:
> +# Check all required non-coreutils tools
> +check_prog shunit2
> [...]
> +. shunit2

Hm... How does this work for you? Under Fedora shunit2 seems to be
packaged to install into /usr/share/shunit2. The installed examples of
the package are sourcing that. So the check_prog check fails since there
is no binary in $PATH and the . shunit2 fails since there is no shunit2
in $PWD.

Am I missing some necessary setup step?

- Erik

