Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CFC5B1EA1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 15:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiIHNV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 09:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbiIHNV3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 09:21:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891E7E559E
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 06:21:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t5so24278151edc.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yGzjUAVlbWD9K7WB5zdnXNvMsAG9MdKx18Dh/BG0fAc=;
        b=T+IPtcdLJg303fTaAq+ct5LWwvXOQ/rhVoGClZGMLoYPhMskJNU1QqUjBpaDX6bQB8
         aysHXs4c5+QV/fGHzpw6Lm9KAbX8P2lwqEZX62zLFZjvW8/0xTFB+5zF6AEa67/YiKBG
         oS/YRtgioKnhYbPZiAERB+c7qzh2bDvxLHeiNhcLDameybe8YdRmW2GRaUy94un4d/z5
         Am6C6RjA+Elb0Ua6loxzqY/pnzbTW0XbWcXVq0w53ZWmhdBtdM7k2Sq7jUOrRF9Z3iLo
         iiGJNf9dSTtQ2+bBF2K91nEj4KfaLqF2ZHeGg26GHAV1YTQ0Gd1J4qizLXne8F+NgrC1
         i83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yGzjUAVlbWD9K7WB5zdnXNvMsAG9MdKx18Dh/BG0fAc=;
        b=adT90IVKJiAhJb6+3Yt1jaA6pXS4ScGNLVKbI75Q2woqirvlD6lK4v8GKfLt0QrGRJ
         yWY35SDmmT0TVERYbg8At9rAzLutEw7WrnPkLkDGzd2SN4Lfyogpoqm14bArQTpOZPy4
         aMVCpeyb3YAJoc4DRArwC+TpF/HU5x7920a5BRPj5kOmGIUm3MDAGZ2z18ubGZWMO1s/
         WelUqkXLGWEjPxZIj9uqrOGCfQI6Uex7k8CfT/MA87vNLw4DCTV8WgmaFO33oaz0S1CZ
         vHm2uL4O+xtI3q39I4yfEwUpO7/eW5tVKsZQdVtquNRLLpzYHn9IYI91/WFy75B7oVr5
         h2Sw==
X-Gm-Message-State: ACgBeo1O/BXJAxsaqMjApnnHThNo90pYdzmfAbbeyQ2M2weEA6fCImqE
        jnltd2sCJhlDRCtNBsFB416TiVlj1aWs1fRZorCBpg==
X-Google-Smtp-Source: AA6agR5gu7ZZe9a+j6qGcOZMau8x3QW1vVI/bIdW6gIkpHsboKtJFXGRe4Kpf2DvG8FECjqzZPxoKKIEbjvKVFz3v08=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr7126269edb.133.1662643281146; Thu, 08
 Sep 2022 06:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yhe0pCpfeCpyfPWg@orome> <20220816102725.14708-1-pshete@nvidia.com>
In-Reply-To: <20220816102725.14708-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 15:21:10 +0200
Message-ID: <CACRpkdbMnRNTLcCtqNjKpxWxMbAXLssnuBEuNqAfgDfj3XVfXQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: add Tegra234 PMC compatible in GPIO driver
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        smangipudi@nvidia.com, Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 16, 2022 at 12:27 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> Using this patch we are adding PMC compatible string for
> Tegra234 in GPIO driver so the IRQ hierarchy can be set.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It also has Thierry's ACK from v1.

Yours,
Linus Walleij
