Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C854F21AB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 23:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfKFW1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 17:27:06 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39968 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbfKFW1F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 17:27:05 -0500
Received: from [IPv6:2a00:5f00:102:0:5c62:8eff:fefa:67] (unknown [IPv6:2a00:5f00:102:0:5c62:8eff:fefa:67])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9EB7E28FF3E;
        Wed,  6 Nov 2019 22:26:50 +0000 (GMT)
Subject: Re: next/master boot bisection: next-20191106 on r8a7795-salvator-x
To:     Linus Walleij <linus.walleij@linaro.org>,
        tomeu.vizoso@collabora.com, mgalka@collabora.com,
        broonie@kernel.org, matthew.hart@linaro.org,
        Scott Branden <scott.branden@broadcom.com>,
        khilman@baylibre.com, enric.balletbo@collabora.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Scott Branden <sbranden@broadcom.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-kernel@lists.infradead.org
References: <5dc3460a.1c69fb81.bfae4.adf1@mx.google.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <e2ba3c23-4b85-f83b-0ba4-dc0db1b8dd0f@collabora.com>
Date:   Wed, 6 Nov 2019 22:26:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5dc3460a.1c69fb81.bfae4.adf1@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/11/2019 22:15, kernelci.org bot wrote:
> +static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
> +	{ .compatible = "brcm,iproc-gpio-cca" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
> +
> +static struct platform_driver bcm_iproc_gpio_driver = {
> +	.driver = {
> +		.name = "iproc-xgs-gpio",
> +		.owner = THIS_MODULE,
> +		.of_match_table = bcm_iproc_gpio_of_match,
> +	},
> +	.probe = iproc_gpio_probe,
> +	.remove = iproc_gpio_remove,
> +};

There's a fix for this which Mark sent yesterday[1] and should
have now been applied, by removing __initconst for the
of_device_id table.  So this regression should not be present in
the next linux-next tag.

Guillaume

[1] https://www.spinics.net/lists/arm-kernel/msg766621.html

