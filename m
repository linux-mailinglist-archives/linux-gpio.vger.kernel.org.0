Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCECF34673F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 19:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhCWSJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 14:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230370AbhCWSIs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 14:08:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F37676192B;
        Tue, 23 Mar 2021 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616522928;
        bh=dg/v7I9osNgCOwDkoypjMc9FZHS9w25d2q6433j6+kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIpvHBF3RaO/d533nR7vktfT6Z5dJlqeqaihaU//0GuM9AiyaPuDqLpgPeJUjZq3j
         TRfAQAjndJ6OiSJfSsBe99nd2ZXVFNbdt/OILxBI+ypUC2dOavE7lBIMggaAQ+ofJl
         5hILbGAtwz60tnY/U9bL1ZTwFoea0fTFC+qk2PnhsSHFGRgApK1vjMaOK4Y3qxGej2
         IOQpE79NROFOn0ouMJEpVSYQgN3A3EBcD+dji45jFv24N0uY/l6jif7VdjMApZCj6S
         P+STiRXe0DlRZROXyJFoLZpOKqylillnLF7ShNNFuuwmR2h1TeJU4bIHV+E+H0zj46
         bfei4ohK42x5Q==
Date:   Tue, 23 Mar 2021 11:08:42 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] pinctrl: qcom: fix unintentional string concatenation
Message-ID: <20210323180842.ecpb5yza6bgjdl5n@archlinux-ax161>
References: <20210323131728.2702789-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323131728.2702789-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 02:17:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang is clearly correct to point out a typo in a silly
> array of strings:
> 
> drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
>                                                                    ^
> Add the missing comma that must have accidentally been removed.
> 
> Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-sdx55.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> index 2b5b0e2b03ad..5aaf57b40407 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> @@ -423,7 +423,7 @@ static const char * const gpio_groups[] = {
>  
>  static const char * const qdss_stm_groups[] = {
>  	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "gpio12", "gpio13",
> -	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
> +	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
>  	"gpio23", "gpio44", "gpio45", "gpio52", "gpio53", "gpio56", "gpio57", "gpio61", "gpio62",
>  	"gpio63", "gpio64", "gpio65", "gpio66",
>  };
> -- 
> 2.29.2
> 
