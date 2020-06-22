Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8953202DCF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 02:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730971AbgFVAHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 20:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbgFVAHS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 20:07:18 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8DCC061794;
        Sun, 21 Jun 2020 17:07:16 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n24so17224666lji.10;
        Sun, 21 Jun 2020 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WvyoJLWbvYovBZDThjO4KvAc+JnCVfaWx2gRyLYJaLc=;
        b=JSelNxKjeXmr8WKOnvqsaDTdPTEfee1w3DFhFJmMY3UJp4rtgHXfEtAwYGxzXz/nWB
         9EycUo1Y7E3+JqRgsL7y0FaGDUc5XJFJKj0nQVrGUwgZXVUCu8Yikq0qUT/oy448Zh1k
         9JZ2eoewFIeGoXoKf/OrDF2Hh2v8IPwvZilecSZ8zFzSTu9L+Hl+L1aowe8yrngRi5H6
         gYD0AG0SLQY6dhxsSRJUguek6LGIjkK13AKMTTjhoaOdxno+x/2tGJK0o8UDFgffQyfW
         1ckwqFvz1+dA9yuTyKxxTDQbzcbU7JdOIkhf2jKw4V9wcyC7E8yL3Sb30nKHtNJmAikq
         I1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WvyoJLWbvYovBZDThjO4KvAc+JnCVfaWx2gRyLYJaLc=;
        b=XOmZ/9tHQcaI7GC01qFsVPCaDU7Ujl2UTLnhDRmG/b+/RWiyoMOSvnuYMp78gDdUTM
         LrYot70FDVcvM2mq0MBJjsVquuU3QZq4nRPxnkM+q2o5YtYDUO9Oc+zzdw4aJ2azNJhN
         o1REXmFMuEveXMQywTQr//srEfO7fqBxVsObz8n2vxyant9IsAeGms5SG37P/iX4qDHh
         qpu4rauB4Mg3+7ExuxgUl3pAhpJSZJWa/7HqPZ27AZBmOXmt8cDnyFcpnV0rjSUWcFEx
         JUQLm3GOCIXYFrYl5BjYAOj+xbi9PLeZcldJT42Y0+RxKOd6HkN+utKy8eNDL8LNweC7
         0rZg==
X-Gm-Message-State: AOAM531GceYRLYHDvkWB2CtNgk8Drf+iWQxvorCw/JrntU+HxfXS+3St
        dqJEJ/zvWYmkYsc5psiDfVBGzFWdWj+FqLAjw6Q=
X-Google-Smtp-Source: ABdhPJzXStpvSWMAIYjnJ83Cre3YeogPrVw5UteM7x6Wp3yQyXcHi7NWmWeev7sXv8YkBeRIUomiDg4LjLUhFiUsizc=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr7126256ljp.266.1592784435267;
 Sun, 21 Jun 2020 17:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com> <20200621213806.551879-7-konradybcio@gmail.com>
In-Reply-To: <20200621213806.551879-7-konradybcio@gmail.com>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Mon, 22 Jun 2020 03:07:31 +0300
Message-ID: <CANi4RBQ-o=K+X_AoZf_NvB19Hum0d9tpr6qjqPThsSNQZaj74A@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm630: Add sdm630 dts file
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Parts of this are similar or identical to sdm660.dtsi. SoCs should be
very similar.
Maybe this can be reorganized, so that we have some common base between
sdm630/660. I'd like to avoid copying such large amounts of code to sdm660
.dtsi file..

=D0=BF=D0=BD, 22 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 00:39, Konrad Dybc=
io <konradybcio@gmail.com>:
>
> Add devicetree files for SDM630 SoC and its pin configuration.
> This commit adds basic nodes like cpu, psci and other required
> configuration for booting up from eMMC to the serial console.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
