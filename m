Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0AAC8975F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 08:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfHLGyc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 02:54:32 -0400
Received: from chalk.uuid.uk ([51.68.227.198]:33072 "EHLO chalk.uuid.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfHLGyb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 02:54:31 -0400
X-Greylist: delayed 347 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Aug 2019 02:54:31 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject;
        bh=qRSMDCR1evpLFkdNcP8KAL7JBeRe31QaQ9pNArRbm0g=; b=BE+kjHHF7zHiBw5EoXgY551k92
        Y9u2GvJWeS1uYcBhCnncXiFRn2yvebBtX6jH81mdecBzL4GvONu6gkZxRKFxJ8xnO8W0FZO08Rurp
        vP2WaapkHV5nmkZCAmkXs0A6pBgUVFNShJP6kC0c188998HJO79hIt8WZz4EXEX7HNceP6fWfh7V8
        gpTqRdG+4IUe/k8I0RrsnEEu8SEIp9VJq9Hp2t5nfHpG3NJHREgaS9gs8QPByo5Ec+SFyi6K3uPie
        5hLs377e/8zyGJ/0Uy1/s8qyizo2vENA8AZOsrGopl7ywELxQPFuZsp1z0eGTYGQig1ROIZ5b6zhl
        2QnEYfWA==;
Received: by chalk.uuid.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <simon@octiron.net>)
        id 1hx486-0007CE-M1; Mon, 12 Aug 2019 07:48:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject;
        bh=qRSMDCR1evpLFkdNcP8KAL7JBeRe31QaQ9pNArRbm0g=; b=BE+kjHHF7zHiBw5EoXgY551k92
        Y9u2GvJWeS1uYcBhCnncXiFRn2yvebBtX6jH81mdecBzL4GvONu6gkZxRKFxJ8xnO8W0FZO08Rurp
        vP2WaapkHV5nmkZCAmkXs0A6pBgUVFNShJP6kC0c188998HJO79hIt8WZz4EXEX7HNceP6fWfh7V8
        gpTqRdG+4IUe/k8I0RrsnEEu8SEIp9VJq9Hp2t5nfHpG3NJHREgaS9gs8QPByo5Ec+SFyi6K3uPie
        5hLs377e/8zyGJ/0Uy1/s8qyizo2vENA8AZOsrGopl7ywELxQPFuZsp1z0eGTYGQig1ROIZ5b6zhl
        2QnEYfWA==;
Received: by tsort.uuid.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <simon@octiron.net>)
        id 1hx47s-0003UH-C2; Mon, 12 Aug 2019 07:48:28 +0100
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>
References: <20190812062729.1892-1-linus.walleij@linaro.org>
From:   Simon Arlott <simon@octiron.net>
Message-ID: <841728e2-1dcc-e209-529a-36cc18e4ddf8@simon.arlott.org.uk>
Date:   Mon, 12 Aug 2019 07:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190812062729.1892-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/08/2019 07:27, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion. The BCM2835 has multiple parents so let's
> exploit the new facility in the GPIO_IRQCHIP to actually
> deal with multiple parents.
> 
> Cc: Simon Arlott <simon@arlott.org>

Please stop putting that email address in commit messages.

You do not have my consent to use it.

-- 
Simon Arlott
