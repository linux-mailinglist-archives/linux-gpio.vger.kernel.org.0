Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42C600C69
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiJQK31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiJQK3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:29:24 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E51B4E
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:29:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id s30so15380387eds.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxBrAO3A+UbCpwrWMKyWHsdqCIEvaH0bQazhGAPxX7Q=;
        b=uVRSMrocP0GJ0IYbpBLP/rdkKVJJE2vo2Fw42FRv3ykiRNAM4uY0Qaq/nz7JR8ZgAP
         vmDlO0D/+e62tNeB8Gg+RY71+qIpFXy/QjuiFo4Y9B3yKsU0nmjIem73X9jvw7shNztF
         y5gB24WgZ+hsP7j7EsWKkRPNNn6sM9WOYCAHjp4InRARKKbFECE1vojUVWD/qbHE92hF
         b8qh7OA7+ipkdaPBmNpEp6IWcj1OYs2x5QDDcl8gghQ2a/0xOo7Fyjqg9zntnMB/lRTD
         xpZdPnAjkpqDjSyE4GGOsfL7kDizWystcMaUlAD+WvbbGne+6eJUrpVLR2/5TZxo6fib
         XGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxBrAO3A+UbCpwrWMKyWHsdqCIEvaH0bQazhGAPxX7Q=;
        b=mwm7/EsZbo6iLwTg+QXKRDcTd4wRSL417LuUrMqloTDYdZrFpwemJTq8taIjCGugT9
         uqS2DFMJve5scp5TRy6RSPnUFsUI3QZThNklSQ4yJS/57LXrg/uNeCjhzI/UHnjqVZ4U
         bJM2ZfM2YlX3Fiyw4CwI86MaS2hJSYZr6EPnxXamrb+PxYcZx9trCMlc3KFIQtkcc/cD
         suvkLZE+PkYeC/pjM6nMCHDWvLWZBTuBJKvraWeqdZW8yMM+r8W5IYJImbde3V2UsIf8
         qtZu21tEJTSe0XUqvT7B+K/aDhRvnGAGzRWB+IMNL05ewmoxSIJIU+/MaJj3bZ4GRNUD
         p28w==
X-Gm-Message-State: ACrzQf1JihTRTO0czU1gEOWtMZ8Y87WMdirMWGuhLJ6smIJqY44t/KQB
        xNhLWE0XWJeaBi42jxStMyAt4+3UoKlT86dA1XmA+sl1bQc=
X-Google-Smtp-Source: AMsMyM4MFxc80OVxEczpjsjIUXBmz4IFiHsPtSXgd/OH9su0TcYYPZqnRbgdT2f6gXTx8SVbVh5kYHJddz64on8GUVE=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr9598896edt.172.1666002559315; Mon, 17
 Oct 2022 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221014103217.1.I656bb2c976ed626e5d37294eb252c1cf3be769dc@changeid>
In-Reply-To: <20221014103217.1.I656bb2c976ed626e5d37294eb252c1cf3be769dc@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:29:08 +0200
Message-ID: <CACRpkdaJWdaPUqHNSBMcs=E7TG86-Z6EWjDCoehg8BinW2VqVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Avoid glitching lines when we first mux to output
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 7:33 PM Douglas Anderson <dianders@chromium.org> wrote:

> Back in the description of commit e440e30e26dd ("arm64: dts: qcom:
> sc7180: Avoid glitching SPI CS at bootup on trogdor") we described a
> problem that we were seeing on trogdor devices. I'll re-summarize here
> but you can also re-read the original commit.

Patch applied for fixes unless Bjorn comes in and tells me to take it
out.

Yours,
Linus Walleij
