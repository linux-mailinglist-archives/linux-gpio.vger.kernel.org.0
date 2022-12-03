Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9EE641585
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 11:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiLCKEA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 05:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiLCKD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 05:03:59 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A16584DE5
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 02:03:58 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id d131so5438218ybh.4
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 02:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6E8CnP3iI5t13RtsJQQcTXnbZ3ZGPTmoPz8kIfTx4U=;
        b=k0vaNbXpIr1SS/R+YqWWkyExuOQIYt3c8XfhEfqDa9Z2UuX4cdm9VdUn/4gHGMUxtH
         5FyGA8rU9sdTo1UFjoFc5JgDdVGmXSAMsZY35MJUnaSncVbVYJXR5j+p4TrjstZjq8xz
         JCOEDr9BdvQQTTPf+fFgcjUCv9YGPv4mVcHvxJXJ93CWUynMjTGe4Blq/e83y+RDFEbV
         XMjN1RKwqXqIe+4mElvNvFbFzfFjRxyuttUTmR4wfjxopzy3yay/5qCYu1jvusRq7z6t
         DH2pwodZDL90KwVCuHcpmsO0+iSnBUNAUL3svPVBSnVusbSa4QZJnaqVQwCqoNaXBs8x
         3gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6E8CnP3iI5t13RtsJQQcTXnbZ3ZGPTmoPz8kIfTx4U=;
        b=WBT6ZGKq5U7/OLw5CWKkTfnq7boDeC1ga3XwEGxGUpHkomFFfXx4iWBZ/FQwXOd/c8
         +fzDwY81/lU644caUk3EQY6CiV6P6ZYQjC96vuFO0DHIKQ66aqg9GRNixTpPOC6gu8FT
         CQ9QUQDiSqNxU2qv5Z6LKSw6Z8L5HAEAjocwFbAjDlGjuplvhYZE3WfED/QChV2BcZkt
         bpF3hvXP5GrCv/YzXJ6sV4vImMaBFbc1asA6+BctElmTqeLYDii7HzyQR3rSFMecEf2j
         sLnc40IhWX9RbhtERmY/WQ1TnVLklaG9D9Z7Hn2SDwIFD1y8JvCefcVB3wjoeyCoF1m/
         Jv9w==
X-Gm-Message-State: ANoB5plIHOu4lt5hF9CYhXNRmEBVDxnjqmDsGfMIIUK3TZptw8JrZlOy
        c5VWzX0czq800uFH0A9y/uv+tx1pfybQpSFLCv+wbg==
X-Google-Smtp-Source: AA0mqf6D4lrppamEcD0PVhGEQxhIID44UmELO3zkV8dlr+HoqpZTBr+TgBXi4XgTOEHh0lS6bXQVtURTpgndyWewC8k=
X-Received: by 2002:a25:d8d4:0:b0:6f0:36e2:5fc2 with SMTP id
 p203-20020a25d8d4000000b006f036e25fc2mr46503178ybg.52.1670061837556; Sat, 03
 Dec 2022 02:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221201123220.7893-1-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 11:03:46 +0100
Message-ID: <CACRpkdZm-4-5625szX_VqJoQH1OQZnw+jH3SqWsb9nr3S0Nbmw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
(...)
> +config GPIO_LOONGSON_64BIT
> +       tristate "Loongson 64 bit GPIO support"
> +       depends on LOONGARCH || COMPILE_TEST
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP

If the kernelbots start complaining you might need to add a:

select IRQ_DOMAIN_HIERARCHY

here.

Yours,
Linus Walleij
