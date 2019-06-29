Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44465AC13
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfF2POF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:14:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34556 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF2POE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:14:04 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so8821383ljg.1;
        Sat, 29 Jun 2019 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=02Cu0f2MMPEZvxtYCjjo9cdoIYvTe6kV6bJMyfIwr7g=;
        b=C3X7Njb9DEgT2IW+9FfrLZz2FKu+X6yB/3onHkR15mwuETmKxbwbKW6e7T4PsyVFvP
         R/qoSQjhX/x7spFcu1EPYdBUpXgkpJvqs50xwvaBH6bXAnnfkDpwLSbiU5O1a1SXZmQl
         zn92tnRB1NqakeVONCZ7cAGhqD870W9ahErMQgliBJr8fpyC/puSExlRnPx8x5U2nT3y
         n6Jvk//TgBz8Pw/9AHGTnWSGbd+zNeNwDyz0h9U+mM22l7THqi0o++XPKcoVb8pV0yZX
         3ApGfacc9mknRUw/j1w/STXMAvFZtTCi74IEXI1dy0FZ1/VSVnpSwf1vWdfNAgzVZtQf
         Y8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=02Cu0f2MMPEZvxtYCjjo9cdoIYvTe6kV6bJMyfIwr7g=;
        b=VmyP4gNkS2uSLALMWiXW7nRueWw1MD7YUfqEYil8bqw4pQqjkcgO9YMG0hDOm6B1RS
         +2r26778j8LD+O5RiKhAg9A+slHB7C+dviaRb8lMPGzmDoWdkVzQQBmKYgNFjZolrBVs
         9U22w0tT15KcYNoBUe+oPGXbHj3EiYiqQ+nzi5t8ij7DBhWCSVDF77kKOVdipKwjX7Bh
         QZnqUJYQXU5X8bJI+EFqZKhKZFS9qvuj/cJE94YVETYjkvSwHTX72anoffSOwLq14G6o
         fl4BHHlUvM1crxji3m7EoDzd1y5QHa5Ec50Q0jwe2T3rhd/4ZHtPQ3RXtW7J6hMGdM8+
         0Cew==
X-Gm-Message-State: APjAAAVI0p6ZMzWtwWQsEHNhLJJtFXJEZ+pzRBosDKqogofi5xngGNHD
        ttGKYEbDSefSvAqFfbUoTYBmHrfb
X-Google-Smtp-Source: APXvYqzCfNL+HZooksrAmdFHUlFEUyl0JR7cCePgn3WgUJVxGxhR7AxGfce2VK7kwkIk6NDJNT2EOw==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr9338721lja.114.1561821241605;
        Sat, 29 Jun 2019 08:14:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id w15sm1976164ljh.0.2019.06.29.08.14.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:14:00 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f49039d7-7ab6-2e8c-19a2-aef44b90597d@gmail.com>
Date:   Sat, 29 Jun 2019 18:13:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds system suspend and resume support for Tegra210
> clocks.
> 
> All the CAR controller settings are lost on suspend when core power
> goes off.
> 
> This patch has implementation for saving and restoring all the PLLs
> and clocks context during system suspend and resume to have the
> clocks back to same state for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

I'd also change the commit's title to something more brief and explicit, like "clk:
tegra210: Support suspend-resume".
