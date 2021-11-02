Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E576442617
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 04:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbhKBDgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 23:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbhKBDga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 23:36:30 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E7FC061764
        for <linux-gpio@vger.kernel.org>; Mon,  1 Nov 2021 20:33:56 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v20so13860049plo.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Nov 2021 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9wL6e6Rl6omDkjcl8QpQbRrkQlAk7mdAPYBPin+CVyw=;
        b=sr9LMU/0B9YZmnps9ZwovfhG6XGReafmiDTIHlX7hKnopo1nuSLxf60/tLBQZE9nyi
         YuKBQIyUOkLtGmCthfnxaNxHUlYhvle3LEAtlIN9WRM+05Swo6BlvUiABoEHgP9Z8Gye
         ZBEDZd2Hkpo4WBpOJppuL/YEqqCjv9IjlkGpgQopb7uPsTorsXXqZbgfRct8JHjqJsxS
         8hf2j/oOaBcRj8U3p2Hc6VwFozosrefUDG8YbOyM4p44zlvZyne4axnuuoEo1iGZ9fHv
         YdSbyBGEtUM4LCrA3axNztJNJlrvB8tWOhq23mA1FootsUHnSMq0P7Griia6WSuzjynW
         rbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9wL6e6Rl6omDkjcl8QpQbRrkQlAk7mdAPYBPin+CVyw=;
        b=3PPX25p1AVRI/x63RJrLZ8Nle/nAqO4sWS7yUYAwBGgNaepA5wkQNsXkwN/A+DcrRg
         5IGfgqbLXz3cE04MG7RkKnwJm+LDCnppMU81KF3e1X7NhUBm3odwx0amcneEOI/+H1uz
         RdHoXTXBa30v+icJ+9HZ7wdPt0qmdOHNkjCFX5jrdMQNnx2ZrrXJ33A36GzwGAEGEPFh
         Q/FR7HVlJpawO0B40+9GctNS6I8x4f7UYm07dDPeUucqJQD2iGQTn7Kv3comF4CsDJ3C
         C1itMS2sUFPYXEmGPs9Nh0CRiVe9sT/AdDtR3sT1qbs6fxnrhEiliM0xOKrC/BP5/t2a
         5P/Q==
X-Gm-Message-State: AOAM5326XSq9XaOT4giZuLLtPcsIib32a5FKtQSnziWqm638T/ToVaxQ
        qzypm7s0DNLuKiGuJf/CrdE3UA==
X-Google-Smtp-Source: ABdhPJx4N2536lXrqEoILHMVErOOpiqbnJ3ORZ+r+y1oWUc8bc0saalhkhVXA+jDAws5J37zsepRfQ==
X-Received: by 2002:a17:90a:191c:: with SMTP id 28mr3498852pjg.121.1635824036118;
        Mon, 01 Nov 2021 20:33:56 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id j6sm14002047pgq.0.2021.11.01.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 20:33:55 -0700 (PDT)
Date:   Tue, 2 Nov 2021 09:03:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] virtio_gpio: drop packed attribute
Message-ID: <20211102033354.rka35agybojk65n7@vireshk-i7>
References: <20211101091122.442512-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101091122.442512-1-mst@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01-11-21, 05:11, Michael S. Tsirkin wrote:
> Declaring the struct packed here is mostly harmless,
> but gives a bad example for people to copy.
> As the struct is packed and aligned manually,
> let's just drop the attribute.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/uapi/linux/virtio_gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
> index 0445f905d8cc..25c95a034674 100644
> --- a/include/uapi/linux/virtio_gpio.h
> +++ b/include/uapi/linux/virtio_gpio.h
> @@ -25,7 +25,7 @@ struct virtio_gpio_config {
>  	__le16 ngpio;
>  	__u8 padding[2];
>  	__le32 gpio_names_size;
> -} __packed;
> +};

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
