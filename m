Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF5574B22
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbfGYKFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 06:05:18 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33639 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfGYKFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 06:05:18 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so34197420lfc.0;
        Thu, 25 Jul 2019 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EKGBnPRNMQNc9c9kgqMJBhw6DFuZQGwpCZJogF2MaZg=;
        b=Mbxv8ci6nzGefUESUHjOMV75rUO6ArywAbipEhmQEBOp2AusXaN/t21VxPDrwZj0zX
         tg1cgl2dELyEoQLCcpexXw8GiEr3n302aNCdComu76SMygLRp0NxdblIWVc4DZ9SM0xV
         70KzquV0sF/IvmFBB5ymQesH3vQYHz23J3+ke/H5/uU//mPcSBjQRBQwqjjtZnrzQg12
         gckxCpw5zQKTyO/eIr6P365O7Ni0Vxwobf9WcrB+y9j7mLJsTK6zc/F0TkoZmJpX4mju
         nRHj1ht+R4AmFKtEsj1lLfxjjUbpo1CME6UdEcgY6QPKyXyoO5BUGJsCv5aI/ToMGZiO
         Eaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EKGBnPRNMQNc9c9kgqMJBhw6DFuZQGwpCZJogF2MaZg=;
        b=iHzvB+tcnxMZWAeiIgiyIYHXBeAFRiYkj2E8GgXxqLRSB3OWe2CcK2zaf81ywrVQXh
         5g+NEos4iQa4z4lk4StnMm9Akbl/MC8brmqYDgeNVWmS7apa96gMZg9yIaUbTAxlbiiu
         AgHP7xjaobGJ4B16jGmMF/aR7FMXV5OKKkci1oMhBTMXtYHQHdLt3kKxQX5fyZZcjgBL
         HBHYiRWvaKs5uKe+IaFC5B6EVL3uWuA2fsOdcrL88f4kXThtr/uH3+rVnS3hW4H3P15a
         ml6M2sc913gQJ655yI7Fpd+gmbbuPlS0KuIktyNIsIsf+JTRF0J7HhmMNURn8nJBsSYU
         8GZg==
X-Gm-Message-State: APjAAAUZg8MjJ3Xrjisebt2JKiWz/p5HL6Y5RF2O7gkuPCxbbEqaYvPT
        M+EOM9rrpmerlmBnqFSqxQtA7hEb
X-Google-Smtp-Source: APXvYqyKGrgx4KlLtWLdFzerbA6rG1TqKd5VD2bcY2S2vM2ra+b4zFkApoBC/JVpk0sKzJa3r5MVXg==
X-Received: by 2002:ac2:43bb:: with SMTP id t27mr6127331lfl.187.1564049115258;
        Thu, 25 Jul 2019 03:05:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id q22sm9107599lje.75.2019.07.25.03.05.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 03:05:14 -0700 (PDT)
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com,
        pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd01be5d-bab9-1329-c7ac-c3c893d49dd1@gmail.com>
Date:   Thu, 25 Jul 2019 13:05:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

25.07.2019 12:55, Peter De Schrijver пишет:
> On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
>>
>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>> better here.
>>
>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>
>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>> pre-T210 at all, since COP is unused. This looks to me like it was
>> cut-n-pasted from downstream kernel without a good reason and could be
>> simply removed.
> 
> I don't think we can rely on the fact that COP is unused. People can
> write their own code to run on COP.

1. Not upstream - doesn't matter.

2. That's not very good if something unknown is running on COP and then
kernel suddenly intervenes, don't you think so?
