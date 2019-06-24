Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61504FEA4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 03:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFXBtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 21:49:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38267 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfFXBtQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 21:49:16 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so10909632ljg.5;
        Sun, 23 Jun 2019 18:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=334pQU/K019L/xPgu12eyPFo9ngLaIjC4OmIKGsurD8=;
        b=qoH1VMAtHIpF2Y+Vy0lGAEKDuRzO9hYXc7m77KROcS6j/noy5cZzEbC8pZ8LH0FPGx
         FFvTt+ALdo949E53lDh9R7E/MUTzHiYGN08Il4UZLbWs0QFHG8/4ToeZo9tGvHJCS/K5
         AaCugNsxAIHOh9ImOckVfXx+XQjjPheXRdStj+USdcQQRoLdgfb8litqFldXPQZed7Q6
         zOtvBc5nysQTk/gdFEC+NcUJe0jCxZXAuMyE/g8SmbmTeBZ0Bgjy3KJE1Mk6xJNEo8kU
         tXnU8CYCo3y7d1PHTHashT+nVJywv309ZEyaZXbhnRA76C3nyaOK3lA1/nkLFh5xDUZs
         13Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=334pQU/K019L/xPgu12eyPFo9ngLaIjC4OmIKGsurD8=;
        b=YhVMgRO/qSel6X6xpARoRu5sCUTPYN7jss4/D57PqF7zVqIUrbfZmIOWaY5mjCL2Te
         j9W7zcmoCRxJ0ycq/zZEXDwFpQF3voskPoWgK8Z0DpHhlLQBrxJhCts0Pr/nwzOS5P/e
         qsRSANrqGtNisvsc/5LPijBLcRMlBt77TKMqUbbr1rv9C8uETJ7R0/W0i/Ga3+e5i1Zk
         CwamAf4BlBEVqkxdLmGEvyaufoTep3SqF6BkBLB97ap1GcdIcq0wVsnST/cUck7UM6z8
         EMTXmGaYtlpDc730vFVrRa0smU+JcMQLjDMSDSaswObleWgBQjVtDzDyE4LFMMCvQsOs
         S6NQ==
X-Gm-Message-State: APjAAAX16TgFTVtSo6vmtWRsp8hrLklHQk/qtrmQi+TDPT2w/Yfy0ofo
        UdgzCRfSANNLfm2NYAkSBgzCyaIW
X-Google-Smtp-Source: APXvYqxEEKJhCeD4AZKNpynf6pv2TU2j54d4+FEkWU0nC+rYYRCVHsR8/RaqjV3pF3rF69LLMz7oTQ==
X-Received: by 2002:a2e:5cc8:: with SMTP id q191mr51568583ljb.118.1561339302350;
        Sun, 23 Jun 2019 18:21:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id n1sm1332343lfk.19.2019.06.23.18.21.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 18:21:41 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] pinctrl: tegra: Add bitmask support for parked
 bits
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20190621151932.20662-1-thierry.reding@gmail.com>
 <20190621151932.20662-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5f38ce80-dac5-5a1e-0569-27535a6f35fd@gmail.com>
Date:   Mon, 24 Jun 2019 04:21:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621151932.20662-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.06.2019 18:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some pin groups have park bits for multiple pins in one register.
> Support this by turning the parked bit field into a parked bitmask
> field. If no parked bits are supported, the bitmask can be 0.
> 
> Update the pingroup table on Tegra210, which is the only generation
> where this is supported, with the parked bitmask.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - write to mux_bank/mux_reg or drv_bank/drv_reg depending on pin

Looking great! Thank you!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

For Tegra20/30

Tested-by: Dmitry Osipenko <digetx@gmail.com>
