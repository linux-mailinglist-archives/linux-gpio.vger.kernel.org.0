Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64963DE1C0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 23:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhHBVkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 17:40:05 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:45833 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhHBVkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 17:40:05 -0400
Received: by mail-io1-f42.google.com with SMTP id a1so7323466ioa.12;
        Mon, 02 Aug 2021 14:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+VzdvIlC9tgkV0QMTvDGBEe5bb5R/ZWYEzqOnbrpOME=;
        b=EM5ouOkv2gWhVooNwKn55Vl9Khy7A9kdofWe19lc4OcUD5YYQlfOyukMV/xaGpKpOE
         qWz+A0WBXMR0qm9S2PhVAKUppzArkaVKcjFCemPbW4GCyaMxfIU/F9+lYGGxZpcD5zd7
         6H8H2PAVX1q+UhdN6ZJhs2gi2oRwc8dJfm9nKN2UL/nh4yh1hV5AuSIXbijeUmpsx/de
         iTQjV4WASH4DCCFZmhpidiDkKlryDl0l0V3zhtOk8va1PssAVjpTM7c6ebo8AnpgV46Y
         qEkjZQ6dE1whCHRS356L8C6qBNZABXZfvyUhBfBgrE5mApVuSeS4xtM5pNLlKD2bK9tu
         4Tzw==
X-Gm-Message-State: AOAM530wn3xiAdYbC+ODGsZql0B98+UVPy25IfqxNtg7htGd4JOaJh7o
        laLHvIPQliADCUCKcAYn2g==
X-Google-Smtp-Source: ABdhPJwdMxUmdUUk+UI3UOWHmt8d6RnTKwMuXNoS0z1pN5b2pqLij5SLFuVH5lORHN090Ee0XwaFSA==
X-Received: by 2002:a5d:9eda:: with SMTP id a26mr368294ioe.166.1627940394820;
        Mon, 02 Aug 2021 14:39:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c8sm7887605ioa.51.2021.08.02.14.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:39:54 -0700 (PDT)
Received: (nullmailer pid 1663185 invoked by uid 1000);
        Mon, 02 Aug 2021 21:39:52 -0000
Date:   Mon, 2 Aug 2021 15:39:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] of/gpiolib: minor constifying
Message-ID: <YQhmKFmfYwPwpK31@robh.at.kernel.org>
References: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 04:42:26PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Minor constifying of pointer to device_node.  Patches depend on each
> other (in order of submission).
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (3):
>   of: unify of_count_phandle_with_args() arguments with !CONFIG_OF
>   gpiolib: constify passed device_node pointer
>   gpiolib: of: constify few local device_node variables

For the series,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
>  drivers/gpio/gpiolib-devres.c |  2 +-
>  drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
>  include/linux/gpio/consumer.h |  8 ++++----
>  include/linux/of.h            |  2 +-
>  include/linux/of_gpio.h       | 15 ++++++++-------
>  5 files changed, 22 insertions(+), 21 deletions(-)
> 
> -- 
> 2.27.0
> 
> 
