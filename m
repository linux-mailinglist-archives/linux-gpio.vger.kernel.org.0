Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF194E3D67
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 22:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfJXUgb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 16:36:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34496 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfJXUga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 16:36:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so22381130wrr.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TcVdzhKCHKceqty/bwdBAIuB0q/LLF2xHZuEhIcLaNw=;
        b=cqY4m0XypXCSBqpzHHtWhgUFCHbmT57VQy8oBvnLAISynQINKKpzPP6+odj98MFuLE
         HluqoobpQbDLlzYbGlTU5gANVlaIukNdocp4R/2PpCbiGX6WIq5iDHqaFG2OEBKfgthz
         kyxybD6XLbFeFBfs1XEXDILzcwfH98xvfcKg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TcVdzhKCHKceqty/bwdBAIuB0q/LLF2xHZuEhIcLaNw=;
        b=HH9TwZ/mlHHikQ/24/J5WJ5L2LVIFjBowhajx6/TtxQSKaiUu0c3twDOt7i2bhXW40
         OlwDgxj1IXwcnMWsmxWZ2qGBFRjnUm2cBWInf/QEWesY1eP05BjO4Ywngig4+aolL7jH
         kRYIRe4yzxY76PVIj67NKFzBNH8PDF3ye2vo75VMnMjI/OKiuG9ZWyh/zZEhd+KGbMCf
         MlMrdBGd3Y6n62dCeM9I541i8eKUYcli623XsFg60OkkR5rBsiy5me2w2cS5it7OSjTN
         9gRq0FtVn0zEixPf0/Q15BvlTZgqXDADmyxcdDRk0hI7RKU3NfGsBnsOLVds5b0w2THa
         k3JQ==
X-Gm-Message-State: APjAAAXHeHR0zbFO44bA/HBh2lD4Fne3bXP38HFgAYFYrbc/7Zy9kM7o
        G4abZmm5bwx4w2aqNh3Pdbf4tQ==
X-Google-Smtp-Source: APXvYqziKV2Dmlxn7bGB5F4iUFgJyQstWtSJc7wJ+q0Mtatc28JLRUxC2wgpiMudMnrZyLRPQIFYJQ==
X-Received: by 2002:adf:bad3:: with SMTP id w19mr6002008wrg.17.1571949388807;
        Thu, 24 Oct 2019 13:36:28 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b196sm5240713wmd.24.2019.10.24.13.36.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 13:36:27 -0700 (PDT)
Subject: Re: [PATCH v4 0/2] gpio: brcm: XGS iProc GPIO driver
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <12a8ace7-f69d-4002-0146-e84a62b8fd69@broadcom.com>
Date:   Thu, 24 Oct 2019 13:36:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch Series looks ok.

On 2019-10-24 1:27 p.m., Chris Packham wrote:
> This is ported this from Broadcom's XLDK (now heavily modified). There seem to
> be 3 different IP blocks for 3 separate banks of GPIOs in the iProc chips.
>
> I've dropped everything except support for the Chip Common A GPIO
> controller because the other blocks actually seem to be supportable with
> other drivers. The driver itself is halfway between pinctrl-nsp-gpio.c
> and pinctrl-iproc-gpio.c.
>
> Chris Packham (2):
>    dt-bindings: gpio: brcm: Add bindings for xgs-iproc
>    gpio: Add xgs-iproc driver
Acked-by: Scott Branden <scott.branden@broadcom.com>
>
>   .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |  70 ++++
>   drivers/gpio/Kconfig                          |   9 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-xgs-iproc.c                 | 321 ++++++++++++++++++
>   4 files changed, 401 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
>   create mode 100644 drivers/gpio/gpio-xgs-iproc.c
>

