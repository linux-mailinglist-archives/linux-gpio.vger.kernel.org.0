Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1D41EEA02
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 20:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgFDSAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 14:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730291AbgFDSAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 14:00:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D479DC08C5C0;
        Thu,  4 Jun 2020 11:00:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so8481854ljn.4;
        Thu, 04 Jun 2020 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K5hXBosjT34N5pe55Zo3AXrhYRYyL0wmamJerePymfg=;
        b=f+Q49A8u/sllE4uZIds5hGyaYD7tV1apOkk8or3iXPkoHjuO+YfBSyFwGx2yDzqpJq
         XNNCW9ca4PReoItNsgn6QIy9wIEkFUsVm9AzYPQoY+ZXzNMfTVuIuFf90o1cQhDcBfWb
         L2imJNgj3grrLu058wPejRniR5nQakEPnPlyFZhSOH3z15LmIEZXB8lAaNVA9HTrq+B/
         iIw7RTnTNMo/rif2AwylBWLdDvKe4liqeVymF/TGycUrmw4k0MC0FujfF/ZTstWC8xm+
         KFQkYAm7tzKoT/IGh30N9G51Nt9XwR5+MLOYavrBc77+v9cwXyE5Rmb6d3p4zanX51G1
         HLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K5hXBosjT34N5pe55Zo3AXrhYRYyL0wmamJerePymfg=;
        b=LHrVkp8cjo9zbBCdOU/+l7kEVMbl4AWXnTd9zQmuRcOiw5MmMPrdqS5afF3niqqjuf
         w2A72E2tpsagaXg8nkO8aY6bbGSTffEndaiJmRwFuZ+Q22ND9wh6vClo6Kgiwhv9F34f
         4Pgmt+W2f6qC4wzrzXMr1rV4CtDBclwzi8DhMd1/OBwiRbqxxrQmJTR8RL9c0hOlLdrq
         8gugiCkoaSo8FhfoB7zrAGcr31QM0VX9n6ZneVcLz0ZU75OC4JMrDmexDC7uaoSmB83Z
         F9qndfYEkr+aUFpaWbb17L6IzEMcCWf5Ubp0Li/I58yY3mcT/riJZurU/u29yst8jFut
         SQKQ==
X-Gm-Message-State: AOAM533GR4bhDkFj5b8mvn7GhElfq6UUorWH030woNSIfKDaSauTReG3
        /HqR7fra/cZ3M5wO8tEoQuw=
X-Google-Smtp-Source: ABdhPJxWOe8bCnc/Ps106uS9rKC3UVwmEAlt4lo1901TQelBb1AJxkeq4n5R/lp6ng69HGddbRaQ+g==
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr2716505ljl.49.1591293608363;
        Thu, 04 Jun 2020 11:00:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-173-94.dynamic.spd-mgts.ru. [109.252.173.94])
        by smtp.googlemail.com with ESMTPSA id f10sm77210lfm.34.2020.06.04.11.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 11:00:07 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: tegra: Use noirq suspend/resume callbacks
To:     Vidya Sagar <vidyas@nvidia.com>, linus.walleij@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, skomatineni@nvidia.com
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com
References: <20200604174935.26560-1-vidyas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <70a740d5-05b2-b8a6-fea6-da192f9411f3@gmail.com>
Date:   Thu, 4 Jun 2020 21:00:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200604174935.26560-1-vidyas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

04.06.2020 20:49, Vidya Sagar пишет:
> Use noirq suspend/resume callbacks as other drivers which implement
> noirq suspend/resume callbacks (Ex:- PCIe) depend on pinctrl driver to
> configure the signals used by their respective devices in the noirq phase.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 21661f6490d6..195cfe557511 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -731,8 +731,8 @@ static int tegra_pinctrl_resume(struct device *dev)
>  }
>  
>  const struct dev_pm_ops tegra_pinctrl_pm = {
> -	.suspend = &tegra_pinctrl_suspend,
> -	.resume = &tegra_pinctrl_resume
> +	.suspend_noirq = &tegra_pinctrl_suspend,
> +	.resume_noirq = &tegra_pinctrl_resume
>  };
>  
>  static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
> 

That's a good catch! Perhaps I2C on later Tegra SoCs also should suffer
similarly to the PCIe.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
